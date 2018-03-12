using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201803122240 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AddColumns",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "EditColumns",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "SearchColumns",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "ViewEditDeleteWidthHeight",
                table: "Sys_TableList");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<byte>(
                name: "AddColumns",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<byte>(
                name: "EditColumns",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<byte>(
                name: "SearchColumns",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<string>(
                name: "ViewEditDeleteWidthHeight",
                table: "Sys_TableList",
                nullable: true);
        }
    }
}
