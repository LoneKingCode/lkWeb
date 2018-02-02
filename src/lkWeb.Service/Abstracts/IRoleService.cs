using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial interface IRoleService
    {
        Result<RoleDto> _GetById(int id);
        Result<RoleDto> _Add(RoleDto dto);
        Result<RoleDto> _Update(RoleDto dto);
        Result<RoleDto> _Delete(RoleDto dto);
        Result<RoleDto> _Delete(int id);
        Result<RoleDto> _DeleteMulti(List<int> ids);
    }
}
