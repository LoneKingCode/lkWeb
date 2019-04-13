using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class OperationLog : IEntityTypeConfiguration<Sys_OperationLogEntity>
    {
        public void Configure(EntityTypeBuilder<Sys_OperationLogEntity> builder)
        {
            builder.ToTable("Sys_OperationLog");
           
        }
    }
}
