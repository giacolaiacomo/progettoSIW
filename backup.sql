-- MySQL dump 10.13  Distrib 5.6.23, for osx10.10 (x86_64)
--
-- Host: localhost    Database: products
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `id` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zipcode` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'Roma','Italia','Via Cipro, 45',134),(101,'Roma','Italia','Via Cassia, 183',145),(201,'Milano','Italia','Via Firenze, 13',234),(301,'Milano','Italia','Via Campo, 32',532),(302,'Torino','Italia','Via Roma, 32',411),(303,'Roma','Italia','Via Del Corso, 50',563),(451,'Roma','Italia','Via Torrevecchia, 18',422),(452,'Firenze','Italia','Via Torre, 18',523);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrator`
--

DROP TABLE IF EXISTS `Administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrator` (
  `Id` bigint(20) NOT NULL,
  `birthDate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registrationDate` datetime NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `I_DMNSRTR_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrator`
--

LOCK TABLES `Administrator` WRITE;
/*!40000 ALTER TABLE `Administrator` DISABLE KEYS */;
INSERT INTO `Administrator` VALUES (1,'1993-07-15','admin@gmail.com','Fabio','Sola','admin','2015-06-17 09:40:00',1);
/*!40000 ALTER TABLE `Administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Id` bigint(20) NOT NULL,
  `birthDate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registrationDate` datetime NOT NULL,
  `phonenumber` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `I_CUSTOMR_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (51,'1993-07-15','fabio@gmail.com','Fabio','Sola','fabio','2015-06-17 17:28:31',3374586234,1),(151,'1993-05-01','gianluca@gmail.com','Gianluca','Colaiacomo','gianluca','2015-06-17 17:35:41',3324587223,101),(251,'1993-09-09','mario@gmail.com','Mario','Rossi','mario','2015-06-17 17:37:47',3224590312,201);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPENJPA_SEQUENCE_TABLE`
--

DROP TABLE IF EXISTS `OPENJPA_SEQUENCE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPENJPA_SEQUENCE_TABLE` (
  `ID` tinyint(4) NOT NULL,
  `SEQUENCE_VALUE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPENJPA_SEQUENCE_TABLE`
--

LOCK TABLES `OPENJPA_SEQUENCE_TABLE` WRITE;
/*!40000 ALTER TABLE `OPENJPA_SEQUENCE_TABLE` DISABLE KEYS */;
INSERT INTO `OPENJPA_SEQUENCE_TABLE` VALUES (0,701);
/*!40000 ALTER TABLE `OPENJPA_SEQUENCE_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLine`
--

DROP TABLE IF EXISTS `OrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLine` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` double NOT NULL,
  `ORDERS_ID_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_ORDRLIN_ORDERS_ID` (`ORDERS_ID_ID`),
  KEY `I_ORDRLIN_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLine`
--

LOCK TABLES `OrderLine` WRITE;
/*!40000 ALTER TABLE `OrderLine` DISABLE KEYS */;
INSERT INTO `OrderLine` VALUES (651,20,15,601,552),(652,1,150,601,403),(653,40,350,602,551),(654,50,400,602,402),(655,200,200,603,401);
/*!40000 ALTER TABLE `OrderLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `id` bigint(20) NOT NULL,
  `closed` bit(1) DEFAULT NULL,
  `completedTime` datetime DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `processed` bit(1) DEFAULT NULL,
  `processedTime` datetime DEFAULT NULL,
  `CUSTOMER_ID_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_ORDERS_CUSTOMER_ID` (`CUSTOMER_ID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (601,'','2015-06-17 18:23:37','2015-06-17 18:23:25','','2015-06-17 18:23:58',51),(602,'','2015-06-17 18:24:47','2015-06-17 18:24:35','\0',NULL,251),(603,'','2015-06-17 18:25:17','2015-06-17 18:25:13','\0',NULL,151);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (401,'tvlcd22','Televisore LCD 22\" SAMSUNG','TV LCD',200,100),(402,'lg33d234','Smartphone LG g3 16 GB','Smartphone lg g3',400,100),(403,'mo19edwde','Monitor LCD 19\" ','Monitor',150,99),(551,'PAD16GB','iPad 2 16 GB APPLE','iPad 2',350,200),(552,'MOS43DE','Mouse Logitech','Mouse',15,980);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Provider`
--

DROP TABLE IF EXISTS `Product_Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product_Provider` (
  `PRODUCT_ID_ID` bigint(20) DEFAULT NULL,
  `PROVIDERS_ID` bigint(20) DEFAULT NULL,
  KEY `I_PRDCVDR_ELEMENT` (`PROVIDERS_ID`),
  KEY `I_PRDCVDR_PRODUCT_ID_ID` (`PRODUCT_ID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Provider`
--

LOCK TABLES `Product_Provider` WRITE;
/*!40000 ALTER TABLE `Product_Provider` DISABLE KEYS */;
INSERT INTO `Product_Provider` VALUES (401,352),(402,353),(403,351),(403,352),(551,501),(552,502);
/*!40000 ALTER TABLE `Product_Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provider` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phoneNumber` bigint(20) NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_PROVIDR_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider`
--

LOCK TABLES `Provider` WRITE;
/*!40000 ALTER TABLE `Provider` DISABLE KEYS */;
INSERT INTO `Provider` VALUES (351,'intel@gmail.com','Intel',3245939257,'IN45DE3CE',301),(352,'samsung@gmail.com','Samsung',3245939327,'EDSQ45DE',302),(353,'lg@gmail.com','LG',3232539327,'LGCQD45D',303),(501,'apple@gmail.com','Apple',3443594223,'AP32DD4D',451),(502,'logitech@gmail.com','Logitech',3233593223,'LOP3432D',452);
/*!40000 ALTER TABLE `Provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-17 18:30:55
