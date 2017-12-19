using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class OperationLog : IEntityTypeConfiguration<OperationLogEntity>
    {
        public void Configure(EntityTypeBuilder<OperationLogEntity> builder)
        {
            builder.ToTable("Sys_OperationLog");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.OperationUrl).HasColumnType("varchar(300)");
            builder.Property(item => item.OperationDesciption).HasColumnType("varchar(100)").IsRequired();
            builder.Property(item => item.ClientIP).HasColumnType("varchar(15)").IsRequired();
            builder.Property(item => item.ClientMac).HasColumnType("varchar(40)").IsRequired();
        }
    }
}
