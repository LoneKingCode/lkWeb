﻿using lkWeb.Core.Helper;
using lkWeb.Data;
using lkWeb.Service.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service
{
    public static class SqlService
    {
        /// <summary>
        /// 获取DbContex对象
        /// </summary>
        /// <returns></returns>
        public static lkWebContext GetDb()
        {
            return ServiceLocator.lkWebContext();
        }

        /// <summary>
        /// 执行数据库语句
        /// </summary>
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        public static async Task<int> Execute(string sql)
        {
            int result = 0;
            using (var db = GetDb())
            {
                using (var tran = await db.Database.BeginTransactionAsync())
                {
                    try
                    {
                        result = await db.Database.ExecuteSqlCommandAsync(sql);

                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        LoggerHelper.Logger.Error("执行数据库语句出错\n 语句:" + sql + "\n 错误原因:" + ex.Message + "\n 堆栈跟踪:" + ex.StackTrace);
                        tran.Rollback();
                        result = -1;
                    }
                }
                return result;
            }
        }



        /// <summary>
        /// 批量执行数据库语句
        /// </summary>
        /// <param name="listSql">SQL语句集合</param>
        /// <returns></returns>
        public static async Task<int> ExecuteBatch(List<string> listSql)
        {
            int result = 0;
            using (var db = GetDb())
            {
                using (var tran = await db.Database.BeginTransactionAsync())
                {
                    try
                    {
                        var sqls = string.Empty;
                        foreach (var sql in listSql)
                        {
                            //result += await db.Database.ExecuteSqlCommandAsync(sql);
                            sqls += sql;
                        }
                        result = await db.Database.ExecuteSqlCommandAsync(sqls);
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        LoggerHelper.Logger.Error("执行数据库语句出错\n 语句:" + string.Join(",", listSql) + "\n 错误原因:" + ex.Message + "\n 堆栈跟踪:" + ex.StackTrace);

                        tran.Rollback();
                        result = -1;
                    }
                }
                return result;
            }
        }
        /// <summary>
        /// ExecuteScalar
        /// </summary>
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        public static async Task<string> ExecuteScalar(string sql)
        {
            var conn = GetDb().Database.GetDbConnection();
            try
            {
                await conn.OpenAsync();
                using (var command = conn.CreateCommand())
                {
                    string query = sql;
                    command.CommandText = query;
                    return (await command.ExecuteScalarAsync()).ToString();
                }
            }
            catch (Exception ex)
            {
                LoggerHelper.Logger.Error("执行数据库语句出错\n 语句:" + sql + "\n 错误原因:" + ex.Message + "\n 堆栈跟踪:" + ex.StackTrace);

                return string.Empty;
            }
            finally
            {
                conn.Close();
            }
        }


        /// <summary>
        /// 查询数据库语句
        /// </summary>
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        public static async Task<List<Dictionary<string, object>>> Query(string sql)
        {
            var results = new List<Dictionary<string, object>>();
            var conn = GetDb().Database.GetDbConnection();
            try
            {
                await conn.OpenAsync();
                using (var command = conn.CreateCommand())
                {
                    string query = sql;
                    command.CommandText = query;
                    DbDataReader reader = await command.ExecuteReaderAsync();
                    
                    while (reader.Read())
                    {
                        results.Add(Enumerable.Range(0, reader.FieldCount).ToDictionary(reader.GetName, reader.GetValue));
                    }
                    reader.Dispose();
                    return results;

                }
            }
            catch (Exception ex)
            {
                LoggerHelper.Logger.Error("执行数据库语句出错\n 语句:" + sql + "\n 错误原因:" + ex.Message + "\n 堆栈跟踪:" + ex.StackTrace);
                return results;
            }
            finally
            {
                conn.Close();
            }
        }

        /// <summary>
        /// 获取第一行第一列值
        /// </summary>
        /// <param name="sql">SQL语句</param>
        /// <returns></returns>
        public static async Task<string> GetSingle(string sql)
        {
            var queryResult = await Query(sql);
            try
            {
                if (queryResult.Any()) //如果有查询数据 返回第一行第一列数据
                {
                    return queryResult.First().First().Value.ToString();
                }
                else
                {
                    return string.Empty;
                }
            }
            catch (Exception ex)
            {
                LoggerHelper.Logger.Error("执行数据库语句出错\n 语句:" + sql + "\n 错误原因:" + ex.Message + "\n 堆栈跟踪:" + ex.StackTrace);
            }
            return string.Empty;
           
        }

    }
}
