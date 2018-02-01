using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class RoleClaimConfig : IEntityTypeConfiguration<RoleClaimEntity>
    {
        public void Configure(EntityTypeBuilder<RoleClaimEntity> builder)
        {
            builder.ToTable("Sys_RoleClaim");
        }
    }
}
