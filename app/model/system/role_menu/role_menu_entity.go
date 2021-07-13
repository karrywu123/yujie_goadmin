package role_menu

import (
	"xorm.io/core"
	"yujie_goadmin/app/yjgframe/db"
)

type Entity struct {
	RoleId int64 `json:"role_id" xorm:"not null pk comment('角色ID') BIGINT(20)"`
	MenuId int64 `json:"menu_id" xorm:"not null pk comment('菜单ID') BIGINT(20)"`
}

//映射数据表
func TableName() string {
	return "sys_role_menu"
}

// 插入数据
func (r *Entity) Insert() (int64, error) {
	return db.Instance().Engine().Table(TableName()).Insert(r)
}

// 更新数据
func (r *Entity) Update() (int64, error) {
	return db.Instance().Engine().Table(TableName()).ID(core.PK{r.RoleId, r.MenuId}).Update(r)
}

// 删除
func (r *Entity) Delete() (int64, error) {
	return db.Instance().Engine().Table(TableName()).ID(core.PK{r.RoleId, r.MenuId}).Delete(r)
}

// 根据结构体中已有的非空数据来获得单条数据
func (r *Entity) FindOne() (bool, error) {
	return db.Instance().Engine().Table(TableName()).Get(r)
}

// 根据条件查询
func Find(where, order string) ([]Entity, error) {
	var list []Entity
	err := db.Instance().Engine().Table(TableName()).Where(where).OrderBy(order).Find(&list)
	return list, err
}

//指定字段集合查询
func FindIn(column string, args ...interface{}) ([]Entity, error) {
	var list []Entity
	err := db.Instance().Engine().Table(TableName()).In(column, args).Find(&list)
	return list, err
}

//排除指定字段集合查询
func FindNotIn(column string, args ...interface{}) ([]Entity, error) {
	var list []Entity
	err := db.Instance().Engine().Table(TableName()).NotIn(column, args).Find(&list)
	return list, err
}
