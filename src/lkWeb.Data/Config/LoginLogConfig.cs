using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class LoginLogConfig : IEntityTypeConfiguration<LoginLogEntity>
    {
        public void Configure(EntityTypeBuilder<LoginLogEntity> builder)
        {
            builder.ToTable("Sys_LoginLog");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.UserId).IsRequired();
            builder.Property(item => item.UserName).HasColumnType("varchar(20)").IsRequired();
            builder.Property(item => item.ClientIP).HasColumnType("varchar(15)");
            builder.Property(item => item.ClientMac).HasColumnType("varchar(40)");
        }
    }
}
