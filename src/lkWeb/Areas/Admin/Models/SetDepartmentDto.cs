﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Areas.Admin.Models
{
    public class SetDepartmentDto
    {
        public List<int> UserIDs{ get; set; }

        public int DepartmentID { get; set; }
    }
}