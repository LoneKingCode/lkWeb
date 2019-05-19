
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Models.Enum;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
    /// <summary>
    /// 用户DTO
    /// </summary>
    public class Sys_UserDto: BaseDto
    {
        /// <summary>
        /// 登录账号
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 登录密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 用户状态
        /// </summary>
        public UserStatus Status { get; set; }

        /// <summary>
        /// 状态名称
        /// </summary>
        public string StatusName
        {
            get { return Status.ToString(); }
        }


        /// <summary>
        /// 旧密码
        /// </summary>

        public string OldPassword { get; set; }

        /// <summary>
        /// 记住我
        /// </summary>
        public bool IsRememberMe { get; set; }
    }
}
