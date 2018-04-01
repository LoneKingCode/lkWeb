using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class UserLoginConfig : IEntityTypeConfiguration<IdentityUserLogin<int>>
    {
        public void Configure(EntityTypeBuilder<IdentityUserLogin<int>> builder)
        {
            builder.ToTable("Sys_UserLogin");
            builder.Property(item => item.LoginProvider).HasMaxLength(100);
            builder.Property(item => item.ProviderKey).HasMaxLength(100);
        }
    }
}
