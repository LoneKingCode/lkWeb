using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Core.Extension
{
    public static class StringExtensions
    {
        public static string[] Ext_Split(this string s,char separator)
        {
            return s.Split(separator);
        }

        /// <summary>
        /// 是否为空
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool IsEmpty(this string s)
        {
            return (s == null) || (s.Trim().Length == 0);
        }
        /// <summary>
        /// 是否不为空
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool IsNotEmpty(this string s)
        {
            return !s.IsEmpty();
        }
        /// <summary>
        /// 转为int32
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static Int32 ToInt32(this string s)
        {
            if (s.IsEmpty())
                return -1;
            else
                return Convert.ToInt32(s);
        }
        /// <summary>
        /// 首字母大写
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static string InitialUpper(this string s)
        {
            if (s.Length > 1)
            {
                return s[0].ToString().ToUpper() + s.Substring(1, s.Length - 1);
            }
            else
            {
                return s.ToUpper();
            }
        }
    }
}
