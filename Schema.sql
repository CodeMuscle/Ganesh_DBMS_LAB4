CREATE DATABASE  IF NOT EXISTS `e_commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_commerce`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CAT_ID` int NOT NULL,
  `CAT_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'BOOKS'),(2,'GAMES'),(3,'GROCERIES'),(4,'');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUS_ID` int NOT NULL,
  `CUS_NAME` varchar(20) NOT NULL,
  `CUS_PHONE` varchar(10) NOT NULL,
  `CUS_CITY` varchar(30) NOT NULL,
  `CUS_GENDER` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'AAKASH','9999999999','DELHI','M'),(2,'AMAN','9785463215','NOIDA','M'),(3,'NEHA','9999999999','MUMBAI','F'),(4,'MEGHA','9994562399','KOLKATA','F'),(5,'PULKIT','7895999999','LUCKNOW','M');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ORD_ID` int NOT NULL,
  `ORD_AMOUNT` int NOT NULL,
  `ORD_DATE` date DEFAULT NULL,
  `CUS_ID` int NOT NULL,
  `PRICING_ID` int NOT NULL,
  PRIMARY KEY (`ORD_ID`),
  KEY `CUS_ID` (`CUS_ID`),
  KEY `PRICING_ID` (`PRICING_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`PRICING_ID`) REFERENCES `supplier_pricing` (`PRICING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRO_ID` int NOT NULL,
  `PRO_NAME` varchar(20) NOT NULL DEFAULT 'Dummy',
  `PRO_DESC` varchar(60) DEFAULT NULL,
  `CAT_ID` int NOT NULL,
  PRIMARY KEY (`PRO_ID`),
  KEY `CAT_ID` (`CAT_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RAT_ID` int NOT NULL,
  `ORD_ID` int NOT NULL,
  `RAT_RATSTARS` int NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  KEY `ORD_ID` (`ORD_ID`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`ORD_ID`) REFERENCES `order` (`ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SUPP_ID` int NOT NULL,
  `SUPP_NAME` varchar(50) NOT NULL,
  `SUPP_CITY` varchar(50) DEFAULT NULL,
  `SUPP_PHONE` varchar(10) NOT NULL,
  PRIMARY KEY (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Rajesh Retails','Delhi','1234567890'),(2,'Appario Ltd.','Mumbai','2589631470'),(3,'Knome products','Banglore','9785462315'),(4,'Bansal Retails','Kochi','8975463285'),(5,'Mittal Ltd.','Lucknow','7898456532');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_pricing`
--

DROP TABLE IF EXISTS `supplier_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_pricing` (
  `PRICING_ID` int NOT NULL,
  `PRO_ID` int NOT NULL,
  `SUPP_ID` int NOT NULL,
  `SUPP_PRICE` int DEFAULT '0',
  PRIMARY KEY (`PRICING_ID`),
  KEY `PRO_ID` (`PRO_ID`),
  KEY `SUPP_ID` (`SUPP_ID`),
  CONSTRAINT `supplier_pricing_ibfk_1` FOREIGN KEY (`PRO_ID`) REFERENCES `product` (`PRO_ID`),
  CONSTRAINT `supplier_pricing_ibfk_2` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_pricing`
--

LOCK TABLES `supplier_pricing` WRITE;
/*!40000 ALTER TABLE `supplier_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_pricing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-20  2:39:43
