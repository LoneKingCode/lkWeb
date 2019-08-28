using System;
using System.Collections.Generic;
using System.Text;

namespace lkWeb.Models.Enum
{
    public static class DateFormat
    {
        public static List<object> list = new List<object> {
            new{
                Value="yyyy-mm-dd",
                Text="年月日",
            },
              new{
                Value="yyyy-mm-dd hh",
                Text="年月日时",
            },
                new{
                Value="yyyy-mm-dd hh:ii",
                Text="年月日时分",
            },
                  new{
                Value="mm-dd",
                Text="月日",
            },
                    new{
                Value="mm-dd hh",
                Text="月日时",
            },

                    new{
                Value="mm-dd hh:ii",
                Text="月日时分",
            }
        };
    }
}
