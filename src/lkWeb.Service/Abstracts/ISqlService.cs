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
        lkWebContext GetDb();
        Task<bool> Execute(string sql);
        Task<DbDataReader> Query(string sql);
    }
}
