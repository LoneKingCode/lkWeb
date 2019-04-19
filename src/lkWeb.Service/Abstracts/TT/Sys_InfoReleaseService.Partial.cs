
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
    public partial class Sys_InfoReleaseService : ServiceBase<Sys_InfoReleaseEntity>, ISys_InfoReleaseService
    {
		public Sys_InfoReleaseService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_inforelease
        /// </summary>
        /// <param name="dto">sys_inforelease实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoReleaseDto>> AddAsync(Sys_InfoReleaseDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_InfoReleaseDto, Sys_InfoReleaseEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_inforelease
        /// </summary>
        /// <param name="dtos">sys_inforelease集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_InfoReleaseDto>>> AddAsync(List<Sys_InfoReleaseDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_InfoReleaseDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_InfoReleaseDto>, List<Sys_InfoReleaseEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_inforelease实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoReleaseDto>> UpdateAsync(Sys_InfoReleaseDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                db.Update(MapTo<Sys_InfoReleaseDto, Sys_InfoReleaseEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_inforelease
        /// </summary>
        /// <param name="dtos">sys_inforelease集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_InfoReleaseDto>>> UpdateAsync(List<Sys_InfoReleaseDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_InfoReleaseDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_InfoReleaseDto>, List<Sys_InfoReleaseEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_inforelease
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoReleaseDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_inforelease
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_InfoReleaseDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_InfoReleaseDto>>();
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
        /// 删除单个sys_inforelease
        /// </summary>
        /// <param name="dto">sys_inforelease实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoReleaseDto>> DeleteAsync(Sys_InfoReleaseDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_InfoReleaseDto, Sys_InfoReleaseEntity>(dto);
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
        public async Task<Result<Sys_InfoReleaseDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_InfoReleaseEntity, Sys_InfoReleaseDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_inforelease分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_InfoReleaseDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_InfoReleaseDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_InfoReleaseEntity>();
                var result = new ResultDto<Sys_InfoReleaseDto>();
                var where = queryExp.Cast<Sys_InfoReleaseDto, Sys_InfoReleaseEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_InfoReleaseDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_InfoReleaseDto, Sys_InfoReleaseEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_InfoReleaseEntity>, List<Sys_InfoReleaseDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_InfoReleaseDto>> GetListAsync(Expression<Func<Sys_InfoReleaseDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_InfoReleaseDto, Sys_InfoReleaseEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_InfoReleaseEntity>, List<Sys_InfoReleaseDto>>(temp);
                var result = new ResultDto<Sys_InfoReleaseDto>
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
        /// 根据条件获取单个sys_inforelease数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoReleaseDto>> GetByExpAsync(Expression<Func<Sys_InfoReleaseDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_InfoReleaseDto, Sys_InfoReleaseEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_InfoReleaseEntity,Sys_InfoReleaseDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_inforelease数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_InfoReleaseDto>> DeleteAsync(Expression<Func<Sys_InfoReleaseDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_InfoReleaseDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_InfoReleaseDto, Sys_InfoReleaseEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



