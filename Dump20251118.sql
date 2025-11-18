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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundeoplysninger`
--

LOCK TABLES `kundeoplysninger` WRITE;
/*!40000 ALTER TABLE `kundeoplysninger` DISABLE KEYS */;
/*!40000 ALTER TABLE `kundeoplysninger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `VareID` int NOT NULL AUTO_INCREMENT,
  `Navn` varchar(255) DEFAULT NULL,
  `Beskrivelse` varchar(255) DEFAULT NULL,
  `Pris` double DEFAULT NULL,
  PRIMARY KEY (`VareID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordreregistrering`
--

LOCK TABLES `ordreregistrering` WRITE;
/*!40000 ALTER TABLE `ordreregistrering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordreregistrering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordrervarer`
--

DROP TABLE IF EXISTS `ordrervarer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordrervarer` (
  `OrdrervarerID` int NOT NULL AUTO_INCREMENT,
  `OrdrerID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `Kvantitet` int DEFAULT NULL,
  `Tilpasning` varchar(255) DEFAULT NULL,
  `LinjePris` double DEFAULT NULL,
  PRIMARY KEY (`OrdrervarerID`),
  KEY `OrdrerID` (`OrdrerID`),
  KEY `MenuID` (`MenuID`),
  CONSTRAINT `ordrervarer_ibfk_1` FOREIGN KEY (`OrdrerID`) REFERENCES `ordreregistrering` (`OrdrerID`),
  CONSTRAINT `ordrervarer_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`VareID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordrervarer`
--

LOCK TABLES `ordrervarer` WRITE;
/*!40000 ALTER TABLE `ordrervarer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordrervarer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postnummer`
--

DROP TABLE IF EXISTS `postnummer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postnummer` (
  `Postnr` char(4) NOT NULL,
  `Bynavn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Postnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postnummer`
--

LOCK TABLES `postnummer` WRITE;
/*!40000 ALTER TABLE `postnummer` DISABLE KEYS */;
/*!40000 ALTER TABLE `postnummer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-18 11:14:22
