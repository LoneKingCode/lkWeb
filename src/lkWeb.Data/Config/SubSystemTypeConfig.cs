using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class SubSystemTypeConfig : IEntityTypeConfiguration<Sys_SubSystemTypeEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_SubSystemTypeEntity> builder)
        {
            builder.ToTable("Sys_SubSystemType");
         
        }
    }
}
