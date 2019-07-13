using lkWeb.Models.System;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Admin
{
    public enum OperateType
    {
        添加 = 1,
        编辑 = 2
    }
    public class SysOperateInterface
    {
        /// <summary>
        /// 操作前事件
        /// </summary>
        /// <param name="table">表Dto</param>
        /// <param name="opType">操作类型</param>
        /// <param name="itemId">操作项Id</param>
        /// <param name="dic"></param>
        public static void OperateTriggerBefore(Sys_TableListDto table, OperateType opType, IList<int> itemId, Dictionary<string, string> dic)
        {
            switch (table.Id)
            {
                default:
                    break;
            }
        }
        /// <summary>
        /// 操作后事件
        /// </summary>
        /// <param name="table">表Dto</param>
        /// <param name="opType">操作类型</param>
        /// <param name="itemId">操作项Id</param>
        /// <param name="dic"></param>
        public static void OperateTriggerAfter(Sys_TableListDto table, OperateType opType, IList<int> itemId, Dictionary<string, string> dic)
        {
            switch (table.Id)
            {
                default:
                    break;
            }
        }

        /// <summary>
        /// 导出后事件
        /// </summary>
        /// <param name="table">表Dto</param>
        /// <param name="colValues">列值</param>
        /// <param name="colDtos">列Dto(与列值顺序一样)</param>

        public static void ImportBefore(Sys_TableListDto table, IList<List<string>> colValues, IList<Sys_TableColumnDto> colDtos)
        {
            switch (table.Id)
            {
                default:
                    break;
            }
        }
        /// <summary>
        /// 导入后事件
        /// </summary>
        /// <param name="table">表Dto</param>
        /// <param name="colValues">列值</param>
        /// <param name="colDtos">列Dto(与列值顺序一样)</param>
        public static void ImportAfter(Sys_TableListDto table, IList<List<string>> colValues, IList<Sys_TableColumnDto> colDtos)
        {
            switch (table.Id)
            {
                default:
                    break;
            }
        }
    }
}
