using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class DepartmentEntity : BaseEntity
    {
        /// <summary>
        /// 部门名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 部门描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 负责人
        /// </summary>
        public string Leader { get; set; }
        /// <summary>
        /// 上级部门
        /// </summary>
        public int ParentId { get; set; }

        /// <summary>
        /// 部门用户
        /// </summary>
        public virtual ICollection<UserDepartmentEntity> UserDepartments { get; set; }
    }
}
