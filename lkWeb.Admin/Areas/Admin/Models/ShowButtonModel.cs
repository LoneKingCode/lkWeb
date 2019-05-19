using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Admin.Areas.Admin.Models
{
    public class ShowButtonModel
    {
        /// <summary>
        /// 是否显示添加按钮
        /// </summary>
        public bool ShowAddBtn{ get; set; }
        /// <summary>
        /// 是否显示编辑按钮
        /// </summary>
        public bool ShowEditBtn { get; set; }
        /// <summary>
        /// 是否显示删除按钮
        /// </summary>
        public bool ShowDelBtn { get; set; }
        /// <summary>
        /// 是否显示导入按钮
        /// </summary>
        public bool ShowImportBtn { get; set; }
        /// <summary>
        /// 是否显示导出按钮
        /// </summary>
        public bool ShowExportBtn { get; set; }
        /// <summary>
        /// 是否查看详情
        /// </summary>
        public bool ShowDetailBtn { get; set; }
        /// <summary>
        /// 顶部扩展方法
        /// </summary>
        public string TopExtendFunction { get; set; }

    }
}
