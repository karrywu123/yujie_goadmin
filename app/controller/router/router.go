package router

import (
	_ "yujie_goadmin/app/controller/api"
	_ "yujie_goadmin/app/controller/demo"
	"yujie_goadmin/app/controller/hello"
	_ "yujie_goadmin/app/controller/module"
	_ "yujie_goadmin/app/controller/monitor"
	_ "yujie_goadmin/app/controller/system"
	errorc "yujie_goadmin/app/controller/system/error"
	"yujie_goadmin/app/controller/system/index"
	_ "yujie_goadmin/app/controller/tool"
	"yujie_goadmin/app/service/middleware/auth"
	"yujie_goadmin/app/yjgframe/router"
)

func init() {
	// 加载登陆路由
	g1 := router.New("admin", "/")
	g1.ANY("/", "", hello.Hello)
	g1.GET("/login", "", index.Login)
	g1.GET("/captchaImage", "", index.CaptchaImage)
	g1.POST("/checklogin", "", index.CheckLogin)
	g1.GET("/500", "", errorc.Error)
	g1.GET("/404", "", errorc.NotFound)
	g1.GET("/403", "", errorc.Unauth)
	g1.GET("/index", "", index.Index)
	g1.GET("/logout", "", index.Logout)

	// 加载框架路由
	g2 := router.New("admin", "/system", auth.Auth)
	g2.GET("/main", "", index.Main)
	g2.GET("/switchSkin", "", index.SwitchSkin)
	g2.GET("/download", "", index.Download)
}
