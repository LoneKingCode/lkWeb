using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class Sys_InfoReleaseConfig : IEntityTypeConfiguration<Sys_InfoReleaseEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_InfoReleaseEntity> builder)
        {
            builder.ToTable("Sys_InfoRelease");
         

        }
    }
}
