using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class AppUser : IdentityUser
    {
        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public byte Status { get; set; }
    }
}
