
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
    public partial class DepartmentService : ServiceBase<DepartmentEntity>, IDepartmentService
    {
		/// <summary>
        ///添加department
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        public bool Add(DepartmentDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<DepartmentDto, DepartmentEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加department
        /// </summary>
        /// <param name="dtos">department集合</param>
        /// <returns></returns>
        public bool Add(List<DepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<DepartmentDto>, List<DepartmentEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        public bool Update(DepartmentDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<DepartmentDto, DepartmentEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新department
        /// </summary>
        /// <param name="dtos">department集合</param>
        /// <returns></returns>
        public bool Update(List<DepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<DepartmentDto>, List<DepartmentEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除department
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
        /// 根据id批量删除department
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
        /// 删除单个department
        /// </summary>
        /// <param name="dto">department实体</param>
        /// <returns></returns>
        public bool Delete(DepartmentDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<DepartmentDto, DepartmentEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public DepartmentDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<DepartmentEntity, DepartmentDto>(entity);
                else
                    return null;
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
        public ResultDto<DepartmentDto> GetPageData(QueryBase queryBase, Expression<Func<DepartmentDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<DepartmentEntity>();
                var result = new ResultDto<DepartmentDto>();
                var where = queryExp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                int recordsTotal;
                //暂时没用到这个
                Expression<Func<DepartmentDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<DepartmentDto, DepartmentEntity, int>();
                var list = GetQuery(queryBase, ds, _orderExp, where, isAsc, out recordsTotal);
                result.data = MapTo<List<DepartmentEntity>, List<DepartmentDto>>(list);
                result.recordsTotal = recordsTotal;
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
       public ResultDto<DepartmentDto> GetList(Expression<Func<DepartmentDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var temp = db.Set<DepartmentEntity>().Where(_queryExp).OrderBy(item => item.Id).ToList();
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
        /// 根据条件删除department数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public bool Delete(Expression<Func<DepartmentDto,bool>> exp)
        {
            using (var db = GetDb())
            {
                var ds = GetDbSet(db);
                var _exp = exp.Cast<DepartmentDto, DepartmentEntity, bool>();
                var entities = ds.Where(_exp).ToList();
                ds.RemoveRange(entities);
                return db.SaveChanges() > 0;

            }
        }
	}

}



