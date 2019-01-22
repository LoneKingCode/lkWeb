using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service;
using Microsoft.AspNetCore.Authorization;
using lkWeb.Core.Extensions;
using Microsoft.AspNetCore.Diagnostics;
using lkWeb.Filter;
using Microsoft.Extensions.PlatformAbstractions;
using lkWeb.Service.Util;
using lkWeb.Service.Dto;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace lkWeb.Areas.Admin.Controllers
{
    public class ControlController : AdminBaseController
    {
        public readonly IUserService _userService;
        public ControlController(IUserService userService)
        {
            _userService = userService;
        }

        #region Page
        // GET: /<controller>/
        public async Task<IActionResult> Index()
        {
            if (IsLogined)
            {
                ViewBag.UserID = CurrentUser.Id;
                ViewBag.UserName = CurrentUser.UserName;
                ViewBag.Menus = (await _userService.GetUserMenu(CurrentUser.Id)).data;
                return View();
            }
            else
                return RedirectToAction("Login", "user");

        }

        public IActionResult Welcome()
        {
            return View();
        }
        [HttpPost]
        public IActionResult GetServerInfo()
        {
            var result = new Result<ServerInfo>();
            result.flag = true;
            result.data = SysHelper.GetServerInfo();
            return Json(result);
        }
        [AllowAnonymous]
        public IActionResult AccessDenied(string returnUrl)
        {
            return View();
        }
        [AllowAnonymous]
        public IActionResult Error()
        {
            var feature = HttpContext.Features.Get<IExceptionHandlerFeature>();

            if (feature != null)
            {
                return View("~/Areas/Views/Shared/Error.cshtml", feature.Error);
            }
            else
            {
                return View("~/Areas/Views/Shared/Error.cshtml", "");
            }
        }
        #endregion
    }
}
