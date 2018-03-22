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
        public async Task<bool> GenerateColumn(int tableId)
        {
            var tableResult = await _tableListService.GetById(tableId);
            if (!tableResult.flag)
                return false;
            var tableDto = tableResult.data;
            //此SQL语句可以查询制定表的所有列
            var tableData = await _sqlService.Query(string.Format("select * from v_TableInfo where tablename = '{0}'",
                tableDto.Name));
            var tableColumns = new List<TableColumnDto>();
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
            return addResult.flag;

        }
    }
}
