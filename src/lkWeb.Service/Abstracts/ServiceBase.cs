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

namespace lkWeb.Service.Abstracts
{
    public class ServiceBase
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
        public lkWebContext GetDb()
        {
            return new lkWebContext(dbContextOptionBuilder.UseSqlServer(connectionString, b => b.MigrationsAssembly("lkWeb")).Options);
        }
        /// <summary>
        /// 转换
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TDestination"></typeparam>
        /// <param name="source"></param>
        /// <returns></returns>
        public TDestination MapTo<TSource, TDestination>(TSource source)
        {
            if (source == null) throw new ArgumentNullException();
            return _mapper.Map<TSource, TDestination>(source);
        }
        /// <summary>
        /// 获取分页数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TKey"></typeparam>
        /// <param name="pageSize"></param>
        /// <param name="pageIndex"></param>
        /// <param name="whereExp"></param>
        /// <param name="orderExp"></param>
        /// <param name="isDesc"></param>
        /// <returns></returns>
        public ResultDto<T> GetPageData<T, TKey>(int pageSize, int pageIndex, Expression<Func<T, bool>> whereExp, Expression<Func<T, TKey>> orderExp, bool isDesc = true) where T : class
        {
            using (var db = GetDb())
            {
                db.Set<T>().Where(whereExp).Count();
                if (isDesc)
                {
                    var temp = db.Set<T>().Where(whereExp)
                        .OrderByDescending<T, TKey>(orderExp)
                        .Skip(pageSize * (pageIndex - 1))
                        .Take(pageSize);
                    return new ResultDto<T>()
                    {
                        recordsTotal = db.Set<T>().Where(whereExp).Count(),
                        data = temp.ToList(),
                        pageSize = pageSize,
                        pageIndex = pageIndex
                    };
                }

                else
                {
                    var temp = db.Set<T>().Where(whereExp)
                       .OrderBy<T, TKey>(orderExp)
                       .Skip(pageSize * (pageIndex - 1))
                       .Take(pageSize);
                    return new ResultDto<T>()
                    {
                        recordsTotal = db.Set<T>().Where(whereExp).Count(),
                        data = temp.ToList(),
                        pageSize = pageSize,
                        pageIndex = pageIndex
                    };
                }
            }
            throw new NotImplementedException();
        }
    }
}
