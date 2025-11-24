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
-- Table structure for table `ordreregistrering`
--

DROP TABLE IF EXISTS `ordreregistrering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordreregistrering` (
  `OrdrerID` int NOT NULL AUTO_INCREMENT,
  `KundeID` int DEFAULT NULL,
  `Ordrertidspunkt` datetime DEFAULT NULL,
  `Totalpris` double DEFAULT NULL,
  PRIMARY KEY (`OrdrerID`),
  KEY `KundeID` (`KundeID`),
  CONSTRAINT `ordreregistrering_ibfk_1` FOREIGN KEY (`KundeID`) REFERENCES `kundeoplysninger` (`KundeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordreregistrering`
--

LOCK TABLES `ordreregistrering` WRITE;
/*!40000 ALTER TABLE `ordreregistrering` DISABLE KEYS */;
INSERT INTO `ordreregistrering` VALUES (1,1,'2025-11-18 12:15:00',154),(2,2,'2025-11-18 13:02:00',75),(3,3,'2025-11-18 13:30:00',178),(4,4,'2025-11-18 14:10:00',82),(5,5,'2025-11-18 15:25:00',219),(6,1,'2025-11-19 12:00:00',150),(7,1,'2025-11-19 18:45:00',230);
/*!40000 ALTER TABLE `ordreregistrering` ENABLE KEYS */;
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
