using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Service.Dto
{
    /// <summary>
    /// 用户登录日志DTO
    /// </summary>
    public class LoginLogDto : BaseDto
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 登录账号
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 登录IP地址
        /// </summary>
        public string ClientIP { get; set; }

        /// <summary>
        /// 电脑的MAC地址
        /// </summary>
        public string ClientMac { get; set; }

        /// <summary>
        /// 说明
        /// </summary>
        public string Description { get; set; }
    }
}
