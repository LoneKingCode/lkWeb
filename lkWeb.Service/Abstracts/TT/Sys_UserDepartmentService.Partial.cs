
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
    public partial class Sys_UserDepartmentService : ServiceBase<Sys_UserDepartmentEntity>, ISys_UserDepartmentService
    {
		public Sys_UserDepartmentService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_userdepartment
        /// </summary>
        /// <param name="dto">sys_userdepartment实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDepartmentDto>> AddAsync(Sys_UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_UserDepartmentDto, Sys_UserDepartmentEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_userdepartment
        /// </summary>
        /// <param name="dtos">sys_userdepartment集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserDepartmentDto>>> AddAsync(List<Sys_UserDepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserDepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_UserDepartmentDto>, List<Sys_UserDepartmentEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_userdepartment实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDepartmentDto>> UpdateAsync(Sys_UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                db.Update(MapTo<Sys_UserDepartmentDto, Sys_UserDepartmentEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_userdepartment
        /// </summary>
        /// <param name="dtos">sys_userdepartment集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserDepartmentDto>>> UpdateAsync(List<Sys_UserDepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserDepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_UserDepartmentDto>, List<Sys_UserDepartmentEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_userdepartment
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDepartmentDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_userdepartment
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_UserDepartmentDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_UserDepartmentDto>>();
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
        /// 删除单个sys_userdepartment
        /// </summary>
        /// <param name="dto">sys_userdepartment实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDepartmentDto>> DeleteAsync(Sys_UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_UserDepartmentDto, Sys_UserDepartmentEntity>(dto);
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
        public async Task<Result<Sys_UserDepartmentDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_UserDepartmentEntity, Sys_UserDepartmentDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_userdepartment分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_UserDepartmentDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_UserDepartmentDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_UserDepartmentEntity>();
                var result = new ResultDto<Sys_UserDepartmentDto>();
                var where = queryExp.Cast<Sys_UserDepartmentDto, Sys_UserDepartmentEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_UserDepartmentDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_UserDepartmentDto, Sys_UserDepartmentEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_UserDepartmentEntity>, List<Sys_UserDepartmentDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_UserDepartmentDto>> GetListAsync(Expression<Func<Sys_UserDepartmentDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_UserDepartmentDto, Sys_UserDepartmentEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_UserDepartmentEntity>, List<Sys_UserDepartmentDto>>(temp);
                var result = new ResultDto<Sys_UserDepartmentDto>
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
        /// 根据条件获取单个sys_userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDepartmentDto>> GetByExpAsync(Expression<Func<Sys_UserDepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_UserDepartmentDto, Sys_UserDepartmentEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_UserDepartmentEntity,Sys_UserDepartmentDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_UserDepartmentDto>> DeleteAsync(Expression<Func<Sys_UserDepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_UserDepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_UserDepartmentDto, Sys_UserDepartmentEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



