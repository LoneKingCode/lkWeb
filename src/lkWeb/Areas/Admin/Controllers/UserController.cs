using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Dto;
using lkWeb.Service.Abstracts;
using lkWeb.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using lkWeb.Service.Enum;
using System.Linq.Expressions;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class UserController : AdminBaseController
    {
        public readonly IUserService _userService;
        public readonly IUserRoleService _userRoleService;

        public UserController(IUserService userService, IUserRoleService userRoleService)
        {
            _userService = userService;
            _userRoleService = userRoleService;
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
            ViewBag.StatusList = new SelectList(Enum.GetValues(typeof(UserStatus)).Cast<UserStatus>());
            return View(user);
        }

        public IActionResult Add()
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
            string start = Request.Query["start"];
            var dto = _userService.GetList();
            var data = dto.data.Select(d => new
            {
                loginName = d.LoginName,
                realName = d.RealName,
                email = d.Email,
                statusName = d.StatusName,
                id = d.Id.ToString(),
                createDateTime = d.CreateDateTime.ToString(),
            });
            var result = Json(new
            {
                aaData = data
            });
            return result;
        }
        [HttpGet]
        public IActionResult GetPageData(QueryBase queryBase)
        {
            Expression<Func<UserDto, bool>> where = item => !item.IsDeleted;
            if (!(string.IsNullOrEmpty(queryBase.SearchKey)))
                where = x =>(x.LoginName.Contains(queryBase.SearchKey) || x.RealName.Contains(queryBase.SearchKey)) && !x.IsDeleted;
            var dto = _userService.GetPageData(queryBase, x => x.LoginName, where, true);
            var data = new
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    loginName = d.LoginName,
                    realName = d.RealName,
                    email = d.Email,
                    statusName = d.StatusName,
                    id = d.Id.ToString(),
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }

        [HttpGet]
        public IActionResult GetMyRoles(UserDto dto)
        {
            var list = _userService.GetUserRoles(dto.Id);
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name,
                delete = "<button type=\"button\" class=\"btn btn-danger\" onClick=\"DeleteRole(" + d.Id.ToString() + ")\">取消</button>",
            });
            var result = Json(new
            {
                aaData = strData
            });
            return result;
        }
        [HttpGet]
        public IActionResult GetNotMyRoles(UserDto dto)
        {
            var list = _userService.GetNotUserRoles(dto.Id);
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name,
                auth = "<button type=\"button\" class=\"btn btn-success\" onClick=\"AuthRole(" + d.Id.ToString() + ")\">授权</button>",
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
        public IActionResult Delete(int Id)
        {
            var result = Json(new
            {
                flag = _userService.Delete(Id)
            });
            return result;
        }
        [HttpPost]
        public IActionResult DeleteMulti(List<int> ids)
        {
            var result = Json(new
            {
                flag = _userService.DeleteMulti(ids)
            });
            return result;
        }
        public IActionResult DeleteRole(AuthRoleDto dto)
        {
            foreach (var roleId in dto.RoleIds)
            {
                var d = new UserRoleDto
                {
                    UserId = dto.UserId,
                    RoleId = roleId
                };
                _userRoleService.Delete(d);
            }
            var result = Json(new
            {
                flag = true
            });
            return result;
        }
        public IActionResult AuthRole(AuthRoleDto dto)
        {
            foreach (var roleId in dto.RoleIds)
            {
                var d = new UserRoleDto
                {
                    UserId = dto.UserId,
                    RoleId = roleId
                };
                _userRoleService.Add(d);
            }
            var result = Json(new
            {
                flag = true
            });
            return result;
        }
        #endregion
    }
}
