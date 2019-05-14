using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_LoginLogConfig : IEntityTypeConfiguration<Sys_LoginLogEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_LoginLogEntity> builder)
        {
            builder.ToTable("Sys_LoginLog");
  

        }
    }
}
