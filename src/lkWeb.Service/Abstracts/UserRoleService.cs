using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;

namespace lkWeb.Service.Abstracts
{
    public class UserRoleService : ServiceBase, IUserRoleService
    {
        public bool Add(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<UserRoleDto, UserRoleEntity>(dto);
                var isHas = db.UserRoles.Where(x => x.UserId == dto.UserId && x.RoleId==dto.RoleId).FirstOrDefault();
                if (isHas != null)
                    return false;
                db.UserRoles.Add(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(int userID, int roleID)
        {
            using (var db = GetDb())
            {
                var entity = db.UserRoles.FirstOrDefault(item => item.RoleId == roleID && item.UserId == userID);
                db.UserRoles.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<UserRoleDto, UserRoleEntity>(dto);
                db.UserRoles.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public UserRoleDto GetById(int roleID)
        {
            using (var db = GetDb())
            {
                var entity = db.UserRoles.FirstOrDefault(item => item.Id == roleID);
                if (entity != null)
                    return MapTo<UserRoleEntity, UserRoleDto>(entity);
                else
                    return null;
            };
        }

        public bool Update(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<UserRoleDto, UserRoleEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
    }
}
