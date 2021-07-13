框架简介

这是从云捷go后台下载下来 复制改动的代码 
受之开源，回馈社区，本框架以Gin为web服务框架,xorm为数据库orm框架，继续沿用MIT开源协议，架构思路沿袭着若依的以辅助生成重复代码为主，不过度封装，生成的代码可以快速修改适应不同的需求，适应每个开发者自己的习惯和风格


核心技术及组件

web服务框架 github.com/gin-gonic/gin v1.6.1

ORM框架 github.com/go-xorm/xorm v0.7.9

session github.com/gorilla/sessions v1.2.0

cache github.com/patrickmn/go-cache v2.1.0+incompatible

配置文档 github.com/BurntSushi/toml v0.3.1

导出excel文件 tealeg/xlsx v1.0.5

api文档生成 swaggo/swag v1.6.5

图形验证码 base64Captcha v1.2.2

服务器监控 gopsutil v2.19.12+incompatible

若依前端组件 RuoYi v4.1.0

初始化数据库的数据在 document的目录下面的 yjgov2_2020-03-27.sql 这个文件


登陆账号和密码


admin/yjg123456

感谢：云捷的开源代码
https://github.com/zeroing-zy1/yjgov2
