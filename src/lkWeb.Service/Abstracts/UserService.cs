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

namespace lkWeb.Service.Abstracts
{
    public partial class UserService : ServiceBase<UserEntity>, IUserService
    {
        public readonly ILoginLogService _loginLogService;
        public readonly UserManager<UserEntity> _userManager;
        public readonly SignInManager<UserEntity> _signInManager;

        public UserService(ILoginLogService loginLogService, UserManager<UserEntity> userManager, SignInManager<UserEntity> signInManager)
        {
            _loginLogService = loginLogService;
            _userManager = userManager;
            _signInManager = signInManager;
        }
        /// <summary>
        /// 获取用户菜单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public List<MenuDto> GetUserMenu(int id)
        {
            using (var db = GetDb())
            {

                var roleResult = GetUserRoles(id);
                var roleIds = roleResult.data.Select(x => x.Id).ToList();
                Expression<Func<RoleMenuEntity, bool>> exp = item => roleIds.Contains(item.RoleId);
                var roleMenus = db.RoleMenus.Where(exp).ToList();
                var menuIds = roleMenus.Select(x => x.MenuId).ToList();
                Expression<Func<MenuEntity, bool>> expMenu = item => menuIds.Contains(item.Id);
                var menus = db.Menus.Where(expMenu).ToList();
                return MapTo<List<MenuEntity>, List<MenuDto>>(menus);
            }
        }
        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public ResultDto<RoleDto> GetUserRoles(int id)
        {
            using (var db = GetDb())
            {
                var userRoles = db.UserRoles.Where(x => x.UserId == id).ToList();
                var roleIds = userRoles.Select(x => x.RoleId).ToList();
                Expression<Func<RoleEntity, bool>> exp = item => roleIds.Contains(item.Id);
                var roles = db.Roles.Where(exp).ToList();
                var result = new ResultDto<RoleDto>
                {
                    recordsTotal = roles.Count,
                    data = MapTo<List<RoleEntity>, List<RoleDto>>(roles)
                };
                return result;
            }
        }

        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public Result<UserDto> Login(UserDto dto)
        {
            var result = new Result<UserDto>();
            var signedUser = _userManager.FindByNameAsync(dto.UserName).Result;

            var signInResult = _signInManager.PasswordSignInAsync(signedUser, dto.Password, false, false).Result;
            if (signInResult.Succeeded)
            {
                result.flag = true;
            }
            else
            {
                //  if(signInResult.IsNotAllowed)
                result.msg = "登陆失败";
            }
            return result;
            //using (var db = GetDb())
            //{
            //    var result = new Result<UserDto>();
            //    var userEntity = db.Users.Where(x => x.UserName == dto.UserName).FirstOrDefault();
            //    if (userEntity == null)
            //    {
            //        result.msg = " 用户名不存在";
            //    }
            //    else
            //    {
            //        var user = MapTo<UserEntity, UserDto>(userEntity);
            //        var loginLogDto =
            //        //记录登录日志
            //        _loginLogService.Add(new LoginLogDto
            //        {
            //            UserId = user.Id,
            //            UserName = user.UserName,
            //            ClientIP = WebHelper.GetClientIP(),
            //            ClientMac = WebHelper.GetClientMac()
            //        });
            //        if (user.Password != dto.Password)
            //        {
            //            result.msg = " 密码错误";
            //        }
            //        else if (user.IsDeleted)
            //        {
            //            result.msg = " 账户已删除";
            //        }
            //        else if (user.Status == UserStatus.未激活)
            //        {
            //            result.msg = "账户未激活";
            //        }
            //        else if (user.Status == UserStatus.禁用)
            //        {
            //            result.msg = "账户已禁用";
            //        }
            //        else
            //        {
            //            result.flag = true;
            //            result.msg = "登录成功";
            //            result.data = user;
            //            //...保存cookie等等 表单验证加密
            //        }
            //    }
            //    return result;
            //}
        }

        public Result<UserDto> Register(UserDto dto)
        {
            var result = new Result<UserDto>();
            var user = MapTo<UserDto, UserEntity>(dto);
            var regResult = _userManager.CreateAsync(user, dto.Password).Result;
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
        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <returns></returns>
        public ResultDto<UserDto> GetList()
        {
            using (var db = GetDb())
            {
                var temp = db.Set<UserEntity>().OrderBy(item => item.Id).ToList();
                var dtoData = MapTo<List<UserEntity>, List<UserDto>>(temp);
                var result = new ResultDto<UserDto>
                {
                    data = dtoData.Select(
                    d => new UserDto
                    {
                        Id = d.Id,
                        UserName = d.UserName,
                        Email = d.Email == null ? "" : d.Email,
                        Status = d.Status,
                        RealName = d.RealName == null ? "" : d.RealName,
                        CreateDateTime = d.CreateDateTime,
                        Password = "",
                    }
                    ).ToList(),
                    recordsTotal = dtoData.Count,
                    pageSize = 15,
                    pageIndex = 0
                };
                return result;
            }
        }
        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public ResultDto<RoleDto> GetNotUserRoles(int userID)
        {
            using (var db = GetDb())
            {
                var roles = db.Roles.ToList();
                var roleIds = roles.Select(x => x.Id).ToList();

                var userRoles = db.UserRoles.Where(x => x.UserId == userID).ToList();
                var userRoleIds = userRoles.Select(x => x.RoleId).ToList();

                Expression<Func<RoleEntity, bool>> exp = item => !userRoleIds.Contains(item.Id);
                var notRoles = db.Roles.Where(exp).ToList();
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
