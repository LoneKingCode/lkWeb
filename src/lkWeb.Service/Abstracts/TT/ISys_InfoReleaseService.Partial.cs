using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ISys_InfoReleaseService
    {
	  /// <summary>
        /// 添加单个sys_inforelease
        /// </summary>
        /// <param name="dto">sys_inforelease实体</param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> AddAsync(Sys_InfoReleaseDto dto);
        /// <summary>
        /// 批量添加sys_inforelease
        /// </summary>
        /// <param name="dto">sys_inforelease实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_InfoReleaseDto>>> AddAsync(List<Sys_InfoReleaseDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_inforelease数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_inforelease数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> GetByExpAsync(Expression<Func<Sys_InfoReleaseDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_inforelease数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_inforelease数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_InfoReleaseDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_inforelease实体</param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> DeleteAsync(Sys_InfoReleaseDto dto);
        /// <summary>
        /// 根据条件删除sys_inforelease数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> DeleteAsync(Expression<Func<Sys_InfoReleaseDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_inforelease实体</param>
        /// <returns></returns>
        Task<Result<Sys_InfoReleaseDto>> UpdateAsync(Sys_InfoReleaseDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_inforelease实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_InfoReleaseDto>>> UpdateAsync(List<Sys_InfoReleaseDto> dtos);
        /// <summary>
        /// 获取sys_inforelease分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_InfoReleaseDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_InfoReleaseDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_InfoReleaseDto>> GetListAsync(Expression<Func<Sys_InfoReleaseDto, bool>> queryExp);
	}
}

