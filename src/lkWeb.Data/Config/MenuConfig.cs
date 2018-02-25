using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class MenuConfig : IEntityTypeConfiguration<MenuEntity>
    {
        public void Configure(EntityTypeBuilder<MenuEntity> builder)
        {
            builder.ToTable("Sys_Menu");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.Type).IsRequired();
            builder.Property(item => item.Name).HasColumnType("varchar(18)").IsRequired();
            builder.Property(item => item.Icon).HasColumnType("varchar(50)").IsRequired();
            builder.Property(item => item.Url).HasColumnType("varchar(300)").IsRequired();
        }
    }
}
