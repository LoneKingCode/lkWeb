
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using lkWeb.Service.Dto;
using lkWeb.Entity;
using System.Linq;

namespace lkWeb.Service.Abstracts
{
    public partial class LoginLogService : ServiceBase<LoginLogEntity>, ILoginLogService
    {
		/// <summary>
        ///添加loginlog
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        public bool Add(LoginLogDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<LoginLogDto, LoginLogEntity>(dto);
                ds.Add(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 批量添加loginlog
        /// </summary>
        /// <param name="dtos">loginlog集合</param>
        /// <returns></returns>
        public bool Add(List<LoginLogDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<LoginLogDto>, List<LoginLogEntity>>(dtos);
                ds.AddRange(entities);
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 更新单个数据
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        public bool Update(LoginLogDto dto)
        {
            using (var db = GetDb())
            {
                db.Update(MapTo<LoginLogDto, LoginLogEntity>(dto));
                return db.SaveChanges() > 0;
            }
        }
		   /// <summary>
        /// 批量更新loginlog
        /// </summary>
        /// <param name="dtos">loginlog集合</param>
        /// <returns></returns>
        public bool Update(List<LoginLogDto> dtos)
        {
            using (var db = GetDb())
            {
			    var ds = GetDbSet(db);
                var entities =  MapTo<List<LoginLogDto>, List<LoginLogEntity>>(dtos);
                ds.UpdateRange(entities);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id删除loginlog
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
        /// 根据id批量删除loginlog
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
        /// 删除单个loginlog
        /// </summary>
        /// <param name="dto">loginlog实体</param>
        /// <returns></returns>
        public bool Delete(LoginLogDto dto)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = MapTo<LoginLogDto, LoginLogEntity>(dto);
                ds.Remove(entity);
                return db.SaveChanges() > 0;
            }
        }
        /// <summary>
        /// 根据id获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public LoginLogDto GetById(int id)
        {
            using (var db = GetDb())
            {
				var ds = GetDbSet(db);
                var entity = ds.FirstOrDefault(item => item.Id == id);
                if (entity != null)
                    return MapTo<LoginLogEntity, LoginLogDto>(entity);
                else
                    return null;
            }
        }
	}

}



