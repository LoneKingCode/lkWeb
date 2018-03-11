using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class TableListEntity : BaseEntity
    {
        #region 基本信息
        /// <summary>
        /// 表说明
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 表名
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 是否视图
        /// </summary>
        public byte IsView { get; set; }
        /// <summary>
        /// 添加显示列数
        /// </summary>
        public byte AddColumns { get; set; }
        /// <summary>
        /// 编辑显示列数
        /// </summary>
        public byte EditColumns { get; set; }
        /// <summary>
        /// 搜索显示列数
        /// </summary>
        public byte SearchColumns { get; set; }
        #endregion

        /// <summary>
        /// 默认过滤条件
        /// </summary>
        public string DefaultFilter { get; set; }
        /// <summary>
        /// 默认排序条件
        /// </summary>
        public string DefaultSort { get; set; }
        /// <summary>
        /// 禁止删除条件
        /// </summary>
        public string ForbiddenDeleteFilter { get; set; }
        /// <summary>
        /// 禁止更新条件
        /// </summary>
        public string ForbiddenUpdateFilter { get; set; }
        /// <summary>
        /// 禁止添加条件
        /// </summary>
        public string ForbiddenAddFilter { get; set; }
        /// <summary>
        /// 扩展方法 {0} {1}分别代表主键或者什么的
        /// </summary>
        public string ExtendFunction { get; set; }
        /// <summary>
        /// 查看，编辑，删除是否可见  1,1,1
        /// </summary>
        public string ViewEditDeleteSet { get; set; }
        /// <summary>
        /// 查看，编辑，删除 宽高   width,height|width,height|width,height
        /// </summary>
        public string ViewEditDeleteWidthHeight { get; set; }
        /// <summary>
        /// 导入类型  更新，插入，更新或插入
        /// </summary>
        public byte ImportType { get; set; }
        /// <summary>
        /// 删除表名
        /// </summary>
        public string DeleteTableName { get; set; }

    }
}
