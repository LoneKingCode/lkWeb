
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IRoleService
    {
		 /// <summary>
        /// 添加role
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        bool Add(RoleDto dto);
		/// <summary>
        /// 批量添加role
        /// </summary>
        /// <param name="dto">role实体集合</param>
        /// <returns></returns>
        bool Add(List<RoleDto> dtos);
        /// <summary>
        /// 根据id获取role数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        RoleDto GetById(int id);
        /// <summary>
        /// 根据id删除role数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除role数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        bool Delete(RoleDto dto);
        /// <summary>
        /// 根据条件删除role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        bool Delete(Expression<Func<RoleDto,bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        bool Update(RoleDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">role实体集合</param>
        /// <returns></returns>
	    bool Update(List<RoleDto> dtos);
		         /// <summary>
        /// 获取role分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        ResultDto<RoleDto> GetPageData(QueryBase queryBase, Expression<Func<RoleDto, bool>> queryExp, string orderBy, string orderDir);
 		/// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        ResultDto<RoleDto> GetList(Expression<Func<RoleDto,bool>> queryExp);
	}
}







