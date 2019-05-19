using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Admin.Areas.Admin.Models
{
    public class AuthMenuModel
    {
        public List<int> RoleIds { get; set; }

        public List<int> MenuIds { get; set; }
    }
}
