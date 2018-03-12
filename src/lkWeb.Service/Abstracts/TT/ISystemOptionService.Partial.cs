
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
        Task<Result<SystemOptionDto>> Add(SystemOptionDto dto);
        /// <summary>
        /// 批量添加systemoption
        /// </summary>
        /// <param name="dto">systemoption实体集合</param>
        /// <returns></returns>
        Task<Result<List<SystemOptionDto>>> Add(List<SystemOptionDto> dtos);
        /// <summary>
        /// 根据id获取单个systemoption数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> GetById(int id);
		 /// <summary>
        /// 根据条件获取单个systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> GetByExp(Expression<Func<SystemOptionDto, bool>> exp);
        /// <summary>
        /// 根据id删除systemoption数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> Delete(int id);
        /// <summary>
        /// 批量删除systemoption数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<SystemOptionDto>>> Delete(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> Delete(SystemOptionDto dto);
        /// <summary>
        /// 根据条件删除systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> Delete(Expression<Func<SystemOptionDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        Task<Result<SystemOptionDto>> Update(SystemOptionDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">systemoption实体集合</param>
        /// <returns></returns>
        Task<Result<List<SystemOptionDto>>> Update(List<SystemOptionDto> dtos);
        /// <summary>
        /// 获取systemoption分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<SystemOptionDto>> GetPageData(QueryBase queryBase,
            Expression<Func<SystemOptionDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<SystemOptionDto>> GetList(Expression<Func<SystemOptionDto, bool>> queryExp);
	}
}

