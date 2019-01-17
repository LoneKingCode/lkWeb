using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Core.Extensions;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace lkWeb.Areas.Admin.Controllers
{
    public class DepartmentController : AdminBaseController
    {
        public readonly IDepartmentService _departmentService;

        public DepartmentController(IDepartmentService departmentService)
        {
            _departmentService = departmentService;
        }

        #region Page
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Add(UrlParameter param)
        {
            var parentId = param.id;
            var result = await _departmentService.GetList(item => item.Id > 0);
            ViewBag.Departments = new SelectList(result.data, "Id", "Name", parentId);
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var department = (await _departmentService.GetById(param.id)).data;
            var parentId = department.ParentId;
            var result = await _departmentService.GetList(item => item.Id != param.id);

            ViewBag.Departments = new SelectList(result.data, "Id", "Name", parentId);
            return View(department);
        }
        #endregion

        #region Ajax

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<DepartmentDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey)
                || x.Leader.Contains(queryBase.SearchKey));
            //获取所有部门的id和部门名称
            var allDepartment = (await _departmentService.GetList(item => item.Id > 0))
                                .data.ToDictionary(item => item.Id, item => item.Name);
            var dto = await _departmentService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    parentId = d.ParentId,
                    leader = d.Leader,
                    parentName = allDepartment.ContainsKey(d.ParentId) ? allDepartment[d.ParentId] : "无",
                    name = d.Name,
                    description = d.Description,
                    id = d.Id.ToString()
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, DepartmentDto dto)
        {
            var result = await _departmentService.Update(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, DepartmentDto dto)
        {
            var result = await _departmentService.Add(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
            {
                var result = new Result<List<DepartmentDto>>();
                bool flag = false;
                foreach (var id in param.ids)
                {
                    var dtos = (await _departmentService.GetList(item => item.ParentId == id)).data;
                    if (dtos.Count > 0)
                    {
                        var department = (await _departmentService.GetById(id)).data;
                        result.flag = false;
                        result.msg += "部门 " + department.Name + " 下有子部门,删除失败<br/>";
                        flag = true;
                    }
                }

                if (!flag)
                    result = await _departmentService.Delete(param.ids);
                return Json(result);
            }
            else
            {
                var result = new Result<DepartmentDto>();
                var dtos = (await _departmentService.GetList(item => item.ParentId == param.id)).data;
                if (dtos.Count > 0)
                {
                    result.flag = false;
                    var department = (await _departmentService.GetById(param.id)).data;
                    result.msg = "部门 " + department.Name + " 下有子部门,删除失败";
                }

                else
                {
                    result = await _departmentService.Delete(param.id);
                }
                return Json(result);
            }


        }
        [HttpPost]
        public async Task<IActionResult> GetList(UrlParameter param)
        {
            var result = await _departmentService.GetList(item => item.Id > 0);
            var strData = result.data.Select(d => new
            {
                id = d.Id,
                pId = d.ParentId,
                name = d.Name
            });
            return Json(strData);

        }
        #endregion
    }
}