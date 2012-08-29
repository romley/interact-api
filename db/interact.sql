/*
 interact-api database template for mysql
 jonathan romley for prophecy ventures llc
 Date: 08/29/2012 11:18:36 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `interact_action`
-- ----------------------------
DROP TABLE IF EXISTS `interact_action`;
CREATE TABLE `interact_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `interact_action`
-- ----------------------------
BEGIN;
INSERT INTO `interact_action` VALUES ('1', 'view'), ('2', 'like'), ('3', 'dislike'), ('4', 'share'), ('5', 'abandon'), ('6', 'comment');
COMMIT;

-- ----------------------------
--  Table structure for `interact_activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `interact_activity_log`;
CREATE TABLE `interact_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `longitude` decimal(12,6) DEFAULT NULL,
  `latitude` decimal(12,6) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `action` varchar(32) DEFAULT NULL,
  `location` point DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idxfk` (`uid`),
  KEY `content_id_idxfk` (`content_id`),
  KEY `action_id_idxfk` (`action_id`),
  CONSTRAINT `interact_activity_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `interact_users` (`uid`),
  CONSTRAINT `interact_activity_log_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `interact_content` (`content_id`),
  CONSTRAINT `interact_activity_log_ibfk_3` FOREIGN KEY (`action_id`) REFERENCES `interact_action` (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `interact_content`
-- ----------------------------
DROP TABLE IF EXISTS `interact_content`;
CREATE TABLE `interact_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `ctype_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `ctype_id_idxfk` (`ctype_id`),
  CONSTRAINT `interact_content_ibfk_1` FOREIGN KEY (`ctype_id`) REFERENCES `interact_content_type` (`ctype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `interact_content`
-- ----------------------------
BEGIN;
INSERT INTO `interact_content` VALUES ('1', 'gangnam style', null, '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `interact_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `interact_content_type`;
CREATE TABLE `interact_content_type` (
  `ctype_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctype_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ctype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `interact_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `interact_content_type` VALUES ('1', 'video'), ('2', 'photo');
COMMIT;

-- ----------------------------
--  Table structure for `interact_stream`
-- ----------------------------
DROP TABLE IF EXISTS `interact_stream`;
CREATE TABLE `interact_stream` (
  `stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stream_id`),
  KEY `content_id_idxfk_1` (`content_id`),
  CONSTRAINT `interact_stream_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `interact_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `interact_stream`
-- ----------------------------
BEGIN;
INSERT INTO `interact_stream` VALUES ('1', '1', '2012-08-27 20:58:33'), ('2', '1', '2012-08-28 10:43:17');
COMMIT;

-- ----------------------------
--  Table structure for `interact_users`
-- ----------------------------
DROP TABLE IF EXISTS `interact_users`;
CREATE TABLE `interact_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fb_auth` int(11) DEFAULT NULL,
  `fb_token` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `interact_users`
-- ----------------------------
BEGIN;
INSERT INTO `interact_users` VALUES ('1', 'romley', null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
