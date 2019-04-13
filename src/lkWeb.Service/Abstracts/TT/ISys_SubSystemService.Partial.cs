using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ISys_SubSystemService
    {
	  /// <summary>
        /// 添加单个sys_subsystem
        /// </summary>
        /// <param name="dto">sys_subsystem实体</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> AddAsync(Sys_SubSystemDto dto);
        /// <summary>
        /// 批量添加sys_subsystem
        /// </summary>
        /// <param name="dto">sys_subsystem实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_SubSystemDto>>> AddAsync(List<Sys_SubSystemDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_subsystem数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_subsystem数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> GetByExpAsync(Expression<Func<Sys_SubSystemDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_subsystem数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_subsystem数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_SubSystemDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_subsystem实体</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> DeleteAsync(Sys_SubSystemDto dto);
        /// <summary>
        /// 根据条件删除sys_subsystem数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> DeleteAsync(Expression<Func<Sys_SubSystemDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_subsystem实体</param>
        /// <returns></returns>
        Task<Result<Sys_SubSystemDto>> UpdateAsync(Sys_SubSystemDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_subsystem实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_SubSystemDto>>> UpdateAsync(List<Sys_SubSystemDto> dtos);
        /// <summary>
        /// 获取sys_subsystem分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_SubSystemDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_SubSystemDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_SubSystemDto>> GetListAsync(Expression<Func<Sys_SubSystemDto, bool>> queryExp);
	}
}

