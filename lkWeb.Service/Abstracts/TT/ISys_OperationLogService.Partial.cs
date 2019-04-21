using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ISys_OperationLogService
    {
	  /// <summary>
        /// 添加单个sys_operationlog
        /// </summary>
        /// <param name="dto">sys_operationlog实体</param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> AddAsync(Sys_OperationLogDto dto);
        /// <summary>
        /// 批量添加sys_operationlog
        /// </summary>
        /// <param name="dto">sys_operationlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_OperationLogDto>>> AddAsync(List<Sys_OperationLogDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_operationlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> GetByExpAsync(Expression<Func<Sys_OperationLogDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_operationlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_operationlog数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_OperationLogDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_operationlog实体</param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> DeleteAsync(Sys_OperationLogDto dto);
        /// <summary>
        /// 根据条件删除sys_operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> DeleteAsync(Expression<Func<Sys_OperationLogDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_operationlog实体</param>
        /// <returns></returns>
        Task<Result<Sys_OperationLogDto>> UpdateAsync(Sys_OperationLogDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_operationlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_OperationLogDto>>> UpdateAsync(List<Sys_OperationLogDto> dtos);
        /// <summary>
        /// 获取sys_operationlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_OperationLogDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_OperationLogDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_OperationLogDto>> GetListAsync(Expression<Func<Sys_OperationLogDto, bool>> queryExp);
	}
}

