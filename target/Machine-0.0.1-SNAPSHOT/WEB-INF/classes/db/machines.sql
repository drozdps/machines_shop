-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: machine
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `cnc`
--

DROP TABLE IF EXISTS `cnc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `config` text,
  `descr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnc`
--

LOCK TABLES `cnc` WRITE;
/*!40000 ALTER TABLE `cnc` DISABLE KEYS */;
INSERT INTO `cnc` VALUES (1,'AMNC','AMNC-F','10 mb памяти, абсолютное и относительное программирование','Почти все станки AMADA оснащены удобной в управлении мультимедийной системой ЧПУ AMNC (AMADA Multimedia Network Controller), которая позволяет оператору быстро освоить управление различными станками. ЧПУ AMNC гарантирует простое и безошибочное управление даже при работе с несколькими станками, независимо от того управляется ли станок прямо со стойки ЧПУ или с помощью удаленного компьютера через Интернет. При использовании программного обеспечения АР100, ЧПУ AMNC сохраняет все связанные с работой данные, которые потом могут быть вызваны в любое время. Одна из опций позволяет использовать систему считывания штрих-кодов для быстрого доступа к необходимой программе.');
/*!40000 ALTER TABLE `cnc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_dimensions` varchar(45) DEFAULT NULL,
  `max_thick` float DEFAULT NULL,
  `max_weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES (1,'2500x1270',3.2,150);
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(80) NOT NULL,
  `machine_type` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(70) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `punch_force` float DEFAULT NULL,
  `x_move` float DEFAULT NULL,
  `y_move` float DEFAULT NULL,
  `list_id` int(11) NOT NULL,
  `cnc_id` int(11) NOT NULL,
  `turret_id` int(11) NOT NULL,
  `instr_descr` text,
  `model` varchar(45) DEFAULT NULL,
  `pos_accuracy` varchar(45) DEFAULT NULL,
  `max_speed` int(11) DEFAULT NULL,
  `voltage` int(11) DEFAULT NULL,
  `stand_descr` varchar(45) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `air_compress` int(11) DEFAULT NULL,
  `dimensions` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`,`list_id`,`cnc_id`,`turret_id`),
  UNIQUE KEY `width_UNIQUE` (`condition`),
  KEY `fk_truck_mining_transmission1_idx` (`list_id`),
  KEY `fk_truck_mining_engine1_idx` (`cnc_id`),
  KEY `fk_truck_mining_brake1_idx` (`turret_id`),
  CONSTRAINT `machine_cnc` FOREIGN KEY (`cnc_id`) REFERENCES `cnc` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `machine_list` FOREIGN KEY (`list_id`) REFERENCES `list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `machine_turret` FOREIGN KEY (`turret_id`) REFERENCES `turret` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (1,'EM-2510 NT','Координатно пробивной пресс','Amada','USA',2007,'new','Russia',200,1250,1250,1,1,1,'Инструмент международного и универсального образца изготовлен из прочной стали, обладающий высокой точностью, высокой стойкостью инструмента и не требующий настройки после его замены. Радиус действия может быть расширен с помощью автоматического индексирования.','EM-2510 NT','±0,1',128,400,'O-образная ',18,250,NULL,'Прессы серии ЕМ представляют новое измерение энергоэффективного производства. Сердцем станка является инновационный запатентованный двойной сервоэлектрический привод. Этот совершенно новый и практически не требующих обслуживания привод сочетает в себе преимущества механических штамповочных прессов с лучшими сторонами работы высокоскоростных гидравлических прессов. Благодаря мультимедийному ЧПУ AMNC прессы серии ЕМ чрезвычайно удобны в управлении. Серия ЕМ в сочетании с концепцией штамповочного инструмента AMADA и широким выбором дополнительного оснащения открывает для Вашего производства возможность устанавливать стандарты качества.');
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_has_photo`
--

DROP TABLE IF EXISTS `machine_has_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_has_photo` (
  `machine_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`machine_id`,`photo_id`),
  KEY `fk_truck_mining_has_photo_photo1_idx` (`photo_id`),
  KEY `fk_truck_mining_has_photo_truck_mining1_idx` (`machine_id`),
  CONSTRAINT `machine_has_photo_photo1` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `machine_has_photo_truck_mining1` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_has_photo`
--

LOCK TABLES `machine_has_photo` WRITE;
/*!40000 ALTER TABLE `machine_has_photo` DISABLE KEYS */;
INSERT INTO `machine_has_photo` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `machine_has_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payload_capacity`
--

DROP TABLE IF EXISTS `payload_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payload_capacity` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payload_capacity`
--

LOCK TABLES `payload_capacity` WRITE;
/*!40000 ALTER TABLE `payload_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `payload_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'yangly_mp_10_30.png'),(2,'yangly_mp_10_30_stand.png'),(3,'yangly_mp_10_30_instr.png'),(4,'yangly_fanuc_cnc.png');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turret`
--

DROP TABLE IF EXISTS `turret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_diam` float DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `rot_speed` int(11) DEFAULT NULL,
  `stations_num` int(11) DEFAULT NULL,
  `axis_num` int(11) DEFAULT NULL,
  `index_station_max_diam` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turret`
--

LOCK TABLES `turret` WRITE;
/*!40000 ALTER TABLE `turret` DISABLE KEYS */;
INSERT INTO `turret` VALUES (1,114.3,NULL,30,45,3,NULL);
/*!40000 ALTER TABLE `turret` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-30 20:04:22
