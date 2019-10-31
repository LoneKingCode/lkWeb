### 项目简介
###### (诸多功能待补充完善，开发中)
本框架采用.net core+ef core开发，包含基础模块(角色管理、部门管理、用户管理、子系统管理、角色授权、菜单管理、表管理、表结构管理、字典管理、系统日志等等)可以直接作为一个后台管理系统的脚手架。
### 项目架构
.net core+ef core+sql server+AutoMapper+Bootstrap+Jquery
### 技术要点
1.只需要后台进行配置，无需生成任何代码，即可拥有一个完整功能的模块，增删改查导入导出EXCEL等等，并可高度自定义化，即时修改即时生效，无需重新发布  
2.丰富的列类型，富文本编辑器，图片/文件，日期，时间，等等基础类型并可配置详细参数，都只在后台配置即可及时生效  
3.根据后台配置自动构建表单  
4.集成Hangfire分布式后端作业调度框架服务  
5.集成Nlog日志记录  
6.各service使用依赖注入  
7.因框架特殊性,由以前CodeFirst改为现在的DBFirst  
8.全站表单防CSRF攻击  
9.多标签式切换  

## 简易文档
### 表管理 表部分说明
- 导入类型: 插入/更新/插入或更新  
- 批量操作: 例如: IsTop|是否置顶,Hide|是否隐藏 IsTop为表中字段  
- 默认过滤条件: 例如: Id < 10 可选参数{UserId}  
- 默认排序条件: 例如:Id desc  
- 禁止删除条件: 例如: Id < 10 可选参数{UserId}  (设定时会判断每条数据，显示/隐藏该条数据的操作按钮)
- 禁止更新条件: 例如: Id < 10 可选参数{UserId}  (设定时会判断每条数据，显示/隐藏该条数据的操作按钮)
- 添加编辑详情URL: 添加url,编辑url,详情url  可选参数{Id}{TableId}
- 列扩展方法: 为html代码 可选参数{Id},{UserId},{TableId}  
- 顶部扩展方法: 为html代码 可选参数{Id},{UserId},{TableId}  
- 列表页JS:可选参数{TableId}
- 添加页JS:可选参数{TableId} 
- 编辑页JS:可选参数{TableId}
- 详情页JS:可选参数{TableId}
- 自定义CSS:页面通用,表所在页面顶级CSS Class都为表名，样式写为其子样式即可  
### 表结构管理 列部分说明
##### 数据类型：
- String: 字符串
- Int: 整数
- Decimal: 小数
- MultiLine_String: 多行字符串(就是textarea)
- Out: 外表查询，下拉
- MultiSelect_Out: 多选外表查询，下拉,并可保存数据到外表
- Datetime: 日期
- Time: 时间
- Enum: 枚举
- MultiSelect: 多选下拉
- File: 文件
- Image: 图片
- Custom: 自定义内容
- RichText: 富文本编辑器
##### 部分参数说明
- 日期时间格式: 例如yyyy-MM-dd HH:mm:ss  
- 验证类型：自定义正则/整数/字母数字/手机号/邮箱等等等等  
- 导入验证类型：正则验证/SQL带入验证  
- 外部SQL：主要针对OUT类型列,例如:Id,Name|Sys_Activity|id>0|1|Sys_DeptActivity|DeptId,ActivityId|a='2',b='3' (主键,显示列名|表名|条件|是否保存到它表|保存表名,当前表外键名,Out表外键名|其他字段值)  
- 自定义内容：可选参数{Id},{UserId} 任意html  

### 接下来主要说一下如何简单配置一下实现一个模块的功能。
比如数据库现在有一个表Test_Leader
##### 1.点击菜单表管理，添加一条新的数据如图
![](https://i.loli.net/2019/10/30/gbtRwyQvS7VosdJ.png)
##### 2.保存后选中该表，点击生成列
![](https://i.loli.net/2019/10/30/nmP3CJEXDOew6VR.png)
##### 3.记住该表Id,去菜单中添加菜单url为/admin/viewlist/index/表id即可
##### 4.点击表结构管理，配置各种可见不可见属性，以及列类型
![](https://i.loli.net/2019/10/30/ud2Q1Z7EB65Jq4R.png)
##### 5.配置用户角色菜单的权限即可
![](https://i.loli.net/2019/10/30/kP6rznw2EC5cegQ.png)
##### 6.访问菜单 效果如图
![](https://i.loli.net/2019/10/30/wZndUxRQk2oD3FM.png)
