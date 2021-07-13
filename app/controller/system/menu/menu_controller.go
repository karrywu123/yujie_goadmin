package menu

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"yujie_goadmin/app/model"
	menuModel "yujie_goadmin/app/model/system/menu"
	menuService "yujie_goadmin/app/service/system/menu"
	userService "yujie_goadmin/app/service/system/user"
	"yujie_goadmin/app/yjgframe/response"
	"yujie_goadmin/app/yjgframe/utils/gconv"
)

//列表页
func List(c *gin.Context) {
	response.BuildTpl(c, "system/menu/list").WriteTpl()
}

//列表分页数据
func ListAjax(c *gin.Context) {
	var req *menuModel.SelectPageReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).Log("菜单管理", req).WriteJsonExit()
		return
	}
	rows := make([]menuModel.Entity, 0)
	result, err := menuService.SelectListAll(req)

	if err == nil && len(result) > 0 {
		rows = result
	}
	c.JSON(http.StatusOK, rows)
}

//新增页面
func Add(c *gin.Context) {
	pid := gconv.Int64(c.Query("pid"))
	var pmenu menuModel.EntityExtend
	pmenu.MenuId = 0
	pmenu.MenuName = "主目录"

	tmp, err := menuService.SelectRecordById(pid)
	if err == nil && tmp != nil && tmp.MenuId > 0 {
		pmenu.MenuId = tmp.MenuId
		pmenu.MenuName = tmp.MenuName
	}
	response.BuildTpl(c, "system/menu/add").WriteTpl(gin.H{"menu": pmenu})
}

//新增页面保存
func AddSave(c *gin.Context) {
	var req *menuModel.AddReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("菜单管理", req).WriteJsonExit()
		return
	}

	if menuService.CheckMenuNameUniqueAll(req.MenuName, req.ParentId) == "1" {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg("菜单名称已存在").Log("菜单管理", req).WriteJsonExit()
		return
	}

	id, err := menuService.AddSave(req, c)

	if err != nil || id <= 0 {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("菜单管理", req).WriteJsonExit()
		return
	}
	response.SucessResp(c).SetBtype(model.Buniss_Add).SetData(id).Log("菜单管理", req).WriteJsonExit()
}

//修改页面
func Edit(c *gin.Context) {
	id := gconv.Int64(c.Query("id"))
	if id <= 0 {
		response.BuildTpl(c, model.ERROR_PAGE).WriteTpl(gin.H{
			"desc": "参数错误",
		})
		return
	}

	menu, err := menuService.SelectRecordById(id)

	if err != nil || menu == nil {
		response.BuildTpl(c, model.ERROR_PAGE).WriteTpl(gin.H{
			"desc": "菜单不存在",
		})
		return
	}

	response.BuildTpl(c, "system/menu/edit").WriteTpl(gin.H{
		"menu": menu,
	})
}

//修改页面保存
func EditSave(c *gin.Context) {
	var req *menuModel.EditReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetBtype(model.Buniss_Edit).SetMsg(err.Error()).Log("菜单管理", req).WriteJsonExit()
		return
	}

	if menuService.CheckMenuNameUnique(req.MenuName, req.MenuId, req.ParentId) == "1" {
		response.ErrorResp(c).SetBtype(model.Buniss_Edit).SetMsg("菜单名称已存在").Log("菜单管理", req).WriteJsonExit()
		return
	}

	rs, err := menuService.EditSave(req, c)

	if err != nil || rs <= 0 {
		response.ErrorResp(c).SetBtype(model.Buniss_Edit).Log("菜单管理", req).WriteJsonExit()
		return
	}
	response.SucessResp(c).SetBtype(model.Buniss_Edit).SetData(rs).Log("菜单管理", req).WriteJsonExit()
}

//删除数据
func Remove(c *gin.Context) {
	id := gconv.Int64(c.Query("id"))
	rs := menuService.DeleteRecordById(id)

	if rs {
		response.SucessResp(c).SetBtype(model.Buniss_Del).Log("菜单管理", gin.H{"id": id}).WriteJsonExit()
	} else {
		response.ErrorResp(c).SetBtype(model.Buniss_Del).Log("菜单管理", gin.H{"id": id}).WriteJsonExit()
	}
}

//选择菜单树
func SelectMenuTree(c *gin.Context) {
	menuId := gconv.Int64(c.Query("menuId"))
	menu, err := menuService.SelectRecordById(menuId)
	if err != nil {
		response.BuildTpl(c, model.ERROR_PAGE).WriteTpl(gin.H{
			"desc": "菜单不存在",
		})
		return
	}
	response.BuildTpl(c, "system/menu/tree").WriteTpl(gin.H{
		"menu": menu,
	})
}

//加载所有菜单列表树
func MenuTreeData(c *gin.Context) {
	user := userService.GetProfile(c)
	if user == nil {
		response.ErrorResp(c).SetMsg("登陆超时").Log("菜单管理", gin.H{"userId": user.UserId}).WriteJsonExit()
		return
	}
	ztrees, err := menuService.MenuTreeData(user.UserId)
	if err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).Log("菜单管理", gin.H{"userId": user.UserId}).WriteJsonExit()
		return
	}
	c.JSON(http.StatusOK, ztrees)
}

//选择图标
func Icon(c *gin.Context) {
	response.BuildTpl(c, "system/menu/icon").WriteTpl()
}

//加载角色菜单列表树
func RoleMenuTreeData(c *gin.Context) {
	roleId := gconv.Int64(c.Query("roleId"))
	user := userService.GetProfile(c)
	if user == nil || user.UserId <= 0 {
		response.ErrorResp(c).SetMsg("登陆超时").Log("菜单管理", gin.H{"roleId": roleId}).WriteJsonExit()
		return
	}

	result, err := menuService.RoleMenuTreeData(roleId, user.UserId)

	if err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).Log("菜单管理", gin.H{"roleId": roleId}).WriteJsonExit()
		return
	}

	c.JSON(http.StatusOK, result)
}

//检查菜单名是否已经存在不包括自身
func CheckMenuNameUnique(c *gin.Context) {
	var req *menuModel.CheckMenuNameReq
	if err := c.ShouldBind(&req); err != nil {
		c.Writer.WriteString("1")
		return
	}

	result := menuService.CheckMenuNameUnique(req.MenuName, req.MenuId, req.ParentId)

	c.Writer.WriteString(result)
}

//检查菜单名是否已经存在
func CheckMenuNameUniqueAll(c *gin.Context) {
	var req *menuModel.CheckMenuNameALLReq
	if err := c.ShouldBind(&req); err != nil {
		c.Writer.WriteString("1")
		return
	}

	result := menuService.CheckMenuNameUniqueAll(req.MenuName, req.ParentId)

	c.Writer.WriteString(result)
}
