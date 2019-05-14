using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_UserConfig : IEntityTypeConfiguration<Sys_UserEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_UserEntity> builder)
        {
            builder.ToTable("Sys_User");
        
        }
    }
}
