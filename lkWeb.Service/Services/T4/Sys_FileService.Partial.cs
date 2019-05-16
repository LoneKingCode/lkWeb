
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

namespace lkWeb.Service.Services
{
    public partial class Sys_FileService : ServiceBase<Sys_FileEntity>, ISys_FileService
    {
		public Sys_FileService(IMapper mapper):base(mapper)
		{

		}
		/// <summary>
        ///添加单个sys_file
        /// </summary>
        /// <param name="dto">sys_file实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_FileDto>> AddAsync(Sys_FileDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_FileDto, Sys_FileEntity>(dto);
                await ds.AddAsync(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量添加sys_file
        /// </summary>
        /// <param name="dtos">sys_file集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_FileDto>>> AddAsync(List<Sys_FileDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_FileDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_FileDto>, List<Sys_FileEntity>>(dtos);
                await ds.AddRangeAsync(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">sys_file实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_FileDto>> UpdateAsync(Sys_FileDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                db.Update(MapTo<Sys_FileDto, Sys_FileEntity>(dto));
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 批量更新sys_file
        /// </summary>
        /// <param name="dtos">sys_file集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_FileDto>>> UpdateAsync(List<Sys_FileDto> dtos)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_FileDto>>();
                var ds = GetDbSet(db);
                var entities = MapTo<List<Sys_FileDto>, List<Sys_FileEntity>>(dtos);
                ds.UpdateRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id删除单个sys_file
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Result<Sys_FileDto>> DeleteAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
        /// <summary>
        /// 根据id批量删除sys_file
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public async Task<Result<List<Sys_FileDto>>> DeleteAsync(List<int> ids)
        {
            using (var db = GetDb())
            {
                var result = new Result<List<Sys_FileDto>>();
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
        /// 删除单个sys_file
        /// </summary>
        /// <param name="dto">sys_file实体</param>
        /// <returns></returns>
        public async Task<Result<Sys_FileDto>> DeleteAsync(Sys_FileDto dto)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                var ds = GetDbSet(db);
                var entity = MapTo<Sys_FileDto, Sys_FileEntity>(dto);
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
        public async Task<Result<Sys_FileDto>> GetByIdAsync(int id)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                var ds = GetDbSet(db);
                var entity = await ds.FindAsync(id);
			    if (entity != null)
                {
					 result.data = MapTo<Sys_FileEntity, Sys_FileDto>(entity);
					 result.flag = true;
		    	}
                return result;
            }
        }
        /// <summary>
        /// 获取sys_file分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public async Task<ResultDto<Sys_FileDto>> GetPageDataAsync(QueryBase queryBase, Expression<Func<Sys_FileDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<Sys_FileEntity>();
                var result = new ResultDto<Sys_FileDto>();
                var where = queryExp.Cast<Sys_FileDto, Sys_FileEntity, bool>();
                var isAsc = !string.IsNullOrEmpty(orderDir) && orderDir.ToLower() != "desc";
                //暂时没用到这个
                Expression<Func<Sys_FileDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<Sys_FileDto, Sys_FileEntity, int>();
                var list = await GetQuery(queryBase, ds, _orderExp, where, isAsc);
                result.data = MapTo<List<Sys_FileEntity>, List<Sys_FileDto>>(list.Item1);
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
        public async Task<ResultDto<Sys_FileDto>> GetListAsync(Expression<Func<Sys_FileDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<Sys_FileDto, Sys_FileEntity, bool>();
                var ds = GetDbSet(db);
                var temp = await ds.Where(_queryExp).OrderBy(item => item.Id).ToListAsync();
                var dtoData = MapTo<List<Sys_FileEntity>, List<Sys_FileDto>>(temp);
                var result = new ResultDto<Sys_FileDto>
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
        /// 根据条件获取单个sys_file数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_FileDto>> GetByExpAsync(Expression<Func<Sys_FileDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_FileDto, Sys_FileEntity, bool>();
                var entity = await ds.Where(_exp).FirstOrDefaultAsync();
				   if (entity != null)
                 {
				    result.data = MapTo<Sys_FileEntity,Sys_FileDto>(entity);
					result.flag=true;
				 }
                return result;
            }
        }
        /// <summary>
        /// 根据条件删除sys_file数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public async Task<Result<Sys_FileDto>> DeleteAsync(Expression<Func<Sys_FileDto, bool>> exp)
        {
            using (var db = GetDb())
            {
                var result = new Result<Sys_FileDto>();
                var ds = GetDbSet(db);
                var _exp = exp.Cast<Sys_FileDto, Sys_FileEntity, bool>();
                var entities = await ds.Where(_exp).ToListAsync();
                ds.RemoveRange(entities);
                result.flag = (await db.SaveChangesAsync()) > 0;
                return result;
            }
        }
	}

}



