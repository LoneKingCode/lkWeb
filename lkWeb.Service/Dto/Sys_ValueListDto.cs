using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Service.Base.Dto;

namespace lkWeb.Service.Dto
{
  public  class Sys_ValueListDto : BaseDto
    {
        /// <summary>
        /// 代码
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 值
        /// </summary>
        public string Value { get; set; }
        public int ParentId { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 说明
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 列表顺序
        /// </summary>
        public int ListOrder { get; set; }
    }
}
