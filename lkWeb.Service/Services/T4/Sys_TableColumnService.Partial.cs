
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
    public partial class Sys_TableColumnService : ServiceBase<Sys_TableColumnEntity>, ISys_TableColumnService
    {
		public Sys_TableColumnService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_tablecolumn
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableColumnDto>> AddAsync(Sys_TableColumnDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_TableColumnDto, Sys_TableColumnEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_tablecolumn
        /// </summary>
        /// <param name="dtos">sys_tablecolumn集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableColumnDto>>> AddAsync(List<Sys_TableColumnDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_TableColumnDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_TableColumnDto>, List<Sys_TableColumnEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableColumnDto>> UpdateAsync(Sys_TableColumnDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                db.Update(MapTo<Sys_TableColumnDto, Sys_TableColumnEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_tablecolumn
        /// </summary>
        /// <param name="dtos">sys_tablecolumn集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableColumnDto>>> UpdateAsync(List<Sys_TableColumnDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_TableColumnDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_TableColumnDto>, List<Sys_TableColumnEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_tablecolumn
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableColumnDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_tablecolumn
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableColumnDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_TableColumnDto>>();
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
        /// 删除单个sys_tablecolumn
        /// </summary>
        /// <param name="dto">sys_tablecolumn实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableColumnDto>> DeleteAsync(Sys_TableColumnDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_TableColumnDto, Sys_TableColumnEntity>(dto);
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
        public async Task<Result<Sys_TableColumnDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_TableColumnEntity, Sys_TableColumnDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_tablecolumn分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_TableColumnDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_TableColumnDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_TableColumnEntity>();
                var result = new PageResult<Sys_TableColumnDto>();
                var where = queryExp.Cast<Sys_TableColumnDto, Sys_TableColumnEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_TableColumnDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_TableColumnDto, Sys_TableColumnEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_TableColumnEntity>, List<Sys_TableColumnDto>>(list.Item1);
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
        public async Task<PageResult<Sys_TableColumnDto>> GetListAsync(Expression<Func<Sys_TableColumnDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_TableColumnDto, Sys_TableColumnEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_TableColumnEntity>, List<Sys_TableColumnDto>>(temp);
                var result = new PageResult<Sys_TableColumnDto>
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
        /// 根据条件获取单个sys_tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_TableColumnDto>> GetByExpAsync(Expression<Func<Sys_TableColumnDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_TableColumnDto, Sys_TableColumnEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_TableColumnEntity,Sys_TableColumnDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_TableColumnDto>> DeleteAsync(Expression<Func<Sys_TableColumnDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableColumnDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_TableColumnDto, Sys_TableColumnEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



