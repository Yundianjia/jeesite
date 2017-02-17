# JeeSite 学习笔记

JeeSite 是一个企业快速开发的平台, 具有更好的生产力。 项目的特点:

基于 Spring + Maven。

## 项目的目录结构

jeesite 项目的结构:

```
.
├── LICENSE.txt
├── Learn.md - 学习笔记
├── README.md - 自吹自雷的功能特性
├── bin - 一些脚本
├── db - 数据库脚本
│   ├── act - activiti 的数据脚本
│   ├── cms - cms 数据
│   ├── gen - 代码生成的数据库
│   ├── init-db.bat - 初始化数据的 bat 脚本
│   ├── init-db.sh - 初始化的数据的 shell 脚本
│   ├── jeesite_mysql.sql
│   ├── oa - oa 相关的脚本
│   ├── sys - 系统相关的脚本
│   ├── test - 测试相关的脚本
│   └── upgrade - 升级脚本
├── doc - 系统文档以及文档的具体内容。
├── jeesite.iml
├── pom.xml - maven 的依赖关系文件
├── proguard.cfg - ProGuard是一个压缩、优化和混淆Java字节码文件的免费的工具，它可以删除无用的类、字段、方法和属性。
├── src - 源代码目录
└── target - 生成的目标的目录的问题
```

`src/main/webapp/userfiles` 是在运行中生成用户上传文件的目录。

java 中将其他的一些项目引入时, 可以通过在 webapp 中, 将相关的文件和目录直接拷贝过去。

## 安装部署配置

创建数据库, 并且创建相关的数据表:

```
CREATE DATABASE IF NOT EXISTS jeesite default charset utf8 COLLATE utf8_general_ci;

use jeesite;

source db/jeesite_mysql.sql;
```

然后, 运行 `mvn antrun:run -Pinit-db` 就可以创建数据相关的信息。 这里, `-P` 指的就是 Profiles 这样的意思。

修改 `src/main/resources/jeesite.properties` 中, 关于项目的很多的数据信息。

升级了项目的 jetty 运行服务器的版本。

## 布局和模板

布局与模板, 使用了 `sitemesh`, 后者, 通过 spring-context 中的 filter 实现布局的功能。

布局模板页面, 主要在 `webapp/WEB-INF/views/layouts` 这个目录中。 这其实就和 rails 中的布局模板有很多。

## 工作流

工作流, 采用了 Activiti 5.21 的第三方的 jar 包。 在使用经验上, 还是有所缺陷的。 可以结合着U9 的具体 OA, 从而, 来学习
来了解工作流。

相关的一些组件, 一些功能, 还需要进一步的去学习和了解。

工作流, 物流, 信息流, 资金流, 以及我们的价值链(价值链的分解)。

## 尝试关于自动代码生成的部分

学习并了解其中生成代码的代码。 java web 项目如何实现的页面的动态的变化。 看起来类似 ajax 的效果。

## 日志系统的搭建

日志系统, 搭建, 收集, 分析 以及处理的方式。 可以实时的获取的相关的数据。

## 移动端的支持

使用 Jingle 这样的单页的应用的 js 框架, 用来支持移动端的开发。

## 后端技术选型

后端使用了如下的这些技术:

1.  核心框架：Spring Framework 4.1
1.  安全框架：Apache Shiro 1.2 - 授权 以及 权限管理
1.  视图框架：Spring MVC 4.1  - mvc 框架
1.  服务端验证：Hibernate Validator 5.2
1.  布局框架：SiteMesh 2.4 - 页面布局模板
1.  工作流引擎：Activiti 5.21
1.  任务调度：Spring Task 4.1 - 定时任务的调度, 轻量级的 Quartz。
1.  持久层框架：MyBatis 3.2
1.  数据库连接池：Alibaba Druid 1.0
1.  缓存框架：Ehcache 2.6、Redis
1.  日志管理：SLF4J 1.7、Log4j
1.  工具类：Apache Commons、Jackson 2.2、Xstream 1.4、Dozer 5.3、POI 3.9

### sitemash

SiteMesh 是一个网页布局和修饰的框架，利用它可以将网页的内容和页面结构分离，以达到页面结构共享的目的。
Sitemesh是由一个基于Web页面布局、装饰以及与现存Web应用整合的框架。它能帮助我们在由大量页面构成的项目中创建。

Sitemash 是 装饰者模式( Decorator Pattern ), 通过定义的 filter 来实现。

Sitemesh 参考文档: http://blog.csdn.net/liyantianmin/article/details/41576105


### Spring Task

定时任务的调度, 具体的选用方案可以使用 Spring Task 以及 QuratZ, 以下, 介绍两者的相关的文档:

1. Spring任务调度之Quartz:  http://www.cnblogs.com/hongwz/p/5642429.html
2. Spring任务调度之Spring-Task: http://www.cnblogs.com/hongwz/p/5642497.html

这里, 需要区分两者。 定时任务 和 异步任务的区别, 以及如何区别两者。 java 中如何实现的 异步的任务。 是使用消息中间件? 或者是其他的某种
方式。

两者的对比, 可以参考: http://gong1208.iteye.com/blog/1773177

### Alibaba Druid - 数据库连接池

Druid链接池,  与 dbcp 的功能类似的数据库链接池。

https://github.com/alibaba/druid/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98

### Dozer - java 对象装换的利器(Mapper 框架)

https://github.com/DozerMapper/dozer

网上的文章, 一搜一大堆: http://ningandjiao.iteye.com/blog/1989838

### Apache POI - ms docx 的API 工具

项目的地址: http://poi.apache.org/

参考的技术文档: http://www.yiibai.com/apache_poi/