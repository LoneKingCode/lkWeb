using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using lkWeb.Core.Extensions;
using lkWeb.Service.Enum;
using System.Linq;
using System.IO;
using OfficeOpenXml;
using System.Globalization;
using Microsoft.AspNetCore.Http;

namespace lkWeb.Service.Abstracts
{
    public class SysService : ISysService
    {
        public readonly ISqlService _sqlService;
        public readonly ITableListService _tableListService;
        public readonly ITableColumnService _tableColumnService;

        public SysService(ISqlService sqlService,
            ITableListService tableListService,
            ITableColumnService tableColumnService)
        {
            _sqlService = sqlService;
            _tableListService = tableListService;
            _tableColumnService = tableColumnService;
        }
        /// <summary>
        /// 生成列
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <returns></returns>
        public async Task<Result<List<TableColumnDto>>> GenerateColumn(int tableId)
        {
            var result = new Result<List<TableColumnDto>>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            //此SQL语句可以查询制定表的所有列
            var tableData = await _sqlService.Query(string.Format("select * from v_TableInfo where tablename = '{0}'",
                tableDto.Name));
            var tableColumns = new List<TableColumnDto>();
            var delResult = await _tableColumnService.Delete(item => item.TableId == tableId);
            foreach (var row in tableData)
            {
                tableColumns.Add(new TableColumnDto
                {
                    Name = row["colName"].ToString(),
                    DataType = (ColumnDataType)System.Enum.Parse(typeof(ColumnDataType), row["colType"].ToString().InitialUpper()),
                    MaxLength = row["colLength"].ObjToInt(),
                    TableId = tableDto.Id,
                });
            }
            var addResult = await _tableColumnService.Add(tableColumns);
            return addResult;

        }

        /// <summary>
        /// 设置列属性值
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="filedName"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<Result<List<TableColumnDto>>> SetColumnValue(List<int> ids, string filedName, string value)
        {
            var result = new Result<List<TableColumnDto>>();
            List<string> listSql = new List<string>();
            foreach (var id in ids)
            {
                listSql.Add(string.Format("update Sys_TableColumn set {0}='{1}' where Id={2}", filedName, value, id));
            }
            result.flag = await _sqlService.ExecuteBatch(listSql);
            return result;
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="columns">列</param>
        /// <param name="condition">查询条件</param>
        /// <param name="orderBy">排序条件</param>
        /// <returns></returns>
        public async Task<Result<List<Dictionary<string, object>>>> GetData(int tableId, string columns, string condition, string orderBy)
        {
            var result = new Result<List<Dictionary<string, object>>>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            string sql = "select {0} from {1} where {2} order by {3}";
            var queryResult = await _sqlService.Query(string.Format(sql, columns, tableDto.Name, condition, orderBy));
            result.flag = queryResult.Count > 0;
            result.data = queryResult;
            return result;
        }

        /// <summary>
        /// 获取分页数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="columns">列</param>
        /// <param name="condition">查询条件</param>
        /// <param name="queryBase">基础查询对象</param>
        /// <returns></returns>
        public async Task<ResultDto<Dictionary<string, object>>> GetPageData(int tableId, string columns, string condition, QueryBase queryBase)
        {
            var result = new ResultDto<Dictionary<string, object>>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
                return result;
            if (tableResult.data.AllowView == 0)
                return result;

            var tableDto = tableResult.data;
            var orderBy = string.Empty;
            //默认排序条件
            if (tableDto.DefaultSort.IsNotEmpty())
                orderBy = tableDto.DefaultSort;
            if (queryBase.OrderBy.IsNotEmpty())
                orderBy = queryBase.OrderBy + " " + queryBase.OrderDir;
            if (tableDto.DefaultFilter.IsNotEmpty())
                condition += " and " + tableDto.DefaultFilter;
            string sql = "select {0} from {1} where {2} order by {3} offset {4} rows fetch next {5} rows only";
            var queryResult = await _sqlService.Query(string.Format(sql, columns, tableDto.Name, condition,
                orderBy, queryBase.Start, queryBase.Length));
            result.data = queryResult;
            result.recordsTotal = (await _sqlService.GetSingle(String.Format("select count(*) from {0} where {1}", tableDto.Name, condition))).ToInt32();
            return result;
        }

        /// <summary>
        /// 获取指定表下列名
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="condition">条件</param>
        /// <returns>多个列名逗号隔开</returns>
        public async Task<Result<string>> GetColumnNames(int tableId, string condition)
        {
            var result = new Result<String>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            var columnData = await _sqlService.Query($"select * from Sys_TableColumn where TableId={tableId} and {condition}");
            var columnNameStr = string.Empty;
            foreach (var dicList in columnData)
            {
                columnNameStr += dicList["Name"] + ",";
            }
            columnNameStr = columnNameStr.Trim(',');
            result.flag = columnData.Any();
            result.data = columnNameStr;
            return result;
        }

        /// <summary>
        /// 添加数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="addModel">数据键值对</param>
        /// <returns></returns>
        public async Task<Result<bool>> Add(int tableId, Dictionary<string, string> addModel)
        {
            var result = new Result<bool>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            if (tableResult.data.AllowAdd == 0)
            {
                result.msg = "不允许添加";
                return result;
            }
            var tableName = tableResult.data.Name;
            string sqlTpl = "insert into {0}({1}) values({2})";
            StringBuilder sbColumn = new StringBuilder();
            StringBuilder sbValue = new StringBuilder();
            foreach (var item in addModel)
            {
                sbColumn.Append(item.Key + ",");
                sbValue.AppendFormat("'{0}',", item.Value);
            }
            var executeResult = await _sqlService.Execute(string.Format(sqlTpl, tableName, sbColumn.ToString().Trim(','), sbValue.ToString().Trim(',')));
            result.flag = executeResult;
            result.data = executeResult;
            return result;
        }

        /// <summary>
        /// 更新数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="updateModel">数据键值对</param>
        /// <param name="id">数据主键Id</param>
        /// <returns></returns>
        public async Task<Result<bool>> Update(int tableId, Dictionary<string, string> updateModel, int id)
        {
            var result = new Result<bool>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            if (tableResult.data.AllowEdit == 0)
            {
                result.msg = "不允许编辑";
                return result;
            }
            var tableDto = tableResult.data;
            var tableName = tableDto.Name;
            var forbiddenUpdateFilter = tableDto.ForbiddenUpdateFilter ?? "1=1";
            string sqlTpl = "update {0} set {1} where {2} and {3}";
            StringBuilder sbValue = new StringBuilder();
            foreach (var item in updateModel)
            {
                sbValue.Append(string.Format("{0} = '{1}',", item.Key, item.Value, forbiddenUpdateFilter));
            }
            var executeResult = await _sqlService.Execute(string.Format(sqlTpl, tableName, sbValue.ToString().Trim(','), "Id=" + id, forbiddenUpdateFilter));
            result.flag = executeResult;
            result.data = executeResult;
            return result;
        }

        /// <summary>
        /// 删除多条数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="ids">要删除的id集合</param>
        /// <returns></returns>
        public async Task<Result<bool>> Delete(int tableId, List<int> ids)
        {
            var result = new Result<bool>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            if (tableResult.data.AllowDelete == 0)
            {
                result.msg = "不允许删除";
                return result;
            }
            var tableDto = tableResult.data;
            var tableName = tableDto.DeleteTableName;
            //禁止删除条件
            var forbiddenDeleteFilter = tableDto.ForbiddenDeleteFilter ?? "1=1";
            string sqlTpl = "delete from {0} where Id={1} and {2}";
            List<string> sqlList = new List<string>();
            foreach (var id in ids)
            {
                sqlList.Add(string.Format(sqlTpl, tableName, id, forbiddenDeleteFilter));
            }
            var flag = await _sqlService.ExecuteBatch(sqlList);
            result.flag = flag;
            result.data = flag;
            return result;
        }

        /// <summary>
        /// 根据外键Id获取对应值
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="colName">列名</param>
        /// <param name="outId">外键Id值</param>
        /// <returns></returns>
        public async Task<Result<string>> GetOutValue(int tableId, string columnName, string outId)
        {
            var result = new Result<String>();
            if (outId.IsEmpty())
            {
                result.data = "无";
                return result;
            }
            string outSql = await _sqlService.GetSingle(
                string.Format("select OutSql from Sys_TableColumn where TableId={0} and Name='{1}'", tableId, columnName));
            string[] outSqlArr = outSql.Split('|'); //Example: Id,Name|Sys_Department|ParentId=0
            var colNames = outSqlArr[0].Split(','); //value,text
            var tableName = outSqlArr[1];
            var condition = outSqlArr[2];
            var primarKey = colNames[0]; //作为下拉菜单value的列
            var textKey = colNames[1]; //作为下拉菜单的text的列
            var value = await _sqlService.GetSingle(string.Format("select {0} from {1} where {2}={3}", textKey, tableName, primarKey, outId));
            result.data = value.IsEmpty() ? "无" : value;
            result.flag = true;
            return result;

        }

        /// <summary>
        /// 根据外键值获取对应外键Id
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="colName">列名</param>
        /// <param name="outValue">外键值</param>
        /// <returns></returns>
        public async Task<Result<string>> GetOutValueId(int tableId, string columnName, string outValue)
        {
            var result = new Result<String>();
            if (outValue.IsEmpty())
            {
                return result;
            }
            string outSql = await _sqlService.GetSingle(
                string.Format("select OutSql from Sys_TableColumn where TableId={0} and Name='{1}'", tableId, columnName));
            string[] outSqlArr = outSql.Split('|'); //Example: Id,Name|Sys_Department|ParentId=0
            var colNames = outSqlArr[0].Split(','); //value,text
            var tableName = outSqlArr[1];
            var condition = outSqlArr[2];
            var primarKey = colNames[0]; //作为下拉菜单value的列
            var textKey = colNames[1]; //作为下拉菜单的text的列
            var value = await _sqlService.GetSingle(string.Format("select {0} from {1} where {2}='{3}'", primarKey, tableName, textKey, outValue));
            result.data = value;
            result.flag = true;
            return result;
        }

        /// <summary>
        /// 导入Excel数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="excelFilePath">Excel文件路径</param>
        /// <returns></returns>
        public async Task<Result<string>> ImportExcel(int tableId, IFormFile excelfile)
        {
            var result = new Result<string>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            if (tableDto.AllowImport != 1)
            {
                result.msg = "不允许导入";
                return result;
            }
            var colDtos = (await _tableColumnService.GetList(item => item.TableId == tableId && item.ImportVisible == 1)).data;
            if (!colDtos.Any())
            {
                result.msg = "无可导入的列";
                return result;
            }
            string webRootPath = WebHelper.WebRootPath;
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var uploadDateDir = Path.Combine(WebHelper.UploadDir, dateDir);
            var uploadPath = Path.Combine(webRootPath, uploadDateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            string fileName = $"{tableDto.Description + "_" + DateTime.Now.ToString("yyyyMMddhhmmss")}.xlsx";
            FileInfo file = new FileInfo(Path.Combine(uploadPath, fileName));

            using (FileStream fs = new FileStream(file.ToString(), FileMode.Create))
            {
                excelfile.CopyTo(fs);
                fs.Flush();
            }
            using (ExcelPackage package = new ExcelPackage(file))
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets[1];
                int rowCount = worksheet.Dimension.Rows;
                int ColCount = worksheet.Dimension.Columns;
                var colNames = new List<string>();
                var colValues = new List<List<string>>();
                var colValueCount = 0;
                // 遍历EXCEL文件
                for (int row = 1; row <= rowCount; row++)
                {
                    if (row != 1) //表头不添加到这个列值集合
                        colValues.Add(new List<string>());
                    for (int col = 1; col <= ColCount; col++)
                    {
                        //单元格为空时Value属性为Null
                        var colValue = worksheet.Cells[row, col].Value ?? "";
                        var value = colValue.ToString();
                        if (row == 1)  //第一行 为表头
                        {
                            if (colDtos.Where(c => c.Description == value).First() != null)
                                colNames.Add(value);
                            else
                            {
                                result.msg += value + "不存在,";
                            }
                        }
                        else
                        {
                            //如果为out类型 需要转换值为对应表的主键Id值
                            if (colDtos[col - 1].DataType == ColumnDataType.Out)
                            {
                                if (value.IsEmpty()) //out列 允许为空
                                    colValues[colValueCount].Add(value);
                                else
                                {
                                    var outValueId = (await GetOutValueId(tableId, colDtos[col - 1].Name, value)).data;
                                    if (outValueId.IsNotEmpty())
                                        colValues[colValueCount].Add(outValueId);
                                    else
                                    {
                                        result.msg += "第" + row + "行," + colDtos[col - 1].Description + ":" + value + " 错误,未查询到值，";
                                    }
                                }
                            }
                            else
                            {
                                colValues[colValueCount].Add(value);
                            }
                        }
                    }
                    if (row != 1)
                        colValueCount++;

                }
                if (result.msg.IsNotEmpty()) //如果有错误信息 不继续执行 返回错误信息
                    return result;
                //将excel中表头的中文列名 转换为对应的 英文列名
                var colCnAndEndNames = colDtos.ToDictionary(c => c.Description, c => c.Name);
                var engColNames = colNames.Select(c => colCnAndEndNames[c]).ToList();
                var listSql = new List<string>();
                if (tableDto.ImportType == TableImportType.插入)
                {
                    var insertColNames = string.Empty;
                    foreach (var colName in engColNames)
                    {
                        insertColNames += colName + ",";
                    }
                    insertColNames = insertColNames.Trim(',');
                    var sqlTpl = "insert into {0}({1},CreateDateTime) values({2},'{3}')";
                    //构造插入语句
                    for (int row = 0; row < colValues.Count(); row++)
                    {
                        var insertValues = string.Empty;
                        foreach (var colValue in colValues[row])
                        {
                            insertValues += $"'{colValue}',";
                        }
                        insertValues = insertValues.Trim(',');
                        listSql.Add(string.Format(sqlTpl, tableDto.Name, insertColNames, insertValues, DateTime.Now.ToString()));
                    }

                }
                else if (tableDto.ImportType == TableImportType.更新)
                {
                    string sqlTpl = "update {0} set {1} where {2}";
                    var primarKeyResult = await _tableColumnService.GetByExp(c => c.TableId == tableId && c.PrimarKey == 1);
                    if (primarKeyResult.data == null)
                    {
                        result.msg = "未找到主键";
                        return result;
                    }
                    var primarKey = primarKeyResult.data;
                    //构造更新语句
                    for (int row = 0; row < colValues.Count(); row++)
                    {
                        var updateValues = string.Empty;
                        var condition = string.Empty;
                        for (int i = 0; i < colValues[row].Count(); i++)
                        {
                            var colName = engColNames[i];
                            var colValue = colValues[row];
                            if (colName == primarKey.Name) //如果这一列为主键 要放到where条件后的
                            {
                                condition = $"{colName} = '{colValue[i]}'";
                                continue;
                            }
                            updateValues += $"{colName}='{colValue[i]}',";
                        }
                        updateValues = updateValues.Trim(',');
                        listSql.Add(string.Format(sqlTpl, tableDto.Name, updateValues, condition));
                    }
                }
                result.flag = await _sqlService.ExecuteBatch(listSql);
            }
            return result;
        }

        /// <summary>
        /// 导出数据为Excel
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <returns></returns>
        public async Task<Result<string>> ExportExcel(int tableId)
        {
            var result = new Result<string>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            if (tableDto.AllowExport != 1)
            {
                result.msg = "不允许导出";
                return result;
            }
            string webRootPath = WebHelper.WebRootPath;
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var uploadDateDir = Path.Combine(WebHelper.UploadDir, dateDir);
            var uploadPath = Path.Combine(webRootPath, uploadDateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            string fileName = $"{tableDto.Description + "_" + DateTime.Now.ToString("yyyyMMddhhmmss")}.xlsx";
            var fileUrl = Path.Combine("\\", uploadDateDir, fileName);

            string filePath = Path.Combine(uploadPath, fileName);
            FileInfo file = new FileInfo(filePath);
            var colDataType = new Dictionary<string, ColumnDataType>();
            using (ExcelPackage package = new ExcelPackage(file))
            {
                var colNames = string.Empty;
                // 添加worksheet
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("data");
                var colDtos = await _tableColumnService.GetList(item => item.TableId == tableId && item.ExportVisible == 1);
                int rowNum = 1;
                //添加表头
                for (int i = 1; i <= colDtos.data.Count; i++)
                {
                    var col = colDtos.data[i - 1];
                    colDataType.Add(col.Name, col.DataType);
                    worksheet.Cells[rowNum, i].Value = col.Description;
                    colNames += col.Name + ",";
                }
                rowNum++;
                colNames = colNames.Trim(',');
                var colNameArr = colNames.Split(',');
                var tableData = await GetData(tableId, colNames, "1=1", "Id");

                //遍历每一行数据
                for (int i = 1; i <= tableData.data.Count; i++)
                {
                    //遍历每一列
                    for (int j = 1; j <= tableData.data[i - 1].Count; j++)
                    {
                        var col = tableData.data[i - 1];
                        var colName = colNameArr[j - 1];
                        //如果为日期 修改excel单元格自定义格式
                        if (colDataType[colName] == ColumnDataType.Datetime2)
                        {
                            worksheet.Cells[rowNum, j].Style.Numberformat.Format = DateTimeFormatInfo.CurrentInfo.ShortDatePattern +
         " " + DateTimeFormatInfo.CurrentInfo.ShortTimePattern;
                            worksheet.Cells[rowNum, j].Value = col[colName];
                        }
                        //如果为OUT类型
                        else if (colDataType[colName] == ColumnDataType.Out)
                        {
                            var outValueResult = await GetOutValue(tableId, colName, col[colName].ToString());
                            worksheet.Cells[rowNum, j].Value = outValueResult.data;
                        }
                        //普通情况 包括Enum类型Enum直接保存的为Text value和text一样
                        else
                        {
                            worksheet.Cells[rowNum, j].Value = col[colName];
                        }
                    }
                    rowNum++;
                }
                //自动调整列宽
                worksheet.Cells.AutoFitColumns();
                package.Save();
            }
            result.data = fileUrl;
            result.flag = true;
            return result;
        }

        /// <summary>
        /// 下载导入模板
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <returns></returns>
        public async Task<Result<string>> DownloadImportTemplate(int tableId)
        {
            var result = new Result<string>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;

            string webRootPath = WebHelper.WebRootPath;
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var uploadDateDir = Path.Combine(WebHelper.UploadDir, dateDir);
            var uploadPath = Path.Combine(webRootPath, uploadDateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            string fileName = $"{tableDto.Description + "_导入模板" + DateTime.Now.ToString("yyyyMMddhhmmss")}.xlsx";
            var fileUrl = Path.Combine("\\", uploadDateDir, fileName);

            string filePath = Path.Combine(uploadPath, fileName);
            FileInfo file = new FileInfo(filePath);
            using (ExcelPackage package = new ExcelPackage(file))
            {
                var colNames = string.Empty;
                // 添加worksheet
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("data");
                var colDtos = await _tableColumnService.GetList(item => item.TableId == tableId && item.ImportVisible == 1);
                int rowNum = 1;
                //添加表头
                for (int i = 1; i <= colDtos.data.Count; i++)
                {
                    var col = colDtos.data[i - 1];
                    worksheet.Cells[rowNum, i].Value = col.Description;
                    colNames += col.Name + ",";
                }
                //自动调整列宽
                worksheet.Cells.AutoFitColumns();
                package.Save();
            }
            result.data = fileUrl;
            result.flag = true;
            return result;
        }
    }
}
