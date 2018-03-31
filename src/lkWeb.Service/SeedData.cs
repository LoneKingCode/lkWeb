using lkWeb.Data;
using lkWeb.Entity;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace lkWeb.Service
{
    /// <summary>
    /// 数据库初始化数据
    /// </summary>
    public static class SeedData
    {
        public static void Initialize(IServiceProvider app)
        {
            var db = app.GetRequiredService<lkWebContext>();
            //如果已经有数据就直接返回
            if (db.Users.Any() && db.Menus.Any())
            {
                return;
            }
            var userService = app.GetService<IUserService>();
            var roleService = app.GetService<IRoleService>();

            //用户
            List<UserDto> userList = new List<UserDto>();

            //角色菜单
            List<RoleMenuEntity> roleMenuList = new List<RoleMenuEntity>();

            #region 模块
            List<ModuleEntity> moduleList = new List<ModuleEntity>();
            moduleList.Add(new ModuleEntity
            {
                Name = "系统设置",
                Description = "管理系统后台数据"
            }); // id:1
            db.AddRange(moduleList);
            #endregion

            #region 菜单
            List<MenuEntity> menuList = new List<MenuEntity>();

            var sysMenu = new MenuEntity
            {
                ModuleId = 1,
                Name = "系统设置",
                Icon = "fa fa-cog",
                ListOrder = 1,
                ParentId = 0,
                Type = (byte)MenuType.模块,
                Url = "#"
            }; // id:1
            var logMenu = new MenuEntity
            {
                ModuleId = 1,
                Name = "系统日志",
                Icon = "fa fa-sticky-note",
                ListOrder = 2,
                ParentId = 0,
                Type = (byte)MenuType.模块,
                Url = "#"
            }; // id:2

            menuList.Add(sysMenu);
            menuList.Add(logMenu);

            var sys_subMenu = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "角色管理",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/role/index"
                }, // id: 3
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "部门管理",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/department/index"
                }, // id: 4
                 new MenuEntity
                {
                    ModuleId = 1,
                    Name = "角色授权",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/role/authen"
                }, // id: 5
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "用户管理",
                    Icon = "",
                    ListOrder = 4,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/user/index"
                }, // id: 6
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "用户部门",
                    Icon = "",
                    ListOrder = 5,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/user/department"
                }, // id: 7
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "模块管理",
                    Icon = "",
                    ListOrder = 6,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/module/index"
                }, // id: 8
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "菜单管理",
                    Icon = "",
                    ListOrder = 7,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/menu/index"
                }, // id: 9
                 new MenuEntity
                {
                    ModuleId = 1,
                    Name = "修改信息",
                    Icon = "",
                    ListOrder = 9,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/user/edit"
                }, // id: 10
            };

            menuList.AddRange(sys_subMenu);

            var logSubMenu = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "登陆日志",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/log/login"
                }, // id:11
                   new MenuEntity
                {
                    ModuleId = 1,
                    Name = "操作日志",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/log/operation"
                }, // id:12
            };

            menuList.AddRange(logSubMenu);

            var roleManageBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 3,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/role/add"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 3,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/role/edit"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 3,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/role/delete"
                },
            };// id:15
            var departmentManageBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 4,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/department/add"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 4,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/department/edit"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 4,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/department/delete"
                },
            };// id:18
            var roleAuthBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "保存",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 5,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/role/AuthMenus"
                }
            };// id:19
            var userManageBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 6,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/user/add"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 6,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/user/edit"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 6,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/user/delete"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "角色授权",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 6,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/user/authen"
                },
            };// id:23
            var userDepartmentBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 7,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/user/selectUser"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 7,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/User/DelUserDepartment"
                },
            };// id:25
            var moduleManageBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 8,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/module/add"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 8,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/module/edit"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 8,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/module/delete"
                },
            };// id:28
            var menuManageBtns = new List<MenuEntity>
            {
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 9,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/menu/add"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 9,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/menu/edit"
                },
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 9,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/menu/delete"
                },
            };// id:31

            menuList.AddRange(roleManageBtns);
            menuList.AddRange(departmentManageBtns);
            menuList.AddRange(roleAuthBtns);
            menuList.AddRange(userManageBtns);
            menuList.AddRange(userDepartmentBtns);
            menuList.AddRange(moduleManageBtns);
            menuList.AddRange(menuManageBtns);
            menuList.AddRange(new List<MenuEntity>{
                new MenuEntity
                {
                    ModuleId = 1,
                    Name = "表管理",
                    Icon = "",
                    ListOrder = 7,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/table/index"
                },//id: 32
                  new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 32,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/table/add"
                },//id: 33
                   new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 32,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/table/edit"
                },//id: 34
                    new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 32,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/table/delete"
                },//id: 35

                  new MenuEntity
                {
                    ModuleId = 1,
                    Name = "表结构管理",
                    Icon = "",
                    ListOrder = 8,
                    ParentId = 1,
                    Type = (byte)MenuType.菜单,
                    Url = "/admin/tablecolumn/index"
                },//id: 36
                    new MenuEntity
                {
                    ModuleId = 1,
                    Name = "添加",
                    Icon = "",
                    ListOrder = 1,
                    ParentId = 36,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/tablecolumn/add"
                },//id: 33
                   new MenuEntity
                {
                    ModuleId = 1,
                    Name = "编辑",
                    Icon = "",
                    ListOrder = 2,
                    ParentId = 36,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/tablecolumn/edit"
                },//id: 34
                    new MenuEntity
                {
                    ModuleId = 1,
                    Name = "删除",
                    Icon = "",
                    ListOrder = 3,
                    ParentId = 36,
                    Type = (byte)MenuType.按钮,
                    Url = "/admin/tablecolumn/delete"
                },//id: 35
            });

            db.AddRange(menuList);
            #endregion

            #region 用户
            var users = new List<UserDto>
            {
              new UserDto
              {
                   UserName = "sa",
                   Password="sa123",
                   Email="sa@lk.com",
                   RealName="超级管理员",
                   Status=  UserStatus.已激活,
              }, // id:1
              new UserDto
              {
                   UserName = "admin",
                   Password="admin123",
                   Email="admin@lk.com",
                   RealName="管理员",
                   Status=  UserStatus.已激活,
              }, //id:2
              new UserDto
              {
                   UserName = "guest",
                   Password="guest",
                   Email="admin@lk.com",
                   RealName="游客",
                   Status=  UserStatus.已激活,
              },  //id:3
            };
            foreach (var user in users)
            {
                userService.Register(user);
            }
            #endregion

            #region 角色
            var roles = new List<RoleDto>
            {
                new RoleDto
                {
                      Name="超级管理员",
                      Description="最高权限拥有者"
                }, // id:1
                new RoleDto
                {
                      Name="管理员",
                      Description="普通管理者"
                },// id:2
                new RoleDto
                {
                      Name="游客",
                      Description="只能看看"
                },// id:3
            };
            roleService._Add(roles);
            #endregion

            #region 用户角色
            userService.AddRoles(1, new List<int> { 1 });
            userService.AddRoles(2, new List<int> { 2 });
            userService.AddRoles(3, new List<int> { 3 });
            #endregion

            #region 角色菜单
            //超级管理员
            for (int i = 1; i <= menuList.Count; i++)
            {
                roleMenuList.Add(new RoleMenuEntity
                {
                    MenuId = i,
                    RoleId = 1
                });
            }
            db.AddRange(roleMenuList);
            #endregion

            db.SaveChanges();

        }
    }
}
