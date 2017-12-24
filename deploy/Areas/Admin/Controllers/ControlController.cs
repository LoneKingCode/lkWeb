using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;

namespace lkWeb.Areas.Admin.Controllers
{
    public class ControlController : AdminBaseController
    {
        public readonly IUserService _userService;
        public ControlController(IUserService userService)
        {
            _userService = userService;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            if(IsLogined)
            {
                var userId = CurrentUser.Id;
                ViewBag.Menus = _userService.GetUserMenu(userId);
            }
            return View();
        }
        public IActionResult Welcome()
        {
            return View();
        }
    }
}
