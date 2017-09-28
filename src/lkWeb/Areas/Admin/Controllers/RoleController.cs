using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class RoleController : AdminBaseController
    {
        public readonly IRoleService _roleService;
        public RoleController(IRoleService roleService)
        {
            _roleService = roleService;
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
        public IActionResult Edit(string id)
        {
            var role = _roleService.GetById(int.Parse(id));
            return View(role);
        }
        public IActionResult Authen()
        {
            return View();
        }
        #endregion
        #region Ajax

        [HttpGet]
        public IActionResult GetList()
        {
            var data = _roleService.GetList();
            var strData = data.data.Select(d => new
            {
                name = d.Name,
                description = d.Description,
                id = d.Id.ToString(),
                createDateTime = d.CreateDateTime.ToString(),
                edit = "<button type=\"button\" class=\"btn btn-success\" onClick=\"GoToEditRole(" + d.Id.ToString() + ")\">编辑</button>",
                delete = "<button type=\"button\" class=\"btn btn-delete\" onClick=\"DeleteRole(" + d.Id.ToString() + ")\">删除</button>",
            });
            var result = Json(new
            {
                aaData = strData
            });
            return result;
        }
        [HttpPost]
        public IActionResult Edit(RoleDto role)
        {
            var result = Json(new
            {
                flag = _roleService.Update(role)
            });
            return result;
        }
        [HttpPost]
        public IActionResult Add(RoleDto role)
        {
            var result = Json(new
            {
                flag = _roleService.Add(role)
            });
            return result;
        }
        [HttpPost]
        public IActionResult Delete(string RoleID)
        {
            var result = Json(new
            {
                flag = _roleService.Delete(int.Parse(RoleID))
            });
            return result;
        }
        public IActionResult DeleteMulti(string roleIDs)
        {
            var result = Json(new
            {
                flag = _roleService.DeleteMulti(roleIDs)
            });
            return result;
        }
        #endregion
    }
}
