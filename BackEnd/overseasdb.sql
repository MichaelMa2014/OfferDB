/*
Navicat MySQL Data Transfer

Source Server         : mysql5.5
Source Server Version : 50528
Source Host           : 127.0.0.1:6666
Source Database       : overseasdb

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-11-27 17:20:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `graduateId` int(11) NOT NULL,
  `uniUId` int(11) NOT NULL,
  `accept` int(11) NOT NULL,
  PRIMARY KEY (`graduateId`,`uniUId`),
  KEY `uniUId` (`uniUId`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`uniUId`) REFERENCES `universityus` (`uniUId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`graduateId`) REFERENCES `graduate` (`graduateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1', '1', '1');
INSERT INTO `apply` VALUES ('1', '2', '1');
INSERT INTO `apply` VALUES ('1', '3', '1');
INSERT INTO `apply` VALUES ('1', '5', '0');
INSERT INTO `apply` VALUES ('1', '6', '1');
INSERT INTO `apply` VALUES ('1', '7', '1');
INSERT INTO `apply` VALUES ('2', '1', '1');
INSERT INTO `apply` VALUES ('2', '4', '1');
INSERT INTO `apply` VALUES ('2', '5', '0');
INSERT INTO `apply` VALUES ('2', '6', '1');
INSERT INTO `apply` VALUES ('3', '1', '0');
INSERT INTO `apply` VALUES ('3', '3', '1');
INSERT INTO `apply` VALUES ('3', '4', '1');
INSERT INTO `apply` VALUES ('3', '5', '0');
INSERT INTO `apply` VALUES ('3', '6', '0');
INSERT INTO `apply` VALUES ('3', '7', '1');
INSERT INTO `apply` VALUES ('4', '3', '0');
INSERT INTO `apply` VALUES ('4', '4', '1');
INSERT INTO `apply` VALUES ('4', '5', '0');
INSERT INTO `apply` VALUES ('4', '6', '0');
INSERT INTO `apply` VALUES ('4', '7', '0');
INSERT INTO `apply` VALUES ('6', '1', '1');
INSERT INTO `apply` VALUES ('6', '2', '0');
INSERT INTO `apply` VALUES ('6', '3', '1');
INSERT INTO `apply` VALUES ('6', '5', '1');
INSERT INTO `apply` VALUES ('6', '6', '0');
INSERT INTO `apply` VALUES ('6', '7', '0');
INSERT INTO `apply` VALUES ('8', '1', '1');
INSERT INTO `apply` VALUES ('8', '2', '0');
INSERT INTO `apply` VALUES ('8', '3', '1');
INSERT INTO `apply` VALUES ('8', '4', '1');
INSERT INTO `apply` VALUES ('8', '7', '1');
INSERT INTO `apply` VALUES ('9', '1', '1');
INSERT INTO `apply` VALUES ('9', '2', '1');
INSERT INTO `apply` VALUES ('9', '3', '0');
INSERT INTO `apply` VALUES ('9', '4', '0');
INSERT INTO `apply` VALUES ('9', '5', '1');
INSERT INTO `apply` VALUES ('9', '6', '0');
INSERT INTO `apply` VALUES ('9', '7', '0');
INSERT INTO `apply` VALUES ('10', '3', '1');
INSERT INTO `apply` VALUES ('10', '4', '1');
INSERT INTO `apply` VALUES ('10', '7', '0');
INSERT INTO `apply` VALUES ('11', '1', '1');
INSERT INTO `apply` VALUES ('11', '3', '0');
INSERT INTO `apply` VALUES ('11', '5', '0');
INSERT INTO `apply` VALUES ('11', '7', '1');
INSERT INTO `apply` VALUES ('12', '1', '1');
INSERT INTO `apply` VALUES ('12', '3', '1');
INSERT INTO `apply` VALUES ('12', '4', '0');
INSERT INTO `apply` VALUES ('12', '5', '0');
INSERT INTO `apply` VALUES ('12', '6', '0');
INSERT INTO `apply` VALUES ('12', '7', '1');
INSERT INTO `apply` VALUES ('13', '1', '1');
INSERT INTO `apply` VALUES ('13', '2', '1');
INSERT INTO `apply` VALUES ('13', '3', '1');
INSERT INTO `apply` VALUES ('13', '4', '1');
INSERT INTO `apply` VALUES ('13', '6', '0');
INSERT INTO `apply` VALUES ('13', '7', '0');

-- ----------------------------
-- Table structure for general_info
-- ----------------------------
DROP TABLE IF EXISTS `general_info`;
CREATE TABLE `general_info` (
  `graduate_num` int(11) DEFAULT NULL,
  `professor_num` int(11) DEFAULT NULL,
  `uniUs_num` int(11) DEFAULT NULL,
  `user_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of general_info
-- ----------------------------
INSERT INTO `general_info` VALUES ('12', '4', '7', '22');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gradeId` int(11) NOT NULL AUTO_INCREMENT,
  `GREQuantitative` int(11) DEFAULT NULL,
  `GREVerbal` int(11) DEFAULT NULL,
  `GREAnaliticalWriting` int(11) DEFAULT NULL,
  `TOEFLListening` int(11) DEFAULT NULL,
  `TOEFLReading` int(11) DEFAULT NULL,
  `TOEFLWriting` int(11) DEFAULT NULL,
  `TOEFLSpeaking` int(11) DEFAULT NULL,
  `IELTSListening` float(11,0) DEFAULT NULL,
  `IELTSReading` float(11,0) DEFAULT NULL,
  `IELTSWriting` float(11,0) DEFAULT NULL,
  `IELTSSpeaking` float(11,0) DEFAULT NULL,
  `GPA` float DEFAULT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '164', '164', '164', '25', '24', '22', '30', null, null, null, null, '3.88');
INSERT INTO `grade` VALUES ('2', '160', '164', '5', '29', '30', '24', '24', '6', '7', '6', '7', '3.9');
INSERT INTO `grade` VALUES ('3', '166', '166', '4', '28', '30', '26', '22', '7', '7', '7', '6', '4');
INSERT INTO `grade` VALUES ('4', '166', '164', '5', '29', '30', '24', '22', '6', '6', '6', '7', '3.6');
INSERT INTO `grade` VALUES ('6', '111', '111', '4', '20', '20', '20', '20', null, null, null, null, null);
INSERT INTO `grade` VALUES ('7', '120', '120', '5', '12', '22', '23', '12', null, null, null, null, null);
INSERT INTO `grade` VALUES ('8', '123', '123', '4', '2', '23', '30', '22', null, null, null, null, null);
INSERT INTO `grade` VALUES ('9', '145', '143', '6', '15', '25', '24', '12', null, null, null, null, null);
INSERT INTO `grade` VALUES ('10', '170', '170', '170', '170', '170', '170', '170', null, null, null, null, null);
INSERT INTO `grade` VALUES ('11', '123', '234', '234', '12', '123', '234', '24', null, null, null, null, null);
INSERT INTO `grade` VALUES ('12', '12', '23423', '123', '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `grade` VALUES ('13', '23', '243', '5423', '23', '23', '35', '12', null, null, null, null, null);
INSERT INTO `grade` VALUES ('14', '12', '2134', '12', '234', '12', '21', '12', null, null, null, null, null);
INSERT INTO `grade` VALUES ('15', '170', '1165', '3', '29', '30', '25', '25', null, null, null, null, null);
INSERT INTO `grade` VALUES ('16', '170', '1165', '3', '29', '30', '25', '25', null, null, null, null, null);
INSERT INTO `grade` VALUES ('17', '123', '321', '3', '23', '23', '21', '21', null, null, null, null, null);
INSERT INTO `grade` VALUES ('18', '153', '143', '7', '28', '21', '22', '29', null, null, null, null, null);
INSERT INTO `grade` VALUES ('19', '122', '111', '133', '2', '1', '4', '3', null, null, null, null, null);
INSERT INTO `grade` VALUES ('20', '170', '170', '6', '30', '30', '25', '30', null, null, null, null, null);
INSERT INTO `grade` VALUES ('21', '3', '1', '3', '22', '11', '44', '33', null, null, null, null, null);
INSERT INTO `grade` VALUES ('22', '170', '170', '6', '30', '30', '25', '30', null, null, null, null, null);
INSERT INTO `grade` VALUES ('23', '141', '140', '4', '26', '30', '27', '24', null, null, null, null, null);
INSERT INTO `grade` VALUES ('24', '170', '170', '3', '28', '29', '26', '27', null, null, null, null, null);
INSERT INTO `grade` VALUES ('25', '170', '170', '6', '29', '30', '27', '28', null, null, null, null, null);
INSERT INTO `grade` VALUES ('26', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `grade` VALUES ('27', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `grade` VALUES ('28', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `grade` VALUES ('29', null, null, null, '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `grade` VALUES ('30', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `grade` VALUES ('31', '170', '160', '3', '20', '25', '10', '15', null, null, null, null, null);

-- ----------------------------
-- Table structure for graduate
-- ----------------------------
DROP TABLE IF EXISTS `graduate`;
CREATE TABLE `graduate` (
  `graduateId` int(11) NOT NULL,
  `graduateName` text,
  `gradutateGender` text,
  `gradeId` int(11) DEFAULT NULL,
  `uniCId` int(11) DEFAULT NULL,
  PRIMARY KEY (`graduateId`),
  KEY `gradeId` (`gradeId`),
  KEY `uniCId` (`uniCId`),
  CONSTRAINT `graduate_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`gradeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `graduate_ibfk_2` FOREIGN KEY (`uniCId`) REFERENCES `universitychina` (`uniCId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graduate
-- ----------------------------
INSERT INTO `graduate` VALUES ('1', 'Andy', 'male', '1', '1');
INSERT INTO `graduate` VALUES ('2', 'Bob', 'male', '2', '2');
INSERT INTO `graduate` VALUES ('3', 'Alice', 'female', '3', '2');
INSERT INTO `graduate` VALUES ('4', 'Julie', 'female', '4', '3');
INSERT INTO `graduate` VALUES ('6', 'Jean', 'female', '7', '1');
INSERT INTO `graduate` VALUES ('7', 'aaa', 'male', '8', '3');
INSERT INTO `graduate` VALUES ('8', 'b', 'female', '9', '3');
INSERT INTO `graduate` VALUES ('9', 'bb', 'female', '10', '3');
INSERT INTO `graduate` VALUES ('10', 'bbb', 'female', '11', '2');
INSERT INTO `graduate` VALUES ('11', 'c', 'male', '12', '2');
INSERT INTO `graduate` VALUES ('12', 'cc', 'male', '13', '1');
INSERT INTO `graduate` VALUES ('13', 'ccc', 'male', '14', '3');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paperId` int(11) NOT NULL,
  `paperName` text,
  `paperMajor` text,
  PRIMARY KEY (`paperId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', 'CNN for QA system', 'Computer Science');
INSERT INTO `paper` VALUES ('2', 'Quantum Computiing', 'Computer Science');
INSERT INTO `paper` VALUES ('3', 'Data mining and network computing', 'Computer Science');
INSERT INTO `paper` VALUES ('4', 'poetry and art', 'Social Science');
INSERT INTO `paper` VALUES ('5', 'Strength of carbon fiber', 'Material Science');
INSERT INTO `paper` VALUES ('6', 'aaaabbbbcccc', 'Social Science');
INSERT INTO `paper` VALUES ('7', 'sdfadsfasdf', 'Social Science');
INSERT INTO `paper` VALUES ('8', 'awefsdfewf', 'Social Science');

-- ----------------------------
-- Table structure for professor
-- ----------------------------
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `professorId` int(11) NOT NULL,
  `professorName` text,
  `professorHomepage` text,
  `professorMajor` text,
  `userId` int(11) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `uniUId` int(11) DEFAULT NULL,
  `email` text,
  PRIMARY KEY (`professorId`),
  KEY `userId` (`userId`),
  KEY `schoolId` (`schoolId`),
  KEY `uniUId` (`uniUId`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`schoolId`) REFERENCES `school` (`schoolId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_ibfk_3` FOREIGN KEY (`uniUId`) REFERENCES `universityus` (`uniUId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of professor
-- ----------------------------
INSERT INTO `professor` VALUES ('1', 'peter', 'peter.edu.cn', 'computer science', '23', null, '2', 'peter@p.edu');
INSERT INTO `professor` VALUES ('2', 'andy', 'peter.edu.cn', 'computer science', null, null, null, ' andy@a.edu');
INSERT INTO `professor` VALUES ('3', 'colin', 'colin.edu.cn', 'ee', null, null, null, null);
INSERT INTO `professor` VALUES ('4', 'andy1', 'andy1.edu.cn', 'dfds', null, null, '1', 'andy1@a.edu');

-- ----------------------------
-- Table structure for publish
-- ----------------------------
DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish` (
  `graduateId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `citing` int(11) DEFAULT NULL,
  PRIMARY KEY (`graduateId`,`paperId`),
  KEY `paperId` (`paperId`),
  CONSTRAINT `publish_ibfk_1` FOREIGN KEY (`graduateId`) REFERENCES `graduate` (`graduateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `publish_ibfk_2` FOREIGN KEY (`paperId`) REFERENCES `paper` (`paperId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publish
-- ----------------------------
INSERT INTO `publish` VALUES ('1', '1', '100');
INSERT INTO `publish` VALUES ('1', '2', '150');
INSERT INTO `publish` VALUES ('2', '3', '30');
INSERT INTO `publish` VALUES ('3', '4', '45');
INSERT INTO `publish` VALUES ('3', '5', '70');
INSERT INTO `publish` VALUES ('4', '1', '50');
INSERT INTO `publish` VALUES ('6', '1', '30');
INSERT INTO `publish` VALUES ('6', '3', '30');
INSERT INTO `publish` VALUES ('6', '8', '20');
INSERT INTO `publish` VALUES ('7', '3', '22');
INSERT INTO `publish` VALUES ('8', '4', '45');
INSERT INTO `publish` VALUES ('9', '1', '100');
INSERT INTO `publish` VALUES ('9', '4', '45');
INSERT INTO `publish` VALUES ('10', '2', '150');
INSERT INTO `publish` VALUES ('10', '3', '30');
INSERT INTO `publish` VALUES ('11', '3', '30');
INSERT INTO `publish` VALUES ('12', '2', '150');
INSERT INTO `publish` VALUES ('12', '4', '45');
INSERT INTO `publish` VALUES ('13', '1', '100');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `schoolId` int(11) NOT NULL,
  `schoolName` text,
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', 'CS');
INSERT INTO `school` VALUES ('2', 'EE');
INSERT INTO `school` VALUES ('3', 'ME');
INSERT INTO `school` VALUES ('4', 'EM');
INSERT INTO `school` VALUES ('5', 'PPM');
INSERT INTO `school` VALUES ('6', 'AAD');

-- ----------------------------
-- Table structure for studentuser
-- ----------------------------
DROP TABLE IF EXISTS `studentuser`;
CREATE TABLE `studentuser` (
  `SUserId` int(11) NOT NULL,
  `SUserName` text,
  `SName` text,
  `SUserPassword` text,
  `SUserGender` text,
  `gradeId` int(11) DEFAULT NULL,
  `tel` text,
  `idealUni` text,
  PRIMARY KEY (`SUserId`),
  KEY `studentuser_ibfk_1` (`gradeId`),
  CONSTRAINT `studentuser_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`gradeId`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentuser
-- ----------------------------
INSERT INTO `studentuser` VALUES ('1', 'jinshenandy', null, 'jinshenandy', 'male', '6', null, null);
INSERT INTO `studentuser` VALUES ('2', 'Minima', null, '12345', 'Male', '1', '123', null);
INSERT INTO `studentuser` VALUES ('3', 'Minima1', null, '123', '123', '8', '123', null);
INSERT INTO `studentuser` VALUES ('5', 'Minima123', null, '1234', 'Male', '10', '123', null);
INSERT INTO `studentuser` VALUES ('7', 'Minima1234', null, '123', 'Male', '12', '123', null);
INSERT INTO `studentuser` VALUES ('8', 'Minima12345', null, '123', 'Male', '13', '123', null);
INSERT INTO `studentuser` VALUES ('9', 'Minima123456', null, '123', 'Male', '14', '130', null);
INSERT INTO `studentuser` VALUES ('10', 'ChenxiaoMa', null, 'dS4-sDs-KTg-2GC', 'Male', '15', '13020095391', null);
INSERT INTO `studentuser` VALUES ('11', 'ShenJin', null, 'dS4-sDs-KTg-2GC', 'M', '16', '130203199609280613', null);
INSERT INTO `studentuser` VALUES ('12', 'YangyangWu', null, '123456', 'Male', '17', '131', null);
INSERT INTO `studentuser` VALUES ('13', 'YangyangWu2', ' ', '123456', 'Male', '18', '131', null);
INSERT INTO `studentuser` VALUES ('14', 'h', 'aaabbb', 'yyy', 'male', '19', '00000', null);
INSERT INTO `studentuser` VALUES ('15', 'TeYang', 'Yang Te', 'WTx-9JD-aGx-gxX', 'Male', '20', '131', null);
INSERT INTO `studentuser` VALUES ('16', 'jin1111', 'jin1', '666', 'male', '21', '3333333', 'University of California, Berkeley');
INSERT INTO `studentuser` VALUES ('17', 'Yuanmengyang', 'Mengyang Yuan', '123', 'Male', '22', '131', 'Princeton University');
INSERT INTO `studentuser` VALUES ('18', 'hermesking', 'auas666', '666777', 'male', '23', '123123123', 'University of California, Berkeley');
INSERT INTO `studentuser` VALUES ('19', 'Mike', 'Mike', '123', 'Female', '24', '1301', 'Harvard University');
INSERT INTO `studentuser` VALUES ('20', 'Jin3', 'JinSan', 'ab', 'Male', '25', 'j130', 'Princeton University');
INSERT INTO `studentuser` VALUES ('21', 'WTF', 'Michael', '123', 'Male', '28', '131', 'Harvard University');
INSERT INTO `studentuser` VALUES ('22', 'Michael', ' ', '123', 'Male', '29', '131', ' ');
INSERT INTO `studentuser` VALUES ('23', 'Michael123', 'Michael', '123', 'Male', '30', '131', 'Harvard University');
INSERT INTO `studentuser` VALUES ('24', 'WTF3', 'Michael', '123', 'Male', '31', '131', 'Harvard University');

-- ----------------------------
-- Table structure for universitychina
-- ----------------------------
DROP TABLE IF EXISTS `universitychina`;
CREATE TABLE `universitychina` (
  `uniCId` int(11) NOT NULL,
  `uniCName` text,
  `uniCHomepage` text,
  `uniCGeneralRank` text,
  KEY `uniCId` (`uniCId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of universitychina
-- ----------------------------
INSERT INTO `universitychina` VALUES ('1', 'Beihang University', 'buaa.edu.cn', '1');
INSERT INTO `universitychina` VALUES ('2', 'Peking University', 'pku.edu.cn', '2');
INSERT INTO `universitychina` VALUES ('3', 'Tsinghua University', 'thu.edu.cn', '3');

-- ----------------------------
-- Table structure for universityschool
-- ----------------------------
DROP TABLE IF EXISTS `universityschool`;
CREATE TABLE `universityschool` (
  `uniUId` int(11) NOT NULL,
  `schoolId` int(11) NOT NULL,
  `avgSGraduateSalary` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`uniUId`,`schoolId`),
  KEY `schoolId` (`schoolId`),
  CONSTRAINT `universityschool_ibfk_1` FOREIGN KEY (`uniUId`) REFERENCES `universityus` (`uniUId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `universityschool_ibfk_2` FOREIGN KEY (`schoolId`) REFERENCES `school` (`schoolId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of universityschool
-- ----------------------------
INSERT INTO `universityschool` VALUES ('1', '1', '180000', '6');
INSERT INTO `universityschool` VALUES ('1', '2', '170000', '2');
INSERT INTO `universityschool` VALUES ('1', '4', '170000', '4');
INSERT INTO `universityschool` VALUES ('1', '6', '150000', '5');
INSERT INTO `universityschool` VALUES ('2', '1', '200000', '2');
INSERT INTO `universityschool` VALUES ('2', '2', '100000', '9');
INSERT INTO `universityschool` VALUES ('2', '3', '110000', '10');
INSERT INTO `universityschool` VALUES ('2', '6', '129000', '12');
INSERT INTO `universityschool` VALUES ('3', '1', '300000', '1');
INSERT INTO `universityschool` VALUES ('3', '2', '99000', '30');
INSERT INTO `universityschool` VALUES ('3', '4', '200000', '1');
INSERT INTO `universityschool` VALUES ('3', '5', '203000', '2');
INSERT INTO `universityschool` VALUES ('3', '6', '120000', '6');
INSERT INTO `universityschool` VALUES ('4', '1', '120000', '3');
INSERT INTO `universityschool` VALUES ('4', '2', '320000', '6');
INSERT INTO `universityschool` VALUES ('4', '4', '60000', '60');
INSERT INTO `universityschool` VALUES ('4', '5', '203000', '5');
INSERT INTO `universityschool` VALUES ('4', '6', '290000', '7');
INSERT INTO `universityschool` VALUES ('5', '1', '200000', '18');
INSERT INTO `universityschool` VALUES ('5', '2', '32000', '196');
INSERT INTO `universityschool` VALUES ('5', '3', '263000', '11');
INSERT INTO `universityschool` VALUES ('5', '4', '211234', '10');
INSERT INTO `universityschool` VALUES ('5', '6', '550000', '22');
INSERT INTO `universityschool` VALUES ('6', '1', '340000', '13');
INSERT INTO `universityschool` VALUES ('6', '2', '240000', '54');
INSERT INTO `universityschool` VALUES ('6', '6', '120000', '33');
INSERT INTO `universityschool` VALUES ('7', '1', '321000', '42');
INSERT INTO `universityschool` VALUES ('7', '2', '124200', '27');
INSERT INTO `universityschool` VALUES ('7', '3', '214300', '8');
INSERT INTO `universityschool` VALUES ('7', '4', '213450', '17');
INSERT INTO `universityschool` VALUES ('7', '5', '235210', '33');
INSERT INTO `universityschool` VALUES ('7', '6', '420000', '1');

-- ----------------------------
-- Table structure for universityus
-- ----------------------------
DROP TABLE IF EXISTS `universityus`;
CREATE TABLE `universityus` (
  `uniUId` int(11) NOT NULL,
  `uniUName` text,
  `uniUHomepage` text,
  `uniUGeneralRank` int(11) DEFAULT NULL,
  `avgUGraduateSalary` float DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`uniUId`),
  KEY `uniUId` (`uniUId`),
  KEY `userId` (`userId`),
  CONSTRAINT `universityus_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of universityus
-- ----------------------------
INSERT INTO `universityus` VALUES ('1', 'Princeton University', 'www.princeton.edu', '1', '200000', null);
INSERT INTO `universityus` VALUES ('2', 'Harvard University', 'www.harvard.edu', '2', '180000', '26');
INSERT INTO `universityus` VALUES ('3', 'Yale University', 'www.yale.edu', '3', '180000', null);
INSERT INTO `universityus` VALUES ('4', 'Stanford University', 'www.standford.edu', '4', '17500', null);
INSERT INTO `universityus` VALUES ('5', 'University of California, Berkeley', 'www.berkeley.edu', '13', '13000', null);
INSERT INTO `universityus` VALUES ('6', 'Carnegie Mellon University', 'www.cmu.edu', '22', '15000', null);
INSERT INTO `universityus` VALUES ('7', 'Massachusetts Institude of Technology', 'web.mit.edu', '1', '130000', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` text,
  `userPassword` text,
  `email` text,
  `uni` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('17', 'Minima', '123', 'cma', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('18', 'University of California, Berkeley', '555', 'ddd@122', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('19', 'auas', '888', 'jin@163', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('20', 'abc', 'abc', '123', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('21', 'abc1', 'abc', '123', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('22', 'abc1231212', 'abc', '123', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('23', 'peter', '123', 'peter@p.edu', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('24', 'University of California, Beikeley', '123', '123', 'University of California, Berkeley');
INSERT INTO `user` VALUES ('25', 'Princeton University', '123', '123', 'Princeton University');
INSERT INTO `user` VALUES ('26', 'Harvard University', '123', '123', 'Harvard University');
INSERT INTO `user` VALUES ('27', 'Universtiy of California, Berkeley', '12', '123', 'University of California, Berkeley');

-- ----------------------------
-- View structure for graduate_publish
-- ----------------------------
DROP VIEW IF EXISTS `graduate_publish`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `graduate_publish` AS SELECT
publish.citing,
paper.paperName,
paper.paperMajor,
graduate.graduateId,
graduate.graduateName,
graduate.gradutateGender,
graduate.uniCId
FROM
publish
INNER JOIN graduate ON publish.graduateId = graduate.graduateId
INNER JOIN paper ON publish.paperId = paper.paperId ;

-- ----------------------------
-- View structure for professor_uni
-- ----------------------------
DROP VIEW IF EXISTS `professor_uni`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `professor_uni` AS SELECT
universityus.uniUName,
universityus.uniUHomepage,
universityus.uniUGeneralRank,
universityus.avgUGraduateSalary,
professor.professorName,
professor.professorId,
professor.professorHomepage,
professor.professorMajor,
professor.userId,
professor.schoolId,
professor.uniUId,
professor.email
FROM
universityus
INNER JOIN professor ON professor.uniUId = universityus.uniUId ;

-- ----------------------------
-- View structure for p_check
-- ----------------------------
DROP VIEW IF EXISTS `p_check`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `p_check` AS SELECT
graduate.graduateId,
graduate.graduateName,
graduate.gradutateGender,
graduate.gradeId,
graduate.uniCId,
universityus.uniUHomepage,
universityus.uniUName,
universityus.uniUId,
universityus.uniUGeneralRank,
universityus.avgUGraduateSalary,
universityus.userId,
apply.accept,
universitychina.uniCName,
universitychina.uniCHomepage,
universitychina.uniCGeneralRank,
grade.GREQuantitative,
grade.GREVerbal,
grade.GREAnaliticalWriting,
grade.TOEFLListening,
grade.TOEFLReading,
grade.TOEFLWriting,
grade.TOEFLSpeaking,
grade.IELTSListening,
grade.IELTSReading,
grade.IELTSWriting,
grade.IELTSSpeaking,
grade.GPA,
professor.professorHomepage,
professor.professorName,
professor.professorMajor,
professor.email
FROM
graduate
INNER JOIN apply ON apply.graduateId = graduate.graduateId AND apply.accept = graduate.graduateId
INNER JOIN universityus ON apply.uniUId = universityus.uniUId
INNER JOIN universitychina ON graduate.uniCId = universitychina.uniCId
INNER JOIN grade ON graduate.gradeId = grade.gradeId
INNER JOIN professor ON professor.uniUId = universityus.uniUId ;

-- ----------------------------
-- View structure for std_apply
-- ----------------------------
DROP VIEW IF EXISTS `std_apply`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `std_apply` AS SELECT
apply.accept,
grade.GREQuantitative,
grade.GREVerbal,
grade.GREAnaliticalWriting,
grade.TOEFLListening,
grade.TOEFLReading,
grade.TOEFLWriting,
grade.TOEFLSpeaking,
graduate.graduateName,
graduate.gradutateGender,
graduate.graduateId,
universitychina.uniCHomepage,
universitychina.uniCName,
universitychina.uniCGeneralRank,
universityus.uniUName,
apply.uniUId
FROM
apply
INNER JOIN graduate ON apply.graduateId = graduate.graduateId
INNER JOIN grade ON graduate.gradeId = grade.gradeId
INNER JOIN universitychina ON graduate.uniCId = universitychina.uniCId
INNER JOIN universityus ON apply.uniUId = universityus.uniUId ;

-- ----------------------------
-- View structure for unisch_full
-- ----------------------------
DROP VIEW IF EXISTS `unisch_full`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `unisch_full` AS SELECT
universityus.uniUName,
universityus.uniUHomepage,
universityus.uniUGeneralRank,
universityus.avgUGraduateSalary,
school.schoolName,
universityschool.rank,
universityschool.avgSGraduateSalary

FROM
school
INNER JOIN universityschool ON universityschool.schoolId = school.schoolId
INNER JOIN universityus ON universityschool.uniUId = universityus.uniUId ;

-- ----------------------------
-- Procedure structure for apply_h_aw
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_aw`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_aw`(`aw` int,`_name` text)
BEGIN
	#Routine body goes here...
select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.GREAnaliticalWriting>aw));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_h_q
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_q`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_q`(`q` int,`_name` text)
BEGIN
	#Routine body goes here...
	select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.GREQuantitative>q));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_h_TFL
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_TFL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_TFL`(`TFL` int,`_name` text)
BEGIN
	#Routine body goes here...
select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.TOEFLListening>TFL));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_h_TFR
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_TFR`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_TFR`(`TFR` int,`_name` text)
BEGIN
	#Routine body goes here...
	select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.TOEFLReading>TFR));
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_h_TFS
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_TFS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_TFS`(`TFS` int,`_name` text)
BEGIN
	#Routine body goes here...
	select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.TOEFLSpeaking>TF));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_h_TFW
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_TFW`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_TFW`(`TFW` int,`_name` text)
BEGIN
	#Routine body goes here...
select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.TOEFLWriting>TFW));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_h_v
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_h_v`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_h_v`(`v` int,`_name` text)
BEGIN
	#Routine body goes here...
select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)) 
	and (std_apply.GREVerbal>v));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for apply_uni
-- ----------------------------
DROP PROCEDURE IF EXISTS `apply_uni`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_uni`(`_name` text)
BEGIN
	#Routine body goes here...
	select count(*) from std_apply where ((std_apply.accept=1) and 
	(std_apply.uniUId = (SELECT uniUId from universityus where universityus.uniUName = _name)));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for chq_std_apply_by_uniName
-- ----------------------------
DROP PROCEDURE IF EXISTS `chq_std_apply_by_uniName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `chq_std_apply_by_uniName`(`name_` text)
BEGIN
	#Routine body goes here...
SELECT graduateName,accept,TOEFLReading,TOEFLListening,TOEFLSpeaking,TOEFLWriting,GREVerbal,GREQuantitative,GREAnaliticalWriting
from std_apply
where (uniUName = name_);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_Cuni_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_Cuni_info`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_Cuni_info`(`id` int)
BEGIN
	#Routine body goes here...
	select uniCName,uniCGeneralRank,uniCHomePage
	from std_apply
	where graduateId = id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_grade_by_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_grade_by_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_grade_by_id`(`id` int)
BEGIN
	#Routine body goes here...
	SELECT * from grade where gradeId = id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_paper_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_paper_info`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_paper_info`(`gradId` int)
BEGIN
	#Routine body goes here...
	select paperName,paperMajor,citing
	from graduate_publish
	where graduateId = gradId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_stduser_grade_by_name
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_stduser_grade_by_name`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stduser_grade_by_name`(`stdName` text)
BEGIN
	#Routine body goes here...
	select * FROM grade where gradeId in 
	(select gradeId from studentuser where SUserName = stdName);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_stduser_info_by_name
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_stduser_info_by_name`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stduser_info_by_name`(`stdName` text)
BEGIN
	#Routine body goes here...
	select SUserGender,tel from studentuser WHERE SUserName = stdName;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_uni_from_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_uni_from_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_uni_from_user`(`useName_in` text)
BEGIN
	#Routine body goes here...
	select uni from user
	where userName = useName_in;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_uni_sch_by_name
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_uni_sch_by_name`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_uni_sch_by_name`(`_uniName` text)
BEGIN
	#Routine body goes here...
	SELECT * from unisch_full
	where uniUName = _uniName
	ORDER BY rank;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for init_gre_by_gradeId
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_gre_by_gradeId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `init_gre_by_gradeId`(`id` int)
BEGIN
	#Routine body goes here...
	update grade
	set GREQuantitative = 0, GREVerbal = 0, GREAnaliticalWriting = 0
	where gradeId = id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for init_tf_by_gradeId
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_tf_by_gradeId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `init_tf_by_gradeId`(`id` int)
BEGIN
	#Routine body goes here...
	update grade
	set TOEFLListening = 0,TOEFLReading = 0,TOEFLSpeaking = 0,TOEFLWriting = 0
	where gradeId = id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_chq_graduate
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_chq_graduate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_chq_graduate`(`pname` text)
BEGIN
	#Routine body goes here...
	SELECT graduateName,gradutateGender,GREQuantitative,GREVerbal,GREAnaliticalWriting,TOEFLListening,TOEFLReading,TOEFLWriting,TOEFLSpeaking,uniCName,graduateId
	FROM p_check
	where professorName = pname;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for std_GRE_grade
-- ----------------------------
DROP PROCEDURE IF EXISTS `std_GRE_grade`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `std_GRE_grade`(`name_` text,`q` int,`v` int,`aw` int)
BEGIN
	#Routine body goes here...
update grade
	set GREQuantitative = q, GREVerbal = v,GREAnaliticalWriting=aw
where gradeId = (select gradeId FROM studentuser s where s.SUserName = name_);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for std_TF_grade
-- ----------------------------
DROP PROCEDURE IF EXISTS `std_TF_grade`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `std_TF_grade`(`name_` text,`speaking` int,`reading` int,`writing` int,`listening` int)
BEGIN
	#Routine body goes here...
	update grade
	set TOEFLListening = listening, TOEFLReading = reading, TOEFLWriting = writing,TOEFLSpeaking = speaking
	where gradeId = (select gradeId FROM studentuser s where s.SUserName = name_);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for uni_chq_graduate
-- ----------------------------
DROP PROCEDURE IF EXISTS `uni_chq_graduate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_chq_graduate`(`pname` text)
BEGIN
	#Routine body goes here...
	SELECT graduateName,gradutateGender,GREQuantitative,GREVerbal,GREAnaliticalWriting,TOEFLListening,TOEFLReading,TOEFLWriting,TOEFLSpeaking,uniCName,graduateId
	FROM std_apply
	where uniUName = pname;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_graduate_num_in`;
DELIMITER ;;
CREATE TRIGGER `update_graduate_num_in` AFTER INSERT ON `graduate` FOR EACH ROW begin
update general_info
set graduate_num = (select count(*) from graduate);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_graduate_num_out`;
DELIMITER ;;
CREATE TRIGGER `update_graduate_num_out` AFTER DELETE ON `graduate` FOR EACH ROW begin
update general_info
set graduate_num = (select count(*) from graduate);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_prof_num_in`;
DELIMITER ;;
CREATE TRIGGER `update_prof_num_in` AFTER INSERT ON `professor` FOR EACH ROW begin
update general_info
set professor_num = (select count(*) from professor);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_prof_num_out`;
DELIMITER ;;
CREATE TRIGGER `update_prof_num_out` AFTER DELETE ON `professor` FOR EACH ROW begin
update general_info
set professor_num = (select count(*) from professor);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `up_user_num_in`;
DELIMITER ;;
CREATE TRIGGER `up_user_num_in` AFTER INSERT ON `studentuser` FOR EACH ROW begin
update general_info
set user_num = (select count(*) from studentuser);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `up_user_num_out`;
DELIMITER ;;
CREATE TRIGGER `up_user_num_out` AFTER DELETE ON `studentuser` FOR EACH ROW begin
update general_info
set user_num = (select count(*) from studentuser);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_uniUs_num_in`;
DELIMITER ;;
CREATE TRIGGER `update_uniUs_num_in` AFTER INSERT ON `universityus` FOR EACH ROW begin
update general_info
set uniUs_num = (select count(*) from universityus);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_uniUs_num_out`;
DELIMITER ;;
CREATE TRIGGER `update_uniUs_num_out` AFTER DELETE ON `universityus` FOR EACH ROW begin
update general_info
set uniUs_num = (select count(*) from universityus);
end
;;
DELIMITER ;
