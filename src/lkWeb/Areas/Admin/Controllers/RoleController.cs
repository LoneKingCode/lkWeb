using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Areas.Admin.Models;
using System.Linq.Expressions;
using lkWeb.Core.Extensions;
using Microsoft.AspNetCore.Identity;
using lkWeb.Entity;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class RoleController : AdminBaseController
    {
        public readonly IRoleService _roleService;
        public readonly IMenuService _menuService;
        public readonly IRoleMenuService _roleMenuService;
        public RoleController(IRoleService roleService,
           IMenuService menuService,
           IRoleMenuService roleMenuService)
        {
            _roleService = roleService;
            _menuService = menuService;
            _roleMenuService = roleMenuService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Add()
        {
            return View();
        }
        public async Task<IActionResult> Edit(int id)
        {
            var role = (await _roleService._GetById(id)).data;
            return View(role);
        }
        public IActionResult Authen()
        {
            return View();
        }
        #endregion

        #region Ajax

        [HttpGet]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            Expression<Func<RoleDto, bool>> queryExp = item => item.Id >= 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey));
            var result = await _roleService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableDto
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
        public async Task<IActionResult> Edit(RoleDto role)
        {
            var result = await _roleService._Update(role);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(RoleDto role)
        {
            var result = await _roleService._Add(role);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _roleService._Delete(id);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteMulti(List<int> ids)
        {
            var result = await _roleService._Delete(ids);

            return Json(result);
        }
        [HttpPost]
        public async Task<IActionResult> GetRoleList()
        {
            var result = await _roleService.GetList(item => item.Id >= 0);
            var strData = result.data.Select(d => new
            {
                id = d.Id,
                pid = 0,
                name = d.Name
            });
            return Json(strData);

        }
        [HttpPost, HttpGet]
        public async Task<IActionResult> GetMenuList()
        {
            var result = await _menuService.GetList(item => item.Id >= 0);
            var list = result.data.Select(d => new
            {
                id = d.Id,
                pId = d.ParentId,
                name = d.Name,
                typeName = d.TypeName,
                url = d.Url,
                open = true
            });
            return Json(list);
        }
        [HttpPost]
        public async Task<IActionResult> GetRoleMenus(int roleId)
        {
            var result = await _roleMenuService.GetList(item => item.RoleId == roleId);
            var strData = result.data.Select(d => new
            {
                id = d.Id,
                menuId = d.MenuId,
                recordsTotal = result.recordsTotal
            });
            return Json(strData);
        }
        [HttpPost]
        public async Task<IActionResult> AuthMenus(AuthMenuDto dto)
        {
            var result = new Result<RoleMenuDto>();
            foreach (var roleId in dto.RoleIds)
            {
                var delResult = await _roleMenuService.Delete(item => item.RoleId == roleId);
                if (!delResult.flag)
                    result.msg += delResult.msg + "\n";
                if (dto.MenuIds != null)
                {
                    var newRoleMenus = dto.MenuIds.Select(item => new RoleMenuDto { RoleId = roleId, MenuId = item }).ToList();
                    var addResult = await _roleMenuService.Add(newRoleMenus);
                    if (!addResult.flag)
                        result.msg += addResult.msg + "\n";
                                  //有时会清空权限，menuIds数量也就为0
                    result.flag = addResult.flag || (dto.MenuIds.Count == 0 && delResult.flag);
                }
            }
            return Json(result);
        }
        #endregion
    }
}
