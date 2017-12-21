
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
    public partial class RoleMenuService : ServiceBase<RoleMenuEntity>, IRoleMenuService
    {
		/// <summary>
        ///添加rolemenu
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        public bool Add(RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<RoleMenuDto, RoleMenuEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加rolemenu
        /// </summary>
        /// <param name="dtos">rolemenu集合</param>
        /// <returns></returns>
        public bool Add(List<RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<RoleMenuDto>, List<RoleMenuEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        public bool Update(RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<RoleMenuDto, RoleMenuEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新rolemenu
        /// </summary>
        /// <param name="dtos">rolemenu集合</param>
        /// <returns></returns>
        public bool Update(List<RoleMenuDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<RoleMenuDto>, List<RoleMenuEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除rolemenu
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
        /// 根据id批量删除rolemenu
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
        /// 删除单个rolemenu
        /// </summary>
        /// <param name="dto">rolemenu实体</param>
        /// <returns></returns>
        public bool Delete(RoleMenuDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<RoleMenuDto, RoleMenuEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public RoleMenuDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<RoleMenuEntity, RoleMenuDto>(entity);
                else
                    return null;
            }
        }
		 /// <summary>
        /// 获取rolemenu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="orderExp">orderExp</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="isAsc">是否升序</param>
        /// <returns></returns>
       public ResultDto<RoleMenuDto> GetPageData<Tkey>(QueryBase queryBase, Expression<Func<RoleMenuDto, Tkey>> orderExp, Expression<Func<RoleMenuDto, bool>> queryExp, bool isAsc)
        {
            using (var db =GetDb())
            {
                var ds = db.Set<RoleMenuEntity>();
                var result = new ResultDto<RoleMenuDto>();
                var order = orderExp.Cast<RoleMenuDto, RoleMenuEntity, Tkey>();
                var where = queryExp.Cast<RoleMenuDto, RoleMenuEntity, bool>();
                int recordsTotal;
               var list = GetQuery(queryBase, ds,order, where, isAsc, out recordsTotal);
                result.data = MapTo<List<RoleMenuEntity>, List<RoleMenuDto>>(list);
                result.recordsTotal = recordsTotal;
                result.pageIndex = queryBase.Start;
                result.pageSize = queryBase.Length;
                return result;
            }
        }
	}

}



