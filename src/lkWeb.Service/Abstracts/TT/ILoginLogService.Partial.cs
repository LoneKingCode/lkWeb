
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ILoginLogService
    {
	  /// <summary>
        /// 添加单个loginlog
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> AddAsync(LoginLogDto dto);
        /// <summary>
        /// 批量添加loginlog
        /// </summary>
        /// <param name="dto">loginlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<LoginLogDto>>> AddAsync(List<LoginLogDto> dtos);
        /// <summary>
        /// 根据id获取单个loginlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个loginlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> GetByExpAsync(Expression<Func<LoginLogDto, bool>> exp);
        /// <summary>
        /// 根据id删除loginlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除loginlog数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<LoginLogDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> DeleteAsync(LoginLogDto dto);
        /// <summary>
        /// 根据条件删除loginlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> DeleteAsync(Expression<Func<LoginLogDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        Task<Result<LoginLogDto>> UpdateAsync(LoginLogDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">loginlog实体集合</param>
        /// <returns></returns>
        Task<Result<List<LoginLogDto>>> UpdateAsync(List<LoginLogDto> dtos);
        /// <summary>
        /// 获取loginlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<LoginLogDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<LoginLogDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<LoginLogDto>> GetListAsync(Expression<Func<LoginLogDto, bool>> queryExp);
	}
}

