using Hangfire.Dashboard;
using lkWeb.Service.Abstracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Filter
{
    public class HangfireAuthorizationFilter : IDashboardAuthorizationFilter
    {
        //这里需要配置权限规则
        public bool Authorize(DashboardContext context)
        {
            var _userService = ServiceLocator.Get<IUserService>();
            var userResult = _userService.GetCurrentUser().Result;
            //如果未登录
            if (!userResult.flag)
            {
                return false;
            }
            else
            {
                var user = userResult.data;
                var roles = _userService.GetUserRoles(user.Id).Result.data.Select(item => item.Name).ToList();
                if (roles.Contains("超级管理员"))
                    return true;
            }

            return false;
        }
    }
}
