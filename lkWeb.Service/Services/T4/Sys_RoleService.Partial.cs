
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using lkWeb.Entity;
using System.Linq;
using lkWeb.Core.Extensions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

namespace lkWeb.Service.Services
{
    public partial class Sys_RoleService : ServiceBase<Sys_RoleEntity>, ISys_RoleService
    {
		public Sys_RoleService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_role
        /// </summary>
        /// <param name="dto">sys_role实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleDto>> AddAsync(Sys_RoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_RoleDto, Sys_RoleEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_role
        /// </summary>
        /// <param name="dtos">sys_role集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_RoleDto>>> AddAsync(List<Sys_RoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_RoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_RoleDto>, List<Sys_RoleEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_role实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleDto>> UpdateAsync(Sys_RoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                db.Update(MapTo<Sys_RoleDto, Sys_RoleEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_role
        /// </summary>
        /// <param name="dtos">sys_role集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_RoleDto>>> UpdateAsync(List<Sys_RoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_RoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_RoleDto>, List<Sys_RoleEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_role
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_role
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_RoleDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_RoleDto>>();
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
        /// 删除单个sys_role
        /// </summary>
        /// <param name="dto">sys_role实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleDto>> DeleteAsync(Sys_RoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_RoleDto, Sys_RoleEntity>(dto);
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
        public async Task<Result<Sys_RoleDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_RoleEntity, Sys_RoleDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_role分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_RoleDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_RoleDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_RoleEntity>();
                var result = new PageResult<Sys_RoleDto>();
                var where = queryExp.Cast<Sys_RoleDto, Sys_RoleEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_RoleDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_RoleDto, Sys_RoleEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_RoleEntity>, List<Sys_RoleDto>>(list.Item1);
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
        public async Task<PageResult<Sys_RoleDto>> GetListAsync(Expression<Func<Sys_RoleDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_RoleDto, Sys_RoleEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_RoleEntity>, List<Sys_RoleDto>>(temp);
                var result = new PageResult<Sys_RoleDto>
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
        /// 根据条件获取单个sys_role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleDto>> GetByExpAsync(Expression<Func<Sys_RoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_RoleDto, Sys_RoleEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_RoleEntity,Sys_RoleDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleDto>> DeleteAsync(Expression<Func<Sys_RoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_RoleDto, Sys_RoleEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



