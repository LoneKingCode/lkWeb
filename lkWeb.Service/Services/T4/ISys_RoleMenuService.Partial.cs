 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_RoleMenuService
    {
	  /// <summary>
        /// 添加单个sys_rolemenu
        /// </summary>
        /// <param name="dto">sys_rolemenu实体</param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> AddAsync(Sys_RoleMenuDto dto);
        /// <summary>
        /// 批量添加sys_rolemenu
        /// </summary>
        /// <param name="dto">sys_rolemenu实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_RoleMenuDto>>> AddAsync(List<Sys_RoleMenuDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_rolemenu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_rolemenu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> GetByExpAsync(Expression<Func<Sys_RoleMenuDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_rolemenu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_rolemenu数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_RoleMenuDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_rolemenu实体</param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> DeleteAsync(Sys_RoleMenuDto dto);
        /// <summary>
        /// 根据条件删除sys_rolemenu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> DeleteAsync(Expression<Func<Sys_RoleMenuDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_rolemenu实体</param>
        /// <returns></returns>
        Task<Result<Sys_RoleMenuDto>> UpdateAsync(Sys_RoleMenuDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_rolemenu实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_RoleMenuDto>>> UpdateAsync(List<Sys_RoleMenuDto> dtos);
        /// <summary>
        /// 获取sys_rolemenu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_RoleMenuDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_RoleMenuDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_RoleMenuDto>> GetListAsync(Expression<Func<Sys_RoleMenuDto, bool>> queryExp);
	}
}

