/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : dsms

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2017-11-03 09:07:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '学员姓名',
  `sex` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `idcard` varchar(21) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `present_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现居地',
  `other_contacts` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '其他联系方式',
  `registration_time` datetime DEFAULT NULL COMMENT '报名时间',
  `end_time` date DEFAULT NULL COMMENT '拿证时间',
  `count_hours` float(10,0) DEFAULT NULL COMMENT '总计时',
  `use_hours` float(10,0) DEFAULT NULL COMMENT '已用计时',
  `flag` int(4) DEFAULT NULL COMMENT '是否拿证',
  `type` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '学车类型',
  `money` float DEFAULT NULL COMMENT '交费金额',
  `introducer_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `介绍人` (`introducer_id`),
  CONSTRAINT `介绍人` FOREIGN KEY (`introducer_id`) REFERENCES `introducer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('8624bd17840d46e8b9b69e19ff23f361', '于春萌', '女', '220202199612035214', '2017-08-01', '北京市海淀区', '1563214521', '2017-08-01 09:25:00', '2017-09-09', '102', '0', '0', 'B1', '2300', '1c86b0ced4a740478c2572343cbd90e3');
INSERT INTO `student` VALUES ('ac602a40a7be4cbeba07c94df2b8e8a9', '方小白', '男', '372323199502123142', '2017-07-28', '北京石景山区', '123123415', '2017-07-28 16:37:57', '2017-07-28', '123', '10', '0', 'C1', '1234', 'f3d7736d3f454a2d932e3ec838cd3904');
INSERT INTO `student` VALUES ('feac5c64d1b74554999041a26c215fc3', '王玺粤', '男', '3272323199509221816', '2017-07-28', '北京石景山区', '1234567481523', '2017-07-28 16:24:53', '2017-07-28', '0', '0', '0', 'B2', '1234', '1c86b0ced4a740478c2572343cbd90e3');
