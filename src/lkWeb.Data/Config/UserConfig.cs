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
            builder.Property(item => item.NormalizedEmail).HasMaxLength(100);
            builder.Property(item => item.NormalizedUserName).HasMaxLength(100);
        }
    }
}
