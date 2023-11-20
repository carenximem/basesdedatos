CREATE DATABASE  IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.35

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

-- CHANGE MASTER TO MASTER_LOG_FILE='DESKTOP-17QSJ1I-bin.000003', MASTER_LOG_POS=157;

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
INSERT INTO `aviones` VALUES (3,'Boeing 747',300),(4,'Airbus A320',150),(5,'Boeing 747',300),(6,'Airbus A320',150),(7,'Boeing 737',150),(8,'Airbus A320',180),(9,'Boeing 747',50),(10,'Airbus A320',50),(11,'Avión Ejecutivo',50),(12,'Avión Económico',100),(13,'Avión Ejecutivo',50),(14,'Avión Económico',100),(15,'Avión Ejecutivo',50),(16,'Avión Económico',100);
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
INSERT INTO `pasajeros` VALUES (3,'Juan Pérez','1234567890'),(4,'María Rodríguez','9876543210'),(5,'Juan Pérez','1234567890'),(6,'María Rodríguez','9876543210'),(7,'Juan Pérez','1234567890'),(8,'María Gómez','9876543210'),(9,'Juan Pérez','1234567890'),(10,'María Gómez','9876543210'),(11,'Juan Pérez','1234567890'),(12,'María Gómez','9876543210'),(13,'Juan Pérez','1234567890'),(14,'María Rodríguez','9876543210'),(15,'Carlos Gómez','5555555555'),(16,'Juan Pérez','1234567890'),(17,'María Rodríguez','9876543210'),(18,'Carlos Gómez','5555555555'),(19,'Juan Pérez','1234567890'),(20,'María Rodríguez','9876543210'),(21,'Carlos Gómez','5555555555'),(22,'Juan Pérez','1234567890'),(23,'María Rodríguez','9876543210'),(24,'Carlos Gómez','5555555555'),(25,'Juan Pérez','1234567890'),(26,'María Rodríguez','9876543210'),(27,'Juan Pérez','1234567890'),(28,'María Rodríguez','9876543210'),(29,'Juan Pérez','1234567890'),(30,'María Rodríguez','9876543210'),(31,'María Gómez','9876543210'),(32,'Carlos Gómez','5555555555');
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
INSERT INTO `reservas` VALUES (98,3,7,102),(99,4,7,103),(100,15,8,107);
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
INSERT INTO `sillas` VALUES (102,1,'Ejecutiva','Ventana',11),(103,2,'Economica','Pasillo',11),(104,3,'Economica','Centro',11),(105,4,'Economica','Ventana',11),(106,5,'Economica','Pasillo',11),(107,6,'Ejecutiva','Ventana',12),(108,7,'Economica','Pasillo',12),(109,8,'Economica','Centro',12),(110,9,'Economica','Ventana',12),(111,10,'Economica','Pasillo',12);
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
INSERT INTO `ventas` VALUES (47,98,500.00),(48,99,600.00),(49,100,450.00);
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
INSERT INTO `vuelos` VALUES (3,'V101','Ciudad A','Ciudad B','2023-11-18'),(4,'V202','Ciudad B','Ciudad C','2023-11-19'),(5,'V101','Ciudad A','Ciudad B','2023-11-18'),(6,'V202','Ciudad B','Ciudad C','2023-11-19'),(7,'Vuelo123','Ciudad A','Ciudad B','2023-12-01'),(8,'Vuelo456','Ciudad B','Ciudad C','2023-12-02'),(9,'Vuelo1','Ciudad A','Ciudad B','2023-11-20'),(10,'Vuelo2','Ciudad B','Ciudad C','2023-11-21'),(11,'V101','Ciudad A','Ciudad B','2023-11-18'),(12,'V202','Ciudad B','Ciudad C','2023-11-19'),(13,'Vuelo123','Ciudad A','Ciudad B','2023-12-01'),(14,'Vuelo456','Ciudad B','Ciudad C','2023-12-02');
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyecto'
--

--
-- Dumping routines for database 'proyecto'
--
/*!50003 DROP PROCEDURE IF EXISTS `AerolineaMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AerolineaMenu`()
BEGIN
    DECLARE user_input VARCHAR(255);
    DECLARE choice INT;

    AerolineaMenuLoop: LOOP
        -- Mostrar opciones del menú
        SELECT '1. Visualizar información de reservas' AS MenuOption;
        SELECT '2. Modificar una reserva' AS MenuOption;
        SELECT '3. Consultar el porcentaje de ocupación del avión' AS MenuOption;
        SELECT '4. Consultar el valor total de ventas por concepto de sillas ocupadas en el avión' AS MenuOption;
        SELECT '5. Consultar el valor promedio de venta por concepto de sillas ocupadas / pasajero en el avión' AS MenuOption;
        SELECT '0. Salir' AS MenuOption;

        -- Pedir al usuario que elija una opción
        SET user_input = NULL;
        WHILE user_input IS NULL DO
            SELECT 'Ingrese el número de la opción deseada:' INTO user_input;
            SELECT user_input;
        END WHILE;

        -- Asignar el valor ingresado a la variable choice
        SET choice = CAST(user_input AS UNSIGNED);

        -- Ejecutar la opción seleccionada
        CASE choice
            WHEN 1 THEN
                SELECT * FROM reservas;
            WHEN 2 THEN
                -- Aquí puedes pedir más información al usuario para modificar una reserva
                UPDATE reservas SET silla_id = 3 WHERE id = 1;
            WHEN 3 THEN
                -- Aquí puedes realizar la consulta para calcular el porcentaje de ocupación del avión
                SELECT COUNT(*) / 50 * 100 AS PorcentajeOcupacion FROM reservas;
            WHEN 4 THEN
                -- Aquí puedes realizar la consulta para calcular el valor total de ventas por concepto de sillas ocupadas en el avión
                SELECT SUM(valor) AS ValorTotalVentas FROM ventas;
            WHEN 5 THEN
                -- Aquí puedes realizar la consulta para calcular el valor promedio de venta por concepto de sillas ocupadas / pasajero en el avión
                SELECT AVG(valor) AS ValorPromedioVenta FROM ventas;
            WHEN 0 THEN
                LEAVE AerolineaMenuLoop;
            ELSE
                SELECT 'Opción no válida. Inténtelo de nuevo.';
        END CASE;
    END LOOP AerolineaMenuLoop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarPasajerosPorVuelo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarPasajerosPorVuelo`(IN numero_vuelo_consulta VARCHAR(15))
BEGIN
    SELECT p.*
    FROM pasajeros p
    JOIN reservas r ON p.id = r.pasajero_id
    JOIN vuelos v ON r.vuelo_id = v.id
    WHERE v.numero_vuelo = numero_vuelo_consulta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarVentasPorVuelo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarVentasPorVuelo`(IN numero_vuelo_consulta VARCHAR(15))
BEGIN
    SELECT v.*
    FROM ventas v
    JOIN reservas r ON v.reserva_id = r.id
    JOIN vuelos v2 ON r.vuelo_id = v2.id
    WHERE v2.numero_vuelo = numero_vuelo_consulta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PromedioArea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PromedioArea`(IN Percentil INT)
BEGIN
  SELECT nombre FROM pasajeros
  WHERE id IN (
    SELECT pasajero_id FROM reservas
    WHERE silla_id IN (
      SELECT id FROM sillas
      WHERE avion_id IN (
        SELECT id FROM aviones
        WHERE capacidad_total < (SELECT AVG(capacidad_total) FROM aviones)/Percentil
      )
    )
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 10:51:12
