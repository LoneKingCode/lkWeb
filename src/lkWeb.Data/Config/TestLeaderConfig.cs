using lkWeb.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Data.Config
{
    public class TestLeaderConfig : IEntityTypeConfiguration<TestLeaderEntity>
    {
        public void Configure(EntityTypeBuilder<TestLeaderEntity> builder)
        {
            builder.ToTable("Test_Leader");
            builder.HasKey(item => item.Id);
            builder.Property(item => item.Id).ValueGeneratedOnAdd();
            builder.Property(item => item.Name).HasColumnType("varchar(30)").IsRequired();
            builder.Property(item => item.Type).HasColumnType("varchar(30)").IsRequired();
        }
    }
}
