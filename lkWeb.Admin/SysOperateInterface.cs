using lkWeb.Models.System;
using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Admin
{
    public  enum OperateType
    {
        添加 = 1,
        编辑 = 2
    }
    public class SysOperateInterface
    {
        public static void OperateTriggerBefore(Sys_TableListDto table,OperateType opType,int itemId,Dictionary<string,string> dic)
        {
            switch (table.Id)
            {
                default:
                    break;
            }
        }
        public static void OperateTriggerAfter(Sys_TableListDto table, OperateType opType, int itemId, Dictionary<string, string> dic)
        {
            switch (table.Id)
            {
                default:
                    break;
            }
        }

        public static void ImportBefore()
        {

        }

        public static void ImportAfter()
        {

        }
    }
}
