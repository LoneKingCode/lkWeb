using lkWeb.Entity;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface ISys_UserService
    {
        //以下都为.net core identity中usermanage中的操作
        Result<string> Logout();

        Task<Result<List<Sys_UserRoleDto>>> AddRoles(int userID, List<int> roleIds);
        Task<Result<Sys_UserRoleDto>> RemoveRoles(int userID, List<int> roleIds);
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
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<List<Sys_MenuDto>>> GetUserMenu(int id);
        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<ResultDto<Sys_RoleDto>> GetUserRoles(int id);
        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<ResultDto<Sys_RoleDto>> GetNotUserRoles(int id);
    }
}
