-- MySQL dump 10.11
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

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
-- Current Database: `cinema`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cinema` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cinema`;

--
-- Table structure for table `ator`
--

DROP TABLE IF EXISTS `ator`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ator` (
  `cod_ator` int(3) NOT NULL,
  `idade` int(2) default NULL,
  `nome` char(30) default NULL,
  `nacionalidade` char(30) default NULL,
  PRIMARY KEY  (`cod_ator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ator`
--

LOCK TABLES `ator` WRITE;
/*!40000 ALTER TABLE `ator` DISABLE KEYS */;
INSERT INTO `ator` VALUES (1,32,'matt damon','canadense'),(2,45,'george clooney','americano'),(3,39,'brad pitt','americano'),(4,35,'julia roberts','americana'),(5,36,'catherine zeta jones','americana'),(6,42,'jim carrey','americano'),(7,38,'angelina jolie','americana'),(8,43,'tom hanks','americano'),(9,30,'julia paes','brasileira'),(10,35,'luana piovani','brasileira'),(11,35,'lazaro ramos','brasileiro');
/*!40000 ALTER TABLE `ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cinema` (
  `cod_cinema` int(3) NOT NULL,
  `nome` char(30) default NULL,
  `enredeco` char(50) default NULL,
  `cidade` char(30) default NULL,
  `estado` char(2) default NULL,
  `capacidade` int(4) default NULL,
  PRIMARY KEY  (`cod_cinema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'cidade das flores','joao colin 1234','joinville','sc',120),(2,'muller','visconde taunay 123','joinville','sc',120),(3,'central','av brasil 11000','curitiba','pr',230),(4,'central','av brasil 220','jaragua do sul','sc',30);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elenco`
--

DROP TABLE IF EXISTS `elenco`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `elenco` (
  `cod_ator` int(3) NOT NULL,
  `cod_filme` int(3) NOT NULL,
  PRIMARY KEY  (`cod_ator`,`cod_filme`),
  KEY `cod_filme` (`cod_filme`),
  CONSTRAINT `elenco_ibfk_2` FOREIGN KEY (`cod_filme`) REFERENCES `filme` (`cod_filme`),
  CONSTRAINT `elenco_ibfk_1` FOREIGN KEY (`cod_ator`) REFERENCES `ator` (`cod_ator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `elenco`
--

LOCK TABLES `elenco` WRITE;
/*!40000 ALTER TABLE `elenco` DISABLE KEYS */;
INSERT INTO `elenco` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(7,3),(8,4),(8,5),(9,6),(10,7),(11,7);
/*!40000 ALTER TABLE `elenco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `filme` (
  `cod_filme` int(3) NOT NULL,
  `tituloO` char(30) default NULL,
  `tituloP` char(30) default NULL,
  `impropriedade` char(10) default NULL,
  `duracao` int(3) default NULL,
  `pais_origem` char(20) default NULL,
  `genero` int(3) default NULL,
  `diretor` int(3) default NULL,
  PRIMARY KEY  (`cod_filme`),
  KEY `genero` (`genero`),
  KEY `diretor` (`diretor`),
  CONSTRAINT `filme_ibfk_2` FOREIGN KEY (`diretor`) REFERENCES `ator` (`cod_ator`),
  CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `genero` (`cod_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Oceans eleven','Onze homens e um segredo','14 anos',135,'estados unidos',3,1),(2,'ace ventura','ace ventura','livre',130,'estados unidos',8,8),(3,'the wanted','a procurada','18 anos',145,'estados unidos',1,7),(4,'the terminal','o terminal','livre',140,'estados unidos',1,7),(5,'cast away','o naufrago','livre',122,'estados unidos',1,7),(6,'a musa da borracharia','a musa da borracharia','21 anos',100,'brasil',6,7),(7,'o homem que copiava','o homem que copiava','14 anos',118,'brasil',3,7);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `genero` (
  `cod_genero` int(3) NOT NULL,
  `descricao` char(30) default NULL,
  PRIMARY KEY  (`cod_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'drama'),(2,'romance'),(3,'aventura'),(4,'terror'),(5,'suspence'),(6,'acao'),(7,'animacao'),(8,'comedia'),(9,'comedia romantica'),(10,'documentario'),(11,'faroeste'),(12,'ficcao cientifica'),(13,'guerra'),(14,'musical'),(15,'policial');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessao`
--

DROP TABLE IF EXISTS `sessao`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessao` (
  `dthr` datetime NOT NULL,
  `publico` int(3) default NULL,
  `cinema` int(3) NOT NULL default '0',
  `filme` int(3) NOT NULL default '0',
  PRIMARY KEY  (`dthr`,`filme`,`cinema`),
  KEY `filme` (`filme`),
  KEY `cinema` (`cinema`),
  CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`filme`) REFERENCES `filme` (`cod_filme`),
  CONSTRAINT `sessao_ibfk_2` FOREIGN KEY (`cinema`) REFERENCES `cinema` (`cod_cinema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sessao`
--

LOCK TABLES `sessao` WRITE;
/*!40000 ALTER TABLE `sessao` DISABLE KEYS */;
INSERT INTO `sessao` VALUES ('2008-09-10 15:25:00',120,3,5),('2008-09-10 18:25:00',120,3,7),('2008-09-12 15:25:00',120,1,2),('2008-09-12 15:25:00',120,2,2),('2008-09-21 19:25:00',120,1,1);
/*!40000 ALTER TABLE `sessao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-09-09 18:37:35
