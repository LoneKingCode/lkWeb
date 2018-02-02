
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
    public partial class RoleService : ServiceBase<RoleEntity>, IRoleService
    {
		/// <summary>
        ///添加role
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        public bool Add(RoleDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<RoleDto, RoleEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加role
        /// </summary>
        /// <param name="dtos">role集合</param>
        /// <returns></returns>
        public bool Add(List<RoleDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<RoleDto>, List<RoleEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        public bool Update(RoleDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<RoleDto, RoleEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新role
        /// </summary>
        /// <param name="dtos">role集合</param>
        /// <returns></returns>
        public bool Update(List<RoleDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<RoleDto>, List<RoleEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除role
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
        /// 根据id批量删除role
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
        /// 删除单个role
        /// </summary>
        /// <param name="dto">role实体</param>
        /// <returns></returns>
        public bool Delete(RoleDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<RoleDto, RoleEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public RoleDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<RoleEntity, RoleDto>(entity);
                else
                    return null;
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
        public ResultDto<RoleDto> GetPageData(QueryBase queryBase, Expression<Func<RoleDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<RoleEntity>();
                var result = new ResultDto<RoleDto>();
                var where = queryExp.Cast<RoleDto, RoleEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                int recordsTotal;
                //暂时没用到这个
                Expression<Func<RoleDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<RoleDto, RoleEntity, int>();
                var list = GetQuery(queryBase, ds, _orderExp, where, isAsc, out recordsTotal);
                result.data = MapTo<List<RoleEntity>, List<RoleDto>>(list);
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
       public ResultDto<RoleDto> GetList(Expression<Func<RoleDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<RoleDto, RoleEntity, bool>();
                var temp = db.Set<RoleEntity>().Where(_queryExp).OrderBy(item => item.Id).ToList();
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
        /// 根据条件删除role数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public bool Delete(Expression<Func<RoleDto,bool>> exp)
        {
            using (var db = GetDb())
            {
                var ds = GetDbSet(db);
                var _exp = exp.Cast<RoleDto, RoleEntity, bool>();
                var entities = ds.Where(_exp).ToList();
                ds.RemoveRange(entities);
                return db.SaveChanges() > 0;

            }
        }
	}

}



