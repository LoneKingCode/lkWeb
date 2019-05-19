using lkWeb.Models.System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Admin.Areas.Admin.Models
{
    public class SubSystemViewModel
    {
        public string UserName { get; set; }
        public string RealName { get; set; }
        public IList<Sys_SubSystemTypeDto> subSystemType;
        public Dictionary<int, IList<Sys_SubSystemDto>> subSystem; //key为TypeId
    }
}
