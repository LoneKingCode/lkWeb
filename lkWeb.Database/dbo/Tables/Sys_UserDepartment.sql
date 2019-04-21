CREATE TABLE [dbo].[Sys_UserDepartment] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreateDateTime] DATETIME2 (7) NOT NULL,
    [DepartmentId]   INT           NOT NULL,
    [UserId]         INT           NOT NULL,
    CONSTRAINT [PK_Sys_UserDepartment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Sys_UserDepartment_DepartmentId]
    ON [dbo].[Sys_UserDepartment]([DepartmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Sys_UserDepartment_UserId]
    ON [dbo].[Sys_UserDepartment]([UserId] ASC);

