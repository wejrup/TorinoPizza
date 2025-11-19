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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Margherita','Tomatsauce, ost, frisk basilikum',65),(2,'Vesuvio','Tomatsauce, ost, skinke',75),(3,'Pepperoni','Tomatsauce, ost, pepperoni',79),(4,'Hawaii','Tomatsauce, ost, skinke, ananas',82),(5,'Torino Special','Tomatsauce, ost, oksekød, løg, chili',89);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordrervarer`
--

LOCK TABLES `ordrervarer` WRITE;
/*!40000 ALTER TABLE `ordrervarer` DISABLE KEYS */;
INSERT INTO `ordrervarer` VALUES (1,1,3,1,'Ekstra ost',89),(2,1,1,1,NULL,65),(3,2,2,1,NULL,75),(4,3,5,2,'Ekstra chili',178),(5,4,4,1,NULL,82),(6,5,3,1,NULL,79),(7,5,1,1,'Uden basilikum',65),(8,5,2,1,NULL,75);
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
INSERT INTO `postnummer` VALUES ('6700','Esbjerg'),('7400','Herning'),('7430','Ikast'),('7500','Holstebro'),('8000','Aarhus C');
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

-- Dump completed on 2025-11-19 11:02:34
