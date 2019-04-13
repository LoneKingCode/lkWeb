using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq.Expressions;
using lkWeb.Service.Enum;
using lkWeb.Core.Extension;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
using lkWeb.Data;
using lkWeb.Core.Helper;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;

namespace lkWeb.Service.Abstracts
{
    public partial class Sys_UserService : ServiceBase<Sys_UserEntity>, ISys_UserService
    {
        public static string UserSessionName
        {
            get { return "CurrentUser"; }
        }
        public readonly ISys_LoginLogService _loginLogService;
        public readonly ISys_RoleService _roleService;
        public readonly ISys_UserRoleService _userRoleService;

        public Sys_UserService(ISys_LoginLogService loginLogService, ISys_RoleService roleService, ISys_UserRoleService userRoleService, IMapper mapper) : base(mapper)
        {
            _loginLogService = loginLogService;
            _roleService = roleService;
            _userRoleService = userRoleService;
        }

        public static Result<Sys_UserDto> GetCurrentUserBySession()
        {
           
            var result = new Result<Sys_UserDto>();
            var sessionUser = WebHelper.GetSession<Sys_UserDto>(UserSessionName);
            if (sessionUser != null)
            {
                result.data = sessionUser;
                result.flag = true;
            }
            return result;

        }

        public Result<Sys_UserDto> GetCurrentUser()
        {
            return GetCurrentUserBySession();
        }

        private async Task<Result<Sys_UserDto>> UserLogin(Sys_UserDto dto)
        {
            var userResult = await GetByExpAsync(item => item.UserName == dto.UserName && item.Password == SecurityHelper.Md5(dto.Password));
            return userResult;
        }
        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> Login(Sys_UserDto dto)
        {
            var result = new Result<Sys_UserDto>();
            var loginUser = GetByIdAsync(dto.Id);
            if (loginUser != null)
            {
                var loginResult = await UserLogin(dto);
                if (loginResult.flag)
                {
                    var loginedUser = loginResult.data;
                    if (loginedUser.Status == UserStatus.未激活)
                        result.msg = "登陆失败，账户未激活";
                    else if (loginedUser.Status == UserStatus.禁用)
                        result.msg = "登陆失败，账户已禁用";
                    else if (loginedUser.Status == UserStatus.已激活)
                    {
                        result.flag = true;
                        result.msg = "登陆成功";
                        WebHelper.SetSession(UserSessionName, loginedUser);
                    }
                    else
                        result.msg = "登陆失败，账户状态未知";
                }
                else
                {
                    result.msg = "登陆失败,请检查输入的信息";
                }
            }
            else
            {
                result.flag = false;
                result.msg = "登陆失败,用户不存在";
            }
            try
            {
                //记录登录日志
                await _loginLogService.AddAsync(new Sys_LoginLogDto
                {
                    UserId = dto.Id,
                    UserName = dto.UserName,
                    ClientIP = WebHelper.GetClientIP(),
                    ClientMac = WebHelper.GetClientMac(),
                    Description = result.msg
                });
            }
            catch (Exception)
            {


            }
            return result;

        }

        public async Task<Result<Sys_UserDto>> Register(Sys_UserDto dto)
        {
            var result = await AddAsync(dto);
            return result;
        }
        public Result<string> Logout()
        {
            var result = new Result<string>();
            WebHelper.SetSession<object>(UserSessionName, null);
            result.flag = true;
            result.msg = "注销成功";
            return result;
        }
        public async Task<Result<List<Sys_UserRoleDto>>> AddRoles(int userId, List<int> roleIds)
        {
            var result = new Result<List<Sys_UserRoleDto>>();
            List<string> roleNames = new List<string>();
            var userResult = await GetByIdAsync(userId);
            if (!userResult.flag)
            {
                result.msg = "用户不存在";
                return result;
            }
            if (roleIds.Count <= 0)
            {
                result.msg = "请选择要添加的角色";
                return result;
            }
                  var userRoleResult = await _userRoleService.GetListAsync(item => item.UserId == userResult.data.Id);
            var userExistedRoleIds = userRoleResult.data.Select(item => item.RoleId).ToList();
            var userRoles = new List<Sys_UserRoleDto>();
            foreach (var roleId in roleIds)
            {
                if (!userExistedRoleIds.Contains(roleId))
                {
                    userRoles.Add(new Sys_UserRoleDto
                    {
                        UserId = userResult.data.Id,
                        RoleId = roleId
                    });
                }
            }
            result = await _userRoleService.AddAsync(userRoles);
            //foreach (var roleId in roleIds)
            //{
            //    var roleResult = await _roleService.GetByIdAsync(roleId);
            //    if (roleResult.flag)
            //        roleNames.Add(roleResult.data.Name);
            //}
            //var _result = await _userManager.AddToRolesAsync(user, roleNames);
            //if (_result.Succeeded)
            //{
            //    result.flag = true;
            //}
            //else
            //{
            //    foreach (var err in _result.Errors)
            //    {
            //        result.msg += err.Description + "\n";
            //    }
            //}
            return result;
        }
        public async Task<Result<Sys_UserRoleDto>> RemoveRoles(int userId, List<int> roleIds)
        {
            var result = new Result<Sys_UserRoleDto>();
            List<string> roleNames = new List<string>();
            var userResult = await GetByIdAsync(userId);
            if (!userResult.flag)
            {
                result.msg = "用户不存在";
                return result;
            }
            if (roleIds.Count <= 0)
            {
                result.msg = "请选择要移除的角色";
                return result;
            }
            result = await _userRoleService.DeleteAsync(item => roleIds.Contains(item.RoleId));
            //foreach (var roleId in roleIds)
            //{
            //    var role = await _roleManage.FindByIdAsync(roleId.ToString());
            //    roleNames.Add(role.Name);
            //}
            //var _result = await _userManager.RemoveFromRolesAsync(user, roleNames);
            //if (_result.Succeeded)
            //{
            //    result.flag = true;
            //}
            //else
            //{
            //    foreach (var err in _result.Errors)
            //    {
            //        result.msg += err.Description + "\n";
            //    }
            //}
            return result;
        }


        /// <summary>
        /// 获取用户菜单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_MenuDto>>> GetUserMenu(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_MenuDto>>();
                var roleResult = await GetUserRoles(id);
                var roleIds = roleResult.data.Select(x => x.Id).ToList();
                Expression<Func<Sys_RoleMenuEntity, bool>> exp = item => roleIds.Contains(item.RoleId);
                var roleMenus = await db.RoleMenu.Where(exp).ToListAsync();
                var menuIds = roleMenus.Select(x => x.MenuId).ToList();
                Expression<Func<Sys_MenuEntity, bool>> expMenu = item => menuIds.Contains(item.Id);
                var menus = await db.Menu.Where(expMenu).OrderBy(item => item.ListOrder).ToListAsync();
                result.flag = true;
                result.data = MapTo<List<Sys_MenuEntity>, List<Sys_MenuDto>>(menus);
                return result;
            }
        }
        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_RoleDto>> GetUserRoles(int id)
        {
            using (var db = GetDb())
            {
                var userRoles = await db.UserRole.Where(x => x.UserId == id).ToListAsync();
                var roleIds = userRoles.Select(x => x.RoleId).ToList();
                Expression<Func<Sys_RoleEntity, bool>> exp = item => roleIds.Contains(item.Id);
                var roles = await db.Role.Where(exp).ToListAsync();
                var result = new ResultDto<Sys_RoleDto>
                {
                    recordsTotal = roles.Count,
                    data = MapTo<List<Sys_RoleEntity>, List<Sys_RoleDto>>(roles)
                };
                return result;
            }
        }

        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_RoleDto>> GetNotUserRoles(int userID)
        {
            using (var db = GetDb())
            {
                var roles = await db.Role.ToListAsync();
                var roleIds = roles.Select(x => x.Id).ToList();
                var userRoles = await db.UserRole.Where(x => x.UserId == userID).ToListAsync();
                var userRoleIds = userRoles.Select(x => x.RoleId).ToList();

                Expression<Func<Sys_RoleEntity, bool>> exp = item => !userRoleIds.Contains(item.Id);
                var notRoles = await db.Role.Where(exp).ToListAsync();
                var result = new ResultDto<Sys_RoleDto>
                {
                    recordsTotal = notRoles.Count,
                    data = MapTo<List<Sys_RoleEntity>, List<Sys_RoleDto>>(notRoles)
                };
                return result;
            }
        }

    }

}
