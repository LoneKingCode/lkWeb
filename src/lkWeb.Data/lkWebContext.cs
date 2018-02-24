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

namespace lkWeb.Data
{
    public class lkWebContext : IdentityDbContext<UserEntity, RoleEntity, int>
    {
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
        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (Exception ex)
            {
                //var sb = new StringBuilder();
                //foreach (var error in ex.EntityValidationErrors)
                //{
                //    foreach (var item in error.ValidationErrors)
                //    {
                //        sb.AppendLine(item.PropertyName + ": " + item.ErrorMessage);
                //    }
                //}
                //Logger.Error("SaveChanges.DbEntityValidation", ex.GetAllMessages() + sb);
                throw;
            }
        }

    }



}

