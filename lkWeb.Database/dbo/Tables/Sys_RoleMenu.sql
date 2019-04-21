CREATE TABLE [dbo].[Sys_RoleMenu] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [MenuId]         INT           NOT NULL,
    [RoleId]         INT           NOT NULL,
    CONSTRAINT [PK_Sys_RoleMenu] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Sys_RoleMenu_RoleId]
    ON [dbo].[Sys_RoleMenu]([RoleId] ASC);

