using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Services;
using lkWeb.Service;
using Microsoft.AspNetCore.Authorization;
using lkWeb.Core.Extension;
using Microsoft.AspNetCore.Diagnostics;
using lkWeb.Filter;
using Microsoft.Extensions.PlatformAbstractions;
using lkWeb.Core.Helper;
using lkWeb.Service.Dto;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using lkWeb.Models;

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class ControlController : AdminBaseController
    {
        public readonly ISys_UserService _userService;
        public readonly ISys_UserRoleService _userRoleService;
        public readonly ISys_RoleService _roleService;
        public ControlController(ISys_UserService userService, ISys_UserRoleService userRoleService, ISys_RoleService roleService)
        {
            _userService = userService;
            _userRoleService = userRoleService;
            _roleService = roleService;
        }

        #region Page
        // GET: /<controller>/
        public async Task<IActionResult> Index(UrlParameter param)
        {
            var sysId = param.id;
            if (IsLogined)
            {
                ViewBag.UserID = CurrentUser.Id;
                ViewBag.UserName = CurrentUser.UserName;
                var menuResult = await _userService.GetUserMenu(sysId);
                if (menuResult.flag)
                    ViewBag.Menus = menuResult.data;
                else
                    return RedirectToAction("AccessDenied");
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
            result.data = SysInfoHelper.GetServerInfo();
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
                return View(feature.Error);
            }
            else
            {
                return View();
            }
        }
        #endregion
    }
}
