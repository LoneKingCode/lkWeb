using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class DepartmentConfig : IEntityTypeConfiguration<DepartmentEntity>
    {
        public void Configure(EntityTypeBuilder<DepartmentEntity> builder)
        {
            builder.ToTable("Sys_Department");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.Name).HasColumnType("varchar(20)").IsRequired();
            builder.Property(item => item.Leader).HasColumnType("varchar(20)").IsRequired();
            builder.Property(item => item.Description).HasColumnType("varchar(100)").IsRequired();
        }
    }
}
