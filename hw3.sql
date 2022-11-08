-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: hw3
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Album`
--

DROP TABLE IF EXISTS `Album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album` (
  `AlbumID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`AlbumID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album`
--

LOCK TABLES `Album` WRITE;
/*!40000 ALTER TABLE `Album` DISABLE KEYS */;
INSERT INTO `Album` VALUES (1,'Midnights'),(2,'Lover'),(3,'Red'),(4,'Bobby Tarantino II'),(5,'Everybody'),(6,'Under Pressure'),(7,'Bloom'),(8,'Blue Neighbourhood');
/*!40000 ALTER TABLE `Album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artist`
--

DROP TABLE IF EXISTS `Artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artist` (
  `ArtistID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist`
--

LOCK TABLES `Artist` WRITE;
/*!40000 ALTER TABLE `Artist` DISABLE KEYS */;
INSERT INTO `Artist` VALUES (1,'Taylor Swift'),(2,'Logic'),(3,'Troye Sivan'),(4,'Vennu Mallesh');
/*!40000 ALTER TABLE `Artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Pop'),(2,'Country'),(3,'Rock'),(4,'Rap');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Listener`
--

DROP TABLE IF EXISTS `Listener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Listener` (
  `ListenerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  PRIMARY KEY (`ListenerID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Listener`
--

LOCK TABLES `Listener` WRITE;
/*!40000 ALTER TABLE `Listener` DISABLE KEYS */;
INSERT INTO `Listener` VALUES (1,'Morty Smith','American'),(2,'Rick Sanchez','American'),(3,'Motu','Indian'),(4,'Patlu','Indian'),(5,'John Wick','American'),(6,'Chhota Bheem','Indian'),(7,'Chutki','Indian'),(9,'Papa Smurf','Belgian'),(10,'Smurfette','Belgian');
/*!40000 ALTER TABLE `Listener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListeningTo`
--

DROP TABLE IF EXISTS `ListeningTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ListeningTo` (
  `ListenerID` int NOT NULL,
  `TrackID` int NOT NULL,
  `Milliseconds` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ListenerID`,`TrackID`),
  KEY `TrackID` (`TrackID`),
  CONSTRAINT `ListeningTo_ibfk_1` FOREIGN KEY (`ListenerID`) REFERENCES `Listener` (`ListenerID`),
  CONSTRAINT `ListeningTo_ibfk_2` FOREIGN KEY (`TrackID`) REFERENCES `Track` (`TrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListeningTo`
--

LOCK TABLES `ListeningTo` WRITE;
/*!40000 ALTER TABLE `ListeningTo` DISABLE KEYS */;
INSERT INTO `ListeningTo` VALUES (1,1,100000),(1,10,99999999),(1,11,2908752),(1,12,7812374),(1,13,4893214),(1,14,5032948),(1,15,92387422),(2,11,287349399),(3,1,4938242),(3,2,9843251),(3,5,84093284),(3,9,87432983),(4,1,4938242),(4,2,9843251),(4,5,84093284),(4,9,87432983),(5,15,287349399),(5,19,1000),(6,4,2340982),(6,5,2308422),(6,8,8324024),(6,17,3840224),(6,18,2140893),(7,2,8403293),(7,3,9830243),(7,4,8309234),(7,5,3420432),(7,11,34820424),(7,13,4320943),(7,19,8309424),(9,1,99999999),(9,2,99999999),(9,3,99999999),(9,4,99999999),(9,5,99999999),(9,8,99999999),(9,9,99999999),(9,10,99999999),(9,11,99999999),(9,12,99999999),(9,13,99999999),(9,14,99999999),(9,15,99999999),(9,16,99999999),(9,17,99999999),(9,18,99999999),(9,19,99999999),(10,8,223000);
/*!40000 ALTER TABLE `ListeningTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Track`
--

DROP TABLE IF EXISTS `Track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Track` (
  `TrackID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `AlbumID` int NOT NULL,
  `Milliseconds` int NOT NULL DEFAULT '0',
  `Bytes` int NOT NULL DEFAULT '0',
  `GenreID` int NOT NULL,
  `ArtistID` int NOT NULL,
  PRIMARY KEY (`TrackID`),
  KEY `AlbumID` (`AlbumID`),
  KEY `GenreID` (`GenreID`),
  KEY `ArtistID` (`ArtistID`),
  CONSTRAINT `Track_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `Album` (`AlbumID`),
  CONSTRAINT `Track_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `Genre` (`GenreID`),
  CONSTRAINT `Track_ibfk_3` FOREIGN KEY (`ArtistID`) REFERENCES `Artist` (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Track`
--

LOCK TABLES `Track` WRITE;
/*!40000 ALTER TABLE `Track` DISABLE KEYS */;
INSERT INTO `Track` VALUES (1,'Anti-Hero',1,200000,20000000,1,1),(2,'Lavender Haze',1,202000,20200000,1,1),(3,'Snow on The Beach',1,255000,25500000,1,1),(4,'Lover',2,221000,22100000,2,1),(5,'Paper Rings',2,222000,22200000,1,1),(8,'Red',3,223000,22300000,2,1),(9,'iKnewYouWereTrouble',3,219000,21900000,1,1),(10,'Grandpa\'s Space Ship',4,121000,12100000,4,2),(11,'Yuck',4,173000,17300000,4,2),(12,'1-800-273-8255',5,250000,25000000,4,2),(13,'Take it Back',5,399000,39900000,4,2),(14,'Bounce',6,244000,24400000,4,2),(15,'Under Pressure',6,559000,55900000,4,2),(16,'Bloom',7,221000,22100000,1,3),(17,'Lucky Strike',7,208000,20800000,1,3),(18,'LOST BOY',8,223000,22300000,1,3),(19,'EASE',8,213000,21300000,1,3);
/*!40000 ALTER TABLE `Track` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-26 20:33:14
