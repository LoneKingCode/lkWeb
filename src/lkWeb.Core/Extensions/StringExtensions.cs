using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Core.Extensions
{
    public static class StringExtensions
    {
        public static bool IsEmpty(this string s)
        {
            return (s == null) || (s.Trim().Length == 0);
        }
        public static bool IsNotEmpty(this string s)
        {
            return !s.IsEmpty();
        }
        public static Int32 ToInt32(this string s)
        {
            if (s.IsEmpty())
                return -1;
            else
                return Convert.ToInt32(s);
        }
    }
}
