﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Service.Dto
{
    public class OperationLogDto:BaseDto
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public string UserId { get; set; }

        /// <summary>
        /// 操作页面地址
        /// </summary>
        public string OperationUrl { get; set; }
        /// <summary>
        /// 操作说明
        /// </summary>
        public string OperationDesciption { get; set; }

        /// <summary>
        /// 登录IP地址
        /// </summary>
        public string ClientIP { get; set; }

        /// <summary>
        /// 电脑的MAC地址
        /// </summary>
        public string ClientMac { get; set; }
    }
}
