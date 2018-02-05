
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

namespace lkWeb.Service.Abstracts
{
    public partial class MenuService : ServiceBase<MenuEntity>, IMenuService
    {
		    /// <summary>
        ///添加menu
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        public async Task<Result<MenuDto>> Add(MenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<MenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<MenuDto, MenuEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加menu
        /// </summary>
        /// <param name="dtos">menu集合</param>
        /// <returns></returns>
        public async Task<Result<List<MenuDto>>> Add(List<MenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<MenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<MenuDto>, List<MenuEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        public async Task<Result<MenuDto>> Update(MenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<MenuDto>();
                db.Update(MapTo<MenuDto, MenuEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新menu
        /// </summary>
        /// <param name="dtos">menu集合</param>
        /// <returns></returns>
        public async Task<Result<List<MenuDto>>> Update(List<MenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<MenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<MenuDto>, List<MenuEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除menu
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<MenuDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<MenuDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除menu
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<MenuDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<MenuDto>>();
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
        /// 删除单个menu
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        public async Task<Result<MenuDto>> Delete(MenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<MenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<MenuDto, MenuEntity>(dto);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Result<MenuDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<MenuDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
                result.data = MapTo<MenuEntity, MenuDto>(entity);
                result.flag = true;
                return result;
            }
        }
        /// <summary>
        /// 获取menu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<MenuDto>> GetPageData(QueryBase queryBase, Expression<Func<MenuDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<MenuEntity>();
                var result = new ResultDto<MenuDto>();
                var where = queryExp.Cast<MenuDto, MenuEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<MenuDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<MenuDto, MenuEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<MenuEntity>, List<MenuDto>>(list.Item1);
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
        public async Task<ResultDto<MenuDto>> GetList(Expression<Func<MenuDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<MenuDto, MenuEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<MenuEntity>, List<MenuDto>>(temp);
                var result = new ResultDto<MenuDto>
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
        /// 根据条件删除menu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<MenuDto>> Delete(Expression<Func<MenuDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<MenuDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<MenuDto, MenuEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



