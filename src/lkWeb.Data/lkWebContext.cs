using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using lkWeb.Data.Config;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using System.Text;
using lkWeb.Core.Extensions;

namespace lkWeb.Data
{
    public class lkWebContext : IdentityDbContext<UserEntity, RoleEntity, int>
    {
        //数据库连接串 在StartUp.cs中为其赋值
        public static string connectionString = ConfigurationHelper.getConnStr();
        public DbSet<LoginLogEntity> LoginLogs { get; set; }
        public DbSet<MenuEntity> Menus { get; set; }
        public DbSet<RoleMenuEntity> RoleMenus { get; set; }
        public DbSet<OperationLogEntity> OperationLogs { get; set; }
        public DbSet<ModuleEntity> Modules { get; set; }
        //public DbSet<RoleEntity> Roles { get; set; }  asp.net core identity里已经有
        //public DbSet<UserEntity> Users { get; set; }
        //public DbSet<UserRoleEntity> UserRoles { get; set; }
        public lkWebContext(DbContextOptions<lkWebContext> options) : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new LoginLogConfig());
            modelBuilder.ApplyConfiguration(new MenuConfig());
            modelBuilder.ApplyConfiguration(new OperationLog());
            modelBuilder.ApplyConfiguration(new RoleConfig());
            modelBuilder.ApplyConfiguration(new RoleMenuConfig());
            modelBuilder.ApplyConfiguration(new UserConfig());
            modelBuilder.ApplyConfiguration(new UserRoleConfig());
            modelBuilder.ApplyConfiguration(new DepartmentConfig());
            modelBuilder.ApplyConfiguration(new UserDepartmentConfig());
            modelBuilder.ApplyConfiguration(new UserLoginConfig());
            modelBuilder.ApplyConfiguration(new UserTokenConfig());
            modelBuilder.ApplyConfiguration(new RoleClaimConfig());
            modelBuilder.ApplyConfiguration(new UserClaimConfig());
            modelBuilder.ApplyConfiguration(new ModuleConfig());
            modelBuilder.ApplyConfiguration(new TableListConfig());
            modelBuilder.ApplyConfiguration(new TableColumnConfig());
            modelBuilder.ApplyConfiguration(new SystemOptionConfig());

            modelBuilder.ApplyConfiguration(new TestLeaderConfig());

        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                LoggerHelper.Logger.Error(ex);
                return 0;

                //Add your code to inspect the inner exception and/or
                //e.Entries here.
                //Or just use the debugger.
                //Added this catch (after the comments below) to make it more obvious
                //how this code might help this specific problem
                //throw;
            }
            catch (Exception ex)
            {
                LoggerHelper.Logger.Error(ex);
                return 0;
                //throw;
            }
        }

    }



}

