using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
namespace lkWeb.Data.Config
{
    public class Sys_UserDepartmentConfig : IEntityTypeConfiguration<Sys_UserDepartmentEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_UserDepartmentEntity> builder)
        {
            builder.ToTable("Sys_UserDepartment");
         
        }
    }
}
