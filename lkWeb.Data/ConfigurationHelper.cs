using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace lkWeb.Data
{
    public static class ConfigurationHelper
    {
        public static IConfiguration Configuration { get; set; }
        static ConfigurationHelper()
        {
            var baseDir = AppContext.BaseDirectory;

            var configFilePath = baseDir + Path.DirectorySeparatorChar + "lkWeb" + Path.DirectorySeparatorChar + "appsettings.json";
            //ReloadOnChange = true 当appsettings.json被修改时重新加载
            Configuration = new ConfigurationBuilder()
            .Add(new JsonConfigurationSource { Path = "appsettings.json", ReloadOnChange = true })
            .Build();
        }
        /// <summary>
        /// 获取数据库连接串
        /// </summary>
        /// <param name="key">key</param>
        /// <returns></returns>
        public static string getConnStr(string key = "lkWebConn")
        {
            return Configuration.GetConnectionString(key);
        }
        /// <summary>
        /// 获取配置
        /// </summary>
        /// <param name="key"> 一级:"key",二级 "Appsettings:key"</param>
        /// <returns></returns>
        public static string get(string key)
        {
            return Configuration[key];
        }
    }
}
