
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
    public partial class RoleMenuService : ServiceBase<RoleMenuEntity>, IRoleMenuService
    {
		    /// <summary>
        ///添加rolemenu
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        public async Task<Result<RoleMenuDto>> Add(RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<RoleMenuDto, RoleMenuEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加rolemenu
        /// </summary>
        /// <param name="dtos">rolemenu集合</param>
        /// <returns></returns>
        public async Task<Result<List<RoleMenuDto>>> Add(List<RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<RoleMenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<RoleMenuDto>, List<RoleMenuEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        public async Task<Result<RoleMenuDto>> Update(RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleMenuDto>();
                db.Update(MapTo<RoleMenuDto, RoleMenuEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新rolemenu
        /// </summary>
        /// <param name="dtos">rolemenu集合</param>
        /// <returns></returns>
        public async Task<Result<List<RoleMenuDto>>> Update(List<RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<RoleMenuDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<RoleMenuDto>, List<RoleMenuEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除rolemenu
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<RoleMenuDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除rolemenu
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<RoleMenuDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<RoleMenuDto>>();
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
        /// 删除单个rolemenu
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        public async Task<Result<RoleMenuDto>> Delete(RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<RoleMenuDto, RoleMenuEntity>(dto);
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
        public async Task<Result<RoleMenuDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleMenuDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
                result.data = MapTo<RoleMenuEntity, RoleMenuDto>(entity);
                result.flag = true;
                return result;
            }
        }
        /// <summary>
        /// 获取rolemenu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<RoleMenuDto>> GetPageData(QueryBase queryBase, Expression<Func<RoleMenuDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<RoleMenuEntity>();
                var result = new ResultDto<RoleMenuDto>();
                var where = queryExp.Cast<RoleMenuDto, RoleMenuEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<RoleMenuDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<RoleMenuDto, RoleMenuEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<RoleMenuEntity>, List<RoleMenuDto>>(list.Item1);
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
        public async Task<ResultDto<RoleMenuDto>> GetList(Expression<Func<RoleMenuDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<RoleMenuDto, RoleMenuEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<RoleMenuEntity>, List<RoleMenuDto>>(temp);
                var result = new ResultDto<RoleMenuDto>
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
        /// 根据条件删除rolemenu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<RoleMenuDto>> Delete(Expression<Func<RoleMenuDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleMenuDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<RoleMenuDto, RoleMenuEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



