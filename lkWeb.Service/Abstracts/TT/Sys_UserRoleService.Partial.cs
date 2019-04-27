
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
    public partial class Sys_UserRoleService : ServiceBase<Sys_UserRoleEntity>, ISys_UserRoleService
    {
        public Sys_UserRoleService(IMapper mapper) : base(mapper)
        {

        }
        /// <summary>
        ///添加单个sys_userrole
        /// </summary>
        /// <param name="dto">sys_userrole实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserRoleDto>> AddAsync(Sys_UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_UserRoleDto, Sys_UserRoleEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_userrole
        /// </summary>
        /// <param name="dtos">sys_userrole集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserRoleDto>>> AddAsync(List<Sys_UserRoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserRoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_UserRoleDto>, List<Sys_UserRoleEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_userrole实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserRoleDto>> UpdateAsync(Sys_UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                db.Update(MapTo<Sys_UserRoleDto, Sys_UserRoleEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_userrole
        /// </summary>
        /// <param name="dtos">sys_userrole集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserRoleDto>>> UpdateAsync(List<Sys_UserRoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserRoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_UserRoleDto>, List<Sys_UserRoleEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_userrole
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserRoleDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_userrole
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserRoleDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserRoleDto>>();
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
        /// 删除单个sys_userrole
        /// </summary>
        /// <param name="dto">sys_userrole实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserRoleDto>> DeleteAsync(Sys_UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_UserRoleDto, Sys_UserRoleEntity>(dto);
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
        public async Task<Result<Sys_UserRoleDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
                if (entity != null)
                {
                    result.data = MapTo<Sys_UserRoleEntity, Sys_UserRoleDto>(entity);
                    result.flag = true;
                }
                return result;
            }
        }
        /// <summary>
        /// 获取sys_userrole分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_UserRoleDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_UserRoleDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_UserRoleEntity>();
                var result = new ResultDto<Sys_UserRoleDto>();
                var where = queryExp.Cast<Sys_UserRoleDto, Sys_UserRoleEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_UserRoleDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_UserRoleDto, Sys_UserRoleEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_UserRoleEntity>, List<Sys_UserRoleDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_UserRoleDto>> GetListAsync(Expression<Func<Sys_UserRoleDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_UserRoleDto, Sys_UserRoleEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_UserRoleEntity>, List<Sys_UserRoleDto>>(temp);
                var result = new ResultDto<Sys_UserRoleDto>
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
        /// 根据条件获取单个sys_userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_UserRoleDto>> GetByExpAsync(Expression<Func<Sys_UserRoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_UserRoleDto, Sys_UserRoleEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
                if (entity != null)
                {
                    result.data = MapTo<Sys_UserRoleEntity, Sys_UserRoleDto>(entity);
                    result.flag = true;
                }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_userrole数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_UserRoleDto>> DeleteAsync(Expression<Func<Sys_UserRoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserRoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_UserRoleDto, Sys_UserRoleEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
    }

}



