using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IRoleMenuService
    {
        ResultDto<RoleMenuDto> GetList(int roleID);
     }
}
