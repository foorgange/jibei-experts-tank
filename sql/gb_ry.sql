/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731 (5.7.31-log)
 Source Host           : localhost:3306
 Source Schema         : gb_ry

 Target Server Type    : MySQL
 Target Server Version : 50731 (5.7.31-log)
 File Encoding         : 65001

 Date: 25/08/2023 11:53:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for expert_class
-- ----------------------------
DROP TABLE IF EXISTS `expert_class`;
CREATE TABLE `expert_class`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专家类别id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家类别名称',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家的专家类别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expert_class
-- ----------------------------
INSERT INTO `expert_class` VALUES (1, '测试类别1');
INSERT INTO `expert_class` VALUES (2, '测试类别2');
INSERT INTO `expert_class` VALUES (3, '测试类别3');
INSERT INTO `expert_class` VALUES (4, '测试类别4');

-- ----------------------------
-- Table structure for expert_major
-- ----------------------------
DROP TABLE IF EXISTS `expert_major`;
CREATE TABLE `expert_major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家的专业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expert_major
-- ----------------------------
INSERT INTO `expert_major` VALUES (1, '测试专业');

-- ----------------------------
-- Table structure for expert_template
-- ----------------------------
DROP TABLE IF EXISTS `expert_template`;
CREATE TABLE `expert_template`  (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `template_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家私有模板表\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expert_template
-- ----------------------------
INSERT INTO `expert_template` VALUES (1, 1, '/profile/template/2022/03/31/a306d01d-f9a9-42b5-be81-619a5b70257b.docx', '测试模板');
INSERT INTO `expert_template` VALUES (2, 133, '/profile/template/2022/07/08/7a4574ba-33f1-43e0-a535-a3594aecc033.docx', '私有模板1');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `datasource_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据源',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'tec_attachfile', '科技成果描述表', NULL, NULL, 'TecAttachfile', 'crud', 'com.ruoyi.system', 'system', 'attachfile', '科技成果附件', 'ruoyi', '0', '/', '{}', 'admin', '2023-08-17 10:45:50', '', '2023-08-17 10:47:35', NULL, 'MASTER');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `link_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接业务表\n',
  `link_field` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接字段',
  `link_show_field` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '显示字段',
  `left_tree_flag` int(11) NULL DEFAULT 0 COMMENT '连接的树表是否作为左树，0为否，1为是',
  `filter_field` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '过滤字段',
  `field_check` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字段验证类型',
  `field_min` int(11) NULL DEFAULT NULL COMMENT '字段最小值',
  `field_max` int(11) NULL DEFAULT NULL COMMENT '字段最大值',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (35, '6', 'file_id', NULL, 'int(11)', 'Integer', 'fileId', '1', '1', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-08-17 10:45:50', '', '2023-08-17 10:47:35', '', '', '', 0, '', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (36, '6', 'achievement_id', NULL, 'int(11)', 'Integer', 'achievementId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-08-17 10:45:50', '', '2023-08-17 10:47:35', '', '', '', 0, '', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (37, '6', 'file_name', NULL, 'varchar(255)', 'String', 'fileName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-08-17 10:45:50', '', '2023-08-17 10:47:35', '', '', '', 0, '', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (38, '6', 'file_path', NULL, 'varchar(255)', 'String', 'filePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-08-17 10:45:50', '', '2023-08-17 10:47:35', '', '', '', 0, '', '', NULL, NULL);

-- ----------------------------
-- Table structure for pass_code
-- ----------------------------
DROP TABLE IF EXISTS `pass_code`;
CREATE TABLE `pass_code`  (
  `pass_code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通行码id',
  `pass_code_value` int(11) NOT NULL COMMENT '通行码',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `use_time` date NULL DEFAULT NULL COMMENT '使用时间',
  `code_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '通行码状态(0未使用，1已使用，2已过期)',
  PRIMARY KEY (`pass_code_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家注册时的通行码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pass_code
-- ----------------------------
INSERT INTO `pass_code` VALUES (38, 443754, '郝务一', '2022-07-08', '2022-07-08', '1');
INSERT INTO `pass_code` VALUES (37, 185677, '李四', '2022-07-05', '2022-07-05', '1');
INSERT INTO `pass_code` VALUES (36, 876268, 'zhangsan', '2022-07-05', '2022-07-05', '1');
INSERT INTO `pass_code` VALUES (40, 936642, '张翔', '2022-07-10', NULL, '0');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `project_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目内容',
  `senior_num` int(11) NULL DEFAULT NULL COMMENT '高级人数',
  `middle_num` int(11) NULL DEFAULT NULL COMMENT '中级人数',
  `primary_num` int(11) NULL DEFAULT NULL COMMENT '初级人数',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业主',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '建项人',
  `manage_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经理',
  `project_status` int(11) NULL DEFAULT NULL COMMENT '项目状态',
  `extraction_status` int(11) NULL DEFAULT NULL COMMENT '抽取状态',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (75, '测试项目', 'xxxx', 1, 1, 1, '张三', '2022-07-12 20:18:03', '2022-07-28 00:00:00', 1, '李四', 4, 2);
INSERT INTO `project` VALUES (74, '自评互评任务展示', NULL, 1, 1, 1, '1', '2022-07-10 13:55:10', '2022-07-10 00:00:00', 134, '1', 5, 2);
INSERT INTO `project` VALUES (72, '任务书任务项目展示', NULL, 1, 1, 0, '1', '2022-07-08 20:28:08', '2022-07-08 00:00:00', 133, '1', 5, 2);
INSERT INTO `project` VALUES (71, '项目团队建设', NULL, 1, 1, 0, 'xxx', '2022-07-08 20:20:48', '2022-07-08 00:00:00', 133, 'xxx', 5, 2);
INSERT INTO `project` VALUES (73, '项目开发', NULL, 5, 4, 3, '张三', '2022-07-10 13:34:29', NULL, 134, '李四', 4, 2);
INSERT INTO `project` VALUES (69, '电力设备维护', NULL, 1, 1, 1, '张三', '2022-07-05 03:32:12', '2022-07-06 00:00:00', 131, '张三', 5, 2);

-- ----------------------------
-- Table structure for project_book_task
-- ----------------------------
DROP TABLE IF EXISTS `project_book_task`;
CREATE TABLE `project_book_task`  (
  `book_task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '制定任务书任务id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交任务书名称',
  `book_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务书存储路径',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`book_task_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_book_task
-- ----------------------------
INSERT INTO `project_book_task` VALUES (21, 1, NULL, '/profile/book/2022/07/13/d7dc84bd-3f6c-4089-aa7c-32a20e9cba06.docx', 52);
INSERT INTO `project_book_task` VALUES (20, 134, NULL, '/profile/book/2022/07/10/15d19da8-d955-4c5a-838e-2f4794fae60a.docx', 50);
INSERT INTO `project_book_task` VALUES (19, 130, NULL, '/profile/book/2022/07/08/fa342116-3b9c-4d1f-85c3-18203e6b0001.docx', 48);
INSERT INTO `project_book_task` VALUES (18, 133, NULL, '/profile/book/2022/07/08/29fc3fee-b8e4-4160-8cf9-eda9c98edd40.docx', 49);

-- ----------------------------
-- Table structure for project_check_task
-- ----------------------------
DROP TABLE IF EXISTS `project_check_task`;
CREATE TABLE `project_check_task`  (
  `check_task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自评互评任务id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `subject_id` int(11) NULL DEFAULT NULL COMMENT '被评价客体id',
  `indicator1` int(11) NULL DEFAULT NULL COMMENT '指标1',
  `indicator2` int(11) NULL DEFAULT NULL COMMENT '指标2',
  `indicator3` int(11) NULL DEFAULT NULL COMMENT '指标3',
  `indicator4` int(11) NULL DEFAULT NULL COMMENT '指标4',
  `indicator5` int(11) NULL DEFAULT NULL COMMENT '指标5',
  `indicator6` int(11) NULL DEFAULT NULL COMMENT '指标6',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`check_task_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of project_check_task
-- ----------------------------
INSERT INTO `project_check_task` VALUES (54, 134, 74, 134, 20, NULL, 20, 20, 20, 20, 51);
INSERT INTO `project_check_task` VALUES (53, 133, 71, 133, 20, NULL, 20, 20, 20, 20, 47);
INSERT INTO `project_check_task` VALUES (52, 131, 69, 131, 1, NULL, 1, 1, 1, 1, 46);
INSERT INTO `project_check_task` VALUES (51, 131, 69, 130, NULL, 1, 1, 1, 1, 1, 46);
INSERT INTO `project_check_task` VALUES (50, 131, 69, 132, NULL, 1, 1, 1, 1, 1, 46);
INSERT INTO `project_check_task` VALUES (49, 132, 69, 131, 1, NULL, 1, 1, 1, 1, 44);
INSERT INTO `project_check_task` VALUES (48, 132, 69, 130, NULL, 1, 1, 1, 1, 1, 44);
INSERT INTO `project_check_task` VALUES (47, 132, 69, 132, NULL, 1, 1, 1, 1, 1, 44);
INSERT INTO `project_check_task` VALUES (46, 130, 69, 131, 1, NULL, 1, 1, 1, 1, 45);
INSERT INTO `project_check_task` VALUES (45, 130, 69, 130, NULL, 1, 1, 1, 1, 1, 45);
INSERT INTO `project_check_task` VALUES (44, 130, 69, 132, NULL, 1, 1, 1, 1, 1, 45);

-- ----------------------------
-- Table structure for project_expert_project
-- ----------------------------
DROP TABLE IF EXISTS `project_expert_project`;
CREATE TABLE `project_expert_project`  (
  `project_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户项目关联id',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `project_task_status` int(11) NULL DEFAULT NULL COMMENT '任务状态',
  `task_type` int(11) NULL DEFAULT NULL COMMENT '任务类型',
  PRIMARY KEY (`project_user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of project_expert_project
-- ----------------------------
INSERT INTO `project_expert_project` VALUES (110, 75, 1, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (109, 74, 134, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (108, 73, 134, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (107, 72, 130, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (106, 72, 133, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (104, 71, 133, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (103, 70, 130, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (102, 69, 132, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (101, 69, 130, NULL, NULL);
INSERT INTO `project_expert_project` VALUES (100, 69, 131, NULL, NULL);

-- ----------------------------
-- Table structure for project_experts
-- ----------------------------
DROP TABLE IF EXISTS `project_experts`;
CREATE TABLE `project_experts`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `expert_properties` int(11) NULL DEFAULT NULL COMMENT '专家性质',
  `expert_star` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专家星级',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `graduate_school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `graduate_date` date NULL DEFAULT NULL COMMENT '毕业时间',
  `id_number` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `user_status` int(11) NULL DEFAULT NULL COMMENT '用户审核状态',
  `work_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `position_id` int(11) NULL DEFAULT NULL COMMENT '职位id',
  `title_id` int(11) NULL DEFAULT NULL COMMENT '职称id',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业id',
  `expert_class_id_1` int(11) NULL DEFAULT NULL COMMENT '专家类别一id',
  `expert_class_id_2` int(11) NULL DEFAULT NULL COMMENT '专家类别二id',
  `expert_class_id_3` int(11) NULL DEFAULT NULL COMMENT '专家类别三id',
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `postcodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `work_performance` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工程业绩',
  `work_resume` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作简历',
  `main_property` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主要著作',
  `create_time` date NULL DEFAULT NULL COMMENT '用户申请时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家的属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_experts
-- ----------------------------
INSERT INTO `project_experts` VALUES (1, 1, '3', '2022-02-01', '1', '120100', '山东省济南市', '6', 'sdjzu', '2022-02-21', '111111111111111x', 1, '1', 1, 1, 1, 3, 2, 3, NULL, NULL, NULL, NULL, NULL, '2022-03-03');
INSERT INTO `project_experts` VALUES (133, NULL, '3', NULL, NULL, NULL, NULL, '6', '山东建筑大学', NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, '2022-07-08');
INSERT INTO `project_experts` VALUES (132, NULL, '3', NULL, NULL, NULL, NULL, '5', NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 2, 3, NULL, NULL, NULL, NULL, NULL, '2022-07-05');
INSERT INTO `project_experts` VALUES (131, NULL, '3', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL, '2022-07-05');
INSERT INTO `project_experts` VALUES (134, NULL, '3', NULL, NULL, NULL, NULL, '6', NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 2, 3, NULL, NULL, NULL, NULL, NULL, '2022-07-10');

-- ----------------------------
-- Table structure for project_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `project_operation_log`;
CREATE TABLE `project_operation_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `oper_user_id` int(11) NULL DEFAULT NULL,
  `oper_subject_id` int(11) NULL DEFAULT NULL,
  `oper_time` datetime NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oper_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_operation_log
-- ----------------------------
INSERT INTO `project_operation_log` VALUES (1, 131, 131, '2022-07-05 03:32:12', '张三添加了项目电力设备维护', '项目模块');
INSERT INTO `project_operation_log` VALUES (2, 1, 1, '2022-07-05 03:32:50', '若依修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (3, 131, 131, '2022-07-05 03:32:59', '张三加入了项目电力设备维护', '项目管理');
INSERT INTO `project_operation_log` VALUES (4, 130, 130, '2022-07-05 03:33:09', '张翔加入了项目电力设备维护', '项目管理');
INSERT INTO `project_operation_log` VALUES (5, 130, 130, '2022-07-05 03:33:30', '张翔加入了项目电力设备维护', '项目管理');
INSERT INTO `project_operation_log` VALUES (6, 130, 130, '2022-07-05 03:34:38', '张翔加入了项目电力设备维护', '项目管理');
INSERT INTO `project_operation_log` VALUES (7, 132, 132, '2022-07-05 03:34:46', '李四加入了项目电力设备维护', '项目管理');
INSERT INTO `project_operation_log` VALUES (8, 131, 131, '2022-07-05 03:37:35', '张三修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (9, 131, 131, '2022-07-06 18:54:44', '张三发布了任务完成自评互评', '项目管理');
INSERT INTO `project_operation_log` VALUES (10, 130, 130, '2022-07-06 18:56:07', '张翔提交了自评互评分数', '待办事项');
INSERT INTO `project_operation_log` VALUES (11, 132, 132, '2022-07-06 18:58:23', '李四提交了自评互评分数', '待办事项');
INSERT INTO `project_operation_log` VALUES (12, 131, 131, '2022-07-06 18:59:30', '张三提交了自评互评分数', '待办事项');
INSERT INTO `project_operation_log` VALUES (13, 131, 131, '2022-07-06 18:59:52', '张三修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (14, 130, 130, '2022-07-08 20:07:46', '张翔添加了项目1', '项目模块');
INSERT INTO `project_operation_log` VALUES (15, 1, 1, '2022-07-08 20:08:39', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (16, 130, 130, '2022-07-08 20:08:56', '张翔修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (17, 1, 1, '2022-07-08 20:09:07', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (18, 133, 133, '2022-07-08 20:20:48', '郝务一添加了项目项目团队建设', '项目模块');
INSERT INTO `project_operation_log` VALUES (19, 1, 1, '2022-07-08 20:21:08', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (20, 130, 130, '2022-07-08 20:21:48', '张翔加入了项目项目团队建设', '项目管理');
INSERT INTO `project_operation_log` VALUES (21, 133, 130, '2022-07-08 20:23:05', '郝务一删除了成员130', '项目管理');
INSERT INTO `project_operation_log` VALUES (22, 133, 133, '2022-07-08 20:23:31', '郝务一修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (23, 133, 133, '2022-07-08 20:24:41', '郝务一发布了任务1', '项目管理');
INSERT INTO `project_operation_log` VALUES (24, 133, 133, '2022-07-08 20:27:00', '郝务一提交了自评互评分数', '待办事项');
INSERT INTO `project_operation_log` VALUES (25, 133, 133, '2022-07-08 20:27:40', '郝务一修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (26, 133, 133, '2022-07-08 20:28:08', '郝务一添加了项目任务书任务项目展示', '项目模块');
INSERT INTO `project_operation_log` VALUES (27, 1, 1, '2022-07-08 20:28:19', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (28, 130, 130, '2022-07-08 20:28:37', '张翔加入了项目任务书任务项目展示', '项目管理');
INSERT INTO `project_operation_log` VALUES (29, 133, 133, '2022-07-08 20:29:06', '郝务一修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (30, 133, 133, '2022-07-08 20:29:29', '郝务一发布了任务提交任务书', '项目管理');
INSERT INTO `project_operation_log` VALUES (31, 133, 133, '2022-07-08 20:29:52', '郝务一提交了任务提交任务书任务书', '待办事项');
INSERT INTO `project_operation_log` VALUES (32, 130, 130, '2022-07-08 20:31:26', '张翔提交了任务提交任务书任务书', '待办事项');
INSERT INTO `project_operation_log` VALUES (33, 133, 133, '2022-07-08 20:32:40', '郝务一修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (34, 133, 133, '2022-07-08 20:33:49', '郝务一上传了模板私有模板1', '个人模板');
INSERT INTO `project_operation_log` VALUES (35, 134, 134, '2022-07-10 13:34:29', '张翔添加了项目项目开发', '项目模块');
INSERT INTO `project_operation_log` VALUES (36, 1, 1, '2022-07-10 13:38:21', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (37, 134, 134, '2022-07-10 13:44:27', '张翔修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (38, 134, 134, '2022-07-10 13:50:54', '张翔发布了任务完成任务书', '项目管理');
INSERT INTO `project_operation_log` VALUES (39, 134, 134, '2022-07-10 13:55:10', '张翔添加了项目自评互评任务展示', '项目模块');
INSERT INTO `project_operation_log` VALUES (40, 1, 1, '2022-07-10 13:55:15', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (41, 134, 134, '2022-07-10 13:55:22', '张翔修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (42, 134, 134, '2022-07-10 13:55:33', '张翔发布了任务', '项目管理');
INSERT INTO `project_operation_log` VALUES (43, 134, 134, '2022-07-10 13:58:08', '张翔提交了自评互评分数', '待办事项');
INSERT INTO `project_operation_log` VALUES (44, 134, 134, '2022-07-10 13:58:22', '张翔提交了任务完成任务书任务书', '待办事项');
INSERT INTO `project_operation_log` VALUES (45, 134, 134, '2022-07-10 13:58:51', '张翔修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (46, 1, 1, '2022-07-12 20:16:46', '管理员上传了模板测试模板2', '个人模板');
INSERT INTO `project_operation_log` VALUES (47, 1, 1, '2022-07-12 20:16:54', '管理员删除了模板', '个人模板');
INSERT INTO `project_operation_log` VALUES (48, 1, 1, '2022-07-12 20:17:18', '管理员上传了模板测试模板二', '模板管理');
INSERT INTO `project_operation_log` VALUES (49, 1, 1, '2022-07-12 20:17:21', '管理员删除了模板', '模板管理');
INSERT INTO `project_operation_log` VALUES (50, 1, 1, '2022-07-12 20:18:03', '管理员添加了项目测试项目', '项目模块');
INSERT INTO `project_operation_log` VALUES (51, 1, 1, '2022-07-12 20:18:07', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (52, 1, 1, '2022-07-12 20:18:22', '管理员修改了项目', '项目管理');
INSERT INTO `project_operation_log` VALUES (53, 1, 1, '2022-07-12 20:18:34', '管理员发布了任务测试任务书任务', '项目管理');
INSERT INTO `project_operation_log` VALUES (54, 1, 1, '2022-07-13 16:47:23', '管理员提交了任务测试任务书任务任务书', '待办事项');

-- ----------------------------
-- Table structure for project_position
-- ----------------------------
DROP TABLE IF EXISTS `project_position`;
CREATE TABLE `project_position`  (
  `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家的职位' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_position
-- ----------------------------
INSERT INTO `project_position` VALUES (1, '测试职位');

-- ----------------------------
-- Table structure for project_property
-- ----------------------------
DROP TABLE IF EXISTS `project_property`;
CREATE TABLE `project_property`  (
  `property_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产权id',
  `property_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '著作名称',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `property_type` bigint(20) NULL DEFAULT NULL COMMENT '著作类型',
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社名称',
  `periodical` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期刊名称',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `finish_time` date NULL DEFAULT NULL COMMENT '到期时间',
  `fare_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '到期状态（0未到期1到期）',
  `auth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`property_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_property
-- ----------------------------
INSERT INTO `project_property` VALUES (21, '楼盘建设', '楼盘建设项目', 1, 'xxx出版社', 'xx期刊', '2022-03-09', '2022-03-24', '1', NULL);
INSERT INTO `project_property` VALUES (1, '项目开发', '冀北配网系统', 1, 'xx出版社', 'xx期刊', '2022-07-08', '2022-07-01', '1', NULL);
INSERT INTO `project_property` VALUES (37, 'test', 'test', 1, 'test', 'test', '2023-08-12', '2023-08-02', '1', NULL);
INSERT INTO `project_property` VALUES (38, '1', '1', 1, '1', '1', '2023-08-12', '2023-08-09', '1', NULL);

-- ----------------------------
-- Table structure for project_task
-- ----------------------------
DROP TABLE IF EXISTS `project_task`;
CREATE TABLE `project_task`  (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `task_type` int(11) NULL DEFAULT NULL COMMENT '任务类型(0任务书1评价)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `task_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务信息',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `task_status` int(11) NULL DEFAULT NULL COMMENT '任务状态(0待办1待审核2已完成)',
  `template_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板路径',
  `template_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_task
-- ----------------------------
INSERT INTO `project_task` VALUES (52, '测试任务书任务', 0, '2022-07-12 20:18:34', NULL, '', 75, 1, '/profile/template/2022/03/31/a306d01d-f9a9-42b5-be81-619a5b70257b.docx', NULL, 1);
INSERT INTO `project_task` VALUES (51, '', 1, '2022-07-10 13:55:33', NULL, '', 74, 2, NULL, NULL, 134);
INSERT INTO `project_task` VALUES (50, '完成任务书', 0, '2022-07-10 13:50:54', NULL, '', 73, 1, '/profile/template/2022/03/31/a306d01d-f9a9-42b5-be81-619a5b70257b.docx', NULL, 134);
INSERT INTO `project_task` VALUES (49, '提交任务书', 0, '2022-07-08 20:29:29', NULL, '', 72, 2, '/profile/template/2022/03/31/a306d01d-f9a9-42b5-be81-619a5b70257b.docx', NULL, 133);
INSERT INTO `project_task` VALUES (48, '提交任务书', 0, '2022-07-08 20:29:29', NULL, '', 72, 2, '/profile/template/2022/03/31/a306d01d-f9a9-42b5-be81-619a5b70257b.docx', NULL, 130);
INSERT INTO `project_task` VALUES (46, '完成自评互评', 1, '2022-07-06 18:54:44', NULL, '', 69, 2, NULL, NULL, 131);
INSERT INTO `project_task` VALUES (45, '完成自评互评', 1, '2022-07-06 18:54:44', NULL, '', 69, 2, NULL, NULL, 130);
INSERT INTO `project_task` VALUES (47, '1', 1, '2022-07-08 20:24:41', NULL, '', 71, 2, NULL, NULL, 133);
INSERT INTO `project_task` VALUES (44, '完成自评互评', 1, '2022-07-06 18:54:44', NULL, '', 69, 2, NULL, NULL, 132);

-- ----------------------------
-- Table structure for project_title
-- ----------------------------
DROP TABLE IF EXISTS `project_title`;
CREATE TABLE `project_title`  (
  `title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称id',
  `title_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称名称',
  PRIMARY KEY (`title_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专家的职称表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_title
-- ----------------------------
INSERT INTO `project_title` VALUES (1, '测试职称');

-- ----------------------------
-- Table structure for project_user_apply
-- ----------------------------
DROP TABLE IF EXISTS `project_user_apply`;
CREATE TABLE `project_user_apply`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家姓名(管理用户id)',
  `examine_user_id` int(11) NULL DEFAULT NULL COMMENT '审核员姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `examine_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `examine_status` int(11) NULL DEFAULT NULL COMMENT '审核状态(0未审核，1审核通过，2审核失败)',
  `examine_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_user_apply
-- ----------------------------
INSERT INTO `project_user_apply` VALUES (57, '张翔', 1, '2022-07-10 13:26:50', '2022-07-10 13:26:50', 1, '张翔已通过审核');
INSERT INTO `project_user_apply` VALUES (56, '郝务一', 1, '2022-07-08 20:19:09', '2022-07-08 20:19:09', 1, '郝务一已通过审核');
INSERT INTO `project_user_apply` VALUES (55, '郝务一', 1, '2022-07-08 20:18:19', '2022-07-08 20:18:19', 2, '信息不全');
INSERT INTO `project_user_apply` VALUES (54, '李四', 1, '2022-07-05 03:20:49', '2022-07-05 03:20:49', 1, '李四已通过审核');
INSERT INTO `project_user_apply` VALUES (53, 'zhangsan', 1, '2022-07-05 03:13:25', '2022-07-05 03:13:25', 1, 'zhangsan已通过审核');
INSERT INTO `project_user_apply` VALUES (52, '张翔', 1, '2022-07-05 02:52:36', '2022-07-05 02:52:36', 1, '张翔已通过审核');

-- ----------------------------
-- Table structure for project_user_property
-- ----------------------------
DROP TABLE IF EXISTS `project_user_property`;
CREATE TABLE `project_user_property`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '知识产权所属用户id',
  `property_id` int(11) NOT NULL COMMENT '知识产权id',
  `user_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识产权所属用户姓名',
  PRIMARY KEY (`user_id`, `property_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_user_property
-- ----------------------------
INSERT INTO `project_user_property` VALUES (1, 2, '小区建设著作1');
INSERT INTO `project_user_property` VALUES (2, 2, '小区建设著作2');
INSERT INTO `project_user_property` VALUES (3, 2, '小区建设著作3');
INSERT INTO `project_user_property` VALUES (4, 14, '1');
INSERT INTO `project_user_property` VALUES (5, 14, '111');
INSERT INTO `project_user_property` VALUES (6, 14, '11');
INSERT INTO `project_user_property` VALUES (13, 24, NULL);
INSERT INTO `project_user_property` VALUES (14, 25, NULL);
INSERT INTO `project_user_property` VALUES (15, 26, NULL);
INSERT INTO `project_user_property` VALUES (16, 27, NULL);
INSERT INTO `project_user_property` VALUES (17, 28, NULL);
INSERT INTO `project_user_property` VALUES (18, 29, '1');
INSERT INTO `project_user_property` VALUES (19, 30, '张三');
INSERT INTO `project_user_property` VALUES (20, 31, '10');
INSERT INTO `project_user_property` VALUES (21, 31, '11');
INSERT INTO `project_user_property` VALUES (22, 32, '10');
INSERT INTO `project_user_property` VALUES (23, 32, '11');
INSERT INTO `project_user_property` VALUES (24, 31, '12');
INSERT INTO `project_user_property` VALUES (25, 33, '12');
INSERT INTO `project_user_property` VALUES (26, 33, '13');
INSERT INTO `project_user_property` VALUES (27, 33, '14');
INSERT INTO `project_user_property` VALUES (28, 33, '15');
INSERT INTO `project_user_property` VALUES (31, 1, '12345');
INSERT INTO `project_user_property` VALUES (32, 31, '13');
INSERT INTO `project_user_property` VALUES (34, 29, '3');
INSERT INTO `project_user_property` VALUES (35, 30, '李四');
INSERT INTO `project_user_property` VALUES (36, 31, '14');
INSERT INTO `project_user_property` VALUES (37, 1, '李四');
INSERT INTO `project_user_property` VALUES (38, 23, '张三');
INSERT INTO `project_user_property` VALUES (39, 21, '若依');
INSERT INTO `project_user_property` VALUES (40, 21, '李四');
INSERT INTO `project_user_property` VALUES (41, 34, '测试专家2');
INSERT INTO `project_user_property` VALUES (42, 21, '专家5');
INSERT INTO `project_user_property` VALUES (43, 34, '若依');
INSERT INTO `project_user_property` VALUES (44, 35, '郝务一');
INSERT INTO `project_user_property` VALUES (45, 35, '张翔');
INSERT INTO `project_user_property` VALUES (46, 35, '陈金川');
INSERT INTO `project_user_property` VALUES (47, 35, '孟维昊');
INSERT INTO `project_user_property` VALUES (48, 35, '孙晓庆');
INSERT INTO `project_user_property` VALUES (49, 36, '张三');
INSERT INTO `project_user_property` VALUES (50, 36, '李四');
INSERT INTO `project_user_property` VALUES (51, 37, 'test');
INSERT INTO `project_user_property` VALUES (52, 38, '1');

-- ----------------------------
-- Table structure for property_attach_file
-- ----------------------------
DROP TABLE IF EXISTS `property_attach_file`;
CREATE TABLE `property_attach_file`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `property_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of property_attach_file
-- ----------------------------
INSERT INTO `property_attach_file` VALUES (1, '论文.docx', '/profile/template/2022/07/10/395fb775-0bb7-436d-99ea-392895588b07.docx', 1);
INSERT INTO `property_attach_file` VALUES (2, 'Spring Boot参考指南(最新版).pdf', '/profile/template/2023/08/12/5c95c8ff-e4ac-460c-beb2-736edd7dbbab.pdf', 37);
INSERT INTO `property_attach_file` VALUES (3, 'Spring Boot参考指南(最新版).pdf', '/profile/template/2023/08/12/df5fc4e1-56a3-4132-a75d-fdc014371577.pdf', 38);

-- ----------------------------
-- Table structure for property_type
-- ----------------------------
DROP TABLE IF EXISTS `property_type`;
CREATE TABLE `property_type`  (
  `property_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识产权类型id',
  `property_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识产权名称',
  PRIMARY KEY (`property_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of property_type
-- ----------------------------
INSERT INTO `property_type` VALUES (1, '论文');
INSERT INTO `property_type` VALUES (2, '专利');
INSERT INTO `property_type` VALUES (3, '著作');
INSERT INTO `property_type` VALUES (4, '期刊');

-- ----------------------------
-- Table structure for property_user_apply
-- ----------------------------
DROP TABLE IF EXISTS `property_user_apply`;
CREATE TABLE `property_user_apply`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `property_id` int(11) NULL DEFAULT NULL COMMENT '知识产权id',
  `examine_user_id` int(11) NULL DEFAULT NULL COMMENT '审核人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `examine_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `examine_status` int(11) NULL DEFAULT NULL COMMENT '审核状态',
  `examine_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of property_user_apply
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F0ABBB88878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F0ABBB88878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F0ABBB88878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-K2KHJNN1692785171061', 1692785387102, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1692785180000, -1, 5, 'PAUSED', 'CRON', 1692785171000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1692785175000, -1, 5, 'PAUSED', 'CRON', 1692785171000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1692785180000, -1, 5, 'PAUSED', 'CRON', 1692785171000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for scada_organ
-- ----------------------------
DROP TABLE IF EXISTS `scada_organ`;
CREATE TABLE `scada_organ`  (
  `ORGAN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCADA_REGION_ID` int(11) NOT NULL,
  `REGION_TYPE` int(11) NULL DEFAULT NULL,
  `ORGAN_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ORGAN_ID`, `SCADA_REGION_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scada_organ
-- ----------------------------
INSERT INTO `scada_organ` VALUES (1000, 1, 3, NULL);
INSERT INTO `scada_organ` VALUES (1001, 2, 4, NULL);
INSERT INTO `scada_organ` VALUES (1002, 3, 4, NULL);
INSERT INTO `scada_organ` VALUES (1003, 4, 4, NULL);

-- ----------------------------
-- Table structure for subnet_ems
-- ----------------------------
DROP TABLE IF EXISTS `subnet_ems`;
CREATE TABLE `subnet_ems`  (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NULL DEFAULT NULL,
  `ancestors` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `MingZi` varchar(128) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '_',
  `DianWangID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `NO` varchar(16) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '_',
  `MEAOKRATE` double NOT NULL DEFAULT 0,
  `TotalPowerCapacity` double NOT NULL DEFAULT 0,
  `BootStrapCapacity` double NOT NULL DEFAULT 0,
  `RepairCapacity` double NOT NULL DEFAULT 0,
  `ExchangePlanPower` double NOT NULL DEFAULT 0,
  `Psum` double NOT NULL DEFAULT 0,
  `Qsum` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `DianWangID`(`DianWangID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1033 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subnet_ems
-- ----------------------------
INSERT INTO `subnet_ems` VALUES (1, 0, '0', '建大三级项目', 1, '1', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `subnet_ems` VALUES (2, 1, '0,1', '土木学院项目', 1, '1', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `subnet_ems` VALUES (3, 1, '0,1', '热能学院项目', 1, '1', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `subnet_ems` VALUES (4, 1, '0,1', '计算机学院项目', 1, '1', 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-02-18 10:49:09', 'admin', '2022-07-07 16:12:36', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-02-18 10:49:09', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-02-18 10:49:09', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'Y', 'admin', '2022-02-18 10:49:09', 'admin', '2022-05-04 18:28:35', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-02-18 10:49:09', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-18 10:49:08', '', NULL);
INSERT INTO `sys_dept` VALUES (1000, 0, '0', '山东建筑大学', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-18 10:49:08', 'admin', '2022-02-20 18:04:05');
INSERT INTO `sys_dept` VALUES (1001, 1000, '0,1000', '土木学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-18 10:49:08', '', NULL);
INSERT INTO `sys_dept` VALUES (1002, 1000, '0,1000', '热能学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-18 10:49:08', '', NULL);
INSERT INTO `sys_dept` VALUES (1003, 1000, '0,1000', '计算机学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-18 10:49:08', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '未审核', '0', 'jb_expert_apply', NULL, 'default', 'N', '0', 'admin', '2022-02-20 21:54:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '审核通过', '1', 'jb_expert_apply', NULL, 'default', 'N', '0', 'admin', '2022-02-20 21:54:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '审核失败', '2', 'jb_expert_apply', NULL, 'default', 'N', '0', 'admin', '2022-02-20 21:54:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '未使用', '0', 'jb_expert_code', NULL, 'primary', 'N', '0', 'admin', '2022-02-20 21:55:13', 'admin', '2022-02-20 22:10:08', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '已使用', '1', 'jb_expert_code', NULL, 'success', 'N', '0', 'admin', '2022-02-20 21:55:23', 'admin', '2022-02-20 22:09:44', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, '已过期', '2', 'jb_expert_code', NULL, 'info', 'N', '0', 'admin', '2022-02-20 21:55:30', 'admin', '2022-02-23 14:48:57', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 3, '★★★', '3', 'expert_star', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:23:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 2, '★★', '2', 'expert_star', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:23:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '★', '1', 'expert_star', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:23:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 1, '正式', '1', 'expert_property', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:24:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '非正式', '0', 'expert_property', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:24:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 1, '华北地区', '1', 'area', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:37:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 2, '东北地区', '2', 'area', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:37:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 3, '华东地区', '3', 'area', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:37:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 4, '中南地区', '4', 'area', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:37:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 5, '西南地区', '5', 'area', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:38:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 6, '西北地区', '6', 'area', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:38:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 1, '小学', '1', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:46:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 2, '初中', '2', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:46:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 3, '高中', '3', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:47:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 4, '中专', '4', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:47:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 5, '大专', '5', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:47:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 6, '本科', '6', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:47:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 7, '硕士', '7', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:47:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 8, '博士', '8', 'education', NULL, 'default', 'N', '0', 'admin', '2022-02-22 14:48:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, '待审核', '0', 'user_status', NULL, 'default', 'N', '0', 'admin', '2022-02-22 15:29:17', 'admin', '2022-02-22 15:32:01', NULL);
INSERT INTO `sys_dict_data` VALUES (128, 1, '通过', '1', 'user_status', NULL, 'default', 'N', '0', 'admin', '2022-02-22 15:29:24', 'admin', '2022-02-22 15:32:09', NULL);
INSERT INTO `sys_dict_data` VALUES (129, 2, '驳回', '2', 'user_status', NULL, 'default', 'N', '0', 'admin', '2022-02-22 15:29:31', 'admin', '2022-02-22 15:32:14', NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '未到期', '0', 'fare_status', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:14:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 1, '已到期', '1', 'fare_status', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:14:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, '待审核', '0', 'property_apply_status', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:14:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 1, '审核通过', '1', 'property_apply_status', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:15:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 2, '驳回', '2', 'property_apply_status', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:15:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 3, '成果注销', '3', 'property_apply_status', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:15:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 0, '论文', '0', 'property_type', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:18:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 1, '专利', '1', 'property_type', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:18:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 2, '著作', '2', 'property_type', NULL, 'default', 'N', '0', 'admin', '2022-03-03 17:18:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 0, '待审核', '0', 'project_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:30:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 1, '审核未通过', '1', 'project_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:30:51', 'admin', '2022-04-08 04:19:26', NULL);
INSERT INTO `sys_dict_data` VALUES (142, 2, '团队组建中', '2', 'project_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:31:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 3, '团队组建完成', '3', 'project_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:31:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 5, '项目结束', '5', 'project_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:31:29', 'admin', '2022-03-17 11:45:34', NULL);
INSERT INTO `sys_dict_data` VALUES (145, 0, '无抽取', '0', 'extraction_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:31:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 1, '抽取中', '1', 'extraction_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:32:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 2, '已抽取', '2', 'extraction_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:32:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 0, '制定任务书', '0', 'task_type', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:32:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 1, '自评互评', '1', 'task_type', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:32:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 0, '任务待办', '0', 'task_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:37:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 1, '任务待审核', '1', 'task_status', NULL, 'default', 'N', '0', 'admin', '2022-03-14 11:38:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 4, '项目执行中', '4', 'project_status', NULL, 'default', 'N', '0', 'admin', '2022-03-17 11:45:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 2, '任务已完成', '2', 'task_status', NULL, 'default', 'N', '0', 'admin', '2022-05-09 10:45:55', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-02-18 10:49:09', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '申请状态', 'jb_expert_apply', '0', 'admin', '2022-02-20 21:52:41', '', NULL, '申请记录列表');
INSERT INTO `sys_dict_type` VALUES (101, '通行码状态', 'jb_expert_code', '0', 'admin', '2022-02-20 21:52:56', 'admin', '2022-02-21 15:03:01', '通行码管理列表');
INSERT INTO `sys_dict_type` VALUES (102, '专家星级', 'expert_star', '0', 'admin', '2022-02-22 14:21:43', 'admin', '2022-02-22 16:27:01', '专家的星级列表');
INSERT INTO `sys_dict_type` VALUES (103, '专家性质', 'expert_property', '0', 'admin', '2022-02-22 14:24:08', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '地区', 'area', '0', 'admin', '2022-02-22 14:25:04', 'admin', '2022-02-22 14:35:49', '专家所属的地区');
INSERT INTO `sys_dict_type` VALUES (105, '学历', 'education', '0', 'admin', '2022-02-22 14:46:26', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '用户状态', 'user_status', '0', 'admin', '2022-02-22 15:28:33', '', NULL, '专家的状态');
INSERT INTO `sys_dict_type` VALUES (107, '知识产权审核状态', 'property_apply_status', '0', 'admin', '2022-03-03 01:59:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '知识产权到期状态', 'fare_status', '0', 'admin', '2022-03-03 17:09:00', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (109, '知识产权类型', 'property_type', '0', 'admin', '2022-03-03 17:17:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '项目状态', 'project_status', '0', 'admin', '2022-03-14 11:22:28', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '抽取状态', 'extraction_status', '0', 'admin', '2022-03-14 11:22:54', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (112, '任务类型', 'task_type', '0', 'admin', '2022-03-14 11:29:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (113, '任务状态', 'task_status', '0', 'admin', '2022-03-14 11:29:50', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-02-18 10:49:09', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-02-18 10:49:09', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-02-18 10:49:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-18 10:58:48');
INSERT INTO `sys_logininfor` VALUES (101, 'adminsdjzu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-18 12:05:59');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-18 13:13:42');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-18 14:24:32');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 17:31:16');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-20 17:49:58');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 17:50:00');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 17:58:23');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 21:04:02');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-21 09:12:47');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 09:12:51');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 13:58:06');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 17:30:22');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-21 18:07:13');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 18:07:27');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 19:57:52');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 20:46:02');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 21:30:45');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-22 10:19:29');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 10:19:32');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 11:49:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 12:35:25');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 13:47:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 14:51:54');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 18:25:09');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 19:01:45');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2022-02-22 19:07:18');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 21:16:01');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-22 21:26:33');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 08:25:30');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 08:25:52');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 08:34:13');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 08:34:35');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-23 08:46:40');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 08:46:44');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 08:46:49');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 09:28:34');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 09:29:15');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 09:55:02');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 10:02:56');
INSERT INTO `sys_logininfor` VALUES (140, '123456', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 10:33:56');
INSERT INTO `sys_logininfor` VALUES (141, '123456', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 10:34:07');
INSERT INTO `sys_logininfor` VALUES (142, '123456', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 10:34:14');
INSERT INTO `sys_logininfor` VALUES (143, '123456', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 10:34:22');
INSERT INTO `sys_logininfor` VALUES (144, '123456', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 10:35:03');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 10:35:05');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 10:42:39');
INSERT INTO `sys_logininfor` VALUES (147, '123', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 12:59:34');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 12:59:41');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 14:14:55');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 14:15:06');
INSERT INTO `sys_logininfor` VALUES (151, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 14:15:38');
INSERT INTO `sys_logininfor` VALUES (152, 'oppo', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 14:29:19');
INSERT INTO `sys_logininfor` VALUES (153, 'users', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 14:30:44');
INSERT INTO `sys_logininfor` VALUES (154, 'iphone', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 14:32:04');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 14:44:46');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 14:45:35');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 14:48:15');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 14:49:42');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-02-23 14:52:29');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 14:52:32');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 16:22:25');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 16:22:45');
INSERT INTO `sys_logininfor` VALUES (163, '1888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 16:23:21');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 16:23:28');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 20:02:32');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 20:28:21');
INSERT INTO `sys_logininfor` VALUES (167, 'cs4888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 20:28:42');
INSERT INTO `sys_logininfor` VALUES (168, 'cs4888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 20:32:42');
INSERT INTO `sys_logininfor` VALUES (169, 'cs4888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 20:32:54');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-23 20:33:10');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 20:33:12');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 20:33:38');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 20:33:55');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 20:34:47');
INSERT INTO `sys_logininfor` VALUES (175, 'uoop', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 20:35:05');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 20:35:25');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 22:02:29');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 22:03:37');
INSERT INTO `sys_logininfor` VALUES (179, 'cs10888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-23 22:04:11');
INSERT INTO `sys_logininfor` VALUES (180, 'cs10888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 22:05:37');
INSERT INTO `sys_logininfor` VALUES (181, 'cs10888', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-23 22:07:19');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 22:07:24');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-24 16:17:12');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 16:17:29');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-24 16:18:12');
INSERT INTO `sys_logininfor` VALUES (186, 'oppo123', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-02-24 16:54:15');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 16:55:27');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-24 17:18:15');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 17:18:54');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-25 20:28:16');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-25 21:41:37');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-25 21:41:41');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-28 17:25:26');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 17:25:29');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 08:26:48');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 12:22:21');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-01 13:26:31');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 13:26:35');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 14:58:19');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 08:51:40');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:14:16');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 10:16:34');
INSERT INTO `sys_logininfor` VALUES (203, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '注册成功', '2022-03-02 10:17:49');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:17:56');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 10:18:23');
INSERT INTO `sys_logininfor` VALUES (206, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:18:30');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:27:27');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-02 10:27:38');
INSERT INTO `sys_logininfor` VALUES (209, 'csw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:27:45');
INSERT INTO `sys_logininfor` VALUES (210, 'csw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-02 10:29:34');
INSERT INTO `sys_logininfor` VALUES (211, 'csw', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:30:25');
INSERT INTO `sys_logininfor` VALUES (212, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:32:28');
INSERT INTO `sys_logininfor` VALUES (213, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:36:34');
INSERT INTO `sys_logininfor` VALUES (214, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 10:46:21');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:46:25');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 10:48:02');
INSERT INTO `sys_logininfor` VALUES (217, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 10:48:09');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 12:12:00');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 12:15:41');
INSERT INTO `sys_logininfor` VALUES (220, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 12:15:49');
INSERT INTO `sys_logininfor` VALUES (221, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 12:34:59');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 12:35:06');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 12:40:40');
INSERT INTO `sys_logininfor` VALUES (224, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 12:40:51');
INSERT INTO `sys_logininfor` VALUES (225, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 13:35:08');
INSERT INTO `sys_logininfor` VALUES (226, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 14:44:03');
INSERT INTO `sys_logininfor` VALUES (227, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 14:52:48');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 14:52:52');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 15:52:47');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 15:53:01');
INSERT INTO `sys_logininfor` VALUES (231, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 15:53:10');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 19:10:02');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 19:40:28');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 20:31:55');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 20:32:12');
INSERT INTO `sys_logininfor` VALUES (236, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 20:32:19');
INSERT INTO `sys_logininfor` VALUES (237, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 20:32:44');
INSERT INTO `sys_logininfor` VALUES (238, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 20:33:20');
INSERT INTO `sys_logininfor` VALUES (239, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 20:33:39');
INSERT INTO `sys_logininfor` VALUES (240, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 20:33:44');
INSERT INTO `sys_logininfor` VALUES (241, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 20:34:22');
INSERT INTO `sys_logininfor` VALUES (242, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 20:34:26');
INSERT INTO `sys_logininfor` VALUES (243, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 20:51:20');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码已失效', '2022-03-02 22:07:46');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:07:49');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:22:05');
INSERT INTO `sys_logininfor` VALUES (247, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:22:11');
INSERT INTO `sys_logininfor` VALUES (248, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:22:49');
INSERT INTO `sys_logininfor` VALUES (249, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:22:54');
INSERT INTO `sys_logininfor` VALUES (250, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:43:36');
INSERT INTO `sys_logininfor` VALUES (251, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:43:41');
INSERT INTO `sys_logininfor` VALUES (252, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:53:33');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:53:35');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:57:33');
INSERT INTO `sys_logininfor` VALUES (255, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:57:40');
INSERT INTO `sys_logininfor` VALUES (256, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:57:46');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:57:52');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:58:11');
INSERT INTO `sys_logininfor` VALUES (259, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:58:17');
INSERT INTO `sys_logininfor` VALUES (260, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 22:58:23');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 22:58:27');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 23:00:39');
INSERT INTO `sys_logininfor` VALUES (263, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:00:44');
INSERT INTO `sys_logininfor` VALUES (264, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 23:12:52');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:12:57');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 23:13:01');
INSERT INTO `sys_logininfor` VALUES (267, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:13:08');
INSERT INTO `sys_logininfor` VALUES (268, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 23:14:26');
INSERT INTO `sys_logininfor` VALUES (269, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:14:33');
INSERT INTO `sys_logininfor` VALUES (270, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:47:26');
INSERT INTO `sys_logininfor` VALUES (271, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 23:47:33');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:47:36');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-02 23:48:07');
INSERT INTO `sys_logininfor` VALUES (274, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码错误', '2022-03-02 23:48:13');
INSERT INTO `sys_logininfor` VALUES (275, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-02 23:48:15');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 00:39:32');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 01:32:24');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:05:28');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:31:41');
INSERT INTO `sys_logininfor` VALUES (280, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:31:48');
INSERT INTO `sys_logininfor` VALUES (281, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:38:05');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:38:09');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:38:35');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:38:51');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:38:56');
INSERT INTO `sys_logininfor` VALUES (286, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:39:03');
INSERT INTO `sys_logininfor` VALUES (287, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:39:23');
INSERT INTO `sys_logininfor` VALUES (288, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:39:29');
INSERT INTO `sys_logininfor` VALUES (289, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:43:19');
INSERT INTO `sys_logininfor` VALUES (290, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:43:25');
INSERT INTO `sys_logininfor` VALUES (291, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:43:32');
INSERT INTO `sys_logininfor` VALUES (292, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:43:39');
INSERT INTO `sys_logininfor` VALUES (293, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:43:47');
INSERT INTO `sys_logininfor` VALUES (294, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:43:54');
INSERT INTO `sys_logininfor` VALUES (295, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 17:44:49');
INSERT INTO `sys_logininfor` VALUES (296, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 17:45:02');
INSERT INTO `sys_logininfor` VALUES (297, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 18:11:11');
INSERT INTO `sys_logininfor` VALUES (298, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 18:11:17');
INSERT INTO `sys_logininfor` VALUES (299, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 18:11:43');
INSERT INTO `sys_logininfor` VALUES (300, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-03 18:11:58');
INSERT INTO `sys_logininfor` VALUES (301, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 18:12:02');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '192.168.1.110', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 19:05:39');
INSERT INTO `sys_logininfor` VALUES (303, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 19:49:47');
INSERT INTO `sys_logininfor` VALUES (304, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 19:49:56');
INSERT INTO `sys_logininfor` VALUES (305, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 19:53:34');
INSERT INTO `sys_logininfor` VALUES (306, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 19:58:39');
INSERT INTO `sys_logininfor` VALUES (307, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:01:10');
INSERT INTO `sys_logininfor` VALUES (308, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:01:16');
INSERT INTO `sys_logininfor` VALUES (309, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:03:33');
INSERT INTO `sys_logininfor` VALUES (310, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:03:39');
INSERT INTO `sys_logininfor` VALUES (311, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:05:17');
INSERT INTO `sys_logininfor` VALUES (312, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:05:31');
INSERT INTO `sys_logininfor` VALUES (313, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:07:32');
INSERT INTO `sys_logininfor` VALUES (314, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:07:42');
INSERT INTO `sys_logininfor` VALUES (315, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:12:12');
INSERT INTO `sys_logininfor` VALUES (316, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:12:20');
INSERT INTO `sys_logininfor` VALUES (317, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:16:52');
INSERT INTO `sys_logininfor` VALUES (318, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:16:58');
INSERT INTO `sys_logininfor` VALUES (319, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:17:23');
INSERT INTO `sys_logininfor` VALUES (320, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:17:29');
INSERT INTO `sys_logininfor` VALUES (321, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:20:53');
INSERT INTO `sys_logininfor` VALUES (322, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:20:59');
INSERT INTO `sys_logininfor` VALUES (323, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:27:51');
INSERT INTO `sys_logininfor` VALUES (324, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:27:58');
INSERT INTO `sys_logininfor` VALUES (325, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:28:35');
INSERT INTO `sys_logininfor` VALUES (326, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:28:41');
INSERT INTO `sys_logininfor` VALUES (327, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:29:41');
INSERT INTO `sys_logininfor` VALUES (328, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:29:48');
INSERT INTO `sys_logininfor` VALUES (329, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:30:12');
INSERT INTO `sys_logininfor` VALUES (330, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:30:18');
INSERT INTO `sys_logininfor` VALUES (331, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:35:05');
INSERT INTO `sys_logininfor` VALUES (332, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:35:10');
INSERT INTO `sys_logininfor` VALUES (333, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:40:33');
INSERT INTO `sys_logininfor` VALUES (334, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:40:41');
INSERT INTO `sys_logininfor` VALUES (335, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:49:30');
INSERT INTO `sys_logininfor` VALUES (336, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:49:38');
INSERT INTO `sys_logininfor` VALUES (337, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:50:18');
INSERT INTO `sys_logininfor` VALUES (338, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:50:24');
INSERT INTO `sys_logininfor` VALUES (339, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:52:19');
INSERT INTO `sys_logininfor` VALUES (340, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:52:29');
INSERT INTO `sys_logininfor` VALUES (341, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:52:55');
INSERT INTO `sys_logininfor` VALUES (342, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:53:01');
INSERT INTO `sys_logininfor` VALUES (343, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:54:24');
INSERT INTO `sys_logininfor` VALUES (344, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:54:30');
INSERT INTO `sys_logininfor` VALUES (345, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 20:59:29');
INSERT INTO `sys_logininfor` VALUES (346, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 20:59:35');
INSERT INTO `sys_logininfor` VALUES (347, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:02:33');
INSERT INTO `sys_logininfor` VALUES (348, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:02:39');
INSERT INTO `sys_logininfor` VALUES (349, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:04:10');
INSERT INTO `sys_logininfor` VALUES (350, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:04:18');
INSERT INTO `sys_logininfor` VALUES (351, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:05:34');
INSERT INTO `sys_logininfor` VALUES (352, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:05:40');
INSERT INTO `sys_logininfor` VALUES (353, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:07:59');
INSERT INTO `sys_logininfor` VALUES (354, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:08:06');
INSERT INTO `sys_logininfor` VALUES (355, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:10:29');
INSERT INTO `sys_logininfor` VALUES (356, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:10:36');
INSERT INTO `sys_logininfor` VALUES (357, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:13:24');
INSERT INTO `sys_logininfor` VALUES (358, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:13:31');
INSERT INTO `sys_logininfor` VALUES (359, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:14:16');
INSERT INTO `sys_logininfor` VALUES (360, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:14:24');
INSERT INTO `sys_logininfor` VALUES (361, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-03 21:21:36');
INSERT INTO `sys_logininfor` VALUES (362, 'csw', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-03 21:21:41');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-04 08:49:55');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 08:49:57');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 10:59:06');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-04 16:00:20');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:00:23');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:01:24');
INSERT INTO `sys_logininfor` VALUES (369, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-04 16:02:46');
INSERT INTO `sys_logininfor` VALUES (370, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:03:13');
INSERT INTO `sys_logininfor` VALUES (371, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:04:47');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:04:50');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:12:40');
INSERT INTO `sys_logininfor` VALUES (374, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:12:47');
INSERT INTO `sys_logininfor` VALUES (375, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:17:39');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:17:42');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:18:45');
INSERT INTO `sys_logininfor` VALUES (378, 'cj01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：cj01 不存在', '2022-03-04 16:18:53');
INSERT INTO `sys_logininfor` VALUES (379, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:18:59');
INSERT INTO `sys_logininfor` VALUES (380, 'cs01', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:19:29');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:19:32');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 16:21:29');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 16:21:53');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 21:47:15');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-05 09:32:12');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-05 09:33:46');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码已失效', '2022-03-05 09:48:13');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-05 09:48:16');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码错误', '2022-03-05 10:48:46');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-05 10:52:43');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码错误', '2022-03-05 19:45:16');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-05 19:45:20');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-06 17:43:30');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-06 20:50:36');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-06 21:33:10');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-06 22:17:20');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-07 09:50:36');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-08 19:07:40');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-08 21:15:45');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-08 23:57:32');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 00:07:22');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-09 07:43:45');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 09:04:53');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-03-09 09:11:25');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-09 09:41:45');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 09:41:49');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 10:30:02');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-03-09 17:21:11');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 18:14:50');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 19:57:25');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 20:36:22');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:25:22');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 22:54:55');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-12 06:51:48');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-12 07:24:17');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-12 14:20:35');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-12 15:51:39');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-12 17:11:00');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-12 18:46:50');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 18:04:23');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:11:30');
INSERT INTO `sys_logininfor` VALUES (422, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-13 19:12:09');
INSERT INTO `sys_logininfor` VALUES (423, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-13 19:12:19');
INSERT INTO `sys_logininfor` VALUES (424, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:12:21');
INSERT INTO `sys_logininfor` VALUES (425, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:13:20');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:13:26');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:13:58');
INSERT INTO `sys_logininfor` VALUES (428, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:14:07');
INSERT INTO `sys_logininfor` VALUES (429, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:14:18');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-13 19:14:23');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-13 19:14:25');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:14:28');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:14:45');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:14:49');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:14:59');
INSERT INTO `sys_logininfor` VALUES (436, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:15:06');
INSERT INTO `sys_logininfor` VALUES (437, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:15:18');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:15:23');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-13 19:15:53');
INSERT INTO `sys_logininfor` VALUES (440, '1234567', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 19:16:04');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-13 20:36:07');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-14 11:10:16');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 11:10:19');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 13:13:54');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-14 15:45:54');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 15:45:57');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 17:59:23');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 19:29:09');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 19:54:47');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 07:49:12');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 11:29:06');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-15 11:59:01');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 11:59:06');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 20:17:32');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 08:15:10');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 08:56:58');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 09:20:00');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 09:20:03');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 10:19:48');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 12:48:45');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 12:59:26');
INSERT INTO `sys_logininfor` VALUES (462, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-16 13:00:08');
INSERT INTO `sys_logininfor` VALUES (463, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 13:00:20');
INSERT INTO `sys_logininfor` VALUES (464, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 13:01:11');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-16 13:01:17');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 13:01:20');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 13:01:58');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码错误', '2022-03-16 13:02:09');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-16 13:02:12');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 13:02:15');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 13:02:18');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 13:02:24');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-16 13:02:26');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 13:02:44');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 13:02:55');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 13:02:59');
INSERT INTO `sys_logininfor` VALUES (477, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 13:03:06');
INSERT INTO `sys_logininfor` VALUES (478, 'adminsdjzu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 13:19:58');
INSERT INTO `sys_logininfor` VALUES (479, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 13:20:08');
INSERT INTO `sys_logininfor` VALUES (480, 'adminsdjzu', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 14:46:33');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 14:46:38');
INSERT INTO `sys_logininfor` VALUES (482, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-16 18:54:09');
INSERT INTO `sys_logininfor` VALUES (483, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 18:54:16');
INSERT INTO `sys_logininfor` VALUES (484, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 19:57:32');
INSERT INTO `sys_logininfor` VALUES (485, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 19:57:42');
INSERT INTO `sys_logininfor` VALUES (486, 'tExpert', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 19:58:40');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 19:58:45');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 20:07:28');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 20:07:33');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 10:31:28');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-17 11:12:24');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 11:12:28');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 13:55:00');
INSERT INTO `sys_logininfor` VALUES (494, 'tExpert', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-17 15:12:44');
INSERT INTO `sys_logininfor` VALUES (495, 'tExpert', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-17 16:10:21');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-17 16:55:20');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-17 16:55:25');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 16:55:28');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-17 17:12:19');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-17 17:12:26');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 17:12:32');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-18 09:39:50');
INSERT INTO `sys_logininfor` VALUES (503, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-19 08:36:49');
INSERT INTO `sys_logininfor` VALUES (504, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 06:06:03');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 10:16:14');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-20 11:34:56');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 11:35:01');
INSERT INTO `sys_logininfor` VALUES (508, 'tExpert', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 11:56:34');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 15:59:29');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 16:01:51');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-20 18:22:15');
INSERT INTO `sys_logininfor` VALUES (512, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 18:22:19');
INSERT INTO `sys_logininfor` VALUES (513, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 18:24:45');
INSERT INTO `sys_logininfor` VALUES (514, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-20 18:25:19');
INSERT INTO `sys_logininfor` VALUES (515, 'tExpert', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 18:25:30');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 19:26:06');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-20 19:26:12');
INSERT INTO `sys_logininfor` VALUES (518, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 19:29:15');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '验证码已失效', '2022-03-20 19:31:40');
INSERT INTO `sys_logininfor` VALUES (520, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 19:31:42');
INSERT INTO `sys_logininfor` VALUES (521, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-20 19:31:48');
INSERT INTO `sys_logininfor` VALUES (522, 'tExpert', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-20 19:31:58');
INSERT INTO `sys_logininfor` VALUES (523, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-20 20:14:38');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 16:30:27');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-21 19:02:01');
INSERT INTO `sys_logininfor` VALUES (526, 'tExpert', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-21 19:49:22');
INSERT INTO `sys_logininfor` VALUES (527, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 13:23:58');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 15:18:03');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 15:18:07');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 15:20:33');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 15:20:39');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 15:51:22');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 15:51:26');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 15:56:10');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-22 15:56:28');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 15:56:31');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 17:25:54');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 08:38:57');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 10:22:27');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-24 08:00:52');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 08:00:55');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 09:40:25');
INSERT INTO `sys_logininfor` VALUES (543, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 16:27:38');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 19:22:34');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 20:31:15');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 21:09:30');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 03:16:27');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 04:49:39');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 07:50:26');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 10:31:09');
INSERT INTO `sys_logininfor` VALUES (551, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-26 16:03:20');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 16:03:24');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:03:37');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:35:13');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 10:05:14');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 12:20:36');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 12:34:48');
INSERT INTO `sys_logininfor` VALUES (558, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 15:06:40');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 17:09:40');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 17:47:31');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 22:12:19');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-28 01:36:26');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 01:36:31');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 02:06:41');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 07:52:57');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 07:54:05');
INSERT INTO `sys_logininfor` VALUES (567, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-29 07:54:50');
INSERT INTO `sys_logininfor` VALUES (568, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 07:55:11');
INSERT INTO `sys_logininfor` VALUES (569, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 07:56:56');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-29 07:57:06');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 07:57:10');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-29 07:57:12');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 07:57:19');
INSERT INTO `sys_logininfor` VALUES (574, 'zhuanjia1', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '1', '登录用户：zhuanjia1 不存在', '2022-03-29 07:59:13');
INSERT INTO `sys_logininfor` VALUES (575, 'zhuanjia2', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-29 07:59:19');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-29 08:07:25');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-29 08:07:38');
INSERT INTO `sys_logininfor` VALUES (578, 'zhuanjia2', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-29 08:07:46');
INSERT INTO `sys_logininfor` VALUES (579, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 08:42:59');
INSERT INTO `sys_logininfor` VALUES (580, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 08:44:13');
INSERT INTO `sys_logininfor` VALUES (581, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 08:44:22');
INSERT INTO `sys_logininfor` VALUES (582, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 08:44:42');
INSERT INTO `sys_logininfor` VALUES (583, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-29 08:59:28');
INSERT INTO `sys_logininfor` VALUES (584, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 08:59:35');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-30 21:08:28');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-30 21:14:14');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 21:14:18');
INSERT INTO `sys_logininfor` VALUES (588, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 21:49:11');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 23:37:56');
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:08:25');
INSERT INTO `sys_logininfor` VALUES (591, 'zhuanjia2', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:09:59');
INSERT INTO `sys_logininfor` VALUES (592, 'zhuanjia2', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-31 01:10:53');
INSERT INTO `sys_logininfor` VALUES (593, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '注册成功', '2022-03-31 01:11:22');
INSERT INTO `sys_logininfor` VALUES (594, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:11:37');
INSERT INTO `sys_logininfor` VALUES (595, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-31 01:13:36');
INSERT INTO `sys_logininfor` VALUES (596, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:13:47');
INSERT INTO `sys_logininfor` VALUES (597, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-31 01:16:06');
INSERT INTO `sys_logininfor` VALUES (598, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:16:17');
INSERT INTO `sys_logininfor` VALUES (599, 'zhuanjia3', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-31 01:21:05');
INSERT INTO `sys_logininfor` VALUES (600, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '注册成功', '2022-03-31 01:21:43');
INSERT INTO `sys_logininfor` VALUES (601, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:22:01');
INSERT INTO `sys_logininfor` VALUES (602, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '退出成功', '2022-03-31 01:26:06');
INSERT INTO `sys_logininfor` VALUES (603, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:26:15');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:31:25');
INSERT INTO `sys_logininfor` VALUES (605, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 05:19:34');
INSERT INTO `sys_logininfor` VALUES (606, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 05:19:44');
INSERT INTO `sys_logininfor` VALUES (607, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-31 05:29:54');
INSERT INTO `sys_logininfor` VALUES (608, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 05:30:04');
INSERT INTO `sys_logininfor` VALUES (609, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 07:51:26');
INSERT INTO `sys_logininfor` VALUES (610, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 07:53:25');
INSERT INTO `sys_logininfor` VALUES (611, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-31 09:12:12');
INSERT INTO `sys_logininfor` VALUES (612, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 09:12:14');
INSERT INTO `sys_logininfor` VALUES (613, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 10:29:12');
INSERT INTO `sys_logininfor` VALUES (614, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-31 10:29:25');
INSERT INTO `sys_logininfor` VALUES (615, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 10:29:34');
INSERT INTO `sys_logininfor` VALUES (616, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 17:56:41');
INSERT INTO `sys_logininfor` VALUES (617, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 17:58:15');
INSERT INTO `sys_logininfor` VALUES (618, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-31 21:51:20');
INSERT INTO `sys_logininfor` VALUES (619, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 21:51:22');
INSERT INTO `sys_logininfor` VALUES (620, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-03-31 21:51:54');
INSERT INTO `sys_logininfor` VALUES (621, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 16:44:49');
INSERT INTO `sys_logininfor` VALUES (622, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-04-01 17:19:38');
INSERT INTO `sys_logininfor` VALUES (623, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-04 22:24:12');
INSERT INTO `sys_logininfor` VALUES (624, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-05 09:37:10');
INSERT INTO `sys_logininfor` VALUES (625, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-06 08:18:32');
INSERT INTO `sys_logininfor` VALUES (626, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 10:59:20');
INSERT INTO `sys_logininfor` VALUES (627, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 12:05:06');
INSERT INTO `sys_logininfor` VALUES (628, 'ceshi4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：ceshi4 不存在', '2022-04-07 12:05:15');
INSERT INTO `sys_logininfor` VALUES (629, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 12:05:25');
INSERT INTO `sys_logininfor` VALUES (630, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 12:41:59');
INSERT INTO `sys_logininfor` VALUES (631, 'zhuanjia4', '127.0.0.1', '内网IP', 'Firefox 9', 'Windows 10', '0', '登录成功', '2022-04-07 12:43:28');
INSERT INTO `sys_logininfor` VALUES (632, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-07 13:15:10');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 13:15:15');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 16:25:32');
INSERT INTO `sys_logininfor` VALUES (635, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 17:06:26');
INSERT INTO `sys_logininfor` VALUES (636, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 17:06:44');
INSERT INTO `sys_logininfor` VALUES (637, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 17:12:41');
INSERT INTO `sys_logininfor` VALUES (638, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 17:14:38');
INSERT INTO `sys_logininfor` VALUES (639, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 17:14:50');
INSERT INTO `sys_logininfor` VALUES (640, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 17:20:50');
INSERT INTO `sys_logininfor` VALUES (641, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 17:20:58');
INSERT INTO `sys_logininfor` VALUES (642, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 18:01:22');
INSERT INTO `sys_logininfor` VALUES (643, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-07 19:18:29');
INSERT INTO `sys_logininfor` VALUES (644, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 19:18:33');
INSERT INTO `sys_logininfor` VALUES (645, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-07 21:01:41');
INSERT INTO `sys_logininfor` VALUES (646, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-07 21:02:02');
INSERT INTO `sys_logininfor` VALUES (647, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:02:05');
INSERT INTO `sys_logininfor` VALUES (648, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 21:11:22');
INSERT INTO `sys_logininfor` VALUES (649, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 21:11:41');
INSERT INTO `sys_logininfor` VALUES (650, 'zhuanjia8', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 21:12:03');
INSERT INTO `sys_logininfor` VALUES (651, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 21:24:20');
INSERT INTO `sys_logininfor` VALUES (652, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 21:46:21');
INSERT INTO `sys_logininfor` VALUES (653, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:46:29');
INSERT INTO `sys_logininfor` VALUES (654, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 21:47:06');
INSERT INTO `sys_logininfor` VALUES (655, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:47:13');
INSERT INTO `sys_logininfor` VALUES (656, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 21:52:49');
INSERT INTO `sys_logininfor` VALUES (657, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-07 21:54:17');
INSERT INTO `sys_logininfor` VALUES (658, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:54:28');
INSERT INTO `sys_logininfor` VALUES (659, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 21:55:28');
INSERT INTO `sys_logininfor` VALUES (660, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:55:49');
INSERT INTO `sys_logininfor` VALUES (661, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 21:56:12');
INSERT INTO `sys_logininfor` VALUES (662, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:56:24');
INSERT INTO `sys_logininfor` VALUES (663, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 21:57:54');
INSERT INTO `sys_logininfor` VALUES (664, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:58:02');
INSERT INTO `sys_logininfor` VALUES (665, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 21:58:36');
INSERT INTO `sys_logininfor` VALUES (666, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 21:58:58');
INSERT INTO `sys_logininfor` VALUES (667, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 22:00:29');
INSERT INTO `sys_logininfor` VALUES (668, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 22:01:24');
INSERT INTO `sys_logininfor` VALUES (669, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-07 22:05:27');
INSERT INTO `sys_logininfor` VALUES (670, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-07 22:05:48');
INSERT INTO `sys_logininfor` VALUES (671, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 03:20:17');
INSERT INTO `sys_logininfor` VALUES (672, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 03:20:41');
INSERT INTO `sys_logininfor` VALUES (673, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-08 03:41:35');
INSERT INTO `sys_logininfor` VALUES (674, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 03:41:45');
INSERT INTO `sys_logininfor` VALUES (675, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-08 04:09:59');
INSERT INTO `sys_logininfor` VALUES (676, 'zhuanjia7', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-08 04:10:08');
INSERT INTO `sys_logininfor` VALUES (677, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 04:10:15');
INSERT INTO `sys_logininfor` VALUES (678, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-08 04:50:51');
INSERT INTO `sys_logininfor` VALUES (679, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-08 04:51:05');
INSERT INTO `sys_logininfor` VALUES (680, 'zhuanjia6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 04:51:09');
INSERT INTO `sys_logininfor` VALUES (681, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 09:40:46');
INSERT INTO `sys_logininfor` VALUES (682, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-08 09:50:42');
INSERT INTO `sys_logininfor` VALUES (683, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-08 09:50:54');
INSERT INTO `sys_logininfor` VALUES (684, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 08:07:14');
INSERT INTO `sys_logininfor` VALUES (685, 'ADMIN', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-04-23 21:18:50');
INSERT INTO `sys_logininfor` VALUES (686, 'ADMIN', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-23 21:18:53');
INSERT INTO `sys_logininfor` VALUES (687, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 21:19:00');
INSERT INTO `sys_logininfor` VALUES (688, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 14:58:26');
INSERT INTO `sys_logininfor` VALUES (689, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 08:53:48');
INSERT INTO `sys_logininfor` VALUES (690, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 14:53:11');
INSERT INTO `sys_logininfor` VALUES (691, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 02:07:08');
INSERT INTO `sys_logininfor` VALUES (692, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 02:28:54');
INSERT INTO `sys_logininfor` VALUES (693, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 02:35:41');
INSERT INTO `sys_logininfor` VALUES (694, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-29 02:36:52');
INSERT INTO `sys_logininfor` VALUES (695, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 02:36:59');
INSERT INTO `sys_logininfor` VALUES (696, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 03:34:47');
INSERT INTO `sys_logininfor` VALUES (697, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-29 03:35:16');
INSERT INTO `sys_logininfor` VALUES (698, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-29 03:35:19');
INSERT INTO `sys_logininfor` VALUES (699, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 03:35:21');
INSERT INTO `sys_logininfor` VALUES (700, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 04:14:10');
INSERT INTO `sys_logininfor` VALUES (701, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 04:15:10');
INSERT INTO `sys_logininfor` VALUES (702, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 00:38:20');
INSERT INTO `sys_logininfor` VALUES (703, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 01:06:59');
INSERT INTO `sys_logininfor` VALUES (704, 'zhuanjia2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 01:08:16');
INSERT INTO `sys_logininfor` VALUES (705, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-30 02:23:30');
INSERT INTO `sys_logininfor` VALUES (706, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-30 02:23:36');
INSERT INTO `sys_logininfor` VALUES (707, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 02:23:39');
INSERT INTO `sys_logininfor` VALUES (708, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 04:54:03');
INSERT INTO `sys_logininfor` VALUES (709, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 16:57:46');
INSERT INTO `sys_logininfor` VALUES (710, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 16:58:41');
INSERT INTO `sys_logininfor` VALUES (711, '测试测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-03 16:59:12');
INSERT INTO `sys_logininfor` VALUES (712, '测试测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 16:59:28');
INSERT INTO `sys_logininfor` VALUES (713, '测试测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 17:03:28');
INSERT INTO `sys_logininfor` VALUES (714, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 17:03:31');
INSERT INTO `sys_logininfor` VALUES (715, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 17:06:11');
INSERT INTO `sys_logininfor` VALUES (716, '测试测试', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 17:06:19');
INSERT INTO `sys_logininfor` VALUES (717, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 09:20:56');
INSERT INTO `sys_logininfor` VALUES (718, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 09:21:00');
INSERT INTO `sys_logininfor` VALUES (719, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 09:23:46');
INSERT INTO `sys_logininfor` VALUES (720, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 09:24:02');
INSERT INTO `sys_logininfor` VALUES (721, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 09:25:53');
INSERT INTO `sys_logininfor` VALUES (722, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 09:25:57');
INSERT INTO `sys_logininfor` VALUES (723, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 09:26:02');
INSERT INTO `sys_logininfor` VALUES (724, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 09:27:04');
INSERT INTO `sys_logininfor` VALUES (725, '专家5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：专家5 不存在', '2022-05-04 09:27:18');
INSERT INTO `sys_logininfor` VALUES (726, '专家6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：专家6 不存在', '2022-05-04 09:27:24');
INSERT INTO `sys_logininfor` VALUES (727, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 09:27:37');
INSERT INTO `sys_logininfor` VALUES (728, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 09:28:06');
INSERT INTO `sys_logininfor` VALUES (729, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 09:28:19');
INSERT INTO `sys_logininfor` VALUES (730, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 09:32:01');
INSERT INTO `sys_logininfor` VALUES (731, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 09:32:17');
INSERT INTO `sys_logininfor` VALUES (732, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 10:11:26');
INSERT INTO `sys_logininfor` VALUES (733, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 10:17:43');
INSERT INTO `sys_logininfor` VALUES (734, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 10:17:56');
INSERT INTO `sys_logininfor` VALUES (735, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 10:19:45');
INSERT INTO `sys_logininfor` VALUES (736, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 10:19:54');
INSERT INTO `sys_logininfor` VALUES (737, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 10:19:57');
INSERT INTO `sys_logininfor` VALUES (738, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 10:30:32');
INSERT INTO `sys_logininfor` VALUES (739, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 10:33:16');
INSERT INTO `sys_logininfor` VALUES (740, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 10:33:29');
INSERT INTO `sys_logininfor` VALUES (741, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-04 10:33:32');
INSERT INTO `sys_logininfor` VALUES (742, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 10:33:40');
INSERT INTO `sys_logininfor` VALUES (743, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 10:33:44');
INSERT INTO `sys_logininfor` VALUES (744, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 10:39:13');
INSERT INTO `sys_logininfor` VALUES (745, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 10:39:16');
INSERT INTO `sys_logininfor` VALUES (746, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 11:19:37');
INSERT INTO `sys_logininfor` VALUES (747, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-05-04 14:26:41');
INSERT INTO `sys_logininfor` VALUES (748, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 14:26:43');
INSERT INTO `sys_logininfor` VALUES (749, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 14:26:46');
INSERT INTO `sys_logininfor` VALUES (750, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 14:40:41');
INSERT INTO `sys_logininfor` VALUES (751, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 14:40:51');
INSERT INTO `sys_logininfor` VALUES (752, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 15:00:19');
INSERT INTO `sys_logininfor` VALUES (753, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 15:00:25');
INSERT INTO `sys_logininfor` VALUES (754, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 15:11:14');
INSERT INTO `sys_logininfor` VALUES (755, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 15:11:27');
INSERT INTO `sys_logininfor` VALUES (756, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 15:11:47');
INSERT INTO `sys_logininfor` VALUES (757, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 15:11:52');
INSERT INTO `sys_logininfor` VALUES (758, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 15:12:18');
INSERT INTO `sys_logininfor` VALUES (759, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 15:12:31');
INSERT INTO `sys_logininfor` VALUES (760, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 15:34:07');
INSERT INTO `sys_logininfor` VALUES (761, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 15:34:17');
INSERT INTO `sys_logininfor` VALUES (762, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 15:34:38');
INSERT INTO `sys_logininfor` VALUES (763, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 15:34:51');
INSERT INTO `sys_logininfor` VALUES (764, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 17:06:49');
INSERT INTO `sys_logininfor` VALUES (765, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:25:06');
INSERT INTO `sys_logininfor` VALUES (766, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 18:26:33');
INSERT INTO `sys_logininfor` VALUES (767, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:26:37');
INSERT INTO `sys_logininfor` VALUES (768, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 18:28:39');
INSERT INTO `sys_logininfor` VALUES (769, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:28:42');
INSERT INTO `sys_logininfor` VALUES (770, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:30:41');
INSERT INTO `sys_logininfor` VALUES (771, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:46:28');
INSERT INTO `sys_logininfor` VALUES (772, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:46:40');
INSERT INTO `sys_logininfor` VALUES (773, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:46:53');
INSERT INTO `sys_logininfor` VALUES (774, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-06 14:47:29');
INSERT INTO `sys_logininfor` VALUES (775, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:47:46');
INSERT INTO `sys_logininfor` VALUES (776, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:49:29');
INSERT INTO `sys_logininfor` VALUES (777, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:49:31');
INSERT INTO `sys_logininfor` VALUES (778, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:50:38');
INSERT INTO `sys_logininfor` VALUES (779, '1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：1 不存在', '2022-05-06 14:50:42');
INSERT INTO `sys_logininfor` VALUES (780, '1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：1 不存在', '2022-05-06 14:50:47');
INSERT INTO `sys_logininfor` VALUES (781, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:50:51');
INSERT INTO `sys_logininfor` VALUES (782, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:51:15');
INSERT INTO `sys_logininfor` VALUES (783, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:51:17');
INSERT INTO `sys_logininfor` VALUES (784, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:51:37');
INSERT INTO `sys_logininfor` VALUES (785, '1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：1 不存在', '2022-05-06 14:51:40');
INSERT INTO `sys_logininfor` VALUES (786, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:51:43');
INSERT INTO `sys_logininfor` VALUES (787, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:59:01');
INSERT INTO `sys_logininfor` VALUES (788, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:59:03');
INSERT INTO `sys_logininfor` VALUES (789, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 14:59:32');
INSERT INTO `sys_logininfor` VALUES (790, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 14:59:37');
INSERT INTO `sys_logininfor` VALUES (791, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 15:26:23');
INSERT INTO `sys_logininfor` VALUES (792, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 15:26:30');
INSERT INTO `sys_logininfor` VALUES (793, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 15:28:16');
INSERT INTO `sys_logininfor` VALUES (794, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 15:28:23');
INSERT INTO `sys_logininfor` VALUES (795, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 15:28:42');
INSERT INTO `sys_logininfor` VALUES (796, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 15:28:48');
INSERT INTO `sys_logininfor` VALUES (797, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 15:29:10');
INSERT INTO `sys_logininfor` VALUES (798, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 15:29:15');
INSERT INTO `sys_logininfor` VALUES (799, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 16:51:57');
INSERT INTO `sys_logininfor` VALUES (800, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 17:38:57');
INSERT INTO `sys_logininfor` VALUES (801, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 17:39:14');
INSERT INTO `sys_logininfor` VALUES (802, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 17:39:21');
INSERT INTO `sys_logininfor` VALUES (803, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 17:47:52');
INSERT INTO `sys_logininfor` VALUES (804, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 17:47:55');
INSERT INTO `sys_logininfor` VALUES (805, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 17:48:24');
INSERT INTO `sys_logininfor` VALUES (806, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 17:48:26');
INSERT INTO `sys_logininfor` VALUES (807, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 17:48:31');
INSERT INTO `sys_logininfor` VALUES (808, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 17:49:04');
INSERT INTO `sys_logininfor` VALUES (809, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 20:39:44');
INSERT INTO `sys_logininfor` VALUES (810, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:12:09');
INSERT INTO `sys_logininfor` VALUES (811, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:36:44');
INSERT INTO `sys_logininfor` VALUES (812, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:36:51');
INSERT INTO `sys_logininfor` VALUES (813, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:37:16');
INSERT INTO `sys_logininfor` VALUES (814, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:37:18');
INSERT INTO `sys_logininfor` VALUES (815, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:37:47');
INSERT INTO `sys_logininfor` VALUES (816, '专家5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：专家5 不存在', '2022-05-06 22:37:54');
INSERT INTO `sys_logininfor` VALUES (817, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:37:59');
INSERT INTO `sys_logininfor` VALUES (818, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:38:29');
INSERT INTO `sys_logininfor` VALUES (819, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:38:35');
INSERT INTO `sys_logininfor` VALUES (820, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:39:46');
INSERT INTO `sys_logininfor` VALUES (821, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:39:52');
INSERT INTO `sys_logininfor` VALUES (822, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:40:38');
INSERT INTO `sys_logininfor` VALUES (823, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:40:48');
INSERT INTO `sys_logininfor` VALUES (824, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 22:42:45');
INSERT INTO `sys_logininfor` VALUES (825, '专家4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：专家4 不存在', '2022-05-06 22:42:53');
INSERT INTO `sys_logininfor` VALUES (826, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 22:42:59');
INSERT INTO `sys_logininfor` VALUES (827, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-06 23:01:35');
INSERT INTO `sys_logininfor` VALUES (828, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 23:01:37');
INSERT INTO `sys_logininfor` VALUES (829, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:00:47');
INSERT INTO `sys_logininfor` VALUES (830, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:10:41');
INSERT INTO `sys_logininfor` VALUES (831, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:10:49');
INSERT INTO `sys_logininfor` VALUES (832, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:11:14');
INSERT INTO `sys_logininfor` VALUES (833, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:11:16');
INSERT INTO `sys_logininfor` VALUES (834, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:11:35');
INSERT INTO `sys_logininfor` VALUES (835, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:11:41');
INSERT INTO `sys_logininfor` VALUES (836, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:11:59');
INSERT INTO `sys_logininfor` VALUES (837, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:12:06');
INSERT INTO `sys_logininfor` VALUES (838, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:13:13');
INSERT INTO `sys_logininfor` VALUES (839, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:13:18');
INSERT INTO `sys_logininfor` VALUES (840, '专家5', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：专家5 不存在', '2022-05-07 16:14:43');
INSERT INTO `sys_logininfor` VALUES (841, 'zhuanjia5', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:14:49');
INSERT INTO `sys_logininfor` VALUES (842, 'zhuanjia5', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:16:23');
INSERT INTO `sys_logininfor` VALUES (843, 'admin', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:16:29');
INSERT INTO `sys_logininfor` VALUES (844, 'admin', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:16:44');
INSERT INTO `sys_logininfor` VALUES (845, 'zhuanjia4', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:16:54');
INSERT INTO `sys_logininfor` VALUES (846, 'admin', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 16:56:19');
INSERT INTO `sys_logininfor` VALUES (847, 'admin', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 16:59:55');
INSERT INTO `sys_logininfor` VALUES (848, 'zhuanjia4', '192.168.1.105', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 17:00:07');
INSERT INTO `sys_logininfor` VALUES (849, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 18:10:33');
INSERT INTO `sys_logininfor` VALUES (850, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 18:25:35');
INSERT INTO `sys_logininfor` VALUES (851, '996', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-07 18:26:05');
INSERT INTO `sys_logininfor` VALUES (852, '996', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 18:26:12');
INSERT INTO `sys_logininfor` VALUES (853, '996', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 18:35:07');
INSERT INTO `sys_logininfor` VALUES (854, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 18:35:09');
INSERT INTO `sys_logininfor` VALUES (855, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-07 18:40:19');
INSERT INTO `sys_logininfor` VALUES (856, '999', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-07 18:40:36');
INSERT INTO `sys_logininfor` VALUES (857, '999', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 18:40:44');
INSERT INTO `sys_logininfor` VALUES (858, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 09:12:45');
INSERT INTO `sys_logininfor` VALUES (859, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 10:03:57');
INSERT INTO `sys_logininfor` VALUES (860, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 10:06:23');
INSERT INTO `sys_logininfor` VALUES (861, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 10:06:30');
INSERT INTO `sys_logininfor` VALUES (862, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 10:09:46');
INSERT INTO `sys_logininfor` VALUES (863, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 10:09:48');
INSERT INTO `sys_logininfor` VALUES (864, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 10:44:18');
INSERT INTO `sys_logininfor` VALUES (865, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 10:44:26');
INSERT INTO `sys_logininfor` VALUES (866, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:00:47');
INSERT INTO `sys_logininfor` VALUES (867, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:00:49');
INSERT INTO `sys_logininfor` VALUES (868, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:02:05');
INSERT INTO `sys_logininfor` VALUES (869, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:02:11');
INSERT INTO `sys_logininfor` VALUES (870, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:03:47');
INSERT INTO `sys_logininfor` VALUES (871, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:03:49');
INSERT INTO `sys_logininfor` VALUES (872, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:05:57');
INSERT INTO `sys_logininfor` VALUES (873, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:06:02');
INSERT INTO `sys_logininfor` VALUES (874, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:07:13');
INSERT INTO `sys_logininfor` VALUES (875, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:07:15');
INSERT INTO `sys_logininfor` VALUES (876, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:09:48');
INSERT INTO `sys_logininfor` VALUES (877, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:09:56');
INSERT INTO `sys_logininfor` VALUES (878, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:13:43');
INSERT INTO `sys_logininfor` VALUES (879, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:13:49');
INSERT INTO `sys_logininfor` VALUES (880, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:14:53');
INSERT INTO `sys_logininfor` VALUES (881, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:14:56');
INSERT INTO `sys_logininfor` VALUES (882, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:15:14');
INSERT INTO `sys_logininfor` VALUES (883, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:15:19');
INSERT INTO `sys_logininfor` VALUES (884, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 11:16:57');
INSERT INTO `sys_logininfor` VALUES (885, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 11:16:59');
INSERT INTO `sys_logininfor` VALUES (886, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 15:03:08');
INSERT INTO `sys_logininfor` VALUES (887, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 15:03:13');
INSERT INTO `sys_logininfor` VALUES (888, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 15:03:48');
INSERT INTO `sys_logininfor` VALUES (889, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 15:05:08');
INSERT INTO `sys_logininfor` VALUES (890, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 15:41:11');
INSERT INTO `sys_logininfor` VALUES (891, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 15:41:21');
INSERT INTO `sys_logininfor` VALUES (892, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 15:41:45');
INSERT INTO `sys_logininfor` VALUES (893, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 15:41:47');
INSERT INTO `sys_logininfor` VALUES (894, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:06:57');
INSERT INTO `sys_logininfor` VALUES (895, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:11:16');
INSERT INTO `sys_logininfor` VALUES (896, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:22:52');
INSERT INTO `sys_logininfor` VALUES (897, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:22:54');
INSERT INTO `sys_logininfor` VALUES (898, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:48:48');
INSERT INTO `sys_logininfor` VALUES (899, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:48:54');
INSERT INTO `sys_logininfor` VALUES (900, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:49:08');
INSERT INTO `sys_logininfor` VALUES (901, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:49:13');
INSERT INTO `sys_logininfor` VALUES (902, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:49:31');
INSERT INTO `sys_logininfor` VALUES (903, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:49:33');
INSERT INTO `sys_logininfor` VALUES (904, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:52:43');
INSERT INTO `sys_logininfor` VALUES (905, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:52:49');
INSERT INTO `sys_logininfor` VALUES (906, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:55:06');
INSERT INTO `sys_logininfor` VALUES (907, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:55:07');
INSERT INTO `sys_logininfor` VALUES (908, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:57:18');
INSERT INTO `sys_logininfor` VALUES (909, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:57:24');
INSERT INTO `sys_logininfor` VALUES (910, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 16:58:57');
INSERT INTO `sys_logininfor` VALUES (911, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:58:59');
INSERT INTO `sys_logininfor` VALUES (912, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 17:05:08');
INSERT INTO `sys_logininfor` VALUES (913, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 17:05:10');
INSERT INTO `sys_logininfor` VALUES (914, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-08 17:41:36');
INSERT INTO `sys_logininfor` VALUES (915, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 09:04:45');
INSERT INTO `sys_logininfor` VALUES (916, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:00:38');
INSERT INTO `sys_logininfor` VALUES (917, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:02:51');
INSERT INTO `sys_logininfor` VALUES (918, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:02:58');
INSERT INTO `sys_logininfor` VALUES (919, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:03:38');
INSERT INTO `sys_logininfor` VALUES (920, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:03:43');
INSERT INTO `sys_logininfor` VALUES (921, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:06:43');
INSERT INTO `sys_logininfor` VALUES (922, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:06:45');
INSERT INTO `sys_logininfor` VALUES (923, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:07:21');
INSERT INTO `sys_logininfor` VALUES (924, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:07:26');
INSERT INTO `sys_logininfor` VALUES (925, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:07:36');
INSERT INTO `sys_logininfor` VALUES (926, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:07:43');
INSERT INTO `sys_logininfor` VALUES (927, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:08:43');
INSERT INTO `sys_logininfor` VALUES (928, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:08:49');
INSERT INTO `sys_logininfor` VALUES (929, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:09:15');
INSERT INTO `sys_logininfor` VALUES (930, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:09:21');
INSERT INTO `sys_logininfor` VALUES (931, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:16:31');
INSERT INTO `sys_logininfor` VALUES (932, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:16:32');
INSERT INTO `sys_logininfor` VALUES (933, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:16:57');
INSERT INTO `sys_logininfor` VALUES (934, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:17:02');
INSERT INTO `sys_logininfor` VALUES (935, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:41:45');
INSERT INTO `sys_logininfor` VALUES (936, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:41:47');
INSERT INTO `sys_logininfor` VALUES (937, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:47:28');
INSERT INTO `sys_logininfor` VALUES (938, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:47:37');
INSERT INTO `sys_logininfor` VALUES (939, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:51:11');
INSERT INTO `sys_logininfor` VALUES (940, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:51:22');
INSERT INTO `sys_logininfor` VALUES (941, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:51:45');
INSERT INTO `sys_logininfor` VALUES (942, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:51:48');
INSERT INTO `sys_logininfor` VALUES (943, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 10:52:04');
INSERT INTO `sys_logininfor` VALUES (944, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 10:52:10');
INSERT INTO `sys_logininfor` VALUES (945, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:11:21');
INSERT INTO `sys_logininfor` VALUES (946, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:11:25');
INSERT INTO `sys_logininfor` VALUES (947, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:11:35');
INSERT INTO `sys_logininfor` VALUES (948, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:12:10');
INSERT INTO `sys_logininfor` VALUES (949, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:12:13');
INSERT INTO `sys_logininfor` VALUES (950, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:12:41');
INSERT INTO `sys_logininfor` VALUES (951, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:12:48');
INSERT INTO `sys_logininfor` VALUES (952, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:15:44');
INSERT INTO `sys_logininfor` VALUES (953, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:15:50');
INSERT INTO `sys_logininfor` VALUES (954, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:36:27');
INSERT INTO `sys_logininfor` VALUES (955, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:36:47');
INSERT INTO `sys_logininfor` VALUES (956, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:36:56');
INSERT INTO `sys_logininfor` VALUES (957, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:37:04');
INSERT INTO `sys_logininfor` VALUES (958, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 15:43:24');
INSERT INTO `sys_logininfor` VALUES (959, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 15:44:05');
INSERT INTO `sys_logininfor` VALUES (960, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:08:26');
INSERT INTO `sys_logininfor` VALUES (961, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:08:35');
INSERT INTO `sys_logininfor` VALUES (962, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:09:02');
INSERT INTO `sys_logininfor` VALUES (963, 'zhuanjiia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：zhuanjiia4 不存在', '2022-05-09 16:09:09');
INSERT INTO `sys_logininfor` VALUES (964, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:09:13');
INSERT INTO `sys_logininfor` VALUES (965, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:10:28');
INSERT INTO `sys_logininfor` VALUES (966, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:10:34');
INSERT INTO `sys_logininfor` VALUES (967, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:11:04');
INSERT INTO `sys_logininfor` VALUES (968, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:11:09');
INSERT INTO `sys_logininfor` VALUES (969, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:12:28');
INSERT INTO `sys_logininfor` VALUES (970, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:12:31');
INSERT INTO `sys_logininfor` VALUES (971, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:12:58');
INSERT INTO `sys_logininfor` VALUES (972, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:13:06');
INSERT INTO `sys_logininfor` VALUES (973, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:13:24');
INSERT INTO `sys_logininfor` VALUES (974, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:13:34');
INSERT INTO `sys_logininfor` VALUES (975, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:14:42');
INSERT INTO `sys_logininfor` VALUES (976, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:14:49');
INSERT INTO `sys_logininfor` VALUES (977, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:15:20');
INSERT INTO `sys_logininfor` VALUES (978, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:15:27');
INSERT INTO `sys_logininfor` VALUES (979, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:16:30');
INSERT INTO `sys_logininfor` VALUES (980, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:16:32');
INSERT INTO `sys_logininfor` VALUES (981, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:43:59');
INSERT INTO `sys_logininfor` VALUES (982, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:44:05');
INSERT INTO `sys_logininfor` VALUES (983, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:44:45');
INSERT INTO `sys_logininfor` VALUES (984, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:44:47');
INSERT INTO `sys_logininfor` VALUES (985, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:46:09');
INSERT INTO `sys_logininfor` VALUES (986, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:46:15');
INSERT INTO `sys_logininfor` VALUES (987, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:46:39');
INSERT INTO `sys_logininfor` VALUES (988, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:46:46');
INSERT INTO `sys_logininfor` VALUES (989, 'zhuanjia5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-09 16:47:11');
INSERT INTO `sys_logininfor` VALUES (990, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 16:47:17');
INSERT INTO `sys_logininfor` VALUES (991, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 17:44:01');
INSERT INTO `sys_logininfor` VALUES (992, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 18:50:10');
INSERT INTO `sys_logininfor` VALUES (993, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 13:51:48');
INSERT INTO `sys_logininfor` VALUES (994, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 14:47:42');
INSERT INTO `sys_logininfor` VALUES (995, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 15:31:30');
INSERT INTO `sys_logininfor` VALUES (996, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 18:28:52');
INSERT INTO `sys_logininfor` VALUES (997, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 19:17:51');
INSERT INTO `sys_logininfor` VALUES (998, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-10 19:19:38');
INSERT INTO `sys_logininfor` VALUES (999, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 19:19:44');
INSERT INTO `sys_logininfor` VALUES (1000, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-10 19:19:53');
INSERT INTO `sys_logininfor` VALUES (1001, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 19:19:55');
INSERT INTO `sys_logininfor` VALUES (1002, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-10 19:21:29');
INSERT INTO `sys_logininfor` VALUES (1003, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 19:21:38');
INSERT INTO `sys_logininfor` VALUES (1004, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-10 19:25:59');
INSERT INTO `sys_logininfor` VALUES (1005, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 19:26:01');
INSERT INTO `sys_logininfor` VALUES (1006, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 11:08:57');
INSERT INTO `sys_logininfor` VALUES (1007, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-11 11:10:24');
INSERT INTO `sys_logininfor` VALUES (1008, '990', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-11 11:12:01');
INSERT INTO `sys_logininfor` VALUES (1009, '990', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 11:12:11');
INSERT INTO `sys_logininfor` VALUES (1010, '990', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-11 11:18:03');
INSERT INTO `sys_logininfor` VALUES (1011, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 11:18:18');
INSERT INTO `sys_logininfor` VALUES (1012, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-11 11:19:19');
INSERT INTO `sys_logininfor` VALUES (1013, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 11:19:20');
INSERT INTO `sys_logininfor` VALUES (1014, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-11 11:20:30');
INSERT INTO `sys_logininfor` VALUES (1015, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 11:20:37');
INSERT INTO `sys_logininfor` VALUES (1016, 'zhuanjia4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-11 11:31:30');
INSERT INTO `sys_logininfor` VALUES (1017, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 11:31:32');
INSERT INTO `sys_logininfor` VALUES (1018, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 14:07:36');
INSERT INTO `sys_logininfor` VALUES (1019, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 16:21:52');
INSERT INTO `sys_logininfor` VALUES (1020, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 15:01:11');
INSERT INTO `sys_logininfor` VALUES (1021, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 06:05:56');
INSERT INTO `sys_logininfor` VALUES (1022, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 07:07:35');
INSERT INTO `sys_logininfor` VALUES (1023, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 16:46:04');
INSERT INTO `sys_logininfor` VALUES (1024, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 00:06:02');
INSERT INTO `sys_logininfor` VALUES (1025, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 07:46:16');
INSERT INTO `sys_logininfor` VALUES (1026, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 08:27:14');
INSERT INTO `sys_logininfor` VALUES (1027, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 09:52:08');
INSERT INTO `sys_logininfor` VALUES (1028, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-05-17 10:24:54');
INSERT INTO `sys_logininfor` VALUES (1029, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 13:04:05');
INSERT INTO `sys_logininfor` VALUES (1030, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 13:51:04');
INSERT INTO `sys_logininfor` VALUES (1031, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-21 12:11:36');
INSERT INTO `sys_logininfor` VALUES (1032, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-21 15:18:10');
INSERT INTO `sys_logininfor` VALUES (1033, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-21 17:27:26');
INSERT INTO `sys_logininfor` VALUES (1034, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-22 18:00:56');
INSERT INTO `sys_logininfor` VALUES (1035, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 09:06:18');
INSERT INTO `sys_logininfor` VALUES (1036, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 16:23:47');
INSERT INTO `sys_logininfor` VALUES (1037, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 17:13:07');
INSERT INTO `sys_logininfor` VALUES (1038, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 23:47:55');
INSERT INTO `sys_logininfor` VALUES (1039, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 23:51:03');
INSERT INTO `sys_logininfor` VALUES (1040, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-24 16:40:21');
INSERT INTO `sys_logininfor` VALUES (1041, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 00:06:16');
INSERT INTO `sys_logininfor` VALUES (1042, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 03:06:09');
INSERT INTO `sys_logininfor` VALUES (1043, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 12:20:10');
INSERT INTO `sys_logininfor` VALUES (1044, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 13:03:38');
INSERT INTO `sys_logininfor` VALUES (1045, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-31 13:51:31');
INSERT INTO `sys_logininfor` VALUES (1046, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 13:51:34');
INSERT INTO `sys_logininfor` VALUES (1047, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 14:35:45');
INSERT INTO `sys_logininfor` VALUES (1048, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-11 12:07:49');
INSERT INTO `sys_logininfor` VALUES (1049, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-11 14:20:04');
INSERT INTO `sys_logininfor` VALUES (1050, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-11 14:26:16');
INSERT INTO `sys_logininfor` VALUES (1051, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-15 09:41:43');
INSERT INTO `sys_logininfor` VALUES (1052, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-15 09:42:25');
INSERT INTO `sys_logininfor` VALUES (1053, 'zx', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-06-15 09:42:57');
INSERT INTO `sys_logininfor` VALUES (1054, 'zx', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-15 09:43:04');
INSERT INTO `sys_logininfor` VALUES (1055, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-15 19:33:40');
INSERT INTO `sys_logininfor` VALUES (1056, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-15 20:07:20');
INSERT INTO `sys_logininfor` VALUES (1057, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-04 11:29:35');
INSERT INTO `sys_logininfor` VALUES (1058, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-04 16:55:20');
INSERT INTO `sys_logininfor` VALUES (1059, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-04 17:39:21');
INSERT INTO `sys_logininfor` VALUES (1060, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-04 19:45:23');
INSERT INTO `sys_logininfor` VALUES (1061, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-04 23:41:31');
INSERT INTO `sys_logininfor` VALUES (1062, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-04 23:54:45');
INSERT INTO `sys_logininfor` VALUES (1063, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 00:31:11');
INSERT INTO `sys_logininfor` VALUES (1064, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 02:43:47');
INSERT INTO `sys_logininfor` VALUES (1065, 'zx', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 02:51:22');
INSERT INTO `sys_logininfor` VALUES (1066, 'zx', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-05 02:51:51');
INSERT INTO `sys_logininfor` VALUES (1067, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 02:51:56');
INSERT INTO `sys_logininfor` VALUES (1068, 'zx', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-07-05 02:52:24');
INSERT INTO `sys_logininfor` VALUES (1069, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-07-05 03:12:33');
INSERT INTO `sys_logininfor` VALUES (1070, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 03:12:42');
INSERT INTO `sys_logininfor` VALUES (1071, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-05 03:18:59');
INSERT INTO `sys_logininfor` VALUES (1072, 'lisi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：lisi 不存在', '2022-07-05 03:19:14');
INSERT INTO `sys_logininfor` VALUES (1073, 'lisi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-07-05 03:19:39');
INSERT INTO `sys_logininfor` VALUES (1074, 'lisi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 03:19:44');
INSERT INTO `sys_logininfor` VALUES (1075, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-05 03:24:54');
INSERT INTO `sys_logininfor` VALUES (1076, 'zx', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-07-05 03:25:07');
INSERT INTO `sys_logininfor` VALUES (1077, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 03:25:13');
INSERT INTO `sys_logininfor` VALUES (1078, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 03:25:44');
INSERT INTO `sys_logininfor` VALUES (1079, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-05 09:30:32');
INSERT INTO `sys_logininfor` VALUES (1080, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-06 18:49:06');
INSERT INTO `sys_logininfor` VALUES (1081, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-06 18:53:23');
INSERT INTO `sys_logininfor` VALUES (1082, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-06 18:53:36');
INSERT INTO `sys_logininfor` VALUES (1083, 'zx', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-06 18:55:23');
INSERT INTO `sys_logininfor` VALUES (1084, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-06 18:56:44');
INSERT INTO `sys_logininfor` VALUES (1085, 'lisi', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-07-06 18:57:36');
INSERT INTO `sys_logininfor` VALUES (1086, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-07 10:11:55');
INSERT INTO `sys_logininfor` VALUES (1087, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-07 10:54:07');
INSERT INTO `sys_logininfor` VALUES (1088, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-07 15:18:07');
INSERT INTO `sys_logininfor` VALUES (1089, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-07 16:00:45');
INSERT INTO `sys_logininfor` VALUES (1090, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-07-08 15:40:44');
INSERT INTO `sys_logininfor` VALUES (1091, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-08 15:40:46');
INSERT INTO `sys_logininfor` VALUES (1092, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-08 19:51:54');
INSERT INTO `sys_logininfor` VALUES (1093, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-08 20:01:28');
INSERT INTO `sys_logininfor` VALUES (1094, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-08 20:01:45');
INSERT INTO `sys_logininfor` VALUES (1095, 'zhangxiang', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '登录用户：zhangxiang 不存在', '2022-07-08 20:07:13');
INSERT INTO `sys_logininfor` VALUES (1096, 'zhangxiang', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '登录用户：zhangxiang 不存在', '2022-07-08 20:07:21');
INSERT INTO `sys_logininfor` VALUES (1097, 'zx', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-07-08 20:07:26');
INSERT INTO `sys_logininfor` VALUES (1098, 'zx', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-07-08 20:15:45');
INSERT INTO `sys_logininfor` VALUES (1099, 'haowuyi', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '注册成功', '2022-07-08 20:16:37');
INSERT INTO `sys_logininfor` VALUES (1100, 'haowuyi', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-07-08 20:16:51');
INSERT INTO `sys_logininfor` VALUES (1101, 'zx', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-08 20:21:29');
INSERT INTO `sys_logininfor` VALUES (1102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 02:12:07');
INSERT INTO `sys_logininfor` VALUES (1103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-10 02:22:15');
INSERT INTO `sys_logininfor` VALUES (1104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 02:22:24');
INSERT INTO `sys_logininfor` VALUES (1105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-10 02:22:38');
INSERT INTO `sys_logininfor` VALUES (1106, '！@', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-07-10 02:39:00');
INSERT INTO `sys_logininfor` VALUES (1107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-07-10 02:39:47');
INSERT INTO `sys_logininfor` VALUES (1108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 02:39:49');
INSERT INTO `sys_logininfor` VALUES (1109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-10 02:40:46');
INSERT INTO `sys_logininfor` VALUES (1110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 02:41:07');
INSERT INTO `sys_logininfor` VALUES (1111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 05:47:19');
INSERT INTO `sys_logininfor` VALUES (1112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-10 05:47:50');
INSERT INTO `sys_logininfor` VALUES (1113, 'zhangxiang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '对不起，您的账号：zhangxiang 已被删除', '2022-07-10 11:44:50');
INSERT INTO `sys_logininfor` VALUES (1114, 'zhangxiang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 11:46:24');
INSERT INTO `sys_logininfor` VALUES (1115, 'zhangxiang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 13:16:43');
INSERT INTO `sys_logininfor` VALUES (1116, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-07-10 13:21:26');
INSERT INTO `sys_logininfor` VALUES (1117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-10 15:03:29');
INSERT INTO `sys_logininfor` VALUES (1118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-12 20:05:42');
INSERT INTO `sys_logininfor` VALUES (1119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-12 21:35:44');
INSERT INTO `sys_logininfor` VALUES (1120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-13 03:04:06');
INSERT INTO `sys_logininfor` VALUES (1121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-13 04:00:33');
INSERT INTO `sys_logininfor` VALUES (1122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-13 16:46:13');
INSERT INTO `sys_logininfor` VALUES (1123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-13 19:34:56');
INSERT INTO `sys_logininfor` VALUES (1124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-13 21:01:43');
INSERT INTO `sys_logininfor` VALUES (1125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-12 14:41:25');
INSERT INTO `sys_logininfor` VALUES (1126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-12 15:52:24');
INSERT INTO `sys_logininfor` VALUES (1127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-08-12 15:58:00');
INSERT INTO `sys_logininfor` VALUES (1128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-12 15:58:22');
INSERT INTO `sys_logininfor` VALUES (1129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-14 15:32:10');
INSERT INTO `sys_logininfor` VALUES (1130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-14 16:08:50');
INSERT INTO `sys_logininfor` VALUES (1131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-15 14:10:10');
INSERT INTO `sys_logininfor` VALUES (1132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-15 17:39:55');
INSERT INTO `sys_logininfor` VALUES (1133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-16 08:59:27');
INSERT INTO `sys_logininfor` VALUES (1134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-16 10:22:23');
INSERT INTO `sys_logininfor` VALUES (1135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-16 10:24:15');
INSERT INTO `sys_logininfor` VALUES (1136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-16 11:50:33');
INSERT INTO `sys_logininfor` VALUES (1137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-16 15:01:30');
INSERT INTO `sys_logininfor` VALUES (1138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-16 16:14:42');
INSERT INTO `sys_logininfor` VALUES (1139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-17 08:36:00');
INSERT INTO `sys_logininfor` VALUES (1140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-17 17:05:07');
INSERT INTO `sys_logininfor` VALUES (1141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-18 09:23:07');
INSERT INTO `sys_logininfor` VALUES (1142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-08-18 09:24:31');
INSERT INTO `sys_logininfor` VALUES (1143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-18 09:40:07');
INSERT INTO `sys_logininfor` VALUES (1144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-08-18 09:40:15');
INSERT INTO `sys_logininfor` VALUES (1145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-18 09:40:19');
INSERT INTO `sys_logininfor` VALUES (1146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-18 15:41:00');
INSERT INTO `sys_logininfor` VALUES (1147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-18 15:41:02');
INSERT INTO `sys_logininfor` VALUES (1148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-18 15:44:13');
INSERT INTO `sys_logininfor` VALUES (1149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-21 08:59:34');
INSERT INTO `sys_logininfor` VALUES (1150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-21 10:05:22');
INSERT INTO `sys_logininfor` VALUES (1151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-21 11:00:32');
INSERT INTO `sys_logininfor` VALUES (1152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-22 09:02:02');
INSERT INTO `sys_logininfor` VALUES (1153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-23 16:14:21');
INSERT INTO `sys_logininfor` VALUES (1154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-23 18:07:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2207 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-02-18 10:49:08', 'admin', '2023-08-14 15:48:06', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 4, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-02-18 10:49:08', 'admin', '2022-05-09 16:37:46', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 5, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-02-18 10:49:08', 'admin', '2022-05-09 16:37:58', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '账号管理', 2000, 2, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'lock', 'admin', '2022-02-18 10:49:08', 'admin', '2022-05-09 16:38:27', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-02-18 10:49:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-02-18 10:49:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 2000, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-02-18 10:49:08', 'admin', '2022-02-20 18:02:50', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-02-18 10:49:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-02-18 10:49:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-02-18 10:49:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-02-18 10:49:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-02-18 10:49:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-02-18 10:49:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-02-18 10:49:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-02-18 10:49:08', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-02-18 10:49:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-02-18 10:49:08', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-02-18 10:49:08', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-02-18 10:49:08', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-02-18 10:49:08', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-02-18 10:49:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-02-18 10:49:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '专家管理', 0, 0, 'expert', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2022-02-18 13:18:49', 'admin', '2022-03-04 22:03:36', '');
INSERT INTO `sys_menu` VALUES (2010, '通行码管理', 2000, 5, 'code', 'expert/code/index', NULL, 1, 0, 'C', '0', '0', 'expert:code:list', 'druid', 'admin', '2022-02-20 17:45:53', 'admin', '2022-02-20 18:09:19', '通行码管理菜单');
INSERT INTO `sys_menu` VALUES (2011, '通行码管理查询', 2010, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:code:query', '#', 'admin', '2022-02-20 17:45:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '通行码管理新增', 2010, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:code:add', '#', 'admin', '2022-02-20 17:45:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '通行码管理修改', 2010, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:code:edit', '#', 'admin', '2022-02-20 17:45:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '通行码管理删除', 2010, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:code:remove', '#', 'admin', '2022-02-20 17:45:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '通行码管理导出', 2010, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:code:export', '#', 'admin', '2022-02-20 17:45:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '类别管理', 2046, 1, 'class', 'expert/class/index', NULL, 1, 0, 'C', '0', '0', 'expert:class:list', 'excel', 'admin', '2022-02-20 17:53:59', 'admin', '2022-02-20 21:32:23', '专家类别管理菜单');
INSERT INTO `sys_menu` VALUES (2017, '专家类别管理查询', 2016, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:class:query', '#', 'admin', '2022-02-20 17:53:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '专家类别管理新增', 2016, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:class:add', '#', 'admin', '2022-02-20 17:53:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '专家类别管理修改', 2016, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:class:edit', '#', 'admin', '2022-02-20 17:53:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '专家类别管理删除', 2016, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:class:remove', '#', 'admin', '2022-02-20 17:53:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '专家类别管理导出', 2016, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:class:export', '#', 'admin', '2022-02-20 17:53:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '专业管理', 2046, 1, 'major', 'expert/major/index', NULL, 1, 0, 'C', '0', '0', 'expert:major:list', 'excel', 'admin', '2022-02-20 17:54:03', 'admin', '2022-02-20 21:32:36', '专业管理菜单');
INSERT INTO `sys_menu` VALUES (2023, '专业管理查询', 2022, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:major:query', '#', 'admin', '2022-02-20 17:54:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '专业管理新增', 2022, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:major:add', '#', 'admin', '2022-02-20 17:54:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '专业管理修改', 2022, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:major:edit', '#', 'admin', '2022-02-20 17:54:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '专业管理删除', 2022, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:major:remove', '#', 'admin', '2022-02-20 17:54:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '专业管理导出', 2022, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:major:export', '#', 'admin', '2022-02-20 17:54:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '职位管理', 2046, 1, 'position', 'expert/position/index', NULL, 1, 0, 'C', '0', '0', 'expert:position:list', 'excel', 'admin', '2022-02-20 17:54:09', 'admin', '2022-02-20 21:32:43', '职位管理菜单');
INSERT INTO `sys_menu` VALUES (2029, '职位管理查询', 2028, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:position:query', '#', 'admin', '2022-02-20 17:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '职位管理新增', 2028, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:position:add', '#', 'admin', '2022-02-20 17:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '职位管理修改', 2028, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:position:edit', '#', 'admin', '2022-02-20 17:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '职位管理删除', 2028, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:position:remove', '#', 'admin', '2022-02-20 17:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '职位管理导出', 2028, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:position:export', '#', 'admin', '2022-02-20 17:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '职称管理', 2046, 1, 'title', 'expert/title/index', NULL, 1, 0, 'C', '0', '0', 'expert:title:list', 'excel', 'admin', '2022-02-20 17:54:13', 'admin', '2022-02-20 21:32:48', '职称管理菜单');
INSERT INTO `sys_menu` VALUES (2035, '职称管理查询', 2034, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:title:query', '#', 'admin', '2022-02-20 17:54:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '职称管理新增', 2034, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:title:add', '#', 'admin', '2022-02-20 17:54:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '职称管理修改', 2034, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:title:edit', '#', 'admin', '2022-02-20 17:54:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '职称管理删除', 2034, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:title:remove', '#', 'admin', '2022-02-20 17:54:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '职称管理导出', 2034, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:title:export', '#', 'admin', '2022-02-20 17:54:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '申请记录', 2000, 3, 'apply', 'expert/apply/index', NULL, 1, 0, 'C', '0', '0', 'expert:apply:list', 'search', 'admin', '2022-02-20 21:19:26', 'admin', '2022-05-09 16:38:35', '申请记录菜单');
INSERT INTO `sys_menu` VALUES (2041, '申请记录查询', 2040, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:apply:query', '#', 'admin', '2022-02-20 21:19:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '申请记录新增', 2040, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:apply:add', '#', 'admin', '2022-02-20 21:19:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '申请记录修改', 2040, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:apply:edit', '#', 'admin', '2022-02-20 21:19:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '申请记录删除', 2040, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:apply:remove', '#', 'admin', '2022-02-20 21:19:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '申请记录导出', 2040, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:apply:export', '#', 'admin', '2022-02-20 21:19:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '专职管理', 2000, 6, 'type', NULL, NULL, 1, 0, 'M', '0', '0', '', 'button', 'admin', '2022-02-20 21:32:07', 'admin', '2022-05-09 16:38:44', '');
INSERT INTO `sys_menu` VALUES (2053, '个人中心', 0, 6, 'userInfo', 'system/user/profile/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2022-02-21 11:53:19', 'admin', '2022-02-21 15:10:14', '');
INSERT INTO `sys_menu` VALUES (2061, '专家信息', 2000, 1, 'experts', 'expert/experts/index', NULL, 1, 0, 'C', '0', '0', 'expert:experts:list', 'user', 'admin', '2022-02-21 21:06:23', 'admin', '2022-02-21 21:32:16', '专家属性菜单');
INSERT INTO `sys_menu` VALUES (2062, '专家属性查询', 2061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:experts:query', '#', 'admin', '2022-02-21 21:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '专家属性新增', 2061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:experts:add', '#', 'admin', '2022-02-21 21:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '专家属性修改', 2061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:experts:edit', '#', 'admin', '2022-02-21 21:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '专家属性删除', 2061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:experts:remove', '#', 'admin', '2022-02-21 21:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '专家属性导出', 2061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'expert:experts:export', '#', 'admin', '2022-02-21 21:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '知识产权管理', 0, 2, 'property', NULL, NULL, 1, 0, 'M', '0', '0', '', 'nested', 'admin', '2022-03-05 09:56:15', 'admin', '2022-05-09 16:37:22', '');
INSERT INTO `sys_menu` VALUES (2111, '知识产权类型管理', 2104, 0, 'type', 'property/type/index', NULL, 1, 0, 'C', '0', '0', 'property:type:list', 'excel', 'admin', '2022-03-05 10:02:35', 'admin', '2022-05-09 16:43:18', '知识产权类型管理菜单');
INSERT INTO `sys_menu` VALUES (2112, '知识产权类型管理查询', 2111, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:type:query', '#', 'admin', '2022-03-05 10:02:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2113, '知识产权类型管理新增', 2111, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:type:add', '#', 'admin', '2022-03-05 10:02:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '知识产权类型管理修改', 2111, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:type:edit', '#', 'admin', '2022-03-05 10:02:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '知识产权类型管理删除', 2111, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:type:remove', '#', 'admin', '2022-03-05 10:02:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '知识产权类型管理导出', 2111, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:type:export', '#', 'admin', '2022-03-05 10:02:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '知识产权', 2104, 1, 'propertys', 'property/propertys/index', NULL, 1, 0, 'C', '0', '0', 'property:propertys:list', 'list', 'admin', '2022-03-05 10:57:37', 'admin', '2022-03-06 17:44:38', '知识产权菜单');
INSERT INTO `sys_menu` VALUES (2118, '知识产权查询', 2117, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertys:query', '#', 'admin', '2022-03-05 10:57:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '知识产权新增', 2117, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertys:add', '#', 'admin', '2022-03-05 10:57:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '知识产权修改', 2117, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertys:edit', '#', 'admin', '2022-03-05 10:57:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '知识产权删除', 2117, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertys:remove', '#', 'admin', '2022-03-05 10:57:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '知识产权导出', 2117, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertys:export', '#', 'admin', '2022-03-05 10:57:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '项目管理', 0, 1, 'project', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2022-03-12 06:52:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '模板管理', 2123, 4, 'template', 'project/template/index', NULL, 1, 0, 'C', '0', '0', 'project:template:list', 'documentation', 'admin', '2022-03-12 07:18:23', 'admin', '2022-05-09 16:42:19', '模板管理菜单');
INSERT INTO `sys_menu` VALUES (2125, '模板管理查询', 2124, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:template:query', '#', 'admin', '2022-03-12 07:18:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '模板管理新增', 2124, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:template:add', '#', 'admin', '2022-03-12 07:18:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '模板管理修改', 2124, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:template:edit', '#', 'admin', '2022-03-12 07:18:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '模板管理删除', 2124, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:template:remove', '#', 'admin', '2022-03-12 07:18:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '模板管理导出', 2124, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:template:export', '#', 'admin', '2022-03-12 07:18:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '项目列表', 2123, 0, 'projects', 'project/projects/index', NULL, 1, 0, 'C', '0', '0', 'project:projects:list', 'list', 'admin', '2022-03-12 07:18:32', 'admin', '2022-05-09 16:40:41', '项目列表菜单');
INSERT INTO `sys_menu` VALUES (2131, '项目列表查询', 2130, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projects:query', '#', 'admin', '2022-03-12 07:18:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '项目列表新增', 2130, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projects:add', '#', 'admin', '2022-03-12 07:18:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '项目列表修改', 2130, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projects:edit', '#', 'admin', '2022-03-12 07:18:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '项目列表删除', 2130, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projects:remove', '#', 'admin', '2022-03-12 07:18:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '项目列表导出', 2130, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projects:export', '#', 'admin', '2022-03-12 07:18:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '制定任务书任务', 2123, 10, 'bookTask', 'project/bookTask/index', NULL, 1, 0, 'M', '1', '0', 'project:bookTask:list', 'clipboard', 'admin', '2022-03-12 07:18:47', 'admin', '2022-05-09 16:41:38', '制定任务书任务菜单');
INSERT INTO `sys_menu` VALUES (2137, '制定任务书任务查询', 2136, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:bookTask:query', '#', 'admin', '2022-03-12 07:18:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '制定任务书任务新增', 2136, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:bookTask:add', '#', 'admin', '2022-03-12 07:18:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '制定任务书任务修改', 2136, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:bookTask:edit', '#', 'admin', '2022-03-12 07:18:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '制定任务书任务删除', 2136, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:bookTask:remove', '#', 'admin', '2022-03-12 07:18:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '制定任务书任务导出', 2136, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:bookTask:export', '#', 'admin', '2022-03-12 07:18:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '自评互评查询', 2123, 6, 'check', 'project/check/index', NULL, 1, 0, 'C', '0', '1', 'project:check:list', 'clipboard', 'admin', '2022-03-12 07:18:58', 'admin', '2022-06-11 12:18:57', '自评互评任务菜单');
INSERT INTO `sys_menu` VALUES (2149, '自评互评任务查询', 2148, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:check:query', '#', 'admin', '2022-03-12 07:18:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2150, '自评互评任务新增', 2148, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:check:add', '#', 'admin', '2022-03-12 07:18:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '自评互评任务修改', 2148, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:check:edit', '#', 'admin', '2022-03-12 07:18:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '自评互评任务删除', 2148, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:check:remove', '#', 'admin', '2022-03-12 07:18:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2153, '自评互评任务导出', 2148, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:check:export', '#', 'admin', '2022-03-12 07:18:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '待办事项', 2123, 3, 'task', 'project/task/index', NULL, 1, 0, 'C', '0', '0', 'project:task:list', 'clipboard', 'admin', '2022-03-12 07:19:18', 'admin', '2022-05-09 16:42:04', '任务管理菜单');
INSERT INTO `sys_menu` VALUES (2167, '任务管理查询', 2166, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:task:query', '#', 'admin', '2022-03-12 07:19:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '任务管理新增', 2166, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:task:add', '#', 'admin', '2022-03-12 07:19:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2169, '任务管理修改', 2166, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:task:edit', '#', 'admin', '2022-03-12 07:19:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2170, '任务管理删除', 2166, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:task:remove', '#', 'admin', '2022-03-12 07:19:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '任务管理导出', 2166, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:task:export', '#', 'admin', '2022-03-12 07:19:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '我发起的项目', 2123, 1, 'myProject', 'project/myProject/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2022-03-15 12:21:19', 'admin', '2022-03-15 21:33:25', '');
INSERT INTO `sys_menu` VALUES (2179, '我参与的项目', 2123, 2, 'joinedProject', 'project/joinedProject/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2022-03-15 20:19:38', 'admin', '2022-05-09 16:41:16', '');
INSERT INTO `sys_menu` VALUES (2180, '评分界面', 2123, 10, 'checkTask', 'project/task/check', '{\"projectId\": null}', 1, 0, 'C', '1', '0', '', 'bug', 'admin', '2022-03-22 13:49:48', 'admin', '2022-05-09 18:22:50', '');
INSERT INTO `sys_menu` VALUES (2181, '用户私有模板', 2123, 5, 'privateTemplate', 'project/privateTemplate/index', NULL, 1, 0, 'C', '0', '0', 'project:privateTemplate:list', 'cascader', 'admin', '2022-04-26 15:02:24', 'admin', '2022-05-09 16:42:25', '用户私有模板菜单');
INSERT INTO `sys_menu` VALUES (2182, '用户私有模板查询', 2181, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:privateTemplate:query', '#', 'admin', '2022-04-26 15:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2183, '用户私有模板新增', 2181, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:privateTemplate:add', '#', 'admin', '2022-04-26 15:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2184, '用户私有模板修改', 2181, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:privateTemplate:edit', '#', 'admin', '2022-04-26 15:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2185, '用户私有模板删除', 2181, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:privateTemplate:remove', '#', 'admin', '2022-04-26 15:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2186, '用户私有模板导出', 2181, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:privateTemplate:export', '#', 'admin', '2022-04-26 15:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2187, '操作日志', 2123, 7, 'projectOperLog', 'project/projectOperLog/index', NULL, 1, 0, 'C', '0', '0', 'project:projectOperLog:list', 'log', 'admin', '2022-04-30 04:03:41', 'admin', '2022-05-10 19:19:31', '项目管理操作日志菜单');
INSERT INTO `sys_menu` VALUES (2188, '项目管理操作日志查询', 2187, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projectOperLog:query', '#', 'admin', '2022-04-30 04:03:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2189, '项目管理操作日志新增', 2187, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projectOperLog:add', '#', 'admin', '2022-04-30 04:03:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '项目管理操作日志修改', 2187, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projectOperLog:edit', '#', 'admin', '2022-04-30 04:03:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '项目管理操作日志删除', 2187, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projectOperLog:remove', '#', 'admin', '2022-04-30 04:03:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2192, '项目管理操作日志导出', 2187, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'project:projectOperLog:export', '#', 'admin', '2022-04-30 04:03:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2193, '知识产权附件', 2104, 2, 'propertyAttachFile', 'property/propertyAttachFile/index', NULL, 1, 0, 'C', '1', '0', 'property:propertyAttachFile:list', 'edit', 'admin', '2022-04-30 04:03:53', 'admin', '2022-05-11 14:08:14', '知识产权附件菜单');
INSERT INTO `sys_menu` VALUES (2194, '知识产权附件查询', 2193, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertyAttachFile:query', '#', 'admin', '2022-04-30 04:03:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2195, '知识产权附件新增', 2193, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertyAttachFile:add', '#', 'admin', '2022-04-30 04:03:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2196, '知识产权附件修改', 2193, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertyAttachFile:edit', '#', 'admin', '2022-04-30 04:03:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2197, '知识产权附件删除', 2193, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertyAttachFile:remove', '#', 'admin', '2022-04-30 04:03:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2198, '知识产权附件导出', 2193, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'property:propertyAttachFile:export', '#', 'admin', '2022-04-30 04:03:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2199, '开发的界面', 0, 7, 'dev', NULL, NULL, 1, 0, 'M', '0', '0', '', 'bug', 'admin', '2022-07-04 11:45:48', 'admin', '2022-07-13 21:23:26', '');
INSERT INTO `sys_menu` VALUES (2201, '专家管理', 2199, 1, 'experts', 'expert/experts/experts', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2022-07-13 21:45:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2202, '项目管理', 2199, 2, 'project', 'project/projects/projects', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2022-07-13 21:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2203, '专家信息', 2199, 3, 'expertInfo', 'components/experts/expertInfo', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2022-07-13 21:48:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2204, '科技成果管理', 0, 3, 'tec', NULL, NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2023-08-14 15:47:23', 'admin', '2023-08-14 15:47:43', '');
INSERT INTO `sys_menu` VALUES (2205, '科技成果展示', 2204, 0, 'achievement', 'tec/achievement/index', NULL, 1, 0, 'C', '0', '0', '', 'education', 'admin', '2023-08-14 15:59:29', 'admin', '2023-08-15 18:18:12', '');
INSERT INTO `sys_menu` VALUES (2206, '新增科技成果', 2204, 1, 'addAchi', 'tec/achievement/addAchi', NULL, 1, 0, 'C', '0', '0', NULL, 'dict', 'admin', '2023-08-16 18:09:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-02-18 10:49:09', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-02-18 10:49:09', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1305 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (981, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":651978,\"params\":{},\"userName\":\"测试测试\",\"createTime\":1651568315576,\"passCodeId\":30}', '{\"101\":101}', 0, NULL, '2022-05-03 16:58:35');
INSERT INTO `sys_oper_log` VALUES (982, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1651568612000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"/profile/avatar/2022/03/25/28ae6f56-23ce-4819-8a53-9e524faf19e3.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1645152548000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:22:39');
INSERT INTO `sys_oper_log` VALUES (983, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"高级1中级1初级0\",\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1651627510413,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目\",\"projectId\":40}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:25:10');
INSERT INTO `sys_oper_log` VALUES (984, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"middleNum\":0,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1651627539882,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目2\",\"projectId\":41}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:25:39');
INSERT INTO `sys_oper_log` VALUES (985, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"高级1中级1初级0\",\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651627510000,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目\",\"projectId\":40}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:26:53');
INSERT INTO `sys_oper_log` VALUES (986, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"middleNum\":0,\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651627540000,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目2\",\"projectId\":41}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:26:57');
INSERT INTO `sys_oper_log` VALUES (987, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651627540000,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目2\",\"projectId\":41}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:28:56');
INSERT INTO `sys_oper_log` VALUES (988, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"高级1中级1初级0\",\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651627510000,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目\",\"projectId\":40}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:28:59');
INSERT INTO `sys_oper_log` VALUES (989, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"finishTime\":1651593600000,\"middleNum\":1,\"projectContent\":\"高级1中级1初级0\",\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1651627510000,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目\",\"projectId\":40}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:29:38');
INSERT INTO `sys_oper_log` VALUES (990, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"专家4\",\"createUserId\":117,\"finishTime\":1651593600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1651627540000,\"seniorNum\":1,\"manageUser\":\"专家4\",\"projectName\":\"专家4项目2\",\"projectId\":41}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 09:30:30');
INSERT INTO `sys_oper_log` VALUES (991, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'zhuanjia4', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 admin123', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 10:18:13');
INSERT INTO `sys_oper_log` VALUES (992, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651630755488,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"专家4项目3\",\"projectId\":42}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 10:19:15');
INSERT INTO `sys_oper_log` VALUES (993, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1651630771452,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"专家4项目4\",\"projectId\":43}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 10:19:31');
INSERT INTO `sys_oper_log` VALUES (994, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651630755000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"专家4项目3\",\"projectId\":42}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 10:21:00');
INSERT INTO `sys_oper_log` VALUES (995, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'zhuanjia5', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 admin123', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 10:33:58');
INSERT INTO `sys_oper_log` VALUES (996, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"12345\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651646475184,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"12345\",\"projectId\":44}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 14:41:15');
INSERT INTO `sys_oper_log` VALUES (997, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"middleNum\":0,\"projectContent\":\"54321\",\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1651646496862,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"54321\",\"projectId\":45}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 14:41:36');
INSERT INTO `sys_oper_log` VALUES (998, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651647070581,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"1\",\"projectId\":46}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 14:51:10');
INSERT INTO `sys_oper_log` VALUES (999, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"finishTime\":1652976000000,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"1\"}', '{\"msg\":\"已有重名项目\",\"code\":500}', 0, NULL, '2022-05-04 14:54:12');
INSERT INTO `sys_oper_log` VALUES (1000, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652976000000,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651647256305,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"2\",\"projectId\":47}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 14:54:16');
INSERT INTO `sys_oper_log` VALUES (1001, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'zhuanjia4', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/05/04/8f83ea09-c645-4c80-b3a1-b62d272e6617.jpeg\",\"code\":200}', 0, NULL, '2022-05-04 15:00:08');
INSERT INTO `sys_oper_log` VALUES (1002, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"12345\",\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651646475000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"12345\",\"projectId\":44}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 15:12:04');
INSERT INTO `sys_oper_log` VALUES (1003, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"middleNum\":0,\"projectContent\":\"54321\",\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651646497000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"54321\",\"projectId\":45}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 15:12:10');
INSERT INTO `sys_oper_log` VALUES (1004, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"projectContent\":\"12345\",\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651646475000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"12345\",\"projectId\":44}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 15:43:08');
INSERT INTO `sys_oper_log` VALUES (1005, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652976000000,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":0,\"createTime\":1651647256000,\"seniorNum\":2,\"manageUser\":\"1\",\"projectName\":\"2\",\"projectId\":47}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 17:36:57');
INSERT INTO `sys_oper_log` VALUES (1006, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaOnOff\",\"createBy\":\"admin\",\"createTime\":1645152549000,\"updateBy\":\"admin\",\"configId\":4,\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"configType\":\"Y\",\"configValue\":\"false\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-04 18:28:35');
INSERT INTO `sys_oper_log` VALUES (1007, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":744985,\"params\":{},\"userName\":\"1\",\"createTime\":1651818946983,\"passCodeId\":31}', '{\"101\":101}', 0, NULL, '2022-05-06 14:35:47');
INSERT INTO `sys_oper_log` VALUES (1008, '知识产权类型管理', 1, 'com.jb.property.controller.PropertyTypeController.add()', 'POST', 1, 'admin', NULL, '/property/type', '127.0.0.1', '内网IP', '{\"propertyTypeName\":\"期刊\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 14:37:02');
INSERT INTO `sys_oper_log` VALUES (1009, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"13167567846\",\"admin\":false,\"delFlag\":\"0\",\"loginIp\":\"\",\"email\":\"3293397109@qq.com\",\"nickName\":\"1\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"123\",\"userId\":126,\"createBy\":\"\",\"createTime\":1651819649000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 14:48:32');
INSERT INTO `sys_oper_log` VALUES (1010, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"7\",\"userStatus\":2,\"titleId\":1,\"mainProperty\":\"11111\",\"expertClassId1\":1,\"expertClassId2\":1,\"workResume\":\"11111111\",\"email\":\"3293397109@qq.com\",\"expertClassId3\":2,\"majorId\":1,\"expertStar\":3,\"nickName\":\"1\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":126,\"workPerformance\":\"11111111\",\"phoneNumber\":\"13167567846\",\"positionId\":1,\"createTime\":1651766400000,\"examineRemark\":\"信息不全\"}', '{100:\"请求成功\"}', 0, NULL, '2022-05-06 14:50:15');
INSERT INTO `sys_oper_log` VALUES (1011, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"7\",\"userStatus\":1,\"city\":\"120100\",\"titleId\":1,\"mainProperty\":\"11111\",\"expertClassId1\":1,\"expertClassId2\":1,\"workResume\":\"11111111\",\"email\":\"3293397109@qq.com\",\"expertClassId3\":2,\"area\":\"1\",\"majorId\":1,\"expertStar\":3,\"nickName\":\"1\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":126,\"workPerformance\":\"11111111\",\"phoneNumber\":\"13167567846\",\"positionId\":1,\"createTime\":1651766400000,\"examineRemark\":\"1已通过审核\"}', '{100:\"请求成功\"}', 0, NULL, '2022-05-06 14:51:28');
INSERT INTO `sys_oper_log` VALUES (1012, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, '123', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"甲方\",\"createUserId\":126,\"finishTime\":1653667200000,\"middleNum\":1,\"projectContent\":\"项目内容\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651820320171,\"seniorNum\":1,\"manageUser\":\"产品经理\",\"projectName\":\"曾思\",\"projectId\":48}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 14:58:40');
INSERT INTO `sys_oper_log` VALUES (1013, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"甲方\",\"createUserId\":126,\"finishTime\":1653667200000,\"middleNum\":1,\"projectContent\":\"项目内容\",\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"1\",\"params\":{},\"projectStatus\":2,\"createTime\":1651820320000,\"seniorNum\":1,\"manageUser\":\"产品经理\",\"projectName\":\"曾思\",\"projectId\":48}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 14:59:27');
INSERT INTO `sys_oper_log` VALUES (1014, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, '123', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"甲方\",\"createUserId\":126,\"finishTime\":1653667200000,\"middleNum\":1,\"projectContent\":\"项目内容\",\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"1\",\"params\":{},\"projectStatus\":3,\"createTime\":1651820320000,\"seniorNum\":1,\"manageUser\":\"产品经理\",\"projectName\":\"曾思\",\"projectId\":48}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 15:17:55');
INSERT INTO `sys_oper_log` VALUES (1015, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, '123', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"甲方\",\"createUserId\":126,\"finishTime\":1651766400000,\"middleNum\":1,\"projectContent\":\"项目内容\",\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"1\",\"params\":{},\"projectStatus\":5,\"createTime\":1651820320000,\"seniorNum\":1,\"manageUser\":\"产品经理\",\"projectName\":\"曾思\",\"projectId\":48}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 15:18:52');
INSERT INTO `sys_oper_log` VALUES (1016, '任务管理', 5, 'com.jb.project.controller.ProjectTaskController.export()', 'GET', 1, 'zhuanjia5', NULL, '/project/task/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"f0102de9-e16e-4fd5-81f4-189e5773b0d4_任务管理数据.xlsx\",\"code\":200}', 0, NULL, '2022-05-06 15:37:37');
INSERT INTO `sys_oper_log` VALUES (1017, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/05/06/4f5c6281-074c-44cb-9135-6699c4774f0e.jpeg\",\"code\":200}', 0, NULL, '2022-05-06 17:48:11');
INSERT INTO `sys_oper_log` VALUES (1018, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/05/06/48a28ae1-379f-48c6-b5cf-bf4fe0f310a1.jpeg\",\"code\":200}', 0, NULL, '2022-05-06 17:48:19');
INSERT INTO `sys_oper_log` VALUES (1019, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/05/06/b7c05f2a-f26d-409d-ae1d-d52875d8927f.jpeg\",\"code\":200}', 0, NULL, '2022-05-06 17:58:35');
INSERT INTO `sys_oper_log` VALUES (1020, '通行码管理', 3, 'com.jb.expert.controller.PassCodeController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/code/18', '127.0.0.1', '内网IP', '{passCodeIds=18}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 22:22:05');
INSERT INTO `sys_oper_log` VALUES (1021, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2022-05-06 22:26:28');
INSERT INTO `sys_oper_log` VALUES (1022, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653580800000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651847828661,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"2222222222\",\"projectId\":49}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 22:37:08');
INSERT INTO `sys_oper_log` VALUES (1023, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653580800000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651847829000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"2222222222\",\"projectId\":49}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 22:37:36');
INSERT INTO `sys_oper_log` VALUES (1024, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653580800000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651847829000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"2222222222\",\"projectId\":49}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 22:39:18');
INSERT INTO `sys_oper_log` VALUES (1025, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"1\",\"menuName\":\"用户私有模板\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"privateTemplate\",\"component\":\"project/privateTemplate/index\",\"children\":[],\"createTime\":1650956544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2181,\"menuType\":\"C\",\"perms\":\"project:privateTemplate:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-06 23:02:13');
INSERT INTO `sys_oper_log` VALUES (1026, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"若依\",\"createUserId\":1,\"finishTime\":1651852800000,\"middleNum\":4,\"extractionStatus\":2,\"primaryNum\":5,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":5,\"createTime\":1648175526000,\"seniorNum\":3,\"manageUser\":\"张三\",\"projectName\":\"测试项目1\",\"projectId\":32}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:01:34');
INSERT INTO `sys_oper_log` VALUES (1027, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"4\",\"createUserId\":1,\"finishTime\":1653580800000,\"middleNum\":4,\"extractionStatus\":0,\"primaryNum\":4,\"params\":{},\"projectStatus\":0,\"createTime\":1651910537934,\"seniorNum\":4,\"manageUser\":\"4\",\"projectName\":\"44444444444444444444\",\"projectId\":50}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:02:17');
INSERT INTO `sys_oper_log` VALUES (1028, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"4\",\"createUserId\":1,\"finishTime\":1653580800000,\"middleNum\":4,\"extractionStatus\":1,\"primaryNum\":4,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1651910538000,\"seniorNum\":4,\"manageUser\":\"4\",\"projectName\":\"44444444444444444444\",\"projectId\":50}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:02:32');
INSERT INTO `sys_oper_log` VALUES (1029, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"4\",\"createUserId\":1,\"finishTime\":1653580800000,\"middleNum\":4,\"extractionStatus\":2,\"primaryNum\":4,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1651910538000,\"seniorNum\":4,\"manageUser\":\"4\",\"projectName\":\"44444444444444444444\",\"projectId\":50}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:02:40');
INSERT INTO `sys_oper_log` VALUES (1030, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1653408000000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651910905076,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"5555555\",\"projectId\":51}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:08:25');
INSERT INTO `sys_oper_log` VALUES (1031, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1653408000000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1651910905000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"5555555\",\"projectId\":51}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:08:35');
INSERT INTO `sys_oper_log` VALUES (1032, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1653408000000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1651910905000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"5555555\",\"projectId\":51}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:08:41');
INSERT INTO `sys_oper_log` VALUES (1033, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1651911070058,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"专家444444444\",\"projectId\":52}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:11:10');
INSERT INTO `sys_oper_log` VALUES (1034, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651911070000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"专家444444444\",\"projectId\":52}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:11:29');
INSERT INTO `sys_oper_log` VALUES (1035, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651911070000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"专家444444444\",\"projectId\":52}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 16:12:26');
INSERT INTO `sys_oper_log` VALUES (1036, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"1\",\"menuName\":\"项目管理操作日志\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"projectOperLog\",\"component\":\"project/projectOperLog/index\",\"children\":[],\"createTime\":1651262621000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2187,\"menuType\":\"C\",\"perms\":\"project:projectOperLog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 18:13:52');
INSERT INTO `sys_oper_log` VALUES (1037, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"1\",\"menuName\":\"操作日志\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"projectOperLog\",\"component\":\"project/projectOperLog/index\",\"children\":[],\"createTime\":1651262621000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2187,\"menuType\":\"C\",\"perms\":\"project:projectOperLog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 18:14:42');
INSERT INTO `sys_oper_log` VALUES (1038, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"1\",\"menuName\":\"知识产权附件\",\"params\":{},\"parentId\":2104,\"isCache\":\"0\",\"path\":\"propertyAttachFile\",\"component\":\"property/propertyAttachFile/index\",\"children\":[],\"createTime\":1651262633000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2193,\"menuType\":\"C\",\"perms\":\"property:propertyAttachFile:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 18:15:53');
INSERT INTO `sys_oper_log` VALUES (1039, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"操作日志\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"projectOperLog\",\"component\":\"project/projectOperLog/index\",\"children\":[],\"createTime\":1651262621000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2187,\"menuType\":\"C\",\"perms\":\"project:projectOperLog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 18:16:06');
INSERT INTO `sys_oper_log` VALUES (1040, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":123456,\"params\":{},\"userName\":\"111\",\"createTime\":1651919131098,\"passCodeId\":32}', '{\"101\":101}', 0, NULL, '2022-05-07 18:25:31');
INSERT INTO `sys_oper_log` VALUES (1041, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":386137,\"params\":{},\"userName\":\"2\"}', '{\"103\":103}', 0, NULL, '2022-05-07 18:40:12');
INSERT INTO `sys_oper_log` VALUES (1042, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":386137,\"params\":{},\"userName\":\"222\",\"createTime\":1651920015360,\"passCodeId\":33}', '{\"101\":101}', 0, NULL, '2022-05-07 18:40:15');
INSERT INTO `sys_oper_log` VALUES (1043, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"middleNum\":0,\"projectContent\":\"54321\",\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651646497000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"54321\",\"projectId\":45}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 10:06:55');
INSERT INTO `sys_oper_log` VALUES (1044, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":1,\"finishTime\":1653494400000,\"middleNum\":0,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1651979082181,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"6666666\",\"projectId\":53}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 11:04:42');
INSERT INTO `sys_oper_log` VALUES (1045, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":1,\"finishTime\":1653494400000,\"middleNum\":0,\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1651979082000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"6666666\",\"projectId\":53}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 11:04:50');
INSERT INTO `sys_oper_log` VALUES (1046, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":1,\"finishTime\":1653494400000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1651979082000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"6666666\",\"projectId\":53}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 11:04:56');
INSERT INTO `sys_oper_log` VALUES (1047, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653494400000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651979687939,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"6789\",\"projectId\":54}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 11:14:47');
INSERT INTO `sys_oper_log` VALUES (1048, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653494400000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1651979688000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"6789\",\"projectId\":54}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 11:15:09');
INSERT INTO `sys_oper_log` VALUES (1049, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653494400000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1651979688000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"6789\",\"projectId\":54}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 11:15:28');
INSERT INTO `sys_oper_log` VALUES (1050, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"4\",\"userStatus\":2,\"titleId\":1,\"expertClassId1\":2,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":1,\"majorId\":1,\"expertStar\":1,\"nickName\":\"专家7\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":124,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1649347200000,\"examineRemark\":\"信息不全\"}', '{100:\"请求成功\"}', 0, NULL, '2022-05-08 15:34:21');
INSERT INTO `sys_oper_log` VALUES (1051, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":126,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:39:11');
INSERT INTO `sys_oper_log` VALUES (1052, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:39:54');
INSERT INTO `sys_oper_log` VALUES (1053, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:40:29');
INSERT INTO `sys_oper_log` VALUES (1054, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$JAkvqkL9/SaEBQ301X07AuiYX4Wl3rL8epCeuNoszjNYC9KDP0iLS\",\"updateBy\":\"admin\",\"params\":{},\"userId\":117}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:41:04');
INSERT INTO `sys_oper_log` VALUES (1055, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'zhuanjia4', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin321 admin123', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:41:42');
INSERT INTO `sys_oper_log` VALUES (1056, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:53:24');
INSERT INTO `sys_oper_log` VALUES (1057, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:56:25');
INSERT INTO `sys_oper_log` VALUES (1058, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:56:37');
INSERT INTO `sys_oper_log` VALUES (1059, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:56:45');
INSERT INTO `sys_oper_log` VALUES (1060, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 15:58:43');
INSERT INTO `sys_oper_log` VALUES (1061, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:06:25');
INSERT INTO `sys_oper_log` VALUES (1062, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:11:28');
INSERT INTO `sys_oper_log` VALUES (1063, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:18:22');
INSERT INTO `sys_oper_log` VALUES (1064, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:20:11');
INSERT INTO `sys_oper_log` VALUES (1065, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:23:04');
INSERT INTO `sys_oper_log` VALUES (1066, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:23:42');
INSERT INTO `sys_oper_log` VALUES (1067, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651998480245,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"11111\",\"projectId\":55}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:28:00');
INSERT INTO `sys_oper_log` VALUES (1068, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1651998480000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"11111\",\"projectId\":55}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:28:06');
INSERT INTO `sys_oper_log` VALUES (1069, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1651998480000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"11111\",\"projectId\":55}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:28:10');
INSERT INTO `sys_oper_log` VALUES (1070, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1653494400000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1651998557115,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"222222\",\"projectId\":56}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:29:17');
INSERT INTO `sys_oper_log` VALUES (1071, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1653494400000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1651998557000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"222222\",\"projectId\":56}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:29:23');
INSERT INTO `sys_oper_log` VALUES (1072, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1653494400000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1651998557000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"222222\",\"projectId\":56}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:29:29');
INSERT INTO `sys_oper_log` VALUES (1073, '专家属性', 3, 'com.jb.expert.controller.ProjectExpertsController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/experts/114', '127.0.0.1', '内网IP', '{userIds=114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:36:48');
INSERT INTO `sys_oper_log` VALUES (1074, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645414833000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"menuIds\":[2104,2123,2117,2118,2119,2120,2121,2122,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2148,2149,2150,2151,2152,2153,2166,2167,2168,2169,2170,2171,2178,2179,2180,2181,2182,2183,2184,2185,2186,2053],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:47:04');
INSERT INTO `sys_oper_log` VALUES (1075, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 16:59:11');
INSERT INTO `sys_oper_log` VALUES (1076, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:00:05');
INSERT INTO `sys_oper_log` VALUES (1077, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:03:58');
INSERT INTO `sys_oper_log` VALUES (1078, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:05:26');
INSERT INTO `sys_oper_log` VALUES (1079, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:10:10');
INSERT INTO `sys_oper_log` VALUES (1080, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:10:19');
INSERT INTO `sys_oper_log` VALUES (1081, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:10:27');
INSERT INTO `sys_oper_log` VALUES (1082, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-08 17:11:07');
INSERT INTO `sys_oper_log` VALUES (1083, '申请记录', 2, 'com.jb.expert.controller.ProjectUserApplyController.edit()', 'PUT', 1, 'admin', NULL, '/expert/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"examineStatus\":1,\"userId\":\"测试31\",\"applyId\":17,\"createTime\":1647100800000,\"examineUserName\":\"若依\",\"examineRemark\":\"审核员若依已通过\",\"examineUserId\":12,\"examineTime\":1647100800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 09:06:36');
INSERT INTO `sys_oper_log` VALUES (1084, '申请记录', 2, 'com.jb.expert.controller.ProjectUserApplyController.edit()', 'PUT', 1, 'admin', NULL, '/expert/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"examineStatus\":1,\"userId\":\"测试专家\",\"applyId\":19,\"createTime\":1647360000000,\"examineRemark\":\"审核员若依已通过\",\"examineUserId\":1,\"examineTime\":1647360000000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 09:06:47');
INSERT INTO `sys_oper_log` VALUES (1085, '申请记录', 2, 'com.jb.expert.controller.ProjectUserApplyController.edit()', 'PUT', 1, 'admin', NULL, '/expert/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"examineStatus\":1,\"userId\":\"测试专家\",\"applyId\":19,\"createTime\":1647360000000,\"examineUserName\":\"若依\",\"examineRemark\":\"审核员若依已通过\",\"examineUserId\":2,\"examineTime\":1647360000000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 09:06:53');
INSERT INTO `sys_oper_log` VALUES (1086, '申请记录', 2, 'com.jb.expert.controller.ProjectUserApplyController.edit()', 'PUT', 1, 'admin', NULL, '/expert/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"examineStatus\":1,\"userId\":\"测试31\",\"applyId\":17,\"createTime\":1647100800000,\"examineRemark\":\"审核员若依已通过\",\"examineUserId\":3,\"examineTime\":1647100800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 09:07:03');
INSERT INTO `sys_oper_log` VALUES (1087, '申请记录', 2, 'com.jb.expert.controller.ProjectUserApplyController.edit()', 'PUT', 1, 'admin', NULL, '/expert/apply', '127.0.0.1', '内网IP', '{\"params\":{},\"examineStatus\":1,\"userId\":\"测试专家\",\"applyId\":19,\"createTime\":1647360000000,\"examineUserName\":\"李四\",\"examineRemark\":\"审核员若依已通过\",\"examineUserId\":100,\"examineTime\":1647360000000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 09:09:55');
INSERT INTO `sys_oper_log` VALUES (1088, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1651979688000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"6789\",\"projectId\":52}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:04:04');
INSERT INTO `sys_oper_log` VALUES (1089, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652061999751,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"888\",\"projectId\":57}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:06:39');
INSERT INTO `sys_oper_log` VALUES (1090, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652062000000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"888\",\"projectId\":57}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:07:10');
INSERT INTO `sys_oper_log` VALUES (1091, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652062000000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"888\",\"projectId\":57}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:07:57');
INSERT INTO `sys_oper_log` VALUES (1092, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062000000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"888\",\"projectId\":57}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:09:36');
INSERT INTO `sys_oper_log` VALUES (1093, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"middleNum\":0,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1652062588391,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:16:28');
INSERT INTO `sys_oper_log` VALUES (1094, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"middleNum\":0,\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:16:54');
INSERT INTO `sys_oper_log` VALUES (1095, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:17:11');
INSERT INTO `sys_oper_log` VALUES (1096, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:17:42');
INSERT INTO `sys_oper_log` VALUES (1097, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:33:51');
INSERT INTO `sys_oper_log` VALUES (1098, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\r\n### The error may exist in file [C:\\bs\\gb-project\\target\\classes\\mapper\\project\\ProjectTaskMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update project_task set project_task_status = 2         where project_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'', '2022-05-09 10:39:05');
INSERT INTO `sys_oper_log` VALUES (1099, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\r\n### The error may exist in file [C:\\bs\\gb-project\\target\\classes\\mapper\\project\\ProjectTaskMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update project_task set project_task_status = 2         where project_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'', '2022-05-09 10:39:19');
INSERT INTO `sys_oper_log` VALUES (1100, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\r\n### The error may exist in file [C:\\bs\\gb-project\\target\\classes\\mapper\\project\\ProjectTaskMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update project_task set project_task_status = 2         where project_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'', '2022-05-09 10:40:02');
INSERT INTO `sys_oper_log` VALUES (1101, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\r\n### The error may exist in file [C:\\bs\\gb-project\\target\\classes\\mapper\\project\\ProjectTaskMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update project_task set project_task_status = 2         where project_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'', '2022-05-09 10:47:49');
INSERT INTO `sys_oper_log` VALUES (1102, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\r\n### The error may exist in file [C:\\bs\\gb-project\\target\\classes\\mapper\\project\\ProjectTaskMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update project_task set project_task_status = 2         where project_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'project_task_status\' in \'field list\'', '2022-05-09 10:49:01');
INSERT INTO `sys_oper_log` VALUES (1103, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"0\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":0,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652062588000,\"seniorNum\":1,\"manageUser\":\"0\",\"projectName\":\"1\",\"projectId\":58}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:49:31');
INSERT INTO `sys_oper_log` VALUES (1104, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652064668103,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"777777\",\"projectId\":59}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:51:08');
INSERT INTO `sys_oper_log` VALUES (1105, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652064702342,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"00000\",\"projectId\":60}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:51:42');
INSERT INTO `sys_oper_log` VALUES (1106, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652064668000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"777777\",\"projectId\":59}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:51:58');
INSERT INTO `sys_oper_log` VALUES (1107, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652064702000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"00000\",\"projectId\":60}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:52:01');
INSERT INTO `sys_oper_log` VALUES (1108, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652064668000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"777777\",\"projectId\":59}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:52:20');
INSERT INTO `sys_oper_log` VALUES (1109, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652064702000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"00000\",\"projectId\":60}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:52:26');
INSERT INTO `sys_oper_log` VALUES (1110, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652064702000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"00000\",\"projectId\":60}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:54:18');
INSERT INTO `sys_oper_log` VALUES (1111, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652064668000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"777777\",\"projectId\":59}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 10:54:51');
INSERT INTO `sys_oper_log` VALUES (1112, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652066733657,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"12333\",\"projectId\":61}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 11:25:33');
INSERT INTO `sys_oper_log` VALUES (1113, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652064668000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"777777\",\"projectId\":59}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 11:29:59');
INSERT INTO `sys_oper_log` VALUES (1114, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652080323882,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"987\",\"projectId\":62}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 15:12:03');
INSERT INTO `sys_oper_log` VALUES (1115, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652080324000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"987\",\"projectId\":62}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 15:12:36');
INSERT INTO `sys_oper_log` VALUES (1116, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652064702000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"00000\",\"projectId\":60}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:05:21');
INSERT INTO `sys_oper_log` VALUES (1117, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652080324000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"987\",\"projectId\":62}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:09:26');
INSERT INTO `sys_oper_log` VALUES (1118, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652080324000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"987\",\"projectId\":62}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:11:26');
INSERT INTO `sys_oper_log` VALUES (1119, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652083944349,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"agrgearg\",\"projectId\":63}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:12:24');
INSERT INTO `sys_oper_log` VALUES (1120, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652083944000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"agrgearg\",\"projectId\":63}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:12:52');
INSERT INTO `sys_oper_log` VALUES (1121, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652083944000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"agrgearg\",\"projectId\":63}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:13:53');
INSERT INTO `sys_oper_log` VALUES (1122, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1652025600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":5,\"createTime\":1652083944000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"agrgearg\",\"projectId\":63}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:15:54');
INSERT INTO `sys_oper_log` VALUES (1123, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [2,3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:16:48');
INSERT INTO `sys_oper_log` VALUES (1124, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '114 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:16:54');
INSERT INTO `sys_oper_log` VALUES (1125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"nested\",\"orderNum\":\"2\",\"menuName\":\"知识产权管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"property\",\"children\":[],\"createTime\":1646445375000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2104,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:37:22');
INSERT INTO `sys_oper_log` VALUES (1126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"3\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1645152548000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:37:40');
INSERT INTO `sys_oper_log` VALUES (1127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":\"4\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1645152548000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:37:46');
INSERT INTO `sys_oper_log` VALUES (1128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"5\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1645152548000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:37:58');
INSERT INTO `sys_oper_log` VALUES (1129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"lock\",\"orderNum\":\"2\",\"menuName\":\"账号管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1645152548000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:38:27');
INSERT INTO `sys_oper_log` VALUES (1130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"search\",\"orderNum\":\"3\",\"menuName\":\"申请记录\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"apply\",\"component\":\"expert/apply/index\",\"children\":[],\"createTime\":1645363166000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2040,\"menuType\":\"C\",\"perms\":\"expert:apply:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:38:35');
INSERT INTO `sys_oper_log` VALUES (1131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"6\",\"menuName\":\"专职管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"type\",\"children\":[],\"createTime\":1645363927000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2046,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:38:44');
INSERT INTO `sys_oper_log` VALUES (1132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"自评互评任务\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:39:25');
INSERT INTO `sys_oper_log` VALUES (1133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"自评互评任务\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:40:27');
INSERT INTO `sys_oper_log` VALUES (1134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"0\",\"menuName\":\"项目列表\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"projects\",\"component\":\"project/projects/index\",\"children\":[],\"createTime\":1647040712000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2130,\"menuType\":\"C\",\"perms\":\"project:projects:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:40:41');
INSERT INTO `sys_oper_log` VALUES (1135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"2\",\"menuName\":\"我参与的项目\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"joinedProject\",\"component\":\"project/joinedProject/index\",\"children\":[],\"createTime\":1647346778000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2179,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:41:16');
INSERT INTO `sys_oper_log` VALUES (1136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"clipboard\",\"orderNum\":\"10\",\"menuName\":\"制定任务书任务\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"bookTask\",\"component\":\"project/bookTask/index\",\"children\":[],\"createTime\":1647040727000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2136,\"menuType\":\"M\",\"perms\":\"project:bookTask:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:41:38');
INSERT INTO `sys_oper_log` VALUES (1137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"clipboard\",\"orderNum\":\"10\",\"menuName\":\"自评互评任务\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:41:44');
INSERT INTO `sys_oper_log` VALUES (1138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"3\",\"menuName\":\"待办事项\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"task\",\"component\":\"project/task/index\",\"children\":[],\"createTime\":1647040758000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2166,\"menuType\":\"C\",\"perms\":\"project:task:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:42:04');
INSERT INTO `sys_oper_log` VALUES (1139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"模板管理\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"template\",\"component\":\"project/template/index\",\"children\":[],\"createTime\":1647040703000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2124,\"menuType\":\"C\",\"perms\":\"project:template:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:42:19');
INSERT INTO `sys_oper_log` VALUES (1140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"5\",\"menuName\":\"用户私有模板\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"privateTemplate\",\"component\":\"project/privateTemplate/index\",\"children\":[],\"createTime\":1650956544000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2181,\"menuType\":\"C\",\"perms\":\"project:privateTemplate:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:42:25');
INSERT INTO `sys_oper_log` VALUES (1141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"{\\\"projectId\\\": null}\",\"icon\":\"bug\",\"orderNum\":\"10\",\"menuName\":\"评分界面\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"checkTask\",\"component\":\"project/task/check\",\"children\":[],\"createTime\":1647928188000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2180,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:42:36');
INSERT INTO `sys_oper_log` VALUES (1142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"6\",\"menuName\":\"操作日志\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"projectOperLog\",\"component\":\"project/projectOperLog/index\",\"children\":[],\"createTime\":1651262621000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2187,\"menuType\":\"C\",\"perms\":\"project:projectOperLog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:42:51');
INSERT INTO `sys_oper_log` VALUES (1143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"0\",\"menuName\":\"知识产权类型管理\",\"params\":{},\"parentId\":2104,\"isCache\":\"0\",\"path\":\"type\",\"component\":\"property/type/index\",\"children\":[],\"createTime\":1646445755000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2111,\"menuType\":\"C\",\"perms\":\"property:type:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:43:18');
INSERT INTO `sys_oper_log` VALUES (1144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"2\",\"menuName\":\"知识产权附件\",\"params\":{},\"parentId\":2104,\"isCache\":\"0\",\"path\":\"propertyAttachFile\",\"component\":\"property/propertyAttachFile/index\",\"children\":[],\"createTime\":1651262633000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2193,\"menuType\":\"C\",\"perms\":\"property:propertyAttachFile:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:43:25');
INSERT INTO `sys_oper_log` VALUES (1145, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645414833000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"menuIds\":[2123,2124,2104,2130,2131,2132,2133,2134,2135,2178,2179,2166,2167,2168,2169,2170,2171,2125,2181,2182,2183,2184,2185,2186,2136,2137,2138,2139,2140,2141,2148,2149,2150,2151,2152,2153,2180,2117,2118,2119,2120,2121,2122,2053],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:46:06');
INSERT INTO `sys_oper_log` VALUES (1146, '用户私有模板', 3, 'com.jb.project.controller.ExpertTemplateController.remove()', 'DELETE', 1, 'zhuanjia4', NULL, '/project/privateTemplate/12', '127.0.0.1', '内网IP', '{templateIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 16:46:35');
INSERT INTO `sys_oper_log` VALUES (1147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"{\\\"projectId\\\": null}\",\"icon\":\"bug\",\"orderNum\":\"10\",\"menuName\":\"评分界面\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"checkTask\",\"component\":\"project/task/check\",\"children\":[],\"createTime\":1647928188000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2180,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 18:22:18');
INSERT INTO `sys_oper_log` VALUES (1148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"{\\\"projectId\\\": null}\",\"icon\":\"bug\",\"orderNum\":\"10\",\"menuName\":\"评分界面\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"checkTask\",\"component\":\"project/task/check\",\"children\":[],\"createTime\":1647928188000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2180,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 18:22:50');
INSERT INTO `sys_oper_log` VALUES (1149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"10\",\"menuName\":\"自评互评任务\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 18:22:59');
INSERT INTO `sys_oper_log` VALUES (1150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"10\",\"menuName\":\"自评互评管理\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-10 19:19:04');
INSERT INTO `sys_oper_log` VALUES (1151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"6\",\"menuName\":\"自评互评管理\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-10 19:19:24');
INSERT INTO `sys_oper_log` VALUES (1152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"7\",\"menuName\":\"操作日志\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"projectOperLog\",\"component\":\"project/projectOperLog/index\",\"children\":[],\"createTime\":1651262621000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2187,\"menuType\":\"C\",\"perms\":\"project:projectOperLog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-10 19:19:31');
INSERT INTO `sys_oper_log` VALUES (1153, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645414833000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"menuIds\":[2123,2124,2104,2130,2131,2132,2133,2134,2135,2178,2179,2166,2167,2168,2169,2170,2171,2125,2181,2182,2183,2184,2185,2186,2136,2137,2138,2139,2140,2141,2180,2117,2118,2119,2120,2121,2122,2053],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-10 19:21:17');
INSERT INTO `sys_oper_log` VALUES (1154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"6\",\"menuName\":\"自评互评查询\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-10 19:31:40');
INSERT INTO `sys_oper_log` VALUES (1155, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":711823,\"params\":{},\"userName\":\"333\",\"createTime\":1652238620016,\"passCodeId\":34}', '{\"101\":101}', 0, NULL, '2022-05-11 11:10:20');
INSERT INTO `sys_oper_log` VALUES (1156, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652239156216,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"测试测试\",\"projectId\":64}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 11:19:16');
INSERT INTO `sys_oper_log` VALUES (1157, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":2,\"createTime\":1652239156000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"测试测试\",\"projectId\":64}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 11:20:24');
INSERT INTO `sys_oper_log` VALUES (1158, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhuanjia4', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":117,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"专家4\",\"params\":{},\"projectStatus\":3,\"createTime\":1652239156000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"测试测试\",\"projectId\":64}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 11:22:05');
INSERT INTO `sys_oper_log` VALUES (1159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"edit\",\"orderNum\":\"2\",\"menuName\":\"知识产权附件\",\"params\":{},\"parentId\":2104,\"isCache\":\"0\",\"path\":\"propertyAttachFile\",\"component\":\"property/propertyAttachFile/index\",\"children\":[],\"createTime\":1651262633000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2193,\"menuType\":\"C\",\"perms\":\"property:propertyAttachFile:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 14:08:14');
INSERT INTO `sys_oper_log` VALUES (1160, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652250636444,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"56666\",\"projectId\":65}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 14:30:36');
INSERT INTO `sys_oper_log` VALUES (1161, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1652250636000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"56666\",\"projectId\":65}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 14:30:51');
INSERT INTO `sys_oper_log` VALUES (1162, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1652250636000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"56666\",\"projectId\":65}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-11 14:31:09');
INSERT INTO `sys_oper_log` VALUES (1163, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"xxx公司\",\"createUserId\":1,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652514391053,\"seniorNum\":1,\"manageUser\":\"张三\",\"projectName\":\"技术难点突破\",\"projectId\":66}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-14 15:46:31');
INSERT INTO `sys_oper_log` VALUES (1164, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"xxx公司\",\"createUserId\":1,\"finishTime\":1653926400000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1652514391000,\"seniorNum\":1,\"manageUser\":\"张三\",\"projectName\":\"技术难点突破\",\"projectId\":66}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-14 15:46:36');
INSERT INTO `sys_oper_log` VALUES (1165, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1652112000000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1652634347356,\"seniorNum\":1,\"manageUser\":\"1111\",\"projectName\":\"测试项目2\",\"projectId\":67}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-16 01:05:47');
INSERT INTO `sys_oper_log` VALUES (1166, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1652112000000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":2,\"createTime\":1652634347000,\"seniorNum\":1,\"manageUser\":\"1111\",\"projectName\":\"测试项目2\",\"projectId\":67}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-16 01:05:53');
INSERT INTO `sys_oper_log` VALUES (1167, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1652112000000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"若依\",\"params\":{},\"projectStatus\":3,\"createTime\":1652634347000,\"seniorNum\":1,\"manageUser\":\"1111\",\"projectName\":\"测试项目2\",\"projectId\":67}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-16 01:06:08');
INSERT INTO `sys_oper_log` VALUES (1168, '专家属性', 3, 'com.jb.expert.controller.ProjectExpertsController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/experts/115', '127.0.0.1', '内网IP', '{userIds=115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-22 18:30:35');
INSERT INTO `sys_oper_log` VALUES (1169, '项目管理操作日志', 3, 'com.jb.project.controller.ProjectOperationLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/projectOperLog/111,112,113,114,115,116,117,118,119,120', '127.0.0.1', '内网IP', '{logIds=111,112,113,114,115,116,117,118,119,120}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:46:21');
INSERT INTO `sys_oper_log` VALUES (1170, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"finishTime\":1652112000000,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"1\"}', '{\"msg\":\"已有重名项目\",\"code\":500}', 0, NULL, '2022-05-31 13:48:44');
INSERT INTO `sys_oper_log` VALUES (1171, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"finishTime\":1652112000000,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"1\"}', '{\"msg\":\"已有重名项目\",\"code\":500}', 0, NULL, '2022-05-31 13:48:51');
INSERT INTO `sys_oper_log` VALUES (1172, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operTime\":1652716800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:51:31');
INSERT INTO `sys_oper_log` VALUES (1173, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operTime\":1652716800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:51:31');
INSERT INTO `sys_oper_log` VALUES (1174, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operTime\":1652716800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:51:31');
INSERT INTO `sys_oper_log` VALUES (1175, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operTime\":1652716800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:51:31');
INSERT INTO `sys_oper_log` VALUES (1176, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operTime\":1652716800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:51:31');
INSERT INTO `sys_oper_log` VALUES (1177, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operTime\":1652716800000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:51:31');
INSERT INTO `sys_oper_log` VALUES (1178, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"operSubjectId\":1,\"params\":{},\"operTime\":1651593600000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:52:28');
INSERT INTO `sys_oper_log` VALUES (1179, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"remark\":\"1\",\"operSubjectId\":1,\"params\":{},\"operPage\":\"1\",\"operTime\":1652112000000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:53:31');
INSERT INTO `sys_oper_log` VALUES (1180, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"operSubjectId\":1,\"params\":{},\"operTime\":1651507200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:54:15');
INSERT INTO `sys_oper_log` VALUES (1181, '项目管理操作日志', 1, 'com.jb.project.controller.ProjectOperationLogController.add()', 'POST', 1, 'admin', NULL, '/project/projectOperLog', '127.0.0.1', '内网IP', '{\"operUserId\":1,\"operSubjectId\":1,\"params\":{},\"operTime\":1651507200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:54:19');
INSERT INTO `sys_oper_log` VALUES (1182, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":1,\"finishTime\":1651420800000,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1653976478335,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"12\",\"projectId\":68}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 13:54:38');
INSERT INTO `sys_oper_log` VALUES (1183, '项目管理操作日志', 3, 'com.jb.project.controller.ProjectOperationLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/projectOperLog/192', '127.0.0.1', '内网IP', '{logIds=192}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 14:00:11');
INSERT INTO `sys_oper_log` VALUES (1184, '项目管理操作日志', 3, 'com.jb.project.controller.ProjectOperationLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/projectOperLog/191,193,194', '127.0.0.1', '内网IP', '{logIds=191,193,194}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 14:00:16');
INSERT INTO `sys_oper_log` VALUES (1185, '项目管理操作日志', 3, 'com.jb.project.controller.ProjectOperationLogController.remove()', 'DELETE', 1, 'admin', NULL, '/project/projectOperLog/185,186,187,188,189,190', '127.0.0.1', '内网IP', '{logIds=185,186,187,188,189,190}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 14:00:25');
INSERT INTO `sys_oper_log` VALUES (1186, '专家属性', 3, 'com.jb.expert.controller.ProjectExpertsController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/experts/129', '127.0.0.1', '内网IP', '{userIds=129}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:08:11');
INSERT INTO `sys_oper_log` VALUES (1187, '专家属性', 3, 'com.jb.expert.controller.ProjectExpertsController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/experts/117,118,123,124,126', '127.0.0.1', '内网IP', '{userIds=117,118,123,124,126}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:08:21');
INSERT INTO `sys_oper_log` VALUES (1188, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/114,115,116,117,118,123,124,125,126', '127.0.0.1', '内网IP', '{userIds=114,115,116,117,118,123,124,125,126}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:08:38');
INSERT INTO `sys_oper_log` VALUES (1189, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/127,128,129', '127.0.0.1', '内网IP', '{userIds=127,128,129}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:08:45');
INSERT INTO `sys_oper_log` VALUES (1190, '通行码管理', 3, 'com.jb.expert.controller.PassCodeController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/code/32,19,20,21,22,23,28,29,30,31', '127.0.0.1', '内网IP', '{passCodeIds=32,19,20,21,22,23,28,29,30,31}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:09:09');
INSERT INTO `sys_oper_log` VALUES (1191, '通行码管理', 3, 'com.jb.expert.controller.PassCodeController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/code/33,34', '127.0.0.1', '内网IP', '{passCodeIds=33,34}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:09:12');
INSERT INTO `sys_oper_log` VALUES (1192, '模板管理', 3, 'com.jb.project.controller.TaskTemplateController.remove()', 'DELETE', 1, 'admin', NULL, '/project/template/2,3,4,9,10', '127.0.0.1', '内网IP', '{templateIds=2,3,4,9,10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:13:27');
INSERT INTO `sys_oper_log` VALUES (1193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"6\",\"menuName\":\"自评互评查询\",\"params\":{},\"parentId\":2123,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"project/check/index\",\"children\":[],\"createTime\":1647040738000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"C\",\"perms\":\"project:check:list\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-11 12:18:57');
INSERT INTO `sys_oper_log` VALUES (1194, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":528918,\"params\":{},\"userName\":\"张翔\",\"createTime\":1655257335260,\"passCodeId\":35}', '{\"101\":101}', 0, NULL, '2022-06-15 09:42:15');
INSERT INTO `sys_oper_log` VALUES (1195, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"7\",\"menuName\":\"用户界面\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"user\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-04 11:45:48');
INSERT INTO `sys_oper_log` VALUES (1196, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"导航栏\",\"params\":{},\"parentId\":2199,\"isCache\":\"0\",\"path\":\"header\",\"component\":\"user/util/header\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-04 11:46:35');
INSERT INTO `sys_oper_log` VALUES (1197, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"1\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":1,\"email\":\"\",\"expertClassId3\":1,\"majorId\":1,\"expertStar\":3,\"nickName\":\"张翔\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":130,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000,\"examineRemark\":\"张翔已通过审核\"}', '{100:\"请求成功\"}', 0, NULL, '2022-07-05 02:52:36');
INSERT INTO `sys_oper_log` VALUES (1198, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645414833000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"menuIds\":[2123,2104,2130,2131,2132,2133,2134,2135,2178,2179,2166,2167,2168,2169,2170,2171,2181,2182,2183,2184,2185,2186,2136,2137,2138,2139,2140,2141,2180,2117,2118,2119,2120,2121,2122,2053],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 02:55:59');
INSERT INTO `sys_oper_log` VALUES (1199, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":876268,\"params\":{},\"userName\":\"zhangsan\",\"createTime\":1656961917072,\"passCodeId\":36}', '{\"101\":101}', 0, NULL, '2022-07-05 03:11:57');
INSERT INTO `sys_oper_log` VALUES (1200, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"1\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":2,\"majorId\":1,\"expertStar\":3,\"nickName\":\"zhangsan\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":131,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000,\"examineRemark\":\"zhangsan已通过审核\"}', '{100:\"请求成功\"}', 0, NULL, '2022-07-05 03:13:24');
INSERT INTO `sys_oper_log` VALUES (1201, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":185677,\"params\":{},\"userName\":\"李四\",\"createTime\":1656962327250,\"passCodeId\":37}', '{\"101\":101}', 0, NULL, '2022-07-05 03:18:47');
INSERT INTO `sys_oper_log` VALUES (1202, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"5\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":3,\"majorId\":1,\"expertStar\":3,\"nickName\":\"李四\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":132,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000,\"examineRemark\":\"李四已通过审核\"}', '{100:\"请求成功\"}', 0, NULL, '2022-07-05 03:20:48');
INSERT INTO `sys_oper_log` VALUES (1203, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.edit()', 'PUT', 1, 'admin', NULL, '/expert/experts', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"1\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":2,\"majorId\":1,\"expertStar\":3,\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":131,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:20:58');
INSERT INTO `sys_oper_log` VALUES (1204, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1656962714000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":131,\"createBy\":\"\",\"roleIds\":[2,3],\"createTime\":1656961953000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:26:30');
INSERT INTO `sys_oper_log` VALUES (1205, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhangsan', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":131,\"finishTime\":1659196800000,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1656963132026,\"seniorNum\":1,\"manageUser\":\"张三\",\"projectName\":\"电力设备维护\",\"projectId\":69}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:32:12');
INSERT INTO `sys_oper_log` VALUES (1206, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":131,\"finishTime\":1659196800000,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"张三\",\"params\":{},\"projectStatus\":2,\"createTime\":1656963132000,\"seniorNum\":1,\"manageUser\":\"张三\",\"projectName\":\"电力设备维护\",\"projectId\":69}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:32:50');
INSERT INTO `sys_oper_log` VALUES (1207, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.edit()', 'PUT', 1, 'admin', NULL, '/expert/experts', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"1\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":2,\"majorId\":1,\"expertStar\":1,\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":131,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:34:29');
INSERT INTO `sys_oper_log` VALUES (1208, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.edit()', 'PUT', 1, 'admin', NULL, '/expert/experts', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"1\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":1,\"email\":\"\",\"expertClassId3\":1,\"majorId\":1,\"expertStar\":2,\"nickName\":\"张翔\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":130,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:34:34');
INSERT INTO `sys_oper_log` VALUES (1209, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhangsan', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":131,\"finishTime\":1659196800000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"张三\",\"params\":{},\"projectStatus\":3,\"createTime\":1656963132000,\"seniorNum\":1,\"manageUser\":\"张三\",\"projectName\":\"电力设备维护\",\"projectId\":69}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:37:35');
INSERT INTO `sys_oper_log` VALUES (1210, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1656962714000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":131,\"createBy\":\"\",\"roleIds\":[2,3],\"createTime\":1656961953000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:51:15');
INSERT INTO `sys_oper_log` VALUES (1211, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1656962707000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张翔\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zx\",\"userId\":130,\"createBy\":\"\",\"roleIds\":[2,3],\"createTime\":1655257377000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:51:32');
INSERT INTO `sys_oper_log` VALUES (1212, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.edit()', 'PUT', 1, 'admin', NULL, '/expert/experts', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"1\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":2,\"majorId\":1,\"expertStar\":3,\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":131,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1656950400000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:51:54');
INSERT INTO `sys_oper_log` VALUES (1213, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1656962714000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":131,\"createBy\":\"\",\"roleIds\":[2,3],\"createTime\":1656961953000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:52:09');
INSERT INTO `sys_oper_log` VALUES (1214, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1656962714000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":131,\"createBy\":\"\",\"roleIds\":[2,3],\"createTime\":1656961953000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 03:52:10');
INSERT INTO `sys_oper_log` VALUES (1215, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"bug\",\"orderNum\":\"7\",\"menuName\":\"用户界面\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"user\",\"children\":[],\"createTime\":1656906348000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2199,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-05 09:30:48');
INSERT INTO `sys_oper_log` VALUES (1216, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhangsan', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":131,\"finishTime\":1657036800000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"张三\",\"params\":{},\"projectStatus\":5,\"createTime\":1656963132000,\"seniorNum\":1,\"manageUser\":\"张三\",\"projectName\":\"电力设备维护\",\"projectId\":69}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-06 18:59:51');
INSERT INTO `sys_oper_log` VALUES (1217, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"expert\",\"roleName\":\"专家\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1657104816000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":131,\"createBy\":\"\",\"roleIds\":[2],\"createTime\":1656961953000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 10:54:38');
INSERT INTO `sys_oper_log` VALUES (1218, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"loginDate\":1657104816000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"dept\":{\"deptName\":\"部门待分配\",\"deptId\":1,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":131,\"createBy\":\"\",\"roleIds\":[2,3],\"createTime\":1656961953000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 10:54:48');
INSERT INTO `sys_oper_log` VALUES (1219, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"主框架页-默认皮肤样式名称\",\"configKey\":\"sys.index.skinName\",\"createBy\":\"admin\",\"createTime\":1645152549000,\"updateBy\":\"admin\",\"configId\":1,\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 16:11:59');
INSERT INTO `sys_oper_log` VALUES (1220, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 16:12:16');
INSERT INTO `sys_oper_log` VALUES (1221, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"主框架页-默认皮肤样式名称\",\"configKey\":\"sys.index.skinName\",\"createBy\":\"admin\",\"createTime\":1645152549000,\"updateBy\":\"admin\",\"configId\":1,\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateTime\":1657181519000,\"configType\":\"Y\",\"configValue\":\"skin-blue\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 16:12:36');
INSERT INTO `sys_oper_log` VALUES (1222, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 16:12:55');
INSERT INTO `sys_oper_log` VALUES (1223, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1657178287000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"管理员\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"/profile/avatar/2022/05/06/b7c05f2a-f26d-409d-ae1d-d52875d8927f.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1645152548000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-07 16:25:40');
INSERT INTO `sys_oper_log` VALUES (1224, '专家属性', 5, 'com.jb.expert.controller.ProjectExpertsController.export()', 'GET', 1, 'admin', NULL, '/expert/experts/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ee46d316-39c6-4639-a131-a6a170ebbc02_专家属性数据.xlsx\",\"code\":200}', 0, NULL, '2022-07-08 15:41:39');
INSERT INTO `sys_oper_log` VALUES (1225, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":443753,\"params\":{},\"userName\":\"郝务一\",\"createTime\":1657281930609,\"passCodeId\":38}', '{\"101\":101}', 0, NULL, '2022-07-08 20:05:30');
INSERT INTO `sys_oper_log` VALUES (1226, '通行码管理', 2, 'com.jb.expert.controller.PassCodeController.edit()', 'PUT', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":443754,\"params\":{},\"userName\":\"郝务一\",\"codeStatus\":\"0\",\"createTime\":1657209600000,\"passCodeId\":38}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:05:48');
INSERT INTO `sys_oper_log` VALUES (1227, '通行码管理', 5, 'com.jb.expert.controller.PassCodeController.export()', 'GET', 1, 'admin', NULL, '/expert/code/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"50423bb5-99de-43e6-8e6f-d6a0b44e04fd_通行码管理数据.xlsx\",\"code\":200}', 0, NULL, '2022-07-08 20:06:01');
INSERT INTO `sys_oper_log` VALUES (1228, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zx', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":130,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1657282065736,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"1\",\"projectId\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:07:45');
INSERT INTO `sys_oper_log` VALUES (1229, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":130,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":1,\"createTime\":1657282066000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"1\",\"projectId\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:08:39');
INSERT INTO `sys_oper_log` VALUES (1230, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zx', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":130,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":0,\"primaryNum\":1,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":0,\"createTime\":1657282066000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"121312\",\"projectId\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:08:55');
INSERT INTO `sys_oper_log` VALUES (1231, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":130,\"middleNum\":1,\"projectContent\":\"1\",\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":2,\"createTime\":1657282066000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"121312\",\"projectId\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:09:07');
INSERT INTO `sys_oper_log` VALUES (1232, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"6\",\"userStatus\":2,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":1,\"email\":\"\",\"expertClassId3\":3,\"majorId\":1,\"expertStar\":3,\"nickName\":\"郝务一\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":133,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1657209600000,\"examineRemark\":\"信息不全\"}', '{100:\"请求成功\"}', 0, NULL, '2022-07-08 20:18:19');
INSERT INTO `sys_oper_log` VALUES (1233, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"graduateSchool\":\"山东建筑大学\",\"education\":\"6\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":1,\"email\":\"\",\"expertClassId3\":3,\"majorId\":1,\"expertStar\":3,\"nickName\":\"郝务一\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":133,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1657209600000,\"examineRemark\":\"郝务一已通过审核\"}', '{100:\"请求成功\"}', 0, NULL, '2022-07-08 20:19:09');
INSERT INTO `sys_oper_log` VALUES (1234, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'haowuyi', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"xxx\",\"createUserId\":133,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1657282847542,\"seniorNum\":1,\"manageUser\":\"xxx\",\"projectName\":\"项目团队建设\",\"projectId\":71}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:20:47');
INSERT INTO `sys_oper_log` VALUES (1235, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"xxx\",\"createUserId\":133,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"郝务一\",\"params\":{},\"projectStatus\":2,\"createTime\":1657282848000,\"seniorNum\":1,\"manageUser\":\"xxx\",\"projectName\":\"项目团队建设\",\"projectId\":71}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:21:08');
INSERT INTO `sys_oper_log` VALUES (1236, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'haowuyi', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"xxx\",\"createUserId\":133,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"郝务一\",\"params\":{},\"projectStatus\":3,\"createTime\":1657282848000,\"seniorNum\":1,\"manageUser\":\"xxx\",\"projectName\":\"项目团队建设\",\"projectId\":71}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:23:31');
INSERT INTO `sys_oper_log` VALUES (1237, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'haowuyi', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"xxx\",\"createUserId\":133,\"finishTime\":1657209600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"郝务一\",\"params\":{},\"projectStatus\":5,\"createTime\":1657282848000,\"seniorNum\":1,\"manageUser\":\"xxx\",\"projectName\":\"项目团队建设\",\"projectId\":71}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:27:40');
INSERT INTO `sys_oper_log` VALUES (1238, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'haowuyi', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":133,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":0,\"params\":{},\"projectStatus\":0,\"createTime\":1657283287922,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"任务书任务项目展示\",\"projectId\":72}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:28:07');
INSERT INTO `sys_oper_log` VALUES (1239, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":133,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":0,\"createUserName\":\"郝务一\",\"params\":{},\"projectStatus\":2,\"createTime\":1657283288000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"任务书任务项目展示\",\"projectId\":72}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:28:18');
INSERT INTO `sys_oper_log` VALUES (1240, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'haowuyi', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":133,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"郝务一\",\"params\":{},\"projectStatus\":3,\"createTime\":1657283288000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"任务书任务项目展示\",\"projectId\":72}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:29:05');
INSERT INTO `sys_oper_log` VALUES (1241, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'haowuyi', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":133,\"finishTime\":1657209600000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":0,\"createUserName\":\"郝务一\",\"params\":{},\"projectStatus\":5,\"createTime\":1657283288000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"任务书任务项目展示\",\"projectId\":72}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:32:40');
INSERT INTO `sys_oper_log` VALUES (1242, '知识产权', 1, 'com.jb.property.controller.ProjectPropertyController.add()', 'POST', 1, 'haowuyi', NULL, '/property/propertys', '127.0.0.1', '内网IP', '{\"propertyId\":null,\"propertyName\":\"项目开发\",\"projectName\":\"冀北配网系统\",\"propertyType\":1,\"publisher\":\"xx出版社\",\"periodical\":\"xx期刊\",\"createTime\":null,\"finishTime\":\"2022-07-01\",\"fareStatus\":null,\"auth\":null,\"propertyWorker\":[{\"userNickName\":\"郝务一\",\"propertyId\":null,\"userId\":null},{\"userNickName\":\"张翔\",\"propertyId\":null,\"userId\":null},{\"userNickName\":\"陈金川\",\"propertyId\":null,\"userId\":null},{\"userNickName\":\"孟维昊\",\"propertyId\":null,\"userId\":null},{\"userNickName\":\"孙晓庆\",\"propertyId\":null,\"userId\":null}]}', '{\"msg\":\"知识产权添加完成\",\"code\":200}', 0, NULL, '2022-07-08 20:36:12');
INSERT INTO `sys_oper_log` VALUES (1243, '知识产权附件', 3, 'com.jb.property.controller.PropertyAttachFileController.remove()', 'DELETE', 1, 'haowuyi', NULL, '/property/propertyAttachFile/1', '127.0.0.1', '内网IP', '{fileIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-08 20:37:20');
INSERT INTO `sys_oper_log` VALUES (1244, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/130', '127.0.0.1', '内网IP', '{userIds=130}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 02:15:28');
INSERT INTO `sys_oper_log` VALUES (1245, '专家属性', 3, 'com.jb.expert.controller.ProjectExpertsController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/experts/130', '127.0.0.1', '内网IP', '{userIds=130}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 02:15:47');
INSERT INTO `sys_oper_log` VALUES (1246, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":835444,\"params\":{},\"userName\":\"张翔\"}', '{\"103\":103}', 0, NULL, '2022-07-10 02:15:55');
INSERT INTO `sys_oper_log` VALUES (1247, '通行码管理', 3, 'com.jb.expert.controller.PassCodeController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/code/35', '127.0.0.1', '内网IP', '{passCodeIds=35}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 02:16:03');
INSERT INTO `sys_oper_log` VALUES (1248, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":753363,\"params\":{},\"userName\":\"张翔\",\"createTime\":1657390569871,\"passCodeId\":39}', '{\"101\":101}', 0, NULL, '2022-07-10 02:16:09');
INSERT INTO `sys_oper_log` VALUES (1249, '通行码管理', 5, 'com.jb.expert.controller.PassCodeController.export()', 'GET', 1, 'admin', NULL, '/expert/code/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"3f2406f9-1e91-42bd-b830-598c307273c4_通行码管理数据.xlsx\",\"code\":200}', 0, NULL, '2022-07-10 02:18:43');
INSERT INTO `sys_oper_log` VALUES (1250, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/134', '127.0.0.1', '内网IP', '{userIds=134}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 02:40:35');
INSERT INTO `sys_oper_log` VALUES (1251, '通行码管理', 3, 'com.jb.expert.controller.PassCodeController.remove()', 'DELETE', 1, 'admin', NULL, '/expert/code/39', '127.0.0.1', '内网IP', '{passCodeIds=39}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 05:47:32');
INSERT INTO `sys_oper_log` VALUES (1252, '通行码管理', 1, 'com.jb.expert.controller.PassCodeController.add()', 'POST', 1, 'admin', NULL, '/expert/code', '127.0.0.1', '内网IP', '{\"passCodeValue\":936642,\"params\":{},\"userName\":\"张翔\",\"createTime\":1657403260728,\"passCodeId\":40}', '{\"101\":101}', 0, NULL, '2022-07-10 05:47:40');
INSERT INTO `sys_oper_log` VALUES (1253, '专家属性', 2, 'com.jb.expert.controller.ProjectExpertsController.editExpertInfo()', 'PUT', 1, 'admin', NULL, '/expert/experts/examine', '127.0.0.1', '内网IP', '{\"deptName\":\"部门待分配\",\"education\":\"6\",\"userStatus\":1,\"titleId\":1,\"expertClassId1\":1,\"expertClassId2\":2,\"email\":\"\",\"expertClassId3\":3,\"majorId\":1,\"expertStar\":3,\"nickName\":\"张翔\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userId\":134,\"phoneNumber\":\"\",\"positionId\":1,\"createTime\":1657382400000,\"examineRemark\":\"张翔已通过审核\"}', '{100:\"请求成功\"}', 0, NULL, '2022-07-10 13:26:49');
INSERT INTO `sys_oper_log` VALUES (1254, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhangxiang', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":134,\"middleNum\":4,\"extractionStatus\":0,\"primaryNum\":3,\"params\":{},\"projectStatus\":0,\"createTime\":1657431269140,\"seniorNum\":5,\"manageUser\":\"李四\",\"projectName\":\"项目开发\",\"projectId\":73}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:34:29');
INSERT INTO `sys_oper_log` VALUES (1255, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":134,\"middleNum\":4,\"extractionStatus\":1,\"primaryNum\":3,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":2,\"createTime\":1657431269000,\"seniorNum\":5,\"manageUser\":\"李四\",\"projectName\":\"项目开发\",\"projectId\":73}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:38:21');
INSERT INTO `sys_oper_log` VALUES (1256, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhangxiang', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":134,\"middleNum\":4,\"extractionStatus\":2,\"primaryNum\":3,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":3,\"createTime\":1657431269000,\"seniorNum\":5,\"manageUser\":\"李四\",\"projectName\":\"项目开发\",\"projectId\":73}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:44:26');
INSERT INTO `sys_oper_log` VALUES (1257, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'zhangxiang', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":134,\"middleNum\":1,\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1657432509698,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"自评互评任务展示\",\"projectId\":74}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:55:09');
INSERT INTO `sys_oper_log` VALUES (1258, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":134,\"middleNum\":1,\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":2,\"createTime\":1657432510000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"自评互评任务展示\",\"projectId\":74}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:55:14');
INSERT INTO `sys_oper_log` VALUES (1259, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhangxiang', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":134,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":3,\"createTime\":1657432510000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"自评互评任务展示\",\"projectId\":74}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:55:22');
INSERT INTO `sys_oper_log` VALUES (1260, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'zhangxiang', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"1\",\"createUserId\":134,\"finishTime\":1657382400000,\"middleNum\":1,\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"张翔\",\"params\":{},\"projectStatus\":5,\"createTime\":1657432510000,\"seniorNum\":1,\"manageUser\":\"1\",\"projectName\":\"自评互评任务展示\",\"projectId\":74}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-10 13:58:51');
INSERT INTO `sys_oper_log` VALUES (1261, '知识产权', 1, 'com.jb.property.controller.ProjectPropertyController.add()', 'POST', 1, 'zhangxiang', NULL, '/property/propertys', '127.0.0.1', '内网IP', '{\"propertyId\":null,\"propertyName\":\"知识产权功能演示\",\"projectName\":\"项目开发\",\"propertyType\":1,\"publisher\":\"xx出版社\",\"periodical\":\"xx期刊\",\"createTime\":null,\"finishTime\":\"2022-07-31\",\"fareStatus\":null,\"auth\":null,\"propertyWorker\":[{\"userNickName\":\"张三\",\"propertyId\":null,\"userId\":null},{\"userNickName\":\"李四\",\"propertyId\":null,\"userId\":null}]}', '{\"msg\":\"知识产权添加完成\",\"code\":200}', 0, NULL, '2022-07-10 14:07:24');
INSERT INTO `sys_oper_log` VALUES (1262, '用户私有模板', 3, 'com.jb.project.controller.ExpertTemplateController.remove()', 'DELETE', 1, 'admin', NULL, '/project/privateTemplate/3', '127.0.0.1', '内网IP', '{templateIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-12 20:16:54');
INSERT INTO `sys_oper_log` VALUES (1263, '模板管理', 3, 'com.jb.project.controller.TaskTemplateController.remove()', 'DELETE', 1, 'admin', NULL, '/project/template/11', '127.0.0.1', '内网IP', '{templateIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-12 20:17:21');
INSERT INTO `sys_oper_log` VALUES (1264, '项目列表', 1, 'com.jb.project.controller.ProjectController.add()', 'POST', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":1,\"finishTime\":1658937600000,\"middleNum\":1,\"projectContent\":\"xxxx\",\"extractionStatus\":0,\"primaryNum\":1,\"params\":{},\"projectStatus\":0,\"createTime\":1657628282534,\"seniorNum\":1,\"manageUser\":\"李四\",\"projectName\":\"测试项目\",\"projectId\":75}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-12 20:18:02');
INSERT INTO `sys_oper_log` VALUES (1265, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":1,\"finishTime\":1658937600000,\"middleNum\":1,\"projectContent\":\"xxxx\",\"extractionStatus\":1,\"primaryNum\":1,\"createUserName\":\"管理员\",\"params\":{},\"projectStatus\":2,\"createTime\":1657628283000,\"seniorNum\":1,\"manageUser\":\"李四\",\"projectName\":\"测试项目\",\"projectId\":75}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-12 20:18:07');
INSERT INTO `sys_oper_log` VALUES (1266, '项目列表', 2, 'com.jb.project.controller.ProjectController.edit()', 'PUT', 1, 'admin', NULL, '/project/projects', '127.0.0.1', '内网IP', '{\"owner\":\"张三\",\"createUserId\":1,\"finishTime\":1658937600000,\"middleNum\":1,\"projectContent\":\"xxxx\",\"extractionStatus\":2,\"primaryNum\":1,\"createUserName\":\"管理员\",\"params\":{},\"projectStatus\":3,\"createTime\":1657628283000,\"seniorNum\":1,\"manageUser\":\"李四\",\"projectName\":\"测试项目\",\"projectId\":75}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-12 20:18:21');
INSERT INTO `sys_oper_log` VALUES (1267, '知识产权', 3, 'com.jb.property.controller.ProjectPropertyController.remove()', 'DELETE', 1, 'admin', NULL, '/property/propertys/36', '127.0.0.1', '内网IP', '{propertyIds=36}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 04:28:09');
INSERT INTO `sys_oper_log` VALUES (1268, '知识产权', 3, 'com.jb.property.controller.ProjectPropertyController.remove()', 'DELETE', 1, 'admin', NULL, '/property/propertys/34', '127.0.0.1', '内网IP', '{propertyIds=34}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 04:28:10');
INSERT INTO `sys_oper_log` VALUES (1269, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/monitor/online/c700ce32-3123-4139-a52e-730108e8e805', '127.0.0.1', '内网IP', '{tokenId=c700ce32-3123-4139-a52e-730108e8e805}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:01:34');
INSERT INTO `sys_oper_log` VALUES (1270, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2200', '127.0.0.1', '内网IP', '{menuId=2200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:20:11');
INSERT INTO `sys_oper_log` VALUES (1271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"bug\",\"orderNum\":\"7\",\"menuName\":\"开发的界面\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"dev\",\"children\":[],\"createTime\":1656906348000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2199,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:20:30');
INSERT INTO `sys_oper_log` VALUES (1272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"7\",\"menuName\":\"开发的界面\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"dev\",\"children\":[],\"createTime\":1656906348000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2199,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:20:37');
INSERT INTO `sys_oper_log` VALUES (1273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"7\",\"menuName\":\"开发的界面\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"dev\",\"children\":[],\"createTime\":1656906348000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2199,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:20:59');
INSERT INTO `sys_oper_log` VALUES (1274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"7\",\"menuName\":\"开发的界面\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"dev\",\"children\":[],\"createTime\":1656906348000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2199,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:23:26');
INSERT INTO `sys_oper_log` VALUES (1275, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"专家管理\",\"params\":{},\"parentId\":2199,\"isCache\":\"0\",\"path\":\"experts\",\"component\":\"expert/experts/experts\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:45:42');
INSERT INTO `sys_oper_log` VALUES (1276, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"项目管理\",\"params\":{},\"parentId\":2199,\"isCache\":\"0\",\"path\":\"project\",\"component\":\"project/projects/projects\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:46:54');
INSERT INTO `sys_oper_log` VALUES (1277, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"专家信息\",\"params\":{},\"parentId\":2199,\"isCache\":\"0\",\"path\":\"expertInfo\",\"component\":\"components/experts/expertInfo\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-07-13 21:48:26');
INSERT INTO `sys_oper_log` VALUES (1278, '知识产权', 1, 'com.jb.property.controller.ProjectPropertyController.add()', 'POST', 1, 'admin', NULL, '/property/propertys/addWithFile', '127.0.0.1', '内网IP', '{\"propertyId\":null,\"propertyName\":\"test\",\"projectName\":\"test\",\"propertyType\":1,\"publisher\":\"test\",\"periodical\":\"test\",\"createTime\":null,\"finishTime\":\"2023-08-02\",\"fareStatus\":null,\"auth\":null,\"propertyWorker\":[{\"userNickName\":\"test\",\"propertyId\":null,\"userId\":null}]}', '{\"msg\":\"知识产权添加完成\",\"code\":200}', 0, NULL, '2023-08-12 16:09:45');
INSERT INTO `sys_oper_log` VALUES (1279, '知识产权', 1, 'com.jb.property.controller.ProjectPropertyController.add()', 'POST', 1, 'admin', NULL, '/property/propertys/addWithFile', '127.0.0.1', '内网IP', '{\"propertyId\":null,\"propertyName\":\"1\",\"projectName\":\"1\",\"propertyType\":1,\"publisher\":\"1\",\"periodical\":\"1\",\"createTime\":null,\"finishTime\":\"2023-08-09\",\"fareStatus\":null,\"auth\":null,\"propertyWorker\":[{\"userNickName\":\"1\",\"propertyId\":null,\"userId\":null}]}', '{\"msg\":\"知识产权添加完成\",\"code\":200}', 0, NULL, '2023-08-12 16:10:45');
INSERT INTO `sys_oper_log` VALUES (1280, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"科技成果管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tec\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-14 15:47:23');
INSERT INTO `sys_oper_log` VALUES (1281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"3\",\"menuName\":\"科技成果管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tec\",\"children\":[],\"createTime\":1691999243000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2204,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-14 15:47:43');
INSERT INTO `sys_oper_log` VALUES (1282, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"4\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1645152548000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-14 15:48:06');
INSERT INTO `sys_oper_log` VALUES (1283, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"0\",\"menuName\":\"科技成果\",\"params\":{},\"parentId\":2204,\"isCache\":\"0\",\"path\":\"achievement\",\"component\":\"tec/achievement/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-14 15:59:29');
INSERT INTO `sys_oper_log` VALUES (1284, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"0\",\"menuName\":\"科技成果展示\",\"params\":{},\"parentId\":2204,\"isCache\":\"0\",\"path\":\"achievement\",\"component\":\"tec/achievement/index\",\"children\":[],\"createTime\":1691999969000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2205,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-15 18:18:12');
INSERT INTO `sys_oper_log` VALUES (1285, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'scada_organ', NULL, 1, '导入失败：null', '2023-08-16 17:54:01');
INSERT INTO `sys_oper_log` VALUES (1286, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'scada_organ MASTER', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-16 17:55:15');
INSERT INTO `sys_oper_log` VALUES (1287, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"OrganID\",\"usableColumn\":false,\"isIncrement\":\"1\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"organID\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"columnType\":\"int(11)\",\"leftTreeFlag\":0,\"columnId\":19,\"increment\":true,\"insert\":true,\"dictType\":\"\",\"updateBy\":\"\",\"htmlType\":\"input\",\"linkField\":\"\",\"filterField\":\"\",\"queryType\":\"EQ\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1692179715000,\"tableId\":2,\"pk\":true,\"columnName\":\"ORGAN_ID\",\"fieldCheck\":\"\",\"linkTable\":\"\"},{\"capJavaField\":\"ScadaRegionId\",\"usableColumn\":false,\"isIncrement\":\"0\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"scadaRegionId\",\"edit\":false,\"query\":false,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"columnType\":\"int(11)\",\"leftTreeFlag\":0,\"columnId\":20,\"increment\":false,\"insert\":true,\"dictType\":\"\",\"updateBy\":\"\",\"htmlType\":\"input\",\"linkField\":\"\",\"filterField\":\"\",\"queryType\":\"EQ\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1692179715000,\"tableId\":2,\"pk\":true,\"columnName\":\"SCADA_REGION_ID\",\"fieldCheck\":\"\",\"linkTable\":\"\"},{\"capJavaField\":\"RegionType\",\"usableColumn\":false,\"isIncrement\":\"0\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"regionType\",\"edit\":true,\"query\":true,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"columnType\":\"int(11)\",\"leftTreeFlag\":0,\"columnId\":21,\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"updateBy\":\"\",\"htmlType\":\"select\",\"isQuery\":\"1\",\"linkField\":\"\",\"filterField\":\"\",\"queryType\":\"EQ\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1692179715000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"REGION_TYPE\",\"fieldCheck\":\"\",\"linkTable\":\"\"},{\"capJavaField\":\"OrganName\",\"usableColumn\":false,\"isIncrement\":\"0\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"organName\",\"edit\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-16 17:59:01');
INSERT INTO `sys_oper_log` VALUES (1288, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-08-16 17:59:06');
INSERT INTO `sys_oper_log` VALUES (1289, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-16 18:06:16');
INSERT INTO `sys_oper_log` VALUES (1290, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dict\",\"orderNum\":\"1\",\"menuName\":\"新增科技成果\",\"params\":{},\"parentId\":2204,\"isCache\":\"0\",\"path\":\"addAchi\",\"component\":\"tec/achievement/addAchi\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-16 18:09:46');
INSERT INTO `sys_oper_log` VALUES (1291, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tec_attach_file MASTER', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:37:35');
INSERT INTO `sys_oper_log` VALUES (1292, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:38:35');
INSERT INTO `sys_oper_log` VALUES (1293, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tec_attach_file MASTER', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:39:06');
INSERT INTO `sys_oper_log` VALUES (1294, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:41:06');
INSERT INTO `sys_oper_log` VALUES (1295, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tec_attach_file MASTER', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:41:33');
INSERT INTO `sys_oper_log` VALUES (1296, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:45:39');
INSERT INTO `sys_oper_log` VALUES (1297, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tec_attachFile MASTER', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:45:50');
INSERT INTO `sys_oper_log` VALUES (1298, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"FileId\",\"usableColumn\":false,\"isIncrement\":\"1\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"fileId\",\"edit\":true,\"query\":true,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"columnType\":\"int(11)\",\"leftTreeFlag\":0,\"columnId\":35,\"increment\":true,\"insert\":true,\"dictType\":\"\",\"updateBy\":\"\",\"htmlType\":\"input\",\"isQuery\":\"1\",\"linkField\":\"\",\"filterField\":\"\",\"queryType\":\"EQ\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1692240350000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":true,\"columnName\":\"file_id\",\"fieldCheck\":\"\",\"linkTable\":\"\"},{\"capJavaField\":\"AchievementId\",\"usableColumn\":false,\"isIncrement\":\"0\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"achievementId\",\"edit\":true,\"query\":true,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"columnType\":\"int(11)\",\"leftTreeFlag\":0,\"columnId\":36,\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"updateBy\":\"\",\"htmlType\":\"input\",\"isQuery\":\"1\",\"linkField\":\"\",\"filterField\":\"\",\"queryType\":\"EQ\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1692240350000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"achievement_id\",\"fieldCheck\":\"\",\"linkTable\":\"\"},{\"capJavaField\":\"FileName\",\"usableColumn\":false,\"isIncrement\":\"0\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"linkShowField\":\"\",\"isInsert\":\"1\",\"javaField\":\"fileName\",\"edit\":true,\"query\":true,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"columnType\":\"varchar(255)\",\"leftTreeFlag\":0,\"columnId\":37,\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"updateBy\":\"\",\"htmlType\":\"input\",\"isQuery\":\"1\",\"linkField\":\"\",\"filterField\":\"\",\"queryType\":\"LIKE\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1692240350000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"file_name\",\"fieldCheck\":\"\",\"linkTable\":\"\"},{\"capJavaField\":\"FilePath\",\"usableColumn\":false,\"isIncrement\":\"0\",\"required\":false,\"superColumn\":false,\"linkTree\":0,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 10:47:35');
INSERT INTO `sys_oper_log` VALUES (1299, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-08-17 10:47:37');
INSERT INTO `sys_oper_log` VALUES (1300, '科技成果附件', 3, 'com.jb.property.controller.TecAttachfileController.remove()', 'DELETE', 1, 'admin', NULL, '/tec/attachfile/1', '127.0.0.1', '内网IP', '{fileIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-17 18:12:05');
INSERT INTO `sys_oper_log` VALUES (1301, '科技成果附件', 3, 'com.jb.property.controller.TecAttachfileController.remove()', 'DELETE', 1, 'admin', NULL, '/tec/attachfile/3', '127.0.0.1', '内网IP', '{fileIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-18 11:25:40');
INSERT INTO `sys_oper_log` VALUES (1302, '科技成果附件', 3, 'com.jb.property.controller.TecAttachfileController.remove()', 'DELETE', 1, 'admin', NULL, '/tec/attachfile/10', '127.0.0.1', '内网IP', '{fileIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-18 11:28:24');
INSERT INTO `sys_oper_log` VALUES (1303, '科技成果附件', 3, 'com.jb.property.controller.TecAttachfileController.remove()', 'DELETE', 1, 'admin', NULL, '/tec/attachfile/4', '127.0.0.1', '内网IP', '{fileIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-18 15:41:40');
INSERT INTO `sys_oper_log` VALUES (1304, '科技成果附件', 3, 'com.jb.property.controller.TecAttachfileController.remove()', 'DELETE', 1, 'admin', NULL, '/tec/attachfile/11', '127.0.0.1', '内网IP', '{fileIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-18 17:08:00');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-02-18 10:49:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-02-18 10:49:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-02-18 10:49:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-02-18 10:49:08', 'admin', '2022-02-23 20:09:45', '普通角色');
INSERT INTO `sys_role` VALUES (3, '专家', 'expert', 3, '1', 1, 1, '0', '0', 'admin', '2022-02-21 11:40:33', 'admin', '2022-07-05 02:55:59', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (3, 2053);
INSERT INTO `sys_role_menu` VALUES (3, 2104);
INSERT INTO `sys_role_menu` VALUES (3, 2117);
INSERT INTO `sys_role_menu` VALUES (3, 2118);
INSERT INTO `sys_role_menu` VALUES (3, 2119);
INSERT INTO `sys_role_menu` VALUES (3, 2120);
INSERT INTO `sys_role_menu` VALUES (3, 2121);
INSERT INTO `sys_role_menu` VALUES (3, 2122);
INSERT INTO `sys_role_menu` VALUES (3, 2123);
INSERT INTO `sys_role_menu` VALUES (3, 2130);
INSERT INTO `sys_role_menu` VALUES (3, 2131);
INSERT INTO `sys_role_menu` VALUES (3, 2132);
INSERT INTO `sys_role_menu` VALUES (3, 2133);
INSERT INTO `sys_role_menu` VALUES (3, 2134);
INSERT INTO `sys_role_menu` VALUES (3, 2135);
INSERT INTO `sys_role_menu` VALUES (3, 2136);
INSERT INTO `sys_role_menu` VALUES (3, 2137);
INSERT INTO `sys_role_menu` VALUES (3, 2138);
INSERT INTO `sys_role_menu` VALUES (3, 2139);
INSERT INTO `sys_role_menu` VALUES (3, 2140);
INSERT INTO `sys_role_menu` VALUES (3, 2141);
INSERT INTO `sys_role_menu` VALUES (3, 2166);
INSERT INTO `sys_role_menu` VALUES (3, 2167);
INSERT INTO `sys_role_menu` VALUES (3, 2168);
INSERT INTO `sys_role_menu` VALUES (3, 2169);
INSERT INTO `sys_role_menu` VALUES (3, 2170);
INSERT INTO `sys_role_menu` VALUES (3, 2171);
INSERT INTO `sys_role_menu` VALUES (3, 2178);
INSERT INTO `sys_role_menu` VALUES (3, 2179);
INSERT INTO `sys_role_menu` VALUES (3, 2180);
INSERT INTO `sys_role_menu` VALUES (3, 2181);
INSERT INTO `sys_role_menu` VALUES (3, 2182);
INSERT INTO `sys_role_menu` VALUES (3, 2183);
INSERT INTO `sys_role_menu` VALUES (3, 2184);
INSERT INTO `sys_role_menu` VALUES (3, 2185);
INSERT INTO `sys_role_menu` VALUES (3, 2186);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-08-23 18:07:15', 'admin', '2022-02-18 10:49:08', '', '2023-08-23 18:07:15', '管理员');
INSERT INTO `sys_user` VALUES (100, 1000, 'ywq', '苑玮奇', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-07-08 20:21:29', '', '2022-06-15 09:42:57', 'admin', '2022-07-08 20:21:29', NULL);
INSERT INTO `sys_user` VALUES (101, 1001, 'tumu', '苑玮奇', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-07-08 20:21:29', '', '2022-06-15 09:42:57', 'admin', '2022-07-08 20:21:29', NULL);
INSERT INTO `sys_user` VALUES (102, 1002, 'reneng', '苑玮奇', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-07-08 20:21:29', '', '2022-06-15 09:42:57', 'admin', '2022-07-08 20:21:29', NULL);
INSERT INTO `sys_user` VALUES (103, 1003, 'jisuanji', '苑玮奇', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-07-08 20:21:29', '', '2022-06-15 09:42:57', 'admin', '2022-07-08 20:21:29', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (131, 2);
INSERT INTO `sys_user_role` VALUES (131, 3);
INSERT INTO `sys_user_role` VALUES (132, 2);
INSERT INTO `sys_user_role` VALUES (132, 3);
INSERT INTO `sys_user_role` VALUES (133, 2);
INSERT INTO `sys_user_role` VALUES (133, 3);
INSERT INTO `sys_user_role` VALUES (134, 3);

-- ----------------------------
-- Table structure for task_template
-- ----------------------------
DROP TABLE IF EXISTS `task_template`;
CREATE TABLE `task_template`  (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `template_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板存储路径',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_template
-- ----------------------------
INSERT INTO `task_template` VALUES (1, '测试模板', '/profile/template/2022/03/31/a306d01d-f9a9-42b5-be81-619a5b70257b.docx');

-- ----------------------------
-- Table structure for tec_achievement
-- ----------------------------
DROP TABLE IF EXISTS `tec_achievement`;
CREATE TABLE `tec_achievement`  (
  `achievement_id` int(11) NOT NULL AUTO_INCREMENT,
  `SUBNETID` int(11) NULL DEFAULT NULL,
  `achievement_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cooperationMethods` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registrationDate` date NULL DEFAULT NULL,
  `archiveDate` date NULL DEFAULT NULL,
  `pageNumber` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`achievement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tec_achievement
-- ----------------------------
INSERT INTO `tec_achievement` VALUES (1, NULL, '强制隔离戒毒所建设', '02管理学院', '项目建设', NULL, '李永福', '13518616828', '', '技术服务', 'FW02-001强制隔离戒毒所建设-李永福.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (2, NULL, '人民防空工程绿色施工成本控制研究', '02管理学院', '人民防空工程绿色施工', NULL, '李永福', '13518616828', '', '技术服务', 'FW02-002人民防空工程绿色施工成本控制研究-李永福.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (3, NULL, '人民防空工程绿色施工风险管控及优化', '02管理学院', '人民防空工程绿色施工', NULL, '李永福', '13518616828', '', '技术服务', 'FW02-003人民防空工程绿色施工风险管控及优化服务-李永福.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (4, NULL, '人民防空工程绿色施工评价指标体系研究', '02管理学院', '人民防空工程绿色施工', NULL, '李永福', '13518616828', '', '技术服务', 'FW02-004人民防空工程绿色施工评价指标体系研究-李永福.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (5, NULL, '国土空间规划项目、村庄规划编制', '02管理学院', '国土空间规划', NULL, '刘金花', '15054108738', '', '技术服务', 'FW02-005国土空间规划项目、村庄规划编制服务-刘金花.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (6, NULL, 'PPP模式与机制在农村土地综合整治中的探索实践', '02管理学院', '国土综合整治', NULL, '刘金花', '15054108738', '', '技术服务', 'FW02-006农村土地综合整治服务-刘金花.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (7, NULL, '济南市居住用地市场调控政策机制研究', '02管理学院', '土地制度政策研究', NULL, '刘金花', '15054108738', '', '技术服务', 'FW02-007居住用地市场调控政策机制研究-刘金花.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (8, NULL, '康养项目投资决策与运营研究', '02管理学院', '健康养老', NULL, '郑生钦', '13605312197', '', '技术服务', 'FW02-008康养项目投资决策与运营服务-郑生钦.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (9, NULL, '智慧安全管理及安全文化提升研究', '02管理学院', '智能建造及工程安全管理', NULL, '杨杰', '13589093373', '', '技术服务；技术咨询；技术培训', 'FW02-010智慧安全管理及安全文化提升服务-杨杰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (10, NULL, '工业机械设备在线监测与智能诊断技术', '03热能学院', '（1）高端装备技术（2）人工智能技术（3）信息化技术（4）先进制造与自动化', NULL, '宋永兴', '15167107686', '', '技术转让；技术许可；合作实施；合作开发', 'CG03-001工业机械设备在线监测与智能诊断技术-宋永兴.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (11, NULL, '工业源无组织排放VOCs低能耗高效净化技术', '03热能学院', '（1）新材料（2）新能源与节能（3）资源与环境（4）高技术服务（5）先进制造与自动化', NULL, '高岩', '13864154887', '', '技术许可；合作实施；合作开发', 'CG03-002工业源无组织排放VOCs低能耗高效净化技术-高岩.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (12, NULL, '余热利用高盐工业废水蒸发器', '03热能学院', '（1）新能源与节能中的高效节能技术（2）资源与环境中的水污染控制与水资源利用技术', NULL, '杨洛鹏', '13130403891', '', '技术转让；技术许可；作价投资；合作开发', 'CG03-003余热利用高盐工业废水蒸发器-杨洛鹏.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (13, NULL, '金属有机骨架材料在生物质能源转化中的应用', '03热能学院', '（1）可再生清洁能源', NULL, '李辉', '15866677700', '', '技术转让；合作开发', 'CG03-004金属有机骨架材料在生物质能源转化中的应用-李辉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (14, NULL, '人工环境通风保障技术研究', '03热能学院', '（1）室内环境控制（2）高效节能技术（3）智能化运维领域', NULL, '雷文君', '13808935926', '', '技术许可；合作实施；合作开发', 'CG03-005人工环境通风保障技术研究-雷文君.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (15, NULL, '地源热泵及中深层地热能建筑利用技术', '03热能学院', '新能源与节能', NULL, '于明志', '13573776304', '', '技术服务；技术咨询', 'FW03-001地源热泵及中深层地热能建筑利用技术服务-于明志.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (16, NULL, '燃气热力规划技术咨询服务', '03热能学院', '土木工程市政工程领域', NULL, '田贯三', '13705314492', '', '技术服务；技术咨询', 'FW03-002燃气热力规划技术咨询服务-田贯三.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (17, NULL, '有机相变材料的储热性能及表征测试服务', '03热能学院', '新型高效能量转换与储存技术', NULL, '李辉', '15866677700', '', '技术服务；技术咨询；技术培训', 'FW03-003有机相变材料的储热性能及表征测试服务-李辉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (18, NULL, '农产品仓储物流品质状态检测、预测研究及其调控关键技术研发', '03热能学院', '农业高新技术及农业现代化', NULL, '杨开敏', '18660118296', '', '技术服务；技术咨询；技术培训', 'FW03-004农产品仓储物流品质状态检测、预测研究及其调控关键技术研发服务-杨开敏.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (19, NULL, '复杂体系流动传热的数值仿真', '03热能学院', '建筑节能及工业节能', NULL, '陈宝明', '13964061079', '', '技术服务；技术咨询', 'FW03-005复杂体系流动传热的数值仿真服务-陈宝明.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (20, NULL, '垃圾渗滤液关键处理技术攻关与产业化应用', '04市政学院', '（1）资源与环境：水污染控制与水资源利用技术高端装备技术', NULL, '王凯', '18654504611', '', '技术转让', 'CG04-001垃圾渗滤液关键处理技术攻关与产业化应用-王凯.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (21, NULL, '微生物与植物互作理论助推环境生物修复新技术', '04市政学院', '（1）资源与环境', NULL, '钟传青', '15153198302', '', '技术转让；合作实施；合作开发', 'CG04-002微生物与植物互作理论助推环境生物修复新技术-钟传青.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (22, NULL, '山东省水污染防治法实施情况评估报告', '04市政学院', '水污染控制与水资源利用技术', NULL, '武道吉', '13708922504', '', '技术服务；技术咨询；技术培训', 'FW04-001水污染防治法实施情况评估服务-武道吉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (23, NULL, '济南市分质供水惠民工程', '04市政学院', '水污染控制与水资源利用技术', NULL, '武道吉', '13708922504', '', '技术服务；技术咨询；技术培训', 'FW04-002分质供水惠民工程服务-武道吉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (24, NULL, '山东省济南生态环境局济南市空气质量形势分析保障项目', '04市政学院', '环境保护', NULL, '张桂芹', '13675411301', '', '技术服务', 'FW04-003空气质量形势分析服务-张桂芹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (25, NULL, '济南市大气颗粒物来源解析研究项目', '04市政学院', '环境保护', NULL, '张桂芹', '13675411301', '', '技术服务', 'FW04-004大气颗粒物来源解析研究-张桂芹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (26, NULL, '高耗能、重污染染料化工行业绿色高效清洁生产关键技术', '04市政学院', '环境科学与工程/绿色化工', NULL, '任会学', '0531-86367292', '', '技术服务；技术咨询；技术培训', 'FW04-005高耗能、重污染染料化工行业绿色高效清洁生产研究-武道吉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (27, NULL, '饲用微生态制剂研制项目', '04市政学院', '生物工程、微生态制剂', NULL, '姜天翼', '13793167502', '', '技术服务', 'FW04-006饲用微生态制剂研制-姜天翼.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (28, NULL, '东营市河口区农村生活污水治理', '04市政学院', '资源与环境', NULL, '韩庆祥', '13808925795', '', '技术服务；技术咨询', 'FW04-007农村生活污水治理服务-韩庆祥.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (29, NULL, '淄博市环境保护局重点行业企业用地信息采集及风险筛查纠偏工作服务', '04市政学院', '资源与环境：土壤环境保护和污染防控技术', NULL, '薛维纳', '13869193296', '', '技术服务；技术咨询', 'FW04-008企业用地信息采集及风险筛查纠偏服务-薛维纳.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (30, NULL, '串联式河道水质改善与水资源调蓄技术', '04市政学院', '资源与环境', NULL, '张志斌', '15866614511', '', '技术服务；技术咨询；技术培训', 'FW04-009串联式河道水质改善与水资源调蓄研究-张志斌.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (31, NULL, '装配式加气混凝土复合保温外墙板系统及关键应用技术', '05建筑学院', '绿色建筑技术与设计（装配式建筑、新型墙材）', NULL, '苗纪奎', '18653123939', '', '技术许可', 'CG05-001装配式加气混凝土复合保温外墙板系统及关键应用技术-苗继奎.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (32, NULL, '基于绿色人居环境及地域文脉特色的建筑设计实践及研究', '05建筑学院', '建筑学', NULL, '李晓东', '13285319092', '', '技术服务；技术咨询', 'FW05-001基于绿色人居环境及地域文脉特色的建筑设计实践及研究-李晓东.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (33, NULL, '面向地域空间的城市设计实践', '05建筑学院', '城乡规划学科，城市设计方向', NULL, '赵亮', '13884987037', '', '技术服务；技术咨询；技术培训', 'FW05-002面向地域空间的城市设计实践-赵亮.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (34, NULL, '宁夏国家生态移民示范项目太阳能双效利用及节能关键技术研究与应用', '05建筑学院', '建筑技术及新能源利用领域应用研究', NULL, '薛一冰', '', 'abc0531@163.com', '技术服务；技术咨询；技术培训', 'FW05-003宁夏国家生态移民示范项目太阳能双效利用及节能关键技术研究与应用-薛一冰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (35, NULL, '绿色大学园区环境综合保障技术研究与应用', '05建筑学院', '绿色建筑及低碳可持续发展领域应用研究', NULL, '薛一冰', '', 'abc0531@163.com', '技术服务；技术咨询；技术培训', 'FW05-004绿色大学园区环境综合保障技术研究与应用-薛一冰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (36, NULL, '农房能效提升研究与应用', '05建筑学院', '建筑节能及农村清洁供暖领域应用研究', NULL, '薛一冰', '', 'abc0531@163.com', '技术服务；技术咨询；技术培训', 'FW05-005农房能效提升研究与应用-薛一冰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (37, NULL, '绿色低碳城区及绿色建筑设计与咨询', '05建筑学院', '绿色低碳城市与建筑', NULL, '何文晶', '15953191506', '', '技术服务；技术咨询；技术培训', 'FW05-006绿色低碳城区及绿色建筑设计与咨询-何文晶.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (38, NULL, '基于结构损伤映射表征的塔机远程智能诊断技术及应用', '07机电学院', '高技术服务', NULL, '宋连玉', '16653138103', '', '合作开发', 'CG07-001基于结构损伤映射表征的塔机远程智能诊断技术及应用-宋世军.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (39, NULL, '城市防洪救灾技术与设施', '07机电学院', '资源与环境', NULL, '张明勤', '13370528889', '', '技术转让；技术许可；合作实施；合作开发', 'CG07-002城市防洪救灾技术与设施-张明勤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (40, NULL, 'MSF1200型变螺旋多肢箍钢筋骨架成型机', '07机电学院', '先进制造与自动化', NULL, '张明勤', '13370528889', '', '技术转让；技术许可；合作开发', 'CG07-003MSF1200型变螺旋多肢箍钢筋骨架成型机-张明勤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (41, NULL, 'RBM50型钢筋捆扎机', '07机电学院', '先进制造与自动化', NULL, '张明勤', '13370528889', '', '技术转让；技术许可；合作开发', 'CG07-004RBM50型钢筋捆扎机-张明勤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (42, NULL, '无避让（有/无动力）双层车库系列', '07机电学院', '先进制造与自动化', NULL, '张明勤', '13370528889', '', '技术转让；技术许可；合作开发', 'CG07-005无避让（有无动力）双层车库系列-张明勤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (43, NULL, '超薄型撑顶式立体车库汽车搬运机器人', '07机电学院', '先进制造与自动化', NULL, '张明勤', '13370528889', '', '技术转让；技术许可；合作开发', 'CG07-006超薄型撑顶式立体车库汽车搬运机器人-张明勤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (44, NULL, '机械装备的数字化、网络化和智能化控制', '07机电学院', '先进制造与自动化', NULL, '姬帅', '13954138685', '', '技术转让；技术许可；合作实施；合作开发', 'CG07-007机械装备的数字化、网络化和智能化控制-姬帅.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (45, NULL, '增减材复合制造应力主动控制技术', '07机电学院', '先进制造与自动化', NULL, '赵彦华', '18954169696', '', '合作开发；合作实施', 'CG07-008增减材复合制造应力主动控制技术-赵彦华.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (46, NULL, '车用氢燃料电池动力系统集成技术研究', '07机电学院', '新能源技术', NULL, '李新海', '15698016265', '', '合作开发；合作实施', 'CG07-009车用氢燃料电池动力系统集成技术研究-李新海.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (47, NULL, 'AL-Smartdrive多工程机械自主学习与智能协同控制系统', '07机电学院', '先进制造与自动化', NULL, '罗映', '13589039131', '', '技术转让；技术许可；合作开发', 'CG07-010AL-Smartdrive多工程机械自主学习与智能协同控制系统-罗映.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (48, NULL, '创新方法（TRIZ）培训', '07机电学院', '高技术服务', NULL, '张明勤', '13370528889', '', '技术咨询；技术培训', 'FW07-001创新方法（TRIZ）培训-张明勤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (49, NULL, '智能工程机械创新设计理论与技术', '07机电学院', '高技术服务', NULL, '张青', '18615623117', '', '技术服务', 'FW07-002智能工程机械创新设计理论与技术-张青.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (50, NULL, '高性能金属构件多尺度全流程设计与制造关键技术研究', '07机电学院', '先进制造与自动化', NULL, '王忠雷', '13953171364', '', '技术服务', 'FW07-003高性能金属构件多尺度全流程设计与制造关键技术研究-王忠雷.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (51, NULL, '智慧建筑物联网系统', '08信电学院', '建筑节能、新一代信息技术、电子信息', NULL, '李成栋', '18866410727', '', '技术转让；合作实施；合作开发', 'CG08-001智慧建筑物联网系统-李成栋.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (52, NULL, '中医按摩机器人', '08信电学院', '先进制造与自动化、生物与新医药：', NULL, '高焕兵', '15550407979', '', '技术转让；合作实施；合作开发', 'CG08-002中医按摩机器人-高焕兵.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (53, NULL, '大型公共建筑用电数据采集系统及智能用电控制系统', '08信电学院', '新能源与节能、电子信息', NULL, '高焕兵', '15550407979', '', '技术转让；合作实施；合作开发', 'CG08-003大型公共建筑用电数据采集系统及智能用电控制系统-高焕兵.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (54, NULL, '下肢助力机器人', '08信电学院', '生物与新医药、先进制造与自动化', NULL, '高焕兵', '15550407979', '', '技术转让；合作实施；合作开发', 'CG08-004下肢助力机器人-高焕兵.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (55, NULL, '人造板表面缺陷在线检测系统', '08信电学院', '先进制造与自动化', NULL, '周玉成', '15553179652', '', '技术转让；技术许可；合作实施', 'CG08-005人造板表面缺陷在线检测系统-周玉成.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (56, NULL, '基于数据的暖通空调系统故障诊断方法及系统', '08信电学院', '先进制造与自动化、人工智能', NULL, '张汉元', '15275313799', '', '技术转让；技术许可；作价投资；合作实施', 'CG08-006基于数据的暖通空调系统故障诊断方法及系统-张汉元.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (57, NULL, '多引下线接地电阻检测方法', '08信电学院', '电子信息、高技术服务', NULL, '隋首钢', '18653117658', '', '技术转让；技术许可；合作开发', 'CG08-007多引下线接地电阻检测方法-隋首钢.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (58, NULL, '一种交通锥摆放装置', '08信电学院', '新型机械', NULL, '高鹤', '', 'gaohe@sdjzu.edu.cn', '合作实施', 'CG08-008一种交通锥摆放装置-高鹤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (59, NULL, '基于高速新能源再利用的撬装沼气站原料收集装置', '08信电学院', '可再生清洁能源、新型机械', NULL, '高鹤', '', 'gaohe@sdjzu.edu.cn', '合作实施', 'CG08-009基于高速新能源再利用的撬装沼气站原料收集装置-高鹤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (60, NULL, '能耗采集与分析系统', '08信电学院', '高效节能技术', NULL, '郑学汉', '', '11216@sdjzu.edu.cn', '合作实施', 'CG08-010能耗采集与分析系统-郑学汉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (61, NULL, '强弱电一体化智能监控系统', '08信电学院', '高效节能技术', NULL, '郑学汉', '', '11216@sdjzu.edu.cn', '合作实施', 'CG08-011强弱电一体化智能监控系统-郑学汉.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (62, NULL, '可见光通信技术验证平台', '08信电学院', '电子信息-通信技术', NULL, '邓晓平', '', 'dengxiaoping19@sdjzu.edu.cn', '合作开发', 'CG08-012可见光通信技术验证平台-邓晓平.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (63, NULL, '海洋定位信标系统', '08信电学院', '先进制造与自动化', NULL, '刘存根', '18615202575', '', '技术许可；作价投资；合作实施', 'CG08-013海洋定位信标系统-刘存根.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (64, NULL, '工程机械智能化改造', '08信电学院', '电子信息', NULL, '陶亮', '15553177055', '', '合作实施；合作开发', 'CG08-014工程机械智能化改造-陶亮.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (65, NULL, '基于物联网的智能感知与建筑用能优化控制技术', '08信电学院', '电子信息', NULL, '陶亮', '15553177055', '', '合作实施；合作开发', 'CG08-015基于物联网的智能感知与建筑用能优化控制技术-陶亮.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (66, NULL, '人脸梯控及电瓶车阻车工程', '08信电学院', '电子信息', NULL, '陶亮', '15553177055', '', '合作实施；合作开发', 'CG08-016人脸梯控及电瓶车阻车工程-陶亮.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (67, NULL, '高血压辅助治疗仪', '08信电学院', '电子信息', NULL, '陶亮', '15553177055', '', '合作实施；合作开发', 'CG08-017高血压辅助治疗仪-陶亮.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (68, NULL, '交直流故障电弧检测技术', '08信电学院', '先进制造与自动化（电力系统与设备）', NULL, '石嘉川', '13791039657', '', '技术许可', 'CG08-018 交直流故障电弧检测技术-石嘉川.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (69, NULL, '海洋牧场能源规划运营及碳排放数据精细化管理系统', '08信电学院', '新能源发电、综合能源系统', NULL, '严毅', '13188876807', '', '技术转让；合作实施；合作开发', 'CG08-019海洋牧场能源规划运营及碳排放数据精细化管理系统-严毅.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (70, NULL, '基于电力物联网的配电网电能质量监测与治理关键技术项目', '08信电学院', '电气工程', NULL, '曹立霞', '15098931265', '', '技术服务', 'FW08-001基于电力物联网的配电网电能质量监测与治理关键技术项目-曹立霞.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (71, NULL, '基于多源大数据融合和电网建模的电能质量数据分析技术研究', '08信电学院', '电气工程', NULL, '曹立霞', '15098931265', '', '技术服务', 'FW08-002基于多源大数据融合和电网建模的电能质量数据分析技术研究-曹立霞.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (72, NULL, '5G+融合创新平台', '08信电学院', '信息技术', NULL, '许鸿奎', '', 'xhkui2009@163.com', '技术服务；技术咨询；技术培训', 'FW08-003 5G+融合创新平台-许鸿奎.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (73, NULL, '信息技术技术监测工程结构震动变形的应用研究', '09商学院', '信息技术及应用', NULL, '赵永谦', '13455111419', '', '技术服务；技术咨询；技术培训', 'FW09-001信息技术技术监测工程结构震动变形的应用研究-赵永谦.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (74, NULL, '企业财务绩效、创新绩效与环境绩效研究', '09商学院', '工商管理', NULL, '王静', '13583188233', '', '技术咨询；技术培训', 'FW09-002企业财务绩效、创新绩效与环境绩效研究-王静.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (75, NULL, '企业的绿色可持续发展', '09商学院', '公司治理、战略管理', NULL, '杨海兰', '13678806466', '', '技术咨询；技术培训', 'FW09-003企业的绿色可持续发展-杨海兰.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (76, NULL, '房地产市场平稳健康发展研究', '09商学院', '房地产经济与金融', NULL, '陈健', '1385316903', '', '技术咨询；技术培训', 'FW09-004房地产市场平稳健康发展研究-陈健.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (77, NULL, '绿色发展战略背景下海洋经济发展研究', '09商学院', '海洋经济相关领域', NULL, '王莉莉', '13695413603', '', '技术咨询', 'FW09-005绿色发展战略背景下海洋经济发展研究-王莉莉.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (78, NULL, '企业供应商评价及选择研究', '09商学院', '工商管理', NULL, '赵莉', '13964062750', '', '技术咨询；技术培训', 'FW09-006企业供应商评价及选择研究-赵莉.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (79, NULL, '出口信用保险机制下的企业发展问题研究', '09商学院', '应用经济学、工商管理', NULL, '贾广余', '1369190345', '', '技术咨询', 'FW09-007出口信用保险机制下的企业发展问题研究-贾广余.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (80, NULL, '电子商务助推乡村振兴', '09商学院', '电子商务', NULL, '徐功文', '13793161299', '', '技术服务；技术咨询；技术培训', 'FW09-008电子商务助推乡村振兴-徐功文.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (81, NULL, '涂料废渣资源化技术与自动化生产线', '10材料学院', '资源与环境；先进制造与自动化', NULL, '冯立明', '13153174310', '', '技术转让', 'CG10-001涂料废渣资源化技术与自动化生产线-冯立明.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (82, NULL, '轻质高强混凝土材料', '10材料学院', '新材料（无机非金属材料）', NULL, '岳雪涛', '13589035658', '', '根据具体情况，可进行多种合作方式', 'CG10-002轻质高强混凝土材料-岳雪涛.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (83, NULL, '大型锻件均质化锻造与精密成形技术', '10材料学院', '先进制造与自动化-先进制造工艺与装备', NULL, '景财年', '13031728845', '', '根据具体情况，可进行多种合作方式', 'CG10-003大型锻件均质化锻造与精密成形技术-景财年.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (84, NULL, '新型热冲压高强钢的开发与应用', '10材料学院', '新材料-金属材料', NULL, '景财年', '13031728845', '', '根据具体情况，可进行多种合作方式', 'CG10-004新型热冲压高强钢的开发与应用-景财年.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (85, NULL, '3D打印人体骨骼种植可再生修复材料产业化', '10材料学院', '先进制造与自动化 生物与新医药', NULL, '徐淑波', '1515316698', '', '技术转让；技术许可；作价投资；合作实施；合作开发', 'CG10-005 3D打印人体骨骼种植可再生修复材料产业化-徐淑波.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (86, NULL, '高强度可溶镁合金成分及制备工艺开发', '10材料学院', '先进制造与自动化 先进制造工艺与装备', NULL, '林涛', '18654931995', '', '技术转让；技术许可；作价投资；合作实施；合作开发', 'CG10-006高强度可溶镁合金成分及制备工艺开发-林涛.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (87, NULL, '高效热储能及可控温度碳基复合相变材料', '10材料学院', '新能源与节能：新型高效能量转换与储存技术', NULL, '项东', '13964090976', '', '技术转让；合作开发', 'CG10-007高效热储能及可控温度碳基复合相变材料-项东.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (88, NULL, '新型造纸涂布高效胶黏剂生产关键技术研究及应用', '10材料学院', '新材料-高分子材料', NULL, '张丰庆', '13791030675', '', '根据具体情况，可进行多种合作方式', 'CG10-008新型造纸涂布高效胶黏剂生产关键技术研究及应用-张丰庆.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (89, NULL, '金属扩散焊', '10材料学院', '先进制造与自动化', NULL, '王学刚', '13589033116', '', '技术服务', 'FW10-001金属扩散焊-王学刚.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (90, NULL, '耐磨防腐材料', '10材料学院', '新材料', NULL, '王学刚', '13589033116', '', '技术服务', 'FW10-002耐磨防腐材料-王学刚.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (91, NULL, '高强度轻质铝合金', '10材料学院', '新材料', NULL, '王学刚', '13589033116', '', '技术服务', 'FW10-003高强度轻质铝合金-王学刚.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (92, NULL, '基于三元组深度学习的相似视频内容检索方法及系统', '11计算机学院', '人工智能', NULL, '聂秀山', '', 'niexiushan@163.com', '技术许可', 'CG11-001基于三元组深度学习的相似视频内容检索方法及系统-聂秀山.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (93, NULL, '基于FPGA的SOPC多轴联动运动控制器及控制系统', '11计算机学院', '先进制造与自动化', NULL, '尤宝山', '15966617609', '', '技术转让；技术许可；作价投资；合作实施；合作开发', 'CG11-002基于FPGA的SOPC多轴联动运动控制器及控制系统-尤宝山.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (94, NULL, '移动供热监控计量系统', '11计算机学院', '先进制造与自动化（工业生产过程控制系统）', NULL, '岳斌', '15665868771', '', '技术转让；合作实施', 'CG11-003移动供热监控计量系统-岳斌.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (95, NULL, '分布式光伏自动化运维平台', '11计算机学院', '高技术服务信息技术服务，高技术专业化服务。', NULL, '刘新锋', '13370510651', '', '技术许可；作价投资；合作实施；合作开发', 'CG11-004分布式光伏自动化运维平台-刘新锋.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (96, NULL, '交通信息数据采集软件', '11计算机学院', '电子信息（智能交通和轨道交通技术）', NULL, '赵洪銮', '13589048318', '', '技术许可；作价投资；合作实施；合作开发', 'CG11-005交通信息数据采集软件-赵红銮.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (97, NULL, '视频对象定位平台', '11计算机学院', '人工智能', NULL, '刘萌', '18642437975', '', '技术转让；技术许可；合作实施', 'CG11-006视频对象定位平台-刘萌.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (98, NULL, '一种风电齿轮箱故障检测方法、系统、设备及介质', '11计算机学院', '电子信息', NULL, '徐遵义', '0531-86361306', '', '技术转让；技术许可；合作开发', 'CG11-007一种风电齿轮箱故障检测方法、系统、设备及介质-徐遵义.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (99, NULL, '行业平台社区交流与知识管理系统', '11计算机学院', '电子信息', NULL, '邹丽', '13795189212', '', '技术转让；技术许可；合作实施；合作开发', 'CG11-008行业平台社区交流与知识管理系统-邹丽.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (100, NULL, '基于对象三元语言概念的个性化新闻推荐方法及系统', '11计算机学院', '电子信息', NULL, '邹丽', '13795189212', '', '技术转让；技术许可；合作开发', 'CG11-009基于对象三元语言概念的个性化新闻推荐方法及系统-邹丽.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (101, NULL, '一种融合时间窗技术和评分预测模型的推荐算法', '11计算机学院', '电子信息', NULL, '张志军', '13589067037', '', '技术转让；技术许可；合作开发', 'CG11-010一种融合时间窗技术和评分预测模型的推荐算法-张志军.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (102, NULL, '一种基于便携加速度计和陀螺仪的日常走、跑体能消耗预测方法', '11计算机学院', '人工智能', NULL, '王丕坤', '18764723276', '', '合作开发', 'CG11-011一种基于便携加速度计和陀螺仪的日常走、跑体能消耗预测方法-王丕坤.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (103, NULL, '包含假结的RNA结构预测方法及装置', '11计算机学院', '医药生物技术', NULL, '刘振栋', '13964063526', '', '技术转让', 'CG11-012包含假结的RNA结构预测方法-刘振栋.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (104, NULL, '体育用品识别系统', '11计算机学院', '人工智能', NULL, '袭肖明', '15069056021', '', '技术许可', 'CG11-013体育用品识别系统-袭肖明.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (105, NULL, '自然资源资金监测监管系统', '11计算机学院', '自然资源生态保护修复领域，行业大数据平台', NULL, '刘新锋', '13370510651', '', '技术服务；技术培训', 'FW11-001自然资源资金监测监管系统-刘新锋.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (106, NULL, '分布式能源O2O智慧运维平台', '11计算机学院', '分布式光伏、风电运维、能源监控，行业大数据平台', NULL, '刘新锋', '13370510651', '', '技术服务；技术培训', 'FW11-002分布式能源O2O智慧运维平台-刘新锋.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (107, NULL, '基于多源信息融合的个性化电子商务推荐系统应用研究', '11计算机学院', '电子信息', NULL, '张志军', '13589067037', '', '技术服务；技术咨询；技术培训', 'FW11-003基于多源信息融合的个性化电子商务推荐系统应用研究-张志军.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (108, NULL, '民营企业智能技术改造面临的困境与对策', '11计算机学院', '电子信息', NULL, '魏珑', '15863409839', '', '技术服务', 'FW11-004民营企业智能技术改造面临的困境与对策-魏珑.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (109, NULL, '拓扑数据分析', '12理学院', '高技术服务。', NULL, '夏省祥', '15069050096', '', '技术咨询', 'FW12-001拓扑数据分析-夏省祥.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (110, NULL, '大容量多参量智能光纤传感技术', '12理学院', '先进制造与自动化。', NULL, '赵燕杰', '15866761875', '', '技术服务；技术咨询', 'FW12-002大容量多参量智能光纤传感技术-赵燕杰.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (111, NULL, '基于碳纳米纤维的油水分离技术', '12理学院', '资源与环境。', NULL, '赵相龙', '13396400491', '', '技术服务；技术咨询', 'FW12-003油水分离技术-赵相龙.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (112, NULL, '车联网安全与隐私保护', '12理学院', '高技术服务。', NULL, '王凤和', '15069008265', '', '技术服务；技术咨询', 'FW12-004车联网安全与隐私保护-王凤和.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (113, NULL, '数学建模与数据分析', '12理学院', '高技术服务。', NULL, '赵庆利', '15966322961', '', '技术服务；技术咨询；技术培训', 'FW12-005数学建模与数据分析-赵庆利.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (114, NULL, '医学影像的去噪与增强技术', '12理学院', '高技术服务。', NULL, '陈怀广', '15169150623', '', '技术服务；技术咨询', 'FW12-006医学影像的去噪与增强技术-陈怀广.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (115, NULL, '基于模糊数学的茶树修剪叶再利用', '12理学院', '资源与环境。', NULL, '陈铃', '15853149709', '', '技术服务；技术咨询', 'FW12-007基于模糊数学的茶树修剪叶再利用-陈铃.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (116, NULL, '教育教学法治化研究', '13法学院', '法学', NULL, '吴安新', '13285319092', '', '技术服务；技术咨询', 'FW13-001教育教学法治化研究-吴安新.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (117, NULL, '中小企业知识产权保护研究', '13法学院', '知识产权法', NULL, '王淑华', '', 'wshuhua@sdjzu.edu.com', '技术服务；技术咨询；技术培训', 'FW13-002知识产权保护-王淑华.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (118, NULL, '（1）规范性文件立法前评估审核（2）规范性文件实施后评估审核（3）存量规范性文件公平竞争审查', '13法学院', '法学', NULL, '朱宝丽', '13210507752', '', '技术服务；技术咨询；技术培训', 'FW13-003立法评估审核-朱宝丽.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (119, NULL, '1.生态环境法律法规普法宣传项目2.生态环境法治年度发展研究及宣教项目3.生态文明法治宣教项目4.环境保护立法5.生态环境损害赔偿审核项目', '13法学院', '环境与资源保护法学', NULL, '王翠敏', '13678805619', '', '技术服务；技术咨询；技术培训', 'FW13-004生态环境治理与保护法律服务-王翠敏.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (120, NULL, '黄河流域生物安全与环境犯罪的刑事法保护', '13法学院', '刑法学，刑事诉讼法学', NULL, '吴小帅', '', 'wuxiaoshuai@126.com   ', '技术服务；技术咨询；技术培训', 'FW13-005黄河流域生物安全与环境犯罪的刑事法保护-吴小帅.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (121, NULL, '企业合规风险防范应对之法律服务', '13法学院', '法学。', NULL, '刘成安', '18553107397', '', '技术服务；技术咨询', 'FW13-006企业合规法律服务-刘成安.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (122, NULL, '社区智慧康养服务项目', '13法学院', '社会学、公共管理、社会工作', NULL, '高利平', '13791072036', '', '技术服务', 'FW13-007社区智慧康养服务项目-高利平.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (123, NULL, '槐荫区“青合站”参式社区治理，构建民政微服务枢纽型平台', '13法学院', '社会学、公共管理、社会工作', NULL, '左敏', '18653182886', '', '技术服务', 'FW13-008社会工作服务站参与社区治理-左敏.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (124, NULL, '社会工作视角下的青春期亲子沟通课程开发', '13法学院', '社会学、公共管理、社会工作', NULL, '张干群', '', 'ganqunzh@163.com', '技术服务；技术咨询；技术培训', 'FW13-009社会工作视角下的青春期亲子沟通课程开发-张干群.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (125, NULL, '城市失能老人长期照护福利供给实践及研究', '13法学院', '社会学、公共管理、社会工作', NULL, '韩晶', '', '', '技术服务；技术咨询；技术培训', 'FW13-010城市失能老人长期照护福利供给实践及研究-陈海涛.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (126, NULL, '涉外企业语言培训服务与科技转化服务', '14外语学院', '人才培训 语言服务 科技转化', NULL, '田野', '15588897890', '', '技术服务 技术咨询 技术培训', 'FW14-001涉外企业语言培训服务与科技转化服务-田野.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (127, NULL, '多语言研究与服务', '14外语学院', '语言服务', NULL, '王海峰', '15668309072', '', '技术服务 技术咨询 技术培训', 'FW14-002多语言研究与服务-王海峰.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (128, NULL, '预应力锚索与抗滑桩联合加固路基高边坡关键技术', '15交通学院', '土木工程', NULL, '张思峰', '0531-86361989', '', '\"技术转让 技术许可 合作实施  合作开发', 'CG15-001预应力锚索与抗滑桩联合加固路基高边坡关键技术-张思峰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (129, NULL, '大型钢桥桥面铺装新型材料的研发与应用', '15交通学院', '道路工程', NULL, '任瑞波', '0531-86361272', '', NULL, 'CG15-002大型钢桥桥面铺装新型材料的研发与应用-任瑞波.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (130, NULL, '新型全预制装配式桥梁结构体系与施工关键技术', '15交通学院', '土木工程（智能建造、装配式桥梁结构）', NULL, '付涛', '15168877033', '', '合作实施', 'FW15-001新型全预制装配式桥梁结构体系与施工关键技术-付涛.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (131, NULL, 'MaaS 动态发展下无车群体私家车保有决策演化机理研究', '15交通学院', '高技术服务', NULL, '牟振华', '15953171428', '', '技术服务 技术咨询 技术培训', 'FW15-002MaaS 动态发展下无车群体私家车保有决策演化机理研究-牟振华.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (132, NULL, '超大直径盾构掘进与注浆协同控制技术', '15交通学院', '先进制造与自动化', NULL, '宋曙光', '18560231985', '', '技术咨询', 'FW15-003超大直径盾构掘进与注浆协同控制技术-宋曙光.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (133, NULL, '大断面隧道破碎围岩变形特性及施工关键技术', '15交通学院', '先进制造与自动化', NULL, '谢璨', '15562491873', '', '技术服务', 'FW15-004大断面隧道破碎围岩变形特性及施工关键技术-谢璨.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (134, NULL, '基于碳纳米管的聚合物改性沥青粘韧协同增强技术', '15交通学院', '道路建筑材料', NULL, '王鹏', '18560027486', '', '技术服务', 'FW15-005基于碳纳米管的聚合物改性沥青粘韧协同增强技术-王鹏.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (135, NULL, '风化砂在北方中低山丘陵区高速公路建设中的研究与应用', '15交通学院', '路基工程', NULL, '胡文军', '13791036460', '', '技术服务', 'FW15-006风化砂在北方中低山丘陵区高速公路建设中的研究与应用-胡文军.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (136, NULL, '桥梁群健康监测与安全评估技术', '15交通学院', '交通基础设施工程', NULL, '亓兴军', '13953170704', '', '技术服务', 'FW15-007桥梁群健康监测与安全评估技术-亓兴军.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (137, NULL, '中小跨径桥梁承载力快速测试技术', '15交通学院', '交通基础设施工程', NULL, '亓兴军', '13953170704', '', '技术服务', 'FW15-008 中小跨径桥梁承载力快速测试技术-亓兴军.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (138, NULL, '公路桥梁墩台应急加固关键技术', '15交通学院', '交通基础设施工程', NULL, '亓兴军', '13953170704', '', '技术服务', 'FW15-009公路桥梁墩台应急加固关键技术-亓兴军.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (139, NULL, '装配式可恢复桥梁结构体系关键技术', '15交通学院', '交通基础设施工程', NULL, '亓兴军', '13953170704', '', '技术服务', 'FW15-010装配式可恢复桥梁结构体系关键技术-亓兴军.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (140, NULL, '卫星遥感定量反演技术服务', '16测绘学院', '新一代信息技术产业、生态遥感', NULL, '孟飞', '13589043066', '', '技术服务', 'FW16-001卫星遥感定量反演技术服务-孟飞.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (141, NULL, '多视多角度近低空遥感影像智能识别与规则化处理算法研究', '16测绘学院', '新一代信息技术产业、遥感科学、计算机视觉、模式识别', NULL, '姚国标', '18766159396', '', '技术服务', 'FW16-002多视多角度近低空遥感影像智能识别与规则化处理算法研究-姚国标.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (142, NULL, '基于InSAR技术的高精度三维地表形变解算方法研究', '16测绘学院', '新一代信息技术产业、大地测量学与测量工程', NULL, '王志伟', '15650032825', '', '技术服务；技术咨询；联合申报相关领域的合作项目', 'FW16-003基于InSAR技术的高精度三维地表形变解算方法研究-王志伟.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (143, NULL, '基于空天地协同测量技术的建构筑物形变监测研究', '16测绘学院', '新一代信息技术产业、测绘科学与技术 ', NULL, '桑文刚', '18615403339', '', '技术服务；技术咨询；技术培训；联合申报相关领域的合作项目', 'FW16-004基于空天地协同测量技术的建构筑物形变监测研究-桑文刚.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (144, NULL, '西北地区地震灾害高风险区房屋存量专题数据集制备技术服务项目', '16测绘学院', '新一代信息技术产业、地理信息系统、防灾减灾', NULL, '邢华桥', '18766120667', '', '技术服务；技术咨询；技术培训', 'FW16-005西北地区地震灾害高风险区房屋存量专题数据集制备技术服务项目-邢华侨.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (145, NULL, '知识图谱蕴含地理关系三元组优化', '16测绘学院', '新一代信息技术产业、地理信息科学', NULL, '仇培元', '18910282623', '', '技术服务', 'FW16-006知识图谱蕴含地理关系三元组优化-仇培元.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (146, NULL, '遥感地质综合应用及二三维地理信息平台研发', '16测绘学院', '新一代信息技术产业、地图学与地理信息系统、遥感科学与技术', NULL, '于明洋', '13589109198', '', '技术服务', 'FW16-007遥感地质综合应用及二三维地理信息平台研发-于明洋.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (147, NULL, '氮磷胁迫下黄河三角洲滨海湿地植被群落种间竞争光谱特征分析及参数响应研究', '16测绘学院', '新一代信息技术产业、生态遥感', NULL, '刘浦东', '15650030358', '', '技术服务；技术咨询；技术培训', 'FW16-008氮磷胁迫下黄河三角洲滨海湿地植被群落种间竞争光谱特征分析及参数响应研究-刘浦东.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (148, NULL, '城市生态演变分析及可持续性评估研究', '16测绘学院', '新一代信息技术产业、城市生态、城市遥感、地理信息系统', NULL, '孙英君', '18605317380', '', '技术服务；技术咨询；技术培训', 'FW16-009城市生态演变分析及可持续性评估研究-孙英君.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (149, NULL, '基于智能手机WiFi/气压计/IMU的室内三维自适应高精度定位方法', '16测绘学院', '新一代信息技术产业、空间定位数据分析与应用', NULL, '毕京学', '13969180014', '', '技术服务', 'FW16-010基于智能手机WiFi气压计IMU的室内三维自适应高精度定位方法-毕京学.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (150, NULL, '基于GNSS 技术的济南区域高时空分辨率大气水汽场的构建', '16测绘学院', '新一代信息技术产业、测绘科学与技术 ', NULL, '郭秋英', '13370551679', '', '技术服务；技术咨询；技术培训', 'FW16-011基于GNSS 的济南区域高时空分辨率大气水汽场的构建-郭秋英.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (151, NULL, '面向复杂城市空间场景的倾斜影像三维Mesh 模型构建与优化', '16测绘学院', '新一代信息技术产业、测绘科学与技术', NULL, '马东岭', '13964052758', '', '技术服务；技术咨询', 'FW16-012面向复杂城市空间场景的倾斜影像三维Mesh 模型-马东岭.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (152, NULL, '党建服务项目', '17马克思学院', '马克思主义理论，党的建设', NULL, '王慧', '（0531）86361181 ', '', '技术服务；技术培训', 'FW17-001党建服务项目-王慧.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (153, NULL, '工匠精神培育服务项目', '17马克思学院', '企业文化管理，员工核心价值观培育', NULL, '张鹏', '（0531）86362658  ', '', '技术服务；技术培训', 'FW17-002工匠精神培育服务项目-张鹏.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (154, NULL, '生态文明服务项目', '17马克思学院', '马克思主义生态理论、企业管理', NULL, '巩克菊', '（0531）86362659 ', '', '技术服务；技术培训', 'FW17-003生态文明服务项目-巩克菊.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (155, NULL, '建筑物移位改造技术', '01土木学院', '建筑物移位', NULL, '李莹', '13305419536', '', '政策咨询；技术培训', 'CG01-001建筑物移位改造技术-李莹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (156, NULL, '建筑物纠倾技术', '01土木学院', '建筑物纠倾', NULL, '李莹', '13305419536', '', '技术服务；技术咨询', 'CG01-002建筑物纠倾技术-李莹.docx', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (157, NULL, '建筑物地下增层改造技术', '01土木学院', '地下增层改造', NULL, '李莹', '13305419536', '', '技术服务；技术咨询', 'CG01-003建筑物地下增层改造技术-李莹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (158, NULL, '新型钢结构关键技术与工程应用', '01土木学院', '新型钢结构关键技术', NULL, '刘哲', '13389995961', '', '技术服务；技术咨询', 'CG01-004新型钢结构关键技术与工程应用-刘哲.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (159, NULL, '新型混凝土材料配制技术', '01土木学院', '混凝土材料粘度调节剂、负温压浆料技术、自流平石膏技术', NULL, '逄鲁峰', '18615189333', '', '技术服务；技术咨询', 'CG01-005新型混凝土材料配制技术-逄鲁峰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (160, NULL, '建筑物移位改造技术', '01土木学院', '工业与民用建筑', NULL, '李莹', '13305419536', '', '技术服务；技术咨询', 'FW01-001建筑物移位改造服务-李莹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (161, NULL, '既有建（构）筑物纠倾技术', '01土木学院', '工业与民用建筑、交通工程、岩土工程等', NULL, '李莹', '13305419536', '', '技术服务；技术咨询', 'FW01-002建（构）筑物纠倾服务-李莹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (162, NULL, '既有结构性能评估与加固改造', '01土木学院', '工业与民用建筑、交通工程、岩土工程等', NULL, '李莹', '13305419536', '', '技术服务；技术咨询', 'FW01-003既有结构性能评估与加固改造服务-李莹.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (163, NULL, '复杂地层既有建（构）筑托换加固技术', '01土木学院', '工业与民用建筑、交通工程、电力工程、岩土工程等', NULL, '孙剑平', '15069192907', '', '技术服务；技术咨询', 'FW01-004复杂地层既有建（构）筑托换加固服务-孙剑平.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (164, NULL, '既有地基基础、基坑、边坡及挡墙工程检测鉴定及安全评估', '01土木学院', '工业与民用建筑、交通工程、电力工程、岩土工程等', NULL, '孙剑平', '15069192907', '', '技术服务；技术咨询', 'FW01-005既有地基基础、基坑、边坡及挡墙工程检测鉴定及安全评估服务-孙剑平.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (165, NULL, '复杂环境深大基坑支护及近接建（构）筑物保护技术', '01土木学院', '工业与民用建筑、交通工程、电力工程、岩土工程等', NULL, '孙剑平', '15069192907', '', '技术服务；技术咨询', 'FW01-006复杂环境深大基坑支护及近接建（构）筑物保护技术服务-孙剑平.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (166, NULL, '地下工程（浅埋及盾构隧道、大型顶管）施工控制及近接建（构）筑物保护技术', '01土木学院', '工业与民用建筑、交通工程、电力工程、岩土工程等', NULL, '孙剑平', '15069192907', '', '技术服务；技术咨询', 'FW01-007地下工程（浅埋及盾构隧道、大型顶管）施工控制及近接建（构）筑物保护技术服务-孙剑平.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (167, NULL, '改性速生杨木系列技术', '01土木学院', '土木工程（装配式建筑，新型结构体系）', NULL, '王玉镯', '13793143899', '', '技术服务；技术咨询', 'FW01-008新型复合木结构技术服务-王玉镯.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (168, NULL, '高强石膏基胶凝材料及其应用技术', '01土木学院', '工业与民用建筑、岩土工程等', NULL, '王艺霖', '15662655983', '', '技术转让；技术许可；技术服务；技术咨询', 'FW01-009高强石膏基胶凝材料及其应用服务-王艺霖.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (169, NULL, '新型装配式混凝土结构体系技术', '01土木学院', '工业与民用建筑等', NULL, '周广强', '13305419527', '', '技术服务；技术咨询', 'FW01-010新型装配式混凝土结构体系技术服务-周广强.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (170, NULL, '城市规建管一体化建设中的CIM应用技术', '01土木学院', '工业与民用建筑、城市建设等', NULL, '沈旭', '15063393061', '', '技术服务；技术咨询', 'FW01-011城市规建管一体化建设中的CIM应用技术服务-沈旭.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (171, NULL, '产业园区数字孪生可视化运营技术', '01土木学院', '工业与民用建筑', NULL, '沈旭', '15063393061', '', '技术服务；技术咨询', 'FW01-012产业园区数字孪生可视化运营技术服务-沈旭.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (172, NULL, '城市市政管理-智能灯杆CIM管理应用技术', '01土木学院', '工业与民用建筑、市政工程、交通工程、电力工程等', NULL, '沈旭', '15063393061', '', '技术服务；技术咨询', 'FW01-013城市市政管理-智能灯杆CIM管理应用技术服务-沈旭.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (173, NULL, '混凝土粘度调节剂技术', '01土木学院', '工业与民用建筑', NULL, '逄鲁峰', '18615189333', '', '技术服务；技术咨询', 'FW01-014混凝土粘度调节剂技术服务-逄鲁峰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (174, NULL, '负温压浆料制备与应用', '01土木学院', '工业与民用建筑、材料科学与工程、交通工程等', NULL, '逄鲁峰', '18615189333', '', '技术服务；技术咨询', 'FW01-015负温压浆料技术服务-逄鲁峰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (175, NULL, '自流平石膏技术', '01土木学院', '工业与民用建筑', NULL, '逄鲁峰', '18615189333', '', '技术服务；技术咨询', 'FW01-016自流平石膏技术服务-逄鲁峰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (176, NULL, '免蒸养RPC技术', '01土木学院', '工业与民用建筑、交通工程', NULL, '逄鲁峰', '18615189333', '', '技术服务；技术咨询', 'FW01-017免蒸养RPC技术服务-逄鲁峰.doc', NULL, '2023-08-21', 149);
INSERT INTO `tec_achievement` VALUES (177, NULL, 'test', '06学院', 'test', '专利', 'test', '1234', '1234', 'testtesttest', 'JOSH基础开发教程V1.3.pdf', '2023-08-01', '2023-08-21', 46);

-- ----------------------------
-- Table structure for tec_attachFile
-- ----------------------------
DROP TABLE IF EXISTS `tec_attachFile`;
CREATE TABLE `tec_attachFile`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `achievement_id` int(11) NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tec_attachFile
-- ----------------------------
INSERT INTO `tec_attachFile` VALUES (1, 1, 'FW02-001强制隔离戒毒所建设-李永福.doc', '/02管理学院/FW02-001强制隔离戒毒所建设-李永福.doc');
INSERT INTO `tec_attachFile` VALUES (2, 2, 'FW02-002人民防空工程绿色施工成本控制研究-李永福.docx', '/02管理学院/FW02-002人民防空工程绿色施工成本控制研究-李永福.docx');
INSERT INTO `tec_attachFile` VALUES (3, 3, 'FW02-003人民防空工程绿色施工风险管控及优化服务-李永福.doc', '/02管理学院/FW02-003人民防空工程绿色施工风险管控及优化服务-李永福.doc');
INSERT INTO `tec_attachFile` VALUES (4, 4, 'FW02-004人民防空工程绿色施工评价指标体系研究-李永福.doc', '/02管理学院/FW02-004人民防空工程绿色施工评价指标体系研究-李永福.doc');
INSERT INTO `tec_attachFile` VALUES (5, 5, 'FW02-005国土空间规划项目、村庄规划编制服务-刘金花.doc', '/02管理学院/FW02-005国土空间规划项目、村庄规划编制服务-刘金花.doc');
INSERT INTO `tec_attachFile` VALUES (6, 6, 'FW02-006农村土地综合整治服务-刘金花.doc', '/02管理学院/FW02-006农村土地综合整治服务-刘金花.doc');
INSERT INTO `tec_attachFile` VALUES (7, 7, 'FW02-007居住用地市场调控政策机制研究-刘金花.doc', '/02管理学院/FW02-007居住用地市场调控政策机制研究-刘金花.doc');
INSERT INTO `tec_attachFile` VALUES (8, 8, 'FW02-008康养项目投资决策与运营服务-郑生钦.doc', '/02管理学院/FW02-008康养项目投资决策与运营服务-郑生钦.doc');
INSERT INTO `tec_attachFile` VALUES (9, 9, 'FW02-010智慧安全管理及安全文化提升服务-杨杰.doc', '/02管理学院/FW02-010智慧安全管理及安全文化提升服务-杨杰.doc');
INSERT INTO `tec_attachFile` VALUES (10, 10, 'CG03-001工业机械设备在线监测与智能诊断技术-宋永兴.doc', '/03热能学院/CG03-001工业机械设备在线监测与智能诊断技术-宋永兴.doc');
INSERT INTO `tec_attachFile` VALUES (11, 11, 'CG03-002工业源无组织排放VOCs低能耗高效净化技术-高岩.doc', '/03热能学院/CG03-002工业源无组织排放VOCs低能耗高效净化技术-高岩.doc');
INSERT INTO `tec_attachFile` VALUES (12, 12, 'CG03-003余热利用高盐工业废水蒸发器-杨洛鹏.doc', '/03热能学院/CG03-003余热利用高盐工业废水蒸发器-杨洛鹏.doc');
INSERT INTO `tec_attachFile` VALUES (13, 13, 'CG03-004金属有机骨架材料在生物质能源转化中的应用-李辉.doc', '/03热能学院/CG03-004金属有机骨架材料在生物质能源转化中的应用-李辉.doc');
INSERT INTO `tec_attachFile` VALUES (14, 14, 'CG03-005人工环境通风保障技术研究-雷文君.doc', '/03热能学院/CG03-005人工环境通风保障技术研究-雷文君.doc');
INSERT INTO `tec_attachFile` VALUES (15, 15, 'FW03-001地源热泵及中深层地热能建筑利用技术服务-于明志.doc', '/03热能学院/FW03-001地源热泵及中深层地热能建筑利用技术服务-于明志.doc');
INSERT INTO `tec_attachFile` VALUES (16, 16, 'FW03-002燃气热力规划技术咨询服务-田贯三.doc', '/03热能学院/FW03-002燃气热力规划技术咨询服务-田贯三.doc');
INSERT INTO `tec_attachFile` VALUES (17, 17, 'FW03-003有机相变材料的储热性能及表征测试服务-李辉.doc', '/03热能学院/FW03-003有机相变材料的储热性能及表征测试服务-李辉.doc');
INSERT INTO `tec_attachFile` VALUES (18, 18, 'FW03-004农产品仓储物流品质状态检测、预测研究及其调控关键技术研发服务-杨开敏.doc', '/03热能学院/FW03-004农产品仓储物流品质状态检测、预测研究及其调控关键技术研发服务-杨开敏.doc');
INSERT INTO `tec_attachFile` VALUES (19, 19, 'FW03-005复杂体系流动传热的数值仿真服务-陈宝明.doc', '/03热能学院/FW03-005复杂体系流动传热的数值仿真服务-陈宝明.doc');
INSERT INTO `tec_attachFile` VALUES (20, 20, 'CG04-001垃圾渗滤液关键处理技术攻关与产业化应用-王凯.doc', '/04市政学院/CG04-001垃圾渗滤液关键处理技术攻关与产业化应用-王凯.doc');
INSERT INTO `tec_attachFile` VALUES (21, 21, 'CG04-002微生物与植物互作理论助推环境生物修复新技术-钟传青.doc', '/04市政学院/CG04-002微生物与植物互作理论助推环境生物修复新技术-钟传青.doc');
INSERT INTO `tec_attachFile` VALUES (22, 22, 'FW04-001水污染防治法实施情况评估服务-武道吉.doc', '/04市政学院/FW04-001水污染防治法实施情况评估服务-武道吉.doc');
INSERT INTO `tec_attachFile` VALUES (23, 23, 'FW04-002分质供水惠民工程服务-武道吉.doc', '/04市政学院/FW04-002分质供水惠民工程服务-武道吉.doc');
INSERT INTO `tec_attachFile` VALUES (24, 24, 'FW04-003空气质量形势分析服务-张桂芹.doc', '/04市政学院/FW04-003空气质量形势分析服务-张桂芹.doc');
INSERT INTO `tec_attachFile` VALUES (25, 25, 'FW04-004大气颗粒物来源解析研究-张桂芹.doc', '/04市政学院/FW04-004大气颗粒物来源解析研究-张桂芹.doc');
INSERT INTO `tec_attachFile` VALUES (26, 26, 'FW04-005高耗能、重污染染料化工行业绿色高效清洁生产研究-武道吉.doc', '/04市政学院/FW04-005高耗能、重污染染料化工行业绿色高效清洁生产研究-武道吉.doc');
INSERT INTO `tec_attachFile` VALUES (27, 27, 'FW04-006饲用微生态制剂研制-姜天翼.docx', '/04市政学院/FW04-006饲用微生态制剂研制-姜天翼.docx');
INSERT INTO `tec_attachFile` VALUES (28, 28, 'FW04-007农村生活污水治理服务-韩庆祥.doc', '/04市政学院/FW04-007农村生活污水治理服务-韩庆祥.doc');
INSERT INTO `tec_attachFile` VALUES (29, 29, 'FW04-008企业用地信息采集及风险筛查纠偏服务-薛维纳.doc', '/04市政学院/FW04-008企业用地信息采集及风险筛查纠偏服务-薛维纳.doc');
INSERT INTO `tec_attachFile` VALUES (30, 30, 'FW04-009串联式河道水质改善与水资源调蓄研究-张志斌.doc', '/04市政学院/FW04-009串联式河道水质改善与水资源调蓄研究-张志斌.doc');
INSERT INTO `tec_attachFile` VALUES (31, 31, 'CG05-001装配式加气混凝土复合保温外墙板系统及关键应用技术-苗继奎.doc', '/05建筑学院/CG05-001装配式加气混凝土复合保温外墙板系统及关键应用技术-苗继奎.doc');
INSERT INTO `tec_attachFile` VALUES (32, 32, 'FW05-001基于绿色人居环境及地域文脉特色的建筑设计实践及研究-李晓东.doc', '/05建筑学院/FW05-001基于绿色人居环境及地域文脉特色的建筑设计实践及研究-李晓东.doc');
INSERT INTO `tec_attachFile` VALUES (33, 33, 'FW05-002面向地域空间的城市设计实践-赵亮.doc', '/05建筑学院/FW05-002面向地域空间的城市设计实践-赵亮.doc');
INSERT INTO `tec_attachFile` VALUES (34, 34, 'FW05-003宁夏国家生态移民示范项目太阳能双效利用及节能关键技术研究与应用-薛一冰.doc', '/05建筑学院/FW05-003宁夏国家生态移民示范项目太阳能双效利用及节能关键技术研究与应用-薛一冰.doc');
INSERT INTO `tec_attachFile` VALUES (35, 35, 'FW05-004绿色大学园区环境综合保障技术研究与应用-薛一冰.doc', '/05建筑学院/FW05-004绿色大学园区环境综合保障技术研究与应用-薛一冰.doc');
INSERT INTO `tec_attachFile` VALUES (36, 36, 'FW05-005农房能效提升研究与应用-薛一冰.doc', '/05建筑学院/FW05-005农房能效提升研究与应用-薛一冰.doc');
INSERT INTO `tec_attachFile` VALUES (37, 37, 'FW05-006绿色低碳城区及绿色建筑设计与咨询-何文晶.doc', '/05建筑学院/FW05-006绿色低碳城区及绿色建筑设计与咨询-何文晶.doc');
INSERT INTO `tec_attachFile` VALUES (38, 38, 'CG07-001基于结构损伤映射表征的塔机远程智能诊断技术及应用-宋世军.doc', '/07机电学院/CG07-001基于结构损伤映射表征的塔机远程智能诊断技术及应用-宋世军.doc');
INSERT INTO `tec_attachFile` VALUES (39, 39, 'CG07-002城市防洪救灾技术与设施-张明勤.doc', '/07机电学院/CG07-002城市防洪救灾技术与设施-张明勤.doc');
INSERT INTO `tec_attachFile` VALUES (40, 40, 'CG07-003MSF1200型变螺旋多肢箍钢筋骨架成型机-张明勤.doc', '/07机电学院/CG07-003MSF1200型变螺旋多肢箍钢筋骨架成型机-张明勤.doc');
INSERT INTO `tec_attachFile` VALUES (41, 41, 'CG07-004RBM50型钢筋捆扎机-张明勤.doc', '/07机电学院/CG07-004RBM50型钢筋捆扎机-张明勤.doc');
INSERT INTO `tec_attachFile` VALUES (42, 42, 'CG07-005无避让（有无动力）双层车库系列-张明勤.doc', '/07机电学院/CG07-005无避让（有无动力）双层车库系列-张明勤.doc');
INSERT INTO `tec_attachFile` VALUES (43, 43, 'CG07-006超薄型撑顶式立体车库汽车搬运机器人-张明勤.doc', '/07机电学院/CG07-006超薄型撑顶式立体车库汽车搬运机器人-张明勤.doc');
INSERT INTO `tec_attachFile` VALUES (44, 44, 'CG07-007机械装备的数字化、网络化和智能化控制-姬帅.doc', '/07机电学院/CG07-007机械装备的数字化、网络化和智能化控制-姬帅.doc');
INSERT INTO `tec_attachFile` VALUES (45, 45, 'CG07-008增减材复合制造应力主动控制技术-赵彦华.doc', '/07机电学院/CG07-008增减材复合制造应力主动控制技术-赵彦华.doc');
INSERT INTO `tec_attachFile` VALUES (46, 46, 'CG07-009车用氢燃料电池动力系统集成技术研究-李新海.doc', '/07机电学院/CG07-009车用氢燃料电池动力系统集成技术研究-李新海.doc');
INSERT INTO `tec_attachFile` VALUES (47, 47, 'CG07-010AL-Smartdrive多工程机械自主学习与智能协同控制系统-罗映.doc', '/07机电学院/CG07-010AL-Smartdrive多工程机械自主学习与智能协同控制系统-罗映.doc');
INSERT INTO `tec_attachFile` VALUES (48, 48, 'FW07-001创新方法（TRIZ）培训-张明勤.doc', '/07机电学院/FW07-001创新方法（TRIZ）培训-张明勤.doc');
INSERT INTO `tec_attachFile` VALUES (49, 49, 'FW07-002智能工程机械创新设计理论与技术-张青.doc', '/07机电学院/FW07-002智能工程机械创新设计理论与技术-张青.doc');
INSERT INTO `tec_attachFile` VALUES (50, 50, 'FW07-003高性能金属构件多尺度全流程设计与制造关键技术研究-王忠雷.doc', '/07机电学院/FW07-003高性能金属构件多尺度全流程设计与制造关键技术研究-王忠雷.doc');
INSERT INTO `tec_attachFile` VALUES (51, 51, 'CG08-001智慧建筑物联网系统-李成栋.doc', '/08信电学院/CG08-001智慧建筑物联网系统-李成栋.doc');
INSERT INTO `tec_attachFile` VALUES (52, 52, 'CG08-002中医按摩机器人-高焕兵.doc', '/08信电学院/CG08-002中医按摩机器人-高焕兵.doc');
INSERT INTO `tec_attachFile` VALUES (53, 53, 'CG08-003大型公共建筑用电数据采集系统及智能用电控制系统-高焕兵.doc', '/08信电学院/CG08-003大型公共建筑用电数据采集系统及智能用电控制系统-高焕兵.doc');
INSERT INTO `tec_attachFile` VALUES (54, 54, 'CG08-004下肢助力机器人-高焕兵.doc', '/08信电学院/CG08-004下肢助力机器人-高焕兵.doc');
INSERT INTO `tec_attachFile` VALUES (55, 55, 'CG08-005人造板表面缺陷在线检测系统-周玉成.doc', '/08信电学院/CG08-005人造板表面缺陷在线检测系统-周玉成.doc');
INSERT INTO `tec_attachFile` VALUES (56, 56, 'CG08-006基于数据的暖通空调系统故障诊断方法及系统-张汉元.doc', '/08信电学院/CG08-006基于数据的暖通空调系统故障诊断方法及系统-张汉元.doc');
INSERT INTO `tec_attachFile` VALUES (57, 57, 'CG08-007多引下线接地电阻检测方法-隋首钢.doc', '/08信电学院/CG08-007多引下线接地电阻检测方法-隋首钢.doc');
INSERT INTO `tec_attachFile` VALUES (58, 58, 'CG08-008一种交通锥摆放装置-高鹤.doc', '/08信电学院/CG08-008一种交通锥摆放装置-高鹤.doc');
INSERT INTO `tec_attachFile` VALUES (59, 59, 'CG08-009基于高速新能源再利用的撬装沼气站原料收集装置-高鹤.doc', '/08信电学院/CG08-009基于高速新能源再利用的撬装沼气站原料收集装置-高鹤.doc');
INSERT INTO `tec_attachFile` VALUES (60, 60, 'CG08-010能耗采集与分析系统-郑学汉.doc', '/08信电学院/CG08-010能耗采集与分析系统-郑学汉.doc');
INSERT INTO `tec_attachFile` VALUES (61, 61, 'CG08-011强弱电一体化智能监控系统-郑学汉.doc', '/08信电学院/CG08-011强弱电一体化智能监控系统-郑学汉.doc');
INSERT INTO `tec_attachFile` VALUES (62, 62, 'CG08-012可见光通信技术验证平台-邓晓平.doc', '/08信电学院/CG08-012可见光通信技术验证平台-邓晓平.doc');
INSERT INTO `tec_attachFile` VALUES (63, 63, 'CG08-013海洋定位信标系统-刘存根.doc', '/08信电学院/CG08-013海洋定位信标系统-刘存根.doc');
INSERT INTO `tec_attachFile` VALUES (64, 64, 'CG08-014工程机械智能化改造-陶亮.doc', '/08信电学院/CG08-014工程机械智能化改造-陶亮.doc');
INSERT INTO `tec_attachFile` VALUES (65, 65, 'CG08-015基于物联网的智能感知与建筑用能优化控制技术-陶亮.doc', '/08信电学院/CG08-015基于物联网的智能感知与建筑用能优化控制技术-陶亮.doc');
INSERT INTO `tec_attachFile` VALUES (66, 66, 'CG08-016人脸梯控及电瓶车阻车工程-陶亮.doc', '/08信电学院/CG08-016人脸梯控及电瓶车阻车工程-陶亮.doc');
INSERT INTO `tec_attachFile` VALUES (67, 67, 'CG08-017高血压辅助治疗仪-陶亮.doc', '/08信电学院/CG08-017高血压辅助治疗仪-陶亮.doc');
INSERT INTO `tec_attachFile` VALUES (68, 68, 'CG08-018 交直流故障电弧检测技术-石嘉川.doc', '/08信电学院/CG08-018 交直流故障电弧检测技术-石嘉川.doc');
INSERT INTO `tec_attachFile` VALUES (69, 69, 'CG08-019海洋牧场能源规划运营及碳排放数据精细化管理系统-严毅.doc', '/08信电学院/CG08-019海洋牧场能源规划运营及碳排放数据精细化管理系统-严毅.doc');
INSERT INTO `tec_attachFile` VALUES (70, 70, 'FW08-001基于电力物联网的配电网电能质量监测与治理关键技术项目-曹立霞.docx', '/08信电学院/FW08-001基于电力物联网的配电网电能质量监测与治理关键技术项目-曹立霞.docx');
INSERT INTO `tec_attachFile` VALUES (71, 71, 'FW08-002基于多源大数据融合和电网建模的电能质量数据分析技术研究-曹立霞.docx', '/08信电学院/FW08-002基于多源大数据融合和电网建模的电能质量数据分析技术研究-曹立霞.docx');
INSERT INTO `tec_attachFile` VALUES (72, 72, 'FW08-003 5G+融合创新平台-许鸿奎.docx', '/08信电学院/FW08-003 5G+融合创新平台-许鸿奎.docx');
INSERT INTO `tec_attachFile` VALUES (73, 73, 'FW09-001信息技术技术监测工程结构震动变形的应用研究-赵永谦.docx', '/09商学院/FW09-001信息技术技术监测工程结构震动变形的应用研究-赵永谦.docx');
INSERT INTO `tec_attachFile` VALUES (74, 74, 'FW09-002企业财务绩效、创新绩效与环境绩效研究-王静.docx', '/09商学院/FW09-002企业财务绩效、创新绩效与环境绩效研究-王静.docx');
INSERT INTO `tec_attachFile` VALUES (75, 75, 'FW09-003企业的绿色可持续发展-杨海兰.docx', '/09商学院/FW09-003企业的绿色可持续发展-杨海兰.docx');
INSERT INTO `tec_attachFile` VALUES (76, 76, 'FW09-004房地产市场平稳健康发展研究-陈健.docx', '/09商学院/FW09-004房地产市场平稳健康发展研究-陈健.docx');
INSERT INTO `tec_attachFile` VALUES (77, 77, 'FW09-005绿色发展战略背景下海洋经济发展研究-王莉莉.docx', '/09商学院/FW09-005绿色发展战略背景下海洋经济发展研究-王莉莉.docx');
INSERT INTO `tec_attachFile` VALUES (78, 78, 'FW09-006企业供应商评价及选择研究-赵莉.docx', '/09商学院/FW09-006企业供应商评价及选择研究-赵莉.docx');
INSERT INTO `tec_attachFile` VALUES (79, 79, 'FW09-007出口信用保险机制下的企业发展问题研究-贾广余.docx', '/09商学院/FW09-007出口信用保险机制下的企业发展问题研究-贾广余.docx');
INSERT INTO `tec_attachFile` VALUES (80, 80, 'FW09-008电子商务助推乡村振兴-徐功文.docx', '/09商学院/FW09-008电子商务助推乡村振兴-徐功文.docx');
INSERT INTO `tec_attachFile` VALUES (81, 81, 'CG10-001涂料废渣资源化技术与自动化生产线-冯立明.doc', '/10材料学院/CG10-001涂料废渣资源化技术与自动化生产线-冯立明.doc');
INSERT INTO `tec_attachFile` VALUES (82, 82, 'CG10-002轻质高强混凝土材料-岳雪涛.doc', '/10材料学院/CG10-002轻质高强混凝土材料-岳雪涛.doc');
INSERT INTO `tec_attachFile` VALUES (83, 83, 'CG10-003大型锻件均质化锻造与精密成形技术-景财年.doc', '/10材料学院/CG10-003大型锻件均质化锻造与精密成形技术-景财年.doc');
INSERT INTO `tec_attachFile` VALUES (84, 84, 'CG10-004新型热冲压高强钢的开发与应用-景财年.doc', '/10材料学院/CG10-004新型热冲压高强钢的开发与应用-景财年.doc');
INSERT INTO `tec_attachFile` VALUES (85, 85, 'CG10-005 3D打印人体骨骼种植可再生修复材料产业化-徐淑波.doc', '/10材料学院/CG10-005 3D打印人体骨骼种植可再生修复材料产业化-徐淑波.doc');
INSERT INTO `tec_attachFile` VALUES (86, 86, 'CG10-006高强度可溶镁合金成分及制备工艺开发-林涛.doc', '/10材料学院/CG10-006高强度可溶镁合金成分及制备工艺开发-林涛.doc');
INSERT INTO `tec_attachFile` VALUES (87, 87, 'CG10-007高效热储能及可控温度碳基复合相变材料-项东.doc', '/10材料学院/CG10-007高效热储能及可控温度碳基复合相变材料-项东.doc');
INSERT INTO `tec_attachFile` VALUES (88, 88, 'CG10-008新型造纸涂布高效胶黏剂生产关键技术研究及应用-张丰庆.doc', '/10材料学院/CG10-008新型造纸涂布高效胶黏剂生产关键技术研究及应用-张丰庆.doc');
INSERT INTO `tec_attachFile` VALUES (89, 89, 'FW10-001金属扩散焊-王学刚.docx', '/10材料学院/FW10-001金属扩散焊-王学刚.docx');
INSERT INTO `tec_attachFile` VALUES (90, 90, 'FW10-002耐磨防腐材料-王学刚.docx', '/10材料学院/FW10-002耐磨防腐材料-王学刚.docx');
INSERT INTO `tec_attachFile` VALUES (91, 91, 'FW10-003高强度轻质铝合金-王学刚.docx', '/10材料学院/FW10-003高强度轻质铝合金-王学刚.docx');
INSERT INTO `tec_attachFile` VALUES (92, 92, 'CG11-001基于三元组深度学习的相似视频内容检索方法及系统-聂秀山.doc', '/11计算机学院/CG11-001基于三元组深度学习的相似视频内容检索方法及系统-聂秀山.doc');
INSERT INTO `tec_attachFile` VALUES (93, 93, 'CG11-002基于FPGA的SOPC多轴联动运动控制器及控制系统-尤宝山.doc', '/11计算机学院/CG11-002基于FPGA的SOPC多轴联动运动控制器及控制系统-尤宝山.doc');
INSERT INTO `tec_attachFile` VALUES (94, 94, 'CG11-003移动供热监控计量系统-岳斌.doc', '/11计算机学院/CG11-003移动供热监控计量系统-岳斌.doc');
INSERT INTO `tec_attachFile` VALUES (95, 95, 'CG11-004分布式光伏自动化运维平台-刘新锋.doc', '/11计算机学院/CG11-004分布式光伏自动化运维平台-刘新锋.doc');
INSERT INTO `tec_attachFile` VALUES (96, 96, 'CG11-005交通信息数据采集软件-赵红銮.doc', '/11计算机学院/CG11-005交通信息数据采集软件-赵红銮.doc');
INSERT INTO `tec_attachFile` VALUES (97, 97, 'CG11-006视频对象定位平台-刘萌.doc', '/11计算机学院/CG11-006视频对象定位平台-刘萌.doc');
INSERT INTO `tec_attachFile` VALUES (98, 98, 'CG11-007一种风电齿轮箱故障检测方法、系统、设备及介质-徐遵义.doc', '/11计算机学院/CG11-007一种风电齿轮箱故障检测方法、系统、设备及介质-徐遵义.doc');
INSERT INTO `tec_attachFile` VALUES (99, 99, 'CG11-008行业平台社区交流与知识管理系统-邹丽.doc', '/11计算机学院/CG11-008行业平台社区交流与知识管理系统-邹丽.doc');
INSERT INTO `tec_attachFile` VALUES (100, 100, 'CG11-009基于对象三元语言概念的个性化新闻推荐方法及系统-邹丽.doc', '/11计算机学院/CG11-009基于对象三元语言概念的个性化新闻推荐方法及系统-邹丽.doc');
INSERT INTO `tec_attachFile` VALUES (101, 101, 'CG11-010一种融合时间窗技术和评分预测模型的推荐算法-张志军.doc', '/11计算机学院/CG11-010一种融合时间窗技术和评分预测模型的推荐算法-张志军.doc');
INSERT INTO `tec_attachFile` VALUES (102, 102, 'CG11-011一种基于便携加速度计和陀螺仪的日常走、跑体能消耗预测方法-王丕坤.doc', '/11计算机学院/CG11-011一种基于便携加速度计和陀螺仪的日常走、跑体能消耗预测方法-王丕坤.doc');
INSERT INTO `tec_attachFile` VALUES (103, 103, 'CG11-012包含假结的RNA结构预测方法-刘振栋.doc', '/11计算机学院/CG11-012包含假结的RNA结构预测方法-刘振栋.doc');
INSERT INTO `tec_attachFile` VALUES (104, 104, 'CG11-013体育用品识别系统-袭肖明.doc', '/11计算机学院/CG11-013体育用品识别系统-袭肖明.doc');
INSERT INTO `tec_attachFile` VALUES (105, 105, 'FW11-001自然资源资金监测监管系统-刘新锋.docx', '/11计算机学院/FW11-001自然资源资金监测监管系统-刘新锋.docx');
INSERT INTO `tec_attachFile` VALUES (106, 106, 'FW11-002分布式能源O2O智慧运维平台-刘新锋.docx', '/11计算机学院/FW11-002分布式能源O2O智慧运维平台-刘新锋.docx');
INSERT INTO `tec_attachFile` VALUES (107, 107, 'FW11-003基于多源信息融合的个性化电子商务推荐系统应用研究-张志军.docx', '/11计算机学院/FW11-003基于多源信息融合的个性化电子商务推荐系统应用研究-张志军.docx');
INSERT INTO `tec_attachFile` VALUES (108, 108, 'FW11-004民营企业智能技术改造面临的困境与对策-魏珑.docx', '/11计算机学院/FW11-004民营企业智能技术改造面临的困境与对策-魏珑.docx');
INSERT INTO `tec_attachFile` VALUES (109, 109, 'FW12-001拓扑数据分析-夏省祥.docx', '/12理学院/FW12-001拓扑数据分析-夏省祥.docx');
INSERT INTO `tec_attachFile` VALUES (110, 110, 'FW12-002大容量多参量智能光纤传感技术-赵燕杰.docx', '/12理学院/FW12-002大容量多参量智能光纤传感技术-赵燕杰.docx');
INSERT INTO `tec_attachFile` VALUES (111, 111, 'FW12-003油水分离技术-赵相龙.docx', '/12理学院/FW12-003油水分离技术-赵相龙.docx');
INSERT INTO `tec_attachFile` VALUES (112, 112, 'FW12-004车联网安全与隐私保护-王凤和.docx', '/12理学院/FW12-004车联网安全与隐私保护-王凤和.docx');
INSERT INTO `tec_attachFile` VALUES (113, 113, 'FW12-005数学建模与数据分析-赵庆利.docx', '/12理学院/FW12-005数学建模与数据分析-赵庆利.docx');
INSERT INTO `tec_attachFile` VALUES (114, 114, 'FW12-006医学影像的去噪与增强技术-陈怀广.docx', '/12理学院/FW12-006医学影像的去噪与增强技术-陈怀广.docx');
INSERT INTO `tec_attachFile` VALUES (115, 115, 'FW12-007基于模糊数学的茶树修剪叶再利用-陈铃.docx', '/12理学院/FW12-007基于模糊数学的茶树修剪叶再利用-陈铃.docx');
INSERT INTO `tec_attachFile` VALUES (116, 116, 'FW13-001教育教学法治化研究-吴安新.docx', '/13法学院/FW13-001教育教学法治化研究-吴安新.docx');
INSERT INTO `tec_attachFile` VALUES (117, 117, 'FW13-002知识产权保护-王淑华.docx', '/13法学院/FW13-002知识产权保护-王淑华.docx');
INSERT INTO `tec_attachFile` VALUES (118, 118, 'FW13-003立法评估审核-朱宝丽.docx', '/13法学院/FW13-003立法评估审核-朱宝丽.docx');
INSERT INTO `tec_attachFile` VALUES (119, 119, 'FW13-004生态环境治理与保护法律服务-王翠敏.docx', '/13法学院/FW13-004生态环境治理与保护法律服务-王翠敏.docx');
INSERT INTO `tec_attachFile` VALUES (120, 120, 'FW13-005黄河流域生物安全与环境犯罪的刑事法保护-吴小帅.docx', '/13法学院/FW13-005黄河流域生物安全与环境犯罪的刑事法保护-吴小帅.docx');
INSERT INTO `tec_attachFile` VALUES (121, 121, 'FW13-006企业合规法律服务-刘成安.docx', '/13法学院/FW13-006企业合规法律服务-刘成安.docx');
INSERT INTO `tec_attachFile` VALUES (122, 122, 'FW13-007社区智慧康养服务项目-高利平.docx', '/13法学院/FW13-007社区智慧康养服务项目-高利平.docx');
INSERT INTO `tec_attachFile` VALUES (123, 123, 'FW13-008社会工作服务站参与社区治理-左敏.docx', '/13法学院/FW13-008社会工作服务站参与社区治理-左敏.docx');
INSERT INTO `tec_attachFile` VALUES (124, 124, 'FW13-009社会工作视角下的青春期亲子沟通课程开发-张干群.docx', '/13法学院/FW13-009社会工作视角下的青春期亲子沟通课程开发-张干群.docx');
INSERT INTO `tec_attachFile` VALUES (125, 125, 'FW13-010城市失能老人长期照护福利供给实践及研究-陈海涛.docx', '/13法学院/FW13-010城市失能老人长期照护福利供给实践及研究-陈海涛.docx');
INSERT INTO `tec_attachFile` VALUES (126, 126, 'FW14-001涉外企业语言培训服务与科技转化服务-田野.docx', '/14外语学院/FW14-001涉外企业语言培训服务与科技转化服务-田野.docx');
INSERT INTO `tec_attachFile` VALUES (127, 127, 'FW14-002多语言研究与服务-王海峰.docx', '/14外语学院/FW14-002多语言研究与服务-王海峰.docx');
INSERT INTO `tec_attachFile` VALUES (128, 128, 'CG15-001预应力锚索与抗滑桩联合加固路基高边坡关键技术-张思峰.doc', '/15交通学院/CG15-001预应力锚索与抗滑桩联合加固路基高边坡关键技术-张思峰.doc');
INSERT INTO `tec_attachFile` VALUES (129, 129, 'CG15-002大型钢桥桥面铺装新型材料的研发与应用-任瑞波.doc', '/15交通学院/CG15-002大型钢桥桥面铺装新型材料的研发与应用-任瑞波.doc');
INSERT INTO `tec_attachFile` VALUES (130, 130, 'FW15-001新型全预制装配式桥梁结构体系与施工关键技术-付涛.docx', '/15交通学院/FW15-001新型全预制装配式桥梁结构体系与施工关键技术-付涛.docx');
INSERT INTO `tec_attachFile` VALUES (131, 131, 'FW15-002MaaS 动态发展下无车群体私家车保有决策演化机理研究-牟振华.docx', '/15交通学院/FW15-002MaaS 动态发展下无车群体私家车保有决策演化机理研究-牟振华.docx');
INSERT INTO `tec_attachFile` VALUES (132, 132, 'FW15-003超大直径盾构掘进与注浆协同控制技术-宋曙光.docx', '/15交通学院/FW15-003超大直径盾构掘进与注浆协同控制技术-宋曙光.docx');
INSERT INTO `tec_attachFile` VALUES (133, 133, 'FW15-004大断面隧道破碎围岩变形特性及施工关键技术-谢璨.docx', '/15交通学院/FW15-004大断面隧道破碎围岩变形特性及施工关键技术-谢璨.docx');
INSERT INTO `tec_attachFile` VALUES (134, 134, 'FW15-005基于碳纳米管的聚合物改性沥青粘韧协同增强技术-王鹏.docx', '/15交通学院/FW15-005基于碳纳米管的聚合物改性沥青粘韧协同增强技术-王鹏.docx');
INSERT INTO `tec_attachFile` VALUES (135, 135, 'FW15-006风化砂在北方中低山丘陵区高速公路建设中的研究与应用-胡文军.docx', '/15交通学院/FW15-006风化砂在北方中低山丘陵区高速公路建设中的研究与应用-胡文军.docx');
INSERT INTO `tec_attachFile` VALUES (136, 136, 'FW15-007桥梁群健康监测与安全评估技术-亓兴军.docx', '/15交通学院/FW15-007桥梁群健康监测与安全评估技术-亓兴军.docx');
INSERT INTO `tec_attachFile` VALUES (137, 137, 'FW15-008 中小跨径桥梁承载力快速测试技术-亓兴军.docx', '/15交通学院/FW15-008 中小跨径桥梁承载力快速测试技术-亓兴军.docx');
INSERT INTO `tec_attachFile` VALUES (138, 138, 'FW15-009公路桥梁墩台应急加固关键技术-亓兴军.docx', '/15交通学院/FW15-009公路桥梁墩台应急加固关键技术-亓兴军.docx');
INSERT INTO `tec_attachFile` VALUES (139, 139, 'FW15-010装配式可恢复桥梁结构体系关键技术-亓兴军.docx', '/15交通学院/FW15-010装配式可恢复桥梁结构体系关键技术-亓兴军.docx');
INSERT INTO `tec_attachFile` VALUES (140, 140, 'FW16-001卫星遥感定量反演技术服务-孟飞.docx', '/16测绘学院/FW16-001卫星遥感定量反演技术服务-孟飞.docx');
INSERT INTO `tec_attachFile` VALUES (141, 141, 'FW16-002多视多角度近低空遥感影像智能识别与规则化处理算法研究-姚国标.docx', '/16测绘学院/FW16-002多视多角度近低空遥感影像智能识别与规则化处理算法研究-姚国标.docx');
INSERT INTO `tec_attachFile` VALUES (142, 142, 'FW16-003基于InSAR技术的高精度三维地表形变解算方法研究-王志伟.docx', '/16测绘学院/FW16-003基于InSAR技术的高精度三维地表形变解算方法研究-王志伟.docx');
INSERT INTO `tec_attachFile` VALUES (143, 143, 'FW16-004基于空天地协同测量技术的建构筑物形变监测研究-桑文刚.docx', '/16测绘学院/FW16-004基于空天地协同测量技术的建构筑物形变监测研究-桑文刚.docx');
INSERT INTO `tec_attachFile` VALUES (144, 144, 'FW16-005西北地区地震灾害高风险区房屋存量专题数据集制备技术服务项目-邢华侨.docx', '/16测绘学院/FW16-005西北地区地震灾害高风险区房屋存量专题数据集制备技术服务项目-邢华侨.docx');
INSERT INTO `tec_attachFile` VALUES (145, 145, 'FW16-006知识图谱蕴含地理关系三元组优化-仇培元.docx', '/16测绘学院/FW16-006知识图谱蕴含地理关系三元组优化-仇培元.docx');
INSERT INTO `tec_attachFile` VALUES (146, 146, 'FW16-007遥感地质综合应用及二三维地理信息平台研发-于明洋.docx', '/16测绘学院/FW16-007遥感地质综合应用及二三维地理信息平台研发-于明洋.docx');
INSERT INTO `tec_attachFile` VALUES (147, 147, 'FW16-008氮磷胁迫下黄河三角洲滨海湿地植被群落种间竞争光谱特征分析及参数响应研究-刘浦东.docx', '/16测绘学院/FW16-008氮磷胁迫下黄河三角洲滨海湿地植被群落种间竞争光谱特征分析及参数响应研究-刘浦东.docx');
INSERT INTO `tec_attachFile` VALUES (148, 148, 'FW16-009城市生态演变分析及可持续性评估研究-孙英君.docx', '/16测绘学院/FW16-009城市生态演变分析及可持续性评估研究-孙英君.docx');
INSERT INTO `tec_attachFile` VALUES (149, 149, 'FW16-010基于智能手机WiFi气压计IMU的室内三维自适应高精度定位方法-毕京学.docx', '/16测绘学院/FW16-010基于智能手机WiFi气压计IMU的室内三维自适应高精度定位方法-毕京学.docx');
INSERT INTO `tec_attachFile` VALUES (150, 150, 'FW16-011基于GNSS 的济南区域高时空分辨率大气水汽场的构建-郭秋英.docx', '/16测绘学院/FW16-011基于GNSS 的济南区域高时空分辨率大气水汽场的构建-郭秋英.docx');
INSERT INTO `tec_attachFile` VALUES (151, 151, 'FW16-012面向复杂城市空间场景的倾斜影像三维Mesh 模型-马东岭.docx', '/16测绘学院/FW16-012面向复杂城市空间场景的倾斜影像三维Mesh 模型-马东岭.docx');
INSERT INTO `tec_attachFile` VALUES (152, 152, 'FW17-001党建服务项目-王慧.docx', '/17马克思学院/FW17-001党建服务项目-王慧.docx');
INSERT INTO `tec_attachFile` VALUES (153, 153, 'FW17-002工匠精神培育服务项目-张鹏.docx', '/17马克思学院/FW17-002工匠精神培育服务项目-张鹏.docx');
INSERT INTO `tec_attachFile` VALUES (154, 154, 'FW17-003生态文明服务项目-巩克菊.docx', '/17马克思学院/FW17-003生态文明服务项目-巩克菊.docx');
INSERT INTO `tec_attachFile` VALUES (155, 155, 'CG01-001建筑物移位改造技术-李莹.doc', '/01土木学院/CG01-001建筑物移位改造技术-李莹.doc');
INSERT INTO `tec_attachFile` VALUES (156, 156, 'CG01-002建筑物纠倾技术-李莹.docx', '/01土木学院/CG01-002建筑物纠倾技术-李莹.docx');
INSERT INTO `tec_attachFile` VALUES (157, 157, 'CG01-003建筑物地下增层改造技术-李莹.doc', '/01土木学院/CG01-003建筑物地下增层改造技术-李莹.doc');
INSERT INTO `tec_attachFile` VALUES (158, 158, 'CG01-004新型钢结构关键技术与工程应用-刘哲.doc', '/01土木学院/CG01-004新型钢结构关键技术与工程应用-刘哲.doc');
INSERT INTO `tec_attachFile` VALUES (159, 159, 'CG01-005新型混凝土材料配制技术-逄鲁峰.doc', '/01土木学院/CG01-005新型混凝土材料配制技术-逄鲁峰.doc');
INSERT INTO `tec_attachFile` VALUES (160, 160, 'FW01-001建筑物移位改造服务-李莹.doc', '/01土木学院/FW01-001建筑物移位改造服务-李莹.doc');
INSERT INTO `tec_attachFile` VALUES (161, 161, 'FW01-002建（构）筑物纠倾服务-李莹.doc', '/01土木学院/FW01-002建（构）筑物纠倾服务-李莹.doc');
INSERT INTO `tec_attachFile` VALUES (162, 162, 'FW01-003既有结构性能评估与加固改造服务-李莹.doc', '/01土木学院/FW01-003既有结构性能评估与加固改造服务-李莹.doc');
INSERT INTO `tec_attachFile` VALUES (163, 163, 'FW01-004复杂地层既有建（构）筑托换加固服务-孙剑平.doc', '/01土木学院/FW01-004复杂地层既有建（构）筑托换加固服务-孙剑平.doc');
INSERT INTO `tec_attachFile` VALUES (164, 164, 'FW01-005既有地基基础、基坑、边坡及挡墙工程检测鉴定及安全评估服务-孙剑平.doc', '/01土木学院/FW01-005既有地基基础、基坑、边坡及挡墙工程检测鉴定及安全评估服务-孙剑平.doc');
INSERT INTO `tec_attachFile` VALUES (165, 165, 'FW01-006复杂环境深大基坑支护及近接建（构）筑物保护技术服务-孙剑平.doc', '/01土木学院/FW01-006复杂环境深大基坑支护及近接建（构）筑物保护技术服务-孙剑平.doc');
INSERT INTO `tec_attachFile` VALUES (166, 166, 'FW01-007地下工程（浅埋及盾构隧道、大型顶管）施工控制及近接建（构）筑物保护技术服务-孙剑平.doc', '/01土木学院/FW01-007地下工程（浅埋及盾构隧道、大型顶管）施工控制及近接建（构）筑物保护技术服务-孙剑平.doc');
INSERT INTO `tec_attachFile` VALUES (167, 167, 'FW01-008新型复合木结构技术服务-王玉镯.doc', '/01土木学院/FW01-008新型复合木结构技术服务-王玉镯.doc');
INSERT INTO `tec_attachFile` VALUES (168, 168, 'FW01-009高强石膏基胶凝材料及其应用服务-王艺霖.doc', '/01土木学院/FW01-009高强石膏基胶凝材料及其应用服务-王艺霖.doc');
INSERT INTO `tec_attachFile` VALUES (169, 169, 'FW01-010新型装配式混凝土结构体系技术服务-周广强.doc', '/01土木学院/FW01-010新型装配式混凝土结构体系技术服务-周广强.doc');
INSERT INTO `tec_attachFile` VALUES (170, 170, 'FW01-011城市规建管一体化建设中的CIM应用技术服务-沈旭.doc', '/01土木学院/FW01-011城市规建管一体化建设中的CIM应用技术服务-沈旭.doc');
INSERT INTO `tec_attachFile` VALUES (171, 171, 'FW01-012产业园区数字孪生可视化运营技术服务-沈旭.doc', '/01土木学院/FW01-012产业园区数字孪生可视化运营技术服务-沈旭.doc');
INSERT INTO `tec_attachFile` VALUES (172, 172, 'FW01-013城市市政管理-智能灯杆CIM管理应用技术服务-沈旭.doc', '/01土木学院/FW01-013城市市政管理-智能灯杆CIM管理应用技术服务-沈旭.doc');
INSERT INTO `tec_attachFile` VALUES (173, 173, 'FW01-014混凝土粘度调节剂技术服务-逄鲁峰.doc', '/01土木学院/FW01-014混凝土粘度调节剂技术服务-逄鲁峰.doc');
INSERT INTO `tec_attachFile` VALUES (174, 174, 'FW01-015负温压浆料技术服务-逄鲁峰.doc', '/01土木学院/FW01-015负温压浆料技术服务-逄鲁峰.doc');
INSERT INTO `tec_attachFile` VALUES (175, 175, 'FW01-016自流平石膏技术服务-逄鲁峰.doc', '/01土木学院/FW01-016自流平石膏技术服务-逄鲁峰.doc');
INSERT INTO `tec_attachFile` VALUES (176, 176, 'FW01-017免蒸养RPC技术服务-逄鲁峰.doc', '/01土木学院/FW01-017免蒸养RPC技术服务-逄鲁峰.doc');
INSERT INTO `tec_attachFile` VALUES (177, 177, 'JOSH基础开发教程V1.3.pdf', '/06学院/JOSH基础开发教程V1.3.pdf');

-- ----------------------------
-- Table structure for tec_college
-- ----------------------------
DROP TABLE IF EXISTS `tec_college`;
CREATE TABLE `tec_college`  (
  `college_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识产权类型id',
  `college_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识产权名称',
  PRIMARY KEY (`college_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tec_college
-- ----------------------------
INSERT INTO `tec_college` VALUES (1, '01土木学院');
INSERT INTO `tec_college` VALUES (2, '02管理学院');
INSERT INTO `tec_college` VALUES (3, '03热能学院');
INSERT INTO `tec_college` VALUES (4, '04市政学院');
INSERT INTO `tec_college` VALUES (5, '05建筑学院');
INSERT INTO `tec_college` VALUES (6, '06学院');
INSERT INTO `tec_college` VALUES (7, '07机电学院');
INSERT INTO `tec_college` VALUES (8, '08信电学院');
INSERT INTO `tec_college` VALUES (9, '09商学院');
INSERT INTO `tec_college` VALUES (10, '10材料学院');
INSERT INTO `tec_college` VALUES (11, '11计算机学院');
INSERT INTO `tec_college` VALUES (12, '12理学院');
INSERT INTO `tec_college` VALUES (13, '13法学院');
INSERT INTO `tec_college` VALUES (14, '14外语学院');
INSERT INTO `tec_college` VALUES (15, '15交通学院');
INSERT INTO `tec_college` VALUES (16, '16测绘学院');
INSERT INTO `tec_college` VALUES (17, '17马克思学院');

SET FOREIGN_KEY_CHECKS = 1;
