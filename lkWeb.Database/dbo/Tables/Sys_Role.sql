CREATE TABLE [dbo].[Sys_Role] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (30)   NOT NULL,
    [Name]           NVARCHAR (256) NULL,
    [CreateDateTime] DATETIME2 (7)  NULL,
    [SubSystemId]    INT            NULL,
    CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED ([Id] ASC)
);

