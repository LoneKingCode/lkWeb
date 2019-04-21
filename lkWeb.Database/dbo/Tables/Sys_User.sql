CREATE TABLE [dbo].[Sys_User] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [AccessFailedCount] INT            NULL,
    [Email]             NVARCHAR (256) NULL,
    [Password]          NVARCHAR (MAX) NOT NULL,
    [PhoneNumber]       NVARCHAR (MAX) NULL,
    [RealName]          NVARCHAR (MAX) NULL,
    [Status]            TINYINT        NOT NULL,
    [UserName]          NVARCHAR (256) NOT NULL,
    [CreateDateTime]    DATETIME2 (7)  NULL,
    CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED ([Id] ASC)
);

