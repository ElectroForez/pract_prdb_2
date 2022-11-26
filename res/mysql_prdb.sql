-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: p_prdb
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `Agent`
--

DROP TABLE IF EXISTS `Agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AgentTypeID` int NOT NULL,
  `Address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `INN` varchar(12) NOT NULL,
  `KPP` varchar(9) DEFAULT NULL,
  `DirectorName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Priority` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Agent_AgentType` (`AgentTypeID`),
  CONSTRAINT `FK_Agent_AgentType` FOREIGN KEY (`AgentTypeID`) REFERENCES `AgentType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agent`
--

LOCK TABLES `Agent` WRITE;
/*!40000 ALTER TABLE `Agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentPriorityHistory`
--

DROP TABLE IF EXISTS `AgentPriorityHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AgentPriorityHistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AgentID` int NOT NULL,
  `ChangeDate` datetime(6) NOT NULL,
  `PriorityValue` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AgentPriorityHistory_Agent` (`AgentID`),
  CONSTRAINT `FK_AgentPriorityHistory_Agent` FOREIGN KEY (`AgentID`) REFERENCES `Agent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentPriorityHistory`
--

LOCK TABLES `AgentPriorityHistory` WRITE;
/*!40000 ALTER TABLE `AgentPriorityHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `AgentPriorityHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentType`
--

DROP TABLE IF EXISTS `AgentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AgentType` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentType`
--

LOCK TABLES `AgentType` WRITE;
/*!40000 ALTER TABLE `AgentType` DISABLE KEYS */;
/*!40000 ALTER TABLE `AgentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Material` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CountInPack` int NOT NULL,
  `Unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CountInStock` double DEFAULT NULL,
  `MinCount` double NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Cost` decimal(10,2) NOT NULL,
  `Image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MaterialTypeID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Material_MaterialType` (`MaterialTypeID`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Material`
--

LOCK TABLES `Material` WRITE;
/*!40000 ALTER TABLE `Material` DISABLE KEYS */;
INSERT INTO `Material` VALUES (1,'Гранулы белый 2x2',7,'л',76,8,NULL,47680.00,'',1),(2,'Нить белый 1x3',8,'м',406,27,NULL,2191.00,'',3),(3,'Нить цветной 1x1',3,'г',424,10,NULL,8619.00,'materials/image_5.jpeg',2),(4,'Нить цветной 2x0',2,'м',395,26,NULL,16856.00,'',2),(5,'Краска синий 2x2',6,'л',334,48,NULL,403.00,'',2),(6,'Нить синий 0x2',9,'м',654,10,NULL,7490.00,'',3),(7,'Гранулы серый 2x2',7,'л',648,17,NULL,15478.00,'',1),(8,'Краска синий 1x2',2,'л',640,50,NULL,44490.00,'',2),(9,'Нить зеленый 2x0',5,'м',535,45,NULL,28301.00,'materials/image_10.jpeg',2),(10,'Гранулы синий 1x2',3,'кг',680,6,NULL,9242.00,'',1),(11,'Нить синий 3x2',1,'м',529,13,NULL,10878.00,'',3),(12,'Краска белый 2x2',1,'л',659,35,NULL,29906.00,'materials/image_3.jpeg',2),(13,'Краска зеленый 0x3',2,'л',50,48,NULL,24073.00,'',2),(14,'Нить зеленый 2x3',7,'г',649,25,NULL,20057.00,'',3),(15,'Краска белый 2x1',2,'л',790,8,NULL,3353.00,'',2),(16,'Нить серый 2x3',1,'г',431,40,NULL,22452.00,'',3),(17,'Гранулы серый 3x2',5,'л',96,9,NULL,29943.00,'',1),(18,'Краска серый 3x2',3,'л',806,50,NULL,55064.00,'',2),(19,'Гранулы белый 0x3',3,'кг',538,11,NULL,7183.00,'',1),(20,'Краска цветной 1x1',3,'л',784,22,NULL,43466.00,'',2),(21,'Гранулы белый 1x0',3,'кг',980,41,NULL,27718.00,'',1),(22,'Краска серый 0x2',3,'кг',679,36,NULL,33227.00,'',2),(23,'Гранулы серый 3x3',5,'л',2,38,NULL,15170.00,'',1),(24,'Краска серый 3x0',7,'кг',341,38,NULL,19352.00,'',2),(25,'Гранулы синий 2x1',9,'л',273,17,NULL,231.00,'materials/image_2.jpeg',1),(26,'Гранулы синий 0x2',9,'л',576,36,NULL,41646.00,'',1),(27,'Нить цветной 1x0',5,'г',91,38,NULL,24948.00,'',3),(28,'Краска зеленый 2x2',2,'кг',752,36,NULL,19014.00,'',2),(29,'Краска цветной 1x3',9,'кг',730,5,NULL,268.00,'',2),(30,'Краска серый 2x0',2,'л',131,22,NULL,35256.00,'',2),(31,'Нить зеленый 2x1',6,'м',802,16,NULL,34556.00,'',3),(32,'Краска цветной 0x3',10,'л',324,9,NULL,3322.00,'',2),(33,'Нить белый 2x3',3,'г',283,41,NULL,10823.00,'',3),(34,'Гранулы синий 3x0',1,'кг',411,8,NULL,16665.00,'',1),(35,'Гранулы синий 1x3',8,'л',41,30,NULL,5668.00,'',1),(36,'Нить цветной 2x1',3,'м',150,22,NULL,7615.00,'',2),(37,'Гранулы серый 3x0',4,'л',0,5,NULL,702.00,'materials/image_7.jpeg',1),(38,'Краска синий 3x0',7,'л',523,42,NULL,38644.00,'',2),(39,'Нить зеленый 0x0',8,'м',288,43,NULL,41827.00,'',2),(40,'Гранулы белый 1x2',4,'л',77,46,NULL,8129.00,'',1),(41,'Краска белый 3x0',5,'кг',609,48,NULL,51471.00,'',2),(42,'Краска цветной 0x1',6,'л',43,8,NULL,54401.00,'',2),(43,'Нить серый 1x1',5,'м',372,22,NULL,14474.00,'',3),(44,'Краска синий 2x1',9,'л',642,29,NULL,46848.00,'',2),(45,'Нить серый 3x0',1,'м',409,19,NULL,29503.00,'',3),(46,'Краска зеленый 3x3',6,'л',601,32,NULL,27710.00,'',2),(47,'Краска синий 2x0',7,'л',135,50,NULL,40074.00,'',2),(48,'Гранулы синий 2x3',2,'л',749,45,NULL,53482.00,'',1),(49,'Нить синий 0x3',8,'м',615,22,NULL,32087.00,'',2),(50,'Нить синий 3x3',7,'г',140,12,NULL,45774.00,'',3),(51,'Краска зеленый 2x3',2,'л',485,8,NULL,44978.00,'',2),(52,'Нить синий 3x0',10,'м',67,23,NULL,44407.00,'',3),(53,'Гранулы серый 2x1',7,'кг',779,44,NULL,50339.00,'',1),(54,'Краска зеленый 0x1',2,'л',869,7,NULL,30581.00,'',2),(55,'Краска синий 0x0',8,'кг',796,29,NULL,18656.00,'',2),(56,'Краска серый 2x1',5,'л',706,45,NULL,46579.00,'',2),(57,'Нить белый 0x1',10,'м',101,43,NULL,36883.00,'',3),(58,'Гранулы зеленый 1x2',9,'л',575,15,NULL,45083.00,'',1),(59,'Краска серый 0x1',2,'л',768,27,NULL,35063.00,'',2),(60,'Гранулы цветной 0x1',3,'л',746,50,NULL,24488.00,'',1),(61,'Гранулы белый 3x1',8,'л',995,27,NULL,43711.00,'',1),(62,'Нить зеленый 0x2',2,'м',578,20,NULL,17429.00,'',3),(63,'Гранулы зеленый 0x2',4,'л',206,34,NULL,38217.00,'',1),(64,'Краска цветной 1x2',10,'л',299,50,NULL,47701.00,'',2),(65,'Краска зеленый 1x0',8,'кг',626,17,NULL,52189.00,'',2),(66,'Гранулы серый 0x0',5,'л',608,12,NULL,16715.00,'',1),(67,'Гранулы синий 0x3',5,'кг',953,48,NULL,45134.00,'',1),(68,'Краска цветной 2x1',1,'л',325,45,NULL,1846.00,'',2),(69,'Нить синий 2x3',5,'м',10,21,NULL,43659.00,'',2),(70,'Нить синий 2x1',9,'г',948,13,NULL,12283.00,'',2),(71,'Гранулы белый 1x1',4,'л',93,11,NULL,6557.00,'',1),(72,'Краска синий 1x3',6,'кг',265,17,NULL,38230.00,'',2),(73,'Краска зеленый 3x0',2,'л',261,7,NULL,20226.00,'materials/image_1.jpeg',2),(74,'Нить зеленый 1x0',9,'г',304,43,NULL,8105.00,'',3),(75,'Краска цветной 0x2',7,'л',595,38,NULL,2600.00,'',2),(76,'Нить синий 3x1',7,'м',579,48,NULL,4920.00,'',2),(77,'Краска зеленый 0x2',9,'л',139,23,NULL,39809.00,'',2),(78,'Краска синий 3x3',6,'кг',740,24,NULL,46545.00,'',2),(79,'Краска зеленый 1x1',2,'кг',103,34,NULL,40583.00,'materials/image_6.jpeg',2),(80,'Краска цветной 2x3',9,'л',443,46,NULL,46502.00,'',2),(81,'Нить цветной 3x0',1,'м',989,14,NULL,53651.00,'',3),(82,'Гранулы серый 2x3',6,'л',467,28,NULL,47757.00,'',1),(83,'Краска белый 1x0',6,'л',95,6,NULL,3543.00,'',2),(84,'Гранулы серый 3x1',10,'кг',762,6,NULL,10899.00,'',1),(85,'Гранулы серый 2x0',3,'кг',312,21,NULL,8939.00,'materials/image_8.jpeg',1),(86,'Нить белый 0x2',4,'г',43,19,NULL,29271.00,'',3),(87,'Гранулы зеленый 1x1',4,'л',10,19,NULL,46455.00,'materials/image_4.jpeg',1),(88,'Нить серый 0x2',3,'м',504,10,NULL,45744.00,'materials/image_9.jpeg',2),(89,'Гранулы белый 0x2',2,'л',581,40,NULL,9330.00,'',1),(90,'Нить цветной 3x2',3,'м',831,46,NULL,2939.00,'',3),(91,'Гранулы белый 3x0',6,'л',208,7,NULL,50217.00,'',1),(92,'Нить серый 1x2',1,'м',292,30,NULL,30198.00,'',3),(93,'Краска белый 0x1',7,'л',423,47,NULL,19777.00,'',2),(94,'Гранулы цветной 0x3',7,'кг',723,44,NULL,1209.00,'',1),(95,'Нить серый 1x3',1,'г',489,25,NULL,32002.00,'',2),(96,'Гранулы белый 2x3',4,'л',274,8,NULL,32446.00,'',1),(97,'Краска зеленый 3x1',10,'л',657,19,NULL,32487.00,'',2),(98,'Гранулы цветной 3x2',1,'л',32,45,NULL,28596.00,'',1),(99,'Нить белый 2x0',2,'м',623,23,NULL,46684.00,'',2);
/*!40000 ALTER TABLE `Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialCountHistory`
--

DROP TABLE IF EXISTS `MaterialCountHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MaterialCountHistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MaterialID` int NOT NULL,
  `ChangeDate` datetime(6) NOT NULL,
  `CountValue` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MaterialCountHistory_Material` (`MaterialID`),
  CONSTRAINT `FK_MaterialCountHistory_Material` FOREIGN KEY (`MaterialID`) REFERENCES `Material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialCountHistory`
--

LOCK TABLES `MaterialCountHistory` WRITE;
/*!40000 ALTER TABLE `MaterialCountHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `MaterialCountHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialSupplier`
--

DROP TABLE IF EXISTS `MaterialSupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MaterialSupplier` (
  `MaterialID` int NOT NULL,
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`MaterialID`,`SupplierID`),
  KEY `FK_MaterialSupplier_Supplier` (`SupplierID`),
  CONSTRAINT `FK_MaterialSupplier_Material` FOREIGN KEY (`MaterialID`) REFERENCES `Material` (`ID`),
  CONSTRAINT `FK_MaterialSupplier_Supplier` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialSupplier`
--

LOCK TABLES `MaterialSupplier` WRITE;
/*!40000 ALTER TABLE `MaterialSupplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `MaterialSupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialType`
--

DROP TABLE IF EXISTS `MaterialType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MaterialType` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DefectedPercent` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialType`
--

LOCK TABLES `MaterialType` WRITE;
/*!40000 ALTER TABLE `MaterialType` DISABLE KEYS */;
INSERT INTO `MaterialType` VALUES (1,'Гранулы',0),(2,'Краски',0),(3,'Нитки',0);
/*!40000 ALTER TABLE `MaterialType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductTypeID` int DEFAULT NULL,
  `ArticleNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProductionPersonCount` int DEFAULT NULL,
  `ProductionWorkshopNumber` int DEFAULT NULL,
  `MinCostForAgent` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Product_ProductType` (`ProductTypeID`),
  CONSTRAINT `FK_Product_ProductType` FOREIGN KEY (`ProductTypeID`) REFERENCES `ProductType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductCostHistory`
--

DROP TABLE IF EXISTS `ProductCostHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductCostHistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `ChangeDate` datetime(6) NOT NULL,
  `CostValue` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ProductCostHistory_Product` (`ProductID`),
  CONSTRAINT `FK_ProductCostHistory_Product` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductCostHistory`
--

LOCK TABLES `ProductCostHistory` WRITE;
/*!40000 ALTER TABLE `ProductCostHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductCostHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductMaterial`
--

DROP TABLE IF EXISTS `ProductMaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductMaterial` (
  `ProductID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `Count` double DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`MaterialID`),
  KEY `FK_ProductMaterial_Material` (`MaterialID`),
  CONSTRAINT `FK_ProductMaterial_Material` FOREIGN KEY (`MaterialID`) REFERENCES `Material` (`ID`),
  CONSTRAINT `FK_ProductMaterial_Product` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductMaterial`
--

LOCK TABLES `ProductMaterial` WRITE;
/*!40000 ALTER TABLE `ProductMaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductMaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSale`
--

DROP TABLE IF EXISTS `ProductSale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductSale` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AgentID` int NOT NULL,
  `ProductID` int NOT NULL,
  `SaleDate` date NOT NULL,
  `ProductCount` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ProductSale_Agent` (`AgentID`),
  KEY `FK_ProductSale_Product` (`ProductID`),
  CONSTRAINT `FK_ProductSale_Agent` FOREIGN KEY (`AgentID`) REFERENCES `Agent` (`ID`),
  CONSTRAINT `FK_ProductSale_Product` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSale`
--

LOCK TABLES `ProductSale` WRITE;
/*!40000 ALTER TABLE `ProductSale` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductSale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductType`
--

DROP TABLE IF EXISTS `ProductType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductType` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DefectedPercent` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductType`
--

LOCK TABLES `ProductType` WRITE;
/*!40000 ALTER TABLE `ProductType` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shop`
--

DROP TABLE IF EXISTS `Shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shop` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AgentID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Shop_Agent` (`AgentID`),
  CONSTRAINT `FK_Shop_Agent` FOREIGN KEY (`AgentID`) REFERENCES `Agent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shop`
--

LOCK TABLES `Shop` WRITE;
/*!40000 ALTER TABLE `Shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `Shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `INN` varchar(12) NOT NULL,
  `StartDate` date NOT NULL,
  `QualityRating` int DEFAULT NULL,
  `SupplierType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 23:20:07
