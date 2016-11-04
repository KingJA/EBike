/*
Navicat MySQL Data Transfer

Source Server         : 121.40.94.14_binbin
Source Server Version : 50173
Source Host           : 121.40.94.14:3306
Source Database       : ebike

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-11-04 15:12:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `adname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `adurl` varchar(100) COLLATE utf8_bin NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES ('76f7b65e821d4233896475291c26ed1c', 'å¹¿å1', '/upload/image/20151207/20151207142242_477.jpg', '2015-12-07 14:22:48');
INSERT INTO `ads` VALUES ('54934fd9ca04459e8a1a7b2839951893', '电动车防盗追踪', '/upload/image/20151207/20151207143357_130.jpg', '2015-12-07 14:34:05');

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `userid` varchar(32) COLLATE utf8_bin NOT NULL,
  `appointtime` timestamp NULL DEFAULT NULL,
  `place` tinyint(2) NOT NULL,
  `applytime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) NOT NULL,
  `message` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('c382d3fea32b45baa3c2bf6bf3f2428d', 'e1ccd40d65934f039a1a28a80ff88d2b', '2015-12-17 00:00:00', '2', '2015-12-07 17:38:35', '0', '');
INSERT INTO `appointment` VALUES ('504bf0e0909944888f58b587fd1063c5', '1c5d499a9a884671b65b609063d3a2dd', '2016-01-08 00:00:00', '1', '2015-12-21 14:37:40', '0', 'ä¸¤ä¸ª');
INSERT INTO `appointment` VALUES ('2678539af1bf4a269766eb334a9b21e5', '1c5d499a9a884671b65b609063d3a2dd', '2016-01-08 00:00:00', '1', '2015-12-21 14:37:47', '0', 'ä¸¤ä¸ª');
INSERT INTO `appointment` VALUES ('51f123cd39a545c09bb8c086e0c2b1c8', '3db8b9f06cc44b22881e29abbf4b3409', '2016-08-18 00:00:00', '1', '2016-08-03 21:54:11', '0', '');
INSERT INTO `appointment` VALUES ('7ca02534b3744905ae5932f76368577e', 'ca09cf9ef82745638eb414df31359f13', '2016-09-09 00:00:00', '2', '2016-09-08 13:45:32', '0', '测试');

-- ----------------------------
-- Table structure for carnumber
-- ----------------------------
DROP TABLE IF EXISTS `carnumber`;
CREATE TABLE `carnumber` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `carnum` varchar(50) COLLATE utf8_bin NOT NULL,
  `userid` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usetime` timestamp NULL DEFAULT NULL,
  `defencestatus` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of carnumber
-- ----------------------------
INSERT INTO `carnumber` VALUES ('523829ca17e44341a70a0ae1a544b27b', 'YK000001', '3db8b9f06cc44b22881e29abbf4b3409', '2016-08-24 23:01:58', '2016-06-14 15:57:04', '0');
INSERT INTO `carnumber` VALUES ('12312adasdasdas', 'YK000002', '3db8b9f06cc44b22881e29abbf4b3409', '2016-09-03 08:58:04', '2016-06-14 15:57:08', '0');
INSERT INTO `carnumber` VALUES ('0adef4bf15ad4d0592a45965a3f34eaf', 'CS000031', '3cf95a9f1485492892911fd5e6abfb80', '2016-08-07 23:29:52', '2016-08-07 10:47:11', '1');
INSERT INTO `carnumber` VALUES ('070cca67c3164a65a285e96d908f624c', 'CS000032', 'b22b2a50592745d19c62df6ee329b1e2', '2016-08-07 16:46:43', '2016-08-07 11:59:05', '0');
INSERT INTO `carnumber` VALUES ('2b124e46b2de46efa291594d753dc663', 'CS000040', '2d04de4d4a4b4210aa59c43956515661', '2016-08-07 23:19:56', '2016-08-07 23:19:56', '0');
INSERT INTO `carnumber` VALUES ('ffbf92857a9342b1b7d5f00f44c0eb79', 'CS000036', 'fabb6445d28544fbada26c1dc6676f8c', '2016-08-07 23:32:15', '2016-08-07 23:29:48', '1');
INSERT INTO `carnumber` VALUES ('4fcc5f0f834a420eb45c250c1d567057', 'YK444448', '8cef39bbea7f49759ed0f8e48af83af5', '2016-08-10 21:45:30', '2016-08-10 21:45:30', '0');
INSERT INTO `carnumber` VALUES ('596732e9faed4c9ea34b725486421942', 'YK002393', 'ee6900178a5541b48903b03fcb65c5df', '2016-08-30 11:00:46', '2016-08-09 23:49:36', '0');
INSERT INTO `carnumber` VALUES ('05e2277a49704221b95b8fae5c4875f0', 'YK000003', 'f3761ad09e934fd0ab0b671ba666c7c2', '2016-09-19 14:12:01', '2016-09-19 14:08:55', '0');
INSERT INTO `carnumber` VALUES ('51b7234cb59e40d192edf2c23df0e70b', 'YK444411', '68a2aa9b89bb48e2b90867969033afbd', '2016-08-26 11:31:20', '2016-08-26 11:31:20', '0');
INSERT INTO `carnumber` VALUES ('ab3902e7df8a40c5ade25e853498ac43', 'YK688888', '97a246c83cc5485a8f83a39ab882983b', '2016-08-25 16:41:10', '2016-08-10 16:25:45', '1');
INSERT INTO `carnumber` VALUES ('190511e0025f44058f16b8490fee9817', 'YK444441', '252255b645904c94b440c25225c2e303', '2016-08-10 17:07:48', '2016-08-10 17:07:48', '0');
INSERT INTO `carnumber` VALUES ('ae7988dfb7cc4879b5d8b324ae0e4b7d', 'YK444146', 'ca09cf9ef82745638eb414df31359f13', '2016-09-22 16:37:19', '2016-08-24 21:14:16', '1');
INSERT INTO `carnumber` VALUES ('2bf5d26d53994272b774a8b22b1369f0', 'YK444165', 'ca09cf9ef82745638eb414df31359f13', '2016-09-05 17:50:01', '2016-08-10 21:48:47', '0');
INSERT INTO `carnumber` VALUES ('eef9f19bc8db47e8b2dafd1415eb7014', 'YK444446', 'b2b0131069c74268846188d811a53242', '2016-08-10 22:53:23', '2016-08-10 22:53:23', '0');
INSERT INTO `carnumber` VALUES ('29675b5a64f54e8281d561e56c8658bc', 'YK444447', 'b2b0131069c74268846188d811a53242', '2016-08-10 22:53:23', '2016-08-10 22:53:23', '0');
INSERT INTO `carnumber` VALUES ('2a8345337303424c9c666b92ef8067ef', 'YK988889', 'f2fd73b361c641a482af311d2c5f7b73', '2016-09-06 15:11:56', '2016-09-06 15:11:56', '0');
INSERT INTO `carnumber` VALUES ('c0f1fdc0a88b42bea2504af7eff00a03', 'YK444449', 'ca09cf9ef82745638eb414df31359f13', '2016-08-30 14:20:22', '2016-08-24 21:14:16', '0');
INSERT INTO `carnumber` VALUES ('aa0efaea475b4c45be94f6aad96cdb5b', 'YK988888', '83548a47cbd8492e9223b48ed42a6577', '2016-08-25 17:07:33', '2016-08-25 17:00:39', '0');
INSERT INTO `carnumber` VALUES ('38ad4efbe1154181ab0e2eb1e95af76b', 'YK000002', '83548a47cbd8492e9223b48ed42a6577', '2016-09-03 08:58:04', '2016-08-25 17:00:39', '0');
INSERT INTO `carnumber` VALUES ('2e5b9592ec0f432981d91fa1f8081734', 'TJ006076', '83548a47cbd8492e9223b48ed42a6577', '2016-09-03 08:57:53', '2016-08-25 17:00:39', '0');
INSERT INTO `carnumber` VALUES ('b4f5157290fd43088921498859d62472', 'YK444412', 'a83f03ebcb974a92a33187d3c1b1dfcf', '2016-08-26 11:35:23', '2016-08-26 11:35:23', '0');
INSERT INTO `carnumber` VALUES ('e4cd78bc118a40a79e211d4cb452b1c1', 'YK444414', '4c0dd147b697477aa5d5c4999eba914b', '2016-08-26 15:13:39', '2016-08-26 15:13:39', '0');
INSERT INTO `carnumber` VALUES ('62863d60595d4c86aa6a0e9ab0d97938', 'YK002393', '40fb6075ab484edeb7ba1b4ad92eb937', '2016-08-30 11:00:46', '2016-08-30 10:46:44', '0');
INSERT INTO `carnumber` VALUES ('fd349bd2baed4c2d9e09e40576218ca1', 'YK002093', '40fb6075ab484edeb7ba1b4ad92eb937', '2016-09-06 09:33:37', '2016-08-30 10:46:44', '0');

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` varchar(1000) COLLATE utf8_bin NOT NULL,
  `userid` varchar(32) COLLATE utf8_bin NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) NOT NULL COMMENT '0未处理 1已处理',
  `result` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES ('12312ada', '1231', 'adadsa', '7c619e62b2b04f57890b48d231e5b086', '2015-11-30 23:05:42', '1', '231231');
INSERT INTO `complaint` VALUES ('351786329b524e1389bd11207712029f', 'asdasd', '1231231', 'b02023cc7d4d4fb1822165a9625af337', '2015-12-06 18:58:22', '0', null);

-- ----------------------------
-- Table structure for j_dictcategory
-- ----------------------------
DROP TABLE IF EXISTS `j_dictcategory`;
CREATE TABLE `j_dictcategory` (
  `id` int(11) NOT NULL,
  `dictname` varchar(50) COLLATE utf8_bin NOT NULL,
  `isconfig` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of j_dictcategory
-- ----------------------------
INSERT INTO `j_dictcategory` VALUES ('1', '是否', '0');
INSERT INTO `j_dictcategory` VALUES ('2', '是否已处理', '0');
INSERT INTO `j_dictcategory` VALUES ('3', '审核状态', '0');
INSERT INTO `j_dictcategory` VALUES ('4', '管理所', '1');

-- ----------------------------
-- Table structure for j_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `j_dictionary`;
CREATE TABLE `j_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8_bin NOT NULL,
  `dictdesc` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of j_dictionary
-- ----------------------------
INSERT INTO `j_dictionary` VALUES ('1', '1', '0', '否');
INSERT INTO `j_dictionary` VALUES ('2', '1', '1', '是');
INSERT INTO `j_dictionary` VALUES ('3', '2', '0', '未处理');
INSERT INTO `j_dictionary` VALUES ('4', '2', '1', '已处理');
INSERT INTO `j_dictionary` VALUES ('5', '3', '0', '待审核');
INSERT INTO `j_dictionary` VALUES ('6', '3', '1', '成功');
INSERT INTO `j_dictionary` VALUES ('7', '3', '2', '失败');
INSERT INTO `j_dictionary` VALUES ('8', '4', '1', '江北管理所');
INSERT INTO `j_dictionary` VALUES ('9', '4', '2', '江南管理所');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `age` int(11) NOT NULL,
  `imageName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `imageURL` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `imageLink` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('14c41533b2994ffbb82e7cddbe1cd91f', '11', '11', 'efaewf', '/upload/image/20150421/20150421111947_669.jpg', 'http://baidu.com');
INSERT INTO `person` VALUES ('711acb93bdcb4f37a63cd72801725c77', 'adasda1', '123121', null, null, null);
INSERT INTO `person` VALUES ('97c6e89a570e4adf8f4f0a648487e899', 'ASDADS', '121321', 'ASDADSA', '/upload/image/20150407/20150407171838_879.jpeg', 'http://www.baidu.com');

-- ----------------------------
-- Table structure for positionlog
-- ----------------------------
DROP TABLE IF EXISTS `positionlog`;
CREATE TABLE `positionlog` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `certno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `carnum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '车牌号',
  `longitude` double(10,8) DEFAULT NULL COMMENT '经度',
  `latitude` double(10,8) DEFAULT NULL COMMENT '纬度',
  `details` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of positionlog
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `passwd` varchar(50) COLLATE utf8_bin NOT NULL,
  `position` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `realname` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL,
  `status` tinyint(2) NOT NULL COMMENT '1管理员 2用户',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `certno` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('0729632ee4dd416d90f91e1e6034c632', '13633333333', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-26 14:54:29', '', '13633333333');
INSERT INTO `users` VALUES ('252255b645904c94b440c25225c2e303', '11111111112', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-10 17:07:48', '111111111111111111', '11111111112');
INSERT INTO `users` VALUES ('2d04de4d4a4b4210aa59c43956515661', '1234', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-07 23:19:54', '111111111111111111', '11111111111');
INSERT INTO `users` VALUES ('2ee5a84d18de49339216f91f0cd470a6', '18605790266', '9d4428c7b3f12f8f289dd6bdb20ad714', null, '', '', null, '3', '2016-01-30 11:53:19', '522401198803119813', '');
INSERT INTO `users` VALUES ('3db8b9f06cc44b22881e29abbf4b3409', 'test', '827ccb0eea8a706c4c34a16891f84e7b', null, '', '', null, '3', '2016-08-07 09:55:09', '330303199006281214', '13758727987');
INSERT INTO `users` VALUES ('40fb6075ab484edeb7ba1b4ad92eb937', '13958489825', '4607e782c4d86fd5364d7e4508bb10d9', null, '', '', null, '3', '2016-08-30 10:46:44', '330721197909292710', '13958489825');
INSERT INTO `users` VALUES ('4c0dd147b697477aa5d5c4999eba914b', '13644444444', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-26 15:13:39', '789456123789456123', '13644444444');
INSERT INTO `users` VALUES ('68a2aa9b89bb48e2b90867969033afbd', '13611111111', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-26 11:31:00', '111111111222222222', '13611111111');
INSERT INTO `users` VALUES ('7b2a2b1789a142a5b06d927a9e6b5c52', 'abc', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-07 00:40:19', '322334466558563678', '15600009999');
INSERT INTO `users` VALUES ('7c619e62b2b04f57890b48d231e5b086', 'asdadsa', 'e10adc3949ba59abbe56e057f20f883e', null, 'asdads@1123', '1231', null, '2', '2015-11-30 21:50:43', '12312', '1231231');
INSERT INTO `users` VALUES ('83548a47cbd8492e9223b48ed42a6577', '叶忠标', '61f9e34d5ac9109b70e8386489d155f3', null, '', '', null, '3', '2016-08-10 16:22:30', '330722198609227918', '18258989110');
INSERT INTO `users` VALUES ('8761c24ee2ab4ba6b34b41db0acb4d65', 'root', '4297f44b13955235245b2497399d7a93', null, '', '', null, '3', '2016-08-05 13:32:56', '522401198803119813', '15355398112');
INSERT INTO `users` VALUES ('8cef39bbea7f49759ed0f8e48af83af5', '98765432109', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-10 21:45:37', '987654321987654321', '98765432109');
INSERT INTO `users` VALUES ('97a246c83cc5485a8f83a39ab882983b', '雷超', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-10 16:25:45', '330723199108245377', '15067062013');
INSERT INTO `users` VALUES ('a32c4a246dcb4d9180fe35288936f543', '15067748328', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-01-29 22:15:38', '33', '');
INSERT INTO `users` VALUES ('a5dc131befbc4af48b4fc1175c9e577e', '11111222222', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-26 11:24:26', '', '11111222222');
INSERT INTO `users` VALUES ('a83f03ebcb974a92a33187d3c1b1dfcf', '13622222222', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-26 11:35:06', '111111111222222222', '13622222222');
INSERT INTO `users` VALUES ('asdasda', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '陈彬彬', '2015-09-01 16:42:38', '1', '2015-09-01 16:42:35', null, null);
INSERT INTO `users` VALUES ('b02023cc7d4d4fb1822165a9625af337', 'cbbsgdsg', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2015-12-05 09:55:27', '', '');
INSERT INTO `users` VALUES ('b22b2a50592745d19c62df6ee329b1e2', '12345', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-07 11:59:05', '113453345252812144', '13758727986');
INSERT INTO `users` VALUES ('b2b0131069c74268846188d811a53242', '12345678904', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-10 22:53:23', '123456789123456787', '12345678904');
INSERT INTO `users` VALUES ('b77f7aaf2ff346c6ab1fee8dd6732e7c', 'asda', 'e10adc3949ba59abbe56e057f20f883e', null, '121', '11', null, '1', '2015-11-30 21:33:33', null, null);
INSERT INTO `users` VALUES ('bbca2996e68946b3b6f80b50f5a130e0', 'mzkj', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2015-12-08 09:10:52', '330721198811121213', '18257016276');
INSERT INTO `users` VALUES ('c3455715f4d540f6877a313e71a67ca7', '123456', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-04 21:37:08', '123456', '1234567891');
INSERT INTO `users` VALUES ('ca09cf9ef82745638eb414df31359f13', '12345678901', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-10 21:48:47', '123456789123456789', '12345678901');
INSERT INTO `users` VALUES ('e1ccd40d65934f039a1a28a80ff88d2b', 'Jeloy', '4297f44b13955235245b2497399d7a93', null, '', '', null, '3', '2015-12-07 17:37:26', '23567789', '18605792660');
INSERT INTO `users` VALUES ('e55960e40d6446dda61e20c9d63f7ebf', 'zhoczy', 'd4f32d4d136ba1e49645005a4ec7c097', null, '', '', null, '3', '2016-08-08 10:05:03', '', '13858913338');
INSERT INTO `users` VALUES ('ee6900178a5541b48903b03fcb65c5df', 'Czh147258', '28c80a00f8c1d57a2a41ee51dae70bdf', null, '', '', null, '3', '2016-08-09 23:49:36', '330702198810202952', '15268644194');
INSERT INTO `users` VALUES ('f2fd73b361c641a482af311d2c5f7b73', 'YK688888', 'd4f32d4d136ba1e49645005a4ec7c097', null, '', '', null, '3', '2016-08-10 15:39:03', '330722198603077912', '13758997822');
INSERT INTO `users` VALUES ('f3761ad09e934fd0ab0b671ba666c7c2', 'HOHO', 'cc3ba053473a0ea2e6e9b8a1a8296476', null, '', '', null, '3', '2016-09-19 14:08:56', '330722199405105948', '15067969600');
INSERT INTO `users` VALUES ('fabb6445d28544fbada26c1dc6676f8c', '1122234455', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', null, '3', '2016-08-07 23:29:48', '4678923356', '1122234455');
INSERT INTO `users` VALUES ('yin', 'jeloy', '4297f44b13955235245b2497399d7a93', null, '', '', null, '3', '2016-08-07 10:39:41', '456877655443221', '18605790266');
