CREATE TABLE [dbo].[Sys_SystemOption] (
    [Code]           VARCHAR (100)  NULL,
    [CreateDateTime] DATETIME2 (7)  NOT NULL,
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Value]          VARCHAR (1000) NOT NULL,
    CONSTRAINT [PK_Sys_SystemOption] PRIMARY KEY CLUSTERED ([Id] ASC)
);

