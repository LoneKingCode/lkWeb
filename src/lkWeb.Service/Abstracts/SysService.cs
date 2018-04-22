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
            var executeResult = await _sqlService.Execute(string.Format(sqlTpl, tableName, sbValue.ToString().Trim(','), "Id=" + id));
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
        /// 获取Out类型列对应值
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="colName">列名</param>
        /// <param name="outValue">值</param>
        /// <returns></returns>
        public async Task<Result<string>> GetOutValue(int tableId, string columnName, string outValue)
        {
            var result = new Result<String>();
            string outSql = await _sqlService.GetSingle(
                string.Format("select OutSql from Sys_TableColumn where TableId={0} and Name='{1}'", tableId, columnName));
            var outSqlData = outSql.Split(','); //Example: Name,Sys_Department,ParentId=0
            var outColName = outSqlData[0];
            var outTableName = outSqlData[1];
            result.data = await _sqlService.GetSingle(string.Format("select {0} from {1} where Id={2}", outColName, outTableName, outValue));
            result.flag = true;
            return result;

        }

        /// <summary>
        /// 导入Excel数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="excelFilePath">Excel文件路径</param>
        /// <returns></returns>
        public async Task<Result<bool>> ImportExcel(int tableId, string excelFilePath)
        {
            throw new NotImplementedException();
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
                //添加表头
                var colDtos = await _tableColumnService.GetList(item => item.ExportVisible == 1);
                int rowNum = 1;
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
                        if (colDataType[colName] == ColumnDataType.Datetime2)
                        {
                            worksheet.Cells[rowNum, j].Style.Numberformat.Format = DateTimeFormatInfo.CurrentInfo.ShortDatePattern +
                                " " + DateTimeFormatInfo.CurrentInfo.ShortTimePattern;
                        }
                        worksheet.Cells[rowNum, j].Value = col[colName];
                    }
                    rowNum++;
                }
                package.Save();
            }

            result.data = fileUrl;
            result.flag = true;
            return result;
        }
    }
}
