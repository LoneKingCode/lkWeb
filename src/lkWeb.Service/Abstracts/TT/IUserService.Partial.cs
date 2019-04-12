
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IUserService
    {
	  /// <summary>
        /// 添加单个user
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<UserDto>> AddAsync(UserDto dto);
        /// <summary>
        /// 批量添加user
        /// </summary>
        /// <param name="dto">user实体集合</param>
        /// <returns></returns>
        Task<Result<List<UserDto>>> AddAsync(List<UserDto> dtos);
        /// <summary>
        /// 根据id获取单个user数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<UserDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<UserDto>> GetByExpAsync(Expression<Func<UserDto, bool>> exp);
        /// <summary>
        /// 根据id删除user数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<UserDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除user数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<UserDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<UserDto>> DeleteAsync(UserDto dto);
        /// <summary>
        /// 根据条件删除user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<UserDto>> DeleteAsync(Expression<Func<UserDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<UserDto>> UpdateAsync(UserDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">user实体集合</param>
        /// <returns></returns>
        Task<Result<List<UserDto>>> UpdateAsync(List<UserDto> dtos);
        /// <summary>
        /// 获取user分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<UserDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<UserDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<UserDto>> GetListAsync(Expression<Func<UserDto, bool>> queryExp);
	}
}

