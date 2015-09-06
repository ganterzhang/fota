/*
Navicat MySQL Data Transfer

Source Server         : 192.168.69.64
Source Server Version : 50540
Source Host           : 192.168.69.64:3306
Source Database       : fota

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-07-16 10:19:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `deviceId` varchar(100) DEFAULT NULL COMMENT '设备号',
  `versionId` varchar(100) DEFAULT NULL COMMENT '版本号',
  `createTime` datetime NOT NULL,
  `updateTime` datetime DEFAULT NULL,
  `productId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='用户设备';

-- ----------------------------
-- Records of device
-- ----------------------------

-- ----------------------------
-- Table structure for devicecheck
-- ----------------------------
DROP TABLE IF EXISTS `devicecheck`;
CREATE TABLE `devicecheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(100) DEFAULT NULL,
  `versionId` varchar(100) DEFAULT NULL,
  `productId` varchar(100) DEFAULT NULL,
  `deviceName` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `newVersion` varchar(100) DEFAULT NULL,
  `cdnurl` varchar(1000) DEFAULT NULL,
  `time` datetime NOT NULL,
  `checkType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of devicecheck
-- ----------------------------

-- ----------------------------
-- Table structure for devicedownload
-- ----------------------------
DROP TABLE IF EXISTS `devicedownload`;
CREATE TABLE `devicedownload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL,
  `versionId` varchar(255) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `sversionId` varchar(255) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `cdnurl` varchar(255) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `md5Validate` varchar(255) DEFAULT NULL,
  `longTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of devicedownload
-- ----------------------------

-- ----------------------------
-- Table structure for deviceupgrade
-- ----------------------------
DROP TABLE IF EXISTS `deviceupgrade`;
CREATE TABLE `deviceupgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(100) DEFAULT NULL,
  `versionId` varchar(100) DEFAULT NULL,
  `productId` varchar(100) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL,
  `log` longtext,
  `uuid` varchar(1000) DEFAULT NULL,
  `aversionId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deviceupgrade
-- ----------------------------

-- ----------------------------
-- Table structure for factory
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shortName` varchar(4000) DEFAULT NULL COMMENT '厂商缩写名 比如：创锐思 TRX',
  `name` varchar(4000) DEFAULT NULL COMMENT '名称 比如：创锐思',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='厂商';

-- ----------------------------
-- Records of factory
-- ----------------------------

-- ----------------------------
-- Table structure for frienduserdevicelist
-- ----------------------------
DROP TABLE IF EXISTS `frienduserdevicelist`;
CREATE TABLE `frienduserdevicelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(100) DEFAULT NULL,
  `versionId` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `demo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deviceInfo` (`deviceId`,`versionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of frienduserdevicelist
-- ----------------------------

-- ----------------------------
-- Table structure for ipaddress
-- ----------------------------
DROP TABLE IF EXISTS `ipaddress`;
CREATE TABLE `ipaddress` (
  `id` int(11) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `isp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipaddress
-- ----------------------------

-- ----------------------------
-- Table structure for log_publish
-- ----------------------------
DROP TABLE IF EXISTS `log_publish`;
CREATE TABLE `log_publish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `versionId` varchar(30) NOT NULL,
  `stage` varchar(20) DEFAULT NULL,
  `action` varchar(1000) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `versionId` (`versionId`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_publish
-- ----------------------------

-- ----------------------------
-- Table structure for package
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `versionId` varchar(100) DEFAULT NULL COMMENT '版本ID',
  `uploader` varchar(100) DEFAULT NULL COMMENT '上传者',
  `uploadTime` datetime DEFAULT NULL COMMENT '上传时间',
  `size` varchar(100) DEFAULT NULL COMMENT '操作时间',
  `path` varchar(1000) DEFAULT NULL COMMENT '存放路径',
  `cdnPath` varchar(1000) DEFAULT NULL COMMENT 'cdn存放路径',
  `md5Path` varchar(1000) DEFAULT NULL COMMENT 'md5存放路径',
  `md5Status` varchar(100) DEFAULT NULL COMMENT 'md5验证是否成功',
  `type` varchar(100) DEFAULT NULL COMMENT '包类型 full包还是delta包',
  `name` varchar(1000) DEFAULT NULL,
  `hversionId` varchar(100) DEFAULT NULL,
  `desFileName` varchar(1000) DEFAULT NULL,
  `isFullPackage` bit(1) DEFAULT NULL,
  `useFullPackage` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `versionId` (`versionId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='升级包';

-- ----------------------------
-- Records of package
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shortName` varchar(100) DEFAULT NULL COMMENT '组合缩写 TRO-BX-B2-L00',
  `name` varchar(100) DEFAULT NULL COMMENT '产品名称 Box 2 全网通版',
  `factoryShortName` varchar(100) DEFAULT NULL,
  `productTypeShortName` varchar(100) DEFAULT NULL,
  `productModelShortName` varchar(100) DEFAULT NULL,
  `subProductModelShortName` varchar(100) DEFAULT NULL,
  `subProductNum` int(10) unsigned DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productShortNameIndex` (`shortName`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for productmodel
-- ----------------------------
DROP TABLE IF EXISTS `productmodel`;
CREATE TABLE `productmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shortName` varchar(4000) DEFAULT NULL COMMENT '厂商缩写名 比如：B1',
  `name` varchar(4000) DEFAULT NULL COMMENT '名称 比如：BOX',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='产品型号';

-- ----------------------------
-- Records of productmodel
-- ----------------------------

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shortName` varchar(4000) DEFAULT NULL COMMENT '类型缩写名 比如：MB',
  `name` varchar(4000) DEFAULT NULL COMMENT '名称 比如：手机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='产品类型';

-- ----------------------------
-- Records of producttype
-- ----------------------------

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `targetNum` int(11) DEFAULT NULL COMMENT '数量',
  `finishNum` int(11) DEFAULT NULL COMMENT '时间期限',
  `versionID` varchar(100) DEFAULT NULL COMMENT '版本',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(100) DEFAULT NULL COMMENT '创建人',
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='策略表';

-- ----------------------------
-- Records of strategy
-- ----------------------------

-- ----------------------------
-- Table structure for subproductmodel
-- ----------------------------
DROP TABLE IF EXISTS `subproductmodel`;
CREATE TABLE `subproductmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `shortName` varchar(10) DEFAULT NULL COMMENT '类型缩写名 比如：LT,YD',
  `name` varchar(100) DEFAULT NULL COMMENT '名称 比如：联通,移动、增强',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='细分型号';

-- ----------------------------
-- Records of subproductmodel
-- ----------------------------

-- ----------------------------
-- Table structure for testdevicelist
-- ----------------------------
DROP TABLE IF EXISTS `testdevicelist`;
CREATE TABLE `testdevicelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL,
  `versionId` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `demo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deviceInfo` (`deviceId`,`versionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testdevicelist
-- ----------------------------

-- ----------------------------
-- Table structure for testreport
-- ----------------------------
DROP TABLE IF EXISTS `testreport`;
CREATE TABLE `testreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `versionId` varchar(100) DEFAULT NULL COMMENT '版本ID',
  `uploader` varchar(100) DEFAULT NULL COMMENT '上传者',
  `uploadTime` datetime DEFAULT NULL COMMENT '上传时间',
  `size` int(10) DEFAULT NULL COMMENT '操作时间',
  `path` varchar(1000) DEFAULT NULL COMMENT '存放路径',
  `phase` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='测试报告';

-- ----------------------------
-- Records of testreport
-- ----------------------------

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `versionId` varchar(100) DEFAULT NULL COMMENT '版本号',
  `productId` varchar(100) DEFAULT NULL COMMENT '版本名',
  `isFactory` char(1) DEFAULT NULL COMMENT '是否工厂版本',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `versionNum` varchar(100) DEFAULT NULL,
  `packageStatus` varchar(10) DEFAULT '',
  `testStatus` varchar(10) DEFAULT '',
  `cdnStatus` varchar(10) DEFAULT '',
  `friendStatus` varchar(10) DEFAULT '',
  `fewStatus` varchar(10) DEFAULT '',
  `publishStatus` varchar(10) DEFAULT '',
  `latestStatus` varchar(10) DEFAULT '200',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='版本包映射 版本对应full包还是delta包';

-- ----------------------------
-- Records of version
-- ----------------------------

-- ----------------------------
-- Table structure for versionstatus
-- ----------------------------
DROP TABLE IF EXISTS `versionstatus`;
CREATE TABLE `versionstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionId` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `creater` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of versionstatus
-- ----------------------------
