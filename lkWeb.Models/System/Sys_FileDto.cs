using lkWeb.Models.System.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Models.System
{
    public class Sys_FileDto:BaseDto
    {
        /// <summary>
        /// 文件名
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        ///  描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 文件类型
        /// </summary>
        public string FileType { get; set; }
        /// <summary>
        /// 文件地址
        /// </summary>
        public string FileUrl { get; set; }
    }
}
