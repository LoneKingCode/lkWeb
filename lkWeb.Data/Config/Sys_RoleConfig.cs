using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class Sys_RoleConfig : IEntityTypeConfiguration<Sys_RoleEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_RoleEntity> builder)
        {
            builder.ToTable("Sys_Role");
         
        }
    }
}
