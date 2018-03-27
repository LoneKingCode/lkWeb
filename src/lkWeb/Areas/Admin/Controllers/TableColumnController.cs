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
    public class TableColumnController : AdminBaseController
    {
        public readonly ITableColumnService _tableColumnService;
        public readonly ITableListService _tableListService;
        public readonly ISysService _sysService;
        public TableColumnController(ITableColumnService tableColumnService,
            ITableListService tableListService,
            ISysService sysService)
        {
            _tableColumnService = tableColumnService;
            _tableListService = tableListService;
            _sysService = sysService;
        }

        #region Page
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var result = await _tableListService.GetList(item => item.Id > 0);
            ViewBag.TableList = new SelectList(result.data, "Id", "Name");
            ViewBag.DataTypeList = new SelectList(Enum.GetValues(typeof(ColumnDataType)).Cast<ColumnDataType>());

            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var result = await _tableListService.GetList(item => item.Id > 0);
            ViewBag.TableList = new SelectList(result.data, "Id", "Name");
            ViewBag.DataTypeList = new SelectList(Enum.GetValues(typeof(ColumnDataType)).Cast<ColumnDataType>());
            var module = (await _tableColumnService.GetById(param.id)).data;
            return View(module);
        }
        #endregion

        #region Ajax
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            Expression<Func<TableColumnDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey));
            var allTable = (await _tableListService.GetList(item => item.Id > 0))
                   .data.ToDictionary(item => item.Id, item => item.Name);
            var dto = await _tableColumnService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
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
                    tableName = allTable.ContainsKey(d.TableId) ? allTable[d.TableId] : "无",
                    dataType = d.DataTypeName,
                    addVisible = d.AddVisible == 1 ? "是" : "否",
                    editVisible = d.EditVisible == 1 ? "是" : "否",
                    listVisible = d.ListVisible == 1 ? "是" : "否",
                    searchVisible = d.SearchVisible == 1 ? "是" : "否",

                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, TableColumnDto dto)
        {
            var result = await _tableColumnService.Update(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, TableColumnDto dto)
        {
            var result = await _tableColumnService.Add(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _tableColumnService.Delete(param.ids));
            else
                return Json(await _tableColumnService.Delete(param.id));
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Copy(UrlParameter param)
        {
            var resourceDto = (await _tableColumnService.GetById(param.id)).data;
            var newDto = resourceDto;
            newDto.Id = default(int);
            var result = await _tableColumnService.Add(newDto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetValue(UrlParameter param, SetColumnAttrModel model)
        {
            var result =await _sysService.SetColumnValue(param.ids, model.FiledName, model.Value);
            return Json(result);
        }
        #endregion
    }
}