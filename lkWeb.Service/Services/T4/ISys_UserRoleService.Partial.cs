 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_UserRoleService
    {
	  /// <summary>
        /// 添加单个sys_userrole
        /// </summary>
        /// <param name="dto">sys_userrole实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> AddAsync(Sys_UserRoleDto dto);
        /// <summary>
        /// 批量添加sys_userrole
        /// </summary>
        /// <param name="dto">sys_userrole实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserRoleDto>>> AddAsync(List<Sys_UserRoleDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_userrole数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> GetByExpAsync(Expression<Func<Sys_UserRoleDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_userrole数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_userrole数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserRoleDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_userrole实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> DeleteAsync(Sys_UserRoleDto dto);
        /// <summary>
        /// 根据条件删除sys_userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> DeleteAsync(Expression<Func<Sys_UserRoleDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_userrole实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserRoleDto>> UpdateAsync(Sys_UserRoleDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_userrole实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserRoleDto>>> UpdateAsync(List<Sys_UserRoleDto> dtos);
        /// <summary>
        /// 获取sys_userrole分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_UserRoleDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_UserRoleDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_UserRoleDto>> GetListAsync(Expression<Func<Sys_UserRoleDto, bool>> queryExp);
	}
}

