using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Areas.Admin.Models
{
    public class SetDepartmentModel
    {
        public List<int> UserIds{ get; set; }

        public int DepartmentId { get; set; }
    }
}
