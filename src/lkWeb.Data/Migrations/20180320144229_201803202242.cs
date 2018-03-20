using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201803202242 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Sys_SystemOption",
                table: "Sys_SystemOption");

            migrationBuilder.AlterColumn<string>(
                name: "Code",
                table: "Sys_SystemOption",
                type: "varchar(100)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(100)");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sys_SystemOption",
                table: "Sys_SystemOption",
                column: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Sys_SystemOption",
                table: "Sys_SystemOption");

            migrationBuilder.AlterColumn<string>(
                name: "Code",
                table: "Sys_SystemOption",
                type: "varchar(100)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(100)",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sys_SystemOption",
                table: "Sys_SystemOption",
                column: "Code");
        }
    }
}
