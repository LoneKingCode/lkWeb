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

namespace lkWeb.Areas.Admin.Controllers
{
    public class SystemOptionController : AdminBaseController
    {
        public readonly ISystemOptionService _systemOptionService;
        public SystemOptionController(ISystemOptionService systemOptionService)
        {
            _systemOptionService = systemOptionService;
        }

        #region Page
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
            var module = (await _systemOptionService.GetById(param.id)).data;
            return View(module);
        }
        #endregion

        #region Ajax
        [HttpGet]
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            Expression<Func<SystemOptionDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => x.Code.Contains(queryBase.SearchKey);
            var dto = await _systemOptionService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    code = d.Code,
                    value = d.Value,
                    id = d.Id.ToString()
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, SystemOptionDto dto)
        {
            var result = await _systemOptionService.Update(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, SystemOptionDto dto)
        {
            var existDto = await _systemOptionService.GetByExp(item => item.Code == dto.Code);
            var result = new Result<SystemOptionDto>();
            if (existDto.data != null)
            {
                result.msg = "Code已存在，请更换";
            }
            else
            {
                result = await _systemOptionService.Add(dto);
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _systemOptionService.Delete(param.ids));
            else
                return Json(await _systemOptionService.Delete(param.id));
        }

        #endregion
    }
}