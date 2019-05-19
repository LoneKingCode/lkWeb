 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_ValueListService
    {
	  /// <summary>
        /// 添加单个sys_valuelist
        /// </summary>
        /// <param name="dto">sys_valuelist实体</param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> AddAsync(Sys_ValueListDto dto);
        /// <summary>
        /// 批量添加sys_valuelist
        /// </summary>
        /// <param name="dto">sys_valuelist实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_ValueListDto>>> AddAsync(List<Sys_ValueListDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_valuelist数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_valuelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> GetByExpAsync(Expression<Func<Sys_ValueListDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_valuelist数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_valuelist数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_ValueListDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_valuelist实体</param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> DeleteAsync(Sys_ValueListDto dto);
        /// <summary>
        /// 根据条件删除sys_valuelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> DeleteAsync(Expression<Func<Sys_ValueListDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_valuelist实体</param>
        /// <returns></returns>
        Task<Result<Sys_ValueListDto>> UpdateAsync(Sys_ValueListDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_valuelist实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_ValueListDto>>> UpdateAsync(List<Sys_ValueListDto> dtos);
        /// <summary>
        /// 获取sys_valuelist分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_ValueListDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_ValueListDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_ValueListDto>> GetListAsync(Expression<Func<Sys_ValueListDto, bool>> queryExp);
	}
}

