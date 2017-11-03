/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : dsms

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2017-11-03 09:06:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for coach
-- ----------------------------
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `sex` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `idcard` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `tel` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `birthday` date DEFAULT NULL,
  `homeAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of coach
-- ----------------------------
INSERT INTO `coach` VALUES ('a7f3bc4c712e4f108fc621c018094a49', '罗凡', '男', '346251196512034521', '18843425698', '2017-07-31', '中国吉林');
INSERT INTO `coach` VALUES ('ae3720d1a25b4dba8a5d55e4f0c84771', '张萌', '女', '632598199603214521', '16654871236', '2017-07-31', '中国吉林省四平市');
