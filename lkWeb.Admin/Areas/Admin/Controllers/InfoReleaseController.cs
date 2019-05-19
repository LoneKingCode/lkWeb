using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service;
using lkWeb.Service.Services;
using lkWeb.Models.System;
using System.Linq.Expressions;
using lkWeb.Core.Extensions;
using lkWeb.Admin.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using lkWeb.Models;

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class InfoReleaseController : AdminBaseController
    {
        public readonly ISys_InfoReleaseService _infoReleaseService;
        public readonly ISys_InfoTypeService _infoTypeService;
        public InfoReleaseController(ISys_InfoReleaseService infoReleaseService, ISys_InfoTypeService infoTypeService)
        {
            _infoReleaseService = infoReleaseService;
            _infoTypeService = infoTypeService;
        }

        #region Page
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Add(UrlParameter param)
        {

            var types = await _infoTypeService.GetListAsync(item => item.Id > 0);
            ViewBag.types = new SelectList(types.data, "Id", "Name");
            return View();
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var dto = (await _infoReleaseService.GetByIdAsync(param.id)).data;
            var types = await _infoTypeService.GetListAsync(item => item.Id > 0);
            ViewBag.types = new SelectList(types.data, "Id", "Name", dto.TypeId);
            return View(dto);
        }
        #endregion

        #region Ajax
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<Sys_InfoReleaseDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.Ext_IsNotEmpty())
                queryExp = x => x.Title.Contains(queryBase.SearchKey);
            var result = await _infoReleaseService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var allType = (await _infoTypeService.GetListAsync(item => item.Id > 0))
                            .data.ToDictionary(item => item.Id, item => item.Name);
            var userIds = result.data.Select(item => item.Creator).ToList();
            var allUser = (await ServiceLocator.Get<ISys_UserService>().GetListAsync(item => userIds.Contains(item.Id))).data.
                ToDictionary(item=>item.Id,item=>item.RealName);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = result.recordsTotal,
                recordsFiltered = result.recordsTotal,
                data = result.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    typeId = d.TypeId,
                    typeName = allType.ContainsKey(d.TypeId) ? allType[d.TypeId] : "无",
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                    title = d.Title,
                    infoContent = d.InfoContent,
                    viewTime = d.ViewTime,
                    creator = allUser.ContainsKey(d.Creator) ? allUser[d.Creator] : "无",
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, Sys_InfoReleaseDto dto)
        {
            var result = await _infoReleaseService.UpdateAsync(dto);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, Sys_InfoReleaseDto dto)
        {
            dto.Creator = CurrentUser.Id;
            var result = await _infoReleaseService.AddAsync(dto);

            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
                return Json(await _infoReleaseService.DeleteAsync(param.ids));
            else
                return Json(await _infoReleaseService.DeleteAsync(param.id));
        }
        #endregion
    }
}