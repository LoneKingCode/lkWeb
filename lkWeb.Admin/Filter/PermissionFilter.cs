using lkWeb.Core.Extension;
using lkWeb.Service.Services;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Filter
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]

    public class PermissionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext == null)
            {
                throw new ArgumentNullException("context");
            }
            if (filterContext.HttpContext.Request == null)
            {
                throw new ArgumentNullException("context");
            }
            var request = filterContext.HttpContext.Request;
            var httpContext = request.HttpContext;
            var absoluteUri = string.Concat(
                       request.Scheme,
                       "://",
                       request.Host.ToUriComponent(),
                       request.PathBase.ToUriComponent(),
                       request.Path.ToUriComponent(),
                       request.QueryString.ToUriComponent());
            // 是否是Ajax请求
            var isAjax = request.Headers["X-Requested-With"] == "XMLHttpRequest";
            //判断controller和action是否存在AllowAnonymous 不就过滤权限
            var controllerActionDescriptor = filterContext.ActionDescriptor as ControllerActionDescriptor;
            var actionAnonymous = controllerActionDescriptor.MethodInfo.GetCustomAttributes(typeof(AllowAnonymousAttribute), true) as IEnumerable<AllowAnonymousAttribute>;
            var controllerAnonymous = controllerActionDescriptor.ControllerTypeInfo.GetCustomAttributes(typeof(AllowAnonymousAttribute), true) as IEnumerable<AllowAnonymousAttribute>;
            if ((actionAnonymous != null && actionAnonymous.Any()) || (controllerAnonymous != null && controllerAnonymous.Any()))
            {
                return;
            }
            var _userService = ServiceLocator.Get<ISys_UserService>();
            var userResult = _userService.GetCurrentUser();
            //如果未登录
            if (!userResult.flag)
            {
                if (isAjax)
                {
                    var result = new Result<string>
                    {
                        msg = "未登录或登陆已超时，请重新登陆"
                    };
                    var jsonResult = new JsonResult(result);
                    filterContext.Result = jsonResult;

                }
                else
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "User", Action = "Login" ,ReturnUrl=request.Path }));
                }
            }
            else //已登陆
            {
                var user = userResult.data;
                var roles = _userService.GetUserRoles(user.Id).Result.data.Select(item => item.Name).ToList();
                if (roles.Contains("超级管理员"))
                    return;
                //判断用户状态
                if (user.Status == Service.Enum.UserStatus.禁用 || user.Status == Service.Enum.UserStatus.未激活)
                {
                    if (isAjax)
                    {
                        var result = new Result<string>
                        {
                            msg = "您的账户状态为" + user.StatusName
                        };
                        var jsonResult = new JsonResult(result);
                        filterContext.Result = jsonResult;
                    }
                    else
                    {
                        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Control", Action = "AccessDenied" }));

                    }
                }
                else //判断权限
                {
                    var menuUrl = "/admin/" + httpContext.GetRouteValue("controller") + "/" + httpContext.GetRouteValue("action");
                    var menuService = ServiceLocator.Get<ISys_MenuService>();
                    var menu = menuService.GetByExpAsync(item => item.Url == menuUrl).Result;
                    if (menu.data == null)
                    {
                        return;
                    }
                    else
                    {
                        var _roleMenuService = ServiceLocator.Get<ISys_RoleMenuService>();
                        var userRoles = _userService.GetUserRoles(user.Id).Result;
                        if (userRoles.data != null && userRoles.data.Any())
                        {
                            var userRoleIds = userRoles.data.Select(item => item.Id).ToList();
                            var roleMenu = _roleMenuService.GetByExpAsync(item => item.MenuId == menu.data.Id && userRoleIds.Contains(item.RoleId)).Result;
                            if (roleMenu.data != null)
                            {
                                return;
                            }
                            if (isAjax)
                            {
                                var result = new Result<string>
                                {
                                    msg = "无权限"
                                };
                                var jsonResult = new JsonResult(result);
                                filterContext.Result = jsonResult;
                            }
                            else
                            {
                                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Control", Action = "AccessDenied" }));

                            }
                        }
                        else
                        {
                             if(isAjax)
                            {
                                var result = new Result<string>
                                {
                                    msg = "无权限"
                                };
                                var jsonResult = new JsonResult(result);
                                filterContext.Result = jsonResult;
                            }
                             else
                            {
                                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Control", Action = "AccessDenied" }));
                            }
                        }
                    }

                }
                return;
            }
        }

    }


}

