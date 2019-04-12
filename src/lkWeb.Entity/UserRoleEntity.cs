using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class UserRoleEntity:BaseEntity
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
