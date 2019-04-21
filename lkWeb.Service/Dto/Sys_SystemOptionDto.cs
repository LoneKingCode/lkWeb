using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Service.Base.Dto;

namespace lkWeb.Service.Dto
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
