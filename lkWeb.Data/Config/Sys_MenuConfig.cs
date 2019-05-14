using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_MenuConfig : IEntityTypeConfiguration<Sys_MenuEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_MenuEntity> builder)
        {
            builder.ToTable("Sys_Menu");
      
        }
    }
}
