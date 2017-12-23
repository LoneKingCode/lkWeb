using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace lkWeb.Service.Dto
{
    public class DepartmentDto : BaseDto
    {
        /// <summary>
        /// 部门名称
        /// </summary>
        [Required, DisplayName("角色名称"), MinLength(2), MaxLength(20)]
        public string Name { get; set; }

        /// <summary>
        /// 部门描述
        /// </summary>
        [Required, DisplayName("描述"), MinLength(1), MaxLength(200)]
        public string Description { get; set; }

        /// <summary>
        /// 上级部门
        /// </summary>
        [DisplayName("上级部门")]
        public int ParentID { get; set; }

    }
}
