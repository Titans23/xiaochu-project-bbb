/**
  用户账户信息
 */
DROP TABLE IF EXISTS `user`;
CREATE TABLE user(
     `id`   int(20)   PRIMARY KEY   NOT NULL      AUTO_INCREMENT    COMMENT '自增ID',
     `status`   tinyint      NOT NULL   DEFAULT 0       COMMENT '状态',
     `deleted`   tinyint      NOT NULL   DEFAULT 0       COMMENT '是否删除',
     `create_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP       COMMENT '创建时间',
     `update_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP   ON UPDATE CURRENT_TIMESTAMP    COMMENT '修改时间',
     `email`   varchar(64)      COMMENT '邮箱',
     `phone`   varchar(64)       COMMENT '手机号',
     `password`   varchar(256)     COMMENT '密码',
     `account`   varchar(64)      NOT NULL  UNIQUE   COMMENT '账号',
     `role`   tinyint       NOT NULL DEFAULT 0      COMMENT '0:普通用户，1:管理员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/**
  用户基本信息
 */
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE user_info(
      `user_id`   int(20)   PRIMARY KEY   NOT NULL          COMMENT '自增ID',
      `create_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP       COMMENT '创建时间',
      `update_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP   ON UPDATE CURRENT_TIMESTAMP    COMMENT '修改时间',
      `nick_name`   varchar(32)      NOT NULL         COMMENT '用户昵称',
      `icon`   varchar(256)      NOT NULL   DEFAULT ''       COMMENT '头像地址',
      `address`   varchar(32)         DEFAULT '福建省'       COMMENT '地区(精确到省份)',
      `gender`   tinyint      NOT NULL   DEFAULT 1       COMMENT '性别(0:女，1:男)',
      `fans`   int      NOT NULL   DEFAULT 0       COMMENT '粉丝数量',
      `followee`   int      NOT NULL   DEFAULT 0       COMMENT '关注数量',
      `introduce`   varchar(128)         DEFAULT '编辑个签，展示我的独特态度。'       COMMENT '用户简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/**
  用户认证信息
 */
DROP TABLE IF EXISTS `user_certification`;
CREATE TABLE user_certification(
       `user_id`   int(20)   PRIMARY KEY   NOT NULL          COMMENT '主键',
       `status`   tinyint      NOT NULL   DEFAULT 0       COMMENT '状态（0:审核中，1:审核通过，-1:审核不通过）',
       `create_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP       COMMENT '创建时间',
       `update_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP   ON UPDATE CURRENT_TIMESTAMP    COMMENT '修改时间',
       `type`   tinyint      NOT NULL       COMMENT '认证类型(0:厨师认证 1:医师认证)',
       `img_src`   varchar(256)         DEFAULT ''       COMMENT '证书图片地址',
       `card_pos_src`   varchar(256)         DEFAULT ''       COMMENT '身份证正面地址',
       `card_neg_src`   varchar(256)         DEFAULT ''       COMMENT '身份证反面地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/**
  关注关系表
 */
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE user_follow(
        `id`   int   PRIMARY KEY   NOT NULL      AUTO_INCREMENT    COMMENT '自增ID',
        `create_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP       COMMENT '创建时间',
        `fan_id`   int(20)      NOT NULL       COMMENT '粉丝id',
        `follow_id`   int(20)      NOT NULL       COMMENT '关注id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/**
  用户签到信息
 */
DROP TABLE IF EXISTS `user_sign`;
CREATE TABLE user_sign(
      `user_id`   int   PRIMARY KEY   NOT NULL          COMMENT '用户id',
      `create_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP       COMMENT '创建时间',
      `update_time`   datetime      NOT NULL   DEFAULT CURRENT_TIMESTAMP   ON UPDATE CURRENT_TIMESTAMP    COMMENT '修改时间',
      `year`   int      NOT NULL       COMMENT '年',
      `month`   int      NOT NULL       COMMENT '月',
      `sign`   varchar(31)      NOT NULL   DEFAULT ''       COMMENT '签到',
      `is_receive`   tinyint      NOT NULL   DEFAULT 0       COMMENT '奖励是否领取(0:未领取，1:已领取)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

