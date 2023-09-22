-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk diskominfotik
DROP DATABASE IF EXISTS `diskominfotik`;
CREATE DATABASE IF NOT EXISTS `diskominfotik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `diskominfotik`;

-- membuang struktur untuk table diskominfotik.assets
DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opd_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('moveable goods','immovable goods') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_opd_id_foreign` (`opd_id`),
  CONSTRAINT `assets_opd_id_foreign` FOREIGN KEY (`opd_id`) REFERENCES `opds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.assets: ~0 rows (lebih kurang)
INSERT IGNORE INTO `assets` (`id`, `opd_id`, `name`, `type`, `created_at`, `updated_at`) VALUES
	('9a3105b9-c1e4-4443-8ed1-b2c498e29450', '9a31003e-52e1-41fc-97b2-d439bc8bc75b', 'Motor Yamaha MX 1000CC', 'moveable goods', '2023-09-21 19:30:01', '2023-09-21 19:31:11'),
	('9a3105d0-4a4e-4a8c-9bbf-34d2e69d5ff3', '9a31003e-52e1-41fc-97b2-d439bc8bc75b', 'Pengennya sih H2R iya', 'moveable goods', '2023-09-21 19:30:16', '2023-09-21 19:30:16');

-- membuang struktur untuk table diskominfotik.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table diskominfotik.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.migrations: ~0 rows (lebih kurang)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2023_08_19_000000_create_failed_jobs_table', 1),
	(3, '2023_09_22_021132_create_opds_table', 1),
	(4, '2023_09_22_021133_create_assets_table', 1),
	(5, '2023_10_12_000000_create_users_table', 1),
	(6, '2023_10_12_100000_create_password_reset_tokens_table', 1);

-- membuang struktur untuk table diskominfotik.opds
DROP TABLE IF EXISTS `opds`;
CREATE TABLE IF NOT EXISTS `opds` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.opds: ~4 rows (lebih kurang)
INSERT IGNORE INTO `opds` (`id`, `name`, `created_at`, `updated_at`) VALUES
	('9a31002e-de1d-4a3f-a58c-45c55cc5c52a', 'Unit 1', '2023-09-21 19:14:31', '2023-09-21 19:14:31'),
	('9a310034-ae3f-42e8-b31a-52fa47f488a7', 'Unit 2', '2023-09-21 19:14:35', '2023-09-21 19:14:35'),
	('9a310039-7cd8-4d54-8088-237651db5773', 'Unit 3', '2023-09-21 19:14:38', '2023-09-21 19:14:38'),
	('9a31003e-52e1-41fc-97b2-d439bc8bc75b', 'Unit 4', '2023-09-21 19:14:41', '2023-09-21 19:14:41');

-- membuang struktur untuk table diskominfotik.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.password_reset_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table diskominfotik.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.personal_access_tokens: ~0 rows (lebih kurang)
INSERT IGNORE INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(0, 'App\\Models\\User', '9a310058-3df8-4892-8e65-069729ee767d', 'ardi@mail.com', '8b6ebfb5b391ed04cd99660641fbf93f26f91e7905571503575dc942e6d904ae', '["admin"]', NULL, NULL, '2023-09-21 20:47:09', '2023-09-21 20:47:09');

-- membuang struktur untuk table diskominfotik.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','operator') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'operator',
  `opd_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_opd_id_foreign` (`opd_id`),
  CONSTRAINT `users_opd_id_foreign` FOREIGN KEY (`opd_id`) REFERENCES `opds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel diskominfotik.users: ~2 rows (lebih kurang)
INSERT IGNORE INTO `users` (`id`, `fullname`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `opd_id`, `created_at`, `updated_at`) VALUES
	('9a310058-3df8-4892-8e65-069729ee767d', 'Ardiansyah Putra', 'ardi@mail.com', NULL, '$2y$10$N7ShjZ4Hr2Ai/CSo3EK8VOgrIgICAyM12J6/ZulvajzYdk7ZHuAYK', NULL, 'admin', '9a31003e-52e1-41fc-97b2-d439bc8bc75b', '2023-09-21 19:14:58', '2023-09-21 19:46:49'),
	('9a3100d3-e0b3-4ae9-8e1d-1c01f17df522', 'Operator', 'operator@mail.com', NULL, '$2y$10$o75KHhUSL8Vth6YvHxkZzeAerX8zW/coeLiCSRLgin8zYT0UTBaVi', NULL, 'operator', '9a31003e-52e1-41fc-97b2-d439bc8bc75b', '2023-09-21 19:16:19', '2023-09-21 19:16:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
