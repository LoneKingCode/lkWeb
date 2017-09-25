using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;

namespace lkWeb.Service.Abstracts
{
    public class RoleService : ServiceBase, IRoleService
    {
        public bool Add(RoleDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<RoleDto, RoleEntity>(dto);
                var isHas = db.Roles.Where(x => x.Name == dto.Name).FirstOrDefault();
                if (isHas != null)
                    return false;
                db.Roles.Add(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(int roleID)
        {
            using (var db = GetDb())
            {
                var entity = db.Roles.FirstOrDefault(item => item.Id == roleID);
                db.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(RoleDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<RoleDto, RoleEntity>(dto);
                db.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool DeleteMulti(string roleIDs)
        {
            using (var db = GetDb())
            {
                string[] roleID = roleIDs.Split(',');
                foreach (string id in roleID)
                {
                    var entity = db.Roles.FirstOrDefault(item => item.Id == int.Parse(id));
                    db.Remove(entity);
                }
                return db.SaveChanges() > 0;
            }
        }

        public RoleDto GetById(int roleID)
        {
            using (var db = GetDb())
            {
                var entity = db.Roles.FirstOrDefault(item => item.Id == roleID);
                if (entity != null)
                    return MapTo<RoleEntity, RoleDto>(entity);
                else
                    return null;
            }
        }

        public ResultDto<RoleDto> GetList()
        {
            using (var db = GetDb())
            {
                var temp = db.Set<RoleEntity>().ToList();
                var dtoData = MapTo<List<RoleEntity>, List<RoleDto>>(temp);
                var result = new ResultDto<RoleDto>
                {
                    data = dtoData.Select(
                    d => new RoleDto
                    {
                        Id = d.Id,
                        Name = d.Name,
                        Description = d.Description,
                        CreateDateTime = d.CreateDateTime
                    }
                    ).ToList(),
                    recordsTotal = dtoData.Count,
                    pageSize = 15,
                    pageIndex = 0
                };
                return result;
            }
        }

        public ResultDto<T> GetPageData<T, TKey>(int pageSize, int pageIndex, Expression<Func<T, bool>> whereExp, Expression<Func<T, TKey>> orderExp, bool isDesc = true) where T : class
        {
            throw new NotImplementedException();
        }

        public bool Update(RoleDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<RoleDto, RoleEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
    }
}
