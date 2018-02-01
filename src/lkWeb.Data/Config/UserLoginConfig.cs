using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class UserLoginConfig : IEntityTypeConfiguration<UserLoginEntity>
    {
        public void Configure(EntityTypeBuilder<UserLoginEntity> builder)
        {
            builder.ToTable("Sys_UserLogin");
        }
    }
}
