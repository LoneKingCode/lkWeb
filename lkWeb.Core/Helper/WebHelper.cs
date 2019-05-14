using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using lkWeb.Core.Extension;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace lkWeb.Core.Helper
{


    public class WebHelper
    {
        [DllImport("Iphlpapi.dll")]
        static extern int SendARP(Int32 DestIP, Int32 SrcIP, ref Int64 MacAddr, ref Int32 PhyAddrLen);
        [DllImport("Ws2_32.dll")]
        static extern Int32 inet_addr(string ipaddr);

        public static IHttpContextAccessor _httpContextAccessor;
        public static IHostingEnvironment _hostingEnvironment;
        public static ISession _session
        {
            get
            {
                return _httpContextAccessor.HttpContext.Session;
            }
        }
        public static HttpContext _httpContext
        {
            get
            {
                return _httpContextAccessor.HttpContext;
            }
        }

        public static string WebRootPath
        {
            get
            {
                return _hostingEnvironment.WebRootPath;

            }
        }
        public static string UploadPath
        {
            get
            {
                return Path.Combine(WebRootPath, UploadDir);
            }
        }
        public static string UploadDir
        {
            get
            {
                return "Upload";
            }
        }
        public static string TempDir
        {
            get
            {
                return "Temp";
            }
        }
        /// <summary>
        /// 设置Session
        /// </summary>
        /// <typeparam name="T">存储的对象类型</typeparam>
        /// <param name="key"></param>
        /// <param name="value"></param>
        public static void SetSession<T>(string key, T value)
        {
            _session.SetString(key, JsonConvert.SerializeObject(value));
        }

        /// <summary>
        /// 获取Session
        /// </summary>
        /// <typeparam name="T">获取的对象类型</typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public static T GetSession<T>(string key)
        {
            var value = _session.GetString(key);
            return value == null ? default(T) : JsonConvert.DeserializeObject<T>(value);
        }

        /// <summary>
        /// 获取客户端IP地址
        /// </summary>
        /// <returns></returns>
        public static string GetClientIP()
        {
            if (_httpContextAccessor == null)
            {
                return "0.0.0.0";
            }
            var ip = string.Empty;
            try
            {
                ip = GetHeaderValueAs<string>("X-Original-For").Split(':')[0];
            }
            catch (Exception)
            {


            }
            return ip;
        }

        ///<summary>
        ///获取客户端MAC地址
        ///</summary>
        ///<param name="RemoteIP">目标机器的IP地址如(192.168.1.1)</param>
        ///<returns>目标机器的mac 地址</returns>
        public static string GetClientMac()
        {
            string remoteIP = GetClientIP();
            StringBuilder macAddress = new StringBuilder();

            try
            {
                Int32 remote = inet_addr(remoteIP);
                Int64 macInfo = new Int64();
                Int32 length = 6;
                SendARP(remote, 0, ref macInfo, ref length);
                string temp = Convert.ToString(macInfo, 16).PadLeft(12, '0').ToUpper();
                int x = 12;
                for (int i = 0; i < 6; i++)
                {
                    if (i == 5)
                    {
                        macAddress.Append(temp.Substring(x - 2, 2));
                    }
                    else
                    {
                        macAddress.Append(temp.Substring(x - 2, 2) + "-");
                    }

                    x -= 2;
                }
                return macAddress.ToString();
            }
            catch
            {
                return macAddress.ToString();
            }
        }

        public static T GetHeaderValueAs<T>(string headerName)
        {
            StringValues values;

            if (_httpContextAccessor.HttpContext?.Request?.Headers?.TryGetValue(headerName, out values) ?? false)
            {
                string rawValues = values.ToString();   // writes out as Csv when there are multiple.

                if (!rawValues.Ext_IsEmpty())
                    return (T)Convert.ChangeType(values.ToString(), typeof(T));
            }
            return default(T);
        }

        public static bool IsAjax(HttpContext context)
        {
            bool result = false;
            var xreq = context.Request.Headers.ContainsKey("X-Requested-With");
            if (xreq)
            {
                result = context.Request.Headers["x-requested-with"] == "XMLHttpRequest";
            }
            return result;
        }
    }
}
