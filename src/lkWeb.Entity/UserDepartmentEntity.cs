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
        public int DepartmentId { get; set; }
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }
    

    }
}
