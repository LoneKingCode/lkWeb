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
using lkWeb.Core.Extensions;

namespace lkWeb.Service.Abstracts
{
    public abstract class ServiceBase<T> where T : class
    {
        public readonly IMapper _mapper;
        static string connectionString = "Password=hacker5402;Persist Security Info=True;User ID=sa;Initial Catalog=lkWeb;Data Source=.";
        static DbContextOptions<lkWebContext> dbContextOption = new DbContextOptions<lkWebContext>();
        static DbContextOptionsBuilder<lkWebContext> dbContextOptionBuilder = new DbContextOptionsBuilder<lkWebContext>(dbContextOption);
        public ServiceBase()
        {
            var mapperConfiguration = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new AutoMapperConfiguration());
            });
            _mapper = mapperConfiguration.CreateMapper();
        }
        /// <summary>
        /// 获取db
        /// </summary>
        /// <returns></returns>
        public lkWebContext GetDb()
        {
            return new lkWebContext(dbContextOptionBuilder.UseSqlServer(connectionString, b => b.MigrationsAssembly("lkWeb")).Options);
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

        /// <summary>
        /// 获取查询结果
        /// </summary>
        /// <param name="queryBase">基础查询对象</param>
        /// <param name="ds">dataset</param>
        /// <param name="orderExp">orderExp</param>
        /// <param name="queryExp">queryExp</param>
        /// <param name="isAsc">是否升序</param>
        /// <returns></returns>
        public List<T> GetQuery<Tkey>(QueryBase queryBase, DbSet<T> ds, Expression<Func<T, Tkey>> orderExp, Expression<Func<T, bool>> queryExp, bool isAsc, out int totalRecords)
        {
             if (isAsc)
            {
                var query = ds.Where(queryExp).OrderBy(orderExp);
                totalRecords = query.Count();
                var list = query.Skip(queryBase.Start)
                   .Take(queryBase.Length).ToList();
                return list;
            }
            else
            {
                var query = ds.Where(queryExp).OrderByDescending(orderExp);
                totalRecords = query.Count();
                var list = query.Skip(queryBase.Start)
                 .Take(queryBase.Length).ToList();
                return list;
            }
        }


    }
}
