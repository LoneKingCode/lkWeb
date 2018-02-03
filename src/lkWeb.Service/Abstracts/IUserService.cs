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
        Result<string> Logout();
        Result<UserDto> _GetById(int id);
        Result<UserDto> _Add(UserDto dto);
        Result<UserDto> _Update(UserDto dto);
        Result<UserDto> _Delete(UserDto dto);
        Result<UserDto> _Delete(int id);
        Result<UserDto> _DeleteMulti(List<int> ids);
        Result<UserDto> AddRoles(int userID, List<int> roleIds);
        Result<UserDto> RemoveRoles(int userID, List<int> roleIds);

        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Result<UserDto> Login(UserDto dto);
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        Result<UserDto> Register(UserDto dto);
        /// <summary>
        /// 获取用户菜单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        List<MenuDto> GetUserMenu(int id);
        /// <summary>
        /// 获取用户角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        ResultDto<RoleDto> GetUserRoles(int id);
        /// <summary>
        /// 获取不是用户所属的角色数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        ResultDto<RoleDto> GetNotUserRoles(int id);
    }
}
