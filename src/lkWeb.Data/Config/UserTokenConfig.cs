using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class UserTokenConfig : IEntityTypeConfiguration<IdentityUserToken<int>>
    {
        public void Configure(EntityTypeBuilder<IdentityUserToken<int>> builder)
        {
            builder.ToTable("Sys_UserToken");
            builder.Property(item => item.LoginProvider).HasMaxLength(100);
            builder.Property(item => item.Name).HasMaxLength(100);
        }
    }
}
