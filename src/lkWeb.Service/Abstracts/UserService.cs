using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq.Expressions;
using lkWeb.Service.Enum;

namespace lkWeb.Service.Abstracts
{
    public class UserService : ServiceBase, IUserService
    {
        public bool Add(UserDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<UserDto, UserEntity>(dto);
                var isHas = db.Users.Where(x => x.LoginName == dto.LoginName).FirstOrDefault();
                if (isHas != null)
                    return false;
                db.Users.Add(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(int userID)
        {
            using (var db = GetDb())
            {
                var entity = db.Users.FirstOrDefault(item => item.Id == userID);
                db.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        public bool DeleteMulti(string userIDs)
        {
            using (var db = GetDb())
            {
                string[] userID = userIDs.Split(',');
                foreach (string id in userID)
                {
                    var entity = db.Users.FirstOrDefault(item => item.Id == int.Parse(id));
                    db.Remove(entity);
                }
                return db.SaveChanges() > 0;
            }
        }
        public bool Delete(UserDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<UserDto, UserEntity>(dto);
                db.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public UserDto GetById(int userID)
        {
            using (var db = GetDb())
            {
                var entity = db.Users.FirstOrDefault(item => item.Id == userID);
                if (entity != null)
                    return MapTo<UserEntity, UserDto>(entity);
                else
                    return null;
            }
        }

        public List<MenuDto> GetUserMenu(int userID)
        {
            using (var db = GetDb())
            {
                var roleResult = GetUserRoles(userID);
                var roleIds = roleResult.data.Select(x => x.Id).ToList();
                Expression<Func<RoleMenuEntity, bool>> exp = item => (!item.IsDeleted && roleIds.Contains(item.RoleId));
                var roleMenus = db.RoleMenus.Where(exp).ToList();
                var menuIds = roleMenus.Select(x => x.MenuId).ToList();
                Expression<Func<MenuEntity, bool>> expMenu = item => (!item.IsDeleted && menuIds.Contains(item.Id));
                var menus = db.Menus.Where(expMenu).ToList();
                return MapTo<List<MenuEntity>, List<MenuDto>>(menus);
            }
        }

        public ResultDto<RoleDto> GetUserRoles(int userID)
        {
            using (var db = GetDb())
            {
                var userRoles = db.UserRoles.Where(x => x.UserId == userID).ToList();
                var roleIds = userRoles.Select(x => x.RoleId).ToList();
                Expression<Func<RoleEntity, bool>> exp = item => (!item.IsDeleted && roleIds.Contains(item.Id));
                var roles = db.Roles.Where(exp).ToList();
                var result = new ResultDto<RoleDto>
                {
                    recordsTotal = roles.Count,
                    data = MapTo<List<RoleEntity>, List<RoleDto>>(roles)
                };
                return result;
            }
        }

        public Result<UserDto> Login(UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                var userEntity = db.Users.Where(x => x.LoginName == dto.LoginName).FirstOrDefault();
                var user = MapTo<UserEntity, UserDto>(userEntity);
                if (user == null)
                {
                    result.msg = " 用户名不存在";
                }
                else
                {
                    //记录登录日志
                    //loginLogService.Add(new LoginLogDto
                    //{
                    //    UserId = user.Id,
                    //    LoginName = user.LoginName,
                    //    IP = WebHelper.GetClientIP(),
                    //    Mac = WebHelper.GetClientMACAddress()
                    //});
                    if (user.Password != dto.Password)
                    {
                        result.msg = " 密码错误";
                    }
                    else if (user.IsDeleted)
                    {
                        result.msg = " 账户已删除";
                    }
                    else if (user.Status == UserStatus.未激活)
                    {
                        result.msg = "账户未激活";
                    }
                    else if (user.Status == UserStatus.禁用)
                    {
                        result.msg = "账户已禁用";
                    }
                    else
                    {
                        result.flag = true;
                        result.msg = "登录成功";
                        result.data = user;
                        //...保存cookie等等 表单验证加密
                    }
                }
                return result;
            }
        }

        public bool Update(UserDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<UserDto, UserEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }

        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <returns></returns>
        public ResultDto<UserDto> GetList()
        {
            using (var db = GetDb())
            {
                var temp = db.Set<UserEntity>().ToList();
                var dtoData = MapTo<List<UserEntity>, List<UserDto>>(temp);
                var result = new ResultDto<UserDto>
                {
                    data = dtoData.Select(
                    d => new UserDto
                    {
                        Id = d.Id,
                        LoginName = d.LoginName,
                        Email = d.Email == null ? "" : d.Email,
                        IsDeleted = d.IsDeleted,
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

        public ResultDto<RoleDto> GetNotUserRoles(int userID)
        {
            using (var db = GetDb())
            {
                var userRoles = db.UserRoles.Where(x => x.UserId != userID).ToList();
                var roleIds = userRoles.Select(x => x.RoleId).ToList();
                Expression<Func<RoleEntity, bool>> exp = item => (!item.IsDeleted && roleIds.Contains(item.Id));
                var roles = db.Roles.Where(exp).ToList();
                var result = new ResultDto<RoleDto>
                {
                    recordsTotal = roles.Count,
                    data = MapTo<List<RoleEntity>, List<RoleDto>>(roles)
                };
                return result;
            }
        }
    }

}
