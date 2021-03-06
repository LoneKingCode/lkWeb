 
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_InfoTypeService
    {
	  /// <summary>
        /// 添加单个sys_infotype
        /// </summary>
        /// <param name="dto">sys_infotype实体</param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> AddAsync(Sys_InfoTypeDto dto);
        /// <summary>
        /// 批量添加sys_infotype
        /// </summary>
        /// <param name="dto">sys_infotype实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_InfoTypeDto>>> AddAsync(List<Sys_InfoTypeDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_infotype数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_infotype数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> GetByExpAsync(Expression<Func<Sys_InfoTypeDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_infotype数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_infotype数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_InfoTypeDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_infotype实体</param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> DeleteAsync(Sys_InfoTypeDto dto);
        /// <summary>
        /// 根据条件删除sys_infotype数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> DeleteAsync(Expression<Func<Sys_InfoTypeDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_infotype实体</param>
        /// <returns></returns>
        Task<Result<Sys_InfoTypeDto>> UpdateAsync(Sys_InfoTypeDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_infotype实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_InfoTypeDto>>> UpdateAsync(List<Sys_InfoTypeDto> dtos);
        /// <summary>
        /// 获取sys_infotype分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<PageResult<Sys_InfoTypeDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_InfoTypeDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<PageResult<Sys_InfoTypeDto>> GetListAsync(Expression<Func<Sys_InfoTypeDto, bool>> queryExp);
	}
}

