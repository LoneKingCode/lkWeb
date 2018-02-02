
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
    public partial class UserDepartmentService : ServiceBase<UserDepartmentEntity>, IUserDepartmentService
    {
		/// <summary>
        ///添加userdepartment
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        public bool Add(UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<UserDepartmentDto, UserDepartmentEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加userdepartment
        /// </summary>
        /// <param name="dtos">userdepartment集合</param>
        /// <returns></returns>
        public bool Add(List<UserDepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<UserDepartmentDto>, List<UserDepartmentEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        public bool Update(UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<UserDepartmentDto, UserDepartmentEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新userdepartment
        /// </summary>
        /// <param name="dtos">userdepartment集合</param>
        /// <returns></returns>
        public bool Update(List<UserDepartmentDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<UserDepartmentDto>, List<UserDepartmentEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除userdepartment
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
        /// 根据id批量删除userdepartment
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
        /// 删除单个userdepartment
        /// </summary>
        /// <param name="dto">userdepartment实体</param>
        /// <returns></returns>
        public bool Delete(UserDepartmentDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<UserDepartmentDto, UserDepartmentEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public UserDepartmentDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<UserDepartmentEntity, UserDepartmentDto>(entity);
                else
                    return null;
            }
        }
	 /// <summary>
        /// 获取userdepartment分页数据
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="queryExp">queryExp</param>
         /// <param name="orderBy">要排序的列名</param>
        /// <param name="orderDir">asc or desc</param>
        /// <returns></returns>
        public ResultDto<UserDepartmentDto> GetPageData(QueryBase queryBase, Expression<Func<UserDepartmentDto, bool>> queryExp, string orderBy, string orderDir)
        {
            using (var db = GetDb())
            {
                var ds = db.Set<UserDepartmentEntity>();
                var result = new ResultDto<UserDepartmentDto>();
                var where = queryExp.Cast<UserDepartmentDto, UserDepartmentEntity, bool>();
                var isAsc = orderDir.ToLower() != "desc";
                int recordsTotal;
                //暂时没用到这个
                Expression<Func<UserDepartmentDto, int>> orderExp = item => item.Id;
                var _orderExp = orderExp.Cast<UserDepartmentDto, UserDepartmentEntity, int>();
                var list = GetQuery(queryBase, ds, _orderExp, where, isAsc, out recordsTotal);
                result.data = MapTo<List<UserDepartmentEntity>, List<UserDepartmentDto>>(list);
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
       public ResultDto<UserDepartmentDto> GetList(Expression<Func<UserDepartmentDto, bool>> queryExp)
        {
            using (var db = GetDb())
            {
                var _queryExp = queryExp.Cast<UserDepartmentDto, UserDepartmentEntity, bool>();
                var temp = db.Set<UserDepartmentEntity>().Where(_queryExp).OrderBy(item => item.Id).ToList();
                var dtoData = MapTo<List<UserDepartmentEntity>, List<UserDepartmentDto>>(temp);
                var result = new ResultDto<UserDepartmentDto>
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
        /// 根据条件删除userdepartment数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        public bool Delete(Expression<Func<UserDepartmentDto,bool>> exp)
        {
            using (var db = GetDb())
            {
                var ds = GetDbSet(db);
                var _exp = exp.Cast<UserDepartmentDto, UserDepartmentEntity, bool>();
                var entities = ds.Where(_exp).ToList();
                ds.RemoveRange(entities);
                return db.SaveChanges() > 0;

            }
        }
	}

}



