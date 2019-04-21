CREATE TABLE [dbo].[Sys_InfoRelease] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [TypeId]         INT           NULL,
    [Title]          VARCHAR (100) NULL,
    [InfoContent]    VARCHAR (MAX) NULL,
    [Creator]        INT           NULL,
    [CreateDateTime] DATETIME2 (7) NULL,
    [ViewTime]       INT           CONSTRAINT [DF_Sys_InfoRelease_ViewTime] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Sys_InfoRelease] PRIMARY KEY CLUSTERED ([Id] ASC)
);

