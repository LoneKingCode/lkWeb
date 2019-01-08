using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class modifyTableList1908 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ColumnPerRow",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "ViewEditWidthHeight",
                table: "Sys_TableList",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ColumnPerRow",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "ViewEditWidthHeight",
                table: "Sys_TableList");
        }
    }
}
