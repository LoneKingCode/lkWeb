using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Dto;
using lkWeb.Service.Services;
using lkWeb.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using lkWeb.Service.Enum;
using System.Linq.Expressions;
using lkWeb.Entity;
using lkWeb.Core.Extension;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using lkWeb.Core.Helper;
using lkWeb.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class UserController : AdminBaseController
    {
        public readonly ISys_UserService _userService;
        public readonly ISys_DepartmentService _departmentService;
        public readonly ISys_UserDepartmentService _userDepartmentService;

        public UserController(ISys_UserService userService,
            ISys_DepartmentService departmentService,
            ISys_UserDepartmentService userDepartmentService)
        {
            _userService = userService;
            _departmentService = departmentService;
            _userDepartmentService = userDepartmentService;
        }

        #region Page
        // GET: /<controller>/
        public IActionResult Index(UrlParameter param)
        {
            return View();
        }
        [AllowAnonymous]
        public IActionResult Login()
        {
            ViewBag.next = Request.Query["ReturnUrl"];
            return View();
        }
        public async Task<IActionResult> Authen(UrlParameter param)
        {
            var user = (await _userService.GetByIdAsync(param.id)).data;
            return View(user);
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var user = (await _userService.GetByIdAsync(param.id)).data;
            ViewBag.StatusList = new SelectList(Enum.GetValues(typeof(UserStatus)).Cast<UserStatus>());
            return View(user);
        }
        public async Task<IActionResult> EditCurrent(UrlParameter param)
        {
            var user = new Sys_UserDto();
            user = _userService.GetCurrentUser().data;
            ViewBag.StatusList = new SelectList(Enum.GetValues(typeof(UserStatus)).Cast<UserStatus>());
            return View(user);
        }
        public IActionResult Add(UrlParameter param)
        {
            ViewBag.StatusList = new SelectList(Enum.GetValues(typeof(UserStatus)).Cast<UserStatus>());
            return View();
        }
        public IActionResult Department(UrlParameter param)
        {
            return View();
        }
        public IActionResult SelectUser(UrlParameter param)
        {
            ViewBag.DepartmentID = param.id;
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
        public async Task<IActionResult> Logout()
        {
            var result = _userService.Logout();
            return new RedirectToActionResult("Login", "User", "");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Login(Sys_UserDto dto)
        {
            var result = await _userService.Login(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Register(Sys_UserDto dto)
        {
            var result = await _userService.Register(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<Sys_UserDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.Ext_IsNotEmpty())
                queryExp = x => (x.UserName.Contains(queryBase.SearchKey) || x.RealName.Contains(queryBase.SearchKey));
            var result = await _userService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = result.recordsTotal,
                recordsFiltered = result.recordsTotal,
                data = result.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    realName = d.RealName,
                    email = d.Email,
                    statusName = d.StatusName,
                    id = d.Id.ToString(),
                })
            };
            return Json(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetMyRoles(QueryBase queryBase, Sys_RoleDto dto)
        {
            var roles = await _userService.GetUserRoles(dto.Id);
            var strData = roles.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name
            });
            var result = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = roles.recordsTotal,
                recordsFiltered = roles.recordsTotal,
                data = strData
            };
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetNotMyRoles(QueryBase queryBase, Sys_RoleDto dto)
        {
            var roles = await _userService.GetNotUserRoles(dto.Id);
            var strData = roles.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name
            });
            var result = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = roles.recordsTotal,
                recordsFiltered = roles.recordsTotal,
                data = strData
            };
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UrlParameter param, Sys_UserDto user)
        {
            user.Password = SecurityHelper.Md5(user.Password);
            var result = await _userService.UpdateAsync(user);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditCurrent(UrlParameter param, Sys_UserDto user)
        {
            var result = new Result<Sys_UserDto>();
            var userResult = await _userService.GetByExpAsync(item => item.UserName == user.UserName && item.Password == SecurityHelper.Md5(user.OldPassword));
            if (userResult.flag)
            {
                if (string.IsNullOrEmpty(user.Password))  //密码可以为空 为空就保留现在的密码
                    user.Password = _userService.GetCurrentUser().data.Password;
                else //密码可以为空 为空就保留现在的密码
                    user.Password = SecurityHelper.Md5(user.Password);
                result = await _userService.UpdateAsync(user);
            }
            else
            {
                result.msg = "密码错误";
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, Sys_UserDto user)
        {
            var result = new Result<Sys_UserDto>();
            var existResult = await _userService.GetByExpAsync(item => item.UserName == user.UserName);
            if (existResult.flag)
            {
                result.msg = "该用户名已存在";
            }
            else
            {
                user.Password = SecurityHelper.Md5(user.Password);
                result = await _userService.AddAsync(user);
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ForgetPwd(Sys_UserDto user)
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            if (param.ids != null && param.ids.Any())
            {
                var result = await _userService.DeleteAsync(param.ids);
                return Json(result);
            }
            else if (param.id > 0)
            {
                var result = await _userService.DeleteAsync(param.id);
                return Json(result);
            }
            return Json(new Result<Sys_UserDto>());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteRole(AuthRoleModel model)
        {
            var result = await _userService.RemoveRoles(model.UserId, model.RoleIds);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AuthRole(UrlParameter param, AuthRoleModel model)
        {
            var result = await _userService.AddRoles(model.UserId, model.RoleIds);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DelUserDepartment(SetDepartmentModel model)
        {
            var result = await _userDepartmentService.DeleteAsync(
                item => model.UserIds.Contains(item.UserId)
                && item.DepartmentId == model.DepartmentId);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetListByDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.Ext_IsEmpty())
                return Json(new { });
            var departmentID = queryBase.Value.Ext_ToInt32();
            var users = (await _userDepartmentService.GetListAsync(item => item.Id > 0 && item.DepartmentId == departmentID))
                .data.Select(item => item.UserId).ToList();
            Expression<Func<Sys_UserDto, bool>> queryExp = item => item.Id > 0 && users.Contains(item.Id);
            var dto = await _userService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var result = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    realName = d.RealName,
                    email = d.Email,
                    statusName = d.StatusName,
                    id = d.Id.ToString(),
                })
            };
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetListByNotDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.Ext_IsEmpty())
                return Json(new { });
            var departmentID = Convert.ToInt32(queryBase.Value);
            var users = (await _userDepartmentService.GetListAsync(item => item.Id > 0 && item.DepartmentId == departmentID))
                .data.Select(item => item.UserId).ToList();
            Expression<Func<Sys_UserDto, bool>> queryExp = item => item.Id > 0 && !users.Contains(item.Id);
            var dto = await _userService.GetPageDataAsync(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var result = new DataTableModel
            {
                draw = queryBase.Draw,
                recordsTotal = dto.recordsTotal,
                recordsFiltered = dto.recordsTotal,
                data = dto.data.Select(d => new
                {
                    rowNum = ++queryBase.Start,
                    userName = d.UserName,
                    realName = d.RealName,
                    email = d.Email,
                    statusName = d.StatusName,
                    id = d.Id.ToString(),
                })
            };
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetDepartment(SetDepartmentModel dto)
        {
            var dtos = new List<Sys_UserDepartmentDto>();
            foreach (int userId in dto.UserIds)
            {
                dtos.Add(new Sys_UserDepartmentDto
                {
                    UserId = userId,
                    DepartmentId = dto.DepartmentId
                });
            }

            var result = await _userDepartmentService.AddAsync(dtos);
            return Json(result);
        }
        #endregion
    }
}
