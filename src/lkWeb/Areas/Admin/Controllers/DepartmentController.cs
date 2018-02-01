using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
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
        public IActionResult Add(int id)
        {
            var parentID = id;
            if (parentID > 0)
            {
                ViewBag.ParentID = parentID;
                ViewBag.ParentName = _departmentService.GetById(parentID).Name;
            }
            else
            {
                ViewBag.ParentID = 0;
                ViewBag.ParentName = "无";
            }
            return View();
        }
        public IActionResult Edit(int id)
        {
            var department = _departmentService.GetById(id);
            var parentID = department.ParentID;
            if (parentID > 0)
            {
                var dto = _departmentService.GetById(parentID);
                if (dto == null)
                    ViewBag.ParentName = "无";
                else
                    ViewBag.ParentName = dto.Name;
            }
            else
                ViewBag.ParentName = "无";
            return View(department);
        }
        #endregion

        #region Ajax

        [HttpGet]
        public IActionResult GetPageData(QueryBase queryBase)
        {
            Expression<Func<DepartmentDto, bool>> queryExp = item => item.Id >= 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey)
                || x.Leader.Contains(queryBase.SearchKey)) ;
            //获取所有部门的id和部门名称
            var allDepartment = _departmentService.GetList(item => item.Id >= 0).data.ToDictionary(item => item.Id, item => item.Name);
            var dto = _departmentService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    parentID = d.ParentID,
                    leader = d.Leader,
                    parentName = allDepartment.ContainsKey(d.ParentID) ? allDepartment[d.ParentID] : "无",
                    name = d.Name,
                    description = d.Description,
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }
        [HttpPost]
        public IActionResult Edit(DepartmentDto dto)
        {
            var result = new Result<string>
            {
                flag = _departmentService.Update(dto)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult Add(DepartmentDto dto)
        {
            dto.Id = 0;
            var result = new Result<string>
            {
                flag = _departmentService.Add(dto)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult Delete(int id)
        {
            var result = new Result<string>();
            var dtos = _departmentService.GetList(item => item.ParentID == id).data;
            if (dtos.Count > 0)
            {
                result.flag = false;
                result.msg = "部门 " + _departmentService.GetById(id).Name + " 下有子部门,删除失败";
            }

            else
            {
                result.flag = _departmentService.Delete(id);
            }
            return Json(result);
        }
        [HttpPost]
        public IActionResult DeleteMulti(List<int> ids)
        {
            var result = new Result<string>();
            bool flag = false;
            foreach (var id in ids)
            {
                var dtos = _departmentService.GetList(item => item.ParentID == id).data;
                if (dtos.Count > 0)
                {
                    result.flag = false;
                    result.msg += "部门 " + _departmentService.GetById(id).Name + " 下有子部门,删除失败<br/>";
                    flag = true;
                }
            }

            if (!flag)
                result.flag = _departmentService.DeleteMulti(ids);
            return Json(result);
        }
        [HttpPost]
        public IActionResult GetList()
        {
            var list = _departmentService.GetList(item => item.Id >= 0);
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                pId = d.ParentID,
                name = d.Name
            });
            return Json(strData);

        }
        #endregion
    }
}