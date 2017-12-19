using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class UserRoleConfig : IEntityTypeConfiguration<UserRoleEntity>
    {
        public void Configure(EntityTypeBuilder<UserRoleEntity> builder)
        {
            builder.ToTable("Sys_UserRole");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.HasOne(item => item.User).WithMany(item => item.UserRoles).HasForeignKey(item => item.UserId);
            builder.HasOne(item => item.Role).WithMany(item => item.UserRoles).HasForeignKey(item => item.RoleId);
            builder.Property(item => item.UserId).IsRequired();
            builder.Property(item => item.RoleId).IsRequired();
        }
    }
}
