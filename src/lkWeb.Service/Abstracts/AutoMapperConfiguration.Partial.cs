using AutoMapper;
using lkWeb.Entity;
using lkWeb.Service.Dto;
public partial class AutoMapperConfiguration : Profile
{
        /// <summary>
        /// 自定义AutoMapper配置
        /// </summary>
     public void AutoMapperConfiguration_None()
       {

		  					CreateMap<LoginLogEntity, LoginLogDto>();
					CreateMap<LoginLogDto, LoginLogEntity>();
					CreateMap<MenuEntity, MenuDto>();
					CreateMap<MenuDto, MenuEntity>();
					CreateMap<OperationLogEntity, OperationLogDto>();
					CreateMap<OperationLogDto, OperationLogEntity>();
					CreateMap<RoleEntity, RoleDto>();
					CreateMap<RoleDto, RoleEntity>();
					CreateMap<RoleMenuEntity, RoleMenuDto>();
					CreateMap<RoleMenuDto, RoleMenuEntity>();
					CreateMap<UserEntity, UserDto>();
					CreateMap<UserDto, UserEntity>();
					CreateMap<UserRoleEntity, UserRoleDto>();
					CreateMap<UserRoleDto, UserRoleEntity>();

        }
}

