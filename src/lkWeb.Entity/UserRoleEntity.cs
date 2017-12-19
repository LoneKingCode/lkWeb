using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Entity
{
    /// <summary>
    /// 用户角色关系实体
    /// </summary>
    public class UserRoleEntity : BaseEntity
    {

        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 角色ID
        /// </summary>
        public int RoleId { get; set; }

        /// <summary>
        /// 所属用户  virtual开启lazyload
        /// </summary>
        public virtual UserEntity User { get; set; }

        /// <summary>
        /// 所属角色
        /// </summary>
        public virtual RoleEntity Role { get; set; }
    }
}
