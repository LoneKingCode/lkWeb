
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Models.System;
using lkWeb.Models.Enum;
using lkWeb.Entity;
using System.Linq;
using lkWeb.Core.Extensions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

namespace lkWeb.Service.Services
{
    public partial class Sys_DepartmentService : ServiceBase<Sys_DepartmentEntity>, ISys_DepartmentService
    {
		public Sys_DepartmentService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_department
        /// </summary>
        /// <param name="dto">sys_department实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_DepartmentDto>> AddAsync(Sys_DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_DepartmentDto, Sys_DepartmentEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_department
        /// </summary>
        /// <param name="dtos">sys_department集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_DepartmentDto>>> AddAsync(List<Sys_DepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_DepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_DepartmentDto>, List<Sys_DepartmentEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_department实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_DepartmentDto>> UpdateAsync(Sys_DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                db.Update(MapTo<Sys_DepartmentDto, Sys_DepartmentEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_department
        /// </summary>
        /// <param name="dtos">sys_department集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_DepartmentDto>>> UpdateAsync(List<Sys_DepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_DepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_DepartmentDto>, List<Sys_DepartmentEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_department
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_DepartmentDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_department
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_DepartmentDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_DepartmentDto>>();
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
        /// 删除单个sys_department
        /// </summary>
        /// <param name="dto">sys_department实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_DepartmentDto>> DeleteAsync(Sys_DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_DepartmentDto, Sys_DepartmentEntity>(dto);
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
        public async Task<Result<Sys_DepartmentDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_DepartmentEntity, Sys_DepartmentDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_department分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<PageResult<Sys_DepartmentDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_DepartmentDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_DepartmentEntity>();
                var result = new PageResult<Sys_DepartmentDto>();
                var where = queryExp.Cast<Sys_DepartmentDto, Sys_DepartmentEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_DepartmentDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_DepartmentDto, Sys_DepartmentEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_DepartmentEntity>, List<Sys_DepartmentDto>>(list.Item1);
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
        public async Task<PageResult<Sys_DepartmentDto>> GetListAsync(Expression<Func<Sys_DepartmentDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_DepartmentDto, Sys_DepartmentEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_DepartmentEntity>, List<Sys_DepartmentDto>>(temp);
                var result = new PageResult<Sys_DepartmentDto>
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
        /// 根据条件获取单个sys_department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_DepartmentDto>> GetByExpAsync(Expression<Func<Sys_DepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_DepartmentDto, Sys_DepartmentEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_DepartmentEntity,Sys_DepartmentDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_DepartmentDto>> DeleteAsync(Expression<Func<Sys_DepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_DepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_DepartmentDto, Sys_DepartmentEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



