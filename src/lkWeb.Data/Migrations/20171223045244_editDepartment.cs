using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace lkWeb.Data.Migrations
{
    public partial class editDepartment : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserDepartmentEntity_DepartmentEntity_DepartmentID",
                table: "UserDepartmentEntity");

            migrationBuilder.DropPrimaryKey(
                name: "PK_DepartmentEntity",
                table: "DepartmentEntity");

            migrationBuilder.RenameTable(
                name: "DepartmentEntity",
                newName: "Sys_Department");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Sys_Department",
                type: "varchar(20)",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Sys_Department",
                type: "varchar(100)",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sys_Department",
                table: "Sys_Department",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserDepartmentEntity_Sys_Department_DepartmentID",
                table: "UserDepartmentEntity",
                column: "DepartmentID",
                principalTable: "Sys_Department",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserDepartmentEntity_Sys_Department_DepartmentID",
                table: "UserDepartmentEntity");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sys_Department",
                table: "Sys_Department");

            migrationBuilder.RenameTable(
                name: "Sys_Department",
                newName: "DepartmentEntity");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "DepartmentEntity",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(20)");

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "DepartmentEntity",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(100)");

            migrationBuilder.AddPrimaryKey(
                name: "PK_DepartmentEntity",
                table: "DepartmentEntity",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserDepartmentEntity_DepartmentEntity_DepartmentID",
                table: "UserDepartmentEntity",
                column: "DepartmentID",
                principalTable: "DepartmentEntity",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
