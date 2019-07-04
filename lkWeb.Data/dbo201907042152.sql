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

 Date: 04/07/2019 21:52:08
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

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12422', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:17:14.2786428', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12423', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:25:59.6683792', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12424', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:06.2137346', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12425', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:20.1020350', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12426', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:18.2458844', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12427', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:09:58.4483250', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12428', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:11:53.8210465', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12429', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:29.1519250', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12430', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:15.8398222', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12431', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:17.3238793', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12432', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:46:03.8172307', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12433', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:36:42.3347392', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12434', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:40:34.1354322', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12435', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:46:40.6500591', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12436', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:10.0281665', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12437', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:58.1402474', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12438', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:55:58.0126030', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12439', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:38.2274412', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12440', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:43.0901971', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12441', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:33.3873190', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12442', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:02:53.0035121', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12443', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:26.3985834', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12444', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:36.0382454', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12445', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:28.8786957', N'0', N'sa', N'登陆失败,请检查输入的信息')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12446', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:33.1811746', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12447', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:24.0650702', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12448', N'', N'00-50-56-C0-00-01', N'2019-05-17 22:55:28.9913760', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12449', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:12.4976400', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12450', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:07:54.7005340', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12451', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:08:59.8132942', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12452', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:49.1080557', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12453', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:10.1026089', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12454', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:03:08.2653257', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12455', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:31.5202868', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12456', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:41.2084511', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12457', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:09:33.8857638', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12458', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:33.2285600', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12459', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:42.4695809', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12460', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:21.7210273', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12461', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:28:56.8846995', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12462', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:11.8407797', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12463', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:13:42.4460380', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12464', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:09.8512007', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12465', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:26.3787415', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'12466', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:23.4787756', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'13422', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:46.4776954', N'0', N'sa', N'登陆成功')
GO

INSERT INTO [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (N'13423', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:24:01.8353149', N'0', N'sa', N'登陆成功')
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

INSERT INTO [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (N'3056', N'2019-05-14 21:49:20.1355945', N'错误日志', N'3', N'55', N'1', N'/admin/log/error', N'1', N'fa')
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

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12373', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:17:09.2057129', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12374', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:17:08.8652197', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12375', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:17:15.6486930', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12376', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:17:17.1530628', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12377', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:17:43.1298807', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12378', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:25:55.2868192', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12379', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:25:55.6131573', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12380', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:26:00.9993410', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12381', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:26:02.1928047', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12382', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:26:05.2616151', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12383', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:26:26.9761289', N'访问', N'/admin/menu/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12384', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:01.0426937', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12385', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:01.3404605', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12386', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:07.5528104', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12387', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:08.4952541', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12388', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:11.6294897', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12389', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:55:18.3659185', N'访问', N'/admin/tablecolumn/edit/2093', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12390', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:56:50.4911520', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12391', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:57:04.0962401', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12392', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:57:29.9361748', N'访问', N'/admin/tablecolumn/edit/2086', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12393', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 20:57:52.1436021', N'访问', N'/admin/tablecolumn/edit/2091', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12394', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:14.9666651', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12395', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:15.2955482', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12396', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:21.4839454', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12397', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:22.4699106', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12398', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:28.1041626', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12399', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:49.1545086', N'访问', N'/admin/tablecolumn/edit/2091', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12400', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:56.9737521', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12401', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:00:59.6197288', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12402', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:01:15.6550232', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12403', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:01:22.4564313', N'访问', N'/admin/tablecolumn/edit/2093', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12404', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:01:44.0435594', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12405', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:01:47.6595738', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12406', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:03:04.4473302', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12407', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:03:36.8135162', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12408', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:04:29.0692037', N'访问', N'/admin/tablecolumn/edit/2093', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12409', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:04:54.8940458', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12410', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:04:58.0790028', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12411', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:05:08.0441813', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12412', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:05:15.9006133', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12413', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:05:21.1482744', N'访问', N'/admin/tablecolumn/edit/2093', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12414', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:05:31.3502753', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12415', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:05:33.1236906', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12416', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:13.3264276', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12417', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:13.7947367', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12418', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:19.9571721', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12419', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:21.0256743', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12420', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:24.0423284', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12421', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:08:27.8037648', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12422', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:09:52.6703376', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12423', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:09:53.0510319', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12424', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:09:59.8885990', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12425', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:10:01.7492629', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12426', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:10:05.2790802', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12427', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:10:09.0787466', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12428', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:11:49.1065278', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12429', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:11:49.4427478', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12430', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:11:55.1882790', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12431', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:11:56.3547256', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12432', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:12:01.8486591', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12433', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:12:04.9907338', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12434', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:12:53.1800040', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12435', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:12:56.8923114', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12436', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:24.3768533', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12437', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:24.7256081', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12438', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:30.5007409', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12439', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:31.5957614', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12440', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:37.3947992', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12441', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:40.3619033', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12442', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:50.9054525', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12443', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:21:57.8724036', N'访问', N'/admin/tablecolumn/edit/2093', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12444', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:22:16.2104875', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12445', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:22:36.4625086', N'访问', N'/admin/viewlist/edit/1015/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12446', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:22:40.9378211', N'访问', N'/admin/viewlist/edit/1017/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12447', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:22:45.1074893', N'访问', N'/admin/viewlist/edit/2006/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12448', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:23:11.5989935', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12449', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:23:30.9817745', N'访问', N'/admin/viewlist/edit/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12450', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:11.0780009', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12451', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:11.3439848', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12452', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:17.1612957', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12453', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:17.9788378', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12454', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:20.1039014', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12455', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:21.3877519', N'访问', N'/admin/menu/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12456', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:41:52.0141314', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12457', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:42:04.1445888', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12458', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:42:11.4811688', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12459', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:12.2332834', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12460', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:12.5449574', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12461', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:18.6661973', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12462', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:19.6396245', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12463', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:22.7321865', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12464', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:43:44.8422868', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12465', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:45:58.1805345', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12466', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:45:58.4463801', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12467', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:46:05.1778065', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12468', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:46:06.1808376', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12469', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:46:11.0118446', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12470', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:46:22.7517907', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12471', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:46:25.0020571', N'访问', N'/admin/menu/edit/3056', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12472', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:48:20.0248895', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12473', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:48:20.4372482', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12474', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:48:23.0951415', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12475', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:48:26.5014209', N'访问', N'/admin/menu/edit/3056', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12476', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:48:33.3405013', N'访问', N'/admin/menu/edit/3056', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12477', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:02.9794819', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12478', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:05.3020999', N'访问', N'/admin/menu/edit/3056', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12479', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:15.2290946', N'访问', N'/admin/menu/edit/3056', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12480', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:21.8211585', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12481', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:29.6968769', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12482', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:30.9199704', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12483', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:30.9910037', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12484', N'127.0.0.1', N'00-00-00-00-00-00', N'2019-05-14 21:49:32.7140760', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12485', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:36:22.5423989', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12486', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:36:23.0067187', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12487', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:36:43.8393293', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12488', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:36:45.2916151', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12489', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:36:53.0688521', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12490', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:40:29.1145439', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12491', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:40:29.5302326', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12492', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:40:35.6862932', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12493', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:40:36.7322971', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12494', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:40:40.3855001', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12495', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:46:35.5206307', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12496', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:46:36.0396807', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12497', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:46:42.1691023', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12498', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:46:43.4766613', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12499', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:46:46.2047316', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12500', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:04.8109745', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12501', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:05.3373133', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12502', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:11.5291733', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12503', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:12.5611808', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12504', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:15.4394499', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12505', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:53.1516331', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12506', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:53.6784670', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12507', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:53:59.6376128', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12508', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:54:00.8736076', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12509', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:54:03.2654460', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12510', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:54:27.8970644', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12511', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:55:52.4185013', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12512', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:55:52.9137405', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12513', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:55:59.4964302', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12514', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:56:00.5974665', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12515', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:56:03.0518706', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12516', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:33.3443367', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12517', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:33.7978105', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12518', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:44.5773850', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12519', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:45.7931137', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12520', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:47.9134800', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12521', N'', N'00-50-56-C0-00-08', N'2019-05-15 16:58:54.0582968', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12522', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:00:11.5359130', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12523', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:00:15.1868455', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12524', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:00:34.8986771', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12525', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:01:16.1574805', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12526', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:01:18.5292686', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12527', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:01:32.4062216', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12528', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:01:34.3692982', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12529', N'', N'00-50-56-C0-00-08', N'2019-05-15 17:01:39.8418808', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12530', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:25.7493734', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12531', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:25.5008287', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12532', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:35.4834430', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12533', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:37.2100638', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12534', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:58.3002232', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12535', N'', N'00-50-56-C0-00-01', N'2019-05-16 20:26:59.8825861', N'访问', N'/admin/user/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12536', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:02:47.6051030', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12537', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:02:47.8520910', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12538', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:02:54.4698929', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12539', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:02:55.5292416', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12540', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:02:59.8519650', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12541', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:03:01.8244435', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12542', N'', N'00-50-56-C0-00-01', N'2019-05-16 21:03:03.6718448', N'访问', N'/admin/user/edit/14', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12543', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:21.6141723', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12544', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:21.8877380', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12545', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:27.7729479', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12546', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:28.6823346', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12547', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:30.0358111', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12548', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:31.3399491', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12549', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:42:32.3785543', N'访问', N'/admin/user/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12550', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:31.1963294', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12551', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:31.4757251', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12552', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:37.3958240', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12553', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:38.2256403', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12554', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:42.0214795', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12555', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:42.6391769', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12556', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:47.9459494', N'访问', N'/admin/user/edit/1016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12557', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:43:55.4955186', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12558', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:45:48.3076890', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12559', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:45:48.5634050', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12560', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:24.3886454', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12561', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:24.6667559', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12562', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:34.4669881', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12563', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:35.3129786', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12564', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:40.8646319', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12565', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:42.8570134', N'访问', N'/admin/user/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12566', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:46:53.2446850', N'访问', N'/admin/user/authen/1017', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12567', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:02.3626646', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12568', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:02.9939216', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12569', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:04.2496972', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12570', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:05.0323056', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12571', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:14.3773086', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12572', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:15.1608886', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12573', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:15.9962801', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12574', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:16.9982735', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12575', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:17.7462104', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12576', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:24.8684433', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12577', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:25.3204420', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12578', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:36.5585874', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12579', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:40.7678173', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12580', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:47:44.5219061', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12581', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:49:41.7494196', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12582', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:49:44.1085898', N'访问', N'/admin/viewlist/add/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12583', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:49:50.3745073', N'访问', N'/admin/viewlist/edit/2002/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12584', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:01.7506018', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12585', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:02.6560935', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12586', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:03.0406661', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12587', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:03.5181757', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12588', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:04.9650085', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12589', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:07.0957207', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12590', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:14.2243745', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12591', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:15.1125722', N'访问', N'/admin/viewlist/index/2015', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12592', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:15.8560470', N'访问', N'/admin/inforelease/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12593', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:17.2653340', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12594', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:18.7858252', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12595', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:19.3300839', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12596', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:20.0631214', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12597', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:21.3617600', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12598', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:23.6873796', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12599', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:25.0480230', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12600', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:25.7675463', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12601', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:26.1350905', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12602', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:28.4538174', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12603', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:29.1602540', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12604', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:29.7503686', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12605', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:30.3766907', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12606', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:50:31.3611134', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12607', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:35.4944295', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12608', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:36.1210702', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12609', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:36.8469063', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12610', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:39.6865622', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12611', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:40.1698665', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12612', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:40.6787596', N'访问', N'/admin/viewlist/index/2014', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12613', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:43.0162734', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12614', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:45.6565880', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12615', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:46.3350411', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12616', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:52:47.0158477', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12617', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:53:30.1353005', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12618', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:53:33.8976080', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12619', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:53:42.0394656', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12620', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:53:42.6572245', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12621', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:07.9207461', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12622', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:08.3808853', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12623', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:11.5242584', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12624', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:12.9837889', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12625', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:13.7992376', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12626', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:15.4454820', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12627', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:16.4662548', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12628', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:17.2469310', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12629', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:17.7266159', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12630', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:24.1023556', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12631', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:25.0443226', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12632', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:25.8572587', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12633', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:26.5956627', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12634', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:27.1802155', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12635', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:27.8123110', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12636', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:28.8403780', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12637', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:33.6946776', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12638', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:34.2499646', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12639', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:34.8495198', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12640', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:39.5841716', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12641', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:41.1592906', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12642', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:43.9611604', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12643', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:44.5649105', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12644', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:45.1499990', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12645', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:45.9036923', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12646', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:46.4636692', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12647', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:46.9356414', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12648', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:47.3671878', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12649', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:48.9342101', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12650', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:49.4880722', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12651', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:50.0104114', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12652', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:50.4252920', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12653', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:50.7841749', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12654', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:51.3292690', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12655', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:51.8964084', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12656', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:52.2820024', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12657', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:52.9491022', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12658', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:56.3554544', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12659', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:54:57.8396712', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12660', N'', N'00-50-56-C0-00-01', N'2019-05-16 22:55:07.5833382', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12661', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:18.8165533', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12662', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:18.4952969', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12663', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:25.4659989', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12664', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:26.8234683', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12665', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:33.9736679', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12666', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:35.5167939', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12667', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:37.1604316', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12668', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:38.1746702', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12669', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:39.1980748', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12670', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:40.6010759', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12671', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:41.4375563', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12672', N'', N'00-50-56-C0-00-01', N'2019-05-17 21:07:42.2846400', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12673', N'', N'00-50-56-C0-00-01', N'2019-05-17 22:55:23.7153499', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12674', N'', N'00-50-56-C0-00-01', N'2019-05-17 22:55:24.2742526', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12675', N'', N'00-50-56-C0-00-01', N'2019-05-17 22:55:30.5803023', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12676', N'', N'00-50-56-C0-00-01', N'2019-05-17 22:55:31.7120130', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12677', N'', N'00-50-56-C0-00-01', N'2019-05-17 22:55:40.4143274', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12678', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:04.4016250', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12679', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:05.3717805', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12680', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:14.4548807', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12681', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:17.1410794', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12682', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:20.1705389', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12683', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:22.6539242', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12684', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:24.6211236', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12685', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:26.6538796', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12686', N'', N'00-50-56-C0-00-01', N'2019-05-17 23:00:31.0259210', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12687', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:04:31.1661967', N'访问', N'/admin/home', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12688', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:04:31.7204637', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12689', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:07:45.5627409', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12690', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:07:45.8749136', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12691', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:07:56.1774482', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12692', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:07:57.2717270', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12693', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:08:48.2874640', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12694', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:08:48.8430426', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12695', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:01.3240502', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12696', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:02.4182331', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12697', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:07.1309749', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12698', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:09.5720493', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12699', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:12.1391497', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12700', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:13.2735734', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12701', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:14.2848670', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12702', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:15.3833278', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12703', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:09:20.3609842', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12704', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:23:30.9351300', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12705', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:23:32.1699140', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12706', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:23:45.3710374', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12707', N'', N'00-50-56-C0-00-08', N'2019-05-19 15:23:46.4530159', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12708', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:37:59.2118894', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12709', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:37:59.6981819', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12710', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:37:59.8465231', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12711', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:29.9359569', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12712', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:29.9521674', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12713', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:29.9681002', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12714', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:33.2229804', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12715', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:33.2529624', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12716', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:34.4053227', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12717', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:38:34.4335174', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12718', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:17.0582133', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12719', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:17.0752026', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12720', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:17.9880476', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12721', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:18.0293574', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12722', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:51.9273730', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12723', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:52.4808956', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12724', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:55.8731797', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12725', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:39:55.9026899', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12726', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:15.3961362', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12727', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:15.4296684', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12728', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:27.8928749', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12729', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:27.9064092', N'访问', N'/Admin/Control/Error', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12730', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:35.5708200', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12731', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:50.8590945', N'访问', N'/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12732', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:40:51.6153393', N'访问', N'/Admin/Control/Error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12733', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:41:46.0285588', N'访问', N'/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12734', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:41:46.3025002', N'访问', N'/Admin/Control/Error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12735', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:05.0140797', N'访问', N'/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12736', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:08.2305708', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12737', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:09.0660965', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12738', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:21.9015012', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12739', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:23.2373598', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12740', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:24.2893746', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12741', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:25.2534578', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12742', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:26.1262831', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12743', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:27.5114198', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12744', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:29.7605316', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12745', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:31.9650295', N'访问', N'/admin/log/error', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12746', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:45.4339760', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12747', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:46.6086621', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12748', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:50.9290614', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12749', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:52.7744828', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12750', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:53.1546835', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12751', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:54.0408782', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12752', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:54.6697429', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12753', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:55.3502273', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12754', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:56.5524729', N'访问', N'/admin/viewlist/index/2013', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12755', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:57.3002571', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12756', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:58.0780916', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12757', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:58.8659510', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12758', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:42:59.7607371', N'访问', N'/admin/viewlist/index/2014', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12759', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:01.9003104', N'访问', N'/admin/user/editcurrent', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12760', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:07.2395633', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12761', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:07.8268470', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12762', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:08.3956719', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12763', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:09.1035001', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12764', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:09.9109536', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12765', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:11.1530005', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12766', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:11.7845975', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12767', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:12.9701311', N'访问', N'/admin/tablelist/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12768', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:17.0973358', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12769', N'', N'00-50-56-C0-00-08', N'2019-05-19 16:43:20.2461619', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12770', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:36:05.2426211', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12771', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:36:05.9034049', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12772', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:36:20.4945549', N'访问', N'/Admin/home/choosesystem', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12773', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:36:20.5096534', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12774', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:37:03.3127257', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12775', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:37:03.8304012', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12776', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:38:09.2240417', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12777', N'', N'00-50-56-C0-00-08', N'2019-05-19 18:38:09.7250316', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12778', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:02.7002617', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12779', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:03.2524552', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12780', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:11.4938269', N'访问', N'/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12781', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:13.7177743', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12782', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:14.1683250', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12783', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:17.3883431', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12784', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:20.8933414', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12785', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:21.7175555', N'访问', N'/admin/viewlist/index/1009', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12786', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:22.4316116', N'访问', N'/admin/log/chart', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12787', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:24.0856434', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12788', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:24.8802674', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12789', N'', N'00-50-56-C0-00-08', N'2019-05-19 19:11:25.5290218', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12790', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:02:59.7161163', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12791', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:03:00.8488141', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12792', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:03:09.6205816', N'访问', N'/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12793', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:25.1094428', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12794', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:25.9312142', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12795', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:32.9166924', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12796', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:33.4989823', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12797', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:42.2804193', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12798', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:09:42.3451996', N'访问', N'/admin/Control/AccessDenied', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12799', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:10:55.9336836', N'访问', N'/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12800', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:10:56.4900732', N'访问', N'/Admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12801', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:27.3167509', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12802', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:27.8709069', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12803', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:33.7762025', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12804', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:33.7938025', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12805', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:42.5567237', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12806', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:44.2084114', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12807', N'', N'00-50-56-C0-00-08', N'2019-05-19 22:11:44.5371886', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12808', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:09:24.4176338', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12809', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:09:25.1461740', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12810', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:09:35.2659387', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12811', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:09:35.6934652', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12812', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:10:02.6017048', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12813', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:10:25.0802473', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12814', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:10:26.7081686', N'访问', N'/admin/role/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12815', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:25.6263462', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12816', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:26.1267257', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12817', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:28.7921842', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12818', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:28.8072406', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12819', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:34.6446420', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12820', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:36.0423165', N'访问', N'/admin/User/Login', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12821', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:43.7203432', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12822', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:44.0284581', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12823', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:47.7538050', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12824', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:49.4010304', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12825', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:50.1407441', N'访问', N'/admin/viewlist/index/2012', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12826', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:52.8348836', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12827', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:55.1537511', N'访问', N'/admin/viewlist/index/2016', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12828', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:56.2446198', N'访问', N'/admin/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12829', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:56.8201926', N'访问', N'/admin/role/authen', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12830', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:57.3961624', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12831', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:58.0890367', N'访问', N'/admin/menu', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12832', N'', N'00-50-56-C0-00-08', N'2019-05-19 23:11:59.4295941', N'访问', N'/admin/user/department', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12833', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:12.8526353', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12834', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:12.3066973', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12835', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:23.5097420', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12836', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:26.1340469', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12837', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:26.8474164', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12838', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:37.9663110', N'访问', N'/admin/role', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12839', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:39.1867051', N'访问', N'/admin/user', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12840', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:27:40.3375942', N'访问', N'/admin/user/add', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12841', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:28:51.8442534', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12842', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:28:52.2558963', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12843', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:28:58.2475785', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12844', N'', N'00-50-56-C0-00-01', N'2019-05-20 21:29:00.1948981', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12845', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:06.0572699', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12846', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:06.5544843', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12847', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:13.2462796', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12848', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:14.8484855', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12849', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:15.1833720', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12850', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:19.6036095', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12851', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:28.4650509', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12852', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:12:30.0029837', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12853', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:13:37.6922591', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12854', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:13:38.2049044', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12855', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:13:43.8087625', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12856', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:13:44.9250022', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12857', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:13:49.9443016', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12858', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:14:06.3556038', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12859', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:14:31.3930486', N'访问', N'/admin/viewlist/edit/3022/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12860', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:14:33.5351070', N'访问', N'/admin/viewlist/detail/3022/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12861', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:16:19.4837369', N'访问', N'/admin/viewlist/detail/3022/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12862', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:04.8173512', N'访问', N'/admin/control/index/1', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12863', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:05.5922169', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12864', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:11.3914278', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12865', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:11.8418146', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12866', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:14.9473084', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12867', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:18:18.8634885', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12868', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:20.5603086', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12869', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:21.3328146', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12870', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:27.9068218', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12871', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:29.3964399', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12872', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:29.7787325', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12873', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:31.4996139', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12874', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:34.6349918', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12875', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:19:58.6582556', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12876', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:20:09.0026469', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12877', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:21:08.2783825', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12878', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:21:58.5219254', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12879', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:19.1434791', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12880', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:19.5606446', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12881', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:24.8243154', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12882', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:26.3784523', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12883', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:26.5897746', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12884', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:28.2008655', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'12885', N'', N'00-50-56-C0-00-01', N'2019-06-01 17:26:30.6496598', N'访问', N'/admin/viewlist/detail/4/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13373', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:40.2145902', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13374', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:39.6524153', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13375', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:48.1752135', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13376', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:52.0081790', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13377', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:53.2466208', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13378', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:42:56.2823982', N'访问', N'/admin/tablecolumn/index', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13379', N'', N'00-50-56-C0-00-08', N'2019-06-21 21:43:03.9293926', N'访问', N'/admin/tablecolumn/edit/2089', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13380', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:23:56.2024664', N'访问', N'/admin/', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13381', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:23:56.9503354', N'访问', N'/admin/User/Login', N'0', N'无')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13382', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:24:03.3770865', N'访问', N'/admin/', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13383', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:24:05.1152590', N'访问', N'/admin/control/index/1', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13384', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:24:05.6307049', N'访问', N'/admin/Control/Welcome', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13385', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:24:07.6741771', N'访问', N'/admin/viewlist/index/1011', N'13', N'sa')
GO

INSERT INTO [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (N'13386', N'', N'00-50-56-C0-00-01', N'2019-06-24 09:24:14.3781868', N'访问', N'/admin/viewlist/add/1011', N'13', N'sa')
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

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5903', N'2019-05-14 21:49:27.9261810', N'46', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5904', N'2019-05-14 21:49:27.9261854', N'1034', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5905', N'2019-05-14 21:49:27.9261854', N'1035', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5906', N'2019-05-14 21:49:27.9261855', N'2032', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5907', N'2019-05-14 21:49:27.9261856', N'2028', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5908', N'2019-05-14 21:49:27.9261857', N'2029', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5909', N'2019-05-14 21:49:27.9261857', N'2030', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5910', N'2019-05-14 21:49:27.9261858', N'2031', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5911', N'2019-05-14 21:49:27.9261859', N'2049', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5912', N'2019-05-14 21:49:27.9261860', N'2050', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5913', N'2019-05-14 21:49:27.9261861', N'2051', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5914', N'2019-05-14 21:49:27.9261861', N'2052', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5915', N'2019-05-14 21:49:27.9261862', N'55', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5916', N'2019-05-14 21:49:27.9261853', N'1033', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5917', N'2019-05-14 21:49:27.9261863', N'20', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5918', N'2019-05-14 21:49:27.9261864', N'2056', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5919', N'2019-05-14 21:49:27.9261865', N'3056', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5920', N'2019-05-14 21:49:27.9261866', N'2033', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5921', N'2019-05-14 21:49:27.9261867', N'2039', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5922', N'2019-05-14 21:49:27.9261867', N'2036', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5923', N'2019-05-14 21:49:27.9261868', N'2037', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5924', N'2019-05-14 21:49:27.9261869', N'2038', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5925', N'2019-05-14 21:49:27.9261870', N'2041', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5926', N'2019-05-14 21:49:27.9261870', N'2042', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5927', N'2019-05-14 21:49:27.9261871', N'2043', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5928', N'2019-05-14 21:49:27.9261872', N'2044', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5929', N'2019-05-14 21:49:27.9261873', N'2053', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5930', N'2019-05-14 21:49:27.9261864', N'57', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5931', N'2019-05-14 21:49:27.9261873', N'2054', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5932', N'2019-05-14 21:49:27.9261852', N'1029', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5933', N'2019-05-14 21:49:27.9261851', N'1031', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5934', N'2019-05-14 21:49:27.9261830', N'47', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5935', N'2019-05-14 21:49:27.9261831', N'23', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5936', N'2019-05-14 21:49:27.9261832', N'25', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5937', N'2019-05-14 21:49:27.9261833', N'26', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5938', N'2019-05-14 21:49:27.9261834', N'48', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5939', N'2019-05-14 21:49:27.9261835', N'28', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5940', N'2019-05-14 21:49:27.9261836', N'29', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5941', N'2019-05-14 21:49:27.9261836', N'30', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5942', N'2019-05-14 21:49:27.9261837', N'49', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5943', N'2019-05-14 21:49:27.9261838', N'31', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5944', N'2019-05-14 21:49:27.9261839', N'50', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5945', N'2019-05-14 21:49:27.9261839', N'32', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5946', N'2019-05-14 21:49:27.9261851', N'1032', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5947', N'2019-05-14 21:49:27.9261840', N'33', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5948', N'2019-05-14 21:49:27.9261842', N'35', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5949', N'2019-05-14 21:49:27.9261842', N'51', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5950', N'2019-05-14 21:49:27.9261843', N'36', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5951', N'2019-05-14 21:49:27.9261844', N'42', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5952', N'2019-05-14 21:49:27.9261845', N'53', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5953', N'2019-05-14 21:49:27.9261845', N'41', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5954', N'2019-05-14 21:49:27.9261846', N'43', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5955', N'2019-05-14 21:49:27.9261847', N'44', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5956', N'2019-05-14 21:49:27.9261848', N'54', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5957', N'2019-05-14 21:49:27.9261849', N'1027', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5958', N'2019-05-14 21:49:27.9261849', N'1028', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5959', N'2019-05-14 21:49:27.9261850', N'1030', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5960', N'2019-05-14 21:49:27.9261841', N'34', N'14')
GO

INSERT INTO [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (N'5961', N'2019-05-14 21:49:27.9261874', N'2055', N'14')
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

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2086', N'0', N'2019-05-14 20:57:46.4870616', N'Datetime', N'创建日期', N'0', N'0', NULL, N'0', N'0', N'0', N'0', N'8', N'CreateDateTime', NULL, N'0', N'0', N'1', N'1011', N'0', N'1', NULL, NULL, N'letterNumber:true', NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2087', N'1', N'2019-05-01 20:59:45.8020691', N'String', N'名称', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'Name', NULL, N'1', N'1', N'1', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2088', N'1', N'2019-04-27 15:34:12.8298351', N'Out', N'上级', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'4', N'ParentId', N'id,name|sys_department', N'0', N'1', N'1', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2089', N'1', N'2019-05-01 21:11:39.4959533', N'MultiSelect_Out', N'多out导入', N'0', N'1', NULL, N'0', N'1', N'0', N'1', N'8000', N'Test', N'id,name|test_leader', N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, N'222px', N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2090', N'1', N'2019-05-03 19:48:38.7796998', N'MultiSelect', N'多选', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Test1', NULL, N'0', N'1', N'1', N'1011', N'0', N'1', N'1,选项1|2,选项2|3,选项3', NULL, NULL, NULL, NULL, N'0', N'defaultvalue', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2091', N'1', N'2019-05-14 21:00:52.0043117', N'String', N'ww', N'0', N'1', NULL, N'0', N'0', N'0', N'1', N'8000', N'Test2', NULL, N'0', N'0', N'1', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, N'5', N'1', N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2092', N'1', N'2019-05-11 20:37:13.8998952', N'MultiLine_String', N'多行', N'0', N'1', NULL, N'1', N'1', N'0', N'1', N'8000', N'TestSync', NULL, N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, N'5', N'1', N'yyyy-mm-dd')
GO

INSERT INTO [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent], [ColumnWidth], [ColSpan], [DefaultValue], [UploadMaximum], [UploadMinimum], [DateFormat]) VALUES (N'2093', N'1', N'2019-05-14 21:22:13.3628544', N'MultiSelect_Out', N'out保存外表', N'0', N'1', NULL, N'1', N'0', N'0', N'0', N'1111', N'Test_Leader_Leader', N'id,name|test_leader|id>0|1|test_leader_leader|leaderid,otherleaderid|othervalue1=''2'',othervalue2=''99''', N'0', N'1', N'0', N'1011', N'0', N'1', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, N'yyyy-mm-dd hh')
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

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'2006', N'2019-01-16 10:14:36.0000000', N'w', N'0', N'1015', N'1', N'', N'asd', N'1')
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

INSERT INTO [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2], [TestSync], [IsTop]) VALUES (N'3022', N'2019-06-01 17:14:22.0000000', N'Test_Leader_Leader', N'6', N'1015', N'1', N'/Upload/2019/0427/待购买烟丝_20190427122018.png', N'a SSADD
SAD', NULL)
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
  [OtherLeaderId] int  NULL,
  [OtherValue1] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [OtherValue2] int  NULL
)
GO

ALTER TABLE [dbo].[Test_Leader_Leader] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Test_Leader_Leader
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Test_Leader_Leader] ON
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'8', N'2012', N'5', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'9', N'2013', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'10', N'2013', N'1015', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'11', N'2013', N'1016', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'12', N'2013', N'2008', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'14', N'2014', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'16', N'2015', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'19', N'2016', N'2007', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'1019', N'3017', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'1024', N'3021', N'1015', NULL, NULL)
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'3017', N'4', N'4', N'2', N'99')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'3018', N'4', N'1016', N'2', N'99')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'3019', N'2006', N'1016', N'2', N'99')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'3020', N'2006', N'2007', N'2', N'99')
GO

INSERT INTO [dbo].[Test_Leader_Leader] ([Id], [LeaderId], [OtherLeaderId], [OtherValue1], [OtherValue2]) VALUES (N'3021', N'3022', N'4', N'2', N'99')
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

