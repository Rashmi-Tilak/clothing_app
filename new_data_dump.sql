-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: clothing_store
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `CustomUser`
--

DROP TABLE IF EXISTS `CustomUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `otp` varchar(20) DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL,
  `display_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomUser`
--

LOCK TABLES `CustomUser` WRITE;
/*!40000 ALTER TABLE `CustomUser` DISABLE KEYS */;
INSERT INTO `CustomUser` VALUES (1,'2023-08-07 11:17:00.183113',1,'','',1,1,'2023-08-02 10:31:26.728249','1111111111',0,'rashmi','pbkdf2_sha256$600000$Wyopk9Ag4WVljxnVu4IHkF$HwOoBcxCd/hGyAVA0uuMbs2yuKpf06fp2TtlIkeswnk=','rashmimce08@gmail.com','',NULL,0,NULL),(2,NULL,0,'','',0,1,'2023-08-02 12:37:36.691448','2222222222',1,'Manveer','pbkdf2_sha256$600000$dnJwq1DELuWXeuXf9poq1h$RmTd7lSoUdRhjcBWe05YCjrcbcgZNVyDSlW8IYZr5Ds=','manveer@gmail.com','hgfgfvhjvhj','855433',0,NULL),(3,NULL,0,'','',0,1,'2023-08-02 14:13:07.490227','4444444444',1,'Purab','pbkdf2_sha256$600000$GJEJpWyP285syBN6TJ5lME$EzsJKTMMRzNqmrVfQpBNrAVBpdl7n49UHXynnQbjL0Y=','purab@gmail.com','vhjbvkj ','056258',0,NULL),(4,NULL,0,'','',0,1,'2023-08-03 09:38:22.998181','7777777777',1,'geetha','pbkdf2_sha256$600000$fWhID3sVhaDaO4wVlZl1oH$kIYiJGhRMSIQgYTgpj6DJyAiyZcA4C+R20n8HSWp+O4=','geetha@gmail.com','fxchgc h','429277',0,NULL),(5,NULL,0,'','',0,1,'2023-08-04 12:45:24.780006','12121212',1,'nani','pbkdf2_sha256$600000$bnYVp3gRJMPcZVeFOQh8SD$97Dsues1dM3g+KeY9DyvGQ/Ulp+y6pyFSPPeEPtK3zA=','nani@gmail.com','zaghfczv','108487',0,NULL),(6,NULL,0,'','',0,1,'2023-08-07 03:30:18.231586','6361233478',1,'pranjal','pbkdf2_sha256$600000$UP5PNtHDshtmqMFg73yyUR$IBFQxO4DanjIENOaImTu0leX3lXJMjKDoAVC42lcbPA=','pranjal@gmail.com','jzvhjz','141631',0,NULL),(7,NULL,0,'','',0,1,'2023-08-07 03:32:02.399683','2132',1,'sana','pbkdf2_sha256$600000$5kxDSXgfDrsb5KbcG0fMLS$tut1x5H5UK80Drf30bqhUt/NoehroF7zL7VpjIo1P5A=','sana@gmail.com','dfvfdvc','497509',0,NULL);
/*!40000 ALTER TABLE `CustomUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomUser_groups`
--

DROP TABLE IF EXISTS `CustomUser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomUser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomUser_groups_customuser_id_group_id_0bc16e04_uniq` (`customuser_id`,`group_id`),
  KEY `CustomUser_groups_group_id_17a2eea6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `CustomUser_groups_customuser_id_d457a31a_fk_CustomUser_id` FOREIGN KEY (`customuser_id`) REFERENCES `CustomUser` (`id`),
  CONSTRAINT `CustomUser_groups_group_id_17a2eea6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomUser_groups`
--

LOCK TABLES `CustomUser_groups` WRITE;
/*!40000 ALTER TABLE `CustomUser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomUser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomUser_user_permissions`
--

DROP TABLE IF EXISTS `CustomUser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomUser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomUser_user_permissi_customuser_id_permission_df9bd0c2_uniq` (`customuser_id`,`permission_id`),
  KEY `CustomUser_user_perm_permission_id_c9848b85_fk_auth_perm` (`permission_id`),
  CONSTRAINT `CustomUser_user_perm_customuser_id_102b0846_fk_CustomUse` FOREIGN KEY (`customuser_id`) REFERENCES `CustomUser` (`id`),
  CONSTRAINT `CustomUser_user_perm_permission_id_c9848b85_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomUser_user_permissions`
--

LOCK TABLES `CustomUser_user_permissions` WRITE;
/*!40000 ALTER TABLE `CustomUser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomUser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_CustomUser_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add custom user',6,'add_customuser'),(22,'Can change custom user',6,'change_customuser'),(23,'Can delete custom user',6,'delete_customuser'),(24,'Can view custom user',6,'view_customuser'),(25,'Can add categories',7,'add_categories'),(26,'Can change categories',7,'change_categories'),(27,'Can delete categories',7,'delete_categories'),(28,'Can view categories',7,'view_categories'),(29,'Can add order',8,'add_order'),(30,'Can change order',8,'change_order'),(31,'Can delete order',8,'delete_order'),(32,'Can view order',8,'view_order'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add wish list',10,'add_wishlist'),(38,'Can change wish list',10,'change_wishlist'),(39,'Can delete wish list',10,'delete_wishlist'),(40,'Can view wish list',10,'view_wishlist'),(41,'Can add subcategory',11,'add_subcategory'),(42,'Can change subcategory',11,'change_subcategory'),(43,'Can delete subcategory',11,'delete_subcategory'),(44,'Can view subcategory',11,'view_subcategory'),(45,'Can add product variant',12,'add_productvariant'),(46,'Can change product variant',12,'change_productvariant'),(47,'Can delete product variant',12,'delete_productvariant'),(48,'Can view product variant',12,'view_productvariant'),(49,'Can add product image',13,'add_productimage'),(50,'Can change product image',13,'change_productimage'),(51,'Can delete product image',13,'delete_productimage'),(52,'Can view product image',13,'view_productimage'),(53,'Can add order item',14,'add_orderitem'),(54,'Can change order item',14,'change_orderitem'),(55,'Can delete order item',14,'delete_orderitem'),(56,'Can view order item',14,'view_orderitem'),(57,'Can add inventory',15,'add_inventory'),(58,'Can change inventory',15,'change_inventory'),(59,'Can delete inventory',15,'delete_inventory'),(60,'Can view inventory',15,'view_inventory'),(61,'Can add cart',16,'add_cart'),(62,'Can change cart',16,'change_cart'),(63,'Can delete cart',16,'delete_cart'),(64,'Can view cart',16,'view_cart'),(65,'Can add task result',17,'add_taskresult'),(66,'Can change task result',17,'change_taskresult'),(67,'Can delete task result',17,'delete_taskresult'),(68,'Can view task result',17,'view_taskresult'),(69,'Can add chord counter',18,'add_chordcounter'),(70,'Can change chord counter',18,'change_chordcounter'),(71,'Can delete chord counter',18,'delete_chordcounter'),(72,'Can view chord counter',18,'view_chordcounter'),(73,'Can add group result',19,'add_groupresult'),(74,'Can change group result',19,'change_groupresult'),(75,'Can delete group result',19,'delete_groupresult'),(76,'Can view group result',19,'view_groupresult'),(77,'Can add Token',20,'add_token'),(78,'Can change Token',20,'change_token'),(79,'Can delete Token',20,'delete_token'),(80,'Can view Token',20,'view_token'),(81,'Can add token',21,'add_tokenproxy'),(82,'Can change token',21,'change_tokenproxy'),(83,'Can delete token',21,'delete_tokenproxy'),(84,'Can view token',21,'view_tokenproxy'),(85,'Can add email address',22,'add_emailaddress'),(86,'Can change email address',22,'change_emailaddress'),(87,'Can delete email address',22,'delete_emailaddress'),(88,'Can view email address',22,'view_emailaddress'),(89,'Can add email confirmation',23,'add_emailconfirmation'),(90,'Can change email confirmation',23,'change_emailconfirmation'),(91,'Can delete email confirmation',23,'delete_emailconfirmation'),(92,'Can view email confirmation',23,'view_emailconfirmation'),(93,'Can add social account',24,'add_socialaccount'),(94,'Can change social account',24,'change_socialaccount'),(95,'Can delete social account',24,'delete_socialaccount'),(96,'Can view social account',24,'view_socialaccount'),(97,'Can add social application',25,'add_socialapp'),(98,'Can change social application',25,'change_socialapp'),(99,'Can delete social application',25,'delete_socialapp'),(100,'Can view social application',25,'view_socialapp'),(101,'Can add social application token',26,'add_socialtoken'),(102,'Can change social application token',26,'change_socialtoken'),(103,'Can delete social application token',26,'delete_socialtoken'),(104,'Can view social application token',26,'view_socialtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `cart_created` tinyint(1) NOT NULL,
  `orderid_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `product_variant_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_orderid_id_a06118aa_fk_order_id` (`orderid_id`),
  KEY `cart_product_id_508e72da_fk_product_id` (`product_id`),
  KEY `cart_product_variant_id_0b820267_fk_product_variant_id` (`product_variant_id`),
  KEY `cart_user_id_1361a739_fk_CustomUser_id` (`user_id`),
  CONSTRAINT `cart_orderid_id_a06118aa_fk_order_id` FOREIGN KEY (`orderid_id`) REFERENCES `order` (`id`),
  CONSTRAINT `cart_product_id_508e72da_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `cart_product_variant_id_0b820267_fk_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variant` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (15,1,1,28,13,2,3),(16,4,1,28,1,3,3),(20,1,1,13,2,6,2),(21,1,1,14,2,6,2),(22,1,1,15,1,3,2),(25,1,1,16,1,3,2),(27,3,1,17,2,6,2),(28,1,1,17,1,3,2),(29,1,1,19,1,3,2),(30,1,1,18,1,3,5),(31,1,1,19,2,6,2),(32,1,1,21,1,3,2),(33,2,1,22,1,3,2),(34,5,1,22,2,6,2),(35,2,1,23,1,9,2),(36,1,1,24,1,3,2),(38,17,1,25,1,9,2),(39,1,1,25,2,6,2),(40,4,1,26,1,9,2),(41,4,1,26,2,6,2),(42,1,1,26,13,2,2),(43,2,1,27,1,9,2),(44,1,1,27,2,8,2),(45,5,1,NULL,1,3,2),(46,3,1,NULL,1,9,2),(47,2,1,30,1,9,3),(48,1,1,30,1,3,3),(49,1,1,30,2,8,3),(50,1,1,29,1,10,4),(51,1,1,NULL,1,9,4),(52,1,1,31,1,9,3),(53,1,1,31,1,10,3),(54,1,1,32,1,9,3),(55,1,1,32,1,3,3),(56,1,1,33,1,9,3),(57,1,1,33,1,3,3),(58,3,1,34,1,9,3),(60,3,1,34,2,8,3),(62,1,1,35,1,9,3),(63,1,1,35,1,10,3),(64,1,1,36,1,3,3),(65,1,1,36,1,10,3),(66,3,1,37,13,2,3),(67,9,1,NULL,13,2,1),(68,2,1,37,1,9,3),(69,2,1,38,1,9,3),(70,1,1,39,1,10,3),(71,1,1,39,1,9,3),(73,1,1,40,1,9,3),(74,1,1,40,1,3,3),(75,1,1,41,1,9,3),(76,1,1,42,13,2,3),(77,1,1,43,1,3,3),(78,4,1,44,1,3,3),(81,3,1,44,1,9,3),(83,5,1,45,1,10,3),(84,1,1,45,2,8,3),(85,2,1,45,1,3,3),(86,1,1,46,1,10,3),(87,1,1,47,1,10,3),(88,1,1,48,1,10,3),(89,1,1,49,1,10,3),(90,1,1,50,1,10,3),(91,1,1,50,1,3,3),(92,2,1,51,1,3,3),(93,1,1,52,1,3,3),(94,1,1,NULL,1,3,3),(95,1,1,NULL,1,9,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  `category_img` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Topwear','image/upload/v1690972375/miyiwatzritpwjsbna2g.jpg','M'),(2,'Indian & Festive Weare','image/upload/v1690974207/tjrqdmikcxxdvnj3toiu.jpg','M'),(3,'Sports Ware','image/upload/v1690974253/ds6gpvuvv09pkdbq1fy3.jpg','M'),(5,'Frock','image/upload/v1690977284/qgbabo8i6w2bbalexv7p.jpg','K'),(6,'Rangeela','image/upload/v1690978008/ikap34xtflq3fffca6ma.jpg','K');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_subcategories`
--

DROP TABLE IF EXISTS `categories_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_subcategories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categories_id` bigint NOT NULL,
  `subcategory_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_subcategories_categories_id_subcategor_7ef8dda6_uniq` (`categories_id`,`subcategory_id`),
  KEY `categories_subcatego_subcategory_id_96fcc9c3_fk_subcatego` (`subcategory_id`),
  CONSTRAINT `categories_subcatego_subcategory_id_96fcc9c3_fk_subcatego` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`),
  CONSTRAINT `categories_subcategories_categories_id_694d9299_fk_categories_id` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_subcategories`
--

LOCK TABLES `categories_subcategories` WRITE;
/*!40000 ALTER TABLE `categories_subcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_CustomUser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-02 10:32:56.609664','1','Topwear',1,'[{\"added\": {}}]',7,1),(2,'2023-08-02 10:33:16.468282','1','T-shirt',1,'[{\"added\": {}}]',11,1),(3,'2023-08-02 10:33:37.699783','1','Urban Fashion',1,'[{\"added\": {}}]',9,1),(4,'2023-08-02 10:33:54.761056','1','Image for Urban Fashion',1,'[{\"added\": {}}]',13,1),(5,'2023-08-02 10:34:56.295600','1','Topwear',2,'[{\"changed\": {\"fields\": [\"Gender\"]}}]',7,1),(6,'2023-08-02 10:42:49.186167','1','Urban Fashion - Size: Medium, Color: yellow',1,'[{\"added\": {}}]',12,1),(7,'2023-08-02 10:55:59.222367','2','Image for Urban Fashion',1,'[{\"added\": {}}]',13,1),(8,'2023-08-02 10:56:01.875405','1','Urban Fashion',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(9,'2023-08-02 10:57:48.359473','2','HRX by Hrithik Roshan',1,'[{\"added\": {}}]',9,1),(10,'2023-08-02 10:58:30.754101','3','Image for HRX by Hrithik Roshan',1,'[{\"added\": {}}]',13,1),(11,'2023-08-02 10:58:33.873252','2','HRX by Hrithik Roshan',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(12,'2023-08-02 10:59:09.699270','4','Image for HRX by Hrithik Roshan',1,'[{\"added\": {}}]',13,1),(13,'2023-08-02 10:59:50.625284','5','Image for HRX by Hrithik Roshan',1,'[{\"added\": {}}]',13,1),(14,'2023-08-02 10:59:52.969015','2','HRX by Hrithik Roshan',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(15,'2023-08-02 11:03:27.710682','2','Indian & Festive Weare',1,'[{\"added\": {}}]',7,1),(16,'2023-08-02 11:04:14.614273','3','Sports Ware',1,'[{\"added\": {}}]',7,1),(17,'2023-08-02 11:05:03.352453','2','Casual Shirts',1,'[{\"added\": {}}]',11,1),(18,'2023-08-02 11:05:40.625768','3','Formal',1,'[{\"added\": {}}]',11,1),(19,'2023-08-02 11:07:50.674297','6','Image for Urban Fashion',1,'[{\"added\": {}}]',13,1),(20,'2023-08-02 11:08:09.037659','3','Urban Fashion',1,'[{\"added\": {}}]',9,1),(21,'2023-08-02 11:08:38.358206','3','H&M',2,'[{\"changed\": {\"fields\": [\"Name\", \"Gender\"]}}]',9,1),(22,'2023-08-02 11:11:43.538963','6','Image for Urban Fashion',3,'',13,1),(23,'2023-08-02 11:11:43.546176','5','Image for HRX by Hrithik Roshan',3,'',13,1),(24,'2023-08-02 11:11:43.550072','4','Image for HRX by Hrithik Roshan',3,'',13,1),(25,'2023-08-02 11:11:43.553900','3','Image for HRX by Hrithik Roshan',3,'',13,1),(26,'2023-08-02 11:11:43.558381','2','Image for Urban Fashion',3,'',13,1),(27,'2023-08-02 11:11:43.562278','1','Image for Urban Fashion',3,'',13,1),(28,'2023-08-02 11:13:16.713379','7','Image for H&M',1,'[{\"added\": {}}]',13,1),(29,'2023-08-02 11:13:49.070842','8','Image for H&M',1,'[{\"added\": {}}]',13,1),(30,'2023-08-02 11:13:49.688222','9','Image for H&M',1,'[{\"added\": {}}]',13,1),(31,'2023-08-02 11:14:06.649088','3','H&M',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(32,'2023-08-02 11:14:30.030861','10','Image for HRX by Hrithik Roshan',1,'[{\"added\": {}}]',13,1),(33,'2023-08-02 11:14:48.463380','11','Image for HRX by Hrithik Roshan',1,'[{\"added\": {}}]',13,1),(34,'2023-08-02 11:15:54.211974','2','HRX by Hrithik Roshan',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(35,'2023-08-02 11:16:17.550863','12','Image for Urban Fashion',1,'[{\"added\": {}}]',13,1),(36,'2023-08-02 11:16:39.259641','13','Image for Urban Fashion',1,'[{\"added\": {}}]',13,1),(37,'2023-08-02 11:16:46.062414','1','Urban Fashion',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(38,'2023-08-02 11:17:39.870308','1','Urban Fashion',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(39,'2023-08-02 11:19:09.811164','1','T-shirt',2,'[{\"changed\": {\"fields\": [\"Sub category img\"]}}]',11,1),(40,'2023-08-02 11:19:26.790540','1','T-shirt',2,'[{\"changed\": {\"fields\": [\"Sub category img\"]}}]',11,1),(41,'2023-08-02 11:23:52.000651','4','Anouk',1,'[{\"added\": {}}]',9,1),(42,'2023-08-02 11:24:44.569558','5','U-turn',1,'[{\"added\": {}}]',9,1),(43,'2023-08-02 11:25:03.305635','14','Image for Anouk',1,'[{\"added\": {}}]',13,1),(44,'2023-08-02 11:25:19.282991','15','Image for Anouk',1,'[{\"added\": {}}]',13,1),(45,'2023-08-02 11:25:42.864393','4','Anouk',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(46,'2023-08-02 11:26:09.263334','16','Image for U-turn',1,'[{\"added\": {}}]',13,1),(47,'2023-08-02 11:26:11.515924','5','U-turn',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(48,'2023-08-02 11:26:55.499842','2','Casual Shirts',2,'[{\"changed\": {\"fields\": [\"Sub category img\"]}}]',11,1),(49,'2023-08-02 11:27:11.948421','2','Casual Shirts',2,'[{\"changed\": {\"fields\": [\"Sub category img\"]}}]',11,1),(50,'2023-08-02 11:28:18.533843','6','Dennis',1,'[{\"added\": {}}]',9,1),(51,'2023-08-02 11:28:41.864161','17','Image for Dennis',1,'[{\"added\": {}}]',13,1),(52,'2023-08-02 11:28:57.022444','18','Image for Dennis',1,'[{\"added\": {}}]',13,1),(53,'2023-08-02 11:29:28.965392','6','Dennis',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(54,'2023-08-02 11:32:26.529777','3','Formal',2,'[{\"changed\": {\"fields\": [\"Sub category img\"]}}]',11,1),(55,'2023-08-02 11:32:38.953657','3','Formal',2,'[{\"changed\": {\"fields\": [\"Sub category img\"]}}]',11,1),(56,'2023-08-02 11:33:43.447994','7','Kingdom',1,'[{\"added\": {}}]',9,1),(57,'2023-08-02 11:34:19.377032','8','Saifoo',1,'[{\"added\": {}}]',9,1),(58,'2023-08-02 11:34:56.226912','9','Hubber',1,'[{\"added\": {}}]',9,1),(59,'2023-08-02 11:35:16.925247','19','Image for Kingdom',1,'[{\"added\": {}}]',13,1),(60,'2023-08-02 11:35:33.006426','20','Image for Kingdom',1,'[{\"added\": {}}]',13,1),(61,'2023-08-02 11:35:38.131215','7','Kingdom',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(62,'2023-08-02 11:36:06.223773','21','Image for Saifoo',1,'[{\"added\": {}}]',13,1),(63,'2023-08-02 11:36:23.940303','22','Image for Saifoo',1,'[{\"added\": {}}]',13,1),(64,'2023-08-02 11:36:27.917467','8','Saifoo',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(65,'2023-08-02 11:36:57.149974','23','Image for Hubber',1,'[{\"added\": {}}]',13,1),(66,'2023-08-02 11:37:15.143847','24','Image for Hubber',1,'[{\"added\": {}}]',13,1),(67,'2023-08-02 11:37:17.225471','9','Hubber',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(68,'2023-08-02 11:42:01.653329','4','Kurtas & Kurta',1,'[{\"added\": {}}]',11,1),(69,'2023-08-02 11:43:56.015623','5','Gym ware',1,'[{\"added\": {}}]',11,1),(70,'2023-08-02 11:45:20.787834','10','Jompers',1,'[{\"added\": {}}]',9,1),(71,'2023-08-02 11:46:20.760351','25','Image for Jompers',1,'[{\"added\": {}}]',13,1),(72,'2023-08-02 11:46:23.383717','10','Jompers',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(73,'2023-08-02 11:47:32.546519','11','Sportify',1,'[{\"added\": {}}]',9,1),(74,'2023-08-02 11:47:56.828931','26','Image for Sportify',1,'[{\"added\": {}}]',13,1),(75,'2023-08-02 11:47:58.787131','11','Sportify',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(76,'2023-08-02 11:50:32.366770','4','Saree',1,'[{\"added\": {}}]',7,1),(77,'2023-08-02 11:51:05.443783','6','Silk Saree',1,'[{\"added\": {}}]',11,1),(78,'2023-08-02 11:51:59.787051','12','Banni',1,'[{\"added\": {}}]',9,1),(79,'2023-08-02 11:52:26.342451','27','Image for Banni',1,'[{\"added\": {}}]',13,1),(80,'2023-08-02 11:52:28.407495','12','Banni',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(81,'2023-08-02 11:54:45.409237','5','Generic',1,'[{\"added\": {}}]',7,1),(82,'2023-08-02 11:55:16.702716','5','Frock',2,'[{\"changed\": {\"fields\": [\"CategoryName\"]}}]',7,1),(83,'2023-08-02 11:55:48.894929','7','Red frock',1,'[{\"added\": {}}]',11,1),(84,'2023-08-02 11:56:46.441323','13','Generic',1,'[{\"added\": {}}]',9,1),(85,'2023-08-02 11:57:09.794798','28','Image for Generic',1,'[{\"added\": {}}]',13,1),(86,'2023-08-02 11:57:12.470613','13','Generic',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(87,'2023-08-02 12:02:11.126179','2','Generic - Size: Small, Color: yellow',1,'[{\"added\": {}}]',12,1),(88,'2023-08-02 12:02:15.678592','13','Generic',2,'[{\"changed\": {\"fields\": [\"Variants\"]}}]',9,1),(89,'2023-08-02 12:02:51.092122','3','Urban Fashion - Size: Small, Color: yellow',1,'[{\"added\": {}}]',12,1),(90,'2023-08-02 12:03:05.332067','4','Urban Fashion - Size: Medium, Color: green',1,'[{\"added\": {}}]',12,1),(91,'2023-08-02 12:03:07.908115','1','Urban Fashion',2,'[{\"changed\": {\"fields\": [\"Variants\"]}}]',9,1),(92,'2023-08-02 12:06:49.810882','6','Rangeela',1,'[{\"added\": {}}]',7,1),(93,'2023-08-02 12:07:31.993933','8','Blossom',1,'[{\"added\": {}}]',11,1),(94,'2023-08-02 12:11:09.146022','1','Urban Fashion',2,'[]',9,1),(95,'2023-08-02 12:11:36.054558','5','HRX by Hrithik Roshan - Size: Small, Color: yelllow',1,'[{\"added\": {}}]',12,1),(96,'2023-08-02 12:11:41.333704','2','HRX by Hrithik Roshan',2,'[{\"changed\": {\"fields\": [\"Variants\"]}}]',9,1),(97,'2023-08-02 12:18:54.303019','3','Urban Fashion - Size: Small, Color: yellow',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(98,'2023-08-02 12:19:46.183620','4','Urban Fashion - Size: Medium, Color: green',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(99,'2023-08-02 12:19:57.626834','1','Urban Fashion - Size: Medium, Color: yellow',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(100,'2023-08-02 12:33:08.771039','5','HRX by Hrithik Roshan - Size: Small, Color: yelllow',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(101,'2023-08-03 09:35:08.454813','4','Saree',3,'',7,1),(102,'2023-08-03 10:26:00.951686','3','Formal',3,'',11,1),(103,'2023-08-03 10:26:00.959546','2','Casual Shirts',3,'',11,1),(104,'2023-08-03 11:13:35.843163','5','HRX by Hrithik Roshan - Size: Small, Color: yelllow',3,'',12,1),(105,'2023-08-03 11:13:58.935039','6','HRX by Hrithik Roshan - Size: Small, Color: yellow',1,'[{\"added\": {}}]',12,1),(106,'2023-08-03 11:14:13.730394','7','HRX by Hrithik Roshan - Size: Medium, Color: green',1,'[{\"added\": {}}]',12,1),(107,'2023-08-03 11:14:16.927329','2','HRX by Hrithik Roshan',2,'[{\"changed\": {\"fields\": [\"Variants\"]}}]',9,1),(108,'2023-08-03 11:15:00.634221','8','HRX by Hrithik Roshan - Size: Medium, Color: orange',1,'[{\"added\": {}}]',12,1),(109,'2023-08-03 11:15:03.661767','2','HRX by Hrithik Roshan',2,'[{\"changed\": {\"fields\": [\"Variants\"]}}]',9,1),(110,'2023-08-04 13:06:04.037055','1','Urban Fashion - Size: Medium, Color: yellow',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(111,'2023-08-05 09:28:00.758370','4','Urban Fashion - Size: Medium',3,'',12,1),(112,'2023-08-05 09:28:25.439887','7','HRX by Hrithik Roshan - Size: Medium',3,'',12,1),(113,'2023-08-05 09:28:56.845620','9','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(114,'2023-08-05 09:39:42.176340','14','Angle',1,'[{\"added\": {}}]',9,1),(115,'2023-08-05 09:40:19.410462','29','Image for Angle',1,'[{\"added\": {}}]',13,1),(116,'2023-08-05 09:40:23.534924','14','Angle',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(117,'2023-08-05 09:46:55.931326','None','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(118,'2023-08-05 09:47:06.617107','None','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(119,'2023-08-05 09:48:25.362547','None','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(120,'2023-08-05 09:49:09.261889','1','Urban Fashion - Size: Medium',3,'',12,1),(121,'2023-08-05 09:49:31.184346','None','HRX by Hrithik Roshan - Size: Small',1,'[{\"added\": {}}]',12,1),(122,'2023-08-05 09:50:19.213044','None','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(123,'2023-08-05 09:51:52.953937','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(124,'2023-08-05 09:52:24.615107','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(125,'2023-08-05 09:53:27.919906','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(126,'2023-08-05 09:54:03.723849','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(127,'2023-08-05 09:56:40.458241','10','Urban Fashion - Size: Extra Large',1,'[{\"added\": {}}]',12,1),(128,'2023-08-05 10:01:52.578681','1','Urban Fashion',2,'[]',9,1),(129,'2023-08-05 10:02:16.259534','None','HRX by Hrithik Roshan - Size: Small',1,'[{\"added\": {}}]',12,1),(130,'2023-08-05 10:02:27.786017','2','HRX by Hrithik Roshan',2,'[]',9,1),(131,'2023-08-05 10:03:02.542467','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(132,'2023-08-05 10:12:22.465098','None','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(133,'2023-08-05 10:15:37.378458','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(134,'2023-08-05 10:17:02.958165','None','Urban Fashion - Size: Medium',1,'[{\"added\": {}}]',12,1),(135,'2023-08-05 10:17:30.083638','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(136,'2023-08-05 10:17:39.394882','1','Urban Fashion',2,'[]',9,1),(137,'2023-08-05 10:18:52.284055','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(138,'2023-08-05 10:19:19.775279','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(139,'2023-08-05 10:19:44.203690','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(140,'2023-08-05 10:23:09.343180','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(141,'2023-08-05 10:23:19.701244','9','Urban Fashion - Size: Medium',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(142,'2023-08-05 10:23:29.650258','None','Urban Fashion - Size: Extra Large',1,'[{\"added\": {}}]',12,1),(143,'2023-08-05 10:24:32.681863','None','Urban Fashion - Size: Extra Large',1,'[{\"added\": {}}]',12,1),(144,'2023-08-05 10:24:38.155216','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(145,'2023-08-05 10:26:27.851876','None','Urban Fashion - Size: Small',1,'[{\"added\": {}}]',12,1),(146,'2023-08-05 10:26:47.692293','1','Urban Fashion',2,'[]',9,1),(147,'2023-08-05 10:27:14.600941','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Small\", \"fields\": [\"Quantity\"]}}]',9,1),(148,'2023-08-05 10:27:32.530458','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Medium\", \"fields\": [\"Quantity\"]}}]',9,1),(149,'2023-08-05 10:27:53.003288','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Extra Large\", \"fields\": [\"Quantity\"]}}]',9,1),(150,'2023-08-05 17:14:30.730677','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Medium\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Extra Large\", \"fields\": [\"Quantity\"]}}]',9,1),(151,'2023-08-06 12:02:08.712283','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(152,'2023-08-06 13:11:03.193626','10','Urban Fashion - Size: Extra Large',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(153,'2023-08-06 13:11:12.112297','9','Urban Fashion - Size: Medium',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(154,'2023-08-06 13:11:30.265676','9','Urban Fashion - Size: Medium',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',12,1),(155,'2023-08-06 13:11:57.556296','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Small\", \"fields\": [\"Quantity\"]}}]',9,1),(156,'2023-08-06 13:12:27.618754','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Small\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Medium\", \"fields\": [\"Quantity\"]}}]',9,1),(157,'2023-08-07 09:30:09.218551','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Small\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Medium\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Extra Large\", \"fields\": [\"Quantity\"]}}]',9,1),(158,'2023-08-07 09:48:12.738619','1','Urban Fashion',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Small\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Medium\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Urban Fashion - Size: Extra Large\", \"fields\": [\"Quantity\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_chordcounter`
--

DROP TABLE IF EXISTS `django_celery_results_chordcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  CONSTRAINT `django_celery_results_chordcounter_chk_1` CHECK ((`count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_chordcounter`
--

LOCK TABLES `django_celery_results_chordcounter` WRITE;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_groupresult`
--

DROP TABLE IF EXISTS `django_celery_results_groupresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_groupresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  KEY `django_cele_date_cr_bd6c1d_idx` (`date_created`),
  KEY `django_cele_date_do_caae0e_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_groupresult`
--

LOCK TABLES `django_celery_results_groupresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_groupresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_groupresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `periodic_task_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  KEY `django_cele_status_9b6201_idx` (`status`),
  KEY `django_cele_worker_d54dd8_idx` (`worker`),
  KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  KEY `django_cele_date_do_f59aad_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (22,'account','emailaddress'),(23,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(20,'authtoken','token'),(21,'authtoken','tokenproxy'),(16,'cloth_app','cart'),(7,'cloth_app','categories'),(6,'cloth_app','customuser'),(15,'cloth_app','inventory'),(8,'cloth_app','order'),(14,'cloth_app','orderitem'),(9,'cloth_app','product'),(13,'cloth_app','productimage'),(12,'cloth_app','productvariant'),(11,'cloth_app','subcategory'),(10,'cloth_app','wishlist'),(4,'contenttypes','contenttype'),(18,'django_celery_results','chordcounter'),(19,'django_celery_results','groupresult'),(17,'django_celery_results','taskresult'),(5,'sessions','session'),(24,'socialaccount','socialaccount'),(25,'socialaccount','socialapp'),(26,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-02 10:27:21.511811'),(2,'contenttypes','0002_remove_content_type_name','2023-08-02 10:27:21.583615'),(3,'auth','0001_initial','2023-08-02 10:27:22.178779'),(4,'auth','0002_alter_permission_name_max_length','2023-08-02 10:27:22.245003'),(5,'auth','0003_alter_user_email_max_length','2023-08-02 10:27:22.255043'),(6,'auth','0004_alter_user_username_opts','2023-08-02 10:27:22.265501'),(7,'auth','0005_alter_user_last_login_null','2023-08-02 10:27:22.275510'),(8,'auth','0006_require_contenttypes_0002','2023-08-02 10:27:22.280353'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-02 10:27:22.290107'),(10,'auth','0008_alter_user_username_max_length','2023-08-02 10:27:22.299603'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-02 10:27:22.309008'),(12,'auth','0010_alter_group_name_max_length','2023-08-02 10:27:22.328718'),(13,'auth','0011_update_proxy_permissions','2023-08-02 10:27:22.340432'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-02 10:27:22.350722'),(15,'cloth_app','0001_initial','2023-08-02 10:27:24.730583'),(16,'account','0001_initial','2023-08-02 10:27:24.979747'),(17,'account','0002_email_max_length','2023-08-02 10:27:25.007558'),(18,'admin','0001_initial','2023-08-02 10:27:25.167565'),(19,'admin','0002_logentry_remove_auto_add','2023-08-02 10:27:25.188022'),(20,'admin','0003_logentry_add_action_flag_choices','2023-08-02 10:27:25.235052'),(21,'authtoken','0001_initial','2023-08-02 10:27:25.360240'),(22,'authtoken','0002_auto_20160226_1747','2023-08-02 10:27:25.419457'),(23,'authtoken','0003_tokenproxy','2023-08-02 10:27:25.425319'),(24,'django_celery_results','0001_initial','2023-08-02 10:27:25.492405'),(25,'django_celery_results','0002_add_task_name_args_kwargs','2023-08-02 10:27:25.582457'),(26,'django_celery_results','0003_auto_20181106_1101','2023-08-02 10:27:25.591870'),(27,'django_celery_results','0004_auto_20190516_0412','2023-08-02 10:27:25.721603'),(28,'django_celery_results','0005_taskresult_worker','2023-08-02 10:27:25.783784'),(29,'django_celery_results','0006_taskresult_date_created','2023-08-02 10:27:25.885341'),(30,'django_celery_results','0007_remove_taskresult_hidden','2023-08-02 10:27:26.004094'),(31,'django_celery_results','0008_chordcounter','2023-08-02 10:27:26.063489'),(32,'django_celery_results','0009_groupresult','2023-08-02 10:27:26.493233'),(33,'django_celery_results','0010_remove_duplicate_indices','2023-08-02 10:27:26.508129'),(34,'django_celery_results','0011_taskresult_periodic_task_name','2023-08-02 10:27:26.551714'),(35,'sessions','0001_initial','2023-08-02 10:27:26.628231'),(36,'socialaccount','0001_initial','2023-08-02 10:27:27.155399'),(37,'socialaccount','0002_token_max_lengths','2023-08-02 10:27:27.234788'),(38,'socialaccount','0003_extra_data_default_dict','2023-08-02 10:27:27.251607'),(39,'cloth_app','0002_order_status','2023-08-04 02:04:41.339979'),(40,'cloth_app','0003_remove_productvariant_color','2023-08-05 09:26:05.737476');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('q1pe1epntuwt7yc6gfdqgaq8dmhs5esy','eyJjdXN0b21lcl9pZCI6MiwiZW1haWwiOiJtYW52ZWVyQGdtYWlsLmNvbSJ9:1qRtcL:_Iu1tbPpdnMQNFYF7FyU9n_xHOiAjaeOIHekAlN1GAc','2023-08-05 12:09:17.304307'),('rq0u2k8kxxsekja0t8doe46zcnwey4z7','eyJjdXN0b21lcl9pZCI6MSwiZW1haWwiOiJyYXNobWltY2UwOEBnbWFpbC5jb20ifQ:1qRYUA:O5S_ZNM4QYlupnVBWG25ThlrZ3WbiSe8xsXYY_X4QiM','2023-08-04 13:35:26.844663'),('uf5lby11svbvq4x0pv32fhv55mqrsief','eyJjdXN0b21lcl9pZCI6MywiZW1haWwiOiJwdXJhYkBnbWFpbC5jb20ifQ:1qSyTh:VuasxznNrBTCarDcMyQbnzZXs8iV-737MtlVvKZF7PI','2023-08-08 11:32:49.235166');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `in_stock` int unsigned NOT NULL,
  `out_stock` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_product_id_7c50457a_fk_product_id` (`product_id`),
  CONSTRAINT `inventory_product_id_7c50457a_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `inventory_chk_1` CHECK ((`in_stock` >= 0)),
  CONSTRAINT `inventory_chk_2` CHECK ((`out_stock` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ordered_date` datetime(6) NOT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  `total_price` int NOT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_id_e323497c_fk_CustomUser_id` (`user_id`),
  CONSTRAINT `order_user_id_e323497c_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (13,'2023-08-03 13:25:09.567974',1,600,2,'PROCESSING'),(14,'2023-08-03 13:28:03.888149',1,600,2,'COMPLETED'),(15,'2023-08-04 02:07:18.665301',1,300,2,'PROCESSING'),(16,'2023-08-04 07:28:28.369850',1,300,2,'PROCESSING'),(17,'2023-08-04 10:55:24.891205',1,2100,2,'COMPLETED'),(18,'2023-08-04 12:48:36.778391',1,300,5,'PROCESSING'),(19,'2023-08-04 13:04:10.579411',1,900,2,'PROCESSING'),(21,'2023-08-05 11:44:00.726118',1,300,2,'PROCESSING'),(22,'2023-08-05 11:58:28.961452',1,3600,2,'PROCESSING'),(23,'2023-08-05 11:58:56.177694',1,600,2,'PROCESSING'),(24,'2023-08-05 11:59:09.926109',1,300,2,'PROCESSING'),(25,'2023-08-05 15:30:10.534805',1,5700,2,'PROCESSING'),(26,'2023-08-05 17:09:11.145358',1,4100,2,'PROCESSING'),(27,'2023-08-05 17:13:20.008456',1,1200,2,'PROCESSING'),(28,'2023-08-05 17:38:53.010988',1,1700,3,'PROCESSING'),(29,'2023-08-06 01:01:54.081389',1,300,4,'PROCESSING'),(30,'2023-08-06 01:05:00.159754',1,1500,3,'PROCESSING'),(31,'2023-08-06 01:05:45.590728',1,600,3,'PROCESSING'),(32,'2023-08-06 01:09:13.879304',1,600,3,'PROCESSING'),(33,'2023-08-06 01:13:49.518904',1,600,3,'PROCESSING'),(34,'2023-08-06 01:32:59.224952',1,2700,3,'PROCESSING'),(35,'2023-08-06 01:35:51.796785',1,600,3,'PROCESSING'),(36,'2023-08-06 01:46:18.260466',1,600,3,'PROCESSING'),(37,'2023-08-06 09:43:00.918001',1,285,3,'PROCESSING'),(38,'2023-08-06 09:47:55.161352',1,285,3,'PROCESSING'),(39,'2023-08-06 10:45:12.282025',1,285,3,'COMPLETED'),(40,'2023-08-06 12:53:21.775126',1,285,3,'CANCELLED'),(41,'2023-08-06 12:59:46.793702',1,285,3,'PROCESSING'),(42,'2023-08-06 13:16:31.283208',1,400,3,'CANCELLED'),(43,'2023-08-06 13:23:54.142059',1,285,3,'PROCESSING'),(44,'2023-08-06 14:56:35.769427',1,285,3,'PROCESSING'),(45,'2023-08-06 15:00:47.612205',1,285,3,'PROCESSING'),(46,'2023-08-07 09:24:36.579357',1,285,3,'PROCESSING'),(47,'2023-08-07 09:25:55.817751',1,285,3,'PROCESSING'),(48,'2023-08-07 09:27:21.548805',1,285,3,'PROCESSING'),(49,'2023-08-07 09:29:05.242086',1,285,3,'PROCESSING'),(50,'2023-08-07 09:30:25.468327',1,285,3,'PROCESSING'),(51,'2023-08-07 09:30:58.800959',1,285,3,'PROCESSING'),(52,'2023-08-07 10:57:05.766404',1,285,3,'PROCESSING');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `order_item_price` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `product_variant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderitem_order_id_e716e9f7_fk_order_id` (`order_id`),
  KEY `orderitem_product_id_dd00a492_fk_product_id` (`product_id`),
  KEY `orderitem_product_variant_id_05f900e1_fk_product_variant_id` (`product_variant_id`),
  CONSTRAINT `orderitem_order_id_e716e9f7_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `orderitem_product_id_dd00a492_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `orderitem_product_variant_id_05f900e1_fk_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variant` (`id`),
  CONSTRAINT `orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (16,1,600,13,2,6),(17,1,600,14,2,6),(18,1,300,15,1,3),(19,1,300,16,1,3),(20,3,1800,17,2,6),(21,1,300,17,1,3),(22,1,300,18,1,3),(23,1,300,19,1,3),(24,1,600,19,2,6),(26,1,300,21,1,3),(27,2,600,22,1,3),(28,5,3000,22,2,6),(29,2,600,23,1,9),(30,1,300,24,1,3),(31,17,5100,25,1,9),(32,1,600,25,2,6),(33,4,1200,26,1,9),(34,4,2400,26,2,6),(35,1,500,26,13,2),(36,2,600,27,1,9),(37,1,600,27,2,8),(38,1,500,28,13,2),(39,4,1200,28,1,3),(40,1,300,29,1,10),(41,2,600,30,1,9),(42,1,300,30,1,3),(43,1,600,30,2,8),(44,1,300,31,1,9),(45,1,300,31,1,10),(46,1,300,32,1,9),(47,1,300,32,1,3),(48,1,300,33,1,9),(49,1,300,33,1,3),(50,3,900,34,1,9),(51,3,1800,34,2,8),(52,1,300,35,1,9),(53,1,300,35,1,10),(54,1,300,36,1,3),(55,1,300,36,1,10),(56,3,1500,37,13,2),(57,2,600,37,1,9),(58,2,600,38,1,9),(59,1,300,39,1,10),(60,1,300,39,1,9),(61,1,300,40,1,9),(62,1,300,40,1,3),(63,1,300,41,1,9),(64,1,500,42,13,2),(65,1,300,43,1,3),(66,4,1200,44,1,3),(67,3,900,44,1,9),(68,5,1500,45,1,10),(69,1,600,45,2,8),(70,2,600,45,1,3),(71,1,300,46,1,10),(72,1,300,47,1,10),(73,1,300,48,1,10),(74,1,300,49,1,10),(75,1,300,50,1,10),(76,1,300,50,1,3),(77,2,600,51,1,3),(78,1,300,52,1,3);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `offer` decimal(5,2) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `subcategoryName_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_subcategoryName_id_b09061f5_fk_subcategories_id` (`subcategoryName_id`),
  KEY `product_category_id_640030a0_fk_categories_id` (`category_id`),
  CONSTRAINT `product_category_id_640030a0_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `product_subcategoryName_id_b09061f5_fk_subcategories_id` FOREIGN KEY (`subcategoryName_id`) REFERENCES `subcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Urban Fashion','100% Original Products\r\nPay on delivery might be available\r\nEasy 14 days returns and exchanges\r\nTry & Buy might be available Topwear',300.00,'B',5.00,1,1),(2,'HRX by Hrithik Roshan','100% Original Products\r\nPay on delivery might be available\r\nEasy 14 days returns and exchanges\r\nTry & Buy might be available',600.00,'B',6.00,1,1),(3,'H&M','100% Original Products\r\nPay on delivery might be available\r\nEasy 14 days returns and exchanges\r\nTry & Buy might be available',700.00,'B',6.00,1,1),(10,'Jompers','Kurtas & Kurta',1000.00,'B',20.00,2,4),(11,'Sportify','Gym ware',400.00,'B',10.00,3,5),(13,'Generic','cotton frock',500.00,'K',20.00,5,7),(14,'Angle','nice color',500.00,'G',5.00,6,7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_image_product_id_8b9355c5_fk_product_id` (`product_id`),
  CONSTRAINT `product_image_product_id_8b9355c5_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (7,'image/upload/v1690974795/hlzmstylyyugo5sizclw.jpg',3),(8,'image/upload/v1690974828/snvanv2qutzwc8fmrosb.jpg',3),(9,'image/upload/v1690974829/dyaluvriapp7fj7vyrws.jpg',3),(10,'image/upload/v1690974869/xwxz6ggzza7pstwbbs1v.jpg',2),(11,'image/upload/v1690974887/paemekfjfdqkltr4gxqp.jpg',2),(12,'image/upload/v1690974977/klezprbm4bmn4wtoclh9.jpg',1),(13,'image/upload/v1690974998/r3vmxln5cdsg6us2glnk.jpg',1),(25,'image/upload/v1690976780/niqeuiiuuiotjwnyokqp.jpg',10),(26,'image/upload/v1690976876/zufbs5tt7dvi0mgieci1.jpg',11),(28,'image/upload/v1690977429/e9hus3wzh9giuj0ugtlt.jpg',13),(29,'image/upload/v1691228418/snmu6k1wcmdhv4xnsduw.jpg',14);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `productimage_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_images_product_id_productimage_id_2cc0e1f5_uniq` (`product_id`,`productimage_id`),
  KEY `product_images_productimage_id_e876c3ec_fk_product_image_id` (`productimage_id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_images_productimage_id_e876c3ec_fk_product_image_id` FOREIGN KEY (`productimage_id`) REFERENCES `product_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (9,1,12),(10,1,13),(7,2,10),(8,2,11),(6,3,7),(5,3,9),(22,10,25),(23,11,26),(25,13,28),(26,14,29);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `size` varchar(2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variant_product_id_31eca93d_fk_product_id` (`product_id`),
  CONSTRAINT `product_variant_product_id_31eca93d_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES (2,'S',0,13),(3,'S',1,1),(6,'S',0,2),(8,'M',8,2),(9,'M',3,1),(10,'XL',3,1);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `productvariant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variants_product_id_productvariant_id_9ad1e1f7_uniq` (`product_id`,`productvariant_id`),
  KEY `product_variants_productvariant_id_44f4c09c_fk_product_v` (`productvariant_id`),
  CONSTRAINT `product_variants_product_id_019d9f04_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_variants_productvariant_id_44f4c09c_fk_product_v` FOREIGN KEY (`productvariant_id`) REFERENCES `product_variant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (2,1,3),(5,2,6),(7,2,8),(1,13,2);
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_CustomUser_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subcategoryName` varchar(255) NOT NULL,
  `sub_category_img` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategories_category_id_8b0a704e_fk_categories_id` (`category_id`),
  CONSTRAINT `subcategories_category_id_8b0a704e_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'T-shirt','image/upload/v1690975166/nclooy2ftqsa7sir7hvc.jpg',1),(4,'Kurtas & Kurta','image/upload/v1690976520/p7u1ao8nsyysg7ily0gi.jpg',2),(5,'Gym ware','image/upload/v1690976635/zjprhewkrm9od4hal5hs.jpg',3),(7,'Red frock','image/upload/v1690977347/hnwskatelojsyrc7xki5.jpg',5),(8,'Blossom','image/upload/v1690978050/mz26wsgrahy1cf0wjs7g.jpg',6);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `add_to_cart` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_product_id_fbf2a693_fk_product_id` (`product_id`),
  KEY `wishlist_user_id_87cb4cfc_fk_CustomUser_id` (`user_id`),
  CONSTRAINT `wishlist_product_id_fbf2a693_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `wishlist_user_id_87cb4cfc_fk_CustomUser_id` FOREIGN KEY (`user_id`) REFERENCES `CustomUser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (2,0,2,1),(5,0,1,1),(9,1,13,3),(11,1,1,3),(12,1,1,3),(15,1,1,3),(17,1,1,3),(23,1,2,2),(26,1,1,2),(27,1,2,2),(28,1,2,2),(29,1,1,2),(30,1,1,2),(31,1,2,2),(32,1,2,2),(33,1,13,2),(34,1,1,2),(35,0,2,2),(36,1,1,2),(37,1,1,3),(38,1,1,3),(39,1,1,3),(40,1,1,3),(41,1,1,3),(42,1,1,3),(43,1,2,3),(44,1,1,3),(49,1,1,3),(50,1,1,3),(51,1,1,3),(52,1,1,3),(53,1,1,3),(54,1,1,3),(55,1,1,3),(56,1,1,3),(57,1,1,3),(58,0,2,3);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-07 18:19:39
