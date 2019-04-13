using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Service.Base.Dto;

namespace lkWeb.Service.Dto
{
    /// <summary>
    /// 用户角色关系DTO
    /// </summary>
    public class Sys_UserRoleDto : BaseDto
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 角色ID
        /// </summary>
        public int RoleId { get; set; }
    }
}
