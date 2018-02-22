using AutoMapper;
using lkWeb.Entity;
using lkWeb.Service.Dto;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public partial class RoleService : ServiceBase<RoleEntity>, IRoleService
    {
        public readonly RoleManager<RoleEntity> _roleManager;
        public RoleService(RoleManager<RoleEntity> roleManager, IMapper mapper) : base(mapper)
        {
            _roleManager = roleManager;
        }

        public async Task<Result<RoleDto>> _GetById(int id)
        {
            var result = new Result<RoleDto>();
            result.flag = true;
            var entity = await _roleManager.FindByIdAsync(id.ToString());
            result.data = MapTo<RoleEntity, RoleDto>(entity);
            return result;

        }

        public async Task<Result<RoleDto>> _Add(RoleDto dto)
        {
            var result = new Result<RoleDto>();
            var entity = MapTo<RoleDto, RoleEntity>(dto);
            var _result = await _roleManager.CreateAsync(entity);
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
        public async Task<Result<RoleDto>> _Update(RoleDto dto)
        {
            var result = new Result<RoleDto>();
            var entity = await _roleManager.FindByIdAsync(dto.Id.ToString());
            Map(dto, entity, typeof(RoleDto), typeof(RoleEntity));
            var _result = await _roleManager.UpdateAsync(entity);
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
        public async Task<Result<RoleDto>> _Delete(RoleDto dto)
        {
            var result = new Result<RoleDto>();
            var entity = MapTo<RoleDto, RoleEntity>(dto);
            var _result = await _roleManager.DeleteAsync(entity);
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
        public async Task<Result<RoleDto>> _Delete(int id)
        {
            var result = new Result<RoleDto>();
            var entity = await _roleManager.FindByIdAsync(id.ToString());
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
        public async Task<Result<RoleDto>> _Delete(List<int> ids)
        {
            var result = new Result<RoleDto>();
            foreach (var id in ids)
            {
                var entity = await _roleManager.FindByIdAsync(id.ToString());
                var _result = await _roleManager.DeleteAsync(entity);
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
