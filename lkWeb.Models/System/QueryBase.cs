using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Models.System
{
    /// <summary>
    /// 基础查询类 配合Datatable使用
    /// </summary>
   public class QueryBase
    {
        /// <summary>
        /// 获取数据开始位置
        /// </summary>
        public int Start { get; set; }
        /// <summary>
        /// 获取数据长度
        /// </summary>
        public int Length { get; set; }
        /// <summary>
        /// 搜索关键字
        /// </summary>
        public string SearchKey { get; set; }
        /// <summary>
        /// 要排序的列
        /// </summary>
        public string OrderBy { get; set; }
        /// <summary>
        /// 排序方式 asc 或 desc
        /// </summary>
        public string OrderDir { get; set; }
        /// <summary>
        /// 次数 配合Datatables使用
        /// </summary>
        public int Draw { get; set; }
        /// <summary>
        /// 其他值 看需使用
        /// </summary>
        public string Value { get; set; }
    }
}
