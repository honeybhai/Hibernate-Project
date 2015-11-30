/*
SQLyog Community v8.55 
MySQL - 5.5.13 : Database - fyp2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fyp2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fyp2`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `admin_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `fk_users3` (`username`),
  CONSTRAINT `fk_users3` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `authorities` */

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
  `authorities_id` bigint(20) NOT NULL,
  `authority` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`authorities_id`),
  KEY `fk_users5` (`username`),
  CONSTRAINT `fk_users5` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `buyer` */

DROP TABLE IF EXISTS `buyer`;

CREATE TABLE `buyer` (
  `buyer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_name` varchar(45) DEFAULT NULL,
  `buyer_email` varchar(45) DEFAULT NULL,
  `buyer_mobile` varchar(45) DEFAULT NULL,
  `buyer_address` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`buyer_id`),
  KEY `fk_users2` (`username`),
  CONSTRAINT `fk_users2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(45) DEFAULT NULL,
  `buyer_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_buyer4` (`buyer_id`),
  KEY `fk_item3` (`item_id`),
  CONSTRAINT `fk_buyer4` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item3` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(400) DEFAULT NULL,
  `image_name` varchar(200) DEFAULT NULL,
  `image_is_cover` tinyint(1) DEFAULT NULL,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `fk_item1` (`item_id`),
  CONSTRAINT `fk_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  `item_description` varchar(400) NOT NULL,
  `item_price` bigint(20) NOT NULL,
  `item_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_category2` (`category_id`),
  CONSTRAINT `fk_category2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `messages_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` varchar(45) DEFAULT NULL,
  `sender_role` bigint(20) DEFAULT NULL,
  `sender_user_id` bigint(20) NOT NULL,
  `receiver_user_id` bigint(20) NOT NULL,
  `dateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `receiver_role` bigint(20) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`messages_id`),
  KEY `fk_users4` (`username`),
  CONSTRAINT `fk_users4` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` bigint(20) NOT NULL,
  `buyer_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_buyer2` (`buyer_id`),
  KEY `fk_item6` (`item_id`),
  CONSTRAINT `fk_buyer2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item6` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `promotion` */

DROP TABLE IF EXISTS `promotion`;

CREATE TABLE `promotion` (
  `promotion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`promotion_id`),
  KEY `fk_item4` (`item_id`),
  CONSTRAINT `fk_item4` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `ratting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL,
  `rating` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ratting_id`),
  KEY `fk_item5` (`item_id`),
  CONSTRAINT `fk_item5` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `watchlist` */

DROP TABLE IF EXISTS `watchlist`;

CREATE TABLE `watchlist` (
  `watchlist_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`watchlist_id`),
  KEY `fk_buyer3` (`buyer_id`),
  KEY `fk_item2` (`item_id`),
  CONSTRAINT `fk_buyer3` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `watsapp` */

DROP TABLE IF EXISTS `watsapp`;

CREATE TABLE `watsapp` (
  `watsapp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` bigint(20) NOT NULL,
  `watsapp_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`watsapp_id`),
  KEY `fk_buyer1` (`buyer_id`),
  CONSTRAINT `fk_buyer1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
