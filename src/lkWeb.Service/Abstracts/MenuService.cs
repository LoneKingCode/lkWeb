using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;

namespace lkWeb.Service.Abstracts
{
    public partial class MenuService : ServiceBase<MenuEntity>, IMenuService
    {

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
                        Order = d.Order
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
