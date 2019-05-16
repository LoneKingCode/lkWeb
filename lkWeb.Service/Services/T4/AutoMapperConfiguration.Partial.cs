using AutoMapper;
using lkWeb.Entity;
using lkWeb.Service.Dto;
namespace lkWeb.Service.Services
{
public partial class AutoMapperConfiguration : Profile
{
        /// <summary>
        /// 自定义AutoMapper配置
        /// </summary>
     public void AutoMapperConfiguration_Auto()
       {

		  				 	CreateMap<Sys_DepartmentEntity, Sys_DepartmentDto>();
					CreateMap<Sys_DepartmentDto, Sys_DepartmentEntity>();
					 
				 	CreateMap<Sys_FileEntity, Sys_FileDto>();
					CreateMap<Sys_FileDto, Sys_FileEntity>();
					 
				 	CreateMap<Sys_InfoReleaseEntity, Sys_InfoReleaseDto>();
					CreateMap<Sys_InfoReleaseDto, Sys_InfoReleaseEntity>();
					 
				 	CreateMap<Sys_InfoTypeEntity, Sys_InfoTypeDto>();
					CreateMap<Sys_InfoTypeDto, Sys_InfoTypeEntity>();
					 
				 	CreateMap<Sys_LoginLogEntity, Sys_LoginLogDto>();
					CreateMap<Sys_LoginLogDto, Sys_LoginLogEntity>();
					 
				 	CreateMap<Sys_MenuEntity, Sys_MenuDto>();
					CreateMap<Sys_MenuDto, Sys_MenuEntity>();
					 
				 	CreateMap<Sys_OperationLogEntity, Sys_OperationLogDto>();
					CreateMap<Sys_OperationLogDto, Sys_OperationLogEntity>();
					 
				 	CreateMap<Sys_RoleEntity, Sys_RoleDto>();
					CreateMap<Sys_RoleDto, Sys_RoleEntity>();
					 
				 	CreateMap<Sys_RoleMenuEntity, Sys_RoleMenuDto>();
					CreateMap<Sys_RoleMenuDto, Sys_RoleMenuEntity>();
					 
				 	CreateMap<Sys_SubSystemEntity, Sys_SubSystemDto>();
					CreateMap<Sys_SubSystemDto, Sys_SubSystemEntity>();
					 
				 	CreateMap<Sys_SubSystemTypeEntity, Sys_SubSystemTypeDto>();
					CreateMap<Sys_SubSystemTypeDto, Sys_SubSystemTypeEntity>();
					 
				 	CreateMap<Sys_SystemOptionEntity, Sys_SystemOptionDto>();
					CreateMap<Sys_SystemOptionDto, Sys_SystemOptionEntity>();
					 
				 	CreateMap<Sys_TableColumnEntity, Sys_TableColumnDto>();
					CreateMap<Sys_TableColumnDto, Sys_TableColumnEntity>();
					 
				 	CreateMap<Sys_TableListEntity, Sys_TableListDto>();
					CreateMap<Sys_TableListDto, Sys_TableListEntity>();
					 
				 	CreateMap<Sys_UserDepartmentEntity, Sys_UserDepartmentDto>();
					CreateMap<Sys_UserDepartmentDto, Sys_UserDepartmentEntity>();
					 
				 	CreateMap<Sys_UserEntity, Sys_UserDto>();
					CreateMap<Sys_UserDto, Sys_UserEntity>();
					 
				 	CreateMap<Sys_UserRoleEntity, Sys_UserRoleDto>();
					CreateMap<Sys_UserRoleDto, Sys_UserRoleEntity>();
					 
				 	CreateMap<Sys_ValueListEntity, Sys_ValueListDto>();
					CreateMap<Sys_ValueListDto, Sys_ValueListEntity>();
					 

        }
}
}


