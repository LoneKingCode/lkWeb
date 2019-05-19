using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
    /// <summary>
    /// 角色菜单关系DTO
    /// </summary>
    public class Sys_RoleMenuDto : BaseDto
    {
        /// <summary>
        /// 角色ID
        /// </summary>
        public int RoleId { get; set; }

        /// <summary>
        /// 菜单ID
        /// </summary>
        public int MenuId { get; set; }
    }
}
