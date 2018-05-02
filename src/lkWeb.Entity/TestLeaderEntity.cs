using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class TestLeaderEntity : BaseEntity
    {
        public int ParentId { get; set; }
        public string Type { get; set; }
        public string Name { get; set; }
    }
}
