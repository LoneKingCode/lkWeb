
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IUserRoleService
    {
		 /// <summary>
        /// 添加userrole
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        bool Add(UserRoleDto dto);
		/// <summary>
        /// 批量添加userrole
        /// </summary>
        /// <param name="dto">userrole实体集合</param>
        /// <returns></returns>
        bool Add(List<UserRoleDto> dtos);
        /// <summary>
        /// 根据id获取userrole数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        UserRoleDto GetById(int id);
        /// <summary>
        /// 根据id删除userrole数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除userrole数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        bool Delete(UserRoleDto dto);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        bool Update(UserRoleDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">userrole实体集合</param>
        /// <returns></returns>
	    bool Update(List<UserRoleDto> dtos);
	}
}

