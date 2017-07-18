using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using lkWeb.Data;

namespace lkWeb.Migrations
{
    [DbContext(typeof(lkWebContext))]
    [Migration("20170626143300_lkMigration")]
    partial class lkMigration
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
            modelBuilder
                .HasAnnotation("ProductVersion", "1.1.2")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("lkWeb.Entity.LoginLogEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClientIP");

                    b.Property<string>("ClientMac");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<bool>("IsDeleted");

                    b.Property<string>("LoginName");

                    b.Property<int>("Modifier");

                    b.Property<string>("UserId");

                    b.HasKey("Id");

                    b.ToTable("LoginLogs");
                });

            modelBuilder.Entity("lkWeb.Entity.MenuEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<bool>("IsDeleted");

                    b.Property<int>("Modifier");

                    b.Property<string>("Name");

                    b.Property<int>("Order");

                    b.Property<int>("ParentId");

                    b.Property<byte>("Type");

                    b.Property<string>("Url");

                    b.HasKey("Id");

                    b.ToTable("Menus");
                });

            modelBuilder.Entity("lkWeb.Entity.OperationLogEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClientIP");

                    b.Property<string>("ClientMac");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<bool>("IsDeleted");

                    b.Property<int>("Modifier");

                    b.Property<string>("OperationDesciption");

                    b.Property<string>("OperationUrl");

                    b.Property<string>("UserId");

                    b.HasKey("Id");

                    b.ToTable("OperationLogs");
                });

            modelBuilder.Entity("lkWeb.Entity.RoleEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<string>("Description");

                    b.Property<bool>("IsDeleted");

                    b.Property<int>("Modifier");

                    b.Property<string>("Name");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("lkWeb.Entity.RoleMenuEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<bool>("IsDeleted");

                    b.Property<int>("MenuId");

                    b.Property<int>("Modifier");

                    b.Property<int>("RoleId");

                    b.HasKey("Id");

                    b.ToTable("RoleMenus");
                });

            modelBuilder.Entity("lkWeb.Entity.UserEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<string>("Email");

                    b.Property<bool>("IsDeleted");

                    b.Property<string>("LoginName");

                    b.Property<int>("Modifier");

                    b.Property<string>("Password");

                    b.Property<string>("RealName");

                    b.Property<byte>("Status");

                    b.HasKey("Id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("lkWeb.Entity.UserRoleEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("Creator");

                    b.Property<bool>("IsDeleted");

                    b.Property<int>("Modifier");

                    b.Property<int>("RoleId");

                    b.Property<int>("UserId");

                    b.HasKey("Id");

                    b.ToTable("UserRoles");
                });
        }
    }
}
