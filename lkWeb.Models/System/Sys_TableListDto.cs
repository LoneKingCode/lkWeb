
using System;
using System.Collections.Generic;
using System.Text;
using lkWeb.Models.Enum;
using lkWeb.Models.System.Base;

namespace lkWeb.Models.System
{
    public class Sys_TableListDto : BaseDto
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
        /// 详情是否允许
        /// </summary>
        public byte AllowDetail { get; set; }
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
        /// 查询每行列数
        /// </summary>
        public int SearchColumnPerRow { get; set; }
        /// <summary>
        /// 导入类型  更新，插入，更新或插入
        /// </summary>
        public TableImportType ImportType { get; set; }

        public string ImportTypeName { get { return ImportType.ToString(); } }
        /// <summary>
        /// 删除表名
        /// </summary>
        public string DeleteTableName { get; set; }
        /// <summary>
        /// 批量操作
        /// </summary>
        public string BatchOperation { get; set; }
        /// <summary>
        /// 列表页JavaScript脚本
        /// </summary>
        public string ListPageJavaScript { get; set; }
        /// <summary>
        /// 添加页JavaScript脚本
        /// </summary>
        public string AddPageJavaScript { get; set; }
        /// <summary>
        /// 编辑页JavaScript脚本
        /// </summary>
        public string EditPageJavaScript { get; set; }
        /// <summary>
        /// 详情页JavaScript脚本
        /// </summary>
        public string DetailPageJavaScript { get; set; }
        /// <summary>
        /// 自定义CSS样式
        /// </summary>
        public string CustomCssStyle { get; set; }

    }
}
