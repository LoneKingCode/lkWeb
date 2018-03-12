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

            CreateMap<UserEntity, UserDto>().ForMember(u => u.Status, e => e.MapFrom(s => (UserStatus)s.Status));
            CreateMap<UserDto, UserEntity>().ForMember(u => u.Status, e => e.MapFrom(s => (byte)s.Status));

            CreateMap<MenuDto, MenuEntity>().ForMember(u => u.Type, e => e.MapFrom(s => (byte)s.Type));
            CreateMap<MenuEntity, MenuDto>().ForMember(u => u.Type, e => e.MapFrom(s => (MenuType)s.Type));

            CreateMap<TableListDto, TableListEntity>().ForMember(u => u.ImportType, e => e.MapFrom(s => (byte)s.ImportType));
            CreateMap<TableListEntity, TableListDto>().ForMember(u => u.ImportType, e => e.MapFrom(s => (TableImportType)s.ImportType));

            CreateMap<TableColumnDto, TableColumnEntity>().ForMember(u => u.DataType, e => e.MapFrom(s => (byte)s.DataType));
            CreateMap<TableColumnEntity, TableColumnDto>().ForMember(u => u.DataType, e => e.MapFrom(s => (ColumnDataType)s.DataType));

            CreateMap<DepartmentEntity, DepartmentDto>();
            CreateMap<DepartmentDto, DepartmentEntity>();
            CreateMap<LoginLogEntity, LoginLogDto>();
            CreateMap<LoginLogDto, LoginLogEntity>();
            CreateMap<OperationLogEntity, OperationLogDto>();
            CreateMap<OperationLogDto, OperationLogEntity>();
            CreateMap<RoleEntity, RoleDto>();
            CreateMap<RoleDto, RoleEntity>();
            CreateMap<RoleMenuEntity, RoleMenuDto>();
            CreateMap<RoleMenuDto, RoleMenuEntity>();
            CreateMap<UserDepartmentEntity, UserDepartmentDto>();
            CreateMap<UserDepartmentDto, UserDepartmentEntity>();
            CreateMap<ModuleEntity, ModuleDto>();
            CreateMap<ModuleDto, ModuleEntity>();
            CreateMap<SystemOptionEntity, SystemOptionDto>();
            CreateMap<SystemOptionDto, SystemOptionEntity>();
            //CreateMap<UserEntity, UserDto>();
            //CreateMap<UserDto, UserEntity>();

        }
    }
}
