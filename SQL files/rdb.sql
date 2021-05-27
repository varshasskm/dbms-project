-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: railwaydb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `BOOKING`
--

DROP TABLE IF EXISTS `BOOKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOKING` (
  `BOOKING_ID` int NOT NULL AUTO_INCREMENT,
  `EXPRESS_NO` int DEFAULT NULL,
  `USER_ID` varchar(20) DEFAULT NULL,
  `TRAIN_NO` varchar(15) DEFAULT NULL,
  `TOTAL_FC_SEATS` int DEFAULT NULL,
  `TOTAL_SC_SEATS` int DEFAULT NULL,
  `TOTAL_COST` int DEFAULT NULL,
  PRIMARY KEY (`BOOKING_ID`),
  KEY `EXPRESS_NO` (`EXPRESS_NO`),
  KEY `USER_ID` (`USER_ID`),
  KEY `TRAIN_NO` (`TRAIN_NO`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`EXPRESS_NO`) REFERENCES `EXPRESS` (`EXPRESS_NO`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `USER_DETAILS` (`USER_ID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`TRAIN_NO`) REFERENCES `TRAIN` (`TRAIN_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOKING`
--

LOCK TABLES `BOOKING` WRITE;
/*!40000 ALTER TABLE `BOOKING` DISABLE KEYS */;
INSERT INTO `BOOKING` VALUES (1,10001,'hi','S12345',1,0,NULL),(2,10001,'hi','S12345',1,0,NULL),(3,10001,'hi','S12345',1,0,NULL),(4,10001,'hi','S12345',1,0,NULL),(5,10001,'hi','S12345',1,0,NULL),(6,10001,'hi','S12345',1,0,NULL),(7,10001,'hi','S12345',1,0,NULL),(8,10001,'hi','S12345',5,0,NULL),(9,10001,'hi','S12345',10,0,NULL),(10,10001,'hi','S12345',2,0,NULL),(11,10001,'hi','S12345',2,0,800),(12,10001,'hi','S12345',2,0,800),(13,10001,'hi','S12345',2,0,800),(14,10001,'hi','S12345',2,0,800),(15,10001,'hi','S12345',5,0,2000),(16,10001,'hi','S12345',2,0,800),(29,10002,'hi','N21023',1,0,500),(30,10002,'hi','N21023',1,0,500);
/*!40000 ALTER TABLE `BOOKING` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bookingtrigger` AFTER INSERT ON `booking` FOR EACH ROW BEGIN
  UPDATE EXPRESS SET FC_SEATS_REMAINING = FC_SEATS_REMAINING - NEW.TOTAL_FC_SEATS WHERE EXPRESS_NO = NEW.EXPRESS_NO;
  UPDATE EXPRESS SET SC_SEATS_REMAINING = SC_SEATS_REMAINING - NEW.TOTAL_SC_SEATS WHERE EXPRESS_NO = NEW.EXPRESS_NO;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `canceltrigger` AFTER DELETE ON `booking` FOR EACH ROW BEGIN
  UPDATE EXPRESS SET FC_SEATS_REMAINING = FC_SEATS_REMAINING + OLD.TOTAL_FC_SEATS WHERE EXPRESS_NO = OLD.EXPRESS_NO;
  UPDATE EXPRESS SET SC_SEATS_REMAINING = SC_SEATS_REMAINING + OLD.TOTAL_SC_SEATS WHERE EXPRESS_NO = OLD.EXPRESS_NO;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EXPRESS`
--

DROP TABLE IF EXISTS `EXPRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPRESS` (
  `EXPRESS_NO` int NOT NULL AUTO_INCREMENT,
  `TRAIN_NO` varchar(15) DEFAULT NULL,
  `FROMM` varchar(20) DEFAULT NULL,
  `TOO` varchar(20) DEFAULT NULL,
  `STARTING_TIME` timestamp NULL DEFAULT NULL,
  `ARRIVAL_TIME` timestamp NULL DEFAULT NULL,
  `FC_SEATS_REMAINING` int DEFAULT NULL,
  `SC_SEATS_REMAINING` int DEFAULT NULL,
  PRIMARY KEY (`EXPRESS_NO`),
  KEY `TRAIN_NO` (`TRAIN_NO`),
  CONSTRAINT `express_ibfk_1` FOREIGN KEY (`TRAIN_NO`) REFERENCES `TRAIN` (`TRAIN_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPRESS`
--

LOCK TABLES `EXPRESS` WRITE;
/*!40000 ALTER TABLE `EXPRESS` DISABLE KEYS */;
INSERT INTO `EXPRESS` VALUES (10001,'S12345','Madurai','Chennai','2021-05-23 18:00:00','2021-05-23 23:59:00',10,25),(10002,'N21023','Delhi','Bangalore','2021-06-05 13:00:00','2021-06-06 21:30:00',11,20),(10003,'W39014','Nagpur','Bhopal','2021-06-10 10:00:00','2021-06-10 18:15:00',15,30),(10004,'E45698','Kolkata','Hyderabad','2021-06-13 03:00:00','2021-06-13 23:59:00',10,20),(10005,'N56913','Rameshwaram','Varanasi','2021-06-15 07:00:00','2021-06-17 22:00:00',15,30),(10006,'S67813','Chennai','Mysore','2021-06-19 04:30:00','2021-06-19 12:40:00',20,35),(10007,'S12345','Madurai','Chennai','2021-05-23 00:00:00','2021-05-23 06:59:00',10,25);
/*!40000 ALTER TABLE `EXPRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `expressview`
--

DROP TABLE IF EXISTS `expressview`;
/*!50001 DROP VIEW IF EXISTS `expressview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `expressview` AS SELECT 
 1 AS `EXPRESS_NO`,
 1 AS `TRAIN_NO`,
 1 AS `FROMM`,
 1 AS `TOO`,
 1 AS `DEPARTURE_DATE`,
 1 AS `DEPARTURE_TIME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `presentview`
--

DROP TABLE IF EXISTS `presentview`;
/*!50001 DROP VIEW IF EXISTS `presentview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `presentview` AS SELECT 
 1 AS `BOOKING_ID`,
 1 AS `EXPRESS_NO`,
 1 AS `USER_ID`,
 1 AS `TRAIN_NO`,
 1 AS `DEPARTURE_DATE`,
 1 AS `DEPARTURE_TIME`,
 1 AS `TOTAL_FC_SEATS`,
 1 AS `TOTAL_SC_SEATS`,
 1 AS `TOTAL_COST`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `TRAIN`
--

DROP TABLE IF EXISTS `TRAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRAIN` (
  `TRAIN_NO` varchar(15) NOT NULL,
  `EXPRESS_NAME` varchar(20) DEFAULT NULL,
  `FC_SEATS` int DEFAULT NULL,
  `SC_SEATS` int DEFAULT NULL,
  `FC_PRICE` int DEFAULT NULL,
  `SC_PRICE` int DEFAULT NULL,
  PRIMARY KEY (`TRAIN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAIN`
--

LOCK TABLES `TRAIN` WRITE;
/*!40000 ALTER TABLE `TRAIN` DISABLE KEYS */;
INSERT INTO `TRAIN` VALUES ('E45698','Howrah',10,20,500,300),('N21023','Rajdhani',11,20,500,200),('N56913','Ganga-Kaveri',15,30,400,250),('S12345','Vaigai',10,25,400,250),('S67813','Mysuru',20,35,400,250),('W39014','Konkan',15,30,300,200);
/*!40000 ALTER TABLE `TRAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_DETAILS`
--

DROP TABLE IF EXISTS `USER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_DETAILS` (
  `USER_ID` varchar(15) NOT NULL,
  `USERNAME` varchar(20) DEFAULT NULL,
  `EMAIL_ID` varchar(25) DEFAULT NULL,
  `PASSWORD` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DETAILS`
--

LOCK TABLES `USER_DETAILS` WRITE;
/*!40000 ALTER TABLE `USER_DETAILS` DISABLE KEYS */;
INSERT INTO `USER_DETAILS` VALUES ('aditya','aditya','aditya@gmail.com','aditya'),('h','h','h@gmail.com','h'),('hello','hello','hello@gmail.com','hello'),('hi','hi','hi@gmail.com','hii'),('punitha','punitha','punitha@gmail.com','punitha'),('shruthi','shruthi','shruthi@gmail.com','shruthi'),('test1','test1','test1@gmail.com','test1'),('varsha','varsha sskm','varshasskm@gmail.com','Test'),('vishwa','vishwa','vishwa@gmail.com','vishwa');
/*!40000 ALTER TABLE `USER_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `expressview`
--

/*!50001 DROP VIEW IF EXISTS `expressview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `expressview` AS select `express`.`EXPRESS_NO` AS `EXPRESS_NO`,`express`.`TRAIN_NO` AS `TRAIN_NO`,`express`.`FROMM` AS `FROMM`,`express`.`TOO` AS `TOO`,cast(`express`.`STARTING_TIME` as date) AS `DEPARTURE_DATE`,cast(`express`.`STARTING_TIME` as time) AS `DEPARTURE_TIME` from `express` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `presentview`
--

/*!50001 DROP VIEW IF EXISTS `presentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `presentview` AS select `booking`.`BOOKING_ID` AS `BOOKING_ID`,`booking`.`EXPRESS_NO` AS `EXPRESS_NO`,`booking`.`USER_ID` AS `USER_ID`,`booking`.`TRAIN_NO` AS `TRAIN_NO`,cast(`express`.`STARTING_TIME` as date) AS `DEPARTURE_DATE`,cast(`express`.`STARTING_TIME` as time) AS `DEPARTURE_TIME`,`booking`.`TOTAL_FC_SEATS` AS `TOTAL_FC_SEATS`,`booking`.`TOTAL_SC_SEATS` AS `TOTAL_SC_SEATS`,`booking`.`TOTAL_COST` AS `TOTAL_COST` from (`booking` join `express` on((`booking`.`EXPRESS_NO` = `express`.`EXPRESS_NO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-25 21:09:08
