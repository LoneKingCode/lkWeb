using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Http;
using lkWeb.Service;

namespace lkWeb.Areas.Admin.Controllers
{
    public class HomeController : AdminBaseController
    {
        public readonly IUserService _userService;
        public HomeController(IUserService userService)
        {
            _userService = userService;
        }

        #region Page
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
        #endregion
    }
}
