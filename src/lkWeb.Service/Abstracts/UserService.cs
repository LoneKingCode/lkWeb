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
        public bool AddUser(UserDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<UserDto, UserEntity>(dto);
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
                    else if(user.Status == UserStatus.未激活)
                    {
                        result.msg = "账户未激活";
                    }
                    else if(user.Status == UserStatus.禁用)
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
    }

}
