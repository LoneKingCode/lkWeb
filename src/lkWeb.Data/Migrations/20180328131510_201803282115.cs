using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class _201803282115 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sys_UserDepartment_Sys_Department_DepartmentID",
                table: "Sys_UserDepartment");

            migrationBuilder.DropForeignKey(
                name: "FK_Sys_UserDepartment_Sys_User_UserID",
                table: "Sys_UserDepartment");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "Sys_UserDepartment",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "DepartmentID",
                table: "Sys_UserDepartment",
                newName: "DepartmentId");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_UserDepartment_UserID",
                table: "Sys_UserDepartment",
                newName: "IX_Sys_UserDepartment_UserId");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_UserDepartment_DepartmentID",
                table: "Sys_UserDepartment",
                newName: "IX_Sys_UserDepartment_DepartmentId");

            migrationBuilder.RenameColumn(
                name: "ParentID",
                table: "Sys_Department",
                newName: "ParentId");

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_UserDepartment_Sys_Department_DepartmentId",
                table: "Sys_UserDepartment",
                column: "DepartmentId",
                principalTable: "Sys_Department",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_UserDepartment_Sys_User_UserId",
                table: "Sys_UserDepartment",
                column: "UserId",
                principalTable: "Sys_User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sys_UserDepartment_Sys_Department_DepartmentId",
                table: "Sys_UserDepartment");

            migrationBuilder.DropForeignKey(
                name: "FK_Sys_UserDepartment_Sys_User_UserId",
                table: "Sys_UserDepartment");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Sys_UserDepartment",
                newName: "UserID");

            migrationBuilder.RenameColumn(
                name: "DepartmentId",
                table: "Sys_UserDepartment",
                newName: "DepartmentID");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_UserDepartment_UserId",
                table: "Sys_UserDepartment",
                newName: "IX_Sys_UserDepartment_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_UserDepartment_DepartmentId",
                table: "Sys_UserDepartment",
                newName: "IX_Sys_UserDepartment_DepartmentID");

            migrationBuilder.RenameColumn(
                name: "ParentId",
                table: "Sys_Department",
                newName: "ParentID");

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_UserDepartment_Sys_Department_DepartmentID",
                table: "Sys_UserDepartment",
                column: "DepartmentID",
                principalTable: "Sys_Department",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sys_UserDepartment_Sys_User_UserID",
                table: "Sys_UserDepartment",
                column: "UserID",
                principalTable: "Sys_User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
