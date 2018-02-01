using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.Service.Dto
{
    public class BaseDto
    {
        public BaseDto()
        {
            CreateDateTime = DateTime.Now;
        }
        /// <summary>
        /// 主键
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateDateTime { get; set; }

    }
}
