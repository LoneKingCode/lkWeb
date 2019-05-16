using lkWeb.Entity;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace lkWeb.Service.Services
{
    public partial interface ISys_UserService
    {

        Result<string> Logout();
        Task<Result<Sys_UserDto>> UserLogin(Sys_UserDto dto);
        Task<Result<List<Sys_UserRoleDto>>> AddRoles(int userId, List<int> roleIds);
        Task<Result<Sys_UserRoleDto>> RemoveRoles(int userId, List<int> roleIds);
        Result<Sys_UserDto> GetCurrentUser();

        //Task<Result<UserDto>> UserLogin(UserDto dto);
        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> Login(Sys_UserDto dto);
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<Sys_UserDto>> Register(Sys_UserDto dto);
        /// <summary>
        /// 获取用户菜单数据
        /// </summary>
        /// <param name="sysId">子系统Id</param>
        /// <returns></returns>
        Task<Result<List<Sys_MenuDto>>> GetUserMenu(int sysId);

        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="userId">userId</param>
        /// <returns></returns>
        Task<ResultDto<Sys_RoleDto>> GetUserRoles(int userId);
        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="userId">userId</param>
        /// <returns></returns>
        Task<ResultDto<Sys_RoleDto>> GetNotUserRoles(int userId);
    }
}
