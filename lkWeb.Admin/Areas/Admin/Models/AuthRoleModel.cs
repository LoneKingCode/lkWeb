using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Admin.Areas.Admin.Models
{
    public class AuthRoleModel
    {
        public int UserId { get; set; }
        public List<int> RoleIds { get; set; }
    }
}
