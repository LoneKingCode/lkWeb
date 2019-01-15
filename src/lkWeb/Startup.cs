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
using Microsoft.AspNetCore.Identity;
using lkWeb.Entity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Authorization;
using NLog.Extensions.Logging;
using NLog.Web;
using Hangfire;
using lkWeb.Filter;
using lkWeb.Core.Extensions;
using lkWeb.Service.Util;

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
            services.AddMvc().AddJsonOptions(
                opt => opt.SerializerSettings.DateFormatString = "yyyy/M/d hh:mm:ss"
                );

            services.AddAuthentication();

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            // Add application services. For instance:
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IRoleService, RoleService>();
            services.AddScoped<IMenuService, MenuService>();
            services.AddScoped<IRoleMenuService, RoleMenuService>();
            services.AddScoped<IDepartmentService, DepartmentService>();
            services.AddScoped<IUserDepartmentService, UserDepartmentService>();
            services.AddScoped<ILoginLogService, LoginLogService>();
            services.AddScoped<IOperationLogService, OperationLogService>();
            services.AddScoped<IModuleService, ModuleService>();
            services.AddScoped<ITableListService, TableListService>();
            services.AddScoped<ITableColumnService, TableColumnService>();
            services.AddScoped<ISystemOptionService, SystemOptionService>();
            services.AddScoped<ISqlService, SqlService>();
            services.AddScoped<ISysService, SysService>();


            services.AddIdentity<UserEntity, RoleEntity>()
                .AddEntityFrameworkStores<lkWebContext>()
                .AddDefaultTokenProviders();

            services.Configure<IdentityOptions>(options =>
            {
                // Password settings
                options.Password.RequireDigit = true;
                options.Password.RequiredLength = 5;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireUppercase = false;
                options.Password.RequireLowercase = false;
                options.Password.RequiredUniqueChars = 6;

                // Lockout settings
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(30);
                options.Lockout.MaxFailedAccessAttempts = 10;
                options.Lockout.AllowedForNewUsers = true;

                // User settings
                options.User.RequireUniqueEmail = true;
            });

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

            app.UseAuthentication(); //使用Identity

            app.UseSession();

            loggerFactory.AddConsole(Configuration.GetSection("Logging"));

            loggerFactory.AddDebug();

            // 异常处理中间件
           // app.UseMiddleware(typeof(ExceptionHandlerMiddleWare));

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Admin/Control/Error");
            }

            app.UseStaticFiles();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                  name: "Admin",
                  template: "{area:exists}/{controller=Control}/{action=Index}/{id?}/{value?}");
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
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
            //初始数据库数据
            //SeedData.Initialize(app.ApplicationServices);
        }
    }
}
