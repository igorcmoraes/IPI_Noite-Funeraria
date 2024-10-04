CREATE DATABASE  IF NOT EXISTS `funeraria` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `funeraria`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: funeraria
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
-- Table structure for table `caixao`
--

DROP TABLE IF EXISTS `caixao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixao` (
  `id_caixao` mediumint NOT NULL AUTO_INCREMENT,
  `tipo_caixao` varchar(50) NOT NULL,
  `cor_caixao` varchar(50) NOT NULL,
  `cor_forro` varchar(50) NOT NULL,
  `qtd` smallint NOT NULL,
  `tamanho` enum('PP','P','M','G','GG') NOT NULL,
  `valor` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id_caixao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixao`
--

LOCK TABLES `caixao` WRITE;
/*!40000 ALTER TABLE `caixao` DISABLE KEYS */;
INSERT INTO `caixao` VALUES (1,'caixão de madeira','branco','vermelho',1,'M',498.50),(2,'caixão de militar','preto','vermelho',2,'G',750.00),(3,'caixão de biodegradável','marrom','branco',1,'P',350.75),(4,'caixão de metal','cinza','azul',1,'M',1200.00),(5,'caixão de fibra de vidro','preto','branco',3,'G',1500.25),(6,'caixão de madeira','branco','azul',2,'M',600.00),(7,'caixão de metal','dourado','vermelho',1,'G',1800.00),(8,'caixão de madeira','preto','dourado',1,'P',450.00),(9,'caixão de estofado','marrom','vermelho',1,'M',500.00),(10,'caixão de metal','prata','branco',2,'G',1700.00),(11,'caixão de fibra de vidro','preto','dourado',1,'P',450.00),(12,'caixão biodegradável','marrom','vermelho',1,'M',500.00),(13,'caixão de metal','prata','branco',2,'G',1700.00),(14,'caixão estofado','vermelho','vermelho',1,'M',510.25),(15,'caixão militar','preto','azul',1,'G',1400.00),(16,'caixão de fibra de vidro','branco','vermelho',1,'P',475.75);
/*!40000 ALTER TABLE `caixao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_caixao`
--

DROP TABLE IF EXISTS `compra_caixao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_caixao` (
  `cpfFK` char(11) NOT NULL,
  `id_caixaoFK` mediumint NOT NULL AUTO_INCREMENT,
  `num_compra` smallint NOT NULL,
  `data_venda` date NOT NULL,
  `forma_pagamento` enum('DINHEIRO','CARTÃO DE CRÉDITO','CARTÃO DE DÉBITO','TRANSFERÊNCIA BANCÁRIA','PIX') NOT NULL,
  KEY `cpfFK` (`cpfFK`),
  KEY `id_caixaoFK` (`id_caixaoFK`),
  CONSTRAINT `compra_caixao_ibfk_1` FOREIGN KEY (`cpfFK`) REFERENCES `usuario` (`cpf`),
  CONSTRAINT `compra_caixao_ibfk_2` FOREIGN KEY (`id_caixaoFK`) REFERENCES `caixao` (`id_caixao`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_caixao`
--

LOCK TABLES `compra_caixao` WRITE;
/*!40000 ALTER TABLE `compra_caixao` DISABLE KEYS */;
INSERT INTO `compra_caixao` VALUES ('12345678900',1,4551,'2024-09-26','CARTÃO DE CRÉDITO'),('98765432100',2,4552,'2024-09-25','CARTÃO DE DÉBITO'),('11122233344',3,4553,'2024-09-24','DINHEIRO'),('22233344455',4,4554,'2024-09-23','PIX'),('33344455566',5,4555,'2024-09-22','CARTÃO DE CRÉDITO'),('44455566677',6,4556,'2024-09-21','TRANSFERÊNCIA BANCÁRIA'),('55566677788',7,4557,'2024-09-20','CARTÃO DE DÉBITO'),('66677788899',8,4558,'2024-09-19','CARTÃO DE CRÉDITO'),('77788899900',9,4559,'2024-09-18','DINHEIRO'),('88899900011',10,4560,'2024-09-17','PIX'),('99900011122',11,4561,'2024-09-16','CARTÃO DE CRÉDITO'),('00011122233',12,4562,'2024-09-15','TRANSFERÊNCIA BANCÁRIA'),('11122233345',13,4563,'2024-09-14','CARTÃO DE DÉBITO'),('22233344456',14,4564,'2024-09-13','DINHEIRO'),('00011122233',15,4571,'2024-09-26','CARTÃO DE CRÉDITO');
/*!40000 ALTER TABLE `compra_caixao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_flor`
--

DROP TABLE IF EXISTS `compra_flor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_flor` (
  `id_florFK` mediumint NOT NULL AUTO_INCREMENT,
  `cpfFK` varchar(11) NOT NULL,
  `num_compra` int NOT NULL,
  `data_venda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forma_pagamento` enum('DINHEIRO','CARTÃO DE CRÉDITO','CARTÃO DE DÉBITO','TRANSFERÊNCIA BANCÁRIA','PIX') NOT NULL,
  `mensagem` varchar(100) DEFAULT NULL,
  KEY `cpfFK` (`cpfFK`),
  KEY `id_florFK` (`id_florFK`),
  CONSTRAINT `compra_flor_ibfk_1` FOREIGN KEY (`cpfFK`) REFERENCES `usuario` (`cpf`),
  CONSTRAINT `compra_flor_ibfk_2` FOREIGN KEY (`id_florFK`) REFERENCES `flor` (`id_flor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_flor`
--

LOCK TABLES `compra_flor` WRITE;
/*!40000 ALTER TABLE `compra_flor` DISABLE KEYS */;
INSERT INTO `compra_flor` VALUES (1,'12345678900',224,'2024-09-26 00:00:00','CARTÃO DE CRÉDITO',NULL),(2,'98765432100',225,'2024-09-25 00:00:00','CARTÃO DE DÉBITO',NULL),(3,'11122233344',226,'2024-09-24 00:00:00','DINHEIRO',NULL),(4,'22233344455',227,'2024-09-23 00:00:00','PIX',NULL),(5,'33344455566',228,'2024-09-22 00:00:00','CARTÃO DE CRÉDITO',NULL),(6,'44455566677',229,'2024-09-21 00:00:00','TRANSFERÊNCIA BANCÁRIA',NULL),(7,'55566677788',230,'2024-09-20 00:00:00','CARTÃO DE DÉBITO',NULL),(8,'66677788899',231,'2024-09-19 00:00:00','CARTÃO DE CRÉDITO',NULL),(9,'77788899900',232,'2024-09-18 00:00:00','DINHEIRO',NULL),(10,'88899900011',233,'2024-09-17 00:00:00','PIX',NULL),(11,'99900011122',234,'2024-09-16 00:00:00','CARTÃO DE CRÉDITO',NULL),(12,'00011122233',235,'2024-09-15 00:00:00','TRANSFERÊNCIA BANCÁRIA',NULL),(13,'11122233345',236,'2024-09-14 00:00:00','CARTÃO DE DÉBITO',NULL),(14,'22233344456',237,'2024-09-13 00:00:00','DINHEIRO',NULL),(15,'33344455567',238,'2024-09-12 00:00:00','PIX',NULL);
/*!40000 ALTER TABLE `compra_flor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_urnas`
--

DROP TABLE IF EXISTS `compra_urnas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_urnas` (
  `id_urnaFK` mediumint NOT NULL AUTO_INCREMENT,
  `cpfFK` varchar(11) NOT NULL,
  `num_compra` int NOT NULL,
  `data_venda` date NOT NULL,
  `forma_pagamento` enum('DINHEIRO','CARTÃO DE CRÉDITO','CARTÃO DE DÉBITO','TRANSFERÊNCIA BANCÁRIA','PIX') NOT NULL,
  KEY `id_urnaFK` (`id_urnaFK`),
  KEY `cpfFK` (`cpfFK`),
  CONSTRAINT `compra_urnas_ibfk_1` FOREIGN KEY (`id_urnaFK`) REFERENCES `urna` (`id_urna`),
  CONSTRAINT `compra_urnas_ibfk_2` FOREIGN KEY (`cpfFK`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_urnas`
--

LOCK TABLES `compra_urnas` WRITE;
/*!40000 ALTER TABLE `compra_urnas` DISABLE KEYS */;
INSERT INTO `compra_urnas` VALUES (1,'33344455567',2580,'2024-10-14','DINHEIRO'),(2,'12345678900',2567,'2024-10-01','CARTÃO DE CRÉDITO'),(3,'98765432100',2567,'2024-10-01','CARTÃO DE CRÉDITO'),(4,'11122233344',2568,'2024-10-02','CARTÃO DE DÉBITO'),(5,'22233344455',2569,'2024-10-03','PIX'),(6,'33344455566',2570,'2024-10-04','DINHEIRO'),(7,'44455566677',2571,'2024-10-05','TRANSFERÊNCIA BANCÁRIA'),(8,'55566677788',2572,'2024-10-06','CARTÃO DE CRÉDITO'),(9,'66677788899',2573,'2024-10-07','PIX'),(10,'77788899900',2574,'2024-10-08','CARTÃO DE DÉBITO'),(11,'88899900011',2575,'2024-10-09','DINHEIRO'),(12,'99900011122',2576,'2024-10-10','CARTÃO DE CRÉDITO'),(13,'00011122233',2577,'2024-10-11','TRANSFERÊNCIA BANCÁRIA'),(14,'11122233345',2578,'2024-10-12','PIX'),(15,'22233344456',2579,'2024-10-13','CARTÃO DE DÉBITO');
/*!40000 ALTER TABLE `compra_urnas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ente`
--

DROP TABLE IF EXISTS `ente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ente` (
  `cpfFK` char(11) NOT NULL,
  `id_ente` mediumint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `data_morte` date NOT NULL,
  `altura` decimal(3,2) NOT NULL,
  `peso` decimal(4,1) NOT NULL,
  `local_enterro` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_ente`),
  KEY `cpfFK` (`cpfFK`),
  CONSTRAINT `ente_ibfk_1` FOREIGN KEY (`cpfFK`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ente`
--

LOCK TABLES `ente` WRITE;
/*!40000 ALTER TABLE `ente` DISABLE KEYS */;
INSERT INTO `ente` VALUES ('12345678900',1,'Getulio Vargas','1955-05-12','2018-09-20',1.75,80.5,'Cemitério Municipal de São Paulo'),('98765432100',2,'Maria Oliveira','1950-03-22','2022-11-10',1.62,70.0,'Cemitério da Consolação, São Paulo'),('11122233344',3,'Horacio Pinto Dahora','1945-07-30','2021-01-05',1.80,80.0,'Cemitério do Araçá, São Paulo'),('22233344455',4,'Cleide Costa','1990-12-15','2019-04-01',1.68,55.0,'Cemitério São João Batista, Rio de Janeiro'),('33344455566',5,'Pedro Santos','1985-01-10','2020-06-15',1.82,90.0,'Cemitério do Caju, Rio de Janeiro'),('44455566677',6,'Luiza Almeida','1975-09-25','2020-08-30',1.60,52.0,'Cemitério Parque das Flores, Belo Horizonte'),('55566677788',7,'Roberto Lima','1930-02-05','2017-12-12',1.78,75.0,'Cemitério da Saudade, Belo Horizonte'),('66677788899',8,'Fernanda Souza','1988-10-12','2015-01-25',1.70,58.0,'Cemitério Jardim da Paz, São Paulo'),('77788899900',9,'Ricardo Mendes','1972-04-20','2016-02-15',1.85,85.0,'Cemitério Municipal de Curitiba'),('88899900011',10,'Patrícia Gomes','1965-06-30','2021-07-18',1.65,62.0,'Cemitério do Campo da Esperança, Brasília'),('99900011122',11,'Gustavo Rocha','1995-11-07','2014-05-10',1.77,72.0,'Cemitério São Pedro, Rio de Janeiro'),('00011122233',12,'Eliane Martins','1948-09-14','2018-04-04',1.58,54.0,'Cemitério da Vila Formosa, São Paulo'),('11122233345',13,'André Carvalho','1978-01-19','2022-11-22',1.74,78.0,'Cemitério Parque dos Lírios, Campinas'),('22233344456',14,'Júlia Ferreira','1982-08-30','2021-03-12',1.64,60.0,'Cemitério Memorial do Carmo, Rio de Janeiro'),('33344455567',15,'Sérgio Nascimento','1955-12-05','2016-10-09',1.96,110.0,'Cemitério Jardim da Saudade, São Paulo');
/*!40000 ALTER TABLE `ente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flor`
--

DROP TABLE IF EXISTS `flor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flor` (
  `id_flor` mediumint NOT NULL AUTO_INCREMENT,
  `tipo_flor` varchar(50) NOT NULL,
  `quantidade` int NOT NULL,
  `tamanho` enum('P','M','G') NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_flor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flor`
--

LOCK TABLES `flor` WRITE;
/*!40000 ALTER TABLE `flor` DISABLE KEYS */;
INSERT INTO `flor` VALUES (1,'Rosa',20,'M',10.50),(2,'Girassol',15,'G',12.00),(3,'Margarida',30,'P',8.00),(4,'Tulipa',25,'M',9.50),(5,'Lírio',10,'G',15.00),(6,'Orquídea',5,'G',25.00),(7,'Crisântemo',40,'P',7.00),(8,'Jasmim',12,'M',11.00),(9,'Violeta',18,'P',6.50),(10,'Hibisco',8,'M',14.00),(11,'Petúnia',22,'G',13.00),(12,'Dália',9,'M',10.00),(13,'Azaléia',14,'P',5.50),(14,'Cala',6,'G',20.00),(15,'Gerânio',16,'M',11.50);
/*!40000 ALTER TABLE `flor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urna`
--

DROP TABLE IF EXISTS `urna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urna` (
  `id_urna` mediumint NOT NULL AUTO_INCREMENT,
  `cor` varchar(50) NOT NULL,
  `tipo_material` varchar(50) NOT NULL,
  `qtd` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tamanho` enum('PEQUENA','MEDIA','GRANDE') NOT NULL,
  PRIMARY KEY (`id_urna`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urna`
--

LOCK TABLES `urna` WRITE;
/*!40000 ALTER TABLE `urna` DISABLE KEYS */;
INSERT INTO `urna` VALUES (1,'Vermelha','Madeira',10,150.00,'PEQUENA'),(2,'Azul','Plástico',5,80.00,'MEDIA'),(3,'Verde','Metal',20,200.00,'GRANDE'),(4,'Amarela','Papelao',15,60.00,'PEQUENA'),(5,'Preta','Vidro',8,300.00,'MEDIA'),(6,'Branca','Madeira',12,180.00,'GRANDE'),(7,'Rosa','Plástico',10,70.00,'PEQUENA'),(8,'Laranja','Metal',7,250.00,'MEDIA'),(9,'Cinza','Papelao',25,50.00,'GRANDE'),(10,'Marrom','Madeira',9,160.00,'PEQUENA'),(11,'Dourada','Vidro',3,500.00,'MEDIA'),(12,'Prateada','Metal',4,400.00,'GRANDE'),(13,'Roxa','Plástico',6,90.00,'PEQUENA'),(14,'Bege','Papelao',11,65.00,'MEDIA'),(15,'Turquesa','Madeira',2,350.00,'GRANDE');
/*!40000 ALTER TABLE `urna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `celular` char(12) NOT NULL,
  `data_nasc` date NOT NULL,
  `senha` varchar(15) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('00011122233','Beatriz Almeida','beatriz.almeida@email.com','Avenida L, 345, Natal - RN','84993456789','1991-02-15','senha909'),('11122233344','Pedro Santos','pedro.santos@email.com','Praça C, 789, Belo Horizonte - MG','03193456789','1988-03-12','senha789'),('11122233345','Gabriel Santos','gabriel.santos@email.com','Rua M, 678, Fortaleza - CE','85994567890','1984-09-30','senha010'),('12345678900','João Silva','joao.silva@email.com','Rua A, 123, São Paulo - SP','01191234567','1985-06-15','senha123'),('22233344455','Ana Lima','ana.lima@email.com','Rua D, 135, Curitiba - PR','04194567890','1995-11-30','senha101'),('22233344456','Lívia Costa','livia.costa@email.com','Praça N, 234, Salvador - BA','71995678901','1993-11-04','senha111'),('33344455566','Lucas Almeida','lucas.almeida@email.com','Avenida E, 246, Salvador - BA','07195678901','1982-01-25','senha202'),('33344455567','Rafael Gomes','rafael.gomes@email.com','Avenida O, 567, Campinas - SP','19996789012','1989-07-21','senha212'),('44455566677','Fernanda Costa','fernanda.costa@email.com','Rua F, 357, Porto Alegre - RS','05196789012','1992-07-04','senha303'),('55566677788','Carlos Pereira','carlos.pereira@email.com','Praça G, 468, Florianópolis - SC','04897890123','1980-09-15','senha404'),('66677788899','Juliana Rocha','juliana.rocha@email.com','Avenida H, 579, Brasília - DF','06198901234','1996-12-10','senha505'),('77788899900','Ricardo Ferreira','ricardo.ferreira@email.com','Rua I, 680, Goiânia - GO','06299012345','1983-05-05','senha606'),('88899900011','Tatiane Martins','tatiane.martins@email.com','Praça J, 791, Manaus - AM','09299123456','1994-10-22','senha707'),('98765432100','Maria Oliveira','maria.oliveira@email.com','Avenida B, 456, Rio de Janeiro - RJ','02192345678','1990-08-20','senha456'),('99900011122','Marcos Vinícius','marcos.vinicius@email.com','Rua K, 902, Recife - PE','81992345678','1987-04-10','senha808');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 21:43:07
