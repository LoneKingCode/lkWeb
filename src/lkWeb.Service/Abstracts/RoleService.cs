using lkWeb.Entity;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Abstracts
{
    public partial class RoleService : ServiceBase<RoleEntity>, IRoleService
    {
        public readonly RoleManager<RoleEntity> _roleManager;
        public RoleService(RoleManager<RoleEntity> roleManager)
        {
            _roleManager = roleManager;
        }

        public Result<RoleDto> _GetById(int id)
        {
            var result = new Result<RoleDto>();
            result.flag = true;
            var entity = _roleManager.FindByIdAsync(id.ToString()).Result;
            result.data = MapTo<RoleEntity, RoleDto>(entity);
            return result;

        }

        public Result<RoleDto> _Add(RoleDto dto)
        {
            var result = new Result<RoleDto>();
            var entity = MapTo<RoleDto, RoleEntity>(dto);
            var _result = _roleManager.CreateAsync(entity).Result;
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public Result<RoleDto> _Update(RoleDto dto)
        {
            var result = new Result<RoleDto>();
            var entity = MapTo<RoleDto, RoleEntity>(dto);
            var _result = _roleManager.UpdateAsync(entity).Result;
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;

        }
        public Result<RoleDto> _Delete(RoleDto dto)
        {
            var result = new Result<RoleDto>();
            var entity = MapTo<RoleDto, RoleEntity>(dto);
            var _result = _roleManager.DeleteAsync(entity).Result;
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public Result<RoleDto> _Delete(int id)
        {
            var result = new Result<RoleDto>();
            var entity = _roleManager.FindByIdAsync(id.ToString()).Result;
            var _result = _roleManager.DeleteAsync(entity).Result;
            if (_result.Succeeded)
                result.flag = true;
            else
            {
                foreach (var err in _result.Errors)
                {
                    result.msg += err.Description + "\n";
                }
            }
            return result;
        }
        public Result<RoleDto> _DeleteMulti(List<int> ids)
        {
            var result = new Result<RoleDto>();
            foreach (var id in ids)
            {
                var entity = _roleManager.FindByIdAsync(id.ToString()).Result;
                var _result = _roleManager.DeleteAsync(entity).Result;
                if (_result.Succeeded)
                    result.flag = true;
                else
                {
                    foreach (var err in _result.Errors)
                    {
                        result.msg += err.Description + "\n";
                    }
                }
            }
            return result;
        }

    }
}
