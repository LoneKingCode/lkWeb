using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public interface IUserRoleService
    {
        bool Add(UserRoleDto dto);
        UserRoleDto GetById(int roleID);
        bool Delete(int roleID);
        bool Delete(UserRoleDto dto);
        bool Update(UserRoleDto dto);
        ResultDto<T> GetPageData<T, TKey>(int pageSize, int pageIndex, Expression<Func<T, bool>> whereExp, Expression<Func<T, TKey>> orderExp, bool isDesc = true) where T : class;
    }
}
