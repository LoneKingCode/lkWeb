
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
    public partial class DepartmentService : ServiceBase<DepartmentEntity>, IDepartmentService
    {
		public DepartmentService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个department
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        public async Task<Result<DepartmentDto>> Add(DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<DepartmentDto, DepartmentEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加department
        /// </summary>
        /// <param name="dtos">department集合</param>
        /// <returns></returns>
        public async Task<Result<List<DepartmentDto>>> Add(List<DepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<DepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<DepartmentDto>, List<DepartmentEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        public async Task<Result<DepartmentDto>> Update(DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                db.Update(MapTo<DepartmentDto, DepartmentEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新department
        /// </summary>
        /// <param name="dtos">department集合</param>
        /// <returns></returns>
        public async Task<Result<List<DepartmentDto>>> Update(List<DepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<DepartmentDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<DepartmentDto>, List<DepartmentEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个department
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<DepartmentDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除department
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<DepartmentDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<DepartmentDto>>();
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
        /// 删除单个department
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        public async Task<Result<DepartmentDto>> Delete(DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<DepartmentDto, DepartmentEntity>(dto);
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
        public async Task<Result<DepartmentDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
				   if (entity != null)
                result.data = MapTo<DepartmentEntity, DepartmentDto>(entity);
                result.flag = true;
                return result;
            }
        }
        /// <summary>
        /// 获取department分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<DepartmentDto>> GetPageData(QueryBase queryBase, Expression<Func<DepartmentDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<DepartmentEntity>();
                var result = new ResultDto<DepartmentDto>();
                var where = queryExp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<DepartmentDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<DepartmentDto, DepartmentEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<DepartmentEntity>, List<DepartmentDto>>(list.Item1);
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
        public async Task<ResultDto<DepartmentDto>> GetList(Expression<Func<DepartmentDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<DepartmentEntity>, List<DepartmentDto>>(temp);
                var result = new ResultDto<DepartmentDto>
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
        /// 根据条件获取单个department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<DepartmentDto>> GetByExp(Expression<Func<DepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 result.data = MapTo<DepartmentEntity,DepartmentDto>(entity);
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<DepartmentDto>> Delete(Expression<Func<DepartmentDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<DepartmentDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



