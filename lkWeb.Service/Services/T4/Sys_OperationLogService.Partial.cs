
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
    public partial class Sys_OperationLogService : ServiceBase<Sys_OperationLogEntity>, ISys_OperationLogService
    {
		public Sys_OperationLogService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_operationlog
        /// </summary>
        /// <param name="dto">sys_operationlog实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_OperationLogDto>> AddAsync(Sys_OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_OperationLogDto, Sys_OperationLogEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_operationlog
        /// </summary>
        /// <param name="dtos">sys_operationlog集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_OperationLogDto>>> AddAsync(List<Sys_OperationLogDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_OperationLogDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_OperationLogDto>, List<Sys_OperationLogEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_operationlog实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_OperationLogDto>> UpdateAsync(Sys_OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                db.Update(MapTo<Sys_OperationLogDto, Sys_OperationLogEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_operationlog
        /// </summary>
        /// <param name="dtos">sys_operationlog集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_OperationLogDto>>> UpdateAsync(List<Sys_OperationLogDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_OperationLogDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_OperationLogDto>, List<Sys_OperationLogEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_operationlog
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_OperationLogDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_operationlog
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_OperationLogDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_OperationLogDto>>();
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
        /// 删除单个sys_operationlog
        /// </summary>
        /// <param name="dto">sys_operationlog实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_OperationLogDto>> DeleteAsync(Sys_OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_OperationLogDto, Sys_OperationLogEntity>(dto);
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
        public async Task<Result<Sys_OperationLogDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_OperationLogEntity, Sys_OperationLogDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_operationlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_OperationLogDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_OperationLogDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_OperationLogEntity>();
                var result = new PageResult<Sys_OperationLogDto>();
                var where = queryExp.Cast<Sys_OperationLogDto, Sys_OperationLogEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_OperationLogDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_OperationLogDto, Sys_OperationLogEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_OperationLogEntity>, List<Sys_OperationLogDto>>(list.Item1);
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
        public async Task<PageResult<Sys_OperationLogDto>> GetListAsync(Expression<Func<Sys_OperationLogDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_OperationLogDto, Sys_OperationLogEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_OperationLogEntity>, List<Sys_OperationLogDto>>(temp);
                var result = new PageResult<Sys_OperationLogDto>
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
        /// 根据条件获取单个sys_operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_OperationLogDto>> GetByExpAsync(Expression<Func<Sys_OperationLogDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_OperationLogDto, Sys_OperationLogEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_OperationLogEntity,Sys_OperationLogDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_OperationLogDto>> DeleteAsync(Expression<Func<Sys_OperationLogDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_OperationLogDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_OperationLogDto, Sys_OperationLogEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



