-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: staffmanager
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mFrom` varchar(50) DEFAULT NULL,
  `mTo` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `mDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'20170002','superhema','hi','2021-01-12 13:24:15'),(2,'superhema','20170002','hi','2021-01-12 13:24:31'),(3,'superhema','20170002','aloha','2021-01-12 18:48:30'),(4,'20170002','superhema','aloha','2021-01-12 18:51:21'),(5,'20170002','superhema','try new feature','2021-01-12 18:58:57'),(6,'20170002','superhema','again','2021-01-12 18:59:38'),(7,'superhema','20170002','okay','2021-01-12 19:01:54'),(8,'superhema','20170002','hi','2021-01-12 19:07:13'),(9,'superhema','20170002','hi again','2021-01-12 19:07:23'),(10,'superhema','20170002','hi 3','2021-01-12 19:08:01'),(11,'superhema','20170002','aloha','2021-01-12 19:11:17'),(12,'superhema','20170002','aloha','2021-01-12 19:11:46'),(13,'superhema','20170002','just trying','2021-01-12 19:11:56'),(14,'superhema','20170002','trying again','2021-01-12 19:12:08'),(15,'superhema','20170002','and again','2021-01-12 19:12:19'),(16,'superhema','20170002','asmdkmdas','2021-01-12 19:12:24'),(17,'superhema','20170002','aflsckasdok,adsolkads','2021-01-12 19:12:29'),(18,'superhema','20170002','asdfas','2021-01-12 19:14:12'),(19,'superhema','20170002','everything is working now','2021-01-12 19:14:29'),(20,'superhema','20170002','well done bro','2021-01-12 19:24:48'),(21,'superhema','20170002','hi from 3atef','2021-01-13 15:32:02'),(22,'20170002','superhema','hi from hema','2021-01-13 15:33:42'),(23,'superhema','mans','IS345 : Internet Apps :try feature','2021-01-13 17:50:11'),(24,'superhema',NULL,'IS345 : Internet Apps :hi ','2021-01-13 17:53:27'),(25,'superhema',NULL,'IS345 : Internet Apps :hi ','2021-01-13 17:53:27'),(26,'superhema','mans','IS345 : Internet Apps :alo','2021-01-13 17:57:09');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officehrs`
--

DROP TABLE IF EXISTS `officehrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officehrs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oh_date` date DEFAULT NULL,
  `oh_from` varchar(7) DEFAULT NULL,
  `oh_to` varchar(7) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officehrs`
--

LOCK TABLES `officehrs` WRITE;
/*!40000 ALTER TABLE `officehrs` DISABLE KEYS */;
INSERT INTO `officehrs` VALUES (4,'2021-10-10','1:00am','2:00am','superhema','offline','new building');
/*!40000 ALTER TABLE `officehrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` varchar(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('IS345','Internet Apps');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userName` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('20170002','ibrahim','ibrahemramadan130@gmail.co','hema','ST'),('mans','Ahmed Sayed','ahmedmans@gmail.com','mans','DR'),('superhema','Ibrahim Ramadan','ibrahemramadan130@gmail.com','hema','TA');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sub`
--

DROP TABLE IF EXISTS `user_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sub` (
  `id` varchar(6) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sub`
--

LOCK TABLES `user_sub` WRITE;
/*!40000 ALTER TABLE `user_sub` DISABLE KEYS */;
INSERT INTO `user_sub` VALUES ('IS345','superhema'),('IS345','mans');
/*!40000 ALTER TABLE `user_sub` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-15 17:57:05
