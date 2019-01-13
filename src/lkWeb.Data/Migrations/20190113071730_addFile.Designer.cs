﻿// <auto-generated />
using lkWeb.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.EntityFrameworkCore.Storage.Internal;
using System;

namespace lkWeb.Data.Migrations
{
    [DbContext(typeof(lkWebContext))]
    [Migration("20190113071730_addFile")]
    partial class addFile
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.0.3-rtm-10026")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("lkWeb.Entity.DepartmentEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("varchar(100)");

                    b.Property<string>("Leader")
                        .IsRequired()
                        .HasColumnType("varchar(20)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(20)");

                    b.Property<int>("ParentId");

                    b.HasKey("Id");

                    b.ToTable("Sys_Department");
                });

            modelBuilder.Entity("lkWeb.Entity.LoginLogEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClientIP")
                        .HasColumnType("varchar(15)");

                    b.Property<string>("ClientMac")
                        .HasColumnType("varchar(40)");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("Description")
                        .HasColumnType("varchar(40)");

                    b.Property<int>("UserId");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .HasColumnType("varchar(20)");

                    b.HasKey("Id");

                    b.ToTable("Sys_LoginLog");
                });

            modelBuilder.Entity("lkWeb.Entity.MenuEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("Icon")
                        .IsRequired()
                        .HasColumnType("varchar(50)");

                    b.Property<int>("ListOrder");

                    b.Property<int>("ModuleId");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(18)");

                    b.Property<int>("ParentId");

                    b.Property<byte>("Type");

                    b.Property<string>("Url")
                        .IsRequired()
                        .HasColumnType("varchar(300)");

                    b.HasKey("Id");

                    b.ToTable("Sys_Menu");
                });

            modelBuilder.Entity("lkWeb.Entity.ModuleEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("varchar(30)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(18)");

                    b.HasKey("Id");

                    b.ToTable("Sys_Module");
                });

            modelBuilder.Entity("lkWeb.Entity.OperationLogEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClientIP")
                        .IsRequired()
                        .HasColumnType("varchar(15)");

                    b.Property<string>("ClientMac")
                        .IsRequired()
                        .HasColumnType("varchar(40)");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("OperationDescription")
                        .IsRequired()
                        .HasColumnType("varchar(100)");

                    b.Property<string>("OperationUrl")
                        .HasColumnType("varchar(300)");

                    b.Property<int>("UserId");

                    b.Property<string>("UserName");

                    b.HasKey("Id");

                    b.ToTable("Sys_OperationLog");
                });

            modelBuilder.Entity("lkWeb.Entity.RoleEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken();

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("varchar(30)");

                    b.Property<string>("Name")
                        .HasMaxLength(256);

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(100);

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasName("RoleNameIndex")
                        .HasFilter("[NormalizedName] IS NOT NULL");

                    b.ToTable("Sys_Role");
                });

            modelBuilder.Entity("lkWeb.Entity.RoleMenuEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("MenuId");

                    b.Property<int>("RoleId");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("Sys_RoleMenu");
                });

            modelBuilder.Entity("lkWeb.Entity.SystemOptionEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Code")
                        .HasColumnType("varchar(100)");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("Value")
                        .IsRequired()
                        .HasColumnType("varchar(1000)");

                    b.HasKey("Id");

                    b.ToTable("Sys_SystemOption");
                });

            modelBuilder.Entity("lkWeb.Entity.TableColumnEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<byte>("AddVisible");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<byte>("DataType");

                    b.Property<string>("Description");

                    b.Property<int>("EditOrder");

                    b.Property<byte>("EditVisible");

                    b.Property<string>("EnumRange");

                    b.Property<byte>("ExportVisible");

                    b.Property<string>("ForbiddenFileExtension");

                    b.Property<byte>("ImportVisible");

                    b.Property<int>("ListOrder");

                    b.Property<byte>("ListVisible");

                    b.Property<int>("MaxLength");

                    b.Property<string>("Name");

                    b.Property<string>("OutSql");

                    b.Property<byte>("PrimarKey");

                    b.Property<byte>("Required");

                    b.Property<byte>("SearchVisible");

                    b.Property<string>("SelectRange");

                    b.Property<int>("TableId");

                    b.Property<int>("ViewOrder");

                    b.Property<byte>("ViewVisible");

                    b.HasKey("Id");

                    b.HasIndex("TableId");

                    b.ToTable("Sys_TableColumn");
                });

            modelBuilder.Entity("lkWeb.Entity.TableListEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<byte>("AllowAdd");

                    b.Property<byte>("AllowDelete");

                    b.Property<byte>("AllowEdit");

                    b.Property<byte>("AllowExport");

                    b.Property<byte>("AllowImport");

                    b.Property<byte>("AllowView");

                    b.Property<int>("ColumnPerRow");

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("DefaultFilter");

                    b.Property<string>("DefaultSort");

                    b.Property<string>("DeleteTableName");

                    b.Property<string>("Description");

                    b.Property<string>("ExtendFunction");

                    b.Property<string>("ForbiddenAddFilter");

                    b.Property<string>("ForbiddenDeleteFilter");

                    b.Property<string>("ForbiddenUpdateFilter");

                    b.Property<byte>("ImportType");

                    b.Property<byte>("IsView");

                    b.Property<string>("Name");

                    b.Property<string>("TopExtendFunction");

                    b.Property<string>("ViewEditWidthHeight");

                    b.HasKey("Id");

                    b.ToTable("Sys_TableList");
                });

            modelBuilder.Entity("lkWeb.Entity.TestLeaderEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<string>("Name");

                    b.Property<int>("ParentId");

                    b.Property<string>("Test");

                    b.Property<string>("Test1");

                    b.Property<string>("Test2");

                    b.HasKey("Id");

                    b.ToTable("Test_Leader");
                });

            modelBuilder.Entity("lkWeb.Entity.UserDepartmentEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDateTime");

                    b.Property<int>("DepartmentId");

                    b.Property<int>("UserId");

                    b.HasKey("Id");

                    b.HasIndex("DepartmentId");

                    b.HasIndex("UserId");

                    b.ToTable("Sys_UserDepartment");
                });

            modelBuilder.Entity("lkWeb.Entity.UserEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("AccessFailedCount");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken();

                    b.Property<string>("Email")
                        .HasMaxLength(256);

                    b.Property<bool>("EmailConfirmed");

                    b.Property<bool>("LockoutEnabled");

                    b.Property<DateTimeOffset?>("LockoutEnd");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(100);

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(100);

                    b.Property<string>("PasswordHash");

                    b.Property<string>("PhoneNumber");

                    b.Property<bool>("PhoneNumberConfirmed");

                    b.Property<string>("RealName");

                    b.Property<string>("SecurityStamp");

                    b.Property<byte>("Status");

                    b.Property<bool>("TwoFactorEnabled");

                    b.Property<string>("UserName")
                        .HasMaxLength(256);

                    b.HasKey("Id");

                    b.HasIndex("NormalizedEmail")
                        .HasName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasName("UserNameIndex")
                        .HasFilter("[NormalizedUserName] IS NOT NULL");

                    b.ToTable("Sys_User");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<int>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClaimType");

                    b.Property<string>("ClaimValue");

                    b.Property<int>("RoleId");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("Sys_RoleClaim");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<int>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ClaimType");

                    b.Property<string>("ClaimValue");

                    b.Property<int>("UserId");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Sys_UserClaim");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<int>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasMaxLength(100);

                    b.Property<string>("ProviderKey")
                        .HasMaxLength(100);

                    b.Property<string>("ProviderDisplayName");

                    b.Property<int>("UserId");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("Sys_UserLogin");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<int>", b =>
                {
                    b.Property<int>("UserId");

                    b.Property<int>("RoleId");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("Sys_UserRole");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<int>", b =>
                {
                    b.Property<int>("UserId");

                    b.Property<string>("LoginProvider")
                        .HasMaxLength(100);

                    b.Property<string>("Name")
                        .HasMaxLength(100);

                    b.Property<string>("Value");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("Sys_UserToken");
                });

            modelBuilder.Entity("lkWeb.Entity.RoleMenuEntity", b =>
                {
                    b.HasOne("lkWeb.Entity.RoleEntity", "Role")
                        .WithMany("RoleMenus")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("lkWeb.Entity.TableColumnEntity", b =>
                {
                    b.HasOne("lkWeb.Entity.TableListEntity", "Table")
                        .WithMany("TableColumns")
                        .HasForeignKey("TableId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("lkWeb.Entity.UserDepartmentEntity", b =>
                {
                    b.HasOne("lkWeb.Entity.DepartmentEntity", "Department")
                        .WithMany("UserDepartments")
                        .HasForeignKey("DepartmentId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("lkWeb.Entity.UserEntity", "User")
                        .WithMany("UserDepartments")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<int>", b =>
                {
                    b.HasOne("lkWeb.Entity.RoleEntity")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<int>", b =>
                {
                    b.HasOne("lkWeb.Entity.UserEntity")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<int>", b =>
                {
                    b.HasOne("lkWeb.Entity.UserEntity")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<int>", b =>
                {
                    b.HasOne("lkWeb.Entity.RoleEntity")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("lkWeb.Entity.UserEntity")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<int>", b =>
                {
                    b.HasOne("lkWeb.Entity.UserEntity")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
#pragma warning restore 612, 618
        }
    }
}
