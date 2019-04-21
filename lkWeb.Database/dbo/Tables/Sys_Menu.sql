CREATE TABLE [dbo].[Sys_Menu] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [Name]           VARCHAR (18)  NOT NULL,
    [ListOrder]      INT           NOT NULL,
    [ParentId]       INT           NOT NULL,
    [Type]           TINYINT       NOT NULL,
    [Url]            VARCHAR (300) NOT NULL,
    [SubSystemId]    VARCHAR (50)  CONSTRAINT [DF__Sys_Menu__Module__34C8D9D1] DEFAULT ((0)) NULL,
    [Icon]           VARCHAR (50)  CONSTRAINT [DF__Sys_Menu__Icon__37A5467C] DEFAULT (N'') NOT NULL,
    CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED ([Id] ASC)
);

