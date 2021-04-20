-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: attendance
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `coordinator`
--

DROP TABLE IF EXISTS `coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinator` (
  `teacher_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  PRIMARY KEY (`section_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `coordinator_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coordinator_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinator`
--

LOCK TABLES `coordinator` WRITE;
/*!40000 ALTER TABLE `coordinator` DISABLE KEYS */;
INSERT INTO `coordinator` VALUES ('t1','csa'),('t4','csb');
/*!40000 ALTER TABLE `coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark` (
  `teacher_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `attendance` varchar(10) NOT NULL,
  `date_of_attendance` date NOT NULL,
  KEY `teacher_id` (`teacher_id`,`section_id`,`subject_id`),
  KEY `student_id` (`student_id`,`section_id`),
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`teacher_id`, `section_id`, `subject_id`) REFERENCES `teacher_section_subject` (`teacher_id`, `section_id`, `subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mark_ibfk_2` FOREIGN KEY (`student_id`, `section_id`) REFERENCES `student` (`student_id`, `section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES ('t1','csa','cn','90','p','2021-04-16'),('t1','csa','cn','90','P','2021-04-20'),('t1','csa','cn','92','P','2021-04-20'),('t1','csa','cn','90','P','2021-04-19'),('t1','csa','cn','92','P','2021-04-19'),('t3','cvb','cv','115','P','2021-04-20'),('t3','cvb','cv','78','A','2021-04-20');
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_name` varchar(50) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('computer','csa'),('computer','csb'),('civil','cva'),('civil','cvb'),('mechanical','mca'),('mechanical','mcb');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_name` varchar(50) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`,`section_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('isshita','113','cva'),('jackiee','115','cvb'),('bhavya','68','csb'),('burhannudin bootwala','71','mca'),('darshika','74','csb'),('deeksha','75','cva'),('deepanshu kumar','76','cva'),('dev ramchandani','78','cvb'),('dhruvansh moyal','80','mcb'),('dhruv bothra','81','mcb'),('gourang khandelwal','90','csa'),('gurneet chhabra','92','csa'),('harshein narang','96','mca');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_name` varchar(50) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('computer network','cn'),('civil','cv'),('internet of everyhing','iot'),('machine learning','ml'),('xml','xml');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_name` varchar(50) NOT NULL,
  `teacher_id` varchar(20) NOT NULL,
  `teacher_password` varchar(30) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('divya kumawat','t1','000000'),('swati ','t2','*'),('poorva','t3','000000'),('sonal','t4','000000');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_section_subject`
--

DROP TABLE IF EXISTS `teacher_section_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_section_subject` (
  `teacher_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  PRIMARY KEY (`teacher_id`,`section_id`,`subject_id`),
  KEY `section_id` (`section_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `teacher_section_subject_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_section_subject_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_section_subject_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_section_subject`
--

LOCK TABLES `teacher_section_subject` WRITE;
/*!40000 ALTER TABLE `teacher_section_subject` DISABLE KEYS */;
INSERT INTO `teacher_section_subject` VALUES ('t1','csa','cn'),('t1','csa','cv'),('t2','csa','cv'),('t4','csb','ml'),('t1','cva','xml'),('t2','cva','cn'),('t3','cvb','cv'),('t1','mca','ml'),('t2','mca','xml'),('t1','mcb','cv'),('t3','mcb','cn'),('t4','mcb','cv');
/*!40000 ALTER TABLE `teacher_section_subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 22:47:58
