
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
    public partial class UserService : ServiceBase<UserEntity>, IUserService
    {
		/// <summary>
        ///添加user
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public bool Add(UserDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<UserDto, UserEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加user
        /// </summary>
        /// <param name="dtos">user集合</param>
        /// <returns></returns>
        public bool Add(List<UserDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<UserDto>, List<UserEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public bool Update(UserDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<UserDto, UserEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新user
        /// </summary>
        /// <param name="dtos">user集合</param>
        /// <returns></returns>
        public bool Update(List<UserDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<UserDto>, List<UserEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除user
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
        /// 根据id批量删除user
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
        /// 删除单个user
        /// </summary>
        /// <param name="dto">user实体</param>
        /// <returns></returns>
        public bool Delete(UserDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<UserDto, UserEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public UserDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<UserEntity, UserDto>(entity);
                else
                    return null;
            }
        }
	 /// <summary>
        /// 获取user分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
         /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public ResultDto<UserDto> GetPageData(QueryBase queryBase, Expression<Func<UserDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<UserEntity>();
                var result = new ResultDto<UserDto>();
                var where = queryExp.Cast<UserDto, UserEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                int recordsTotal;
                //暂时没用到这个
                Expression<Func<UserDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<UserDto, UserEntity, int>();
                var list = GetQuery(queryBase, ds, _orderExp, where, isAsc, out recordsTotal);
                result.data = MapTo<List<UserEntity>, List<UserDto>>(list);
                result.recordsTotal = recordsTotal;
                result.pageIndex = queryBase.Start;
                result.pageSize = queryBase.Length;
                return result;
            }
        }
	}

}



