/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `shi` varchar(50) DEFAULT '0',
  `sheng` varchar(50) DEFAULT '0',
  `shiid` varchar(50) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cityline` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `linename` varchar(50) DEFAULT '0',
  `shiid` varchar(50) DEFAULT '0',
  `lineid` varchar(50) DEFAULT '0',
  `buser` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dudu_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dudu_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `maseruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  `pass` varchar(50) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busname` varchar(50) DEFAULT NULL,
  `one` varchar(50) DEFAULT NULL,
  `tow` varchar(50) DEFAULT NULL,
  `thr` varchar(50) DEFAULT NULL,
  `fur` varchar(50) DEFAULT NULL,
  `fin` varchar(50) DEFAULT NULL,
  `six` varchar(50) DEFAULT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `eit` varchar(50) DEFAULT NULL,
  `nie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stationfen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` varchar(50) DEFAULT NULL,
  `end` varchar(50) DEFAULT NULL,
  `busid` varchar(50) DEFAULT NULL,
  `busname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busname` varchar(50) DEFAULT NULL,
  `buskar` varchar(50) DEFAULT NULL,
  `buser` varchar(50) DEFAULT NULL,
  `buserwx` varchar(50) DEFAULT NULL,
  `busid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `waystation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `zhandian` varchar(50) DEFAULT '0',
  `nth` int(10) DEFAULT '0',
  `lineid` char(50) DEFAULT '0',
  `postion` varchar(50) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
