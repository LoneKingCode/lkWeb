
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
    public partial class Sys_InfoTypeService : ServiceBase<Sys_InfoTypeEntity>, ISys_InfoTypeService
    {
		public Sys_InfoTypeService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_infotype
        /// </summary>
        /// <param name="dto">sys_infotype实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoTypeDto>> AddAsync(Sys_InfoTypeDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_InfoTypeDto, Sys_InfoTypeEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_infotype
        /// </summary>
        /// <param name="dtos">sys_infotype集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_InfoTypeDto>>> AddAsync(List<Sys_InfoTypeDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_InfoTypeDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_InfoTypeDto>, List<Sys_InfoTypeEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_infotype实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoTypeDto>> UpdateAsync(Sys_InfoTypeDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                db.Update(MapTo<Sys_InfoTypeDto, Sys_InfoTypeEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_infotype
        /// </summary>
        /// <param name="dtos">sys_infotype集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_InfoTypeDto>>> UpdateAsync(List<Sys_InfoTypeDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_InfoTypeDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_InfoTypeDto>, List<Sys_InfoTypeEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_infotype
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoTypeDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_infotype
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_InfoTypeDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_InfoTypeDto>>();
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
        /// 删除单个sys_infotype
        /// </summary>
        /// <param name="dto">sys_infotype实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoTypeDto>> DeleteAsync(Sys_InfoTypeDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_InfoTypeDto, Sys_InfoTypeEntity>(dto);
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
        public async Task<Result<Sys_InfoTypeDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_InfoTypeEntity, Sys_InfoTypeDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_infotype分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_InfoTypeDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_InfoTypeDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_InfoTypeEntity>();
                var result = new PageResult<Sys_InfoTypeDto>();
                var where = queryExp.Cast<Sys_InfoTypeDto, Sys_InfoTypeEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_InfoTypeDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_InfoTypeDto, Sys_InfoTypeEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_InfoTypeEntity>, List<Sys_InfoTypeDto>>(list.Item1);
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
        public async Task<PageResult<Sys_InfoTypeDto>> GetListAsync(Expression<Func<Sys_InfoTypeDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_InfoTypeDto, Sys_InfoTypeEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_InfoTypeEntity>, List<Sys_InfoTypeDto>>(temp);
                var result = new PageResult<Sys_InfoTypeDto>
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
        /// 根据条件获取单个sys_infotype数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoTypeDto>> GetByExpAsync(Expression<Func<Sys_InfoTypeDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_InfoTypeDto, Sys_InfoTypeEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_InfoTypeEntity,Sys_InfoTypeDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_infotype数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoTypeDto>> DeleteAsync(Expression<Func<Sys_InfoTypeDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoTypeDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_InfoTypeDto, Sys_InfoTypeEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



