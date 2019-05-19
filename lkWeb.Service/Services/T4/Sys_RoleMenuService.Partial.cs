
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
    public partial class Sys_RoleMenuService : ServiceBase<Sys_RoleMenuEntity>, ISys_RoleMenuService
    {
		public Sys_RoleMenuService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_rolemenu
        /// </summary>
        /// <param name="dto">sys_rolemenu实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleMenuDto>> AddAsync(Sys_RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_RoleMenuDto, Sys_RoleMenuEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_rolemenu
        /// </summary>
        /// <param name="dtos">sys_rolemenu集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_RoleMenuDto>>> AddAsync(List<Sys_RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_RoleMenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_RoleMenuDto>, List<Sys_RoleMenuEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_rolemenu实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleMenuDto>> UpdateAsync(Sys_RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                db.Update(MapTo<Sys_RoleMenuDto, Sys_RoleMenuEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_rolemenu
        /// </summary>
        /// <param name="dtos">sys_rolemenu集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_RoleMenuDto>>> UpdateAsync(List<Sys_RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_RoleMenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_RoleMenuDto>, List<Sys_RoleMenuEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_rolemenu
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleMenuDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_rolemenu
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_RoleMenuDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_RoleMenuDto>>();
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
        /// 删除单个sys_rolemenu
        /// </summary>
        /// <param name="dto">sys_rolemenu实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleMenuDto>> DeleteAsync(Sys_RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_RoleMenuDto, Sys_RoleMenuEntity>(dto);
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
        public async Task<Result<Sys_RoleMenuDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_RoleMenuEntity, Sys_RoleMenuDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_rolemenu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_RoleMenuDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_RoleMenuDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_RoleMenuEntity>();
                var result = new PageResult<Sys_RoleMenuDto>();
                var where = queryExp.Cast<Sys_RoleMenuDto, Sys_RoleMenuEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_RoleMenuDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_RoleMenuDto, Sys_RoleMenuEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_RoleMenuEntity>, List<Sys_RoleMenuDto>>(list.Item1);
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
        public async Task<PageResult<Sys_RoleMenuDto>> GetListAsync(Expression<Func<Sys_RoleMenuDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_RoleMenuDto, Sys_RoleMenuEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_RoleMenuEntity>, List<Sys_RoleMenuDto>>(temp);
                var result = new PageResult<Sys_RoleMenuDto>
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
        /// 根据条件获取单个sys_rolemenu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleMenuDto>> GetByExpAsync(Expression<Func<Sys_RoleMenuDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_RoleMenuDto, Sys_RoleMenuEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_RoleMenuEntity,Sys_RoleMenuDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_rolemenu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_RoleMenuDto>> DeleteAsync(Expression<Func<Sys_RoleMenuDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_RoleMenuDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_RoleMenuDto, Sys_RoleMenuEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



