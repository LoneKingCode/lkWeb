using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace lkWeb.Areas.Admin.Controllers
{
    public class SubSystemController : AdminBaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}