using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Models.System
{
    /// <summary>
    /// 分页查询返回对象
    /// </summary>
    /// <typeparam name="T">Data</typeparam>
    public class PageResult<T> where T : class
    {
        /// <summary>
        /// 当前页码
        /// </summary>
        public int pageIndex { get; set; }

        /// <summary>
        /// 每页显示数量
        /// </summary>
        public int pageSize { get; set; }

        /// <summary>
        /// 总记录数
        /// </summary>
        public int recordsTotal { get; set; }

        /// <summary>
        /// 返回的数据
        /// </summary>
        public List<T> data { get; set; }
    }

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
