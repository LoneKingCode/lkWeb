
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
    public partial class LoginLogService : ServiceBase<LoginLogEntity>, ILoginLogService
    {
		public LoginLogService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个loginlog
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        public async Task<Result<LoginLogDto>> Add(LoginLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<LoginLogDto, LoginLogEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加loginlog
        /// </summary>
        /// <param name="dtos">loginlog集合</param>
        /// <returns></returns>
        public async Task<Result<List<LoginLogDto>>> Add(List<LoginLogDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<LoginLogDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<LoginLogDto>, List<LoginLogEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        public async Task<Result<LoginLogDto>> Update(LoginLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                db.Update(MapTo<LoginLogDto, LoginLogEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新loginlog
        /// </summary>
        /// <param name="dtos">loginlog集合</param>
        /// <returns></returns>
        public async Task<Result<List<LoginLogDto>>> Update(List<LoginLogDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<LoginLogDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<LoginLogDto>, List<LoginLogEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个loginlog
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<LoginLogDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除loginlog
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<LoginLogDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<LoginLogDto>>();
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
        /// 删除单个loginlog
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        public async Task<Result<LoginLogDto>> Delete(LoginLogDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<LoginLogDto, LoginLogEntity>(dto);
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
        public async Task<Result<LoginLogDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<LoginLogEntity, LoginLogDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取loginlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<LoginLogDto>> GetPageData(QueryBase queryBase, Expression<Func<LoginLogDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<LoginLogEntity>();
                var result = new ResultDto<LoginLogDto>();
                var where = queryExp.Cast<LoginLogDto, LoginLogEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<LoginLogDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<LoginLogDto, LoginLogEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<LoginLogEntity>, List<LoginLogDto>>(list.Item1);
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
        public async Task<ResultDto<LoginLogDto>> GetList(Expression<Func<LoginLogDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<LoginLogDto, LoginLogEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<LoginLogEntity>, List<LoginLogDto>>(temp);
                var result = new ResultDto<LoginLogDto>
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
        /// 根据条件获取单个loginlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<LoginLogDto>> GetByExp(Expression<Func<LoginLogDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<LoginLogDto, LoginLogEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<LoginLogEntity,LoginLogDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除loginlog数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<LoginLogDto>> Delete(Expression<Func<LoginLogDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<LoginLogDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<LoginLogDto, LoginLogEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



