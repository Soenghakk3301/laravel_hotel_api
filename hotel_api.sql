-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 05:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_on_services`
--

CREATE TABLE `add_on_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_types_id` bigint(20) UNSIGNED NOT NULL,
  `services_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_cards`
--

CREATE TABLE `credit_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guest_id` bigint(20) UNSIGNED NOT NULL,
  `card_no` varchar(255) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  `cvv` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_male` tinyint(1) NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `phon_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_types_id` bigint(20) UNSIGNED NOT NULL,
  `image_cover_url` varchar(255) DEFAULT NULL,
  `image_url_1` varchar(255) DEFAULT NULL,
  `image_url_2` varchar(255) DEFAULT NULL,
  `image_url_3` varchar(255) DEFAULT NULL,
  `image_url_4` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_04_01_115117_create_user_types_table', 1),
(5, '2023_04_01_142131_create_users_table', 1),
(6, '2023_04_01_151518_create_room_types_table', 1),
(7, '2023_04_01_154049_create_rooms_table', 1),
(8, '2023_04_02_032221_create_images_table', 1),
(9, '2023_04_02_032648_create_services_table', 1),
(10, '2023_04_02_032907_create_add_on_services_table', 1),
(11, '2023_04_05_074005_create_guests_table', 1),
(12, '2023_04_05_074159_create_credit_cards_table', 1),
(13, '2023_04_05_121030_create_reservations_table', 1),
(14, '2023_04_05_121053_create_room_reservations_table', 1),
(15, '2023_05_10_031323_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'Api of token Admin', '7d20f1f861d19361c42f21ee3245d4227a1aba1c87455ed835b6c1cc566d067f', '[\"*\"]', '2023-06-20 20:05:34', NULL, '2023-06-20 20:05:21', '2023-06-20 20:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guest_id` bigint(20) UNSIGNED NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `special_requests` varchar(255) DEFAULT NULL,
  `payment_method` enum('Online','Cast') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_types_id` bigint(20) UNSIGNED NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_types_id`, `room_no`, `is_available`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Eos.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(2, 1, 'Enim.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(3, 1, 'Quia.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(4, 1, 'Sit.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(5, 1, 'Quis.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(6, 1, 'Qui.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(7, 1, 'Id.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(8, 1, 'Ea.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(9, 1, 'Sed.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(10, 1, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(11, 2, 'Cum.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(12, 2, 'Sint.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(13, 2, 'Sed.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(14, 2, 'Quia.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(15, 2, 'Nemo.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(16, 2, 'Eos.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(17, 2, 'Qui.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(18, 2, 'Ut.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(19, 2, 'Eum.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(20, 2, 'Sed.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(21, 3, 'Odio.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(22, 3, 'Sunt.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(23, 3, 'Ut.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(24, 3, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(25, 3, 'Odit.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(26, 3, 'Rem.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(27, 3, 'Odit.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(28, 3, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(29, 3, 'Non.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(30, 3, 'Vero.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(31, 4, 'Qui.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(32, 4, 'Qui.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(33, 4, 'Sit.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(34, 4, 'Sint.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(35, 4, 'Est.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(36, 4, 'Quas.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(37, 4, 'Quia.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(38, 4, 'Non.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(39, 4, 'Ut.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(40, 4, 'Sed.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(41, 5, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(42, 5, 'Qui.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(43, 5, 'Ad.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(44, 5, 'Sunt.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(45, 5, 'Aut.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(46, 5, 'In.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(47, 5, 'Ea.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(48, 5, 'Ea.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(49, 5, 'Sed.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(50, 5, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(51, 6, 'Sed.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(52, 6, 'Ab a.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(53, 6, 'Unde.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(54, 6, 'Vel.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(55, 6, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(56, 6, 'Ipsa.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(57, 6, 'Vel.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(58, 6, 'Ipsa.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(59, 6, 'Unde.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(60, 6, 'Quis.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(61, 7, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(62, 7, 'Sit.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(63, 7, 'Quis.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(64, 7, 'Quo.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(65, 7, 'Cum.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(66, 7, 'Id.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(67, 7, 'Sint.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(68, 7, 'Sint.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(69, 7, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(70, 7, 'Eum.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(71, 8, 'Iste.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(72, 8, 'Aut.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(73, 8, 'Eum.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(74, 8, 'Aut.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(75, 8, 'Et.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(76, 8, 'Quas.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(77, 8, 'Iste.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(78, 8, 'Eum.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(79, 8, 'Qui.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01'),
(80, 8, 'Iste.', 1, 1, '2023-06-20 19:41:01', '2023-06-20 19:41:01');

-- --------------------------------------------------------

--
-- Table structure for table `room_reservations`
--

CREATE TABLE `room_reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reservation_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `main_description` varchar(255) NOT NULL,
  `sub_description` varchar(255) NOT NULL,
  `bed_type` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `room_size` double NOT NULL,
  `floor` varchar(255) NOT NULL,
  `num_guest` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `main_description`, `sub_description`, `bed_type`, `price`, `room_size`, `floor`, `num_guest`, `created_at`, `updated_at`) VALUES
(1, 'Honeymoon Room', 'Est consequatur expedita architecto officia esse.', 'Numquam et quo excepturi totam aut quia.', 'single bed', 300, 90, '8th', 3, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(2, 'Ocean View room', 'Similique vel alias id dolorem.', 'Totam est nulla vel consectetur.', 'triple bed', 200, 69, '2nd', 5, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(3, 'Family Room', 'Dolorem dolorem cumque a culpa.', 'Corporis omnis et et perferendis officiis.', 'triple bed', 200, 84, '2nd', 3, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(4, 'Deluex Room', 'Sed rerum est in beatae aspernatur quo.', 'Et commodi officiis ut ducimus autem aut tempore.', 'double bed', 500, 92, '1st', 3, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(5, 'Executive Room', 'Molestias illum amet vitae rerum reiciendis.', 'Sequi vel sed consectetur sit.', 'triple bed', 300, 72, '5th', 5, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(6, 'Master Room', 'Quia sint sint atque porro placeat non.', 'Autem vero sed accusantium.', 'single bed', 200, 95, '4th', 5, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(7, 'Prime Room', 'Eveniet quo expedita voluptatem aut et.', 'Maiores non numquam et cum doloremque at magni.', 'triple bed', 600, 80, '3rd', 5, '2023-06-20 19:40:29', '2023-06-20 19:40:29'),
(8, 'Standarn Room', 'Sit consequuntur inventore aspernatur corporis.', 'Totam tempore nihil dolorem eum et suscipit.', 'double bed', 400, 90, '2nd', 3, '2023-06-20 19:40:29', '2023-06-20 19:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_reservation_id` bigint(20) UNSIGNED NOT NULL,
  `guest_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_types_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_types_id`, `name`, `email`, `phone_number`, `gender`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', '11111111', 'male', NULL, '$2y$10$beiQMWoJoUAjBYUR9LqTzuXVZjoKfGe6HxfTO3STNnYNKXl6h5WeG', NULL, NULL, NULL),
(2, 2, 'sok', 'sok@gmail.com', '11111111', 'male', NULL, '$2y$10$2YUWIe6QNWIC6/ZntrI0zOWuN3q/b5Zk6PdcQUOwJ/Tgh1jpsuX7.', NULL, NULL, NULL),
(3, 3, 'User', 'user@gmail.com', '11111111', 'male', NULL, '$2y$10$e4NGABwHHWsg8yY1HMoX6OKe/3f8XF7/20Rx6wT3dsnbsGNzUcMA6', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `user_type_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-06-20 19:42:27', '2023-06-20 19:42:27'),
(2, 'Stuff', '2023-06-20 19:42:27', '2023-06-20 19:42:27'),
(3, 'User', '2023-06-20 19:42:27', '2023-06-20 19:42:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_on_services`
--
ALTER TABLE `add_on_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `add_on_services_room_types_id_foreign` (`room_types_id`),
  ADD KEY `add_on_services_services_id_foreign` (`services_id`);

--
-- Indexes for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_cards_guest_id_foreign` (`guest_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_room_types_id_foreign` (`room_types_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_guest_id_foreign` (`guest_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_room_types_id_foreign` (`room_types_id`);

--
-- Indexes for table `room_reservations`
--
ALTER TABLE `room_reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_reservations_reservation_id_foreign` (`reservation_id`),
  ADD KEY `room_reservations_room_id_foreign` (`room_id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_room_reservation_id_foreign` (`room_reservation_id`),
  ADD KEY `transactions_guest_id_foreign` (`guest_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_types_id_foreign` (`user_types_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_on_services`
--
ALTER TABLE `add_on_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_cards`
--
ALTER TABLE `credit_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `room_reservations`
--
ALTER TABLE `room_reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_on_services`
--
ALTER TABLE `add_on_services`
  ADD CONSTRAINT `add_on_services_room_types_id_foreign` FOREIGN KEY (`room_types_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `add_on_services_services_id_foreign` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD CONSTRAINT `credit_cards_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_room_types_id_foreign` FOREIGN KEY (`room_types_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_room_types_id_foreign` FOREIGN KEY (`room_types_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_reservations`
--
ALTER TABLE `room_reservations`
  ADD CONSTRAINT `room_reservations_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`),
  ADD CONSTRAINT `room_reservations_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_room_reservation_id_foreign` FOREIGN KEY (`room_reservation_id`) REFERENCES `room_reservations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_types_id_foreign` FOREIGN KEY (`user_types_id`) REFERENCES `user_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
