CREATE TABLE [dbo].[Test_Leader] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7)  NOT NULL,
    [Name]           NVARCHAR (MAX) NULL,
    [ParentId]       INT            NOT NULL,
    [Test]           NVARCHAR (MAX) NULL,
    [Test1]          NVARCHAR (MAX) NULL,
    [Test2]          NVARCHAR (MAX) NULL,
    [TestSync]       VARCHAR (50)   NULL,
    CONSTRAINT [PK_Test_Leader] PRIMARY KEY CLUSTERED ([Id] ASC)
);

