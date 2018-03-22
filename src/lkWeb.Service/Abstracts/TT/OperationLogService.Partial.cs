
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;
using lkWeb.Core.Extensions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

namespace lkWeb.Service.Abstracts
{
    public partial class OperationLogService : ServiceBase<OperationLogEntity>, IOperationLogService
    {
		public OperationLogService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个operationlog
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        public async Task<Result<OperationLogDto>> Add(OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<OperationLogDto, OperationLogEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加operationlog
        /// </summary>
        /// <param name="dtos">operationlog集合</param>
        /// <returns></returns>
        public async Task<Result<List<OperationLogDto>>> Add(List<OperationLogDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<OperationLogDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<OperationLogDto>, List<OperationLogEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        public async Task<Result<OperationLogDto>> Update(OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                db.Update(MapTo<OperationLogDto, OperationLogEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新operationlog
        /// </summary>
        /// <param name="dtos">operationlog集合</param>
        /// <returns></returns>
        public async Task<Result<List<OperationLogDto>>> Update(List<OperationLogDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<OperationLogDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<OperationLogDto>, List<OperationLogEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个operationlog
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<OperationLogDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除operationlog
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<OperationLogDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<OperationLogDto>>();
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
        /// 删除单个operationlog
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        public async Task<Result<OperationLogDto>> Delete(OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<OperationLogDto, OperationLogEntity>(dto);
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
        public async Task<Result<OperationLogDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<OperationLogEntity, OperationLogDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取operationlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<OperationLogDto>> GetPageData(QueryBase queryBase, Expression<Func<OperationLogDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<OperationLogEntity>();
                var result = new ResultDto<OperationLogDto>();
                var where = queryExp.Cast<OperationLogDto, OperationLogEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<OperationLogDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<OperationLogDto, OperationLogEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<OperationLogEntity>, List<OperationLogDto>>(list.Item1);
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
        public async Task<ResultDto<OperationLogDto>> GetList(Expression<Func<OperationLogDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<OperationLogDto, OperationLogEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<OperationLogEntity>, List<OperationLogDto>>(temp);
                var result = new ResultDto<OperationLogDto>
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
        /// 根据条件获取单个operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<OperationLogDto>> GetByExp(Expression<Func<OperationLogDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<OperationLogDto, OperationLogEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<OperationLogEntity,OperationLogDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除operationlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<OperationLogDto>> Delete(Expression<Func<OperationLogDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<OperationLogDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<OperationLogDto, OperationLogEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



