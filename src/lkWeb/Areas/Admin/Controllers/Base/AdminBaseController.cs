using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Dto;
using lkWeb.Service.Abstracts;
using Microsoft.AspNetCore.Mvc.Filters;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminBaseController : Controller
    {
        /// <summary>
        /// 当前登录用户
        /// </summary>
        protected UserDto CurrentUser { get; private set; }

        /// <summary>
        /// 是否登录
        /// </summary>
        protected bool IsLogined { get; set; }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //再加上判断菜单权限
            //context.HttpContext.Session.TryGetValue("CurrentUser", out byte[] result);
            //if (result == null)
            //{
            //    context.Result = new RedirectToActionResult("Login", "User", "0");
            //}
            base.OnActionExecuting(context);
        }
    }
}
