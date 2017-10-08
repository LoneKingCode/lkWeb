using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Areas.Admin.Models
{
    public class AuthMenuDto
    {
        public List<int> RoleIds { get; set; }

        public List<int> MenuIds { get; set; }
    }
}
