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
        public readonly ITableListService _tableListService;
        public readonly ITableColumnService _tableColumnService;
        public TableListController(ITableListService tableListService, ITableColumnService tableColumnService)
        {
            _tableListService = tableListService;
            _tableColumnService = tableColumnService;
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
            var module = (await _tableListService.GetById(param.id)).data;
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
            var dto = await _tableListService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
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
            var result = await _tableListService.Update(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, TableListDto dto)
        {
            var result = await _tableListService.Add(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _tableListService.Delete(param.ids));
            else
                return Json(await _tableListService.Delete(param.id));
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Copy(UrlParameter param)
        {
            var resourceDto = (await _tableListService.GetById(param.id)).data;
            var newDto = resourceDto;
            newDto.Id = default(int);
            var result = await _tableListService.Add(newDto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> BuildColumn(UrlParameter param)
        {
            var tableDto = (await _tableListService.GetById(param.id)).data;
            var tableName = tableDto.Name;
          //  var tableData = (await _tableListService.SqlQuery("select * from Sys_TableList where Id=" + param.id)).data;
            
            return null;
        }
        #endregion
    }
}