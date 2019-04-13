using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class SubSystemConfig : IEntityTypeConfiguration<Sys_SubSystemEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_SubSystemEntity> builder)
        {
            builder.ToTable("Sys_SubSystem");
         
        }
    }
}
