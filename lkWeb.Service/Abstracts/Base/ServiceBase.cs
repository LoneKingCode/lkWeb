using AutoMapper;
using lkWeb.Data;
using lkWeb.Service.Dto;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using lkWeb.Core.Extension;
using System.Data.Common;

namespace lkWeb.Service.Abstracts
{
    public abstract class ServiceBase<T> where T : class
    {
        public readonly IMapper _mapper;
        static DbContextOptions<lkWebContext> dbContextOption = new DbContextOptions<lkWebContext>();
        static DbContextOptionsBuilder<lkWebContext> dbContextOptionBuilder = new DbContextOptionsBuilder<lkWebContext>(dbContextOption);
        public ServiceBase(IMapper mapper)
        {
            _mapper = mapper;
        }
        /// <summary>
        /// 获取db
        /// </summary>
        /// <returns></returns>
        public lkWebContext GetDb()
        {
            return new lkWebContext(dbContextOptionBuilder.UseSqlServer(lkWebContext.connectionString).Options);
        }
        /// <summary>
        /// 获取DbSet
        /// </summary>
        /// <param name="db"></param>
        /// <returns></returns>
        protected DbSet<T> GetDbSet(DbContext db)
        {
            return db.Set<T>();
        }

        /// <summary>
        /// 转换
        /// </summary>
        /// <typeparam name="TSource">资源类型</typeparam>
        /// <typeparam name="TDestination">目标类型</typeparam>
        /// <param name="source"></param>
        /// <returns></returns>
        public TDestination MapTo<TSource, TDestination>(TSource source)
        {
            if (source == null) throw new ArgumentNullException();
            return _mapper.Map<TSource, TDestination>(source);
        }
        public object Map(object source, object destination, Type sourceType, Type destinationType)
        {
            return _mapper.Map(source, destination, sourceType, destinationType);
        }
        /// <summary>
        /// 获取查询结果
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="ds">dataset</param>
        /// <param name="orderExp">orderExp</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="isAsc">是否升序</param>
        /// <returns></returns>
        public async Task<Tuple<List<T>, int>> GetQuery<Tkey>(QueryBase queryBase, DbSet<T> ds, Expression<Func<T, Tkey>> orderExp, Expression<Func<T, bool>> queryExp, bool isAsc)
        {
            if (isAsc)
            {
                var query = ds.Where(queryExp).OrderBy(orderExp);
                int totalRecords = query.Count();
                var list = await query.Skip(queryBase.Start)
                   .Take(queryBase.Length).ToListAsync();
                return Tuple.Create(list, totalRecords);
            }
            else
            {
                var query = ds.Where(queryExp).OrderByDescending(orderExp);
                int totalRecords = query.Count();
                var list = await query.Skip(queryBase.Start)
                 .Take(queryBase.Length).ToListAsync();
                return Tuple.Create(list, totalRecords);
            }
        }
    }
}
