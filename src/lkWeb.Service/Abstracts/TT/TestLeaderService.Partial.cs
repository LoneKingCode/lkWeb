
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
    public partial class TestLeaderService : ServiceBase<TestLeaderEntity>, ITestLeaderService
    {
		public TestLeaderService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个testleader
        /// </summary>
        /// <param name="dto">testleader实体</param>
        /// <returns></returns>
        public async Task<Result<TestLeaderDto>> AddAsync(TestLeaderDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<TestLeaderDto, TestLeaderEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加testleader
        /// </summary>
        /// <param name="dtos">testleader集合</param>
        /// <returns></returns>
        public async Task<Result<List<TestLeaderDto>>> AddAsync(List<TestLeaderDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TestLeaderDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<TestLeaderDto>, List<TestLeaderEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">testleader实体</param>
        /// <returns></returns>
        public async Task<Result<TestLeaderDto>> UpdateAsync(TestLeaderDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                db.Update(MapTo<TestLeaderDto, TestLeaderEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新testleader
        /// </summary>
        /// <param name="dtos">testleader集合</param>
        /// <returns></returns>
        public async Task<Result<List<TestLeaderDto>>> UpdateAsync(List<TestLeaderDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TestLeaderDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<TestLeaderDto>, List<TestLeaderEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个testleader
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<TestLeaderDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除testleader
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<TestLeaderDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TestLeaderDto>>();
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
        /// 删除单个testleader
        /// </summary>
        /// <param name="dto">testleader实体</param>
        /// <returns></returns>
        public async Task<Result<TestLeaderDto>> DeleteAsync(TestLeaderDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<TestLeaderDto, TestLeaderEntity>(dto);
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
        public async Task<Result<TestLeaderDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<TestLeaderEntity, TestLeaderDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取testleader分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<TestLeaderDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<TestLeaderDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<TestLeaderEntity>();
                var result = new ResultDto<TestLeaderDto>();
                var where = queryExp.Cast<TestLeaderDto, TestLeaderEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<TestLeaderDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<TestLeaderDto, TestLeaderEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<TestLeaderEntity>, List<TestLeaderDto>>(list.Item1);
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
        public async Task<ResultDto<TestLeaderDto>> GetListAsync(Expression<Func<TestLeaderDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<TestLeaderDto, TestLeaderEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<TestLeaderEntity>, List<TestLeaderDto>>(temp);
                var result = new ResultDto<TestLeaderDto>
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
        /// 根据条件获取单个testleader数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<TestLeaderDto>> GetByExpAsync(Expression<Func<TestLeaderDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<TestLeaderDto, TestLeaderEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<TestLeaderEntity,TestLeaderDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除testleader数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<TestLeaderDto>> DeleteAsync(Expression<Func<TestLeaderDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<TestLeaderDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<TestLeaderDto, TestLeaderEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



