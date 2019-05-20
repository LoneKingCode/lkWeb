using AutoMapper;
using lkWeb.Entity;
using lkWeb.Models.System;
using lkWeb.Models.Enum;
namespace lkWeb.Service.Services
{
public partial class AutoMapperConfiguration : Profile
{
        /// <summary>
        /// 自定义AutoMapper配置
        /// </summary>
     public void AutoMapperConfiguration_Auto()
       {

		  				 	CreateMap<Sys_DepartmentEntity, Sys_DepartmentDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_FileEntity, Sys_FileDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_InfoReleaseEntity, Sys_InfoReleaseDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_InfoTypeEntity, Sys_InfoTypeDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_LoginLogEntity, Sys_LoginLogDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_MenuEntity, Sys_MenuDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_OperationLogEntity, Sys_OperationLogDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_RoleEntity, Sys_RoleDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_RoleMenuEntity, Sys_RoleMenuDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_SubSystemEntity, Sys_SubSystemDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_SubSystemTypeEntity, Sys_SubSystemTypeDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_SystemOptionEntity, Sys_SystemOptionDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_TableColumnEntity, Sys_TableColumnDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_TableListEntity, Sys_TableListDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_UserDepartmentEntity, Sys_UserDepartmentDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_UserEntity, Sys_UserDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_UserRoleEntity, Sys_UserRoleDto>().ReverseMap();
			 
					 
				 	CreateMap<Sys_ValueListEntity, Sys_ValueListDto>().ReverseMap();
			 
					 

        }
}
}


