using lkWeb.Service.Enum;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Dto
{
    public class TableListDto : BaseDto
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
        /// 过滤条件
        /// </summary>
        public string DefaultFilter { get; set; }
        /// <summary>
        /// 排序条件
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
        /// 查看，编辑，删除 宽高   width,height|width,height|width,height
        /// </summary>
        public string ViewEditDeleteWidthHeight { get; set; }
        /// <summary>
        /// 导入类型  更新，插入，更新或插入
        /// </summary>
        public TableImportType ImportType { get; set; }

        public string ImportTypeName { get { return ImportType.ToString(); } }
        /// <summary>
        /// 删除表名
        /// </summary>
        public string DeleteTableName { get; set; }
    }
}
