# 库存管理系统

系统分析课程设计-库存管理系统

此项目十分简单易懂，简单的课程设计

**在线演示地址：http://47.107.64.149:8080/2021ssm-inventory/**

采用**JSP**+**Spring5**+**Mybatis**+**SpringMVC**技术，实现基本的增删改查，以及库存的出库入库，是简化的库存管理。能划划水，CRUD接口+搭建界面即可完成。设计存在缺陷！，具体的设计可以自行更改数据库设计，如：添加存储过程以及设置触发器之类的，本项目简单的在Controller层完成业务处理，然后返回CRUD的数据即可，部分接口逻辑判断代码十分冗余，建议抽取公共的工具类。

里面用到插件pagehelper分页，以及阿里巴巴的fastjson

前台页面采用**Layui**框架（很强大，建议学习下，https://www.layui.com/）

和开源项目后台模板**layuimini-v2**



根据系统分析课程设计任务书编写

### 任务要求

> ***\*技术要求\****： 
>
> ​    Java＋SQL Sever2005或者JSP+Mysql，或其他
>
> ***\*系统功能\****：
>
> 系统初始化、进货管理、盘存管理、提货管理、查询、统计分析。
>
> 
>
> ***\*各部分功能\****：
>
> （全部以库存管理信息系统为例）
>
> 1． 系统初始化模块： 空库录入、期末转存、进货清空、提货清空、盘存清空、期初存量设置。
>
> 2． 进货管理模块：进单输入、验货管理、入库管理、单货不符进货处理。
>
> 3． 盘存管理模块： 盘存通知、盘存登记、进货要求生成。（选做）
>
> 4． 提货管理模块： 订单输入、验货管理、出库管理、单货不符提货处理。（选做）
>
> 5． 查询管理：常用定式查询、用户查询生成。 
>
> 6． 统计分析：进销存明细表、进货月报表、提货月报表。
>
> 7． 安全设置：登录，修改口令，权限管理。



### 系统设计

表间关系

![image-20210701211311795](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210701211313.png)

### 实现效果

登陆界面

![image-20210625125436817](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625125930.png)



首页

![image-20210625130057142](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130058.png)

添加表单

![image-20210701211400839](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210701211401.png)

其他

![image-20210625130117755](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130118.png)

![image-20210625130129578](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130130.png)

![image-20210625130721906](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130723.png)

![image-20210625130143340](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130144.png)

![image-20210625130200021](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130200.png)

![image-20210625130213655](https://cdn.jsdelivr.net/gh/Gip886/picture/img/20210625130214.png)

除了供货商列表的增删改查做完了，其他的有查询，但都没写增删改接口，后期可以自行参看`DataController`中的方法，返回`Json`字符串数据给前台就行了，前台页面某些按钮，将注释去掉，有问题参考`layui`文档即可

就是基本的增删改查水平很菜，很划水，做这个也是个体力话，重复操作，编写`sql`不过用了`mybatis`的动态`sql`每张表的增删改查也就4句话，最多加多一两个特殊的要求，比如联表查询，加三层架构，复制粘贴

