CREATE TABLE [dbo].[Sys_SubSystemType] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [Description]    VARCHAR (30)  NOT NULL,
    [Name]           VARCHAR (18)  NOT NULL,
    CONSTRAINT [PK_Sys_SubSystemType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

