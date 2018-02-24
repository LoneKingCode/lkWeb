using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Dto
{
    public class ModuleDto : BaseDto
    {
        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        ///  模块描述
        /// </summary>

        public string Description { get; set; }
    }
}
