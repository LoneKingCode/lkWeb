using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_TableColumnConfig : IEntityTypeConfiguration<Sys_TableColumnEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_TableColumnEntity> builder)
        {
            builder.ToTable("Sys_TableColumn");
     
        }
    }
}
