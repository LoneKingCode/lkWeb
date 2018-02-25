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

namespace lkWeb.Areas.Admin.Controllers
{
    [Authorize]
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
                var userId = CurrentUser.Id;
                ViewBag.UserID = userId;
                ViewBag.UserName = CurrentUser.UserName;
                ViewBag.Menus = (await _userService.GetUserMenu(userId)).data;
            }
            else
                RedirectToAction("Login", "user");
            //   var a = await _userService.GetCurrentUser();
            return View();
        }

        public IActionResult Welcome()
        {
            return View();
        }
        public IActionResult AccessDenied(string returnUrl)
        {
            return View();
        }
        public IActionResult Error()
        {
            var feature = HttpContext.Features.Get<IExceptionHandlerFeature>();
            var error = feature?.Error;
            return View("~/Areas/Views/Shared/Error.cshtml", error);
        }
        #endregion
    }
}
