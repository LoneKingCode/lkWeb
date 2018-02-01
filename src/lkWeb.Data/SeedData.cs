using lkWeb.Entity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace lkWeb.Data
{
    /// <summary>
    /// 数据库初始化数据
    /// </summary>
    public static class SeedData
    {
        public static void Initialize(IServiceProvider app)
        {
            var db = app.GetRequiredService<lkWebContext>();
            //如果已经有数据就直接返回
            if (db.Users.Any())
            {
                return;
            }
            //添加User初始数据
          //  db.Users.Add(new UserEntity { UserName = "admin", Password = "admin", Email = "admin@admin.com", Status = 2, RealName = "管理员" });
            db.SaveChanges();

        }
    }
}
