using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using System.Linq.Expressions;
using lkWeb.Core.Extensions;
using lkWeb.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class MenuController : AdminBaseController
    {
        public readonly IMenuService _menuService;
        public readonly IModuleService _moduleService;
        public MenuController(IMenuService menuService, IModuleService moduleService)
        {
            _menuService = menuService;
            _moduleService = moduleService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            if (param.id > 0)
            {
                var menu = (await _menuService.GetById(param.id)).data;
                ViewBag.ParentID = menu.Id;
                ViewBag.ParentName = menu.Name;
            }
            var result = await _moduleService.GetList(item => item.Id > 0);
            ViewBag.Modules = new SelectList(result.data, "Id", "Name");
            if (result.data.Count > 0)
                ViewBag.ModuleID = result.data.First().Id;
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var menu = (await _menuService.GetById(param.id)).data;
            if (menu.ParentId > 0)
                ViewBag.ParentName = (await _menuService.GetById(menu.ParentId)).data.Name;
            else
                ViewBag.ParentName = "无";
            var result = await _moduleService.GetList(item => item.Id > 0);
            ViewBag.Modules = new SelectList(result.data, "Id", "Name", menu.ModuleId);
            ViewBag.ModuleID = menu.ModuleId;
            return View(menu);
        }
        #endregion

        #region Ajax

        [HttpGet]
        public async Task<IActionResult> GetList(UrlParameter param, string searchKey)
        {
            Expression<Func<MenuDto, bool>> queryExp = item => item.Id > 0;
            if (searchKey.IsNotEmpty())
                queryExp = item => item.Id > 0 && (item.Name.Contains(searchKey) || item.Url.Contains(searchKey));
            var result = await _menuService.GetList(queryExp);
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
            Expression<Func<MenuDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => x.Name.Contains(queryBase.SearchKey);
            var result = await _menuService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var allMenu = (await _menuService.GetList(item => item.Id > 0))
                            .data.ToDictionary(item => item.Id, item => item.Name);
            var allModule = (await _moduleService.GetList(item => item.Id > 0))
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
                    moduleId = d.ModuleId,
                    moduleName = allModule.ContainsKey(d.ModuleId) ? allModule[d.ModuleId] : "无",
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
        public async Task<IActionResult> Edit(UrlParameter param, MenuDto menu)
        {
            await SetMenu(menu);
            var result = await _menuService.Update(menu);
            return Json(result);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, MenuDto menu)
        {
            SetMenu(menu);

            var result = await _menuService.Add(menu);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _menuService.Delete(param.ids));
            else
                return Json(await _menuService.Delete(param.id));
        }

        private async Task SetMenu(MenuDto menu)
        {
            if (menu.ParentId > 0)
            {
                var parentMenu = (await _menuService.GetById(menu.ParentId)).data;
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
