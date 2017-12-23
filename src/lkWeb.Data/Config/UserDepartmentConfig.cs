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
            builder.HasOne(item => item.User).WithMany(item => item.UserDepartments).HasForeignKey(item => item.UserID);
            builder.HasOne(item => item.Department).WithMany(item => item.UserDepartments).HasForeignKey(item => item.DepartmentID);
            builder.Property(item => item.DepartmentID).IsRequired();
            builder.Property(item => item.UserID).IsRequired();
        }
    }
}
