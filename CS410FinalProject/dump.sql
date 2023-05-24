-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `point_value` int(11) NOT NULL,
  `category_ID` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `category_ID` (`category_ID`),
  KEY `class_id` (`class_id`),
  KEY `assignment_retrieve` (`assignment_id`,`name`,`point_value`,`category_ID`,`class_id`),
  CONSTRAINT `Assignment_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `Class_categories` (`category_id`),
  CONSTRAINT `Assignment_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
INSERT INTO `Assignment` VALUES (1,'enim','vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel',21,5,1),(2,'nunc vestibulum','nulla suspendisse potenti cras in purus eu magna vulputate luctus cum',24,10,2),(3,'velit','quisque porta volutpat erat quisque erat eros viverra eget congue eget',11,9,3),(4,'vestibulum','ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi',73,5,4),(5,'cursus vestibulum','at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac',57,5,5),(6,'primis','rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede',35,3,6),(7,'at','dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur',27,1,7),(8,'velit','sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut',89,2,8),(9,'molestie hendrerit','donec semper sapien a libero nam dui proin leo odio porttitor id consequat',5,6,9),(10,'sapien','consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor',15,10,10),(11,'felis','elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur',46,3,11),(12,'quam nec','semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum',59,3,12),(13,'in','cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis',56,7,13),(14,'vel','varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at',67,5,14),(15,'non velit','nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio',24,10,15),(16,'magna','habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque',1,10,16),(17,'eros elementum','at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in',80,9,17),(18,'sapien','nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis',46,2,18),(19,'turpis','at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi',25,2,19),(20,'quam','ullamcorper augue a suscipit nulla elit ac nulla sed vel',89,10,20),(21,'HW1','First Homework for CS410',80,1,41),(22,'HW2','Second Homework for CS410',100,1,41),(23,'HW3','Third Homework for CS410',95,1,41),(24,'Midterm 1','Midterm 1 for CS410',100,5,41),(25,'Midterm 2','Midterm 2 for CS410',80,5,41),(26,'Final','Third Homework for CS410',120,6,41);
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_num` varchar(20) NOT NULL,
  `section_num` int(11) NOT NULL,
  `term` varchar(5) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `retrieve_class` (`class_id`,`course_num`,`section_num`,`term`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES (1,'ENGL212',1,'FA19','Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.'),(2,'CS343',1,'SP20','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.'),(3,'CS115',1,'SP21','Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),(4,'CS122',1,'SP19','Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),(5,'CS221',1,'SP19','Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),(6,'CS221',2,'SP20','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.'),(7,'CS221',3,'SP20','Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.'),(8,'CS321',1,'SP22','Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.'),(9,'CS321',2,'SP22','Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.'),(10,'CS321',3,'FA20','Phasellus in felis.'),(11,'CS354',1,'FA21','Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.'),(12,'CS354',2,'FA21','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),(13,'CS253',1,'SP22','In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.'),(14,'CS101',1,'FA20','Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),(15,'CS101',2,'SP20','Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),(16,'CS101',3,'SP20','Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.'),(17,'CS101',4,'FA21','Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.'),(18,'CS121',1,'FA21','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.'),(19,'CS121',2,'SP22','Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.'),(20,'CS121',3,'SP22','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.'),(21,'CS121',4,'SP22','Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),(22,'CS121',5,'FA20','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.'),(23,'CS421',1,'SP21','Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),(24,'CS421',2,'SP22','Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),(25,'MATH361',1,'SP19','Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'),(26,'MATH270',1,'FA17','Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.'),(27,'MATH270',2,'FA15','Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.'),(28,'CS-HU271',1,'SP19','Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),(29,'CS-HU101',1,'FA19','Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.'),(30,'CS-HU310',1,'FA20','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.'),(31,'CS-HU310',2,'SP20','Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.'),(32,'CS-HU310',1,'SP22','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.'),(33,'CS410',1,'SP22','Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.'),(34,'CS410',2,'SP22','Proin at turpis a pede posuere nonummy. Integer non velit.'),(35,'CS361',1,'SP22','Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.'),(36,'CS361',2,'FA21','Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),(37,'CS361',3,'FA21','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.'),(38,'CS361',4,'SP17','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.'),(39,'ENGL101',1,'SP18','Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.'),(40,'ENGL102',1,'SP22','In est risus, auctor sed, tristique in, tempus sit amet, sem.'),(41,'CS410',3,'FA22','This is the complete class for grader testing');
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class_categories`
--

DROP TABLE IF EXISTS `Class_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class_categories`
--

LOCK TABLES `Class_categories` WRITE;
/*!40000 ALTER TABLE `Class_categories` DISABLE KEYS */;
INSERT INTO `Class_categories` VALUES (1,'Assignments'),(3,'Discussions'),(4,'Extra-Credit'),(5,'Final'),(6,'Midterms'),(7,'Papers'),(2,'Quizs'),(8,'Reading'),(10,'Speaking'),(9,'Writing');
/*!40000 ALTER TABLE `Class_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(320) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `retrieve_student` (`student_id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,'Haywood','Meert','hmeert0','hmeert0@unc.edu'),(2,'Johnathan','Orleton','jorleton1','jorleton1@nba.com'),(3,'Norby','Quimby','nquimby2','nquimby2@gravatar.com'),(4,'Liza','McAster','lmcaster3','lmcaster3@netvibes.com'),(5,'Ange','Burgyn','aburgyn4','aburgyn4@nasa.gov'),(6,'Pierrette','Lipson','plipson5','plipson5@google.com.hk'),(7,'Ynez','Fadell','yfadell6','yfadell6@un.org'),(8,'Gary','Veltmann','gveltmann7','gveltmann7@delicious.com'),(9,'Scarface','Janney','sjanney8','sjanney8@state.gov'),(10,'Anitra','Snellman','asnellman9','asnellman9@live.com'),(11,'Sheff','Cartin','scartina','scartina@mozilla.org'),(12,'Tony','Piatek','tpiatekb','tpiatekb@sina.com.cn'),(13,'Northrop','Digweed','ndigweedc','ndigweedc@illinois.edu'),(14,'York','Horick','yhorickd','yhorickd@shutterfly.com'),(15,'Christian','Gillease','cgilleasee','cgilleasee@blogger.com'),(16,'Sibylla','Priddie','spriddief','spriddief@soup.io'),(17,'Maurice','McVie','mmcvieg','mmcvieg@angelfire.com'),(18,'Bendick','Baumer','bbaumerh','bbaumerh@rakuten.co.jp'),(19,'Aleksandr','Fountaine','afountainei','afountainei@si.edu'),(20,'Jammie','Quilligan','jquilliganj','jquilliganj@oracle.com'),(21,'Daniel','Cornell','danielcornell','danielcornell@u.boisestate.edu'),(22,'Matt','Rockenhaus','mattrockenhaus','mattrockenhaus@u.boisestate.edu'),(23,'Jane','Doe','janedoe','janedoe@u.boisestate.edu');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_in`
--

DROP TABLE IF EXISTS `enrolled_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled_in` (
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  KEY `class_id` (`class_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `enrolled_in_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`),
  CONSTRAINT `enrolled_in_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_in`
--

LOCK TABLES `enrolled_in` WRITE;
/*!40000 ALTER TABLE `enrolled_in` DISABLE KEYS */;
INSERT INTO `enrolled_in` VALUES (1,13),(2,10),(3,12),(4,12),(5,20),(6,15),(7,17),(8,14),(9,18),(10,10),(11,4),(12,7),(13,8),(14,20),(15,12),(16,6),(17,17),(18,13),(19,4),(20,11),(21,11),(22,2),(23,1),(24,7),(25,3),(26,3),(27,16),(28,20),(29,13),(30,19),(31,4),(32,5),(33,20),(34,12),(35,4),(36,4),(37,11),(38,14),(39,15),(40,2),(1,13),(2,14),(3,13),(4,18),(5,11),(6,8),(7,17),(8,17),(9,20),(10,12),(11,1),(12,10),(13,11),(14,2),(15,6),(16,10),(17,14),(18,6),(19,5),(20,4),(21,18),(22,2),(23,17),(24,1),(25,9),(26,11),(27,18),(28,13),(29,7),(30,18),(31,4),(32,6),(33,16),(34,16),(35,2),(36,15),(37,6),(38,12),(39,9),(40,16),(1,1),(2,15),(3,5),(4,5),(5,20),(6,7),(7,18),(8,18),(9,18),(10,11),(11,4),(12,7),(13,16),(14,13),(15,13),(16,10),(17,2),(18,8),(19,6),(20,7),(21,10),(22,3),(23,20),(24,8),(25,10),(26,2),(27,9),(28,17),(29,20),(30,20),(31,3),(32,19),(33,12),(34,13),(35,4),(36,12),(37,19),(38,15),(39,20),(40,9),(41,21),(41,22),(41,23);
/*!40000 ALTER TABLE `enrolled_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_on`
--

DROP TABLE IF EXISTS `grade_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_on` (
  `assignment_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  KEY `assignment_id` (`assignment_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `grade_on_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `Assignment` (`assignment_id`),
  CONSTRAINT `grade_on_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_on`
--

LOCK TABLES `grade_on` WRITE;
/*!40000 ALTER TABLE `grade_on` DISABLE KEYS */;
INSERT INTO `grade_on` VALUES (1,8,54),(2,16,62),(3,2,67),(4,15,64),(5,4,58),(6,3,78),(7,8,61),(8,17,94),(9,4,59),(10,15,63),(11,8,76),(12,6,70),(13,11,100),(14,12,98),(15,8,70),(16,11,71),(17,12,56),(18,14,54),(19,16,71),(20,2,53),(22,21,88),(21,21,68),(21,22,88),(21,23,76),(22,21,88),(22,22,94),(22,23,56),(24,21,89),(24,22,80),(24,23,92),(25,21,82),(25,22,67),(25,23,73);
/*!40000 ALTER TABLE `grade_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weighted`
--

DROP TABLE IF EXISTS `weighted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weighted` (
  `class_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  KEY `class_id` (`class_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `weighted_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `Class` (`class_id`),
  CONSTRAINT `weighted_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Class_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weighted`
--

LOCK TABLES `weighted` WRITE;
/*!40000 ALTER TABLE `weighted` DISABLE KEYS */;
INSERT INTO `weighted` VALUES (1,4,9),(2,6,50),(3,8,18),(4,8,49),(5,8,91),(6,8,29),(7,4,26),(8,5,31),(9,8,49),(10,9,38),(11,6,4),(12,3,63),(13,6,38),(14,9,100),(15,8,19),(16,8,14),(17,3,28),(18,5,20),(19,9,46),(20,4,76),(21,8,64),(22,7,25),(23,1,73),(24,9,55),(25,2,34),(26,3,59),(27,9,39),(28,10,83),(29,6,99),(30,1,98),(31,5,90),(32,7,3),(33,3,59),(34,4,75),(35,2,19),(36,3,99),(37,3,80),(38,5,14),(39,5,68),(40,9,29),(1,3,91),(2,5,50),(3,3,82),(4,6,51),(5,7,9),(6,5,71),(7,5,74),(8,4,69),(9,5,51),(10,7,62),(11,10,96),(12,1,37),(13,5,62),(14,8,0),(15,9,81),(16,3,86),(17,10,72),(18,2,80),(19,1,54),(20,6,24),(21,1,36),(22,2,75),(23,3,27),(24,6,45),(25,7,66),(26,4,41),(27,7,61),(28,9,17),(29,7,1),(30,6,2),(31,9,10),(32,5,97),(33,5,41),(34,2,25),(35,8,81),(36,8,1),(37,5,20),(38,8,86),(39,2,32),(40,5,71),(21,7,9),(21,10,15),(41,1,50),(41,6,30),(41,5,20);
/*!40000 ALTER TABLE `weighted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 10:22:41
