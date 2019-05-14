using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_DepartmentConfig : IEntityTypeConfiguration<Sys_DepartmentEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_DepartmentEntity> builder)
        {
            builder.ToTable("Sys_Department");
     
        }
    }
}
