 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_UserDepartmentService
    {
	  /// <summary>
        /// 添加单个sys_userdepartment
        /// </summary>
        /// <param name="dto">sys_userdepartment实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> AddAsync(Sys_UserDepartmentDto dto);
        /// <summary>
        /// 批量添加sys_userdepartment
        /// </summary>
        /// <param name="dto">sys_userdepartment实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserDepartmentDto>>> AddAsync(List<Sys_UserDepartmentDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_userdepartment数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> GetByExpAsync(Expression<Func<Sys_UserDepartmentDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_userdepartment数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_userdepartment数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserDepartmentDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_userdepartment实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> DeleteAsync(Sys_UserDepartmentDto dto);
        /// <summary>
        /// 根据条件删除sys_userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> DeleteAsync(Expression<Func<Sys_UserDepartmentDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_userdepartment实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDepartmentDto>> UpdateAsync(Sys_UserDepartmentDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_userdepartment实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserDepartmentDto>>> UpdateAsync(List<Sys_UserDepartmentDto> dtos);
        /// <summary>
        /// 获取sys_userdepartment分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_UserDepartmentDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_UserDepartmentDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_UserDepartmentDto>> GetListAsync(Expression<Func<Sys_UserDepartmentDto, bool>> queryExp);
	}
}

