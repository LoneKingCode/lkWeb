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
        //数据库连接串 在StartUp.cs中为其赋值
        public static string connectionString = ConfigurationHelper.getConnStr();
        public DbSet<LoginLogEntity> LoginLog { get; set; }
        public DbSet<MenuEntity> Menu { get; set; }
        public DbSet<RoleMenuEntity> RoleMenu { get; set; }
        public DbSet<OperationLogEntity> OperationLog { get; set; }
        public DbSet<ModuleEntity> Module { get; set; }
        public DbSet<RoleEntity> Role { get; set; }
        public DbSet<UserEntity> User { get; set; }
        public DbSet<UserRoleEntity> UserRole { get; set; }
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

