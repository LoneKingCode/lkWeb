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
            var result = await _userService.GetCurrentUser();
            if (result.flag)
            {
                var user = result.data;
                var userId = user.Id;
                ViewBag.UserID = userId;
                ViewBag.UserName = user.UserName;
                ViewBag.Menus = (await _userService.GetUserMenu(userId)).data;
                return View();
            }
            else
                return RedirectToAction("Login", "user");

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
