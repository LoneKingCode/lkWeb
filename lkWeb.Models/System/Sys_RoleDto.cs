using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
    /// <summary>
    /// 角色DTO
    /// </summary>
    public class Sys_RoleDto: BaseDto
    {
        /// <summary>
        /// 角色名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 角色描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 子系统id
        /// </summary>
        public int SubSystemId { get; set; }

    }
}
