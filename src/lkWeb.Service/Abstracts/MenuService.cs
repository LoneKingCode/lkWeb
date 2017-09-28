using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;

namespace lkWeb.Service.Abstracts
{
    public class MenuService : ServiceBase, IMenuService
    {
        public bool Add(MenuDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<MenuDto, MenuEntity>(dto);
                db.Menus.Add(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(int menuID)
        {
            using (var db = GetDb())
            {
                var entity = db.Menus.FirstOrDefault(item => item.Id == menuID);
                db.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool Delete(MenuDto dto)
        {
            using (var db = GetDb())
            {
                var entity = MapTo<MenuDto, MenuEntity>(dto);
                db.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }

        public bool DeleteMulti(string menuIDs)
        {
            using (var db = GetDb())
            {
                string[] menuID = menuIDs.Split(',');
                foreach (string id in menuID)
                {
                    var entity = db.Menus.FirstOrDefault(item => item.Id == int.Parse(id));
                    db.Remove(entity);
                }
                return db.SaveChanges() > 0;
            }
        }

        public MenuDto GetById(int menuID)
        {
            using (var db = GetDb())
            {
                var entity = db.Menus.FirstOrDefault(item => item.Id == menuID);
                if (entity != null)
                    return MapTo<MenuEntity, MenuDto>(entity);
                else
                    return null;
            }
        }

        public ResultDto<MenuDto> GetList()
        {
            using (var db = GetDb())
            {
                var temp = db.Set<MenuEntity>().ToList();
                var dtoData = MapTo<List<MenuEntity>, List<MenuDto>>(temp);
                var result = new ResultDto<MenuDto>
                {
                    data = dtoData.Select(
                    d => new MenuDto
                    {
                        Id = d.Id,
                        Name = d.Name,
                        Url = d.Url,
                        CreateDateTime = d.CreateDateTime,
                        Type = d.Type,
                        ParentId = d.ParentId,
                        Order=d.Order
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

        public bool Update(MenuDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<MenuDto, MenuEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
    }
}
