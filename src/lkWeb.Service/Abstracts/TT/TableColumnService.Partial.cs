
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
    public partial class TableColumnService : ServiceBase<TableColumnEntity>, ITableColumnService
    {
		public TableColumnService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个tablecolumn
        /// </summary>
        /// <param name="dto">tablecolumn实体</param>
        /// <returns></returns>
        public async Task<Result<TableColumnDto>> Add(TableColumnDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<TableColumnDto, TableColumnEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加tablecolumn
        /// </summary>
        /// <param name="dtos">tablecolumn集合</param>
        /// <returns></returns>
        public async Task<Result<List<TableColumnDto>>> Add(List<TableColumnDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TableColumnDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<TableColumnDto>, List<TableColumnEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">tablecolumn实体</param>
        /// <returns></returns>
        public async Task<Result<TableColumnDto>> Update(TableColumnDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                db.Update(MapTo<TableColumnDto, TableColumnEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新tablecolumn
        /// </summary>
        /// <param name="dtos">tablecolumn集合</param>
        /// <returns></returns>
        public async Task<Result<List<TableColumnDto>>> Update(List<TableColumnDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TableColumnDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<TableColumnDto>, List<TableColumnEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个tablecolumn
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<TableColumnDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除tablecolumn
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<TableColumnDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<TableColumnDto>>();
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
        /// 删除单个tablecolumn
        /// </summary>
        /// <param name="dto">tablecolumn实体</param>
        /// <returns></returns>
        public async Task<Result<TableColumnDto>> Delete(TableColumnDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<TableColumnDto, TableColumnEntity>(dto);
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
        public async Task<Result<TableColumnDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
				   if (entity != null)
                result.data = MapTo<TableColumnEntity, TableColumnDto>(entity);
                result.flag = true;
                return result;
            }
        }
        /// <summary>
        /// 获取tablecolumn分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<TableColumnDto>> GetPageData(QueryBase queryBase, Expression<Func<TableColumnDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<TableColumnEntity>();
                var result = new ResultDto<TableColumnDto>();
                var where = queryExp.Cast<TableColumnDto, TableColumnEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<TableColumnDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<TableColumnDto, TableColumnEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<TableColumnEntity>, List<TableColumnDto>>(list.Item1);
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
        public async Task<ResultDto<TableColumnDto>> GetList(Expression<Func<TableColumnDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<TableColumnDto, TableColumnEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<TableColumnEntity>, List<TableColumnDto>>(temp);
                var result = new ResultDto<TableColumnDto>
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
        /// 根据条件获取单个tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<TableColumnDto>> GetByExp(Expression<Func<TableColumnDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<TableColumnDto, TableColumnEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 result.data = MapTo<TableColumnEntity,TableColumnDto>(entity);
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除tablecolumn数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<TableColumnDto>> Delete(Expression<Func<TableColumnDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<TableColumnDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<TableColumnDto, TableColumnEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



