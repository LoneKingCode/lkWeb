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
    public partial class UserService : ServiceBase<UserEntity>, IUserService
    {
        public static string UserSessionName
        {
            get { return "CurrentUser"; }
        }
        public readonly ILoginLogService _loginLogService;
        public readonly IRoleService _roleService;
        public readonly IUserRoleService _userRoleService;

        public UserService(ILoginLogService loginLogService, IRoleService roleService, IUserRoleService userRoleService, IMapper mapper) : base(mapper)
        {
            _loginLogService = loginLogService;
            _roleService = roleService;
            _userRoleService = userRoleService;
        }

        public static Result<UserDto> GetCurrentUserBySession()
        {
           
            var result = new Result<UserDto>();
            var sessionUser = WebHelper.GetSession<UserDto>(UserSessionName);
            if (sessionUser != null)
            {
                result.data = sessionUser;
                result.flag = true;
            }
            return result;

        }

        public Result<UserDto> GetCurrentUser()
        {
            return GetCurrentUserBySession();
        }

        private async Task<Result<UserDto>> UserLogin(UserDto dto)
        {
            var userResult = await GetByExpAsync(item => item.UserName == dto.UserName && item.Password == SecurityHelper.Md5(dto.Password));
            return userResult;
        }
        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Login(UserDto dto)
        {
            var result = new Result<UserDto>();
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
                await _loginLogService.AddAsync(new LoginLogDto
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

        public async Task<Result<UserDto>> Register(UserDto dto)
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
        public async Task<Result<List<UserRoleDto>>> AddRoles(int userId, List<int> roleIds)
        {
            var result = new Result<List<UserRoleDto>>();
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
            var userRoles = new List<UserRoleDto>();
            foreach (var roleId in roleIds)
            {
                if (!userExistedRoleIds.Contains(roleId))
                {
                    userRoles.Add(new UserRoleDto
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
        public async Task<Result<UserRoleDto>> RemoveRoles(int userId, List<int> roleIds)
        {
            var result = new Result<UserRoleDto>();
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
        public async Task<Result<List<MenuDto>>> GetUserMenu(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<MenuDto>>();
                var roleResult = await GetUserRoles(id);
                var roleIds = roleResult.data.Select(x => x.Id).ToList();
                Expression<Func<RoleMenuEntity, bool>> exp = item => roleIds.Contains(item.RoleId);
                var roleMenus = await db.RoleMenu.Where(exp).ToListAsync();
                var menuIds = roleMenus.Select(x => x.MenuId).ToList();
                Expression<Func<MenuEntity, bool>> expMenu = item => menuIds.Contains(item.Id);
                var menus = await db.Menu.Where(expMenu).OrderBy(item => item.ListOrder).ToListAsync();
                result.flag = true;
                result.data = MapTo<List<MenuEntity>, List<MenuDto>>(menus);
                return result;
            }
        }
        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<ResultDto<RoleDto>> GetUserRoles(int id)
        {
            using (var db = GetDb())
            {
                var userRoles = await db.UserRole.Where(x => x.UserId == id).ToListAsync();
                var roleIds = userRoles.Select(x => x.RoleId).ToList();
                Expression<Func<RoleEntity, bool>> exp = item => roleIds.Contains(item.Id);
                var roles = await db.Role.Where(exp).ToListAsync();
                var result = new ResultDto<RoleDto>
                {
                    recordsTotal = roles.Count,
                    data = MapTo<List<RoleEntity>, List<RoleDto>>(roles)
                };
                return result;
            }
        }

        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<ResultDto<RoleDto>> GetNotUserRoles(int userID)
        {
            using (var db = GetDb())
            {
                var roles = await db.Role.ToListAsync();
                var roleIds = roles.Select(x => x.Id).ToList();
                var userRoles = await db.UserRole.Where(x => x.UserId == userID).ToListAsync();
                var userRoleIds = userRoles.Select(x => x.RoleId).ToList();

                Expression<Func<RoleEntity, bool>> exp = item => !userRoleIds.Contains(item.Id);
                var notRoles = await db.Role.Where(exp).ToListAsync();
                var result = new ResultDto<RoleDto>
                {
                    recordsTotal = notRoles.Count,
                    data = MapTo<List<RoleEntity>, List<RoleDto>>(notRoles)
                };
                return result;
            }
        }

    }

}
