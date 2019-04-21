
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
    public partial class Sys_SystemOptionService : ServiceBase<Sys_SystemOptionEntity>, ISys_SystemOptionService
    {
		public Sys_SystemOptionService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_systemoption
        /// </summary>
        /// <param name="dto">sys_systemoption实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_SystemOptionDto>> AddAsync(Sys_SystemOptionDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_SystemOptionDto, Sys_SystemOptionEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_systemoption
        /// </summary>
        /// <param name="dtos">sys_systemoption集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_SystemOptionDto>>> AddAsync(List<Sys_SystemOptionDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_SystemOptionDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_SystemOptionDto>, List<Sys_SystemOptionEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_systemoption实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_SystemOptionDto>> UpdateAsync(Sys_SystemOptionDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                db.Update(MapTo<Sys_SystemOptionDto, Sys_SystemOptionEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_systemoption
        /// </summary>
        /// <param name="dtos">sys_systemoption集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_SystemOptionDto>>> UpdateAsync(List<Sys_SystemOptionDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_SystemOptionDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_SystemOptionDto>, List<Sys_SystemOptionEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_systemoption
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_SystemOptionDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_systemoption
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_SystemOptionDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_SystemOptionDto>>();
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
        /// 删除单个sys_systemoption
        /// </summary>
        /// <param name="dto">sys_systemoption实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_SystemOptionDto>> DeleteAsync(Sys_SystemOptionDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_SystemOptionDto, Sys_SystemOptionEntity>(dto);
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
        public async Task<Result<Sys_SystemOptionDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_SystemOptionEntity, Sys_SystemOptionDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_systemoption分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_SystemOptionDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_SystemOptionDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_SystemOptionEntity>();
                var result = new ResultDto<Sys_SystemOptionDto>();
                var where = queryExp.Cast<Sys_SystemOptionDto, Sys_SystemOptionEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_SystemOptionDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_SystemOptionDto, Sys_SystemOptionEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_SystemOptionEntity>, List<Sys_SystemOptionDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_SystemOptionDto>> GetListAsync(Expression<Func<Sys_SystemOptionDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_SystemOptionDto, Sys_SystemOptionEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_SystemOptionEntity>, List<Sys_SystemOptionDto>>(temp);
                var result = new ResultDto<Sys_SystemOptionDto>
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
        /// 根据条件获取单个sys_systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_SystemOptionDto>> GetByExpAsync(Expression<Func<Sys_SystemOptionDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_SystemOptionDto, Sys_SystemOptionEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_SystemOptionEntity,Sys_SystemOptionDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_SystemOptionDto>> DeleteAsync(Expression<Func<Sys_SystemOptionDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_SystemOptionDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_SystemOptionDto, Sys_SystemOptionEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



