using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
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
        public LogController(ILoginLogService loginLogService, IOperationLogService operationLogService)
        {
            _loginLogService = loginLogService;
            _operationLogService = operationLogService;
        }

        #region Page
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public IActionResult Login(UrlParameter param)
        {
            return View();
        }
        public IActionResult Chart(UrlParameter param)
        {
            return View();
        }
        public IActionResult Operation(UrlParameter param)
        {
            return View();
        }
        #endregion

        #region Ajax
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageDataWithLogin(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<LoginLogDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.UserName.Contains(queryBase.SearchKey));
            var dto = await _loginLogService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    clientIP = d.ClientIP,
                    clientMac = d.ClientMac,
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                    description = d.Description
                })
            };
            return Json(data);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageDataWithOperation(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<OperationLogDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.UserName.Contains(queryBase.SearchKey) || x.OperationDescription.Contains(queryBase.SearchKey)
                || x.OperationUrl.Contains(queryBase.SearchKey));
            var dto = await _operationLogService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    operationUrl = d.OperationUrl,
                    operationDescription = d.OperationDescription,
                    clientIP = d.ClientIP,
                    clientMac = d.ClientMac,
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                    description = d.Description
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataByDay()
        {
            var result = await _operationLogService.GetList(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();
            for (int hour = 0; hour < 24; hour++)
            {
                xAxis.Add(hour + "时");
                visitors.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd h") == DateTime.Now.ToString("yyyy-MM-dd") + " " + hour)
                    .GroupBy(item => item.ClientMac).Count());
                visitPage.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd h") == DateTime.Now.ToString("yyyy-MM-dd") + " " + hour).Count());
            }
            return Json(new
            {
                xAxis,
                visitors,
                visitPage
            });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataByWeek()
        {
            var result = await _operationLogService.GetList(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();

            return Json(new
            {
                xAxis,
                visitors,
                visitPage
            });
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataByMonth()
        {
            var result = await _operationLogService.GetList(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();

            return Json(new
            {
                xAxis,
                visitors,
                visitPage
            });
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataByTrimester()
        {
            var result = await _operationLogService.GetList(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();

            return Json(new
            {
                xAxis,
                visitors,
                visitPage
            });
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataBySemester()
        {
            var result = await _operationLogService.GetList(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();

            return Json(new
            {
                xAxis,
                visitors,
                visitPage
            });
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataByYear()
        {
            var result = await _operationLogService.GetList(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();

            return Json(new
            {
                xAxis,
                visitors,
                visitPage
            });
        }
        #endregion
    }
}