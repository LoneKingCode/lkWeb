 
using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_TableColumnService
    {
	  /// <summary>
        /// 添加单个sys_tablecolumn
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体</param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> AddAsync(Sys_TableColumnDto dto);
        /// <summary>
        /// 批量添加sys_tablecolumn
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_TableColumnDto>>> AddAsync(List<Sys_TableColumnDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_tablecolumn数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> GetByExpAsync(Expression<Func<Sys_TableColumnDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_tablecolumn数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_tablecolumn数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_TableColumnDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体</param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> DeleteAsync(Sys_TableColumnDto dto);
        /// <summary>
        /// 根据条件删除sys_tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> DeleteAsync(Expression<Func<Sys_TableColumnDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体</param>
        /// <returns></returns>
        Task<Result<Sys_TableColumnDto>> UpdateAsync(Sys_TableColumnDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_TableColumnDto>>> UpdateAsync(List<Sys_TableColumnDto> dtos);
        /// <summary>
        /// 获取sys_tablecolumn分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_TableColumnDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_TableColumnDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_TableColumnDto>> GetListAsync(Expression<Func<Sys_TableColumnDto, bool>> queryExp);
	}
}

