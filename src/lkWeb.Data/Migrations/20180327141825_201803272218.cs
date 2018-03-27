using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201803272218 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sys_TableColumn_Sys_TableList_TableID",
                table: "Sys_TableColumn");

            migrationBuilder.RenameColumn(
                name: "TableID",
                table: "Sys_TableColumn",
                newName: "TableId");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_TableColumn_TableID",
                table: "Sys_TableColumn",
                newName: "IX_Sys_TableColumn_TableId");

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_TableColumn_Sys_TableList_TableId",
                table: "Sys_TableColumn",
                column: "TableId",
                principalTable: "Sys_TableList",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sys_TableColumn_Sys_TableList_TableId",
                table: "Sys_TableColumn");

            migrationBuilder.RenameColumn(
                name: "TableId",
                table: "Sys_TableColumn",
                newName: "TableID");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_TableColumn_TableId",
                table: "Sys_TableColumn",
                newName: "IX_Sys_TableColumn_TableID");

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_TableColumn_Sys_TableList_TableID",
                table: "Sys_TableColumn",
                column: "TableID",
                principalTable: "Sys_TableList",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
