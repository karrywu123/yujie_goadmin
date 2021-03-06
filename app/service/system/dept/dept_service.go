package dept

import (
	"errors"
	"github.com/gin-gonic/gin"
	"strings"
	"time"
	"yujie_goadmin/app/model"
	deptModel "yujie_goadmin/app/model/system/dept"
	"yujie_goadmin/app/yjgframe/utils/gconv"

	userService "yujie_goadmin/app/service/system/user"
)

//新增保存信息
func AddSave(req *deptModel.AddReq, c *gin.Context) (int64, error) {
	dept := new(deptModel.Entity)
	parent := &deptModel.Entity{DeptId: req.ParentId}
	ok, err := parent.FindOne()
	if err == nil && ok {
		if parent.Status != "0" {
			return 0, errors.New("部门停用，不允许新增")
		} else {
			dept.Ancestors = parent.Ancestors + "," + gconv.String(parent.DeptId)
		}

	} else {
		return 0, errors.New("父部门不能为空")
	}

	dept.DeptName = req.DeptName
	dept.Status = req.Status
	dept.ParentId = req.ParentId
	dept.DelFlag = "0"
	dept.Email = req.Email
	dept.Leader = req.Leader
	dept.Phone = req.Phone
	dept.OrderNum = req.OrderNum

	user := userService.GetProfile(c)

	if user != nil && user.UserId > 0 {
		dept.CreateBy = user.LoginName
	}

	dept.CreateTime = time.Now()

	_, err = dept.Insert()
	return dept.DeptId, err
}

//修改保存信息
func EditSave(req *deptModel.EditReq, c *gin.Context) (int64, error) {
	dept := &deptModel.Entity{DeptId: req.DeptId}
	ok, err := dept.FindOne()
	if err != nil || !ok {
		return 0, errors.New("数据不存在")
	}
	pdept := &deptModel.Entity{DeptId: req.ParentId}

	ok, err = pdept.FindOne()
	if pdept != nil {
		if pdept.Status != "0" {
			return 0, errors.New("部门停用，不允许新增")
		} else {
			newAncestors := pdept.Ancestors + "," + gconv.String(pdept.DeptId)
			deptModel.UpdateDeptChildren(dept.DeptId, newAncestors, dept.Ancestors)

			dept.DeptName = req.DeptName
			dept.Status = req.Status
			dept.ParentId = req.ParentId
			dept.DelFlag = "0"
			dept.Email = req.Email
			dept.Leader = req.Leader
			dept.Phone = req.Phone
			dept.OrderNum = req.OrderNum

			user := userService.GetProfile(c)

			if user != nil && user.UserId > 0 {
				dept.UpdateBy = user.LoginName
			}

			dept.UpdateTime = time.Now()

			dept.Update()
			return 1, nil
		}

	} else {
		return 0, errors.New("父部门不能为空")
	}
}

//根据分页查询部门管理数据
func SelectListAll(param *deptModel.SelectPageReq) ([]deptModel.Entity, error) {
	if param == nil {
		return SelectDeptList(0, "", "")
	} else {
		return SelectDeptList(param.ParentId, param.DeptName, param.Status)
	}
}

//删除部门管理信息
func DeleteDeptById(deptId int64) int64 {
	return deptModel.DeleteDeptById(deptId)
}

//根据部门ID查询信息
func SelectDeptById(deptId int64) *deptModel.EntityExtend {
	deptEntity, err := deptModel.SelectDeptById(deptId)
	if err != nil {
		return nil
	}

	return deptEntity
}

//根据ID查询所有子部门
func SelectChildrenDeptById(deptId int64) []*deptModel.Entity {
	return deptModel.SelectChildrenDeptById(deptId)
}

//加载部门列表树
func SelectDeptTree(parentId int64, deptName, status string) (*[]model.Ztree, error) {
	list, err := deptModel.SelectDeptList(parentId, deptName, status)
	if err != nil {
		return nil, err
	}

	return InitZtree(&list, nil), nil

}

//查询部门管理数据
func SelectDeptList(parentId int64, deptName, status string) ([]deptModel.Entity, error) {
	return deptModel.SelectDeptList(parentId, deptName, status)
}

//根据角色ID查询部门（数据权限）
func RoleDeptTreeData(roleId int64) (*[]model.Ztree, error) {
	var result *[]model.Ztree
	deptList, err := deptModel.SelectDeptList(0, "", "")
	if err != nil {
		return nil, err
	}

	if roleId > 0 {
		roleDeptList, err := deptModel.SelectRoleDeptTree(roleId)
		if err != nil || roleDeptList == nil {
			result = InitZtree(&deptList, nil)
		} else {
			result = InitZtree(&deptList, &roleDeptList)
		}
	} else {
		result = InitZtree(&deptList, nil)
	}
	return result, nil
}

//对象转部门树
func InitZtree(deptList *[]deptModel.Entity, roleDeptList *[]string) *[]model.Ztree {
	var result []model.Ztree
	isCheck := false
	if roleDeptList != nil && len(*roleDeptList) > 0 {
		isCheck = true
	}

	for i := range *deptList {
		if (*deptList)[i].Status == "0" {
			var ztree model.Ztree
			ztree.Id = (*deptList)[i].DeptId
			ztree.Pid = (*deptList)[i].ParentId
			ztree.Name = (*deptList)[i].DeptName
			ztree.Title = (*deptList)[i].DeptName
			if isCheck {
				tmp := gconv.String((*deptList)[i].DeptId) + (*deptList)[i].DeptName
				tmpcheck := false
				for j := range *roleDeptList {
					if strings.EqualFold((*roleDeptList)[j], tmp) {
						tmpcheck = true
						break
					}
				}
				ztree.Checked = tmpcheck
			}
			result = append(result, ztree)
		}
	}
	return &result
}

//查询部门是否存在用户
func CheckDeptExistUser(deptId int64) bool {
	return deptModel.CheckDeptExistUser(deptId)
}

//查询部门人数
func SelectDeptCount(deptId, parentId int64) int64 {
	return deptModel.SelectDeptCount(deptId, parentId)
}

//校验部门名称是否唯一
func CheckDeptNameUniqueAll(deptName string, parentId int64) string {
	dept, err := deptModel.CheckDeptNameUniqueAll(deptName, parentId)
	if err != nil {
		return "1"
	}
	if dept != nil && dept.DeptId > 0 {
		return "1"
	} else {
		return "0"
	}
}

//校验部门名称是否唯一
func CheckDeptNameUnique(deptName string, deptId, parentId int64) string {
	dept, err := deptModel.CheckDeptNameUniqueAll(deptName, parentId)

	if err != nil {
		return "1"
	}
	if dept != nil && dept.DeptId > 0 && dept.DeptId != deptId {
		return "1"
	}
	return "0"
}
