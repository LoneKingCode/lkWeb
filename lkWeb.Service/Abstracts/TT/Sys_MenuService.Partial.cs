
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
    public partial class Sys_MenuService : ServiceBase<Sys_MenuEntity>, ISys_MenuService
    {
		public Sys_MenuService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_menu
        /// </summary>
        /// <param name="dto">sys_menu实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_MenuDto>> AddAsync(Sys_MenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_MenuDto, Sys_MenuEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_menu
        /// </summary>
        /// <param name="dtos">sys_menu集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_MenuDto>>> AddAsync(List<Sys_MenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_MenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_MenuDto>, List<Sys_MenuEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_menu实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_MenuDto>> UpdateAsync(Sys_MenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                db.Update(MapTo<Sys_MenuDto, Sys_MenuEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_menu
        /// </summary>
        /// <param name="dtos">sys_menu集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_MenuDto>>> UpdateAsync(List<Sys_MenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_MenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_MenuDto>, List<Sys_MenuEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_menu
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_MenuDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_menu
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_MenuDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_MenuDto>>();
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
        /// 删除单个sys_menu
        /// </summary>
        /// <param name="dto">sys_menu实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_MenuDto>> DeleteAsync(Sys_MenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_MenuDto, Sys_MenuEntity>(dto);
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
        public async Task<Result<Sys_MenuDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_MenuEntity, Sys_MenuDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_menu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_MenuDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_MenuDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_MenuEntity>();
                var result = new ResultDto<Sys_MenuDto>();
                var where = queryExp.Cast<Sys_MenuDto, Sys_MenuEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_MenuDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_MenuDto, Sys_MenuEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_MenuEntity>, List<Sys_MenuDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_MenuDto>> GetListAsync(Expression<Func<Sys_MenuDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_MenuDto, Sys_MenuEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_MenuEntity>, List<Sys_MenuDto>>(temp);
                var result = new ResultDto<Sys_MenuDto>
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
        /// 根据条件获取单个sys_menu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_MenuDto>> GetByExpAsync(Expression<Func<Sys_MenuDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_MenuDto, Sys_MenuEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_MenuEntity,Sys_MenuDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_menu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_MenuDto>> DeleteAsync(Expression<Func<Sys_MenuDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_MenuDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_MenuDto, Sys_MenuEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



