using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Core.Extensions;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace lkWeb.Areas.Admin.Controllers
{
    /// <summary>
    /// 用于查看，操作 TableList及TableColumn的数据
    /// param中的 Id 对应 TableList中的Id
    /// </summary>
    public class ViewListController : AdminBaseController
    {
        public readonly ITableColumnService _tableColumnService;
        public readonly ITableListService _tableListService;
        public readonly ISqlService _sqlService;
        public readonly ISysService _sysService;
        public ViewListController(ITableColumnService tableColumnService,
            ITableListService tableListService,
            ISqlService sqlService,
            ISysService sysService)
        {
            _tableColumnService = tableColumnService;
            _tableListService = tableListService;
            _sqlService = sqlService;
            _sysService = sysService;
        }
        #region Page
        public async Task<IActionResult> Index(UrlParameter param)
        {
            var model = new ViewListModel();
            model.TableId = param.id;
            var result = await _tableColumnService.GetList(item => item.TableId == param.id && item.ListVisible == 1);
            model.TableColumn = result.data;
            ViewBag.TableName = (await _tableListService.GetById(model.TableId)).data.Description;
            return View(model);
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var model = new ViewListModel();
            model.TableId = param.id;
            var result = await _tableColumnService.GetList(item => item.TableId == param.id && item.AddVisible == 1);
            model.TableColumn = result.data;
            string sql = "select {0} from {1} where {2}";
            ViewBag.Data = new Dictionary<string, SelectList>();
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == Service.Enum.ColumnDataType.Out)
                {
                    string[] outSql = column.OutSql.Split(','); //Example: Name,Sys_Department,ParentId=0
                    var colNames = outSql[0] + ",Id"; //Id也需要 作为下拉菜单的Value
                    var tableName = outSql[1];
                    var condition = outSql[2];
                    var queryResult = await _sqlService.Query(string.Format(sql, colNames, tableName, condition));
                    var items = new List<SelectListItem>();
                    foreach (var dic in queryResult)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = dic["Id"].ToString(),
                            Text = dic[outSql[0]].ToString(),
                        });

                    }
                    ViewBag.Data[column.Name] = new SelectList(items, "Value", "Text");
                }
            }
            return View(model);
        }

        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var model = new ViewListModel();
            model.TableId = param.value.ToInt32();
            var result = await _tableColumnService.GetList(item => item.TableId == model.TableId && item.EditVisible == 1);
            model.TableColumn = result.data;
            string sql = "select {0} from {1} where {2}";
            ViewBag.OutColumn = new Dictionary<string, SelectList>();
            var tbName = (await _tableListService.GetById(model.TableId)).data.Name;
            var columnValueResult = await _sqlService.Query(
                string.Format("select {0} from {1} where {2}", "*", tbName, "Id=" + param.id));
            ViewBag.ColumnValue = columnValueResult.First();
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == Service.Enum.ColumnDataType.Out)
                {
                    var outSql = column.OutSql.Split(','); //Example: Name,Sys_Department,ParentId=0
                    var colName = outSql[0];
                    var colNames = colName + ",Id"; //Id也需要 查询时使用 作为下拉菜单的Value
                    var tableName = outSql[1];
                    var condition = outSql[2];
                    var queryResult = await _sqlService.Query(string.Format(sql, colNames, tableName, condition));
                    var items = new List<SelectListItem>();
                    //获取此条数据列类型为Out的字段的值，以便之后SelectList的默认选中Selected使用
                    var outKeyValue = await _sqlService.GetSingle(
                        string.Format("select {0} from {1} where {2}", colName, tableName, "Id=" + param.id));
                    foreach (var dic in queryResult)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = dic["Id"].ToString(),
                            Text = dic[outSql[0]].ToString(),
                            Selected = dic["Id"].ToString() == outKeyValue
                        });

                    }
                    ViewBag.OutColumn[column.Name] = new SelectList(items, "Value", "Text");
                }
            }
            return View(model);
        }
        #endregion

        #region Ajax
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            var tableId = queryBase.Value.ToInt32(); //表ID 保存在value中
            string condition = "1=1";
            if (queryBase.SearchKey.IsNotEmpty())
            {
                condition = string.Empty;
                var searchColumns = (await _sysService.GetColumnNames(tableId, "SearchVisible=1")).data.Split(',');
                foreach (var column in searchColumns)
                {
                    condition += string.Format(" {0} like '%{1}%' or", column, queryBase.SearchKey);
                }
                condition = condition.Substring(0, condition.Length - 2);
            }

            var columnNames = (await _sysService.GetColumnNames(tableId, "ListVisible=1")).data;
            var tableData = await _sysService.GetPageData(tableId, columnNames, condition, queryBase);
            List<Dictionary<string, object>> listData = new List<Dictionary<string, object>>();
            var outTypeColumnNames = (await _sysService.GetColumnNames(
                tableId, "ListVisible=1 and DataType=" + (int)ColumnDataType.Out)).data.Split(',');


            foreach (var dicList in tableData.data)
            {
                Dictionary<string, object> temp = new Dictionary<string, object>();
                temp["rowNum"] = ++queryBase.Start;
                foreach (var item in dicList)
                {
                    if (outTypeColumnNames.Contains(item.Key))
                    {
                        temp[item.Key] = (await _sysService.GetOutValue(tableId, item.Key, item.Value.ToString())).data;
                    }
                    else
                    {
                        if (item.Key == "CreateDateTime") //如果是创建时间 转换下格式显示
                            temp[item.Key] = Convert.ToDateTime(item.Value).ToString("yyyy/M/d hh:mm:ss");
                        else
                            temp[item.Key] = item.Value;
                    }
                }
                listData.Add(temp);
            }
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = tableData.data.Count,
                recordsFiltered = tableData.data.Count,
                data = listData
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, IFormCollection formData)
        {
            var model = new ViewListModel();
            var columnResult = await _tableColumnService.GetList(item => item.TableId == param.id && item.AddVisible == 1);
            var tableColumns = columnResult.data;
            var addModel = new Dictionary<string, string>();
            foreach (var column in tableColumns)
            {
                if (formData.ContainsKey(column.Name))
                    addModel[column.Name] = formData[column.Name];
            }
            addModel["CreateDateTime"] = DateTime.Now.ToString(); //补充上创建时间
            var result = await _sysService.Add(param.id, addModel);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, IFormCollection formData)
        {
            var model = new ViewListModel();
            var tableId = param.value.ToInt32();
            var columnResult = await _tableColumnService.GetList(item => item.TableId == tableId && item.EditVisible == 1);
            var tableColumns = columnResult.data;
            var updateModel = new Dictionary<string, string>();
            foreach (var column in tableColumns)
            {
                if (formData.ContainsKey(column.Name))
                    updateModel[column.Name] = formData[column.Name];
            }
            var result = await _sysService.Update(tableId, updateModel, param.id);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            var tableId = param.value.ToInt32();
            var result = _sysService.Delete(tableId, param.ids);
            return Json(result);
        }

        #endregion
    }
}