using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Admin.Areas.Admin.Models
{
    /// <summary>
    /// Jquery.DataTable 返回的数据格式
    /// </summary>
    public class DataTableModel
    {
        public int draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public object data { get; set; }
    }
}
