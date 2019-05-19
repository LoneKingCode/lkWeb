 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_UserService
    {
	  /// <summary>
        /// 添加单个sys_user
        /// </summary>
        /// <param name="dto">sys_user实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> AddAsync(Sys_UserDto dto);
        /// <summary>
        /// 批量添加sys_user
        /// </summary>
        /// <param name="dto">sys_user实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserDto>>> AddAsync(List<Sys_UserDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_user数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> GetByExpAsync(Expression<Func<Sys_UserDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_user数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_user数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_user实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> DeleteAsync(Sys_UserDto dto);
        /// <summary>
        /// 根据条件删除sys_user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> DeleteAsync(Expression<Func<Sys_UserDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_user实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> UpdateAsync(Sys_UserDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_user实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_UserDto>>> UpdateAsync(List<Sys_UserDto> dtos);
        /// <summary>
        /// 获取sys_user分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_UserDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_UserDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_UserDto>> GetListAsync(Expression<Func<Sys_UserDto, bool>> queryExp);
	}
}

