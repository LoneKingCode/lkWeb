using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Service.Enum
{
    public static class ColumnType
    {
        public static string String { get { return "String"; } }
        public static string Int { get { return "Int"; } }
        public static string Decimal { get { return "Decimal"; } }
        public static string Out { get { return "Out"; } }
        public static string MultiSelect_Out { get { return "MultiSelect_Out"; } }
        public static string Date { get { return "Date"; } }
        public static string Datetime { get { return "Datetime"; } }
        public static string Enum { get { return "Enum"; } }
        public static string MultiSelect { get { return "MultiSelect"; } }
        public static string File { get { return "File"; } }
        public static string Image { get { return "Image"; } }
        public static string Custom { get { return "Custom"; } }
        public static string RichText { get { return "RichText"; } }

        public static List<string> list = new List<string>
        {
            String,
            Int,
            Decimal,
            Out,
            MultiSelect_Out,
            Date,
            Datetime,
            Enum,
            MultiSelect,
            File,
            Custom,
            RichText
        };
    }

}
