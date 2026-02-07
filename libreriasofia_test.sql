-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: libreriasofia
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.22.04.1

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre_autor` varchar(22) NOT NULL,
  `fecha_nac_autor` date DEFAULT NULL,
  `nacionalidad_autor` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(25) NOT NULL,
  `correo_electronico_cliente` varchar(31) DEFAULT NULL,
  `telefono_cliente` int DEFAULT NULL,
  `direccion_cliente` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT,
  `monto_total_pedido` decimal(10,2) NOT NULL,
  `fecha_compra` date NOT NULL,
  `id_cliente_fk` int DEFAULT NULL,
  `id_pedido_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_cliente_fk` (`id_cliente_fk`),
  KEY `id_pedido_fk` (`id_pedido_fk`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT,
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_pedido_fk`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo_libro` varchar(23) NOT NULL,
  `editorial_libro` varchar(32) NOT NULL,
  `categoria_libro` varchar(25) NOT NULL,
  `fecha_publi_libro` date DEFAULT NULL,
  `isbn_libro` varchar(20) DEFAULT NULL,
  `precio_libro` decimal(10,2) DEFAULT NULL,
  `cantidad_stock_libro` int NOT NULL,
  `actualiza_stock` int NOT NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE KEY `isbn_libro` (`isbn_libro`),
  KEY `actualiza_stock` (`actualiza_stock`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`actualiza_stock`) REFERENCES `libro` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_autor` (
  `id_libro_autor` int NOT NULL AUTO_INCREMENT,
  `id_autor_fk` int DEFAULT NULL,
  `id_libro_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_libro_autor`),
  KEY `id_autor_fk` (`id_autor_fk`),
  KEY `id_libro_fk` (`id_libro_fk`),
  CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`id_autor_fk`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`id_libro_fk`) REFERENCES `libro` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `cantidad_pedido` int DEFAULT NULL,
  `estado_pedido` varchar(21) DEFAULT NULL,
  `id_transaccion_fk` int DEFAULT NULL,
  `id_cliente_fk` int DEFAULT NULL,
  `id_libro_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_transaccion_fk` (`id_transaccion_fk`),
  KEY `id_libro_fk` (`id_libro_fk`),
  KEY `id_cliente_fk` (`id_cliente_fk`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_transaccion_fk`) REFERENCES `transaccion` (`id_transaccion`) ON DELETE RESTRICT,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_libro_fk`) REFERENCES `libro` (`id_libro`) ON DELETE RESTRICT,
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `metodo_pago_transaccion` varchar(21) NOT NULL,
  `monto_total_transaccion` decimal(10,2) NOT NULL,
  `fecha_transaccion` date NOT NULL,
  PRIMARY KEY (`id_transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-06 20:44:08
