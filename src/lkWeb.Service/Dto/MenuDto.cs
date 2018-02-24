using lkWeb.Service.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Service.Dto
{
    /// <summary>
    /// 菜单DTO
    /// </summary>
    public class MenuDto : BaseDto
    {
        /// <summary>
        /// 上级ID
        /// </summary>
        [DisplayName("上级菜单")]
        public int ParentId { get; set; }

        /// <summary>
        /// 所属模块ID
        /// </summary>
        [DisplayName("所属模块")]
        public int ModuleID { get; set; }
        /// <summary>
        /// 类型
        /// </summary>
        [DisplayName("类型")]
        public MenuType Type { get; set; }

        /// <summary>
        /// 类型名称
        /// </summary>
        public string TypeName
        {
            get { return Type.ToString(); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        [DisplayName("名称")]
        public string Name { get; set; }

        /// <summary>
        /// URL
        /// </summary>
        [DisplayName("URL")]
        public string Url { get; set; }

        [DisplayName("排序")]
        public int ListOrder { get; set; }
    }
}
