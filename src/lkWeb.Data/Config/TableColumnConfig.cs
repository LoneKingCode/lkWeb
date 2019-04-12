using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class TableColumnConfig : IEntityTypeConfiguration<TableColumnEntity>
    {
        public void Configure(EntityTypeBuilder<TableColumnEntity> builder)
        {
            builder.ToTable("Sys_TableColumn");
     
        }
    }
}
