
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

namespace lkWeb.Service.Services
{
    public partial class Sys_TableListService : ServiceBase<Sys_TableListEntity>, ISys_TableListService
    {
		public Sys_TableListService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_tablelist
        /// </summary>
        /// <param name="dto">sys_tablelist实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableListDto>> AddAsync(Sys_TableListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_TableListDto, Sys_TableListEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_tablelist
        /// </summary>
        /// <param name="dtos">sys_tablelist集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableListDto>>> AddAsync(List<Sys_TableListDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_TableListDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_TableListDto>, List<Sys_TableListEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_tablelist实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableListDto>> UpdateAsync(Sys_TableListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                db.Update(MapTo<Sys_TableListDto, Sys_TableListEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_tablelist
        /// </summary>
        /// <param name="dtos">sys_tablelist集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableListDto>>> UpdateAsync(List<Sys_TableListDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_TableListDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_TableListDto>, List<Sys_TableListEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_tablelist
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableListDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_tablelist
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_TableListDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_TableListDto>>();
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
        /// 删除单个sys_tablelist
        /// </summary>
        /// <param name="dto">sys_tablelist实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_TableListDto>> DeleteAsync(Sys_TableListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_TableListDto, Sys_TableListEntity>(dto);
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
        public async Task<Result<Sys_TableListDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_TableListEntity, Sys_TableListDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_tablelist分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_TableListDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_TableListDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_TableListEntity>();
                var result = new ResultDto<Sys_TableListDto>();
                var where = queryExp.Cast<Sys_TableListDto, Sys_TableListEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_TableListDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_TableListDto, Sys_TableListEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_TableListEntity>, List<Sys_TableListDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_TableListDto>> GetListAsync(Expression<Func<Sys_TableListDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_TableListDto, Sys_TableListEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_TableListEntity>, List<Sys_TableListDto>>(temp);
                var result = new ResultDto<Sys_TableListDto>
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
        /// 根据条件获取单个sys_tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_TableListDto>> GetByExpAsync(Expression<Func<Sys_TableListDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_TableListDto, Sys_TableListEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_TableListEntity,Sys_TableListDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_TableListDto>> DeleteAsync(Expression<Func<Sys_TableListDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_TableListDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_TableListDto, Sys_TableListEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



