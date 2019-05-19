using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
    public class Sys_UserDepartmentDto : BaseDto
    {
        /// <summary>
        /// 部门ID
        /// </summary>
        public int DepartmentId { get; set; }

        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }
    }
}
