using System;
using System.Collections.Generic;
using System.Text;

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
}
