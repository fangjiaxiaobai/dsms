/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50172
Source Host           : localhost:3306
Source Database       : dsms

Target Server Type    : MYSQL
Target Server Version : 50172
File Encoding         : 65001

Date: 2017-11-03 09:07:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `count_time` float(10,1) DEFAULT NULL,
  `pay_flag` smallint(4) DEFAULT NULL,
  `pay_money` float DEFAULT NULL,
  `s_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `v_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `学员` (`s_id`),
  KEY `教练` (`c_id`),
  KEY `车辆` (`v_id`),
  CONSTRAINT `车辆` FOREIGN KEY (`v_id`) REFERENCES `vehicle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `学员` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `教练` FOREIGN KEY (`c_id`) REFERENCES `coach` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('12c5e29475db11e796e6d192674e52b0', '5', '2017-07-31 18:28:00', '2.0', '1', '100', 'feac5c64d1b74554999041a26c215fc3', 'ae3720d1a25b4dba8a5d55e4f0c84771', 'ba82aea68b2741bd8090b8119271cdb7');
INSERT INTO `train` VALUES ('12ef450375d011e796e6d192674e52b0', '5', '2017-07-31 17:10:15', '1.0', '1', '150', 'feac5c64d1b74554999041a26c215fc3', 'ae3720d1a25b4dba8a5d55e4f0c84771', 'ba82aea68b2741bd8090b8119271cdb7');
INSERT INTO `train` VALUES ('165f9aec75d411e796e6d192674e52b0', '5', '2017-07-31 17:38:54', '1.0', '1', '130', 'ac602a40a7be4cbeba07c94df2b8e8a9', 'ae3720d1a25b4dba8a5d55e4f0c84771', 'ca7ede74d24a40f8b37665915ecdba40');
INSERT INTO `train` VALUES ('1867ccd175c211e796e6d192674e52b0', '1', '2017-07-31 15:30:00', '1.5', '2', '0', 'ac602a40a7be4cbeba07c94df2b8e8a9', 'a7f3bc4c712e4f108fc621c018094a49', '96ab456a-7362-11e7-9fcd-f4aa74480b61');
INSERT INTO `train` VALUES ('1defd147765e11e7856427d5b81b5d80', '2', '2017-08-02 10:06:00', '0.5', '2', '0', '8624bd17840d46e8b9b69e19ff23f361', 'ae3720d1a25b4dba8a5d55e4f0c84771', '96ab456a-7362-11e7-9fcd-f4aa74480b61');
INSERT INTO `train` VALUES ('521e8e4c75c211e796e6d192674e52b0', '2', '2017-07-31 15:30:00', '2.0', '2', '0', 'ac602a40a7be4cbeba07c94df2b8e8a9', 'a7f3bc4c712e4f108fc621c018094a49', '96ab456a-7362-11e7-9fcd-f4aa74480b61');
INSERT INTO `train` VALUES ('637de5d0765911e7856427d5b81b5d80', '2', '2017-08-01 09:32:00', '0.5', '2', '0', '8624bd17840d46e8b9b69e19ff23f361', 'a7f3bc4c712e4f108fc621c018094a49', '96ab456a-7362-11e7-9fcd-f4aa74480b61');
INSERT INTO `train` VALUES ('8c2b640d75c111e796e6d192674e52b0', '2', '2017-07-31 15:30:00', '0.5', '2', '0', 'ac602a40a7be4cbeba07c94df2b8e8a9', 'a7f3bc4c712e4f108fc621c018094a49', '96ab456a-7362-11e7-9fcd-f4aa74480b61');
INSERT INTO `train` VALUES ('b1c0b26e765911e7856427d5b81b5d80', '1', '2017-08-01 09:35:00', '1.5', '2', '0', '8624bd17840d46e8b9b69e19ff23f361', 'ae3720d1a25b4dba8a5d55e4f0c84771', 'ba82aea68b2741bd8090b8119271cdb7');
INSERT INTO `train` VALUES ('b8ea5690765911e7856427d5b81b5d80', '4', '2017-08-01 09:35:00', '1.0', '2', '0', 'ac602a40a7be4cbeba07c94df2b8e8a9', 'ae3720d1a25b4dba8a5d55e4f0c84771', 'ba82aea68b2741bd8090b8119271cdb7');
INSERT INTO `train` VALUES ('c368c15a75ec11e796e6d192674e52b0', '2', '2017-07-31 20:35:00', '1.5', '1', '100', 'feac5c64d1b74554999041a26c215fc3', 'ae3720d1a25b4dba8a5d55e4f0c84771', '96ab456a-7362-11e7-9fcd-f4aa74480b61');
INSERT INTO `train` VALUES ('c3bcfb31765911e7856427d5b81b5d80', '2', '2017-08-01 09:35:00', '1.5', '2', '0', 'feac5c64d1b74554999041a26c215fc3', 'a7f3bc4c712e4f108fc621c018094a49', 'ba82aea68b2741bd8090b8119271cdb7');
INSERT INTO `train` VALUES ('feda3a50765d11e7856427d5b81b5d80', '2', '2017-08-02 10:06:00', '0.5', '2', '0', '8624bd17840d46e8b9b69e19ff23f361', 'ae3720d1a25b4dba8a5d55e4f0c84771', 'ba82aea68b2741bd8090b8119271cdb7');
