using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Areas.Admin.Models;
using System.Linq.Expressions;
using lkWeb.Core.Extension;
using Microsoft.AspNetCore.Identity;
using lkWeb.Entity;
using lkWeb.Filter;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class RoleController : AdminBaseController
    {
        public readonly IRoleService _roleService;
        public readonly IMenuService _menuService;
        public readonly IRoleMenuService _roleMenuService;
        public readonly IModuleService _moduleService;
        public readonly IUserService _userService;
        public RoleController(IRoleService roleService,
           IMenuService menuService,
           IRoleMenuService roleMenuService,
           IModuleService moduleService,
           IUserService userService)
        {
            _roleService = roleService;
            _menuService = menuService;
            _roleMenuService = roleMenuService;
            _moduleService = moduleService;
            _userService = userService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public IActionResult Add(UrlParameter param)
        {
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var role = (await _roleService.GetByIdAsync(param.id)).data;
            return View(role);
        }
        public IActionResult Authen(UrlParameter param)
        {
            return View();
        }
        #endregion

        #region Ajax

        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<RoleDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey));
            var result = await _roleService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = result.recordsTotal,
                recordsFiltered = result.recordsTotal,
                data = result.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    name = d.Name,
                    description = d.Description,
                    id = d.Id.ToString(),
                })
            };
            return Json(data);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, RoleDto role)
        {
            var result = await _roleService.UpdateAsync(role);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, RoleDto role)
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
            var result = await _roleService.GetListAsync(item => item.Id > 0);
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
            var moduleList = (await _moduleService.GetListAsync(item => item.Id > 0)).data;
            var menuList = (await _menuService.GetListAsync(item => item.Id > 0)).data;
            var menus = menuList.Select(d => new
            {
                id = d.Id.ToString(),
                pId = d.Type == Service.Enum.MenuType.模块 ? d.ModuleId.ToString() + "_m" : d.ParentId.ToString(),
                name = d.Name,
                open = d.Type == Service.Enum.MenuType.模块
            });
            var modules = moduleList.Select(d => new
            {
                id = d.Id.ToString() + "_m",
                pid = "0",
                name = "---------" + d.Name + "---------",
                open = false,
                type = "module"
            });
            //因为这个管理系统里又分了一个模块， 而菜单里里也有模块
            //防止设置权限时设置错误，前台会判断下是否有type=module
            result.AddRange(menus);
            result.AddRange(modules);
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
            var result = new Result<RoleMenuDto>();
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
                        var newRoleMenus = model.MenuIds.Select(item => new RoleMenuDto { RoleId = roleId, MenuId = item }).ToList();
                        var addResult = await _roleMenuService.AddAsync(newRoleMenus);
                        if (!addResult.flag)
                            result.msg += addResult.msg + "\n";
                        result.flag = addResult.flag && !(delResult.flag^exist); //((!delResult.flag && !exist) || (delResult.flag && exist))
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

        #endregion
    }
}
