CREATE DATABASE  IF NOT EXISTS `mephim` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mephim`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: mephim
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `ticket_price` bigint DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `show_date_id` int DEFAULT NULL,
  `show_time_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FK76th994c74fm9ohowlu53yfpx` (`movie_id`),
  KEY `FKmqtp9rsodoshkl8tsnn4mkfns` (`show_date_id`),
  KEY `FKsbhsari8771yntnvt3x9aws8b` (`show_time_id`),
  KEY `FKs8pj7bey0vnj1rf9tk5689pbt` (`room_id`),
  CONSTRAINT `FK76th994c74fm9ohowlu53yfpx` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FKmqtp9rsodoshkl8tsnn4mkfns` FOREIGN KEY (`show_date_id`) REFERENCES `show_date` (`show_date_id`),
  CONSTRAINT `FKs8pj7bey0vnj1rf9tk5689pbt` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FKsbhsari8771yntnvt3x9aws8b` FOREIGN KEY (`show_time_id`) REFERENCES `show_time` (`show_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,_binary '',60000,1,1,1,1),(2,_binary '',55000,2,1,1,1),(3,_binary '',45000,2,1,5,1),(4,_binary '',88000,2,2,1,1),(5,_binary '',44666,2,5,1,3),(6,_binary '',52355,2,1,1,2),(7,_binary '',44000,1,3,2,2),(8,_binary '',77000,1,2,6,3),(9,_binary '',22000,1,2,15,3),(10,_binary '',33000,1,2,8,3),(11,_binary '',70000,1,2,10,3),(12,_binary '',34000,2,2,5,1),(13,_binary '',40000,2,3,5,1),(14,_binary '',4000,1,1,4,3),(15,_binary '',4000,1,3,4,3),(16,_binary '',4000,1,3,7,3),(17,_binary '',4000,1,4,7,3),(18,_binary '',4000,2,4,7,6),(19,_binary '',4000,4,1,6,2),(20,_binary '',4000,5,1,6,3),(21,_binary '',4000,5,3,1,3),(22,_binary '',52355,6,5,3,2),(23,_binary '',52355,6,5,6,2),(24,_binary '',52355,6,5,10,1),(25,_binary '',52355,6,5,12,3),(36,_binary '',52355,6,6,1,2),(37,_binary '',52355,1,6,1,3),(38,_binary '',52355,4,6,7,3),(39,_binary '',52355,6,6,7,2),(40,_binary '',52355,5,6,7,1),(41,_binary '',52355,7,6,7,4),(42,_binary '',52355,8,6,7,5),(43,_binary '',52355,3,6,7,6),(44,_binary '',52355,9,6,11,2);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05 17:23:27
