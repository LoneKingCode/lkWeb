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
using lkWeb.Core.Extension;
using lkWeb.Core.Helper;

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
        protected Sys_UserDto CurrentUser
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

            var currentUserResult = Sys_UserService.GetCurrentUserBySession();
            if (currentUserResult.flag)
            {
                CurrentUser = new Sys_UserDto
                {
                    Id = currentUserResult.data.Id,
                    UserName = currentUserResult.data.UserName
                };
                SysService.currentUserId = CurrentUser.Id.ToString();
                if (!WebHelper.IsAjax(context.HttpContext))
                {
                    var operationLogService = ServiceLocator.Get<ISys_OperationLogService>();
                    operationLogService.AddAsync(new Sys_OperationLogDto
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
                    var operationLogService = ServiceLocator.Get<ISys_OperationLogService>();
                    operationLogService.AddAsync(new Sys_OperationLogDto
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
