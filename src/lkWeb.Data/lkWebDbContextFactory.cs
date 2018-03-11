using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data
{
    public class lkWebDbContextFactory : IDesignTimeDbContextFactory<lkWebContext>
    {
        public lkWebContext CreateDbContext(string[] args)
        {
            string connectionString = "Password=hacker5402;Persist Security Info=True;User ID=sa;Initial Catalog=lkWeb;Data Source=.";

            var builder = new DbContextOptionsBuilder<lkWebContext>();
            //IConfigurationRoot configuration = new ConfigurationBuilder()
            //  .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
            //  .AddJsonFile("appsettings.json")
            //  .Build();

            builder.UseSqlServer(connectionString);
            return new lkWebContext(builder.Options);
        }
    }
}
