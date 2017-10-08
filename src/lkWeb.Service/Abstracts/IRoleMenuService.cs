using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public interface IRoleMenuService
    {
        /// <summary>
        /// 批量删除rolemenu
        /// </summary>
        /// <param name="exp">条件表达式</param>
        /// <returns></returns>
        bool Delete(int roleId);

        /// <summary>
        /// 批量添加rolemenu
        /// </summary>
        /// <param name="models">rolemenu集合</param>
        /// <returns></returns>
        bool Add(List<RoleMenuDto> models);
        ResultDto<RoleMenuDto> GetList(int roleID);
     }
}
