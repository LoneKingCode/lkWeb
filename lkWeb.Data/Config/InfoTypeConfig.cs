using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class InfoTypeConfig : IEntityTypeConfiguration<Sys_InfoTypeEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_InfoTypeEntity> builder)
        {
            builder.ToTable("Sys_InfoType");
         

        }
    }
}
