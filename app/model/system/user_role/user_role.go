package user_role

import "yujie_goadmin/app/yjgframe/db"

// Fill with you ideas below.
//批量删除
func DeleteBatch(ids ...int64) (int64, error) {
	return db.Instance().Engine().Table(TableName()).In("user_id", ids).Delete(new(Entity))
}
