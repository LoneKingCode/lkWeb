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
        Task<Result<string>> Logout();
        Task<Result<UserDto>> _GetById(int id);
        Task<Result<UserDto>> _Add(UserDto dto);
        Task<Result<UserDto>> _Update(UserDto dto);
        Task<Result<UserDto>> _Delete(UserDto dto);
        Task<Result<UserDto>> _Delete(int id);
        Task<Result<UserDto>> _Delete(List<int> ids);
        Task<Result<UserDto>> AddRoles(int userID, List<int> roleIds);
        Task<Result<UserDto>> RemoveRoles(int userID, List<int> roleIds);
        Task<Result<UserDto>> GetCurrentUser();

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
