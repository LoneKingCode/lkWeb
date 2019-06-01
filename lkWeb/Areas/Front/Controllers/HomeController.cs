using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Admin.Areas.Front.Controllers.Base;
using lkWeb.Core.Extensions;
using lkWeb.Service.Services;
using Microsoft.AspNetCore.Mvc;

namespace lkWeb.Admin.Areas.Front.Controllers
{
    public class HomeController : FrontBaseController
    {

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult NotFound()
        {
            return View();
        }
    }
}