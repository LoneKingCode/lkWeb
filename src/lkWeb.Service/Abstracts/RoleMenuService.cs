using lkWeb.Entity;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
   public partial class RoleMenuService : ServiceBase<RoleMenuEntity>,IRoleMenuService
    {

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
