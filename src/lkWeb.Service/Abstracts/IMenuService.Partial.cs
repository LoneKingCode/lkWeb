
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IMenuService
    {
		 /// <summary>
        /// 添加menu
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        bool Add(MenuDto dto);
		/// <summary>
        /// 批量添加menu
        /// </summary>
        /// <param name="dto">menu实体集合</param>
        /// <returns></returns>
        bool Add(List<MenuDto> dtos);
        /// <summary>
        /// 根据id获取menu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        MenuDto GetById(int id);
        /// <summary>
        /// 根据id删除menu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除menu数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        bool Delete(MenuDto dto);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        bool Update(MenuDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">menu实体集合</param>
        /// <returns></returns>
	    bool Update(List<MenuDto> dtos);
		  /// <summary>
        /// 获取分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="orderExp">orderExp</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="isAsc">是否升序</param>
        /// <returns></returns>
        ResultDto<MenuDto> GetPageData<Tkey>(QueryBase queryBase, Expression<Func<MenuDto, Tkey>> orderExp, Expression<Func<MenuDto, bool>> queryExp, bool isAsc);
	}
}







