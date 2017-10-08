using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public interface IMenuService
    {
        bool Add(MenuDto dto);
        MenuDto GetById(int menuID);
        bool Delete(int menuID);
        bool DeleteMulti(string menuIDs);
        bool Delete(MenuDto dto);
        bool Update(MenuDto dto);
        ResultDto<T> GetPageData<T, TKey>(int pageSize, int pageIndex, Expression<Func<T, bool>> whereExp, Expression<Func<T, TKey>> orderExp, bool isDesc = true) where T : class;
        ResultDto<MenuDto> GetList();
      }
}
