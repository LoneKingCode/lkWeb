﻿using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using lkWeb.Core.Extension;
using lkWeb.Service.Enum;
using System.Linq;
using System.IO;
using OfficeOpenXml;
using System.Globalization;
using Microsoft.AspNetCore.Http;
using lkWeb.Core.Helper;

namespace lkWeb.Service.Abstracts
{
    /// <summary>
    /// 外部Sql Model
    /// </summary>
    public class OutSqlModel
    {
        /// <summary>
        /// OutSqlModel
        /// </summary>
        /// <param name="outSql">例如Id,Name|Sys_Activity|id>0|1|Sys_DeptActivity|DeptId,ActivityId (主键,显示列名|表名|条件|是否保存到它表|保存表名,当前表外键名,Out表外键名)</param>
        public OutSqlModel(string outSql)
        {
            string[] outSqlArr = outSql.Split('|');
            var colNames = outSqlArr[0].Split(',');
            TableName = outSqlArr[1];
            PrimaryKey = colNames[0]; //作为下拉菜单value的列
            TextKey = colNames[1]; //作为下拉菜单的text的列
            if (outSqlArr.Length <= 2)
                Condition = "1=1";
            else
            {
                Condition = outSqlArr[2];
                IsSave = outSqlArr[3] == "1";
                if (IsSave)
                {
                    SaveTableName = outSqlArr[4];
                    CurrentTableForeignKey = outSqlArr[5];
                    OutTableForeignKey = outSqlArr[6];
                }
            }
        }
        /// <summary>
        /// 外部表名
        /// </summary>
        public string TableName { get; set; }
        /// <summary>
        /// 查询条件
        /// </summary>
        public string Condition { get; set; }
        /// <summary>
        /// 外部表主键
        /// </summary>
        public string PrimaryKey { get; set; }
        /// <summary>
        /// 外部表显示文本列
        /// </summary>
        public string TextKey { get; set; }
        /// <summary>
        /// 是否保存到它表
        /// </summary>
        public bool IsSave { get; set; }
        /// <summary>
        /// 保存表名
        /// </summary>
        public string SaveTableName { get; set; }
        /// <summary>
        /// 当前表外键名
        /// </summary>
        public string CurrentTableForeignKey { get; set; }
        /// <summary>
        /// 外部表外键名
        /// </summary>
        public string OutTableForeignKey { get; set; }
    }

    public class SysService : ISysService
    {
        public readonly ISqlService _sqlService;
        public readonly ISys_TableListService _tableListService;
        public readonly ISys_TableColumnService _tableColumnService;
        /// <summary>
        /// 当前用户Id
        /// </summary>
        public static string currentUserId;

        public SysService(ISqlService sqlService,
            ISys_TableListService tableListService,
            ISys_TableColumnService tableColumnService)
        {
            _sqlService = sqlService;
            _tableListService = tableListService;
            _tableColumnService = tableColumnService;
        }
        /// <summary>
        /// 生成列
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="isSync">是否同步生成</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableColumnDto>>> GenerateColumn(int tableId, bool isSync = false)
        {
            var result = new Result<List<Sys_TableColumnDto>>();
            var tableResult = await _tableListService.GetByIdAsync(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            //此SQL语句可以查询制定表的所有列
            var tableData = await _sqlService.Query(string.Format("select tablename,colName,colType,colLength from v_TableInfo where tablename = '{0}'",
                tableDto.Name));
            var tableColumns = new List<Sys_TableColumnDto>();
            var tableColumnDtos = (await _tableColumnService.GetListAsync(item => item.TableId == tableId)).data;
            var columnNames = new List<string>();
            if (!isSync) //如果非同步生成 删除之前的列数据
                await _tableColumnService.DeleteAsync(item => item.TableId == tableId);
            if (tableData.Count <= 0)
            {
                result.msg = $"获取表{tableDto.Name}中的列数据失败，可能表不存在，请检查";
                return result;
            }

            foreach (var row in tableData)
            {
                columnNames.Add(row["colName"].ToString());
                var dataType = ColumnType.String;
                var columnType = row["colType"].ToString().ToLower();
                if (columnType.Contains("char"))
                    dataType = ColumnType.String;
                else if (columnType.Contains("int") || columnType.Contains("bit"))
                    dataType = ColumnType.Int;
                else if (columnType.Contains("float") | columnType.Contains("decimal"))
                    dataType = ColumnType.Decimal;
                else if (columnType.Contains("datetime"))
                    dataType = ColumnType.Datetime;
                else if (columnType.Contains("date"))
                    dataType = ColumnType.Date;
                //如果同步生成
                if (isSync)
                {
                    //判断之前是否已存在此列 存在则不添加
                    var exist = tableColumnDtos.Where(item => item.TableId == tableId && item.Name == row["colName"].ToString()).Count() > 0;
                    if (!exist)
                    {
                        tableColumns.Add(new Sys_TableColumnDto
                        {
                            Name = row["colName"].ToString(),
                            DataType = dataType,
                            MaxLength = row["colLength"].ObjToInt(),
                            TableId = tableDto.Id,
                        });
                    }
                }
                else
                {
                    tableColumns.Add(new Sys_TableColumnDto
                    {
                        Name = row["colName"].ToString(),
                        DataType = dataType,
                        MaxLength = row["colLength"].ObjToInt(),
                        TableId = tableDto.Id,
                    });
                }
            }
            var addResult = await _tableColumnService.AddAsync(tableColumns);
            //有时同步列 如果列数据没变化 count就为0
            addResult.flag = (tableColumns.Count == 0 && isSync) || addResult.flag;
            if (isSync)
            {
                addResult.msg = $"同步成功，新增{tableColumns.Count}条列数据";
                //删除已经不需要的列
                var deleteColumnDtos = (await _tableColumnService.DeleteAsync(item => item.TableId == tableId && !columnNames.Contains(item.Name))).data;
            }

            return addResult;

        }

        /// <summary>
        /// 设置列属性值
        /// </summary>
        /// <param name="ids">TableColumn中id</param>
        /// <param name="fieldName"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableColumnDto>>> SetColumnValue(List<int> ids, string fieldName, string value)
        {
            var result = new Result<List<Sys_TableColumnDto>>();
            List<string> listSql = new List<string>();
            foreach (var id in ids)
            {
                listSql.Add(string.Format("update Sys_TableColumn set {0}='{1}' where Id={2}", fieldName, value, id));
            }
            var execResult = await _sqlService.ExecuteBatch(listSql);
            result.flag = execResult == listSql.Count();
            result.msg = "影响数据条数" + execResult;
            return result;
        }
        /// <summary>
        /// 设置列属性值
        /// </summary>
        /// <param name="tableId">tableId</param>
        /// <param name="ids">ids</param>
        /// <param name="fieldName">字段名</param>
        /// <param name="value">值</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableColumnDto>>> BatchOperation(int tableId, List<int> ids, string fieldName, string value)
        {
            var result = new Result<List<Sys_TableColumnDto>>();
            var tableResult = await _tableListService.GetByIdAsync(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;

            List<string> listSql = new List<string>();
            foreach (var id in ids)
            {
                listSql.Add(string.Format("update {0} set {1}='{2}' where Id={3}", tableDto.Name, fieldName, value, id));
            }
            var execResult = await _sqlService.ExecuteBatch(listSql);
            result.flag = execResult == listSql.Count();
            result.msg = "影响数据条数" + execResult;
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
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
        /// <param name="orderBy">排序条件</param>
        /// <returns>多个列名逗号隔开</returns>
        public async Task<Result<string>> GetColumnNames(int tableId, string condition, string orderBy)
        {
            var result = new Result<String>();
            var tableResult = await _tableListService.GetByIdAsync(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;
            var columnData = await _sqlService.Query($"select * from Sys_TableColumn where TableId={tableId} and {condition} order By {orderBy}");
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
        public async Task<Result<string>> Add(int tableId, Dictionary<string, string> addModel)
        {
            var result = new Result<string>();
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
            string sqlTpl = "insert into {0}({1}) values({2}) Select SCOPE_IDENTITY()";
            StringBuilder sbColumn = new StringBuilder();
            StringBuilder sbValue = new StringBuilder();
            foreach (var item in addModel)
            {
                sbColumn.Append(item.Key + ",");
                sbValue.AppendFormat("'{0}',", item.Value);
            }
            //返回新增数据的自增列值
            var execResult = await _sqlService.ExecuteScalar(string.Format(sqlTpl, tableName, sbColumn.ToString().Trim(','), sbValue.ToString().Trim(',')));
            result.flag = execResult.IsNotEmpty();
            result.msg = "操作成功";
            result.data = execResult;
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
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
            var forbiddenUpdateFilter = "1=1";
            if (!string.IsNullOrEmpty(tableDto.ForbiddenUpdateFilter))
                forbiddenUpdateFilter = tableDto.ForbiddenUpdateFilter.Replace("{UserId}", currentUserId);
            string sqlTpl = "update {0} set {1} where {2} and {3}";
            StringBuilder sbValue = new StringBuilder();
            foreach (var item in updateModel)
            {
                sbValue.Append(string.Format("{0} = '{1}',", item.Key, item.Value, forbiddenUpdateFilter));
            }
            var execResult = await _sqlService.Execute(string.Format(sqlTpl, tableName, sbValue.ToString().Trim(','), "Id=" + id, forbiddenUpdateFilter));
            result.flag = execResult == 1;
            result.msg = "影响数据条数" + execResult;
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
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
            var forbiddenDeleteFilter = "1=1";
            if (!string.IsNullOrEmpty(tableDto.ForbiddenDeleteFilter))
                forbiddenDeleteFilter = tableDto.ForbiddenDeleteFilter.Replace("{UserId}", currentUserId);
            string sqlTpl = "delete from {0} where Id={1} and {2}";
            List<string> sqlList = new List<string>();
            foreach (var id in ids)
            {
                sqlList.Add(string.Format(sqlTpl, tableName, id, forbiddenDeleteFilter));
            }
            var execResult = await _sqlService.ExecuteBatch(sqlList);
            result.flag = execResult == sqlList.Count();
            result.msg = "影响数据条数" + execResult;
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
            var outSqlModel = new OutSqlModel(outSql);
            var value = await _sqlService.GetSingle(string.Format("select {0} from {1} where {2}={3}",
                outSqlModel.TextKey, outSqlModel.TableName, outSqlModel.PrimaryKey, outId));
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
            var outSqlModel = new OutSqlModel(outSql);
            var value = await _sqlService.GetSingle(string.Format("select {0} from {1} where {2}='{3}'",
                outSqlModel.PrimaryKey, outSqlModel.TableName, outSqlModel.TextKey, outValue));
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
        public async Task<Result<string>> ImportExcel(int tableId, IFormFile formFile)
        {
            var result = new Result<string>();
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
            var colDtos = (await _tableColumnService.GetListAsync(item => item.TableId == tableId && item.ImportVisible == 1)).data;
            if (!colDtos.Any())
            {
                result.msg = "无可导入的列";
                return result;
            }
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var tempPath = Path.Combine(WebHelper.UploadPath, WebHelper.TempDir);
            var uploadPath = Path.Combine(tempPath, dateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            string fileName = $"{tableDto.Description + "_" + DateTime.Now.ToString("yyyyMMddhhmmss")}.xlsx";
            FileInfo file = new FileInfo(Path.Combine(uploadPath, fileName));

            using (FileStream fs = new FileStream(file.ToString(), FileMode.Create))
            {
                formFile.CopyTo(fs);
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
                var excelCols = new List<string>();
                //检测必填字段在表头中是否包含
                for (int col = 1; col <= ColCount; col++)
                {
                    var colValue = worksheet.Cells[1, col].Value == null ? "" : worksheet.Cells[1, col].Value.ToString();
                    excelCols.Add(colValue);
                    //检测表头是不是已存在的表中的那些列
                    if (colDtos.Where(c => c.Description == colValue).Count() > 0)
                        colNames.Add(colValue);
                    else
                    {
                        result.msg += "列\"" + colValue + "\"在表中不存在,";
                    }
                }
                var exceptList = colDtos.Where(c => !excelCols.Contains(c.Description) && c.Required == 1).Select(c => c.Description).ToList();
                if (exceptList.Count() > 0)
                {
                    result.msg += "excel中必须包含\"" + string.Join(',', exceptList) + "\"且有值,";
                }
                if (result.msg.IsNotEmpty())
                    return result;
                // 遍历EXCEL文件
                for (int row = 1; row <= rowCount; row++)
                {
                    if (row != 1) //表头不添加到这个列值集合
                    {
                        colValues.Add(new List<string>());
                    }
                    for (int col = 1; col <= ColCount; col++)
                    {
                        var currentColDto = colDtos[col - 1];
                        //单元格为空时Value属性为Null
                        var colValue = worksheet.Cells[row, col].Value == null ? "" : worksheet.Cells[row, col].Value.ToString();
                        if (row == 1)  //第一行 为表头
                        {
                            continue;
                        }
                        else
                        {
                            //如果为out类型 需要转换值为对应表的主键Id值
                            if (currentColDto.DataType == ColumnType.Out)
                            {
                                if (colValue.IsEmpty()) //out列 允许为空
                                    colValues[colValueCount].Add(colValue);
                                else
                                {
                                    var outValueId = (await GetOutValueId(tableId, currentColDto.Name, colValue)).data;
                                    if (outValueId.IsNotEmpty())
                                        colValues[colValueCount].Add(outValueId);
                                    else
                                    {
                                        result.msg += "第" + row + "行," + currentColDto.Description + ":" + colValue + " 错误,未查询到值，";
                                    }
                                }
                            }
                            else if (currentColDto.PrimaryKey == 1)
                            {
                                var exist = (await _sqlService.GetSingle($"select count(*) from {tableDto.Name} where {currentColDto.Name} = '{colValue}'")).ToString();
                                if (tableDto.ImportType == TableImportType.插入)
                                {
                                    if (exist != "0")
                                        result.msg += $"第{row}行,{currentColDto.Description}:{colValue} 错误，该字段为主键，值已存在,";
                                }
                                else if (tableDto.ImportType == TableImportType.更新)
                                {
                                    if (exist == "0")
                                        result.msg += $"第{row}行,{currentColDto.Description}:{colValue} 错误，该字段为主键，值不存在,";
                                }
                                colValues[colValueCount].Add(colValue);
                            }
                            else
                            {
                                colValues[colValueCount].Add(colValue);
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
                    var primaryKeyResult = await _tableColumnService.GetListAsync(c => c.TableId == tableId && c.PrimaryKey == 1);
                    if (primaryKeyResult.data == null)
                    {
                        result.msg = "请设置主键，因为导入类型为更新";
                        return result;
                    }
                    var primaryKey = primaryKeyResult.data.Select(c => c.Name).ToList();
                    //构造更新语句
                    for (int row = 0; row < colValues.Count(); row++)
                    {
                        var updateValues = string.Empty;
                        var condition = string.Empty;
                        for (int i = 0; i < colValues[row].Count(); i++)
                        {
                            var colName = engColNames[i];
                            var colValue = colValues[row];
                            if (primaryKey.Contains(colName)) //如果这一列为主键 要放到where条件后的
                            {
                                condition += $"{colName} = '{colValue[i]}' and ";
                                continue;
                            }
                            updateValues += $"{colName}='{colValue[i]}',";

                        }
                        condition = condition.Trim();
                        condition = condition.Substring(0, condition.Length - 3);
                        updateValues = updateValues.Trim(',');
                        listSql.Add(string.Format(sqlTpl, tableDto.Name, updateValues, condition));
                    }
                }
                else
                {
                    result.msg += "请在表管理中设置导入类型,";
                }
                var execResult = await _sqlService.ExecuteBatch(listSql);
                result.flag = execResult == listSql.Count();
                result.msg = "影响数据条数" + execResult;
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
            var tableResult = await _tableListService.GetByIdAsync(tableId);
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
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var tempPath = Path.Combine(WebHelper.UploadPath, WebHelper.TempDir);
            var uploadPath = Path.Combine(tempPath, dateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            string fileName = $"{tableDto.Description + "_" + DateTime.Now.ToString("yyyyMMddhhmmss")}.xlsx";
            var fileUrl = Path.Combine("\\", Path.Combine(WebHelper.UploadDir, WebHelper.TempDir, dateDir), fileName);

            string filePath = Path.Combine(uploadPath, fileName);
            FileInfo file = new FileInfo(filePath);
            var colDataType = new Dictionary<string, string>();
            using (ExcelPackage package = new ExcelPackage(file))
            {
                var colNames = string.Empty;
                // 添加worksheet
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("data");
                var colDtos = await _tableColumnService.GetListAsync(item => item.TableId == tableId && item.ExportVisible == 1);
                if (colDtos.data.Count() < 1)
                {
                    result.msg += "导出可见的列数量为" + colDtos.data.Count();
                    return result;
                }
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
                        if (colDataType[colName] == ColumnType.Datetime || colDataType[colName] == ColumnType.Date)
                        {
                            worksheet.Cells[rowNum, j].Style.Numberformat.Format = DateTimeFormatInfo.CurrentInfo.ShortDatePattern +
         " " + DateTimeFormatInfo.CurrentInfo.ShortTimePattern;
                            worksheet.Cells[rowNum, j].Value = col[colName];
                        }
                        //如果为OUT类型
                        else if (colDataType[colName] == ColumnType.Out)
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
            var tableResult = await _tableListService.GetByIdAsync(tableId);
            if (!tableResult.flag)
            {
                result.msg = "未找到指定表";
                return result;
            }
            var tableDto = tableResult.data;

            string webRootPath = WebHelper.WebRootPath;
            var dateDir = Path.Combine(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MMdd"));
            var tempPath = Path.Combine(WebHelper.UploadPath, WebHelper.TempDir);
            var uploadPath = Path.Combine(tempPath, dateDir);
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            string fileName = $"{tableDto.Description + "_导入模板" + DateTime.Now.ToString("yyyyMMddhhmmss")}.xlsx";
            var fileUrl = Path.Combine("\\", Path.Combine(WebHelper.UploadDir, WebHelper.TempDir, dateDir), fileName);

            string filePath = Path.Combine(uploadPath, fileName);
            FileInfo file = new FileInfo(filePath);
            using (ExcelPackage package = new ExcelPackage(file))
            {
                var colNames = string.Empty;
                // 添加worksheet
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("data");
                var colDtos = await _tableColumnService.GetListAsync(item => item.TableId == tableId && item.ImportVisible == 1);
                if (colDtos.data.Count() < 1)
                {
                    result.msg += "导入可见的列数量为" + colDtos.data.Count();
                    return result;
                }
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

        /// <summary>
        /// 获取out数据(列表)
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>


        public async Task<List<Dictionary<string, object>>> GetOutData(OutSqlModel model)
        {
            string sql = "select {0} from {1} where {2}";
            var result = await _sqlService.Query(string.Format(sql,
                        model.PrimaryKey + "," + model.TextKey, model.TableName, model.Condition));
            return result;
        }
    }
}
