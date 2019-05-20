using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Models.System
{
  
    /// <summary>
    /// 通用json返回对象
    /// </summary>
    public class Result<T>
    {
        public Result()
        {
            flag = false;
            data = default(T);
            msg = string.Empty;
        }
        /// <summary>
        /// 是否操作成功
        /// </summary>
        public bool flag { get; set; }

        /// <summary>
        /// 返回的对象
        /// </summary>
        public T data { get; set; }
        private string _msg { get; set; }
        /// <summary>
        /// 返回的提示消息
        /// </summary>
        public string msg
        {
            get { return _msg.TrimEnd(',','，'); }
            set { _msg = value; }
        }
    }
}
