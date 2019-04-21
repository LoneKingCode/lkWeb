CREATE TABLE [dbo].[Sys_UserRole] (
    [UserId]         INT           NOT NULL,
    [RoleId]         INT           NOT NULL,
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7) NULL,
    CONSTRAINT [PK_Sys_UserRole] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Sys_UserRole_RoleId]
    ON [dbo].[Sys_UserRole]([RoleId] ASC);

