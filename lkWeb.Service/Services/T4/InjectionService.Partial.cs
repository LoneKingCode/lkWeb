using Microsoft.Extensions.DependencyInjection;

namespace lkWeb.Service.Services
{
    public static partial class InjectionService
{       

        
     public static void Injection_Auto()
       {

		  			            services.AddScoped<ISys_DepartmentService, Sys_DepartmentService>();

			            services.AddScoped<ISys_FileService, Sys_FileService>();

			            services.AddScoped<ISys_InfoReleaseService, Sys_InfoReleaseService>();

			            services.AddScoped<ISys_InfoTypeService, Sys_InfoTypeService>();

			            services.AddScoped<ISys_LoginLogService, Sys_LoginLogService>();

			            services.AddScoped<ISys_MenuService, Sys_MenuService>();

			            services.AddScoped<ISys_OperationLogService, Sys_OperationLogService>();

			            services.AddScoped<ISys_RoleService, Sys_RoleService>();

			            services.AddScoped<ISys_RoleMenuService, Sys_RoleMenuService>();

			            services.AddScoped<ISys_SubSystemService, Sys_SubSystemService>();

			            services.AddScoped<ISys_SubSystemTypeService, Sys_SubSystemTypeService>();

			            services.AddScoped<ISys_SystemOptionService, Sys_SystemOptionService>();

			            services.AddScoped<ISys_TableColumnService, Sys_TableColumnService>();

			            services.AddScoped<ISys_TableListService, Sys_TableListService>();

			            services.AddScoped<ISys_UserDepartmentService, Sys_UserDepartmentService>();

			            services.AddScoped<ISys_UserService, Sys_UserService>();

			            services.AddScoped<ISys_UserRoleService, Sys_UserRoleService>();

			            services.AddScoped<ISys_ValueListService, Sys_ValueListService>();


        }
}
}

