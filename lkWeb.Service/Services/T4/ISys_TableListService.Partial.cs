 
using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_TableListService
    {
	  /// <summary>
        /// 添加单个sys_tablelist
        /// </summary>
        /// <param name="dto">sys_tablelist实体</param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> AddAsync(Sys_TableListDto dto);
        /// <summary>
        /// 批量添加sys_tablelist
        /// </summary>
        /// <param name="dto">sys_tablelist实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_TableListDto>>> AddAsync(List<Sys_TableListDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_tablelist数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> GetByExpAsync(Expression<Func<Sys_TableListDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_tablelist数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_tablelist数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_TableListDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_tablelist实体</param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> DeleteAsync(Sys_TableListDto dto);
        /// <summary>
        /// 根据条件删除sys_tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> DeleteAsync(Expression<Func<Sys_TableListDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_tablelist实体</param>
        /// <returns></returns>
        Task<Result<Sys_TableListDto>> UpdateAsync(Sys_TableListDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_tablelist实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_TableListDto>>> UpdateAsync(List<Sys_TableListDto> dtos);
        /// <summary>
        /// 获取sys_tablelist分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_TableListDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_TableListDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_TableListDto>> GetListAsync(Expression<Func<Sys_TableListDto, bool>> queryExp);
	}
}

