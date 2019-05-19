using lkWeb.Core.Helper;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Filter
{
    public class HttpGlobalExceptionFilter : IExceptionFilter
    {
        public void OnException(ExceptionContext context)
        {
         
            LoggerHelper.Logger.Error($"全局异常过滤器捕获的异常\n 请求地址:{context.HttpContext.Request.Path} \n 错误信息:{context.Exception.Message} \n 堆栈跟踪:{context.Exception.StackTrace}");
      
        }
    }
}
