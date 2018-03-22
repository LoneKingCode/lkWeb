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
        Task<bool> GenerateColumn(int tableId);
    }
}
