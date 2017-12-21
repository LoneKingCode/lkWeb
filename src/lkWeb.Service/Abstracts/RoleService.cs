using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;

namespace lkWeb.Service.Abstracts
{
    public partial class RoleService : ServiceBase<RoleEntity>, IRoleService
    {

        public ResultDto<RoleDto> GetList()
        {
            using (var db = GetDb())
            {
                var temp = db.Set<RoleEntity>().OrderBy(item=>item.Id).ToList();
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


    }
}
