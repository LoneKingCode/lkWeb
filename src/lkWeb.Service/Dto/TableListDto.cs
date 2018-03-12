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
        public TableImportType ImportType { get; set; }

        public string ImportTypeName { get { return ImportType.ToString(); } }
        /// <summary>
        /// 删除表名
        /// </summary>
        public string DeleteTableName { get; set; }
    }
}
