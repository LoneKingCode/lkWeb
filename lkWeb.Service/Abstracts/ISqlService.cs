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
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        Task<int> Execute(string sql);
        /// <summary>
        /// ExecuteScalar
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        Task<string> ExecuteScalar(string sql);
        /// <summary>
        /// 批量执行数据库语句
        /// </summary>
        /// <param name="listSql">SQL语句集合</param>
        /// <returns></returns>
        Task<int> ExecuteBatch(List<string> listSql);
        /// <summary>
        /// 获取第一行第一列值
        /// </summary>
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        Task<string> GetSingle(string sql);
        /// <summary>
        /// 查询数据库语句
        /// </summary>
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        Task<List<Dictionary<string, object>>> Query(string sql);
    }
}
