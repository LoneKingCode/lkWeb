
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
    public partial class UserDepartmentService : ServiceBase<UserDepartmentEntity>, IUserDepartmentService
    {
		public UserDepartmentService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加userdepartment
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        public async Task<Result<UserDepartmentDto>> Add(UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<UserDepartmentDto, UserDepartmentEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加userdepartment
        /// </summary>
        /// <param name="dtos">userdepartment集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserDepartmentDto>>> Add(List<UserDepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserDepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<UserDepartmentDto>, List<UserDepartmentEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        public async Task<Result<UserDepartmentDto>> Update(UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDepartmentDto>();
                db.Update(MapTo<UserDepartmentDto, UserDepartmentEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新userdepartment
        /// </summary>
        /// <param name="dtos">userdepartment集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserDepartmentDto>>> Update(List<UserDepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserDepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<UserDepartmentDto>, List<UserDepartmentEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除userdepartment
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<UserDepartmentDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除userdepartment
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<UserDepartmentDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<UserDepartmentDto>>();
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
        /// 删除单个userdepartment
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        public async Task<Result<UserDepartmentDto>> Delete(UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<UserDepartmentDto, UserDepartmentEntity>(dto);
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
        public async Task<Result<UserDepartmentDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
                result.data = MapTo<UserDepartmentEntity, UserDepartmentDto>(entity);
                result.flag = true;
                return result;
            }
        }
        /// <summary>
        /// 获取userdepartment分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<UserDepartmentDto>> GetPageData(QueryBase queryBase, Expression<Func<UserDepartmentDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<UserDepartmentEntity>();
                var result = new ResultDto<UserDepartmentDto>();
                var where = queryExp.Cast<UserDepartmentDto, UserDepartmentEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<UserDepartmentDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<UserDepartmentDto, UserDepartmentEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<UserDepartmentEntity>, List<UserDepartmentDto>>(list.Item1);
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
        public async Task<ResultDto<UserDepartmentDto>> GetList(Expression<Func<UserDepartmentDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<UserDepartmentDto, UserDepartmentEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<UserDepartmentEntity>, List<UserDepartmentDto>>(temp);
                var result = new ResultDto<UserDepartmentDto>
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
        /// 根据条件删除userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<UserDepartmentDto>> Delete(Expression<Func<UserDepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<UserDepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<UserDepartmentDto, UserDepartmentEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



