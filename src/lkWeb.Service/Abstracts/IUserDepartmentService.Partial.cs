
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IUserDepartmentService
    {
		 /// <summary>
        /// 添加userdepartment
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        bool Add(UserDepartmentDto dto);
		/// <summary>
        /// 批量添加userdepartment
        /// </summary>
        /// <param name="dto">userdepartment实体集合</param>
        /// <returns></returns>
        bool Add(List<UserDepartmentDto> dtos);
        /// <summary>
        /// 根据id获取userdepartment数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        UserDepartmentDto GetById(int id);
        /// <summary>
        /// 根据id删除userdepartment数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除userdepartment数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        bool Delete(UserDepartmentDto dto);
        /// <summary>
        /// 根据条件删除userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        bool Delete(Expression<Func<UserDepartmentDto,bool>> exp);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        bool Update(UserDepartmentDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">userdepartment实体集合</param>
        /// <returns></returns>
	    bool Update(List<UserDepartmentDto> dtos);
		         /// <summary>
        /// 获取userdepartment分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        ResultDto<UserDepartmentDto> GetPageData(QueryBase queryBase, Expression<Func<UserDepartmentDto, bool>> queryExp, string orderBy, string orderDir);
 		/// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        ResultDto<UserDepartmentDto> GetList(Expression<Func<UserDepartmentDto,bool>> queryExp);
	}
}







