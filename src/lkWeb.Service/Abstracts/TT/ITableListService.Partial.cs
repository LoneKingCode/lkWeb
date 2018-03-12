
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ITableListService
    {
	  /// <summary>
        /// 添加单个tablelist
        /// </summary>
        /// <param name="dto">tablelist实体</param>
        /// <returns></returns>
        Task<Result<TableListDto>> Add(TableListDto dto);
        /// <summary>
        /// 批量添加tablelist
        /// </summary>
        /// <param name="dto">tablelist实体集合</param>
        /// <returns></returns>
        Task<Result<List<TableListDto>>> Add(List<TableListDto> dtos);
        /// <summary>
        /// 根据id获取单个tablelist数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<TableListDto>> GetById(int id);
		 /// <summary>
        /// 根据条件获取单个tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<TableListDto>> GetByExp(Expression<Func<TableListDto, bool>> exp);
        /// <summary>
        /// 根据id删除tablelist数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<TableListDto>> Delete(int id);
        /// <summary>
        /// 批量删除tablelist数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<TableListDto>>> Delete(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">tablelist实体</param>
        /// <returns></returns>
        Task<Result<TableListDto>> Delete(TableListDto dto);
        /// <summary>
        /// 根据条件删除tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<TableListDto>> Delete(Expression<Func<TableListDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">tablelist实体</param>
        /// <returns></returns>
        Task<Result<TableListDto>> Update(TableListDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">tablelist实体集合</param>
        /// <returns></returns>
        Task<Result<List<TableListDto>>> Update(List<TableListDto> dtos);
        /// <summary>
        /// 获取tablelist分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<TableListDto>> GetPageData(QueryBase queryBase,
            Expression<Func<TableListDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<TableListDto>> GetList(Expression<Func<TableListDto, bool>> queryExp);
	}
}

