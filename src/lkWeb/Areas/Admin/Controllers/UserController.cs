using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Dto;
using lkWeb.Service.Abstracts;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class UserController : AdminBaseController
    {
        public readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            _userService = userService;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Edit()
        {
            return View();
        }
        public IActionResult History()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(UserDto dto)
        {
            var result = _userService.Login(dto);
            if (result.flag)
            {
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("Error", result.msg);
                return View();
            }
        }
        [HttpPost]
        public IActionResult Register(UserDto dto)
        {
            return RedirectToAction("Login");
            //bool result= _userService.AddUser(dto);
            //if(result)
            //     return RedirectToAction("Login");
            //else
            //     return Content("<script>alert('注册失败！')</script>");
        }
        public IActionResult ForgetPwd(UserDto dto)
        {
            return RedirectToAction("Login");
        }
        [HttpGet]
        public IActionResult GetList()
        {
            var data = _userService.GetList();
            var strData = data.data.Select(d => new
            {
                loginName = d.LoginName,
                realName = d.RealName,
                email = d.Email,
                statusName = d.StatusName,
                id = d.Id.ToString(),
                createDateTime = d.CreateDateTime.ToString(),
                edit = "<button type=\"button\" class=\"btn btn-success\" onClick=\"EditUser(" + d.Id.ToString() + ")\">编辑</button>",
                delete = "<button type=\"button\" class=\"btn btn-delete\" onClick=\"DeleteUser(" + d.Id.ToString() + ")\">删除</button>",
            });
            var result = Json(new
            {            
                aaData = strData
            });
            return result;
        }
    }
}
