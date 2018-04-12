using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201804122033 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ViewEditDeleteSet",
                table: "Sys_TableList");

            migrationBuilder.AddColumn<byte>(
                name: "AllowDelete",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<byte>(
                name: "AllowEdit",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<byte>(
                name: "AllowExport",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<byte>(
                name: "AllowImport",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);

            migrationBuilder.AddColumn<byte>(
                name: "AllowView",
                table: "Sys_TableList",
                nullable: false,
                defaultValue: (byte)0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AllowDelete",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "AllowEdit",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "AllowExport",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "AllowImport",
                table: "Sys_TableList");

            migrationBuilder.DropColumn(
                name: "AllowView",
                table: "Sys_TableList");

            migrationBuilder.AddColumn<string>(
                name: "ViewEditDeleteSet",
                table: "Sys_TableList",
                nullable: true);
        }
    }
}
