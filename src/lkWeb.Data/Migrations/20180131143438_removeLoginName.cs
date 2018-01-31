using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class removeLoginName : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LoginName",
                table: "AspNetUsers");

            migrationBuilder.RenameColumn(
                name: "LoginName",
                table: "Sys_User",
                newName: "UserName");

            migrationBuilder.RenameColumn(
                name: "LoginName",
                table: "Sys_OperationLog",
                newName: "UserName");

            migrationBuilder.RenameColumn(
                name: "LoginName",
                table: "Sys_LoginLog",
                newName: "UserName");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UserName",
                table: "Sys_User",
                newName: "LoginName");

            migrationBuilder.RenameColumn(
                name: "UserName",
                table: "Sys_OperationLog",
                newName: "LoginName");

            migrationBuilder.RenameColumn(
                name: "UserName",
                table: "Sys_LoginLog",
                newName: "LoginName");

            migrationBuilder.AddColumn<string>(
                name: "LoginName",
                table: "AspNetUsers",
                nullable: true);
        }
    }
}
