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

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class ValueListController : AdminBaseController
    {

        public readonly ISys_ValueListService _valueListService;
        public ValueListController(ISys_ValueListService valueListService)
        {
            _valueListService = valueListService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }

        public async Task<IActionResult> Add(UrlParameter param)
        {
            var parentId = param.id;
            var result = await _valueListService.GetListAsync(item => item.ParentId < 1);
            ViewBag.parents = new SelectList(result.data, "Id", "Name", parentId);

            return View();
        }
        public async Task<IActionResult> AddParent(UrlParameter param)
        {
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {

            var result = await _valueListService.GetListAsync(item => item.ParentId < 1);
            var dto = (await _valueListService.GetByIdAsync(param.id)).data;
            ViewBag.parents = new SelectList(result.data, "Id", "Name", dto.ParentId);
            return View(dto);
        }

        #endregion

        #region Ajax

        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            var parentId = queryBase.Value.Ext_ToInt32();
            Expression<Func<Sys_ValueListDto, bool>> queryExp = item => item.ParentId == parentId && parentId != 0;
            if (queryBase.SearchKey.Ext_IsNotEmpty())
                queryExp = x => (x.Description.Contains(queryBase.SearchKey) || x.Name.Contains(queryBase.SearchKey));
            var result = await _valueListService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var allValueList = (await _valueListService.GetListAsync(item => item.Id > 0))
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
                    code = d.Code,
                    parentId = d.ParentId,
                    parentName = allValueList.ContainsKey(d.ParentId) ? allValueList[d.ParentId] : "无",
                    value = d.Value,
                    listOrder = d.ListOrder,
                    description = d.Description,
                    id = d.Id.ToString(),
                })
            };
            return Json(data);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, Sys_ValueListDto dto)
        {
            var result = await _valueListService.UpdateAsync(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, Sys_ValueListDto dto)
        {
            var result = await _valueListService.AddAsync(dto);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _valueListService.DeleteAsync(param.ids));
            else
                return Json(await _valueListService.DeleteAsync(param.id));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetParentValueList(UrlParameter param)
        {
            var result = await _valueListService.GetListAsync(item => item.ParentId < 1);
            var strData = result.data.Select(d => new
            {
                id = d.Id,
                pid = 0,
                name = d.Name
            });
            return Json(strData);

        }



        #endregion
    }
}
