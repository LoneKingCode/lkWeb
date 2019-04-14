USE [master]
GO
/****** Object:  Database [lkWeb]    Script Date: 2019/4/14 16:49:28 ******/
CREATE DATABASE [lkWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lkWeb', FILENAME = N'D:\编程开发\SqlServer\MSSQL12.MSSQLSERVER\MSSQL\DATA\lkWeb.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lkWeb_log', FILENAME = N'D:\编程开发\SqlServer\MSSQL12.MSSQLSERVER\MSSQL\DATA\lkWeb_log.ldf' , SIZE = 64512KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lkWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lkWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lkWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lkWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lkWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lkWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lkWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [lkWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lkWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lkWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lkWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lkWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lkWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lkWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lkWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lkWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lkWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lkWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lkWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lkWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lkWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lkWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lkWeb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [lkWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lkWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [lkWeb] SET  MULTI_USER 
GO
ALTER DATABASE [lkWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lkWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lkWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lkWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [lkWeb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'lkWeb', N'ON'
GO
USE [lkWeb]
GO
/****** Object:  Schema [HangFire]    Script Date: 2019/4/14 16:49:28 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[Sys_Department]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Leader] [varchar](20) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_Sys_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_LoginLog]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_LoginLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientIP] [varchar](15) NULL,
	[ClientMac] [varchar](40) NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Description] [varchar](40) NULL,
 CONSTRAINT [PK_Sys_LoginLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Name] [varchar](18) NOT NULL,
	[ListOrder] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Url] [varchar](300) NOT NULL,
	[SubSystemId] [varchar](50) NULL CONSTRAINT [DF__Sys_Menu__Module__34C8D9D1]  DEFAULT ((0)),
	[Icon] [varchar](50) NOT NULL CONSTRAINT [DF__Sys_Menu__Icon__37A5467C]  DEFAULT (N''),
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_OperationLog]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_OperationLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientIP] [varchar](15) NOT NULL,
	[ClientMac] [varchar](40) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[OperationDescription] [varchar](100) NOT NULL,
	[OperationUrl] [varchar](300) NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sys_OperationLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Role]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[CreateDateTime] [datetime2](7) NULL,
	[SubSystemId] [int] NULL,
 CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_RoleMenu]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_RoleMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Sys_RoleMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_SubSystem]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_SubSystem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[Name] [varchar](18) NOT NULL,
	[ListOrder] [int] NULL,
	[Icon] [varchar](100) NULL,
	[IsHide] [tinyint] NULL,
 CONSTRAINT [PK_Sys_SubSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_SubSystemType]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_SubSystemType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[Name] [varchar](18) NOT NULL,
 CONSTRAINT [PK_Sys_SubSystemType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_SystemOption]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_SystemOption](
	[Code] [varchar](100) NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Sys_SystemOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_TableColumn]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_TableColumn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddVisible] [tinyint] NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[DataType] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[EditOrder] [int] NOT NULL,
	[EditVisible] [tinyint] NOT NULL,
	[EnumRange] [nvarchar](max) NULL,
	[ExportVisible] [tinyint] NOT NULL,
	[ImportVisible] [tinyint] NOT NULL,
	[ListOrder] [int] NOT NULL,
	[ListVisible] [tinyint] NOT NULL,
	[MaxLength] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[OutSql] [nvarchar](max) NULL,
	[PrimaryKey] [tinyint] NOT NULL,
	[Required] [tinyint] NOT NULL,
	[SearchVisible] [tinyint] NOT NULL,
	[TableId] [int] NOT NULL,
	[ViewOrder] [int] NOT NULL,
	[ViewVisible] [tinyint] NOT NULL,
	[SelectRange] [nvarchar](max) NULL,
	[ForbiddenFileExtension] [nvarchar](max) NULL,
	[ValidationRule] [nvarchar](max) NULL,
	[CustomContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sys_TableColumn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_TableList]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_TableList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[DefaultFilter] [nvarchar](max) NULL,
	[DefaultSort] [nvarchar](max) NULL,
	[DeleteTableName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ExtendFunction] [nvarchar](max) NULL,
	[ForbiddenAddFilter] [nvarchar](max) NULL,
	[ForbiddenDeleteFilter] [nvarchar](max) NULL,
	[ForbiddenUpdateFilter] [nvarchar](max) NULL,
	[ImportType] [tinyint] NOT NULL,
	[IsView] [tinyint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[AllowDelete] [tinyint] NOT NULL CONSTRAINT [DF__Sys_Table__Allow__3A4CA8FD]  DEFAULT ((0)),
	[AllowEdit] [tinyint] NOT NULL CONSTRAINT [DF__Sys_Table__Allow__3B40CD36]  DEFAULT ((0)),
	[AllowExport] [tinyint] NOT NULL CONSTRAINT [DF__Sys_Table__Allow__3C34F16F]  DEFAULT ((0)),
	[AllowImport] [tinyint] NOT NULL CONSTRAINT [DF__Sys_Table__Allow__3D2915A8]  DEFAULT ((0)),
	[AllowView] [tinyint] NOT NULL CONSTRAINT [DF__Sys_Table__Allow__3E1D39E1]  DEFAULT ((0)),
	[AllowAdd] [tinyint] NOT NULL CONSTRAINT [DF__Sys_Table__Allow__3F115E1A]  DEFAULT ((0)),
	[AllowDetail] [tinyint] NOT NULL CONSTRAINT [DF_Sys_TableList_AllowEdit1]  DEFAULT ((0)),
	[TopExtendFunction] [nvarchar](max) NULL,
	[ColumnPerRow] [int] NOT NULL CONSTRAINT [DF__Sys_Table__Colum__756D6ECB]  DEFAULT ((0)),
	[ViewEditWidthHeight] [nvarchar](max) NULL,
	[JavaScript] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sys_TableList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_User]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccessFailedCount] [int] NULL,
	[Email] [nvarchar](256) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[RealName] [nvarchar](max) NULL,
	[Status] [tinyint] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[CreateDateTime] [datetime2](7) NULL,
 CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_UserDepartment]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Sys_UserDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_UserRole]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NULL,
 CONSTRAINT [PK_Sys_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test_Leader]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Leader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDateTime] [datetime2](7) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ParentId] [int] NOT NULL,
	[Test] [nvarchar](max) NULL,
	[Test1] [nvarchar](max) NULL,
	[Test2] [nvarchar](max) NULL,
 CONSTRAINT [PK_Test_Leader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [smallint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Job]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[List]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Server]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Set]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[State]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_TableInfo]    Script Date: 2019/4/14 16:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TableInfo]
AS
SELECT  a.name AS tablename, b.name AS colName, c.name AS colType, c.length AS colLength
FROM      sys.sysobjects AS a INNER JOIN
                   sys.syscolumns AS b ON a.id = b.id AND a.xtype = 'U' INNER JOIN
                   sys.systypes AS c ON b.xtype = c.xusertype

GO
SET IDENTITY_INSERT [dbo].[Sys_Department] ON 

INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (5, CAST(N'2018-02-05 17:17:11.3077639' AS DateTime2), N'写代码哦', N'王杰', N'开发部', 5)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (6, CAST(N'2018-02-05 17:17:34.2588781' AS DateTime2), N'运营哦', N'张杰', N'运营部', 0)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (7, CAST(N'2018-02-05 20:26:58.7052012' AS DateTime2), N'管理', N'LoneKing', N'管理部', 0)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (12, CAST(N'2018-02-13 23:27:57.2040073' AS DateTime2), N'test说明', N'test负责人', N'test名称', 6)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (13, CAST(N'2018-02-22 15:00:11.5002483' AS DateTime2), N'的啊打算大时代', N'收到', N'啊啥的都是', 0)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (14, CAST(N'2018-02-22 15:03:02.6252356' AS DateTime2), N'123123213', N'12321', N'123213', 0)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (24, CAST(N'2018-03-28 21:37:21.0000000' AS DateTime2), N'test', N'王杰哦', N'部门测试啊', 13)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (28, CAST(N'2018-03-28 22:11:39.0000000' AS DateTime2), N'测试说明', N'测试负责人', N'测试部门啊', 6)
INSERT [dbo].[Sys_Department] ([Id], [CreateDateTime], [Description], [Leader], [Name], [ParentId]) VALUES (30, CAST(N'2019-01-15 09:24:33.3057979' AS DateTime2), N'啊实打实的', N'阿斯顿阿斯', N'阿三的撒旦阿三', 5)
SET IDENTITY_INSERT [dbo].[Sys_Department] OFF
SET IDENTITY_INSERT [dbo].[Sys_LoginLog] ON 

INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (4292, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:09.4501981' AS DateTime2), 0, N'sa', N'')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (4293, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 18:03:16.5924079' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (4294, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:53.6414428' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5286, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:47.0064847' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5287, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:37.2121955' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5288, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:30:53.9812217' AS DateTime2), 0, N'sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5289, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:30:56.3169827' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5290, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:14.2138784' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5291, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:20.3216632' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5292, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:52:59.5228322' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5293, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:40:59.8850354' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5294, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:04:57.1414040' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5295, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:02:20.6019846' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5296, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:06.4161339' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5297, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:37.5635743' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (5298, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:19.8956105' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6297, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:32.0640194' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6298, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:57:41.5696125' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6299, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:02:31.3817284' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6300, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:33.9576018' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6301, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:21:56.6943536' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6302, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:30:00.0100213' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6303, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:31:39.8081684' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6304, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:57:49.1635007' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6305, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:25.1897828' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6306, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:12.9561731' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6307, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:13.7834444' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6308, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:07.7958503' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6309, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:05:57.6717438' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6310, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:29.2973469' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6311, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:56:42.9726869' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6312, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:01:43.6674400' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6313, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:01.4547662' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6314, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:16:02.4204474' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6315, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:21:27.7859769' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6316, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:23:57.6784878' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6317, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:02.5630513' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6318, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:41:57.0276390' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (6319, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:52:55.2461404' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7297, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:23.2737592' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7298, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:00.6114434' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7299, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:34.3821240' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7300, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:53:30.8605375' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7301, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:30.7137214' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7302, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:29:52.7327396' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7303, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:23:52.8539810' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7304, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:03:17.5715945' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7305, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:06:57.7745109' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7306, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 20:25:15.8707542' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7307, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:21:03.4317015' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7308, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:27:02.0548349' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (7309, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:28:04.1373231' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8309, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:34.1381772' AS DateTime2), 0, N'sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8310, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:40.4358601' AS DateTime2), 0, N'sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8311, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:45.5336634' AS DateTime2), 0, N'sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8312, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:54.5133227' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8313, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:31:03.0948873' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8314, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:34.4437047' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8315, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:09.9693005' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8316, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:19:44.5953669' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8317, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:19.3682596' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8318, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:43:53.7771049' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8319, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:47.3995533' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8320, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:06:44.2209014' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8321, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:06:48.0186755' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8322, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:06:52.5266979' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8323, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:07.9418700' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8324, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:46.3940251' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8325, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:50.4689862' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8326, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:52.8017669' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8327, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:53.9999791' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8328, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:55.1079608' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8329, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:55.9590497' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8330, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:56.8178321' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8331, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:14:01.7726129' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8332, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:14:02.8650140' AS DateTime2), 0, N' sa', N'登陆失败,请检查输入的信息')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8333, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:14:04.9411224' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8334, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:27.3013843' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8335, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:23.1497247' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8336, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:42:59.7374828' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8337, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:48:24.0846947' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8338, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:08.8284732' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8339, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:55.8408811' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8340, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:52:20.3529662' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8341, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:30.6263155' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8342, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:55:48.1375879' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8343, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:12:04.9725244' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8344, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:14:47.2259639' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8345, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:20:06.4814873' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8346, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:25:59.9822898' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8347, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:14.7909483' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8348, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:37:04.9155920' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8349, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:40:32.8820828' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8350, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:41:58.1220682' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8351, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:02:21.1852648' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8352, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:08:04.8309295' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8353, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:11.9216792' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8354, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:19:43.6887247' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8355, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:41.4664147' AS DateTime2), 0, N'sa', N'登陆成功')
GO
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8356, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:05.8226265' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8357, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:34.1142527' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8358, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:37:47.7669334' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8359, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:45.7456465' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8360, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:42:02.6000479' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8361, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:10.9127004' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8362, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:37.4139463' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8363, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:30.7189453' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8364, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:56:53.3004472' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (8365, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 23:04:43.2363371' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (9309, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:20:49.4449524' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (9310, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:41.1023922' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (9311, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:06.7794647' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (9312, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:38:23.6415427' AS DateTime2), 0, N'sa', N'登陆成功')
INSERT [dbo].[Sys_LoginLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [UserId], [UserName], [Description]) VALUES (9313, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:44:39.1966219' AS DateTime2), 0, N'sa', N'登陆成功')
SET IDENTITY_INSERT [dbo].[Sys_LoginLog] OFF
SET IDENTITY_INSERT [dbo].[Sys_Menu] ON 

INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (20, CAST(N'2018-02-25 22:40:15.3210915' AS DateTime2), N'登陆日志', 2, 55, 1, N'/admin/log/login', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (21, CAST(N'2018-02-25 21:42:20.3965368' AS DateTime2), N'操作日志', 1, 55, 1, N'/admin/log/operation', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (23, CAST(N'2018-02-26 00:47:17.0109391' AS DateTime2), N'添加', 1, 47, 2, N'/admin/role/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (25, CAST(N'2018-02-26 00:48:50.1465402' AS DateTime2), N'编辑', 2, 47, 2, N'/admin/role/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (26, CAST(N'2018-02-26 00:49:46.3026481' AS DateTime2), N'删除', 3, 47, 2, N'/admin/role/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (28, CAST(N'2018-03-05 20:26:41.7374827' AS DateTime2), N'添加', 1, 48, 2, N'/admin/department/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (29, CAST(N'2018-03-05 20:27:17.1070801' AS DateTime2), N'编辑', 2, 48, 2, N'/admin/department/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (30, CAST(N'2018-03-05 20:27:47.1766801' AS DateTime2), N'删除', 3, 48, 2, N'/admin/department/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (31, CAST(N'2018-03-05 20:30:34.5211505' AS DateTime2), N'保存', 1, 49, 2, N'/admin/role/AuthMenus', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (32, CAST(N'2018-03-05 20:32:06.4514524' AS DateTime2), N'添加', 1, 50, 2, N'/admin/user/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (33, CAST(N'2018-03-05 20:32:18.5702215' AS DateTime2), N'编辑', 2, 50, 2, N'/admin/user/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (34, CAST(N'2018-03-05 20:32:33.2283930' AS DateTime2), N'删除', 3, 50, 2, N'/admin/user/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (35, CAST(N'2018-03-05 20:33:09.8548616' AS DateTime2), N'角色授权', 4, 50, 2, N'/admin/user/authen', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (36, CAST(N'2018-03-05 20:34:49.4881171' AS DateTime2), N'添加', 1, 51, 2, N'/admin/user/selectUser', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (41, CAST(N'2018-03-05 20:43:09.7351631' AS DateTime2), N'添加', 1, 53, 2, N'/admin/menu/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (42, CAST(N'2018-03-05 21:28:08.1709715' AS DateTime2), N'删除', 2, 51, 2, N'/admin/User/DelUserDepartment', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (43, CAST(N'2018-03-05 21:28:41.2921323' AS DateTime2), N'编辑', 2, 53, 2, N'/admin/menu/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (44, CAST(N'2018-03-05 21:28:56.0588430' AS DateTime2), N'删除', 3, 53, 2, N'/admin/menu/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (46, CAST(N'2018-02-25 23:15:42.3859320' AS DateTime2), N'系统设置', 0, 0, 0, N'#', N'1', N'fa fa-cog')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (47, CAST(N'2018-02-25 21:36:57.8745745' AS DateTime2), N'角色管理', 1, 46, 1, N'/admin/role', N'1', N'fa fa-user-circle')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (48, CAST(N'2018-02-25 21:37:18.2776820' AS DateTime2), N'部门管理', 2, 46, 1, N'/admin/department', N'1', N'fa fa-vcard-o')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (49, CAST(N'2018-02-25 21:38:02.9127007' AS DateTime2), N'角色授权', 3, 46, 1, N'/admin/role/authen', N'1', N'fa fa-user-circle-o')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (50, CAST(N'2019-04-13 22:58:31.6843566' AS DateTime2), N'用户管理', 4, 46, 1, N'/admin/user', N'1', N'fa fa-user-o')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (51, CAST(N'2018-02-25 21:39:27.8154553' AS DateTime2), N'用户部门', 5, 46, 1, N'/admin/user/department', N'1', N'fa fa-vcard')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (53, CAST(N'2018-02-25 21:40:18.5419110' AS DateTime2), N'菜单管理', 7, 46, 1, N'/admin/menu', N'1', N'fa fa-list')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (54, CAST(N'2018-02-25 21:41:01.1950159' AS DateTime2), N'修改信息', 13, 46, 1, N'/admin/user/edit', N'1', N'fa fa-info-circle')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (55, CAST(N'2018-02-25 21:41:26.1795987' AS DateTime2), N'系统日志', 1, 0, 0, N'#', N'1', N'fa fa-sticky-note')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (57, CAST(N'2018-03-08 15:57:07.6196172' AS DateTime2), N'统计图表', 3, 55, 1, N'/admin/log/chart', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1027, CAST(N'2018-02-25 21:41:01.1950159' AS DateTime2), N'后台任务', 12, 46, 1, N'/jobs', N'1', N'fa fa-info-circle')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1028, CAST(N'2018-03-12 14:40:26.1851601' AS DateTime2), N'表管理', 8, 46, 1, N'/admin/tablelist/index', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1029, CAST(N'2018-03-12 14:40:53.2065422' AS DateTime2), N'表结构管理', 9, 46, 1, N'/admin/tablecolumn/index', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1030, CAST(N'2018-03-05 20:39:16.2658323' AS DateTime2), N'添加', 1, 1028, 2, N'/admin/tablelist/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1031, CAST(N'2018-03-05 20:41:16.8744020' AS DateTime2), N'编辑', 2, 1028, 2, N'/admin/tablelist/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1032, CAST(N'2018-03-05 20:41:32.5455574' AS DateTime2), N'删除', 3, 1028, 2, N'/admin/tablelist/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1033, CAST(N'2018-03-05 20:39:16.2658323' AS DateTime2), N'添加', 1, 1029, 2, N'/admin/tablecolumn/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1034, CAST(N'2018-03-05 20:41:16.8744020' AS DateTime2), N'编辑', 2, 1029, 2, N'/admin/tablecolumn/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (1035, CAST(N'2018-03-05 20:41:32.5455574' AS DateTime2), N'删除', 3, 1029, 2, N'/admin/tablecolumn/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2028, CAST(N'2018-03-20 22:29:22.2134309' AS DateTime2), N'系统参数', 11, 46, 1, N'/admin/systemoption/index', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2029, CAST(N'2018-03-20 22:29:45.3538853' AS DateTime2), N'添加', 1, 2028, 2, N'/admin/systemoption/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2030, CAST(N'2018-03-20 22:30:04.2380259' AS DateTime2), N'编辑', 2, 2028, 2, N'/admin/systemoption/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2031, CAST(N'2018-03-20 22:30:16.2512660' AS DateTime2), N'删除', 3, 2028, 2, N'/admin/systemoption/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2032, CAST(N'2018-03-23 23:36:32.6492257' AS DateTime2), N'设置属性', 5, 1029, 2, N'/admin/tablecolumn/setvalue', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2033, CAST(N'2018-03-28 22:00:16.0416120' AS DateTime2), N'基础数据', 2, 0, 0, N'#', N'1', N'fa fa-database')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2034, CAST(N'2018-03-28 22:05:52.4014244' AS DateTime2), N'部门管理', 1, 2033, 1, N'/admin/viewlist/index/2', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2035, CAST(N'2018-03-29 22:35:38.6117376' AS DateTime2), N'登录日志', 2, 2033, 1, N'/admin/viewlist/index/1009', N'1', N'fa fa-history')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2036, CAST(N'2018-03-31 23:00:25.9427920' AS DateTime2), N'添加', 1, 2039, 2, N'/admin/viewlist/add', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2037, CAST(N'2018-03-31 22:59:52.6571289' AS DateTime2), N'编辑', 2, 2039, 2, N'/admin/viewlist/edit', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2038, CAST(N'2018-03-31 22:59:43.5102640' AS DateTime2), N'删除', 3, 2039, 2, N'/admin/viewlist/delete', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2039, CAST(N'2018-03-31 23:02:30.4059966' AS DateTime2), N'基础数据菜单权限', 99, 2033, 1, N'#', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2041, CAST(N'2018-05-07 20:51:23.4942112' AS DateTime2), N'导入', 5, 2039, 2, N'/admin/viewlist/import', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2042, CAST(N'2018-05-07 20:54:09.2408231' AS DateTime2), N'导出', 6, 2039, 2, N'/admin/viewlist/export', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2043, CAST(N'2018-05-07 20:54:16.8067366' AS DateTime2), N'查看详情', 7, 2039, 2, N'/admin/viewlist/detail', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2044, CAST(N'2019-01-06 22:15:22.5186765' AS DateTime2), N'测试领导管理', 3, 2033, 1, N'/admin/viewlist/index/1011', N'1', N'fa')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2049, CAST(N'2019-04-13 16:51:42.3248877' AS DateTime2), N'子系统管理', 6, 46, 1, N'/admin/viewlist/index/2012', N'1', N'fa fa-cog')
INSERT [dbo].[Sys_Menu] ([Id], [CreateDateTime], [Name], [ListOrder], [ParentId], [Type], [Url], [SubSystemId], [Icon]) VALUES (2050, CAST(N'2019-04-13 16:52:13.0863887' AS DateTime2), N'子系统类型', 6, 46, 1, N'/admin/viewlist/index/2013', N'1', N'fa')
SET IDENTITY_INSERT [dbo].[Sys_Menu] OFF
SET IDENTITY_INSERT [dbo].[Sys_OperationLog] ON 

INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1482, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:12:00.4011858' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1483, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:12:02.3572116' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1484, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:12:04.9403162' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1485, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:12:08.2830150' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1486, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:12:08.9191299' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1487, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:01.2572245' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1488, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:01.7562043' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1489, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:10.7600347' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1490, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:11.7298283' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1491, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:52.3767652' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1492, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:53.9011041' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1493, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:54.8839518' AS DateTime2), N'访问', N'/admin/viewlist/index/1010', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1494, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:57.6131520' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1495, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:57.7055551' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1496, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:21:59.5397035' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1497, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:22:01.3220408' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1498, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:22:02.0443964' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1499, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:22:02.6842456' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1500, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:22:03.5865629' AS DateTime2), N'访问', N'/admin/viewlist/index/1010', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1501, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:22:08.4452871' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1502, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:40.9390784' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1503, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:41.3954332' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1504, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:45.3320357' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1505, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:50.8990923' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1506, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:51.9009024' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1507, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:52.5688659' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1508, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:52.9715420' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1509, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:53.4893647' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1510, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:54.1955160' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1511, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:23:56.7245971' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1512, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:03.6603633' AS DateTime2), N'访问', N'/admin/tablelist/edit/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1513, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:41.5493596' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1514, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:43.7019608' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1515, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:44.1423333' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1516, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:44.8213097' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1517, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:51.4918005' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1518, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:52.0117830' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1519, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:52.7191327' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1520, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:53.4519897' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1521, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:53.9633980' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1522, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:54.4844024' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1523, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:55.1173420' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1524, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:24:55.6673163' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1525, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:27:29.7687239' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1526, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:27:31.6681871' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1527, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:28:31.4937690' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1528, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:28:33.5145669' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1529, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:28:47.9499477' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1530, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:28:49.2742913' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1531, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 17:28:51.1938036' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1532, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 18:03:10.4186389' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1533, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 18:03:10.9332839' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1534, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 18:03:17.9877093' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1535, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-04 18:03:19.0647038' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1536, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:42.8331974' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1537, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:43.9395299' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1538, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:47.6545158' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1539, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:55.0453825' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1540, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:57.2345651' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1541, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:59.3930301' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1542, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:20:59.7453165' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1543, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:01.8075756' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1544, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:05.9510683' AS DateTime2), N'访问', N'/admin/viewlist/edit/39/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1545, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:08.4799881' AS DateTime2), N'访问', N'/admin/User/Login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1546, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:34.9158294' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1547, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:35.2407639' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1548, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:36.9077958' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1549, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:39.5438306' AS DateTime2), N'访问', N'/admin/viewlist/edit/40/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1550, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:43.3581902' AS DateTime2), N'访问', N'/admin/viewlist/edit/39/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1551, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:49.5272141' AS DateTime2), N'访问', N'/admin/viewlist/edit/30/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1552, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:53.7295518' AS DateTime2), N'访问', N'/admin/viewlist/edit/28/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1553, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:21:56.9853470' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (1554, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 00:22:06.6683689' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2918, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:15.9489142' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2919, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:16.4039377' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2920, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:48.3460749' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2921, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:49.5238268' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2922, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:54.7866608' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2923, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:26:56.8359555' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2924, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:27:02.4502831' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/65', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2925, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:30:27.1802839' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/65', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2926, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:30:32.4350338' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2927, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:31:18.3386477' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2928, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:34:33.3178724' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2929, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:34:35.2325912' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2930, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:34:51.1981241' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2931, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:34:52.3319279' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2932, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:35:03.1994683' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/60', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2933, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:35:11.6633744' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/60', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2934, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:35:23.2998675' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/60', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2935, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 21:39:02.3285142' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2936, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:12:49.3891359' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2937, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:12:55.0329239' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2938, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:00.5813091' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2939, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:07.4774843' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2940, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:08.3690093' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2941, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:08.9774295' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2942, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:52.7227252' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2943, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:53.2331865' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2944, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:56.0535633' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2945, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:13:57.5278810' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2946, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:04.0960184' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2947, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:09.2478696' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2948, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:17.4754168' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2949, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:19.8988947' AS DateTime2), N'访问', N'/admin/tablelist/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2950, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:47.8713919' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2951, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:49.0418652' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2952, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:14:58.9356831' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2953, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:15:31.8517670' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2954, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:15:53.0915705' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/70', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2955, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:16:33.6381599' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2956, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:16:43.3215870' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2957, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:16:43.5854215' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2958, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:16:46.1156195' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2959, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:16:48.6766926' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2960, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:16:59.0276717' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/71', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2961, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:17:15.2138149' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/71', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2962, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:17:21.0473119' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/72', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2963, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:17:30.6803645' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/73', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2964, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:18:01.1095734' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/74', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2965, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:18:44.2123730' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2966, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:05.6100868' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2967, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:15.4724543' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2968, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:16.4712739' AS DateTime2), N'访问', N'/admin/viewlist/add/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2969, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:19.5143518' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2970, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:20.5660605' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2971, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:22.0797865' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2972, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:19:50.6232665' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2973, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:22:04.2604263' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2974, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:23:50.1929073' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2975, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:09.3810662' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/74', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2976, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:37.6603730' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2977, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:40.3601017' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2978, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:42.4893627' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2979, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:47.3221996' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/74', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2980, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:52.3625587' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2981, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:30:57.4629756' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2982, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:31:04.1821534' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2983, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:31:05.4001266' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2984, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:33:19.5102619' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2985, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:06.9239738' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2986, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:11.5759691' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2987, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:12.6428627' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2988, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:17.2368337' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2989, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:17.8280250' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2990, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:26.4835805' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2991, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:44.2955514' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2992, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:44:47.3351244' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2993, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:45:59.5610511' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2994, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:46:20.1334019' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2995, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:46:36.0682761' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/71', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2996, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:46:50.5459018' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2997, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 22:46:57.8896670' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2998, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:03:57.5144756' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (2999, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:04:25.0398890' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3000, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:04:48.6791976' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3001, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:05:47.1957728' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3002, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:05:57.3471507' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3003, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:06:15.9839689' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3004, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:09:37.2832561' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3005, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:09:42.7639857' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3006, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:10:11.7186355' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3007, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:12:55.5660583' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3008, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:13:33.6489443' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3009, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:13:54.5181487' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3010, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:13:56.8602815' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3011, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:14:15.2988840' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3012, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:14:32.1146085' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3013, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:17:50.3223418' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3014, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:18:12.3998234' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3015, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:18:51.7853144' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3016, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:19:46.4395918' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3017, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:21:31.8374842' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3018, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:22:06.4399273' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3019, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:23:09.5735118' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3020, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:25:23.1687880' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3021, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:26:14.7067661' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3022, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:27:06.7235473' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3023, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:27:25.1491835' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3024, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:28:38.2026399' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3025, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:30:00.6786630' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3026, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:33:01.8245754' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3027, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:33:12.6933910' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3028, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:34:20.8270149' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3029, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:38:22.3810816' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3030, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:38:28.9745973' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3031, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:38:42.1249649' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3032, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:39:44.6771206' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3033, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:50:24.8712205' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3034, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:50:48.4890714' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3035, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:51:27.7076858' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3036, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:51:38.3761628' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3037, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:52:11.4088612' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3038, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:52:22.8778910' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3039, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:55:49.6752793' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3040, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:56:00.4571128' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3041, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:58:20.6454161' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3042, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:58:36.5351688' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3043, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-06 23:59:21.7284052' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3044, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:00:32.6210403' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3045, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:02:06.8693435' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3046, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:04:42.1244394' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3047, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:08:36.5718355' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3048, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:08:42.8681689' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3049, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:09:00.1467945' AS DateTime2), N'访问', N'/admin/viewlist/edit/2/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3050, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:10:28.0843725' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3051, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:13:14.7721683' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3052, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:13:28.6842665' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3053, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:15:35.8495407' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3054, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:16:13.3626205' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3055, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:18:06.3577876' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3056, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:18:08.4284459' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3057, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:18:11.8779616' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3058, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:18:13.4913310' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3059, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:27:54.0512554' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3060, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:28:10.7868831' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3061, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:28:20.8124762' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3062, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:28:23.6037777' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3063, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:30:25.6425599' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3064, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:31:59.5176310' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3065, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:31.2850457' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3066, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:31.8337659' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3067, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:38.5251974' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3068, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:39.6210400' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3069, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:42.1912970' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3070, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:42.7325559' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3071, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:46.1364664' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3072, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 00:35:53.4811490' AS DateTime2), N'访问', N'/admin/viewlist/edit/2/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3073, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:30:49.1425378' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3074, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:30:49.6850587' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3075, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:30:57.5581354' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3076, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:30:58.6235169' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3077, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:31:04.2479859' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3078, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:31:06.5514385' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3079, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:31:20.2168582' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3080, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:32:07.6471928' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3081, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:32:13.1440239' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3082, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:32:52.2460148' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3083, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:33:15.3641656' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3084, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:33:19.9069029' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3085, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:33:20.6118730' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3086, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:33:23.2388676' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3087, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:33:25.1225372' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3088, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:34:50.9399728' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3089, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:34:53.1607636' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3090, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:34:54.8812105' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3091, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:34:55.0236394' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3092, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:34:56.8205756' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3093, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:37:22.6056069' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3094, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:37:24.8369441' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3095, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:37:27.2794826' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3096, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:37:29.2792527' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3097, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:37:43.9020461' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3098, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:38:26.7559781' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3099, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:39:11.7162372' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3100, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:39:35.6039696' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3101, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 11:39:43.4998714' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3102, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:08.3125373' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3103, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:08.8123938' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3104, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:15.5077017' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3105, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:16.5265832' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3106, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:18.7134468' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3107, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:20.5315393' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3108, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:33:56.7715658' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3109, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:34:12.1939008' AS DateTime2), N'访问', N'/admin/viewlist/edit/3/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3110, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:42:48.9939482' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3111, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:42:51.0549481' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3112, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:42:52.9962095' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3113, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:42:54.9292957' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3114, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:07.4167201' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3115, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:10.9522359' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3116, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:12.2871368' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3117, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:12.8889534' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3118, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:13.4564265' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3119, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:13.7610726' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3120, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:16.4017800' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3121, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:17.2331278' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3122, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:18.1800691' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3123, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-07 14:43:21.5039115' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3124, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:12.4590916' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3125, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:13.1449853' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3126, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:21.6452063' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3127, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:22.9066799' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3128, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:28.7671986' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3129, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:34.2835944' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3130, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:44.0424890' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3131, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:44.1653574' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3132, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:13:46.7785876' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3133, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:14:03.7316145' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3134, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:14:14.6259542' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3135, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:14:23.7850940' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3136, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:14:26.5825155' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3137, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:16:08.8210012' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3138, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:21:35.2307169' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3139, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:21:40.2983393' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3140, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:21:45.4620717' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3141, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:24:27.5212746' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3142, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:26:37.2344557' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3143, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:26:40.0267828' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3144, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:26:48.0867020' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3145, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:28:52.2881691' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3146, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:28:58.0938723' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3147, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:31:15.5241966' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3148, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:31:17.5005202' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3149, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:34:16.2333037' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3150, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:34:28.7651057' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3151, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:35:59.2553447' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3152, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:36:08.6217707' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3153, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:37:06.6295543' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3154, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:39:17.6237212' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3155, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:39:27.8391445' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3156, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:40:01.6616935' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3157, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:41:24.2630104' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3158, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:42:09.5807862' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3159, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:43:00.8129828' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3160, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:43:05.8190782' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3161, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:43:54.1684459' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3162, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:44:33.2770039' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3163, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:45:08.2269945' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3164, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:45:20.6996991' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3165, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:45:30.9002449' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3166, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:46:03.2850966' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3167, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:46:57.1148389' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3168, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:47:05.2579690' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3169, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:47:17.4197342' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3170, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:47:21.4668957' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3171, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:47:34.3714157' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3172, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:48:20.5374133' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3173, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:48:37.4346152' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3174, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:48:44.6170536' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3175, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:48:52.5216540' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3176, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:49:02.3080946' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3177, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:49:06.7705019' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3178, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:49:27.9793909' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3179, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:49:46.0063798' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3180, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:51:09.7640371' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3181, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 18:51:25.0655437' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3182, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:09:56.6421235' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3183, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:09:58.8801984' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3184, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:10:02.4182345' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3185, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:13:30.0873511' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3186, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:13:39.5779818' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3187, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:13:43.0132803' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3188, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:13:49.6184125' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3189, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:13:53.3293174' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3190, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:14:40.9165596' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3191, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:14:43.0426565' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3192, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:14:50.0049897' AS DateTime2), N'访问', N'/admin/viewlist/detail/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3193, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:14:59.6022681' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3194, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:15:12.0653905' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3195, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:15:16.2023801' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3196, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:15:43.7734443' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3197, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:15:46.6283029' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3198, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:15:49.8364242' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3199, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:15:56.5228048' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3200, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:17:06.9182629' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3201, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:19:10.0691224' AS DateTime2), N'访问', N'/admin/viewlist/detail/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3202, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:19:13.3132367' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3203, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:19:16.0098248' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3204, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:19:17.1961874' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3205, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:19:19.8452781' AS DateTime2), N'访问', N'/admin/viewlist/detail/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3206, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:52:53.4354113' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3207, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:52:53.9962730' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3208, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:53:00.8364148' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3209, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:53:01.9423432' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3210, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:53:17.7777262' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3211, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:53:19.1410670' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3212, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:53:20.7791148' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3213, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 19:53:22.5231422' AS DateTime2), N'访问', N'/admin/viewlist/detail/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3214, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:40:53.1488272' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3215, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:40:53.7296472' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3216, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:41:01.3443553' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3217, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:41:02.4978365' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3218, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:41:06.2565998' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3219, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:41:24.4977396' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3220, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:41:26.9725102' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3221, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:42:11.3542544' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3222, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:43:57.1357209' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3223, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:44:49.7198938' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3224, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:46:23.1310763' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3225, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:46:51.3611254' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3226, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:47:04.5053220' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3227, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:50:19.9851246' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3228, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:50:57.9455011' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3229, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:58:43.2045543' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3230, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:03.0764449' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3231, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:13.2932521' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3232, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:13.8119474' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3233, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:14.0935713' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3234, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:14.8212758' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3235, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:17.2349984' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3236, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:34.6777245' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3237, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 20:59:43.3486251' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3238, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:01:43.8105495' AS DateTime2), N'访问', N'/admin/viewlist/edit/4/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3239, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:01:58.0472674' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3240, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:02:13.1809331' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3241, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:02:24.7817139' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3242, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:03:04.7761125' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3243, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:03:27.0604944' AS DateTime2), N'访问', N'/admin/viewlist/edit/5/1011', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3244, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:04:51.2201379' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3245, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:04:51.8114264' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3246, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:04:58.4541991' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3247, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:04:59.6514192' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3248, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:05:03.4520072' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3249, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:05:13.1109185' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3250, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:06:28.7110630' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3251, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:06:47.5718466' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3252, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:06:56.3077341' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3253, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:07:14.2983294' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3254, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:07:22.4560372' AS DateTime2), N'访问', N'/admin/viewlist/edit/5/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3255, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:07:29.3872123' AS DateTime2), N'访问', N'/admin/viewlist/edit/5/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3256, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:07:37.1145958' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3257, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:08:04.7729676' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3258, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:08:10.0838754' AS DateTime2), N'访问', N'/admin/viewlist/edit/5/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3259, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-08 21:08:19.9231743' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3260, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:01:20.9511414' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3261, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:01:21.3899640' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3262, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:02:21.8901518' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3263, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:02:22.9176723' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3264, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:02:45.6078021' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3265, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:02:49.9506089' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3266, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:02:58.8567378' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3267, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:03:02.9834283' AS DateTime2), N'访问', N'/admin/user/selectUser/17', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3268, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:07:38.9185645' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3269, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:07:41.6493719' AS DateTime2), N'访问', N'/admin/user/selectUser', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3270, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:09:49.9872230' AS DateTime2), N'访问', N'/admin/user/selectUser/7', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3271, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:16:58.0036696' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3272, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:16:58.2859015' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3273, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:17:13.7422573' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3274, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:17:16.8442166' AS DateTime2), N'访问', N'/admin/user/selectUser', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3275, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:18:46.3687432' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3276, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:18:49.3059140' AS DateTime2), N'访问', N'/admin/user/selectUser/6', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3277, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:18:57.7533170' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3278, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:22:36.2245149' AS DateTime2), N'访问', N'/admin/user/selectUser/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3279, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:22:55.0496491' AS DateTime2), N'访问', N'/admin/user/selectUser/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3280, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:33:13.1847473' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3281, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 09:33:15.7515977' AS DateTime2), N'访问', N'/admin/user/selectUser/13', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3282, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:25:58.6659063' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3283, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:25:59.1308943' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3284, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:07.7899378' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3285, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:08.7240733' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3286, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:20.3722148' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3287, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:36.3482278' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3288, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:52.9999738' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3289, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:26:58.3924412' AS DateTime2), N'访问', N'/admin/viewlist/edit/40/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3290, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:27:07.6338451' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3291, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:27:28.2572326' AS DateTime2), N'访问', N'/admin/viewlist/edit/40/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3292, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:27:33.5939137' AS DateTime2), N'访问', N'/admin/viewlist/edit/40/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3293, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:35:14.7380820' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3294, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:35:16.4838482' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3295, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:35:24.0627390' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3296, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:35:26.9540726' AS DateTime2), N'访问', N'/admin/viewlist/edit/40/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3297, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:35:39.6731471' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3298, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:36:25.4166478' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3299, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:36:25.9244685' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3300, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:37:29.3085452' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3301, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:37:39.7861382' AS DateTime2), N'访问', N'/admin/tablelist/edit/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3302, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:39:24.2747568' AS DateTime2), N'访问', N'/admin/tablelist/edit/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3303, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:39:28.0353634' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3304, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:39:29.4561265' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3305, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:39:29.9436509' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3306, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:39:30.5134765' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3307, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:40:23.7532882' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3308, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:40:24.9645667' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3309, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:40:36.1329220' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3310, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 10:40:42.3892607' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3311, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:31.4177473' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3312, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:31.9497920' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3313, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:38.8643162' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3314, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:39.9921254' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3315, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:48.0255094' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3316, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:17:57.0228675' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/72', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3317, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:18:03.1034458' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3318, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:18:03.9066563' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3319, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:18:04.6279364' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3320, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:18:05.0583182' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3321, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:18:07.5514861' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3322, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:18:14.2182445' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3323, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:20:18.8342581' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3324, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:20:35.9248073' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3325, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:15.9143232' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3326, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:16.0132288' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3327, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:21.1815325' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3328, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:21.9716737' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3329, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:24.1409849' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3330, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:25.5049141' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3331, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:29.0770358' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3332, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:30.4181091' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3333, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:35.3168971' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (3334, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-11 21:21:36.6193600' AS DateTime2), N'访问', N'/admin/tablelist/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4311, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:25.0943260' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4312, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:25.5519462' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4313, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:33.3862194' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4314, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:34.4151314' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4315, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:37.7969576' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4316, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:39.5670165' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4317, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:39:48.5798179' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4318, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:40:01.8608802' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4319, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:40:02.4411358' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4320, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:40:03.2005998' AS DateTime2), N'访问', N'/admin/viewlist/add/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4321, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:40:10.2436269' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4322, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:40:11.3791936' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4323, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:42:49.4855287' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4324, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:43:05.6752352' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4325, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:51:29.9761093' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4326, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:52:38.9550412' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4327, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:53:08.2596078' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4328, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:54:37.2487690' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4329, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:54:37.8188701' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4330, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:54:39.6819751' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4331, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 13:54:40.6198002' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4332, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:04:11.2287026' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4333, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:04:29.4689052' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4334, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:05:39.8041474' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4335, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:09:30.0648909' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4336, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:21:03.1005404' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4337, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:21:57.9629152' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4338, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:22:57.9350299' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4339, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:28:48.2668687' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4340, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:30:33.6726730' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4341, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:30:38.8253165' AS DateTime2), N'访问', N'/admin/viewlist/edit/1006/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4342, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:30:52.5183060' AS DateTime2), N'访问', N'/admin/viewlist/edit/1008/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4343, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:32:20.9652520' AS DateTime2), N'访问', N'/admin/viewlist/edit/1008/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4344, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:32:41.9483026' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4345, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:32:46.5092661' AS DateTime2), N'访问', N'/admin/viewlist/edit/1008/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4346, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:37:22.9256251' AS DateTime2), N'访问', N'/admin/viewlist/edit/1008/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4347, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:44:37.0978366' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4348, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:44:43.1093417' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4349, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:44:57.4519660' AS DateTime2), N'访问', N'/admin/viewlist/edit/1008/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4350, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:45:11.5385882' AS DateTime2), N'访问', N'/admin/viewlist/edit/1008/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4351, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:48:47.6952650' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4352, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:48:49.7520547' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4353, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:48:51.4277556' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4354, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:57:36.1183783' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4355, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:57:36.6424206' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4356, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:57:42.9777075' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4357, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:57:44.1703515' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4358, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 14:57:46.6157785' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4359, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:02:21.2790230' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4360, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:02:21.8187638' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4361, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:02:32.7749888' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4362, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:02:33.9653641' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4363, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:02:37.4317761' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4364, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:28.5490215' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4365, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:29.0099839' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4366, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:35.2769264' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4367, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:36.2663917' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4368, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:39.3175837' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4369, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:03:50.1050367' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4370, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:04:12.8552511' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4371, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:04:19.9177688' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4372, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:04:25.1972933' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4373, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:04:30.4137617' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4374, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:05:35.9782733' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/75', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4375, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:06:11.6729218' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4376, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:06:42.2733394' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4377, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:07:43.1675960' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4378, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:17:01.2389409' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4379, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:17:56.7479752' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4380, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:18:17.9724948' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4381, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:21:48.1332537' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4382, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:21:48.6769726' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4383, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:21:57.9854583' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4384, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:21:59.0430437' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4385, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:22:01.1267538' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4386, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 15:22:02.4141554' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4387, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:29:52.7143160' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4388, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:29:53.2134126' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4389, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:31:36.5971413' AS DateTime2), N'访问', N'/admin/User/Login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4390, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:31:41.0453477' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4391, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:31:42.2457600' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4392, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:31:47.3192180' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4393, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:31:47.6426177' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4394, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:32:29.9161481' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4395, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:34:50.2574451' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4396, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:35:04.8381847' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4397, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:35:06.3228399' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4398, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 16:35:08.3180192' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4399, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:57:42.4158588' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4400, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:57:42.9690943' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4401, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:21.7890011' AS DateTime2), N'访问', N'/admin/User/Login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4402, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:26.4144137' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4403, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:27.5592371' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4404, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:29.1880342' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4405, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:30.4567867' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4406, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:34.5953451' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4407, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:58:39.0108403' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4408, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 20:59:54.4087108' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4409, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:00:12.9610907' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4410, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:02:23.6229578' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4411, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:03:42.6569199' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4412, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:05:07.5219072' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4413, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:07:10.9678524' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4414, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:07:52.6884421' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4415, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:09:45.9950688' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4416, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:10:16.7328153' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4417, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:12:37.6433628' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4418, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:17:10.3054233' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4419, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:17:42.0100037' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4420, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:18:10.7508099' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4421, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:18:16.9579561' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4422, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:18:31.4221152' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4423, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:23:40.4728596' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4424, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:23:57.7973484' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4425, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:24:29.1622682' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4426, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:25:38.4540159' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4427, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:07.0735174' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4428, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:07.5542112' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4429, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:14.2825664' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4430, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:15.2305788' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4431, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:18.1717503' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4432, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:20.3325670' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4433, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:40.4608782' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/74', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4434, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:28:59.4994270' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4435, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:29:02.2203004' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4436, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:29:11.0859332' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4437, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:29:13.3012591' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4438, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:29:24.8619398' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/74', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4439, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:29:58.3008197' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/73', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4440, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:30:03.0395298' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4441, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:30:04.0358678' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4442, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:30:48.7313664' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4443, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:31:01.0136403' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4444, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:31:36.5496184' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4445, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:32:32.6954600' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4446, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:32:48.2910228' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4447, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:37:55.6722041' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4448, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:38:12.6861139' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4449, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:40:04.1748323' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4450, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:41:33.1463620' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4451, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:42:06.4792847' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4452, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:42:39.7737526' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4453, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:43:30.6872039' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4454, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:43:36.1920732' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/73', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4455, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:43:44.0232368' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4456, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:43:53.3274820' AS DateTime2), N'访问', N'/admin/viewlist/edit/1016/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4457, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 21:43:58.5876622' AS DateTime2), N'访问', N'/admin/viewlist/edit/1015/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4458, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:07.5448396' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4459, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:08.0061720' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4460, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:15.1419175' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4461, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:16.0929157' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4462, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:17.3783484' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4463, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:18.0687530' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4464, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:05:20.8583257' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4465, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:06:24.7153617' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4466, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:06:27.7400327' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4467, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:06:38.2700221' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4468, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:06:42.8058624' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4469, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:06:46.9143346' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/74', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4470, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:07:03.8494443' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4471, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:07:11.0800603' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4472, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:07:15.8269706' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4473, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:07:53.4775723' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4474, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:08:15.7329265' AS DateTime2), N'访问', N'/admin/viewlist/edit/1017/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4475, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:45:59.5563112' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4476, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:00.1126208' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4477, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:09.0988736' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4478, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:10.1422611' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4479, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:21.4958975' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4480, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:23.6510765' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4481, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:46:31.9287448' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/76', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4482, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:50:11.4502007' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4483, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:56:07.7235603' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4484, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:56:17.6608706' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4485, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:56:18.8672719' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4486, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-13 22:56:29.3876246' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4487, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:05:52.1190351' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4488, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:05:52.5699724' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4489, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:05:59.0489029' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4490, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:06:00.1078058' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4491, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:06:02.4316516' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4492, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:07:17.9278953' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4493, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:07:26.1856570' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4494, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:07:40.7178092' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4495, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:07:50.8358999' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4496, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:08:22.1814050' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4497, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:10:08.7984785' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4498, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:10:20.1022458' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4499, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:10:23.9804528' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4500, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:10:43.8860133' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4501, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:10:52.0466125' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4502, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:12:05.0006028' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4503, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:12:47.2772201' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4504, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:15:08.0133869' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4505, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:15:35.6805123' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4506, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:15:36.4857179' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4507, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:15:43.7704779' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4508, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:16:06.2967865' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4509, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:19:02.4660994' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4510, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:19:18.4756935' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4511, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:22.9814405' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4512, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:23.5030869' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4513, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:30.7448623' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4514, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:31.8173460' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4515, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:35.9527100' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4516, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:37.2230833' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4517, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:38.4837915' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4518, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:39.1537231' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4519, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:39.6202813' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4520, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:40.1910738' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4521, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:46.4465360' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4522, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:48.0286392' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4523, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:48.7725602' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4524, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:50.8820047' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4525, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:39:57.1761463' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4526, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:40:15.5167819' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4527, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:40:16.4467745' AS DateTime2), N'访问', N'/admin/tablelist/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4528, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:40:51.8669619' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4529, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:00.3114405' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4530, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:29.4319871' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4531, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:43.4476536' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4532, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:46.1017625' AS DateTime2), N'访问', N'/admin/viewlist/edit/2/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4533, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:55.6530225' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4534, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:56.9282328' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4535, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:41:58.6009006' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4536, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:42:15.1216264' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/82', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4537, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:42:23.5581314' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4538, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:42:23.9761848' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4539, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:42:29.8337240' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4540, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:42:41.6875684' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4541, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:42:51.6486460' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4542, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:43:10.9773470' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4543, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:43:45.9871648' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4544, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:43:53.5781435' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4545, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:43:59.8728700' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4546, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:44:17.9029764' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4547, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:44:24.4077795' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4548, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:44:36.9845739' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4549, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:44:43.2651591' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4550, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:44:46.6493139' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4551, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:56:30.5804040' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4552, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:56:31.9483167' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4553, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:58:18.4968120' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4554, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:58:21.4386789' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4555, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:58:28.5709458' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4556, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:58:59.6563014' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4557, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:59:06.1074626' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4558, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 22:59:10.1323610' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4559, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:00:36.9805172' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4560, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:00:36.9991516' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4561, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:00:37.0366776' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4562, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:00:42.5577730' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4563, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:01:35.0645161' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4564, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:01:36.1860754' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4565, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:02:53.2344366' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4566, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:02:54.3573352' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4567, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:02.8740620' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4568, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:05.2495230' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4569, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:07.1623281' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4570, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:08.3853924' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4571, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:11.7380891' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4572, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:03:23.7621525' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4573, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:04:10.6956311' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4574, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:06:15.7212985' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4575, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:06:22.4995890' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4576, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:06:30.5661867' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4577, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-14 23:06:50.4406648' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4578, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:15:56.2487375' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4579, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:15:56.7959635' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4580, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:16:02.5551672' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4581, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:16:03.4980494' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4582, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:18:06.0585118' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4583, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:18:07.8286886' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4584, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:19:12.5872987' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4585, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:19:12.7131096' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4586, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:19:14.1100124' AS DateTime2), N'访问', N'/admin/User/Logout', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4587, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:19:14.2012290' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4588, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:21:27.8441949' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4589, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:21:28.0243361' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4590, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:21:29.5512912' AS DateTime2), N'访问', N'/admin/User/Logout', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4591, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:21:29.5639891' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4592, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:23:53.0786946' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4593, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:23:58.9224383' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4594, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:23:59.0744500' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4595, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:24:05.2556848' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4596, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:24:10.1956608' AS DateTime2), N'访问', N'/admin/role/edit/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4597, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:24:19.6149622' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4598, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:24:32.0338838' AS DateTime2), N'访问', N'/admin/department/edit/30', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4599, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:24:35.1425828' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4600, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:23.9367623' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4601, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:26.6877584' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4602, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:29.4723454' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4603, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:31.0970945' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4604, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:34.6144367' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4605, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:35.8704376' AS DateTime2), N'访问', N'/admin/systemoption/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4606, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:39.8610368' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4607, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:42.5964859' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4608, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:43.6864648' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4609, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:25:45.3609964' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4610, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:10.4187583' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4611, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:13.9418913' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4612, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:15.3224394' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4613, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:16.0141960' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4614, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:17.4573149' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4615, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:18.2517041' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4616, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:26:19.0270503' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4617, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:35:57.0773497' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4618, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:35:57.5006059' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4619, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:03.8903499' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4620, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:04.8648390' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4621, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:07.7052313' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4622, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:37.9023091' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4623, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:46.7944046' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4624, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:55.7009870' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4625, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:36:56.2090417' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4626, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:37:02.2754391' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4627, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:37:02.7539678' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4628, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:37:09.4981910' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4629, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:40:46.2170630' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4630, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:40:46.4197190' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4631, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:40:46.6350478' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4632, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:41:31.6899404' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4633, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:41:48.8850087' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4634, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:41:49.3658372' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4635, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:41:58.3234560' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4636, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:41:59.2436188' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4637, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:42:02.1362895' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4638, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:42:02.7525275' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4639, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:42:19.3988575' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4640, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:52:48.9416737' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4641, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:52:50.2261948' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4642, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:52:56.5777961' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4643, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:52:57.4822523' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4644, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:53:05.9064241' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4645, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:53:08.0501045' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4646, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:53:13.5004536' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4647, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:53:16.2874173' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4648, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:53:25.0450598' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4649, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 09:53:33.9130466' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4650, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:14:53.6907229' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4651, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:14:54.0715351' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4652, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:15:39.9766679' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4653, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:15:46.4201366' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4654, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:15:55.0145589' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4655, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:15:58.9672010' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4656, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:16:02.5981330' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4657, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:17:03.6849974' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/77', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4658, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:17:17.4295488' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4659, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:17:49.9661049' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4660, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:18:10.8200047' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4661, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:18:15.2944048' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4662, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:22:25.5008107' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4663, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:22:25.8459102' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4664, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:22:28.1659810' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4665, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:22:29.1713925' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4666, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:24:00.6819906' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4667, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:25:34.5331393' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4668, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:25:36.8239085' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4669, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:25:37.7368106' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4670, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:25:40.5823598' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4671, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:25:41.7320782' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4672, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:26:57.6549113' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4673, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:34:05.5709483' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4674, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:34:05.9136394' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4675, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:34:09.0367301' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4676, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:35:17.4574874' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4677, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:36:49.1126161' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4678, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:36:49.4657512' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4679, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:36:51.4836314' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4680, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:37:02.4825508' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4681, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:41:09.8833069' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4682, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:41:10.2385765' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4683, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:41:12.2778946' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4684, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:41:13.6111552' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4685, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:54:02.6711123' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4686, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:54:04.4744483' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (4687, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 10:54:05.7334272' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5311, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:16.2014071' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5312, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:17.7559891' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5313, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:24.5860437' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5314, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:25.8681999' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5315, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:28.3813953' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5316, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:22:30.6082119' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5317, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:27:24.5348774' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5318, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:27:30.5678397' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5319, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:28:17.0154065' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5320, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:28:17.3388496' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5321, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:28:20.0853405' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5322, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 21:28:21.1932450' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5323, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:30:24.9911303' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5324, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:30:31.0661255' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5325, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:30:35.8484968' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5326, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:30:38.6841429' AS DateTime2), N'访问', N'/admin/department/add/30', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5327, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:30:44.5250511' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5328, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:31:06.2814579' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5329, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:31:07.6193856' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5330, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:42:15.7337698' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5331, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:42:17.3054646' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5332, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:44:05.8965228' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5333, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:44:17.5924107' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/79', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5334, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-15 22:44:30.4308827' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/79', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5335, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:13:50.3463552' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5336, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:13:51.7646447' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5337, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:01.9379430' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5338, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:03.0540441' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5339, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:05.3088855' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5340, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:09.6766381' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/79', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5341, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:17.5895834' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5342, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:18.8237797' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5343, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:36.8830066' AS DateTime2), N'访问', N'/admin/viewlist/Add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5344, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:14:47.4387863' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5345, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:15:06.5398852' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5346, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:15:06.7085009' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5347, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:18:19.4416220' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5348, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:18:19.7107659' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5349, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:18:24.4397039' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5350, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:18:26.2406672' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5351, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:20:06.0993368' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5352, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:20:06.4316514' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5353, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:20:11.7109018' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5354, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:20:12.6098767' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5355, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:23:42.5027859' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5356, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:23:46.5725483' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/79', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5357, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:23:56.3059017' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5358, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:23:57.2560791' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5359, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:43:17.4341755' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5360, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:43:17.8867874' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5361, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:43:22.4784159' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5362, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:43:26.8404619' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/79', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5363, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:43:41.8363231' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5364, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:43:42.8326319' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5365, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:45:16.7026075' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5366, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:45:17.0547154' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5367, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:45:18.7090978' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5368, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:45:19.6161282' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5369, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:53:36.0766160' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5370, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:53:37.1088708' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5371, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:53:37.6704088' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5372, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:53:39.8272020' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5373, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 10:53:41.1577657' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5374, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:16.5245033' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5375, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:18.0450277' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5376, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:35.6992472' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5377, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:36.9595419' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5378, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:43.8592476' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5379, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:11:45.2874649' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5380, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:12:04.0245284' AS DateTime2), N'访问', N'/admin/department/edit/41', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5381, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:12:31.1877252' AS DateTime2), N'访问', N'/admin/department/edit/41', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5382, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:12:49.5793609' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5383, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:12:52.3187944' AS DateTime2), N'访问', N'/admin/menu/add/2043', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5384, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:13:01.8377252' AS DateTime2), N'访问', N'/admin/menu/add/2041', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5385, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:13:06.5358976' AS DateTime2), N'访问', N'/admin/menu/add/2035', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5386, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:13:10.4562144' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5387, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:13:11.0199799' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5388, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:13:13.4545426' AS DateTime2), N'访问', N'/admin/department/add/41', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5389, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:14:18.1559264' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5390, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:14:21.5367885' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5391, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:14:31.7054978' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5392, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:14:34.2276738' AS DateTime2), N'访问', N'/admin/department/add/40', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5393, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-16 21:14:38.8886652' AS DateTime2), N'访问', N'/admin/department/add/39', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5394, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:52:57.1769209' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5395, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:52:58.3882879' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5396, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:53:32.1518132' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5397, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:53:33.1775519' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5398, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:53:37.4806377' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5399, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:55:00.2334387' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5400, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:55:12.8471619' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5401, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:56:04.0599494' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5402, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:56:18.1983128' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5403, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:56:29.7255993' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5404, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:56:58.2764409' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5405, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:57:19.2175452' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5406, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 13:57:48.5751979' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5407, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:21.8634043' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5408, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:23.1074553' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5409, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:32.0410258' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5410, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:32.9376261' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5411, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:40.5131509' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5412, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:02:46.1948076' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/80', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5413, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:02.9658126' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/77', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5414, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:10.6725379' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5415, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:12.3331389' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5416, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:13.4078410' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5417, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:13.9645538' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5418, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:22.0358204' AS DateTime2), N'访问', N'/admin/viewlist/edit/2/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5419, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:32.5487801' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5420, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:03:50.5406575' AS DateTime2), N'访问', N'/admin/viewlist/edit/2/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5421, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:05:03.2200598' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5422, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:05:07.4611302' AS DateTime2), N'访问', N'/admin/viewlist/edit/4/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5423, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-17 14:05:11.8279377' AS DateTime2), N'访问', N'/admin/viewlist/add/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5424, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:29:42.4988844' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5425, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:29:44.0945165' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5426, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:29:54.0740011' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5427, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:29:55.4532202' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5428, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:30:01.7815659' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5429, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:30:02.9437203' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5430, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:30:34.9880927' AS DateTime2), N'访问', N'/admin/menu/edit/2045', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5431, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:31:00.0712702' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5432, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:31:11.3456253' AS DateTime2), N'访问', N'/admin/menu/edit/2046', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5433, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:32:28.1454354' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5434, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-21 22:34:55.1309139' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5435, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:23:43.3928653' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5436, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:23:44.7555233' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5437, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:23:54.2118622' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5438, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:23:55.3668153' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5439, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:53:22.2242743' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5440, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:57:56.9224380' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5441, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 19:59:56.3161194' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5442, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 20:00:13.9230748' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5443, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 20:01:07.7860404' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5444, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 20:02:37.1482275' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5445, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 20:04:06.2353275' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5446, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:03:08.8637957' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5447, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:03:10.4085524' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5448, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:03:18.9536734' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5449, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:03:20.1557962' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5450, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:06:35.5550483' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5451, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:06:37.0834053' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5452, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:06:59.1156750' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5453, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:07:00.2455400' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5454, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:28:15.9485526' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5455, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 21:28:21.8241841' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5456, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 22:00:29.8751883' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5457, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:17:00.2039619' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5458, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:17:36.0943833' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5459, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:20:29.7585044' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5460, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:24:08.7791796' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5461, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:25:15.7530824' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5462, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:26:52.4251517' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5463, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-22 23:26:55.9143335' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5464, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:06:31.5047464' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5465, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:06:35.0018453' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5466, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:09:29.5821201' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5467, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:09:33.5218998' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5468, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:10:57.8140752' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5469, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:11:03.0694151' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5470, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:21:36.9823073' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5471, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:21:40.6062467' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5472, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:23:11.4064242' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5473, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:23:16.8138889' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5474, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:33:51.8098844' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5475, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:33:54.8373914' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5476, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:35:16.8594123' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5477, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:36:03.5564219' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5478, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:36:41.3470813' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5479, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:37:06.2485029' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5480, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:37:57.2262074' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5481, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:38:30.0034854' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5482, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:39:06.6584041' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5483, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:41:52.2307866' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5484, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:41:53.6345313' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5485, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:42:48.7210384' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5486, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:43:17.3618367' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5487, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:43:53.2577004' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5488, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:45:06.2885957' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5489, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:47:05.1650380' AS DateTime2), N'访问', N'/admin', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5490, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 00:47:08.2109465' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5491, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 20:25:06.1498147' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5492, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 20:25:07.4687047' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5493, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 20:25:17.1834790' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5494, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-23 20:25:18.5115403' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5495, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:20:55.6074553' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5496, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:20:57.2737376' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5497, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:21:04.7809621' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5498, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:21:06.1297100' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5499, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:22:39.9883880' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5500, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:23:20.3511050' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5501, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:26:46.1513602' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5502, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:26:47.5450160' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5503, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:27:03.3629608' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5504, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-01-26 23:27:04.5408548' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5505, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:27:57.1829781' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5506, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:27:58.1646305' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5507, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:28:05.4860471' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5508, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:28:06.7123120' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5509, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:28:16.3658685' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5510, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:28:17.8084009' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5511, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:28:20.6478675' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5512, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:29:23.3837428' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5513, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:33:00.3011290' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5514, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:34:05.1712180' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5515, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:34:27.6084384' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5516, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:35:11.1457103' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5517, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:36:27.5355157' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5518, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:36:36.5356415' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5519, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:36:37.6157700' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5520, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:39:42.1893407' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5521, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:39:42.6229258' AS DateTime2), N'访问', N'/admin/systemoption/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5522, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:39:43.5072960' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5523, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:40:27.1996600' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5524, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 12:40:52.5833334' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5525, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:02:19.7260668' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5526, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:02:21.1864187' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5527, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:03:37.4709171' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5528, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:04:38.8078542' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5529, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:15.1373904' AS DateTime2), N'访问', N'/admin/user/edit/13', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5530, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:16.7996758' AS DateTime2), N'访问', N'/admin/user/edit/13', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5531, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:20.2237909' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5532, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:20.7734698' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5533, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:22.0035038' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5534, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:47.9744637' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (5535, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-02-21 13:05:52.2641629' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6505, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:27.9430283' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6506, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:26.9060275' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6507, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:55.7703934' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6508, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:57:56.8274691' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6509, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:13.7378006' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6510, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:15.8229355' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6511, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:31.1065149' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6512, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:32.9653901' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6513, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:33.7971102' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6514, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:36.2294764' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6515, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:42.1473837' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6516, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:43.1808126' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6517, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:46.5096598' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6518, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:48.3415394' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6519, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:58:53.1906351' AS DateTime2), N'访问', N'/admin/menu/edit/2044', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6520, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:59:01.2845994' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6521, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:59:03.3558745' AS DateTime2), N'访问', N'/admin/tablelist/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6522, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:59:18.6852417' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6523, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:59:43.3972758' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6524, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-08 21:59:46.1898548' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6525, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:30:55.6891706' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6526, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:30:54.6170647' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6527, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:31:04.8236193' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6528, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:31:06.2362487' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6529, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:31:14.8642524' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6530, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-09 20:33:39.0135984' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6531, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:45:18.8744330' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6532, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:45:20.0495051' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6533, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:47:44.2431846' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6534, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:47:45.3865718' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6535, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:52:21.0876502' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6536, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:52:22.2326584' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6537, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:52:29.0297153' AS DateTime2), N'访问', N'/admin/control/index', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6538, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-11 22:52:29.0709248' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6539, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:12:33.7224211' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6540, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:12:34.9005520' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6541, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:12:43.1885699' AS DateTime2), N'访问', N'/admin/control/index', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6542, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:12:43.2314422' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6543, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:17:46.7672407' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6544, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:18:09.4834823' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6545, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:21:44.7370120' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6546, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:21:45.8588742' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6547, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:24:02.0052254' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6548, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:24:03.1674389' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6549, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:24:50.1119932' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6550, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:30:44.1996780' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6551, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:30:45.5062081' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6552, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:31:11.0288900' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6553, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:32:33.5940443' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6554, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:33:21.5133343' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6555, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:33:23.9631893' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6556, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:34:01.8384312' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6557, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:34:03.9469691' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6558, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:34:05.1963008' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6559, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:34:06.3588558' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6560, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:37:56.8763454' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6561, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:38:27.7384394' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6562, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:38:27.9298789' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6563, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:39:07.0486938' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6564, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:39:07.1653267' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6565, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:39:51.8353856' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6566, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:39:51.9786443' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6567, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:40:06.1549502' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6568, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:40:06.2526613' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6569, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:40:11.7369744' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6570, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:40:19.0382538' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6571, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:41:06.9319937' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6572, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:41:10.0491767' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6573, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:41:20.1567127' AS DateTime2), N'访问', N'/admin/department/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6574, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:41:50.4077768' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6575, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:49:39.7690944' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6576, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:49:41.0495289' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6577, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:49:52.5913912' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6578, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:49:54.9432834' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6579, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:50:11.5060280' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6580, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:50:37.8162403' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6581, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:50:42.4707155' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6582, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:50:47.6986298' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6583, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:54:17.6867869' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6584, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:54:18.9113784' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6585, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:54:26.9308912' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6586, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:54:28.3225695' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6587, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:54:36.7410513' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6588, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:54:38.2182827' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6589, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:58:50.2177700' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6590, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:58:51.4892781' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6591, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:58:58.9351024' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6592, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:59:00.4177071' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6593, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:59:02.6754265' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6594, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 20:59:03.9796045' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6595, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:00:19.6461019' AS DateTime2), N'访问', N'/admin/user/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6596, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:00:55.9455284' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6597, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:00:56.9362975' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6598, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:00:57.5624404' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6599, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:00:59.4362917' AS DateTime2), N'访问', N'/admin/user/authen/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6600, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:26.8805088' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6601, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:27.9745341' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6602, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:35.9181151' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6603, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:37.6518858' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6604, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:46.3181105' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6605, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:08:49.1827924' AS DateTime2), N'访问', N'/admin/user/authen/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6606, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:09:03.6764287' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6607, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:09:10.0222938' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6608, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:09:16.0016675' AS DateTime2), N'访问', N'/admin/user/selectUser/30', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6609, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:09:22.4552437' AS DateTime2), N'访问', N'/admin/user/selectUser/30', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6610, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:10:04.8060264' AS DateTime2), N'访问', N'/admin/user/selectUser/28', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6611, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:11:19.5040779' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6612, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:11:19.6406511' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6613, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:11:23.9594117' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6614, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:11:31.9269145' AS DateTime2), N'访问', N'/admin/user/selectUser/30', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6615, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:14:20.5771475' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6616, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:14:24.9173608' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6617, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:14:27.9132527' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6618, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:19:39.3657451' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6619, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:20:33.0251465' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6620, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:23:42.1157953' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6621, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:23:43.9220563' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6622, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:30:16.8446573' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6623, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:32:06.2527632' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6624, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:32:06.8095221' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6625, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:32:08.0440126' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6626, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:32:08.5950995' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6627, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:32:15.0890194' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6628, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:32:18.3316173' AS DateTime2), N'访问', N'/admin/user/selectUser/30', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6629, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:39:34.6380440' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6630, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:16.3428930' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6631, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:17.0446967' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6632, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:18.8443176' AS DateTime2), N'访问', N'/admin/module/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6633, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:41.6124404' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6634, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:43.2896754' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6635, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:44.7225321' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6636, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:45.9464472' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6637, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:46.6974295' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6638, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:47.4001146' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6639, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:47.9094029' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6640, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:42:48.3381811' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6641, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:13.6828376' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6642, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:20.5963644' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6643, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:20.6448148' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6644, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:21.5172037' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6645, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:21.5693492' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6646, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:22.5381471' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6647, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:26.7007461' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6648, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:26.7544024' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6649, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:28.2894530' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6650, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:28.8541432' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6651, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:29.1045251' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6652, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:29.3531204' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6653, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:29.7752498' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6654, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:42.7061354' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6655, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:43:46.8775538' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6656, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:44:38.9575869' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6657, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 21:44:39.0609540' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6658, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:03.1324500' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6659, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:04.0056589' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6660, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:11.3351256' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6661, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:12.4261310' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6662, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:14.6143495' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6663, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:15.9013724' AS DateTime2), N'访问', N'/admin/systemoption/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6664, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:24.1632464' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6665, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:28.7497425' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6666, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:01:30.0286202' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6667, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:02:06.6922495' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6668, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:02:08.5332498' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6669, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:02:11.2145814' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6670, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:02:11.7060281' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6671, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:02:13.2524196' AS DateTime2), N'访问', N'/admin/user/edit/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6672, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:03:03.9546463' AS DateTime2), N'访问', N'/admin/user/edit', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6673, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:05:16.6338201' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6674, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:05:17.0250594' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6675, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:05:18.0359336' AS DateTime2), N'访问', N'/admin/module/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6676, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:05:46.8699333' AS DateTime2), N'访问', N'/admin/module/edit/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6677, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:19.8149297' AS DateTime2), N'访问', N'/admin/module/edit/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6678, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:32.8580398' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6679, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:36.0774176' AS DateTime2), N'访问', N'/admin/tablelist/edit/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6680, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:43.1120863' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6681, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:44.7381496' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6682, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:48.8295027' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/83', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6683, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:56.0006283' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6684, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:56.6917970' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6685, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:06:57.6559539' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6686, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:07:02.5168554' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6687, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:07:04.2245891' AS DateTime2), N'访问', N'/admin/viewlist/index/1009', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6688, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:07:04.9824580' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6689, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:19:38.4848990' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6690, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:19:39.4580491' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6691, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:19:45.9997383' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6692, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:11.4337979' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6693, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:12.3884091' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6694, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:20.7411276' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6695, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:22.0979378' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6696, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:30.2543919' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6697, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:31.6559536' AS DateTime2), N'访问', N'/admin/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6698, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:32.7474942' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6699, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:34.0060082' AS DateTime2), N'访问', N'/admin/user/department', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6700, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:35.8436513' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6701, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:38.3980452' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6702, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:39.0759699' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6703, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:44.1281495' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6704, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:46.3090377' AS DateTime2), N'访问', N'/admin/log/login', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6705, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:47.1073947' AS DateTime2), N'访问', N'/admin/log/operation', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6706, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-12 22:23:47.8978068' AS DateTime2), N'访问', N'/admin/log/chart', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6707, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:43:47.9155940' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6708, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:43:48.7994265' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6709, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:43:55.1341716' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6710, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:43:56.4532480' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6711, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:44:00.3889556' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6712, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:44:17.6183570' AS DateTime2), N'访问', N'/admin/tablelist/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6713, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:46:52.8622182' AS DateTime2), N'访问', N'/admin/tablelist/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6714, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:47:38.3128755' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6715, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:48:27.4038081' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6716, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:49:20.5521929' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1084', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6717, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:49:30.1343787' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1085', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6718, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:49:37.6586844' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6719, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:50:13.3987586' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6720, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:50:20.1017610' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6721, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:50:21.4826897' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6722, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:51:45.0217840' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6723, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:52:16.1411221' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6724, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:52:52.1625405' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6725, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:52:52.2227057' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6726, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:52:55.1982396' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6727, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:52:59.6998125' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6728, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:53:02.3457691' AS DateTime2), N'访问', N'/admin/viewlist/add/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6729, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:53:06.7896467' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6730, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:53:07.5499487' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6731, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:53:12.7803086' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1080', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6732, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:53:21.6372702' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1079', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6733, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:58:50.3519598' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6734, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:03.2867048' AS DateTime2), N'访问', N'/admin/viewlist/add/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6735, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:18.7811828' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1080', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6736, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:27.5150387' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1079', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6737, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:32.8039279' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6738, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:34.8594686' AS DateTime2), N'访问', N'/admin/viewlist/add/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6739, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:38.0774229' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6740, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:40.0419483' AS DateTime2), N'访问', N'/admin/viewlist/detail/1/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6741, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:42.1724474' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6742, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 16:59:48.9085734' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1079', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6743, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:02.0203767' AS DateTime2), N'访问', N'/admin/viewlist/add/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6744, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:07.2125497' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1079', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6745, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:11.5004906' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1080', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6746, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:17.1411866' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6747, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:20.3959000' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6748, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:34.3950174' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6749, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:35.2288878' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6750, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:00:44.4930715' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6751, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:01:27.6150905' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6752, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:01:41.3583518' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6753, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:40.2558397' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6754, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:41.3308295' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6755, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:48.7694338' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6756, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:49.8896470' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6757, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:51.9233154' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6758, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:02:53.1716770' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6759, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:06:38.1329656' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6760, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:06:39.3598495' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6761, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:09.2688044' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6762, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:10.3686678' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6763, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:12.0588672' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6764, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:13.0107310' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6765, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:24.1224040' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6766, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:28.5280363' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6767, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:36.2403991' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6768, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:42.9313339' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6769, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:07:53.3608636' AS DateTime2), N'访问', N'/admin/viewlist/add/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6770, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:08:23.5741370' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1085', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6771, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:08:32.2926045' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1084', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6772, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:08:40.1800945' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6773, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:08:42.4803602' AS DateTime2), N'访问', N'/admin/tablelist/edit/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6774, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:39.7952009' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6775, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:13:41.0561788' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6776, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:14:06.2803537' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6777, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:14:07.8769763' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6778, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:14:09.6306715' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6779, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:15:14.0500060' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6780, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:15:22.7110821' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6781, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:15:31.3361661' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6782, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:16:30.9889990' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6783, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:19:14.9033653' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6784, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:21.3623916' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6785, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:22.6330250' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6786, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:28.7618350' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6787, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:29.9781691' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6788, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:31.8378015' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6789, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:20:49.3119865' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6790, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:21:14.7678959' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6791, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:21:18.2163550' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1085', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6792, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:21:27.6825195' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1082', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6793, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:24:22.2195678' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6794, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:24:22.8867041' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6795, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:24:57.9150950' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6796, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:25:52.9809381' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6797, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:25:55.1617650' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6798, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:25:58.1211956' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1086', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6799, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:26:06.7444283' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6800, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:26:35.6899087' AS DateTime2), N'访问', N'/admin/tablecolumn/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6801, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:27:30.4357332' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6802, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:27:30.9899760' AS DateTime2), N'访问', N'/admin/tablelist/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6803, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:27:32.2215299' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6804, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:27:34.6174411' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1087', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6805, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:16.1883522' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6806, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:17.1936684' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6807, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:24.6230974' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6808, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:26.1313132' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6809, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:28.7589683' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6810, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:28:57.8170825' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6811, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:29:01.7375217' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1085', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6812, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:29:11.2500469' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6813, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:29:21.4436039' AS DateTime2), N'访问', N'/admin/viewlist/edit/1/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6814, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:29:45.6892499' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1088', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6815, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:29:55.2269864' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/1088', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6816, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:30:01.0140311' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6817, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:30:12.8137211' AS DateTime2), N'访问', N'/admin/module', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6818, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:30:17.3915977' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6819, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 17:31:12.6853954' AS DateTime2), N'访问', N'/admin/systemoption/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6820, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 19:03:41.7085377' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6821, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 19:03:42.7582783' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6822, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:42:51.5687304' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6823, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:42:52.4295712' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6824, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:43:01.0986121' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6825, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:47:01.7158932' AS DateTime2), N'访问', N'/admin/menu/add', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6826, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:47:02.8111221' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6827, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:48:25.4690900' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6828, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:48:30.3496470' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6829, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:49:58.5711253' AS DateTime2), N'访问', N'/admin/menu/add', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6830, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:49:59.6507303' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6831, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:10.1758841' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6832, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:18.3224763' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6833, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:49.0802314' AS DateTime2), N'访问', N'/admin/menu/add', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6834, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:50.1442463' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6835, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:50:57.1734247' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6836, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:51:04.8706562' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6837, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:51:25.2706884' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6838, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:52:15.3805415' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6839, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:52:16.2612805' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6840, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:52:21.7231385' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6841, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:52:23.7890628' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6842, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:00.3162793' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6843, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:05.1868272' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6844, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:09.5143699' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6845, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:27.3616502' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6846, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:27.3725600' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6847, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:31.8613899' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6848, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:36.5241357' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6849, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:53:37.5966608' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6850, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:55:40.2957681' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6851, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:55:41.3627559' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6852, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:55:50.1352563' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6853, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:55:53.2521022' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6854, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 20:55:55.2785239' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6855, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:11:59.2352960' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6856, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:12:00.1565099' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6857, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:12:06.3528044' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6858, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:12:11.6421607' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6859, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:12:51.0335765' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6860, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:13:21.5868673' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6861, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:14:40.8921225' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6862, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:14:42.1260602' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6863, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:14:48.6372976' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6864, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:14:51.1332778' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6865, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:16:30.7582347' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6866, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:16:53.1241923' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6867, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:20:00.5544009' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6868, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:20:01.9734011' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6869, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:20:07.8691593' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6870, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:20:12.5572972' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6871, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:20:14.4771571' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6872, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:21:04.0435920' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6873, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:22:40.2390155' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6874, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:22:43.0643942' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6875, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:23:24.7433022' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6876, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:25:09.8973681' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6877, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:25:53.4584706' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6878, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:25:54.9872535' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6879, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:26:01.3954299' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6880, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:26:01.7783312' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6881, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:29:09.3749982' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6882, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:09.1267335' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6883, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:10.0970914' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6884, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:16.1164849' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6885, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:17.4295402' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6886, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:29.3721933' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6887, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:51.1273847' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6888, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:52.5992817' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6889, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:33:58.0928949' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6890, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:34:58.3562306' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6891, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:34:58.9446960' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6892, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:36:55.5230838' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6893, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:36:56.9106709' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6894, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:37:06.5109918' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6895, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:37:24.5208959' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6896, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:38:18.8891441' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6897, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:40:26.5556564' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6898, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:40:27.4368828' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6899, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:40:34.3241089' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6900, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:40:36.6859195' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6901, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:40:38.9397495' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6902, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:41:48.9034987' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6903, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:41:49.9220295' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6904, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:41:59.5141428' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6905, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 21:42:05.3734986' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6906, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:02:13.6699003' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6907, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:02:14.8972668' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6908, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:02:22.6103170' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6909, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:02:23.1888677' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6910, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:03:21.2983602' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6911, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:07:58.3821651' AS DateTime2), N'访问', N'/admin', 0, N'无')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6912, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:07:59.6619406' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6913, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:08:06.2191011' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6914, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:08:16.9986863' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6915, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:08:39.7079135' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6916, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:04.9735007' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6917, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:06.1234495' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6918, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:13.3059865' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6919, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:33.1573907' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6920, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:36.3044730' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6921, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:36.9457438' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6922, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:39.8250369' AS DateTime2), N'访问', N'/admin/viewlist/index/2', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6923, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:44.9605195' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6924, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:48.6145744' AS DateTime2), N'访问', N'/admin/viewlist/edit/4/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6925, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:11:59.7758523' AS DateTime2), N'访问', N'/admin/tablecolumn/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6926, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:12:07.4838087' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/81', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6927, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:13:44.8029529' AS DateTime2), N'访问', N'/admin/tablecolumn/edit/81', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6928, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:14:10.0321070' AS DateTime2), N'访问', N'/admin/viewlist/index/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6929, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:14:13.7721480' AS DateTime2), N'访问', N'/admin/viewlist/edit/4/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6930, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:14:22.3287408' AS DateTime2), N'访问', N'/admin/viewlist/edit/4/1011', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6931, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:19:37.6906553' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6932, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:19:38.7673137' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6933, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:19:45.0844511' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6934, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:19:47.2367133' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6935, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:19:50.6628138' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6936, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:20:06.7014558' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6937, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:28.2409151' AS DateTime2), N'访问', N'/admin/menu', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6938, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:29.3204755' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6939, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:32.8627204' AS DateTime2), N'访问', N'/admin/role', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6940, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:32.9048346' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6941, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:37.0827932' AS DateTime2), N'访问', N'/admin/control/index', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6942, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:37.1238813' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6943, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:42.8460407' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6944, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:44.1083375' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6945, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:22:50.5886848' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6946, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:23:57.8755541' AS DateTime2), N'访问', N'/admin/menu/edit/50', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6947, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:23:59.3328307' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6948, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:07.2134311' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6949, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:08.4678535' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6950, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:13.8137685' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6951, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:47.1737683' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6952, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:48.4744807' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6953, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:49.2298079' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6954, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:49.9331347' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6955, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:50.6062120' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6956, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:51.2937831' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6957, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:52.0313343' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6958, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:52.7920510' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6959, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:24:53.5122157' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6960, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:02.3301215' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6961, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:04.4411822' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6962, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:05.0067668' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6963, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:05.4851193' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6964, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:06.0278347' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6965, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:06.6400469' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6966, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:25:35.2274607' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6967, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:27.9490391' AS DateTime2), N'访问', N'/admin/menu/add', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6968, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:29.0218659' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6969, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:35.5233511' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6970, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:36.8692145' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6971, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:39.5643146' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6972, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:54.0360035' AS DateTime2), N'访问', N'/admin/menu/edit/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6973, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:26:58.4417297' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6974, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:28:23.1619253' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6975, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:29:30.9034006' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6976, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:30:14.9947735' AS DateTime2), N'访问', N'/admin/menu/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6977, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:30:24.9013741' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6978, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:30:31.7060817' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6979, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:30:32.6368739' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6980, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:30:34.0076690' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6981, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:37:41.5465061' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6982, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:37:42.4942252' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6983, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:37:49.0990151' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6984, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:37:50.2042191' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6985, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:37:53.2576090' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6986, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:05.8660204' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6987, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:08.8408364' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6988, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:09.5065735' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6989, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.1683104' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6990, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.6422204' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6991, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.7365498' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6992, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.8469451' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6993, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.8771534' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6994, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.9501279' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6995, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:10.9832656' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6996, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:11.0405391' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6997, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:11.2436297' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6998, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:11.2717768' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (6999, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:11.3105547' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7000, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:11.4953899' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7001, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:14.4576925' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7002, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:16.6026727' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7003, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:38.0998976' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7004, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:39.2290465' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7005, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:47.1491297' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7006, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:48.2399129' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7007, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:51.2402321' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7008, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:38:53.3706468' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7009, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:39:09.1724118' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7010, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:41:53.5433451' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7011, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:41:54.8764088' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7012, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:42:03.9953202' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7013, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:42:03.9953194' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7014, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:42:05.1476225' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7015, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:42:17.5554189' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7016, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:03.2953308' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7017, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:04.2508603' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7018, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:12.3350979' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7019, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:12.6605502' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7020, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:13.5367313' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7021, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:14.6298252' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7022, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:26.0020335' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7023, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:26.6229048' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7024, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:27.9541986' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7025, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:28.5553962' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7026, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:48.3205425' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7027, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:55.1338705' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7028, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:44:56.1709165' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7029, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:45:01.8358890' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7030, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:45:50.4460050' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7031, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:46:07.8223923' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7032, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:47:24.1727991' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7033, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:48:33.3692669' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7034, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:31.0005001' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7035, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:31.9890155' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7036, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:38.8884424' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7037, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:39.6579651' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7038, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:40.4916565' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7039, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:50:46.0353528' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7040, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:24.3106925' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7041, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:25.7595616' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7042, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:32.0958936' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7043, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:33.2491781' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7044, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:36.3946494' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7045, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:52:37.5352824' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7046, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:56:43.8040645' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7047, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:56:45.9738008' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7048, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:56:54.8743563' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7049, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:56:57.6326877' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7050, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:57:13.6131207' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7051, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:57:15.3206447' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7052, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:58:15.7398113' AS DateTime2), N'访问', N'/admin/', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7053, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:58:16.1080207' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7054, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:58:20.8046015' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7055, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:58:28.6612513' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7056, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:58:39.1466409' AS DateTime2), N'访问', N'/admin/menu/edit/51', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7057, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:58:45.3074222' AS DateTime2), N'访问', N'/admin/menu/edit/51', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7058, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:59:01.9472387' AS DateTime2), N'访问', N'/admin/menu/edit/51', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7059, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:59:11.2024292' AS DateTime2), N'访问', N'/admin/menu/edit/51', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7060, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:59:26.7015109' AS DateTime2), N'访问', N'/admin/menu/edit/50', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7061, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 22:59:40.3510564' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7062, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 23:04:31.6750957' AS DateTime2), N'访问', N'/admin', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7063, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 23:04:34.9921545' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7064, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 23:04:44.8949595' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7065, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 23:04:47.5064170' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (7066, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-13 23:04:50.7895260' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8023, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:20:44.8585753' AS DateTime2), N'访问', N'/admin/', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8024, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:20:45.1084856' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8025, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:20:50.7636112' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8026, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:20:51.5783214' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8027, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:20:58.1892394' AS DateTime2), N'访问', N'/admin/menu', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8028, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:21:03.8056455' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8029, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:21:10.3091437' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8030, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:21:11.8597374' AS DateTime2), N'访问', N'/admin/viewlist/index/2012', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8031, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:21:13.7192328' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8032, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:21:21.2993251' AS DateTime2), N'访问', N'/admin/user/edit/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8033, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:29.7592991' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8034, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:29.7592939' AS DateTime2), N'访问', N'/admin/user', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8035, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:29.7593051' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8036, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:29.7610354' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8037, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:29.7602553' AS DateTime2), N'访问', N'/admin/viewlist/index/2013', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8038, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:30.7787096' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8039, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:30.7778320' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8040, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:37.7795605' AS DateTime2), N'访问', N'/admin/User/Logout', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8041, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:37.7929337' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8042, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:42.4194974' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8043, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:43.3806642' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8044, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:45.8527105' AS DateTime2), N'访问', N'/admin/user', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8045, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:22:46.5247613' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8046, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:35:57.6813344' AS DateTime2), N'访问', N'/admin/menu/edit/50', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8047, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:35:58.0308630' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8048, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:03.3325103' AS DateTime2), N'访问', N'/admin/', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8049, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:03.3838476' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8050, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:08.1478660' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8051, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:09.0670081' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8052, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:17.8344329' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8053, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:35.3820622' AS DateTime2), N'访问', N'/admin/role', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8054, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:36:59.1217539' AS DateTime2), N'访问', N'/admin/role/add', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8055, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:37:05.8160377' AS DateTime2), N'访问', N'/admin/role/edit/1', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8056, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:37:10.4117014' AS DateTime2), N'访问', N'/admin/role/edit/14', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8057, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:38:19.2354166' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8058, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:38:24.9970360' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8059, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:38:25.7316206' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8060, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:38:29.3101065' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8061, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:40:34.1012848' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8062, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:40:43.2367267' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8063, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:40:43.3048225' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8064, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:40:45.1510953' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8065, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:40:51.4890818' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8066, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:41:13.8336152' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8067, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:41:25.5979244' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
GO
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8068, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:41:34.5023075' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8069, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:44:31.6774594' AS DateTime2), N'访问', N'/admin/control/index', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8070, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:44:32.1066996' AS DateTime2), N'访问', N'/admin/User/Login', 0, N'无')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8071, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:44:40.5233563' AS DateTime2), N'访问', N'/admin/control/index', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8072, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:44:41.2588329' AS DateTime2), N'访问', N'/admin/Control/Welcome', 13, N'sa')
INSERT [dbo].[Sys_OperationLog] ([Id], [ClientIP], [ClientMac], [CreateDateTime], [OperationDescription], [OperationUrl], [UserId], [UserName]) VALUES (8073, N'127.0.0.1', N'00-00-00-00-00-00', CAST(N'2019-04-14 16:44:42.7471891' AS DateTime2), N'访问', N'/admin/role/authen', 13, N'sa')
SET IDENTITY_INSERT [dbo].[Sys_OperationLog] OFF
SET IDENTITY_INSERT [dbo].[Sys_Role] ON 

INSERT [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (1, N'最普通的', N'普通用户', CAST(N'2018-08-08 12:22:22.0000000' AS DateTime2), 2)
INSERT [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (2, N'Very Importent Person', N'VIP会员', CAST(N'2018-08-08 12:22:22.0000000' AS DateTime2), 2)
INSERT [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (5, N'管理一切哦', N'管理员', CAST(N'2018-08-08 12:22:22.0000000' AS DateTime2), 1)
INSERT [dbo].[Sys_Role] ([Id], [Description], [Name], [CreateDateTime], [SubSystemId]) VALUES (14, N'最高权限拥有者', N'超级管理员', CAST(N'2018-08-08 12:22:22.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Sys_Role] OFF
SET IDENTITY_INSERT [dbo].[Sys_RoleMenu] ON 

INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2533, CAST(N'2018-03-31 23:02:54.0739799' AS DateTime2), 46, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2534, CAST(N'2018-03-31 23:02:54.0739860' AS DateTime2), 2035, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2535, CAST(N'2018-03-31 23:02:54.0739856' AS DateTime2), 2034, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2536, CAST(N'2018-03-31 23:02:54.0739856' AS DateTime2), 2033, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2537, CAST(N'2018-03-31 23:02:54.0739852' AS DateTime2), 57, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2538, CAST(N'2018-03-31 23:02:54.0739852' AS DateTime2), 21, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2539, CAST(N'2018-03-31 23:02:54.0739852' AS DateTime2), 20, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2540, CAST(N'2018-03-31 23:02:54.0739848' AS DateTime2), 55, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2541, CAST(N'2018-03-31 23:02:54.0739848' AS DateTime2), 2029, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2542, CAST(N'2018-03-31 23:02:54.0739844' AS DateTime2), 2028, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2543, CAST(N'2018-03-31 23:02:54.0739844' AS DateTime2), 1033, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2544, CAST(N'2018-03-31 23:02:54.0739840' AS DateTime2), 1029, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2545, CAST(N'2018-03-31 23:02:54.0739840' AS DateTime2), 1030, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2546, CAST(N'2018-03-31 23:02:54.0739860' AS DateTime2), 2039, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2547, CAST(N'2018-03-31 23:02:54.0739840' AS DateTime2), 1028, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2548, CAST(N'2018-03-31 23:02:54.0739836' AS DateTime2), 53, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2549, CAST(N'2018-03-31 23:02:54.0739832' AS DateTime2), 38, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2550, CAST(N'2018-03-31 23:02:54.0739832' AS DateTime2), 52, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2551, CAST(N'2018-03-31 23:02:54.0739827' AS DateTime2), 36, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2552, CAST(N'2018-03-31 23:02:54.0739827' AS DateTime2), 51, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2553, CAST(N'2018-03-31 23:02:54.0739827' AS DateTime2), 32, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2554, CAST(N'2018-03-31 23:02:54.0739823' AS DateTime2), 50, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2555, CAST(N'2018-03-31 23:02:54.0739823' AS DateTime2), 49, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2556, CAST(N'2018-03-31 23:02:54.0739819' AS DateTime2), 28, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2557, CAST(N'2018-03-31 23:02:54.0739819' AS DateTime2), 48, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2558, CAST(N'2018-03-31 23:02:54.0739815' AS DateTime2), 23, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2559, CAST(N'2018-03-31 23:02:54.0739815' AS DateTime2), 47, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2560, CAST(N'2018-03-31 23:02:54.0739836' AS DateTime2), 1027, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2561, CAST(N'2018-03-31 23:02:54.0739860' AS DateTime2), 2036, 5)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2690, CAST(N'2019-01-15 09:25:19.7994888' AS DateTime2), 2033, 2)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2691, CAST(N'2019-01-15 09:25:19.7994897' AS DateTime2), 2034, 2)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2692, CAST(N'2019-01-15 09:25:19.7994901' AS DateTime2), 2035, 2)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2693, CAST(N'2019-01-15 09:25:19.7994901' AS DateTime2), 2039, 2)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (2694, CAST(N'2019-01-15 09:25:19.7994901' AS DateTime2), 2044, 2)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3703, CAST(N'2019-04-13 16:52:33.5566178' AS DateTime2), 46, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3704, CAST(N'2019-04-13 16:52:33.5566257' AS DateTime2), 1031, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3705, CAST(N'2019-04-13 16:52:33.5566259' AS DateTime2), 1032, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3706, CAST(N'2019-04-13 16:52:33.5566260' AS DateTime2), 1029, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3707, CAST(N'2019-04-13 16:52:33.5566263' AS DateTime2), 1033, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3708, CAST(N'2019-04-13 16:52:33.5566264' AS DateTime2), 1034, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3709, CAST(N'2019-04-13 16:52:33.5566266' AS DateTime2), 1035, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3710, CAST(N'2019-04-13 16:52:33.5566268' AS DateTime2), 2032, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3711, CAST(N'2019-04-13 16:52:33.5566270' AS DateTime2), 2028, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3712, CAST(N'2019-04-13 16:52:33.5566272' AS DateTime2), 2029, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3713, CAST(N'2019-04-13 16:52:33.5566274' AS DateTime2), 2030, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3714, CAST(N'2019-04-13 16:52:33.5566276' AS DateTime2), 2031, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3715, CAST(N'2019-04-13 16:52:33.5566278' AS DateTime2), 2049, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3716, CAST(N'2019-04-13 16:52:33.5566255' AS DateTime2), 1030, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3717, CAST(N'2019-04-13 16:52:33.5566280' AS DateTime2), 2050, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3718, CAST(N'2019-04-13 16:52:33.5566284' AS DateTime2), 20, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3719, CAST(N'2019-04-13 16:52:33.5566286' AS DateTime2), 21, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3720, CAST(N'2019-04-13 16:52:33.5566288' AS DateTime2), 57, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3721, CAST(N'2019-04-13 16:52:33.5566290' AS DateTime2), 2033, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3722, CAST(N'2019-04-13 16:52:33.5566292' AS DateTime2), 2034, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3723, CAST(N'2019-04-13 16:52:33.5566294' AS DateTime2), 2035, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3724, CAST(N'2019-04-13 16:52:33.5566296' AS DateTime2), 2039, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3725, CAST(N'2019-04-13 16:52:33.5566298' AS DateTime2), 2036, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3726, CAST(N'2019-04-13 16:52:33.5566299' AS DateTime2), 2037, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3727, CAST(N'2019-04-13 16:52:33.5566301' AS DateTime2), 2038, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3728, CAST(N'2019-04-13 16:52:33.5566303' AS DateTime2), 2041, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3729, CAST(N'2019-04-13 16:52:33.5566305' AS DateTime2), 2042, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3730, CAST(N'2019-04-13 16:52:33.5566282' AS DateTime2), 55, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3731, CAST(N'2019-04-13 16:52:33.5566307' AS DateTime2), 2043, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3732, CAST(N'2019-04-13 16:52:33.5566253' AS DateTime2), 1028, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3733, CAST(N'2019-04-13 16:52:33.5566249' AS DateTime2), 54, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3734, CAST(N'2019-04-13 16:52:33.5566198' AS DateTime2), 47, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3735, CAST(N'2019-04-13 16:52:33.5566200' AS DateTime2), 23, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3736, CAST(N'2019-04-13 16:52:33.5566203' AS DateTime2), 25, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3737, CAST(N'2019-04-13 16:52:33.5566205' AS DateTime2), 26, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3738, CAST(N'2019-04-13 16:52:33.5566206' AS DateTime2), 48, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3739, CAST(N'2019-04-13 16:52:33.5566208' AS DateTime2), 28, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3740, CAST(N'2019-04-13 16:52:33.5566210' AS DateTime2), 29, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3741, CAST(N'2019-04-13 16:52:33.5566212' AS DateTime2), 30, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3742, CAST(N'2019-04-13 16:52:33.5566214' AS DateTime2), 49, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3743, CAST(N'2019-04-13 16:52:33.5566216' AS DateTime2), 31, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3744, CAST(N'2019-04-13 16:52:33.5566218' AS DateTime2), 50, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3745, CAST(N'2019-04-13 16:52:33.5566220' AS DateTime2), 32, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3746, CAST(N'2019-04-13 16:52:33.5566251' AS DateTime2), 1027, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3747, CAST(N'2019-04-13 16:52:33.5566222' AS DateTime2), 33, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3748, CAST(N'2019-04-13 16:52:33.5566226' AS DateTime2), 35, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3749, CAST(N'2019-04-13 16:52:33.5566228' AS DateTime2), 51, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3750, CAST(N'2019-04-13 16:52:33.5566230' AS DateTime2), 36, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3751, CAST(N'2019-04-13 16:52:33.5566232' AS DateTime2), 42, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3752, CAST(N'2019-04-13 16:52:33.5566234' AS DateTime2), 52, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3753, CAST(N'2019-04-13 16:52:33.5566236' AS DateTime2), 38, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3754, CAST(N'2019-04-13 16:52:33.5566238' AS DateTime2), 39, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3755, CAST(N'2019-04-13 16:52:33.5566239' AS DateTime2), 40, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3756, CAST(N'2019-04-13 16:52:33.5566241' AS DateTime2), 53, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3757, CAST(N'2019-04-13 16:52:33.5566243' AS DateTime2), 41, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3758, CAST(N'2019-04-13 16:52:33.5566245' AS DateTime2), 43, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3759, CAST(N'2019-04-13 16:52:33.5566247' AS DateTime2), 44, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3760, CAST(N'2019-04-13 16:52:33.5566224' AS DateTime2), 34, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3761, CAST(N'2019-04-13 16:52:33.5566309' AS DateTime2), 2044, 14)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3762, CAST(N'2019-04-13 23:05:15.6833992' AS DateTime2), 46, 1)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3763, CAST(N'2019-04-13 23:05:15.6834015' AS DateTime2), 47, 1)
INSERT [dbo].[Sys_RoleMenu] ([Id], [CreateDateTime], [MenuId], [RoleId]) VALUES (3764, CAST(N'2019-04-13 23:05:15.6834017' AS DateTime2), 26, 1)
SET IDENTITY_INSERT [dbo].[Sys_RoleMenu] OFF
SET IDENTITY_INSERT [dbo].[Sys_SubSystem] ON 

INSERT [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (1, 1, CAST(N'2019-04-13 17:08:10.0000000' AS DateTime2), N'', N'系统管理', 1, NULL, 0)
INSERT [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (2, 1, CAST(N'2019-04-13 17:08:10.0000000' AS DateTime2), N'', N'日常管理', 1, NULL, 0)
INSERT [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (3, 1, CAST(N'2019-04-13 17:08:10.0000000' AS DateTime2), N'', N'客户管理', 1, NULL, 0)
INSERT [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (1002, 2, CAST(N'2019-04-13 17:08:10.0000000' AS DateTime2), N'', N'涛涛涛涛', 1, NULL, 0)
INSERT [dbo].[Sys_SubSystem] ([Id], [TypeId], [CreateDateTime], [Description], [Name], [ListOrder], [Icon], [IsHide]) VALUES (1003, 3, CAST(N'2019-04-13 17:08:10.0000000' AS DateTime2), N'', N'风风风风', 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Sys_SubSystem] OFF
SET IDENTITY_INSERT [dbo].[Sys_SubSystemType] ON 

INSERT [dbo].[Sys_SubSystemType] ([Id], [CreateDateTime], [Description], [Name]) VALUES (1, CAST(N'2019-04-13 16:59:09.0000000' AS DateTime2), N'', N'系统管理')
INSERT [dbo].[Sys_SubSystemType] ([Id], [CreateDateTime], [Description], [Name]) VALUES (2, CAST(N'2019-04-13 16:59:09.0000000' AS DateTime2), N'', N'日常管理')
INSERT [dbo].[Sys_SubSystemType] ([Id], [CreateDateTime], [Description], [Name]) VALUES (3, CAST(N'2019-04-13 16:59:09.0000000' AS DateTime2), N'', N'客户管理')
SET IDENTITY_INSERT [dbo].[Sys_SubSystemType] OFF
SET IDENTITY_INSERT [dbo].[Sys_SystemOption] ON 

INSERT [dbo].[Sys_SystemOption] ([Code], [CreateDateTime], [Id], [Value]) VALUES (N'testCode', CAST(N'2018-03-20 22:43:08.4039973' AS DateTime2), 1, N'testValue s')
INSERT [dbo].[Sys_SystemOption] ([Code], [CreateDateTime], [Id], [Value]) VALUES (N'testCoded', CAST(N'2018-03-20 22:47:42.3060094' AS DateTime2), 4, N'asd')
SET IDENTITY_INSERT [dbo].[Sys_SystemOption] OFF
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] ON 

INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (45, 0, CAST(N'2018-03-26 22:34:42.8216115' AS DateTime2), N'3', N'Id', 0, 0, NULL, 0, 0, 0, 1, 4, N'Id', NULL, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (46, 0, CAST(N'2018-04-25 20:57:47.8253840' AS DateTime2), N'6', N'创建时间', 0, 0, NULL, 1, 0, 0, 1, 8, N'CreateDateTime', NULL, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (47, 1, CAST(N'2018-03-26 22:35:20.6118143' AS DateTime2), N'0', N'说明', 0, 1, NULL, 1, 1, 0, 1, 8000, N'Description', NULL, 0, 0, 1, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (48, 1, CAST(N'2018-03-26 22:35:29.7387448' AS DateTime2), N'0', N'负责人', 0, 1, NULL, 1, 1, 0, 1, 8000, N'Leader', NULL, 0, 0, 1, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (49, 1, CAST(N'2018-03-26 22:35:45.3368724' AS DateTime2), N'0', N'部门名称', 0, 1, NULL, 1, 1, 0, 1, 8000, N'Name', NULL, 0, 0, 1, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (50, 1, CAST(N'2018-05-05 21:45:30.3439584' AS DateTime2), N'5', N'上级部门', 0, 1, NULL, 1, 1, 0, 1, 4, N'ParentId', N'Id,Name|Sys_Department|ParentId=0', 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (59, 0, CAST(N'2018-04-24 21:53:50.4923920' AS DateTime2), N'3', N' id', 0, 0, NULL, 0, 1, 0, 1, 4, N'Id', NULL, 0, 0, 0, 1009, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (60, 1, CAST(N'2019-01-06 21:35:15.0091930' AS DateTime2), N'0', N'客户端IP', 0, 1, NULL, 1, 1, 0, 1, 8000, N'ClientIP', NULL, 0, 0, 0, 1009, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (61, 1, CAST(N'2018-04-22 23:08:28.1379545' AS DateTime2), N'0', N'客户端MAC地址', 0, 1, NULL, 1, 1, 0, 1, 8000, N'ClientMac', NULL, 0, 0, 0, 1009, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (62, 1, CAST(N'2018-04-22 23:08:39.8528457' AS DateTime2), N'6', N'登陆日期', 0, 1, NULL, 1, 1, 0, 1, 8, N'CreateDateTime', NULL, 0, 0, 0, 1009, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (63, 1, CAST(N'2018-04-22 23:08:51.8393514' AS DateTime2), N'3', N'用户Id', 0, 1, NULL, 1, 1, 0, 1, 4, N'UserId', NULL, 0, 0, 0, 1009, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (64, 1, CAST(N'2018-04-22 23:09:02.1984798' AS DateTime2), N'0', N'登陆人', 0, 1, NULL, 1, 1, 0, 1, 8000, N'UserName', NULL, 0, 0, 0, 1009, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (65, 1, CAST(N'2018-04-22 23:09:11.1207025' AS DateTime2), N'0', N'说明', 0, 1, NULL, 1, 1, 0, 1, 8000, N'Description', NULL, 0, 0, 0, 1009, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (77, 0, CAST(N'2019-01-17 14:03:05.9204546' AS DateTime2), N'Int', N'e', 0, 0, NULL, 0, 0, 0, 1, 4, N'Id', NULL, 1, 1, 0, 1011, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (78, 1, CAST(N'2019-01-13 22:56:15.8821514' AS DateTime2), N'Datetime', NULL, 0, 1, NULL, 0, 0, 0, 1, 8, N'CreateDateTime', NULL, 0, 1, 0, 1011, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (79, 1, CAST(N'2019-01-16 10:43:37.8837801' AS DateTime2), N'String', N'姓名', 0, 1, NULL, 0, 0, 0, 1, 8000, N'Name', NULL, 0, 1, 0, 1011, 0, 0, NULL, NULL, N'cnLetterNumber=''true''', NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (80, 1, CAST(N'2019-01-17 14:02:55.8035899' AS DateTime2), N'Int', N'上级', 0, 1, NULL, 0, 0, 0, 1, 4, N'ParentId', NULL, 0, 1, 0, 1011, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (81, 1, CAST(N'2019-04-13 22:14:07.1155472' AS DateTime2), N'CheckBox', N'多选', 0, 1, NULL, 0, 0, 0, 1, 8000, N'Test', NULL, 0, 1, 0, 1011, 0, 0, N'阿,吧,从', NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (82, 1, CAST(N'2019-01-14 22:42:20.5993233' AS DateTime2), N'File', N'3233', 0, 1, NULL, 0, 0, 0, 1, 8000, N'Test1', NULL, 0, 1, 0, 1011, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (83, 1, CAST(N'2019-01-17 13:55:59.8641524' AS DateTime2), N'Custom', N'custom', 0, 1, NULL, 0, 0, 0, 1, 8000, N'Test2', NULL, 0, 1, 0, 1011, 0, 0, N'汉族,回族,哈哈', NULL, NULL, N'<button type="button" onclick="alert(''{UserId}'',''{Id}'')">test</button>')
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1077, 0, CAST(N'2019-04-13 16:47:32.2504490' AS DateTime2), N'Int', NULL, 0, 0, NULL, 0, 0, 0, 1, 4, N'Id', NULL, 0, 0, 0, 2013, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1078, 0, CAST(N'2019-04-13 16:47:32.2508416' AS DateTime2), N'Datetime', NULL, 0, 0, NULL, 0, 0, 0, 0, 8, N'CreateDateTime', NULL, 0, 0, 0, 2013, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1079, 1, CAST(N'2019-04-13 16:59:58.1491245' AS DateTime2), N'String', N'说明', 2, 1, NULL, 0, 0, 2, 1, 8000, N'Description', NULL, 0, 0, 0, 2013, 2, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1080, 1, CAST(N'2019-04-13 17:00:15.0911430' AS DateTime2), N'String', N'名称', 1, 1, NULL, 0, 0, 1, 1, 8000, N'Name', NULL, 0, 0, 0, 2013, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1081, 0, CAST(N'2019-04-13 16:47:36.4151291' AS DateTime2), N'Int', NULL, 0, 0, NULL, 0, 0, 0, 1, 4, N'Id', NULL, 0, 0, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1082, 1, CAST(N'2019-04-13 17:21:32.0950307' AS DateTime2), N'Out', N'分类', 0, 1, NULL, 0, 0, 0, 1, 4, N'TypeId', N'Id,Name|Sys_SubSystemType|id>0', 0, 1, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1083, 0, CAST(N'2019-04-13 16:47:36.4151354' AS DateTime2), N'Datetime', NULL, 0, 0, NULL, 0, 0, 0, 0, 8, N'CreateDateTime', NULL, 0, 0, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1084, 1, CAST(N'2019-04-13 17:08:37.1606008' AS DateTime2), N'String', N'说明', 2, 1, NULL, 0, 0, 2, 1, 8000, N'Description', NULL, 0, 0, 0, 2012, 2, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1085, 1, CAST(N'2019-04-13 17:29:08.7656978' AS DateTime2), N'String', N'子系统名称', 0, 1, NULL, 0, 0, 0, 1, 8000, N'Name', NULL, 0, 1, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1086, 1, CAST(N'2019-04-13 17:26:01.8395188' AS DateTime2), N'Int', N'显示顺序', 0, 1, NULL, 0, 0, 0, 1, 10, N'ListOrder', NULL, 0, 0, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1087, 1, CAST(N'2019-04-13 17:27:37.8590723' AS DateTime2), N'String', N'图标', 0, 1, NULL, 0, 0, 0, 0, 200, N'Icon', NULL, 0, 10, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_TableColumn] ([Id], [AddVisible], [CreateDateTime], [DataType], [Description], [EditOrder], [EditVisible], [EnumRange], [ExportVisible], [ImportVisible], [ListOrder], [ListVisible], [MaxLength], [Name], [OutSql], [PrimaryKey], [Required], [SearchVisible], [TableId], [ViewOrder], [ViewVisible], [SelectRange], [ForbiddenFileExtension], [ValidationRule], [CustomContent]) VALUES (1088, 1, CAST(N'2019-04-13 17:29:57.4970330' AS DateTime2), N'Int', N'是否隐藏', 0, 1, NULL, 0, 0, 0, 1, 10, N'IsHide', NULL, 0, 0, 0, 2012, 0, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] OFF
SET IDENTITY_INSERT [dbo].[Sys_TableList] ON 

INSERT [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [JavaScript]) VALUES (2, CAST(N'2018-04-12 20:52:20.1272314' AS DateTime2), N'Id > 0', N'Id desc', N'Sys_Department', N'说明哦', N'<button type="button" onclick="alert(''id:{Id}userid:{UserId}'')">test</button>', N'UserName != admin', N'ItemID < 0', N'Id < 0', 0, 0, N'Sys_Department', 1, 1, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [JavaScript]) VALUES (1009, CAST(N'2019-01-04 17:24:37.5605807' AS DateTime2), N'Id != 0', N'Id desc', N'Sys_LoginLog', N'登录日志', N'test', N'UserName != admin', N'Id < 0', N'Id > 100', 0, 0, N'Sys_LoginLog', 0, 0, 0, 0, 1, 0, 0, N'<button type="button" class="btn btn-warning">清除</button>', 0, NULL, NULL)
INSERT [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [JavaScript]) VALUES (1011, CAST(N'2019-01-14 22:07:36.1389249' AS DateTime2), NULL, NULL, N'Test_Leader', N'测试领导管理', NULL, NULL, NULL, NULL, 1, 0, N'Test_Leader', 1, 1, 1, 1, 1, 1, 0, NULL, 2, N'300px,300', N'console.log(''hha'')')
INSERT [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [JavaScript]) VALUES (2012, CAST(N'2019-04-13 16:46:29.8435282' AS DateTime2), NULL, NULL, N'Sys_SubSystem', N'子系统管理', NULL, NULL, NULL, NULL, 0, 0, N'Sys_SubSystem', 1, 1, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL)
INSERT [dbo].[Sys_TableList] ([Id], [CreateDateTime], [DefaultFilter], [DefaultSort], [DeleteTableName], [Description], [ExtendFunction], [ForbiddenAddFilter], [ForbiddenDeleteFilter], [ForbiddenUpdateFilter], [ImportType], [IsView], [Name], [AllowDelete], [AllowEdit], [AllowExport], [AllowImport], [AllowView], [AllowAdd], [AllowDetail], [TopExtendFunction], [ColumnPerRow], [ViewEditWidthHeight], [JavaScript]) VALUES (2013, CAST(N'2019-04-13 16:47:21.2548515' AS DateTime2), NULL, NULL, N'Sys_SubSystemType', N'子系统类型', NULL, NULL, NULL, NULL, 0, 0, N'Sys_SubSystemType', 1, 1, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sys_TableList] OFF
SET IDENTITY_INSERT [dbo].[Sys_User] ON 

INSERT [dbo].[Sys_User] ([Id], [AccessFailedCount], [Email], [Password], [PhoneNumber], [RealName], [Status], [UserName], [CreateDateTime]) VALUES (1, 0, N'admin@admin.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, N'管理员呢', 2, N'admin', CAST(N'2018-02-02 12:33:33.0000000' AS DateTime2))
INSERT [dbo].[Sys_User] ([Id], [AccessFailedCount], [Email], [Password], [PhoneNumber], [RealName], [Status], [UserName], [CreateDateTime]) VALUES (13, 0, N'sa@sa.com', N'7dd4794fdc355f2b89224670267a9758', NULL, N'超级管理员', 2, N'sa', CAST(N'2018-02-02 12:33:33.0000000' AS DateTime2))
INSERT [dbo].[Sys_User] ([Id], [AccessFailedCount], [Email], [Password], [PhoneNumber], [RealName], [Status], [UserName], [CreateDateTime]) VALUES (14, NULL, N'asd@123.com', N'a8f5f167f44f4964e6c998dee827110c', NULL, N'asdas', 1, N'asdasd', CAST(N'2019-04-12 20:59:10.8487724' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Sys_User] OFF
SET IDENTITY_INSERT [dbo].[Sys_UserDepartment] ON 

INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (2, CAST(N'2018-02-05 20:27:10.2430634' AS DateTime2), 7, 1)
INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (5, CAST(N'2018-03-05 22:28:35.0229550' AS DateTime2), 5, 1)
INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (1005, CAST(N'2019-01-11 09:09:51.9542849' AS DateTime2), 7, 13)
INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (1006, CAST(N'2019-01-11 09:18:51.1068371' AS DateTime2), 6, 13)
INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (1007, CAST(N'2019-01-11 09:18:51.1068387' AS DateTime2), 6, 1)
INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (1008, CAST(N'2019-01-11 09:33:18.5516729' AS DateTime2), 13, 13)
INSERT [dbo].[Sys_UserDepartment] ([Id], [CreateDateTime], [DepartmentId], [UserId]) VALUES (1009, CAST(N'2019-01-11 09:33:18.5516746' AS DateTime2), 13, 1)
SET IDENTITY_INSERT [dbo].[Sys_UserDepartment] OFF
SET IDENTITY_INSERT [dbo].[Sys_UserRole] ON 

INSERT [dbo].[Sys_UserRole] ([UserId], [RoleId], [Id], [CreateDateTime]) VALUES (1, 5, 1, CAST(N'2018-08-08 12:22:22.0000000' AS DateTime2))
INSERT [dbo].[Sys_UserRole] ([UserId], [RoleId], [Id], [CreateDateTime]) VALUES (13, 14, 2, CAST(N'2018-08-08 12:22:22.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Sys_UserRole] OFF
SET IDENTITY_INSERT [dbo].[Test_Leader] ON 

INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (4, CAST(N'2019-01-08 20:59:53.0000000' AS DateTime2), N'ddddd', 4, N'吧,从', N'汉族', N'2019-01-03')
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (5, CAST(N'2019-01-08 21:03:22.0000000' AS DateTime2), N'撒旦', 4, N'回族,汉族', N'2019-01-12 21:03', N'2019-01-01')
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (1015, CAST(N'2019-01-13 21:23:50.0000000' AS DateTime2), N'bbbcD', 5, N'回族', N'6', N'/Upload/2019/0113/Debian_Python3.6_20190113094406.sh')
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (1016, CAST(N'2019-01-13 21:23:50.0000000' AS DateTime2), N'bbbc', 5, N'回族,汉族', NULL, NULL)
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (1017, CAST(N'2019-01-13 22:08:09.0000000' AS DateTime2), N'阿斯顿', 1, N'汉族,哈哈', N'的身份', N'/Upload/2019/0113/Debian_Python3.6_20190113100808.sh')
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (2006, CAST(N'2019-01-16 10:14:36.0000000' AS DateTime2), N'w', 0, N'', N'', N'')
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (2007, CAST(N'2019-01-17 14:03:45.0000000' AS DateTime2), N'S试试', 2, N'试试', N'/Upload/2019/0117/b703e6910f60f56f6db2b128f8fced21_20190117020339.jpg', N'啊')
INSERT [dbo].[Test_Leader] ([Id], [CreateDateTime], [Name], [ParentId], [Test], [Test1], [Test2]) VALUES (2008, CAST(N'2019-01-17 14:05:23.0000000' AS DateTime2), N'22', 2, N'2', N'/Upload/2019/0117/b703e6910f60f56f6db2b128f8fced21_20190117020519.jpg', N'2')
SET IDENTITY_INSERT [dbo].[Test_Leader] OFF
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] ON 

INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (1, N'stats:deleted', 3, NULL)
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] OFF
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (4, 13, N'Enqueued', N'{"Type":"System.Console, System.Console, Version=4.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Fire-and-forget!\\\"\"]"}', N'["\"Fire-and-forget!\""]', CAST(N'2018-03-11 09:26:00.957' AS DateTime), NULL)
SET IDENTITY_INSERT [HangFire].[Job] OFF
SET IDENTITY_INSERT [HangFire].[JobParameter] ON 

INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (7, 4, N'CurrentCulture', N'"zh-CN"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (8, 4, N'CurrentUICulture', N'"zh-CN"')
SET IDENTITY_INSERT [HangFire].[JobParameter] OFF
SET IDENTITY_INSERT [HangFire].[JobQueue] ON 

INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (1, 1, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (2, 1, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (3, 1, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (4, 1, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (5, 2, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (6, 3, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (7, 3, N'default', NULL)
INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (8, 4, N'default', NULL)
SET IDENTITY_INSERT [HangFire].[JobQueue] OFF
INSERT [HangFire].[Schema] ([Version]) VALUES (5)
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'lkjob:63455f80-dae5-461c-b53f-9e0106a170e0', N'{"WorkerCount":40,"Queues":["Job"],"StartedAt":"2019-04-14T08:38:07.8393252Z"}', CAST(N'2019-04-14 08:42:08.170' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'lkjob:789c89cb-ec24-46eb-b40e-4e782604cebf', N'{"WorkerCount":40,"Queues":["Job"],"StartedAt":"2019-04-14T08:44:28.863781Z"}', CAST(N'2019-04-14 08:48:59.243' AS DateTime))
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 4, N'Enqueued', NULL, CAST(N'2018-03-11 09:26:00.983' AS DateTime), N'{"EnqueuedAt":"2018-03-11T09:26:00.9319467Z","Queue":"default"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
/****** Object:  Index [IX_Sys_RoleMenu_RoleId]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_RoleMenu_RoleId] ON [dbo].[Sys_RoleMenu]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_TableColumn_TableId]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_TableColumn_TableId] ON [dbo].[Sys_TableColumn]
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_UserDepartment_DepartmentId]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_UserDepartment_DepartmentId] ON [dbo].[Sys_UserDepartment]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_UserDepartment_UserId]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_UserDepartment_UserId] ON [dbo].[Sys_UserDepartment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_UserRole_RoleId]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_UserRole_RoleId] ON [dbo].[Sys_UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_CounterAggregated_Key]    Script Date: 2019/4/14 16:49:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_CounterAggregated_Key] ON [HangFire].[AggregatedCounter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Counter_Key]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Counter_Key] ON [HangFire].[Counter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Hash_Key]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_Key] ON [HangFire].[Hash]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Hash_Key_Field]    Script Date: 2019/4/14 16:49:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Hash_Key_Field] ON [HangFire].[Hash]
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobParameter_JobIdAndName]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobParameter_JobIdAndName] ON [HangFire].[JobParameter]
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobQueue_QueueAndFetchedAt]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobQueue_QueueAndFetchedAt] ON [HangFire].[JobQueue]
(
	[Queue] ASC,
	[FetchedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_List_Key]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_Key] ON [HangFire].[List]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Set_Key]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Key] ON [HangFire].[Set]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Set_KeyAndValue]    Script Date: 2019/4/14 16:49:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Set_KeyAndValue] ON [HangFire].[Set]
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_JobId]    Script Date: 2019/4/14 16:49:28 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_JobId] ON [HangFire].[State]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 7
               Left = 317
               Bottom = 170
               Right = 499
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 7
               Left = 547
               Bottom = 170
               Right = 719
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TableInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_TableInfo'
GO
USE [master]
GO
ALTER DATABASE [lkWeb] SET  READ_WRITE 
GO
