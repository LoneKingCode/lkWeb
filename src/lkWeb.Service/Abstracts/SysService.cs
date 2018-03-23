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
                    Name = row["tablename"].ToString(),
                    DataType = (ColumnDataType)System.Enum.Parse(typeof(ColumnDataType), row["colType"].ToString().InitialUpper()),
                    MaxLength = row["colLength"].ObjToInt(),
                    TableID = tableDto.Id,
                });
            }
            var addResult = await _tableColumnService.Add(tableColumns);
            return addResult;

        }
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
    }
}
