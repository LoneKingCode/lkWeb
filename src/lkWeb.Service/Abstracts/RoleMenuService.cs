using lkWeb.Entity;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
   public class RoleMenuService : ServiceBase,IRoleMenuService
    {
        /// <summary>
        /// 批量删除rolemenu
        /// </summary>
        /// <param name="exp">条件表达式</param>
        /// <returns></returns>
        public bool Delete(int roleId)
        {
            using (var db = GetDb())
            {
                var entities = db.RoleMenus.Where(d=>d.RoleId == roleId);
                db.RoleMenus.RemoveRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加rolemenu
        /// </summary>
        /// <param name="dtos">rolemenu集合</param>
        /// <returns></returns>
        public bool Add(List<RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var entities =  MapTo<List<RoleMenuDto>, List<RoleMenuEntity>>(dtos);
                db.RoleMenus.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        public ResultDto<RoleMenuDto> GetList(int roleID)
        {
            using (var db = GetDb())
            {
                var temp = db.Set<RoleMenuEntity>().Where(r => r.RoleId == roleID).ToList();
                var dtoData = MapTo<List<RoleMenuEntity>, List<RoleMenuDto>>(temp);
                var result = new ResultDto<RoleMenuDto>
                {
                    data = dtoData.Select(
                    d => new RoleMenuDto
                    {
                        Id = d.Id,
                        MenuId = d.MenuId,
                    }
                    ).ToList(),
                    recordsTotal = dtoData.Count,
                    pageSize = 15,
                    pageIndex = 0
                };
                return result;
            }
        }
    }
}
