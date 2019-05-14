using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_ValueListConfig : IEntityTypeConfiguration<Sys_ValueListEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_ValueListEntity> builder)
        {
            builder.ToTable("Sys_ValueList");
         

        }
    }
}
