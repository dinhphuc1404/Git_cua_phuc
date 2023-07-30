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
  `available_point` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'leconghau905@gmail.com',_binary '\0','$2a$10$7dTVKPQYAUFeJZsXm03aduId6hj6v178.kjacI4fQgBNPil5a9IXe',NULL,'REGISTER','2023-01-02 20:55:02.109000','leconghau905','Doh7mSpSAgSMTC8qQPZZEWlTTH79WaIlKRZH7r2vdYMFzXLCzM',NULL),(6,'leconghau095@gmail.com',_binary '','$2a$10$yOhbMlB/w3V4ya9ECJTVLOKdV3Lo0RQQoqAKN03V2gelVJa84YKpS',NULL,'REGISTER','2023-01-02 20:55:23.113000','leconghau095','9MnyDbUQQN847Ya4EIt20pVrmOUZC4bTNCHWbnGUNvmCGsvBW3',NULL),(7,'lchau3@yopmail.com',_binary '','$2a$10$HsrARGYh.qgZAXa2C0q08.WQ8JLqzwNPP1PRTczTYlGMXsWc0nkVe',NULL,'REGISTER','2023-03-03 15:39:28.514868','lchau3@yopmail.com',NULL,26910),(8,'lchau4@yopmail.com',_binary '','$2a$10$0oQW5y3xZhlqV8HCO1GuB.NZXX1vsloJgP8GRknAByA7PUXxhVLRi',NULL,'REGISTER','2023-03-06 14:37:10.530178','lchau4@yopmail.com',NULL,NULL);
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

-- Dump completed on 2023-04-05 17:23:27
