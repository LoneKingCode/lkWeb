
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
	}
}


