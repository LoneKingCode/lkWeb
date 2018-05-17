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
        public readonly IRoleService _roleService;
        public readonly ISqlService _sqlService;
        public HomeController(IRoleService roleService, ISqlService sqlService)
        {
            _roleService = roleService;
            _sqlService = sqlService;
        }

        #region Page
        public async Task<IActionResult> Index()
        {
            var reader = await _sqlService.Query("select * from Sys_User");
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
