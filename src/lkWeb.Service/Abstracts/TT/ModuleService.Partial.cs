
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
    public partial class ModuleService : ServiceBase<ModuleEntity>, IModuleService
    {
		public ModuleService(IMapper mapper):base(mapper)
		{

		}
		    /// <summary>
        ///添加单个module
        /// </summary>
        /// <param name="dto">module实体</param>
        /// <returns></returns>
        public async Task<Result<ModuleDto>> Add(ModuleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<ModuleDto, ModuleEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加module
        /// </summary>
        /// <param name="dtos">module集合</param>
        /// <returns></returns>
        public async Task<Result<List<ModuleDto>>> Add(List<ModuleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<ModuleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<ModuleDto>, List<ModuleEntity>>(dtos);
                ds.AddRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">module实体</param>
        /// <returns></returns>
        public async Task<Result<ModuleDto>> Update(ModuleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                db.Update(MapTo<ModuleDto, ModuleEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新module
        /// </summary>
        /// <param name="dtos">module集合</param>
        /// <returns></returns>
        public async Task<Result<List<ModuleDto>>> Update(List<ModuleDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<ModuleDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<ModuleDto>, List<ModuleEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个module
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<ModuleDto>> Delete(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除module
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<ModuleDto>>> Delete(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<ModuleDto>>();
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
        /// 删除单个module
        /// </summary>
        /// <param name="dto">module实体</param>
        /// <returns></returns>
        public async Task<Result<ModuleDto>> Delete(ModuleDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<ModuleDto, ModuleEntity>(dto);
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
        public async Task<Result<ModuleDto>> GetById(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<ModuleEntity, ModuleDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取module分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<ModuleDto>> GetPageData(QueryBase queryBase, Expression<Func<ModuleDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<ModuleEntity>();
                var result = new ResultDto<ModuleDto>();
                var where = queryExp.Cast<ModuleDto, ModuleEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<ModuleDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<ModuleDto, ModuleEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<ModuleEntity>, List<ModuleDto>>(list.Item1);
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
        public async Task<ResultDto<ModuleDto>> GetList(Expression<Func<ModuleDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<ModuleDto, ModuleEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<ModuleEntity>, List<ModuleDto>>(temp);
                var result = new ResultDto<ModuleDto>
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
        /// 根据条件获取单个module数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<ModuleDto>> GetByExp(Expression<Func<ModuleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<ModuleDto, ModuleEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<ModuleEntity,ModuleDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除module数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<ModuleDto>> Delete(Expression<Func<ModuleDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<ModuleDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<ModuleDto, ModuleEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



