
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
    public partial class UserService : ServiceBase<UserEntity>, IUserService
    {
		public UserService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加user
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Add(UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<UserDto, UserEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加user
        /// </summary>
        /// <param name="dtos">user集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserDto>>> Add(List<UserDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<UserDto>, List<UserEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Update(UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                db.Update(MapTo<UserDto, UserEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新user
        /// </summary>
        /// <param name="dtos">user集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserDto>>> Update(List<UserDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<UserDto>, List<UserEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除user
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除user
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserDto>>();
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
        /// 删除单个user
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Delete(UserDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<UserDto, UserEntity>(dto);
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
        public async Task<Result<UserDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
                result.data = MapTo<UserEntity, UserDto>(entity);
                result.flag = true;
                return result;
            }
        }
        /// <summary>
        /// 获取user分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<UserDto>> GetPageData(QueryBase queryBase, Expression<Func<UserDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<UserEntity>();
                var result = new ResultDto<UserDto>();
                var where = queryExp.Cast<UserDto, UserEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<UserDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<UserDto, UserEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<UserEntity>, List<UserDto>>(list.Item1);
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
        public async Task<ResultDto<UserDto>> GetList(Expression<Func<UserDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<UserDto, UserEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<UserEntity>, List<UserDto>>(temp);
                var result = new ResultDto<UserDto>
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
        /// 根据条件删除user数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<UserDto>> Delete(Expression<Func<UserDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<UserDto, UserEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



