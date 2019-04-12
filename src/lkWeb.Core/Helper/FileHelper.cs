using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Core.Helper
{
    public static class FileHelper
    {
        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="url">文件URL地址</param>
        /// <param name="filePath">文件的保存位置 包含文件名及其后缀</param>
        /// <returns></returns>
        public static string DownloadFile(string url, string filePath)
        {
            var loadPath = Path.Combine(filePath, DateTime.Now.ToFileTime() + Path.GetExtension(url));
            try
            {
                //  var webClient = new WebClient();
                // 进行下载，下载完成，函数返回
                //  webClient.DownloadFile(url, loadPath);
            }
            catch (Exception)
            {
                //发生错误时在调试窗口显示错误信息
                loadPath = "";
                // 根据需要抛出或是不抛出异常
                //            throw;
            }
            return loadPath;
        }
        /// <summary>
        /// 将文件路径转换为 http地址 也就是替换\为/
        /// </summary>
        /// <returns></returns>
        public static string PathConvertToUrl(string path)
        {
            string url = path.Replace('\\', '/').Trim('/');
            url = "/" + url;
            return url;
        }
    }
}
