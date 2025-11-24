-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: torinopizza
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `kundeoplysninger`
--

DROP TABLE IF EXISTS `kundeoplysninger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kundeoplysninger` (
  `KundeID` int NOT NULL AUTO_INCREMENT,
  `Navn` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Postnummer` char(4) DEFAULT NULL,
  `Telefonnummer` char(8) DEFAULT NULL,
  `Mailadresse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KundeID`),
  KEY `Postnummer` (`Postnummer`),
  CONSTRAINT `kundeoplysninger_ibfk_1` FOREIGN KEY (`Postnummer`) REFERENCES `postnummer` (`Postnr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundeoplysninger`
--

LOCK TABLES `kundeoplysninger` WRITE;
/*!40000 ALTER TABLE `kundeoplysninger` DISABLE KEYS */;
INSERT INTO `kundeoplysninger` VALUES (1,'Victor Wejrup','Wedellsborgvej 6D','7400','50462663','victor@example.com'),(2,'Johanne Thomassen','Skolegade 21','7400','22446688','johanne@example.com'),(3,'Jens Hansen','Blomstervænget 12','7430','12341234','jens@example.com'),(4,'Maria Nielsen','Strandvej 88','7500','99887766','maria@example.com'),(5,'Peter Mikkelsen','Havnegade 4','6700','55778899','peter@example.com'),(6,'Jens Petersen','Engtoften 14','7430','60112233','jens.p@example.com');
/*!40000 ALTER TABLE `kundeoplysninger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-24 10:18:42
