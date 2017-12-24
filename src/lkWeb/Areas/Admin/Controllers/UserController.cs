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
using lkWeb.Entity;
using lkWeb.Core.Extensions;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class UserController : AdminBaseController
    {
        public readonly IUserService _userService;
        public readonly IUserRoleService _userRoleService;
        public readonly IDepartmentService _departmentService;
        public readonly IUserDepartmentService _userDepartmentService;

        public UserController(IUserService userService,
            IUserRoleService userRoleService,
            IDepartmentService departmentService,
            IUserDepartmentService userDepartmentService)
        {
            _userService = userService;
            _userRoleService = userRoleService;
            _departmentService = departmentService;
            _userDepartmentService = userDepartmentService;
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
            ViewBag.StatusList = new SelectList(Enum.GetValues(typeof(UserStatus)).Cast<UserStatus>());
            return View();
        }
        public IActionResult Department()
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
        public IActionResult GetPageData(QueryBase queryBase)
        {
            Expression<Func<UserDto, bool>> queryExp = item => !item.IsDeleted;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.LoginName.Contains(queryBase.SearchKey) || x.RealName.Contains(queryBase.SearchKey)) && !x.IsDeleted;
            var dto = _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
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
        public IActionResult GetMyRoles(QueryBase queryBase,UserDto dto)
        {
            var list = _userService.GetUserRoles(dto.Id);
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name
            });
            var result = Json(new
            {
                draw = queryBase.Draw,
                recordsTotal = list.recordsTotal,
                recordsFiltered = list.recordsTotal,
                data = strData
            });
            return result;
        }
        [HttpGet]
        public IActionResult GetNotMyRoles(QueryBase queryBase, UserDto dto)
        {
            var list = _userService.GetNotUserRoles(dto.Id);
            var strData = list.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name
            });
            var result = Json(new
            {
                draw = queryBase.Draw,
                recordsTotal = list.recordsTotal,
                recordsFiltered = list.recordsTotal,
                data = strData
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
                _userRoleService.Delete(item => item.RoleId == roleId && item.UserId == dto.UserId);
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
        public IActionResult DelUserDepartment(List<int> ids)
        {
            var result = Json(new
            {
                flag = _userDepartmentService.Delete(item => ids.Contains(item.UserID))
            });
            return result;
        }
        [HttpGet]
        public IActionResult GetListByDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.IsEmpty())
                return Json(new { });
            var departmentID = Convert.ToInt32(queryBase.Value);
            var users = _userDepartmentService.GetList(item => !item.IsDeleted && item.DepartmentID == departmentID).data.Select(item => item.UserID).ToList();
            Expression<Func<UserDto, bool>> queryExp = item => !item.IsDeleted && users.Contains(item.Id);
            var dto = _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
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
        #endregion
    }
}
