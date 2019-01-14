using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Entity
{
    public class TableListEntity : BaseEntity
    {
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
        /// 扩展方法
        /// </summary>
        public string ExtendFunction { get; set; }
        /// <summary>
        /// 顶部扩展方法
        /// </summary>
        public string TopExtendFunction { get; set; }
        /// <summary>
        /// 查看是否允许
        /// </summary>
        public byte AllowView { get; set; }
        /// <summary>
        /// 添加是否允许
        /// </summary>
        public byte AllowAdd { get; set; }
        /// <summary>
        /// 编辑是否允许
        /// </summary>
        public byte AllowEdit { get; set; }
        /// <summary>
        /// 删除是否允许
        /// </summary>
        public byte AllowDelete { get; set; }
        /// <summary>
        /// 导入是否允许
        /// </summary>
        public byte AllowImport { get; set; }
        /// <summary>
        /// 导出是否允许
        /// </summary>
        public byte AllowExport { get; set; }
        /// <summary>
        /// 查看，添加编辑  宽高   width,height|width,height
        /// </summary>
        public string ViewEditWidthHeight { get; set; }
        /// <summary>
        /// 添加编辑查看每行列数
        /// </summary>
        public int ColumnPerRow { get; set; }
        /// <summary>
        /// 导入类型  更新，插入，更新或插入
        /// </summary>
        public byte ImportType { get; set; }
        /// <summary>
        /// 删除表名
        /// </summary>
        public string DeleteTableName { get; set; }
        /// <summary>
        /// JavaScript脚本 onload时执行
        /// </summary>
        public string JavaScript { get; set; }

        public virtual ICollection<TableColumnEntity> TableColumns { get; set; }

    }
}
