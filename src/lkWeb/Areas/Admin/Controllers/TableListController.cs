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
        public readonly ISqlService _sqlService;
        public readonly ISysService _sysService;

        public TableListController(ITableListService tableListService,
            ITableColumnService tableColumnService,
            ISqlService sqlService,
            ISysService sysService)
        {
            _tableListService = tableListService;
            _tableColumnService = tableColumnService;
            _sqlService = sqlService;
            _sysService = sysService;
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
        [HttpPost]
        [ValidateAntiForgeryToken]
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
                    allowView = d.AllowView == 1 ? "是" : "否",
                    allowAdd = d.AllowAdd == 1 ? "是" : "否",
                    allowEdit = d.AllowEdit == 1 ? "是" : "否",
                    allowDelete = d.AllowDelete == 1 ? "是" : "否",
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
            var result = await _sysService.GenerateColumn(param.id);
            return Json(result);
        }
        #endregion
    }
}