using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class UserEntity : BaseEntity
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
        /// 状态
        /// </summary>
        public byte Status { get; set; }

     
    }
}
