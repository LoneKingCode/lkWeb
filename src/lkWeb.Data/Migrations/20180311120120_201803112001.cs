using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201803112001 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Sys_SystemOption",
                columns: table => new
                {
                    Code = table.Column<string>(type: "varchar(100)", nullable: false),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Value = table.Column<string>(type: "varchar(1000)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_SystemOption", x => x.Code);
                });

            migrationBuilder.CreateTable(
                name: "Sys_TableColumn",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    AddVisible = table.Column<byte>(nullable: false),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    DataType = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    EditOrder = table.Column<int>(nullable: false),
                    EditVisible = table.Column<byte>(nullable: false),
                    EnumRange = table.Column<string>(nullable: true),
                    ExportVisible = table.Column<byte>(nullable: false),
                    ImportVisible = table.Column<byte>(nullable: false),
                    ListOrder = table.Column<int>(nullable: false),
                    ListVisible = table.Column<byte>(nullable: false),
                    MaxLength = table.Column<int>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    OutSql = table.Column<string>(nullable: true),
                    PrimarKey = table.Column<byte>(nullable: false),
                    Required = table.Column<byte>(nullable: false),
                    SearchOrder = table.Column<int>(nullable: false),
                    SearchVisible = table.Column<byte>(nullable: false),
                    TableID = table.Column<int>(nullable: false),
                    ViewOrder = table.Column<int>(nullable: false),
                    ViewVisible = table.Column<byte>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_TableColumn", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sys_TableList",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    AddColumns = table.Column<byte>(nullable: false),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    DefaultFilter = table.Column<string>(nullable: true),
                    DefaultSort = table.Column<string>(nullable: true),
                    DeleteTableName = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    EditColumns = table.Column<byte>(nullable: false),
                    ExtendFunction = table.Column<string>(nullable: true),
                    ForbiddenAddFilter = table.Column<string>(nullable: true),
                    ForbiddenDeleteFilter = table.Column<string>(nullable: true),
                    ForbiddenUpdateFilter = table.Column<string>(nullable: true),
                    ImportType = table.Column<byte>(nullable: false),
                    IsView = table.Column<byte>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    SearchColumns = table.Column<byte>(nullable: false),
                    ViewEditDeleteSet = table.Column<string>(nullable: true),
                    ViewEditDeleteWidthHeight = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sys_TableList", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Sys_SystemOption");

            migrationBuilder.DropTable(
                name: "Sys_TableColumn");

            migrationBuilder.DropTable(
                name: "Sys_TableList");
        }
    }
}
