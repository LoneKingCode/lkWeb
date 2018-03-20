using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class SystemOptionConfig : IEntityTypeConfiguration<SystemOptionEntity>
    {
        public void Configure(EntityTypeBuilder<SystemOptionEntity> builder)
        {
            builder.ToTable("Sys_SystemOption");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.Code).HasColumnType("varchar(100)");
            builder.Property(item => item.Value).HasColumnType("varchar(1000)").IsRequired();

        }
    }
}
