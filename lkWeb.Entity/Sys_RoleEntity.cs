using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class Sys_RoleEntity : BaseEntity
    {
        /// <summary>
        /// 角色名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        ///  角色描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 子系统id
        /// </summary>
        public int SubSystemId { get; set; }
    }

}
