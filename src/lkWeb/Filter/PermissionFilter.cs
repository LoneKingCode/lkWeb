using lkWeb.Core.Extensions;
using lkWeb.Service.Abstracts;
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
            var _userService = ServiceLocator.Get<IUserService>();
            var userResult = _userService.GetCurrentUser().Result;
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
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "User", Action = "Login" }));
                }
            }
            else //已登陆
            {
                var user = userResult.data;
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
                    var moduleId = httpContext.GetRouteValue("moduleId");
                    var menuId = httpContext.GetRouteValue("menuId");
                    var btnId = httpContext.GetRouteValue("btnId");
                    if (menuId == null)
                    {
                        return;
                    }
                    else
                    {
                        // 因为 按钮 与 菜单 都是在一张表里 如果btnId存在，说明是点击菜单页面内按钮了
                        //如果不存在 说明就是访问了菜单
                        var authId = 0;
                        if (btnId == null)
                            authId = menuId.ObjToInt();
                        else
                            authId = btnId.ObjToInt();
                        var _roleMenuService = ServiceLocator.Get<IRoleMenuService>();
                        var userRoles = _userService.GetUserRoles(user.Id).Result;
                        if (userRoles.data != null && userRoles.data.Any())
                        {
                            var userRoleIds = userRoles.data.Select(item => item.Id).ToList();
                            var roleMenu = _roleMenuService.GetByExp(item => item.MenuId == authId && userRoleIds.Contains(item.RoleId)).Result;
                            if (roleMenu.data != null)
                            {
                                return;
                            }
                            filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Control", Action = "AccessDenied" }));
                        }
                        else
                        {
                            filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Control", Action = "AccessDenied" }));
                        }
                    }

                }
                return;
            }
        }

    }


}

