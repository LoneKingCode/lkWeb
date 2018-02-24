using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class modifyOrderToListOrder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Order",
                table: "Sys_Module");

            migrationBuilder.RenameColumn(
                name: "Order",
                table: "Sys_Menu",
                newName: "ListOrder");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ListOrder",
                table: "Sys_Menu",
                newName: "Order");

            migrationBuilder.AddColumn<int>(
                name: "Order",
                table: "Sys_Module",
                nullable: false,
                defaultValue: 0);
        }
    }
}
