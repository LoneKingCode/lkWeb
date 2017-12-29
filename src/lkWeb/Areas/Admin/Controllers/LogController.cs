using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Core.Extensions;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Mvc;

namespace lkWeb.Areas.Admin.Controllers
{
    public class LogController : AdminBaseController
    {
        public readonly ILoginLogService _loginLogService;
        public readonly IOperationLogService _operationLogService;
        public LogController(ILoginLogService loginLogService,IOperationLogService operationLogService)
        {
            _loginLogService = loginLogService;
            _operationLogService = operationLogService;
        }
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
        [HttpGet]
        public IActionResult GetPageDataWithLogin(QueryBase queryBase)
        {
            Expression<Func<LoginLogDto, bool>> queryExp = item => !item.IsDeleted;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.LoginName.Contains(queryBase.SearchKey)) && !x.IsDeleted;
            var dto = _loginLogService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    loginName = d.LoginName,
                    clientIP = d.ClientIP,
                    clientMac = d.ClientMac,
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }
        [HttpGet]
        public IActionResult GetPageDataWithOperation(QueryBase queryBase)
        {
            Expression<Func<OperationLogDto, bool>> queryExp = item => !item.IsDeleted;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.LoginName.Contains(queryBase.SearchKey) || x.OperationDescription.Contains(queryBase.SearchKey)
                || x.OperationUrl.Contains(queryBase.SearchKey)) && !x.IsDeleted;
            var dto = _operationLogService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    loginName = d.LoginName,
                    operationUrl = d.OperationUrl,
                    operationDescription = d.OperationDescription,
                    clientIP= d.ClientIP,
                    clientMac = d.ClientMac,
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }
        #endregion
    }
}