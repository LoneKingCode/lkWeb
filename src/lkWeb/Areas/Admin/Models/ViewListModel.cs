using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Areas.Admin.Models
{
    public class ViewListModel
    {
        /// <summary>
        /// 表头
        /// </summary>
        public List<string> TableHeader { get; set; }

        /// <summary>
        /// 列
        /// </summary>
        public List<string> TableColumn { get; set; }
    }
}
