CREATE DATABASE  IF NOT EXISTS `mephim` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mephim`;
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `username` varchar(50) NOT NULL,
  `is_enable` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `provider` varchar(20) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `verification_code` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('lchau1',_binary '','$2a$10$dpEwqK/I6sKquk91X2TH9eQy4DjbSJ9RG/Rs7sFU1JhUcHOuVujqG','USPW','2022-10-10',NULL),('lchau10',_binary '','$2a$10$RP/vkcZNNFOneWl6xyXId.qKUoonNxwltmJM7w1jD0JTnrAC6Y7ea','USPW','2022-11-25','1669367256HOCkUoNFLJUdAk2BtXFCCb+tgzmVBzTNbLoZuRKd4+hA8RwsqqO3N8beFrweOP78qYplUuipv+YtWvVJ32/KMQ=='),('lchau11',_binary '','$2a$10$pxzBcw8ThE3fBxRayvZRJu3BNDVaQlAdRabwB5fUIFB3ueRJd7O/6','USPW','2022-11-25','1669367957jUsoxbwhcMOeUYzHh9rcJT7jiLL7RHC23A/hjvRW1/jMkI7jN0+KEKm3Seo32/fDhAGlcONd3Io7V8onGBS0xOX2cjkQWqzQL4kBPcSeiRrrC3Ld/e5di188H+WEZOmN'),('lchau12',_binary '','$2a$10$i/CzrikbFf.isSZj5A6xg.K5zsaOuXVusRF2z4eoeqEN4vaHXVIma','USPW','2022-11-25','1669368136Qgf+ggMdDoUrcm3Prh4Wy1zVqjgR0TZG/wCvF1p78MD4D7DBlMkN6ZGj5DI+J+VcCAwlIhTiYOT/Foi/iRvfpbpBaCO6XKsW3tvUmGoFPbrSvl2m2X+eM0zYpHrY8i6S'),('lchau13',_binary '','$2a$10$lum.uOSiEDgEPYtbo05UquqQuoZJX7WiIUwCSQDvppLG1j4btrGZS','USPW','2022-11-25','1669368201zBsFWN+MJJ2e7Iv1rA4Vcvnxvqi0oLMGj7O2uoLUd/IZHfS3KUZIdxdTav7XDX61e3Xx+/hG8ahDqAmFQXO5Nw=='),('lchau14',_binary '','$2a$10$yav9mSL55T2yezUo7sj6gu5ldZbTvngtcuOQPg4s4h8oX8/p8B6Je','USPW','2022-11-25','1669368886yXGQ2lsH2tRuLDlKMyvZcV/puvSfL9thrHxrEW6MfHWZ/T4HMV+IR5voeLnfVfpB8XwYzuY3qZdFnCuN3d388w=='),('lchau15',_binary '','$2a$10$Kd029xiLh9Y8RgRemByk.u3GPoQOr3vhh5oGa/i8FRZ.Sus6eX91G','USPW','2022-11-25','YbaM8OdIuKd+A+T8o/+45kZVlkF0sk3/3HJS3aUCCiY+sJ6djVjwSmgIOpOQl2P+uGGqGZXSrJJr3p6VcZXcjg=='),('lchau16',_binary '','$2a$10$BRIMQzvvlXmh0gf6RLylB.LgA5EUcvTye5d8euTAjwtWtucPYLqyW','USPW','2022-11-30','2ukyKdZAsDQuoImozE9hQfCA4HUwB7feWl+H4AJjZLTrHPvfF2R9ygU6NU/6dC4dRODEHyrXCOpYOuSG+8feCQ=='),('lchau17',_binary '','$2a$10$sV6L6Gaz1TRBBlCaXIu8oOwKcLgu38NuiNP9IE8ovw/vYewv5QNcW','USPW','2022-11-30','koKLfxOrWxFi+xBcf9WFKklwWBplmX9/fKGMfK4kmPHltcxonKexfal4rgpvEMrKjBoiiKWa4P7MhlBJZUDa8A=='),('lchau2',_binary '','$2a$10$dpEwqK/I6sKquk91X2TH9eQy4DjbSJ9RG/Rs7sFU1JhUcHOuVujqG','USPW','2022-11-25','8C0F6E97FD5E9B90D871A28196FB8BCC'),('lchau3',_binary '','$2a$10$DKFbNB6m93LXz5dyjk/HseBfiQVN/2t6SAP7SSO3Q8QsQCMd2EQT2','USPW','2022-11-25','migQPu7JUKIf2n2Gy0TlHC06pUqC9XCVjqofPDG+0lbmruJNoezjh5WeJvTsV8fNqTiSpUp2gCTcW2qf98t+XA=='),('lchau4',_binary '','$2a$10$aJwbRFWPGSyn1wEwomWZMubY3eSCnxFUY2JZpfsgiooW/4bRIfimy','USPW','2022-11-25','BFpLnHg/chyWLdrjC3D0lktj4dmFo/PZveGl6UKZYu3sMslDAJzfTZNVQG8r+s2/s3MSlvkUScXDATrDZ0jSjQ=='),('lchau5',_binary '','$2a$10$SP9DS2ozDutiw9F8nKHQ/Oupr93SLRy1PKn1tKFbpin/e5mboTWPS','USPW','2022-11-25','gP4IYYO0jWnm6Eh25EzZSGDCmNzKgJeSCrtRTYi58n05ZhhW3XR/kn1OhPx4akI9hqCtnjxD5UL21/pLrUN48g=='),('lchau6',_binary '','$2a$10$z2/U9Lgv5ViTCEQC7tuixehGFTsHzR.k8OomWrH4f/o/Ixvt1Z7Pm','USPW','2022-11-25','16693506917CE0PGMhOA1fAhmEkSG/1diHx4zPIaQF6VG8bOHCy97ssYaoG6slbfNausoNgmkxbLXl+zUUkb/zQwsGjAIU4Q=='),('lchau7',_binary '','$2a$10$9.l2UVRW2ZER3KBKIAQT7OfXg5AgW2JfogjsC6wP.jB3NRhbTwbvG','USPW','2022-11-25','1669350832MOdTHMfv1BpKvd2SLyfjpFvUVT1Qdbi82p2nOmluJpS56owJsY4niuDHLYQLTUtM/A/CoSSRI9odE9eYjt7Vjg=='),('lchau8',_binary '','$2a$10$nmf2p.ZpkZLcqaUFN.n.gegqxi0gpDC1fvmlEqCNnwvFnoE7JVYqS','USPW','2022-11-25','16693654294F51Unpc8IS0Mrfsdinwhz/UBjuYb+u2lUPkOzNqAGdpuzPkXKkq3tOD3id/UAXhoPm9D7aLTfh1QB/dz+9lPg=='),('lchau9',_binary '','$2a$10$yawQhhVGWS9xZh2AKEX1sOgUCrATz1MTjQ6SRvDAS68H6b5.KVmcO','USPW','2022-11-25','1669366449rw+dSfMlqz4djwJiWFcttco+v9Dwbx2YxpSiPx5yh1mCHs9AJF3DPZnxmFrhfuUCMPhHcVH7YoXlObWnG2pX5A==');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_role` (
  `account_role_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`account_role_id`),
  UNIQUE KEY `username` (`username`),
  KEY `FKrs2s3m3039h0xt8d5yhwbuyam` (`role_id`),
  CONSTRAINT `FK6maxca7k70niuh7p1mo6duxx9` FOREIGN KEY (`username`) REFERENCES `account` (`username`),
  CONSTRAINT `FKrs2s3m3039h0xt8d5yhwbuyam` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,'lchau1',1),(2,'lchau2',2);
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

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
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FKm3d0q9s1hos02eamx9wrsupaq` (`booking_status_id`),
  KEY `FK7ryitbom1ln9okwlj2t9tt9ym` (`seat_id`),
  KEY `FKte7386dwsq1v3bgg8bbfe9nuq` (`ticket_id`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  CONSTRAINT `FK7ryitbom1ln9okwlj2t9tt9ym` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKm3d0q9s1hos02eamx9wrsupaq` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`booking_status_id`),
  CONSTRAINT `FKte7386dwsq1v3bgg8bbfe9nuq` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2022-12-25 10:20:20',1,1,1,1),(2,'2022-12-25 22:00:18',1,234,3,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_theater`
--

LOCK TABLES `movie_theater` WRITE;
/*!40000 ALTER TABLE `movie_theater` DISABLE KEYS */;
INSERT INTO `movie_theater` VALUES (1,1,1),(2,2,1),(3,3,2),(4,3,1);
/*!40000 ALTER TABLE `movie_theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_ticket`
--

LOCK TABLES `room_ticket` WRITE;
/*!40000 ALTER TABLE `room_ticket` DISABLE KEYS */;
INSERT INTO `room_ticket` VALUES (1,1,1),(2,2,2),(3,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `show_date` VALUES (1,'2022-12-25'),(2,'2022-12-26'),(3,'2022-12-27'),(4,'2022-12-28'),(5,'2022-12-29'),(6,'2022-12-30');
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
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FKsg7jp0aj6qipr50856wf6vbw1` (`user_id`),
  CONSTRAINT `FKsg7jp0aj6qipr50856wf6vbw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_address` varchar(255) DEFAULT NULL,
  `user_gender` bit(1) DEFAULT NULL,
  `user_mail` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `FK59eglaey3duupxqwk47kv60j2` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Quảng Nam',_binary '','lcahu1@cmcglobal.vn','099444444','lchau1'),(15,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau2'),(16,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau3'),(17,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau4'),(18,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau5'),(19,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau6'),(20,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau7'),(21,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau8'),(22,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau9'),(23,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau10'),(24,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau11'),(25,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau12'),(26,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau13'),(27,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau14'),(28,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau15'),(29,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau16'),(31,'quảng nam',NULL,'conghaule000@gmail.com','099999111','lchau17');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-26  8:59:13
