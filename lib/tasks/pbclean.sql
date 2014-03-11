-- MySQL dump 10.13  Distrib 5.1.62, for apple-darwin10.3.0 (i386)
--
-- Host: localhost    Database: pb
-- ------------------------------------------------------
-- Server version	5.1.62-log

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
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `_create` int(11) DEFAULT '0',
  `_read` int(11) DEFAULT '0',
  `_update` int(11) DEFAULT '0',
  `_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `google_uid` varchar(255) DEFAULT NULL,
  `google_access_token` varchar(255) DEFAULT NULL,
  `google_refresh_token` varchar(255) DEFAULT NULL,
  `google_expires` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_bisacs`
--

DROP TABLE IF EXISTS `z_bisacs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_bisacs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_bisacs`
--

LOCK TABLES `z_bisacs` WRITE;
/*!40000 ALTER TABLE `z_bisacs` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_bisacs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_brands`
--

DROP TABLE IF EXISTS `z_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `imprint_code` int(11) DEFAULT NULL,
  `edition_code_tp` varchar(3) DEFAULT NULL,
  `edition_code_hc` varchar(3) DEFAULT NULL,
  `edition_code_bs` varchar(3) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_brands`
--

LOCK TABLES `z_brands` WRITE;
/*!40000 ALTER TABLE `z_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_changelogs`
--

DROP TABLE IF EXISTS `z_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_changelogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  `model_id` int(11) DEFAULT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `changelog` text COLLATE utf8_unicode_ci,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_changelogs`
--

LOCK TABLES `z_changelogs` WRITE;
/*!40000 ALTER TABLE `z_changelogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_changelogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_contacts`
--

DROP TABLE IF EXISTS `z_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `bio` text,
  `editorial_bio` text,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_contacts`
--

LOCK TABLES `z_contacts` WRITE;
/*!40000 ALTER TABLE `z_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_formats`
--

DROP TABLE IF EXISTS `z_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_formats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  `web_relevant` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_formats`
--

LOCK TABLES `z_formats` WRITE;
/*!40000 ALTER TABLE `z_formats` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_genres`
--

DROP TABLE IF EXISTS `z_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_genres`
--

LOCK TABLES `z_genres` WRITE;
/*!40000 ALTER TABLE `z_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_isbns`
--

DROP TABLE IF EXISTS `z_isbns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_isbns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn_code` varchar(255) NOT NULL,
  `marked` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `excel_text` varchar(255) NOT NULL,
  `used` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_isbns`
--

LOCK TABLES `z_isbns` WRITE;
/*!40000 ALTER TABLE `z_isbns` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_isbns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_licensors`
--

DROP TABLE IF EXISTS `z_licensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_licensors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_licensors`
--

LOCK TABLES `z_licensors` WRITE;
/*!40000 ALTER TABLE `z_licensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_licensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_product_territories`
--

DROP TABLE IF EXISTS `z_product_territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_product_territories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `territory_id` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `price` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_product_territories`
--

LOCK TABLES `z_product_territories` WRITE;
/*!40000 ALTER TABLE `z_product_territories` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_product_territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_product_trimsizes`
--

DROP TABLE IF EXISTS `z_product_trimsizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_product_trimsizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_product_trimsizes`
--

LOCK TABLES `z_product_trimsizes` WRITE;
/*!40000 ALTER TABLE `z_product_trimsizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_product_trimsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_products`
--

DROP TABLE IF EXISTS `z_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  `series_id` int(11) DEFAULT NULL,
  `isbn13` varchar(20) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `volume_number` varchar(15) DEFAULT NULL,
  `product_description` text,
  `publish_to_web` int(11) DEFAULT '0',
  `print_extras` text,
  `isbn` varchar(20) DEFAULT NULL,
  `upc` varchar(20) DEFAULT NULL,
  `date_viz_ship` date DEFAULT NULL,
  `date_diamond_ship` date DEFAULT NULL,
  `date_ss` date DEFAULT NULL,
  `date_street` date DEFAULT NULL,
  `whv_order_due` date DEFAULT NULL,
  `whv_ship` date DEFAULT NULL,
  `whv_street_date` date DEFAULT NULL,
  `cat_code` varchar(20) DEFAULT NULL,
  `whv_fert` varchar(255) DEFAULT NULL,
  `whv_vid_vers_num` varchar(255) DEFAULT NULL,
  `exclusivity_note` text,
  `length` varchar(20) DEFAULT NULL,
  `product_trimsize_id` int(11) DEFAULT NULL,
  `edition` tinyint(4) DEFAULT NULL,
  `orientation` varchar(20) DEFAULT NULL,
  `art` varchar(20) DEFAULT NULL,
  `issue_number` smallint(6) DEFAULT NULL,
  `status` enum('Approved','Unapproved','B.O.','O.S.I','Out-of-print') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_products`
--

LOCK TABLES `z_products` WRITE;
/*!40000 ALTER TABLE `z_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_properties`
--

DROP TABLE IF EXISTS `z_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_properties`
--

LOCK TABLES `z_properties` WRITE;
/*!40000 ALTER TABLE `z_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ratings`
--

DROP TABLE IF EXISTS `z_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ratings`
--

LOCK TABLES `z_ratings` WRITE;
/*!40000 ALTER TABLE `z_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_reports`
--

DROP TABLE IF EXISTS `z_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `shared` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_reports`
--

LOCK TABLES `z_reports` WRITE;
/*!40000 ALTER TABLE `z_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_reports_criterias`
--

DROP TABLE IF EXISTS `z_reports_criterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_reports_criterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `crit_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crit_column` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crit_value` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crit_comparison` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crit_desc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_reports_criterias`
--

LOCK TABLES `z_reports_criterias` WRITE;
/*!40000 ALTER TABLE `z_reports_criterias` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_reports_criterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_reports_fields`
--

DROP TABLE IF EXISTS `z_reports_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_reports_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `field_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_column` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_sheet` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_reports_fields`
--

LOCK TABLES `z_reports_fields` WRITE;
/*!40000 ALTER TABLE `z_reports_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_reports_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_roles`
--

DROP TABLE IF EXISTS `z_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_roles`
--

LOCK TABLES `z_roles` WRITE;
/*!40000 ALTER TABLE `z_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_series`
--

DROP TABLE IF EXISTS `z_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `property_id` int(11) NOT NULL,
  `synopsis` text,
  `licensor_id` int(11) DEFAULT '0',
  `format_id` int(11) DEFAULT '0',
  `brand_id` int(11) DEFAULT '0',
  `rating_id` int(11) DEFAULT '0',
  `number_volumes` varchar(10) DEFAULT NULL,
  `original_publisher` varchar(50) DEFAULT NULL,
  `series_status` varchar(20) NOT NULL DEFAULT '',
  `trademark` varchar(50) NOT NULL DEFAULT '',
  `publish_to_web` int(11) DEFAULT '0',
  `priority` varchar(2) NOT NULL DEFAULT '',
  `release_frequency` varchar(200) DEFAULT NULL,
  `product_trimsize_id` int(11) DEFAULT NULL,
  `manga_series_common_id` int(11) DEFAULT NULL,
  `orientation` varchar(20) DEFAULT NULL,
  `cover` varchar(20) DEFAULT NULL,
  `sellingpoints` text,
  `keypoints` text,
  `saleshandle` text,
  `target_demographic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_series`
--

LOCK TABLES `z_series` WRITE;
/*!40000 ALTER TABLE `z_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_series_bisacs`
--

DROP TABLE IF EXISTS `z_series_bisacs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_series_bisacs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bisac_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_series_bisacs`
--

LOCK TABLES `z_series_bisacs` WRITE;
/*!40000 ALTER TABLE `z_series_bisacs` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_series_bisacs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_series_genres`
--

DROP TABLE IF EXISTS `z_series_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_series_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_series_genres`
--

LOCK TABLES `z_series_genres` WRITE;
/*!40000 ALTER TABLE `z_series_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_series_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_series_territories`
--

DROP TABLE IF EXISTS `z_series_territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_series_territories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `series_id` int(11) DEFAULT NULL,
  `territory_id` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_series_territories`
--

LOCK TABLES `z_series_territories` WRITE;
/*!40000 ALTER TABLE `z_series_territories` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_series_territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_territories`
--

DROP TABLE IF EXISTS `z_territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_territories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_abbrev` varchar(10) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_territories`
--

LOCK TABLES `z_territories` WRITE;
/*!40000 ALTER TABLE `z_territories` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_upcs`
--

DROP TABLE IF EXISTS `z_upcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_upcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upc_code` varchar(255) NOT NULL,
  `marked` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `excel_text` varchar(255) NOT NULL,
  `used` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_upcs`
--

LOCK TABLES `z_upcs` WRITE;
/*!40000 ALTER TABLE `z_upcs` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_upcs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-31 13:21:41
