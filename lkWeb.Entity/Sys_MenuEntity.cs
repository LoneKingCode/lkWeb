using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Entity
{
    /// <summary>
    /// 菜单实体
    /// </summary>
    public class Sys_MenuEntity : BaseEntity
    {

        /// <summary>
        /// 上级ID
        /// </summary>
        public int ParentId { get; set; }

        /// <summary>
        /// 所属子系统
        /// </summary>
        public string SubSystemId { get; set; }

        /// <summary>
        /// 类型
        /// </summary>
        public byte Type { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// URL
        /// </summary>
        public string Url { get; set; }

        /// <summary>
        /// 菜单图标
        /// </summary>
        public string Icon { get; set; }

        /// <summary>
        /// 排序越大越靠后
        /// </summary>
        public int ListOrder { get; set; }
    }
}
