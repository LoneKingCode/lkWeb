
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
        /// 添加department
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> Add(DepartmentDto dto);
        /// <summary>
        /// 批量添加department
        /// </summary>
        /// <param name="dto">department实体集合</param>
        /// <returns></returns>
        Task<Result<List<DepartmentDto>>> Add(List<DepartmentDto> dtos);
        /// <summary>
        /// 根据id获取department数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> GetById(int id);
        /// <summary>
        /// 根据id删除department数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> Delete(int id);
        /// <summary>
        /// 批量删除department数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<DepartmentDto>>> Delete(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> Delete(DepartmentDto dto);
        /// <summary>
        /// 根据条件删除department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> Delete(Expression<Func<DepartmentDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        Task<Result<DepartmentDto>> Update(DepartmentDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">department实体集合</param>
        /// <returns></returns>
        Task<Result<List<DepartmentDto>>> Update(List<DepartmentDto> dtos);
        /// <summary>
        /// 获取department分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<DepartmentDto>> GetPageData(QueryBase queryBase,
            Expression<Func<DepartmentDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<DepartmentDto>> GetList(Expression<Func<DepartmentDto, bool>> queryExp);
	}
}

