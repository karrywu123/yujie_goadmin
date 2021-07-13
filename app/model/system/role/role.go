package role

import (
	"errors"
	"time"
	"xorm.io/builder"
	"yujie_goadmin/app/yjgframe/db"
	"yujie_goadmin/app/yjgframe/utils/excel"
	"yujie_goadmin/app/yjgframe/utils/page"
)

// Entity is the golang structure for table sys_role.
type EntityFlag struct {
	RoleId     int64     `json:"role_id" xorm:"not null pk autoincr comment('角色ID') BIGINT(20)"`
	RoleName   string    `json:"role_name" xorm:"not null comment('角色名称') VARCHAR(30)"`
	RoleKey    string    `json:"role_key" xorm:"not null comment('角色权限字符串') VARCHAR(100)"`
	RoleSort   int       `json:"role_sort" xorm:"not null comment('显示顺序') INT(4)"`
	DataScope  string    `json:"data_scope" xorm:"default '1' comment('数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）') CHAR(1)"`
	Status     string    `json:"status" xorm:"not null comment('角色状态（0正常 1停用）') CHAR(1)"`
	DelFlag    string    `json:"del_flag" xorm:"default '0' comment('删除标志（0代表存在 2代表删除）') CHAR(1)"`
	CreateBy   string    `json:"create_by" xorm:"default '' comment('创建者') VARCHAR(64)"`
	CreateTime time.Time `json:"create_time" xorm:"comment('创建时间') DATETIME"`
	UpdateBy   string    `json:"update_by" xorm:"default '' comment('更新者') VARCHAR(64)"`
	UpdateTime time.Time `json:"update_time" xorm:"comment('更新时间') DATETIME"`
	Remark     string    `json:"remark" xorm:"comment('备注') VARCHAR(500)"`
	Flag       bool      `json:"flag" xorm:"comment('标记') BOOL"`
}

//数据权限保存请求参数
type DataScopeReq struct {
	RoleId    int64  `form:"roleId"  binding:"required"`
	RoleName  string `form:"roleName"  binding:"required"`
	RoleKey   string `form:"roleKey"  binding:"required"`
	DataScope string `form:"dataScope"  binding:"required"`
	DeptIds   string `form:"deptIds"`
}

//检查角色名称请求参数
type CheckRoleNameReq struct {
	RoleId   int64  `form:"roleId"  binding:"required"`
	RoleName string `form:"roleName"  binding:"required"`
}

//检查权限字符请求参数
type CheckRoleKeyReq struct {
	RoleId  int64  `form:"roleId"  binding:"required"`
	RoleKey string `form:"roleKey"  binding:"required"`
}

//检查角色名称请求参数
type CheckRoleNameALLReq struct {
	RoleName string `form:"roleName"  binding:"required"`
}

//检查权限字符请求参数
type CheckRoleKeyALLReq struct {
	RoleKey string `form:"roleKey"  binding:"required"`
}

//分页请求参数
type SelectPageReq struct {
	RoleName      string `form:"roleName"`      //角色名称
	Status        string `form:"status"`        //状态
	RoleKey       string `form:"roleKey"`       //角色键
	DataScope     string `form:"dataScope"`     //数据范围
	BeginTime     string `form:"beginTime"`     //开始时间
	EndTime       string `form:"endTime"`       //结束时间
	PageNum       int    `form:"pageNum"`       //当前页码
	PageSize      int    `form:"pageSize"`      //每页数
	OrderByColumn string `form:"orderByColumn"` //排序字段
	IsAsc         string `form:"isAsc"`         //排序方式
}

//新增页面请求参数
type AddReq struct {
	RoleName string `form:"roleName"  binding:"required"`
	RoleKey  string `form:"roleKey"  binding:"required"`
	RoleSort string `form:"roleSort"  binding:"required"`
	Status   string `form:"status"`
	Remark   string `form:"remark"`
	MenuIds  string `form:"menuIds"`
}

//修改页面请求参数
type EditReq struct {
	RoleId   int64  `form:"roleId" binding:"required"`
	RoleName string `form:"roleName"  binding:"required"`
	RoleKey  string `form:"roleKey"  binding:"required"`
	RoleSort string `form:"roleSort"  binding:"required"`
	Status   string `form:"status"`
	Remark   string `form:"remark"`
	MenuIds  string `form:"menuIds"`
}

//根据条件分页查询角色数据
func SelectListPage(param *SelectPageReq) ([]Entity, *page.Paging, error) {
	db := db.Instance().Engine()
	p := new(page.Paging)
	if db == nil {
		return nil, p, errors.New("获取数据库连接失败")
	}

	model := db.Table(TableName()).Alias("r").Where("r.del_flag = '0'")

	if param.RoleName != "" {
		model.Where("r.role_name like ?", "%"+param.RoleName+"%")
	}

	if param.Status != "" {
		model.Where("r.status = ?", param.Status)
	}

	if param.RoleKey != "" {
		model.Where("r.role_key like ?", "%"+param.RoleKey+"%")
	}

	if param.DataScope != "" {
		model.Where("r.data_scope = ?", param.DataScope)
	}

	if param.BeginTime != "" {
		model.Where("date_format(r.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
	}

	if param.EndTime != "" {
		model.Where("date_format(r.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
	}

	totalModel := model.Clone()

	total, err := totalModel.Count()

	if err != nil {
		return nil, p, errors.New("读取行数失败")
	}

	p = page.CreatePaging(param.PageNum, param.PageSize, int(total))

	if param.OrderByColumn != "" {
		model.OrderBy(param.OrderByColumn + " " + param.IsAsc + " ")
	}

	model.Limit(p.Pagesize, p.StartNum)

	var result []Entity

	err = model.Find(&result)
	return result, p, err
}

// 导出excel
func SelectListExport(param *SelectPageReq, head, col []string) (string, error) {
	db := db.Instance().Engine()
	if db == nil {
		return "", errors.New("获取数据库连接失败")
	}

	build := builder.Select(col...).From(TableName(), "t")

	if param != nil {
		if param.RoleName != "" {
			build.Where(builder.Like{"t.role_name", param.RoleName})
		}

		if param.Status != "" {
			build.Where(builder.Eq{"t.status": param.Status})
		}

		if param.RoleKey != "" {
			build.Where(builder.Like{"t.role_key", param.RoleKey})
		}

		if param.DataScope != "" {
			build.Where(builder.Eq{"t.data_scope": param.DataScope})
		}

		if param.BeginTime != "" {
			build.Where(builder.Gte{"date_format(t.create_time,'%y%m%d')": "date_format('" + param.BeginTime + "','%y%m%d')"})
		}

		if param.EndTime != "" {
			build.Where(builder.Lte{"date_format(t.create_time,'%y%m%d')": "date_format('" + param.EndTime + "','%y%m%d')"})
		}
	}

	sqlStr, _, _ := build.ToSQL()
	arr, err := db.SQL(sqlStr).QuerySliceString()

	path, err := excel.DownlaodExcel(head, arr)

	return path, err
}

//获取所有角色数据
func SelectListAll(param *SelectPageReq) ([]EntityFlag, error) {
	db := db.Instance().Engine()

	if db == nil {
		return nil, errors.New("获取数据库连接失败")
	}

	model := db.Table(TableName()).Alias("r").Select("r.*,false as flag").Where("r.del_flag = '0'")
	if param != nil {
		if param.RoleName != "" {
			model.Where("r.role_name like ?", "%"+param.RoleName+"%")
		}

		if param.Status != "" {
			model.Where("r.status = ", param.Status)
		}

		if param.RoleKey != "" {
			model.Where("r.role_key like ?", "%"+param.RoleKey+"%")
		}

		if param.DataScope != "" {
			model.Where("r.data_scope = ", param.DataScope)
		}

		if param.BeginTime != "" {
			model.Where("date_format(r.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(r.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}
	}

	var result []EntityFlag

	err := model.Find(&result)
	return result, err
}

//根据用户ID查询角色
func SelectRoleContactVo(userId int64) ([]Entity, error) {
	db := db.Instance().Engine()

	if db == nil {
		return nil, errors.New("获取数据库连接失败")
	}

	model := db.Table(TableName()).Alias("r")
	model.Join("Left", []string{"sys_user_role", "ur"}, "ur.role_id = r.role_id")
	model.Join("Left", []string{"sys_user", "u"}, "u.user_id = ur.user_id")
	model.Join("Left", []string{"sys_dept", "d"}, "u.dept_id = d.dept_id")
	model.Where("r.del_flag = '0'")
	model.Where("ur.user_id = ?", userId)
	model.Select("distinct r.role_id, r.role_name, r.role_key, r.role_sort, r.data_scope,r.status, r.del_flag, r.create_time, r.remark")

	var result []Entity

	err := model.Find(&result)
	return result, err
}

//检查角色键是否唯一
func CheckRoleNameUniqueAll(roleName string) (*Entity, error) {
	var entity Entity
	entity.RoleName = roleName
	_, err := entity.FindOne()
	ok, err := entity.FindOne()
	if ok {
		return &entity, err
	} else {
		return nil, err
	}
}

//检查角色键是否唯一
func CheckRoleKeyUniqueAll(roleKey string) (*Entity, error) {
	var entity Entity
	entity.RoleKey = roleKey
	ok, err := entity.FindOne()
	if ok {
		return &entity, err
	} else {
		return nil, err
	}
}
