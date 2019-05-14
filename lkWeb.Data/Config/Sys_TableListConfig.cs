using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
   public  class Sys_TableListConfig : IEntityTypeConfiguration<Sys_TableListEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_TableListEntity> builder)
        {
            builder.ToTable("Sys_TableList");
     
        }
    }
}
