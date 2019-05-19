using AutoMapper;
using lkWeb.Entity;
using lkWeb.Models.Enum;
using lkWeb.Models.System;
using lkWeb.Service.Services;


using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
namespace lkWeb.Service.Services
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
            AutoMapperConfiguration_Auto();


            CreateMap<Sys_UserEntity, Sys_UserDto>().ForMember(u => u.Status, e => e.MapFrom(s => (UserStatus)s.Status));
            CreateMap<Sys_UserDto, Sys_UserEntity>().ForMember(u => u.Status, e => e.MapFrom(s => (byte)s.Status));

            CreateMap<Sys_MenuDto, Sys_MenuEntity>().ForMember(u => u.Type, e => e.MapFrom(s => (byte)s.Type));
            CreateMap<Sys_MenuEntity, Sys_MenuDto>().ForMember(u => u.Type, e => e.MapFrom(s => (MenuType)s.Type));

            CreateMap<Sys_TableListDto, Sys_TableListEntity>().ForMember(u => u.ImportType, e => e.MapFrom(s => (byte)s.ImportType));
            CreateMap<Sys_TableListEntity, Sys_TableListDto>().ForMember(u => u.ImportType, e => e.MapFrom(s => (TableImportType)s.ImportType));

        }
    }
}
