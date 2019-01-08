using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class TestLeaderEntity : BaseEntity
    {
        /// <summary>
        /// 领导名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        ///  上级领导
        /// </summary>

        public int  ParentId { get; set; }
        /// <summary>
        /// 测试字段
        /// </summary>
        public string Test { get; set; }
        /// <summary>
        /// 测试字段
        /// </summary>
        public string Test1 { get; set; }
        /// <summary>
        /// 测试字段
        /// </summary>
        public string Test2 { get; set; }
    }
}
