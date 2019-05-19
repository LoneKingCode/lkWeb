using lkWeb.Models.System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Admin.Areas.Admin.Models
{
    public class ViewListModel
    {
        /// <summary>
        /// 列集合
        /// </summary>
        public List<Sys_TableColumnDto> TableColumn { get; set; }
        /// <summary>
        /// 所属表
        /// </summary>
        public Sys_TableListDto Table { get; set; }

    }
}
