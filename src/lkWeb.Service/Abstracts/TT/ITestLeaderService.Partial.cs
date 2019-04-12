
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ITestLeaderService
    {
	  /// <summary>
        /// 添加单个testleader
        /// </summary>
        /// <param name="dto">testleader实体</param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> AddAsync(TestLeaderDto dto);
        /// <summary>
        /// 批量添加testleader
        /// </summary>
        /// <param name="dto">testleader实体集合</param>
        /// <returns></returns>
        Task<Result<List<TestLeaderDto>>> AddAsync(List<TestLeaderDto> dtos);
        /// <summary>
        /// 根据id获取单个testleader数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> GetByIdAsync(int id);
		 /// <summary>
        /// 根据条件获取单个testleader数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> GetByExpAsync(Expression<Func<TestLeaderDto, bool>> exp);
        /// <summary>
        /// 根据id删除testleader数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> DeleteAsync(int id);
        /// <summary>
        /// 批量删除testleader数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        Task<Result<List<TestLeaderDto>>> DeleteAsync(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">testleader实体</param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> DeleteAsync(TestLeaderDto dto);
        /// <summary>
        /// 根据条件删除testleader数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> DeleteAsync(Expression<Func<TestLeaderDto, bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">testleader实体</param>
        /// <returns></returns>
        Task<Result<TestLeaderDto>> UpdateAsync(TestLeaderDto dto);
        /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">testleader实体集合</param>
        /// <returns></returns>
        Task<Result<List<TestLeaderDto>>> UpdateAsync(List<TestLeaderDto> dtos);
        /// <summary>
        /// 获取testleader分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        Task<ResultDto<TestLeaderDto>> GetPageDataAsync(QueryBase queryBase,
            Expression<Func<TestLeaderDto, bool>> queryExp, string orderBy, string orderDir);
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        Task<ResultDto<TestLeaderDto>> GetListAsync(Expression<Func<TestLeaderDto, bool>> queryExp);
	}
}

