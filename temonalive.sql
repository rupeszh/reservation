/*
SQLyog Ultimate v8.55 
MySQL - 5.5.16 : Database - con_jp0006
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`con_jp0006` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `con_jp0006`;

/*Table structure for table `oc_address` */

DROP TABLE IF EXISTS `oc_address`;

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `oc_address` */

/*Table structure for table `tbl_action` */

DROP TABLE IF EXISTS `tbl_action`;

CREATE TABLE `tbl_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agenda` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `action_type_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `importance_id` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `action_type_id` (`action_type_id`),
  KEY `business_id` (`business_id`),
  KEY `importance_id` (`importance_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_action_ibfk_1` FOREIGN KEY (`action_type_id`) REFERENCES `tbl_action_type` (`id`),
  CONSTRAINT `tbl_action_ibfk_2` FOREIGN KEY (`business_id`) REFERENCES `tbl_business` (`id`),
  CONSTRAINT `tbl_action_ibfk_3` FOREIGN KEY (`importance_id`) REFERENCES `tbl_importance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_action` */

insert  into `tbl_action`(`id`,`title`,`agenda`,`description`,`action_type_id`,`business_id`,`importance_id`,`create_date`,`from`,`to`,`user_id`,`created_at`) values (3,'a','a','a',1,1,1,'2014-08-11','05:00:00','04:00:00',6,'2014-08-11 17:03:19'),(4,'b','b','b',2,2,2,'2014-08-12','06:00:00','04:00:00',6,'2014-08-11 17:03:59'),(5,'c','c','c',1,1,2,'2014-08-11','04:00:00','10:00:00',6,'2014-08-11 17:10:20'),(6,'n','n','n',5,3,2,'2014-08-13','07:00:00','06:00:00',6,'2014-08-11 17:10:42');

/*Table structure for table `tbl_action_comment` */

DROP TABLE IF EXISTS `tbl_action_comment`;

CREATE TABLE `tbl_action_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `FK_tbl_action_comment` (`action_id`),
  CONSTRAINT `FK_tbl_action_comment` FOREIGN KEY (`action_id`) REFERENCES `tbl_action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_action_comment` */

insert  into `tbl_action_comment`(`id`,`action_id`,`comment`,`user_id`) values (1,5,'edited comment\n',1),(2,5,'asdf',1);

/*Table structure for table `tbl_action_list` */

DROP TABLE IF EXISTS `tbl_action_list`;

CREATE TABLE `tbl_action_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_action_list` */

insert  into `tbl_action_list`(`id`,`name`) values (1,'Unpaid'),(2,'Paid'),(3,'Mail'),(4,'Issue'),(5,'Advance Search'),(6,'Search'),(7,'Download'),(8,'Print'),(9,'Add'),(10,'Edit'),(11,'Edit Invoice'),(12,'Delete'),(13,'Jump to Url'),(14,'Search Action'),(15,'Shop'),(16,'Shop Invoice'),(17,'Merchant Invoice'),(18,'Compilation'),(19,'Menu Permission'),(20,'Listing'),(21,'Action'),(22,'Left Search'),(23,'Right Search'),(24,'Download Compilation'),(25,'Download Invoice Info'),(26,'Search By Prefecture'),(27,'Search By Payment'),(28,'Search By Contract Status'),(29,'Search By Payment');

/*Table structure for table `tbl_action_type` */

DROP TABLE IF EXISTS `tbl_action_type`;

CREATE TABLE `tbl_action_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_action_type` */

insert  into `tbl_action_type`(`id`,`name`) values (1,'Sales'),(2,'Inbound'),(3,'Outbound'),(4,'Seminar1'),(5,'Seminar2'),(6,'Seminar3'),(7,'Others');

/*Table structure for table `tbl_business` */

DROP TABLE IF EXISTS `tbl_business`;

CREATE TABLE `tbl_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_business` */

insert  into `tbl_business`(`id`,`name`) values (1,'Cart System'),(2,'Ad System'),(3,'Outbound System'),(4,'Starx System'),(5,'Other1'),(6,'Other2');

/*Table structure for table `tbl_check_login` */

DROP TABLE IF EXISTS `tbl_check_login`;

CREATE TABLE `tbl_check_login` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `col_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_check_login` */

insert  into `tbl_check_login`(`id`,`user_id`,`col_id`,`role_id`) values (90,7,1,1),(91,7,2,1),(92,7,3,1),(93,7,4,1),(94,7,5,1),(95,7,6,1),(96,7,7,1),(97,7,8,1),(98,7,9,1),(99,7,10,1),(100,7,11,1),(101,7,12,1),(102,7,13,1),(103,7,14,1),(104,7,15,1),(105,7,16,1),(106,7,18,1),(107,7,19,1),(108,7,20,1),(109,7,21,1),(110,7,22,1),(111,7,23,1),(112,7,24,1),(113,7,25,1),(114,7,26,1),(115,7,27,1),(116,7,28,1),(117,7,29,1),(118,7,30,1),(119,7,31,1),(120,7,32,1),(121,7,33,1),(122,7,34,1),(123,7,35,1),(124,7,36,1),(125,7,37,1),(126,7,38,1),(127,7,39,1),(128,7,40,1),(129,7,41,1),(130,7,42,1),(131,7,43,1),(132,7,44,1),(133,7,45,1),(134,7,46,1),(135,6,1,1),(136,6,2,1),(137,6,3,1),(138,6,4,1),(139,6,5,1),(140,6,6,1),(141,6,7,1),(142,6,8,1),(143,6,9,1),(144,6,10,1),(145,6,11,1),(146,6,12,1),(147,6,13,1),(148,6,14,1),(149,6,15,1),(150,6,16,1),(151,6,18,1),(152,6,19,1),(153,6,20,1),(154,6,21,1),(155,6,22,1),(156,6,23,1),(157,6,24,1),(158,6,25,1),(159,6,26,1),(160,6,27,1),(161,6,28,1),(162,6,29,1),(163,6,30,1),(164,6,31,1),(165,6,32,1),(166,6,33,1),(167,6,34,1),(168,6,35,1),(169,6,36,1),(170,6,37,1),(171,6,38,1),(172,6,39,1),(173,6,40,1),(174,6,41,1),(175,6,42,1),(176,6,43,1),(177,6,44,1),(178,6,45,1),(179,6,46,1),(180,4,1,1),(181,4,2,1),(182,4,3,1),(183,4,4,1),(184,4,5,1),(185,4,6,1),(186,4,7,1),(187,4,8,1),(188,4,9,1),(189,4,10,1),(190,4,11,1),(191,4,12,1),(192,4,13,1),(193,4,14,1),(194,4,15,1),(195,4,16,1),(196,4,18,1),(197,4,19,1),(198,4,20,1),(199,4,21,1),(200,4,22,1),(201,4,23,1),(202,4,24,1),(203,4,25,1),(204,4,26,1),(205,4,27,1),(206,4,28,1),(207,4,29,1),(208,4,30,1),(209,4,31,1),(210,4,32,1),(211,4,33,1),(212,4,34,1),(213,4,35,1),(214,4,36,1),(215,4,37,1),(216,4,38,1),(217,4,39,1),(218,4,40,1),(219,4,41,1),(220,4,42,1),(221,4,43,1),(222,4,44,1),(223,4,45,1),(224,4,46,1),(225,5,1,1),(226,5,2,1),(227,5,3,1),(228,5,4,1),(229,5,5,1),(230,5,6,1),(231,5,7,1),(232,5,8,1),(233,5,9,1),(234,5,10,1),(235,5,11,1),(236,5,12,1),(237,5,13,1),(238,5,14,1),(239,5,15,1),(240,5,16,1),(241,5,18,1),(242,5,19,1),(243,5,20,1),(244,5,21,1),(245,5,22,1),(246,5,23,1),(247,5,24,1),(248,5,25,1),(249,5,26,1),(250,5,27,1),(251,5,28,1),(252,5,29,1),(253,5,30,1),(254,5,31,1),(255,5,32,1),(256,5,33,1),(257,5,34,1),(258,5,35,1),(259,5,36,1),(260,5,37,1),(261,5,38,1),(262,5,39,1),(263,5,40,1),(264,5,41,1),(265,5,42,1),(266,5,43,1),(267,5,44,1),(268,5,45,1),(269,5,46,1),(270,1,1,1),(271,1,2,1),(272,1,3,1),(273,1,4,1),(274,1,5,1),(275,1,6,1),(276,1,7,1),(277,1,8,1),(278,1,9,1),(279,1,10,1),(280,1,11,1),(281,1,12,1),(282,1,13,1),(283,1,14,1),(284,1,15,1),(285,1,16,1),(286,1,18,1),(287,1,19,1),(288,1,20,1),(289,1,21,1),(290,1,22,1),(291,1,23,1),(292,1,24,1),(293,1,25,1),(294,1,26,1),(295,1,27,1),(296,1,28,1),(297,1,29,1),(298,1,30,1),(299,1,31,1),(300,1,32,1),(301,1,33,1),(302,1,34,1),(303,1,35,1),(304,1,36,1),(305,1,37,1),(306,1,38,1),(307,1,39,1),(308,1,40,1),(309,1,41,1),(310,1,42,1),(311,1,43,1),(312,1,44,1),(313,1,45,1),(314,1,46,1),(361,9,2,3),(362,9,3,3),(363,9,4,3),(364,9,5,3),(365,9,6,3),(366,9,7,3),(367,9,8,3),(368,9,9,3),(369,9,10,3),(370,9,11,3),(371,9,12,3),(372,9,13,3),(373,9,14,3),(374,9,15,3),(375,9,16,3),(376,9,18,3),(377,9,19,3),(378,9,20,3),(379,9,21,3),(380,9,22,3),(381,9,23,3),(382,9,24,3),(383,9,25,3),(384,9,26,3),(385,9,27,3),(386,9,28,3),(387,9,29,3),(388,9,30,3),(389,9,31,3),(390,9,32,3),(391,9,33,3),(392,9,34,3),(393,9,35,3),(394,9,36,3),(395,9,37,3),(396,9,38,3),(397,9,39,3),(398,9,40,3),(399,9,41,3),(400,9,42,3),(401,9,43,3),(402,9,44,3),(403,9,45,3),(404,9,46,3);

/*Table structure for table `tbl_column` */

DROP TABLE IF EXISTS `tbl_column`;

CREATE TABLE `tbl_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_column` */

insert  into `tbl_column`(`id`,`name`) values (1,'Region'),(2,'Prefecture'),(3,'Group'),(4,'Plan'),(5,'Payment'),(6,'Company'),(7,'Name'),(8,'Address'),(9,'Email'),(10,'Contract Date'),(11,'Zip'),(12,'Building'),(13,'Telephone'),(14,'Fax'),(15,'Domail Url'),(16,'IP Url'),(18,'Memo'),(19,'Cart System'),(20,'Ad System'),(21,'Outbound System'),(22,'Other System1'),(23,'Other System2'),(24,'Shop Type'),(25,'Related Shops'),(26,'Email2'),(27,'Email3'),(28,'Name2'),(29,'Name3'),(30,'Other 1'),(31,'Other 2'),(32,'Other 3'),(33,'Other 4'),(34,'Other 5'),(35,'Other 6'),(36,'Other 7'),(37,'Other 8'),(38,'Other 9'),(39,'Other 10'),(40,'Other 11'),(41,'Other 12'),(42,'Other 13'),(43,'Other 14'),(44,'Other 15'),(45,'Other 16'),(46,'Payment Option');

/*Table structure for table `tbl_compilation` */

DROP TABLE IF EXISTS `tbl_compilation`;

CREATE TABLE `tbl_compilation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `compilation_column_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `compilation_column_id` (`compilation_column_id`),
  CONSTRAINT `tbl_compilation_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `tbl_compilation_ibfk_2` FOREIGN KEY (`compilation_column_id`) REFERENCES `tbl_compilation_column` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_compilation` */

/*Table structure for table `tbl_compilation_column` */

DROP TABLE IF EXISTS `tbl_compilation_column`;

CREATE TABLE `tbl_compilation_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_compilation_column` */

/*Table structure for table `tbl_hide_info` */

DROP TABLE IF EXISTS `tbl_hide_info`;

CREATE TABLE `tbl_hide_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_hide_info` */

insert  into `tbl_hide_info`(`id`,`role_id`,`column_id`) values (1,3,1);

/*Table structure for table `tbl_importance` */

DROP TABLE IF EXISTS `tbl_importance`;

CREATE TABLE `tbl_importance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_importance` */

insert  into `tbl_importance`(`id`,`name`) values (1,'Warning'),(2,'High'),(3,'Normal'),(4,'Low');

/*Table structure for table `tbl_incharge_rating` */

DROP TABLE IF EXISTS `tbl_incharge_rating`;

CREATE TABLE `tbl_incharge_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_incharge_rating` */

insert  into `tbl_incharge_rating`(`id`,`rating`) values (1,'Good'),(2,'Average'),(3,'Bad');

/*Table structure for table `tbl_income` */

DROP TABLE IF EXISTS `tbl_income`;

CREATE TABLE `tbl_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `from_year` smallint(6) NOT NULL,
  `from_month_id` tinyint(4) NOT NULL,
  `to_year` smallint(6) DEFAULT NULL,
  `to_month_id` tinyint(4) DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL,
  `received_by` int(11) NOT NULL,
  `received_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sinvoice_id` int(11) DEFAULT NULL,
  `minvoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `from_month_id` (`from_month_id`),
  KEY `to_month_id` (`to_month_id`),
  KEY `received_by` (`received_by`),
  CONSTRAINT `tbl_income_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `tbl_income_ibfk_4` FOREIGN KEY (`received_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_income` */

/*Table structure for table `tbl_income_statement` */

DROP TABLE IF EXISTS `tbl_income_statement`;

CREATE TABLE `tbl_income_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income_id` int(11) NOT NULL,
  `month_id` tinyint(4) NOT NULL,
  `year` smallint(6) NOT NULL,
  `total_cash_income` decimal(20,5) DEFAULT NULL,
  `cash_income_month` decimal(20,5) DEFAULT NULL,
  `total_accrual_income` decimal(20,5) DEFAULT NULL,
  `accrual_income_month` decimal(20,5) DEFAULT NULL,
  `prepaid_income` decimal(20,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `income_id` (`income_id`),
  KEY `month_id` (`month_id`),
  CONSTRAINT `tbl_income_statement_ibfk_1` FOREIGN KEY (`income_id`) REFERENCES `tbl_income` (`id`),
  CONSTRAINT `tbl_income_statement_ibfk_2` FOREIGN KEY (`month_id`) REFERENCES `tbl_month` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_income_statement` */

/*Table structure for table `tbl_invoice` */

DROP TABLE IF EXISTS `tbl_invoice`;

CREATE TABLE `tbl_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `month` tinyint(4) NOT NULL,
  `small_note` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `big_note` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `regular_big_note` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(20,5) NOT NULL,
  `sales_tax` decimal(20,5) NOT NULL,
  `total` decimal(20,5) NOT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `prepared_date` datetime NOT NULL,
  `is_paid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `prepared_by` (`prepared_by`),
  CONSTRAINT `tbl_invoice_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `tbl_invoice_ibfk_2` FOREIGN KEY (`prepared_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_invoice` */

insert  into `tbl_invoice`(`id`,`shop_id`,`year`,`month`,`small_note`,`big_note`,`regular_big_note`,`date`,`due_date`,`subtotal`,`sales_tax`,`total`,`prepared_by`,`prepared_date`,`is_paid`) values (142,156,2014,7,'','','','2014-06-01','2014-06-30','25.00000','2.00000','27.00000',6,'2014-07-22 17:56:34',0),(143,156,2015,7,'','','','2014-07-01','2014-07-31','25.00000','2.00000','27.00000',6,'2014-07-22 14:42:12',0),(144,156,2014,8,'','','','2014-07-01','2014-07-31','25.00000','2.00000','27.00000',6,'2014-07-22 14:42:12',0),(145,156,2014,12,'','','','2014-11-01','2014-11-30','25.00000','2.00000','27.00000',6,'2014-07-22 18:00:28',0),(146,156,2015,12,'','','','2014-12-01','2014-12-31','9.00000','0.72000','9.72000',6,'2014-07-22 14:46:14',0),(147,156,2015,1,'','','','2014-12-01','2014-12-31','25.00000','2.00000','27.00000',6,'2014-07-22 14:46:14',0);

/*Table structure for table `tbl_invoice_item` */

DROP TABLE IF EXISTS `tbl_invoice_item`;

CREATE TABLE `tbl_invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(20,5) NOT NULL,
  `qty` decimal(12,5) NOT NULL,
  `total` decimal(20,5) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `accrual_from_year` int(11) DEFAULT NULL,
  `accrual_from_month` int(11) DEFAULT NULL,
  `accrual_to_year` int(11) DEFAULT NULL,
  `accrual_to_month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `item_type_id` (`item_type_id`),
  CONSTRAINT `tbl_invoice_item_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `tbl_invoice` (`id`),
  CONSTRAINT `tbl_invoice_item_ibfk_2` FOREIGN KEY (`item_type_id`) REFERENCES `tbl_item_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_invoice_item` */

insert  into `tbl_invoice_item`(`id`,`invoice_id`,`item_name`,`price`,`qty`,`total`,`item_type_id`,`accrual_from_year`,`accrual_from_month`,`accrual_to_year`,`accrual_to_month`) values (145,142,'c','3.00000','3.00000','9.00000',1,2014,11,2015,10),(146,142,'d','4.00000','4.00000','16.00000',2,2014,10,2014,10),(147,143,'c','3.00000','3.00000','9.00000',1,2015,11,2016,10),(148,144,'d','4.00000','4.00000','16.00000',2,2014,10,2014,10),(149,145,'c2','3.00000','3.00000','9.00000',1,2014,4,2015,3),(150,145,'d2','4.00000','4.00000','16.00000',2,2014,3,2014,3),(152,147,'d2','4.00000','4.00000','16.00000',2,2014,3,2014,3),(154,146,'c2','3.00000','3.00000','9.00000',1,2014,3,NULL,NULL);

/*Table structure for table `tbl_item_type` */

DROP TABLE IF EXISTS `tbl_item_type`;

CREATE TABLE `tbl_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_item_type` */

insert  into `tbl_item_type`(`id`,`name`) values (1,'毎年'),(2,'毎月'),(3,'1回限り');

/*Table structure for table `tbl_login_cart` */

DROP TABLE IF EXISTS `tbl_login_cart`;

CREATE TABLE `tbl_login_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `login_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_login_cart` */

insert  into `tbl_login_cart`(`id`,`role_id`,`login_code`,`login_password`) values (1,7,'1223311','d41d8cd98f00b204e9800998ecf8427e'),(2,6,'suoper','adbc91a43e988a3b5b745b8529a90b61'),(3,8,'saasd','d41d8cd98f00b204e9800998ecf8427e'),(4,9,'abcdefgh','e8dc4081b13434b45189a720b77b6818'),(5,10,'111','698d51a19d8a121ce581499d7b701668'),(7,1,'rupesh','rupesh'),(8,1,'rupesh','111111'),(9,3,'123',NULL);

/*Table structure for table `tbl_login_details` */

DROP TABLE IF EXISTS `tbl_login_details`;

CREATE TABLE `tbl_login_details` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_login_details` */

insert  into `tbl_login_details`(`id`,`user_id`,`ip_address`,`time`,`status`) values (31,0,'::1','2014-07-01 10:11:42',0),(32,0,'::1','2014-07-02 17:38:29',0),(33,0,'::1','2014-07-03 13:55:18',0),(37,0,'::1','2015-02-20 11:14:13',0),(39,5,'::1','2015-02-24 11:09:29',0);

/*Table structure for table `tbl_login_log` */

DROP TABLE IF EXISTS `tbl_login_log`;

CREATE TABLE `tbl_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_login_log` */

insert  into `tbl_login_log`(`id`,`username`,`ip_address`,`date_time`,`status`) values (319,'rupesh','::1','2014-12-01 11:38:25',1),(320,'prakash','::1','2014-12-25 12:51:58',1),(321,'rupesh','127.0.0.1','2014-12-25 12:54:42',1),(322,'rupesh','::1','2014-12-26 13:37:53',1),(323,'prakash','::1','2014-12-26 13:45:27',1),(324,'rupesh','::1','2015-01-07 12:51:04',1),(325,'rupesh','::1','2015-01-07 13:28:45',1),(326,'rupesh','::1','2015-01-14 12:55:48',1),(327,'rupesh','::1','2015-01-15 15:11:04',1),(328,'rupesh','::1','2015-02-03 17:10:26',1),(329,'rupesh','::1','2015-02-20 11:14:00',0),(330,'admin','::1','2015-02-20 11:14:05',0),(331,'rupesh','::1','2015-02-20 11:14:09',0),(332,'rupeszh','::1','2015-02-20 11:14:13',0),(333,'admin','::1','2015-02-20 11:14:17',1),(334,'rupesh','::1','2015-02-24 11:09:24',0),(335,'jay','::1','2015-02-24 11:09:30',0),(336,'admin','::1','2015-02-24 11:42:31',1),(337,'admin','::1','2015-02-24 16:58:17',0),(338,'admin','::1','2015-02-24 17:05:06',1),(339,'rupesh','::1','2015-03-04 12:38:44',1);

/*Table structure for table `tbl_mail` */

DROP TABLE IF EXISTS `tbl_mail`;

CREATE TABLE `tbl_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `send_by` int(11) NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `send_by` (`send_by`),
  CONSTRAINT `tbl_mail_ibfk_1` FOREIGN KEY (`send_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_mail` */

/*Table structure for table `tbl_mail_shop` */

DROP TABLE IF EXISTS `tbl_mail_shop`;

CREATE TABLE `tbl_mail_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `mail_id` int(11) NOT NULL,
  `send_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `mail_id` (`mail_id`),
  CONSTRAINT `tbl_mail_shop_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `tbl_mail_shop_ibfk_2` FOREIGN KEY (`mail_id`) REFERENCES `tbl_mail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_mail_shop` */

/*Table structure for table `tbl_menu` */

DROP TABLE IF EXISTS `tbl_menu`;

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_menu` */

insert  into `tbl_menu`(`id`,`parent_id`,`name`,`url`) values (1,'0','Dashboard','dashboard'),(2,'0','Import','import'),(3,'0','Manage Income','#'),(4,'3','Receive Payment','income'),(5,'3','Sales Display','income/show'),(6,'0','Configuration','configuration'),(7,'0','Person In Charge','incharge'),(11,'0','Template','mailtemplate'),(12,'0','Memo','memo');

/*Table structure for table `tbl_menu_permission` */

DROP TABLE IF EXISTS `tbl_menu_permission`;

CREATE TABLE `tbl_menu_permission` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_menu_permission` */

insert  into `tbl_menu_permission`(`id`,`menu_id`,`action_id`) values (24,5,7),(25,5,19),(26,4,19),(47,6,10),(48,6,19),(81,2,15),(82,2,16),(83,2,17),(84,2,18),(85,2,19),(86,2,21),(97,7,6),(98,7,9),(99,7,10),(100,7,12),(101,7,19),(102,7,20),(141,1,1),(142,1,2),(143,1,3),(144,1,4),(145,1,6),(146,1,7),(147,1,8),(148,1,9),(149,1,10),(150,1,11),(151,1,12),(152,1,13),(153,1,14),(154,1,19),(155,1,20),(156,1,22),(157,1,23),(158,1,24),(159,1,25),(161,3,19),(162,13,19),(163,12,9),(164,12,10),(165,12,12),(166,12,19),(167,11,9),(168,11,10),(169,11,12),(170,11,19);

/*Table structure for table `tbl_merchant` */

DROP TABLE IF EXISTS `tbl_merchant`;

CREATE TABLE `tbl_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stamp1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stamp2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stamp3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sales_tax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_merchant` */

insert  into `tbl_merchant`(`id`,`name`,`bank_name`,`logo`,`address`,`stamp1`,`stamp2`,`stamp3`,`sales_tax`) values (1,'Temona','Mitsubi shi UFJ Bank\\r\\nKiba Fukagawa Branch\\r\\nTEMONA. Inc','logo_color_1.jpg','test','mitumori_logo_1_0.png','thumb_200_01_61.jpg','thumb_200_01_6.jpg','temona sales_tax'),(2,'Starx','Test','mitumori_logo_1_07.png','test address ','logo_color_17.jpg',NULL,NULL,'8%');

/*Table structure for table `tbl_merchant_invoice` */

DROP TABLE IF EXISTS `tbl_merchant_invoice`;

CREATE TABLE `tbl_merchant_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `small_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `big_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regular_big_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(20,5) DEFAULT NULL,
  `sales_tax` decimal(20,5) DEFAULT NULL,
  `total` decimal(20,5) DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `prepared_date` date DEFAULT NULL,
  `is_paid` smallint(6) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_merchant_invoice` */

insert  into `tbl_merchant_invoice`(`id`,`shop_id`,`year`,`month`,`small_note`,`big_note`,`regular_big_note`,`date`,`due_date`,`subtotal`,`sales_tax`,`total`,`prepared_by`,`prepared_date`,`is_paid`) values (142,156,2014,7,'','','','2014-06-01','2014-06-30','5.00000','0.40000','5.40000',6,'2014-07-22',0),(143,156,2015,7,'','','','2014-07-01','2014-07-31','5.00000','0.40000','5.40000',6,'2014-07-22',0),(144,156,2014,8,'','','','2014-07-01','2014-07-31','5.00000','0.40000','5.40000',6,'2014-07-22',0),(145,156,2014,12,'','','','2014-11-01','2014-11-30','14.04000','1.04000','14.04000',6,'2014-07-22',0),(146,156,2015,12,'','','','2014-12-01','2014-12-31','103.00000','8.24000','111.24000',6,'2014-07-22',0),(147,156,2015,1,'','','','2014-12-01','2014-12-31','13.00000','1.04000','14.04000',6,'2014-07-22',0);

/*Table structure for table `tbl_merchant_invoice_item` */

DROP TABLE IF EXISTS `tbl_merchant_invoice_item`;

CREATE TABLE `tbl_merchant_invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(20,5) DEFAULT NULL,
  `qty` decimal(20,5) DEFAULT NULL,
  `total` decimal(20,5) DEFAULT NULL,
  `item_type_id` int(11) DEFAULT NULL,
  `accrual_from_year` int(11) DEFAULT NULL,
  `accrual_from_month` int(11) DEFAULT NULL,
  `accrual_to_year` int(11) DEFAULT NULL,
  `accrual_to_month` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_merchant_invoice_item` */

insert  into `tbl_merchant_invoice_item`(`id`,`invoice_id`,`item_name`,`price`,`qty`,`total`,`item_type_id`,`accrual_from_year`,`accrual_from_month`,`accrual_to_year`,`accrual_to_month`) values (94,142,'a','1.00000','1.00000','1.00000',1,2014,11,2015,10),(95,142,'b','2.00000','2.00000','4.00000',2,2014,10,2014,10),(96,143,'a','1.00000','1.00000','1.00000',1,2015,11,2016,10),(97,144,'b','2.00000','2.00000','4.00000',2,2014,10,2014,10),(98,145,'a2','2.00000','2.00000','4.00000',1,2014,4,2015,3),(99,145,'b2','3.00000','3.00000','9.00000',2,2014,3,2014,3),(101,147,'b2','3.00000','3.00000','9.00000',2,2014,3,2014,3),(104,146,'a2','2.00000','2.00000','4.00000',1,NULL,NULL,NULL,NULL),(105,146,'a3','3.00000','33.00000','99.00000',2,2015,3,2015,3);

/*Table structure for table `tbl_monitor_alive` */

DROP TABLE IF EXISTS `tbl_monitor_alive`;

CREATE TABLE `tbl_monitor_alive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `status_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_monitor_alive` */

insert  into `tbl_monitor_alive`(`id`,`shop_id`,`status_code`,`time`) values (164,1,'0','2014-05-09 07:30:25'),(165,77,'200','2014-05-09 07:30:26'),(166,80,'0','2014-05-09 07:30:26'),(167,81,'0','2014-05-09 07:30:26'),(168,82,'0','2014-05-09 07:30:26'),(169,83,'0','2014-05-09 07:30:26'),(170,84,'0','2014-05-09 07:30:26'),(171,85,'0','2014-05-09 07:30:26'),(172,86,'0','2014-05-09 07:30:26'),(173,87,'0','2014-05-09 07:30:26'),(174,88,'0','2014-05-09 07:30:26'),(175,89,'0','2014-05-09 07:30:26'),(176,91,'0','2014-05-09 07:30:26'),(177,92,'0','2014-05-09 07:30:26'),(178,1,'0','2014-05-09 07:32:52'),(179,77,'200','2014-05-09 07:32:53'),(180,80,'0','2014-05-09 07:32:53'),(181,81,'0','2014-05-09 07:32:54'),(182,82,'0','2014-05-09 07:32:54'),(183,83,'0','2014-05-09 07:32:55'),(184,84,'0','2014-05-09 07:32:55'),(185,85,'0','2014-05-09 07:32:55'),(186,86,'0','2014-05-09 07:32:55'),(187,87,'0','2014-05-09 07:32:55'),(188,88,'0','2014-05-09 07:32:56'),(189,89,'0','2014-05-09 07:32:56'),(190,91,'0','2014-05-09 07:32:56'),(191,92,'0','2014-05-09 07:32:56');

/*Table structure for table `tbl_month` */

DROP TABLE IF EXISTS `tbl_month`;

CREATE TABLE `tbl_month` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `index` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_month` */

insert  into `tbl_month`(`id`,`name`,`index`) values (1,'October',10),(2,'November',11),(3,'December',12),(4,'January',1),(5,'February',2),(6,'March',3),(7,'April',4),(8,'May',5),(9,'June',6),(10,'July',7),(11,'August',8),(12,'September',9);

/*Table structure for table `tbl_payment_option` */

DROP TABLE IF EXISTS `tbl_payment_option`;

CREATE TABLE `tbl_payment_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_payment_option` */

insert  into `tbl_payment_option`(`id`,`name`) values (1,'毎月'),(2,'毎年');

/*Table structure for table `tbl_payment_type` */

DROP TABLE IF EXISTS `tbl_payment_type`;

CREATE TABLE `tbl_payment_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_payment_type` */

insert  into `tbl_payment_type`(`id`,`name`) values (1,'Initial Payment'),(2,'Monthly Payment'),(3,'Yearly Payment');

/*Table structure for table `tbl_person_incharge` */

DROP TABLE IF EXISTS `tbl_person_incharge`;

CREATE TABLE `tbl_person_incharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `authority` int(11) DEFAULT NULL,
  `needs` int(11) DEFAULT NULL,
  `time_frame` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_person_incharge` */

insert  into `tbl_person_incharge`(`id`,`shop_id`,`first_name`,`last_name`,`email`,`memo`,`budget`,`authority`,`needs`,`time_frame`) values (162,153,'first name様','family name','temail@email.com',NULL,NULL,NULL,NULL,NULL),(163,154,'test様','test','',NULL,NULL,NULL,NULL,NULL),(164,155,'abc様','abc','a@a.com',NULL,NULL,NULL,NULL,NULL),(165,156,'pra様','kash','a@a.com',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tbl_plan` */

DROP TABLE IF EXISTS `tbl_plan`;

CREATE TABLE `tbl_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_plan` */

insert  into `tbl_plan`(`id`,`name`) values (1,'ASP'),(2,'GOLD'),(3,'PREMIUM');

/*Table structure for table `tbl_prefecture` */

DROP TABLE IF EXISTS `tbl_prefecture`;

CREATE TABLE `tbl_prefecture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_prefecture` */

insert  into `tbl_prefecture`(`id`,`name`) values (1,'北海道'),(2,'青森県'),(3,'岩手県'),(4,'宮城県'),(5,'秋田県'),(6,'山形県'),(7,'福島県'),(8,'茨城県'),(9,'栃木県'),(10,'群馬県'),(11,'埼玉県'),(12,'千葉県'),(13,'東京都'),(14,'神奈川県'),(15,'新潟県'),(16,'富山県'),(17,'石川県'),(18,'福井県'),(19,'山梨県'),(20,'長野県'),(21,'岐阜県'),(22,'静岡県'),(23,'愛知県'),(24,'三重県'),(25,'滋賀県'),(26,'京都府'),(27,'大阪府'),(28,'兵庫県'),(29,'奈良県'),(30,'和歌山県'),(31,'鳥取県'),(32,'島根県'),(33,'岡山県'),(34,'広島県'),(35,'山口県'),(36,'徳島県'),(37,'香川県'),(38,'愛媛県'),(39,'高知県'),(40,'福岡県'),(41,'佐賀県'),(42,'長崎県'),(43,'熊本県'),(44,'大分県'),(45,'宮崎県'),(46,'鹿児島県'),(47,'沖縄県');

/*Table structure for table `tbl_region` */

DROP TABLE IF EXISTS `tbl_region`;

CREATE TABLE `tbl_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_region` */

insert  into `tbl_region`(`id`,`name`) values (1,'北海道'),(2,'東北'),(3,'関東'),(4,'信越'),(5,'北陸'),(6,'東海'),(7,'近畿'),(8,'中国'),(9,'四国'),(10,'九州'),(11,'沖縄'),(12,'関西');

/*Table structure for table `tbl_role` */

DROP TABLE IF EXISTS `tbl_role`;

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_role` */

insert  into `tbl_role`(`id`,`name`) values (1,'Admin'),(2,'User'),(3,'Invoice'),(4,'Sales');

/*Table structure for table `tbl_role_permission` */

DROP TABLE IF EXISTS `tbl_role_permission`;

CREATE TABLE `tbl_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1633 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_role_permission` */

insert  into `tbl_role_permission`(`id`,`menu_id`,`action_id`,`role_id`) values (34,1,1,3),(35,1,2,3),(36,1,3,3),(37,1,4,3),(38,1,6,3),(39,1,7,3),(40,1,10,3),(41,1,11,3),(42,1,12,3),(43,1,19,3),(44,1,20,3),(45,1,23,3),(46,1,24,3),(47,1,25,3),(48,2,15,3),(49,2,16,3),(50,2,17,3),(51,2,18,3),(52,2,19,3),(53,2,21,3),(54,6,10,3),(55,6,19,3),(56,7,6,3),(57,7,9,3),(58,7,10,3),(59,7,12,3),(60,7,19,3),(61,7,20,3),(186,1,3,4),(187,1,6,4),(188,1,7,4),(189,1,8,4),(190,1,13,4),(191,1,14,4),(192,1,19,4),(193,1,20,4),(194,1,22,4),(195,1,24,4),(196,1,25,4),(197,2,15,4),(198,2,16,4),(199,2,17,4),(200,2,18,4),(201,2,19,4),(202,2,21,4),(203,4,19,4),(204,5,7,4),(205,5,19,4),(206,6,10,4),(207,6,19,4),(208,7,6,4),(209,7,9,4),(210,7,10,4),(211,7,12,4),(212,7,19,4),(213,7,20,4),(356,1,19,2),(357,1,20,2),(358,2,15,2),(359,2,16,2),(360,2,17,2),(361,2,18,2),(362,2,19,2),(363,6,10,2),(364,6,19,2),(365,7,6,2),(366,7,9,2),(367,7,10,2),(368,7,12,2),(369,7,19,2),(370,7,20,2),(1590,1,1,1),(1591,1,2,1),(1592,1,3,1),(1593,1,4,1),(1594,1,6,1),(1595,1,7,1),(1596,1,8,1),(1597,1,9,1),(1598,1,10,1),(1599,1,11,1),(1600,1,12,1),(1601,1,13,1),(1602,1,14,1),(1603,1,19,1),(1604,1,20,1),(1605,1,22,1),(1606,1,23,1),(1607,1,24,1),(1608,1,25,1),(1609,2,15,1),(1610,2,16,1),(1611,2,17,1),(1612,2,18,1),(1613,2,19,1),(1614,2,21,1),(1615,4,19,1),(1616,5,19,1),(1617,6,10,1),(1618,6,19,1),(1619,7,6,1),(1620,7,9,1),(1621,7,10,1),(1622,7,12,1),(1623,7,19,1),(1624,7,20,1),(1625,11,9,1),(1626,11,10,1),(1627,11,12,1),(1628,11,19,1),(1629,12,9,1),(1630,12,10,1),(1631,12,12,1),(1632,12,19,1);

/*Table structure for table `tbl_sales_info` */

DROP TABLE IF EXISTS `tbl_sales_info`;

CREATE TABLE `tbl_sales_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `amount` decimal(20,5) NOT NULL,
  `received_date` datetime NOT NULL,
  `from_year` smallint(6) NOT NULL,
  `from_month` tinyint(4) NOT NULL,
  `to_year` smallint(6) DEFAULT NULL,
  `to_month` tinyint(4) DEFAULT NULL,
  `payment_type_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `payment_type_id` (`payment_type_id`),
  CONSTRAINT `tbl_sales_info_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `tbl_sales_info_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `tbl_payment_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_sales_info` */

/*Table structure for table `tbl_sessions` */

DROP TABLE IF EXISTS `tbl_sessions`;

CREATE TABLE `tbl_sessions` (
  `session_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_activity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_data` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_sessions` */

/*Table structure for table `tbl_shop` */

DROP TABLE IF EXISTS `tbl_shop`;

CREATE TABLE `tbl_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `contract_date` date NOT NULL,
  `cancellation_date` date DEFAULT NULL,
  `contract_status` tinyint(4) DEFAULT NULL,
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo_at_once` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `prefecture_id` int(11) DEFAULT NULL,
  `payment_option_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_paid` smallint(6) DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL,
  `cron_flag` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cart_system` smallint(2) DEFAULT '1',
  `ad_system` smallint(2) DEFAULT '0',
  `outbound_system` smallint(2) DEFAULT '0',
  `other_system1` smallint(2) DEFAULT '0',
  `other_system2` smallint(2) DEFAULT '0',
  `shop_type_id` int(11) DEFAULT NULL,
  `email2` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `email3` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `name2` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `name3` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other1` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other2` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other3` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other4` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other5` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other6` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other7` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other8` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other9` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other10` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other11` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other12` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other13` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other14` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other15` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `other16` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `plan_id` (`plan_id`),
  KEY `region_id` (`region_id`),
  KEY `prefecture_id` (`prefecture_id`),
  KEY `payment_option_id` (`payment_option_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `shop_type_id` (`shop_type_id`),
  CONSTRAINT `tbl_shop_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `tbl_merchant` (`id`),
  CONSTRAINT `tbl_shop_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `tbl_plan` (`id`),
  CONSTRAINT `tbl_shop_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region` (`id`),
  CONSTRAINT `tbl_shop_ibfk_4` FOREIGN KEY (`prefecture_id`) REFERENCES `tbl_prefecture` (`id`),
  CONSTRAINT `tbl_shop_ibfk_5` FOREIGN KEY (`payment_option_id`) REFERENCES `tbl_payment_option` (`id`),
  CONSTRAINT `tbl_shop_ibfk_7` FOREIGN KEY (`modified_by`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_shop_ibfk_8` FOREIGN KEY (`shop_type_id`) REFERENCES `tbl_shop_type` (`id`),
  CONSTRAINT `tbl_shop_ibfk_9` FOREIGN KEY (`created_by`) REFERENCES `tbl_user` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_shop` */

insert  into `tbl_shop`(`id`,`company`,`merchant_id`,`email`,`telephone`,`fax`,`url`,`ip`,`zip`,`address`,`building`,`family_name`,`first_name`,`plan_id`,`contract_date`,`cancellation_date`,`contract_status`,`memo`,`memo_at_once`,`region_id`,`prefecture_id`,`payment_option_id`,`created_by`,`created_date`,`modified_by`,`modified_date`,`group`,`is_paid`,`issue_date`,`cron_flag`,`cart_system`,`ad_system`,`outbound_system`,`other_system1`,`other_system2`,`shop_type_id`,`email2`,`email3`,`name2`,`name3`,`other1`,`other2`,`other3`,`other4`,`other5`,`other6`,`other7`,`other8`,`other9`,`other10`,`other11`,`other12`,`other13`,`other14`,`other15`,`other16`) values (153,'new',2,'temail@email.com','te;l','fax','domain','ip','〒zip','address','building','family name','first name様',2,'2014-07-24',NULL,NULL,'memo',NULL,2,2,2,6,'0000-00-00 00:00:00',6,'2014-07-17 10:55:27','gr',0,NULL,'',1,0,0,0,0,NULL,'','','','','','','','','','','','','','','','','','','',''),(154,'test',1,'','','','','','〒tset','tst','','test','test様',1,'2010-12-01',NULL,NULL,'',NULL,1,10,1,4,'0000-00-00 00:00:00',4,'2014-07-17 16:56:01','',0,NULL,'',1,0,0,0,0,NULL,'','','','','','','','','','','','','','','','','','','',''),(155,'abc',2,'a@a.com','','','','','〒','','','abc','abc様',1,'0000-00-00',NULL,NULL,'',NULL,2,3,2,6,'0000-00-00 00:00:00',4,'2014-07-21 09:59:51','',0,NULL,'',1,0,0,0,0,NULL,'','','','','','','','','','','','','','','','','','','',''),(156,'co',2,'a@a.com','','','','','','','','kash','pra様',3,'0000-00-00',NULL,NULL,'',NULL,4,3,2,6,'0000-00-00 00:00:00',6,'2014-07-22 11:40:55','',0,NULL,'',1,0,0,0,0,4,'','','','','','','','','','','','','','','','','','','','');

/*Table structure for table `tbl_shop_relation` */

DROP TABLE IF EXISTS `tbl_shop_relation`;

CREATE TABLE `tbl_shop_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `related_shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `related_shop_id` (`related_shop_id`),
  CONSTRAINT `tbl_shop_relation_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `tbl_shop_relation_ibfk_2` FOREIGN KEY (`related_shop_id`) REFERENCES `tbl_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_shop_relation` */

/*Table structure for table `tbl_shop_type` */

DROP TABLE IF EXISTS `tbl_shop_type`;

CREATE TABLE `tbl_shop_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_shop_type` */

insert  into `tbl_shop_type`(`id`,`name`) values (1,'Service Shop'),(2,'Invoice Shop'),(3,'Partner Shop'),(4,'Others');

/*Table structure for table `tbl_tagged_person_incharge` */

DROP TABLE IF EXISTS `tbl_tagged_person_incharge`;

CREATE TABLE `tbl_tagged_person_incharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `person_incharge_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`),
  KEY `person_incharge_id` (`person_incharge_id`),
  CONSTRAINT `tbl_tagged_person_incharge_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `tbl_action` (`id`),
  CONSTRAINT `tbl_tagged_person_incharge_ibfk_2` FOREIGN KEY (`person_incharge_id`) REFERENCES `tbl_person_incharge` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_tagged_person_incharge` */

insert  into `tbl_tagged_person_incharge`(`id`,`action_id`,`person_incharge_id`) values (3,3,164),(4,4,162),(5,5,163),(6,6,164);

/*Table structure for table `tbl_tagged_shop` */

DROP TABLE IF EXISTS `tbl_tagged_shop`;

CREATE TABLE `tbl_tagged_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `tbl_tagged_shop_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `tbl_action` (`id`),
  CONSTRAINT `tbl_tagged_shop_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_tagged_shop` */

insert  into `tbl_tagged_shop`(`id`,`action_id`,`shop_id`) values (3,3,154),(4,4,154),(5,5,156),(6,6,156);

/*Table structure for table `tbl_temp` */

DROP TABLE IF EXISTS `tbl_temp`;

CREATE TABLE `tbl_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_temp` */

/*Table structure for table `tbl_temp_action` */

DROP TABLE IF EXISTS `tbl_temp_action`;

CREATE TABLE `tbl_temp_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop(tag)',
  `person_in_charge` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'other party company personnel',
  `date_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'action implementation date',
  `bussiness_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `employee_in_charge` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `new_or_old` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type_of_action` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `free_space` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `importance` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agenda` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `action_type_id` (`bussiness_name`),
  KEY `business_id` (`employee_in_charge`),
  KEY `importance_id` (`purpose`),
  KEY `user_id` (`type_of_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_temp_action` */

/*Table structure for table `tbl_temp_compilation` */

DROP TABLE IF EXISTS `tbl_temp_compilation`;

CREATE TABLE `tbl_temp_compilation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `field_value` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_temp_compilation` */

/*Table structure for table `tbl_temp_invoice` */

DROP TABLE IF EXISTS `tbl_temp_invoice`;

CREATE TABLE `tbl_temp_invoice` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `shop_id` int(250) NOT NULL,
  `year` int(250) DEFAULT NULL,
  `month` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(200) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pay_term` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_temp_invoice` */

/*Table structure for table `tbl_temp_merchant` */

DROP TABLE IF EXISTS `tbl_temp_merchant`;

CREATE TABLE `tbl_temp_merchant` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `shop_id` int(250) NOT NULL,
  `year` int(250) DEFAULT NULL,
  `month` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(200) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pay_term` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_temp_merchant` */

/*Table structure for table `tbl_temp_shop` */

DROP TABLE IF EXISTS `tbl_temp_shop`;

CREATE TABLE `tbl_temp_shop` (
  `company_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(100) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `merchant_info` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `building` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `family_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `plan` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `contract_date` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cancellation_date` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `memo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `prefecture` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pay_term` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_temp_shop` */

/*Table structure for table `tbl_template_mail` */

DROP TABLE IF EXISTS `tbl_template_mail`;

CREATE TABLE `tbl_template_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_template_mail` */

insert  into `tbl_template_mail`(`id`,`name`,`title`,`subject`,`message`,`type`) values (2,'test212','11','11','<p><strong>This is test</strong></p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong><strong>This is test</strong></p>',1),(3,'sdfsdf','camel','11111111111111','<p><strong>dsfsadf</strong></p>',1),(4,'sdfsdf','camel','11111111111111','<p><strong>dsfsadf&nbsp;</strong></p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sadfasdfasdfsadf</strong></p>',1),(5,'aaa','camel','11111111111111','<p><strong>dsfsadf&nbsp;</strong></p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>\n<p>&nbsp;</p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sadfasdfasdfsadf</strong></p>',1);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_login` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id`,`name`,`username`,`password`,`role_id`,`is_login`,`status`,`last_login`) values (1,'admin','admin','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec',1,0,1,'2015-02-24 17:05:06'),(3,'sumant','sumant','56f5c9b18788f904aa38f2db864627f9',1,0,1,'2014-06-20 16:12:50'),(4,'rupesh','rupesh','6dc51c0db6d309303c48eb429b8efbb3b3c87c64f1ea2f2a8e01f1d8932aaccabcdedf623925e5259a84959c134b4cbf018f06a03e3a42b3327e67f780d40366',1,1,1,'2015-03-04 12:38:44'),(5,'jay','jay','42d5ae85008d2a3c0c0059564ed10203d5cff49a91467b19d267aa764d47d30d3d7d9154e6a4d8e61dcd8ff79a7c727b8cb4d63b1b54f35c6d42a2cc1cad98aa',1,0,1,'2014-06-27 08:28:05'),(6,'prakashh','prakash','cef4817824cea8cf2bb83fa3f1e81b3f8aaf4be19ad563264e36102c0c1f87204fb66bc1e5a20698ab3692c985b861dcdbaa58f13dca5af0d55c1ffb9e90f5b2',1,0,1,'2014-12-26 13:45:27'),(7,'Bijesh Shrestha','bijesh','b286fe2dfd9f5f1ab439c51243bb11aabe27fcb00db68a870805851a86fb5ae9a8e87f0de9b64ee01eb47e558c3ed2fb5ad7b59ab76b3633463f5d780c9932fe',1,0,1,'2014-07-17 08:45:51'),(8,'sales','test','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec',3,0,1,NULL),(9,'Invoice','invoice','659983d23c6f9d1045e3f2dcdce32383ce9e65b3b967821dd5bf98ec8a3e207440aae696ecfbdf9ba453b817023cc0a05a9c0d3852e5e39a0e8a31494acbebd6',3,0,1,'2014-07-01 10:12:06'),(10,'a','a','1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75',1,NULL,1,NULL);

/*Table structure for table `tbl_user_activity` */

DROP TABLE IF EXISTS `tbl_user_activity`;

CREATE TABLE `tbl_user_activity` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `activity` varchar(560) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_user_activity` */

insert  into `tbl_user_activity`(`id`,`activity`,`user_id`,`date_time`) values (828,'',4,'2014-12-01 14:54:49'),(829,'',6,'2014-12-01 14:54:49'),(830,'dashboard',4,'2014-12-01 14:54:55'),(831,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-01 14:54:57'),(832,'invoice/index/156',4,'2014-12-01 14:55:03'),(833,'invoice/invoiceform',4,'2014-12-01 14:55:44'),(834,'',4,'2014-12-16 13:50:05'),(835,'',6,'2014-12-16 13:50:05'),(836,'',4,'2014-12-25 16:07:55'),(837,'',6,'2014-12-25 16:07:55'),(838,'dashboard',6,'2014-12-25 16:08:01'),(839,'dashboard/displaySearch/id/DESC/normal',6,'2014-12-25 16:08:03'),(840,'import',6,'2014-12-25 16:08:14'),(841,'income',6,'2014-12-25 16:08:16'),(842,'configuration',6,'2014-12-25 16:08:18'),(843,'incharge',6,'2014-12-25 16:08:19'),(844,'incharge/displaySearch/id/DESC',6,'2014-12-25 16:08:19'),(845,'mailtemplate',6,'2014-12-25 16:08:20'),(846,'mailtemplate/getAllTemplate/id/DESC',6,'2014-12-25 16:08:20'),(847,'memo',6,'2014-12-25 16:08:21'),(848,'memo/getAllMemo/id/DESC',6,'2014-12-25 16:08:22'),(849,'role/listRole',6,'2014-12-25 16:08:23'),(850,'role/displaySearch/id/DESC',6,'2014-12-25 16:08:23'),(851,'dashboard',6,'2014-12-25 16:08:24'),(852,'dashboard/displaySearch/id/DESC/normal',6,'2014-12-25 16:08:25'),(853,'dashboard',4,'2014-12-25 16:11:23'),(854,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-25 16:11:26'),(855,'user/admin/logout',6,'2014-12-25 16:31:32'),(856,'',4,'2014-12-26 14:12:10'),(857,'',6,'2014-12-26 14:12:10'),(858,'',4,'2014-12-26 16:54:29'),(859,'',6,'2014-12-26 16:54:29'),(860,'dashboard',4,'2014-12-26 16:54:34'),(861,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-26 16:54:35'),(862,'invoice/index/156',4,'2014-12-26 16:54:44'),(863,'dashboard',4,'2014-12-26 16:55:11'),(864,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-26 16:55:12'),(865,'dashboard',4,'2014-12-26 16:55:12'),(866,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-26 16:55:14'),(867,'dashboard/listingShopAction/156',4,'2014-12-26 16:55:19'),(868,'dashboard/AddEditShopAction',4,'2014-12-26 16:55:22'),(869,'dashboard/listingShopAction/156',4,'2014-12-26 16:55:30'),(870,'dashboard/listingShopAction/154',4,'2014-12-26 16:55:41'),(871,'dashboard/AddEditShopAction',4,'2014-12-26 16:55:49'),(872,'dashboard/personInchargeList',4,'2014-12-26 16:56:07'),(873,'dashboard',4,'2014-12-26 16:57:21'),(874,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-26 16:57:22'),(875,'dashboard/editShopInfo',4,'2014-12-26 16:57:23'),(876,'dashboard',4,'2014-12-26 16:57:28'),(877,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-26 16:57:29'),(878,'invoice/index/153',4,'2014-12-26 16:57:30'),(879,'dashboard',6,'2014-12-26 17:01:29'),(880,'dashboard/displaySearch/id/DESC/normal',6,'2014-12-26 17:01:31'),(881,'dashboard',4,'2014-12-26 17:02:13'),(882,'dashboard/displaySearch/id/DESC/normal',4,'2014-12-26 17:02:14'),(883,'invoice/index/156',4,'2014-12-26 17:02:34'),(884,'invoice/invoiceform',4,'2014-12-26 17:03:02'),(885,'invoice/invoiceform',4,'2014-12-26 17:03:05'),(886,'invoice/invoiceform',4,'2014-12-26 17:03:06'),(887,'invoice/invoiceform',4,'2014-12-26 17:03:08'),(888,'invoice/invoiceform',4,'2014-12-26 17:03:09'),(889,'',4,'2014-12-26 20:29:24'),(890,'',6,'2014-12-26 20:29:24'),(891,'',4,'2015-01-07 16:07:45'),(892,'',6,'2015-01-07 16:07:46'),(893,'dashboard',4,'2015-01-07 16:07:50'),(894,'dashboard/displaySearch/id/DESC/normal',4,'2015-01-07 16:07:53'),(895,'invoice/index/156',4,'2015-01-07 16:07:56'),(896,'invoice/invoiceform',4,'2015-01-07 16:08:00'),(897,'invoice/invoiceform',4,'2015-01-07 16:08:01'),(898,'',4,'2015-01-07 16:45:26'),(899,'',6,'2015-01-07 16:45:26'),(900,'dashboard',4,'2015-01-07 16:45:31'),(901,'dashboard/displaySearch/id/DESC/normal',4,'2015-01-07 16:45:33'),(902,'invoice/index/156',4,'2015-01-07 16:45:37'),(903,'',4,'2015-01-14 16:12:33'),(904,'',6,'2015-01-14 16:12:33'),(905,'dashboard',4,'2015-01-14 16:12:38'),(906,'dashboard/displaySearch/id/DESC/normal',4,'2015-01-14 16:12:41'),(907,'income',4,'2015-01-14 16:12:46'),(908,'import',4,'2015-01-14 16:12:51'),(909,'mailtemplate',4,'2015-01-14 16:12:54'),(910,'mailtemplate/getAllTemplate/id/DESC',4,'2015-01-14 16:12:55'),(911,'dashboard',4,'2015-01-14 16:12:57'),(912,'dashboard/displaySearch/id/DESC/normal',4,'2015-01-14 16:12:59'),(913,'invoice/index/156',4,'2015-01-14 16:13:00'),(914,'',4,'2015-01-15 18:27:50'),(915,'',6,'2015-01-15 18:27:50'),(916,'dashboard',4,'2015-01-15 18:27:55'),(917,'dashboard/displaySearch/id/DESC/normal',4,'2015-01-15 18:27:58'),(918,'dashboard/editShopInfo/153',4,'2015-01-15 18:28:15'),(919,'invoice/index/153',4,'2015-01-15 18:28:16'),(920,'dashboard/listingShopAction/154',4,'2015-01-15 18:45:33'),(921,'dashboard/AddEditShopAction',4,'2015-01-15 18:45:42'),(922,'',4,'2015-02-03 20:27:22'),(923,'',6,'2015-02-03 20:27:22'),(924,'dashboard',4,'2015-02-03 20:27:27'),(925,'dashboard/displaySearch/id/DESC/normal',4,'2015-02-03 20:27:28'),(926,'income',4,'2015-02-03 20:27:36'),(927,'income',4,'2015-02-03 20:29:48'),(928,'configuration',4,'2015-02-03 20:29:49'),(929,'incharge',4,'2015-02-03 20:29:51'),(930,'incharge/displaySearch/id/DESC',4,'2015-02-03 20:29:51'),(931,'configuration',4,'2015-02-03 20:29:53'),(932,'dashboard',4,'2015-02-03 20:29:54'),(933,'dashboard/displaySearch/id/DESC/normal',4,'2015-02-03 20:29:54'),(934,'dashboard/editShopInfo/156',4,'2015-02-03 20:30:03'),(935,'dashboard/index',4,'2015-02-03 20:30:07'),(936,'dashboard/displaySearch/id/DESC/normal',4,'2015-02-03 20:30:07'),(937,'invoice/index/156',4,'2015-02-03 20:30:15'),(938,'invoice/index/156',4,'2015-02-03 20:30:41'),(939,'invoice/invoiceform',4,'2015-02-03 20:30:46'),(940,'invoice/invoiceform',4,'2015-02-03 20:30:47'),(941,'invoice/invoiceform',4,'2015-02-03 20:30:48'),(942,'invoice/invoiceform',4,'2015-02-03 20:30:48'),(943,'invoice/invoiceform',4,'2015-02-03 20:30:49'),(944,'invoice/invoiceform',4,'2015-02-03 20:30:49'),(945,'invoice/invoiceform',4,'2015-02-03 20:30:53'),(946,'invoice/invoiceform',4,'2015-02-03 20:30:54'),(947,'invoice/invoiceform',4,'2015-02-03 20:30:55'),(948,'invoice/invoiceform',4,'2015-02-03 20:30:55'),(949,'invoice/invoiceform',4,'2015-02-03 20:30:56'),(950,'invoice/invoiceform',4,'2015-02-03 20:30:59'),(951,'invoice/invoiceform',4,'2015-02-03 20:31:01'),(952,'invoice/invoiceform',4,'2015-02-03 20:31:03'),(953,'invoice/index/156',4,'2015-02-03 20:31:04'),(954,'invoice/invoiceform',4,'2015-02-03 20:31:08'),(955,'invoice/invoiceform',4,'2015-02-03 20:31:09'),(956,'invoice/index/156',4,'2015-02-03 20:31:24'),(957,'invoice/index/156',4,'2015-02-03 20:31:24'),(958,'invoice/index/156',4,'2015-02-03 20:31:25'),(959,'invoice/index/156',4,'2015-02-03 20:31:28'),(960,'invoice/index/156',4,'2015-02-03 20:31:29'),(961,'invoice/index/156',4,'2015-02-03 20:31:29'),(962,'income',4,'2015-02-03 20:31:37'),(963,'configuration',4,'2015-02-03 20:31:41'),(964,'user',4,'2015-02-03 20:31:45'),(965,'user/displaySearch/id/DESC',4,'2015-02-03 20:31:45'),(966,'blockedip',4,'2015-02-03 20:31:49'),(967,'blockedip/displaySearch/id/DESC',4,'2015-02-03 20:31:49'),(968,'dashboard',4,'2015-02-03 20:31:51'),(969,'dashboard/displaySearch/id/DESC/normal',4,'2015-02-03 20:31:52'),(970,'invoice/index/156',4,'2015-02-03 20:32:02'),(971,'dashboard',4,'2015-02-03 20:32:06'),(972,'dashboard/displaySearch/id/DESC/normal',4,'2015-02-03 20:32:06'),(973,'income',4,'2015-02-03 20:32:13'),(974,'income/show',4,'2015-02-03 20:32:15'),(975,'income/show',4,'2015-02-03 20:32:16'),(976,'dashboard',4,'2015-02-03 20:32:16'),(977,'dashboard/displaySearch/id/DESC/normal',4,'2015-02-03 20:32:17'),(978,'invoice/index/153',4,'2015-02-03 20:32:19'),(979,'invoice/invoiceform',4,'2015-02-03 20:37:06'),(980,'configuration',4,'2015-02-03 20:37:28'),(981,'configuration/editMerchant/1',4,'2015-02-03 20:37:36'),(982,'configuration',4,'2015-02-03 20:37:41'),(983,'import',4,'2015-02-03 20:38:19'),(984,'import/shopInfo',4,'2015-02-03 20:38:32'),(985,'import/shopInfo',4,'2015-02-03 20:38:32'),(986,'import',4,'2015-02-03 20:38:32'),(987,'import/shopInfo',4,'2015-02-03 20:39:56'),(988,'import/shopInfo',4,'2015-02-03 20:39:58'),(989,'import',4,'2015-02-03 20:39:58'),(990,'import/shopInfo',4,'2015-02-03 20:40:10'),(991,'import/shopInfo',4,'2015-02-03 20:40:11'),(992,'import',4,'2015-02-03 20:40:11'),(993,'import/shopInfo',4,'2015-02-03 20:40:29'),(994,'import/shopInfo',4,'2015-02-03 20:40:29'),(995,'import',4,'2015-02-03 20:40:29'),(996,'',4,'2015-02-20 14:30:48'),(997,'',6,'2015-02-20 14:30:48'),(998,'dashboard',1,'2015-02-20 14:31:24'),(999,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-20 14:31:27'),(1000,'invoice/index/156',1,'2015-02-20 14:31:37'),(1001,'configuration',1,'2015-02-20 14:31:43'),(1002,'mailtemplate',1,'2015-02-20 14:31:44'),(1003,'mailtemplate/getAllTemplate/id/DESC',1,'2015-02-20 14:31:45'),(1004,'memo',1,'2015-02-20 14:31:46'),(1005,'memo/getAllMemo/id/DESC',1,'2015-02-20 14:31:47'),(1006,'incharge',1,'2015-02-20 14:31:48'),(1007,'incharge/displaySearch/id/DESC',1,'2015-02-20 14:31:49'),(1008,'configuration',1,'2015-02-20 14:31:53'),(1009,'user',1,'2015-02-20 14:31:56'),(1010,'user/displaySearch/id/DESC',1,'2015-02-20 14:31:57'),(1011,'role',1,'2015-02-20 14:32:01'),(1012,'blockedip',1,'2015-02-20 14:32:04'),(1013,'blockedip/displaySearch/id/DESC',1,'2015-02-20 14:32:05'),(1014,'dashboard',1,'2015-02-20 14:32:05'),(1015,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-20 14:32:06'),(1016,'import',1,'2015-02-20 14:32:17'),(1017,'dashboard',1,'2015-02-20 14:32:18'),(1018,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-20 14:32:19'),(1019,'dashboard/editShopInfo/156',1,'2015-02-20 14:32:23'),(1020,'dashboard',1,'2015-02-20 14:32:27'),(1021,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-20 14:32:28'),(1022,'dashboard/listingShopAction/156',1,'2015-02-20 14:32:32'),(1023,'dashboard/actionDetail/5',1,'2015-02-20 14:32:36'),(1024,'dashboard/actionComment/5',1,'2015-02-20 14:32:49'),(1025,'dashboard/actionDetail/5',1,'2015-02-20 14:32:49'),(1026,'dashboard/actionComment/5',1,'2015-02-20 14:32:53'),(1027,'dashboard/actionDetail/5',1,'2015-02-20 14:32:53'),(1028,'dashboard/updateComment/5',1,'2015-02-20 14:33:05'),(1029,'dashboard/actionDetail/5',1,'2015-02-20 14:33:06'),(1030,'dashboard/listingShopAction/156',1,'2015-02-20 14:33:12'),(1031,'mailtemplate',1,'2015-02-20 14:33:17'),(1032,'mailtemplate/getAllTemplate/id/DESC',1,'2015-02-20 14:33:17'),(1033,'mailtemplate/form/5',1,'2015-02-20 14:33:22'),(1034,'mailtemplate',1,'2015-02-20 14:33:24'),(1035,'mailtemplate/getAllTemplate/id/DESC',1,'2015-02-20 14:33:25'),(1036,'mailtemplate/form/5',1,'2015-02-20 14:33:27'),(1037,'mailtemplate',1,'2015-02-20 14:33:30'),(1038,'mailtemplate/getAllTemplate/id/DESC',1,'2015-02-20 14:33:30'),(1039,'user',1,'2015-02-20 14:33:37'),(1040,'user/displaySearch/id/DESC',1,'2015-02-20 14:33:38'),(1041,'',1,'2015-02-24 06:56:47'),(1042,'',4,'2015-02-24 06:56:47'),(1043,'',6,'2015-02-24 06:56:47'),(1044,'dashboard',1,'2015-02-24 06:58:54'),(1045,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-24 06:58:56'),(1046,'user/admin',1,'2015-02-24 07:00:56'),(1047,'dashboard',1,'2015-02-24 07:00:57'),(1048,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-24 07:00:57'),(1049,'',1,'2015-02-24 12:21:23'),(1050,'',4,'2015-02-24 12:21:23'),(1051,'',6,'2015-02-24 12:21:23'),(1052,'dashboard',1,'2015-02-24 12:21:30'),(1053,'dashboard/displaySearch/id/DESC/normal',1,'2015-02-24 12:21:31'),(1054,'',1,'2015-03-04 15:55:53'),(1055,'',4,'2015-03-04 15:55:53'),(1056,'',6,'2015-03-04 15:55:53'),(1057,'dashboard',4,'2015-03-04 15:55:58'),(1058,'dashboard/displaySearch/id/DESC/normal',4,'2015-03-04 15:56:01');

/* Function  structure for function  `fn_getinvoiceId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getinvoiceId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getinvoiceId`(shopId VARCHAR(255)) RETURNS int(11)
BEGIN
 DECLARE invId INT DEFAULT 0;
 SET invId = (SELECT id FROM `tbl_invoice` WHERE `shop_id` = shopId LIMIT 1);
 RETURN invId;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getInvoiceTerm` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getInvoiceTerm` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getInvoiceTerm`(payterm VARCHAR(255)) RETURNS int(11)
BEGIN
	
	
	DECLARE typeId INT DEFAULT 0;
	
	SET typeId = (SELECT id FROM `tbl_item_type` WHERE CONVERT(`name` USING utf8) = convert(CONVERT(payterm USING binary) using utf8)LIMIT 1);
	
	RETURN typeId;
	
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getMerchantId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getMerchantId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getMerchantId`(merchantName VARCHAR(255)) RETURNS int(11)
BEGIN
 DECLARE merchantId INT DEFAULT 0;
 SET merchantId = (SELECT id FROM `tbl_merchant` WHERE `name` = merchantName LIMIT 1);
 RETURN ifnull(merchantId,1);
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getMonthId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getMonthId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getMonthId`(p_DateTime DATETIME,p_Add TINYINT) RETURNS smallint(6)
BEGIN
	DECLARE mo tinyint;
	SET mo = (SELECT Month(DATE_ADD(p_DateTime, INTERVAL p_Add MONTH)));
	Set mo = (select id from tbl_month where `index` = mo);
	RETURN mo;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getMonthIndex` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getMonthIndex` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getMonthIndex`(monthId TINYINT) RETURNS tinyint(4)
BEGIN
	DECLARE mo tinyint;
	Set mo = (select `index` from tbl_month where id = monthId);
	RETURN mo;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getPaymentId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getPaymentId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getPaymentId`(paymentName VARCHAR(255)) RETURNS int(11)
BEGIN
 DECLARE paymentId INT;
 SET paymentId = (SELECT id FROM `tbl_payment_option` WHERE convert(`name` using utf8) = CONVERT(CONVERT(paymentName USING BINARY) USING utf8) LIMIT 1);
 RETURN paymentId;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getPlanId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getPlanId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getPlanId`(planName VARCHAR(255)) RETURNS int(11)
BEGIN
 DECLARE invId INT;
 SET invId = (SELECT id FROM `tbl_plan` WHERE CONVERT(`name` USING utf8) = CONVERT(CONVERT(planName USING BINARY) USING utf8) LIMIT 1);
 RETURN invId;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getPrefectureId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getPrefectureId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getPrefectureId`(prefectureName VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE prefId INT;
	
	SET prefId = (SELECT id FROM `tbl_prefecture` WHERE CONVERT(`name` USING utf8) = CONVERT(CONVERT(prefectureName USING BINARY) USING utf8) LIMIT 1);
	RETURN prefId;
	
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getRegionId` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getRegionId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getRegionId`(regionName VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE regionId INT;
	SET regionId = (SELECT id FROM `tbl_region` WHERE convert(`name` using utf8) = convert(Convert(regionName using binary) using utf8) LIMIT 1);
	RETURN regionId;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_getYear` */

/*!50003 DROP FUNCTION IF EXISTS `fn_getYear` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` FUNCTION `fn_getYear`(p_DateTime DateTime,p_Add tinyint) RETURNS smallint(6)
BEGIN
	declare dt smallint;
	Set dt = (select Date_Add(p_DateTime, interval p_Add month));
	return dt;
END */$$
DELIMITER ;

/* Procedure structure for procedure `check_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `check_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`bijesh`@`%` PROCEDURE `check_login`(
	username VARCHAR(255),
	`password` VARCHAR(255),
	ipaddress VARCHAR(255)
)
BEGIN
	
	DECLARE user_id INT;
	DECLARE _status INT;
	SET _status = 0;
	
	IF (SELECT COUNT(id) FROM tbl_login_details WHERE ip_address = ipaddress AND tbl_login_details.user_id = 0) > 10 THEN
		SELECT 1 AS status_code;
	ELSEIF (SELECT COUNT(id) FROM tbl_user tu WHERE tu.username = username) = 0 THEN
		INSERT INTO tbl_login_details(user_id, ip_address, `time`, `status`) VALUES(0, ipaddress, NOW(), _status);
		SELECT 2 AS status_code;
	ELSEIF (SELECT COUNT(id) FROM tbl_user tu WHERE tu.username = username AND tu.`status` = 0) = 1 THEN
		IF (SELECT COUNT(id) FROM tbl_user tu WHERE tu.username = username AND tu.password = `PASSWORD` AND tu.`status` = 0) = 1 THEN
			SELECT 3 AS status_code;
		ELSE
			INSERT INTO tbl_login_details(user_id, ip_address, `time`, `status`) VALUES(0, ipaddress, NOW(), _status);
			SELECT 3.1 AS status_code;
		END IF;
	ELSEIF (SELECT COUNT(id) FROM tbl_user tu WHERE tu.username = username AND tu.`status` = 1) = 1 THEN
		SET user_id = (SELECT id FROM tbl_user tu WHERE tu.username = username);
		IF (SELECT COUNT(id) FROM tbl_user tu WHERE tu.password = `PASSWORD` AND tu.username = username AND is_login = 1) = 1 THEN
			SELECT 7 AS status_code;
		ELSEIF (SELECT COUNT(id) FROM tbl_user tu WHERE tu.password = `PASSWORD` AND tu.username = username) = 1 THEN
			# On Successful login
			SET _status = 1;
			DELETE FROM tbl_login_details WHERE tbl_login_details.user_id = user_id AND tbl_login_details.`status` = 0;
			UPDATE tbl_user SET is_login = 1, last_login = NOW() WHERE id = user_id;
			#UPDATE tbl_user SET is_login = 1, last_login = NOW() WHERE id = 1;
			#UPDATE tbl_user tu SET STATUS = 1, tu.is_login = 1, tu.last_login = NOW() WHERE tu.username = username;
			SELECT 4 AS status_code, user_id, tu.role_id FROM tbl_user tu WHERE tu.password = `PASSWORD` AND tu.username = username;
		ELSE
			IF (SELECT COUNT(id) FROM tbl_login_details tld WHERE tld.user_id = user_id AND STATUS = 0) > 10 THEN
				UPDATE tbl_user tu SET STATUS = 0 WHERE tu.username = username;
				DELETE FROM tbl_login_details WHERE tbl_login_details.user_id = user_id AND tbl_login_details.`status` = 0;
				SELECT 5 AS status_code;
			ELSE
				INSERT INTO tbl_login_details(user_id, ip_address, `time`, `status`) VALUES(user_id, ipaddress, NOW(), _status);
				SELECT 6 AS status_code;
			END IF;
		END IF;
	END IF;
	
	INSERT INTO tbl_login_log(username, ip_address, date_time, `status`) VALUES(username, ipaddress, NOW(), _status);
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_shop_ids` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_shop_ids` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `get_shop_ids`(user_id int)
BEGIN
		
		DECLARE cursor_temp VARCHAR(20);
		declare merchant_id integer;
		DECLARE email varchar(255);
		DECLARE telephone varchar(255);
		DECLARE fax varchar(255);
		DECLARE url varchar(255);
		DECLARE zip varchar(255);
		DECLARE address varchar(255);
		DECLARE building varchar(255);
		DECLARE family_name varchar(255);
		DECLARE first_name varchar(255);
		DECLARE plan_id INTEGER;
		DECLARE contract_date date;
		DECLARE cancellation_date date;
		DECLARE memo varchar(255);
		DECLARE region_id INTEGER;
		DECLARE prefecture_id INTEGER;
		DECLARE payment_option_id INTEGER;
		DECLARE created_by INTEGER;
		DECLARE created_date datetime;
		DECLARE modified_by INTEGER;
		DECLARE modified_date timestamp  DEFAULT CURRENT_TIMESTAMP;
		DECLARE group_ varchar(255);
		DECLARE is_cursor_finished INTEGER;
				
		DECLARE date_cursor CURSOR FOR 		  
			SELECT distinct value FROM tbl_temp;
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_cursor_finished = 1;
		SET is_cursor_finished = 0;
		OPEN date_cursor;
		
		   
		   read_loop:LOOP
		   
			FETCH NEXT FROM date_cursor INTO cursor_temp;
			IF is_cursor_finished = 1 THEN
				LEAVE read_loop;
			END IF;
			
			Insert into tbl_shop(
				`id`,
				`company`,
				`merchant_id`,
				`email`, 
				`telephone`, 
				`fax`, 
				`url`, 
				`zip`, 
				`address`, 
				`building`, 
				`family_name`, 
				`first_name`, 
				`plan_id`, 
				`contract_date`, 
				`cancellation_date`, 
				`memo`, 
				`region_id`, 
				`prefecture_id`, 
				`payment_option_id`,
				`created_by`,
				`created_date`,
				`modified_by`)
			select cursor_temp,
				ts.`company_name`,
				fn_getMerchantId(ts.merchant_info),
				ts.`email`, 
				ts.`tel`, 
				ts.`fax`, 
				ts.`url`, 
				ts.`zip`, 
				ts.`address`, 
				ts.`building`, 
				ts.`family_name`, 
				ts.`first_name`, 
				fn_getPlanId(ts.`plan`), 
				ts.`contract_date`, 
				ts.`cancellation_date`, 
				ts.`memo`, 
				fn_getRegionId(ts.`region`), 
				fn_getPrefectureId(ts.`prefecture`), 
				fn_getPaymentId(ts.`pay_term`),
				user_id,
				now(),
				user_id
			from tbl_temp_shop ts where ts.id = cursor_temp;
			
			
			# insert invoice details			
			insert into tbl_invoice(
				 `shop_id`,
				 `year`, 
				 `month`, 
				 `date`, 
				 `due_date`,
				 `subtotal`,
				 `sales_tax`,
				 `total`, 
				 `prepared_by`, 
				 `prepared_date`
				 )
				 
			select 
				cursor_temp,
				tv.year,
				fn_getMonthIndex(tv.month),
				DATE_FORMAT(NOW() ,'%Y-%m-01'),
				LAST_DAY(NOW()),
				tv.price*tv.qty,
				(tv.price*tv.qty)*(0.08),
				((tv.price*tv.qty)*(0.08))+(tv.price*tv.qty),
				user_id,
				now()			
				FROM tbl_temp_invoice tv WHERE tv.shop_id = cursor_temp;
				
				
			# insert invoice item details
			insert into tbl_invoice_item(
				`invoice_id`,
				`item_name`,
				`price`,
				`qty`,
				`total`,
				`item_type_id`
				)
				
			select 
			fn_getinvoiceId(tt.shop_id),
			tt.`name`,
			tt.`price`,
			tt.`qty`, 
			(tt.`price`) * (tt.`qty`),
			fn_getInvoiceTerm(tt.`pay_term`)
			from  tbl_temp_invoice tt WHERE tt.shop_id = cursor_temp;
			
			
		#SUBSTRING(tv.`yyyymm`,1, 4),
		#fn_getMonthIndex(SUBSTRING(tv.`yyyymm`, 5, 6)),	
			
		#Delete temp_shop row
		DELETE FROM tbl_temp_shop WHERE id = cursor_temp; 
		
		#Delete temp_invoice row
		DELETE FROM tbl_temp_invoice WHERE shop_id = cursor_temp;
		
		#Delete tbl_tem row
		Delete from tbl_temp where value = cursor_temp;
		
		 END LOOP read_loop;		  
		CLOSE date_cursor;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `import_action` */

/*!50003 DROP PROCEDURE IF EXISTS  `import_action` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `import_action`()
BEGIN
    
      SELECT distinct `title` from tbl_temp_action order by id desc;
      
    END */$$
DELIMITER ;

/* Procedure structure for procedure `import_invoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `import_invoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `import_invoice`(user_id INT)
BEGIN	
	DECLARE _shop_id VARCHAR(20);
	DECLARE _is_cursor_finished INTEGER;
	DECLARE _invoice_count SMALLINT;
	DECLARE _year INT;
	DECLARE _month TINYINT;
	DECLARE _invoice_id BIGINT;
	DECLARE _subtotal DECIMAL(20,5);
	DECLARE _sales_tax DECIMAL(20,5);
	
	DECLARE _invoice_cursor CURSOR FOR 		  
		SELECT DISTINCT `value` FROM tbl_temp;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _is_cursor_finished = 1;
	SET _is_cursor_finished = 0;
	OPEN _invoice_cursor;
		   
	read_loop:LOOP		   
		FETCH NEXT FROM _invoice_cursor INTO _shop_id;
		IF _is_cursor_finished = 1 THEN
			LEAVE read_loop;
		END IF;
		
		SET _invoice_count = (SELECT COUNT(DISTINCT `year`,`month`) FROM tbl_temp_invoice WHERE shop_id = _shop_id);
		WHILE _invoice_count > 0 DO
			SET _year = (SELECT `year` FROM tbl_temp_invoice WHERE shop_id = _shop_id ORDER BY `year` ASC,`month` ASC LIMIT 1);
			SET _month = (SELECT `month` FROM tbl_temp_invoice WHERE shop_id = _shop_id ORDER BY `year` ASC,`month` ASC LIMIT 1);
			
			SET _invoice_count = (SELECT COUNT(id) FROM tbl_invoice WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month);
			
			IF _invoice_count = 0 THEN
				SET _subtotal = (SELECT SUM(price * qty) FROM tbl_temp_invoice WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month);
				SET _sales_tax = (SELECT SUM(price * qty) * 0.08 FROM tbl_temp_invoice WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month);
				
				INSERT INTO tbl_invoice(shop_id,`year`,`month`,`date`,`due_date`,subtotal,sales_tax,total,prepared_by,prepared_date) 
					select _shop_id,_year,_month,STR_TO_DATE(ADDDATE(CONCAT(_year,'-',_month,'-01'), INTERVAL -1 MONTH),'%Y-%m-%d'),
						LAST_DAY(ADDDATE(CONCAT(_year,'-',_month,'-01 00:00:00'), INTERVAL -1 MONTH)),_subtotal,_sales_tax,_subtotal+_sales_tax,user_id,NOW();
				
				SET _invoice_id = (SELECT LAST_INSERT_ID());
				
				INSERT INTO tbl_invoice_item(invoice_id,item_name,price,qty,total,item_type_id)
					SELECT _invoice_id,`name`,price,qty,price * qty,IFNULL(fn_getInvoiceTerm(pay_term),3) FROM tbl_temp_invoice WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month;
			END IF;
			DELETE FROM tbl_temp_invoice WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month;
			
			SET _invoice_count = (SELECT COUNT(DISTINCT `year`,`month`) FROM tbl_temp_invoice WHERE shop_id = _shop_id);
		END WHILE;
		
		DELETE FROM tbl_temp WHERE `value` = 1;
	END LOOP read_loop;		  
	CLOSE _invoice_cursor;
END */$$
DELIMITER ;

/* Procedure structure for procedure `import_merchant` */

/*!50003 DROP PROCEDURE IF EXISTS  `import_merchant` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `import_merchant`(user_id INT)
BEGIN	
	DECLARE _shop_id VARCHAR(20);
	DECLARE _is_cursor_finished INTEGER;
	DECLARE _invoice_count SMALLINT;
	DECLARE _year INT;
	DECLARE _month TINYINT;
	DECLARE _invoice_id BIGINT;
	DECLARE _subtotal DECIMAL(20,5);
	DECLARE _sales_tax DECIMAL(20,5);
	declare _merchant_id int;
	
	DECLARE _invoice_cursor CURSOR FOR 		  
		SELECT DISTINCT `value` FROM tbl_temp;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _is_cursor_finished = 1;
	SET _is_cursor_finished = 0;
	OPEN _invoice_cursor;
		   
	read_loop:LOOP		   
		FETCH NEXT FROM _invoice_cursor INTO _shop_id;
		IF _is_cursor_finished = 1 THEN
			LEAVE read_loop;
		END IF;
		
		SET _invoice_count = (SELECT COUNT(DISTINCT `year`,`month`) FROM tbl_temp_merchant WHERE shop_id = _shop_id);
		WHILE _invoice_count > 0 DO
			set _merchant_id = (select `merchant_id` from tbl_shop where id = _shop_id);
			SET _year = (SELECT `year` FROM tbl_temp_merchant WHERE shop_id = _shop_id ORDER BY `year` ASC,`month` ASC LIMIT 1);
			SET _month = (SELECT `month` FROM tbl_temp_merchant WHERE shop_id = _shop_id ORDER BY `year` ASC,`month` ASC LIMIT 1);
			if _merchant_id <> 1 then				
				SET _invoice_count = (SELECT COUNT(id) FROM tbl_merchant_invoice WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month);
				
				IF _invoice_count = 0 THEN
					SET _subtotal = (SELECT SUM(price * qty) FROM tbl_temp_merchant WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month);
					SET _sales_tax = (SELECT SUM(price * qty) * 0.08 FROM tbl_temp_merchant WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month);
					
					INSERT INTO tbl_merchant_invoice(shop_id,`year`,`month`,`date`,`due_date`,subtotal,sales_tax,total,prepared_by,prepared_date) 
						SELECT _shop_id,_year,_month,STR_TO_DATE(ADDDATE(CONCAT(_year,'-',_month,'-01'), INTERVAL -1 MONTH),'%Y-%m-%d'),
							LAST_DAY(ADDDATE(CONCAT(_year,'-',_month,'-01 00:00:00'), INTERVAL -1 MONTH)),_subtotal,_sales_tax,_subtotal+_sales_tax,user_id,NOW();
					
					SET _invoice_id = (SELECT LAST_INSERT_ID());
					
					INSERT INTO tbl_merchant_invoice_item(invoice_id,item_name,price,qty,total,item_type_id)
						SELECT _invoice_id,`name`,price,qty,price * qty,IFNULL(fn_getInvoiceTerm(pay_term),3) FROM tbl_temp_merchant WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month;
				END IF;
			end if;
			DELETE FROM tbl_temp_merchant WHERE shop_id = _shop_id AND `year` = _year AND `month` = _month;
			
			SET _invoice_count = (SELECT COUNT(DISTINCT `year`,`month`) FROM tbl_temp_merchant WHERE shop_id = _shop_id);
		END WHILE;
		
		DELETE FROM tbl_temp WHERE `value` = _shop_id;
	END LOOP read_loop;		  
	CLOSE _invoice_cursor;
END */$$
DELIMITER ;

/* Procedure structure for procedure `import_shop` */

/*!50003 DROP PROCEDURE IF EXISTS  `import_shop` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `import_shop`(user_id INT)
BEGIN	
	DECLARE _shop_id VARCHAR(20);
	DECLARE _is_cursor_finished INTEGER;
	declare _shop_count int;
	
	DECLARE _shop_cursor CURSOR FOR 		  
		SELECT DISTINCT `value` FROM tbl_temp;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _is_cursor_finished = 1;
	
	SET _is_cursor_finished = 0;
	OPEN _shop_cursor;
		   
	read_loop:LOOP		   
		FETCH NEXT FROM _shop_cursor INTO _shop_id;
		IF _is_cursor_finished = 1 THEN
			LEAVE read_loop;
		END IF;
		
		IF not Exists (select id from tbl_shop where id = _shop_id) then
			Insert INTO tbl_shop (id,`company`,`merchant_id`,`email`,`telephone`,`fax`,`url`,`zip`,`address`,`building`,`family_name`,`first_name`,`plan_id`,`contract_date`,
				`cancellation_date`,`memo`,`region_id`,`prefecture_id`,`payment_option_id`,`created_by`,`created_date`,`modified_by`,`is_paid`)
			SELECT 
				ts.id,
				ts.`company_name`,
				fn_getMerchantId(ts.merchant_info),
				ts.`email`, 
				ts.`tel`, 
				ts.`fax`, 
				ts.`url`, 
				ts.`zip`, 
				ts.`address`, 
				ts.`building`, 
				ts.`family_name`, 
				ts.`first_name`, 
				fn_getPlanId(ts.`plan`), 
				ts.`contract_date`, 
				ts.`cancellation_date`, 
				ts.`memo`, 
				fn_getRegionId(ts.`region`), 
				fn_getPrefectureId(ts.`prefecture`), 
				fn_getPaymentId(ts.`pay_term`),
				user_id,
				NOW(),
				user_id,
				0
			FROM tbl_temp_shop ts WHERE ts.id = _shop_id;
		else
			update tbl_shop ts join tbl_temp_shop tts on tts.id = ts.id set
				ts.`company` = tts.`company_name`,
				ts.merchant_id = fn_getMerchantId(tts.merchant_info),
				ts.`email` = tts.`email`, 
				ts.`telephone` = tts.`tel`, 
				ts.`fax` = tts.`fax`, 
				ts.`url` = tts.`url`, 
				ts.`zip` = tts.`zip`, 
				ts.`address` = tts.`address`, 
				ts.`building` = tts.`building`, 
				ts.`family_name` = tts.`family_name`, 
				ts.`first_name` = tts.`first_name`, 
				ts.`plan_id` = fn_getPlanId(tts.`plan`), 
				ts.`contract_date` = tts.`contract_date`, 
				ts.`cancellation_date` = tts.`cancellation_date`, 
				ts.`memo` = tts.`memo`, 
				ts.`region_id` = fn_getRegionId(tts.`region`), 
				ts.`prefecture_id` = fn_getPrefectureId(tts.`prefecture`), 
				ts.`payment_option_id` = fn_getPaymentId(tts.`pay_term`),
				ts.modified_date = NOW(),
				ts.modified_by = user_id
			where ts.id = _shop_id;
		end if;
		
		DELETE FROM tbl_temp_shop WHERE id = _shop_id;
		Delete from tbl_temp where `value` = _shop_id;
	END LOOP read_loop;		  
	CLOSE _shop_cursor;
END */$$
DELIMITER ;

/* Procedure structure for procedure `my_procedure` */

/*!50003 DROP PROCEDURE IF EXISTS  `my_procedure` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `my_procedure`(IN year_ INT, IN month_ INT, in user_id_ int)
BEGIN
 DECLARE previous_yearly_item_count INTEGER;
 DECLARE previous_monthly_item_count INTEGER;
 DECLARE new_invoice_id INT;
 DECLARE yearly_valid_invoice_id INTEGER;
 DECLARE monthly_valid_invoice_id INTEGER;
 
 DECLARE _merchant_id INTEGER;
 DECLARE _shop_id VARCHAR(20);
 DECLARE _year INT;
 DECLARE _year_accrual_yearly INT;
 DECLARE _month INT;
 DECLARE _subtotal DECIMAL(20,2);
 DECLARE _salestax DECIMAL(20,2);
 DECLARE _is_cursor_finished INTEGER;
 DECLARE _shop_cursor CURSOR FOR 
	SELECT DISTINCT `value` FROM tbl_temp;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET _is_cursor_finished = 1;	
 SET _is_cursor_finished = 0;
 
 OPEN _shop_cursor; 
	 read_loop:LOOP		   
		FETCH NEXT FROM _shop_cursor INTO _shop_id;
		IF _is_cursor_finished = 1 THEN
			LEAVE read_loop;
		END IF;
		
		SET _month = (SELECT MONTH(STR_TO_DATE(ADDDATE(CONCAT(year_,'-',month_,'-01'), INTERVAL 1 MONTH),'%Y-%m-%d')));
		SET _year = (SELECT YEAR(STR_TO_DATE(ADDDATE(CONCAT(year_,'-',month_,'-01'), INTERVAL 1 MONTH),'%Y-%m-%d')));
		set _year_accrual_yearly = (SELECT YEAR(STR_TO_DATE(ADDDATE(CONCAT(year_,'-',month_,'-01'), INTERVAL 0 MONTH),'%Y-%m-%d')));
		
		IF (SELECT COUNT(`id`) FROM tbl_invoice WHERE `shop_id` = _shop_id AND `year` = _year AND `month` = _month) = 0 THEN		
			#Check if, yearly item can be included in this invoice for shop.
			SET yearly_valid_invoice_id = (SELECT `id` FROM tbl_invoice 
												WHERE `shop_id` = _shop_id 
													AND DATE_FORMAT(CONCAT(`year`,'-',`month`,'-01'),'%Y-%m-%d') = ADDDATE(CONCAT(year_,'-',month_,'-01'), INTERVAL 0 YEAR));
			
			#Get Previous invoice id for monthly
			SET monthly_valid_invoice_id = (SELECT `id` FROM tbl_invoice WHERE `shop_id` = _shop_id ORDER BY `id` DESC LIMIT 1);
			
			#Get Previous invoice id for yearly
			SET previous_yearly_item_count = (SELECT COUNT(tii.id) FROM tbl_invoice ti
													JOIN tbl_invoice_item tii ON tii.invoice_id = ti.id
												WHERE ti.shop_id = _shop_id 
													AND ti.id = yearly_valid_invoice_id
													AND tii.item_type_id = 1);
			
			#Count monthly item for => year_ and month_	- 1
			SET previous_monthly_item_count = (SELECT COUNT(tii.id) FROM tbl_invoice ti
													JOIN tbl_invoice_item tii ON tii.invoice_id = ti.id
												WHERE ti.shop_id = _shop_id 
													AND ti.id = monthly_valid_invoice_id
													AND tii.item_type_id = 2);
			
			SET _subtotal = 0;
			SET _salestax = 0;
			IF previous_yearly_item_count > 0 THEN
				#Calculate the subtotal, sales tax and total for the yearly invoice item
				SET _subtotal = (SELECT SUM(tii.price * tii.qty) FROM tbl_invoice ti
						JOIN tbl_invoice_item tii ON tii.invoice_id = ti.id
					WHERE ti.shop_id = _shop_id 
						AND ti.id = yearly_valid_invoice_id
						AND tii.item_type_id = 1);
			END IF;
			
			IF previous_monthly_item_count > 0 THEN
				#Calculate the subtotal, sales tax and total for the monthly invoice item
				SET _subtotal = _subtotal + (SELECT SUM(tii.price * tii.qty) FROM tbl_invoice ti
						JOIN tbl_invoice_item tii ON tii.invoice_id = ti.id
					WHERE ti.shop_id = _shop_id 
						AND ti.id = monthly_valid_invoice_id
						AND tii.item_type_id = 2);
			END IF;
			SET _salestax = _subtotal * 0.08;
			
			#Prepare shop invoice
			IF previous_yearly_item_count > 0 OR previous_monthly_item_count > 0 THEN		
								
				IF previous_yearly_item_count > 0 THEN
				
					INSERT INTO tbl_invoice(`shop_id`,`year`, `month`, `small_note`,`big_note`,`regular_big_note`,`date`, `due_date`,`subtotal`,`sales_tax`,`total`, `prepared_by`, `prepared_date`)
					SELECT `shop_id`, 
						_year_accrual_yearly+1, 
						MONTH(STR_TO_DATE(ADDDATE(CONCAT(_year,'-',_month,'-01'), INTERVAL -1 MONTH),'%Y-%m-%d')), 
						`small_note`,
						`big_note`,
						`regular_big_note`,
						CONCAT(year_,'-',month_,'-01'), 
						LAST_DAY(CONCAT(year_,'-',month_,'-01')),
						_subtotal,
						_salestax,
						_subtotal + _salestax,
						user_id_,
						NOW()
					FROM tbl_invoice WHERE id = monthly_valid_invoice_id;
				
					SET new_invoice_id = LAST_INSERT_ID();
					
					INSERT INTO tbl_invoice_item(`invoice_id`,`item_name`,`price`,`qty`,`total`,`item_type_id`,`accrual_from_year`,`accrual_from_month`,`accrual_to_year`,`accrual_to_month`)
						SELECT 
							new_invoice_id,
							`item_name`,
							`price`,
							`qty`,
							`total`,
							`item_type_id`,
							`accrual_from_year`+1,
							`accrual_from_month`,
							`accrual_to_year`+1,
							`accrual_to_month`			
						FROM  tbl_invoice_item WHERE `invoice_id` = yearly_valid_invoice_id AND `item_type_id` = 1;
				END IF;
				IF previous_monthly_item_count > 0 THEN
					INSERT INTO tbl_invoice(`shop_id`,`year`, `month`, `small_note`,`big_note`,`regular_big_note`,`date`, `due_date`,`subtotal`,`sales_tax`,`total`, `prepared_by`, `prepared_date`)
					SELECT `shop_id`, 
						_year, 
						_month, 
						`small_note`,
						`big_note`,
						`regular_big_note`,
						CONCAT(year_,'-',month_,'-01'), 
						LAST_DAY(CONCAT(year_,'-',month_,'-01')),
						_subtotal,
						_salestax,
						_subtotal + _salestax,
						user_id_,
						NOW()
					FROM tbl_invoice WHERE id = monthly_valid_invoice_id;
				
					SET new_invoice_id = LAST_INSERT_ID();
					INSERT INTO tbl_invoice_item(`invoice_id`,`item_name`,`price`,`qty`,`total`,`item_type_id`,`accrual_from_year`,`accrual_from_month`,`accrual_to_year`,`accrual_to_month`)
						SELECT 
							new_invoice_id,
							`item_name`,
							`price`,
							`qty`,
							`total`,
							`item_type_id`,
							`accrual_from_year`,
							`accrual_from_month`,
							`accrual_to_year`,
							`accrual_to_month`			
						FROM  tbl_invoice_item WHERE `invoice_id` = monthly_valid_invoice_id AND `item_type_id` = 2;
				END IF;
			END IF;
			
			UPDATE tbl_shop SET is_paid = 0 WHERE id = _shop_id;
			SET _merchant_id = (SELECT `merchant_id` FROM tbl_shop WHERE `id` = _shop_id);
			IF _merchant_id <> 1 THEN
				SET yearly_valid_invoice_id = (SELECT `id` FROM tbl_merchant_invoice
												WHERE `shop_id` = _shop_id 
													AND DATE_FORMAT(CONCAT(`year`,'-',`month`,'-01'),'%Y-%m-%d') = ADDDATE(CONCAT(year_,'-',month_,'-01'), INTERVAL 0 YEAR));
													
				SET monthly_valid_invoice_id = (SELECT `id` FROM tbl_merchant_invoice WHERE `shop_id` = _shop_id ORDER BY `id` DESC LIMIT 1);
				
				SET previous_yearly_item_count = (SELECT COUNT(tmii.id) FROM tbl_merchant_invoice tmi
													JOIN tbl_merchant_invoice_item tmii ON tmii.invoice_id = tmi.id
												WHERE tmi.shop_id = _shop_id 
													AND tmi.id = yearly_valid_invoice_id
													AND tmii.item_type_id = 1);
				
				SET previous_monthly_item_count = (SELECT COUNT(tmii.id) FROM tbl_merchant_invoice tmi
														JOIN tbl_merchant_invoice_item tmii ON tmii.invoice_id = tmi.id
													WHERE tmi.shop_id = _shop_id 
														AND tmi.id = monthly_valid_invoice_id
														AND tmii.item_type_id = 2);
				SET _subtotal = 0;
				SET _salestax = 0;
				IF previous_yearly_item_count > 0 THEN
					#Calculate the subtotal, sales tax and total for the yearly invoice item
					SET _subtotal = (SELECT SUM(tmii.price * tmii.qty) FROM tbl_merchant_invoice tmi
							JOIN tbl_merchant_invoice_item tmii ON tmii.invoice_id = tmi.id
						WHERE tmi.shop_id = _shop_id 
							AND tmi.id = yearly_valid_invoice_id
							AND tmii.item_type_id = 1);
				END IF;
				
				IF previous_monthly_item_count > 0 THEN
					#Calculate the subtotal, sales tax and total for the monthly invoice item
					SET _subtotal = _subtotal + (SELECT SUM(tmii.price * tmii.qty) FROM tbl_merchant_invoice tmi
							JOIN tbl_merchant_invoice_item tmii ON tmii.invoice_id = tmi.id
						WHERE tmi.shop_id = _shop_id 
							AND tmi.id = monthly_valid_invoice_id
							AND tmii.item_type_id = 2);
				END IF;
				SET _salestax = _subtotal * 0.08;
				
				IF previous_yearly_item_count > 0 OR previous_monthly_item_count > 0 THEN
										
					IF previous_yearly_item_count > 0 THEN
						INSERT INTO tbl_merchant_invoice(`shop_id`,`year`, `month`, `small_note`,`big_note`,`regular_big_note`,`date`, `due_date`,`subtotal`,`sales_tax`,`total`, `prepared_by`, `prepared_date`)
							SELECT `shop_id`, 
								_year_accrual_yearly+1, 
								MONTH(STR_TO_DATE(ADDDATE(CONCAT(_year,'-',_month,'-01'), INTERVAL -1 MONTH),'%Y-%m-%d')),  
								`small_note`,
								`big_note`,
								`regular_big_note`,
								CONCAT(year_,'-',month_,'-01'), 
								LAST_DAY(CONCAT(year_,'-',month_,'-01')),
								_subtotal,
								_salestax,
								_subtotal + _salestax,
								user_id_,
								NOW()
							FROM tbl_merchant_invoice WHERE id = monthly_valid_invoice_id;
					
						SET new_invoice_id = LAST_INSERT_ID();
						INSERT INTO tbl_merchant_invoice_item(`invoice_id`,`item_name`,`price`,`qty`,`total`,`item_type_id`,`accrual_from_year`,`accrual_from_month`,`accrual_to_year`,`accrual_to_month`)
							SELECT 
								new_invoice_id,
								`item_name`,
								`price`,
								`qty`,
								`total`,
								`item_type_id`,
								`accrual_from_year`+1,
								`accrual_from_month`,
								`accrual_to_year`+1,
								`accrual_to_month`			
							FROM  tbl_merchant_invoice_item WHERE `invoice_id` = yearly_valid_invoice_id AND `item_type_id` = 1;
					END IF;
					IF previous_monthly_item_count > 0 THEN
						INSERT INTO tbl_merchant_invoice(`shop_id`,`year`, `month`, `small_note`,`big_note`,`regular_big_note`,`date`, `due_date`,`subtotal`,`sales_tax`,`total`, `prepared_by`, `prepared_date`)
							SELECT `shop_id`, 
								_year, 
								_month, 
								`small_note`,
								`big_note`,
								`regular_big_note`,
								CONCAT(year_,'-',month_,'-01'), 
								LAST_DAY(CONCAT(year_,'-',month_,'-01')),
								_subtotal,
								_salestax,
								_subtotal + _salestax,
								user_id_,
								NOW()
							FROM tbl_merchant_invoice WHERE id = monthly_valid_invoice_id;
					
							SET new_invoice_id = LAST_INSERT_ID();
						INSERT INTO tbl_merchant_invoice_item(`invoice_id`,`item_name`,`price`,`qty`,`total`,`item_type_id`,`accrual_from_year`,`accrual_from_month`,`accrual_to_year`,`accrual_to_month`)
							SELECT 
								new_invoice_id,
								`item_name`,
								`price`,
								`qty`,
								`total`,
								`item_type_id`,
								`accrual_from_year`,
								`accrual_from_month`,
								`accrual_to_year`,
								`accrual_to_month`	
							FROM  tbl_merchant_invoice_item WHERE `invoice_id` = monthly_valid_invoice_id AND `item_type_id` = 2;
					END IF;
				END IF;
			END IF;
		END IF;
		DELETE FROM tbl_temp WHERE `value` = _shop_id;
	 END LOOP read_loop;		  
 CLOSE _shop_cursor;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `receive_payment` */

/*!50003 DROP PROCEDURE IF EXISTS  `receive_payment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`jay`@`%` PROCEDURE `receive_payment`(
	shop_id INT,
	from_year SMALLINT,
	from_month_id TINYINT,
	to_year SMALLINT,
	to_month_id TINYINT,
	amount DECIMAL(20,5),
	received_date DATETIME,
	received_by INT,
	s_invoice_id INT,
	m_invoice_id INT
)
BEGIN
	DECLARE temp_monthId INT;
	DECLARE temp_year INT;
	DECLARE temp_paidMonthId INT;
	DECLARE temp_counter INT;
	DECLARE temp_from_date DATETIME;
	DECLARE temp_to_date DATETIME;
	DECLARE temp_fromMonthIndex TINYINT;
	DECLARE temp_toMonthIndex TINYINT;
	DECLARE temp_month_count TINYINT;
	DECLARE temp_avgAmount DECIMAL(20,5);
	DECLARE temp_tAccrual DECIMAL(20,5);
	DECLARE temp_amount DECIMAL(20,5);
	DECLARE temp_incomeId INT;
	DECLARE temp_isSame TINYINT;
	DECLARE temp_paidAfter TINYINT;
	DECLARE temp_total_cash_income DECIMAL(20,5);
	DECLARE temp_receive_date DATETIME;
	
	DECLARE temp_prepaid DECIMAL(20,5);
	DECLARE temp_total_accrual DECIMAL(20,5);
	DECLARE temp_paid_status TINYINT;
	DECLARE temp_date DATETIME;
	
	DROP TABLE IF EXISTS temp;
	CREATE TEMPORARY TABLE temp (
		`income_id` INT NOT NULL,
		`month_id` TINYINT NOT NULL,
		`year` SMALLINT NOT NULL,
		`total_cash_income` DECIMAL(20,5) NULL,
		`cash_income_month` DECIMAL(20,5) NULL,
		`total_accrual_income` DECIMAL(20,5) NULL,
		`accrual_income_month` DECIMAL(20,5) NULL,
		`prepaid_income` DECIMAL(20,5) NULL	
	);
	
	SET temp_fromMonthIndex = (SELECT fn_getMonthIndex(from_month_id));
	SET temp_from_date = (SELECT DATE_FORMAT(CONCAT(from_year,'-',temp_fromMonthIndex,'-01'),'%Y-%m-%d 00:00:00'));
	
	
	IF to_month_id IS NOT NULL THEN
		SET temp_toMonthIndex = (SELECT fn_getMonthIndex(to_month_id));
		SET temp_to_date = (SELECT DATE_FORMAT(CONCAT(to_year,'-',temp_toMonthIndex,'-01'),'%Y-%m-%d 00:00:00'));
	END IF;
	
	SET temp_receive_date = (SELECT DATE_FORMAT(received_date,'%Y-%m-01 00:00:00'));
	
	Insert into tbl_income(`shop_id`,`from_year`,`from_month_id`,`to_year`,`to_month_id`,`amount`,`received_by`,`received_date`, sinvoice_id, minvoice_id) 
		values(shop_id,from_year,from_month_id,to_year,to_month_id,amount,received_by,received_date,s_invoice_id,m_invoice_id);
		
	SET temp_incomeId = (select LAST_INSERT_ID());
	
	IF temp_receive_date < temp_from_date THEN
		SET temp_paid_status = -1; #prepaid
	ELSEIF temp_receive_date > temp_from_date THEN
		SET temp_paid_status = 1; #postpaid
	ELSE
		SET temp_paid_status = 0; #paid on same month
	END IF;
	
	IF (to_year IS NULL AND to_month_id IS NULL) OR (from_year = to_year AND from_month_id = to_month_id) THEN #payment for one month
		SET temp_monthId = fn_getMonthId(received_date, 0);
		SET temp_year = fn_getYear(received_date, 0);
		
		IF temp_paid_status = -1 THEN #prepaid
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,0,0,amount;
			
			SET temp_total_cash_income = amount;
			
			SET temp_counter = 0;
			SET temp_monthId = 1;
			
			SET temp_year = (SELECT fn_getYear(received_date, 0));
			SET temp_monthId = (SELECT fn_getMonthId(received_date, 0));
			
			IF temp_monthId = 12 THEN
				SET temp_total_cash_income = 0;
			END IF;
			
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_from_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(received_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(received_date, temp_counter));
				
				IF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') = temp_from_date THEN
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,amount,amount,0;
				ELSE 
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,0,0,amount;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
				END IF;
			END WHILE;
			
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,amount,0,0;
			END WHILE;
		ELSEIF temp_paid_status = 0 THEN #paid on same month as invoice
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,amount,amount,0;
				
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,amount,0,amount,0,0;
			END WHILE;
		ELSE #postpaid
			SET temp_monthId = fn_getMonthId(temp_from_date, 0);
			SET temp_year = fn_getYear(temp_from_date, 0);
		
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,0,0,amount,amount,0;
			
			SET temp_total_cash_income = amount;
			SET temp_counter = 0;
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_receive_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
				
				IF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') = temp_receive_date THEN
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,temp_total_cash_income,0,0;
				ELSE
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_cash_income,0,0;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
				END IF;
			END WHILE;
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,amount,0,temp_total_cash_income,0,0;
			END WHILE;
		END IF;
	ELSE #payment for more than one month - payment in range.
		SET temp_monthId = fn_getMonthId(received_date, 0);
		SET temp_year = fn_getYear(received_date, 0);
		
		IF temp_paid_status = -1 THEN #prepaid
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,0,0,amount;
			SET temp_month_count = (TIMESTAMPDIFF(MONTH, temp_from_date, DATE_ADD(temp_to_date,INTERVAL 1 MONTH)));
 			SET temp_avgAmount = amount / temp_month_count;
			
			SET temp_total_cash_income = amount;
			SET temp_amount = amount;
			SET temp_counter = 0;
			SET temp_tAccrual = 0;
			
			SET temp_year = (SELECT fn_getYear(received_date, 0));
			SET temp_monthId = (SELECT fn_getMonthId(received_date, 0));
			
			IF temp_monthId = 12 THEN
				SET temp_total_cash_income = 0;
			END IF;
			
			SET temp_prepaid = amount;
			SET temp_total_accrual = 0;
						
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_to_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(received_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(received_date, temp_counter));
				
				IF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') = temp_from_date THEN
					SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
					SET temp_tAccrual = temp_tAccrual + temp_avgAmount;
					
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,amount - temp_tAccrual;
				ELSEIF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') > temp_from_date THEN
					SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
					SET temp_tAccrual = temp_tAccrual + temp_avgAmount;
					
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,amount - temp_tAccrual;
				ELSE 
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,0,0,amount;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
					SET temp_total_accrual = 0;
				END IF;
				
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
			END WHILE;
			
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,0,0;
			END WHILE;
		ELSEIF temp_paid_status = 0 THEN #paid on same month as invoice
			SET temp_monthId = fn_getMonthId(temp_from_date, 0);
			SET temp_year = fn_getYear(temp_from_date, 0);
			
			SET temp_month_count = (TIMESTAMPDIFF(MONTH, temp_from_date, DATE_ADD(temp_to_date,INTERVAL 1 MONTH)));
 			SET temp_avgAmount = amount / temp_month_count;
 			
 			SET temp_total_cash_income = amount;
 			
 			SET temp_tAccrual = 0;
 			SET temp_prepaid = amount - temp_avgAmount;
			SET temp_total_accrual = temp_avgAmount;
 			
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,temp_total_accrual,temp_avgAmount,temp_prepaid;
			
			SET temp_counter = 0;
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_to_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				SET temp_prepaid = temp_prepaid - temp_avgAmount;
				SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,temp_prepaid;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
					SET temp_total_accrual = 0;
				END IF;
				
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
			END WHILE;
			
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,0,0;
			END WHILE;
		ELSE #postpaid
			SET temp_monthId = fn_getMonthId(temp_from_date, 0);
			SET temp_year = fn_getYear(temp_from_date, 0);
			
			SET temp_month_count = (TIMESTAMPDIFF(MONTH, temp_from_date, DATE_ADD(temp_to_date,INTERVAL 1 MONTH)));
 			SET temp_avgAmount = amount / temp_month_count;
 			
 			SET temp_total_cash_income = amount;
 			
 			SET temp_prepaid = amount;
			SET temp_total_accrual = 0;
			
			SET temp_counter = -1;
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_to_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
				
				SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
				SET temp_prepaid = temp_prepaid - temp_avgAmount;
				
				IF temp_receive_date NOT BETWEEN temp_from_date AND temp_to_date THEN #paid after to date 
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,temp_avgAmount,0;
				ELSE #paid between from and to
					IF temp_date = temp_receive_date THEN
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,amount,temp_total_accrual,temp_avgAmount,temp_prepaid;
					ELSEIF temp_date < temp_receive_date THEN
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,temp_avgAmount,0;
					ELSE
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,temp_prepaid;
					END IF;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
					SET temp_total_accrual = 0;
				END IF;
			END WHILE;
			
			IF temp_receive_date NOT BETWEEN temp_from_date AND temp_to_date THEN #paid after to date 
				SET temp_counter = 0;
				
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, 1));
				SET temp_year = (SELECT fn_getYear(temp_date, 1));
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
				
				WHILE temp_date <= temp_receive_date DO
					IF temp_date = temp_receive_date THEN
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,temp_total_accrual,0,0;
 					ELSE 
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,0,0;
 					END IF;
 					
 					IF temp_monthId = 12 THEN
						SET temp_total_accrual = 0;
					END IF;
 					
 					SET temp_monthId = (SELECT fn_getMonthId(temp_date, 1));
 					SET temp_year = (SELECT fn_getYear(temp_date, 1));
 					
 					SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
 				END WHILE;
 				
 				SET temp_monthId = (SELECT fn_getMonthId(temp_date, -1));
				SET temp_year = (SELECT fn_getYear(temp_date, -1));
 				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
			END IF;
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,0,0;
			END WHILE;
			
		END IF;
	END IF;
	
	insert into `tbl_income_statement` (`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
		SELECT * FROM temp;
	DROP TABLE temp;
END */$$
DELIMITER ;

/* Procedure structure for procedure `receive_payment_test` */

/*!50003 DROP PROCEDURE IF EXISTS  `receive_payment_test` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`jay`@`%` PROCEDURE `receive_payment_test`(
	shop_id INT,
	from_year SMALLINT,
	from_month_id TINYINT,
	to_year SMALLINT,
	to_month_id TINYINT,
	amount DECIMAL(20,5),
	received_date DATETIME,
	received_by INT,
	s_invoice_id INT,
	m_invoice_id INT
)
BEGIN
	DECLARE temp_monthId INT;
	DECLARE temp_year INT;
	DECLARE temp_paidMonthId INT;
	DECLARE temp_counter INT;
	DECLARE temp_from_date DATETIME;
	DECLARE temp_to_date DATETIME;
	DECLARE temp_fromMonthIndex TINYINT;
	DECLARE temp_toMonthIndex TINYINT;
	DECLARE temp_month_count TINYINT;
	DECLARE temp_avgAmount DECIMAL(20,5);
	DECLARE temp_tAccrual DECIMAL(20,5);
	DECLARE temp_amount DECIMAL(20,5);
	DECLARE temp_incomeId INT;
	DECLARE temp_isSame TINYINT;
	DECLARE temp_paidAfter TINYINT;
	DECLARE temp_total_cash_income DECIMAL(20,5);
	DECLARE temp_receive_date DATETIME;
	
	DECLARE temp_prepaid DECIMAL(20,5);
	DECLARE temp_total_accrual DECIMAL(20,5);
	DECLARE temp_paid_status TINYINT;
	DECLARE temp_date DATETIME;
	
	DROP TABLE IF EXISTS temp;
	CREATE TEMPORARY TABLE temp (
		`income_id` INT NOT NULL,
		`month_id` TINYINT NOT NULL,
		`year` SMALLINT NOT NULL,
		`total_cash_income` DECIMAL(20,5) NULL,
		`cash_income_month` DECIMAL(20,5) NULL,
		`total_accrual_income` DECIMAL(20,5) NULL,
		`accrual_income_month` DECIMAL(20,5) NULL,
		`prepaid_income` DECIMAL(20,5) NULL	
	);
	
	SET temp_fromMonthIndex = (SELECT fn_getMonthIndex(from_month_id));
	SET temp_from_date = (SELECT DATE_FORMAT(CONCAT(from_year,'-',temp_fromMonthIndex,'-01'),'%Y-%m-%d 00:00:00'));
	
	
	IF to_month_id IS NOT NULL THEN
		SET temp_toMonthIndex = (SELECT fn_getMonthIndex(to_month_id));
		SET temp_to_date = (SELECT DATE_FORMAT(CONCAT(to_year,'-',temp_toMonthIndex,'-01'),'%Y-%m-%d 00:00:00'));
	END IF;
	
	SET temp_receive_date = (SELECT DATE_FORMAT(received_date,'%Y-%m-01 00:00:00'));
	
	Insert into tbl_income(`shop_id`,`from_year`,`from_month_id`,`to_year`,`to_month_id`,`amount`,`received_by`,`received_date`, sinvoice_id, minvoice_id) 
		values(shop_id,from_year,from_month_id,to_year,to_month_id,amount,received_by,received_date,s_invoice_id,m_invoice_id);
		
	SET temp_incomeId = (select LAST_INSERT_ID());
	
	IF temp_receive_date < temp_from_date THEN
		SET temp_paid_status = -1; #prepaid
	ELSEIF temp_receive_date > temp_from_date THEN
		SET temp_paid_status = 1; #postpaid
	ELSE
		SET temp_paid_status = 0; #paid on same month
	END IF;
	
	IF (to_year IS NULL AND to_month_id IS NULL) OR (from_year = to_year AND from_month_id = to_month_id) THEN #payment for one month
		SET temp_monthId = fn_getMonthId(received_date, 0);
		SET temp_year = fn_getYear(received_date, 0);
		
		IF temp_paid_status = -1 THEN #prepaid
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,0,0,amount;
			
			SET temp_total_cash_income = amount;
			
			SET temp_counter = 0;
			SET temp_monthId = 1;
			
			SET temp_year = (SELECT fn_getYear(received_date, 0));
			SET temp_monthId = (SELECT fn_getMonthId(received_date, 0));
			
			IF temp_monthId = 12 THEN
				SET temp_total_cash_income = 0;
			END IF;
			
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_from_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(received_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(received_date, temp_counter));
				
				IF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') = temp_from_date THEN
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,amount,amount,0;
				ELSE 
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,0,0,amount;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
				END IF;
			END WHILE;
			
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,amount,0,0;
			END WHILE;
		ELSEIF temp_paid_status = 0 THEN #paid on same month as invoice
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,amount,amount,0;
				
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,amount,0,amount,0,0;
			END WHILE;
		ELSE #postpaid
			SET temp_monthId = fn_getMonthId(temp_from_date, 0);
			SET temp_year = fn_getYear(temp_from_date, 0);
		
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,0,0,amount,amount,0;
			
			SET temp_total_cash_income = amount;
			SET temp_counter = 0;
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_receive_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
				
				IF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') = temp_receive_date THEN
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,temp_total_cash_income,0,0;
				ELSE
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_cash_income,0,0;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
				END IF;
			END WHILE;
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,amount,0,temp_total_cash_income,0,0;
			END WHILE;
		END IF;
	ELSE #payment for more than one month - payment in range.
		SET temp_monthId = fn_getMonthId(received_date, 0);
		SET temp_year = fn_getYear(received_date, 0);
		
		IF temp_paid_status = -1 THEN #prepaid
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,0,0,amount;
			SET temp_month_count = (TIMESTAMPDIFF(MONTH, temp_from_date, DATE_ADD(temp_to_date,INTERVAL 1 MONTH)));
 			SET temp_avgAmount = amount / temp_month_count;
			
			SET temp_total_cash_income = amount;
			SET temp_amount = amount;
			SET temp_counter = 0;
			SET temp_tAccrual = 0;
			
			SET temp_year = (SELECT fn_getYear(received_date, 0));
			SET temp_monthId = (SELECT fn_getMonthId(received_date, 0));
			
			IF temp_monthId = 12 THEN
				SET temp_total_cash_income = 0;
			END IF;
			
			SET temp_prepaid = amount;
			SET temp_total_accrual = 0;
						
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_to_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(received_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(received_date, temp_counter));
				
				IF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') = temp_from_date THEN
					SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
					SET temp_tAccrual = temp_tAccrual + temp_avgAmount;
					
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,amount - temp_tAccrual;
				ELSEIF DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') > temp_from_date THEN
					SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
					SET temp_tAccrual = temp_tAccrual + temp_avgAmount;
					
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,amount - temp_tAccrual;
				ELSE 
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,0,0,amount;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
					SET temp_total_accrual = 0;
				END IF;
				
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
			END WHILE;
			
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,0,0;
			END WHILE;
		ELSEIF temp_paid_status = 0 THEN #paid on same month as invoice
			SET temp_monthId = fn_getMonthId(temp_from_date, 0);
			SET temp_year = fn_getYear(temp_from_date, 0);
			
			SET temp_month_count = (TIMESTAMPDIFF(MONTH, temp_from_date, DATE_ADD(temp_to_date,INTERVAL 1 MONTH)));
 			SET temp_avgAmount = amount / temp_month_count;
 			
 			SET temp_total_cash_income = amount;
 			
 			SET temp_tAccrual = 0;
 			SET temp_prepaid = amount - temp_avgAmount;
			SET temp_total_accrual = temp_avgAmount;
 			
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,temp_total_accrual,temp_avgAmount,temp_prepaid;
			
			SET temp_counter = 0;
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_to_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				SET temp_prepaid = temp_prepaid - temp_avgAmount;
				SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,temp_prepaid;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
					SET temp_total_accrual = 0;
				END IF;
				
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
			END WHILE;
			
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,0,0;
			END WHILE;
		ELSE #postpaid
			SET temp_monthId = fn_getMonthId(temp_from_date, 0);
			SET temp_year = fn_getYear(temp_from_date, 0);
			
			SET temp_month_count = (TIMESTAMPDIFF(MONTH, temp_from_date, DATE_ADD(temp_to_date,INTERVAL 1 MONTH)));
 			SET temp_avgAmount = amount / temp_month_count;
 			
 			SET temp_total_cash_income = amount;
 			
 			SET temp_prepaid = amount;
			SET temp_total_accrual = 0;
			
			SET temp_counter = -1;
			WHILE DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00') <> temp_to_date DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
				
				SET temp_total_accrual = temp_total_accrual + temp_avgAmount;
				SET temp_prepaid = temp_prepaid - temp_avgAmount;
				
				IF temp_receive_date NOT BETWEEN temp_from_date AND temp_to_date THEN #paid after to date 
					INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
						SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,temp_avgAmount,0;
				ELSE #paid between from and to
					IF temp_date = temp_receive_date THEN
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,amount,temp_total_accrual,temp_avgAmount,temp_prepaid;
					ELSEIF temp_date < temp_receive_date THEN
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,temp_avgAmount,0;
					ELSE
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,temp_avgAmount,temp_prepaid;
					END IF;
				END IF;
				
				IF temp_monthId = 12 THEN
					SET temp_total_cash_income = 0;
					SET temp_total_accrual = 0;
				END IF;
			END WHILE;
			
			IF temp_receive_date NOT BETWEEN temp_from_date AND temp_to_date THEN #paid after to date 
				SET temp_counter = 0;
				
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, 1));
				SET temp_year = (SELECT fn_getYear(temp_date, 1));
				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
				
				WHILE temp_date <= temp_receive_date DO
					IF temp_date = temp_receive_date THEN
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,amount,amount,temp_total_accrual,0,0;
 					ELSE 
						INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
							SELECT temp_incomeId,temp_monthId,temp_year,0,0,temp_total_accrual,0,0;
 					END IF;
 					
 					IF temp_monthId = 12 THEN
						SET temp_total_accrual = 0;
					END IF;
 					
 					SET temp_monthId = (SELECT fn_getMonthId(temp_date, 1));
 					SET temp_year = (SELECT fn_getYear(temp_date, 1));
 					
 					SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
 				END WHILE;
 				
 				SET temp_monthId = (SELECT fn_getMonthId(temp_date, -1));
				SET temp_year = (SELECT fn_getYear(temp_date, -1));
 				SET temp_date = (SELECT DATE_FORMAT(CONCAT(temp_year,'-',(SELECT fn_getMonthIndex(temp_monthId)), '-01'),'%Y-%m-01 00:00:00'));
			END IF;
			SET temp_counter = 0;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT temp_incomeId,temp_monthId,temp_year,temp_total_cash_income,0,temp_total_accrual,0,0;
			END WHILE;
			
		END IF;
	END IF;
	
	insert into `tbl_income_statement` (`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
		SELECT * FROM temp;
	DROP TABLE temp;
END */$$
DELIMITER ;

/* Procedure structure for procedure `test` */

/*!50003 DROP PROCEDURE IF EXISTS  `test` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`prakash`@`%` PROCEDURE `test`(
	shop_id INT,
	from_year SMALLINT,
	from_month_id TINYINT,
	to_year SMALLINT,
	to_month_id TINYINT,
	amount DECIMAL(20,5),
	received_date DATETIME
)
BEGIN
	DECLARE temp_monthId INT;
	DECLARE temp_year INT;
	DECLARE temp_paidMonthId INT;
	DECLARE temp_counter INT;
	DECLARE temp_from_date DATETIME;
	DECLARE temp_fromMonthIndex TINYINT;
	DECLARE temp_month_count TINYINT;
	DECLARE temp_avgAmount DECIMAL(20,5);
	DECLARE temp_tAccrual DECIMAL(20,5);
	DECLARE temp_amount DECIMAL(20,5);
	
	DROP TABLE IF EXISTS temp;
	CREATE TEMPORARY TABLE temp (
		`income_id` INT NOT NULL,
		`month_id` TINYINT NOT NULL,
		`year` SMALLINT NOT NULL,
		`total_cash_income` DECIMAL(20,5) NULL,
		`cash_income_month` DECIMAL(20,5) NULL,
		`total_accrual_income` DECIMAL(20,5) NULL,
		`accrual_income_month` DECIMAL(20,5) NULL,
		`prepaid_income` DECIMAL(20,5) NULL	
	);
	
	SET temp_monthId = (SELECT fn_getMonthId(received_date, 0));
	SET temp_year = (SELECT fn_getYear(received_date, 0));
	
	SET temp_fromMonthIndex = (SELECT fn_getMonthIndex(from_month_id));
	SET temp_from_date = (SELECT CONCAT(from_year,'-',temp_fromMonthIndex,'-01 00:00:00'));
	INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
		SELECT 1,fn_getMonthId(received_date, 0),fn_getYear(received_date, 0),amount,amount,0,0,amount;
	
	SELECT temp_monthId,temp_year,from_month_id,from_year;
	SET temp_counter = 0;
	
	
	loop_loop: Loop
		SET temp_counter = temp_counter + 1;		
		SET temp_monthId = (SELECT fn_getMonthId(received_date, temp_counter));
		SET temp_year = (SELECT fn_getYear(received_date, temp_counter));
		
		IF temp_monthId = from_month_id AND temp_year = from_year THEN
			LEAVE loop_loop;
		END IF;
		INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
			SELECT 1,temp_monthId,temp_year,amount,0,0,0,amount;			
	end loop loop_loop;
	
		
	IF to_year IS NULL OR to_month_id IS NULL THEN
		if from_month_id = 12 then
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT 1,fn_getMonthId(temp_from_date, 0),fn_getYear(temp_from_date, 0),0,0,amount,amount,0;
			
			SET temp_counter = 0;
			set temp_monthId = 1;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT 1,temp_monthId,temp_year,0,0,amount,0,0;
			END WHILE;
		else
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT 1,fn_getMonthId(temp_from_date, 0),fn_getYear(temp_from_date, 0),amount,0,amount,amount,0;
				
			SET temp_counter = 0;
			SET temp_monthId = from_month_id;
			WHILE temp_monthId < 12 DO
				SET temp_counter = temp_counter + 1;
				SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
				SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
				
				INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
					SELECT 1,temp_monthId,temp_year,amount,0,amount,0,0;
			END WHILE;
		end if;		
	ELSE
		SET temp_amount = amount;
		SET temp_counter = 0;
		SET temp_tAccrual = 0;
		
		SET temp_month_count = (SELECT TIMESTAMPDIFF(MONTH,DATE_FORMAT(CONCAT(from_year,'-',fn_getMonthIndex(from_month_id),'-01 00:00:00'),'%Y-%m-%d'),DATE_ADD(CONCAT(to_year,'-',fn_getMonthIndex(to_month_id),'-01 00:00:00'), INTERVAL 1 MONTH)));
		
		SET temp_avgAmount = amount / temp_month_count;
		
		WHILE temp_counter < temp_month_count DO
			SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
			SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
			
			IF temp_monthId = 1 THEN
				SET amount = 0;
				SET temp_tAccrual = 0;
			END IF;
			
			SET temp_amount = temp_amount - temp_avgAmount;
			SET temp_tAccrual = temp_tAccrual + temp_avgAmount;
			
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT 1,temp_monthId,temp_year,amount,0,temp_tAccrual,temp_avgAmount,temp_amount;
		
			SET temp_counter = temp_counter + 1;
		END WHILE;
		
		WHILE temp_monthId < 12 DO			
			SET temp_monthId = (SELECT fn_getMonthId(temp_from_date, temp_counter));
			SET temp_year = (SELECT fn_getYear(temp_from_date, temp_counter));
						
			INSERT INTO temp(`income_id`,`month_id`,`year`,`total_cash_income`,`cash_income_month`,`total_accrual_income`,`accrual_income_month`,`prepaid_income`)
				SELECT 1,temp_monthId,temp_year,amount,0,temp_tAccrual,0,0;
			SET temp_counter = temp_counter + 1;
		END WHILE;
		
	END IF;
	SELECT t.*,m.name FROM temp t
		join tbl_month m on m.id = t.month_id;
	DROP TABLE temp;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
