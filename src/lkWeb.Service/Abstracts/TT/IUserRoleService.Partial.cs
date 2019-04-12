
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IUserRoleService
    {
	  /// <summary>
        /// 添加单个userrole
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> AddAsync(UserRoleDto dto);
        /// <summary>
        /// 批量添加userrole
        /// </summary>
        /// <param name="dto">userrole实体集合</param>
        /// <returns></returns>
        Task<Result<List<UserRoleDto>>> AddAsync(List<UserRoleDto> dtos);
        /// <summary>
        /// 根据id获取单个userrole数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> GetByExpAsync(Expression<Func<UserRoleDto, bool>> exp);
        /// <summary>
        /// 根据id删除userrole数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除userrole数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<UserRoleDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> DeleteAsync(UserRoleDto dto);
        /// <summary>
        /// 根据条件删除userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> DeleteAsync(Expression<Func<UserRoleDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        Task<Result<UserRoleDto>> UpdateAsync(UserRoleDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">userrole实体集合</param>
        /// <returns></returns>
        Task<Result<List<UserRoleDto>>> UpdateAsync(List<UserRoleDto> dtos);
        /// <summary>
        /// 获取userrole分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<UserRoleDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<UserRoleDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<UserRoleDto>> GetListAsync(Expression<Func<UserRoleDto, bool>> queryExp);
	}
}

