using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Models.System
{
    public class UrlParameter
    {
        public int id { get; set; }
        public List<int> ids { get; set; }
        /// <summary>
        /// 作为额外补充的值
        /// </summary>
        public string extraValue { get; set; }
    }
}
