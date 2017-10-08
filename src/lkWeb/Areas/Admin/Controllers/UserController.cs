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
        #region Page
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Authen(string id)
        {
            var user = _userService.GetById(int.Parse(id));
            return View(user);
        }
        public IActionResult Edit(string id)
        {
            var user = _userService.GetById(int.Parse(id));
            return View(user);
        }
        public IActionResult Add()
        {
            return View();
        }
        public IActionResult History()
        {
            return View();
        }
        public IActionResult ForgetPwd()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();
        }
        #endregion

        #region Ajax

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
                edit = "<button type=\"button\" class=\"btn btn-success\" onClick=\"GoToEditUser(" + d.Id.ToString() + ")\">编辑</button>",
                delete = "<button type=\"button\" class=\"btn btn-delete\" onClick=\"DeleteUser(" + d.Id.ToString() + ")\">删除</button>",
            });
            var result = Json(new
            {
                aaData = strData
            });
            return result;
        }
        [HttpGet]
        public IActionResult GetMyRoles(string userId)
        {
            var list = _userService.GetUserRoles(int.Parse(userId));
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name,
                delete = "<button type=\"button\" class=\"btn btn-delete\" onClick=\"DeleteRole(" + d.Id.ToString() + ")\">删除</button>",
            });
            var result = Json(new
            {
                aaData = strData
            });
            return result;
        }
        [HttpGet]
        public IActionResult GetNotMyRoles(string userId)
        {
            var list = _userService.GetNotUserRoles(int.Parse(userId));
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name,
                auth = "<button type=\"button\" class=\"btn btn-delete\" onClick=\"AuthRole(" + d.Id.ToString() + ")\">授权</button>",
            });
            var result = Json(new
            {
                aaData = strData
            });
            return result;
        }
        [HttpPost]
        public IActionResult Edit(UserDto user)
        {
            var result = Json(new
            {
                flag = _userService.Update(user)
            });
            return result;
        }
        [HttpPost]
        public IActionResult Add(UserDto user)
        {
            var result = Json(new
            {
                flag = _userService.Add(user)
            });
            return result;
        }
        [HttpPost]
        public IActionResult ForgetPwd(UserDto user)
        {
            return null;
        }
        [HttpPost]
        public IActionResult Delete(string id)
        {
            var result = Json(new
            {
                flag = _userService.Delete(int.Parse(id))
            });
            return result;
        }
        [HttpPost]
        public IActionResult DeleteMulti(string ids)
        {
            var result = Json(new
            {
                flag = _userService.DeleteMulti(ids)
            });
            return result;
        }
        #endregion
    }
}
