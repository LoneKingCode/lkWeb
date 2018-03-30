using lkWeb.Service.Dto;
using lkWeb.Service.Enum;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace lkWeb.Service.Abstracts
{
    public interface ISysService
    {
        /// <summary>
        /// 生成列
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <returns></returns>
        Task<Result<List<TableColumnDto>>> GenerateColumn(int tableId);

        /// <summary>
        /// 设置列属性值
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="filedName"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        Task<Result<List<TableColumnDto>>> SetColumnValue(List<int> ids, string filedName, string value);

        /// <summary>
        /// 获取表数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="condition">查询条件</param>
        /// <param name="orderBy">排序条件</param>
        /// <returns></returns>
        Task<Result<List<Dictionary<string, object>>>> GetData(int tableId, string columns, string condition, string orderBy);

        /// <summary>
        /// 获取分页数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="columns">列</param>
        /// <param name="condition">查询条件</param>
        /// <param name="queryBase">基础查询对象</param>
        /// <returns></returns>
        Task<Result<List<Dictionary<string, object>>>> GetPageData(int tableId, string columns, string condition, QueryBase queryBase);

        /// <summary>
        /// 获取指定表下列名
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="condition">条件</param>
        /// <returns>多个列名逗号隔开</returns>
        Task<Result<string>> GetColumnNames(int tableId, string condition);

        /// <summary>
        /// 添加数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="addModel">数据键值对</param>
        /// <returns></returns>
        Task<Result<bool>> Add(int tableId, Dictionary<string, string> addModel);

        /// <summary>
        /// 更新数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="updateModel">数据键值对</param>
        /// <param name="id">数据主键Id</param>
        /// <returns></returns>
        Task<Result<bool>> Update(int tableId, Dictionary<string, string> updateModel, int id);

        /// <summary>
        /// 删除多条数据
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="ids">要删除的id集合</param>
        /// <returns></returns>
        Task<Result<bool>> Delete(int tableId, List<int> ids);

        /// <summary>
        /// 获取Out类型列对应值
        /// </summary>
        /// <param name="tableId">表Id</param>
        /// <param name="colName">列名</param>
        /// <param name="outValue">值</param>
        /// <returns></returns>
        Task<Result<string>> GetOutValue(int tableId, string columnName, string outValue);

    }
}
