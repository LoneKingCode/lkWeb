using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Entity
{
    /// <summary>
    /// 用户实体
    /// </summary>

    public class UserEntity : BaseEntity
    {

        /// <summary>
        /// 登录账号
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 登录密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public byte Status { get; set; }

        /// <summary>
        /// 用户拥有的角色
        /// </summary>
        public virtual ICollection<UserRoleEntity> UserRoles { get; set; }

        /// <summary>
        /// 用户所在的部门
        /// </summary>
        public virtual ICollection<UserDepartmentEntity> UserDepartments { get; set; }


    }
}
