CREATE DATABASE  IF NOT EXISTS `foobar` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `foobar`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: foobar
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fb_message`
--

DROP TABLE IF EXISTS `fb_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fb_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `msg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_body` text,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_name` varchar(45) DEFAULT NULL,
  `msg_subject` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `messagefk_1` (`sender_id`),
  KEY `messagefk_2` (`receiver_id`),
  CONSTRAINT `messagefk_1` FOREIGN KEY (`sender_id`) REFERENCES `fb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messagefk_2` FOREIGN KEY (`receiver_id`) REFERENCES `fb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fb_message`
--

LOCK TABLES `fb_message` WRITE;
/*!40000 ALTER TABLE `fb_message` DISABLE KEYS */;
INSERT INTO `fb_message` VALUES (1,1,'2016-06-13 07:36:47','Tanga',2,NULL,'Tanga'),(2,2,'2016-06-13 07:36:48','Woof Woof',1,NULL,'Lorem Ipsum'),(3,1,'2016-06-13 08:04:34','I never thought that I would see.\r\nA face as ugly as that of thee.\r\nI see it and I feel bereft\r\nOf human decency of none you have left.',2,NULL,'Your Face'),(4,3,'2016-06-13 10:53:22','Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof ',2,NULL,'Woof Woof <3'),(5,2,'2016-06-13 10:54:15','haha lol',1,NULL,'lol'),(6,2,'2016-06-13 10:54:26','Dat is wat u r. A dog',3,NULL,'U r a dog'),(7,3,'2016-06-13 11:06:51','Woof Woof',1,NULL,'Woof'),(8,3,'2016-06-13 11:07:05','Woof Woof Woof Woof',1,NULL,'Woof Woof Woof'),(9,2,'2016-06-13 11:07:33','Lol, what do we do about Borja?',1,NULL,'Re: Borja'),(10,1,'2016-06-13 11:07:56','Umm... do we kill him?',2,NULL,'Re: Borja'),(11,2,'2016-06-13 11:08:15','Yes Please',1,NULL,'Re: Borja'),(12,3,'2016-06-13 11:08:26','WoofWoofWoofWoofWoofWoofWoofWoofWoof',1,NULL,'WoofWoofWoof'),(13,3,'2016-06-13 11:08:33','WoofWoofWoofWoofWoofWoofWoofWoofWoof',2,NULL,'WoofWoof'),(14,2,'2016-06-14 10:29:26','Ei boi u wunt 2 m33t up backstrit. Coz I want u 2 fck me in da ass coz I love Jesus.',3,NULL,'Fuck You'),(15,1,'2016-06-15 03:39:09','Your suxks.\r\n\r\n-Clarcheese',2,NULL,'u sux'),(16,1,'2016-06-15 03:44:20','There\'s a spamming dog here woofing at me and Marc. Good luck. #goldenturtlenecksforever',4,NULL,'Beware'),(17,2,'2016-06-15 03:45:01','There\'s a fucking dog spamming us. Please do not reply to him AKA encourage him.',4,NULL,'Fucking Dog'),(18,3,'2016-06-15 03:45:41','HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN HAIL SATAN ',4,NULL,'HAIL SATAN '),(19,5,'2016-06-15 03:47:12','Bakit may aso?',4,NULL,'Puta'),(20,6,'2016-06-15 04:01:36','Sample',5,NULL,'Sample');
/*!40000 ALTER TABLE `fb_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fb_user`
--

DROP TABLE IF EXISTS `fb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `isLoggedIn` tinyint(1) NOT NULL DEFAULT '0',
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(60) DEFAULT NULL,
  `user_first_name` varchar(45) DEFAULT NULL,
  `user_last_name` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_mail_address` text,
  `create_user_right` tinyint(1) DEFAULT '1',
  `edit_user_right` tinyint(1) DEFAULT '1',
  `delete_user_right` tinyint(1) DEFAULT '1',
  `post_msg_right` tinyint(1) DEFAULT '1',
  `view_msg_right` tinyint(1) DEFAULT '1',
  `delete_msg_right` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fb_user`
--

LOCK TABLES `fb_user` WRITE;
/*!40000 ALTER TABLE `fb_user` DISABLE KEYS */;
INSERT INTO `fb_user` VALUES (1,0,'clarcheese','$2a$10$IsJZVgBLxDJ.MpseVuWAcOZDdQbPfdNwvMnUgF.nAz0PLPdHgSWO6','Clarisse Felicia','Poblete','clarisse@felicia.poblete','33 Clarisse St., Felicia Village, Poblete City',1,1,1,1,1,1),(2,0,'pedro','$2a$10$FAuBTUChy6b9QjtnQIvNrOXL8osnE/hhJVaOOzTz5GwKB0JNJa2I.','Pedro','San','pedro@pedro.pedro','69 Pedro St., Pedro Village, Pedro City',1,1,1,1,1,1),(3,0,'borjadoge','$2a$10$UHVzDZRjl8mPiP7xeI/M.OOjamI45N1s4xekjopsRVCYBl6NUOCIC','Borja','Doge','borja@doge.borjadoge','23 Borja St., Doge Village, Borjadoge City',1,1,1,1,1,1),(4,0,'AldsTM','$2a$10$m6Zp9Od0ZSF29NHKRGaRquECX2wbgMcTynJtGLH55Z6Xw1Ld2iD3G','Alden','Hade','alden@hade.luc','Alden Street, Hade Village, Luc City',1,1,1,1,1,1),(5,0,'JonahSMS','$2a$10$f/xRQC8WZenxzFremFwLsOI/P6Yv7Z5qnoZPRhAM.ZsxSYdgrX06C','Jonah','Syfu','jonah@syfu.com','Jonah Street, Syfu City, Antarctica',1,1,1,1,1,1),(6,0,'Sample','$2a$10$ITZAdVjJVEj7GSkEiR9aveU1FipQ2Nf05zYzCpV4InSIj9YGtU8S.','Sample','Sample','Sample@Sample.Sample','SampleSampleSampleSample',1,1,1,1,1,1),(7,0,'Richard','$2a$10$.pWeEf2xvqm3dJ1t42kNkOA95jd9y0wTwCV7aLP6dU2pice0C4VEC','Richard','Ng','richard@ng.tupangina','Ur Street, Mom Village, Nanay City',1,1,1,1,1,1);
/*!40000 ALTER TABLE `fb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-16 19:18:11
