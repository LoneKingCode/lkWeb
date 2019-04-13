using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class SystemOptionConfig : IEntityTypeConfiguration<Sys_SystemOptionEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_SystemOptionEntity> builder)
        {
            builder.ToTable("Sys_SystemOption");
         

        }
    }
}
