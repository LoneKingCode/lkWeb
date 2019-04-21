CREATE TABLE [dbo].[Sys_LoginLog] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [ClientIP]       VARCHAR (15)  NULL,
    [ClientMac]      VARCHAR (40)  NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [UserId]         INT           NOT NULL,
    [UserName]       VARCHAR (20)  NOT NULL,
    [Description]    VARCHAR (40)  NULL,
    CONSTRAINT [PK_Sys_LoginLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);

