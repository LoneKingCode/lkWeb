using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Dto
{
  public  class SystemOptionDto : BaseDto
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
