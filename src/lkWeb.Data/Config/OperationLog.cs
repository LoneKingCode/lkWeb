using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class OperationLog : IEntityTypeConfiguration<OperationLogEntity>
    {
        public void Configure(EntityTypeBuilder<OperationLogEntity> builder)
        {
            builder.ToTable("Sys_OperationLog");
           
        }
    }
}
