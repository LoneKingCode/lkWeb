using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201712282158 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "OperationDesciption",
                table: "Sys_OperationLog",
                newName: "OperationDescription");

            migrationBuilder.AddColumn<string>(
                name: "LoginName",
                table: "Sys_OperationLog",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LoginName",
                table: "Sys_OperationLog");

            migrationBuilder.RenameColumn(
                name: "OperationDescription",
                table: "Sys_OperationLog",
                newName: "OperationDesciption");
        }
    }
}
