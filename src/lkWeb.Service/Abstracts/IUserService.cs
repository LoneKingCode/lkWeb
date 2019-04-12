using lkWeb.Entity;
using lkWeb.Service.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial interface IUserService
    {
        //以下都为.net core identity中usermanage中的操作
        Result<string> Logout();

        Task<Result<List<UserRoleDto>>> AddRoles(int userID, List<int> roleIds);
        Task<Result<UserRoleDto>> RemoveRoles(int userID, List<int> roleIds);
        Result<UserDto> GetCurrentUser();
    
        //Task<Result<UserDto>> UserLogin(UserDto dto);
        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<UserDto>> Login(UserDto dto);
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Task<Result<UserDto>> Register(UserDto dto);
        /// <summary>
        /// 获取用户菜单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<Result<List<MenuDto>>> GetUserMenu(int id);
        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<ResultDto<RoleDto>> GetUserRoles(int id);
        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<ResultDto<RoleDto>> GetNotUserRoles(int id);
    }
}
