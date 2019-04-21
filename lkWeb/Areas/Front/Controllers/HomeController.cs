using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lkWeb.Areas.Front.Controllers.Base;
using lkWeb.Areas.Front.Models;
using lkWeb.Service.Abstracts;
using Microsoft.AspNetCore.Mvc;

namespace lkWeb.Areas.Front.Controllers
{
    public class HomeController : FrontBaseController
    {
        public readonly ISys_SubSystemService _subSystemService;
        public readonly ISys_SubSystemTypeService _subSystemTypeService;
        public readonly ISys_UserService _userService;
        public HomeController(ISys_SubSystemService subSystemService, ISys_SubSystemTypeService subSystemTypeService, ISys_UserService userService)
        {
            _subSystemService = subSystemService;
            _subSystemTypeService = subSystemTypeService;
            _userService = userService;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> ChooseSystem()
        {
            var model = new SubSystemViewModel();
            model.subSystemType = (await _subSystemTypeService.GetListAsync(x => x.Id > 0)).data.ToList();
            var subSystems = (await _subSystemService.GetListAsync(x => x.Id > 0)).data.ToList();
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
    }
}