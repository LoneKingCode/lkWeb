
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IRoleMenuService
    {
		 /// <summary>
        /// 添加rolemenu
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        bool Add(RoleMenuDto dto);
		/// <summary>
        /// 批量添加rolemenu
        /// </summary>
        /// <param name="dto">rolemenu实体集合</param>
        /// <returns></returns>
        bool Add(List<RoleMenuDto> dtos);
        /// <summary>
        /// 根据id获取rolemenu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        RoleMenuDto GetById(int id);
        /// <summary>
        /// 根据id删除rolemenu数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除rolemenu数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        bool Delete(RoleMenuDto dto);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        bool Update(RoleMenuDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">rolemenu实体集合</param>
        /// <returns></returns>
	    bool Update(List<RoleMenuDto> dtos);
	}
}







