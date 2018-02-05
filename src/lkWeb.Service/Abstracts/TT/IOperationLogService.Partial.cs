
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IOperationLogService
    {
	  /// <summary>
        /// 添加operationlog
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        Task<Result<OperationLogDto>> Add(OperationLogDto dto);
        /// <summary>
        /// 批量添加operationlog
        /// </summary>
        /// <param name="dto">operationlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<OperationLogDto>>> Add(List<OperationLogDto> dtos);
        /// <summary>
        /// 根据id获取operationlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<OperationLogDto>> GetById(int id);
        /// <summary>
        /// 根据id删除operationlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<OperationLogDto>> Delete(int id);
        /// <summary>
        /// 批量删除operationlog数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<OperationLogDto>>> Delete(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        Task<Result<OperationLogDto>> Delete(OperationLogDto dto);
        /// <summary>
        /// 根据条件删除operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<OperationLogDto>> Delete(Expression<Func<OperationLogDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        Task<Result<OperationLogDto>> Update(OperationLogDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">operationlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<OperationLogDto>>> Update(List<OperationLogDto> dtos);
        /// <summary>
        /// 获取operationlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<OperationLogDto>> GetPageData(QueryBase queryBase,
            Expression<Func<OperationLogDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<OperationLogDto>> GetList(Expression<Func<OperationLogDto, bool>> queryExp);
	}
}

