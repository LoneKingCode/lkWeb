CREATE TABLE [dbo].[Sys_ValueList] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (100)  NULL,
    [CreateDateTime] DATETIME2 (7)  NULL,
    [Value]          VARCHAR (1000) NOT NULL,
    [ParentId]       INT            NULL,
    [Name]           VARCHAR (50)   NOT NULL,
    [Description]    VARCHAR (100)  NULL,
    [ListOrder]      INT            NULL,
    CONSTRAINT [PK_Sys_ValueList] PRIMARY KEY CLUSTERED ([Id] ASC)
);

