using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Services;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Http;
using lkWeb.Service;
using lkWeb.Core.Helper;
using lkWeb.Admin.Areas.Admin.Models;

namespace lkWeb.Admin.Areas.Admin.Controllers
{
    public class HomeController : AdminBaseController
    {
        public readonly ISys_SubSystemService _subSystemService;
        public readonly ISys_SubSystemTypeService _subSystemTypeService;
        public readonly ISys_UserService _userService;
        public readonly ISys_RoleService _roleService;
        public HomeController(ISys_RoleService roleService, ISys_SubSystemService subSystemService, ISys_SubSystemTypeService subSystemTypeService, ISys_UserService userService)
        {
            _roleService = roleService;
            _subSystemService = subSystemService;
            _subSystemTypeService = subSystemTypeService;
            _userService = userService;
        }

        #region Page
        public async Task<IActionResult> Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }
        public async Task<IActionResult> ChooseSystem()
        {
            var model = new SubSystemViewModel();
            model.subSystemType = (await _subSystemTypeService.GetListAsync(x => x.Id > 0)).data.ToList();
            var subSystems = (await _subSystemService.GetListAsync(x => x.Id > 0 && x.IsHide != 1)).data.OrderBy(x => x.ListOrder).ToList();
            model.subSystem = new Dictionary<int, IList<Service.Dto.Sys_SubSystemDto>>();
            var userResult = _userService.GetCurrentUser();
            if (userResult.flag)
            {
                model.RealName = userResult.data.RealName;
                model.UserName = userResult.data.UserName;
            }
            foreach (var type in model.subSystemType)
            {
                if (model.subSystem.ContainsKey(type.Id))
                {
                    model.subSystem[type.Id] = subSystems.Where(x => x.TypeId == type.Id).ToList();
                }
                else
                {
                    model.subSystem.Add(type.Id, subSystems.Where(x => x.TypeId == type.Id).ToList());
                }
            }
            return View(model);
        }

        #endregion
    }
}
