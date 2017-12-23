using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class UserDepartmentEntity : BaseEntity
    {
        /// <summary>
        /// 部门ID
        /// </summary>
        public int DepartmentID { get; set; }
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserID { get; set; }
        /// <summary>
        /// 用户
        /// </summary>
        public virtual UserEntity User{ get; set; }
        /// <summary>
        /// 部门
        /// </summary>
        public virtual DepartmentEntity Department { get; set; }

    }
}
