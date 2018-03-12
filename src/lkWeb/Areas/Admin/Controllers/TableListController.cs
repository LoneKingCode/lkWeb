using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Core.Extensions;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace lkWeb.Areas.Admin.Controllers
{
    public class TableListController : AdminBaseController
    {
        public readonly ITableListService _TableListService;
        public TableListController(ITableListService TableListService)
        {
            _TableListService = TableListService;
        }

        #region Page
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public IActionResult Add(UrlParameter param)
        {
            ViewBag.ImportTypeList = new SelectList(Enum.GetValues(typeof(TableImportType)).Cast<TableImportType>());
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            ViewBag.ImportTypeList = new SelectList(Enum.GetValues(typeof(TableImportType)).Cast<TableImportType>());
            var module = (await _TableListService.GetById(param.id)).data;
            return View(module);
        }
        #endregion

        #region Ajax
        [HttpGet]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            Expression<Func<TableListDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey));
            var dto = await _TableListService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableDto
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    name = d.Name,
                    description = d.Description,
                    id = d.Id.ToString(),
                    isView = d.IsView == 1 ? "是" : "否"
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, TableListDto dto)
        {
            var result = await _TableListService.Update(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, TableListDto dto)
        {
            var result = await _TableListService.Add(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _TableListService.Delete(param.ids));
            else
                return Json(await _TableListService.Delete(param.id));
        }
        #endregion
    }
}