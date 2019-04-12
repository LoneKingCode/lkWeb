using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class UserRoleConfig : IEntityTypeConfiguration<UserRoleEntity>
    {
        public void Configure(EntityTypeBuilder<UserRoleEntity> builder)
        {
            builder.ToTable("Sys_UserRole");
         }
    }
}
