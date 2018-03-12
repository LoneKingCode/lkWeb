
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ITableColumnService
    {
	  /// <summary>
        /// 添加单个tablecolumn
        /// </summary>
        /// <param name="dto">tablecolumn实体</param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> Add(TableColumnDto dto);
        /// <summary>
        /// 批量添加tablecolumn
        /// </summary>
        /// <param name="dto">tablecolumn实体集合</param>
        /// <returns></returns>
        Task<Result<List<TableColumnDto>>> Add(List<TableColumnDto> dtos);
        /// <summary>
        /// 根据id获取单个tablecolumn数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> GetById(int id);
		 /// <summary>
        /// 根据条件获取单个tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> GetByExp(Expression<Func<TableColumnDto, bool>> exp);
        /// <summary>
        /// 根据id删除tablecolumn数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> Delete(int id);
        /// <summary>
        /// 批量删除tablecolumn数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<TableColumnDto>>> Delete(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">tablecolumn实体</param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> Delete(TableColumnDto dto);
        /// <summary>
        /// 根据条件删除tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> Delete(Expression<Func<TableColumnDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">tablecolumn实体</param>
        /// <returns></returns>
        Task<Result<TableColumnDto>> Update(TableColumnDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">tablecolumn实体集合</param>
        /// <returns></returns>
        Task<Result<List<TableColumnDto>>> Update(List<TableColumnDto> dtos);
        /// <summary>
        /// 获取tablecolumn分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<TableColumnDto>> GetPageData(QueryBase queryBase,
            Expression<Func<TableColumnDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<TableColumnDto>> GetList(Expression<Func<TableColumnDto, bool>> queryExp);
	}
}

