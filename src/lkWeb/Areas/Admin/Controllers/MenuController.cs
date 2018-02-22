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

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class MenuController : AdminBaseController
    {
        public readonly IMenuService _menuService;
        public MenuController(IMenuService roleService)
        {
            _menuService = roleService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Add(int id)
        {
            if (id != 0)
            {
                var menu = (await _menuService.GetById(id)).data;
                ViewBag.ParentID = menu.Id;
                ViewBag.ParentName = menu.Name;

            }
            return View();
        }
        public async Task<IActionResult> Edit(int id)
        {
            var menu = (await _menuService.GetById(id)).data;
            if (menu.ParentId > 0)
                ViewBag.ParentName = (await _menuService.GetById(menu.ParentId)).data.Name;
            else
                ViewBag.ParentName = "无";
            return View(menu);
        }
        #endregion

        #region Ajax

        [HttpGet]
        public async Task<IActionResult> GetList(string searchKey)
        {
            Expression<Func<MenuDto, bool>> queryExp = item => item.Id >= 0;
            if (searchKey.IsNotEmpty())
                queryExp = item => item.Id >= 0 && (item.Name.Contains(searchKey) || item.Url.Contains(searchKey));
            var result = await _menuService.GetList(queryExp);
            var strData = new
            {
                value = result.data
            };
            return Json(strData);
        }

        [HttpGet]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            Expression<Func<MenuDto, bool>> queryExp = item => item.Id >= 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => x.Name.Contains(queryBase.SearchKey);
            var result = await _menuService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var allMenu = (await _menuService.GetList(item => item.Id >= 0))
                            .data.ToDictionary(item => item.Id, item => item.Name);
            var data = new DataTableDto
            {
                draw = queryBase.Draw,
                recordsTotal = result.recordsTotal,
                recordsFiltered = result.recordsTotal,
                data = result.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    name = d.Name,
                    parentID = d.ParentId,
                    parentName = allMenu.ContainsKey(d.ParentId) ? allMenu[d.ParentId] : "无",
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                    type = d.TypeName,
                    url = d.Url,
                    order = d.Order
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(MenuDto menu)
        {
            var result = await _menuService.Update(menu);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(MenuDto menu)
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

            var result = await _menuService.Add(menu);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _menuService.Delete(id);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteMulti(List<int> ids)
        {
            var result = await _menuService.Delete(ids);
            return Json(result);
        }
        #endregion
    }
}
