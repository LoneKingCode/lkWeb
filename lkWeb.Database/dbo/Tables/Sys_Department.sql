CREATE TABLE [dbo].[Sys_Department] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [Description]    VARCHAR (100) NOT NULL,
    [Leader]         VARCHAR (20)  NOT NULL,
    [Name]           VARCHAR (20)  NOT NULL,
    [ParentId]       INT           NOT NULL,
    CONSTRAINT [PK_Sys_Department] PRIMARY KEY CLUSTERED ([Id] ASC)
);

