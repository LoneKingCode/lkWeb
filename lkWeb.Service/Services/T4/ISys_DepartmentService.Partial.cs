 
using lkWeb.Service.Base.Dto;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_DepartmentService
    {
	  /// <summary>
        /// 添加单个sys_department
        /// </summary>
        /// <param name="dto">sys_department实体</param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> AddAsync(Sys_DepartmentDto dto);
        /// <summary>
        /// 批量添加sys_department
        /// </summary>
        /// <param name="dto">sys_department实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_DepartmentDto>>> AddAsync(List<Sys_DepartmentDto> dtos);
        /// <summary>
        /// 根据id获取单个sys_department数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个sys_department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> GetByExpAsync(Expression<Func<Sys_DepartmentDto, bool>> exp);
        /// <summary>
        /// 根据id删除sys_department数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除sys_department数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_DepartmentDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">sys_department实体</param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> DeleteAsync(Sys_DepartmentDto dto);
        /// <summary>
        /// 根据条件删除sys_department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> DeleteAsync(Expression<Func<Sys_DepartmentDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_department实体</param>
        /// <returns></returns>
        Task<Result<Sys_DepartmentDto>> UpdateAsync(Sys_DepartmentDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">sys_department实体集合</param>
        /// <returns></returns>
        Task<Result<List<Sys_DepartmentDto>>> UpdateAsync(List<Sys_DepartmentDto> dtos);
        /// <summary>
        /// 获取sys_department分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<Sys_DepartmentDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<Sys_DepartmentDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<Sys_DepartmentDto>> GetListAsync(Expression<Func<Sys_DepartmentDto, bool>> queryExp);
	}
}

