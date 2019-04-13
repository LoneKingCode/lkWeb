using lkWeb.Entity.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace lkWeb.Entity
{
    public class Sys_TableColumnEntity : BaseEntity
    {
        #region 基本信息
        /// <summary>
        /// 所属表
        /// </summary>
        public int TableId { get; set; }
        /// <summary>
        /// 列名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 列说明
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 数据类型
        /// </summary>
        public string DataType { get; set; }
        /// <summary>
        /// 是否必填
        /// </summary>
        public byte Required { get; set; }
        /// <summary>
        /// 输入控制
        /// </summary>
        public int MaxLength { get; set; }
        #endregion

        #region 显示顺序
        /// <summary>
        /// 详情显示顺序
        /// </summary>
        public int ViewOrder { get; set; }
        /// <summary>
        /// 列表显示顺序
        /// </summary>
        public int ListOrder { get; set; }
        /// <summary>
        /// 添加编辑显示顺序
        /// </summary>
        public int EditOrder { get; set; }

        #endregion

        #region 是否可见
        /// <summary>
        /// 导入是否可见
        /// </summary>
        public byte ImportVisible { get; set; }
        /// <summary>
        /// 导出是否可见
        /// </summary>
        public byte ExportVisible { get; set; }
        /// <summary>
        /// 详情是否可见
        /// </summary>
        public byte ViewVisible { get; set; }
        /// <summary>
        /// 添加是否可见
        /// </summary>
        public byte AddVisible { get; set; }
        /// <summary>
        /// 查询是否可见
        /// </summary>
        public byte SearchVisible { get; set; }
        /// <summary>
        /// 编辑是否可见
        /// </summary>
        public byte EditVisible { get; set; }
        /// <summary>
        /// 列表是否可见
        /// </summary>
        public byte ListVisible { get; set; }

        #endregion

        /// <summary>
        /// 外部SQL Example: Id,Name|Sys_Department|ParentId=0
        /// </summary>
        public string OutSql { get; set; }
        /// <summary>
        /// 枚举值范围
        /// </summary>
        public string EnumRange { get; set; }
        /// <summary>
        /// 单选/多选值范围
        /// </summary>
        public string SelectRange { get; set; }
        /// <summary>
        /// 禁止上传的文件类型
        /// </summary>
        public string ForbiddenFileExtension { get; set; }
        /// <summary>
        /// 自定义内容
        /// </summary>
        public string CustomContent { get; set; }
        /// <summary>
        /// 是否主键
        /// </summary>
        public byte PrimaryKey { get; set; }
        /// <summary>
        /// 验证规则
        /// </summary>

        public string ValidationRule { get; set; }

    }
}
