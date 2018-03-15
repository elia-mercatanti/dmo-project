CREATE DATABASE  IF NOT EXISTS `dmo_project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dmo_project`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dmo_project
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Temporary view structure for view `cluster_career`
--

DROP TABLE IF EXISTS `cluster_career`;
/*!50001 DROP VIEW IF EXISTS `cluster_career`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cluster_career` AS SELECT 
 1 AS `student_id`,
 1 AS `test_grade`,
 1 AS `hs_diploma_grade`,
 1 AS `grade_weighted_avg`,
 1 AS `exams_taken`,
 1 AS `total_cfu`,
 1 AS `years`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cluster_exams`
--

DROP TABLE IF EXISTS `cluster_exams`;
/*!50001 DROP VIEW IF EXISTS `cluster_exams`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cluster_exams` AS SELECT 
 1 AS `student_id`,
 1 AS `B006800`,
 1 AS `B006801`,
 1 AS `B006802`,
 1 AS `B006803`,
 1 AS `B006804`,
 1 AS `B006807`,
 1 AS `B006808`,
 1 AS `B006813`,
 1 AS `B006818`,
 1 AS `B015325`,
 1 AS `B018756`,
 1 AS `B018757`,
 1 AS `B018760`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` char(7) NOT NULL COMMENT 'Store the identification code of a course',
  `cfu` tinyint(3) NOT NULL COMMENT 'Store the cfu assigned to a course',
  `description` varchar(100) NOT NULL COMMENT 'Store the description of a course',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `exam_id_UNIQUE` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that store varius information for the courses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('B006800',12,'ALGORITMI E STRUTTURE DATI'),('B006801',12,'ANALISI I: CALCOLO DIFFERENZIALE ED INTEGRALE'),('B006802',12,'ARCHITETTURE DEGLI ELABORATORI'),('B006803',9,'MATEMATICA DISCRETA E LOGICA'),('B006804',12,'PROGRAMMAZIONE'),('B006807',6,'ALGEBRA LINEARE'),('B006808',6,'ANALISI II: FUNZIONI DI PIU\' VARIABILI'),('B006813',9,'BASI DI DATI E SISTEMI INFORMATIVI'),('B006818',9,'SISTEMI OPERATIVI'),('B015325',9,'FISICA GENERALE'),('B018756',9,'METODOLOGIE DI PROGRAMMAZIONE'),('B018757',6,'PROGRAMMAZIONE CONCORRENTE'),('B018760',6,'CALCOLO DELLE PROBABILITA\' E STATISTICA');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `student_id` char(1) NOT NULL COMMENT 'Store the identification code of a student',
  `course_id` char(7) NOT NULL COMMENT 'Store the identification code of a course',
  `date` date NOT NULL COMMENT 'Store the date of the exam (passed)',
  `grade` tinyint(3) NOT NULL COMMENT 'Store the grade obtained in a particular exam',
  `semester` tinyint(3) NOT NULL COMMENT 'Store the semester in which the exam was passed',
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `fk_course_id_idx` (`course_id`),
  CONSTRAINT `fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that store the information on the exams taken by the students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES ('A','B006800','2014-07-17',29,1),('A','B006801','2014-06-10',30,1),('A','B006802','2014-06-12',25,1),('A','B006804','2014-09-02',30,1),('A','B006807','2015-01-16',24,2),('A','B006808','2017-01-23',18,6),('A','B006813','2017-01-27',20,6),('A','B018756','2015-01-20',29,2),('A','B018757','2015-03-04',29,2),('A','B018760','2017-02-03',25,6),('B','B006800','2014-06-12',26,1),('B','B006801','2014-09-09',20,1),('B','B006802','2016-01-28',21,4),('B','B006803','2016-08-02',18,5),('B','B006804','2014-07-29',26,1),('B','B006807','2016-01-11',22,4),('B','B006808','2015-07-14',28,3),('B','B006813','2015-07-30',19,3),('B','B006818','2017-01-17',23,6),('B','B018756','2015-02-16',23,2),('C','B006800','2014-09-12',28,1),('C','B006802','2016-09-19',22,5),('C','B006804','2014-07-28',26,1),('C','B006813','2016-02-09',26,4),('C','B006818','2017-02-09',22,6),('C','B018756','2016-02-18',26,4),('C','B018757','2017-02-02',23,6),('D','B006800','2016-01-19',20,2),('D','B006801','2015-09-11',28,1),('D','B006802','2016-07-18',22,3),('D','B006804','2015-09-23',22,1),('D','B006807','2016-02-08',21,2),('D','B006808','2016-06-21',31,3),('D','B018760','2016-06-10',18,3),('E','B006800','2015-09-17',28,1),('E','B006801','2016-01-29',27,2),('F','B006800','2015-06-11',24,1),('F','B006801','2015-06-25',28,1),('F','B006802','2016-02-12',23,2),('F','B006803','2016-08-02',24,3),('F','B006804','2015-09-01',24,1),('F','B006807','2016-02-08',29,2),('F','B006813','2016-06-13',22,3),('F','B018757','2016-09-22',19,3),('G','B006800','2015-06-12',26,1),('G','B006801','2015-07-24',30,1),('G','B006802','2016-02-12',27,2),('G','B006803','2015-09-15',23,1),('G','B006804','2015-06-30',31,1),('G','B006807','2016-01-11',28,2),('G','B006808','2016-06-21',27,3),('G','B006813','2016-07-19',28,3),('G','B006818','2017-01-17',25,4),('G','B018756','2016-02-25',30,2),('G','B018757','2016-07-25',24,3),('G','B018760','2016-01-08',27,2),('H','B006800','2015-07-10',30,1),('H','B006801','2015-06-25',31,1),('H','B006802','2015-09-14',21,1),('H','B006803','2015-06-15',23,1),('H','B006804','2015-07-28',30,1),('H','B006807','2016-01-11',25,2),('H','B006808','2016-06-21',25,3),('H','B006813','2016-07-19',24,3),('H','B006818','2016-07-19',24,3),('H','B018757','2016-02-04',28,2),('H','B018760','2016-06-10',30,3),('I','B006800','2015-09-17',23,1),('I','B006801','2015-07-27',23,1),('I','B006807','2016-01-11',24,2),('I','B006808','2016-06-20',27,3),('I','B018757','2016-02-04',28,2),('I','B018760','2016-02-10',20,2),('J','B006800','2015-09-07',24,1),('J','B006801','2015-06-15',24,1),('J','B006803','2015-09-15',20,1),('J','B006804','2015-06-15',22,1),('J','B006807','2016-11-01',22,3),('J','B006808','2016-06-21',24,3),('J','B006813','2016-06-13',22,3),('J','B015325','2016-09-20',27,3),('J','B018757','2016-06-21',25,3),('J','B018760','2016-10-02',25,3),('K','B006800','2016-07-08',31,1),('K','B006801','2016-07-13',29,1),('K','B006802','2016-06-09',20,1),('K','B006803','2016-06-15',28,1),('K','B006804','2016-09-15',26,1),('K','B006807','2017-01-11',24,2),('K','B006808','2017-06-28',18,3),('K','B006813','2017-06-19',28,3),('K','B006818','2017-07-28',28,3),('K','B015325','2017-09-13',24,3),('K','B018756','2017-01-20',25,2),('K','B018757','2017-02-20',30,2),('K','B018760','2017-01-13',27,2),('L','B006800','2016-06-10',31,1),('L','B006801','2016-07-13',31,1),('L','B006802','2016-07-18',30,1),('L','B006803','2016-07-04',26,1),('L','B006804','2016-09-15',30,1),('L','B006807','2017-01-11',30,2),('L','B006808','2017-07-03',26,3),('L','B006813','2017-09-15',31,3),('L','B006818','2017-07-28',28,3),('L','B015325','2017-07-21',25,3),('L','B018756','2017-01-20',28,2),('L','B018757','2017-02-20',31,2),('L','B018760','2017-02-03',31,2),('M','B006800','2016-06-10',30,1),('M','B006801','2017-01-31',27,2),('M','B006804','2016-09-20',27,1),('M','B006808','2017-06-28',18,3),('M','B006813','2017-06-19',30,3),('M','B018756','2017-02-09',28,2),('N','B006800','2016-06-10',28,1),('N','B006801','2016-06-23',19,1),('N','B006802','2017-02-24',18,2),('N','B006803','2017-09-26',21,3),('N','B006804','2016-07-26',28,1),('N','B006807','2017-01-11',19,2),('N','B006808','2017-07-03',30,3),('N','B006813','2017-06-19',23,3),('N','B006818','2017-07-11',23,3),('N','B018756','2017-01-20',28,2),('N','B018757','2017-02-20',21,2),('N','B018760','2017-01-13',23,2),('O','B006800','2016-10-06',24,1),('O','B006801','2016-07-13',22,1),('O','B006802','2017-08-09',20,3),('O','B006804','2016-09-20',27,1),('O','B006807','2017-08-02',18,3),('O','B006808','2017-03-07',18,2),('O','B018756','2017-12-07',23,3),('O','B018757','2017-11-07',30,3),('P','B006800','2016-10-06',27,1),('P','B006801','2016-07-13',25,1),('P','B006802','2016-09-06',27,1),('P','B006803','2017-09-26',26,3),('P','B006804','2017-01-13',21,2),('P','B006807','2017-11-01',31,3),('P','B006808','2017-06-28',18,3),('P','B006813','2017-04-07',25,2),('P','B006818','2017-07-28',26,3),('P','B018756','2017-07-06',24,3),('P','B018757','2017-06-15',25,3),('P','B018760','2017-01-13',24,2),('Q','B006800','2016-06-15',27,1),('Q','B006801','2016-07-13',27,1),('Q','B006802','2017-06-15',20,3),('Q','B006804','2016-07-26',24,1),('Q','B006807','2017-01-11',22,2),('Q','B006808','2017-06-28',18,3),('Q','B006813','2017-07-04',23,3),('Q','B018756','2017-06-07',25,3),('Q','B018757','2017-06-15',26,3),('Q','B018760','2017-01-13',20,2),('R','B006800','2016-06-10',31,1),('R','B006801','2016-07-13',31,1),('R','B006802','2016-06-09',30,1),('R','B006803','2016-09-08',28,1),('R','B006804','2016-06-28',31,1),('R','B006807','2017-01-11',31,2),('R','B006808','2017-07-03',30,3),('R','B006813','2017-06-19',31,3),('R','B006818','2017-07-11',28,3),('R','B018756','2017-01-20',31,2),('R','B018757','2017-01-30',31,2),('R','B018760','2017-02-03',31,2),('S','B006800','2016-10-06',29,1),('S','B006801','2016-06-16',23,1),('S','B006802','2016-07-18',30,1),('S','B006803','2016-07-09',20,1),('S','B006804','2016-07-26',24,1),('S','B006807','2016-11-01',31,1),('S','B006808','2016-09-23',18,1),('S','B006813','2017-06-19',31,3),('S','B006818','2017-07-28',22,3),('S','B015325','2017-09-14',23,3),('S','B018756','2017-01-20',29,2),('S','B018757','2017-01-30',30,2),('S','B018760','2017-03-02',29,2),('T','B006800','2016-07-08',25,1),('T','B006801','2017-06-27',27,3),('T','B006802','2016-09-19',19,1),('T','B006804','2017-02-20',27,2),('T','B006807','2017-02-08',24,2),('T','B006808','2017-07-03',25,3),('T','B006813','2017-06-19',24,3),('T','B018757','2017-07-11',24,3),('U','B006800','2016-06-14',24,1),('U','B006802','2016-09-19',21,1),('U','B006804','2016-07-26',26,1),('U','B006807','2017-01-11',27,2),('U','B006808','2016-10-12',18,1),('U','B006813','2017-07-04',21,3),('U','B006818','2017-09-14',21,3),('U','B018756','2017-02-20',28,2),('U','B018757','2017-01-30',22,2),('U','B018760','2017-02-03',20,2),('V','B006800','2016-09-16',22,1),('V','B006801','2016-06-23',25,1),('V','B006802','2017-07-13',18,3),('V','B006804','2017-06-29',27,3),('V','B018756','2017-07-12',22,3),('W','B006800','2016-10-06',30,1),('W','B006801','2016-06-23',31,1),('W','B006802','2016-07-18',28,1),('W','B006803','2016-06-15',30,1),('W','B006804','2016-09-15',27,1),('W','B006807','2017-11-01',30,3),('W','B006808','2017-03-07',30,2),('W','B006813','2017-06-19',31,3),('W','B006818','2017-09-14',26,3),('W','B015325','2017-09-13',28,3),('W','B018756','2017-01-20',31,2),('W','B018757','2017-01-30',31,2),('W','B018760','2017-01-13',31,2),('X','B006800','2016-10-06',24,1),('X','B006801','2016-07-15',23,1),('X','B006802','2017-08-09',23,3),('X','B006804','2016-09-20',24,1),('X','B006807','2017-11-01',18,3),('X','B006808','2017-06-28',18,3),('X','B006813','2017-04-07',23,2),('X','B018756','2017-01-20',31,2),('X','B018757','2017-01-30',25,2),('X','B018760','2017-09-06',19,3),('Y','B006800','2016-10-06',28,1),('Y','B006801','2016-06-29',23,1),('Y','B006802','2016-09-06',30,1),('Y','B006804','2016-06-28',27,1),('Y','B006807','2017-01-15',25,2),('Y','B006808','2017-06-15',23,3),('Y','B006813','2016-06-09',24,1),('Y','B006818','2017-06-16',27,3),('Y','B015325','2017-09-13',22,3),('Y','B018756','2017-08-02',28,3),('Y','B018757','2016-08-02',23,1),('Z','B006800','2016-07-08',30,1),('Z','B006801','2016-07-15',30,1),('Z','B006802','2016-06-09',19,1),('Z','B006803','2016-08-01',25,1),('Z','B006804','2016-06-28',31,1),('Z','B006807','2017-01-12',29,2),('Z','B006808','2017-07-03',25,3),('Z','B006813','2017-06-19',31,3),('Z','B006818','2017-07-28',25,3),('Z','B015325','2017-07-20',23,3),('Z','B018756','2017-01-20',28,2),('Z','B018757','2017-02-20',30,2),('Z','B018760','2017-01-13',31,2);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` char(1) NOT NULL COMMENT 'Store the identification code of a student',
  `cohort` year(4) NOT NULL COMMENT 'Store the cohort of a student',
  `test_grade` tinyint(3) NOT NULL COMMENT 'Store the grade obtained in the entrance test',
  `hs_diploma_grade` tinyint(3) NOT NULL COMMENT 'Store the grade of the high school diploma',
  `hs_diploma_title` char(2) NOT NULL COMMENT 'Store the title of the high school diploma',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that store student''s informations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('A',2013,18,80,'IT'),('B',2013,13,67,'IT'),('C',2013,18,78,'IT'),('D',2014,14,66,'LS'),('E',2014,16,82,'TC'),('F',2014,16,78,'LS'),('G',2014,20,100,'TC'),('H',2014,20,76,'LS'),('I',2014,23,70,'LS'),('J',2014,17,69,'LS'),('K',2015,19,100,'IT'),('L',2015,17,80,'LS'),('M',2015,15,91,'TC'),('N',2015,16,81,'IT'),('O',2015,16,63,'IT'),('P',2015,17,89,'LS'),('Q',2015,20,80,'LS'),('R',2015,22,81,'LS'),('S',2015,16,90,'LC'),('T',2015,22,78,'LS'),('U',2015,18,79,'TC'),('V',2015,14,87,'IT'),('W',2015,16,100,'LS'),('X',2015,12,70,'LS'),('Y',2015,17,86,'LS'),('Z',2015,19,81,'TC');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cluster_career`
--

/*!50001 DROP VIEW IF EXISTS `cluster_career`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cluster_career` AS select `students`.`student_id` AS `student_id`,`students`.`test_grade` AS `test_grade`,`students`.`hs_diploma_grade` AS `hs_diploma_grade`,round((sum((`exams`.`grade` * `courses`.`cfu`)) / sum(`courses`.`cfu`)),0) AS `grade_weighted_avg`,count(0) AS `exams_taken`,sum(`courses`.`cfu`) AS `total_cfu`,(year(max(`exams`.`date`)) - `students`.`cohort`) AS `years` from ((`students` join `exams` on((`students`.`student_id` = `exams`.`student_id`))) join `courses` on((`exams`.`course_id` = `courses`.`course_id`))) group by `students`.`student_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cluster_exams`
--

/*!50001 DROP VIEW IF EXISTS `cluster_exams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cluster_exams` AS select `exams`.`student_id` AS `student_id`,max((case when (`exams`.`course_id` = 'B006800') then `exams`.`grade` end)) AS `B006800`,max((case when (`exams`.`course_id` = 'B006801') then `exams`.`grade` end)) AS `B006801`,max((case when (`exams`.`course_id` = 'B006802') then `exams`.`grade` end)) AS `B006802`,max((case when (`exams`.`course_id` = 'B006803') then `exams`.`grade` end)) AS `B006803`,max((case when (`exams`.`course_id` = 'B006804') then `exams`.`grade` end)) AS `B006804`,max((case when (`exams`.`course_id` = 'B006807') then `exams`.`grade` end)) AS `B006807`,max((case when (`exams`.`course_id` = 'B006808') then `exams`.`grade` end)) AS `B006808`,max((case when (`exams`.`course_id` = 'B006813') then `exams`.`grade` end)) AS `B006813`,max((case when (`exams`.`course_id` = 'B006818') then `exams`.`grade` end)) AS `B006818`,max((case when (`exams`.`course_id` = 'B015325') then `exams`.`grade` end)) AS `B015325`,max((case when (`exams`.`course_id` = 'B018756') then `exams`.`grade` end)) AS `B018756`,max((case when (`exams`.`course_id` = 'B018757') then `exams`.`grade` end)) AS `B018757`,max((case when (`exams`.`course_id` = 'B018760') then `exams`.`grade` end)) AS `B018760` from `exams` group by `exams`.`student_id` */;
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

-- Dump completed on 2018-01-15 20:06:02
