using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Areas.Admin.Models
{
    public class AuthRoleDto
    {
        public int UserId { get; set; }
        public List<int> RoleIds { get; set; }
    }
}
