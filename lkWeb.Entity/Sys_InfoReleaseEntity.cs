using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class Sys_InfoReleaseEntity : BaseEntity
    {
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 类型
        /// </summary>
        public int TypeId { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string InfoContent { get; set; }
        /// <summary>
        /// 查看次数
        /// </summary>
        public int ViewTime { get; set; }
        /// <summary>
        /// 创建人
        /// </summary>
        public int Creator { get; set; }
    }
}
