-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: impono_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.13-MariaDB-10.2.13+maria~jessie

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
-- Table structure for table `condition`
--

DROP TABLE IF EXISTS `condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `condition` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BDD688435FDDDCD6` (`trigger_id`),
  KEY `IDX_BDD688434BBC2705` (`version_id`),
  KEY `idx_accessId_Condition` (`access_id`),
  CONSTRAINT `FK_BDD688434BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BDD688435FDDDCD6` FOREIGN KEY (`trigger_id`) REFERENCES `trigger` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition`
--

LOCK TABLES `condition` WRITE;
/*!40000 ALTER TABLE `condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `version_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `delay` int(11) NOT NULL,
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7A2EC1BDE12AB56` (`created_by`),
  KEY `IDX_C7A2EC1B4BBC2705` (`version_id`),
  KEY `containerUpdatedAt` (`updatedAt`),
  KEY `idx_accessId_Container` (`access_id`),
  CONSTRAINT `FK_C7A2EC1B4BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C7A2EC1BDE12AB56` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container_permission`
--

DROP TABLE IF EXISTS `container_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `container_access_id` int(11) NOT NULL,
  `permissions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_user` (`container_access_id`,`user_id`),
  KEY `IDX_993A28E6A76ED395` (`user_id`),
  CONSTRAINT `FK_993A28E6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container_permission`
--

LOCK TABLES `container_permission` WRITE;
/*!40000 ALTER TABLE `container_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `container_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container_website`
--

DROP TABLE IF EXISTS `container_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parameterType` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D917D9AABC21F742` (`container_id`),
  CONSTRAINT `FK_D917D9AABC21F742` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container_website`
--

LOCK TABLES `container_website` WRITE;
/*!40000 ALTER TABLE `container_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `container_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6DC044C55E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_access_token`
--

DROP TABLE IF EXISTS `oauth2_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_454D96735F37A13B` (`token`),
  KEY `IDX_454D967319EB6921` (`client_id`),
  KEY `IDX_454D9673A76ED395` (`user_id`),
  CONSTRAINT `FK_454D967319EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_454D9673A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_access_token`
--

LOCK TABLES `oauth2_access_token` WRITE;
/*!40000 ALTER TABLE `oauth2_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_auth_code`
--

DROP TABLE IF EXISTS `oauth2_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D2905B55F37A13B` (`token`),
  KEY `IDX_1D2905B519EB6921` (`client_id`),
  KEY `IDX_1D2905B5A76ED395` (`user_id`),
  CONSTRAINT `FK_1D2905B519EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1D2905B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_auth_code`
--

LOCK TABLES `oauth2_auth_code` WRITE;
/*!40000 ALTER TABLE `oauth2_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_client`
--

DROP TABLE IF EXISTS `oauth2_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_669FF9C9A76ED395` (`user_id`),
  CONSTRAINT `FK_669FF9C9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_client`
--

LOCK TABLES `oauth2_client` WRITE;
/*!40000 ALTER TABLE `oauth2_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_refresh_token`
--

DROP TABLE IF EXISTS `oauth2_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4DD907325F37A13B` (`token`),
  KEY `IDX_4DD9073219EB6921` (`client_id`),
  KEY `IDX_4DD90732A76ED395` (`user_id`),
  CONSTRAINT `FK_4DD9073219EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4DD90732A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refresh_token`
--

LOCK TABLES `oauth2_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth2_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `version_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `documentWrite` tinyint(1) NOT NULL,
  `disableInDebugMode` tinyint(1) NOT NULL,
  `respectVisitorsPrivacy` tinyint(1) NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateOptions` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `isActive` tinyint(1) NOT NULL,
  `isSynchronous` tinyint(1) NOT NULL,
  `access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_389B783BC21F742` (`container_id`),
  KEY `IDX_389B7834BBC2705` (`version_id`),
  KEY `tagUpdatedAt` (`updatedAt`),
  KEY `idx_accessId_Tag` (`access_id`),
  CONSTRAINT `FK_389B7834BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_389B783BC21F742` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_trigger`
--

DROP TABLE IF EXISTS `tag_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_trigger` (
  `tag_id` int(11) NOT NULL,
  `trigger_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`trigger_id`),
  KEY `IDX_285A22F7BAD26311` (`tag_id`),
  KEY `IDX_285A22F75FDDDCD6` (`trigger_id`),
  CONSTRAINT `FK_285A22F75FDDDCD6` FOREIGN KEY (`trigger_id`) REFERENCES `trigger` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_285A22F7BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_trigger`
--

LOCK TABLES `tag_trigger` WRITE;
/*!40000 ALTER TABLE `tag_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger`
--

DROP TABLE IF EXISTS `trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `version_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `strategy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1A6B0F5DBC21F742` (`container_id`),
  KEY `IDX_1A6B0F5D4BBC2705` (`version_id`),
  KEY `triggerUpdatedAt` (`updatedAt`),
  KEY `idx_accessId_Trigger` (`access_id`),
  CONSTRAINT `FK_1A6B0F5D4BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A6B0F5DBC21F742` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger`
--

LOCK TABLES `trigger` WRITE;
/*!40000 ALTER TABLE `trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `firstName` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_8F02BF9DA76ED395` (`user_id`),
  KEY `IDX_8F02BF9DFE54D947` (`group_id`),
  CONSTRAINT `FK_8F02BF9DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_8F02BF9DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `version_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CC4D878DBC21F742` (`container_id`),
  KEY `IDX_CC4D878D4BBC2705` (`version_id`),
  KEY `variableUpdatedAt` (`updatedAt`),
  KEY `idx_accessId_Variable` (`access_id`),
  CONSTRAINT `FK_CC4D878D4BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CC4D878DBC21F742` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  KEY `IDX_BF1CD3C3DE12AB56` (`created_by`),
  CONSTRAINT `FK_BF1CD3C3DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-20 14:10:06
