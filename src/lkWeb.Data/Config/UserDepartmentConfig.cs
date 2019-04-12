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
         
        }
    }
}
