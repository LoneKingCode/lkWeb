
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IModuleService
    {
	  /// <summary>
        /// 添加module
        /// </summary>
        /// <param name="dto">module实体</param>
        /// <returns></returns>
        Task<Result<ModuleDto>> Add(ModuleDto dto);
        /// <summary>
        /// 批量添加module
        /// </summary>
        /// <param name="dto">module实体集合</param>
        /// <returns></returns>
        Task<Result<List<ModuleDto>>> Add(List<ModuleDto> dtos);
        /// <summary>
        /// 根据id获取module数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<ModuleDto>> GetById(int id);
        /// <summary>
        /// 根据id删除module数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<ModuleDto>> Delete(int id);
        /// <summary>
        /// 批量删除module数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<ModuleDto>>> Delete(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">module实体</param>
        /// <returns></returns>
        Task<Result<ModuleDto>> Delete(ModuleDto dto);
        /// <summary>
        /// 根据条件删除module数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<ModuleDto>> Delete(Expression<Func<ModuleDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">module实体</param>
        /// <returns></returns>
        Task<Result<ModuleDto>> Update(ModuleDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">module实体集合</param>
        /// <returns></returns>
        Task<Result<List<ModuleDto>>> Update(List<ModuleDto> dtos);
        /// <summary>
        /// 获取module分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<ModuleDto>> GetPageData(QueryBase queryBase,
            Expression<Func<ModuleDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<ModuleDto>> GetList(Expression<Func<ModuleDto, bool>> queryExp);
	}
}

