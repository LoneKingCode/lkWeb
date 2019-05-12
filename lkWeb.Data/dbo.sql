/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : SQL Server
 Source Server Version : 12002000
 Source Host           : localhost:1433
 Source Catalog        : lkWeb
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12002000
 File Encoding         : 65001

 Date: 12/05/2019 22:02:05
*/


-- ----------------------------
-- Table structure for Sys_Department
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Department]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Department]
GO

CREATE TABLE [dbo].[Sys_Department] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [Description] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Leader] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Name] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ParentId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_Department] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Department
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_Department] ON
GO

INSERT INTO [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (N'5', N'2018-02-05 17:17:11.3077639', N'写代码哦', N'王杰', N'开发部', N'5')
GO

INSERT INTO [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (N'6', N'2018-02-05 17:17:34.2588781', N'运营哦', N'张杰', N'运营部', N'0')
GO

INSERT INTO [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (N'7', N'2018-02-05 20:26:58.7052012', N'管理', N'LoneKing', N'管理部', N'0')
GO

INSERT INTO [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (N'12', N'2018-02-13 23:27:57.2040073', N'test说明', N'test负责人', N'test名称', N'6')
GO

SET IDENTITY_INSERT [dbo].[Sys_Department] OFF
GO


-- ----------------------------
-- Table structure for Sys_File
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_File]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_File]
GO

CREATE TABLE [dbo].[Sys_File] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Description] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Name] nvarchar(256) COLLATE Chinese_PRC_CI_AS  NULL,
  [FileType] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [FileUrl] nvarchar(256) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreateDateTime] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[Sys_File] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Sys_InfoRelease
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_InfoRelease]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_InfoRelease]
GO

CREATE TABLE [dbo].[Sys_InfoRelease] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [TypeId] int  NULL,
  [Title] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [InfoContent] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Creator] int  NULL,
  [CreateDateTime] datetime2(7)  NULL,
  [ViewTime] int DEFAULT ((0)) NULL
)
GO

ALTER TABLE [dbo].[Sys_InfoRelease] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_InfoRelease
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_InfoRelease] ON
GO

INSERT INTO [dbo].[Sys_InfoRelease] ([Id], [TypeId], [Title], [InfoContent], [Creator], [CreateDateTime], [ViewTime]) VALUES (N'2', N'1', N'123的', N'<p>阿萨大等等</p>', N'0', N'2019-04-19 17:12:10.1188913', N'0')
GO

SET IDENTITY_INSERT [dbo].[Sys_InfoRelease] OFF
GO


-- ----------------------------
-- Table structure for Sys_InfoType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_InfoType]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_InfoType]
GO

CREATE TABLE [dbo].[Sys_InfoType] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Name] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateDateTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_InfoType] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_InfoType
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_InfoType] ON
GO

INSERT INTO [dbo].[Sys_InfoType] ([Id], [Name], [CreateDateTime]) VALUES (N'1', N'系统公告', N'2019-04-19 17:02:11.0000000')
GO

SET IDENTITY_INSERT [dbo].[Sys_InfoType] OFF
GO


-- ----------------------------
-- Table structure for Sys_LoginLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_LoginLog]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_LoginLog]
GO

CREATE TABLE [dbo].[Sys_LoginLog] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [ClientIP] varchar(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [ClientMac] varchar(40) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [UserId] int  NOT NULL,
  [UserName] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Description] varchar(40) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_LoginLog] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_LoginLog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_LoginLog] ON
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11441', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:43:56.3663515', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11442', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:59:21.3165356', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11443', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:14.7135223', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11444', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:24.7713663', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11445', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:27.7485419', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11446', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:54.3296836', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11447', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:02:12.5194907', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11448', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:02:39.9251308', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11449', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:04:08.1025297', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11450', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:04:12.9874879', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11451', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:04:21.2887175', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11452', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:04:25.1300354', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11453', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:04:26.9600880', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11454', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:04:31.1919294', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11455', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:05:22.1444394', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11456', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:07:01.8851195', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11457', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:09:33.1039811', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11458', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:18.8430451', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11459', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:48.5465139', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11460', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:24.6006153', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11461', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:23:23.6744942', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11462', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:33.6551092', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11463', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:07:50.9283632', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'11464', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:28.6722299', N'0', N'sa', N'登陆成功')
GO

SET IDENTITY_INSERT [dbo].[Sys_LoginLog] OFF
GO


-- ----------------------------
-- Table structure for Sys_Menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Menu]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Menu]
GO

CREATE TABLE [dbo].[Sys_Menu] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [Name] varchar(18) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ListOrder] int  NOT NULL,
  [ParentId] int  NOT NULL,
  [Type] tinyint  NOT NULL,
  [Url] varchar(300) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SubSystemId] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT ((0)) NULL,
  [Icon] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT (N'') NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_Menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_Menu] ON
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'20', N'2019-05-12 19:16:21.7911094', N'登陆日志', N'2', N'55', N'1', N'/admin/viewlist/index/1009', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'23', N'2018-02-26 00:47:17.0109391', N'添加', N'1', N'47', N'2', N'/admin/role/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'25', N'2018-02-26 00:48:50.1465402', N'编辑', N'2', N'47', N'2', N'/admin/role/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'26', N'2018-02-26 00:49:46.3026481', N'删除', N'3', N'47', N'2', N'/admin/role/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'28', N'2018-03-05 20:26:41.7374827', N'添加', N'1', N'48', N'2', N'/admin/department/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'29', N'2018-03-05 20:27:17.1070801', N'编辑', N'2', N'48', N'2', N'/admin/department/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'30', N'2018-03-05 20:27:47.1766801', N'删除', N'3', N'48', N'2', N'/admin/department/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'31', N'2018-03-05 20:30:34.5211505', N'保存', N'1', N'49', N'2', N'/admin/role/AuthMenus', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'32', N'2018-03-05 20:32:06.4514524', N'添加', N'1', N'50', N'2', N'/admin/user/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'33', N'2018-03-05 20:32:18.5702215', N'编辑', N'2', N'50', N'2', N'/admin/user/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'34', N'2018-03-05 20:32:33.2283930', N'删除', N'3', N'50', N'2', N'/admin/user/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'35', N'2018-03-05 20:33:09.8548616', N'角色授权', N'4', N'50', N'2', N'/admin/user/authen', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'36', N'2018-03-05 20:34:49.4881171', N'添加', N'1', N'51', N'2', N'/admin/user/selectUser', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'41', N'2018-03-05 20:43:09.7351631', N'添加', N'1', N'53', N'2', N'/admin/menu/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'42', N'2018-03-05 21:28:08.1709715', N'删除', N'2', N'51', N'2', N'/admin/User/DelUserDepartment', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'43', N'2018-03-05 21:28:41.2921323', N'编辑', N'2', N'53', N'2', N'/admin/menu/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'44', N'2018-03-05 21:28:56.0588430', N'删除', N'3', N'53', N'2', N'/admin/menu/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'46', N'2018-02-25 23:15:42.3859320', N'系统设置', N'0', N'0', N'0', N'#', N'1', N'fa fa-cog')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'47', N'2018-02-25 21:36:57.8745745', N'角色管理', N'1', N'46', N'1', N'/admin/role', N'1', N'fa fa-user-circle')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'48', N'2018-02-25 21:37:18.2776820', N'部门管理', N'2', N'46', N'1', N'/admin/department', N'1', N'fa fa-vcard-o')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'49', N'2018-02-25 21:38:02.9127007', N'角色授权', N'3', N'46', N'1', N'/admin/role/authen', N'1', N'fa fa-user-circle-o')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'50', N'2019-04-13 22:58:31.6843566', N'用户管理', N'4', N'46', N'1', N'/admin/user', N'1', N'fa fa-user-o')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'51', N'2018-02-25 21:39:27.8154553', N'用户部门', N'5', N'46', N'1', N'/admin/user/department', N'1', N'fa fa-vcard')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'53', N'2018-02-25 21:40:18.5419110', N'菜单管理', N'7', N'46', N'1', N'/admin/menu', N'1', N'fa fa-list')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'54', N'2019-05-12 19:44:27.4641517', N'修改信息', N'13', N'46', N'1', N'/admin/user/editcurrent', N'1', N'fa fa-info-circle')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'55', N'2018-02-25 21:41:26.1795987', N'系统日志', N'1', N'0', N'0', N'#', N'1', N'fa fa-sticky-note')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'57', N'2018-03-08 15:57:07.6196172', N'统计图表', N'3', N'55', N'1', N'/admin/log/chart', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1027', N'2018-02-25 21:41:01.1950159', N'后台任务', N'12', N'46', N'1', N'/jobs', N'1', N'fa fa-info-circle')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1028', N'2018-03-12 14:40:26.1851601', N'表管理', N'8', N'46', N'1', N'/admin/tablelist/index', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1029', N'2018-03-12 14:40:53.2065422', N'表结构管理', N'9', N'46', N'1', N'/admin/tablecolumn/index', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1030', N'2018-03-05 20:39:16.2658323', N'添加', N'1', N'1028', N'2', N'/admin/tablelist/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1031', N'2018-03-05 20:41:16.8744020', N'编辑', N'2', N'1028', N'2', N'/admin/tablelist/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1032', N'2018-03-05 20:41:32.5455574', N'删除', N'3', N'1028', N'2', N'/admin/tablelist/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1033', N'2018-03-05 20:39:16.2658323', N'添加', N'1', N'1029', N'2', N'/admin/tablecolumn/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1034', N'2018-03-05 20:41:16.8744020', N'编辑', N'2', N'1029', N'2', N'/admin/tablecolumn/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'1035', N'2018-03-05 20:41:32.5455574', N'删除', N'3', N'1029', N'2', N'/admin/tablecolumn/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2028', N'2019-04-19 12:39:45.5750283', N'系统配置', N'11', N'46', N'1', N'/admin/viewlist/index/2014', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2029', N'2018-03-20 22:29:45.3538853', N'添加', N'1', N'2028', N'2', N'/admin/systemoption/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2030', N'2018-03-20 22:30:04.2380259', N'编辑', N'2', N'2028', N'2', N'/admin/systemoption/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2031', N'2018-03-20 22:30:16.2512660', N'删除', N'3', N'2028', N'2', N'/admin/systemoption/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2032', N'2018-03-23 23:36:32.6492257', N'设置属性', N'5', N'1029', N'2', N'/admin/tablecolumn/setvalue', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2033', N'2018-03-28 22:00:16.0416120', N'基础数据', N'2', N'0', N'0', N'#', N'1', N'fa fa-database')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2036', N'2018-03-31 23:00:25.9427920', N'添加', N'1', N'2039', N'2', N'/admin/viewlist/add', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2037', N'2018-03-31 22:59:52.6571289', N'编辑', N'2', N'2039', N'2', N'/admin/viewlist/edit', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2038', N'2018-03-31 22:59:43.5102640', N'删除', N'3', N'2039', N'2', N'/admin/viewlist/delete', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2039', N'2018-03-31 23:02:30.4059966', N'基础数据菜单权限', N'99', N'2033', N'1', N'#', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2041', N'2018-05-07 20:51:23.4942112', N'导入', N'5', N'2039', N'2', N'/admin/viewlist/import', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2042', N'2018-05-07 20:54:09.2408231', N'导出', N'6', N'2039', N'2', N'/admin/viewlist/export', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2043', N'2018-05-07 20:54:16.8067366', N'查看详情', N'7', N'2039', N'2', N'/admin/viewlist/detail', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2044', N'2019-04-18 22:15:49.7631291', N'测试领导管理', N'3', N'2033', N'1', N'/admin/viewlist/index/1011', N'1,2', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2049', N'2019-04-13 16:51:42.3248877', N'子系统管理', N'6', N'46', N'1', N'/admin/viewlist/index/2012', N'1', N'fa fa-cog')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2050', N'2019-04-13 16:52:13.0863887', N'子系统类型', N'6', N'46', N'1', N'/admin/viewlist/index/2013', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2051', N'2019-04-18 22:57:11.6825373', N'角色用户', N'2', N'46', N'1', N'/admin/role/user', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2052', N'2019-04-19 15:30:06.0688007', N'值列表管理', N'13', N'46', N'1', N'/admin/valuelist/index', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2053', N'2019-04-19 16:05:11.7039036', N'信息管理', N'14', N'0', N'0', N'#', N'1', N'fa fa-book')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2054', N'2019-04-19 16:57:41.3670186', N'信息管理', N'1', N'2053', N'1', N'/admin/inforelease/index', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2055', N'2019-04-19 16:03:46.4807693', N'信息类别管理', N'2', N'2053', N'1', N'/admin/viewlist/index/2015', N'1', N'fa')
GO

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'2056', N'2019-05-12 19:26:04.6743124', N'操作日志', N'2', N'55', N'1', N'/admin/viewlist/index/2016', N'1', N'fa')
GO

SET IDENTITY_INSERT [dbo].[Sys_Menu] OFF
GO


-- ----------------------------
-- Table structure for Sys_OperationLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_OperationLog]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_OperationLog]
GO

CREATE TABLE [dbo].[Sys_OperationLog] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [ClientIP] varchar(15) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ClientMac] varchar(40) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [OperationDescription] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OperationUrl] varchar(300) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] int  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_OperationLog] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_OperationLog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_OperationLog] ON
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11853', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:25:44.8396795', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11854', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:02.2988149', N'访问', N'/admin/menu/edit/2056', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11855', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:05.5237517', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11856', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:05.6134948', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11857', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:13.5657495', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11858', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:17.0749425', N'访问', N'/admin/inforelease/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11859', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:21.8727067', N'访问', N'/admin/viewlist/index/2015', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11860', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:25.2690371', N'访问', N'/admin/viewlist/index/2015', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11861', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:27.3328051', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11862', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:27.9788964', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11863', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:33.2566229', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11864', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:35.4054997', N'访问', N'/admin/inforelease/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11865', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:41.2934716', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11866', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:41.3948406', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11867', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:45.0078202', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11868', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:47.7169191', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11869', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:48.9498757', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11870', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:50.8121480', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11871', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:51.5396771', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11872', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:54.7413710', N'访问', N'/admin/viewlist/index/2014', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11873', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:26:56.1979336', N'访问', N'/admin/viewlist/add/2014', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11874', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:27:03.1818531', N'访问', N'/admin/viewlist/edit/5/2014', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11875', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:27:11.8671328', N'访问', N'/admin/user/edit', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11876', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:27:16.8912122', N'访问', N'/admin/user/edit', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11877', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:43:46.3490371', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11878', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:43:46.6847301', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11879', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:43:57.8395329', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11880', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:43:59.1304893', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11881', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:44:16.7199382', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11882', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:44:22.7559034', N'访问', N'/admin/menu/edit/54', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11883', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:44:47.0530558', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11884', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:44:47.1654359', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11885', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:44:50.4513781', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11886', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:45:21.9765069', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11887', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:46:08.8016515', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11888', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:46:37.8830790', N'访问', N'/admin/user/EditCurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11889', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:48:19.7084366', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11890', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:50:42.6273987', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11891', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:59:16.5796139', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11892', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:59:16.8765524', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11893', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:59:22.6583007', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11894', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:59:23.8647973', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11895', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 19:59:35.5152582', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11896', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:16.2131457', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11897', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:16.9874505', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11898', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:17.6819566', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11899', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:43.2074896', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11900', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:43.6201695', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11901', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:43.8026285', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11902', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:00:43.9859635', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11903', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:08.6998273', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11904', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:09.1108729', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11905', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:48.1307729', N'访问', N'/admin/tablecolumn/index', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11906', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:48.1823928', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11907', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:49.3732093', N'访问', N'/admin/viewlist/index/2013', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11908', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:49.4113928', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11909', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:50.4670306', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11910', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:01:50.5132656', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11911', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:05:23.4853925', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11912', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:05:25.0137094', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11913', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:05:30.3349094', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11914', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:06:56.5530936', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11915', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:06:56.8832192', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11916', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:07:03.2826799', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11917', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:07:04.3120393', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11918', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:07:15.0311263', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11919', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:09:27.8188859', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11920', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:09:28.1441119', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11921', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:09:34.4778404', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11922', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:09:35.5192699', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11923', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:10:26.7393843', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11924', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:10:33.9318339', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11925', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:10:41.8039704', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11926', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:11:03.0062814', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11927', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:11:13.0301691', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11928', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:11:17.5310813', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11929', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:11:19.4042378', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11930', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:04.0831096', N'访问', N'/admin/User/Logout', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11931', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:04.1410907', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11932', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:17.3255561', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11933', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:17.3721849', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11934', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:19.1351240', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11935', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:21.6205164', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11936', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:12:21.6596327', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11937', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:20.1092323', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11938', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:20.2138463', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11939', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:21.1796403', N'访问', N'/admin/User/Logout', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11940', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:21.2276229', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11941', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:44.1865048', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11942', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:51.3454988', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11943', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:51.4689675', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11944', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:13:54.7391777', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11945', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:02.7990954', N'访问', N'/admin/User/Logout', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11946', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:02.8542536', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11947', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:27.2858995', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11948', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:27.3988949', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11949', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:30.9502269', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11950', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:31.8660757', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11951', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:14:34.1184466', N'访问', N'/admin/valueList/AddParent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11952', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:17:45.3372603', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11953', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:22:56.4374618', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11954', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:22:56.7054984', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11955', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:23:25.0133984', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11956', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:23:25.9247115', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11957', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:23:50.8957128', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11958', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:24:03.4468239', N'访问', N'/admin/valueList/AddParent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11959', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:24:37.9813348', N'访问', N'/admin/valueList/AddParent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11960', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:24:46.9107325', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11961', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:24:49.3717001', N'访问', N'/admin/valueList/add/13', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11962', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:24:50.8353703', N'访问', N'/admin/valueList/Add/0', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11963', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:28.3354004', N'访问', N'/admin/valueList/Add/0', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11964', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:31.4407653', N'访问', N'/admin/valueList/add/13', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11965', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:33.2716134', N'访问', N'/admin/valueList/Add/0', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11966', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:35.9118541', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11967', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:37.3501682', N'访问', N'/admin/valueList/add/13', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11968', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:38.3227142', N'访问', N'/admin/valueList/Add/0', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11969', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:25:50.8955203', N'访问', N'/admin/valueList/add/13', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11970', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:26:00.6706018', N'访问', N'/admin/valueList/add/13', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11971', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:36:01.2367584', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11972', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:36:07.3247247', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11973', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:01.9349410', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11974', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:07.0350525', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11975', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:11.8531786', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11976', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:14.4117997', N'访问', N'/admin/valueList/add/13', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11977', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:19.9561208', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11978', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:29.4289675', N'访问', N'/admin/valueList/AddParent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11979', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:34.4293792', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11980', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:35.1237559', N'访问', N'/admin/valueList/AddParent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11981', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:41.1330272', N'访问', N'/admin/valuelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11982', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:44.2560669', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11983', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:49.4769009', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11984', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:50.2780242', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11985', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:43:56.1106855', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11986', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:13.6800327', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11987', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:14.2838430', N'访问', N'/admin/viewlist/index/2015', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11988', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:29.6240201', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11989', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:29.6391462', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11990', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:34.8864593', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11991', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:44:34.9867917', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11992', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:45:14.0562131', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11993', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:45:15.1029118', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11994', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:17.2756494', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11995', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:17.5914978', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11996', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:26.6422240', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11997', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:27.4202994', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11998', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:27.9531317', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'11999', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:28.5695515', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12000', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:29.2032902', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12001', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:29.8134385', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12002', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:32.0531387', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12003', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:36.9139302', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12004', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:37.6182269', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12005', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:38.0582101', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12006', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:39.6419941', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12007', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:40.9708169', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12008', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:41.9132614', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12009', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:42.4358084', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12010', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:43.5553721', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12011', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:44.2303083', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12012', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:44.9724366', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12013', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:46.0009693', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12014', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:47.8444116', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12015', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:49.3474538', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12016', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:50.2020235', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12017', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:50.8573265', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12018', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:52.3387370', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12019', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:52.9599040', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12020', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 20:51:53.8105066', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12021', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:07:45.6163972', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12022', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:07:45.8987343', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12023', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:07:52.2604577', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12024', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:07:53.1801490', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12025', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:09:26.4962536', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12026', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:09:30.6907152', N'访问', N'/admin/tablelist/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12027', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:09:56.5459321', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12028', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:10:02.3806779', N'访问', N'/admin/tablecolumn/edit/2104', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12029', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:11:13.2184867', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12030', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:11:39.7086860', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12031', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:16:12.5420345', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12032', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:16:58.9811104', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12033', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:17:12.8832058', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12034', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:17:26.5557512', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12035', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:18:00.3237850', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12036', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:19:42.3674719', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12037', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:06.3257555', N'访问', N'/admin/tablecolumn/index', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12038', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:06.3257270', N'访问', N'/admin/tablecolumn/index', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12039', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:07.3293155', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12040', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:24.5774322', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12041', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:24.5928470', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12042', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:30.0595979', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12043', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:34:31.5881815', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12044', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:35:04.1818255', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12045', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:35:47.8241386', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12046', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-12 21:36:17.9917392', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

SET IDENTITY_INSERT [dbo].[Sys_OperationLog] OFF
GO


-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Role]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Role]
GO

CREATE TABLE [dbo].[Sys_Role] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Description] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Name] nvarchar(256) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateDateTime] datetime2(7)  NULL,
  [SubSystemId] int  NULL
)
GO

ALTER TABLE [dbo].[Sys_Role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_Role] ON
GO

INSERT INTO [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (N'1', N'最普通的', N'普通用户', N'2018-08-08 12:22:22.0000000', N'2')
GO

INSERT INTO [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (N'2', N'Very Importent Person', N'VIP会员', N'2018-08-08 12:22:22.0000000', N'2')
GO

INSERT INTO [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (N'5', N'管理一切哦', N'管理员', N'2018-08-08 12:22:22.0000000', N'1')
GO

INSERT INTO [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (N'14', N'最高权限拥有者', N'超级管理员', N'2018-08-08 12:22:22.0000000', N'1')
GO

SET IDENTITY_INSERT [dbo].[Sys_Role] OFF
GO


-- ----------------------------
-- Table structure for Sys_RoleMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_RoleMenu]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_RoleMenu]
GO

CREATE TABLE [dbo].[Sys_RoleMenu] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [MenuId] int  NOT NULL,
  [RoleId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_RoleMenu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_RoleMenu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_RoleMenu] ON
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2533', N'2018-03-31 23:02:54.0739799', N'46', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2534', N'2018-03-31 23:02:54.0739860', N'2035', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2535', N'2018-03-31 23:02:54.0739856', N'2034', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2536', N'2018-03-31 23:02:54.0739856', N'2033', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2537', N'2018-03-31 23:02:54.0739852', N'57', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2538', N'2018-03-31 23:02:54.0739852', N'21', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2539', N'2018-03-31 23:02:54.0739852', N'20', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2540', N'2018-03-31 23:02:54.0739848', N'55', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2541', N'2018-03-31 23:02:54.0739848', N'2029', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2542', N'2018-03-31 23:02:54.0739844', N'2028', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2543', N'2018-03-31 23:02:54.0739844', N'1033', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2544', N'2018-03-31 23:02:54.0739840', N'1029', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2545', N'2018-03-31 23:02:54.0739840', N'1030', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2546', N'2018-03-31 23:02:54.0739860', N'2039', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2547', N'2018-03-31 23:02:54.0739840', N'1028', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2548', N'2018-03-31 23:02:54.0739836', N'53', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2549', N'2018-03-31 23:02:54.0739832', N'38', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2550', N'2018-03-31 23:02:54.0739832', N'52', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2551', N'2018-03-31 23:02:54.0739827', N'36', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2552', N'2018-03-31 23:02:54.0739827', N'51', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2553', N'2018-03-31 23:02:54.0739827', N'32', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2554', N'2018-03-31 23:02:54.0739823', N'50', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2555', N'2018-03-31 23:02:54.0739823', N'49', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2556', N'2018-03-31 23:02:54.0739819', N'28', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2557', N'2018-03-31 23:02:54.0739819', N'48', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2558', N'2018-03-31 23:02:54.0739815', N'23', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2559', N'2018-03-31 23:02:54.0739815', N'47', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2560', N'2018-03-31 23:02:54.0739836', N'1027', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'2561', N'2018-03-31 23:02:54.0739860', N'2036', N'5')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4672', N'2019-04-18 22:16:52.9237814', N'46', N'2')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4673', N'2019-04-18 22:16:52.9237820', N'49', N'2')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4903', N'2019-05-12 18:59:05.1214939', N'2044', N'1')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4904', N'2019-05-12 19:21:55.0801260', N'46', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4905', N'2019-05-12 19:21:55.0801296', N'1034', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4906', N'2019-05-12 19:21:55.0801307', N'1035', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4907', N'2019-05-12 19:21:55.0801307', N'2032', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4908', N'2019-05-12 19:21:55.0801309', N'2028', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4909', N'2019-05-12 19:21:55.0801309', N'2029', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4910', N'2019-05-12 19:21:55.0801310', N'2030', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4911', N'2019-05-12 19:21:55.0801311', N'2031', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4912', N'2019-05-12 19:21:55.0801312', N'2049', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4913', N'2019-05-12 19:21:55.0801312', N'2050', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4914', N'2019-05-12 19:21:55.0801313', N'2051', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4915', N'2019-05-12 19:21:55.0801314', N'2052', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4916', N'2019-05-12 19:21:55.0801315', N'55', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4917', N'2019-05-12 19:21:55.0801295', N'1033', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4918', N'2019-05-12 19:21:55.0801316', N'20', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4919', N'2019-05-12 19:21:55.0801317', N'2056', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4920', N'2019-05-12 19:21:55.0801318', N'2033', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4921', N'2019-05-12 19:21:55.0801319', N'2034', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4922', N'2019-05-12 19:21:55.0801320', N'2039', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4923', N'2019-05-12 19:21:55.0801320', N'2036', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4924', N'2019-05-12 19:21:55.0801322', N'2037', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4925', N'2019-05-12 19:21:55.0801323', N'2038', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4926', N'2019-05-12 19:21:55.0801323', N'2041', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4927', N'2019-05-12 19:21:55.0801324', N'2042', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4928', N'2019-05-12 19:21:55.0801325', N'2043', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4929', N'2019-05-12 19:21:55.0801326', N'2044', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4930', N'2019-05-12 19:21:55.0801326', N'2053', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4931', N'2019-05-12 19:21:55.0801317', N'57', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4932', N'2019-05-12 19:21:55.0801327', N'2054', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4933', N'2019-05-12 19:21:55.0801295', N'1029', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4934', N'2019-05-12 19:21:55.0801293', N'1031', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4935', N'2019-05-12 19:21:55.0801270', N'47', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4936', N'2019-05-12 19:21:55.0801272', N'23', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4937', N'2019-05-12 19:21:55.0801273', N'25', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4938', N'2019-05-12 19:21:55.0801274', N'26', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4939', N'2019-05-12 19:21:55.0801274', N'48', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4940', N'2019-05-12 19:21:55.0801275', N'28', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4941', N'2019-05-12 19:21:55.0801276', N'29', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4942', N'2019-05-12 19:21:55.0801277', N'30', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4943', N'2019-05-12 19:21:55.0801277', N'49', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4944', N'2019-05-12 19:21:55.0801278', N'31', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4945', N'2019-05-12 19:21:55.0801279', N'50', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4946', N'2019-05-12 19:21:55.0801280', N'32', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4947', N'2019-05-12 19:21:55.0801294', N'1032', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4948', N'2019-05-12 19:21:55.0801281', N'33', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4949', N'2019-05-12 19:21:55.0801282', N'35', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4950', N'2019-05-12 19:21:55.0801284', N'51', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4951', N'2019-05-12 19:21:55.0801284', N'36', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4952', N'2019-05-12 19:21:55.0801286', N'42', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4953', N'2019-05-12 19:21:55.0801286', N'53', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4954', N'2019-05-12 19:21:55.0801287', N'41', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4955', N'2019-05-12 19:21:55.0801288', N'43', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4956', N'2019-05-12 19:21:55.0801289', N'44', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4957', N'2019-05-12 19:21:55.0801290', N'54', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4958', N'2019-05-12 19:21:55.0801290', N'1027', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4959', N'2019-05-12 19:21:55.0801291', N'1028', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4960', N'2019-05-12 19:21:55.0801292', N'1030', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4961', N'2019-05-12 19:21:55.0801282', N'34', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'4962', N'2019-05-12 19:21:55.0801328', N'2055', N'14')
GO

SET IDENTITY_INSERT [dbo].[Sys_RoleMenu] OFF
GO


-- ----------------------------
-- Table structure for Sys_SubSystem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_SubSystem]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_SubSystem]
GO

CREATE TABLE [dbo].[Sys_SubSystem] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [TypeId] int  NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [Description] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Name] varchar(18) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ListOrder] int  NULL,
  [Icon] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsHide] tinyint  NULL
)
GO

ALTER TABLE [dbo].[Sys_SubSystem] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_SubSystem
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_SubSystem] ON
GO

INSERT INTO [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (N'1', N'1', N'2019-04-13 17:08:10.0000000', N'', N'系统管理', N'1', NULL, N'0')
GO

INSERT INTO [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (N'2', N'1', N'2019-04-13 17:08:10.0000000', N'', N'日常管理', N'1', NULL, N'0')
GO

INSERT INTO [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (N'3', N'1', N'2019-04-13 17:08:10.0000000', N'', N'客户管理', N'1', NULL, N'0')
GO

INSERT INTO [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (N'1002', N'2', N'2019-04-13 17:08:10.0000000', N'', N'涛涛涛涛', N'1', NULL, N'0')
GO

INSERT INTO [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (N'1003', N'3', N'2019-04-13 17:08:10.0000000', N'', N'风风风风', N'1', NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[Sys_SubSystem] OFF
GO


-- ----------------------------
-- Table structure for Sys_SubSystemType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_SubSystemType]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_SubSystemType]
GO

CREATE TABLE [dbo].[Sys_SubSystemType] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [Description] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Name] varchar(18) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_SubSystemType] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_SubSystemType
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_SubSystemType] ON
GO

INSERT INTO [dbo].[Sys_SubSystemType] ([Id], [CreateDateTime], [Description], [Name]) VALUES (N'1', N'2019-04-13 16:59:09.0000000', N'', N'系统管理')
GO

INSERT INTO [dbo].[Sys_SubSystemType] ([Id], [CreateDateTime], [Description], [Name]) VALUES (N'2', N'2019-04-13 16:59:09.0000000', N'', N'日常管理')
GO

INSERT INTO [dbo].[Sys_SubSystemType] ([Id], [CreateDateTime], [Description], [Name]) VALUES (N'3', N'2019-04-13 16:59:09.0000000', N'', N'客户管理')
GO

SET IDENTITY_INSERT [dbo].[Sys_SubSystemType] OFF
GO


-- ----------------------------
-- Table structure for Sys_SystemOption
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_SystemOption]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_SystemOption]
GO

CREATE TABLE [dbo].[Sys_SystemOption] (
  [Code] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Value] varchar(1000) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_SystemOption] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_SystemOption
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_SystemOption] ON
GO

INSERT INTO [dbo].[Sys_SystemOption] ([Code], [CreateDateTime], [Id], [Value]) VALUES (N'testCode', N'2018-03-20 22:43:08.4039973', N'1', N'testValue s')
GO

INSERT INTO [dbo].[Sys_SystemOption] ([Code], [CreateDateTime], [Id], [Value]) VALUES (N'testCoded', N'2018-03-20 22:47:42.3060094', N'4', N'asd')
GO

SET IDENTITY_INSERT [dbo].[Sys_SystemOption] OFF
GO


-- ----------------------------
-- Table structure for Sys_TableColumn
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_TableColumn]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_TableColumn]
GO

CREATE TABLE [dbo].[Sys_TableColumn] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [AddVisible] tinyint  NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [DataType] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Description] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [EditOrder] int  NOT NULL,
  [EditVisible] tinyint  NOT NULL,
  [EnumRange] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ExportVisible] tinyint  NOT NULL,
  [ImportVisible] tinyint  NOT NULL,
  [ListOrder] int  NOT NULL,
  [ListVisible] tinyint  NOT NULL,
  [MaxLength] int  NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [OutSql] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [PrimaryKey] tinyint  NOT NULL,
  [Required] tinyint  NOT NULL,
  [SearchVisible] tinyint  NOT NULL,
  [TableId] int  NOT NULL,
  [ViewOrder] int  NOT NULL,
  [ViewVisible] tinyint  NOT NULL,
  [SelectRange] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ForbiddenFileExtension] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ValidationRule] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [CustomContent] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ColumnWidth] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ColSpan] int DEFAULT ((0)) NULL,
  [DefaultValue] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [UploadMaximum] int DEFAULT ((1)) NULL,
  [UploadMinimum] int DEFAULT ((1)) NULL,
  [DateFormat] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_TableColumn] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] ON
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'45', N'0', N'2018-03-26 22:34:42.8216115', N'3', N'Id', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'2', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'46', N'0', N'2018-04-25 20:57:47.8253840', N'6', N'创建时间', N'0', N'0', NULL, N'1', N'0', N'0', N'1', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'2', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'47', N'1', N'2018-03-26 22:35:20.6118143', N'0', N'说明', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'Description', NULL, N'0', N'0', N'1', N'2', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'48', N'1', N'2018-03-26 22:35:29.7387448', N'0', N'负责人', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'Leader', NULL, N'0', N'0', N'1', N'2', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'49', N'1', N'2018-03-26 22:35:45.3368724', N'0', N'部门名称', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'Name', NULL, N'0', N'0', N'1', N'2', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'50', N'1', N'2018-05-05 21:45:30.3439584', N'5', N'上级部门', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'4', N'ParentId', N'Id,Name|Sys_Department|ParentId=0', N'0', N'0', N'0', N'2', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'59', N'0', N'2018-04-24 21:53:50.4923920', N'3', N' id', N'0', N'0', NULL, N'0', N'1', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'1009', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'60', N'1', N'2019-01-06 21:35:15.0091930', N'0', N'客户端IP', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'ClientIP', NULL, N'0', N'0', N'0', N'1009', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'61', N'1', N'2018-04-22 23:08:28.1379545', N'0', N'客户端MAC地址', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'ClientMac', NULL, N'0', N'0', N'0', N'1009', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'62', N'1', N'2018-04-22 23:08:39.8528457', N'6', N'登陆日期', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'1009', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'63', N'1', N'2018-04-22 23:08:51.8393514', N'3', N'用户Id', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'4', N'UserId', NULL, N'0', N'0', N'0', N'1009', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'64', N'1', N'2018-04-22 23:09:02.1984798', N'0', N'登陆人', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'UserName', NULL, N'0', N'0', N'0', N'1009', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'65', N'1', N'2018-04-22 23:09:11.1207025', N'0', N'说明', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'Description', NULL, N'0', N'0', N'0', N'1009', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1077', N'0', N'2019-04-13 16:47:32.2504490', N'Int', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'2013', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1078', N'0', N'2019-04-13 16:47:32.2508416', N'Datetime', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'0', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'2013', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1079', N'1', N'2019-04-13 16:59:58.1491245', N'String', N'说明', N'2', N'1', NULL, N'0', N'0', N'2', N'1', N'8000', N'Description', NULL, N'0', N'1', N'0', N'2013', N'2', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1080', N'1', N'2019-04-13 17:00:15.0911430', N'String', N'名称', N'1', N'1', NULL, N'0', N'0', N'1', N'1', N'8000', N'Name', NULL, N'0', N'1', N'0', N'2013', N'1', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1081', N'0', N'2019-04-13 16:47:36.4151291', N'Int', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1082', N'1', N'2019-04-13 17:21:32.0950307', N'Out', N'分类', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'4', N'TypeId', N'Id,Name|Sys_SubSystemType|id>0', N'0', N'1', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1083', N'0', N'2019-04-13 16:47:36.4151354', N'Datetime', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'0', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1084', N'1', N'2019-04-13 17:08:37.1606008', N'String', N'说明', N'2', N'1', NULL, N'0', N'0', N'2', N'1', N'8000', N'Description', NULL, N'0', N'0', N'0', N'2012', N'2', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1085', N'1', N'2019-04-13 17:29:08.7656978', N'String', N'子系统名称', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Name', NULL, N'0', N'1', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1086', N'1', N'2019-04-13 17:26:01.8395188', N'Int', N'显示顺序', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'10', N'ListOrder', NULL, N'0', N'0', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1087', N'1', N'2019-04-13 17:27:37.8590723', N'String', N'图标', N'0', N'1', NULL, N'0', N'0', N'0', N'0', N'200', N'Icon', NULL, N'0', N'10', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'1088', N'1', N'2019-04-13 17:29:57.4970330', N'Int', N'是否隐藏', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'10', N'IsHide', NULL, N'0', N'0', N'0', N'2012', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2077', N'1', N'2019-04-19 12:39:10.6491447', N'String', N'代码', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Code', NULL, N'0', N'1', N'0', N'2014', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2078', N'0', N'2019-04-19 12:38:07.7914124', N'Datetime', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'0', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'2014', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2079', N'0', N'2019-04-19 12:38:07.7914152', N'Int', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'2014', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2080', N'1', N'2019-04-19 12:38:56.4628711', N'String', N'值', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Value', NULL, N'0', N'1', N'0', N'2014', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2081', N'0', N'2019-04-19 16:58:23.9135068', N'Int', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'2015', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2082', N'1', N'2019-04-19 16:59:04.7640688', N'String', N'类型名称', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'50', N'Name', NULL, N'0', N'1', N'0', N'2015', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2083', N'0', N'2019-04-19 16:58:23.9141541', N'Datetime', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'0', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'2015', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2085', N'0', N'2019-05-01 21:02:12.8428773', N'Int', N'id', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2086', N'1', N'2019-05-05 19:49:48.3375734', N'Datetime', N'创建日期', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8', N'CreateDateTime', NULL, N'0', N'1', N'1', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2087', N'1', N'2019-05-01 20:59:45.8020691', N'String', N'名称', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'Name', NULL, N'1', N'1', N'1', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2088', N'1', N'2019-04-27 15:34:12.8298351', N'Out', N'上级', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'4', N'ParentId', N'id,name|sys_department', N'0', N'1', N'1', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2089', N'1', N'2019-05-01 21:11:39.4959533', N'MultiSelect_Out', N'多out导入', N'0', N'1', NULL, N'0', N'1', N'0', N'1', N'8000', N'Test', N'id,name|test_leader', N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, N'222px', N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2090', N'1', N'2019-05-03 19:48:38.7796998', N'MultiSelect', N'多选', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Test1', NULL, N'0', N'1', N'1', N'1011', N'0', N'1', N'1,选项1|2,选项2|3,选项3', NULL, NULL, NULL, NULL, N'0', N'defaultvalue', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2091', N'1', N'2019-05-11 23:28:39.6124789', N'String', N'ww', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Test2', NULL, N'0', N'0', N'1', N'1011', N'0', N'1', NULL, NULL, N'cnLetterNumber:true', NULL, NULL, N'0', NULL, N'5', N'1', N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2092', N'1', N'2019-05-11 20:37:13.8998952', N'MultiLine_String', N'多行', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'TestSync', NULL, N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, N'5', N'1', N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2093', N'1', N'2019-05-12 18:47:18.4788511', N'MultiSelect_Out', N'out保存外表', N'0', N'1', NULL, N'1', N'0', N'0', N'0', N'1111', N'Test_Leader_Leader', N'id,name|sys_leader|id>0|1|test_leader_leader|leaderid,otherleaderid', N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, N'cnLetterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd hh')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2094', N'0', N'2019-05-12 19:18:15.8646952', N'Int', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'Id', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2095', N'0', N'2019-05-12 19:20:40.2172401', N'String', N'IP', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'8000', N'ClientIP', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2096', N'0', N'2019-05-12 19:20:33.5077255', N'String', N'MAC', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'8000', N'ClientMac', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2097', N'0', N'2019-05-12 19:20:25.2287402', N'Datetime', N'操作时间', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'8', N'CreateDateTime', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2098', N'0', N'2019-05-12 19:20:16.4470043', N'String', N'说明', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'8000', N'OperationDescription', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2099', N'0', N'2019-05-12 19:19:56.7066481', N'String', N'Url', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'8000', N'OperationUrl', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2100', N'0', N'2019-05-12 19:18:15.8649148', N'Int', NULL, N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'4', N'UserId', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2101', N'0', N'2019-05-12 19:19:40.4180955', N'String', N'操作用户', N'0', N'0', NULL, N'0', N'0', N'0', N'1', N'8000', N'UserName', NULL, N'0', N'0', N'0', N'2016', N'0', N'0', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

SET IDENTITY_INSERT [dbo].[Sys_TableColumn] OFF
GO


-- ----------------------------
-- Table structure for Sys_TableList
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_TableList]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_TableList]
GO

CREATE TABLE [dbo].[Sys_TableList] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [DefaultFilter] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DefaultSort] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DeleteTableName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Description] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ExtendFunction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ForbiddenAddFilter] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ForbiddenDeleteFilter] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ForbiddenUpdateFilter] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ImportType] tinyint  NOT NULL,
  [IsView] tinyint  NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AllowDelete] tinyint DEFAULT ((0)) NOT NULL,
  [AllowEdit] tinyint DEFAULT ((0)) NOT NULL,
  [AllowExport] tinyint DEFAULT ((0)) NOT NULL,
  [AllowImport] tinyint DEFAULT ((0)) NOT NULL,
  [AllowView] tinyint DEFAULT ((0)) NOT NULL,
  [AllowAdd] tinyint DEFAULT ((0)) NOT NULL,
  [AllowDetail] tinyint DEFAULT ((0)) NOT NULL,
  [TopExtendFunction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ColumnPerRow] int DEFAULT ((1)) NULL,
  [ViewEditWidthHeight] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ListPageJavaScript] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPageJavaScript] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [EditPageJavaScript] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DetailPageJavaScript] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [CustomCssStyle] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [BatchOperation] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [SearchColumnPerRow] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_TableList] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_TableList
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_TableList] ON
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'1009', N'2019-05-12 19:14:00.9883609', N'Id != 0', N'Id desc', N'Sys_LoginLog', N'登录日志', N'test', N'UserName != admin', N'Id < 0', N'Id > 100', N'0', N'0', N'Sys_LoginLog', N'0', N'0', N'0', N'0', N'1', N'0', N'0', N'<button type="button" class="btn btn-warning" onclick="Clear()">清除</button>', N'0', NULL, N' function Clear() {
            lkWeb.Confirm(''确认清除？'', function () {
                lkWeb.AjaxPost("/Admin/Log/ClearLoginLog/", {}, function () {
                    parent.layer.alert("清除成功");
                    lkTable.draw(false);
                })
            })

        }', N'console.log(''add'')', N'console.log(''edit'')', N'console.log(''detail'')', NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'1011', N'2019-05-02 22:56:46.0061124', NULL, NULL, N'Test_Leader', N'测试领导管理', NULL, NULL, NULL, NULL, N'1', N'0', N'Test_Leader', N'1', N'1', N'1', N'1', N'1', N'1', N'1', NULL, N'3', N'300px,300', N'console.log(''listpagejs'')', NULL, NULL, NULL, NULL, N'IsTop|是否置顶', N'2')
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'2012', N'2019-04-13 16:46:29.8435282', NULL, NULL, N'Sys_SubSystem', N'子系统管理', NULL, NULL, NULL, NULL, N'0', N'0', N'Sys_SubSystem', N'1', N'1', N'0', N'0', N'1', N'1', N'0', NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'2013', N'2019-04-13 16:47:21.2548515', NULL, NULL, N'Sys_SubSystemType', N'子系统类型', NULL, NULL, NULL, NULL, N'0', N'0', N'Sys_SubSystemType', N'1', N'1', N'0', N'0', N'1', N'1', N'0', NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'2014', N'2019-04-19 12:38:01.8680508', NULL, NULL, N'Sys_SystemOption', N'系统配置', NULL, NULL, NULL, NULL, N'0', N'0', N'Sys_SystemOption', N'1', N'1', N'0', N'0', N'1', N'1', N'0', NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'2015', N'2019-04-19 17:01:58.6425611', NULL, NULL, N'Sys_InfoType', N'信息类别', NULL, NULL, NULL, NULL, N'0', N'0', N'Sys_InfoType', N'1', N'1', N'0', N'0', N'1', N'1', N'0', NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [ListPageJavaScript], [AddPageJavaScript], [EditPageJavaScript], [DetailPageJavaScript], [CustomCssStyle], [BatchOperation], [SearchColumnPerRow]) VALUES (N'2016', N'2019-05-12 19:24:14.7100623', NULL, NULL, N'Sys_OperationLog', N'操作日志', NULL, NULL, NULL, NULL, N'0', N'0', N'Sys_OperationLog', N'0', N'0', N'0', N'0', N'1', N'0', N'0', N'<button type="button" class="btn btn-warning" onclick="Clear()">清除</button>', N'0', NULL, N' function Clear() {
            lkWeb.Confirm(''确认清除？'', function () {
                lkWeb.AjaxPost("/Admin/Log/ClearOperationLog/", {}, function () {
                    parent.layer.alert("清除成功");
                    lkTable.draw(false);
                })
            })
        }', NULL, NULL, NULL, NULL, NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[Sys_TableList] OFF
GO


-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_User]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_User]
GO

CREATE TABLE [dbo].[Sys_User] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [AccessFailedCount] int  NULL,
  [Email] nvarchar(256) COLLATE Chinese_PRC_CI_AS  NULL,
  [Password] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PhoneNumber] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RealName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Status] tinyint  NOT NULL,
  [UserName] nvarchar(256) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreateDateTime] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[Sys_User] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'邮箱',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'Email'
GO


-- ----------------------------
-- Records of Sys_User
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_User] ON
GO

INSERT INTO [dbo].[Sys_User] ([Id], [AccessFailedCount], [Email], [Password], [PhoneNumber], [RealName], [Status], [UserName], [CreateDateTime]) VALUES (N'1', N'0', N'admin@admin.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'管理员呢', N'2', N'admin', N'2018-02-02 12:33:33.0000000')
GO

INSERT INTO [dbo].[Sys_User] ([Id], [AccessFailedCount], [Email], [Password], [PhoneNumber], [RealName], [Status], [UserName], [CreateDateTime]) VALUES (N'13', N'0', N'sa@sa.com', N'7dd4794fdc355f2b89224670267a9758', NULL, N'超级管理员', N'2', N'sa', N'2019-05-12 20:14:01.5173256')
GO

INSERT INTO [dbo].[Sys_User] ([Id], [AccessFailedCount], [Email], [Password], [PhoneNumber], [RealName], [Status], [UserName], [CreateDateTime]) VALUES (N'14', NULL, N'asd@123.com', N'202cb962ac59075b964b07152d234b70', NULL, N'A', N'3', N'BBB', N'2019-05-12 19:00:19.1149772')
GO

SET IDENTITY_INSERT [dbo].[Sys_User] OFF
GO


-- ----------------------------
-- Table structure for Sys_UserDepartment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_UserDepartment]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_UserDepartment]
GO

CREATE TABLE [dbo].[Sys_UserDepartment] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [DepartmentId] int  NOT NULL,
  [UserId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_UserDepartment] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_UserDepartment
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_UserDepartment] ON
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'2', N'2018-02-05 20:27:10.2430634', N'7', N'1')
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'5', N'2018-03-05 22:28:35.0229550', N'5', N'1')
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'1005', N'2019-01-11 09:09:51.9542849', N'7', N'13')
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'1006', N'2019-01-11 09:18:51.1068371', N'6', N'13')
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'1007', N'2019-01-11 09:18:51.1068387', N'6', N'1')
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'1008', N'2019-01-11 09:33:18.5516729', N'13', N'13')
GO

INSERT INTO [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (N'1009', N'2019-01-11 09:33:18.5516746', N'13', N'1')
GO

SET IDENTITY_INSERT [dbo].[Sys_UserDepartment] OFF
GO


-- ----------------------------
-- Table structure for Sys_UserRole
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_UserRole]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_UserRole]
GO

CREATE TABLE [dbo].[Sys_UserRole] (
  [UserId] int  NOT NULL,
  [RoleId] int  NOT NULL,
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[Sys_UserRole] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_UserRole
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_UserRole] ON
GO

INSERT INTO [dbo].[Sys_UserRole] ([UserId], [RoleId], [Id], [CreateDateTime]) VALUES (N'1', N'5', N'1013', N'2019-05-12 19:07:09.2472570')
GO

INSERT INTO [dbo].[Sys_UserRole] ([UserId], [RoleId], [Id], [CreateDateTime]) VALUES (N'13', N'14', N'1012', N'2019-05-12 12:22:22.0000000')
GO

SET IDENTITY_INSERT [dbo].[Sys_UserRole] OFF
GO


-- ----------------------------
-- Table structure for Sys_ValueList
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_ValueList]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_ValueList]
GO

CREATE TABLE [dbo].[Sys_ValueList] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Code] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateDateTime] datetime2(7)  NULL,
  [Value] varchar(1000) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ParentId] int  NULL,
  [Name] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Description] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ListOrder] int  NULL
)
GO

ALTER TABLE [dbo].[Sys_ValueList] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_ValueList
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sys_ValueList] ON
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'2', N'sex', N'2019-04-19 15:33:31.0884542', N'sex', N'0', N'性别', N'性别', N'1')
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'3', N'man', N'2019-04-19 15:54:39.4212143', N'男', N'2', N'男', NULL, N'1')
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'5', N'minzu', N'2019-04-19 15:59:31.9839747', N'民族', N'0', N'民族', N'民族噢', N'2')
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'6', N'hanzu', N'2019-04-19 16:00:42.2570049', N'汉族', N'5', N'汉族', NULL, N'1')
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'10', N'political', N'2019-05-12 20:15:26.1136252', N'1', N'0', N'政治面貌', N'political', N'3')
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'18', NULL, N'2019-05-12 20:25:56.0004692', N'fff', N'13', N'ggg', NULL, N'0')
GO

INSERT INTO [dbo].[Sys_ValueList] ([Id], [Code], [CreateDateTime], [Value], [ParentId], [Name], [Description], [ListOrder]) VALUES (N'19', N'hh', N'2019-05-12 20:26:03.8276411', N'hh', N'13', N'gg', NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[Sys_ValueList] OFF
GO


-- ----------------------------
-- Table structure for Test_Leader
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Test_Leader]') AND type IN ('U'))
	DROP TABLE [dbo].[Test_Leader]
GO

CREATE TABLE [dbo].[Test_Leader] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreateDateTime] datetime2(7)  NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] int  NULL,
  [Test] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Test1] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Test2] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [TestSync] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsTop] int  NULL
)
GO

ALTER TABLE [dbo].[Test_Leader] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Test_Leader
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Test_Leader] ON
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'4', N'2019-01-08 20:59:53.0000000', N'ddddd', N'7', N'1015', N'2', N'2019-01-03', N'asdA', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'1015', N'2019-01-13 21:23:50.0000000', N'bbbcD', N'5', N'回族', N'6', N'/Upload/2019/0113/Debian_Python3.6_20190113094406.sh', N'E', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'1016', N'2019-01-13 21:23:50.0000000', N'bbbc', N'5', N'4', N'defaultvalue', N'', N'<p>D</p>', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'1017', N'2019-01-13 22:08:09.0000000', N'阿斯顿', N'0', N'汉族,哈哈', N'的身份', N'/Upload/2019/0113/Debian_Python3.6_20190113100808.sh', N'C', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2006', N'2019-01-16 10:14:36.0000000', N'w', N'0', N'1015,1017', N'', N'', N'asd', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2007', N'2019-01-17 14:03:45.0000000', N'S试试', N'0', N'试试', N'/Upload/2019/0117/b703e6910f60f56f6db2b128f8fced21_20190117020339.jpg', N'啊', N'A', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2008', N'2019-01-17 14:05:23.0000000', N'22', N'0', N'2', N'/Upload/2019/0117/b703e6910f60f56f6db2b128f8fced21_20190117020519.jpg', N'2', N'A', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2011', N'2019-04-27 12:22:41.0000000', N'信息管理', N'0', N'asd', N'ads', N'/Upload/2019/0427/待购买烟丝_20190427122018.png', N'<p>sdasd<br/></p>', N'1')
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2014', N'2019-05-02 19:03:52.0000000', N'订单', N'5', N'4', N'defaultvalue', N'/Upload/2019/0502/附件2：奖学金获奖情况登记表(9)_20190502070338.doc', N'<p>方法</p>', NULL)
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2015', N'2019-05-03 19:49:09.0000000', N'阿萨大', N'5', NULL, N'1,3', N'', N'<p>阿萨大</p>', NULL)
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2016', N'2019-05-03 23:13:24.0000000', N'测试select2', N'14', N'1015,2006', N'2,3', N'', N'<p>阿萨大阿萨大</p>', NULL)
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'3017', N'2019-05-08 21:23:27.0000000', N'测试多文件噢', N'5', N'1015', N'2', N'/Upload/2019/0508/2019年上半年全国计算机技术与软件专业技术资格（水平）考试天津地区报名简章_20190508092239.docx,/Upload/2019/0508/3软件项目开发计划书_20190508092244.doc', N'222', NULL)
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'3020', N'2019-05-08 22:27:50.0000000', N'', N'5', NULL, N'defaultvalue', N'', N'', NULL)
GO

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'3021', N'2019-05-08 22:43:36.0000000', N'TypeId', N'5', N'1015', N'2', N'/Upload/2019/0509/28130113513551_20190509102713.png,/Upload/2019/0509/16120222551001_20190509102716.png', N'/Upload/2019/0509/2019年上半年全国计算机技术与软件专业技术资格（水平）考试天津地区报名简章_20190509103359.docx,/Upload/2019/0509/3软件项目开发计划书_20190509103428.doc', NULL)
GO

SET IDENTITY_INSERT [dbo].[Test_Leader] OFF
GO


-- ----------------------------
-- Table structure for Test_Leader_Leader
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Test_Leader_Leader]') AND type IN ('U'))
	DROP TABLE [dbo].[Test_Leader_Leader]
GO

CREATE TABLE [dbo].[Test_Leader_Leader] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [LeaderId] int  NULL,
  [OtherLeaderId] int  NULL
)
GO

ALTER TABLE [dbo].[Test_Leader_Leader] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Test_Leader_Leader
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Test_Leader_Leader] ON
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'8', N'2012', N'5')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'9', N'2013', N'4')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'10', N'2013', N'1015')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'11', N'2013', N'1016')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'12', N'2013', N'2008')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'14', N'2014', N'4')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'16', N'2015', N'4')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'19', N'2016', N'2007')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'1019', N'3017', N'4')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'1024', N'3021', N'1015')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId]) VALUES (N'2020', N'4', N'4')
GO

SET IDENTITY_INSERT [dbo].[Test_Leader_Leader] OFF
GO


-- ----------------------------
-- Primary Key structure for table Sys_Department
-- ----------------------------
ALTER TABLE [dbo].[Sys_Department] ADD CONSTRAINT [PK_Sys_Department] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_File
-- ----------------------------
ALTER TABLE [dbo].[Sys_File] ADD CONSTRAINT [PK_Sys_File] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_InfoRelease
-- ----------------------------
ALTER TABLE [dbo].[Sys_InfoRelease] ADD CONSTRAINT [PK_Sys_InfoRelease] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_InfoType
-- ----------------------------
ALTER TABLE [dbo].[Sys_InfoType] ADD CONSTRAINT [PK_Sys_InfoType] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_LoginLog
-- ----------------------------
ALTER TABLE [dbo].[Sys_LoginLog] ADD CONSTRAINT [PK_Sys_LoginLog] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_Menu
-- ----------------------------
ALTER TABLE [dbo].[Sys_Menu] ADD CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_OperationLog
-- ----------------------------
ALTER TABLE [dbo].[Sys_OperationLog] ADD CONSTRAINT [PK_Sys_OperationLog] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_Role
-- ----------------------------
ALTER TABLE [dbo].[Sys_Role] ADD CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Sys_RoleMenu
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Sys_RoleMenu_RoleId]
ON [dbo].[Sys_RoleMenu] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Sys_RoleMenu
-- ----------------------------
ALTER TABLE [dbo].[Sys_RoleMenu] ADD CONSTRAINT [PK_Sys_RoleMenu] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_SubSystem
-- ----------------------------
ALTER TABLE [dbo].[Sys_SubSystem] ADD CONSTRAINT [PK_Sys_SubSystem] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_SubSystemType
-- ----------------------------
ALTER TABLE [dbo].[Sys_SubSystemType] ADD CONSTRAINT [PK_Sys_SubSystemType] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_SystemOption
-- ----------------------------
ALTER TABLE [dbo].[Sys_SystemOption] ADD CONSTRAINT [PK_Sys_SystemOption] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Sys_TableColumn
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Sys_TableColumn_TableId]
ON [dbo].[Sys_TableColumn] (
  [TableId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Sys_TableColumn
-- ----------------------------
ALTER TABLE [dbo].[Sys_TableColumn] ADD CONSTRAINT [PK_Sys_TableColumn] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_TableList
-- ----------------------------
ALTER TABLE [dbo].[Sys_TableList] ADD CONSTRAINT [PK_Sys_TableList] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_User
-- ----------------------------
ALTER TABLE [dbo].[Sys_User] ADD CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Sys_UserDepartment
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Sys_UserDepartment_DepartmentId]
ON [dbo].[Sys_UserDepartment] (
  [DepartmentId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_Sys_UserDepartment_UserId]
ON [dbo].[Sys_UserDepartment] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Sys_UserDepartment
-- ----------------------------
ALTER TABLE [dbo].[Sys_UserDepartment] ADD CONSTRAINT [PK_Sys_UserDepartment] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Sys_UserRole
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Sys_UserRole_RoleId]
ON [dbo].[Sys_UserRole] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Sys_UserRole
-- ----------------------------
ALTER TABLE [dbo].[Sys_UserRole] ADD CONSTRAINT [PK_Sys_UserRole] PRIMARY KEY CLUSTERED ([UserId], [RoleId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_ValueList
-- ----------------------------
ALTER TABLE [dbo].[Sys_ValueList] ADD CONSTRAINT [PK_Sys_ValueList] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Test_Leader
-- ----------------------------
ALTER TABLE [dbo].[Test_Leader] ADD CONSTRAINT [PK_Test_Leader] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Test_Leader_Leader
-- ----------------------------
ALTER TABLE [dbo].[Test_Leader_Leader] ADD CONSTRAINT [PK_Test_Leader_Leader] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

