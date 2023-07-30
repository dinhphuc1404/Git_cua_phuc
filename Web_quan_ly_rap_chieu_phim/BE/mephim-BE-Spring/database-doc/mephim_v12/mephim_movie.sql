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
  `movie_actor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Phim việt nam','áa',102,'GIAI ĐIỆU NÀO ANH CŨNG BIẾT TUỐT','https://metiz.vn/media/poster_film/470x700.jpg','https://gggg',NULL),(2,'không có mô tả','Hậu lê',190,'THẾ THÂN','https://metiz.vn/media/poster_film/teaser_poster_1-other_child.jpg','https://ew',NULL),(3,'wwwww','Haauj',114,'CHIẾN BINH BÁO ĐEN','https://metiz.vn/media/poster_film/black.jpg','http:/sss',NULL),(4,'grgregerg','fweefewe',120,'HẠNH PHÚC MÁU','https://metiz.vn/media/poster_film/310360121_476517321189270_8975759243198345669_n.jpg','qffefe',NULL),(5,'gwegwegwe','hau',120,'hau','https://metiz.vn/media/poster_film/310360121_476517321189270_8975759243198345669_n.jpg','https://123441',NULL),(6,'Phim avartar 2','fewghwh',100,'Avatar 2','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/images%2FMicrosoftTeams-image.png72e80525-fe98-462a-82f2-6ec02a7f804c?alt=media&token=338ec51f-c105-4925-b747-8312988a527d','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/videos%2Ffile_example_MP4_480_1_5MG.mp45a33af20-a3d0-4c37-82d3-195cd322b14e?alt=media&token=cc4ccde6-1666-4533-b742-8342e34189a9',NULL),(7,'fewf','ewq',12,'efwfwef','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/images%2FOrders%20pending.pnge4c0addc-054a-4f6f-a4ec-138e92443798?alt=media&token=0d4bd483-8e55-4bf9-abfb-4c313138263c','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/videos%2Ffile_example_MP4_480_1_5MG.mp4896df3dd-c542-4b67-ac8f-69586cead861?alt=media&token=ec243d7d-442f-4472-8891-a44d24990617',NULL),(8,'rwqrwq','534',3252,'212421fewg','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/images%2Fqz2.png4e67755f-27b8-42f3-a515-6dca039e966d?alt=media&token=dfd14aa5-7722-4a1b-b194-d1827e916479','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/videos%2Ffile_example_MP4_480_1_5MG.mp451e6e149-7414-4160-bf46-8afe49a0ac67?alt=media&token=2b0c8a26-8517-4cc6-9208-5c051d9f90f3',NULL),(9,'ewwtewtw','rewrew',120,'Lê Tuấn Anh','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/images%2FMicrosoftTeams-image%20(6).png5f4eb47e-8c18-43b7-bc50-0b500e04d195?alt=media&token=19e316bf-f046-468c-9eda-a473f2fe6492','https://firebasestorage.googleapis.com/v0/b/mephim-cf569.appspot.com/o/videos%2Ffile_example_MP4_480_1_5MG.mp453a0981f-f7a1-412b-93ce-0917225b6496?alt=media&token=7e253a03-b7be-42c6-a4bb-b1ac499424fd',NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
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
