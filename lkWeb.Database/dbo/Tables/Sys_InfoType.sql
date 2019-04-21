CREATE TABLE [dbo].[Sys_InfoType] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (50)  NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Sys_InfoType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

