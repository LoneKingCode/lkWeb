
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;
using lkWeb.Core.Extensions;

namespace lkWeb.Service.Abstracts
{
    public partial class OperationLogService : ServiceBase<OperationLogEntity>, IOperationLogService
    {
		/// <summary>
        ///添加operationlog
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        public bool Add(OperationLogDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<OperationLogDto, OperationLogEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加operationlog
        /// </summary>
        /// <param name="dtos">operationlog集合</param>
        /// <returns></returns>
        public bool Add(List<OperationLogDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<OperationLogDto>, List<OperationLogEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        public bool Update(OperationLogDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<OperationLogDto, OperationLogEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新operationlog
        /// </summary>
        /// <param name="dtos">operationlog集合</param>
        /// <returns></returns>
        public bool Update(List<OperationLogDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<OperationLogDto>, List<OperationLogEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除operationlog
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity =ds.FirstOrDefault(item => item.Id == id);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id批量删除operationlog
        /// </summary>
        /// <param name="ids">id集合</param>
        /// <returns></returns>
        public bool DeleteMulti(List<int> ids)
        {
            using (var db = GetDb())
            {
                foreach (var id in ids)
                {
					var ds = GetDbSet(db);
                    var entity =ds.FirstOrDefault(item => item.Id ==id);
                    ds.Remove(entity);
                }
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 删除单个operationlog
        /// </summary>
        /// <param name="dto">operationlog实体</param>
        /// <returns></returns>
        public bool Delete(OperationLogDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<OperationLogDto, OperationLogEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public OperationLogDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<OperationLogEntity, OperationLogDto>(entity);
                else
                    return null;
            }
        }
	 /// <summary>
        /// 获取operationlog分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
         /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public ResultDto<OperationLogDto> GetPageData(QueryBase queryBase, Expression<Func<OperationLogDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<OperationLogEntity>();
                var result = new ResultDto<OperationLogDto>();
                var where = queryExp.Cast<OperationLogDto, OperationLogEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                int recordsTotal;
                //暂时没用到这个
                Expression<Func<OperationLogDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<OperationLogDto, OperationLogEntity, int>();
                var list = GetQuery(queryBase, ds, _orderExp, where, isAsc, out recordsTotal);
                result.data = MapTo<List<OperationLogEntity>, List<OperationLogDto>>(list);
                result.recordsTotal = recordsTotal;
                result.pageIndex = queryBase.Start;
                result.pageSize = queryBase.Length;
                return result;
            }
        }
	}

}



