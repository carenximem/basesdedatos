CREATE DATABASE  IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Position to start replication or point-in-time recovery from
--

-- CHANGE MASTER TO MASTER_LOG_FILE='CARENM-bin.000008', MASTER_LOG_POS=157;

--
-- Table structure for table `aviones`
--

DROP TABLE IF EXISTS `aviones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  `capacidad_total` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviones`
--
-- ORDER BY:  `id`

LOCK TABLES `aviones` WRITE;
/*!40000 ALTER TABLE `aviones` DISABLE KEYS */;
REPLACE  IGNORE INTO `aviones` (`id`, `modelo`, `capacidad_total`) VALUES (3,'Boeing 747',300),(4,'Airbus A320',150),(5,'Boeing 747',300),(6,'Airbus A320',150),(7,'Boeing 737',150),(8,'Airbus A320',180),(9,'Boeing 747',50),(10,'Airbus A320',50),(11,'Avión Ejecutivo',50),(12,'Avión Económico',100),(13,'Avión Ejecutivo',50),(14,'Avión Económico',100),(15,'Avión Ejecutivo',50),(16,'Avión Económico',100);
/*!40000 ALTER TABLE `aviones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajeros`
--

DROP TABLE IF EXISTS `pasajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajeros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajeros`
--
-- ORDER BY:  `id`

LOCK TABLES `pasajeros` WRITE;
/*!40000 ALTER TABLE `pasajeros` DISABLE KEYS */;
REPLACE  IGNORE INTO `pasajeros` (`id`, `nombre`, `cedula`) VALUES (3,'Juan Pérez','1234567890'),(4,'María Rodríguez','9876543210'),(5,'Juan Pérez','1234567890'),(6,'María Rodríguez','9876543210'),(7,'Juan Pérez','1234567890'),(8,'María Gómez','9876543210'),(9,'Juan Pérez','1234567890'),(10,'María Gómez','9876543210'),(11,'Juan Pérez','1234567890'),(12,'María Gómez','9876543210'),(13,'Juan Pérez','1234567890'),(14,'María Rodríguez','9876543210'),(15,'Carlos Gómez','5555555555'),(16,'Juan Pérez','1234567890'),(17,'María Rodríguez','9876543210'),(18,'Carlos Gómez','5555555555'),(19,'Juan Pérez','1234567890'),(20,'María Rodríguez','9876543210'),(21,'Carlos Gómez','5555555555'),(22,'Juan Pérez','1234567890'),(23,'María Rodríguez','9876543210'),(24,'Carlos Gómez','5555555555'),(25,'Juan Pérez','1234567890'),(26,'María Rodríguez','9876543210'),(27,'Juan Pérez','1234567890'),(28,'María Rodríguez','9876543210'),(29,'Juan Pérez','1234567890'),(30,'María Rodríguez','9876543210'),(31,'María Gómez','9876543210'),(32,'Carlos Gómez','5555555555');
/*!40000 ALTER TABLE `pasajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pasajero_id` int DEFAULT NULL,
  `vuelo_id` int DEFAULT NULL,
  `silla_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasajero_id` (`pasajero_id`),
  KEY `vuelo_id` (`vuelo_id`),
  KEY `silla_id` (`silla_id`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`pasajero_id`) REFERENCES `pasajeros` (`id`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`vuelo_id`) REFERENCES `vuelos` (`id`),
  CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`silla_id`) REFERENCES `sillas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--
-- ORDER BY:  `id`

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
REPLACE  IGNORE INTO `reservas` (`id`, `pasajero_id`, `vuelo_id`, `silla_id`) VALUES (98,3,7,102),(99,4,7,103),(100,15,8,107);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sillas`
--

DROP TABLE IF EXISTS `sillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sillas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `clase` varchar(15) NOT NULL,
  `posicion` varchar(15) NOT NULL,
  `avion_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avion_id` (`avion_id`),
  CONSTRAINT `sillas_ibfk_1` FOREIGN KEY (`avion_id`) REFERENCES `aviones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sillas`
--
-- ORDER BY:  `id`

LOCK TABLES `sillas` WRITE;
/*!40000 ALTER TABLE `sillas` DISABLE KEYS */;
REPLACE  IGNORE INTO `sillas` (`id`, `numero`, `clase`, `posicion`, `avion_id`) VALUES (102,1,'Ejecutiva','Ventana',11),(103,2,'Economica','Pasillo',11),(104,3,'Economica','Centro',11),(105,4,'Economica','Ventana',11),(106,5,'Economica','Pasillo',11),(107,6,'Ejecutiva','Ventana',12),(108,7,'Economica','Pasillo',12),(109,8,'Economica','Centro',12),(110,9,'Economica','Ventana',12),(111,10,'Economica','Pasillo',12);
/*!40000 ALTER TABLE `sillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reserva_id` int DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_id` (`reserva_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--
-- ORDER BY:  `id`

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
REPLACE  IGNORE INTO `ventas` (`id`, `reserva_id`, `valor`) VALUES (47,98,500.00),(48,99,600.00),(49,100,450.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_vuelo` varchar(15) NOT NULL,
  `origen` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelos`
--
-- ORDER BY:  `id`

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
REPLACE  IGNORE INTO `vuelos` (`id`, `numero_vuelo`, `origen`, `destino`, `fecha`) VALUES (3,'V101','Ciudad A','Ciudad B','2023-11-18'),(4,'V202','Ciudad B','Ciudad C','2023-11-19'),(5,'V101','Ciudad A','Ciudad B','2023-11-18'),(6,'V202','Ciudad B','Ciudad C','2023-11-19'),(7,'Vuelo123','Ciudad A','Ciudad B','2023-12-01'),(8,'Vuelo456','Ciudad B','Ciudad C','2023-12-02'),(9,'Vuelo1','Ciudad A','Ciudad B','2023-11-20'),(10,'Vuelo2','Ciudad B','Ciudad C','2023-11-21'),(11,'V101','Ciudad A','Ciudad B','2023-11-18'),(12,'V202','Ciudad B','Ciudad C','2023-11-19'),(13,'Vuelo123','Ciudad A','Ciudad B','2023-12-01'),(14,'Vuelo456','Ciudad B','Ciudad C','2023-12-02');
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyecto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 11:25:52
