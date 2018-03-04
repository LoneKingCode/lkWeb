using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Dto
{
    public class UrlParameter
    {
        public int moduleId { get; set; }
        public int menuId { get; set; }
        public int btnId { get; set; }
        public int id { get; set; }
        public List<int> ids { get; set; }
    }
}
