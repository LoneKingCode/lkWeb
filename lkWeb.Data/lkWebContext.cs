using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using System;
using lkWeb.Data.Config;

namespace lkWeb.Data
{
    public class lkWebContext : DbContext
    {

        public static string connectionString = "";
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
            modelBuilder.ApplyConfiguration(new Sys_LoginLogConfig());
            modelBuilder.ApplyConfiguration(new Sys_MenuConfig());
            modelBuilder.ApplyConfiguration(new Sys_OperationLog());
            modelBuilder.ApplyConfiguration(new Sys_RoleConfig());
            modelBuilder.ApplyConfiguration(new Sys_RoleMenuConfig());
            modelBuilder.ApplyConfiguration(new Sys_UserConfig());
            modelBuilder.ApplyConfiguration(new Sys_UserRoleConfig());
            modelBuilder.ApplyConfiguration(new Sys_DepartmentConfig());
            modelBuilder.ApplyConfiguration(new Sys_UserDepartmentConfig());
            modelBuilder.ApplyConfiguration(new Sys_TableListConfig());
            modelBuilder.ApplyConfiguration(new Sys_TableColumnConfig());
            modelBuilder.ApplyConfiguration(new Sys_SystemOptionConfig());
            modelBuilder.ApplyConfiguration(new Sys_SubSystemConfig());
            modelBuilder.ApplyConfiguration(new Sys_SubSystemTypeConfig());
            modelBuilder.ApplyConfiguration(new Sys_ValueListConfig());
            modelBuilder.ApplyConfiguration(new Sys_InfoTypeConfig());
            modelBuilder.ApplyConfiguration(new Sys_InfoReleaseConfig());
            modelBuilder.ApplyConfiguration(new Sys_FileConfig());

        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbUpdateException ex)
            {
               // LoggerHelper.Logger.Error(ex);
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
                //LoggerHelper.Logger.Error(ex);
                return 0;
                //throw;
            }
        }

    }



}

