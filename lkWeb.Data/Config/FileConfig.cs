using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace lkWeb.Data.Config
{
    public class FileConfig : IEntityTypeConfiguration<Sys_FileEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_FileEntity> builder)
        {
            builder.ToTable("Sys_File");
         
        }
    }
}
