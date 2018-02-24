using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class RoleEntity : IdentityRole<int>
    {
        /// <summary>
        ///  角色描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 角色菜单权限
        /// </summary>
        public virtual ICollection<RoleMenuEntity> RoleMenus { get; set; }
    }

}
