package config

import (
	"time"
	"yujie_goadmin/app/yjgframe/db"
)

type Entity struct {
	ConfigId    int64     `json:"config_id" xorm:"not null pk autoincr comment('参数主键') INT(5)"`
	ConfigName  string    `json:"config_name" xorm:"default '' comment('参数名称') VARCHAR(100)"`
	ConfigKey   string    `json:"config_key" xorm:"default '' comment('参数键名') VARCHAR(100)"`
	ConfigValue string    `json:"config_value" xorm:"default '' comment('参数键值') VARCHAR(500)"`
	ConfigType  string    `json:"config_type" xorm:"default 'N' comment('系统内置（Y是 N否）') CHAR(1)"`
	CreateBy    string    `json:"create_by" xorm:"default '' comment('创建者') VARCHAR(64)"`
	CreateTime  time.Time `json:"create_time" xorm:"comment('创建时间') DATETIME"`
	UpdateBy    string    `json:"update_by" xorm:"default '' comment('更新者') VARCHAR(64)"`
	UpdateTime  time.Time `json:"update_time" xorm:"comment('更新时间') DATETIME"`
	Remark      string    `json:"remark" xorm:"comment('备注') VARCHAR(500)"`
}

//映射数据表
func TableName() string {
	return "sys_config"
}

// 插入数据
func (r *Entity) Insert() (int64, error) {
	return db.Instance().Engine().Table(TableName()).Insert(r)
}

// 更新数据
func (r *Entity) Update() (int64, error) {
	return db.Instance().Engine().Table(TableName()).ID(r.ConfigId).Update(r)
}

// 删除
func (r *Entity) Delete() (int64, error) {
	return db.Instance().Engine().Table(TableName()).ID(r.ConfigId).Delete(r)
}

//批量删除
func DeleteBatch(ids ...int64) (int64, error) {
	return db.Instance().Engine().Table(TableName()).In("config_id", ids).Delete(new(Entity))
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
