using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class UserRoleEntity : IdentityUserRole<int> {

        /// <summary>
        ///     identity默认是没有这个id的
        /// </summary>
        public int Id { get; set; }
    }

}
