using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _1805042142 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SearchOrder",
                table: "Sys_TableColumn");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "SearchOrder",
                table: "Sys_TableColumn",
                nullable: false,
                defaultValue: 0);
        }
    }
}
