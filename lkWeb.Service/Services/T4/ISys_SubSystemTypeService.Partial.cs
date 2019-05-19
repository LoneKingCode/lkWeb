 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_SubSystemTypeService
    {
	  /// <summary>
        /// 添加单个sys_subsystemtype
        /// </summary>
        /// <param name="dto">sys_subsystemtype实体</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> AddAsync(Sys_SubSystemTypeDto dto);
        /// <summary>
        /// 批量添加sys_subsystemtype
        /// </summary>
        /// <param name="dto">sys_subsystemtype实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_SubSystemTypeDto>>> AddAsync(List<Sys_SubSystemTypeDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_subsystemtype数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_subsystemtype数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> GetByExpAsync(Expression<Func<Sys_SubSystemTypeDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_subsystemtype数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_subsystemtype数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_SubSystemTypeDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_subsystemtype实体</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> DeleteAsync(Sys_SubSystemTypeDto dto);
        /// <summary>
        /// 根据条件删除sys_subsystemtype数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> DeleteAsync(Expression<Func<Sys_SubSystemTypeDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_subsystemtype实体</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemTypeDto>> UpdateAsync(Sys_SubSystemTypeDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_subsystemtype实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_SubSystemTypeDto>>> UpdateAsync(List<Sys_SubSystemTypeDto> dtos);
        /// <summary>
        /// 获取sys_subsystemtype分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_SubSystemTypeDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_SubSystemTypeDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_SubSystemTypeDto>> GetListAsync(Expression<Func<Sys_SubSystemTypeDto, bool>> queryExp);
	}
}

