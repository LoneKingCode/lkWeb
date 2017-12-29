using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using lkWeb.Core.Extensions;
namespace lkWeb.Service
{


    public class WebHelper
    {
        [DllImport("Iphlpapi.dll")]
        static extern int SendARP(Int32 DestIP, Int32 SrcIP, ref Int64 MacAddr, ref Int32 PhyAddrLen);
        [DllImport("Ws2_32.dll")]
        static extern Int32 inet_addr(string ipaddr);

        public static IHttpContextAccessor _httpContextAccessor;

        /// <summary>
        /// 获取客户端IP地址
        /// </summary>
        /// <returns></returns>
        public static  string GetClientIP()
        {
            if (_httpContextAccessor == null)
            {
                return "0.0.0.0";
            }
            var ip = GetHeaderValueAs<string>("X-Original-For").Split(':')[0];
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

                if (!rawValues.IsEmpty())
                    return (T)Convert.ChangeType(values.ToString(), typeof(T));
            }
            return default(T);
        }
    }
}
