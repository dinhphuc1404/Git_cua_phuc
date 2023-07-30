-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
create database mephim;
    use mephim;
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
  `room_seat_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FKm3d0q9s1hos02eamx9wrsupaq` (`booking_status_id`),
  KEY `FKdw2ty72sfj4odjo48snwynfm2` (`room_seat_id`),
  KEY `FKte7386dwsq1v3bgg8bbfe9nuq` (`ticket_id`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  CONSTRAINT `FKdw2ty72sfj4odjo48snwynfm2` FOREIGN KEY (`room_seat_id`) REFERENCES `room_seat` (`room_seat_id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKm3d0q9s1hos02eamx9wrsupaq` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`booking_status_id`),
  CONSTRAINT `FKte7386dwsq1v3bgg8bbfe9nuq` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (7,'2022-11-11 10:05:59',1,1,1,1),(8,'2022-11-11 10:07:21',1,4,1,1),(9,'2022-11-11 10:11:32',1,3,1,1),(10,'2022-11-15 11:59:28',1,3,4,1),(11,'2022-11-15 17:16:46',1,6,1,1),(12,'2022-11-30 17:27:36',1,2,1,1);
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
INSERT INTO `movie` VALUES (1,'Phim việt nam','áa',102,'GIAI ĐIỆU NÀO ANH CŨNG BIẾT TUỐT','https://metiz.vn/media/poster_film/470x700.jpg','https://gggg'),(2,'không có mô tả','Hậu lê',190,'THẾ NHÂN','https://metiz.vn/media/poster_film/teaser_poster_1-other_child.jpg','https://ew'),(3,'wwwww','Haauj',411,'CHIẾN BINH BÁO ĐEN','https://metiz.vn/media/poster_film/black.jpg','http:/sss'),(4,'grgregerg','fweefewe',120,'HẠNH PHÚC MÁU','https://metiz.vn/media/poster_film/310360121_476517321189270_8975759243198345669_n.jpg','qffefe');
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
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'R01'),(2,'R02'),(3,'R03'),(4,'R04'),(5,'R05');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_seat`
--

DROP TABLE IF EXISTS `room_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_seat` (
  `room_seat_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `seat_type_id` int DEFAULT NULL,
  PRIMARY KEY (`room_seat_id`),
  KEY `FKrnxdaq2dmyx7bhm1bjau2ce00` (`room_id`),
  KEY `FKrh7corinwmqm5i0nwabq3n92h` (`seat_id`),
  KEY `FKt7e5yli418l3wcyrv4xt1puli` (`seat_type_id`),
  CONSTRAINT `FKrh7corinwmqm5i0nwabq3n92h` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `FKrnxdaq2dmyx7bhm1bjau2ce00` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FKt7e5yli418l3wcyrv4xt1puli` FOREIGN KEY (`seat_type_id`) REFERENCES `seat_type` (`seat_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_seat`
--

LOCK TABLES `room_seat` WRITE;
/*!40000 ALTER TABLE `room_seat` DISABLE KEYS */;
INSERT INTO `room_seat` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(10,1,10,1),(11,1,11,1),(12,1,12,1),(13,1,13,1),(14,1,14,1),(15,1,15,1),(16,1,16,1),(17,1,17,1),(18,1,18,1),(19,1,19,1),(20,1,20,1),(21,1,21,1),(22,1,22,1),(23,1,23,1),(24,1,24,1),(25,1,25,1),(26,1,26,1),(27,1,27,1),(28,1,28,1),(29,1,29,1),(30,1,30,1),(31,1,31,1),(32,1,32,1),(33,1,33,1),(34,1,34,1),(35,1,35,1),(36,1,36,1),(37,1,37,1),(38,1,38,1),(39,1,39,1),(40,1,40,1),(41,1,41,1),(42,1,42,1),(43,1,43,1),(44,1,44,1),(45,1,45,1),(46,1,46,1),(47,1,47,1),(48,1,48,1),(49,1,49,1),(50,1,50,1),(51,1,51,1),(52,1,52,1),(53,1,53,1),(54,1,54,1),(55,1,55,1),(56,1,56,1),(57,1,57,1),(58,1,58,1),(59,1,59,1),(60,1,60,1),(61,1,61,1),(62,1,62,1),(63,1,63,1),(64,1,64,1),(65,1,65,1),(66,1,66,1),(67,1,67,1),(68,1,68,1),(69,1,69,1),(70,1,70,1),(71,1,71,1),(72,1,72,1),(73,1,73,1),(74,1,74,1),(75,1,75,1),(76,1,76,1),(77,1,77,1),(78,1,78,1),(79,1,79,1),(80,1,80,1),(81,1,81,1),(82,1,82,1),(83,1,83,1),(84,1,84,1),(85,1,85,1),(86,1,86,1),(87,1,87,1),(88,1,88,1),(89,1,89,1),(90,1,90,2),(91,1,91,2),(92,1,92,2),(93,1,93,2),(94,1,94,2),(95,1,95,2),(96,1,96,2),(97,1,97,2),(98,1,98,2),(99,1,99,2),(100,1,100,2),(101,2,1,1),(102,2,2,1),(103,2,3,1),(104,2,4,1),(105,2,5,1),(106,2,6,1),(107,2,7,1),(108,2,8,1),(109,2,9,1),(110,2,10,1),(111,2,11,1),(112,2,12,1),(113,2,13,1),(114,2,14,1),(115,2,15,1),(116,2,16,1),(117,2,17,1),(118,2,18,1),(119,2,19,1),(120,2,20,1),(121,2,21,1),(122,2,22,1),(123,2,23,1),(124,2,24,1),(125,2,25,1),(126,2,26,1),(127,2,27,1),(128,2,28,1),(129,2,29,1),(130,2,30,1),(131,2,31,1),(132,2,32,1),(133,2,33,1),(134,2,34,1),(135,2,35,1),(136,2,36,1),(137,2,37,1),(138,2,38,1),(139,2,39,1),(140,2,40,1),(141,2,41,1),(142,2,42,1),(143,2,43,1),(144,2,44,1),(145,2,45,1),(146,2,46,1),(147,2,47,1),(148,2,48,1),(149,2,49,1),(150,2,50,1),(151,2,51,1),(152,2,52,1),(153,2,53,1),(154,2,54,1),(155,2,55,1),(156,2,56,1),(157,2,57,1),(158,2,58,1),(159,2,59,1),(160,2,60,1),(161,2,61,1),(162,2,62,1),(163,2,63,1),(164,2,64,1),(165,2,65,1),(166,2,66,1),(167,2,67,1),(168,2,68,1),(169,2,69,1),(170,2,70,1),(171,2,71,1),(172,2,72,1),(173,2,73,1),(174,2,74,1),(175,2,75,1),(176,2,76,1),(177,2,77,1),(178,2,78,1),(179,2,79,1),(180,2,80,1),(181,2,81,1),(182,2,82,1),(183,2,83,1),(184,2,84,1),(185,2,85,1),(186,2,86,1),(187,2,87,1),(188,2,88,1),(189,2,89,1),(190,2,90,2),(191,2,91,2),(192,2,92,2),(193,2,93,2),(194,2,94,2),(195,2,95,2),(196,2,96,2),(197,2,97,2),(198,2,98,2),(199,2,99,2),(200,2,100,2),(201,3,1,1),(202,3,2,1),(203,3,3,1),(204,3,4,1),(205,3,5,1),(206,3,6,1),(207,3,7,1),(208,3,8,1),(209,3,9,1),(210,3,10,1),(211,3,11,1),(212,3,12,1),(213,3,13,1),(214,3,14,1),(215,3,15,1),(216,3,16,1),(217,3,17,1),(218,3,18,1),(219,3,19,1),(220,3,20,1),(221,3,21,1),(222,3,22,1),(223,3,23,1),(224,3,24,1),(225,3,25,1),(226,3,26,1),(227,3,27,1),(228,3,28,1),(229,3,29,1),(230,3,30,1),(231,3,31,1),(232,3,32,1),(233,3,33,1),(234,3,34,1),(235,3,35,1),(236,3,36,1),(237,3,37,1),(238,3,38,1),(239,3,39,1),(240,3,40,1),(241,3,41,1),(242,3,42,1),(243,3,43,1),(244,3,44,1),(245,3,45,1),(246,3,46,1),(247,3,47,1),(248,3,48,1),(249,3,49,1),(250,3,50,1),(251,3,51,1),(252,3,52,1),(253,3,53,1),(254,3,54,1),(255,3,55,1),(256,3,56,1),(257,3,57,1),(258,3,58,1),(259,3,59,1),(260,3,60,1),(261,3,61,1),(262,3,62,1),(263,3,63,1),(264,3,64,1),(265,3,65,1),(266,3,66,1),(267,3,67,1),(268,3,68,1),(269,3,69,1),(270,3,70,1),(271,3,71,1),(272,3,72,1),(273,3,73,1),(274,3,74,1),(275,3,75,1),(276,3,76,1),(277,3,77,1),(278,3,78,1),(279,3,79,1),(280,3,80,1),(281,3,81,1),(282,3,82,1),(283,3,83,1),(284,3,84,1),(285,3,85,1),(286,3,86,1),(287,3,87,1),(288,3,88,1),(289,3,89,1),(290,3,90,2),(291,3,91,2),(292,3,92,2),(293,3,93,2),(294,3,94,2),(295,3,95,2),(296,3,96,2),(297,3,97,2),(298,3,98,2),(299,3,99,2),(300,3,100,2),(301,4,1,1),(302,4,2,1),(303,4,3,1),(304,4,4,1),(305,4,5,1),(306,4,6,1),(307,4,7,1),(308,4,8,1),(309,4,9,1),(310,4,10,1),(311,4,11,1),(312,4,12,1),(313,4,13,1),(314,4,14,1),(315,4,15,1),(316,4,16,1),(317,4,17,1),(318,4,18,1),(319,4,19,1),(320,4,20,1),(321,4,21,1),(322,4,22,1),(323,4,23,1),(324,4,24,1),(325,4,25,1),(326,4,26,1),(327,4,27,1),(328,4,28,1),(329,4,29,1),(330,4,30,1),(331,4,31,1),(332,4,32,1),(333,4,33,1),(334,4,34,1),(335,4,35,1),(336,4,36,1),(337,4,37,1),(338,4,38,1),(339,4,39,1),(340,4,40,1),(341,4,41,1),(342,4,42,1),(343,4,43,1),(344,4,44,1),(345,4,45,1),(346,4,46,1),(347,4,47,1),(348,4,48,1),(349,4,49,1),(350,4,50,1),(351,4,51,1),(352,4,52,1),(353,4,53,1),(354,4,54,1),(355,4,55,1),(356,4,56,1),(357,4,57,1),(358,4,58,1),(359,4,59,1),(360,4,60,1),(361,4,61,1),(362,4,62,1),(363,4,63,1),(364,4,64,1),(365,4,65,1),(366,4,66,1),(367,4,67,1),(368,4,68,1),(369,4,69,1),(370,4,70,1),(371,4,71,1),(372,4,72,1),(373,4,73,1),(374,4,74,1),(375,4,75,1),(376,4,76,1),(377,4,77,1),(378,4,78,1),(379,4,79,1),(380,4,80,1),(381,4,81,1),(382,4,82,1),(383,4,83,1),(384,4,84,1),(385,4,85,1),(386,4,86,1),(387,4,87,1),(388,4,88,1),(389,4,89,1),(390,4,90,2),(391,4,91,2),(392,4,92,2),(393,4,93,2),(394,4,94,2),(395,4,95,2),(396,4,96,2),(397,4,97,2),(398,4,98,2),(399,4,99,2),(400,4,100,2),(401,5,1,1),(402,5,2,1),(403,5,3,1),(404,5,4,1),(405,5,5,1),(406,5,6,1),(407,5,7,1),(408,5,8,1),(409,5,9,1),(410,5,10,1),(411,5,11,1),(412,5,12,1),(413,5,13,1),(414,5,14,1),(415,5,15,1),(416,5,16,1),(417,5,17,1),(418,5,18,1),(419,5,19,1),(420,5,20,1),(421,5,21,1),(422,5,22,1),(423,5,23,1),(424,5,24,1),(425,5,25,1),(426,5,26,1),(427,5,27,1),(428,5,28,1),(429,5,29,1),(430,5,30,1),(431,5,31,1),(432,5,32,1),(433,5,33,1),(434,5,34,1),(435,5,35,1),(436,5,36,1),(437,5,37,1),(438,5,38,1),(439,5,39,1),(440,5,40,1),(441,5,41,1),(442,5,42,1),(443,5,43,1),(444,5,44,1),(445,5,45,1),(446,5,46,1),(447,5,47,1),(448,5,48,1),(449,5,49,1),(450,5,50,1),(451,5,51,1),(452,5,52,1),(453,5,53,1),(454,5,54,1),(455,5,55,1),(456,5,56,1),(457,5,57,1),(458,5,58,1),(459,5,59,1),(460,5,60,1),(461,5,61,1),(462,5,62,1),(463,5,63,1),(464,5,64,1),(465,5,65,1),(466,5,66,1),(467,5,67,1),(468,5,68,1),(469,5,69,1),(470,5,70,1),(471,5,71,1),(472,5,72,1),(473,5,73,1),(474,5,74,1),(475,5,75,1),(476,5,76,1),(477,5,77,1),(478,5,78,1),(479,5,79,1),(480,5,80,1),(481,5,81,1),(482,5,82,1),(483,5,83,1),(484,5,84,1),(485,5,85,1),(486,5,86,1),(487,5,87,1),(488,5,88,1),(489,5,89,1),(490,5,90,2),(491,5,91,2),(492,5,92,2),(493,5,93,2),(494,5,94,2),(495,5,95,2),(496,5,96,2),(497,5,97,2),(498,5,98,2),(499,5,99,2),(500,5,100,2);
/*!40000 ALTER TABLE `room_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_ticket`
--

DROP TABLE IF EXISTS `room_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_ticket` (
  `room_ticket_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`room_ticket_id`),
  KEY `FKnhuqgolkqsja9rqm0tgco5qwn` (`ticket_id`),
  KEY `FKgcod7f4j2rhvmy755dsfriprn` (`room_id`),
  CONSTRAINT `FKgcod7f4j2rhvmy755dsfriprn` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FKnhuqgolkqsja9rqm0tgco5qwn` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_ticket`
--

LOCK TABLES `room_ticket` WRITE;
/*!40000 ALTER TABLE `room_ticket` DISABLE KEYS */;
INSERT INTO `room_ticket` VALUES (1,1,1),(2,2,5),(3,3,4),(4,4,3),(5,5,2),(6,8,3);
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
  `seat_column_id` int DEFAULT NULL,
  `seat_row_id` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `FKss8kc7nly5fpmqeuorje3p93` (`seat_column_id`),
  KEY `FKjtoxyj4hlk5gtsaojyskf5wh8` (`seat_row_id`),
  CONSTRAINT `FKjtoxyj4hlk5gtsaojyskf5wh8` FOREIGN KEY (`seat_row_id`) REFERENCES `seat_row` (`row_id`),
  CONSTRAINT `FKss8kc7nly5fpmqeuorje3p93` FOREIGN KEY (`seat_column_id`) REFERENCES `seat_column` (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,2,1),(12,2,2),(13,2,3),(14,2,4),(15,2,5),(16,2,6),(17,2,7),(18,2,8),(19,2,9),(20,2,10),(21,3,1),(22,3,2),(23,3,3),(24,3,4),(25,3,5),(26,3,6),(27,3,7),(28,3,8),(29,3,9),(30,3,10),(31,4,1),(32,4,2),(33,4,3),(34,4,4),(35,4,5),(36,4,6),(37,4,7),(38,4,8),(39,4,9),(40,4,10),(41,5,1),(42,5,2),(43,5,3),(44,5,4),(45,5,5),(46,5,6),(47,5,7),(48,5,8),(49,5,9),(50,5,10),(51,6,1),(52,6,2),(53,6,3),(54,6,4),(55,6,5),(56,6,6),(57,6,7),(58,6,8),(59,6,9),(60,6,10),(61,7,1),(62,7,2),(63,7,3),(64,7,4),(65,7,5),(66,7,6),(67,7,7),(68,7,8),(69,7,9),(70,7,10),(71,8,1),(72,8,2),(73,8,3),(74,8,4),(75,8,5),(76,8,6),(77,8,7),(78,8,8),(79,8,9),(80,8,10),(81,9,1),(82,9,2),(83,9,3),(84,9,4),(85,9,5),(86,9,6),(87,9,7),(88,9,8),(89,9,9),(90,9,10),(91,10,1),(92,10,2),(93,10,3),(94,10,4),(95,10,5),(96,10,6),(97,10,7),(98,10,8),(99,10,9),(100,10,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_column`
--

LOCK TABLES `seat_column` WRITE;
/*!40000 ALTER TABLE `seat_column` DISABLE KEYS */;
INSERT INTO `seat_column` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_row`
--

LOCK TABLES `seat_row` WRITE;
/*!40000 ALTER TABLE `seat_row` DISABLE KEYS */;
INSERT INTO `seat_row` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'I'),(10,'J');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_date`
--

LOCK TABLES `show_date` WRITE;
/*!40000 ALTER TABLE `show_date` DISABLE KEYS */;
INSERT INTO `show_date` VALUES (1,'2022-12-01'),(2,'2022-12-05'),(3,'2022-12-06'),(4,'2022-12-07'),(5,'2022-12-08'),(6,'2022-12-09'),(7,'2022-12-10'),(8,'2022-12-11');
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
INSERT INTO `show_time` VALUES (1,'7:00'),(2,'8:00'),(3,'9:00'),(4,'10:00'),(5,'11:00'),(6,'12:00'),(7,'13:00'),(8,'14:00'),(9,'15:00'),(10,'16:00'),(11,'17:00'),(12,'18:00'),(13,'19:00'),(14,'20:00'),(15,'21:00'),(16,'22:00');
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
  `ticket_price` double DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `show_date_id` int DEFAULT NULL,
  `show_time_id` int DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FK76th994c74fm9ohowlu53yfpx` (`movie_id`),
  KEY `FKmqtp9rsodoshkl8tsnn4mkfns` (`show_date_id`),
  KEY `FKsbhsari8771yntnvt3x9aws8b` (`show_time_id`),
  CONSTRAINT `FK76th994c74fm9ohowlu53yfpx` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FKmqtp9rsodoshkl8tsnn4mkfns` FOREIGN KEY (`show_date_id`) REFERENCES `show_date` (`show_date_id`),
  CONSTRAINT `FKsbhsari8771yntnvt3x9aws8b` FOREIGN KEY (`show_time_id`) REFERENCES `show_time` (`show_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,65000,1,1,6,_binary ''),(2,55000,1,5,9,_binary ''),(3,50000,1,5,3,_binary ''),(4,40000,2,1,7,_binary ''),(5,33000,1,2,5,_binary ''),(6,60000,3,2,2,_binary ''),(7,30000,3,4,1,_binary ''),(8,30000,4,4,5,_binary '');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
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

-- Dump completed on 2022-12-01 17:33:07
