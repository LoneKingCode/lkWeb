using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
namespace lkWeb.Data.Config
{
    public class UserDepartmentConfig : IEntityTypeConfiguration<UserDepartmentEntity>
    {
        public void Configure(EntityTypeBuilder<UserDepartmentEntity> builder)
        {
            builder.ToTable("Sys_UserDepartment");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.HasOne(item => item.User).WithMany(item => item.UserDepartments).HasForeignKey(item => item.UserId);
            builder.HasOne(item => item.Department).WithMany(item => item.UserDepartments).HasForeignKey(item => item.DepartmentId);
            builder.Property(item => item.DepartmentId).IsRequired();
            builder.Property(item => item.UserId).IsRequired();
        }
    }
}
