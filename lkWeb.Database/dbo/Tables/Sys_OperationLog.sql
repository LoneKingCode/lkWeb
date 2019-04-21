CREATE TABLE [dbo].[Sys_OperationLog] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [ClientIP]             VARCHAR (15)   NOT NULL,
    [ClientMac]            VARCHAR (40)   NOT NULL,
    [CreateDateTime]       DATETIME2 (7)  NOT NULL,
    [OperationDescription] VARCHAR (100)  NOT NULL,
    [OperationUrl]         VARCHAR (300)  NULL,
    [UserId]               INT            NOT NULL,
    [UserName]             NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Sys_OperationLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);

