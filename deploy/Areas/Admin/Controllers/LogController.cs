using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Service.Abstracts;
using Microsoft.AspNetCore.Mvc;

namespace lkWeb.Areas.Admin.Controllers
{
    public class LogController : AdminBaseController
    {
        public readonly ILoginLogService _loginLogService;
        public readonly IOperationLogService _operationLogService;

        #region Page
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Operation()
        {
            return View();
        }
        #endregion

        #region Ajax
        #endregion
    }
}