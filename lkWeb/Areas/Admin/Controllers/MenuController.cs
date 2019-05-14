using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using System.Linq.Expressions;
using lkWeb.Core.Extension;
using lkWeb.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class MenuController : AdminBaseController
    {
        public readonly ISys_MenuService _menuService;
        public readonly ISys_SubSystemService _subSystemService;
        public readonly ISys_SubSystemTypeService _subSystemTypeService;

        public MenuController(ISys_MenuService menuService, ISys_SubSystemService subSystemService, ISys_SubSystemTypeService subSystemTypeService)
        {
            _menuService = menuService;
            _subSystemService = subSystemService;
            _subSystemTypeService = subSystemTypeService;
        }

        #region Page
        // GET: /<controller>/
        public async Task<IActionResult> Index(UrlParameter param)
        {
            var subSystems = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.SubSystems = new SelectList(subSystems.data, "Id", "Name");
            return View();
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            //在列表选中某个菜单后 点击添加菜单 会默认以选中的菜单为上级菜单
            if (param.id > 0)
            {
                var menu = (await _menuService.GetByIdAsync(param.id)).data;
                ViewBag.ParentId = menu.Id;
                ViewBag.ParentName = menu.Name;
            }
            var subSystems = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.subSystem = new MultiSelectList(subSystems.data, "Id", "Name");

            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var menu = (await _menuService.GetByIdAsync(param.id)).data;
            if (menu.ParentId != 0)
            {
                var parentMenu = (await _menuService.GetByIdAsync(menu.ParentId)).data;
                ViewBag.ParentId = parentMenu.Id;
                ViewBag.ParentName = parentMenu.Name;
            }

            var subSystemIds = menu.SubSystemId.Split(',');
            var subSystems = await _subSystemService.GetListAsync(item => item.Id > 0);
            ViewBag.subSystem = new MultiSelectList(subSystems.data, "Id", "Name", subSystemIds);
            return View(menu);
        }
        #endregion

        #region Ajax

        [HttpGet]
        public async Task<IActionResult> GetList(UrlParameter param, string searchKey)
        {
            Expression<Func<Sys_MenuDto, bool>> queryExp = item => item.Id > 0;
            if (searchKey.IsNotEmpty())
                queryExp = item => item.Id > 0 && (item.Name.Contains(searchKey) || item.Url.Contains(searchKey));
            var result = await _menuService.GetListAsync(queryExp);
            var strData = new
            {
                value = result.data
            };
            return Json(strData);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<Sys_MenuDto, bool>> queryExp = item => item.Id > 0;
            var searchKey = queryBase.SearchKey;

            if (searchKey.IsNotEmpty())
            {
                if (searchKey.Contains("SubSystemId"))  
                {
                    var sysId = searchKey.Split('|')[1].ToInt32();
                    queryExp = x => x.SubSystemId.Contains(sysId.ToString());
                }
                else
                    queryExp = x => x.Name.Contains(searchKey);
            }
            var result = await _menuService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var allMenu = (await _menuService.GetListAsync(item => item.Id > 0))
                            .data.ToDictionary(item => item.Id, item => item.Name);

            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = result.recordsTotal,
                recordsFiltered = result.recordsTotal,
                data = result.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    name = d.Name,
                    parentId = d.ParentId,
                    parentName = allMenu.ContainsKey(d.ParentId) ? allMenu[d.ParentId] : "无",
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                    type = d.TypeName,
                    url = d.Url,
                    order = d.ListOrder,
                    icon = d.Icon
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, Sys_MenuDto menu)
        {
            await SetMenu(menu);
            menu.SubSystemId = Request.Form["SubSystemIdA"];
            var result = await _menuService.UpdateAsync(menu);
            return Json(result);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, Sys_MenuDto menu)
        {
            await SetMenu(menu);

            var result = await _menuService.AddAsync(menu);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _menuService.DeleteAsync(param.ids));
            else
                return Json(await _menuService.DeleteAsync(param.id));
        }

        private async Task SetMenu(Sys_MenuDto menu)
        {
            if (menu.ParentId > 0)
            {
                var parentMenu = (await _menuService.GetByIdAsync(menu.ParentId)).data;
                switch (parentMenu.Type)
                {
                    case Service.Enum.MenuType.模块:
                        menu.Type = Service.Enum.MenuType.菜单;
                        break;
                    case Service.Enum.MenuType.菜单:
                        menu.Type = Service.Enum.MenuType.按钮;
                        break;
                    case Service.Enum.MenuType.按钮:
                        menu.Type = Service.Enum.MenuType.按钮;
                        break;
                    default:
                        break;
                }
            }
        }

        #endregion
    }
}
