 
using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_RoleService
    {
	  /// <summary>
        /// 添加单个sys_role
        /// </summary>
        /// <param name="dto">sys_role实体</param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> AddAsync(Sys_RoleDto dto);
        /// <summary>
        /// 批量添加sys_role
        /// </summary>
        /// <param name="dto">sys_role实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_RoleDto>>> AddAsync(List<Sys_RoleDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_role数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> GetByExpAsync(Expression<Func<Sys_RoleDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_role数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_role数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_RoleDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_role实体</param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> DeleteAsync(Sys_RoleDto dto);
        /// <summary>
        /// 根据条件删除sys_role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> DeleteAsync(Expression<Func<Sys_RoleDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_role实体</param>
        /// <returns></returns>
        Task<Result<Sys_RoleDto>> UpdateAsync(Sys_RoleDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_role实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_RoleDto>>> UpdateAsync(List<Sys_RoleDto> dtos);
        /// <summary>
        /// 获取sys_role分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_RoleDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_RoleDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_RoleDto>> GetListAsync(Expression<Func<Sys_RoleDto, bool>> queryExp);
	}
}

