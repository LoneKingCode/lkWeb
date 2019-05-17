using lkWeb.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Services
{
    public static partial class ServiceLocator
    {
        public static IServiceProvider Instance { get; set; }
        public static T Get<T>() where T : class
        {
            return Instance.GetService(typeof(T)) as T;
        }
        public static lkWebContext lkWebContext()
        {
            return Get<lkWebContext>();
        }
    }

}
