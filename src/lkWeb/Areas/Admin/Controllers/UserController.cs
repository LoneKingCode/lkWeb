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
            IUserDepartmentService userDepartmentService,
           UserManager<UserEntity> userManager,
           SignInManager<UserEntity> signInManager)
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
        public IActionResult Edit(int id)
        {
            var user = _userService.GetById(id);
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
        public IActionResult SelectUser(int id)
        {
            ViewBag.DepartmentID = id;
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
            return Json(result);
        }
        [HttpPost]
        public IActionResult Register(UserDto dto)
        {
            var result = _userService.Register(dto);
            return Json(result);

        }

        [HttpGet]
        public IActionResult GetPageData(QueryBase queryBase)
        {
            Expression<Func<UserDto, bool>> queryExp = item => item.Id >= 0;
            if (queryBase.SearchKey.IsNotEmpty())
                queryExp = x => (x.UserName.Contains(queryBase.SearchKey) || x.RealName.Contains(queryBase.SearchKey)) ;
            var dto = _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new
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
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }

        [HttpGet]
        public IActionResult GetMyRoles(QueryBase queryBase, UserDto dto)
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
            var result = new Result<string>
            {
                flag = _userService.Update(user)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult Add(UserDto user)
        {
            var result = new Result<string>
            {
                flag = _userService.Add(user)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult ForgetPwd(UserDto user)
        {
            return null;
        }
        [HttpPost]
        public IActionResult Delete(int Id)
        {
            var result = new Result<string>
            {
                flag = _userService.Delete(Id)
            };
            return Json(result);
        }
        [HttpPost]
        public IActionResult DeleteMulti(List<int> ids)
        {
            var result = new Result<string>
            {
                flag = _userService.DeleteMulti(ids)
            };
            return Json(result);
        }
        public IActionResult DeleteRole(AuthRoleDto dto)
        {
            foreach (var roleId in dto.RoleIds)
            {
                _userRoleService.Delete(item => item.RoleId == roleId && item.UserId == dto.UserId);
            }
            var result = new Result<string>
            {
                flag = true
            };
            return Json(result);
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
            var result = new Result<string>
            {
                flag = true
            };
            return Json(result);
        }
        public IActionResult DelUserDepartment(SetDepartmentDto dto)
        {
            var result = new Result<string>
            {
                flag = _userDepartmentService.Delete(item => dto.UserIDs.Contains(item.UserID) && item.DepartmentID == dto.DepartmentID)
            };
            return Json(result);
        }
        [HttpGet]
        public IActionResult GetListByDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.IsEmpty())
                return Json(new { });
            var departmentID = Convert.ToInt32(queryBase.Value);
            var users = _userDepartmentService.GetList(item => item.Id >= 0 && item.DepartmentID == departmentID).data.Select(item => item.UserID).ToList();
            Expression<Func<UserDto, bool>> queryExp = item => item.Id >= 0 && users.Contains(item.Id);
            var dto = _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new
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
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }
        public IActionResult GetListByNotDepartment(QueryBase queryBase)
        {
            if (queryBase.Value.IsEmpty())
                return Json(new { });
            var departmentID = Convert.ToInt32(queryBase.Value);
            var users = _userDepartmentService.GetList(item => item.Id >= 0 && item.DepartmentID == departmentID).data.Select(item => item.UserID).ToList();
            Expression<Func<UserDto, bool>> queryExp = item => item.Id >= 0 && !users.Contains(item.Id);
            var dto = _userService.GetPageData(queryBase, queryExp, queryBase.OrderBy, queryBase.OrderDir);
            var data = new
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
                    createDateTime = d.CreateDateTime.ToString(),
                })
            };
            return Json(data);
        }
        [HttpPost]
        public IActionResult SetDepartment(SetDepartmentDto dto)
        {
            if (dto.UserIDs.Count() < 1 || dto.DepartmentID < 1)
            {
                return Json(new { });
            }
            var result = new Result<string>();
            var dtos = new List<UserDepartmentDto>();
            foreach (int userID in dto.UserIDs)
            {
                dtos.Add(new UserDepartmentDto
                {
                    UserID = userID,
                    DepartmentID = dto.DepartmentID
                });
            }

            result.flag = _userDepartmentService.Add(dtos);
            return Json(result);
        }
        #endregion
    }
}
