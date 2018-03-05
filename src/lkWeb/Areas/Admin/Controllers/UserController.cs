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
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace lkWeb.Areas.Admin.Controllers
{
    public class UserController : AdminBaseController
    {
        public readonly IUserService _userService;
        public readonly IDepartmentService _departmentService;
        public readonly IUserDepartmentService _userDepartmentService;

        public UserController(IUserService userService,
            IDepartmentService departmentService,
            IUserDepartmentService userDepartmentService,
           UserManager<UserEntity> userManager,
           SignInManager<UserEntity> signInManager)
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
            return View();
        }
        public async Task<IActionResult> Authen(UrlParameter param)
        {
            var user = (await _userService.GetById(param.id)).data;
            return View(user);
        }
        public async Task<IActionResult> Edit(UrlParameter param)
        {
            var user = new UserDto();
            if (param.id != 0)
                user = (await _userService._GetById(param.id)).data;
            else
                user = (await _userService.GetCurrentUser()).data;
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
            var result = await _userService.Logout();
            return new RedirectToActionResult("Login", "User", "");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Login(UserDto dto)
        {
            var result = await _userService.Login(dto);
            return Json(result);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Register(UserDto dto)
        {
            var result = await _userService.Register(dto);
            return Json(result);
        }

        [HttpGet]
        public async Task<IActionResult> GetPageData(UrlParameter param, QueryBase queryBase)
        {
            Expression<Func<UserDto, bool>> queryExp = item => item.Id > 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.UserName.Contains(queryBase.SearchKey) || x.RealName.Contains(queryBase.SearchKey));
            var result = await _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new DataTableDto
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

        [HttpGet]
        public async Task<IActionResult> GetMyRoles(QueryBase queryBase, RoleDto dto)
        {
            var roles = await _userService.GetUserRoles(dto.Id);
            var strData = roles.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name
            });
            var result = new DataTableDto
            {
                draw = queryBase.Draw,
                recordsTotal = roles.recordsTotal,
                recordsFiltered = roles.recordsTotal,
                data = strData
            };
            return Json(result);
        }
        [HttpGet]
        public async Task<IActionResult> GetNotMyRoles(QueryBase queryBase, RoleDto dto)
        {
            var roles = await _userService.GetNotUserRoles(dto.Id);
            var strData = roles.data.Select(d => new
            {
                id = d.Id,
                rolename = d.Name
            });
            var result = new DataTableDto
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
        public async Task<IActionResult> Edit(UrlParameter param, UserDto user)
        {
            var result = await _userService._Update(user);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(UrlParameter param, UserDto user)
        {
            var result = await _userService._Add(user);
            return Json(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ForgetPwd(UserDto user)
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(UrlParameter param)
        {
            Result<UserDto> result = new Result<UserDto>();

            if (param.ids != null && param.ids.Any())
                result = await _userService._Delete(param.ids);
            else if (param.id > 0)
                result = await _userService._Delete(param.id);
            return Json(result);
        }

        public async Task<IActionResult> DeleteRole(AuthRoleDto dto)
        {
            var result = await _userService.RemoveRoles(dto.UserId, dto.RoleIds);
            return Json(result);
        }
        public async Task<IActionResult> AuthRole(UrlParameter param, AuthRoleDto dto)
        {
            var result = await _userService.AddRoles(dto.UserId, dto.RoleIds);
            return Json(result);
        }
        public async Task<IActionResult> DelUserDepartment(SetDepartmentDto dto)
        {
            var result = await _userDepartmentService.Delete(
                item => dto.UserIDs.Contains(item.UserID)
                && item.DepartmentID == dto.DepartmentID);
            return Json(result);
        }
        [HttpGet]
        public async Task<IActionResult> GetListByDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.IsEmpty())
                return Json(new { });
            var departmentID = queryBase.Value.ToInt32();
            var users = (await _userDepartmentService.GetList(item => item.Id > 0 && item.DepartmentID == departmentID))
                .data.Select(item => item.UserID).ToList();
            Expression<Func<UserDto, bool>> queryExp = item => item.Id > 0 && users.Contains(item.Id);
            var dto = await _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var result = new DataTableDto
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
        public async Task<IActionResult> GetListByNotDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.IsEmpty())
                return Json(new { });
            var departmentID = Convert.ToInt32(queryBase.Value);
            var users = (await _userDepartmentService.GetList(item => item.Id > 0 && item.DepartmentID == departmentID))
                .data.Select(item => item.UserID).ToList();
            Expression<Func<UserDto, bool>> queryExp = item => item.Id > 0 && !users.Contains(item.Id);
            var dto = await _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var result = new DataTableDto
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
        public async Task<IActionResult> SetDepartment(SetDepartmentDto dto)
        {
            if (dto.UserIDs.Count() < 1 || dto.DepartmentID < 1)
            {
                return Json(new { });
            }
            var dtos = new List<UserDepartmentDto>();
            foreach (int userID in dto.UserIDs)
            {
                dtos.Add(new UserDepartmentDto
                {
                    UserID = userID,
                    DepartmentID = dto.DepartmentID
                });
            }

            var result = await _userDepartmentService.Add(dtos);
            return Json(result);
        }
        #endregion
    }
}
