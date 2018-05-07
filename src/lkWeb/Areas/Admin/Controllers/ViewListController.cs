using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Core.Extensions;
using lkWeb.Service;
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
            model.Table = (await _tableListService.GetById(param.id)).data;
            var result = await _tableColumnService.GetList(item => item.TableId == param.id && item.ListVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.ListOrder).ToList();
            ViewBag.TableName = model.Table.Description;
            var showBtnModel = new ShowButtonModel
            {
                ShowAddBtn = model.Table.AllowAdd == 1,
                ShowEditBtn = model.Table.AllowEdit == 1,
                ShowDelBtn = model.Table.AllowDelete == 1,
                ShowImportBtn = model.Table.AllowImport == 1,
                ShowExportBtn = model.Table.AllowExport == 1,
                ShowViewBtn = model.Table.AllowView == 1
            };
            ViewBag.ShowButton = showBtnModel;
            return View(model);
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetById(param.id)).data;
            var result = await _tableColumnService.GetList(item => item.TableId == param.id && item.AddVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.EditOrder).ToList();
            string sql = "select {0} from {1} where {2}";
            ViewBag.OutColumn = new Dictionary<string, SelectList>();
            ViewBag.EnumColumn = new Dictionary<string, SelectList>();
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == Service.Enum.ColumnDataType.Out)
                {
                    string[] outSql = column.OutSql.Split('|'); //Example: Id,Name|Sys_Department|ParentId=0
                    var colNames = outSql[0].Split(','); //value,text
                    var tableName = outSql[1];
                    var condition = outSql[2];
                    var primarKey = colNames[0]; //作为下拉菜单value的列
                    var textKey = colNames[1]; //作为下拉菜单的text的列
                    var queryResult = await _sqlService.Query(string.Format(sql, outSql[0], tableName, condition));
                    var items = new List<SelectListItem>();
                    items.Add(new SelectListItem
                    {
                        Value = "0",
                        Text = "无"
                    });
                    foreach (var row in queryResult)
                    {
                        items.Add(new SelectListItem
                        {

                            Value = row[primarKey].ToString(),
                            Text = row[textKey].ToString(),
                        });

                    }
                    ViewBag.OutColumn[column.Name] = new SelectList(items, "Value", "Text");
                }
                else if (column.DataType == ColumnDataType.Enum)
                {
                    var enumStr = column.EnumRange.Split(','); //value,value
                    var items = new List<SelectListItem>();
                    for (int i = 0; i < enumStr.Length; i++)
                    {
                        items.Add(new SelectListItem
                        {

                            Value = enumStr[i],
                            Text = enumStr[i]
                        });
                    }
                    ViewBag.EnumColumn[column.Name] = new SelectList(items, "Value", "Text");
                }
            }
            return View(model);
        }

        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetById(param.value.ToInt32())).data;
            var result = await _tableColumnService.GetList(item => item.TableId == model.Table.Id && item.EditVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.EditOrder).ToList();
            string sql = "select {0} from {1} where {2}";
            ViewBag.OutColumn = new Dictionary<string, SelectList>();
            ViewBag.EnumColumn = new Dictionary<string, SelectList>();
            var tbName = model.Table.Name;
            var columnValueResult = await _sqlService.Query(
                string.Format("select {0} from {1} where {2}", "*", tbName, "Id=" + param.id));
            ViewBag.ColumnValue = columnValueResult.First();
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == Service.Enum.ColumnDataType.Out)
                {
                    string[] outSql = column.OutSql.Split('|'); //Example: Id,Name|Sys_Department|ParentId=0
                    var colNames = outSql[0].Split(','); //value,text
                    var tableName = outSql[1];
                    var condition = outSql[2];
                    var primarKey = colNames[0]; //作为下拉菜单value的列
                    var textKey = colNames[1]; //作为下拉菜单的text的列
                    var queryResult = await _sqlService.Query(string.Format(sql, outSql[0], tableName, condition));
                    var items = new List<SelectListItem>();
                    //获取此条数据列类型为Out的字段的值，以便之后SelectList的默认选中Selected使用
                    var outColValue = await _sqlService.GetSingle(
                        string.Format("select {0} from {1} where {2}", textKey, tableName, primarKey + "=" + param.id));
                    items.Add(new SelectListItem
                    {
                        Value = "0",
                        Text = "无"
                    });
                    foreach (var row in queryResult)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = row[primarKey].ToString(),
                            Text = row[textKey].ToString(),
                            Selected = row[primarKey].ToString() == outColValue
                        });

                    }
                    ViewBag.OutColumn[column.Name] = new SelectList(items, "Value", "Text");
                }
                else if (column.DataType == ColumnDataType.Enum)
                {
                    //获取此条数据列类型为Enum的字段的值，以便之后SelectList的默认选中Selected使用
                    var enumColValue = await _sqlService.GetSingle(
                        string.Format("select {0} from {1} where {2}", column.Name, tbName, "Id=" + param.id));
                    var enumStr = column.EnumRange.Split(','); //value,value
                    var items = new List<SelectListItem>();

                    for (int i = 0; i < enumStr.Length; i++)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = enumStr[i],
                            Text = enumStr[i],
                            Selected = enumStr[i] == enumColValue
                        });
                    }
                    ViewBag.EnumColumn[column.Name] = new SelectList(items, "Value", "Text");
                }
            }
            return View(model);
        }

        public async Task<IActionResult> Detail(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetById(param.value.ToInt32())).data;
            var result = await _tableColumnService.GetList(item => item.TableId == model.Table.Id && item.ViewVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.ViewOrder).ToList();
            string sql = "select {0} from {1} where {2}";
            ViewBag.OutColumn = new Dictionary<string, string>();
            var tbName = model.Table.Name;
            var columnValueResult = await _sqlService.Query(
                string.Format("select {0} from {1} where {2}", "*", tbName, "Id=" + param.id));
            var columnValue = columnValueResult.First();
            ViewBag.ColumnValue = columnValue;
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == Service.Enum.ColumnDataType.Out)
                {
                    var outColValue = await _sysService.GetOutValue(model.Table.Id, column.Name, columnValue[column.Name].ToString());
                    ViewBag.OutColumn[column.Name] = outColValue.data;
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
            var tableDto = (await _tableListService.GetById(tableId)).data;
            if (tableDto.AllowView != 1)
            {
                return Json(new DataTableModel());
            }
            string condition = "1=1";
            if (queryBase.SearchKey.IsNotEmpty())
            {
                condition = string.Empty;
                var searchColumns = (await _sysService.GetColumnNames(tableId, "SearchVisible=1", "ListOrder")).data.Split(',');
                foreach (var column in searchColumns)
                {
                    condition += string.Format(" {0} like '%{1}%' or", column, queryBase.SearchKey);
                }
                condition = condition.Substring(0, condition.Length - 2); // 为了去掉 like 条件末尾多余的or
            }

            var columnNames = (await _sysService.GetColumnNames(tableId, "ListVisible=1", "ListOrder")).data;
            var tableData = await _sysService.GetPageData(tableId, columnNames, condition, queryBase);
            List<Dictionary<string, object>> listData = new List<Dictionary<string, object>>();
            var outTypeColumnNames = (await _sysService.GetColumnNames(tableId,
                "ListVisible=1 and DataType=" + (int)ColumnDataType.Out, "ListOrder")).data.Split(',');


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
                //替换扩展方法中的参数
                if (tableDto.ExtendFunction.IsNotEmpty())
                    temp["ExtendFunction"] = tableDto.ExtendFunction.Replace("{Id}", temp["Id"].ToString()).Replace("{UserId}", CurrentUser.Id.ToString());
                listData.Add(temp);
            }
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = tableData.recordsTotal,
                recordsFiltered = tableData.recordsTotal,
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
            var result = await _sysService.Delete(tableId, param.ids);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Export(UrlParameter param)
        {
            var tableId = param.id;
            var result = await _sysService.ExportExcel(tableId);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Import(UrlParameter param, IFormFile excelFile)
        {
            var tableId = param.id;
            var result = await _sysService.ImportExcel(tableId, excelFile);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DownloadImportTemplate(UrlParameter param)
        {
            var tableId = param.id;
            var result = await _sysService.DownloadImportTemplate(tableId);
            return Json(result);
        }

        #endregion
    }
}