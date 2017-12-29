using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using System.Linq.Expressions;
using lkWeb.Core.Extensions;

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
        public IActionResult Add(int id)
        {
            if(id!=0)
            {
                var dto = _menuService.GetById(id);
                ViewBag.ParentID = dto.Id;
                ViewBag.ParentName = dto.Name;

            }
            return View();
        }
        public IActionResult Edit(string id)
        {
            var menu = _menuService.GetById(int.Parse(id));
            if (menu.ParentId > 0)
                ViewBag.ParentName = _menuService.GetById(menu.ParentId).Name;
            else
                ViewBag.ParentName = "无";
            return View(menu);
        }
        #endregion

        #region Ajax
        [HttpGet]
        public IActionResult GetList(string searchKey)
        {
            Expression<Func<MenuDto, bool>> queryExp = item => !item.IsDeleted;
            if (searchKey.IsNotEmpty())
                queryExp = item => !item.IsDeleted && (item.Name.Contains(searchKey) || item.Url.Contains(searchKey));
            var list = _menuService.GetList(queryExp);
            var strData = new
            {
                value = list.data
            };
            return Json(strData);
        }
        [HttpGet]
        public IActionResult GetPageData(QueryBase queryBase)
        {
            Expression<Func<MenuDto, bool>> queryExp = item => !item.IsDeleted;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => x.Name.Contains(queryBase.SearchKey) && !x.IsDeleted;
            var dto = _menuService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var allMenu = _menuService.GetList(item => !item.IsDeleted).data.ToDictionary(item => item.Id, item => item.Name);
            var data = new
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    name = d.Name,
                    parentID = d.ParentId,
                    parentName = allMenu.ContainsKey(d.ParentId)? allMenu[d.ParentId] : "无",
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
        public IActionResult Edit(MenuDto menu)
        {
            var result = new Result<string>
            {
                flag = _menuService.Update(menu)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult Add(MenuDto menu)
        {
            menu.Id = 0; //似乎是因为地址传参， 默认都是id正好和dto里的id冲突 就赋值给dto里的id了
            if (menu.ParentId > 0)
            {
                var parentMenu = _menuService.GetById(menu.ParentId);
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

            var result = new Result<string>
            {
                flag = _menuService.Add(menu)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult Delete(int id)
        {
            var result = new Result<string>
            {
                flag = _menuService.Delete(id)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult DeleteMulti(List<int> ids)
        {
            var result = new Result<string>
            {
                flag = _menuService.DeleteMulti(ids)
            };
            return Json(result);
        }
        #endregion
    }
}
