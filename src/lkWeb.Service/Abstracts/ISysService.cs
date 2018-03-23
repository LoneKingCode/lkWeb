using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public interface ISysService
    {
        /// <summary>
        /// 生成列
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <returns></returns>
        Task<Result<List<TableColumnDto>>> GenerateColumn(int tableId);
        Task<Result<List<TableColumnDto>>> SetColumnValue(List<int> ids, string filedName, string value);
    }
}
