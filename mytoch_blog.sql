-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2016 at 06:11 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mytoch-blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstokens`
--

CREATE TABLE IF NOT EXISTS `accesstokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstokens_token_unique` (`token`),
  KEY `accesstokens_user_id_foreign` (`user_id`),
  KEY `accesstokens_client_id_foreign` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `accesstokens`
--

INSERT INTO `accesstokens` (`id`, `token`, `user_id`, `client_id`, `expires`) VALUES
(20, 'dunaTp7BPqnSm4xifOeZephE0oOuXDGpXzsfUsvk6krwr5Ug9GjjRg9XICkqjcY6IpqjxtvBTHKFMMgfShsVRtGTYP1tsHRnhXw9otEmtCBw46IIlDD2iDWXCDu5mBqYTmkQCgrzIF0RJ4foPtfGNpeIgP8xwJ2skKnPflkXoA45kamA94js8LxyhBSyxFeDARVNVtTz9Q4IZL3W6aXcctqmUpU4CvIAAoXZZllCHFOkUQxd2cJFTxoMXo8k4ff', 1, 1, 1481090867227);

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `version` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apps_name_unique` (`name`),
  UNIQUE KEY `apps_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_fields`
--

CREATE TABLE IF NOT EXISTS `app_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'html',
  `app_id` int(10) unsigned NOT NULL,
  `relatable_id` int(10) unsigned NOT NULL,
  `relatable_type` varchar(150) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_fields_app_id_foreign` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `app_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_settings_key_unique` (`key`),
  KEY `app_settings_app_id_foreign` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `secret` varchar(150) NOT NULL,
  `redirection_uri` varchar(2000) DEFAULT NULL,
  `logo` varchar(2000) DEFAULT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'development',
  `type` varchar(150) NOT NULL DEFAULT 'ua',
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_name_unique` (`name`),
  UNIQUE KEY `clients_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `uuid`, `name`, `slug`, `secret`, `redirection_uri`, `logo`, `status`, `type`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'd774cab4-5e48-4ef8-9194-48cf55a3b5e2', 'Ghost Admin', 'ghost-admin', '2fd68fb41dd5', NULL, NULL, 'enabled', 'ua', NULL, '2016-12-06 06:41:34', 1, '2016-12-06 06:41:34', 1),
(2, '54ab1e06-22f0-4091-9bbc-ead144e3103e', 'Ghost Frontend', 'ghost-frontend', '9592ad0c3737', NULL, NULL, 'enabled', 'ua', NULL, '2016-12-06 06:41:34', 1, '2016-12-06 06:41:34', 1),
(3, '42ae86a3-9f0e-4623-87d0-1a6b342c2718', 'Ghost Scheduler', 'ghost-scheduler', 'b53304cddf86', NULL, NULL, 'enabled', 'web', NULL, '2016-12-06 06:41:34', 1, '2016-12-06 06:41:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_trusted_domains`
--

CREATE TABLE IF NOT EXISTS `client_trusted_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `trusted_domain` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_trusted_domains_client_id_foreign` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `action_type` varchar(150) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `uuid`, `name`, `object_type`, `action_type`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '11db8530-bb34-4877-b753-e241880a069b', 'Export database', 'db', 'exportContent', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(2, 'f04084f5-d04a-4d9f-a3c7-339d6fb8a98e', 'Import database', 'db', 'importContent', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(3, 'b7fbc7a1-2c91-480b-bfc7-08d01742c530', 'Delete all content', 'db', 'deleteAllContent', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(4, 'e14dd790-b036-45be-a821-6b3dc7591d16', 'Send mail', 'mail', 'send', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(5, '32b3818b-e667-492d-b521-cc881946c802', 'Browse notifications', 'notification', 'browse', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(6, '9777f94b-9f61-4024-ae33-53e7cc3c50cc', 'Add notifications', 'notification', 'add', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(7, '05d74763-bf57-4dc9-820b-3c2cdbf912a5', 'Delete notifications', 'notification', 'destroy', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(8, '8d500f4c-0f76-4e47-a2d6-b21ca89b4020', 'Browse posts', 'post', 'browse', NULL, '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(9, 'bb00be37-4f41-45ec-a094-f1e30a0a58ef', 'Read posts', 'post', 'read', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(10, '2927e1b0-8069-4ce9-aebc-674bcdd60956', 'Edit posts', 'post', 'edit', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(11, '3f401ec9-1b22-4649-8288-e95e079a6258', 'Add posts', 'post', 'add', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(12, '31ad6d5c-15c1-4b0e-a4c0-720c0b8363db', 'Delete posts', 'post', 'destroy', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(13, '702c5003-6c3f-4ae8-8d0f-c599eaf0b905', 'Browse settings', 'setting', 'browse', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(14, 'c653e5c0-a345-43a8-9681-a1f00f7f9c53', 'Read settings', 'setting', 'read', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(15, 'd04bb94d-aa89-4541-823b-da2507fe175d', 'Edit settings', 'setting', 'edit', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(16, 'a63fe469-a9ec-4842-9a8d-6d968480d34f', 'Generate slugs', 'slug', 'generate', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(17, '8c7b3445-2905-405e-99d7-c9c239ab9489', 'Browse tags', 'tag', 'browse', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(18, 'e523b66d-82cb-4a66-86ea-18311e67ed2e', 'Read tags', 'tag', 'read', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(19, '539fcdc1-6769-4b8a-b5ab-5044cf84ee60', 'Edit tags', 'tag', 'edit', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(20, 'a7958316-d311-4545-b8ba-1bfc525da822', 'Add tags', 'tag', 'add', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(21, '2ed7dc85-557c-4f69-9d28-787cfe9f75e9', 'Delete tags', 'tag', 'destroy', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(22, 'fdadf9e0-c6b4-4421-ba57-a00069624898', 'Browse themes', 'theme', 'browse', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(23, '328cdf97-a049-4565-bb35-ccd2f626bea7', 'Edit themes', 'theme', 'edit', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(24, 'd8255552-76f7-4b56-b23a-db0470e14b0c', 'Upload themes', 'theme', 'add', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(25, '4c7816fa-113b-4d19-98f6-93ca0945c19a', 'Download themes', 'theme', 'read', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(26, 'ca104c73-735f-448c-9d99-52fd9e6bf342', 'Delete themes', 'theme', 'destroy', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(27, 'c84ca618-fc39-453f-9813-58e6f6b303f5', 'Browse users', 'user', 'browse', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(28, '97df9d0e-fb6a-4348-a4c3-8c559a3ddf97', 'Read users', 'user', 'read', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(29, 'ecf14aa5-f007-4e6a-94d7-d6501e4602d4', 'Edit users', 'user', 'edit', NULL, '2016-12-06 06:41:36', 1, '2016-12-06 06:41:36', 1),
(30, 'e994462c-fee5-44d9-98b0-b953cdbe6a2a', 'Add users', 'user', 'add', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(31, '165ea560-6baa-44d6-8b3e-fdb88203684e', 'Delete users', 'user', 'destroy', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(32, '245afa96-243d-440c-9ed7-f473120f5924', 'Assign a role', 'role', 'assign', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(33, 'ddf9a90c-5b2e-44f4-99c7-fd39b0d9a4ea', 'Browse roles', 'role', 'browse', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(34, 'b9ea6e4b-c477-4382-92e7-36a2a2046f0c', 'Browse clients', 'client', 'browse', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(35, '9dc6a5cc-15b8-4be1-b015-1cc639b50b84', 'Read clients', 'client', 'read', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(36, '921051e5-b126-48aa-995a-d0bf3b23d42b', 'Edit clients', 'client', 'edit', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(37, '8ab9ff3e-5ff4-4080-992e-79baaf90cdc0', 'Add clients', 'client', 'add', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(38, 'ceba0d7e-f530-48b5-99b1-71d5cdc498f4', 'Delete clients', 'client', 'destroy', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(39, 'f95d5ea5-e914-4560-8d9d-47784d1c6078', 'Browse subscribers', 'subscriber', 'browse', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(40, '4ef7d012-a3a2-49fb-9ad9-68bc78df5342', 'Read subscribers', 'subscriber', 'read', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(41, '4dc0825c-662f-4905-a3a1-7324e698b7b0', 'Edit subscribers', 'subscriber', 'edit', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(42, '23e60638-5531-4a1c-8bff-fb6d20dd2b31', 'Add subscribers', 'subscriber', 'add', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1),
(43, '0b2b25f5-624a-4fd8-8de6-901e07380c3e', 'Delete subscribers', 'subscriber', 'destroy', NULL, '2016-12-06 06:41:37', 1, '2016-12-06 06:41:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_apps`
--

CREATE TABLE IF NOT EXISTS `permissions_apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_roles`
--

CREATE TABLE IF NOT EXISTS `permissions_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `permissions_roles`
--

INSERT INTO `permissions_roles` (`id`, `role_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 2, 8),
(45, 2, 9),
(46, 2, 10),
(47, 2, 11),
(48, 2, 12),
(49, 2, 13),
(50, 2, 14),
(51, 2, 16),
(52, 2, 17),
(53, 2, 18),
(54, 2, 19),
(55, 2, 20),
(56, 2, 21),
(57, 2, 27),
(58, 2, 28),
(59, 2, 29),
(60, 2, 30),
(61, 2, 31),
(62, 2, 32),
(63, 2, 33),
(64, 2, 34),
(65, 2, 35),
(66, 2, 36),
(67, 2, 37),
(68, 2, 38),
(69, 2, 42),
(70, 3, 8),
(71, 3, 9),
(72, 3, 11),
(73, 3, 13),
(74, 3, 14),
(75, 3, 16),
(76, 3, 17),
(77, 3, 18),
(78, 3, 20),
(79, 3, 27),
(80, 3, 28),
(81, 3, 33),
(82, 3, 34),
(83, 3, 35),
(84, 3, 36),
(85, 3, 37),
(86, 3, 38),
(87, 3, 42);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_users`
--

CREATE TABLE IF NOT EXISTS `permissions_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `markdown` mediumtext,
  `mobiledoc` longtext,
  `html` mediumtext,
  `amp` mediumtext,
  `image` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(150) NOT NULL DEFAULT 'draft',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `visibility` varchar(150) NOT NULL DEFAULT 'public',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `uuid`, `title`, `slug`, `markdown`, `mobiledoc`, `html`, `amp`, `image`, `featured`, `page`, `status`, `language`, `visibility`, `meta_title`, `meta_description`, `author_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `published_at`, `published_by`) VALUES
(2, 'e675315e-6d3e-47a4-835b-6c7e809821a3', 'Secure privacy and find easy your choices', 'secure-privacy-and-find-easy-your-choices', 'Why do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, '<p>Why do we use it? <br />\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 06:56:47', 1, '2016-12-06 06:57:25', 1, '2016-12-06 06:57:25', 1),
(3, 'a88d4d81-d65b-45d1-abc4-6e9fe49c9277', 'How To Host this Blog with Nginx on DigitalOcean', 'how-to-host-this-blog-with-nginx-on-digitalocean', 'Introduction\n\nIn April 2013, John O''Nolan, no newcomer to the field of blog-making, launched a Kickstarter for a new kind of blog called Ghost, which could radically simplify writing and maintaining a blog. Here, we''ll walk through all of the steps to get Ghost set up and running on a DigitalOcean VPS.\n\nPrerequisites\nBefore you get started, there are a few things that you should pull together\n\nObtain a copy of Ghost\n\nThis tutorial will assume you already have a copy of Ghost on your local computer. Since it''s only available to Kickstarter backers right now, you should have been sent a link to the site where you can download it. \nSet up a VPS\n\nThis tutorial will assume that you''ve already set up a VPS. We''ll be using Ubuntu 12.04, but you should be fine with whatever you''d like. If you need help with this part, this tutorial will get you started. \nPoint a domain at your VPS\n\nThis tutorial will assume that you''ve already pointed a domain at your VPS. This tutorial should help you out with that part, if you''re unsure of how to do that.\nStep 1: Install npm\nBefore we get started, I highly recommend making sure your system is up-to-date. Start by SSHing into your VPS by running:\n\nssh root@*your-server-ip*\non your local machine, and running the following on your VPS:\n\napt-get update\napt-get upgrade\nOnce that is complete, we need to get npm installed. Running the following commands will install some dependancies for Node, add its repository to apt-get, and then install nodejs.\n\napt-get install python-software-properties python g++ make\nadd-apt-repository ppa:chris-lea/node.js\napt-get update\napt-get install nodejs\nNote: You shouldn''t need to run the commands with sudo because you''re probably logged in as root, but if you''re deviating from this tutorial and are logged in as another user, remember that you''ll probably need sudo.\n\nNow, if you run npm at the command line, you should see some help information printed out. If that''s all good, you''re ready to install Ghost!\n\nStep 2: Install Ghost\nThe next thing to do will be getting your copy of Ghost onto the remote server. Please note that this step is only necessary for now, while Ghost is in beta. Once it is available to the public, it will be installable through npm (and this tutorial will likely be updated to reflect that).\n\nYou''re welcome to download the file directly to your VPS or transfer it via FTP. I will show you how to use SCP to copy the folder from your host to the server. The following commands are to be run in your local terminal:\n\ncd /path/to/unzipped/ghost/folder\nscp -r ghost-0.3 root@*your-server-ip*:~/\nThis will copy all of the contents of the ghost-0.3 folder to the home folder of the root user on the server.\n\nNow, back on the remote server, move into the Ghost folder that you just uploaded and use npm to install Ghost. The commands will look something like this:\n\ncd ~/ghost-0.3\nnpm install --production\nOnce this finishes, run the following to make sure that the install worked properly:\n\nnpm start\nYour output should look something like the following:\n\n> ghost@0.3.0 start /root/ghost-0.3\n> node index\n\nGhost is running...\nListening on 127.0.0.1:2368\nUrl configured as: http://my-blog.com\nIf that is the case, congratulations! Ghost is up and running on your server. Stop the process with Control-C and move onto the next steps to complete the configuration.\n\nStep 3: Install and Configure nginx\nThe next step is to install and configure nginx. Nginx (pronounced "engine-x") is "a free, open-source, high-performance HTTP server and reverse proxy". Basically, it will allow connections from the outside on port 80 to connect through to the port that Ghost is running on, so that people can see your blog.\n\nIntallation is simple:\n\napt-get install nginx\nConfiguration is only a little more challenging. Start off by cding to nginx''s configuration files and removing the default file:\n\ncd /etc/nginx/\nrm sites-enabled/default\nNow, make a new configuration file:\n\ncd sites-available\ntouch ghost\nAnd paste in the following code, modifying it to adapt to your own configuration (the only thing you should need to change is the domain name):\n\nserver {\n    listen 0.0.0.0:80;\n    server_name *your-domain-name*;\n    access_log /var/log/nginx/*your-domain-name*.log;\n\n    location / {\n        proxy_set_header X-Real-IP $remote_addr;\n        proxy_set_header HOST $http_host;\n        proxy_set_header X-NginX-Proxy true;\n\n        proxy_pass http://127.0.0.1:2368;\n        proxy_redirect off;\n    }\n}\nFinally, create a symlink from the file in sites-available to sites-enabled:\n\ncd ..\nln -s sites-available/ghost sites-enabled/ghost\nThis will listen for traffic incoming on port 80 and pass the requests along to Ghost, provided they are connecting to the domain that you provide.\n\nStart up the server again (use the code from the end of Step 2) and visit your domain. If you see Ghost, you''re good to g', NULL, '<p>Introduction</p>\n\n<p>In April 2013, John O''Nolan, no newcomer to the field of blog-making, launched a Kickstarter for a new kind of blog called Ghost, which could radically simplify writing and maintaining a blog. Here, we''ll walk through all of the steps to get Ghost set up and running on a DigitalOcean VPS.</p>\n\n<p>Prerequisites <br />\nBefore you get started, there are a few things that you should pull together</p>\n\n<p>Obtain a copy of Ghost</p>\n\n<p>This tutorial will assume you already have a copy of Ghost on your local computer. Since it''s only available to Kickstarter backers right now, you should have been sent a link to the site where you can download it. <br />\nSet up a VPS</p>\n\n<p>This tutorial will assume that you''ve already set up a VPS. We''ll be using Ubuntu 12.04, but you should be fine with whatever you''d like. If you need help with this part, this tutorial will get you started. <br />\nPoint a domain at your VPS</p>\n\n<p>This tutorial will assume that you''ve already pointed a domain at your VPS. This tutorial should help you out with that part, if you''re unsure of how to do that. <br />\nStep 1: Install npm <br />\nBefore we get started, I highly recommend making sure your system is up-to-date. Start by SSHing into your VPS by running:</p>\n\n<p>ssh root@<em>your-server-ip</em> <br />\non your local machine, and running the following on your VPS:</p>\n\n<p>apt-get update <br />\napt-get upgrade <br />\nOnce that is complete, we need to get npm installed. Running the following commands will install some dependancies for Node, add its repository to apt-get, and then install nodejs.</p>\n\n<p>apt-get install python-software-properties python g++ make <br />\nadd-apt-repository ppa:chris-lea/node.js <br />\napt-get update <br />\napt-get install nodejs <br />\nNote: You shouldn''t need to run the commands with sudo because you''re probably logged in as root, but if you''re deviating from this tutorial and are logged in as another user, remember that you''ll probably need sudo.</p>\n\n<p>Now, if you run npm at the command line, you should see some help information printed out. If that''s all good, you''re ready to install Ghost!</p>\n\n<p>Step 2: Install Ghost <br />\nThe next thing to do will be getting your copy of Ghost onto the remote server. Please note that this step is only necessary for now, while Ghost is in beta. Once it is available to the public, it will be installable through npm (and this tutorial will likely be updated to reflect that).</p>\n\n<p>You''re welcome to download the file directly to your VPS or transfer it via FTP. I will show you how to use SCP to copy the folder from your host to the server. The following commands are to be run in your local terminal:</p>\n\n<p>cd /path/to/unzipped/ghost/folder <br />\nscp -r ghost-0.3 root@<em>your-server-ip</em>:~/ <br />\nThis will copy all of the contents of the ghost-0.3 folder to the home folder of the root user on the server.</p>\n\n<p>Now, back on the remote server, move into the Ghost folder that you just uploaded and use npm to install Ghost. The commands will look something like this:</p>\n\n<p>cd ~/ghost-0.3 <br />\nnpm install --production <br />\nOnce this finishes, run the following to make sure that the install worked properly:</p>\n\n<p>npm start <br />\nYour output should look something like the following:</p>\n\n<blockquote>\n  <p>ghost@0.3.0 start /root/ghost-0.3\n  node index</p>\n</blockquote>\n\n<p>Ghost is running... <br />\nListening on 127.0.0.1:2368 <br />\nUrl configured as: <a href="http://my-blog.com">http://my-blog.com</a> <br />\nIf that is the case, congratulations! Ghost is up and running on your server. Stop the process with Control-C and move onto the next steps to complete the configuration.</p>\n\n<p>Step 3: Install and Configure nginx <br />\nThe next step is to install and configure nginx. Nginx (pronounced "engine-x") is "a free, open-source, high-performance HTTP server and reverse proxy". Basically, it will allow connections from the outside on port 80 to connect through to the port that Ghost is running on, so that people can see your blog.</p>\n\n<p>Intallation is simple:</p>\n\n<p>apt-get install nginx <br />\nConfiguration is only a little more challenging. Start off by cding to nginx''s configuration files and removing the default file:</p>\n\n<p>cd /etc/nginx/ <br />\nrm sites-enabled/default <br />\nNow, make a new configuration file:</p>\n\n<p>cd sites-available <br />\ntouch ghost <br />\nAnd paste in the following code, modifying it to adapt to your own configuration (the only thing you should need to change is the domain name):</p>\n\n<p>server { <br />\n    listen 0.0.0.0:80;\n    server<em>name *your-domain-name*;\n    access</em>log /var/log/nginx/<em>your-domain-name</em>.log;</p>\n\n<pre><code>location / {\n    proxy_set_header X-Real-IP $remote_addr;\n    proxy_set_header HOST $http_host;\n    proxy_set_header X-NginX-Proxy true;\n\n    proxy_pass http://127.0.0.1:2368;\n    proxy_redirect off;\n}\n</code></pre>\n\n<p>}\nFinally, create a symlink from the file in sites-available to sites-enabled:</p>\n\n<p>cd .. <br />\nln -s sites-available/ghost sites-enabled/ghost <br />\nThis will listen for traffic incoming on port 80 and pass the requests along to Ghost, provided they are connecting to the domain that you provide.</p>\n\n<p>Start up the server again (use the code from the end of Step 2) and visit your domain. If you see Ghost, you''re good to g</p>', NULL, NULL, 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 06:58:28', 1, '2016-12-06 07:00:14', 1, '2016-12-06 07:00:14', 1),
(4, '7cf7a899-bbe3-41b6-aa89-6e6b17e7187c', 'Fashions From "befikri" movie songs', 'fashions-from-befikri-movie-songs', '<img src="http://images.indianexpress.com/2016/09/befikre-3.jpg?w=820?w=324"/> <br>\nSet in Paris, Befikre is a free spirited, contemporary love story of Dharam and Shyra, who find love in an impulsive, engaging series of experiences. Doused in the spirit of Paris, it celebrates love- sensual, carefree and focused on living life to the fullest.\nRelease date: December 9, 2016 (India)\nDirector: Aditya Chopra\nProduction company: Yash Raj Films\nMusic director: Vishalâ€“Shekhar, Mikey McCleary\n\nMy Toch presenting all type associate fashion from befikri....!!!!!!!!!!', NULL, '<p><img src="http://images.indianexpress.com/2016/09/befikre-3.jpg?w=820?w=324"/> <br> <br />\nSet in Paris, Befikre is a free spirited, contemporary love story of Dharam and Shyra, who find love in an impulsive, engaging series of experiences. Doused in the spirit of Paris, it celebrates love- sensual, carefree and focused on living life to the fullest. <br />\nRelease date: December 9, 2016 (India) <br />\nDirector: Aditya Chopra <br />\nProduction company: Yash Raj Films <br />\nMusic director: Vishalâ€“Shekhar, Mikey McCleary</p>\n\n<p>My Toch presenting all type associate fashion from befikri....!!!!!!!!!!</p>', NULL, NULL, 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 07:02:03', 1, '2016-12-06 07:18:09', 1, '2016-12-06 07:05:04', 1),
(5, 'ffc60c9f-38a9-4a0d-9201-165dccb7a468', 'Welcome To MyToch', 'welc', '<video width="500" controls>\n  <source src="http://mytoch.com/images/Web_grid.mp4" type="video/mp4" >\n</video>\n<strong>PRIVACY POLICY</strong>\nThe use of the website is usually possible without providing personal information. Vogueme Technologies Pvt Ltd. does not collect any private user information, unless specifically stated or required. In some areas of this website, in which interaction will be expected with the user, it is necessary to provide certain personal information. By providing this information you agree that Vogueme Fashion (India) Pvt Ltd. may use the data given in the narrow confines of the German data protection law. This data may not be disclosed to third parties without your express consent.\n\nVogueme Fashion ( India) Pvt Ltd. points out that data transmission over the internet can be subject to security gaps. A complete protection of data against access by third parties is not possible. For more information on privacy, please see the privacy policy. Through the use of the imprint obligation framework for published contact data by third parties, the sending of unsolicited advertisements and information materials is hereby expressly excluded. The operators of the pages will take all required legal steps in case of unsolicited promotional information, such as spam e â€“ mails.\n\n<strong>Use of Cookies</strong>\nThis website uses cookies to better the users experience while visiting the website. Where applicable this website uses a cookie control system allowing the user on their first visit to the website to allow or disallow the use of cookies on their computer / device. This complies with recent legislation requirements for website''s to obtain explicit consent from users before leaving behind or reading files such as cookies on a users computer / device. Cookies are small files saved to the users computers hard drive that track, save and store information about the users interactions and usage of the website. This allows the website, through it''s server to provide the users with a tailored experience within this website. Users are advised that if they wish to deny the use and saving of cookies from this website on to their computers hard drive they should take necessary steps within their web browsers security settings to block all cookies from this website and it''s external serving vendors. This website uses tracking software to monitor it''s visitors to better understand how they use it. This software is provided by Google Analytics which uses cookies to track visitor usage. The software will save a cookie to your computers hard drive in order to track and monitor your engagement and usage of the website but will not store, save or collect personal information. You can read Google''s privacy policy here for further information [ http://www.google.com/privacy.html ].\n\nOther cookies may be stored to your computers hard drive by external vendors when this website uses referral programs, sponsored links or adverts. Such cookies are used for conversion and referral tracking and typically expire after 30 days, though some may take longer. No personal information is stored, saved or collected.', NULL, '<video width="500" controls>  \n  <source src="http://mytoch.com/images/Web_grid.mp4" type="video/mp4" >\n</video>  \n\n<p><strong>PRIVACY POLICY</strong> <br />\nThe use of the website is usually possible without providing personal information. Vogueme Technologies Pvt Ltd. does not collect any private user information, unless specifically stated or required. In some areas of this website, in which interaction will be expected with the user, it is necessary to provide certain personal information. By providing this information you agree that Vogueme Fashion (India) Pvt Ltd. may use the data given in the narrow confines of the German data protection law. This data may not be disclosed to third parties without your express consent.</p>\n\n<p>Vogueme Fashion ( India) Pvt Ltd. points out that data transmission over the internet can be subject to security gaps. A complete protection of data against access by third parties is not possible. For more information on privacy, please see the privacy policy. Through the use of the imprint obligation framework for published contact data by third parties, the sending of unsolicited advertisements and information materials is hereby expressly excluded. The operators of the pages will take all required legal steps in case of unsolicited promotional information, such as spam e â€“ mails.</p>\n\n<p><strong>Use of Cookies</strong> <br />\nThis website uses cookies to better the users experience while visiting the website. Where applicable this website uses a cookie control system allowing the user on their first visit to the website to allow or disallow the use of cookies on their computer / device. This complies with recent legislation requirements for website''s to obtain explicit consent from users before leaving behind or reading files such as cookies on a users computer / device. Cookies are small files saved to the users computers hard drive that track, save and store information about the users interactions and usage of the website. This allows the website, through it''s server to provide the users with a tailored experience within this website. Users are advised that if they wish to deny the use and saving of cookies from this website on to their computers hard drive they should take necessary steps within their web browsers security settings to block all cookies from this website and it''s external serving vendors. This website uses tracking software to monitor it''s visitors to better understand how they use it. This software is provided by Google Analytics which uses cookies to track visitor usage. The software will save a cookie to your computers hard drive in order to track and monitor your engagement and usage of the website but will not store, save or collect personal information. You can read Google''s privacy policy here for further information [ <a href="http://www.google.com/privacy.html">http://www.google.com/privacy.html</a> ].</p>\n\n<p>Other cookies may be stored to your computers hard drive by external vendors when this website uses referral programs, sponsored links or adverts. Such cookies are used for conversion and referral tracking and typically expire after 30 days, though some may take longer. No personal information is stored, saved or collected.</p>', NULL, NULL, 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 07:18:18', 1, '2016-12-06 07:37:43', 1, '2016-12-06 07:37:43', 1),
(6, 'c30cf695-40e4-4a7f-9fde-e34bbc2cbfc3', 'Latest In MyToch', 'latest-in-mytoch', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, '/content/images/2016/12/post.jpg', 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 07:50:25', 1, '2016-12-06 07:51:56', 1, '2016-12-06 07:51:56', 1),
(7, '94d4be15-b406-4999-8a59-86dd02558cf8', 'How to earn points in Mytoch', 'how-to-earn-points', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham', NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham</p>', NULL, '/content/images/2016/12/post-new-1.png', 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 07:53:55', 1, '2016-12-06 09:58:28', 1, '2016-12-06 08:00:25', 1),
(8, 'afd86608-84a0-47e6-ac18-41bee36480c3', '@2000 + Likes and downloads MyToch', '2000-likes-and-downloads-mytoch', 'Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC\n\n"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"\n\n1914 translation by H. Rackham\n\n"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"\n\nSection 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC\n\n"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."', NULL, '<p>Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</p>\n\n<p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>\n\n<p>1914 translation by H. Rackham</p>\n\n<p>"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p>\n\n<p>Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</p>\n\n<p>"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p>', NULL, '/content/images/2016/12/cover.jpg', 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, '2016-12-06 08:11:13', 1, '2016-12-06 08:11:44', 1, '2016-12-06 08:11:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts_tags`
--

CREATE TABLE IF NOT EXISTS `posts_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `refreshtokens`
--

CREATE TABLE IF NOT EXISTS `refreshtokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refreshtokens_token_unique` (`token`),
  KEY `refreshtokens_user_id_foreign` (`user_id`),
  KEY `refreshtokens_client_id_foreign` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `refreshtokens`
--

INSERT INTO `refreshtokens` (`id`, `token`, `user_id`, `client_id`, `expires`) VALUES
(2, 'UpD3MU39rYt2Hl3IIcU9SbumJt5oV8vlmoKNa229AxUAZYpaqqicj61jWSOEDUMkf5QAt3JNiVYWgTJt0pkRXuvBT3NCkL3erB0zcPIWFAFREuE4FrJd1uJgxh0TPGEZr11RXAc0HYTlCLrrKajHzW8Dvwi30QZQsaO7uOJXLVAqSrhYRqd56RsDj59eNTbITK3CAIUw4NbE6GHfZR5P9hC1b04Y47xZOVs2xi6E8cXjZ9Huaeld2J3BGTKmjrs', 1, 1, 1481615124862),
(5, 'NzzEVupLZSsm2CxyB7jT9HH7V3tWBNwxvMPBnClMJZxUr5HDluGv7W9zM7ZY3krtXeXg2G9ruNHeAqrecUV0nhJFYwe6TX5SaNGycZl3uqPXqMAHXOAtQgaRKyTM2UHGehngvi3T0F5hauGUzWO53X66V32kj3NP5nLps37OhXvLFF0a9e9s0kOrt2INbuRivQHJ3nFgoAeiIXJJTNW9PcJllJ9hPqGpHTYqEma6xBKzIOCPUDOYt2hfanr46Rq', 1, 1, 1481641752195),
(6, 'vmKo1fMtWK2dONdkPbOlSk7MUid5UVfNRvmWBvuwjjqk3VgKtKsPyKCbnPjbbP6aAJogCsD07Yd2ihZHjBksTjCLJA9ioEhKQCdhj8hVfuNWvEe8ZtMguqadivVO35t4mF6VkPMiu3yN25y0Sc99YMV6OqB4yal10jwHyIaszIPWuzHFdx5l7pdgz0kAckLjQWrVNf0XC8Agn1cLzfAzGUGJMm9F58YI8OwpIxKRq99EVcmS4PDmzXjfkuyzEok', 1, 1, 1481692067227);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `uuid`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '1230afc0-87b0-4570-860c-7d457b582f77', 'Administrator', 'Administrators', '2016-12-06 06:41:34', 1, '2016-12-06 06:41:34', 1),
(2, 'fb7d2786-1d8b-43c1-8172-e554b4425600', 'Editor', 'Editors', '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(3, '329f2388-3f43-46a6-a4e0-1231760dc798', 'Author', 'Authors', '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1),
(4, '08070c29-b0ec-418d-a6a7-d1fbe7536db8', 'Owner', 'Blog Owner', '2016-12-06 06:41:35', 1, '2016-12-06 06:41:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`id`, `role_id`, `user_id`) VALUES
(1, 4, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `uuid`, `key`, `value`, `type`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'a7d7a04b-784a-46a6-b41a-0cd665d3c989', 'databaseVersion', '009', 'core', '2016-12-06 06:41:44', 1, '2016-12-06 06:41:44', 1),
(2, '09e2fc07-a74a-4f52-b9e7-7756a78756ea', 'dbHash', '03d2904e-9069-4540-929d-85559673b876', 'core', '2016-12-06 06:41:44', 1, '2016-12-06 06:41:45', 1),
(3, 'f6424cd9-1d1c-4484-bb73-b4a46b04f4f2', 'nextUpdateCheck', '1481092980', 'core', '2016-12-06 06:41:44', 1, '2016-12-06 06:43:00', 1),
(4, '9a20101d-3edb-4276-b7fb-18e1bac5b44d', 'displayUpdateNotification', '0.11.3', 'core', '2016-12-06 06:41:44', 1, '2016-12-06 06:43:00', 1),
(5, '488fc08a-a2ff-4626-bbb9-fbd146f2ec0b', 'seenNotifications', '[]', 'core', '2016-12-06 06:41:44', 1, '2016-12-06 06:41:44', 1),
(6, '3e5f05f5-c325-4e3d-b121-62f819706563', 'migrations', '{}', 'core', '2016-12-06 06:41:44', 1, '2016-12-06 06:41:44', 1),
(7, '82141501-d5a3-4aa8-b7fd-cc7e4ffb79d8', 'title', 'MyToch Blog', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(8, 'aaa4b3b0-2d7f-4a0a-80fb-42b777c925fb', 'description', 'Watch-Touch-Descover', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(9, 'd694492d-86c8-41c6-be8a-07426fa0d1f3', 'logo', '/content/images/2016/12/imageedit_2_6148144755-1.png', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(10, '2cabe547-fc72-4bca-bbfd-1c767370ed95', 'cover', '/content/images/2016/12/home-bg-1.jpg', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(11, 'c64a3805-86c9-4d03-95a0-b2682568dc88', 'defaultLang', 'en_US', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(12, '352bd0d7-8b78-48e0-9e62-f8edadb0b842', 'postsPerPage', '6', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(13, '6167b163-dd5c-49ee-aef2-1ecfa7996f09', 'activeTimezone', 'Asia/Kolkata', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(14, 'c61c4a68-19e2-4639-92cd-9e60b1f178f9', 'forceI18n', 'true', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(15, '7d07b619-2bd7-40ef-ae7b-67a114e4139f', 'permalinks', '/:year/:month/:day/:slug/', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(16, '2897a6c9-103d-4625-8954-dbb4daf90be8', 'ghost_head', '', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(17, 'bdbe3493-f144-4c82-af29-1b63903ea114', 'ghost_foot', '<center>\n<div class="copyright-web">Â© 2016 TOCH | All rights reserved. </div>\n    <small class="help-block">Made with <i class="fa fa-heart text-danger"></i> by Vogueme Technologies Pvt. Ltd.</small>\n</center>', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(18, '9aadcb3a-0204-4caf-94fb-c4c962ae1cf0', 'facebook', 'mytoch', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(19, '00e2d5cb-5234-49b0-883e-381d2a9ed497', 'twitter', '@my_toch', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(20, 'd0e779b4-b82e-4a4a-a627-7a2b0080f48a', 'labs', '{}', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(21, '4cc74422-2f72-49ce-b493-22f17bd5d669', 'navigation', '[{"label":"Home","url":"http://mytoch.com"},{"label":"About-Us","url":"http://mytoch.com/about-us.html"},{"label":"Advertiser","url":"http://mytoch.com/advertiser.html"},{"label":"Register Business","url":"http://mytoch.com/register.html/"},{"label":"Blog","url":"/"}]', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(22, 'cc41165c-3414-4a22-b6cd-8603e9a1240a', 'slack', '[{"url":""}]', 'blog', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(23, 'bd34b3b5-e946-4c3b-b4c5-d7b3a2cfe8a2', 'activeApps', '[]', 'app', '2016-12-06 06:41:44', 1, '2016-12-06 06:41:44', 1),
(24, 'a046b580-ab1d-42b8-8276-a231813be7f7', 'installedApps', '[]', 'app', '2016-12-06 06:41:44', 1, '2016-12-07 05:07:05', 1),
(25, '0620ce13-fc7c-4451-8ab0-9b0b0308d3ae', 'isPrivate', 'false', 'private', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(26, 'efba99ea-b8db-47fa-82fc-1949f13d0fdb', 'password', '', 'private', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1),
(27, '7080b1ea-37fe-45ca-9aaa-d48f674ece71', 'activeTheme', 'casper', 'theme', '2016-12-06 06:41:44', 1, '2016-12-07 05:10:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'pending',
  `post_id` int(10) unsigned DEFAULT NULL,
  `subscribed_url` text,
  `subscribed_referrer` text,
  `unsubscribed_url` text,
  `unsubscribed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribers_email_unique` (`email`),
  KEY `subscribers_post_id_foreign` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` text,
  `parent_id` int(11) DEFAULT NULL,
  `visibility` varchar(150) NOT NULL DEFAULT 'public',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `uuid`, `name`, `slug`, `description`, `image`, `parent_id`, `visibility`, `meta_title`, `meta_description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '8081dc44-29b8-4144-9059-2b9311502f7e', 'Getting Started', 'getting-started', NULL, NULL, NULL, 'public', NULL, NULL, '2016-12-06 06:41:34', 1, '2016-12-06 06:41:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` text,
  `cover` text,
  `bio` varchar(200) DEFAULT NULL,
  `website` text,
  `location` text,
  `facebook` text,
  `twitter` text,
  `accessibility` text,
  `status` varchar(150) NOT NULL DEFAULT 'active',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `visibility` varchar(150) NOT NULL DEFAULT 'public',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `tour` text,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `slug`, `password`, `email`, `image`, `cover`, `bio`, `website`, `location`, `facebook`, `twitter`, `accessibility`, `status`, `language`, `visibility`, `meta_title`, `meta_description`, `tour`, `last_login`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '71c13c1d-4552-4607-bea3-2910eb863621', 'Amit Mishra', 'amit', '$2a$10$/g40XyA0k1awIRhrW6tgKOdS8fIxoZsBaBvjtPZ7AuQ5cF4T35MAK', 'amitmishra@linkites.com', '/content/images/2016/12/logo2-1-1.png', NULL, 'Full Stack Web Devveloper', NULL, 'Indore India', NULL, NULL, NULL, 'active', 'en_US', 'public', NULL, NULL, NULL, '2016-12-07 05:07:47', '2016-12-06 06:41:43', 1, '2016-12-07 05:07:47', 1),
(2, '4ce8fafa-7d00-45f4-8f9d-1b95372161ea', 'amitmishra1628', 'amitmishra1628', '$2a$10$FAb8hqv2oXk8UCHug.fp6ewzt2zXhwI0pxO4HHS1PopfDEIqQMjKq', 'amitmishra1628@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'invited-pending', 'en_US', 'public', NULL, NULL, NULL, NULL, '2016-12-06 06:44:13', 1, '2016-12-06 06:44:17', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accesstokens`
--
ALTER TABLE `accesstokens`
  ADD CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `app_fields`
--
ALTER TABLE `app_fields`
  ADD CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`);

--
-- Constraints for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`);

--
-- Constraints for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
  ADD CONSTRAINT `client_trusted_domains_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
