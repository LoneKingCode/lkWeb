CREATE TABLE [dbo].[Sys_SubSystem] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [TypeId]         INT           NOT NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [Description]    VARCHAR (30)  NOT NULL,
    [Name]           VARCHAR (18)  NOT NULL,
    [ListOrder]      INT           NULL,
    [Icon]           VARCHAR (100) NULL,
    [IsHide]         TINYINT       NULL,
    CONSTRAINT [PK_Sys_SubSystem] PRIMARY KEY CLUSTERED ([Id] ASC)
);

