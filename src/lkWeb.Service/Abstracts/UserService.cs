using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq.Expressions;
using lkWeb.Service.Enum;
using lkWeb.Core.Extensions;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;

namespace lkWeb.Service.Abstracts
{
    public partial class UserService : ServiceBase<UserEntity>, IUserService
    {
        public readonly ILoginLogService _loginLogService;
        public readonly UserManager<UserEntity> _userManager;
        public readonly SignInManager<UserEntity> _signInManager;
        public readonly RoleManager<RoleEntity> _roleManage;

        public UserService(ILoginLogService loginLogService,
            UserManager<UserEntity> userManager,
            SignInManager<UserEntity> signInManager,
            RoleManager<RoleEntity> roleManage)
        {
            _loginLogService = loginLogService;
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManage = roleManage;
        }

        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Login(UserDto dto)
        {
            var result = new Result<UserDto>();
            var signedUser = await _userManager.FindByNameAsync(dto.UserName);
            if (signedUser != null)
            {
                var signInResult = await _signInManager.PasswordSignInAsync(signedUser, dto.Password, false, false);
                if (signInResult.Succeeded)
                {
                    var signedUserDto = MapTo<UserEntity, UserDto>(signedUser);
                    if (signedUserDto.Status == UserStatus.未激活)
                        result.msg = "登陆失败，账户未激活";
                    else if (signedUserDto.Status == UserStatus.禁用)
                        result.msg = "登陆失败，账户已禁用";
                    else if (signedUserDto.Status == UserStatus.已激活)
                    {
                        result.flag = true;
                        WebHelper.SetSession("CurrentUser", signedUserDto);
                    }
                    else
                        result.msg = "登陆失败，账户状态未知";
                }
                else
                {
                    if (signInResult.IsNotAllowed)
                        result.msg = "登陆失败,不被允许";
                    else if (signInResult.IsLockedOut)
                        result.msg = "登陆失败，账户被锁";
                    else
                        result.msg = "登陆失败,请检查输入的信息";
                }
            }
            else
            {
                result.flag = false;
                result.msg = "登陆失败,用户不存在";
            }
            //记录登录日志
            await _loginLogService.Add(new LoginLogDto
            {
                UserId = dto.Id,
                UserName = dto.UserName,
                ClientIP = WebHelper.GetClientIP(),
                ClientMac = WebHelper.GetClientMac(),
                Description = result.msg
            });
            return result;

        }

        public async Task<Result<UserDto>> Register(UserDto dto)
        {
            var result = new Result<UserDto>();
            var user = MapTo<UserDto, UserEntity>(dto);
            var regResult = await _userManager.CreateAsync(user, dto.Password);
            if (regResult.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in regResult.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public async Task<Result<string>> Logout()
        {
            var result = new Result<string>();
            await _signInManager.SignOutAsync();
            result.flag = true;
            result.msg = "注销成功";
            return result;
        }
        public async Task<Result<UserDto>> AddRoles(int userID, List<int> roleIds)
        {
            var result = new Result<UserDto>();
            List<string> roleNames = new List<string>();
            var user = await _userManager.FindByIdAsync(userID.ToString());
            if (user == null)
            {
                result.msg = "用户不存在";
                return result;
            }
            if (roleIds.Count <= 0)
            {
                result.msg = "请选择要添加的角色";
                return result;
            }
            foreach (var roleId in roleIds)
            {
                var role = await _roleManage.FindByIdAsync(roleId.ToString());
                roleNames.Add(role.Name);
            }
            var _result = await _userManager.AddToRolesAsync(user, roleNames);
            if (_result.Succeeded)
            {
                result.flag = true;
            }
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public async Task<Result<UserDto>> RemoveRoles(int userID, List<int> roleIds)
        {
            var result = new Result<UserDto>();
            List<string> roleNames = new List<string>();
            var user = await _userManager.FindByIdAsync(userID.ToString());
            if (user == null)
            {
                result.msg = "用户不存在";
                return result;
            }
            if (roleIds.Count <= 0)
            {
                result.msg = "请选择要移除的角色";
                return result;
            }
            foreach (var roleId in roleIds)
            {
                var role = await _roleManage.FindByIdAsync(roleId.ToString());
                roleNames.Add(role.Name);
            }
            var _result = await _userManager.RemoveFromRolesAsync(user, roleNames);
            if (_result.Succeeded)
            {
                result.flag = true;
            }
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }

        public async Task<Result<UserDto>> _GetById(int id)
        {
            var result = new Result<UserDto>();
            result.flag = true;
            var entity = await _userManager.FindByIdAsync(id.ToString());
            result.data = MapTo<UserEntity, UserDto>(entity);
            return result;

        }

        public async Task<Result<UserDto>> _Add(UserDto dto)
        {
            var result = new Result<UserDto>();
            var entity = MapTo<UserDto, UserEntity>(dto);
            var _result = await _userManager.CreateAsync(entity, dto.Password);
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public async Task<Result<UserDto>> _Update(UserDto dto)
        {
            var result = new Result<UserDto>();
            var entity = await _userManager.FindByIdAsync(dto.Id.ToString());
            Map(dto, entity, typeof(UserDto), typeof(UserEntity));
            if (dto.Password.IsNotEmpty())
                entity.PasswordHash = _userManager.PasswordHasher.HashPassword(entity, dto.Password);
            var _result = await _userManager.UpdateAsync(entity);
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;

        }
        public async Task<Result<UserDto>> _Delete(UserDto dto)
        {
            var result = new Result<UserDto>();
            var entity = MapTo<UserDto, UserEntity>(dto);
            var _result = await _userManager.DeleteAsync(entity);
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public async Task<Result<UserDto>> _Delete(int id)
        {
            var result = new Result<UserDto>();
            var entity = await _userManager.FindByIdAsync(id.ToString());
            var _result = _userManager.DeleteAsync(entity).Result;
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public async Task<Result<UserDto>> _Delete(List<int> ids)
        {
            var result = new Result<UserDto>();
            foreach (var id in ids)
            {
                var entity = await _userManager.FindByIdAsync(id.ToString());
                var _result = _userManager.DeleteAsync(entity).Result;
                if (_result.Succeeded)
                    result.flag = true;
                else
                {
                    foreach (var err in _result.Errors)
                    {
                        result.msg += err.Description + "\n";
                    }
                }
            }
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
                var roleMenus = await db.RoleMenus.Where(exp).ToListAsync();
                var menuIds = roleMenus.Select(x => x.MenuId).ToList();
                Expression<Func<MenuEntity, bool>> expMenu = item => menuIds.Contains(item.Id);
                var menus = await db.Menus.Where(expMenu).ToListAsync();
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
                var userRoles = await db.UserRoles.Where(x => x.UserId == id).ToListAsync();
                var roleIds = userRoles.Select(x => x.RoleId).ToList();
                Expression<Func<RoleEntity, bool>> exp = item => roleIds.Contains(item.Id);
                var roles = await db.Roles.Where(exp).ToListAsync();
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
                var roles = await db.Roles.ToListAsync();
                var roleIds = roles.Select(x => x.Id).ToList();
                var userRoles = await db.UserRoles.Where(x => x.UserId == userID).ToListAsync();
                var userRoleIds = userRoles.Select(x => x.RoleId).ToList();

                Expression<Func<RoleEntity, bool>> exp = item => !userRoleIds.Contains(item.Id);
                var notRoles = await db.Roles.Where(exp).ToListAsync();
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
