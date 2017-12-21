
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
    public partial class UserRoleService : ServiceBase<UserRoleEntity>, IUserRoleService
    {
		/// <summary>
        ///添加userrole
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        public bool Add(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<UserRoleDto, UserRoleEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加userrole
        /// </summary>
        /// <param name="dtos">userrole集合</param>
        /// <returns></returns>
        public bool Add(List<UserRoleDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<UserRoleDto>, List<UserRoleEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        public bool Update(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<UserRoleDto, UserRoleEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新userrole
        /// </summary>
        /// <param name="dtos">userrole集合</param>
        /// <returns></returns>
        public bool Update(List<UserRoleDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<UserRoleDto>, List<UserRoleEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除userrole
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
        /// 根据id批量删除userrole
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
        /// 删除单个userrole
        /// </summary>
        /// <param name="dto">userrole实体</param>
        /// <returns></returns>
        public bool Delete(UserRoleDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<UserRoleDto, UserRoleEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public UserRoleDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<UserRoleEntity, UserRoleDto>(entity);
                else
                    return null;
            }
        }
		 /// <summary>
        /// 获取userrole分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="orderExp">orderExp</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="isAsc">是否升序</param>
        /// <returns></returns>
       public ResultDto<UserRoleDto> GetPageData<Tkey>(QueryBase queryBase, Expression<Func<UserRoleDto, Tkey>> orderExp, Expression<Func<UserRoleDto, bool>> queryExp, bool isAsc)
        {
            using (var db =GetDb())
            {
                var ds = db.Set<UserRoleEntity>();
                var result = new ResultDto<UserRoleDto>();
                var order = orderExp.Cast<UserRoleDto, UserRoleEntity, Tkey>();
                var where = queryExp.Cast<UserRoleDto, UserRoleEntity, bool>();
                int recordsTotal;
               var list = GetQuery(queryBase, ds,order, where, isAsc, out recordsTotal);
                result.data = MapTo<List<UserRoleEntity>, List<UserRoleDto>>(list);
                result.recordsTotal = recordsTotal;
                result.pageIndex = queryBase.Start;
                result.pageSize = queryBase.Length;
                return result;
            }
        }
	}

}



