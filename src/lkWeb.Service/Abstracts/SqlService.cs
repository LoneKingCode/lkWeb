using lkWeb.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public class SqlService : ISqlService
    {
        static DbContextOptions<lkWebContext> dbContextOption = new DbContextOptions<lkWebContext>();
        static DbContextOptionsBuilder<lkWebContext> dbContextOptionBuilder = new DbContextOptionsBuilder<lkWebContext>(dbContextOption);
        public lkWebContext GetDb()
        {
            return new lkWebContext(dbContextOptionBuilder.UseSqlServer(lkWebContext.connectionString).Options);

        }
        public async Task<bool> Execute(string sql)
        {
            return await GetDb().Database.ExecuteSqlCommandAsync(sql) > 0;
        }

        public async Task<DbDataReader> Query(string sql)
        {
            var conn = GetDb().Database.GetDbConnection();
            try
            {
                await conn.OpenAsync();
                using (var command = conn.CreateCommand())
                {
                    string query = sql;
                    command.CommandText = query;
                    DbDataReader reader = await command.ExecuteReaderAsync();
                    var a = reader["Id"];
                    return reader;
                    //   reader.Dispose();
                }
            }
            finally
            {
                conn.Close();
            }
        }

    }
}
