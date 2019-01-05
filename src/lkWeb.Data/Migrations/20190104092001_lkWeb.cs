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
            migrationBuilder.DropTable(
                name: "Test_Leader");

            migrationBuilder.AddColumn<string>(
                name: "TopExtendFunction",
                table: "Sys_TableList",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TopExtendFunction",
                table: "Sys_TableList");

            migrationBuilder.CreateTable(
                name: "Test_Leader",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    Name = table.Column<string>(type: "varchar(30)", nullable: false),
                    ParentId = table.Column<int>(nullable: false),
                    Type = table.Column<string>(type: "varchar(30)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Test_Leader", x => x.Id);
                });
        }
    }
}
