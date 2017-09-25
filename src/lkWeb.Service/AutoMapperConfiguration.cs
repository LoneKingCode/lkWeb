using AutoMapper;
using lkWeb.Entity;
using lkWeb.Service.Abstracts;
using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Service
{
    /// <summary>
    /// AutoMapper 自定义扩展配置
    /// </summary>
    public partial class AutoMapperConfiguration : Profile
    {
        /// <summary>
        /// 自定义AutoMapper配置
        /// </summary>
        public AutoMapperConfiguration()
        {
            CreateMap<UserEntity, UserDto>().ForMember(u => u.Status, e => e.MapFrom(s => (UserStatus)s.Status));
            CreateMap<UserDto, UserEntity>().ForMember(u => u.Status, e => e.MapFrom(s => (byte)s.Status));
            CreateMap<RoleEntity, RoleDto>();
            CreateMap<RoleDto, RoleEntity>();
        }
    }
}
