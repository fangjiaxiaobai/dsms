/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : dsms

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2017-11-03 09:07:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '考试名称',
  `time` date NOT NULL COMMENT '考试时间',
  `score` int(11) DEFAULT NULL COMMENT '考试得分',
  `pass_flag` int(4) DEFAULT NULL COMMENT '考试结果',
  `pay_flag` int(4) NOT NULL COMMENT '是否交费',
  `pay_money` double(10,1) DEFAULT NULL COMMENT '交费金额',
  `exam_count` int(11) NOT NULL COMMENT '考试次数',
  `fail_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '失败原因',
  `sid` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学员外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1697694cda774003b200806cb0b60ce2', '3', '2017-07-31', '0', '1', '2', '0.0', '1', null, 'feac5c64d1b74554999041a26c215fc3');
INSERT INTO `exam` VALUES ('196be92e9bde45b8aad8094a32dc00d6', '3', '2017-08-03', '0', '0', '1', '150.0', '2', '加减档', 'ac602a40a7be4cbeba07c94df2b8e8a9');
INSERT INTO `exam` VALUES ('41108f8861d740648916060c0d63bee3', '3', '2017-08-03', null, '4', '1', '150.0', '4', null, 'ac602a40a7be4cbeba07c94df2b8e8a9');
INSERT INTO `exam` VALUES ('45ea22811544483398b4fd1172575a67', '2', '2017-08-01', null, '4', '2', '0.0', '1', null, 'feac5c64d1b74554999041a26c215fc3');
INSERT INTO `exam` VALUES ('5858b7f5e69a451692e6305d0a0d5df7', '2', '2017-07-31', '100', '1', '2', '0.0', '1', '', 'feac5c64d1b74554999041a26c215fc3');
INSERT INTO `exam` VALUES ('74e5cdbdf62846db9dfdd2b9d25c8db5', '3', '2017-08-02', '0', '0', '1', '0.0', '3', '', 'ac602a40a7be4cbeba07c94df2b8e8a9');
INSERT INTO `exam` VALUES ('846643c2075648738dcc41ac43dc1875', '2', '2017-08-02', null, '0', '2', '0.0', '1', null, '8624bd17840d46e8b9b69e19ff23f361');
INSERT INTO `exam` VALUES ('a17c51efdf6748e096e46d9b640d54b1', '1', '2017-07-31', '100', '1', '2', '0.0', '1', '', 'ac602a40a7be4cbeba07c94df2b8e8a9');
INSERT INTO `exam` VALUES ('d0d64ce9b6cb4913a8d6772774cc0f2d', '3', '2017-07-31', '0', '0', '2', '0.0', '1', '起步', 'ac602a40a7be4cbeba07c94df2b8e8a9');
INSERT INTO `exam` VALUES ('e3bde4c7c63249f197078cc4450fd93b', '1', '2017-08-01', '100', '1', '2', '0.0', '1', '', '8624bd17840d46e8b9b69e19ff23f361');
