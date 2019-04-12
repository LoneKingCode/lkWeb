
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IMenuService
    {
	  /// <summary>
        /// 添加单个menu
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        Task<Result<MenuDto>> AddAsync(MenuDto dto);
        /// <summary>
        /// 批量添加menu
        /// </summary>
        /// <param name="dto">menu实体集合</param>
        /// <returns></returns>
        Task<Result<List<MenuDto>>> AddAsync(List<MenuDto> dtos);
        /// <summary>
        /// 根据id获取单个menu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<MenuDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个menu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<MenuDto>> GetByExpAsync(Expression<Func<MenuDto, bool>> exp);
        /// <summary>
        /// 根据id删除menu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<MenuDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除menu数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<MenuDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        Task<Result<MenuDto>> DeleteAsync(MenuDto dto);
        /// <summary>
        /// 根据条件删除menu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<MenuDto>> DeleteAsync(Expression<Func<MenuDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        Task<Result<MenuDto>> UpdateAsync(MenuDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">menu实体集合</param>
        /// <returns></returns>
        Task<Result<List<MenuDto>>> UpdateAsync(List<MenuDto> dtos);
        /// <summary>
        /// 获取menu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<MenuDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<MenuDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<MenuDto>> GetListAsync(Expression<Func<MenuDto, bool>> queryExp);
	}
}

