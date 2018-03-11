using NLog;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Core.Extensions
{
    public static class LoggerHelper
    {
        public static Logger Logger = LogManager.GetCurrentClassLogger();
        //Logger.Info("普通信息日志-----------");
        //Logger.Debug("调试日志-----------");
        //Logger.Error("错误日志-----------");
        //Logger.Fatal("异常日志-----------");
        //Logger.Warn("警告日志-----------");
        //Logger.Trace("跟踪日志-----------");
        //Logger.Log(NLog.LogLevel.Warn, "Log日志------------------");
    }
}
