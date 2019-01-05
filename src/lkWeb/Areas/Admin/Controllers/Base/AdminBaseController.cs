using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Dto;
using lkWeb.Service.Abstracts;
using Microsoft.AspNetCore.Mvc.Filters;
using lkWeb.Service;
using lkWeb.Filter;
using lkWeb.Core.Extensions;
using lkWeb.Service.Util;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    [PermissionFilter]
    public class AdminBaseController : Controller
    {
        /// <summary>
        /// 当前登录用户
        /// </summary>
        protected UserDto CurrentUser
        {
            get; set;
        }

        /// <summary>
        /// 是否登录
        /// </summary>
        protected bool IsLogined
        {
            get
            {
                return CurrentUser != null && CurrentUser.Id > 0;
            }
        }


        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (User.Identity.IsAuthenticated)
            {
                CurrentUser = new UserDto
                {
                    Id = User.Claims.ElementAt(0).Value.ToInt32(),
                    UserName = User.Claims.ElementAt(1).Value
                };
                if (!WebHelper.IsAjax(context.HttpContext))
                {
                    var operationLogService = ServiceLocator.Get<IOperationLogService>();
                    operationLogService.Add(new OperationLogDto
                    {
                        ClientIP = WebHelper.GetClientIP(),
                        ClientMac = WebHelper.GetClientMac(),
                        Description = "访问",
                        OperationDescription = "访问",
                        OperationUrl = context.HttpContext.Request.Path,
                        UserId = CurrentUser.Id,
                        UserName = CurrentUser.UserName
                    });
                }
            }
            else
            {
                if (!WebHelper.IsAjax(context.HttpContext))
                {
                    var operationLogService = ServiceLocator.Get<IOperationLogService>();
                    operationLogService.Add(new OperationLogDto
                    {
                        ClientIP = WebHelper.GetClientIP(),
                        ClientMac = WebHelper.GetClientMac(),
                        Description = "访问",
                        OperationDescription = "访问",
                        OperationUrl = context.HttpContext.Request.Path,
                        UserId = 0,
                        UserName = "无"
                    });
                    CurrentUser = null;
                }
            }
            base.OnActionExecuting(context);
        }


    }
}
