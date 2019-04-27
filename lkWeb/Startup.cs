using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using AutoMapper;
using lkWeb.Service;
using lkWeb.Data;
using Microsoft.EntityFrameworkCore;
using lkWeb.Service.Abstracts;
using Microsoft.AspNetCore.Routing;
using Microsoft.AspNetCore.Http;
using lkWeb.Entity;
using NLog.Extensions.Logging;
using NLog.Web;
using Hangfire;
using lkWeb.Filter;
using lkWeb.Core.Extension;
using lkWeb.Core.Helper;

namespace lkWeb
{
    public class Startup
    {
        private MapperConfiguration _mapperConfiguration { get; set; }

        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();
            Configuration = builder.Build();
            _mapperConfiguration = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new AutoMapperConfiguration());
            });
        }

        public IConfigurationRoot Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //lkWebContext.connectionString = Configuration.GetConnectionString("lkWebConn");
            //lkWebContext.connectionString = ConfigurationHelper.getConnStr();
            services.AddDbContextPool<lkWebContext>(options => options.UseSqlServer(lkWebContext.connectionString));
            services.AddSession(config =>
            {
                config.Cookie.Name = "lkWeb.Session";
                config.IdleTimeout = TimeSpan.FromMinutes(15);
            });

            //Add Hangfire
            services.AddHangfire(x => x.UseSqlServerStorage(lkWebContext.connectionString));

            // Add framework services.
            services.AddMvc(option => option.Filters.Add<HttpGlobalExceptionFilter>())
                .AddJsonOptions(
                opt => opt.SerializerSettings.DateFormatString = "yyyy/M/d hh:mm:ss"
                );

            services.AddAuthentication();

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            // Add application services. For instance:
            services.AddScoped<ISys_UserService, Sys_UserService>();
            services.AddScoped<ISys_RoleService, Sys_RoleService>();
            services.AddScoped<ISys_UserRoleService, Sys_UserRoleService>();
            services.AddScoped<ISys_MenuService, Sys_MenuService>();
            services.AddScoped<ISys_RoleMenuService, Sys_RoleMenuService>();
            services.AddScoped<ISys_DepartmentService, Sys_DepartmentService>();
            services.AddScoped<ISys_UserDepartmentService, Sys_UserDepartmentService>();
            services.AddScoped<ISys_LoginLogService, Sys_LoginLogService>();
            services.AddScoped<ISys_OperationLogService, Sys_OperationLogService>();
            services.AddScoped<ISys_TableListService, Sys_TableListService>();
            services.AddScoped<ISys_TableColumnService, Sys_TableColumnService>();
            services.AddScoped<ISys_SubSystemService, Sys_SubSystemService>();
            services.AddScoped<ISys_SubSystemTypeService, Sys_SubSystemTypeService>();
            services.AddScoped<ISys_SystemOptionService, Sys_SystemOptionService>();
            services.AddScoped<ISys_ValueListService, Sys_ValueListService>();
            services.AddScoped<ISys_InfoReleaseService, Sys_InfoReleaseService>();
            services.AddScoped<ISys_InfoTypeService, Sys_InfoTypeService>();

            services.AddScoped<ISqlService, SqlService>();
            services.AddScoped<ISysService, SysService>();



            services.ConfigureApplicationCookie(options =>
            {
                // Cookie settings
                options.Cookie.HttpOnly = true;
                options.Cookie.Expiration = TimeSpan.FromDays(7);
                options.LoginPath = "/admin/user/login"; // If the LoginPath is not set here, ASP.NET Core will default to /Account/Login
                options.LogoutPath = "/admin/user/logout"; // If the LogoutPath is not set here, ASP.NET Core will default to /Account/Logout
                options.AccessDeniedPath = "/admin/control/AccessDenied"; // If the AccessDeniedPath is not set here, ASP.NET Core will default to /Account/AccessDenied
                options.SlidingExpiration = true;
            });

            //automapper
            services.AddSingleton(sp => _mapperConfiguration.CreateMapper());
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory, IServiceProvider svp)
        {
            var accessor = app.ApplicationServices.GetRequiredService<IHttpContextAccessor>();

            WebHelper._httpContextAccessor = accessor;
            WebHelper._hostingEnvironment = app.ApplicationServices.GetRequiredService<IHostingEnvironment>();
            ServiceLocator.Instance = app.ApplicationServices;

            app.UseStaticFiles();//使用静态文件

            app.UseSession();

            loggerFactory.AddConsole(Configuration.GetSection("Logging"));

            loggerFactory.AddDebug();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Admin/Control/Error");
            }



            app.UseMvc(routes =>
            {
                routes.MapRoute(
                  name: "Admin",
                  template: "{area:exists}/{controller=Control}/{action=Index}/{id?}/{extraValue?}");
                routes.MapRoute(
                    name: "default",
                      template: "{area=Front}/{controller=Home}/{action=ChooseSystem}/{id?}/{extraValue?}");

            });

            loggerFactory.AddNLog();//添加NLog

            env.ConfigureNLog("nlog.config");//读取Nlog配置文件

            //使用hangfire
            var jobOptions = new BackgroundJobServerOptions
            {
                Queues = new[] { "Job" },//队列名称，只能为小写
                WorkerCount = Environment.ProcessorCount * 5, //并发任务数
                ServerName = "lkJob",//服务器名称
            };
            app.UseHangfireServer(jobOptions);
            var options = new DashboardOptions
            {
                Authorization = new[] { new HangfireAuthorizationFilter() }
            };
            app.UseHangfireDashboard("/jobs", options);

        }
    }
}
