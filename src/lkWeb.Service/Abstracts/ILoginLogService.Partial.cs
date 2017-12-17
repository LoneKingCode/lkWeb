
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface ILoginLogService
    {
		 /// <summary>
        /// 添加loginlog
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        bool Add(LoginLogDto dto);
		/// <summary>
        /// 批量添加loginlog
        /// </summary>
        /// <param name="dto">loginlog实体集合</param>
        /// <returns></returns>
        bool Add(List<LoginLogDto> dtos);
        /// <summary>
        /// 根据id获取loginlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        LoginLogDto GetById(int id);
        /// <summary>
        /// 根据id删除loginlog数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// 批量删除loginlog数据
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        bool DeleteMulti(List<int> ids);
        /// <summary>
        /// 删除单个数据
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        bool Delete(LoginLogDto dto);
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        bool Update(LoginLogDto dto);
		     /// <summary>
        /// 批量更新数据
        /// </summary>
        /// <param name="dto">loginlog实体集合</param>
        /// <returns></returns>
	    bool Update(List<LoginLogDto> dtos);
	}
}

