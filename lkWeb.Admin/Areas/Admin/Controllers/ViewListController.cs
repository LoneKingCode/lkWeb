using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Admin.Areas.Admin.Models;
using lkWeb.Core.Extensions;
using lkWeb.Service;
using lkWeb.Service.Services;
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using lkWeb.Core.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using lkWeb.Models;

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    /// <summary>
    /// 用于查看，操作 TableList及TableColumn的数据
    /// param中的 Id 对应 TableList中的Id
    /// </summary>
    public class ViewListController : AdminBaseController
    {
        public readonly ISys_TableColumnService _tableColumnService;
        public readonly ISys_TableListService _tableListService;

        public ViewListController(ISys_TableColumnService tableColumnService,
            ISys_TableListService tableListService)
        {
            _tableColumnService = tableColumnService;
            _tableListService = tableListService;
        }

        #region Page
        public async Task<IActionResult> Index(UrlParameter param)
        {
            ViewBag.queryString = Request.QueryString.Value;
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

            foreach (var column in model.TableColumn)
            {
                if (column.DataType == ColumnType.Out || column.DataType == ColumnType.MultiSelect_Out)
                {
                    var outSqlModel = new OutSqlModel(column.OutSql);
                    var queryResult = await SysService.GetOutData(outSqlModel);
                    var items = new List<SelectListItem>();
                    foreach (var row in queryResult)
                    {
                        items.Add(new SelectListItem
                        {

                            Value = row[outSqlModel.PrimaryKey].ToString(),
                            Text = row[outSqlModel.TextKey].ToString(),
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
                else if (column.DataType == ColumnType.MultiSelect)
                {
                    var checkStr = column.SelectRange.Split('|'); //值,选项1|2,选项2
                    var items = new List<SelectListItem>();
                    for (int i = 0; i < checkStr.Length; i++)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = checkStr[i].Split(',')[0],
                            Text = checkStr[i].Split(',')[1],
                        });
                    }
                    ViewData[column.Name] = new SelectList(items, "Value", "Text");
                }
            }

            return View(model);
        }

        public async Task<IActionResult> Add(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetByIdAsync(param.id)).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == param.id && item.AddVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.EditOrder).ToList();


            foreach (var column in model.TableColumn)
            {
                if (column.DataType == ColumnType.Out || column.DataType == ColumnType.MultiSelect_Out)
                {
                    var outSqlModel = new OutSqlModel(column.OutSql);
                    var queryResult = await SysService.GetOutData(outSqlModel);
                    var items = new List<SelectListItem>();
                    //items.Add(new SelectListItem
                    //{
                    //    Value = "0",
                    //    Text = "无"
                    //});
                    foreach (var row in queryResult)
                    {
                        items.Add(new SelectListItem
                        {

                            Value = row[outSqlModel.PrimaryKey].ToString(),
                            Text = row[outSqlModel.TextKey].ToString(),
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
                else if (column.DataType == ColumnType.MultiSelect)
                {
                    var checkStr = column.SelectRange.Split('|'); //1,选项1|2,选项2
                    var items = new List<SelectListItem>();
                    foreach (var item in checkStr)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = item.Split(',')[0],
                            Text = item.Split(',')[1],
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
            model.Table = (await _tableListService.GetByIdAsync(param.extraValue.Ext_ToInt32())).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == model.Table.Id && item.EditVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.EditOrder).ToList();
            var tbName = model.Table.Name;
            var columnValue = (await SqlService.Query(
                string.Format("select {0} from {1} where {2}", "*", tbName, "Id=" + param.id))).First();
            ViewBag.ColumnValue = columnValue;
            var fileData = new Dictionary<string, IList<object>>();
            ViewData["FileData"] = "";
            foreach (var column in model.TableColumn)
            {
                var colValue = string.Empty;
                if (columnValue.ContainsKey(column.Name))
                    colValue = columnValue[column.Name].ToString();
                if (column.DataType == ColumnType.Out)
                {
                    var outSqlModel = new OutSqlModel(column.OutSql);
                    var queryResult = await SysService.GetOutData(outSqlModel);
                    var items = new List<SelectListItem>();

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
                            Value = row[outSqlModel.PrimaryKey].ToString(),
                            Text = row[outSqlModel.TextKey].ToString(),
                        });

                    }
                    ViewData[column.Name] = new SelectList(items, "Value", "Text", colValue);

                }
                else if (column.DataType == ColumnType.MultiSelect_Out)
                {
                    var outSqlModel = new OutSqlModel(column.OutSql);
                    var queryResult = await SysService.GetOutData(outSqlModel);
                    var items = new List<SelectListItem>();
                    //遍历outsql查询的数据中全部项
                    foreach (var row in queryResult)
                    {
                        items.Add(new SelectListItem
                        {
                            Value = row[outSqlModel.PrimaryKey].ToString(),
                            Text = row[outSqlModel.TextKey].ToString(),
                        });

                    }
                    var selectValues = new List<object>();
                    if (outSqlModel.IsSave)
                        selectValues = (await SysService.GetMultiSelectOutValue(outSqlModel, param.id.ToString())).data.ToList();
                    else
                    {
                        foreach (var item in colValue.Split(','))
                        {
                            selectValues.Add(item);
                        }
                    }
                    ViewData[column.Name] = new MultiSelectList(items, "Value", "Text", selectValues);
                }
                else if (column.DataType == ColumnType.Enum)
                {
                    //获取此条数据列类型为Enum的字段的值，以便之后SelectList的默认选中Selected使用
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
                    ViewData[column.Name] = new SelectList(items, "Value", "Text", colValue);
                }
                else if (column.DataType == ColumnType.MultiSelect)
                {
                    var selectValues = colValue.Split(',');
                    var checkStr = column.SelectRange.Split('|'); //1,选项1|2,选项2
                    var items = new List<SelectListItem>();
                    foreach (var item in checkStr)
                    {
                        items.Add(new SelectListItem
                        {
                            Selected = selectValues.Contains(item.Split(',')[0]),
                            Value = item.Split(',')[0],
                            Text = item.Split(',')[1],
                        });
                    }
                    ViewData[column.Name] = new MultiSelectList(items, "Value", "Text", selectValues);
                }
                else if (column.DataType == ColumnType.File || column.DataType == ColumnType.Image)
                {
                    var files = colValue.Split(',');
                    fileData.Add(column.DataType + column.Name, new List<object>());
                    foreach (var file in files)
                    {
                        fileData[column.DataType + column.Name].Add(new
                        {
                            fileUrl = file,
                            fileType = Path.GetExtension(file).TrimStart('.'),
                            fileName = Path.GetFileNameWithoutExtension(file),
                            columnType = column.DataType
                        });
                    }
                }
            }
            if (fileData.Keys.Count > 0)
                ViewData["FileData"] = JsonConvert.SerializeObject(fileData);
            return View(model);
        }

        public async Task<IActionResult> Detail(UrlParameter param)
        {
            var model = new ViewListModel();
            model.Table = (await _tableListService.GetByIdAsync(param.extraValue.Ext_ToInt32())).data;
            var result = await _tableColumnService.GetListAsync(item => item.TableId == model.Table.Id && item.ViewVisible == 1);
            model.TableColumn = result.data.OrderBy(c => c.ViewOrder).ToList();
            string sql = "select {0} from {1} where {2}";
            ViewBag.OutColumn = new Dictionary<string, object>();
            var tbName = model.Table.Name;
            var columnValueResult = await SqlService.Query(
                string.Format(sql, "*", tbName, "Id=" + param.id));
            var columnValue = columnValueResult.First();
            ViewBag.ColumnValue = columnValue;
            foreach (var column in model.TableColumn)
            {
                if (column.DataType == ColumnType.Out)
                {
                    var outSqlModel = new OutSqlModel(column.OutSql);
                    var outColValue = await SysService.GetOutValue(outSqlModel, columnValue[column.Name].ToString());
                    ViewBag.OutColumn[column.Name] = outColValue.data;
                }
                else if (column.DataType == ColumnType.MultiSelect_Out)
                {
                    var outSqlModel = new OutSqlModel(column.OutSql);
                    var queryResult = await SysService.GetOutData(outSqlModel);

                    //如果保存到外表 查询的是外表值
                    if (outSqlModel.IsSave)
                    {
                        var selectValues = (await SysService.GetMultiSelectOutValue(outSqlModel, param.id.ToString())).data;
                        var outColValues = queryResult.Where(item => selectValues.Contains(item[outSqlModel.PrimaryKey].ToString()))
                            .Select(item => item[outSqlModel.TextKey]).ToList();
                        ViewBag.OutColumn[column.Name] = string.Join(",", outColValues);
                    }
                    //否则查询本表此列值
                    else
                    {
                        ViewBag.OutColumn[column.Name] = columnValue[column.Name];
                    }
                }
                else if (column.DataType == ColumnType.MultiSelect)
                {
                    var selectValues = columnValueResult.First()[column.Name].ToString().Split(',');
                    var checkStr = column.SelectRange.Split('|'); //1,选项1|2,选项2
                    var items = new List<SelectListItem>();
                    var selectText = string.Empty;
                    foreach (var item in checkStr)
                    {
                        if (selectValues.Contains(item.Split(',')[0]))
                        {
                            selectText += item.Split(',')[1] + ",";
                        }
                    }
                    ViewBag.ColumnValue[column.Name] = selectText.Trim(',');
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

            var tableId = queryBase.Value.Ext_ToInt32(); //表ID 保存在value中
            var tableDto = (await _tableListService.GetByIdAsync(tableId)).data;
            var colDtos = (await _tableColumnService.GetListAsync(item => item.TableId == tableId && item.ListVisible == 1)).data.OrderBy(item => item.ListOrder);
            var columnNames = string.Join(',', colDtos.Select(item => item.Name));
            if (tableDto.AllowView != 1)
            {
                return Json(new DataTableModel());
            }
            var queryCondition = "1=1";
            var count = 0;
            foreach (var queryKey in Request.Query.Keys)
            {
                queryCondition = string.Empty;
                //首字母大写
                var firstUpper = queryKey.Substring(0, 1).ToUpper() + queryKey.Substring(1).ToLower();
                if (columnNames.Contains(firstUpper))
                {
                    queryCondition += $" ({queryKey}='{Request.Query[queryKey]}') and";
                    count++;
                }
            }
            if (count > 0)
                queryCondition = queryCondition.Substring(0, queryCondition.Length - 3);
            else
                queryCondition = "1=1";

            string condition = " and 1=1";

            if (queryBase.SearchKey.Ext_IsNotEmpty())
            {
                condition = string.Empty;
                var searchColDtos = (await _tableColumnService.GetListAsync(item => item.TableId == tableId && item.SearchVisible == 1)).data;
                var searchDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(queryBase.SearchKey);
                count = 0;
                foreach (var searchKey in searchDic.Keys)
                {
                    var keyValue = searchDic[searchKey];
                    var searchColDto = searchColDtos.Where(x => x.Name == searchKey).FirstOrDefault();
                    if (searchColDto != null && keyValue.Ext_IsNotEmpty())
                    {
                        count++;
                        var searchColDataType = searchColDto.DataType;
                        if (searchColDataType == ColumnType.Custom || searchColDataType == ColumnType.String || searchColDataType == ColumnType.RichText)
                        {
                            condition += $" ({searchKey} like '%{keyValue}%') and";
                        }
                        else if (searchColDataType == ColumnType.Int || searchColDataType == ColumnType.Decimal || searchColDataType == ColumnType.Out)
                        {
                            condition += $" ({searchKey} = '{keyValue}') and";
                        }
                        else if (searchColDataType == ColumnType.MultiSelect) //暂不需要
                        {
                            var selectItems = keyValue.Split(',');
                        }
                        else if (searchColDataType == ColumnType.MultiSelect_Out) //暂不需要
                        {
                            var selectItems = keyValue.Split(',');
                        }
                        else if (searchColDataType == ColumnType.Datetime)
                        {
                            var endDate = searchDic[searchKey + "_end"];
                            condition += $" ({searchKey}>='{keyValue}' and {searchKey} <= '{endDate}') and";
                        }
                    }
                }
                if (count > 0)
                    condition = " and " + condition.Substring(0, condition.Length - 3);
                else
                    condition = " and 1=1";
            }
            if (queryBase.OrderBy.Ext_IsEmpty())
            {
                if (tableDto.DefaultSort.Ext_IsEmpty())
                    queryBase.OrderBy = "Id";
                else
                    queryBase.OrderBy = tableDto.DefaultSort;
            }

            var listData = await SysService.GetProcessedPageData(tableId, queryCondition + condition, queryBase);

            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = listData.recordsTotal,
                recordsFiltered = listData.recordsTotal,
                data = listData.data
            };
            return Json(data);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, IFormCollection formData)
        {
            var result = SysService.Add(param, formData);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, IFormCollection formData)
        {
            var result = await SysService.Edit(param, formData);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            var tableId = param.extraValue.Ext_ToInt32();
            var result = await SysService.Delete(tableId, param.ids);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Export(UrlParameter param)
        {
            var tableId = param.id;
            var result = await SysService.ExportExcel(tableId, param.ids);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Import(UrlParameter param, IFormFile file)
        {
            var tableId = param.id;
            var result = await SysService.ImportExcel(tableId, file);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Upload(UrlParameter param, IFormFile file)
        {
            var result = new Result<object>();
            var columnId = param.id;
            var forbiddenFileExt = (await _tableColumnService.GetByIdAsync(columnId)).data.ForbiddenFileExtension;
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var uploadPath = Path.Combine(WebHelper.UploadPath, dateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);
            string fileExt = Path.GetExtension(file.FileName);
            if (forbiddenFileExt.Ext_IsNotEmpty() && forbiddenFileExt.Split('|').Contains(fileExt.TrimStart('.')))
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
            //....存到数据库sys_file中
            //
            //
            //
            //
            result.flag = true;
            result.data = new
            {
                fileUrl = "/" + Path.Combine(WebHelper.UploadDir, dateDir).Replace(Path.DirectorySeparatorChar, '/') + "/" + fileName,
                fileType = fileExt.TrimStart('.'),
                fileName = Path.GetFileNameWithoutExtension(file.FileName)
            };
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DownloadImportTemplate(UrlParameter param)
        {
            var tableId = param.id;
            var result = await SysService.DownloadImportTemplate(tableId);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> BatchOperation(UrlParameter param, SetColumnAttrModel model)
        {
            var tableId = param.id;
            var result = await SysService.BatchOperation(tableId, param.ids, model.FiledName, model.Value);
            return Json(result);
        }
        #endregion
    }
}