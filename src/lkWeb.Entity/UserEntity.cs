using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class UserEntity : IdentityUser<int>
    {
        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public byte Status { get; set; }

        /// <summary>
        /// 用户所在的部门
        /// </summary>
        public virtual ICollection<UserDepartmentEntity> UserDepartments { get; set; }
    }
}
