using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Mvc;

namespace lkWeb.Areas.Admin.Controllers
{
    /// <summary>
    /// 用于查看，操作 TableList及TableColumn的数据
    /// param中的 Id 对应 TableList中的Id
    /// </summary>
    public class ViewListController : AdminBaseController
    {
        public readonly ITableColumnService _tableColumnService;
        public ViewListController(ITableColumnService tableColumnService)
        {
            _tableColumnService = tableColumnService;
        }
        #region Page
        public async Task<IActionResult> Index(UrlParameter param)
        {
            var model = new ViewListModel();
            var result = await _tableColumnService.GetList(item => item.TableID == param.id);
            model.TableColumn = result.data;
            return View(model);
        }
        public IActionResult Add(UrlParameter param)
        {
            var model = new ViewListModel();

            return View(model);
        }

        public IActionResult Edit(UrlParameter param)
        {
            var model = new ViewListModel();
            return View(model);
        }
        #endregion

        #region Ajax
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Add(UrlParameter param, ViewListModel model)
        {
            return View();
        }

        public IActionResult Edit(UrlParameter param, ViewListModel model)
        {
            return View();
        }
        #endregion
    }
}