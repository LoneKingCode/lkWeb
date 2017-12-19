using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class lkWeb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Sys_LoginLog",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ClientIP = table.Column<string>(type: "varchar(15)", nullable: true),
                    ClientMac = table.Column<string>(type: "varchar(40)", nullable: true),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    LoginName = table.Column<string>(type: "varchar(20)", nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    UserId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_LoginLog", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Menu",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    Name = table.Column<string>(type: "varchar(18)", nullable: false),
                    Order = table.Column<int>(nullable: false),
                    ParentId = table.Column<int>(nullable: false),
                    Type = table.Column<byte>(nullable: false),
                    Url = table.Column<string>(type: "varchar(300)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Menu", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_OperationLog",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    ClientIP = table.Column<string>(type: "varchar(15)", nullable: false),
                    ClientMac = table.Column<string>(type: "varchar(40)", nullable: false),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    OperationDesciption = table.Column<string>(type: "varchar(100)", nullable: false),
                    OperationUrl = table.Column<string>(type: "varchar(300)", nullable: true),
                    UserId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_OperationLog", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_Role",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    Description = table.Column<string>(type: "varchar(100)", nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    Name = table.Column<string>(type: "varchar(20)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_Role", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_User",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    Email = table.Column<string>(type: "varchar(35)", nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    LoginName = table.Column<string>(type: "varchar(20)", nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    Password = table.Column<string>(type: "varchar(35)", nullable: false),
                    RealName = table.Column<string>(type: "varchar(20)", nullable: false),
                    Status = table.Column<byte>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_User", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_RoleMenu",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    MenuId = table.Column<int>(nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    RoleId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_RoleMenu", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_RoleMenu_Sys_Role_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Sys_Role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sys_UserRole",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Creator = table.Column<int>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    Modifier = table.Column<int>(nullable: false),
                    RoleId = table.Column<int>(nullable: false),
                    UserId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_UserRole", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sys_UserRole_Sys_Role_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Sys_Role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Sys_UserRole_Sys_User_UserId",
                        column: x => x.UserId,
                        principalTable: "Sys_User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Sys_RoleMenu_RoleId",
                table: "Sys_RoleMenu",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserRole_RoleId",
                table: "Sys_UserRole",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_Sys_UserRole_UserId",
                table: "Sys_UserRole",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Sys_LoginLog");

            migrationBuilder.DropTable(
                name: "Sys_Menu");

            migrationBuilder.DropTable(
                name: "Sys_OperationLog");

            migrationBuilder.DropTable(
                name: "Sys_RoleMenu");

            migrationBuilder.DropTable(
                name: "Sys_UserRole");

            migrationBuilder.DropTable(
                name: "Sys_Role");

            migrationBuilder.DropTable(
                name: "Sys_User");
        }
    }
}
