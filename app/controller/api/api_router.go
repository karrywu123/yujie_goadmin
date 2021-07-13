package api

import (
	"yujie_goadmin/app/controller/api/login"
	"yujie_goadmin/app/service/middleware/jwt"
	"yujie_goadmin/app/yjgframe/router"
)

func init() {
	group1 := router.New("api", "/v1")
	group1.POST("/login", "", login.Login)
	group2 := router.New("api", "/v1/api", jwt.JWTAuthMiddleware())
	group2.POST("/test", "api", login.Test)
}
