
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ISystemOptionService
    {
	  /// <summary>
        /// 添加单个systemoption
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> AddAsync(SystemOptionDto dto);
        /// <summary>
        /// 批量添加systemoption
        /// </summary>
        /// <param name="dto">systemoption实体集合</param>
        /// <returns></returns>
        Task<Result<List<SystemOptionDto>>> AddAsync(List<SystemOptionDto> dtos);
        /// <summary>
        /// 根据id获取单个systemoption数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> GetByExpAsync(Expression<Func<SystemOptionDto, bool>> exp);
        /// <summary>
        /// 根据id删除systemoption数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除systemoption数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<SystemOptionDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> DeleteAsync(SystemOptionDto dto);
        /// <summary>
        /// 根据条件删除systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> DeleteAsync(Expression<Func<SystemOptionDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> UpdateAsync(SystemOptionDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">systemoption实体集合</param>
        /// <returns></returns>
        Task<Result<List<SystemOptionDto>>> UpdateAsync(List<SystemOptionDto> dtos);
        /// <summary>
        /// 获取systemoption分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<SystemOptionDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<SystemOptionDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<SystemOptionDto>> GetListAsync(Expression<Func<SystemOptionDto, bool>> queryExp);
	}
}

