using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Entity
{
    /// <summary>
    /// 角色实体
    /// </summary>
    public class RoleEntity : BaseEntity
    {

        /// <summary>
        /// 角色名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 角色菜单权限
        /// </summary>
        public virtual ICollection<RoleMenuEntity> RoleMenus { get; set; }

        /// <summary>
        /// 用户角色
        /// </summary>
        public virtual ICollection<UserRoleEntity> UserRoles { get; set; }
    }
}
