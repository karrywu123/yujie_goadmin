package gen

import (
	"github.com/gin-gonic/gin"
	"html/template"
	"net/http"
	"os"
	"strings"
	"yujie_goadmin/app/model"
	tableModel "yujie_goadmin/app/model/tool/table"
	tableColumnModel "yujie_goadmin/app/model/tool/table_column"
	userService "yujie_goadmin/app/service/system/user"
	tableService "yujie_goadmin/app/service/tool/table"
	"yujie_goadmin/app/yjgframe/response"
	"yujie_goadmin/app/yjgframe/utils/file"
	"yujie_goadmin/app/yjgframe/utils/gconv"
)

//生成代码列表页面
func Gen(c *gin.Context) {
	response.BuildTpl(c, "tool/gen/list").WriteTpl()
}

func GenList(c *gin.Context) {
	var req *tableModel.SelectPageReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).Log("生成代码", req).WriteJsonExit()
		return
	}
	rows := make([]tableModel.Entity, 0)
	result, page, err := tableService.SelectListByPage(req)

	if err == nil && len(result) > 0 {
		rows = result
	}

	response.BuildTable(c, page.Total, rows).WriteJsonExit()
}

//导入数据表
func ImportTable(c *gin.Context) {
	response.BuildTpl(c, "tool/gen/importTable").WriteTpl()
}

//删除数据
func Remove(c *gin.Context) {
	var req *model.RemoveReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetBtype(model.Buniss_Del).Log("生成代码", req).WriteJsonExit()
		return
	}

	rs := tableService.DeleteRecordByIds(req.Ids)

	if rs > 0 {
		response.SucessResp(c).SetBtype(model.Buniss_Del).Log("生成代码", req).WriteJsonExit()
	} else {
		response.ErrorResp(c).SetBtype(model.Buniss_Del).Log("生成代码", req).WriteJsonExit()
	}
}

//修改数据
func Edit(c *gin.Context) {
	id := gconv.Int64(c.Query("id"))
	if id <= 0 {
		response.BuildTpl(c, model.ERROR_PAGE).WriteTpl(gin.H{
			"desc": "参数错误",
		})
		return
	}

	entity, err := tableService.SelectRecordById(id)

	if err != nil || entity == nil {
		response.BuildTpl(c, model.ERROR_PAGE).WriteTpl(gin.H{
			"desc": "参数不存在",
		})
		return
	}

	goTypeTpl := tableService.GoTypeTpl()
	queryTypeTpl := tableService.QueryTypeTpl()
	htmlTypeTpl := tableService.HtmlTypeTpl()

	response.BuildTpl(c, "tool/gen/edit").WriteTpl(gin.H{
		"table":        entity,
		"goTypeTpl":    template.HTML(goTypeTpl),
		"queryTypeTpl": template.HTML(queryTypeTpl),
		"htmlTypeTpl":  template.HTML(htmlTypeTpl),
	})
}

//修改数据保存
func EditSave(c *gin.Context) {
	var req tableModel.EditReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).SetBtype(model.Buniss_Edit).Log("生成代码", gin.H{"tableName": req.TableName}).WriteJsonExit()
		return
	}
	_, err := tableService.SaveEdit(&req, c)
	if err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).SetBtype(model.Buniss_Edit).Log("生成代码", gin.H{"tableName": req.TableName}).WriteJsonExit()
		return
	}
	response.SucessResp(c).SetBtype(model.Buniss_Edit).Log("生成代码", gin.H{"tableName": req.TableName}).WriteJsonExit()
}

//预览代码
func Preview(c *gin.Context) {
	tableId := gconv.Int64(c.Query("tableId"))
	if tableId <= 0 {
		c.JSON(http.StatusOK, model.CommonRes{
			Code:  500,
			Btype: model.Buniss_Other,
			Msg:   "参数错误",
		})
	}

	entity, err := tableService.SelectRecordById(tableId)

	if err != nil || entity == nil {
		c.JSON(http.StatusOK, model.CommonRes{
			Code:  500,
			Btype: model.Buniss_Other,
			Msg:   "数据不存在",
		})
	}

	tableService.SetPkColumn(entity, entity.Columns)

	addKey := "vm/html/add.html.vm"
	addValue := ""
	editKey := "vm/html/edit.html.vm"
	editValue := ""

	listKey := "vm/html/list.html.vm"
	listValue := ""
	listTmp := "vm/html/list.txt"

	treeKey := "vm/html/tree.html.vm"
	treeValue := ""

	if entity.TplCategory == "tree" {
		listTmp = "vm/html/list-tree.txt"
	}

	sqlKey := "vm/sql/menu.sql.vm"
	sqlValue := ""
	entityKey := "vm/go/" + entity.BusinessName + "_entity.go.vm"
	entityValue := ""
	extendKey := "vm/go/" + entity.BusinessName + ".go.vm"
	extendValue := ""
	serviceKey := "vm/go/" + entity.BusinessName + "_service.go.vm"
	serviceValue := ""
	routerKey := "vm/go/" + entity.BusinessName + "_router.go.vm"
	routerValue := ""
	controllerKey := "vm/go/" + entity.BusinessName + "_controller.go.vm"
	controllerValue := ""

	//新增页面模板
	addValue, _ = tableService.LoadTemplate("vm/html/add.txt", gin.H{"table": entity})
	//修改页面模板
	editValue, _ = tableService.LoadTemplate("vm/html/edit.txt", gin.H{"table": entity})

	//列表页面模板
	listValue, _ = tableService.LoadTemplate(listTmp, gin.H{"table": entity})

	if entity.TplCategory == "tree" {
		//选择树页面模板
		treeValue, _ = tableService.LoadTemplate("vm/html/tree.txt", gin.H{"table": entity})
	}

	//entity模板
	entityValue, _ = tableService.LoadTemplate("vm/go/entity.txt", gin.H{"table": entity})

	//extend模板
	extendValue, _ = tableService.LoadTemplate("vm/go/extend.txt", gin.H{"table": entity})

	//service模板
	serviceValue, _ = tableService.LoadTemplate("vm/go/service.txt", gin.H{"table": entity})

	//router模板
	routerValue, _ = tableService.LoadTemplate("vm/go/router.txt", gin.H{"table": entity})

	//controller模板
	controllerValue, _ = tableService.LoadTemplate("vm/go/controller.txt", gin.H{"table": entity})

	//sql模板
	sqlValue, _ = tableService.LoadTemplate("vm/sql/sql.txt", gin.H{"table": entity})

	if entity.TplCategory == "tree" {
		c.JSON(http.StatusOK, model.CommonRes{
			Code:  0,
			Btype: model.Buniss_Other,
			Data: gin.H{
				addKey:        addValue,
				editKey:       editValue,
				listKey:       listValue,
				treeKey:       treeValue,
				sqlKey:        sqlValue,
				entityKey:     entityValue,
				extendKey:     extendValue,
				serviceKey:    serviceValue,
				routerKey:     routerValue,
				controllerKey: controllerValue,
			},
		})
	} else {
		c.JSON(http.StatusOK, model.CommonRes{
			Code:  0,
			Btype: model.Buniss_Other,
			Data: gin.H{
				addKey:        addValue,
				editKey:       editValue,
				listKey:       listValue,
				sqlKey:        sqlValue,
				entityKey:     entityValue,
				extendKey:     extendValue,
				serviceKey:    serviceValue,
				routerKey:     routerValue,
				controllerKey: controllerValue,
			},
		})
	}

}

//生成代码
func GenCode(c *gin.Context) {
	tableId := gconv.Int64(c.Query("tableId"))
	if tableId <= 0 {
		c.JSON(http.StatusOK, model.CommonRes{
			Code:  500,
			Btype: model.Buniss_Other,
			Msg:   "参数错误",
		})
	}

	entity, err := tableService.SelectRecordById(tableId)

	if err != nil || entity == nil {
		c.JSON(http.StatusOK, model.CommonRes{
			Code:  500,
			Btype: model.Buniss_Other,
			Msg:   "数据不存在",
		})
	}

	tableService.SetPkColumn(entity, entity.Columns)

	listTmp := "vm/html/list.txt"
	if entity.TplCategory == "tree" {
		listTmp = "vm/html/list-tree.txt"
	}

	//获取当前运行时目录
	curDir, err := os.Getwd()

	if err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).Log("生成代码", gin.H{"tableId": tableId}).WriteJsonExit()
	}

	//add模板
	if tmp, err := tableService.LoadTemplate("vm/html/add.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/template/", entity.ModuleName, "/", entity.BusinessName, "/add.html"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	//edit模板
	if tmp, err := tableService.LoadTemplate("vm/html/edit.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/template/", entity.ModuleName, "/", entity.BusinessName, "/edit.html"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	//list模板
	if tmp, err := tableService.LoadTemplate(listTmp, gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/template/", entity.ModuleName, "/", entity.BusinessName, "/list.html"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	if entity.TplCategory == "tree" {
		//tree模板
		if tmp, err := tableService.LoadTemplate("vm/html/tree.txt", gin.H{"table": entity}); err == nil {
			fileName := strings.Join([]string{curDir, "/template/", entity.ModuleName, "/", entity.BusinessName, "/", "tree.html"}, "")

			if !file.Exists(fileName) {
				f, err := file.Create(fileName)
				if err == nil {
					f.WriteString(tmp)
				}
				f.Close()
			}
		}
	}

	//entity模板
	if tmp, err := tableService.LoadTemplate("vm/go/entity.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/app/model/", entity.ModuleName, "/", entity.BusinessName, "/", entity.BusinessName, "_entity.go"}, "")
		if file.Exists(fileName) {
			os.RemoveAll(fileName)
		}

		f, err := file.Create(fileName)
		if err == nil {
			f.WriteString(tmp)
		}
		f.Close()
	}

	//extend模板
	if tmp, err := tableService.LoadTemplate("vm/go/extend.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/app/model/", entity.ModuleName, "/", entity.BusinessName, "/", entity.BusinessName, ".go"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	//service模板
	if tmp, err := tableService.LoadTemplate("vm/go/service.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/app/service/", entity.ModuleName, "/", entity.BusinessName, "/", entity.BusinessName, "_service.go"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	//router模板
	if tmp, err := tableService.LoadTemplate("vm/go/router.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/app/controller/", entity.ModuleName, "/", entity.BusinessName, "_router.go"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	//controller模板
	if tmp, err := tableService.LoadTemplate("vm/go/controller.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/app/controller/", entity.ModuleName, "/", entity.BusinessName, "/", entity.BusinessName, "_controller.go"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}

	//sql模板
	if tmp, err := tableService.LoadTemplate("vm/sql/sql.txt", gin.H{"table": entity}); err == nil {
		fileName := strings.Join([]string{curDir, "/document/sql/", entity.ModuleName, "/", entity.BusinessName, "_menu.sql"}, "")

		if !file.Exists(fileName) {
			f, err := file.Create(fileName)
			if err == nil {
				f.WriteString(tmp)
			}
			f.Close()
		}
	}
	response.SucessResp(c).Log("生成代码", gin.H{"tableId": tableId}).WriteJsonExit()
}

//查询数据库列表
func DataList(c *gin.Context) {
	var req *tableModel.SelectPageReq
	//获取参数
	if err := c.ShouldBind(&req); err != nil {
		response.ErrorResp(c).SetMsg(err.Error()).Log("生成代码", req).WriteJsonExit()
	}
	rows := make([]tableModel.Entity, 0)
	result, page, err := tableService.SelectDbTableList(req)

	if err == nil && len(result) > 0 {
		rows = result
	}

	c.JSON(http.StatusOK, model.TableDataInfo{
		Code:  0,
		Msg:   "操作成功",
		Total: page.Total,
		Rows:  rows,
	})
}

//导入表结构（保存）
func ImportTableSave(c *gin.Context) {
	tables := c.PostForm("tables")
	if tables == "" {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg("参数错误").Log("生成代码", gin.H{"tables": tables}).WriteJsonExit()
	}

	user := userService.GetProfile(c)
	if user == nil {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg("登陆超时").Log("生成代码", gin.H{"tables": tables}).WriteJsonExit()
	}

	operName := user.LoginName

	tableArr := strings.Split(tables, ",")
	tableList, err := tableService.SelectDbTableListByNames(tableArr)
	if err != nil {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("生成代码", gin.H{"tables": tables}).WriteJsonExit()
		return
	}

	if tableList == nil {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg("请选择需要导入的表").Log("生成代码", gin.H{"tables": tables}).WriteJsonExit()
		return
	}

	tableService.ImportGenTable(&tableList, operName)
	response.SucessResp(c).Log("导入表结构", gin.H{"tables": tables}).WriteJsonExit()
}

//根据table_id查询表列数据
func ColumnList(c *gin.Context) {
	tableId := gconv.Int64(c.PostForm("tableId"))
	//获取参数
	if tableId <= 0 {
		response.ErrorResp(c).SetBtype(model.Buniss_Add).SetMsg("参数错误").Log("生成代码", gin.H{"tableId": tableId})
	}
	rows := make([]tableColumnModel.Entity, 0)
	result, err := tableService.SelectGenTableColumnListByTableId(tableId)

	if err == nil && len(result) > 0 {
		rows = result
	}

	c.JSON(http.StatusOK, model.TableDataInfo{
		Code:  0,
		Msg:   "操作成功",
		Total: len(rows),
		Rows:  rows,
	})
}
