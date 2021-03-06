
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
    public partial class Sys_UserService : ServiceBase<Sys_UserEntity>, ISys_UserService
    {
		public Sys_UserService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_user
        /// </summary>
        /// <param name="dto">sys_user实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> AddAsync(Sys_UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_UserDto, Sys_UserEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_user
        /// </summary>
        /// <param name="dtos">sys_user集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserDto>>> AddAsync(List<Sys_UserDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_UserDto>, List<Sys_UserEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_user实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> UpdateAsync(Sys_UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                db.Update(MapTo<Sys_UserDto, Sys_UserEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_user
        /// </summary>
        /// <param name="dtos">sys_user集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserDto>>> UpdateAsync(List<Sys_UserDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_UserDto>, List<Sys_UserEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_user
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_user
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserDto>>();
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
        /// 删除单个sys_user
        /// </summary>
        /// <param name="dto">sys_user实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> DeleteAsync(Sys_UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_UserDto, Sys_UserEntity>(dto);
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
        public async Task<Result<Sys_UserDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_UserEntity, Sys_UserDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_user分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_UserDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_UserDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_UserEntity>();
                var result = new PageResult<Sys_UserDto>();
                var where = queryExp.Cast<Sys_UserDto, Sys_UserEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_UserDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_UserDto, Sys_UserEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_UserEntity>, List<Sys_UserDto>>(list.Item1);
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
        public async Task<PageResult<Sys_UserDto>> GetListAsync(Expression<Func<Sys_UserDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_UserDto, Sys_UserEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_UserEntity>, List<Sys_UserDto>>(temp);
                var result = new PageResult<Sys_UserDto>
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
        /// 根据条件获取单个sys_user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> GetByExpAsync(Expression<Func<Sys_UserDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_UserDto, Sys_UserEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_UserEntity,Sys_UserDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDto>> DeleteAsync(Expression<Func<Sys_UserDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_UserDto, Sys_UserEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



