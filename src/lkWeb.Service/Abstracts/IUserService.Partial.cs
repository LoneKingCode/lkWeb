
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IUserService
    {
		 /// <summary>
        /// 添加user
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        bool Add(UserDto dto);
		/// <summary>
        /// 批量添加user
        /// </summary>
        /// <param name="dto">user实体集合</param>
        /// <returns></returns>
        bool Add(List<UserDto> dtos);
        /// <summary>
        /// 根据id获取user数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        UserDto GetById(int id);
        /// <summary>
        /// 根据id删除user数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除user数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        bool Delete(UserDto dto);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        bool Update(UserDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">user实体集合</param>
        /// <returns></returns>
	    bool Update(List<UserDto> dtos);
	}
}

