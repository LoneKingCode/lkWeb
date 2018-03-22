using lkWeb.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public interface ISqlService
    {
        /// <summary>
        /// 获取DbContex对象
        /// </summary>
        /// <returns></returns>
        lkWebContext GetDb();
        /// <summary>
        /// 执行数据库语句
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        Task<bool> Execute(string sql);
        /// <summary>
        /// 查询数据库语句
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        Task<List<Dictionary<string, object>>> Query(string sql);
    }
}
