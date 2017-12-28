using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Entity
{
    public class OperationLogEntity:BaseEntity
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 登陆账户
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 操作页面地址
        /// </summary>
        public string OperationUrl { get; set; }

        /// <summary>
        /// 操作说明
        /// </summary>
        public string OperationDescription { get; set; }

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
