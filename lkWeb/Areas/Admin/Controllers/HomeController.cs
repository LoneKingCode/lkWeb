using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Services;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Http;
using lkWeb.Service;
using lkWeb.Core.Helper;

namespace lkWeb.Areas.Admin.Controllers
{
    public class HomeController : AdminBaseController
    {
        public readonly ISys_RoleService _roleService;
        public HomeController(ISys_RoleService roleService)
        {
            _roleService = roleService;
        }

        #region Page
        public async Task<IActionResult> Index()
        {
            var reader = await SqlHelper.Query("select * from Sys_User");
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
