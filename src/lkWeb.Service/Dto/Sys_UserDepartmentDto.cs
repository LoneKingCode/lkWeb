using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Service.Base.Dto;

namespace lkWeb.Service.Dto
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
