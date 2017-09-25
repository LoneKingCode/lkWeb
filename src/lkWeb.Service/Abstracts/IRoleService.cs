using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public interface IRoleService
    {
        bool Add(RoleDto dto);
        RoleDto GetById(int roleID);
        bool Delete(int roleID);
        bool DeleteMulti(string roleIDs);
        bool Delete(RoleDto dto);
        bool Update(RoleDto dto);
        ResultDto<T> GetPageData<T, TKey>(int pageSize, int pageIndex, Expression<Func<T, bool>> whereExp, Expression<Func<T, TKey>> orderExp, bool isDesc = true) where T : class;
        ResultDto<RoleDto> GetList();
    }
}
