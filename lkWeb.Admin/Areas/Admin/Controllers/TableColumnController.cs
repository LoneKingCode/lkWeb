using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Admin.Areas.Admin.Models;
using lkWeb.Core.Extension;
using lkWeb.Service.Services;
using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using lkWeb.Core.Helper;
using lkWeb.Models;

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class TableColumnController : AdminBaseController
    {
        public readonly ISys_TableColumnService _tableColumnService;
        public readonly ISys_TableListService _tableListService;
        public TableColumnController(ISys_TableColumnService tableColumnService,
            ISys_TableListService tableListService)
        {
            _tableColumnService = tableColumnService;
            _tableListService = tableListService;
        }

        #region Page
        public async Task<IActionResult> Index(UrlParameter param)
        {
            var tableDtos = await _tableListService.GetListAsync(item => item.Id > 0);
            List<SelectListItem> tableList = new List<SelectListItem>();
            foreach (var dto in tableDtos.data)
            {
                tableList.Add(new SelectListItem
                {
                    Value = dto.Id.ToString(),
                    Text = dto.Name + $"({dto.Description})",
                });
            }
            ViewBag.TableList = new SelectList(tableList, "Value", "Text");
            return View();
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var result = await _tableListService.GetListAsync(item => item.Id > 0);
            var selectItems = result.data.Select(x => new { Id = x.Id, Name = x.Name + $"({x.Description})" }).ToList();
            ViewBag.TableList = new SelectList(selectItems, "Id", "Name");
            ViewBag.DataTypeList = new SelectList(ColumnType.list);

            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var colDto = (await _tableColumnService.GetByIdAsync(param.id)).data;

            //获取所有表 放到下拉中 且选中当前列所属表
            var result = await _tableListService.GetListAsync(item => item.Id > 0);
            var items = new List<SelectListItem>();
            foreach (var item in result.data)
            {
                items.Add(new SelectListItem
                {
                    Value = item.Id.ToString(),
                    Text = item.Name + $"({item.Description})",
                    Selected = colDto.TableId == item.Id
                });

            }
            ViewBag.TableList = new SelectList(items, "Value", "Text");
            ViewBag.DataTypeList = new SelectList(ColumnType.list);
            return View(colDto);
        }
        #endregion

        #region Ajax
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            Expression<Func<Sys_TableColumnDto, bool>> queryExp = item => item.Id > 0;
            var searchKey = queryBase.SearchKey;
            if (searchKey.Ext_IsNotEmpty())
            {
                if (searchKey.Contains("TableId")) //如果是查找指定表下的列 前台格式为 TableId|Id值
                {
                    var tableId = searchKey.Split('|')[1].Ext_ToInt32();
                    queryExp = x => x.TableId == tableId;
                }
                else
                    queryExp = x => (x.Description.Contains(searchKey) || x.Name.Contains(searchKey));
            }
            var allTable = (await _tableListService.GetListAsync(item => item.Id > 0))
                   .data.ToDictionary(item => item.Id, item => item.Name);
            var dto = await _tableColumnService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
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
                    dataType = d.DataType,
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
        public async Task<IActionResult> Edit(UrlParameter param, Sys_TableColumnDto dto)
        {
            var result = await _tableColumnService.UpdateAsync(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, Sys_TableColumnDto dto)
        {
            var result = await _tableColumnService.AddAsync(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _tableColumnService.DeleteAsync(param.ids));
            else
                return Json(await _tableColumnService.DeleteAsync(param.id));
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Copy(UrlParameter param)
        {
            var resourceDto = (await _tableColumnService.GetByIdAsync(param.id)).data;
            var newDto = resourceDto;
            newDto.Id = default(int);
            var result = await _tableColumnService.AddAsync(newDto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetValue(UrlParameter param, SetColumnAttrModel model)
        {
            var result = await SysService.SetColumnValue(param.ids, model.FiledName, model.Value);
            return Json(result);
        }
        #endregion
    }
}