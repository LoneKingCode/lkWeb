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
            CreateMap<Sys_UserEntity, Sys_UserDto>().ForMember(u => u.Status, e => e.MapFrom(s => (UserStatus)s.Status));
            CreateMap<Sys_UserDto, Sys_UserEntity>().ForMember(u => u.Status, e => e.MapFrom(s => (byte)s.Status));

            CreateMap<Sys_UserEntity, Sys_UserDto>().ForMember(u => u.Status, e => e.MapFrom(s => (UserStatus)s.Status));
            CreateMap<Sys_UserDto, Sys_UserEntity>().ForMember(u => u.Status, e => e.MapFrom(s => (byte)s.Status));

            CreateMap<Sys_MenuDto, Sys_MenuEntity>().ForMember(u => u.Type, e => e.MapFrom(s => (byte)s.Type));
            CreateMap<Sys_MenuEntity, Sys_MenuDto>().ForMember(u => u.Type, e => e.MapFrom(s => (MenuType)s.Type));

            CreateMap<Sys_TableListDto, Sys_TableListEntity>().ForMember(u => u.ImportType, e => e.MapFrom(s => (byte)s.ImportType));
            CreateMap<Sys_TableListEntity, Sys_TableListDto>().ForMember(u => u.ImportType, e => e.MapFrom(s => (TableImportType)s.ImportType));
            CreateMap<Sys_TableColumnDto, Sys_TableColumnEntity>();
            CreateMap<Sys_TableColumnEntity, Sys_TableColumnDto>();
            CreateMap<Sys_DepartmentEntity, Sys_DepartmentDto>();
            CreateMap<Sys_DepartmentDto, Sys_DepartmentEntity>();
            CreateMap<Sys_LoginLogEntity, Sys_LoginLogDto>();
            CreateMap<Sys_LoginLogDto, Sys_LoginLogEntity>();
            CreateMap<Sys_OperationLogEntity, Sys_OperationLogDto>();
            CreateMap<Sys_OperationLogDto, Sys_OperationLogEntity>();
            CreateMap<Sys_RoleEntity, Sys_RoleDto>();
            CreateMap<Sys_RoleDto, Sys_RoleEntity>();
            CreateMap<Sys_RoleMenuEntity, Sys_RoleMenuDto>();
            CreateMap<Sys_RoleMenuDto, Sys_RoleMenuEntity>();
            CreateMap<Sys_UserDepartmentEntity, Sys_UserDepartmentDto>();
            CreateMap<Sys_UserDepartmentDto, Sys_UserDepartmentEntity>();
            CreateMap<Sys_SystemOptionEntity, Sys_SystemOptionDto>();
            CreateMap<Sys_SystemOptionDto, Sys_SystemOptionEntity>();
            CreateMap<Sys_ValueListEntity, Sys_ValueListDto>();
            CreateMap<Sys_ValueListDto, Sys_ValueListEntity>();
            CreateMap<Sys_InfoTypeDto, Sys_InfoTypeEntity>();
            CreateMap<Sys_InfoTypeEntity, Sys_InfoTypeDto>();
            CreateMap<Sys_InfoReleaseDto, Sys_InfoReleaseEntity>();
            CreateMap<Sys_InfoReleaseEntity, Sys_InfoReleaseDto>();
            CreateMap<Sys_SubSystemDto, Sys_SubSystemEntity>();
            CreateMap<Sys_SubSystemEntity, Sys_SubSystemDto>();
            CreateMap<Sys_SubSystemTypeDto, Sys_SubSystemTypeEntity>();
            CreateMap<Sys_SubSystemTypeEntity, Sys_SubSystemTypeDto>();

        }
    }
}
