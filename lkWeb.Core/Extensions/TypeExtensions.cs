using System;
using System.Linq.Expressions;
using System.Reflection;

namespace lkWeb.Core.Extensions
{
    public static class TypeExtensions
    {
        public static bool GenericEq(this Type type, Type toCompare)
        {
            return type.Namespace == toCompare.Namespace && type.Name == toCompare.Name;
        }
       
        /// <summary>
        /// 获取指定资源类型中指定属性的 表达式
        /// </summary>
        /// <typeparam name="T">资源类型</typeparam>
        /// <typeparam name="TProp">属性类型</typeparam>
        /// <param name="propName">属性名称</param>
        /// <returns></returns>
        public static Expression<Func<T, TProp>> GetKeySelector<T, TProp>(string propName)
        {
            var memberProperty = typeof(T).GetTypeInfo().GetProperty(propName);
            if (memberProperty.PropertyType != typeof(TProp)) throw new Exception();

            var thisArg = Expression.Parameter(typeof(T));
            var lamba = Expression.Lambda<Func<T, TProp>>(Expression.Property(thisArg, memberProperty), thisArg);

            return lamba;
        }
    }
}
