CREATE TABLE `question_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '提问人id',
  `userName` varchar(255) DEFAULT NULL COMMENT '提问人',
  `content` mediumtext COMMENT '内容',
  `state` int(2) DEFAULT NULL COMMENT '0:未解决;1:解决;2:已关闭',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `question_remark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionId` bigint(20) DEFAULT NULL COMMENT '问题ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '评论人ID',
  `userName` varchar(255) DEFAULT NULL COMMENT '评论人姓名',
  `content` text COMMENT '内容',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `gather_info` (
`id`  int(32) NOT NULL AUTO_INCREMENT ,
`user_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名' ,
`user_id`  int(32) NULL DEFAULT NULL COMMENT '用户ID' ,
`post`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位' ,
`telephone`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话' ,
`pic_url`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址' ,
`pic_num`  int(32) NULL DEFAULT NULL COMMENT '图片数量' ,
`comment_num`  int(32) NULL DEFAULT NULL COMMENT '评论数量' ,
`upload_time`  datetime NULL DEFAULT NULL COMMENT '拍摄时间、上传时间' ,
`chuang`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '幢' ,
`storey`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层' ,
`miaoshu`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`projects`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应项目' ,
`company`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1
ROW_FORMAT=COMPACT
;