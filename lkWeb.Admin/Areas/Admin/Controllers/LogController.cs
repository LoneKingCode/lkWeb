using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Admin.Areas.Admin.Models;
using lkWeb.Core.Extension;
using lkWeb.Core.Helper;
using lkWeb.Service.Services;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using lkWeb.Models;

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class LogController : AdminBaseController
    {
        public readonly ISys_LoginLogService _loginLogService;
        public readonly ISys_OperationLogService _operationLogService;
        public LogController(ISys_LoginLogService loginLogService, ISys_OperationLogService operationLogService)
        {
            _loginLogService = loginLogService;
            _operationLogService = operationLogService;
        }

        #region Page
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public IActionResult Error(UrlParameter param)
        {

            var logFiles = System.IO.Directory.GetFiles(Path.Combine( AppContext.BaseDirectory, "Logs"));
            var fileList = new List<object>();
            foreach (var file in logFiles)
            {
                fileList.Add(new
                {
                    Value = file,
                    Text = Path.GetFileName(file)
                });
            }
            ViewBag.LogFiles = new SelectList(fileList, "Value", "Text");
            return View();
        }
        public IActionResult Chart(UrlParameter param)
        {
            return View();
        }

        #endregion

        #region Ajax

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetChartDataByDay()
        {
            var result = await _operationLogService.GetListAsync(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();
            for (int hour = 0; hour < 24; hour++)
            {
                xAxis.Add(hour + "时");
                visitors.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd H") == DateTime.Now.ToString("yyyy-MM-dd") + " " + hour)
                    .GroupBy(item => item.ClientMac).Count());
                visitPage.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd H") == DateTime.Now.ToString("yyyy-MM-dd") + " " + hour).Count());
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
            var weekAgo = DateTime.Now.AddDays(-7);
            var result = await _operationLogService.GetListAsync(
                item => DateTime.Compare(item.CreateDateTime, weekAgo) >= 0);
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();
            for (int i = 1; i <= 7; i++)
            {
                xAxis.Add(weekAgo.AddDays(i).ToString("MM-dd"));
                visitors.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd") == weekAgo.AddDays(i).ToString("yyyy-MM-dd"))
                    .GroupBy(item => item.ClientMac).Count());
                visitPage.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd") == weekAgo.AddDays(i).ToString("yyyy-MM-dd")).Count());
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
        public async Task<IActionResult> GetChartDataByMonth()
        {
            var lastMonth = DateTime.Now.AddMonths(-1);
            var result = await _operationLogService.GetListAsync(
                item => DateTime.Compare(item.CreateDateTime, lastMonth) > 0);
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();

            for (int i = 1; i <= 30; i++)
            {
                xAxis.Add(lastMonth.AddDays(i).ToString("MM-dd"));
                visitors.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd") == lastMonth.AddDays(i).ToString("yyyy-MM-dd"))
                    .GroupBy(item => item.ClientMac).Count());
                visitPage.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM-dd") == lastMonth.AddDays(i).ToString("yyyy-MM-dd")).Count());
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
        public async Task<IActionResult> GetChartDataByYear()
        {
            var yearAgo = DateTime.Now.AddYears(-1);
            var result = await _operationLogService.GetListAsync(
                item => item.CreateDateTime.ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"));
            var xAxis = new List<string>();
            var visitors = new List<int>();
            var visitPage = new List<int>();
            for (int i = 1; i <= 12; i++)
            {
                xAxis.Add(yearAgo.AddMonths(i).ToString("MM"));
                visitors.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM") == yearAgo.AddMonths(i).ToString("yyyy-MM"))
                    .GroupBy(item => item.ClientMac).Count());
                visitPage.Add(result.data.Where(
                    item => item.CreateDateTime.ToString("yyyy-MM") == yearAgo.AddMonths(i).ToString("yyyy-MM")).Count());
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
        public async Task<IActionResult> ClearLoginLog()
        {
            var result = await _loginLogService.DeleteAsync(x => x.Id > 0);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ClearOperationLog()
        {
            var result = await _operationLogService.DeleteAsync(x => x.Id > 0);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetLog(string filePath)
        {
            var result = new Result<string>();
            try
            {
                result.data = await System.IO.File.ReadAllTextAsync(filePath);
                result.data = result.data.Replace("\n", "<br>");
                result.flag = true;
            }
            catch (Exception ex)
            {

                result.data = ex.Message;
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DelLog(string filePath)
        {
            var result = new Result<string>();
            try
            {
                System.IO.File.Delete(filePath);
                result.flag = true;
            }
            catch (Exception ex)
            {

                result.data = ex.Message;
            }
            return Json(result);
        }
        #endregion
    }
}