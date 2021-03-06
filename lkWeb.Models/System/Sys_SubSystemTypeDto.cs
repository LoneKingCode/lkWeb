﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
    /// <summary>
    /// 子系统分类DTO
    /// </summary>
    public class Sys_SubSystemTypeDto: BaseDto
    {
        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }
 
     }
}
