using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class modify20171223 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserDepartmentEntity_Sys_Department_DepartmentID",
                table: "UserDepartmentEntity");

            migrationBuilder.DropForeignKey(
                name: "FK_UserDepartmentEntity_Sys_User_UserID",
                table: "UserDepartmentEntity");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserDepartmentEntity",
                table: "UserDepartmentEntity");

            migrationBuilder.RenameTable(
                name: "UserDepartmentEntity",
                newName: "Sys_UserDepartment");

            migrationBuilder.RenameIndex(
                name: "IX_UserDepartmentEntity_UserID",
                table: "Sys_UserDepartment",
                newName: "IX_Sys_UserDepartment_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_UserDepartmentEntity_DepartmentID",
                table: "Sys_UserDepartment",
                newName: "IX_Sys_UserDepartment_DepartmentID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sys_UserDepartment",
                table: "Sys_UserDepartment",
                column: "Id");

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sys_UserDepartment_Sys_Department_DepartmentID",
                table: "Sys_UserDepartment");

            migrationBuilder.DropForeignKey(
                name: "FK_Sys_UserDepartment_Sys_User_UserID",
                table: "Sys_UserDepartment");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sys_UserDepartment",
                table: "Sys_UserDepartment");

            migrationBuilder.RenameTable(
                name: "Sys_UserDepartment",
                newName: "UserDepartmentEntity");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_UserDepartment_UserID",
                table: "UserDepartmentEntity",
                newName: "IX_UserDepartmentEntity_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Sys_UserDepartment_DepartmentID",
                table: "UserDepartmentEntity",
                newName: "IX_UserDepartmentEntity_DepartmentID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserDepartmentEntity",
                table: "UserDepartmentEntity",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserDepartmentEntity_Sys_Department_DepartmentID",
                table: "UserDepartmentEntity",
                column: "DepartmentID",
                principalTable: "Sys_Department",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserDepartmentEntity_Sys_User_UserID",
                table: "UserDepartmentEntity",
                column: "UserID",
                principalTable: "Sys_User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
