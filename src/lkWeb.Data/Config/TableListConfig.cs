using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
   public  class TableListConfig : IEntityTypeConfiguration<TableListEntity>
    {
        public void Configure(EntityTypeBuilder<TableListEntity> builder)
        {
            builder.ToTable("Sys_TableList");
     
        }
    }
}
