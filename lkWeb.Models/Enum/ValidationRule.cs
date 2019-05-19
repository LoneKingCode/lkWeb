using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Models.Enum
{
    public static class ValidationRule
    {
        public static List<object> list = new List<object> {
            new{
                Value="",
                Text="无",
            },
            new{
                Value="letterNumber:true",
                Text="字母数字",
            },
            new{
                Value="cnLetterNumber:true",
                Text="汉字字母数字",
            },
            new{
                Value="chinese:true",
                Text="汉字",
            },
            new{
                Value="chineseAll:true",
                Text="汉字和中文符号",
            },
            new{
                Value="isEmail:true",
                Text="邮箱",
            },
            new{
                Value="isIdCard:true",
                Text="身份证号",
            },
            new{
                Value="isMobile:true",
                Text="手机号",
            },
            new{
                Value="isTel:true",
                Text="电话号码",
            },
            new{
                Value="isContactPhone:true",
                Text="联系电话(手机/电话)",
            },
            new{
                Value="isZipCode:true",
                Text="邮政编码",
            },
        };
    }
}
