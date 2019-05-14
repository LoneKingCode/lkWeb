using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class Sys_UserRoleConfig : IEntityTypeConfiguration<Sys_UserRoleEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_UserRoleEntity> builder)
        {
            builder.ToTable("Sys_UserRole");
         }
    }
}
