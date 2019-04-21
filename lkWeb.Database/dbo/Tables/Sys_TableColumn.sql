CREATE TABLE [dbo].[Sys_TableColumn] (
    [Id]                     INT            IDENTITY (1, 1) NOT NULL,
    [AddVisible]             TINYINT        NOT NULL,
    [CreateDateTime]         DATETIME2 (7)  NOT NULL,
    [DataType]               NVARCHAR (MAX) NULL,
    [Description]            NVARCHAR (MAX) NULL,
    [EditOrder]              INT            NOT NULL,
    [EditVisible]            TINYINT        NOT NULL,
    [EnumRange]              NVARCHAR (MAX) NULL,
    [ExportVisible]          TINYINT        NOT NULL,
    [ImportVisible]          TINYINT        NOT NULL,
    [ListOrder]              INT            NOT NULL,
    [ListVisible]            TINYINT        NOT NULL,
    [MaxLength]              INT            NOT NULL,
    [Name]                   NVARCHAR (MAX) NULL,
    [OutSql]                 NVARCHAR (MAX) NULL,
    [PrimaryKey]             TINYINT        NOT NULL,
    [Required]               TINYINT        NOT NULL,
    [SearchVisible]          TINYINT        NOT NULL,
    [TableId]                INT            NOT NULL,
    [ViewOrder]              INT            NOT NULL,
    [ViewVisible]            TINYINT        NOT NULL,
    [SelectRange]            NVARCHAR (MAX) NULL,
    [ForbiddenFileExtension] NVARCHAR (MAX) NULL,
    [ValidationRule]         NVARCHAR (MAX) NULL,
    [CustomContent]          NVARCHAR (MAX) NULL,
    [ColumnWidth]            VARCHAR (50)   NULL,
    CONSTRAINT [PK_Sys_TableColumn] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Sys_TableColumn_TableId]
    ON [dbo].[Sys_TableColumn]([TableId] ASC);

