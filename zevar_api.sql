-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2025 at 08:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zevar_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courier_companies`
--

CREATE TABLE `courier_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `tracking_url` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courier_companies`
--

INSERT INTO `courier_companies` (`id`, `name`, `tracking_url`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'Fedex', 'fedex', '8819980001', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile_number`, `whatsapp_number`, `address`, `pincode`, `city`, `state`, `created_at`, `updated_at`) VALUES
(1, 'Riya Singh', 'riya@example.com', '9999990000', '9999990000', 'Bandra West, Mumbai', '400050', 'Mumbai', 'Maharashtra', '2025-07-01 05:39:56', '2025-07-01 05:39:56'),
(2, 'Test Customer', 'customer@example.com', '9999999999', NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_01_082710_create_oauth_auth_codes_table', 1),
(5, '2025_07_01_082711_create_oauth_access_tokens_table', 1),
(6, '2025_07_01_082712_create_oauth_refresh_tokens_table', 1),
(7, '2025_07_01_082713_create_oauth_clients_table', 1),
(8, '2025_07_01_082714_create_oauth_device_codes_table', 1),
(9, '2025_07_01_083054_create_customers_table', 1),
(10, '2025_07_01_083145_create_orders_table', 1),
(11, '2025_07_01_083214_create_courier_companies_table', 1),
(12, '2025_07_01_083215_create_vendors_table', 1),
(13, '2025_07_01_083219_create_product_details_table', 1),
(14, '2025_07_01_100902_add_role_to_users_table', 2),
(15, '2025_07_02_045142_add_vendor_id_foreign_to_users_table', 3),
(16, '2025_07_03_223548_add_soft_deletes_to_orders_table', 4),
(17, '2025_07_03_223556_add_soft_deletes_to_product_details_table', 4),
(18, '2025_07_03_224301_add_soft_deletes_to_orders_table', 5),
(19, '2025_07_03_224430_add_soft_deletes_to_product_details_table', 5),
(20, '2025_07_06_203418_create_order_transactions_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` char(80) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('08df857d3427a9261b08ae767fc18b982e04e1746211b0768c30b66e4e6a835719d03a0433c4ce7e', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-06 13:13:31', '2025-07-06 13:13:32', '2026-07-06 18:43:31'),
('0a8600aaf05dfb58b89bd813f28a0bef2c6512527c19030e7dd629f7272660e282536252c0b40135', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 05:15:28', '2025-07-05 05:15:28', '2026-07-05 10:45:28'),
('0b76fe0de70b93bc40cf0148817f9c28a2f7bc295dfe3a2f72c5d75123cbb57488523806e8b8f8b7', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 14:14:04', '2025-07-04 14:14:04', '2026-07-04 19:44:04'),
('10c0e584650f7d22c83cf0feb13abb15e814498087ad9b7c9b464442582f840affcbfaceea690f60', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:19', '2025-07-02 13:28:19', '2026-07-02 18:58:19'),
('12f16a2b03b966ce40a260f4df7fccc5f8d5d428e14c1f7982e8457e927b5858d80fad5cc2501460', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:53:48', '2025-07-04 15:53:48', '2026-07-04 21:23:48'),
('1336d4c4e44582a81a69a66866fa874c6fbe894a7d8eca895f66e6046b88d31a2c014bfda639039e', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:22:17', '2025-07-03 10:22:17', '2026-07-03 15:52:17'),
('13859318da242fd5ed2b79b3e4828564296de1f9d16f1812afa4258370567bb26ead5581673cc025', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:24:34', '2025-07-03 10:24:34', '2026-07-03 15:54:34'),
('13b0e12a9f3a76eab2b83022f475db35b4ac6aa699db66156fb96e0b4988d88fa65d0c472a665ae7', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:20:53', '2025-07-04 15:20:53', '2026-07-04 20:50:53'),
('14b346d4e8c1366a87d5259244624bf1ff50b79d6320ceee1c254a17653a6861ac3ad10cd525ed3b', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:24:13', '2025-07-04 15:24:13', '2026-07-04 20:54:13'),
('1a548c072df0aa953fd269285140d91d1fcbb61a2c683497e5678f0d4405d0c7d56abba3e8a3ec19', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 08:24:25', '2025-07-05 08:24:25', '2026-07-05 13:54:25'),
('1a9e9f389293d37a5973803c0ff7b0a341f2910d98bef1c86cda8b57b6557eddcee510be402af0c0', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:34:01', '2025-07-03 10:34:01', '2026-07-03 16:04:01'),
('1da7740e5cdf055a1ab7b8577caf1debe4cd261009607a62565ef0611ff0601aaba987aedffeb461', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:22:37', '2025-07-03 10:22:37', '2026-07-03 15:52:37'),
('1db8f03f5afe67f14f042c4352c4be2d517ee176ac3976c2c1ec569e6716fd3103cd61eb043d24c2', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:15:10', '2025-07-03 08:15:10', '2026-07-03 13:45:10'),
('1f75626cb999f57c7f6fa98a4739821cf2260849e4a8cd0049e02baf25b010da1462af97fd554637', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 16:01:43', '2025-07-04 16:01:43', '2026-07-04 21:31:43'),
('2278104819fc6a189312a3e852064e1fe7ab59fd0134532ed7e0f865f5328fd0dc60073c9c407511', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 08:29:55', '2025-07-05 08:29:55', '2026-07-05 13:59:55'),
('28b1a9e11de042c67890a5488b6871ecf75ea205bfef7151c36d2335850fa9ee8f14e1134b158724', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:24:00', '2025-07-03 10:24:00', '2026-07-03 15:54:00'),
('298b4fcc7e8f7d4041366ef7791a1d84a6737da0b6bffee063da7ccf91426e7ac50a98d841891baa', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:04:13', '2025-07-03 16:04:13', '2026-07-03 21:34:13'),
('2ac9390480799637e4bbe4c3c3b9f694f4c90d68f51da699ff4c110867f949bfa4ff268c793de8c1', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:22:19', '2025-07-03 10:22:19', '2026-07-03 15:52:19'),
('2d7854f7e2131080c79a39bba98751f9f51c6816095af8ac8053c732eafe7c173bb29dbc0cbeb7b9', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:22:20', '2025-07-03 10:22:20', '2026-07-03 15:52:20'),
('2de964f0f429d0f80ccec9cc8d8c737ba8030308c782ecd6f16a3442a7c4d6a01a88c21cad4fae3d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 05:10:36', '2025-07-05 05:10:36', '2026-07-05 10:40:36'),
('2e90ee868f2e59f11c98dbc210b53f863d2118f9678eb552fe5b8b67fced3191cf50505515f79c35', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 13:51:40', '2025-07-03 13:51:40', '2026-07-03 19:21:40'),
('2eac0d6d483ee3f6c0d784630bab9ecee9855af9d2f377cf02a835023a4832c3266864b67bbedd3a', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 17:27:27', '2025-07-03 17:27:27', '2026-07-03 22:57:27'),
('30e7dd5af387a56dc5fb4f1a0399bf8d8a8db6e8e336766d6d67c9c635b1ed64b4356fc0d4f73cfa', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:50:37', '2025-07-03 16:50:37', '2026-07-03 22:20:37'),
('324bfb855b8c7ca24f7a0ce214c315024a8dbe00df89026c3fdb86be7d0e78867e09c81141018f35', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 07:21:23', '2025-07-03 07:21:23', '2026-07-03 12:51:23'),
('340c37a5cd7d13a7d84694908984e0bcaed982dc48bbc4ee330fa26349e14e1efdc8ec3e732e91a5', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:07:58', '2025-07-03 08:07:58', '2026-07-03 13:37:58'),
('36618d68b8a195d199354634065bafbdb1ae54513a5c040b2a841df6c635f4e355ade13830ecd368', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:54:16', '2025-07-03 16:54:16', '2026-07-03 22:24:16'),
('373b3ef11ff59b5882df57e13b711087159d4517af65c0c9463f8afa6a802ad39380c257f771539e', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:55:23', '2025-07-04 13:55:23', '2026-07-04 19:25:23'),
('37f7d8f315e439c84396fd745f5e2ca6198c99c42ebc1a00b5f57229e57f50c3a6f9a4397cea1e08', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:41:11', '2025-07-04 15:41:11', '2026-07-04 21:11:11'),
('3c7e38efc337f8f20b6910270fa266577695d4fbbdedc8e30fc11ab281a94a7483f2bc56ecd1cef5', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 09:04:05', '2025-07-03 09:04:05', '2026-07-03 14:34:05'),
('4468fdc650a7a427e739a7f24b7cc2b73a21db0ec0389ca826873dbe7ff5bb3a0d585ae727379fe4', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 15:59:19', '2025-07-03 15:59:19', '2026-07-03 21:29:19'),
('46e411f03975936acfa980a8982a862611c0561899938d30e76c7440e6430cf1cdba148c677a3271', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:17:27', '2025-07-04 13:17:27', '2026-07-04 18:47:26'),
('48445ebdf31c22b9ac722e72e28bc2e54ba6cf7f9dc2b1960736a65c5f4e2ce881021f00e84f453c', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:28:19', '2025-07-03 10:28:19', '2026-07-03 15:58:19'),
('48b75d90e511554ebfcca80056b61b373a5258e089843e3424f055274cd63e60e12c18d820227866', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 07:31:15', '2025-07-03 07:31:15', '2026-07-03 13:01:15'),
('492c74ea00ea9a22b902a4d696b69b9fd27fbfc2cb57947545ae2e4ad045d0d796319fde3a58c8ea', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:26:48', '2025-07-03 10:26:48', '2026-07-03 15:56:48'),
('495f9279955890fe29d81aba705e4051eb0466804a49f442e11a72fedd93de3c9c193b2a295ab64d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 09:01:48', '2025-07-03 09:01:49', '2026-07-03 14:31:48'),
('4cf9a7b292f5b75ac9479877188879bfaeae8f8fd3ee7087a8ac81666d38e199eeb83b017bca59a4', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:40:49', '2025-07-03 16:40:49', '2026-07-03 22:10:49'),
('4e049c27ceefd2076aa68e1cd5df45913e247709047943f7f9944876b6e7dc3df6b1053dd3500927', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 17:01:28', '2025-07-03 17:01:28', '2026-07-03 22:31:28'),
('50386baa03b6a23929b5ebef93d88f4cea9e31138ad6328b6136860748f782d1650985b701bb9f6d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 17:20:36', '2025-07-03 17:20:36', '2026-07-03 22:50:36'),
('532cad7bc0b51432fa9ce0c1bd928bdb0a2e87c3d2ca5b7e36de043697ea32ff843d3e12a551e5d0', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:17:32', '2025-07-04 13:17:32', '2026-07-04 18:47:32'),
('58dd5013e81f717033a545b7879eb02165bd0671d2e823400265ba815a0caf3539490c74d8c9f251', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 09:04:28', '2025-07-03 09:04:28', '2026-07-03 14:34:28'),
('5b4c58211e69044a51a692be581bf813a5a00c1661901a342e3057422a052e82271db81e49e5d60a', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 17:27:36', '2025-07-03 17:27:36', '2026-07-03 22:57:36'),
('5d527f8779b4f6c007e5577d8256ec913204197903b4470fd7fde245dd2146fef90a0b6c74ec1409', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 08:15:51', '2025-07-05 08:15:51', '2026-07-05 13:45:51'),
('5e3881e4c1b66bf18f35b1ed57e7ac0d0beeb2ac275090e901c452acd61d90bf6437dc1f24911b62', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:21:33', '2025-07-03 08:21:33', '2026-07-03 13:51:33'),
('6146b3dc9fdc75fee4e43ee3bc655fc6bf9437d53596e746535a2ad926cda1a6e100529e66935321', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:21:35', '2025-07-03 08:21:35', '2026-07-03 13:51:35'),
('638a33e77c31d8d9b23d39bd336bf3a0185b6c46a6dccd72003f2b5fb545bf96ae1451d45a7aabdb', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:21:30', '2025-07-03 16:21:30', '2026-07-03 21:51:30'),
('67f8ddb1055d64e5938d854ac54751b0d92bc01797592008366a0dbe797483961e7deb5eee5c6600', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 05:00:44', '2025-07-05 05:00:44', '2026-07-05 10:30:44'),
('6c2b8b27ae943446db4c068fedda7a8b67d603ddeab211ac9e6f6d6863c29695b3ea989cfcec8441', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:27:56', '2025-07-02 13:27:56', '2026-07-02 18:57:56'),
('6e51b88412edb689836c3ec0b326fbd60ec5c38a9e28919646ea8b65465d0e132fa3a3e8d3aeb06f', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:49:06', '2025-07-03 10:49:06', '2026-07-03 16:19:06'),
('6e6455a64137aba0d62d5af9d285f16b3081d205a41842eb42890c67b24651e9532f499d4de218c5', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 06:06:34', '2025-07-04 06:06:34', '2026-07-04 11:36:34'),
('6ee0a5f008f1a76626b9f8919cbd854892f87d00aedba8926d2f128a0279f65026d946a5dc3a5bd1', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:14:38', '2025-07-03 08:14:38', '2026-07-03 13:44:38'),
('7122ef0fa4b3aa19ad3a725c5c60609890e3aaede276d5a42507396f82cb49c7b50e66f4e616a819', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-01 13:32:58', '2025-07-01 13:32:58', '2026-07-01 19:02:58'),
('726826192f4cdb54fa36b04092128a0d74c2b8f3d59b0cb806e57bb9096725dd51b55fa214f46376', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:16', '2025-07-02 13:28:16', '2026-07-02 18:58:16'),
('746ea2afc83eb7c6a595f5048e912cb4fbc47d29338a55a3b197c75592b2d86f04d68d1ee966987d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 08:16:03', '2025-07-05 08:16:03', '2026-07-05 13:46:03'),
('75a4ace7c989abc3228d67ee7dcc5093434ae7b51259901a023fb2173ab9e58c0eae4b6c715eafc4', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:19:18', '2025-07-04 15:19:19', '2026-07-04 20:49:18'),
('78a07047d1528c7b9c03adc433da4d87a8fd17667ff99c7560dd09577a28dfc17f955c7d62d53bf3', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:22:20', '2025-07-03 10:22:21', '2026-07-03 15:52:20'),
('8272b678fa9f70dd5dc69d38f51ba8dc84c88cb86488a70e3199030ba81d728768a8b49f85812865', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:23', '2025-07-02 13:28:23', '2026-07-02 18:58:23'),
('87e4952eda28b4d53e68df83b44d94727590ce6c781d803e4c3912d031d2c560adae6bcb6868fa7a', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:13', '2025-07-02 13:28:13', '2026-07-02 18:58:13'),
('89e7efb74a8db41c5e47530eb4a288dfa387686f135910c4fd4fa3c9b472a6e393c933959b7d1a3c', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:44:58', '2025-07-04 15:44:58', '2026-07-04 21:14:58'),
('8a795c9055eced3de240eeef6aa8e996268504d1b4fa63b00016ed87d569f007f2ee259104a7d24b', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:29:58', '2025-07-03 16:29:59', '2026-07-03 21:59:58'),
('8ab9007d53668961ff468cc0596a36d6afd7f0dc7a90344ce25e3d8a9001d5a286b841d81e01d809', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:31:33', '2025-07-04 15:31:33', '2026-07-04 21:01:33'),
('8adf7290000c2a33a6869b913a1311c318071663f7a3782eb35fa0b0ccca70e09207d776b33c1483', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:05', '2025-07-02 13:28:05', '2026-07-02 18:58:05'),
('91856c46f95d084f4ab70afdc6a9262c76b323c93f202340457c7e19f7b0adf0506570de411a8beb', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:13:37', '2025-07-03 16:13:37', '2026-07-03 21:43:37'),
('92d12cbbe407f6fac7368554de5e9f733fd965f69e012b8db01a3a46266303b213ade4a16acf17e9', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:43:50', '2025-07-03 08:43:50', '2026-07-03 14:13:50'),
('95563f0a93286243138382e0a1111f843b1d6bd8b1ce6c15558d212cacf307cad90d23ae55db3a7d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:09:12', '2025-07-03 16:09:12', '2026-07-03 21:39:12'),
('97caa66ad3c8d098ac801d4ecb878815ce64b3f30031da57cb1a8acd2443936c073f60413d5d661f', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-01 13:08:35', '2025-07-01 13:08:36', '2026-07-01 18:38:35'),
('9afff6542c703a48458705c9d56bd466f8520a3e68b1df1ffeae883fc175515e7ce7a86c53804b45', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:38:31', '2025-07-04 15:38:31', '2026-07-04 21:08:31'),
('9cd7afd3a09cf512684cc51342d2fb8e8e9c90094e2fd68b3419226d0d190fa24db11681c4d6bc7a', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-01 05:37:46', '2025-07-01 05:37:46', '2026-07-01 11:07:46'),
('9f4b6c409390bbe009af1e1f4dd1b4f69f6034b9d0130d28fb2374e2642b5f5471bff0dbb9975b2a', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 17:21:46', '2025-07-03 17:21:46', '2026-07-03 22:51:46'),
('a116ef43bef9e2f572e94aca9186b25ff0c13dd96fdbb11330719380c0ad1730d9e7f00982e227a5', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:50:35', '2025-07-04 15:50:35', '2026-07-04 21:20:35'),
('a953b6042a578b5600a1b6e91a713edc31a321cd5f6c0c901dcb5b3f747317c6bb934144ce87ce44', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 15:51:38', '2025-07-03 15:51:38', '2026-07-03 21:21:38'),
('a9e37fa86cd51abc8bb34b6e71333b051051a8868a1146af719092442a1245e452656941c361a08c', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 08:15:48', '2025-07-05 08:15:48', '2026-07-05 13:45:48'),
('af0483d32ab78576ffe7892d0fd3e5c8d87525aeb9299a3168ff2a72ead514c2709324cff9b0daed', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 17:19:09', '2025-07-03 17:19:09', '2026-07-03 22:49:09'),
('afe1738ec938484b73903d3c81e433228f328baa2d5dbb54ff42bbf23934ae02a59a915131faafd8', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:26:18', '2025-07-03 10:26:19', '2026-07-03 15:56:18'),
('b267335a6bee9cad26d6e05b4a20c1d63495cb8440c8f723ff5d693487cb52dce74d5342f9fc2fd0', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-01 23:54:05', '2025-07-01 23:54:05', '2026-07-02 05:24:05'),
('b6677eded0dcf09cd6f112a2c8d26baf769bbecc2dbe11a18785bf6cff678dfc6e8c41571432b027', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:22', '2025-07-02 13:28:22', '2026-07-02 18:58:22'),
('bcb448f4aca2d2131758801d206ce10cb5b19fb659475ad286b4aac324bd04ba68869b9a0e71ae1c', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:20:46', '2025-07-03 08:20:46', '2026-07-03 13:50:46'),
('bd75512e59619bfa4e44480d659a0b57c97df5f631cab2723404e0c25d8f54a79210d3eabdaa1999', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 06:28:24', '2025-07-04 06:28:25', '2026-07-04 11:58:24'),
('c0a77d1baf318ba70768e1f9a5b9d3f7391bcb9ad5cf929e826cc2e78119662de56c8587107a6bcf', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 04:54:21', '2025-07-05 04:54:22', '2026-07-05 10:24:21'),
('c14d43b01133420166b42a2f13b7be59d5bdb8e013a952b50d6f045f0289cd0def70225303c64e15', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:27:14', '2025-07-02 13:27:14', '2026-07-02 18:57:14'),
('c1738a703ff6027d69989631f67f8749261c6af7e0af306a6f32a6115516e23580b8b07eab1be85c', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:19:19', '2025-07-04 15:19:19', '2026-07-04 20:49:19'),
('c1b97cb2b867077e94dd5a88dcd661e085a989962e3de9cf590568f50e7d5f0167377d998f97a715', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:07:57', '2025-07-03 08:07:57', '2026-07-03 13:37:57'),
('c3443fe04a05b770b3c5277881f31dc784c4300352ef8b997ddc2f006354c88e44a76d8fb3576f29', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 02:12:31', '2025-07-04 02:12:32', '2026-07-04 07:42:31'),
('c3595bede93e48e94f47e150744e3f86e005c5851f03297e11d4703b16ed3fda8b9778d2c872fbde', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:20:55', '2025-07-03 08:20:55', '2026-07-03 13:50:55'),
('c5fd7cc36459830bfd372db7ffc0f39df9d0aea21b25b9f5e7c907c8a483b39755d0d0e8fd57f73f', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:27:16', '2025-07-02 13:27:16', '2026-07-02 18:57:16'),
('c7f5ee75269b69ee2a6b8231e85ff7e60b21909a3b3bfae9eded36f47d5d1c14c780d197e512a13d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:54:36', '2025-07-04 15:54:36', '2026-07-04 21:24:36'),
('c874017356cabebf989a7c58bb51c6ad631eb7f6a895edbb3fdca0dfca0d823b89b2cce88f8c2f31', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 07:29:13', '2025-07-03 07:29:13', '2026-07-03 12:59:13'),
('c92cedd97ce9c86adae2baeeaa3d77cf0a8f33a84059f717e4ae947291dd38a71d8d08f78a281519', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:37:19', '2025-07-03 10:37:19', '2026-07-03 16:07:19'),
('cb907555dfa7d11f7baf548c29d134bc5a292b47a0b2e7e76473b6272916acbd917158a17dfd9dd4', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 06:04:56', '2025-07-04 06:04:56', '2026-07-04 11:34:56'),
('cdfb4beb5a1ccfe84d444b193e03d5ab929e689ed2b2d9770b4b3994ccdde2fd91e6f81af919e9a5', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:30:43', '2025-07-04 15:30:43', '2026-07-04 21:00:43'),
('d2cee0075242b4c29d7f3e1c1463ee5bd952891b2f8533698f57515dd26ba6819249f0bb6851d293', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:44:05', '2025-07-03 16:44:05', '2026-07-03 22:14:05'),
('d49762dc77e71f9e52e21b2d589c3a3773151f5b40d0302633886d4288dda7805d4f7793442140b1', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 05:17:39', '2025-07-05 05:17:39', '2026-07-05 10:47:39'),
('d50c595f91af79df039649077bb6725714c55bfcdfd64c328439b512b7c3908e2db9451069fc1a82', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 09:05:57', '2025-07-03 09:05:57', '2026-07-03 14:35:57'),
('d9912a0927374b3d60967c8d51ca76f2bd430cb73da937d107382221c202a5db644fa500710e8475', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:58:52', '2025-07-04 15:58:52', '2026-07-04 21:28:52'),
('da0649b4f9ee287523cf6679fbfeba6dce135a12a4bb9bb61e41ac9cb498d47a4a8b46c00c5f941b', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:17:31', '2025-07-04 13:17:32', '2026-07-04 18:47:31'),
('dc615e5d5252eec8749f1072de5ec166420ad0886c4e1e08c502c1758ba1ac3d9c31820746c22dd6', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:18:23', '2025-07-02 13:18:23', '2026-07-02 18:48:23'),
('de03ceef70f1d6cc5d9b75a1e9327a24e3bf4e0d687ffc14bc1d4d421d2799aa6bb7f3dd1e3db236', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:19:17', '2025-07-02 13:19:17', '2026-07-02 18:49:17'),
('df20bb7dcdd08966c1b5bdb4087d11be0cd903550a32e32f2644632d05a95ed665febbb88fef3682', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 15:46:18', '2025-07-02 15:46:18', '2026-07-02 21:16:18'),
('e22d1ac6f20932c67b2510b1ed249529a0ba9b24d404a1e8043f98a472761c1056359344bdd11db3', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 11:19:44', '2025-07-03 11:19:44', '2026-07-03 16:49:44'),
('e74cf78d5e9a266b2769c3520fe99932ee8b690a8165392fddded3cd134dda737a4053e67a3b4329', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:21:59', '2025-07-04 13:21:59', '2026-07-04 18:51:59'),
('e88fb8d13d20b98f0b7751912e238501c6a2b9f3e19ceb6b340b80985d6501ffafa8d8ede73a10bb', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:50:23', '2025-07-04 13:50:23', '2026-07-04 19:20:23'),
('eaa4c5e7728a0fb47cb5546741c22d4bbce5554eb21251655946200782f0e73c4d3766507b946916', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:21:54', '2025-07-04 15:21:54', '2026-07-04 20:51:54'),
('ee796dc265bd69c69f02b8a2accac0873e313df97872d4e21304ee71e189491febe711274f097df6', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 02:12:36', '2025-07-04 02:12:36', '2026-07-04 07:42:36'),
('f062ab841a1771a84cc226bb9ef5d5c8479590d6064a6713fdc6423c5148fa1b4815db40d92e1683', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 13:59:48', '2025-07-04 13:59:48', '2026-07-04 19:29:48'),
('f2579ff0f0e1a18da7826f97b2d4359749b1f5270ad5dc60d7446adbc7002e7e72c8942202d7615a', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:41:21', '2025-07-04 15:41:21', '2026-07-04 21:11:21'),
('f2d6b980019d5f29730f9af4a8e2ca2842bcce273af3a00dc5d569352dcf163721a10c4402deff50', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 08:20:05', '2025-07-03 08:20:05', '2026-07-03 13:50:05'),
('f2f0ebf2f8454a9e67a2a18381ccb3350df5cd43653cfcd962ee52ec88012f114ef19b4ebbb3e5a1', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 09:06:37', '2025-07-03 09:06:37', '2026-07-03 14:36:37'),
('f50f5e15b3df292cd1b480a91258f23a4f49c708d44f23fabc76c83b7c57c99f2224604261e7df93', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 10:31:31', '2025-07-03 10:31:31', '2026-07-03 16:01:31'),
('f6272440d539723222bc80fa1995d763e35d7f0fa318859d6990b107ae0f498b3d5b351dd720eab9', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-03 16:45:14', '2025-07-03 16:45:15', '2026-07-03 22:15:14'),
('f7abb05d61f8cc9dbf28fec7db9cb0d4339b102f5b6155fd16e0ff615d38a95a8648cf34a47b3ca4', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-05 04:49:12', '2025-07-05 04:49:12', '2026-07-05 10:19:12'),
('f8dd8993ba6b6d11749c45e28b08a19b62f8186059c123852a30a4bf451b0df5f3a4fe19a9cd8748', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 13:28:21', '2025-07-02 13:28:21', '2026-07-02 18:58:21'),
('fa4c83e603df0b07b4e2c51d169ac8eec71db14bf47b204ac8ad655862bf98be637dc03e74fef47e', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-02 11:06:54', '2025-07-02 11:06:54', '2026-07-02 16:36:54'),
('fb0cc4c4bb015330361984a6657b36f236814ffb6afcd1fe1ab98465535ad61db2705a44ca796b3d', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:39:22', '2025-07-04 15:39:22', '2026-07-04 21:09:22'),
('fb25d94c5b98579fdb92b1413bb2a89f18b3331926151c9e0728fb8834357d3b3e0ae6f0fc8e714f', 1, '0197c584-d677-708e-ac14-88fcc9625843', 'ZevarAPIToken', '[]', 0, '2025-07-04 15:38:49', '2025-07-04 15:38:49', '2026-07-04 21:08:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` char(80) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect_uris` text NOT NULL,
  `grant_types` text NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `owner_type`, `owner_id`, `name`, `secret`, `provider`, `redirect_uris`, `grant_types`, `revoked`, `created_at`, `updated_at`) VALUES
('0197c584-d677-708e-ac14-88fcc9625843', NULL, NULL, 'Zevar Personal Access Client', '$2y$12$uE5/wN18IJmX/IBulzm8HOB78QRhVVxucWPQ8Ff1Lz4bg9vP9AFy2', 'users', '[]', '[\"personal_access\"]', 0, '2025-07-01 04:55:06', '2025-07-01 04:55:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_device_codes`
--

CREATE TABLE `oauth_device_codes` (
  `id` char(80) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `user_code` char(8) NOT NULL,
  `scopes` text NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `user_approved_at` datetime DEFAULT NULL,
  `last_polled_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` char(80) NOT NULL,
  `access_token_id` char(80) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cod_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cod_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` varchar(50) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_screenshot` varchar(555) DEFAULT NULL,
  `order_source` varchar(50) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_number`, `total_amount`, `paid_amount`, `cod_amount`, `cod_status`, `payment_status`, `payment_method`, `payment_screenshot`, `order_source`, `order_status`, `remark`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'ZEV-2025-001', 2500.00, 1000.00, 1500.00, 0, 'unpaid', 'UPI', NULL, 'website', 'shipped', 'Bride wants fastest delivery', '2025-07-01 05:39:56', '2025-07-03 16:05:59', NULL),
(2, 2, 'ORD00001', 1100.00, 0.00, 0.00, 0, 'paid', NULL, NULL, 'website', 'approved', NULL, '2025-07-03 16:09:04', '2025-07-03 16:30:37', NULL),
(3, 2, 'ORD00002', 1200.00, 0.00, 0.00, 0, 'paid', NULL, NULL, 'website', 'approved', NULL, '2025-07-03 16:09:04', '2025-07-03 16:21:47', NULL),
(4, 2, 'ORD00003', 1300.00, 0.00, 0.00, 0, 'paid', NULL, NULL, 'website', 'approved', NULL, '2025-07-03 16:09:04', '2025-07-03 16:30:49', NULL),
(5, 2, 'ORD00004', 1400.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:09:04', '2025-07-05 08:25:20', NULL),
(6, 2, 'ORD00005', 1500.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04', NULL),
(8, 2, 'ZEV00001', 2100.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(9, 2, 'ZEV00002', 2200.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(10, 2, 'ZEV00003', 2300.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(11, 2, 'ZEV00004', 2400.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(12, 2, 'ZEV00005', 2500.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(13, 2, 'ZEV00015', 3500.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(14, 2, 'ZEV00016', 3600.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(15, 2, 'ZEV00017', 3700.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(16, 2, 'ZEV00018', 3800.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(17, 2, 'ZEV00019', 3900.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(18, 2, 'ZEV00020', 4000.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(19, 2, 'ZEV00021', 4100.00, 0.00, 0.00, 0, 'partial', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-03 17:22:20', '2025-07-03 17:22:20'),
(20, 2, 'ZEV00022', 4200.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-03 17:21:59', '2025-07-03 17:21:59'),
(21, 2, 'ZEV00023', 4300.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-03 17:22:04', '2025-07-03 17:22:04'),
(22, 2, 'ZEV00024', 4400.00, 0.00, 0.00, 0, 'paid', NULL, NULL, 'website', 'approved', NULL, '2025-07-03 16:43:59', '2025-07-04 16:02:08', NULL),
(23, 2, 'ZEV00025', 4500.00, 0.00, 0.00, 0, 'paid', NULL, NULL, 'website', 'approved', NULL, '2025-07-03 16:43:59', '2025-07-04 06:49:30', NULL),
(24, 2, 'ZEV00026', 4600.00, 0.00, 0.00, 0, 'paid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-04 13:51:32', NULL),
(25, 2, 'ZEV00027', 4700.00, 0.00, 0.00, 0, 'cancelled', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-05 08:24:11', NULL),
(26, 2, 'ZEV00028', 4800.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(27, 2, 'ZEV00029', 4900.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(28, 2, 'ZEV00030', 5000.00, 0.00, 0.00, 0, 'unpaid', NULL, NULL, 'website', 'pending', NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `trans_amount` decimal(10,2) NOT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `trans_type` enum('credit') NOT NULL DEFAULT 'credit',
  `mode` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','confirmed') NOT NULL DEFAULT 'pending',
  `trans_date` date NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `customer_price` decimal(10,2) DEFAULT NULL,
  `vendor_purchase_amount` decimal(10,2) DEFAULT NULL,
  `shipping_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `last_status` varchar(50) DEFAULT NULL,
  `vendor_id` int(10) UNSIGNED DEFAULT NULL,
  `shiprocket_order_id` varchar(255) DEFAULT NULL,
  `shiprocket_shipment_id` varchar(255) DEFAULT NULL,
  `shiprocket_status` varchar(50) DEFAULT NULL,
  `awb_number` varchar(255) DEFAULT NULL,
  `courier_company_id` int(10) UNSIGNED DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `shipment_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `return_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `order_id`, `image_path`, `customer_price`, `vendor_purchase_amount`, `shipping_price`, `status`, `last_status`, `vendor_id`, `shiprocket_order_id`, `shiprocket_shipment_id`, `shiprocket_status`, `awb_number`, `courier_company_id`, `approved_date`, `shipment_date`, `delivery_date`, `return_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'https://placehold.co/600x400/png?text=Kundan+Choker', 1500.00, 800.00, 100.00, 'shipped', NULL, 2, NULL, NULL, NULL, 'AWB12345678', 1, NULL, '2025-07-06', NULL, NULL, '2025-07-01 05:39:57', '2025-07-06 14:36:42', NULL),
(2, 1, 'https://placehold.co/600x400/png?text=Jhumka+Earrings', 1000.00, 600.00, 50.00, 'approved', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-01 05:39:57', '2025-07-03 15:18:22', NULL),
(3, 2, 'products/sample.jpg', 550.00, 440.00, 50.00, 'approved', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:30:37', NULL),
(4, 2, 'products/sample.jpg', 600.00, 480.00, 50.00, 'approved', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:30:37', NULL),
(5, 3, 'products/sample.jpg', 550.00, 700.00, 50.00, 'shipped', NULL, 3, NULL, NULL, NULL, 'AWB12345678', 1, NULL, '2025-07-06', NULL, NULL, '2025-07-03 16:09:04', '2025-07-06 14:40:23', NULL),
(6, 3, 'products/sample.jpg', 600.00, 480.00, 50.00, 'approved', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:21:47', NULL),
(7, 4, 'products/sample.jpg', 550.00, 440.00, 50.00, 'approved', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:30:49', NULL),
(8, 4, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04', NULL),
(9, 5, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04', NULL),
(10, 5, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04', NULL),
(11, 6, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04', NULL),
(12, 6, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:09:04', '2025-07-03 16:09:04', NULL),
(13, 8, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(14, 8, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(15, 9, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(16, 9, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(17, 10, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(18, 10, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(19, 11, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(20, 11, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(21, 12, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(22, 12, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:42:40', '2025-07-03 16:42:40', NULL),
(23, 13, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(24, 13, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(25, 14, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(26, 14, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(27, 15, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(28, 15, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(29, 16, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(30, 16, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(31, 17, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(32, 17, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(33, 18, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(34, 18, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:58', '2025-07-03 16:43:58', NULL),
(35, 19, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(36, 19, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(37, 20, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(38, 20, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(39, 21, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(40, 21, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(41, 22, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(42, 22, 'products/sample.jpg', 600.00, 480.00, 50.00, 'approved', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-04 16:02:08', NULL),
(43, 23, 'products/sample.jpg', 550.00, 440.00, 50.00, 'approved', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-04 02:13:09', NULL),
(44, 23, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(45, 24, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(46, 24, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(47, 25, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(48, 25, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(49, 26, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(50, 26, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(51, 27, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(52, 27, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:43:59', '2025-07-03 16:43:59', NULL),
(53, 28, 'products/sample.jpg', 550.00, 440.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:44:00', '2025-07-03 16:44:00', NULL),
(54, 28, 'products/sample.jpg', 600.00, 480.00, 50.00, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-03 16:44:00', '2025-07-03 16:44:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aP62VFlfskMAcrBZzjOXAVF9ynQGY3mWdVfkDfQr', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOERaZHk5ZFVySDRHVWNoRG9wek51bUhGRTVmNEU2QjBub0twcXFWeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751831845),
('kiaDzQdnpqmFYXwfjLxnwNi1vEKiSE5DjUC66WLY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2luU2RkajU1Wlg5VjQ5ZkJFSnU4dEQyUkhidHRlMUhuS0VDYzVnMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly83YWU0LTEtMTg3LTIyMS02MC5uZ3Jvay1mcmVlLmFwcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751490964),
('Q2qGKJrW9sSWZTPfIdkUa5PIGyhKfAzd8l8huQk9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0ZweU4yS3BJUEZ1blhXSFNSeHFBaWc4OE9zYjBCa2Z6SkVlSGZCSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751363313);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `vendor_id`, `created_at`, `updated_at`) VALUES
(1, 'Satyam Khanna', 'satyam@example.com', NULL, '$2y$12$5eoS1rU2toB4O30taveAmOeAztCcLT7ctG7ZzMv6JGUNOEmGDKZ4.', NULL, NULL, '2025-07-01 04:44:59', '2025-07-01 04:44:59'),
(2, 'Vendor User A', 'vendor.a@example.com', NULL, '$2y$12$Z1DA4KTPGQxBiL/xIbb4feymmLRMxFdhwgP6Ii4vlbBnHvXankqpa', NULL, NULL, '2025-07-01 23:18:41', '2025-07-01 23:18:41'),
(3, 'Vendor User A', 'vendor.b@example.com', NULL, '$2y$12$vPdqSDl5d3QJSig1p2BCNORMJs2vjTfj2wuq5AD5RwkSzxnusZtH2', NULL, 2, '2025-07-01 23:27:46', '2025-07-01 23:27:46'),
(4, 'Vendor User c', 'vendor.c@example.com', NULL, '$2y$12$odVvVHGlRtyMfjZQpXWW/.aXKbnrwjGEDUaPyRFn.vhY9xiVOlS1a', NULL, 3, '2025-07-01 23:33:04', '2025-07-01 23:33:04'),
(6, 'Vendor User c', 'vendor.d@example.com', NULL, '$2y$12$rkQieAm9M5y84UTMMYYNSOIcX4z5jnkBlbFBDV5V4PcYh80XuxDNW', NULL, 4, '2025-07-01 23:37:05', '2025-07-01 23:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gst_number` varchar(255) DEFAULT NULL,
  `pan_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bank_account_number` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `company_name`, `email`, `phone`, `gst_number`, `pan_number`, `address`, `bank_account_number`, `ifsc_code`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Vendor A Supplies', NULL, NULL, NULL, '27ABCDE1234F1Z5', NULL, '123 Market Street', NULL, NULL, 1, '2025-07-01 23:18:41', '2025-07-01 23:18:41'),
(2, 'Vendor B Supplies', NULL, NULL, NULL, '27ABCDE1234F1Z6', NULL, '114 Market Street', NULL, NULL, 1, '2025-07-01 23:27:46', '2025-07-01 23:27:46'),
(3, 'Vendor c Supplies', NULL, NULL, NULL, '27ABCDE1234F1Z6', NULL, '114 Market Street', NULL, NULL, 1, '2025-07-01 23:33:04', '2025-07-01 23:33:04'),
(4, 'Vendor c Supplies', NULL, NULL, NULL, '27ABCDE1234F1Z8', NULL, '114 Market Street', NULL, NULL, 1, '2025-07-01 23:37:05', '2025-07-01 23:37:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `courier_companies`
--
ALTER TABLE `courier_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_mobile_number_unique` (`mobile_number`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_owner_type_owner_id_index` (`owner_type`,`owner_id`);

--
-- Indexes for table `oauth_device_codes`
--
ALTER TABLE `oauth_device_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_device_codes_user_code_unique` (`user_code`),
  ADD KEY `oauth_device_codes_user_id_index` (`user_id`),
  ADD KEY `oauth_device_codes_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_order_source_index` (`order_source`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_order_id_foreign` (`order_id`),
  ADD KEY `product_details_courier_company_id_foreign` (`courier_company_id`),
  ADD KEY `product_details_status_index` (`status`),
  ADD KEY `product_details_vendor_id_index` (`vendor_id`),
  ADD KEY `product_details_awb_number_index` (`awb_number`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courier_companies`
--
ALTER TABLE `courier_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_courier_company_id_foreign` FOREIGN KEY (`courier_company_id`) REFERENCES `courier_companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_details_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
