/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.24-MariaDB : Database - recog_face
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`recog_face` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `recog_face`;

/*Table structure for table `faces` */

DROP TABLE IF EXISTS `faces`;

CREATE TABLE `faces` (
  `ID` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `FaceImage` varchar(255) CHARACTER SET latin1 NOT NULL,
  `LeftEye` varchar(255) CHARACTER SET latin1 NOT NULL,
  `RightEye` varchar(255) CHARACTER SET latin1 NOT NULL,
  `EyesDistance` varchar(255) CHARACTER SET latin1 NOT NULL,
  `EarLeft` varchar(255) CHARACTER SET latin1 NOT NULL,
  `EarRight` varchar(255) CHARACTER SET latin1 NOT NULL,
  `EyersDstance` varchar(255) CHARACTER SET latin1 NOT NULL,
  `JawSize` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `faces` */

insert  into `faces`(`ID`,`FaceImage`,`LeftEye`,`RightEye`,`EyesDistance`,`EarLeft`,`EarRight`,`EyersDstance`,`JawSize`) values 
(10,'','{\"_x\":232.82339811325073,\"_y\":233.79212415218353}','{\"_x\":335.6514050960541,\"_y\":229.4657421708107}','2.723070145470171','{\"_x\":93.92547108232975,\"_y\":259.3007787466049}','{\"_x\":477.39777940511703,\"_y\":241.4794112443924}','10.157009281235865','6.603604340606813'),
(11,'1656274838155-1.jpg','{\"_x\":232.82339811325073,\"_y\":233.79212415218353}','{\"_x\":335.6514050960541,\"_y\":229.4657421708107}','2.723070145470171','{\"_x\":93.92547108232975,\"_y\":259.3007787466049}','{\"_x\":477.39777940511703,\"_y\":241.4794112443924}','10.157009281235865','6.603604340606813');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
