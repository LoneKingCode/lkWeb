using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using lkWeb.Core.Extensions;
using lkWeb.Service.Enum;
using System.Linq;

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
            string sql = "select {0} from {1} where {2} orderby {3}";
            var queryResult = await _sqlService.Query(string.Format(sql, columns, tableDto.Name, condition, orderBy));
            result.flag = true;
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
        public async Task<Result<List<Dictionary<string, object>>>> GetPageData(int tableId, string columns, string condition, QueryBase queryBase)
        {
            var result = new Result<List<Dictionary<string, object>>>();
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
                return result;
            var tableDto = tableResult.data;
            var oderBy = queryBase.OrderBy ?? "Id";
            string sql = "select {0} from {1} where {2} order by {3} offset {4} rows fetch next {5} rows only";
            var queryResult = await _sqlService.Query(string.Format(sql, columns, tableDto.Name, condition,
                oderBy + " " + queryBase.OrderDir, queryBase.Start, queryBase.Length));
            result.flag = true;
            result.data = queryResult;
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
            var columnData = await _sqlService.Query(string.Format("select * from Sys_TableColumn where TableId={0} and {1}", tableId, condition));
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
        /// <returns></returns>
        public async Task<Result<bool>> Update(int tableId, Dictionary<string, string> updateModel)
        {

            return null;
        }

    }
}
