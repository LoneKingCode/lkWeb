using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Areas.Admin.Models
{
    public class SetRoleModel
    {
        public List<int> UserIds{ get; set; }

        public int RoleId { get; set; }
    }
}
