using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
  public  class Sys_SystemOptionDto : BaseDto
    {
        /// <summary>
        /// 代码
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 值
        /// </summary>
        public string Value { get; set; }
    }
}
