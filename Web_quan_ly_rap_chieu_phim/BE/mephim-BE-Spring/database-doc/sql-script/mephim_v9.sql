-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: mephim
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `actor_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Trần Anh Hùng'),(2,'Vũ Ngọc Đãng'),(3,'Nguyễn Quang Dũng'),(4,'Charlie Nguyễn');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `time` varchar(255) DEFAULT NULL,
  `booking_status_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FKm3d0q9s1hos02eamx9wrsupaq` (`booking_status_id`),
  KEY `FK7ryitbom1ln9okwlj2t9tt9ym` (`seat_id`),
  KEY `FKte7386dwsq1v3bgg8bbfe9nuq` (`ticket_id`),
  KEY `FK7udbel7q86k041591kj6lfmvw` (`user_id`),
  CONSTRAINT `FK7ryitbom1ln9okwlj2t9tt9ym` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `FK7udbel7q86k041591kj6lfmvw` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKm3d0q9s1hos02eamx9wrsupaq` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`booking_status_id`),
  CONSTRAINT `FKte7386dwsq1v3bgg8bbfe9nuq` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2022-12-25 10:20:20',1,1,1,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_status` (
  `booking_status_id` int NOT NULL AUTO_INCREMENT,
  `booking_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'PENDING'),(2,'APPROVAL');
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tình cảm'),(2,'Kinh dị');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `movie_description` varchar(255) DEFAULT NULL,
  `movie_director` varchar(255) DEFAULT NULL,
  `movie_length` int DEFAULT NULL,
  `movie_name` varchar(255) DEFAULT NULL,
  `movie_poster` varchar(255) DEFAULT NULL,
  `movie_trailer_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Phim việt nam','áa',102,'GIAI ĐIỆU NÀO ANH CŨNG BIẾT TUỐT','https://metiz.vn/media/poster_film/470x700.jpg','https://gggg'),(2,'không có mô tả','Hậu lê',190,'THẾ THÂN','https://metiz.vn/media/poster_film/teaser_poster_1-other_child.jpg','https://ew'),(3,'wwwww','Haauj',114,'CHIẾN BINH BÁO ĐEN','https://metiz.vn/media/poster_film/black.jpg','http:/sss'),(4,'grgregerg','fweefewe',120,'HẠNH PHÚC MÁU','https://metiz.vn/media/poster_film/310360121_476517321189270_8975759243198345669_n.jpg','qffefe');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_actor` (
  `movie_actor_id` int NOT NULL AUTO_INCREMENT,
  `actor_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`movie_actor_id`),
  KEY `FK69qnqd5hnjn2aykvxcj72r9i5` (`actor_id`),
  KEY `FKhedvt8u16luotgyoel4fqy7t1` (`movie_id`),
  CONSTRAINT `FK69qnqd5hnjn2aykvxcj72r9i5` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`),
  CONSTRAINT `FKhedvt8u16luotgyoel4fqy7t1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_category`
--

DROP TABLE IF EXISTS `movie_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_category` (
  `movie_category_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`movie_category_id`),
  KEY `FKhkem46gi7yq1019e1j8hlvp9y` (`category_id`),
  KEY `FKdhlw8bp2rx2bhkp1orkg12lor` (`movie_id`),
  CONSTRAINT `FKdhlw8bp2rx2bhkp1orkg12lor` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FKhkem46gi7yq1019e1j8hlvp9y` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_category`
--

LOCK TABLES `movie_category` WRITE;
/*!40000 ALTER TABLE `movie_category` DISABLE KEYS */;
INSERT INTO `movie_category` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `movie_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_theater`
--

DROP TABLE IF EXISTS `movie_theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_theater` (
  `movie_theater_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `theater_id` int DEFAULT NULL,
  PRIMARY KEY (`movie_theater_id`),
  KEY `FK4iu5m1w1sbkrb40kleje7d2yi` (`movie_id`),
  KEY `FKa73254j4n90a4emh301u7juwj` (`theater_id`),
  CONSTRAINT `FK4iu5m1w1sbkrb40kleje7d2yi` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FKa73254j4n90a4emh301u7juwj` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_theater`
--

LOCK TABLES `movie_theater` WRITE;
/*!40000 ALTER TABLE `movie_theater` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r4k4edos30bx9neoq81mdvwph` (`token`),
  KEY `FKjtx87i0jvq2svedphegvdwcuy` (`user_id`),
  CONSTRAINT `FKjtx87i0jvq2svedphegvdwcuy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES (1,'2022-12-27 21:34:49.253000','af27e0be-b23f-4b5c-84d1-fd2ce132cc74',1),(2,'2022-12-27 21:35:27.148000','91ebc541-b99e-4074-83ae-c1c8af75b9ea',1),(3,'2022-12-27 21:49:41.134000','ec21dc1b-46e7-4d64-b4a6-1e3073477773',1),(4,'2022-12-27 21:53:47.410000','58dc3d97-712c-4a70-b90e-3848141139b2',1),(5,'2022-12-27 22:08:23.471000','7233d365-e28e-4f85-b531-46cd246a1e50',1),(6,'2022-12-27 23:03:06.642000','5cbd957d-da82-4a0e-89fb-abaf852cd032',1),(7,'2022-12-27 23:04:01.395000','0785cd1c-3d4c-41f9-abb2-154a7419217d',3),(8,'2022-12-27 23:05:17.540000','1799f236-a769-4b33-8b0a-d14816703e5e',4);
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MODERATOR'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) DEFAULT NULL,
  `total_column` int DEFAULT NULL,
  `total_row` int DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'R01',10,10),(2,'R02',12,10),(3,'R03',4,4),(4,'R04',NULL,NULL),(5,'R05',NULL,NULL),(6,'R06',NULL,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_ticket`
--

DROP TABLE IF EXISTS `room_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_ticket` (
  `room_ticket_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  PRIMARY KEY (`room_ticket_id`),
  KEY `FKgcod7f4j2rhvmy755dsfriprn` (`room_id`),
  KEY `FKnhuqgolkqsja9rqm0tgco5qwn` (`ticket_id`),
  CONSTRAINT `FKgcod7f4j2rhvmy755dsfriprn` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FKnhuqgolkqsja9rqm0tgco5qwn` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_ticket`
--

LOCK TABLES `room_ticket` WRITE;
/*!40000 ALTER TABLE `room_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int DEFAULT NULL,
  `seat_column_id` int DEFAULT NULL,
  `seat_row_id` int DEFAULT NULL,
  `seat_type_id` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `FKd7f42843rt05tt66t6vcb7s9u` (`room_id`),
  KEY `FKss8kc7nly5fpmqeuorje3p93` (`seat_column_id`),
  KEY `FKjtoxyj4hlk5gtsaojyskf5wh8` (`seat_row_id`),
  KEY `FKd4mx49q62bd2apkk2rfkl8l9w` (`seat_type_id`),
  CONSTRAINT `FKd4mx49q62bd2apkk2rfkl8l9w` FOREIGN KEY (`seat_type_id`) REFERENCES `seat_type` (`seat_type_id`),
  CONSTRAINT `FKd7f42843rt05tt66t6vcb7s9u` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FKjtoxyj4hlk5gtsaojyskf5wh8` FOREIGN KEY (`seat_row_id`) REFERENCES `seat_row` (`row_id`),
  CONSTRAINT `FKss8kc7nly5fpmqeuorje3p93` FOREIGN KEY (`seat_column_id`) REFERENCES `seat_column` (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1,1,1),(2,1,1,2,1),(3,1,1,3,1),(4,1,1,4,1),(5,1,1,5,1),(6,1,1,6,1),(7,1,1,7,1),(8,1,1,8,1),(9,1,1,9,1),(10,1,1,10,1),(11,1,2,1,1),(12,1,2,2,1),(13,1,2,3,1),(14,1,2,4,1),(15,1,2,5,1),(16,1,2,6,1),(17,1,2,7,1),(18,1,2,8,1),(19,1,2,9,1),(20,1,2,10,1),(21,1,3,1,1),(22,1,3,2,1),(23,1,3,3,1),(24,1,3,4,1),(25,1,3,5,1),(26,1,3,6,1),(27,1,3,7,1),(28,1,3,8,1),(29,1,3,9,1),(30,1,3,10,1),(31,1,4,1,1),(32,1,4,2,1),(33,1,4,3,1),(34,1,4,4,1),(35,1,4,5,1),(36,1,4,6,1),(37,1,4,7,1),(38,1,4,8,1),(39,1,4,9,1),(40,1,4,10,1),(41,1,5,1,1),(42,1,5,2,1),(43,1,5,3,1),(44,1,5,4,1),(45,1,5,5,1),(46,1,5,6,1),(47,1,5,7,1),(48,1,5,8,1),(49,1,5,9,1),(50,1,5,10,1),(51,1,6,1,1),(52,1,6,2,1),(53,1,6,3,1),(54,1,6,4,1),(55,1,6,5,1),(56,1,6,6,1),(57,1,6,7,1),(58,1,6,8,1),(59,1,6,9,1),(60,1,6,10,1),(61,1,7,1,1),(62,1,7,2,1),(63,1,7,3,1),(64,1,7,4,1),(65,1,7,5,1),(66,1,7,6,1),(67,1,7,7,1),(68,1,7,8,1),(69,1,7,9,1),(70,1,7,10,1),(71,1,8,1,1),(72,1,8,2,1),(73,1,8,3,1),(74,1,8,4,1),(75,1,8,5,1),(76,1,8,6,1),(77,1,8,7,1),(78,1,8,8,1),(79,1,8,9,1),(80,1,8,10,1),(81,1,9,1,1),(82,1,9,2,1),(83,1,9,3,1),(84,1,9,4,1),(85,1,9,5,1),(86,1,9,6,1),(87,1,9,7,1),(88,1,9,8,1),(89,1,9,9,1),(90,1,9,10,1),(91,1,10,1,2),(92,1,10,2,2),(93,1,10,3,2),(94,1,10,4,2),(95,1,10,5,2),(96,1,10,6,2),(97,1,10,7,2),(98,1,10,8,2),(99,1,10,9,2),(100,1,10,10,2),(101,2,1,1,1),(102,2,1,2,1),(103,2,1,3,1),(104,2,1,4,1),(105,2,1,5,1),(106,2,1,6,1),(107,2,1,7,1),(108,2,1,8,1),(109,2,1,9,1),(110,2,1,10,1),(111,2,1,11,1),(112,2,1,12,1),(113,2,2,1,1),(114,2,2,2,1),(115,2,2,3,1),(116,2,2,4,1),(117,2,2,5,1),(118,2,2,6,1),(119,2,2,7,1),(120,2,2,8,1),(121,2,2,9,1),(122,2,2,10,1),(123,2,2,11,1),(124,2,2,12,1),(125,2,3,1,1),(126,2,3,2,1),(127,2,3,3,1),(128,2,3,4,1),(129,2,3,5,1),(130,2,3,6,1),(131,2,3,7,1),(132,2,3,8,1),(133,2,3,9,1),(134,2,3,10,1),(135,2,3,11,1),(136,2,3,12,1),(137,2,4,1,1),(138,2,4,2,1),(139,2,4,3,1),(140,2,4,4,1),(141,2,4,5,1),(142,2,4,6,1),(143,2,4,7,1),(144,2,4,8,1),(145,2,4,9,1),(146,2,4,10,1),(147,2,4,11,1),(148,2,4,12,1),(149,2,5,1,1),(150,2,5,2,1),(151,2,5,3,1),(152,2,5,4,1),(153,2,5,5,1),(154,2,5,6,1),(155,2,5,7,1),(156,2,5,8,1),(157,2,5,9,1),(158,2,5,10,1),(159,2,5,11,1),(160,2,5,12,1),(161,2,6,1,1),(162,2,6,2,1),(163,2,6,3,1),(164,2,6,4,1),(165,2,6,5,1),(166,2,6,6,1),(167,2,6,7,1),(168,2,6,8,1),(169,2,6,9,1),(170,2,6,10,1),(171,2,6,11,1),(172,2,6,12,1),(173,2,7,1,1),(174,2,7,2,1),(175,2,7,3,1),(176,2,7,4,1),(177,2,7,5,1),(178,2,7,6,1),(179,2,7,7,1),(180,2,7,8,1),(181,2,7,9,1),(182,2,7,10,1),(183,2,7,11,1),(184,2,7,12,1),(185,2,8,1,1),(186,2,8,2,1),(187,2,8,3,1),(188,2,8,4,1),(189,2,8,5,1),(190,2,8,6,1),(191,2,8,7,1),(192,2,8,8,1),(193,2,8,9,1),(194,2,8,10,1),(195,2,8,11,1),(196,2,8,12,1),(197,2,9,1,1),(198,2,9,2,1),(199,2,9,3,1),(200,2,9,4,1),(201,2,9,5,1),(202,2,9,6,1),(203,2,9,7,1),(204,2,9,8,1),(205,2,9,9,1),(206,2,9,10,1),(207,2,9,11,1),(208,2,9,12,1),(209,2,10,1,2),(210,2,10,2,2),(211,2,10,3,2),(212,2,10,4,2),(213,2,10,5,2),(214,2,10,6,2),(215,2,10,7,2),(216,2,10,8,2),(217,2,10,9,2),(218,2,10,10,2),(219,2,10,11,2),(220,2,10,12,2),(221,3,1,1,1),(222,3,1,2,1),(223,3,1,3,1),(224,3,1,4,1),(225,3,2,1,1),(226,3,2,2,1),(227,3,2,3,1),(228,3,2,4,1),(229,3,3,1,1),(230,3,3,2,1),(231,3,3,3,1),(232,3,3,4,1),(233,3,4,1,1),(234,3,4,2,1),(235,3,4,3,1),(236,3,4,4,1);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_column`
--

DROP TABLE IF EXISTS `seat_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_column` (
  `column_id` int NOT NULL AUTO_INCREMENT,
  `column_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_column`
--

LOCK TABLES `seat_column` WRITE;
/*!40000 ALTER TABLE `seat_column` DISABLE KEYS */;
INSERT INTO `seat_column` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'11'),(12,'12'),(13,'13'),(14,'14'),(15,'15');
/*!40000 ALTER TABLE `seat_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_row`
--

DROP TABLE IF EXISTS `seat_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_row` (
  `row_id` int NOT NULL AUTO_INCREMENT,
  `row_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_row`
--

LOCK TABLES `seat_row` WRITE;
/*!40000 ALTER TABLE `seat_row` DISABLE KEYS */;
INSERT INTO `seat_row` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'I'),(10,'J'),(11,'J'),(12,'K'),(13,'L'),(14,'M'),(15,'N'),(16,'O');
/*!40000 ALTER TABLE `seat_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_type`
--

DROP TABLE IF EXISTS `seat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_type` (
  `seat_type_id` int NOT NULL AUTO_INCREMENT,
  `seat_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seat_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_type`
--

LOCK TABLES `seat_type` WRITE;
/*!40000 ALTER TABLE `seat_type` DISABLE KEYS */;
INSERT INTO `seat_type` VALUES (1,'STANDARD'),(2,'VIP');
/*!40000 ALTER TABLE `seat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_date`
--

DROP TABLE IF EXISTS `show_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_date` (
  `show_date_id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`show_date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_date`
--

LOCK TABLES `show_date` WRITE;
/*!40000 ALTER TABLE `show_date` DISABLE KEYS */;
INSERT INTO `show_date` VALUES (1,'2022-12-26'),(2,'2022-12-27'),(3,'2022-12-28'),(4,'2022-12-29'),(5,'2022-12-30'),(6,'2022-12-31');
/*!40000 ALTER TABLE `show_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_time`
--

DROP TABLE IF EXISTS `show_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_time` (
  `show_time_id` int NOT NULL AUTO_INCREMENT,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`show_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_time`
--

LOCK TABLES `show_time` WRITE;
/*!40000 ALTER TABLE `show_time` DISABLE KEYS */;
INSERT INTO `show_time` VALUES (1,'07:00'),(2,'08:00'),(3,'09:00'),(4,'10:00'),(5,'11:00'),(6,'12:00'),(7,'13:00'),(8,'14:00'),(9,'15:00'),(10,'16:00'),(11,'17:00'),(12,'18:00'),(13,'19:00'),(14,'20:00'),(15,'21:00'),(16,'22:00');
/*!40000 ALTER TABLE `show_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `theater_id` int NOT NULL AUTO_INCREMENT,
  `theater_address` varchar(255) DEFAULT NULL,
  `theater_description` varchar(255) DEFAULT NULL,
  `theater_name` varchar(255) DEFAULT NULL,
  `theater_group_id` int DEFAULT NULL,
  PRIMARY KEY (`theater_id`),
  KEY `FKo4n1rkianiepvw56yvoyph2hq` (`theater_group_id`),
  CONSTRAINT `FKo4n1rkianiepvw56yvoyph2hq` FOREIGN KEY (`theater_group_id`) REFERENCES `theater_group` (`theater_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'Đà Nẵng',NULL,'Galaxy đà nẵng',1),(2,'Quảng Ngãi',NULL,'Galaxy quảng ngãi',1);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_group`
--

DROP TABLE IF EXISTS `theater_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater_group` (
  `theater_group_id` int NOT NULL AUTO_INCREMENT,
  `theater_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`theater_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_group`
--

LOCK TABLES `theater_group` WRITE;
/*!40000 ALTER TABLE `theater_group` DISABLE KEYS */;
INSERT INTO `theater_group` VALUES (1,'GALAXY CINEMA'),(2,'LOTTE CINEMA');
/*!40000 ALTER TABLE `theater_group` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`ticket_id`),
  KEY `FK76th994c74fm9ohowlu53yfpx` (`movie_id`),
  KEY `FKmqtp9rsodoshkl8tsnn4mkfns` (`show_date_id`),
  KEY `FKsbhsari8771yntnvt3x9aws8b` (`show_time_id`),
  CONSTRAINT `FK76th994c74fm9ohowlu53yfpx` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FKmqtp9rsodoshkl8tsnn4mkfns` FOREIGN KEY (`show_date_id`) REFERENCES `show_date` (`show_date_id`),
  CONSTRAINT `FKsbhsari8771yntnvt3x9aws8b` FOREIGN KEY (`show_time_id`) REFERENCES `show_time` (`show_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,_binary '',60000,1,1,1),(2,_binary '',55000,2,1,1),(3,_binary '',45000,2,1,5);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `transaction_date` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FKanjpo5tiapru7an6cw4cu37y4` (`user_id`),
  CONSTRAINT `FKanjpo5tiapru7an6cw4cu37y4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `is_enable` bit(1) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `provider` varchar(20) DEFAULT NULL,
  `register_date` datetime(6) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `verification_code` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lchau1@cmcglobal.vn',_binary '','$2a$10$FEomJdD38EA2qc0iqs/UBe9HCylCog1WtOvF0OPOdU91PdVGmI4UG',NULL,'REGISTER','2022-12-27 21:32:20.230000','lchau1',NULL),(2,'lchau2@cmcglobal.vn',_binary '','$2a$10$3jgOvHLFu2Bc6LkI/FbmyOxRG23mer/U7XnSHJ9a.GMRr2368GDLe',NULL,'REGISTER','2022-12-27 21:58:36.535000','lchau2',NULL),(3,'lchau3@cmcglobal.vn',_binary '','$2a$10$UQCjFZ/1sK4BHRmhAilPluFPJ/kmKOgU/SZqrqLWxz9x2ZowyhSoq',NULL,'REGISTER','2022-12-27 23:01:54.485000','lchau3',NULL),(4,'lchau4@cmcglobal.vn',_binary '','$2a$10$6fKaAMJ2aGNbmdLloXntV.AVo6p7OyUVSbmkeFUIBcGL95XOWoyuO',NULL,'REGISTER','2022-12-27 23:03:07.923000','lchau4',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mephim'
--

--
-- Dumping routines for database 'mephim'
--
/*!50003 DROP PROCEDURE IF EXISTS `findSeatWithTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findSeatWithTicket`(
   showDateid int,
   showTimeId int,
   ticketId int
)
BEGIN 
   select * from (
	with TEMP_room_seat AS (
	select seat.seat_id, concat(seat_column.column_name,seat_row.row_name) as `seat_name`, 
	seat_type.seat_type_name as `seat_type`, true as `is_booking` from seat inner join booking
	on seat.seat_id = booking.seat_id
	inner join room inner join room_ticket inner join ticket inner join seat_column inner join seat_row inner join seat_type
	where seat.room_id = room.room_id
	and room.room_id = room_ticket.room_id
	and room_ticket.ticket_id = ticket.ticket_id
	and seat.seat_row_id = seat_row.row_id
	and seat.seat_column_id = seat_column.column_id
	and seat.seat_type_id = seat_type.seat_type_id
	and ticket.show_date_id = showDateid
	and ticket.show_time_id = showTimeId
	and booking.ticket_id = ticketId)
	select * from TEMP_room_seat
	union
	(select seat.seat_id, concat(seat_column.column_name,seat_row.row_name) as `seat_name`,
	seat_type.seat_type_name as `seat_type`, false as `is_booking` from seat
	inner join room inner join room_ticket inner join ticket inner join seat_column inner join seat_row inner join seat_type
	where seat.room_id = room.room_id
	and room.room_id = room_ticket.room_id
	and room_ticket.ticket_id = ticket.ticket_id
	and seat.seat_row_id = seat_row.row_id
	and seat.seat_column_id = seat_column.column_id
	and seat.seat_type_id = seat_type.seat_type_id
	and ticket.show_date_id = showDateid
	and ticket.show_time_id = showTimeId
	and ticket.ticket_id = ticketId
	and seat.seat_id not in (select TEMP_room_seat.seat_id from TEMP_room_seat))) as a
	order by a.seat_id asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-28  8:52:19
