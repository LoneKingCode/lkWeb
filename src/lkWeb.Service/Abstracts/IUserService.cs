using lkWeb.Entity;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public interface IUserService
    {
        bool AddUser(UserDto dto);
        Result<UserDto> Login(UserDto dto);
        UserDto GetById(int userID);
        bool Delete(int userID);
        bool Delete(UserDto dto);
        bool Update(UserDto dto);
        ResultDto<T> GetPageData<T, TKey>(int pageSize, int pageIndex, Expression<Func<T, bool>> whereExp, Expression<Func<T, TKey>> orderExp, bool isDesc = true) where T : class;
    }
}
