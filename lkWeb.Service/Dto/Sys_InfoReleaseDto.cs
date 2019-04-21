using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Service.Base.Dto;

namespace lkWeb.Service.Dto
{
  public  class Sys_InfoReleaseDto : BaseDto
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
