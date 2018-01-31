using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class UserConfig : IEntityTypeConfiguration<UserEntity>
    {
        public void Configure(EntityTypeBuilder<UserEntity> builder)
        {
            builder.ToTable("Sys_User");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.UserName).HasColumnType("varchar(20)").IsRequired();
            builder.Property(item => item.RealName).HasColumnType("varchar(20)").IsRequired() ;
            builder.Property(item => item.Email).HasColumnType("varchar(35)").IsRequired();
            builder.Property(item => item.Password).HasColumnType("varchar(35)").IsRequired();
            builder.Property(item => item.Status).IsRequired();
        }
    }
}
