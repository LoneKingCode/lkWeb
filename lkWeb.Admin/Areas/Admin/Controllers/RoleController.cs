using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Services;
using lkWeb.Models.System;
using lkWeb.Admin.Areas.Admin.Models;
using System.Linq.Expressions;
using lkWeb.Core.Extensions;
using Microsoft.AspNetCore.Identity;
using lkWeb.Entity;
using lkWeb.Filter;
using Microsoft.AspNetCore.Mvc.Rendering;
using lkWeb.Models;
using lkWeb.Models.Enum;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class RoleController : AdminBaseController
    {
        public readonly ISys_RoleService _roleService;
        public readonly ISys_MenuService _menuService;
        public readonly ISys_RoleMenuService _roleMenuService;
        public readonly ISys_UserService _userService;
        public readonly ISys_UserRoleService _userRoleService;
        public readonly ISys_SubSystemService _subSystemService;

        public RoleController(ISys_RoleService roleService,
           ISys_MenuService menuService,
           ISys_RoleMenuService roleMenuService,
           ISys_UserService userService,
            ISys_SubSystemService subSystemService,
             ISys_UserRoleService userRoleService)
        {
            _roleService = roleService;
            _menuService = menuService;
            _roleMenuService = roleMenuService;
            _userService = userService;
            _subSystemService = subSystemService;
            _userRoleService = userRoleService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public async Task<IActionResult> User(UrlParameter param)
        {
            var result = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.subSystem = new SelectList(result.data, "Id", "Name");
            return View();
        }
        public IActionResult SelectUser(UrlParameter param)
        {
            ViewBag.RoleId = param.id;
            return View();
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var result = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.subSystem = new SelectList(result.data, "Id", "Name");
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var role = (await _roleService.GetByIdAsync(param.id)).data;
            var result = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.subSystem = new SelectList(result.data, "Id", "Name", role.SubSystemId);
            return View(role);
        }
        public async Task<IActionResult> Authen(UrlParameter param)
        {
            var result = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.subSystem = new SelectList(result.data, "Id", "Name");
            return View();
        }
        #endregion

        #region Ajax

        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<Sys_RoleDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.Ext_IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey));
            var result = await _roleService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var subSystemsResult = await _subSystemService.GetListAsync(x => x.Id > 0);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = result.recordsTotal,
                recordsFiltered = result.recordsTotal,
                data = result.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    name = d.Name,
                    subSystem = subSystemsResult.data.Where(x => x.Id == d.SubSystemId).FirstOrDefault().Name,
                    description = d.Description,
                    id = d.Id.ToString(),
                })
            };
            return Json(data);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, Sys_RoleDto role)
        {
            var result = await _roleService.UpdateAsync(role);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, Sys_RoleDto role)
        {
            var result = await _roleService.AddAsync(role);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _roleService.DeleteAsync(param.ids));
            else
                return Json(await _roleService.DeleteAsync(param.id));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetRoleList(UrlParameter param)
        {
            var result = await _roleService.GetListAsync(item => item.SubSystemId == param.id);
            var strData = result.data.Select(d => new
            {
                id = d.Id,
                pid = 0,
                name = d.Name
            });
            return Json(strData);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetMenuList(UrlParameter param)
        {
            var result = new List<object>();
            //菜单属于多个子系统
            var allMenuList = (await _menuService.GetListAsync(item => item.Id > 0)).data;
            var menuIds = new List<int>();
            foreach (var item in allMenuList)
            {
                if (string.IsNullOrEmpty(item.SubSystemId))
                    continue;
                if (item.SubSystemId.Ext_Split(',').ToList().Contains(param.id.ToString()))
                    menuIds.Add(item.Id);
            }
            var menuList = (await _menuService.GetListAsync(item => menuIds.Contains(item.Id))).data;
            var menus = menuList.Select(d => new
            {
                id = d.Id.ToString(),
                pId = d.ParentId,
                name = d.Name,
                open = d.Type == MenuType.模块
            });

            result.AddRange(menus);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetRoleMenus(int roleId)
        {
            var result = await _roleMenuService.GetListAsync(item => item.RoleId == roleId);
            var strData = result.data.Select(d => new
            {
                id = d.Id,
                menuId = d.MenuId,
                recordsTotal = result.recordsTotal
            });
            return Json(strData);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AuthMenus(UrlParameter param, AuthMenuModel model)
        {
            var result = new Result<Sys_RoleMenuDto>();
            foreach (var roleId in model.RoleIds)
            {
                var exist = (await _roleMenuService.GetListAsync(item => item.RoleId == roleId)).data.Count > 0;

                var delResult = await _roleMenuService.DeleteAsync(item => item.RoleId == roleId);
                if (!delResult.flag && exist)
                    result.msg += delResult.msg + "\n";
                if (model.MenuIds != null)
                {
                    if (model.MenuIds.Any())
                    {
                        var newRoleMenus = model.MenuIds.Select(item => new Sys_RoleMenuDto { RoleId = roleId, MenuId = item }).ToList();
                        var addResult = await _roleMenuService.AddAsync(newRoleMenus);
                        if (!addResult.flag)
                            result.msg += addResult.msg + "\n";
                        result.flag = addResult.flag && !(delResult.flag ^ exist); //((!delResult.flag && !exist) || (delResult.flag && exist))
                    }
                    else
                    {
                        result.flag = true; //清空权限 没设置有菜单
                    }
                }
                else
                {
                    result.flag = true;
                }
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetUserListByRole(QueryBase queryBase)
        {
            if (queryBase.Value.Ext_IsEmpty())
                return Json(new { });
            var roleId = queryBase.Value.Ext_ToInt32();
            var users = (await _userRoleService.GetListAsync(item => item.Id > 0 && item.RoleId == roleId))
                .data.Select(item => item.UserId).ToList();
            Expression<Func<Sys_UserDto, bool>> queryExp = item => item.Id > 0 && users.Contains(item.Id);
            var dto = await _userService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var result = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    realName = d.RealName,
                    email = d.Email,
                    statusName = d.StatusName,
                    id = d.Id.ToString(),
                })
            };
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetUserListByNotRole(QueryBase queryBase)
        {
            if (queryBase.Value.Ext_IsEmpty())
                return Json(new { });
            var roleId = Convert.ToInt32(queryBase.Value);
            var users = (await _userRoleService.GetListAsync(item => item.Id > 0 && item.RoleId == roleId))
                .data.Select(item => item.UserId).ToList();
            Expression<Func<Sys_UserDto, bool>> queryExp = item => item.Id > 0 && !users.Contains(item.Id);
            var dto = await _userService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var result = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    realName = d.RealName,
                    email = d.Email,
                    statusName = d.StatusName,
                    id = d.Id.ToString(),
                })
            };
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetUserRole(SetRoleModel dto)
        {
            var dtos = new List<Sys_UserRoleDto>();
            foreach (int userId in dto.UserIds)
            {
                dtos.Add(new Sys_UserRoleDto
                {
                    UserId = userId,
                    RoleId = dto.RoleId
                });
            }

            var result = await _userRoleService.AddAsync(dtos);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DelUserRole(SetRoleModel model)
        {
            var result = await _userRoleService.DeleteAsync(
                item => model.UserIds.Contains(item.UserId)
                && item.RoleId == model.RoleId);
            return Json(result);
        }
        #endregion
    }
}
