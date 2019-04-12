using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class ModuleConfig : IEntityTypeConfiguration<ModuleEntity>
    {
        public void Configure(EntityTypeBuilder<ModuleEntity> builder)
        {
            builder.ToTable("Sys_Module");
   
        }
    }
}
