using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Core.Extension;
using lkWeb.Service;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using lkWeb.Core.Helper;
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
        public readonly ISys_TableColumnService _tableColumnService;
        public readonly ISys_TableListService _tableListService;
        public readonly ISqlService _sqlService;
        public readonly ISysService _sysService;
        public ViewListController(ISys_TableColumnService tableColumnService,
            ISys_TableListService tableListService,
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
            model.Table = (await _tableListService.GetByIdAsync(param.id)).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == param.id && item.ListVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.ListOrder).ToList();
            ViewBag.TableName = model.Table.Description;

            var viewEditWidthHeight =
                string.IsNullOrEmpty(model.Table.ViewEditWidthHeight) ||
                model.Table.ViewEditWidthHeight.Split("|").Length != 2
                ? "90%,90%|90%,90%".Split("|") : model.Table.ViewEditWidthHeight.Split("|");
            //example: width,height|width,height
            var viewWidth = viewEditWidthHeight[0].Split(',')[0];
            var viewHeight = viewEditWidthHeight[0].Split(',')[1];
            var addEditWidth = viewEditWidthHeight[1].Split(',')[0];
            var addEditHeight = viewEditWidthHeight[1].Split(',')[1];
            ViewBag.viewWidth = viewWidth.Contains("px") || viewWidth.Contains("%") ? viewWidth : "90%";
            ViewBag.viewHeight = viewHeight.Contains("px") || viewHeight.Contains("%") ? viewHeight : "90%";
            ViewBag.addEditWidth = addEditWidth.Contains("px") || addEditWidth.Contains("%") ? addEditWidth : "90%";
            ViewBag.addEditHeight = addEditHeight.Contains("px") || addEditHeight.Contains("%") ? addEditHeight : "90%";

            var showBtnModel = new ShowButtonModel
            {
                ShowAddBtn = model.Table.AllowAdd == 1,
                ShowEditBtn = model.Table.AllowEdit == 1,
                ShowDelBtn = model.Table.AllowDelete == 1,
                ShowImportBtn = model.Table.AllowImport == 1,
                ShowExportBtn = model.Table.AllowExport == 1,
                ShowDetailBtn = model.Table.AllowDetail == 1,

                TopExtendFunction = model.Table.TopExtendFunction,
            };
            ViewBag.ShowButton = showBtnModel;
            return View(model);
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetByIdAsync(param.id)).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == param.id && item.AddVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.EditOrder).ToList();
            string sql = "select {0} from {1} where {2}";

            foreach (var column in model.TableColumn)
            {
                if (column.DataType == ColumnType.Out)
                {
                    string[] outSql = column.OutSql.Split('|'); //Example: Id,Name|Sys_Department|ParentId=0
                    var colNames = outSql[0].Split(','); //value,text
                    var tableName = outSql[1];
                    var condition = outSql[2];
                    var primaryKey = colNames[0]; //作为下拉菜单value的列
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

                            Value = row[primaryKey].ToString(),
                            Text = row[textKey].ToString(),
                        });

                    }
                    ViewData[column.Name] = new SelectList(items, "Value", "Text");
                }
                else if (column.DataType == ColumnType.Enum)
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
                    ViewData[column.Name] = new SelectList(items, "Value", "Text");
                }
                else if (column.DataType == ColumnType.CheckBox)
                {
                    var checkStr = column.SelectRange.Split(','); //选项1,选项2
                    var items = new List<SelectListItem>();
                    for (int i = 0; i < checkStr.Length; i++)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = checkStr[i],
                            Text = checkStr[i],
                        });
                    }
                    ViewData[column.Name] = new SelectList(items, "Value", "Text");
                }
            }
            return View(model);
        }

        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetByIdAsync(param.extraValue.ToInt32())).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == model.Table.Id && item.EditVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.EditOrder).ToList();
            string sql = "select {0} from {1} where {2}";
            var tbName = model.Table.Name;
            var columnValueResult = await _sqlService.Query(
                string.Format("select {0} from {1} where {2}", "*", tbName, "Id=" + param.id));
            ViewBag.ColumnValue = columnValueResult.First();
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == ColumnType.Out)
                {
                    string[] outSql = column.OutSql.Split('|'); //Example: Id,Name|Sys_Department|ParentId=0
                    var colNames = outSql[0].Split(','); //value,text
                    var tableName = outSql[1];
                    var condition = outSql[2];
                    var primaryKey = colNames[0]; //作为下拉菜单value的列
                    var textKey = colNames[1]; //作为下拉菜单的text的列
                    var queryResult = await _sqlService.Query(string.Format(sql, outSql[0], tableName, condition));
                    var items = new List<SelectListItem>();
                    //获取此条out列的主键值
                    var outColId = columnValueResult.First()[column.Name].ToString();
                    items.Add(new SelectListItem
                    {
                        Value = "0",
                        Text = "无",
                    });
                    //遍历outsql查询的数据中全部项
                    foreach (var row in queryResult)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = row[primaryKey].ToString(),
                            Text = row[textKey].ToString(),
                        });

                    }
                    ViewData[column.Name] = new SelectList(items, "Value", "Text", outColId);
                }
                else if (column.DataType == ColumnType.Enum)
                {
                    //获取此条数据列类型为Enum的字段的值，以便之后SelectList的默认选中Selected使用
                    //var enumColValue = await _sqlService.GetSingle(
                    //    string.Format("select {0} from {1} where {2}", column.Name, tbName, "Id=" + param.id));
                    var enumColValue = columnValueResult.First()[column.Name].ToString();
                    var enumStr = column.EnumRange.Split(','); //value,value
                    var items = new List<SelectListItem>();

                    for (int i = 0; i < enumStr.Length; i++)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = enumStr[i],
                            Text = enumStr[i],
                        });
                    }
                    ViewData[column.Name] = new SelectList(items, "Value", "Text", enumColValue);
                }
                else if (column.DataType == ColumnType.CheckBox)
                {
                    var checkColValues = columnValueResult.First()[column.Name].ToString().Split(',');
                    var checkStr = column.SelectRange.Split(','); //选项1,选项2
                    var items = new List<SelectListItem>();
                    for (int i = 0; i < checkStr.Length; i++)
                    {
                        items.Add(new SelectListItem
                        {
                            Selected = checkColValues.Contains(checkStr[i]),
                            Value = checkStr[i],
                            Text = checkStr[i],
                        });
                    }
                    ViewData[column.Name] = new MultiSelectList(items, "Value", "Text", checkColValues);
                }
            }
            return View(model);
        }

        public async Task<IActionResult> Detail(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetByIdAsync(param.extraValue.ToInt32())).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == model.Table.Id && item.ViewVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.ViewOrder).ToList();
            string sql = "select {0} from {1} where {2}";
            ViewBag.OutColumn = new Dictionary<string, string>();
            var tbName = model.Table.Name;
            var columnValueResult = await _sqlService.Query(
                string.Format(sql, "*", tbName, "Id=" + param.id));
            var columnValue = columnValueResult.First();
            ViewBag.ColumnValue = columnValue;
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == ColumnType.Out)
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
            var tableDto = (await _tableListService.GetByIdAsync(tableId)).data;
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
                condition = '(' + condition + ')';
            }
            if (queryBase.OrderBy.IsEmpty())
            {
                if (tableDto.DefaultSort.IsEmpty())
                    queryBase.OrderBy = "Id";
                else
                    queryBase.OrderBy = tableDto.DefaultSort;
            }
            var columnNames = (await _sysService.GetColumnNames(tableId, "ListVisible=1", "ListOrder")).data;
            var tableData = await _sysService.GetPageData(tableId, columnNames, condition, queryBase);
            List<Dictionary<string, object>> listData = new List<Dictionary<string, object>>();
            var outTypeColumnNames = (await _sysService.GetColumnNames(tableId,
                $"ListVisible=1 and DataType='{ColumnType.Out}'", "ListOrder")).data.Split(',');
            var fileTypeColNames = (await _sysService.GetColumnNames(tableId,
                $"ListVisible=1 and DataType='{ColumnType.File}'", "ListOrder")).data.Split(',');
            var customColNames = (await _sysService.GetColumnNames(tableId,
                $"ListVisible=1 and DataType='{ColumnType.Custom}'", "ListOrder")).data.Split(',');
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
                    else if (customColNames.Contains(item.Key))
                    {
                        var model = (await _tableColumnService.GetByExpAsync(x => x.Name == item.Key && x.TableId == tableId)).data;
                        temp[item.Key] = model.CustomContent.Replace("{Id}", temp["Id"].ToString()).Replace("{UserId}", CurrentUser.Id.ToString());
                    }
                    else if (fileTypeColNames.Contains(item.Key))
                    {
                        string url = string.Empty;
                        string text = string.Empty;
                        string style = string.Empty;
                        string filePath = Path.Combine(WebHelper.WebRootPath, item.Value.ToString().Replace('/', '\\').TrimStart('\\'));
                        if (System.IO.File.Exists(filePath))
                        {
                            url = item.Value.ToString();
                            text = "下载";
                            style = "btn btn-info";
                        }
                        else
                        {
                            url = "javascript:alert('无效文件')";
                            text = "无效";
                            style = "btn btn-danger";
                        }
                        temp[item.Key] = $"<a href='{url}' target='_blank' class='{style}' download>{text}</a>";
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
            var table = (await _tableListService.GetByIdAsync(param.id)).data;
            var columnResult = await _tableColumnService.GetListAsync(item => item.TableId == param.id && item.AddVisible == 1);
            var tableColumns = columnResult.data;
            var addModel = new Dictionary<string, string>();
            var result = new Result<bool>();
            var pk_cols = (await _tableColumnService.GetListAsync(item => item.PrimaryKey == 1)).data.Select(x => x.Name);
            foreach (var column in tableColumns)
            {
                var exist = "0";

                if (formData.ContainsKey(column.Name))
                {
                    if (pk_cols.Contains(column.Name))
                        exist = await _sqlService.GetSingle($"select count(*) from {table.Name} where {column.Name} = '{formData[column.Name]}'");
                    if (exist != "0")
                    {
                        result.msg += column.Description + "字段为主键，值\"" + formData[column.Name] + "\"已存在,";
                    }
                    else
                        addModel[column.Name] = formData[column.Name];
                }
            }
            if (!string.IsNullOrEmpty(result.msg))
                return Json(result);
            addModel["CreateDateTime"] = DateTime.Now.ToString(); //补充上创建时间
            result = await _sysService.Add(param.id, addModel);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, IFormCollection formData)
        {
            var model = new ViewListModel();
            var tableId = param.extraValue.ToInt32();
            var columnResult = await _tableColumnService.GetListAsync(item => item.TableId == tableId && item.EditVisible == 1);
            var tableColumns = columnResult.data;
            var table = (await _tableListService.GetByIdAsync(tableId)).data;

            var updateModel = new Dictionary<string, string>();
            var pk_cols = (await _tableColumnService.GetListAsync(item => item.PrimaryKey == 1)).data.Select(x => x.Name);
            var result = new Result<bool>();

            foreach (var column in tableColumns)
            {
                var exist = "0";
                if (formData.ContainsKey(column.Name))
                {
                    if (pk_cols.Contains(column.Name))
                        exist = await _sqlService.GetSingle(
                            $"select count(*) from {table.Name} where {column.Name} = '{formData[column.Name]}' and Id!={param.id}");
                    if (exist != "0")
                    {
                        result.msg += column.Description + "字段为主键，值\"" + formData[column.Name] + "\"已存在,";
                    }
                    else
                        updateModel[column.Name] = formData[column.Name];
                }
            }
            if (!string.IsNullOrEmpty(result.msg))
                return Json(result);
            result = await _sysService.Update(tableId, updateModel, param.id);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            var tableId = param.extraValue.ToInt32();
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
        public async Task<IActionResult> Import(UrlParameter param, IFormFile file)
        {
            var tableId = param.id;
            var result = await _sysService.ImportExcel(tableId, file);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Upload(UrlParameter param, IFormFile file)
        {
            var result = new Result<string>();
            var columnId = param.id;
            var forbiddenFileExt = (await _tableColumnService.GetByIdAsync(columnId)).data.ForbiddenFileExtension;
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var uploadPath = Path.Combine(WebHelper.UploadPath, dateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);
            string fileExt = Path.GetExtension(file.FileName);
            if (forbiddenFileExt.IsNotEmpty() && forbiddenFileExt.Split('|').Contains(fileExt.TrimStart('.')))
            {
                result.msg = "不允许的文件类型";
                return Json(result);
            }
            string fileName = Path.GetFileNameWithoutExtension(file.FileName) + "_" + DateTime.Now.ToString("yyyyMMddhhmmss") + fileExt;
            FileInfo _file = new FileInfo(Path.Combine(uploadPath, fileName));

            using (FileStream fs = new FileStream(_file.ToString(), FileMode.Create))
            {
                file.CopyTo(fs);
                fs.Flush();
            }
            result.flag = true;
            result.data = "/" + Path.Combine(WebHelper.UploadDir, dateDir).Replace("\\", "/") + "/" + fileName;
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