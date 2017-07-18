using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Entity
{
    /// <summary>
    /// 角色菜单关系实体
    /// </summary>
    public class RoleMenuEntity : BaseEntity
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
