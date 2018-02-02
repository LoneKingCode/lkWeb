
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
    public partial class MenuService : ServiceBase<MenuEntity>, IMenuService
    {
		/// <summary>
        ///添加menu
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        public bool Add(MenuDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<MenuDto, MenuEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加menu
        /// </summary>
        /// <param name="dtos">menu集合</param>
        /// <returns></returns>
        public bool Add(List<MenuDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<MenuDto>, List<MenuEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        public bool Update(MenuDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<MenuDto, MenuEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新menu
        /// </summary>
        /// <param name="dtos">menu集合</param>
        /// <returns></returns>
        public bool Update(List<MenuDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<MenuDto>, List<MenuEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除menu
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
        /// 根据id批量删除menu
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
        /// 删除单个menu
        /// </summary>
        /// <param name="dto">menu实体</param>
        /// <returns></returns>
        public bool Delete(MenuDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<MenuDto, MenuEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MenuDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<MenuEntity, MenuDto>(entity);
                else
                    return null;
            }
        }
	 /// <summary>
        /// 获取menu分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
         /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public ResultDto<MenuDto> GetPageData(QueryBase queryBase, Expression<Func<MenuDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<MenuEntity>();
                var result = new ResultDto<MenuDto>();
                var where = queryExp.Cast<MenuDto, MenuEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                int recordsTotal;
                //暂时没用到这个
                Expression<Func<MenuDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<MenuDto, MenuEntity, int>();
                var list = GetQuery(queryBase, ds, _orderExp, where, isAsc, out recordsTotal);
                result.data = MapTo<List<MenuEntity>, List<MenuDto>>(list);
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
       public ResultDto<MenuDto> GetList(Expression<Func<MenuDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<MenuDto, MenuEntity, bool>();
                var temp = db.Set<MenuEntity>().Where(_queryExp).OrderBy(item => item.Id).ToList();
                var dtoData = MapTo<List<MenuEntity>, List<MenuDto>>(temp);
                var result = new ResultDto<MenuDto>
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
        /// 根据条件删除menu数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public bool Delete(Expression<Func<MenuDto,bool>> exp)
        {
            using (var db = GetDb())
            {
                var ds = GetDbSet(db);
                var _exp = exp.Cast<MenuDto, MenuEntity, bool>();
                var entities = ds.Where(_exp).ToList();
                ds.RemoveRange(entities);
                return db.SaveChanges() > 0;

            }
        }
	}

}



