using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ISys_LoginLogService
    {
	  /// <summary>
        /// 添加单个sys_loginlog
        /// </summary>
        /// <param name="dto">sys_loginlog实体</param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> AddAsync(Sys_LoginLogDto dto);
        /// <summary>
        /// 批量添加sys_loginlog
        /// </summary>
        /// <param name="dto">sys_loginlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_LoginLogDto>>> AddAsync(List<Sys_LoginLogDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_loginlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_loginlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> GetByExpAsync(Expression<Func<Sys_LoginLogDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_loginlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_loginlog数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_LoginLogDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_loginlog实体</param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> DeleteAsync(Sys_LoginLogDto dto);
        /// <summary>
        /// 根据条件删除sys_loginlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> DeleteAsync(Expression<Func<Sys_LoginLogDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_loginlog实体</param>
        /// <returns></returns>
        Task<Result<Sys_LoginLogDto>> UpdateAsync(Sys_LoginLogDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_loginlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_LoginLogDto>>> UpdateAsync(List<Sys_LoginLogDto> dtos);
        /// <summary>
        /// 获取sys_loginlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_LoginLogDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_LoginLogDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_LoginLogDto>> GetListAsync(Expression<Func<Sys_LoginLogDto, bool>> queryExp);
	}
}

