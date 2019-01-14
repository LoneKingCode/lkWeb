using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _01142206 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "JavaScript",
                table: "Sys_TableList",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "JavaScript",
                table: "Sys_TableList");
        }
    }
}
