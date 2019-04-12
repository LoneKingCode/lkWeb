
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;
using lkWeb.Core.Extension;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

namespace lkWeb.Service.Abstracts
{
    public partial class UserRoleService : ServiceBase<UserRoleEntity>, IUserRoleService
    {
		public UserRoleService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个userrole
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> AddAsync(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<UserRoleDto, UserRoleEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加userrole
        /// </summary>
        /// <param name="dtos">userrole集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserRoleDto>>> AddAsync(List<UserRoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserRoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<UserRoleDto>, List<UserRoleEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> UpdateAsync(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                db.Update(MapTo<UserRoleDto, UserRoleEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新userrole
        /// </summary>
        /// <param name="dtos">userrole集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserRoleDto>>> UpdateAsync(List<UserRoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserRoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<UserRoleDto>, List<UserRoleEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个userrole
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除userrole
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserRoleDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserRoleDto>>();
                foreach (var id in ids)
                {
                    var ds = GetDbSet(db);
                    var entity = await ds.FindAsync(id);
                    ds.Remove(entity);
                }
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 删除单个userrole
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> DeleteAsync(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<UserRoleDto, UserRoleEntity>(dto);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id获取单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<UserRoleEntity, UserRoleDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取userrole分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<UserRoleDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<UserRoleDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<UserRoleEntity>();
                var result = new ResultDto<UserRoleDto>();
                var where = queryExp.Cast<UserRoleDto, UserRoleEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<UserRoleDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<UserRoleDto, UserRoleEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<UserRoleEntity>, List<UserRoleDto>>(list.Item1);
                result.recordsTotal = list.Item2;
                result.pageIndex = queryBase.Start;
                result.pageSize = queryBase.Length;
                return result;
            }
        }
        /// <summary>
        /// 根据条件获取列表
        /// </summary>
        /// <param name="queryExp">条件</param>
        /// <returns></returns>
        public async Task<ResultDto<UserRoleDto>> GetListAsync(Expression<Func<UserRoleDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<UserRoleDto, UserRoleEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<UserRoleEntity>, List<UserRoleDto>>(temp);
                var result = new ResultDto<UserRoleDto>
                {
                    data = dtoData,
                    recordsTotal = dtoData.Count,
                    pageSize = 0,
                    pageIndex = 0
                };
                return result;
            }
        }
		 /// <summary>
        /// 根据条件获取单个userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> GetByExpAsync(Expression<Func<UserRoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<UserRoleDto, UserRoleEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<UserRoleEntity,UserRoleDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<UserRoleDto>> DeleteAsync(Expression<Func<UserRoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserRoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<UserRoleDto, UserRoleEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



