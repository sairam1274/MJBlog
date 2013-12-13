-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `flaggings`
--

DROP TABLE IF EXISTS `flaggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flaggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flaggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flaggable_id` int(11) DEFAULT NULL,
  `flagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flagger_id` int(11) DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_flaggings_on_flaggable_type_and_flaggable_id` (`flaggable_type`,`flaggable_id`),
  KEY `index_flaggings_on_flag_and_flaggable_type_and_flaggable_id` (`flag`,`flaggable_type`,`flaggable_id`),
  KEY `access_flaggings` (`flagger_type`,`flagger_id`,`flaggable_type`,`flaggable_id`),
  KEY `access_flag_flaggings` (`flag`,`flagger_type`,`flagger_id`,`flaggable_type`,`flaggable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flaggings`
--

LOCK TABLES `flaggings` WRITE;
/*!40000 ALTER TABLE `flaggings` DISABLE KEYS */;
INSERT INTO `flaggings` VALUES (1,'Flit',20,'User',1,'like','2013-09-11 02:37:35','2013-09-11 02:37:35'),(2,'Flit',18,'User',1,'like','2013-09-11 02:37:39','2013-09-11 02:37:39'),(3,'Flit',19,'User',1,'like','2013-09-11 02:37:40','2013-09-11 02:37:40'),(4,'Flit',16,'User',1,'like','2013-09-11 02:37:43','2013-09-11 02:37:43'),(5,'Flit',17,'User',1,'like','2013-09-11 02:37:45','2013-09-11 02:37:45');
/*!40000 ALTER TABLE `flaggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flits`
--

DROP TABLE IF EXISTS `flits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_flits_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flits`
--

LOCK TABLES `flits` WRITE;
/*!40000 ALTER TABLE `flits` DISABLE KEYS */;
INSERT INTO `flits` VALUES (1,1,'It is not every question that deserves an answer\r\n','2013-09-11 02:20:50','2013-09-11 02:20:50'),(5,2,'When we ask for advice, we are usually looking for an accomplice.\r\n','2013-09-11 02:24:47','2013-09-11 02:24:47'),(6,2,'I imagine that yes is the only living thing.\r\n','2013-09-11 02:25:32','2013-09-11 02:25:32'),(7,3,'People happy in love have an air of intensity.\r\n\r\n','2013-09-11 02:27:10','2013-09-11 02:27:10'),(8,3,'Virtue is the fount whence honour springs.','2013-09-11 02:27:49','2013-09-11 02:27:49'),(10,3,'The spring of love becomes hidden and soon filled up.\r\n','2013-09-11 02:28:34','2013-09-11 02:28:34'),(11,3,'Ants are good citizens, they place group interests first.\r\n ','2013-09-11 02:29:02','2013-09-11 02:29:02'),(12,3,'Be obscure clearly','2013-09-11 02:29:17','2013-09-11 02:29:17'),(13,3,'I can live without money, but I cannot live without love.','2013-09-11 02:30:00','2013-09-11 02:30:00'),(14,4,'You can\'t depend on your eyes when your imagination is out of focus.\r\n\r\n','2013-09-11 02:33:03','2013-09-11 02:33:03'),(16,5,'Cabbage: a familiar kitchen-garden vegetable about as large and wise as a man\'s head.','2013-09-11 02:34:47','2013-09-11 02:34:47'),(22,1,'“Be yourself; everyone else is already taken.” ','2013-09-11 11:25:01','2013-09-11 11:25:01'),(23,1,'“You only live once, but if you do it right, once is enough.” \r\n','2013-09-11 11:25:16','2013-09-11 11:25:16'),(34,1,'“Challenges are what make life interesting and overcoming them is what makes life meaningful.”\r\n','2013-09-12 06:15:59','2013-09-12 06:15:59');
/*!40000 ALTER TABLE `flits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_friendships_on_user_id` (`user_id`),
  KEY `index_friendships_on_friend_id` (`friend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (1,2,1,'2013-09-11 02:24:04','2013-09-11 02:24:04'),(2,3,1,'2013-09-11 02:26:31','2013-09-11 02:26:31'),(3,3,2,'2013-09-11 02:26:40','2013-09-11 02:26:40'),(4,4,1,'2013-09-11 02:32:08','2013-09-11 02:32:08'),(5,4,2,'2013-09-11 02:32:18','2013-09-11 02:32:18'),(6,4,3,'2013-09-11 02:32:28','2013-09-11 02:32:28'),(7,5,1,'2013-09-11 02:33:52','2013-09-11 02:33:52'),(8,5,2,'2013-09-11 02:34:00','2013-09-11 02:34:00'),(9,5,3,'2013-09-11 02:34:08','2013-09-11 02:34:08'),(10,5,4,'2013-09-11 02:34:17','2013-09-11 02:34:17'),(12,1,3,'2013-09-11 02:35:48','2013-09-11 02:35:48'),(13,1,4,'2013-09-11 02:35:54','2013-09-11 02:35:54'),(14,1,2,'2013-09-11 02:36:06','2013-09-11 02:36:06'),(15,1,5,'2013-09-11 02:36:14','2013-09-11 02:36:14');
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130805011910'),('20130805013336'),('20130805053600'),('20130824030427'),('20130831052635'),('20130904072147'),('20130911103933'),('20130911104031');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_username` (`username`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kishankabra','kishankabra@gmail.com','$2a$10$bgADqEjakvcx5MCh6T7bguQUL5lYO4y3UrtB8HdS5zoE02jyQR/r6','$2a$10$bgADqEjakvcx5MCh6T7bgu','2013-09-11 02:17:08','2013-09-11 02:17:08'),(2,'manishkabra','manishkabra@gmail.com','$2a$10$gaPOn5ePQR0oWznByfz2Be1B.rLepmRxvgUY/31OtkSX7eSVRXuPO','$2a$10$gaPOn5ePQR0oWznByfz2Be','2013-09-11 02:23:55','2013-09-11 02:23:55'),(3,'vidhikabra','vidhikabra@gmail.com','$2a$10$t7UsvF4ErJGbi/C.TcJV6eus/vqFTe19CGJdRIkGlwjZ5xRx23NrS','$2a$10$t7UsvF4ErJGbi/C.TcJV6e','2013-09-11 02:26:10','2013-09-11 02:26:10'),(4,'vijaykabra','vijay@gmail.com','$2a$10$2sKkxxgFqzJHgjZSHCNh3uOm6duOFOyFThjvmm5hI5ud270wAbr7C','$2a$10$2sKkxxgFqzJHgjZSHCNh3u','2013-09-11 02:31:58','2013-09-11 02:31:58'),(5,'manojlahoti','manoj@gmail.com','$2a$10$VaBqAApiflUr5WM.5n4kqeZfzuUuHq8EUyBJt3AvWRdVtVaEIKlj6','$2a$10$VaBqAApiflUr5WM.5n4kqe','2013-09-11 02:33:45','2013-09-11 02:33:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-12 12:44:25
