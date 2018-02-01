using System;

namespace lkWeb.Entity.Base
{
    public class BaseEntity
    {
        public BaseEntity()
        {
            CreateDateTime = DateTime.Now;
        }

        /// <summary>
        /// 主键
        /// </summary>
        public int Id { get; set; }


        /// <summary>
        /// 创建日期
        /// </summary>
        public DateTime CreateDateTime { get; set; }
    }
}
