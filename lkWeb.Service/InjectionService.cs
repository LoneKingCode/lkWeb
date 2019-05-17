using lkWeb.Service.Services;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Services
{
    public static partial class InjectionService
    {
        public static IServiceCollection services { get; set; }
        public static void Injection()
        {
            Injection_Auto();
             
        }
    }
}
