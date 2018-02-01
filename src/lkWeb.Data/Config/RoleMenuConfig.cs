using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class RoleMenuConfig : IEntityTypeConfiguration<RoleMenuEntity>
    {
        public void Configure(EntityTypeBuilder<RoleMenuEntity> builder)
        {
            builder.ToTable("Sys_RoleMenu");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
          builder.HasOne(item => item.Role).WithMany(item => item.RoleMenus).HasForeignKey(item => item.RoleId);
            builder.Property(item => item.RoleId).IsRequired();
            builder.Property(item => item.MenuId).IsRequired();
        }
    }
}
