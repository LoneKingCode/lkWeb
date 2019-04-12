using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class LoginLogConfig : IEntityTypeConfiguration<LoginLogEntity>
    {
        public void Configure(EntityTypeBuilder<LoginLogEntity> builder)
        {
            builder.ToTable("Sys_LoginLog");
  

        }
    }
}
