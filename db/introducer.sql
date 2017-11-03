/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : dsms

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2017-11-03 09:07:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for introducer
-- ----------------------------
DROP TABLE IF EXISTS `introducer`;
CREATE TABLE `introducer` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `sex` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `idcard` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `tel` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of introducer
-- ----------------------------
INSERT INTO `introducer` VALUES ('0370e55847094f549cb230286aac81fc', '赵丽颖', '女', '372323199605214125', '12345678952');
INSERT INTO `introducer` VALUES ('1c86b0ced4a740478c2572343cbd90e3', '靳东', '男', '45632110214125', '5214789630');
INSERT INTO `introducer` VALUES ('a6a3c8ad8f6540d7a89a2e95fd4d57b7', '白百何', '女', '265312198405231564', '12374185230');
INSERT INTO `introducer` VALUES ('f3d7736d3f454a2d932e3ec838cd3904', '刘亦菲', '女', '327232199602145214', '12345678941');
