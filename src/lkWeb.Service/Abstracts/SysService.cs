using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using lkWeb.Core.Extensions;
using lkWeb.Service.Enum;

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
                return result;
            var tableDto = tableResult.data;
            //此SQL语句可以查询制定表的所有列
            var tableData = await _sqlService.Query(string.Format("select * from v_TableInfo where tablename = '{0}'",
                tableDto.Name));
            var tableColumns = new List<TableColumnDto>();
            var delResult = await _tableColumnService.Delete(item => item.TableID == tableId);
            foreach (var row in tableData)
            {
                tableColumns.Add(new TableColumnDto
                {
                    Name = row["colName"].ToString(),
                    DataType = (ColumnDataType)System.Enum.Parse(typeof(ColumnDataType), row["colType"].ToString().InitialUpper()),
                    MaxLength = row["colLength"].ObjToInt(),
                    TableID = tableDto.Id,
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
                return result;
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
    }
}
