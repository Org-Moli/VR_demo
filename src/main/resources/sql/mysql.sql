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