using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class Sys_SubSystemEntity : BaseEntity
    {
        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        ///  描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 分类
        /// </summary>
        public int TypeId { get; set; }
        /// <summary>
        /// 显示顺序
        /// </summary>
        public int ListOrder { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        public string Icon { get; set; }
        /// <summary>
        /// 是否隐藏
        /// </summary>
        public byte IsHide { get; set; }

    }

}
