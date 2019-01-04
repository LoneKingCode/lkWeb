
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
    public partial class RoleService : ServiceBase<RoleEntity>, IRoleService
    {
		public RoleService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个role
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        public async Task<Result<RoleDto>> Add(RoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<RoleDto, RoleEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加role
        /// </summary>
        /// <param name="dtos">role集合</param>
        /// <returns></returns>
        public async Task<Result<List<RoleDto>>> Add(List<RoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<RoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<RoleDto>, List<RoleEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        public async Task<Result<RoleDto>> Update(RoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                db.Update(MapTo<RoleDto, RoleEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新role
        /// </summary>
        /// <param name="dtos">role集合</param>
        /// <returns></returns>
        public async Task<Result<List<RoleDto>>> Update(List<RoleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<RoleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<RoleDto>, List<RoleEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个role
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<RoleDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除role
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<RoleDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<RoleDto>>();
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
        /// 删除单个role
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        public async Task<Result<RoleDto>> Delete(RoleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<RoleDto, RoleEntity>(dto);
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
        public async Task<Result<RoleDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<RoleEntity, RoleDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取role分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<RoleDto>> GetPageData(QueryBase queryBase, Expression<Func<RoleDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<RoleEntity>();
                var result = new ResultDto<RoleDto>();
                var where = queryExp.Cast<RoleDto, RoleEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<RoleDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<RoleDto, RoleEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<RoleEntity>, List<RoleDto>>(list.Item1);
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
        public async Task<ResultDto<RoleDto>> GetList(Expression<Func<RoleDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<RoleDto, RoleEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<RoleEntity>, List<RoleDto>>(temp);
                var result = new ResultDto<RoleDto>
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
        /// 根据条件获取单个role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<RoleDto>> GetByExp(Expression<Func<RoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<RoleDto, RoleEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<RoleEntity,RoleDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<RoleDto>> Delete(Expression<Func<RoleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<RoleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<RoleDto, RoleEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



