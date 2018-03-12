using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201803121408 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Sys_TableColumn_TableID",
                table: "Sys_TableColumn",
                column: "TableID");

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_TableColumn_Sys_TableList_TableID",
                table: "Sys_TableColumn",
                column: "TableID",
                principalTable: "Sys_TableList",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sys_TableColumn_Sys_TableList_TableID",
                table: "Sys_TableColumn");

            migrationBuilder.DropIndex(
                name: "IX_Sys_TableColumn_TableID",
                table: "Sys_TableColumn");
        }
    }
}
