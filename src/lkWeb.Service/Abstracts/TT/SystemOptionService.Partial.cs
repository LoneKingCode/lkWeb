
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
    public partial class SystemOptionService : ServiceBase<SystemOptionEntity>, ISystemOptionService
    {
		public SystemOptionService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个systemoption
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        public async Task<Result<SystemOptionDto>> Add(SystemOptionDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<SystemOptionDto, SystemOptionEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加systemoption
        /// </summary>
        /// <param name="dtos">systemoption集合</param>
        /// <returns></returns>
        public async Task<Result<List<SystemOptionDto>>> Add(List<SystemOptionDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<SystemOptionDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<SystemOptionDto>, List<SystemOptionEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        public async Task<Result<SystemOptionDto>> Update(SystemOptionDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                db.Update(MapTo<SystemOptionDto, SystemOptionEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新systemoption
        /// </summary>
        /// <param name="dtos">systemoption集合</param>
        /// <returns></returns>
        public async Task<Result<List<SystemOptionDto>>> Update(List<SystemOptionDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<SystemOptionDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<SystemOptionDto>, List<SystemOptionEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个systemoption
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<SystemOptionDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除systemoption
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<SystemOptionDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<SystemOptionDto>>();
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
        /// 删除单个systemoption
        /// </summary>
        /// <param name="dto">systemoption实体</param>
        /// <returns></returns>
        public async Task<Result<SystemOptionDto>> Delete(SystemOptionDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<SystemOptionDto, SystemOptionEntity>(dto);
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
        public async Task<Result<SystemOptionDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<SystemOptionEntity, SystemOptionDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取systemoption分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<SystemOptionDto>> GetPageData(QueryBase queryBase, Expression<Func<SystemOptionDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<SystemOptionEntity>();
                var result = new ResultDto<SystemOptionDto>();
                var where = queryExp.Cast<SystemOptionDto, SystemOptionEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<SystemOptionDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<SystemOptionDto, SystemOptionEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<SystemOptionEntity>, List<SystemOptionDto>>(list.Item1);
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
        public async Task<ResultDto<SystemOptionDto>> GetList(Expression<Func<SystemOptionDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<SystemOptionDto, SystemOptionEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<SystemOptionEntity>, List<SystemOptionDto>>(temp);
                var result = new ResultDto<SystemOptionDto>
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
        /// 根据条件获取单个systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<SystemOptionDto>> GetByExp(Expression<Func<SystemOptionDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<SystemOptionDto, SystemOptionEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<SystemOptionEntity,SystemOptionDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除systemoption数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<SystemOptionDto>> Delete(Expression<Func<SystemOptionDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<SystemOptionDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<SystemOptionDto, SystemOptionEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



