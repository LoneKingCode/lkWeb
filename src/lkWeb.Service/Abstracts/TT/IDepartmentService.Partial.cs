
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IDepartmentService
    {
	  /// <summary>
        /// 添加单个department
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> AddAsync(DepartmentDto dto);
        /// <summary>
        /// 批量添加department
        /// </summary>
        /// <param name="dto">department实体集合</param>
        /// <returns></returns>
        Task<Result<List<DepartmentDto>>> AddAsync(List<DepartmentDto> dtos);
        /// <summary>
        /// 根据id获取单个department数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> GetByExpAsync(Expression<Func<DepartmentDto, bool>> exp);
        /// <summary>
        /// 根据id删除department数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除department数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<DepartmentDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> DeleteAsync(DepartmentDto dto);
        /// <summary>
        /// 根据条件删除department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> DeleteAsync(Expression<Func<DepartmentDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> UpdateAsync(DepartmentDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">department实体集合</param>
        /// <returns></returns>
        Task<Result<List<DepartmentDto>>> UpdateAsync(List<DepartmentDto> dtos);
        /// <summary>
        /// 获取department分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<DepartmentDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<DepartmentDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<DepartmentDto>> GetListAsync(Expression<Func<DepartmentDto, bool>> queryExp);
	}
}

