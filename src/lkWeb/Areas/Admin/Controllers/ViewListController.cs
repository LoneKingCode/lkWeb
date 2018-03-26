using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Areas.Admin.Models;
using lkWeb.Core.Extensions;
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
        public readonly ISqlService _sqlService;
        public readonly ISysService _sysService;
        public ViewListController(ITableColumnService tableColumnService,
            ISqlService sqlService,
            ISysService sysService)
        {
            _tableColumnService = tableColumnService;
            _sqlService = sqlService;
            _sysService = sysService;
        }
        #region Page
        public async Task<IActionResult> Index(UrlParameter param)
        {
            var model = new ViewListModel();
            model.TableId = param.id;
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
        public async Task<IActionResult> GetPageData(QueryBase queryBase)
        {
            //还没做搜索
            var tableId = queryBase.Value; //表ID 保存在value中
            var tableData = await _sysService.GetPageData(tableId.ToInt32(), "*", "1=1", queryBase);
            List<dynamic> listData = new List<dynamic>();
            foreach (var dicList in tableData.data)
            {
                Dictionary<string, object> temp = new Dictionary<string, object>();
                temp["rowNum"] = ++queryBase.Start;
                foreach (var item in dicList)
                {
                    temp[item.Key] = item.Value;
                }
                dynamic obj = new System.Dynamic.ExpandoObject();

                foreach (KeyValuePair<string, object> item in temp)
                {
                    ((IDictionary<string, object>)obj).Add(item.Key, item.Value);
                }
                listData.Add(obj);
            }
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = tableData.data.Count,
                recordsFiltered = tableData.data.Count,
                data = listData
            };
            return Json(data);
        }

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