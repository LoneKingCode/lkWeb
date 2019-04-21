
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
    public partial class Sys_SubSystemService : ServiceBase<Sys_SubSystemEntity>, ISys_SubSystemService
    {
		public Sys_SubSystemService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_subsystem
        /// </summary>
        /// <param name="dto">sys_subsystem实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_SubSystemDto>> AddAsync(Sys_SubSystemDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_SubSystemDto, Sys_SubSystemEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_subsystem
        /// </summary>
        /// <param name="dtos">sys_subsystem集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_SubSystemDto>>> AddAsync(List<Sys_SubSystemDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_SubSystemDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_SubSystemDto>, List<Sys_SubSystemEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_subsystem实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_SubSystemDto>> UpdateAsync(Sys_SubSystemDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                db.Update(MapTo<Sys_SubSystemDto, Sys_SubSystemEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_subsystem
        /// </summary>
        /// <param name="dtos">sys_subsystem集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_SubSystemDto>>> UpdateAsync(List<Sys_SubSystemDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_SubSystemDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_SubSystemDto>, List<Sys_SubSystemEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_subsystem
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_SubSystemDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_subsystem
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_SubSystemDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_SubSystemDto>>();
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
        /// 删除单个sys_subsystem
        /// </summary>
        /// <param name="dto">sys_subsystem实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_SubSystemDto>> DeleteAsync(Sys_SubSystemDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_SubSystemDto, Sys_SubSystemEntity>(dto);
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
        public async Task<Result<Sys_SubSystemDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_SubSystemEntity, Sys_SubSystemDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_subsystem分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_SubSystemDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_SubSystemDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_SubSystemEntity>();
                var result = new ResultDto<Sys_SubSystemDto>();
                var where = queryExp.Cast<Sys_SubSystemDto, Sys_SubSystemEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_SubSystemDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_SubSystemDto, Sys_SubSystemEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_SubSystemEntity>, List<Sys_SubSystemDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_SubSystemDto>> GetListAsync(Expression<Func<Sys_SubSystemDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_SubSystemDto, Sys_SubSystemEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_SubSystemEntity>, List<Sys_SubSystemDto>>(temp);
                var result = new ResultDto<Sys_SubSystemDto>
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
        /// 根据条件获取单个sys_subsystem数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_SubSystemDto>> GetByExpAsync(Expression<Func<Sys_SubSystemDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_SubSystemDto, Sys_SubSystemEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_SubSystemEntity,Sys_SubSystemDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_subsystem数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_SubSystemDto>> DeleteAsync(Expression<Func<Sys_SubSystemDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SubSystemDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_SubSystemDto, Sys_SubSystemEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



