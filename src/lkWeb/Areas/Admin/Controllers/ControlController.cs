using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service;
using Microsoft.AspNetCore.Authorization;
using lkWeb.Core.Extensions;

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
                var userId = CurrentUser.Id;
                ViewBag.UserID = userId;
                ViewBag.Menus = (await _userService.GetUserMenu(userId)).data;
            }
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
        #endregion
    }
}
