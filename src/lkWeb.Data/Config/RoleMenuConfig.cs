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
         
        }
    }
}
