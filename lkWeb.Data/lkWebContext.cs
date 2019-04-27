using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Text;
using lkWeb.Core.Extension;
using lkWeb.Data.Config;
using lkWeb.Core.Helper;

namespace lkWeb.Data
{
    public class lkWebContext : DbContext
    {
 
        public static string connectionString = ConfigurationHelper.getConnStr();
        public DbSet<Sys_LoginLogEntity> LoginLog { get; set; }
        public DbSet<Sys_MenuEntity> Menu { get; set; }
        public DbSet<Sys_RoleMenuEntity> RoleMenu { get; set; }
        public DbSet<Sys_OperationLogEntity> OperationLog { get; set; }
        public DbSet<Sys_RoleEntity> Role { get; set; }
        public DbSet<Sys_UserEntity> User { get; set; }
        public DbSet<Sys_UserRoleEntity> UserRole { get; set; }
        public lkWebContext(DbContextOptions<lkWebContext> options) : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //设置实体和数据库中表的关系
            modelBuilder.ApplyConfiguration(new LoginLogConfig());
            modelBuilder.ApplyConfiguration(new MenuConfig());
            modelBuilder.ApplyConfiguration(new OperationLog());
            modelBuilder.ApplyConfiguration(new RoleConfig());
            modelBuilder.ApplyConfiguration(new RoleMenuConfig());
            modelBuilder.ApplyConfiguration(new UserConfig());
            modelBuilder.ApplyConfiguration(new UserRoleConfig());
            modelBuilder.ApplyConfiguration(new DepartmentConfig());
            modelBuilder.ApplyConfiguration(new UserDepartmentConfig());
            modelBuilder.ApplyConfiguration(new TableListConfig());
            modelBuilder.ApplyConfiguration(new TableColumnConfig());
            modelBuilder.ApplyConfiguration(new SystemOptionConfig());
            modelBuilder.ApplyConfiguration(new SubSystemConfig());
            modelBuilder.ApplyConfiguration(new SubSystemTypeConfig());
            modelBuilder.ApplyConfiguration(new SysValueListConfig());
            modelBuilder.ApplyConfiguration(new InfoTypeConfig());
            modelBuilder.ApplyConfiguration(new InfoReleaseConfig());
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

