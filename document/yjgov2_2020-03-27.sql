/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : yjgov2

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 05/05/2020 14:19:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
                             `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (5, 'sys_config', '参数配置表', 'config', 'crud', 'yj-app', 'module', 'config', '参数配置', 'yunjie', '', 'admin', '2020-03-26 20:35:17', 'admin', '2020-03-27 09:49:22', '455445454');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
                                    `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `go_type` varchar(500) DEFAULT NULL COMMENT 'Go类型',
                                    `go_field` varchar(200) DEFAULT NULL COMMENT 'Go字段名',
                                    `html_field` varchar(200) DEFAULT NULL COMMENT 'html字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int(11) DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (401, 37, 'id', '主键', 'bigint(20)', 'int64', 'Id', 'id', '1', '1', '0', '1', '0', '0', '0', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (402, 37, 'pid', '问题ID', 'bigint(20)', 'int64', 'Pid', 'pid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (403, 37, 'atype', '回复人类别', 'tinyint(1)', 'int', 'Atype', 'atype', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (404, 37, 'user_id', '回复人ID', 'bigint(20)', 'int64', 'UserId', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (405, 37, 'nick_name', '回复人名称', 'varchar(50)', 'string', 'NickName', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (406, 37, 'avatar', '回复人头像', 'varchar(50)', 'string', 'Avatar', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (407, 37, 'remark', '回复内容', 'varchar(250)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (408, 37, 'img1', '回复图片1', 'varchar(100)', 'string', 'Img1', 'img1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (409, 37, 'img2', '回复图片2', 'varchar(100)', 'string', 'Img2', 'img2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (410, 37, 'img3', '回复图片3', 'varchar(100)', 'string', 'Img3', 'img3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (411, 37, 'status', '状态', 'tinyint(1)', 'int', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (412, 37, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 12, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (413, 37, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (414, 38, 'id', '主键', 'bigint(20)', 'int64', 'Id', 'id', '1', '1', '0', '1', '0', '0', '0', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (415, 38, 'zx_id', '用户ID', 'bigint(20)', 'int64', 'ZxId', 'zxId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (416, 38, 'zx_name', '用户昵称', 'varchar(30)', 'string', 'ZxName', 'zxName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (417, 38, 'zx_avatar', '咨询头像', 'varchar(50)', 'string', 'ZxAvatar', 'zxAvatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (418, 38, 'zj_id', '专家ID', 'bigint(20)', 'int64', 'ZjId', 'zjId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (419, 38, 'remark', '问题描述', 'varchar(250)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (420, 38, 'img1', '问题图片1', 'varchar(100)', 'string', 'Img1', 'img1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (421, 38, 'img2', '问题图片2', 'varchar(100)', 'string', 'Img2', 'img2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (422, 38, 'img3', '问题图片3', 'varchar(100)', 'string', 'Img3', 'img3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (423, 38, 'ispay', '是否付费', 'tinyint(1)', 'int', 'Ispay', 'ispay', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (424, 38, 'pay_time', '付费时间', 'datetime', 'Time', 'PayTime', 'payTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datatime', '', 11, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (425, 38, 'pay_no', '订单号', 'varchar(50)', 'string', 'PayNo', 'payNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (426, 38, 'status', '状态', 'tinyint(4)', 'int', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (427, 38, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 14, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (428, 38, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 15, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (429, 39, 'wid', '申请ID', 'int(50)', 'int64', 'Wid', 'wid', '1', '1', '0', '1', '0', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (430, 39, 'uid', '用户ID', 'int(50)', 'int64', 'Uid', 'uid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (431, 39, 'realname', '姓名', 'varchar(50)', 'string', 'Realname', 'realname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (432, 39, 'idno', '身份证号', 'varchar(50)', 'string', 'Idno', 'idno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (433, 39, 'wmoney', '提现金额', 'decimal(10,0)', 'int64', 'Wmoney', 'wmoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (434, 39, 'wbankname', '银行名称', 'varchar(50)', 'string', 'Wbankname', 'wbankname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (435, 39, 'wbankaccount', '银行帐户', 'varchar(50)', 'string', 'Wbankaccount', 'wbankaccount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (436, 39, 'wrealname', '银行户名', 'varchar(50)', 'string', 'Wrealname', 'wrealname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (437, 39, 'wopenbank', '开户行', 'varchar(50)', 'string', 'Wopenbank', 'wopenbank', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (438, 39, 'wcreatetime', '申请时间', 'varchar(50)', 'string', 'Wcreatetime', 'wcreatetime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (439, 39, 'wstatus', '审核结果', 'int(11)', 'int64', 'Wstatus', 'wstatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (440, 39, 'wremark', '审核意见', 'varchar(255)', 'string', 'Wremark', 'wremark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (441, 39, 'waudittime', '审核时间', 'varchar(50)', 'string', 'Waudittime', 'waudittime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (442, 40, 'id', '主键', 'bigint(20)', 'int64', 'Id', 'id', '1', '1', '0', '1', '0', '0', '0', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (443, 40, 'uname', '手机号', 'varchar(11)', 'string', 'Uname', 'uname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (444, 40, 'puid', '推荐人ID', 'bigint(20)', 'int64', 'Puid', 'puid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (445, 40, 'puname', '推荐人手机号', 'varchar(11)', 'string', 'Puname', 'puname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (446, 40, 'real_name', '姓名', 'varchar(30)', 'string', 'RealName', 'realName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (447, 40, 'idno', '身份证号', 'varchar(18)', 'string', 'Idno', 'idno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (448, 40, 'avatar', '头像', 'varchar(50)', 'string', 'Avatar', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (449, 40, 'job', '职业', 'varchar(50)', 'string', 'Job', 'job', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (450, 40, 'utype', '用户类别', 'tinyint(1)', 'int', 'Utype', 'utype', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (451, 40, 'upwd', '密码', 'varchar(50)', 'string', 'Upwd', 'upwd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (452, 40, 'salt', '密码盐', 'varchar(45)', 'string', 'Salt', 'salt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (453, 40, 'idpic1', '身份证正面', 'varchar(100)', 'string', 'Idpic1', 'idpic1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (454, 40, 'idpic2', '身份证反面', 'varchar(100)', 'string', 'Idpic2', 'idpic2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (455, 40, 'pimg1', '职业资格认证1', 'varchar(100)', 'string', 'Pimg1', 'pimg1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (456, 40, 'pimg2', '职业资格认证2', 'varchar(100)', 'string', 'Pimg2', 'pimg2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (457, 40, 'pimg3', '职业资格认证3', 'varchar(100)', 'string', 'Pimg3', 'pimg3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (458, 40, 'status', '状态', 'tinyint(1)', 'int', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 17, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (459, 40, 'im_money', '在线咨询费用', 'decimal(8,2)', 'float64', 'ImMoney', 'imMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (460, 40, 'tel_money', '电话咨询费用', 'decimal(8,2)', 'float64', 'TelMoney', 'telMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (461, 40, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 20, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (462, 40, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 21, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (463, 41, 'id', '主键', 'bigint(20)', 'int64', 'Id', 'id', '1', '1', '0', '1', '0', '0', '0', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (464, 41, 'source_id', '注册ID', 'varchar(50)', 'string', 'SourceId', 'sourceId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (465, 41, 'source_type', '注册类别', 'tinyint(1)', 'int', 'SourceType', 'sourceType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (466, 41, 'recommender', '推荐人', 'varchar(20)', 'string', 'Recommender', 'recommender', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (467, 41, 'nick_name', '昵称', 'varchar(50)', 'string', 'NickName', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (468, 41, 'avatar', '头像', 'varchar(50)', 'string', 'Avatar', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (469, 41, 'zj_id', '专家ID', 'bigint(20)', 'int64', 'ZjId', 'zjId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (470, 41, 'status', '状态', 'tinyint(11)', 'int64', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (471, 41, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (472, 41, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (473, 1, 'config_id', '参数主键', 'int(5)', 'int', 'ConfigId', 'configId', '1', '1', '0', '1', '0', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (474, 1, 'config_name', '参数名称', 'varchar(100)', 'string', 'ConfigName', 'configName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (475, 1, 'config_key', '参数键名', 'varchar(100)', 'string', 'ConfigKey', 'configKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (476, 1, 'config_value', '参数键值', 'varchar(500)', 'string', 'ConfigValue', 'configValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (477, 1, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'string', 'ConfigType', 'configType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (478, 1, 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (479, 1, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (480, 1, 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (481, 1, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (482, 1, 'remark', '备注', 'varchar(500)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (483, 2, 'config_id', '参数主键', 'int(5)', 'int', 'ConfigId', 'configId', '1', '1', '0', '1', '0', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (484, 2, 'config_name', '参数名称', 'varchar(100)', 'string', 'ConfigName', 'configName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (485, 2, 'config_key', '参数键名', 'varchar(100)', 'string', 'ConfigKey', 'configKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (486, 2, 'config_value', '参数键值', 'varchar(500)', 'string', 'ConfigValue', 'configValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (487, 2, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'string', 'ConfigType', 'configType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (488, 2, 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (489, 2, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (490, 2, 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (491, 2, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (492, 2, 'remark', '备注', 'varchar(500)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (493, 3, 'config_id', '参数主键', 'int(5)', 'int', 'ConfigId', 'configId', '1', '1', '0', '1', '0', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (494, 3, 'config_name', '参数名称', 'varchar(100)', 'string', 'ConfigName', 'configName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (495, 3, 'config_key', '参数键名', 'varchar(100)', 'string', 'ConfigKey', 'configKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (496, 3, 'config_value', '参数键值', 'varchar(500)', 'string', 'ConfigValue', 'configValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (497, 3, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'string', 'ConfigType', 'configType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (498, 3, 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (499, 3, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (500, 3, 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (501, 3, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (502, 3, 'remark', '备注', 'varchar(500)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (503, 4, 'config_id', '参数主键', 'int(5)', 'int', 'ConfigId', 'configId', '1', '1', '0', '1', '0', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (504, 4, 'config_name', '参数名称', 'varchar(100)', 'string', 'ConfigName', 'configName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (505, 4, 'config_key', '参数键名', 'varchar(100)', 'string', 'ConfigKey', 'configKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (506, 4, 'config_value', '参数键值', 'varchar(500)', 'string', 'ConfigValue', 'configValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (507, 4, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'string', 'ConfigType', 'configType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (508, 4, 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (509, 4, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (510, 4, 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (511, 4, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datatime', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (512, 4, 'remark', '备注', 'varchar(500)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (513, 5, 'config_id', '参数主键11', 'int(5)', 'int', 'ConfigId', 'configId', '1', '1', '0', '1', '0', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (514, 5, 'config_name', '参数名称111', 'varchar(100)', 'string', 'ConfigName', 'configName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (515, 5, 'config_key', '参数键名111', 'varchar(100)', 'string', 'ConfigKey', 'configKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (516, 5, 'config_value', '参数键值', 'varchar(500)', 'string', 'ConfigValue', 'configValue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (517, 5, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'string', 'ConfigType', 'configType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (518, 5, 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 6, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (519, 5, 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (520, 5, 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (521, 5, 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', NULL, '', NULL);
INSERT INTO `gen_table_column` VALUES (522, 5, 'remark', '备注', 'varchar(500)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
                              `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', '', '2020-02-12 15:32:15', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', '', '2020-02-05 10:46:28', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '静态资源网盘存储', 'sys.resource.url', '/static', 'Y', 'admin', '2020-02-18 20:10:33', '', '2020-03-23 20:51:39', 'public目录下的静态资源存储到OSS/COS等网盘，将键值设为/public表示本地');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
                            `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '云捷网络', 0, 'admin', '15888888888', '110@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '运维部门', 1, '', '', '', '0', '0', 'admin', '2019-12-02 17:07:02', 'admin', '2020-03-13 09:49:52');
INSERT INTO `sys_dept` VALUES (111, 100, '0,100', '1长沙南方职业学院', 51, '曾尚兵1', '18788996255', 'ddd@163.com', '0', '2', 'admin', '2020-03-01 09:40:48', 'admin', '2020-03-01 09:40:55');
INSERT INTO `sys_dept` VALUES (112, 100, '0,100', '3242343243243242', 1, '曾尚兵', '18788996255', 'ddd@163.com', '0', '0', 'admin', '2020-03-21 16:30:26', 'admin', '2020-03-28 20:57:37');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', 'default', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 20:45:09', '[[*{remark}]]');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 0, '免费用户', '0', 'zjuser_type', NULL, 'default', 'Y', '0', 'admin', '2019-12-02 16:56:16', 'admin', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (30, 1, '付费用户', '1', 'zjuser_type', NULL, 'primary', 'Y', '0', 'admin', '2019-12-02 16:56:40', 'admin', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '微信用户', '0', 'zxuser_type', NULL, 'default', 'Y', '0', 'admin', '2019-12-02 17:14:32', 'admin', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 1, 'QQ用户', '1', 'zxuser_type', NULL, 'primary', 'N', '0', 'admin', '2019-12-02 17:14:55', 'admin', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 2, '抖音用户', '2', 'zxuser_type', NULL, 'primary', 'N', '0', 'admin', '2019-12-02 17:15:21', 'admin', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`),
                                 UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', '', '2020-03-01 09:41:19', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '专家用户类别', 'zjuser_type', '0', 'admin', '2019-12-02 16:55:42', 'admin', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '咨询用户类别', 'zxuser_type', '0', 'admin', '2019-12-02 17:14:07', 'admin', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '测试11', 'test3dddd', '0', 'admin', '2020-02-05 16:23:06', '', '2020-03-23 20:23:25', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
                           `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_params` varchar(200) DEFAULT '' COMMENT '参数',
                           `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) DEFAULT '1' COMMENT '计划执行策略（1多次执行 2执行一次）',
                           `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (10, 'test1', '', 'DEFAULT', 'test1', '* * * * *', '1', '1', '1', 'admin', '2020-02-26 15:30:27', '', '2020-03-24 16:12:46', '');
INSERT INTO `sys_job` VALUES (12, 'test2', 'helloworld|yjgo', 'DEFAULT', 'test2', '@every 3s', '1', '1', '1', 'admin', '2020-02-27 10:20:26', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
                                  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 13:29:30');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 13:59:34');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 14:33:41');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:07:56');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:20:08');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:22:20');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:38:52');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:39:51');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:49:13');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:50:04');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:52:06');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:53:42');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 15:56:50');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:01:00');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:02:31');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:03:26');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:09:14');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:20:03');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:27:41');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 16:34:51');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:04:05');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:12:21');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:17:53');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:20:11');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:44:10');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:45:20');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:51:47');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:55:35');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:57:44');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 18:59:49');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 19:01:42');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 19:04:18');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 19:28:51');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 19:30:01');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 20:42:57');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 20:46:46');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 20:48:01');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 21:08:41');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 21:43:49');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 21:55:36');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 21:56:54');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 22:00:25');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 22:07:46');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-25 14:18:52');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-25 14:59:39');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 13:46:03');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 16:19:47');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 16:23:40');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 16:24:22');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 16:26:52');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 17:38:39');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 17:41:48');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 17:43:37');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 17:45:25');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 19:38:09');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 19:39:43');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 19:41:09');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 20:35:01');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:07:38');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:32:22');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:35:00');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:36:07');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:51:02');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:53:04');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:54:52');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 21:56:22');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 22:00:20');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 22:08:10');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 22:10:38');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-26 22:18:28');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 09:39:14');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 09:40:27');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 09:46:12');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 09:47:49');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 09:49:05');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 09:52:40');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:00:55');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:03:04');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:03:52');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:11:50');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:12:47');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:17:20');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:18:32');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:39:41');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 10:44:16');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 11:04:58');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 11:43:43');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 12:02:57');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:00:55');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:36:47');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:39:50');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:40:51');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:42:14');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:43:20');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-27 21:45:45');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-28 20:56:27');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-28 21:06:20');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-29 14:54:13');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-04-16 15:50:09');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-04-16 15:56:04');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-04-16 16:06:16');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-05-05 13:50:54');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-05-05 13:53:13');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-05-05 13:59:27');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                            `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
                            `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1063 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '业务管理', 0, 1, '#', 'menuItem', 'M', '0', NULL, 'fa fa-newspaper-o', 'admin', '2019-12-02 16:39:09', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (5, '实例演示', 0, 5, '#', '', 'M', '0', '', 'fa fa-desktop', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (6, '表单演示', 5, 1, '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '表单演示');
INSERT INTO `sys_menu` VALUES (7, '表格演示', 5, 2, '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '表格演示');
INSERT INTO `sys_menu` VALUES (8, '弹框演示', 5, 3, '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '弹框演示');
INSERT INTO `sys_menu` VALUES (9, '操作演示', 5, 4, '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作演示');
INSERT INTO `sys_menu` VALUES (10, '报表演示', 5, 5, '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '报表演示');
INSERT INTO `sys_menu` VALUES (11, '图标演示', 5, 6, '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '图标演示');
INSERT INTO `sys_menu` VALUES (12, '栅格演示', 6, 2, '/demo/form/grid', '', 'C', '0', 'demo:grid:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (13, '下拉框', 6, 3, '/demo/form/select', '', 'C', '0', 'demo:select:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (14, '时间轴', 6, 4, '/demo/form/timeline', '', 'C', '0', 'demo:timeline:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (15, '基本表单', 6, 5, '/demo/form/basic', '', 'C', '0', 'demo:basic:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (16, '卡片列表', 6, 6, '/demo/form/cards', '', 'C', '0', 'demo:cards:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (17, '功能扩展', 6, 7, '/demo/form/jasny', '', 'C', '0', 'demo:jasny:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (18, '拖动排序', 6, 8, '/demo/form/sortable', '', 'C', '0', 'demo:sortable:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (19, '选项卡&面板', 6, 9, '/demo/form/tabs_panels', '', 'C', '0', 'demo:tabs_panels:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (20, '表单校验', 6, 10, '/demo/form/validate', '', 'C', '0', 'demo:validate:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (21, '表单向导', 6, 11, '/demo/form/wizard', '', 'C', '0', 'demo:wizard:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (22, '文件上传', 6, 12, '/demo/form/upload', '', 'C', '0', 'demo:upload:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (23, '日期和时间', 6, 13, '/demo/form/datetime', '', 'C', '0', 'demo:datetime:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (24, '富文本编辑器', 6, 14, '/demo/form/summernote', '', 'C', '0', 'demo:summernote:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (25, '左右互选', 6, 15, '/demo/form/duallistbox', '', 'C', '0', 'demo:duallistbox:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (27, '按钮演示', 6, 1, '/demo/form/button', 'menuItem', 'C', '0', 'demo:button:view', '#', 'admin', '2018-03-16 11:33:00', '', '2020-02-04 08:46:48', '');
INSERT INTO `sys_menu` VALUES (28, '数据汇总', 7, 2, '/demo/table/footer', '', 'C', '0', 'demo:footer:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (29, '组合表头', 7, 3, '/demo/table/groupHeader', '', 'C', '0', 'demo:groupHeader:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (31, '记住翻页', 7, 5, '/demo/table/remember', '', 'C', '0', 'demo:remember:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (32, '跳转指定页', 7, 6, '/demo/table/pageGo', '', 'C', '0', 'demo:pageGo:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (33, '查询参数', 7, 7, '/demo/table/params', '', 'C', '0', 'demo:params:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (35, '点击加载表格', 7, 9, '/demo/table/button', '', 'C', '0', 'demo:button:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (36, '表格冻结列', 7, 10, '/demo/table/fixedColumns', '', 'C', '0', 'demo:fixedColumns:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (37, '触发事件', 7, 11, '/demo/table/event', '', 'C', '0', 'demo:event:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (38, '细节视图', 7, 12, '/demo/table/detail', '', 'C', '0', 'demo:detail:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (39, '父子视图', 7, 13, '/demo/table/child', '', 'C', '0', 'demo:child:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (40, '图片预览', 7, 14, '/demo/table/image', '', 'C', '0', 'demo:image:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (41, '动态增删改查', 7, 15, '/demo/table/curd', '', 'C', '0', 'demo:curd:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (42, '表格拖曳', 7, 16, '/demo/table/recorder', '', 'C', '0', 'demo:recorder:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (43, '行内编辑', 7, 17, '/demo/table/editable', '', 'C', '0', 'demo:editable:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (44, '其它操作', 7, 18, '/demo/table/other', '', 'C', '0', 'demo:other:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (45, '查询条件', 7, 1, '/demo/table/search', '', 'C', '0', 'demo:search:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (46, '弹层组件', 8, 2, '/demo/modal/layer', '', 'C', '0', 'demo:layer:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (47, '弹层表格', 8, 3, '/demo/modal/table', '', 'C', '0', 'demo:table:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (48, '模态窗口', 8, 1, '/demo/modal/dialog', '', 'C', '0', 'demo:dialog:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (49, '其他操作', 9, 2, '/demo/operate/other', '', 'C', '0', 'demo:other:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (50, '表格操作', 9, 1, '/demo/operate/table', '', 'C', '0', 'demo:table:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (51, 'Peity', 10, 2, '/demo/report/metrics', '', 'C', '0', 'demo:metrics:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (52, 'SparkLine', 10, 3, '/demo/report/peity', '', 'C', '0', 'demo:peity:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (53, '图表组合', 10, 4, '/demo/report/sparkline', '', 'C', '0', 'demo:sparkline:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (54, '百度Echarts', 10, 1, '/demo/report/echarts', '', 'C', '0', 'demo:echarts:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (55, 'Glyphicons', 11, 2, '/demo/icon/glyphicons', '', 'C', '0', 'demo:glyphicons:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (56, 'Font Awesome', 11, 1, '/demo/icon/fontawesome', '', 'C', '0', 'demo:fontawesome:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 2, 4, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 2, 5, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1062, '字典详情', 105, 5, '#', '', 'F', '0', 'system:dict:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
                              `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
                              `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) DEFAULT '' COMMENT '模块标题',
                                `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(100) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (491, '操作日志管理', 3, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/operlog/clean', '::1', '内网IP', '\"all\"', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', 0, '', '2020-03-24 13:37:47');
INSERT INTO `sys_oper_log` VALUES (492, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:14:53');
INSERT INTO `sys_oper_log` VALUES (493, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:15:09');
INSERT INTO `sys_oper_log` VALUES (494, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":12}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [* * * * * *]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:33:58');
INSERT INTO `sys_oper_log` VALUES (495, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [* * * * * *]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:42:52');
INSERT INTO `sys_oper_log` VALUES (496, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":12}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [0/10 * * * * ?]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:51:19');
INSERT INTO `sys_oper_log` VALUES (497, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":12}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [0/10 * * * * ?]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:55:48');
INSERT INTO `sys_oper_log` VALUES (498, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [0/10 * * * * ?]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 14:57:27');
INSERT INTO `sys_oper_log` VALUES (499, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [0 30 * * * *]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:00:14');
INSERT INTO `sys_oper_log` VALUES (500, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [0 30 * * * *]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:04:08');
INSERT INTO `sys_oper_log` VALUES (501, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [*/5 * * * * *]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:05:22');
INSERT INTO `sys_oper_log` VALUES (502, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"expected exactly 5 fields, found 6: [*/5 * * * * *]\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:08:47');
INSERT INTO `sys_oper_log` VALUES (503, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:12:22');
INSERT INTO `sys_oper_log` VALUES (504, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:14:10');
INSERT INTO `sys_oper_log` VALUES (505, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:15:57');
INSERT INTO `sys_oper_log` VALUES (506, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:15:58');
INSERT INTO `sys_oper_log` VALUES (507, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":12}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:16:45');
INSERT INTO `sys_oper_log` VALUES (508, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:20:31');
INSERT INTO `sys_oper_log` VALUES (509, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:20:58');
INSERT INTO `sys_oper_log` VALUES (510, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:22:31');
INSERT INTO `sys_oper_log` VALUES (511, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:38:23');
INSERT INTO `sys_oper_log` VALUES (512, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:39:28');
INSERT INTO `sys_oper_log` VALUES (513, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 15:49:23');
INSERT INTO `sys_oper_log` VALUES (514, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 15:51:20');
INSERT INTO `sys_oper_log` VALUES (515, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:51:20');
INSERT INTO `sys_oper_log` VALUES (516, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 15:52:20');
INSERT INTO `sys_oper_log` VALUES (517, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 15:54:12');
INSERT INTO `sys_oper_log` VALUES (518, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 15:57:02');
INSERT INTO `sys_oper_log` VALUES (519, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 15:57:12');
INSERT INTO `sys_oper_log` VALUES (520, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 15:57:21');
INSERT INTO `sys_oper_log` VALUES (521, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:01:34');
INSERT INTO `sys_oper_log` VALUES (522, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:03:34');
INSERT INTO `sys_oper_log` VALUES (523, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:03:46');
INSERT INTO `sys_oper_log` VALUES (524, '定时任务管理', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/edit', '::1', '内网IP', '{\"JobName\":\"test1\",\"JobParams\":\"\",\"JobGroup\":\"DEFAULT\",\"JobId\":10,\"InvokeTarget\":\"test1\",\"CronExpression\":\"1 * * * * \",\"MisfirePolicy\":\"2\",\"Concurrent\":\"1\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', 0, '', '2020-03-24 16:11:12');
INSERT INTO `sys_oper_log` VALUES (525, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:11:15');
INSERT INTO `sys_oper_log` VALUES (526, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:11:31');
INSERT INTO `sys_oper_log` VALUES (527, '定时任务管理', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/edit', '::1', '内网IP', '{\"JobName\":\"test1\",\"JobParams\":\"\",\"JobGroup\":\"DEFAULT\",\"JobId\":10,\"InvokeTarget\":\"test1\",\"CronExpression\":\"1 * * * * \",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', 0, '', '2020-03-24 16:12:46');
INSERT INTO `sys_oper_log` VALUES (528, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:14:47');
INSERT INTO `sys_oper_log` VALUES (529, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:18:06');
INSERT INTO `sys_oper_log` VALUES (530, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:18:14');
INSERT INTO `sys_oper_log` VALUES (531, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":500,\"msg\":\"任务已存在\",\"data\":null,\"otype\":0}', 1, '', '2020-03-24 16:18:20');
INSERT INTO `sys_oper_log` VALUES (532, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:18:29');
INSERT INTO `sys_oper_log` VALUES (533, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:20:56');
INSERT INTO `sys_oper_log` VALUES (534, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 16:27:49');
INSERT INTO `sys_oper_log` VALUES (535, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:20:36');
INSERT INTO `sys_oper_log` VALUES (536, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:44:53');
INSERT INTO `sys_oper_log` VALUES (537, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:46:52');
INSERT INTO `sys_oper_log` VALUES (538, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:51:59');
INSERT INTO `sys_oper_log` VALUES (539, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:52:24');
INSERT INTO `sys_oper_log` VALUES (540, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:53:27');
INSERT INTO `sys_oper_log` VALUES (541, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:55:51');
INSERT INTO `sys_oper_log` VALUES (542, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:56:55');
INSERT INTO `sys_oper_log` VALUES (543, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:58:04');
INSERT INTO `sys_oper_log` VALUES (544, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:58:29');
INSERT INTO `sys_oper_log` VALUES (545, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 18:59:59');
INSERT INTO `sys_oper_log` VALUES (546, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 19:01:46');
INSERT INTO `sys_oper_log` VALUES (547, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 19:02:18');
INSERT INTO `sys_oper_log` VALUES (548, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 19:04:44');
INSERT INTO `sys_oper_log` VALUES (549, '定时任务管理停止', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/stop', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 19:05:02');
INSERT INTO `sys_oper_log` VALUES (550, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 19:06:01');
INSERT INTO `sys_oper_log` VALUES (551, '定时任务管理启动', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/monitor/job/start', '::1', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-24 19:30:13');
INSERT INTO `sys_oper_log` VALUES (552, '生成代码', 3, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/remove', '::1', '内网IP', '{\"Ids\":\"37,38,39,40,41\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-03-24 22:09:41');
INSERT INTO `sys_oper_log` VALUES (553, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-24 22:09:45');
INSERT INTO `sys_oper_log` VALUES (554, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-24 22:09:45');
INSERT INTO `sys_oper_log` VALUES (555, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-24 22:09:49');
INSERT INTO `sys_oper_log` VALUES (556, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-24 22:09:49');
INSERT INTO `sys_oper_log` VALUES (557, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 16:27:02');
INSERT INTO `sys_oper_log` VALUES (558, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 16:27:02');
INSERT INTO `sys_oper_log` VALUES (559, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:35:07');
INSERT INTO `sys_oper_log` VALUES (560, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:35:07');
INSERT INTO `sys_oper_log` VALUES (561, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:40:25');
INSERT INTO `sys_oper_log` VALUES (562, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:40:25');
INSERT INTO `sys_oper_log` VALUES (563, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:40:29');
INSERT INTO `sys_oper_log` VALUES (564, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:40:29');
INSERT INTO `sys_oper_log` VALUES (565, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:41:19');
INSERT INTO `sys_oper_log` VALUES (566, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:41:19');
INSERT INTO `sys_oper_log` VALUES (567, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":500,\"msg\":\"sql: converting argument $1 type: unsupported type []string, a slice of string\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:42:16');
INSERT INTO `sys_oper_log` VALUES (568, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":500,\"msg\":\"Error 1054: Unknown column \'table_id\' in \'field list\'\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 17:43:50');
INSERT INTO `sys_oper_log` VALUES (569, '导入表结构', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-26 19:38:33');
INSERT INTO `sys_oper_log` VALUES (570, '生成代码', 3, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/remove', '::1', '内网IP', '{\"Ids\":\"1\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-03-26 19:41:15');
INSERT INTO `sys_oper_log` VALUES (571, '导入表结构', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-26 19:43:19');
INSERT INTO `sys_oper_log` VALUES (572, '导入表结构', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-26 19:43:24');
INSERT INTO `sys_oper_log` VALUES (573, '导入表结构', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-26 20:13:33');
INSERT INTO `sys_oper_log` VALUES (574, '生成代码', 3, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/remove', '::1', '内网IP', '{\"Ids\":\"2,3,4\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-03-26 20:35:09');
INSERT INTO `sys_oper_log` VALUES (575, '导入表结构', 0, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/importTable', '::1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-26 20:35:20');
INSERT INTO `sys_oper_log` VALUES (576, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:32:29');
INSERT INTO `sys_oper_log` VALUES (577, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:33:36');
INSERT INTO `sys_oper_log` VALUES (578, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:35:11');
INSERT INTO `sys_oper_log` VALUES (579, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:36:12');
INSERT INTO `sys_oper_log` VALUES (580, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:37:19');
INSERT INTO `sys_oper_log` VALUES (581, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:37:47');
INSERT INTO `sys_oper_log` VALUES (582, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:42:54');
INSERT INTO `sys_oper_log` VALUES (583, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 21:49:13');
INSERT INTO `sys_oper_log` VALUES (584, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 22:11:02');
INSERT INTO `sys_oper_log` VALUES (585, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 22:12:45');
INSERT INTO `sys_oper_log` VALUES (586, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 22:17:06');
INSERT INTO `sys_oper_log` VALUES (587, '生成代码', 1, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/column/list', '::1', '内网IP', '{\"tableId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":1}', 1, '', '2020-03-26 22:17:57');
INSERT INTO `sys_oper_log` VALUES (588, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-26 22:18:46');
INSERT INTO `sys_oper_log` VALUES (589, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-26 22:19:02');
INSERT INTO `sys_oper_log` VALUES (590, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:27:16');
INSERT INTO `sys_oper_log` VALUES (591, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:28:30');
INSERT INTO `sys_oper_log` VALUES (592, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:28:43');
INSERT INTO `sys_oper_log` VALUES (593, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:29:05');
INSERT INTO `sys_oper_log` VALUES (594, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:29:39');
INSERT INTO `sys_oper_log` VALUES (595, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:36:59');
INSERT INTO `sys_oper_log` VALUES (596, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":500,\"msg\":\"json: cannot unmarshal string into Go struct field Entity.column_id of type int64\",\"data\":null,\"otype\":2}', 1, '', '2020-03-27 09:44:01');
INSERT INTO `sys_oper_log` VALUES (597, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:44:52');
INSERT INTO `sys_oper_log` VALUES (598, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":500,\"msg\":\"json: cannot unmarshal number into Go struct field Entity.is_insert of type string\",\"data\":null,\"otype\":2}', 1, '', '2020-03-27 09:46:43');
INSERT INTO `sys_oper_log` VALUES (599, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:49:14');
INSERT INTO `sys_oper_log` VALUES (600, '生成代码', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/tool/gen/edit', '::1', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', 0, '', '2020-03-27 09:49:30');
INSERT INTO `sys_oper_log` VALUES (601, '生成代码', 0, 'GET', 'GET', 1, 'admin', '运维部门', '/tool/gen/genCode', '::1', '内网IP', '{\"tableId\":5}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-27 11:12:03');
INSERT INTO `sys_oper_log` VALUES (602, '生成代码', 0, 'GET', 'GET', 1, 'admin', '运维部门', '/tool/gen/genCode', '::1', '内网IP', '{\"tableId\":5}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-27 11:16:07');
INSERT INTO `sys_oper_log` VALUES (603, '生成代码', 0, 'GET', 'GET', 1, 'admin', '运维部门', '/tool/gen/genCode', '::1', '内网IP', '{\"tableId\":5}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-27 11:17:39');
INSERT INTO `sys_oper_log` VALUES (604, '生成代码', 0, 'GET', 'GET', 1, 'admin', '运维部门', '/tool/gen/genCode', '::1', '内网IP', '{\"tableId\":5}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-27 11:19:14');
INSERT INTO `sys_oper_log` VALUES (605, '生成代码', 0, 'GET', 'GET', 1, 'admin', '运维部门', '/tool/gen/genCode', '::1', '内网IP', '{\"tableId\":5}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-27 12:03:03');
INSERT INTO `sys_oper_log` VALUES (606, '生成代码', 0, 'GET', 'GET', 1, 'admin', '运维部门', '/tool/gen/genCode', '::1', '内网IP', '{\"tableId\":5}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', 0, '', '2020-03-27 21:01:05');
INSERT INTO `sys_oper_log` VALUES (607, '部门管理', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/system/dept/edit', '::1', '内网IP', '{\"DeptId\":112,\"ParentId\":100,\"DeptName\":\"4535345\",\"OrderNum\":1,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', 0, '', '2020-03-28 20:57:32');
INSERT INTO `sys_oper_log` VALUES (608, '部门管理', 2, 'POST', 'POST', 1, 'admin', '运维部门', '/system/dept/edit', '::1', '内网IP', '{\"DeptId\":112,\"ParentId\":100,\"DeptName\":\"3242343243243242\",\"OrderNum\":1,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', 0, '', '2020-03-28 20:57:37');
INSERT INTO `sys_oper_log` VALUES (609, '菜单管理', 3, 'GET', 'GET', 1, 'admin', '运维部门', '/system/menu/remove', '::1', '内网IP', '{\"id\":1035}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-05-05 14:18:01');
INSERT INTO `sys_oper_log` VALUES (610, '菜单管理', 3, 'GET', 'GET', 1, 'admin', '运维部门', '/system/menu/remove', '::1', '内网IP', '{\"id\":1038}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-05-05 14:18:14');
INSERT INTO `sys_oper_log` VALUES (611, '菜单管理', 3, 'GET', 'GET', 1, 'admin', '运维部门', '/system/menu/remove', '::1', '内网IP', '{\"id\":1037}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-05-05 14:18:22');
INSERT INTO `sys_oper_log` VALUES (612, '菜单管理', 3, 'GET', 'GET', 1, 'admin', '运维部门', '/system/menu/remove', '::1', '内网IP', '{\"id\":1036}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-05-05 14:18:28');
INSERT INTO `sys_oper_log` VALUES (613, '菜单管理', 3, 'GET', 'GET', 1, 'admin', '运维部门', '/system/menu/remove', '::1', '内网IP', '{\"id\":107}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', 0, '', '2020-05-05 14:18:33');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
                            `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
                            `post_sort` int(4) NOT NULL COMMENT '显示顺序',
                            `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', '', '2020-03-13 10:34:36', '4223434');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理1111', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 20:23:12', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int(4) NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', '', '2020-03-12 16:01:23', '管理员');
INSERT INTO `sys_role` VALUES (3, '培训111', 'dfgdfg', 0, '5', '0', '0', 'admin', '2020-03-01 09:13:21', 'admin', '2020-03-22 15:06:58', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 110);
INSERT INTO `sys_role_dept` VALUES (3, 100);
INSERT INTO `sys_role_dept` VALUES (3, 110);
INSERT INTO `sys_role_dept` VALUES (3, 112);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 502);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1016);
INSERT INTO `sys_role_menu` VALUES (1, 1017);
INSERT INTO `sys_role_menu` VALUES (1, 1018);
INSERT INTO `sys_role_menu` VALUES (1, 1019);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1022);
INSERT INTO `sys_role_menu` VALUES (1, 1023);
INSERT INTO `sys_role_menu` VALUES (1, 1024);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1044);
INSERT INTO `sys_role_menu` VALUES (1, 1045);
INSERT INTO `sys_role_menu` VALUES (1, 1046);
INSERT INTO `sys_role_menu` VALUES (1, 1047);
INSERT INTO `sys_role_menu` VALUES (1, 1048);
INSERT INTO `sys_role_menu` VALUES (1, 1049);
INSERT INTO `sys_role_menu` VALUES (1, 1050);
INSERT INTO `sys_role_menu` VALUES (1, 1051);
INSERT INTO `sys_role_menu` VALUES (1, 1052);
INSERT INTO `sys_role_menu` VALUES (1, 1053);
INSERT INTO `sys_role_menu` VALUES (1, 1054);
INSERT INTO `sys_role_menu` VALUES (1, 1055);
INSERT INTO `sys_role_menu` VALUES (1, 1056);
INSERT INTO `sys_role_menu` VALUES (1, 1057);
INSERT INTO `sys_role_menu` VALUES (1, 1058);
INSERT INTO `sys_role_menu` VALUES (1, 1059);
INSERT INTO `sys_role_menu` VALUES (1, 1060);
INSERT INTO `sys_role_menu` VALUES (1, 1061);
INSERT INTO `sys_role_menu` VALUES (1, 1086);
INSERT INTO `sys_role_menu` VALUES (1, 1093);
INSERT INTO `sys_role_menu` VALUES (1, 1094);
INSERT INTO `sys_role_menu` VALUES (1, 1095);
INSERT INTO `sys_role_menu` VALUES (1, 1096);
INSERT INTO `sys_role_menu` VALUES (1, 1097);
INSERT INTO `sys_role_menu` VALUES (1, 1098);
INSERT INTO `sys_role_menu` VALUES (1, 1099);
INSERT INTO `sys_role_menu` VALUES (1, 1101);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1104);
INSERT INTO `sys_role_menu` VALUES (1, 1105);
INSERT INTO `sys_role_menu` VALUES (1, 1106);
INSERT INTO `sys_role_menu` VALUES (1, 1107);
INSERT INTO `sys_role_menu` VALUES (1, 1108);
INSERT INTO `sys_role_menu` VALUES (1, 1109);
INSERT INTO `sys_role_menu` VALUES (1, 1110);
INSERT INTO `sys_role_menu` VALUES (1, 1111);
INSERT INTO `sys_role_menu` VALUES (1, 1112);
INSERT INTO `sys_role_menu` VALUES (1, 1113);
INSERT INTO `sys_role_menu` VALUES (1, 1114);
INSERT INTO `sys_role_menu` VALUES (1, 1115);
INSERT INTO `sys_role_menu` VALUES (1, 1116);
INSERT INTO `sys_role_menu` VALUES (1, 1117);
INSERT INTO `sys_role_menu` VALUES (1, 1118);
INSERT INTO `sys_role_menu` VALUES (1, 1119);
INSERT INTO `sys_role_menu` VALUES (1, 1120);
INSERT INTO `sys_role_menu` VALUES (1, 1121);
INSERT INTO `sys_role_menu` VALUES (1, 1122);
INSERT INTO `sys_role_menu` VALUES (1, 1123);
INSERT INTO `sys_role_menu` VALUES (1, 1124);
INSERT INTO `sys_role_menu` VALUES (1, 1125);
INSERT INTO `sys_role_menu` VALUES (1, 1126);
INSERT INTO `sys_role_menu` VALUES (1, 1127);
INSERT INTO `sys_role_menu` VALUES (1, 1129);
INSERT INTO `sys_role_menu` VALUES (1, 1130);
INSERT INTO `sys_role_menu` VALUES (1, 1131);
INSERT INTO `sys_role_menu` VALUES (1, 1132);
INSERT INTO `sys_role_menu` VALUES (1, 1133);
INSERT INTO `sys_role_menu` VALUES (1, 1134);
INSERT INTO `sys_role_menu` VALUES (1, 1135);
INSERT INTO `sys_role_menu` VALUES (1, 1136);
INSERT INTO `sys_role_menu` VALUES (1, 1137);
INSERT INTO `sys_role_menu` VALUES (1, 1138);
INSERT INTO `sys_role_menu` VALUES (1, 1139);
INSERT INTO `sys_role_menu` VALUES (1, 1140);
INSERT INTO `sys_role_menu` VALUES (1, 1143);
INSERT INTO `sys_role_menu` VALUES (1, 1144);
INSERT INTO `sys_role_menu` VALUES (1, 1145);
INSERT INTO `sys_role_menu` VALUES (1, 1146);
INSERT INTO `sys_role_menu` VALUES (1, 1147);
INSERT INTO `sys_role_menu` VALUES (1, 1148);
INSERT INTO `sys_role_menu` VALUES (1, 1149);
INSERT INTO `sys_role_menu` VALUES (1, 1150);
INSERT INTO `sys_role_menu` VALUES (1, 1151);
INSERT INTO `sys_role_menu` VALUES (1, 1152);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (2, 13);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 24);
INSERT INTO `sys_role_menu` VALUES (2, 25);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 27);
INSERT INTO `sys_role_menu` VALUES (2, 28);
INSERT INTO `sys_role_menu` VALUES (2, 29);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 34);
INSERT INTO `sys_role_menu` VALUES (2, 35);
INSERT INTO `sys_role_menu` VALUES (2, 36);
INSERT INTO `sys_role_menu` VALUES (2, 37);
INSERT INTO `sys_role_menu` VALUES (2, 38);
INSERT INTO `sys_role_menu` VALUES (2, 39);
INSERT INTO `sys_role_menu` VALUES (2, 40);
INSERT INTO `sys_role_menu` VALUES (2, 41);
INSERT INTO `sys_role_menu` VALUES (2, 42);
INSERT INTO `sys_role_menu` VALUES (2, 43);
INSERT INTO `sys_role_menu` VALUES (2, 44);
INSERT INTO `sys_role_menu` VALUES (2, 45);
INSERT INTO `sys_role_menu` VALUES (2, 46);
INSERT INTO `sys_role_menu` VALUES (2, 47);
INSERT INTO `sys_role_menu` VALUES (2, 48);
INSERT INTO `sys_role_menu` VALUES (2, 49);
INSERT INTO `sys_role_menu` VALUES (2, 50);
INSERT INTO `sys_role_menu` VALUES (2, 51);
INSERT INTO `sys_role_menu` VALUES (2, 52);
INSERT INTO `sys_role_menu` VALUES (2, 53);
INSERT INTO `sys_role_menu` VALUES (2, 54);
INSERT INTO `sys_role_menu` VALUES (2, 55);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 110);
INSERT INTO `sys_role_menu` VALUES (3, 112);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 115);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 502);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);
INSERT INTO `sys_role_menu` VALUES (3, 1047);
INSERT INTO `sys_role_menu` VALUES (3, 1048);
INSERT INTO `sys_role_menu` VALUES (3, 1049);
INSERT INTO `sys_role_menu` VALUES (3, 1050);
INSERT INTO `sys_role_menu` VALUES (3, 1051);
INSERT INTO `sys_role_menu` VALUES (3, 1052);
INSERT INTO `sys_role_menu` VALUES (3, 1053);
INSERT INTO `sys_role_menu` VALUES (3, 1054);
INSERT INTO `sys_role_menu` VALUES (3, 1055);
INSERT INTO `sys_role_menu` VALUES (3, 1056);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 1058);
INSERT INTO `sys_role_menu` VALUES (3, 1059);
INSERT INTO `sys_role_menu` VALUES (3, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1061);
INSERT INTO `sys_role_menu` VALUES (3, 1086);
INSERT INTO `sys_role_menu` VALUES (3, 1093);
INSERT INTO `sys_role_menu` VALUES (3, 1094);
INSERT INTO `sys_role_menu` VALUES (3, 1095);
INSERT INTO `sys_role_menu` VALUES (3, 1096);
INSERT INTO `sys_role_menu` VALUES (3, 1097);
INSERT INTO `sys_role_menu` VALUES (3, 1098);
INSERT INTO `sys_role_menu` VALUES (3, 1099);
INSERT INTO `sys_role_menu` VALUES (3, 1100);
INSERT INTO `sys_role_menu` VALUES (3, 1101);
INSERT INTO `sys_role_menu` VALUES (3, 1102);
INSERT INTO `sys_role_menu` VALUES (3, 1103);
INSERT INTO `sys_role_menu` VALUES (3, 1104);
INSERT INTO `sys_role_menu` VALUES (3, 1105);
INSERT INTO `sys_role_menu` VALUES (3, 1106);
INSERT INTO `sys_role_menu` VALUES (3, 1107);
INSERT INTO `sys_role_menu` VALUES (3, 1108);
INSERT INTO `sys_role_menu` VALUES (3, 1109);
INSERT INTO `sys_role_menu` VALUES (3, 1110);
INSERT INTO `sys_role_menu` VALUES (3, 1111);
INSERT INTO `sys_role_menu` VALUES (3, 1112);
INSERT INTO `sys_role_menu` VALUES (3, 1113);
INSERT INTO `sys_role_menu` VALUES (3, 1114);
INSERT INTO `sys_role_menu` VALUES (3, 1115);
INSERT INTO `sys_role_menu` VALUES (3, 1116);
INSERT INTO `sys_role_menu` VALUES (3, 1117);
INSERT INTO `sys_role_menu` VALUES (3, 1118);
INSERT INTO `sys_role_menu` VALUES (3, 1119);
INSERT INTO `sys_role_menu` VALUES (3, 1120);
INSERT INTO `sys_role_menu` VALUES (3, 1121);
INSERT INTO `sys_role_menu` VALUES (3, 1122);
INSERT INTO `sys_role_menu` VALUES (3, 1123);
INSERT INTO `sys_role_menu` VALUES (3, 1124);
INSERT INTO `sys_role_menu` VALUES (3, 1125);
INSERT INTO `sys_role_menu` VALUES (3, 1126);
INSERT INTO `sys_role_menu` VALUES (3, 1127);
INSERT INTO `sys_role_menu` VALUES (3, 1129);
INSERT INTO `sys_role_menu` VALUES (3, 1130);
INSERT INTO `sys_role_menu` VALUES (3, 1131);
INSERT INTO `sys_role_menu` VALUES (3, 1132);
INSERT INTO `sys_role_menu` VALUES (3, 1133);
INSERT INTO `sys_role_menu` VALUES (3, 1134);
INSERT INTO `sys_role_menu` VALUES (3, 1135);
INSERT INTO `sys_role_menu` VALUES (3, 1136);
INSERT INTO `sys_role_menu` VALUES (3, 1137);
INSERT INTO `sys_role_menu` VALUES (3, 1138);
INSERT INTO `sys_role_menu` VALUES (3, 1139);
INSERT INTO `sys_role_menu` VALUES (3, 1140);
INSERT INTO `sys_role_menu` VALUES (3, 1141);
INSERT INTO `sys_role_menu` VALUES (3, 1142);
INSERT INTO `sys_role_menu` VALUES (3, 1143);
INSERT INTO `sys_role_menu` VALUES (3, 1144);
INSERT INTO `sys_role_menu` VALUES (3, 1145);
INSERT INTO `sys_role_menu` VALUES (3, 1146);
INSERT INTO `sys_role_menu` VALUES (3, 1147);
INSERT INTO `sys_role_menu` VALUES (3, 1148);
INSERT INTO `sys_role_menu` VALUES (3, 1149);
INSERT INTO `sys_role_menu` VALUES (3, 1150);
INSERT INTO `sys_role_menu` VALUES (3, 1151);
INSERT INTO `sys_role_menu` VALUES (3, 1152);
INSERT INTO `sys_role_menu` VALUES (3, 1153);
INSERT INTO `sys_role_menu` VALUES (3, 1154);
INSERT INTO `sys_role_menu` VALUES (3, 1155);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
                            `login_name` varchar(30) NOT NULL COMMENT '登录账号',
                            `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
                            `password` varchar(50) DEFAULT '' COMMENT '密码',
                            `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 110, 'admin', '超级管理员', '00', 'dd122221111d@163.com', '15888888881', '0', '/upload/admin1579180516186761000.png', '609ac514e6ef0b9a5f4eee66693fd7f8', 'NcSB3H', '0', '0', '127.0.0.1', '2020-01-13 13:20:40', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-24 13:29:45', '管理员111111');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
                                   `sessionId` varchar(250) NOT NULL DEFAULT '' COMMENT '用户会话id',
                                   `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
                                   `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                   `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
                                   `login_location` varchar(50) DEFAULT '' COMMENT '登录地点',
                                   `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                   `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                   `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
                                   `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
                                   `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
                                   `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
                                   PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES ('FAPHUV2S4FFIDLY6DIQVBRVBJY6DJXTDKH3EHPV7JPOFPFMZUUGA', 'admin', '', '::1', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', 'on_line', '2020-05-05 13:59:27', '2020-05-05 13:59:27', 1440);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
                                 `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                 `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
