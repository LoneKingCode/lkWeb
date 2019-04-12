
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
    public partial class TableListService : ServiceBase<TableListEntity>, ITableListService
    {
		public TableListService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个tablelist
        /// </summary>
        /// <param name="dto">tablelist实体</param>
        /// <returns></returns>
        public async Task<Result<TableListDto>> AddAsync(TableListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<TableListDto, TableListEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加tablelist
        /// </summary>
        /// <param name="dtos">tablelist集合</param>
        /// <returns></returns>
        public async Task<Result<List<TableListDto>>> AddAsync(List<TableListDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TableListDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<TableListDto>, List<TableListEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">tablelist实体</param>
        /// <returns></returns>
        public async Task<Result<TableListDto>> UpdateAsync(TableListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                db.Update(MapTo<TableListDto, TableListEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新tablelist
        /// </summary>
        /// <param name="dtos">tablelist集合</param>
        /// <returns></returns>
        public async Task<Result<List<TableListDto>>> UpdateAsync(List<TableListDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TableListDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<TableListDto>, List<TableListEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个tablelist
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<TableListDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除tablelist
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<TableListDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TableListDto>>();
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
        /// 删除单个tablelist
        /// </summary>
        /// <param name="dto">tablelist实体</param>
        /// <returns></returns>
        public async Task<Result<TableListDto>> DeleteAsync(TableListDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<TableListDto, TableListEntity>(dto);
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
        public async Task<Result<TableListDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<TableListEntity, TableListDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取tablelist分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<TableListDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<TableListDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<TableListEntity>();
                var result = new ResultDto<TableListDto>();
                var where = queryExp.Cast<TableListDto, TableListEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<TableListDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<TableListDto, TableListEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<TableListEntity>, List<TableListDto>>(list.Item1);
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
        public async Task<ResultDto<TableListDto>> GetListAsync(Expression<Func<TableListDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<TableListDto, TableListEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<TableListEntity>, List<TableListDto>>(temp);
                var result = new ResultDto<TableListDto>
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
        /// 根据条件获取单个tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<TableListDto>> GetByExpAsync(Expression<Func<TableListDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<TableListDto, TableListEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<TableListEntity,TableListDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除tablelist数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<TableListDto>> DeleteAsync(Expression<Func<TableListDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableListDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<TableListDto, TableListEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



