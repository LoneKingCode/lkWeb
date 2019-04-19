
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
    public partial class Sys_ValueListService : ServiceBase<Sys_ValueListEntity>, ISys_ValueListService
    {
		public Sys_ValueListService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_valuelist
        /// </summary>
        /// <param name="dto">sys_valuelist实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_ValueListDto>> AddAsync(Sys_ValueListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_ValueListDto, Sys_ValueListEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_valuelist
        /// </summary>
        /// <param name="dtos">sys_valuelist集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_ValueListDto>>> AddAsync(List<Sys_ValueListDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_ValueListDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_ValueListDto>, List<Sys_ValueListEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_valuelist实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_ValueListDto>> UpdateAsync(Sys_ValueListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                db.Update(MapTo<Sys_ValueListDto, Sys_ValueListEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_valuelist
        /// </summary>
        /// <param name="dtos">sys_valuelist集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_ValueListDto>>> UpdateAsync(List<Sys_ValueListDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_ValueListDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_ValueListDto>, List<Sys_ValueListEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_valuelist
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_ValueListDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_valuelist
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_ValueListDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_ValueListDto>>();
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
        /// 删除单个sys_valuelist
        /// </summary>
        /// <param name="dto">sys_valuelist实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_ValueListDto>> DeleteAsync(Sys_ValueListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_ValueListDto, Sys_ValueListEntity>(dto);
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
        public async Task<Result<Sys_ValueListDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_ValueListEntity, Sys_ValueListDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_valuelist分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_ValueListDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_ValueListDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_ValueListEntity>();
                var result = new ResultDto<Sys_ValueListDto>();
                var where = queryExp.Cast<Sys_ValueListDto, Sys_ValueListEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_ValueListDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_ValueListDto, Sys_ValueListEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_ValueListEntity>, List<Sys_ValueListDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_ValueListDto>> GetListAsync(Expression<Func<Sys_ValueListDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_ValueListDto, Sys_ValueListEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_ValueListEntity>, List<Sys_ValueListDto>>(temp);
                var result = new ResultDto<Sys_ValueListDto>
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
        /// 根据条件获取单个sys_valuelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_ValueListDto>> GetByExpAsync(Expression<Func<Sys_ValueListDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_ValueListDto, Sys_ValueListEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_ValueListEntity,Sys_ValueListDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_valuelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_ValueListDto>> DeleteAsync(Expression<Func<Sys_ValueListDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_ValueListDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_ValueListDto, Sys_ValueListEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



