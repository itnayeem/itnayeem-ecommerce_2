-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2025 at 06:22 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itnayeem_ecommerce2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `photo` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'IT Nayeem', 'support@itnayeem.com.bd', '+8801511777744', 0, '1685552304fav.png', '$2y$10$1tp35HjMLVdnTzv2epfAiOayKOXXjkFwmE6DLZ/Te6p1GwuZ0AOPK', 1, 'hzVdn0cpZACbrBArvPWzfjXNHKqcaZCL9rIPD7g7SVaUlYcys6WlOdBAOrX5', '2018-02-28 23:27:08', '2025-02-09 14:23:28', 'Furniture');

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(11) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_user_conversations`
--

INSERT INTO `admin_user_conversations` (`id`, `subject`, `user_id`, `message`, `created_at`, `updated_at`, `type`, `order_number`) VALUES
(1, 'Hello', 34, 'Hello Message', '2024-11-13 13:58:57', '2024-11-13 13:58:57', 'Ticket', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_user_messages`
--

INSERT INTO `admin_user_messages` (`id`, `conversation_id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hello Message', 34, '2024-11-13 13:58:57', '2024-11-13 13:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(1, '16855645901616302730TOp-small(2).jpg', 'https://itnayeem.com.bd/', 'TopSmall'),
(2, '16855645611616302717TOp-small(1).jpg', 'https://itnayeem.com.bd/', 'TopSmall'),
(3, '16855646701616302913bottombig.jpg', 'https://itnayeem.com.bd/', 'Large'),
(4, '16855647761616302943bottom3-big(1).jpg', 'https://itnayeem.com.bd/', 'BottomSmall'),
(5, '16855648021616302962bottom3-big(2).jpg', 'https://itnayeem.com.bd/', 'BottomSmall'),
(6, '16855648251616302983bottom3-big(3).jpg', 'https://itnayeem.com.bd/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(22, 2, 'ঘরের আসবা সঠিকভাবে পরিস্কার করব কিভাবে?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '1685565208image_3fbBfprQBw7N4gQVk2eih5Y.jpg', 'https://itnayeem.com.bd/', 122, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(24, 3, 'সব থেকে ভালো কাঠ কোনটি?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '1685565106cedar-DIY.jpg', 'https://itnayeem.com.bd/', 81, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(25, 3, 'কোন ফার্নিচার আপনার জন্য বেস্ট হবে?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '1685565040maxresdefault.jpg', 'https://itnayeem.com.bd/', 91, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `is_featured`, `image`) VALUES
(21, 'চেয়ার', 'chair', 1, '16855546372271478.png', 1, '16855546372271478.png'),
(22, 'সোফা', 'sofa', 1, '1685554831148161.png', 1, '1685554831148161.png'),
(23, 'ইন্টেরিয়র ফার্নিচার', 'interiorfurniture', 1, '16855550522400629.png', 1, '16855550522400629.png'),
(24, 'বেডরুম ফার্নিচার', 'bedroomfurniture', 1, '16855551495583604.png', 1, '16855551495583604.png'),
(25, 'কিচেন ফার্নিচার', 'kitchen', 1, '16855552621501608.png', 1, '16855552621501608.png'),
(26, 'আয়না ফার্নিচার', 'mirror', 1, '16855553923719801.png', 1, '16855553923719801.png'),
(27, 'ওয়ারড্রব ফার্নিচার', 'wardrobe', 1, '16855555032306431.png', 1, '16855555032306431.png'),
(28, 'ডাইনিং ফার্নিচার', 'dining', 1, '16855555961045031.png', 1, '16855555961045031.png'),
(29, 'আলমারি ফার্নিচার', 'almari', 1, '1685555745970105.png', 1, '1685555745970105.png'),
(30, 'স্পেশাল টেবিল', 'specailtebe', 1, '16855564963939357.png', 1, '16855564963939357.png');

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(11) NOT NULL,
  `recieved_user` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `subject`, `sent_user`, `recieved_user`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Hi', 36, 13, 'Hi', '2022-10-06 19:11:23', '2022-10-06 19:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 3036, 0, NULL),
(4, 'browser', 'Linux', 900, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 4915, 0, NULL),
(6, 'browser', 'Windows 7', 582, 0, NULL),
(7, 'referral', 'yandex.ru', 22, 0, NULL),
(8, 'browser', 'Windows 8.1', 566, 0, NULL),
(9, 'referral', 'www.google.com', 90, 0, NULL),
(10, 'browser', 'Android', 2471, 0, NULL),
(11, 'browser', 'Mac OS X', 1087, 0, NULL),
(12, 'referral', 'l.facebook.com', 644, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 6, 0, NULL),
(15, 'browser', 'Windows 8', 9, 0, NULL),
(16, 'browser', 'iPad', 7, 0, NULL),
(17, 'browser', 'Ubuntu', 159, 0, NULL),
(18, 'browser', 'iPhone', 196, 0, NULL),
(19, 'referral', 'm.facebook.com', 969, 0, NULL),
(20, 'referral', 'lm.facebook.com', 19, 0, NULL),
(21, 'referral', 'itnayeem.com.bd', 1, 0, NULL),
(22, 'referral', 'org.telegram.messenger', 2, 0, NULL),
(23, 'referral', 'facebook.com', 2, 0, NULL),
(24, 'referral', 'com.google.android.googlequicksearchbox', 1, 0, NULL),
(25, 'referral', 'oninhost.com', 2, 0, NULL),
(26, 'referral', NULL, 33, 0, NULL),
(27, 'browser', 'Windows Vista', 4, 0, NULL),
(28, 'referral', 'shadhinchatbot.com', 1, 0, NULL),
(29, 'referral', 'mail.google.com', 1, 0, NULL),
(30, 'referral', 'itnayeem.com.bd', 4, 0, NULL),
(31, 'referral', 'www.messenger.com', 3, 0, NULL),
(32, 'referral', 'www.localhost', 3, 0, NULL),
(33, 'referral', 'sucuri.net', 2, 0, NULL),
(34, 'referral', 'l.messenger.com', 9, 0, NULL),
(35, 'referral', 'web.facebook.com', 1, 0, NULL),
(36, 'referral', 'web.whatsapp.com', 11, 0, NULL),
(37, 'referral', 'server.blazingserver.cyou', 4, 0, NULL),
(38, 'referral', '127.0.0.1', 1, 0, NULL),
(39, 'referral', 'www.google.ie', 1, 0, NULL),
(40, 'referral', '5.9.227.66', 4, 0, NULL),
(41, 'referral', 'khaleditsolution.com', 4, 0, NULL),
(42, 'referral', 'www.ecommerce5.itnayeem.com.bd', 2, 0, NULL),
(43, 'referral', 'www.werner-iso.dk', 1, 0, NULL),
(44, 'referral', 'normankfooter.wcloud.colorz.fr', 1, 0, NULL),
(45, 'referral', 'b.s3-control.eu-central-1.amazonaws.com', 1, 0, NULL),
(46, 'referral', 'flatley.synology.me', 1, 0, NULL),
(47, 'referral', 'baidu.com', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(1, 'eqwe', 1, 12.22, '990', 18, 1, '2019-01-15', '2026-08-20'),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26'),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08'),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28'),
(5, 'kopakopakopa', 0, 40, NULL, 3, 1, '2019-05-23', '2032-05-20'),
(6, 'rererere', 1, 9, '665', 1, 1, '2019-05-23', '2022-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 1, 0),
(4, 'BDT', '৳', 85, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_value` double DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `currency`, `currency_code`, `amount`, `currency_value`, `method`, `txnid`, `flutter_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 22, 0x5224, 'BRL', 2.4875621890547, 4.02, 'MercadoPago', '1235324161', NULL, 1, '2021-04-01 05:00:42', '2021-04-01 05:00:42'),
(2, 13, 0x24, 'USD', 10, 1, 'Molly Payment', 'tr_g3Kc3sHWwb', NULL, 1, '2021-04-03 03:00:17', '2021-04-03 03:00:17'),
(3, 13, 0xe282a6, 'NGN', 0.02747864222533, 363.919, 'Paystack', '245249284', NULL, 1, '2021-04-03 03:01:03', '2021-04-03 03:01:03'),
(4, 13, 0x24, 'USD', 10, 1, 'Flutterwave', NULL, 'i16r1617440896', 0, '2021-04-03 03:08:16', '2021-04-03 03:08:16'),
(5, 13, 0x24, 'USD', 10, 1, 'Flutterwave', '2004551', 'Niim1617441161', 1, '2021-04-03 03:12:41', '2021-04-03 03:13:22'),
(6, 30, 0xe0a7b3, 'BDT', 5.8823529411765, 85, 'SSLCommerz', 'SSLCZ_TXN_626a60c1b5b64', NULL, 0, '2022-04-28 09:39:13', '2022-04-28 09:39:13'),
(7, 33, 0xe0a7b3, 'BDT', 1.1764705882353, 85, 'SSLCommerz', 'SSLCZ_TXN_6314ae0467e9f', NULL, 0, '2022-09-04 17:54:12', '2022-09-04 17:54:12'),
(8, 41, 0xe0a7b3, 'BDT', 5.8823529411765, 85, 'SSLCommerz', 'SSLCZ_TXN_6431c9e5761b6', NULL, 0, '2023-04-09 00:09:09', '2023-04-09 00:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `email_subject` mediumtext DEFAULT NULL,
  `email_body` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Furniture', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1),
(5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1),
(6, 'wallet_deposit', 'Balance Added to Your Account.', '<p>Hello {customer_name},<br>${deposit_amount} has been deposited in your account. Your current balance is ${wallet_balance}</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><br></div></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `favorite_sellers`
--

INSERT INTO `favorite_sellers` (`id`, `user_id`, `vendor_id`) VALUES
(1, 22, 13),
(2, 41, 13);

-- --------------------------------------------------------

--
-- Table structure for table `featured_banners`
--

CREATE TABLE `featured_banners` (
  `id` int(11) NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `featured_banners`
--

INSERT INTO `featured_banners` (`id`, `link`, `photo`) VALUES
(11, 'https://itnayeem.com.bd/', '1685564121baner1.png'),
(12, 'https://itnayeem.com.bd/', '1685564248baner2.png'),
(13, 'https://itnayeem.com.bd/', '1685564355baner3.png'),
(14, 'https://itnayeem.com.bd/', '1685564375baner1.png');

-- --------------------------------------------------------

--
-- Table structure for table `featured_links`
--

CREATE TABLE `featured_links` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `featured_links`
--

INSERT INTO `featured_links` (`id`, `name`, `link`, `photo`) VALUES
(22, 'স্টাইলিশ চেয়ার', '/category/chair', '16855548732271478.png'),
(23, 'স্টাইলিশ সোফা', '/category/sofa', '1685554896148161.png'),
(24, 'ইন্টেরিয়র ফার্নিচার', '/category/interiorfurniture', '16855550702400629.png'),
(25, 'বেডরুম ফার্নিচার', '/category/bedroomfurniture', '16855551815583604.png'),
(26, 'কিচেন ফার্নিচার', '/category/kitchen', '16855552831501608.png'),
(27, 'আয়না ফার্নিচার', '/category/mirror', '16855554163719801.png'),
(28, 'ওয়ারড্রব ফার্নিচার', '/category/wardrobe', '16855555252306431.png'),
(29, 'ডাইনিং ফার্নিচার', '/category/dining', '16855556451045031.png'),
(30, 'আলমারি ফার্নিচার', '/category/almari', '1685555784970105.png'),
(31, 'স্পেশাল টেবিল', '/category/specailtebe', '16855565243939357.png');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(201, 183, '1685556835Durjan-266.jpg'),
(202, 184, '1685556982Wallace-283.jpg'),
(203, 185, '1685557147Moseley-281.jpg'),
(204, 186, '1685557263Apostrophe-316.jpg'),
(205, 187, '1685557556Utopia-170.jpg'),
(206, 188, '1685557706Stephen-194.jpg'),
(207, 189, '1685557858Sweetheart-177.jpg'),
(208, 190, '1685558079Rhone-173+175+176-.jpg'),
(209, 191, '1685558148Coral-148.jpg'),
(210, 192, '1685558348Fairbanks-109andCarp-109_0.jpg'),
(211, 193, '16855584575_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(11) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `header_email` text DEFAULT NULL,
  `header_phone` text DEFAULT NULL,
  `footer` text NOT NULL,
  `copyright` text NOT NULL,
  `colors` varchar(191) DEFAULT NULL,
  `loader` varchar(191) NOT NULL,
  `admin_loader` varchar(191) DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text DEFAULT NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext DEFAULT NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text DEFAULT NULL,
  `stripe_secret` text DEFAULT NULL,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `mail_engine` varchar(191) DEFAULT NULL,
  `smtp_host` varchar(191) DEFAULT NULL,
  `smtp_port` varchar(191) DEFAULT NULL,
  `smtp_user` varchar(191) DEFAULT NULL,
  `smtp_pass` varchar(191) DEFAULT NULL,
  `from_email` varchar(191) DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text DEFAULT NULL,
  `out_stock` text DEFAULT NULL,
  `add_wish` text DEFAULT NULL,
  `already_wish` text DEFAULT NULL,
  `wish_remove` text DEFAULT NULL,
  `add_compare` text DEFAULT NULL,
  `already_compare` text DEFAULT NULL,
  `compare_remove` text DEFAULT NULL,
  `color_change` text DEFAULT NULL,
  `coupon_found` text DEFAULT NULL,
  `no_coupon` text DEFAULT NULL,
  `already_coupon` text DEFAULT NULL,
  `order_title` text DEFAULT NULL,
  `order_text` text DEFAULT NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(11) NOT NULL DEFAULT 0,
  `affilate_banner` text DEFAULT NULL,
  `already_cart` text DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text DEFAULT NULL,
  `paypal_text` text DEFAULT NULL,
  `stripe_text` text DEFAULT NULL,
  `header_color` varchar(191) DEFAULT NULL,
  `footer_color` varchar(191) DEFAULT NULL,
  `copyright_color` varchar(191) DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) DEFAULT NULL,
  `menu_hover_color` varchar(191) DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_key` varchar(191) DEFAULT NULL,
  `instamojo_token` varchar(191) DEFAULT NULL,
  `instamojo_text` text DEFAULT NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `is_paystack` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_key` text DEFAULT NULL,
  `paystack_email` text DEFAULT NULL,
  `paystack_text` text DEFAULT NULL,
  `wholesell` int(11) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text DEFAULT NULL,
  `popup_text` text DEFAULT NULL,
  `popup_background` text DEFAULT NULL,
  `invoice_logo` varchar(191) DEFAULT NULL,
  `user_image` varchar(191) DEFAULT NULL,
  `vendor_color` varchar(191) DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT 0,
  `paypal_client_id` text DEFAULT NULL,
  `paypal_client_secret` text DEFAULT NULL,
  `paypal_sandbox_check` tinyint(4) DEFAULT 2,
  `footer_logo` text DEFAULT NULL,
  `email_encryption` varchar(191) DEFAULT NULL,
  `paytm_merchant` text DEFAULT NULL,
  `paytm_secret` text DEFAULT NULL,
  `paytm_website` text DEFAULT NULL,
  `paytm_industry` text DEFAULT NULL,
  `is_paytm` int(11) NOT NULL DEFAULT 1,
  `paytm_text` text DEFAULT NULL,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT 0,
  `molly_key` text DEFAULT NULL,
  `molly_text` text DEFAULT NULL,
  `is_razorpay` int(11) NOT NULL DEFAULT 1,
  `razorpay_key` text DEFAULT NULL,
  `razorpay_secret` text DEFAULT NULL,
  `razorpay_text` text DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text DEFAULT NULL,
  `is_authorize` tinyint(4) NOT NULL,
  `authorize_login_id` text NOT NULL,
  `authorize_txn_key` text NOT NULL,
  `authorize_text` text NOT NULL,
  `authorize_mode` enum('PRODUCTION','SANDBOX') NOT NULL,
  `is_mercado` tinyint(4) NOT NULL,
  `mercado_token` text NOT NULL,
  `mercado_publish_key` varchar(255) DEFAULT NULL,
  `mercado_text` text NOT NULL,
  `mercadopago_sandbox_check` tinyint(1) NOT NULL DEFAULT 1,
  `is_buy_now` tinyint(4) NOT NULL,
  `is_flutter` tinyint(4) NOT NULL DEFAULT 1,
  `flutter_public_key` text DEFAULT NULL,
  `flutter_text` text DEFAULT NULL,
  `flutter_secret` text DEFAULT NULL,
  `is_twocheckout` tinyint(1) NOT NULL DEFAULT 1,
  `twocheckout_private_key` text DEFAULT NULL,
  `twocheckout_seller_id` text DEFAULT NULL,
  `twocheckout_public_key` text DEFAULT NULL,
  `twocheckout_sandbox_check` tinyint(1) NOT NULL DEFAULT 1,
  `twocheckout_text` text DEFAULT NULL,
  `is_ssl` tinyint(1) NOT NULL DEFAULT 1,
  `ssl_sandbox_check` tinyint(1) NOT NULL DEFAULT 1,
  `ssl_store_id` text DEFAULT NULL,
  `ssl_store_password` text DEFAULT NULL,
  `ssl_text` text DEFAULT NULL,
  `is_voguepay` tinyint(1) NOT NULL DEFAULT 1,
  `vougepay_merchant_id` text DEFAULT NULL,
  `vougepay_developer_code` text DEFAULT NULL,
  `voguepay_text` text DEFAULT NULL,
  `version` varchar(40) DEFAULT NULL,
  `affilate_product` tinyint(1) NOT NULL DEFAULT 1,
  `decimal_separator` varchar(191) DEFAULT NULL,
  `thousand_separator` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `mail_engine`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `paypal_check`, `paypal_client_id`, `paypal_client_secret`, `paypal_sandbox_check`, `footer_logo`, `email_encryption`, `paytm_merchant`, `paytm_secret`, `paytm_website`, `paytm_industry`, `is_paytm`, `paytm_text`, `paytm_mode`, `is_molly`, `molly_key`, `molly_text`, `is_razorpay`, `razorpay_key`, `razorpay_secret`, `razorpay_text`, `show_stock`, `is_maintain`, `maintain_text`, `is_authorize`, `authorize_login_id`, `authorize_txn_key`, `authorize_text`, `authorize_mode`, `is_mercado`, `mercado_token`, `mercado_publish_key`, `mercado_text`, `mercadopago_sandbox_check`, `is_buy_now`, `is_flutter`, `flutter_public_key`, `flutter_text`, `flutter_secret`, `is_twocheckout`, `twocheckout_private_key`, `twocheckout_seller_id`, `twocheckout_public_key`, `twocheckout_sandbox_check`, `twocheckout_text`, `is_ssl`, `ssl_sandbox_check`, `ssl_store_id`, `ssl_store_password`, `ssl_text`, `is_voguepay`, `vougepay_merchant_id`, `vougepay_developer_code`, `voguepay_text`, `version`, `affilate_product`, `decimal_separator`, `thousand_separator`) VALUES
(1, '1685552345logo.png', '1685552376fav.png', 'Furniture', 'support@itnayeem.com.bd', '+8801511777744', 'ফার্নিচার হল একটি অনলাইন ফার্নিচার বিক্রি এর ওয়েবসাইট। আমাদের এখানে সকল ধরনের আধুনিক ফার্নিচার পেয়ে যাবেন খুব কম দামে।মনে রাখবেন দামে কম ও মানে ভালো ফার্নিচার শপ।', '<div>© 2026 Furniture. All rights reserved. | Website Designed by: <a href="https://itnayeem.com.bd/" target="_blank">IT Nayeem</a></div>', '#942aff', '1645870113animated.gif', '1645870116animated.gif', 0, NULL, 1, 0, 'AIzaSyPlaceholderGoogleMapsKey', 0, NULL, 1, 1, 1, 0, 1, 'pk_test_PLACEHOLDER_KEY', 'sk_test_PLACEHOLDER_KEY', 0, 5, 5, 0, 5, 'smtp', NULL, NULL, NULL, NULL, 'support@itnayeem.com.bd', 'Furniture', 0, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 5, 5, 1, 1, 1, 0, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#ffffff', '#942aff', '#942aff', 0, '#ff5500', '#02020c', 0, 0, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 0, 0, 0, 'pk_test_sample_paystack_key', 'junnuns@gmail.com', 'Pay via your Paystack account.', 6, 0, '1566878455404.png', 0, 'NEWSLETTER', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.', '1578998786adv-banner.jpg', '1685552352logo.png', '1567655174profile.jpg', '#666666', 1, 1, 0, 'AcWYnysKa_elsQIAnlfsJXokR64Z31CeCbpis9G3msDC-BvgcbAwbacfDfEGSP-9Dp9fZaGgD05pX5Qi', 'EGZXTq6d6vBPq8kysVx8WQA5NpavMpDzOLVOb9u75UfsJ-cFzn6aeBXIMyJW2lN1UZtJg5iDPNL9ocYE', 0, '1685552348logo.png', NULL, 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 0, 'Pay via your Paytm account.', 'live', 0, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 0, 'rzp_test_sample_razorpay_key', 'cr0H1BiQ20hVzhpHfHuNbGri', 'Pay via your Razorpay account.', 0, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', 0, '76zu9VgUSxrJ', '2Vj62a6skSrP5U3X', 'Pay Via Authorize.Net', 'PRODUCTION', 0, 'TEST-6068652511264159-022306-e78da379f3963916b1c7130ff2906826-529753482', 'TEST-6f72a502-51c8-4e9a-8ca3-cb7fa0addad8', 'Pay Via MarcadoPago', 0, 1, 0, 'FLWPUBK_TEST-PLACEHOLDER_KEY', 'Pay via your Flutter Wave account.', 'FLWSECK_TEST-PLACEHOLDER_KEY', 0, '9668BB2D-C246-4175-8F5B-CB72F655097B', '901417869', '2C2879C4-9F81-47D5-89F3-863F4CF0E7A3', 0, 'Pay Via 2Checkout', 1, 1, 'demo', 'demo', 'Pay on SSL Commerz', 0, 'demo', '5a61be72ab323', 'Pay Via Voguepay', '4.1', 1, '.', '.');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(11, 1, 'বাংলা', '1579775344B7uQhhvr.json'),
(12, 0, 'English', '17223973774PrUoi8V.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(11) DEFAULT NULL,
  `recieved_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `message`, `sent_user`, `recieved_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hi', 36, NULL, '2022-10-06 19:11:23', '2022-10-06 19:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(1, NULL, 29, NULL, NULL, NULL, 1, '2022-04-21 10:58:55', '2022-04-26 09:48:54'),
(4, NULL, 30, NULL, NULL, NULL, 1, '2022-04-28 09:36:59', '2022-04-28 09:55:38'),
(6, NULL, 31, NULL, NULL, NULL, 1, '2022-08-17 17:03:49', '2022-08-18 20:33:25'),
(7, NULL, 32, NULL, NULL, NULL, 1, '2022-08-19 13:34:48', '2022-08-22 02:16:26'),
(8, NULL, 33, NULL, NULL, NULL, 1, '2022-09-04 17:53:40', '2022-09-04 20:01:19'),
(10, NULL, 34, NULL, NULL, NULL, 1, '2022-09-06 07:59:09', '2022-09-06 10:29:27'),
(12, 7, NULL, NULL, NULL, NULL, 1, '2022-09-06 14:59:02', '2022-10-06 11:54:40'),
(13, NULL, 35, NULL, NULL, NULL, 1, '2022-09-06 15:02:32', '2022-10-06 11:53:59'),
(14, 10, NULL, NULL, NULL, NULL, 1, '2022-10-06 04:00:39', '2022-10-06 11:54:40'),
(15, NULL, 36, NULL, NULL, NULL, 1, '2022-10-06 19:07:51', '2022-10-06 19:11:47'),
(16, NULL, 37, NULL, NULL, NULL, 1, '2022-10-07 03:55:32', '2022-11-26 10:50:51'),
(17, NULL, 38, NULL, NULL, NULL, 1, '2022-11-27 16:02:41', '2022-11-27 18:25:02'),
(18, NULL, 39, NULL, NULL, NULL, 1, '2022-12-27 06:42:49', '2023-05-19 14:43:34'),
(19, NULL, 40, NULL, NULL, NULL, 1, '2023-04-02 22:21:21', '2023-05-19 14:43:34'),
(20, NULL, 41, NULL, NULL, NULL, 1, '2023-04-08 23:47:49', '2023-05-19 14:43:34'),
(21, 14, NULL, NULL, NULL, NULL, 1, '2023-04-08 23:50:13', '2023-05-19 14:43:31'),
(22, 16, NULL, NULL, NULL, NULL, 1, '2023-05-03 08:27:51', '2023-05-19 14:43:31'),
(23, NULL, 42, NULL, NULL, NULL, 1, '2023-05-14 10:50:14', '2023-05-19 14:43:34'),
(24, NULL, 43, NULL, NULL, NULL, 1, '2023-05-18 22:46:46', '2023-05-19 14:43:34'),
(25, NULL, 44, NULL, NULL, NULL, 1, '2023-05-24 18:08:17', '2023-05-24 18:18:40'),
(26, 20, NULL, NULL, NULL, NULL, 1, '2023-05-24 18:12:06', '2023-08-04 14:14:23'),
(27, NULL, 45, NULL, NULL, NULL, 1, '2023-06-18 15:49:55', '2023-07-25 20:31:19'),
(28, 21, NULL, NULL, NULL, NULL, 1, '2024-02-20 16:54:33', '2024-11-13 13:57:28'),
(29, NULL, 46, NULL, NULL, NULL, 1, '2024-02-29 06:06:52', '2024-07-26 16:08:33'),
(30, NULL, 47, NULL, NULL, NULL, 1, '2024-11-09 08:20:55', '2024-11-19 18:10:52'),
(31, NULL, NULL, NULL, NULL, 1, 0, '2024-11-13 13:58:57', '2024-11-13 13:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(11) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(11) NOT NULL DEFAULT 0,
  `wallet_price` double NOT NULL DEFAULT 0,
  `shipping_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_discount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`, `wallet_price`, `shipping_title`, `packing_title`, `customer_state`, `shipping_state`, `whole_discount`) VALUES
(1, NULL, 'BZh91AY&SYêÔõ\0¨_@\0Pÿø/ïÿ¿ÿÿú`=÷CQµc;ÐAª~¤f¦&¢2 24Ð0¡12IF¡ê\r4\0\0\0\0\0`20110LÓLÔôD&¡£A OPõ4h`20110LÓLÐM`M4d4iõ4Ð=CJ$! ä9ÎCQ¬å\rÄê=ÐD7$µäù|¤±B£%¯ÄBñ ºdâ2CúàÂsäWFÛì¥ædÝg)C-ÊwKÝ8CXÂWªLß&ªÕ³ËÉÕ¡R¶ ¶cO?ÈÐ·àI;~Â/~VoÌrôçx07ÙÖbx\"£ÞyÌwrö\nb[i°YB^¾7É_d^}°M`%	,FÇ$F0àÆ2ªÉÏ£>ÒVC¨È«fT2kÕ5|¬h´A\0±¾8eX_)AQ.4¡U0/íW¿ÌÂ)K^ö²c	%PCaI­÷ÍÇ¨ÜI¬e6`Ô¹»x¶|CÌ´ÊF0¨³3xÏi¢BMJ2ÄT±q!y$%U\n.j¨lVr\nL1rÆí°TØa+	Ì+	nIUÎQDvAAðb¤i (2°æRöDà§L0Â#( [0¨CCjTQ1$1od\0Ô34BD©%Æ6\ZÇ³6$°HJ\Z@Æi¥i¶¿#<+j°AD¨t·ÆýQÚgm5ÝÁ¶Ê*%e\nBKQz52+K¦\nR_RÊãÚîó&ÚJ¸áh¡±09´Q}ì³¸ä³-¦²Æ£Înà6è9N¹ÎQã>&âÇIÙ7&ÓÈ~O¹Àm	6cýpè>xÓé5!\\ \"csó¬7¡\"«p¾#(F¾I!_|Â&¬À`î1aÎA*Í¿Ìí:çÔd¾$ìlàA°xP àdIâE÷J\"Lª¤j8¾¦úª\rÆc.Zöå¼\reÁÔj\Z+ú/iî Ì¼üµÐYq¬Ã0©¼yI´ IÈÅ< Úàw\r÷\rFÂ.Õü\Z`I¼ZØgþ!kÀ§ ¦8szV×Ã%)2Ö¹R³ènK\nvn¢Ãí_]âCLÅ	$pa&zC$¥XðXØ:ÐeãéÄ¸¶ê½A7rà~þC_+¹®=djÀÁÝ°ê=uªRAÛ¬j10<Î\'x´4Wø0ô\0Ø9	z0bcûîÒãu9,PÔoíî3(r)xP¢«Ya[}H-é*ªØò5F3w\"×m:ÙóõhÇ2Æ]ÑDyýcqÐÄ2oéØ)¬CÐqÇ#K1ÂJLÍ¤a92¨¬«\\\nÐ/R°\"F@±[QÄò4í¢ßady5bqÿJù\r3#Ö1g³tibzp}%¸Ú|ËÒö¬1¦Óc¨á¯<²ªUa!ÁY=(S¢Ú;¯ÈÚ`k¸d	KBÀeaL¢p>	Rv+Q×%å:v6YpX\0D/2TÁD`ÂJ@A,\n65+·¥J$ê¦õ¡\0	&Éã*¨¡B!tÝa¥YpIìuÃÓ\n^ZôÐ±Z(\ZdËã(YX/B¸¨ZÂÉÃÒÍzù9ë;­s;;î,¬dÅr)µûÌäfD «£.o§´Kv\rýrN© qñø (((Sþ.äp¡!Õ©ê', 'Cash On Delivery', 'shipto', 'Azampur', '2', 320, NULL, NULL, 'i2kY1650989847', 'Completed', 'mdrobin4941757@gmail.com', 'md Robin', 'Bangladesh', 'r797974974974974', 'vb gf', 'zc', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-04-26 16:17:27', '2023-05-02 18:47:55', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'xxfcv', NULL, 0),
(2, NULL, 'BZh91AY&SYÚ*×\0åßP\0Xø;ü¿ÿÿú`]÷@°h\01Í10\0\0\0À\0LL¢\'¨\0\0\0\0\0\0sLL\0&\0&\00\0I\"Aé!ê`\rdÓMÔz@sLL\0&\0&\00\0C&ý©¦ÒmL¦i©aRñSv\Z¨!þ/zi?&\Z©qxÉkä1·~d¤|HeþIfÔÖÜe0sRrÔ´	«á3O¬\'ãfDÒC¾ÖµcnJ*ÏB06¼ÄÈÌËý±ä2ûÇýø§,¶ó4Õdm\"Ç¢HæXÐùóÜoÅ¡°ÍÄa!ì*<MaO¸ èHKÚûJ#Ðb]É .Àeå	m¾JZ,;L7RNÃ´ähAÝ4	Ph í56$FÓ\Zh\ZÎ Õí[P0eÍá¡¢e\"TÒ°3 KËJNqÔÌ¬&Ú2O©\Zm;ã9W)Ã*,J#M]2ÛrHm´Ñj¾¡®ºç!$î*\n:\n¦³\"ëq-Ài6Â¸LÚ·O\Z²±\06\rw17Ì0aiÎs\rêeÄk\Z©FDTZªÁKæóHÂ8ÄPá¡ÆF%6R%PÛV)HÐzgÐ)T[¤F3Ë¬HKtyÕÛ£Y$áªÕiHd!Â4]\rD¥÷\Z­áwC²¶ø¥Ea@¥.µUÔÂDEDlÑ{ZÅ üaJB $B°a(@`-JÑ!	±±uÎD8pãÅ^]µQL$ÎD¹u1Çf³7ªßvÌ­Ç7PPÕ1¦ôÛ´Á¶´:50»Xä(R»K\ZVfÔ&ùTo±\n^M,ÍôC9;Þ.iU-C°}¹Aäì³ÒA¨w({N#\\æ¾c,åÄvËûIN\'%vËÉ=mÊÙ»ZI!Z=$·ÃùUa Û)9¸ûÎä fßô;§æf¾$ðlÈ Þ<hwîiÀäQI½TNAéSºªÃ ÌÜ3ìqð,ÆÃE¾$î?Á©cïß@~Ò\0Ü\\¹¡±ÀÏP©úÁÄ&\ZÉdpm\rzE3â5pà01c¥Êp6±£Àg0þy^úcò±va1RÚæ$Ç ½\Z2j¢Ç%ÿúÞvi IMK1SÌ© ÷É# ÍÃ.>-ÂP\r¹v/ÜkÚQ³©å*nÌÍáÀÂJH:ÉrÁËPóPr{E¡Ñ[î õ4	ns<ñbcúÏ9áCqÙãähPò)°P¢«Zc[J_ØUT)pú_Ín;;Ì°â}õÜ@0*yrÌhÆ#O«SV·wÐ°Ëà)èSxfS¦¤o¹CI¸B©RIÊF«(k°¥#°4`%pDd»Á 7>\"É\r2ÄÔ9åÛû:«fb4ÏÀÐ¡ðá\\þ×Ì²U7ô}H_ÁÞzi°v$kÚm®µU`s(\Z²a.O¡Ä¶°Ë/HIb2°¦R,FB¨Ò°worXüþÞêÛ:_ÜÌÅï4BJ)Â$\"%d\r(`0i&Àæ`p4;õ9ò,;¥u2óe°@\"ã\'ºUQBBõ;øÉ¡¶. rà!ât¶T±{&Ù@Ó )66~IØ	10,9:BI&êõh/¸gÃ c§P9¥Ç¯ÛQ\"ÊÁAÐQCâwàýGÐæ8 ä&¿©£2â¹é!vØ|1+¥PÍ	@\n)÷rE8PÚ*×', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'A38C1651029832', 'Pending', 'abul@gmail.com', 'Md abul', 'Bangladesh', '01956048448', '35/3/1', 'Dhaka', '1216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-04-27 03:23:52', '2022-04-27 03:23:52', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Kafrul', NULL, 0),
(3, NULL, 'BZh91AY&SY\\X®F\0ç_PXø//ü¿ïÿú`}4hAc4\0$*9M0	À\0L\0\0(G¨\0hÐ\r\r\09M0	À\0L\0\0\0¨¤Ú=O(\r224\0hh\0æ4À&C\00L\0\0È@FS\n6(`O)£òSq$n¤æØê=®ü!÷=|#öús¹¹·ZH£ªhQO0åÃ}E4Üî:ÁÃÜ29rpÔ´	xÝ§Ë+	Ó¦D´¤ÙZ±·%NgNªåB©¶ëxÌ\rbÄHÍæÿØö`È?^9Ê8ÖLf²4Çz##ÐN$v§yÎó9S[b«-VÙ\nWÄ ð$%÷¬1.IYËJÖ¿ÒJg)ñ\'\'3b>#õ0 \ZIPhän<8¨ Ó\Zh\Zßo|/¿)H¤Eä°R@d!s´>ÚPÁHM°ÿ#\r£\Z°ài´ïÎ¹Í³õ4>â¨¸Ò²mcHm´ÑiÒ/1¨7+°aQQB02­lbe­Ì¡ÐeFhl)Y^ó0¨Ë`Ù]ÄÚa$GTDRê#j®R!QnîâkaLoÑ$)Æ$ÁC21(J<Õ¥¥ ZvxÅFÂa.sH<g,æ+ é	IËÍÐ>	¬ÁD¡WV$2\náb¢Ck42U\nn_D%½4H cI1 fðL3ë¦J´\\ÆXµ4èJ­4hÅ«zÉ\n²Y*Å¤¨±¦I1b*É]VÕ×µ®¤õQ7nßÞ¯Ê.®(Î¦g18¨}úlÚ«I¶Ï­](l¢¨]1ISjmê`ÕØèÔÂë¡J:êXµfkÛ9ÍQ¶S3,Nz!9;c+UL)ÄtõqÈsç)\'ô,2ã>iÕýæÃãgVæ`»söÛ¡é¨Úó¾Å,¤Qó/ÏáªÃd-¹À±£(A\nÍ¿cø8ÏÐÍ~¤ïlý\rãÅãCä;ð:RhoU#aÐ>5;ª¨\\8²ÛÃI m{ÓbÆ¯Dñ©­ºômÜ\rÿc¸\\ÔÚp4Ø ^°q IÇY§¤C`hÈ)sÏ#¡°àE¶í  ¹$2Àm1ÑØgx|y¡õÄc¦EÙkaA!_+$$~Y(ÑÛU3X>jA¥wÌÚfh$Gä×i)h2JPÅÁî/&	múÔË}¡66wr?ú5ÀäQ~\'¸òN¤nÐÑÛZQ) ÷ÉsRáÒù(=Öá¼Lq¿Ç$$qô	JMêcéæXåO\0Þ2ho9ùú\Z=\nm\nUka®+qkRûÊª.\ZÒ]\r;Ë×yÙ]§=	ëâc½Üä*èTµÀ«[ºPÈLeì)wdô{¬IäªTfo#	Ñ\nzAV¹¢Ü;°ÁÀ\"F@¾ãUÌaìmkÈZ!Ød²ôÓ3»Ø©îWÔÀÓ?©¨#Sûq¿±º>ÅÒ©À¨½F½¤\"é´Ø:%¯´Û®¶,¬Àô*/t|UDFZg|!%2àd(<ÆAÐ\":éöv§lëïGè©ËËnVH¥X«¨«$bÉjBÔ(¥Z;N»¨îìwdVæ(¨{ËÎKp@\"ã\'¤ª¢áÆ\r\rp©çX{1Läkb¦@Yfg=\"§P*a`.Pf£;b¡F+êÐ_pÏÃ¨cM§ÇÇí¨ÈÆñÀÛiÕ¼KÀß\\¡§3wË{uo3 jô_AÜú]ø??D\r`èÊ\\ñw$S	Åä`', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'JNS21659374548', 'Pending', 'test@test.com', 'Extra Virgin olive oil', 'Bangladesh', '07865424567', 'hbgtyhrtfj', 'hfyj', '12123', NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, 'jku', NULL, NULL, 'pending', '2022-08-01 21:22:28', '2022-08-01 21:22:28', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'hjyjyr', NULL, 0),
(4, 31, 'BZh91AY&SYÍ¦\0_@\0Psø?Kô¿ïÿú`=0\n\0@`\0&\00\0\0) H¦ @\0\0£ÔÓ@9L\0\0À\0L\0))A£\'¨4\r\Zh\0\Zhõ\0\09L\0\0À\0L\0¦h)ÒIêmFM2ÒziL9Â§¼ö³¹ í ÃI<$þOßi%ÞvýG. ÀDøÝ.Ò`¥·8Aw]<ß2Üª¸ã§ÑÓ³cLFAßT.ÝÑGÂ;ýCé$Î;`5ô0LbïÀHÈÀä$LF6o({Ãæu1ïê{ÒFÔGv8Ê¯®RjÂÅ¢ÏyÜ	)\ZBcGrD¤³3vÓM(0CHU÷r8	&W¹±yDzhÔÉ d&a$1Q/Ú	|÷f9{=Á\"((p¡I0HÐTLÍnÆSH6wfµ°²FÃ\"êg1îàr+»¹«Ñ\Z9Øå(¡Äiid;55t&ë ÃtãÆÖ-kÚÙ\\¶g\"yÇo\r-°ÕÈ¬°«äSÃ//\r.Â	6Ê²CIA<õEû?Ò1!Ì3v±K0É)ÓÆ#Z4aGZ1ÈLB `\"ä	Å	6bKSioí7á]àWl »#Éä©óO3s­,çU\'ïª¾dÆu¤sµßnávìtt\"»9)¹ÔÁËs{qs¢K9O£2[·9Í±º%Ë³ý«G¡WN_mâÍI¡Ùç<|§Ö|Ey\'ÂbT±ýP¸¡÷>+&¥?ë«úíÐ÷GÉÔmyí.í£µ¤¢Í×íV\\`ð¹@¯ fßØýsó2_ÜÏ`ÈµøMì;29R}ê¤m9Æ§*ª Ìßø©ùFÑ£Ôv04,|µÀS3CRúHÚ\rÁLÈvAtòchl\rÁ\rõ<LÍ¤a¢ÐHøXGþLÍGØÔdô<¼¡åx¿+³\"ø¥NH½þºT7\\n£eyO`ÈÀm¦dI$p^M6c$¥âþÐÈÔf£1ZßG°\'oNGüú\r{½\ZåØ.ðÔ­(y±52bX8txÂà-%o¸z¶G[DAëÇÔóì`}±ã@ÜÄ{¼Í¥-BZÚiÜËl¶Ä~&bÁ`û]á³zøóSÓdû¼Ëí;)Q$ú\n¹0Ä\nµ¯ZÆc¦IÔ2\'ÉëIØU*Bÿc¡JMäaõ)±Æ3¸¢Þ;K\0Á,Á2±q{\Zñð|\Ze¨tË#±S²¶eÆùA¡úo¬Ä¼RÉTÜT>^Ç2#\Zm6:DK_¦Ò©UaäsY°£¬%7ÐÞxðgêÐ®2°¥JPeq ì4¬79,G<ýzS½QÜèùÐÜ%$W¦1 &H\"Â\Z)W   9ÍGI)R:s²`mÆUQBBæ·ÁlÅÀ¤\\D<Nö^ø¦+b¦@`²21S©@©upÄ4ÀU(¸³aø%÷hÇQ@¾{Â9#Ã·z¡Ä$Ì<	Þþ#ò9\0ý¤P).d(} y#XÕ|Sdò>© ïßÄXÿÅÜN$3ia', 'SSLCommerz', 'shipto', 'Azampur', '1', 57.5, 'SSLCZ_TXN_62fce7b186651', NULL, '2kWo1660741553', 'Pending', 'techlockbd@gmail.com', 'TechLock Gps', 'Bangladesh', '01705090630', 'gangail', 'Kishorganj', '2200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-08-17 17:05:53', '2022-08-17 17:05:53', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Ff', NULL, 0),
(5, 33, 'BZh91AY&SYe?_\0ðßP\0Xø/Oý¿ïÿú`\0ô åÀÓ@ AM44Ð@\0\0\0\0 M2*A \0hh\0\0\0s\0ÉÂ`C\0F\0¥$6¨Ñê\Z\0\0\0\0À2`0&À#Di~£$4zjz&ô£zQ\"H¨2Cæs@ö_?r¾éúX¹B£%¯ ÄBáó$½$è2C8ýdzRZiû3\"KÔÖÕ\nøßJ,«[NPà_\\á+ªLÞMkV6ä¢©Èí÷*-S~Ã2\ZËHÍÆ>£Þyòå©þÊsÏ¼ÓU¾<ôEÏp` ô.hzï6Å¡Àà@Ïb¡÷°ß\npu$%«æQ+ K±4BZWã%>0qÞa¸9¡ÌÕädB@Õß$Ðâ7ãA6ÄÈ5Â àö¶{P,Íù44L fJ+04<·Rsn¡¡YM´Ba\05QÀÓjàÛ¦»Úé¿¨j{MÀÑÌêÆ5Úhµ\'eú&¥j4ãAÆyÒµ¤ìuRm\r+3jÞp0²±\06\r{Þ»[IÂf/J_kr w½íJß3\"Ì©R`\n,H\\Y²ÊI£;ÐeV*¦2\nLå%&qrÃÅÛ9S`é	N·ÆdMÁ&«39¢8FAÖ*ºÐº¨SÍz!.+êI\ZI9álÓÌøéRYIC£ó¦IÅ¤d&	!ËJ0iá\"D±Î7ãÚÌh7ï¤ñ¦8¹¢<ïCgZ*×*WÃ¦¢÷3½5ÜìqCj ÊeÂÙzÄ\ZÎGFT9\n£®°ÆU³	»»7¢«ÄMây!9Õ­åU)8¿@så=ä£Ò@¦E=hÓ:\'ùùNÁK±Óðux;q¸àÑã`3+/BMmjMM£â)0Á¡A¿9[v¡+6ýO¡Î~¦kó\'fÏA°ò AÌÜÐy\n)48ª¼èNêªÃQ\\9níøãxÑ}ÇÌ ½ã\rKÓ\0:|ð0jp9µ\n/X;a îiîchl\rÁò;B2W;N$[~òC,ó+#:ØgÉîðßeÝr´aÃ!Y¢Ç9w6\ZCbª¦ÖÖgä¤g©]Ó2ãm3?!BRk±)h2JPÏ\0øLFpqøÔ¿*=l §Dtô¢H-)9\\$/ÍØXc!î	#Óxy(9>ájx+ü?ðy Höàê&yäÄÆ1ûO/qc:CÙîò4(yÞ(ªÖ¦WÒ¤ü\nª0$¹­FÎ=Æ+±ÞÏMHOonâzøF}XÑFÁ>Ñ[A-kn,&3É;dô{X9¸B©RIÂîe2v¢à;EÉ`# Y®Á© pîB¡!2áK<ó;}J\nú\r3î4h~<c|N×ÐºU6*/ÜkÌèB0M©æDµï5±§­ÕØÌ!Ìà¨r\"-¡Èì8ØdÎY¬)°I°i\\9qr\\»¼»öv*8ö÷SØÉ\"²1H &H\"TÂZ(W  MýNã¬ÝR:yºÞ$ÀÉç*¨¡B!tãã\\8TËH¬=r¥Ì]4,Öªeó@©È1­vÅC<Å¹ñ_f|z[· w#o}D«QGBvaõ;\0uÖ5+§	ãS	àØÿÙÍ\rÜjþNNÊAcÿrE8Pe?_', 'Bkash Payment', 'pickup', 'Kazipara', '1', 130, '9I41X20PGZ', NULL, 'jYqx1662299794', 'Pending', 'didarcoxmedia0@gmail.com', 'vcvcv', 'Antarctica', '01950090011', 'xcxcx', 'cvcvc', '1212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-04 17:56:34', '2022-09-04 17:56:34', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'cxcxc', NULL, 0),
(6, 34, 'BZh91AY&SYS÷­\0ÔßP\0Xø+ö¿ïÿú`hÄ@\0RSÔÒ=MÓÈB\0ÐhÐ\0\r\055PÉ¡ \0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0\02#M0¥=&Ô=&Ù©4D(DBSÍØðI©îïMìõpBµ	~Ã\Zë\'ð}´Å\n¶Za2I¨ÉcI%ÒJg³1$µM0¬PV¾´¢dÍ>2°ÒíÎÊ§1C»±y¸È½øwè[fvÄõ4ªÕò9	,xè$3<}y¼c¡°ÎÓræf5¶Ü«\'Q}2r/ñ²ß41¯	sBÅÌe	wgÆL>9ýÍ©¹zÉahEè4\ZBÀÚ4 ÓHkXW¶íÛ¨3ìIJ¸ffd,SbfC\"^u¤åcS\"«À`H\rd8\ZmbCÊiST1(X`HÊ¦Ø&4ÛM´Òl>ÆÅJ `Ø³ReïThl\"³8^ó&Ä0¨ÊUQ®.&èQÄuDE%ê&¨dEEª©§,cª1ÒëHÂbK(p±ÆN¤H5\0ºv{ÕFÒi.rxÌg5XtyºÓ¤ÖAD¡¬.®­Hd!Â,ÕÔHh-ÖB¢â·¯áÜÐ1¤R Gë0ÚA\r\r©PU1$1v²\0d1! cL`@ÐÆÐÉi(\ZÆ7¦ãF$®^\0ðNNI~hÎk\Z%]ê	4QÆæg\"uPüÜ6ÝVølÊØâíPeBé7M³88¶,V¦¤£/Å«3%Âo3)(ß)¬2Y7:êE­ëôªS¾}¹Náæð\ZMCTèúOS«cå{¡Zdô¥e×mn[Ýr¨Úô¾ÊÚ;ZI!Z ÿl·ÏïV,p6ÊEn<(A*Í¾GqþOØï¯ý5_ð\r¡ç@©úæÇBLÎ\n¤jtþ0:,LC¨Ì+jÒ¸YrW)hIjP§É4X¶Ý*LCJ&F\ZÊ)£\\Ûfêh%\r¼	¡°ò>xMÌÇ0ÝÌr\\Æ&áÈÍçàæ2BFxûÌ½lç³JU6-)«Ñ/ÈTY\rº,\'ÑzÜbpÓi IÉ¦Ä¥É)CÜGA°úT¶ú=p5ãÀúÿñ«R«Å®<ÈÛ0Íá¼s¥¡2\\â\\gÌ5SÔÀt>\"Øê¯ùÁïC`{®tô®LLcéàXãN¡¼47þ~¡Q6\nUkSLkqh_äUT)pìIw­FÎÎEë¼ñg´0*y÷fO_#P4e$ù¹0¸kw}Âb¡¦A¡±ù×Ç6öHÀã»ã£(k\"FÃVq`²X(27à0üíì¶HiÅÂ~vÎ>Æ¾CLù?@Ø}ª6ãéÞúJ¦ò¡÷\ZüWÓi±ÔøI£^ómuª*ÅàPÍfÂ^%hQ*ÚD[C´àv`2ÏBÄeaA-(2ædA*pÒ¸wv¹.GM=:ÓÜÛ:ÞÇö÷10M¡þLÐÐÆ¤Ø l@CI6BÇa×SÒE©DCÔÀ/H[$¸Éã*¨¡B!s]fkw\09pIît®4±{&Éj i,§Tñ<J*\"ÔgX e´aðGÕ¥}ã?Ç@Ç=ÃÇÖ¢ £N÷ì>xàg10f@ß&Ì\ZÄÄÇñãTÝ$^^hÁ°!ý¹\"(H)ûÖ', 'Cash On Delivery', 'shipto', 'Azampur', '1', 110, NULL, NULL, 'Zf6d1662436824', 'Pending', 'support@itnayeem.com.bd', 'Suyel Haque', 'Bangladesh', '+8801722597565', 'support@itnayeem.com.bd', 'Ggg', 'Gu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 08:00:24', '2022-09-06 08:00:24', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Vgg', NULL, 0),
(7, NULL, 'BZh91AY&SYØÜ\"+\0ðßP\0Xø/Oý¿ïÿú`wÀzPe@Ó@ AM44Ð@\0\0\0\0 2*A \0 44\0s\0ÉÂ`C\0F\0¥$6¨Ñê\Z\0\0\0\0À2`0&À#B\nziGé6¤zF\'©¦ô¡è\"!\"\'dùt¸q\"|PýÌròÉ¾cæIzI\'ÌdqúI,ö¤´.:(ÓõfD©­«ñ¾YV¶¡À¾ÂWT¼Ö¬mÉESÙä¨PµMø[Èk,#67úy¨È?:ì§f{üÍ5Yã¼ê¹ä#ÄI{4=Sí6Å¡Àà@Ïb¡ð´ß\npu$%«èQ+ Kh02´¯¬õó\rÁÈæj¦¨ø#$Ø`º¬.ù&¸ç\Z	´&&A®µ³ÚfoÈa¡¢e2T	X Qåº[pPÈÐ¬¦Ú!0\Z¨àiÍÁ·MwµÓ]Oi±àb#yXÆ bRM¤â¿CÄÔ±mF1Ð\\h!Ï:Q´Æ]TCaJÌÚ·,¬A@\rd^÷¥nÂåÖÄ`°¥¤ÒÄZÜ%&ï{R·âÈ!\'ó*T$¦$Vl²¥RhÎôUÅbi%9II¹DañvÎTØ:a)Ò-ã2NMà«39¢ACÈ1RF\ZÅCwZU\nz/d%Å}) cI1 g<1M`91K0É(tpÞb4ÐÐÂ8£Á$\"`YbIBM1\\$H9ÆâáÜpÂ»P;F~úO\Zc(cÎô0`±u¢­r¥q8~ÜÎô×s±Å\r¨*,RÜ¶ËÔ`Ör:4°º¡Ì(Jº2¬Í&îîdÞ)W\\2n(giÈÝZÞURc¶stG>G©ù>ÃúqÙ æl~óêhzaî%}Ý\'È;q¸àÑã`3+/BMmjMM£â)0Á¡A¿9[v!+6þ§Ìí¡üÙ³ð6T;MÇ÷=È×Ð¢C©Î÷Tîª¡æj2Ë-Òp>òáÜo\Z/¸üÊÞ0Ô¹òá@\0à|L\ZFíB¤ë2h;¥{ Úp~`SAÊçq©ÄoÞ@AHeÞeq£Äg@ýyï}ùF]×)IF2,pö¿°Ö\rª&¶³?#>¥v;Ë´ÌüÆ\nI®Ä¥ É)C<âb	2(9ÀeÇãRü¨ô	°ÓÐ2P1 ´¤åp¾7bx	a\"P¸&LMáè0 äøSÁ_âAû¢,DÁBLÆ?#ÏÜXåN¡ÀdÐàs÷y<Êo\nUkSL«iR}ÅUB\r]«Q³qìw³ÛRSË³q=|O3>¬hÎ#`![A-kn,&3É;dô{X9¸B©RIÂîe2s)EÀwÀ\"F@³\\ÆS@6à-ÜC4BeÂÜó;>¥O}ð4h}üc|NÇÐºU6*/ü5èt!M¦ÁÔô\"Z÷ØÓÄÖêì\nEfæIðT9Ðäs8ØdÒY¬)°IØ4®¤\\#®ï>ý=½ÔöCßÅrH¬R	$bH0\nÈ%fBÇC¿S¸ë\"·4©DC¼ÄÝoA`döÊª(P]8Á¸× rà!àë\\©sM5ª¦@Yfg=±SÀ(2Y05 ÎÁX¨g·0þ+öh1Àg¯PËvóÄämãï¨up0ê(èNÏöS¸pQÈMcRºpn50\røÐÝÆ¯áPääì¡AA@d?ñw$S	\rÂ\"°', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'KZqe1662461942', 'Pending', 'mdakbaralibd98@gmail.com', 'Md Akbar Ali', 'Bangladesh', '01941118331', 'palash,Narsingdi', 'dhaka', '1610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 14:59:02', '2022-09-06 14:59:02', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'palash', NULL, 0),
(8, NULL, 'BZh91AY&SYÎ\0åßP\0Xø;ü¿ÿÿú`]÷@°\0\n4Ç4ÄÀ``\0\00J2L \0\0 Í10\0\0\0À\0L$¦eL¤&L\04ÈÁ=@sLL\0&\0&\00\0#&ÔÔzm)¦Ò¦iz¥K1¬ÞAð²õ¦Ãñàk×´h0.2ZùD-ß%©$1GýYµ 5¡aÂ7:9©:-jøâ&iñülÈHwÓÖ¬mÉESË²¡CBÞbBÆäHÍæeþ£ØÔdï÷?áNü¶ûM5YGSª\"Ç´G°I}\ZCà{Íã´6¸ØHy\nóXSï:Ãº¾âôzh°yB[eðÓ\rÔÜs4G î\ZÀ(4HÐw\Z#@i4\rgjöÃ-¨2æðÐÑ2*`f#A£ËJNqÂ©XM´d¤i´ïå\\§±%¢jéØ+BCm¦*÷\ruÊqNâ `£¨ªk2!IÎR£\r&ÐØW	Vóô\"VV  Á±®æ&ù-:#a¡QL¸cU(ÈUSX)crIRÇÊ48ÈÄ¦ÊRD¢*jÅ)\ZoLñz*rÒÓSÃÆc9ué	n: {trk$P¼5Z­\"8F¢a¨°Ô¾á¹ÜEÝ|Ê\"°CPRZªíµ0%QQ$4]-bÅ|°¥!PJ!ÀX0 0H¥h\rFdÛÌÛºPí\"|pü\"ø+Â2¶ ²Ê3iÈ.¦8lÖfõ[îÙ¸âê*\Z¦0RTÞs66ÖF¦k\nQ×icJÌÚß3*ö!KÉ£%y±cg\'{ÅÍ*¥¨sü¤òváê Ú>ªéÈxeæEìNc\"üäÏ9³=ÃÕ\\òä§NålÝ­$­[ãÿ¢UXc(6ÊEn?½%Y·Àýùú¯<27\ZægøÍ8Ê)37ª©Ì=*wÕP¸q4ÛrÜ|Ky°Ño\"ûÏ´Ô±øo Oq\0n.\\ÐØàg¨Tq I²Y\'C`fÈ)sî±ÌÔàFl@ArHf\0jleq£Äg@þy~0úãó±va1RÚæ%ÄäÈ4á\"HÜqÉÄélCö_Qæ24DÌI$É¦Ä¥É)æTË{ÌdÈÐfá\náG¨NÜûî5Äî(¿#±å*$nÌÍáÀÆJH;ÉrÁÏPóPr{¡Õ[ï õ4	®t<ñbcûg´ÀãN¸dÐÜröù\Z<l(ªÖ¦ÖâÒ¤û\nª.SKüá³Oc=w\n\\ó\'ÇÚcÕÄp	òs*ap*Öï\n|2}JoÊuÔ÷(i7U*@I39HÂue2r)Eì\r	\\# Y.CäÐÅdbj2ÈîýÊ³1\ZgâhÐøð®OsèY*Êú?òx£$Úl\"Z÷k­UX\n¤,K¤â¨q\"-¡ÄäeÈ¤$±XS)A#!AØiX;È7¹,GwZvmoïGæbøBJ\Z!%B\0HEa²\nÄ04`t08\Z\ZÏ	¥u2óe°@\"ã\'¾UQBBõ<8É¡¶. rà!âu¶T±{&Ù@Ó )66~³IÌb`Xq\nuD0MÔ<IêÐ_pÏPÇ=NÀtKoº¢E¨¢Èð+Áú©ÐpQÈMRV\"&d\rÇÞC\rÐòb®ÅCÖ H@ÿÅÜN$3¦À¥\0', 'SSLCommerz', 'shipto', 'Azampur', '1', 130, 'SSLCZ_TXN_63172831c1211', NULL, 'NUrF1662462001', 'Pending', 'mdakbaralibd98@gmail.com', 'Md Akbar Ali', 'Bangladesh', '01941118331', 'palash,Narsingdi', 'dhaka', '1610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 15:00:01', '2022-09-06 15:00:01', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'palash', NULL, 0),
(9, NULL, 'BZh91AY&SY¶ÚV\0¨_@\0Pÿø/ïÿ¿ÿÿú`?\0\r(*²\0\0\0\05 ÓA¡§© 4\0@\r&\Z%\0\0\0\0\0\0\0Ì`&F\0F&&	\ZbiÌ`&F\0F&&	\ZbiÌ`&F\0F&&	\Zbi ÄÐIè§<SjyOI§©êzjiå¤	\"HÌñ?3Äæt=#;úî|ÆSäIþ¨³éô\n¾cäAiOÉ£÷Y­ 5¡qÑFVdIzÚ±L4b6R*ÖÓ8ñ%uIÉ²µc¤-f§arvm*WÔaù}\r¦<å	\'´?AÀä ù\'2:øt3<ÇÐ°Ø|O)ô:ùûE¬K­&±ÊÊös¼öÀEÆEÜ`!	,ÆÆcFcBc¦¬Dygt2¦isPQzÒoÅè0Lp\Zm;^q|M° !0aÃ`Òm4Iiµ\"ÖýAA¦Ä\rµ©F^üI(\"B\nLÍoy±ê:7ÀÆÀl$Ì¼K0F¢\"P;Ã¤Ð0P2%~c\\\rÊ f	 ©ÄÉ!*¨*1æ\\<)¸<V\'¸2Ö1&ë^eXXÈdh©¬É\\-\"¦¦©ARÂ¸A¤X¨`.ëBê¡Mâ¾«øD 4&4iý&C!¡µ*\n&2d.¶@vA `Á&&14h\Z)	(\ZÆ7®ãV$²HJ\Z@Èc6í­8=²jáEìâxtlØ4àNYM\Z!¥ÁÊ³KF³­ïÇçê\r\Zð´qQXL&f¤apô\"aS°V0:ç´ÆNømcæIÐ¡Ìõ^£ô=¨ùaù\\¼o;ÈÁÒùàê8B\nSçCôe­$EA²±LhXÀ±N$¨yäøõC$O¸4¶¼B¼Aú²ÿ/Ö&¬È`íse£V±ÞvÏ¨Ñ|ÉÞÙÄxò AÄÐäF\rzE&R6ãS®ª¨Ôeî\Zu¸°y\rEÁ\"÷\rKßu\08°7457j:ÉÚNLÐxFié\0ÆÐØÈ:ÜÀuØâl7mSi!&DËir?ñpÉ	Þ2xõÃìÊ2ãsµ£\'r1xÈïÈ1FCn¢Ë%î_Ø®óbCLÍ	$pe&»IKAR0ð`Þ:Ú2ãéÈ±ª½76óâ~ÿa¯y+Á®]¤lÈÉÛyä=µªRAß¸j32]Ì-¦Õ9ø#»11BÆ>ãÃ¼±ÕNÁF\n¾ÿR2\nUkSL«uÔª¡Mé/±°ä1\\Ì[ÚÏÇ¬h<¼¸îð4èÆâ#Ê*yMJÀÜBáÓ!XfwÉ¸¦´§m´g7U*@I38èÊÂ²2­q+@¸4T*2ÞzDØÚ.®ëÀ´CL¹5frÿ¥Njú\r3CÖ1§³ª6à_C¬p?Ò÷!`cM¦ÇQÃ^s]4ªUa!Åa=å(S¢à;_CºÃ Lô´,VÊ Ï#ùJ¼i`<#¾~Êw6ÎÌq$ô øÐÆýL\r41¡1¡%@Ø6¡Á¤§M3¤ÝiR:ÄÝm Î0hRª\"N¨5\r¸p eeÁ$CÁÛnT¹¦Ú iYÏ(©CpÐÞAä0-o=	~\Z2Þ3×Øë¸îäpÔîóXHÂÀA v\n$æSø°æjD âo5z/xÊm7tI}ÒAááå@Ø6\r/þ.äp¡ ;m´¬', 'SSLCommerz', 'pickup', 'Azampur', '1', 320, 'SSLCZ_TXN_631728864822c', NULL, 'NEN11662462086', 'Pending', 'mdakbaralibd98@gmail.com', 'Md Akbar Ali', 'Bangladesh', '01941118331', 'Palash', 'Palash', '1610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 15:01:26', '2022-09-06 15:01:26', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'palash', NULL, 0),
(10, NULL, 'BZh91AY&SY}½Ê\0åßP\0Xø;ü¿ÿÿú`]÷@6Ða\0\01Í10\0\0\0À\0LL¢\'¨ \0\0\0h\0sLL\0&\0&\00\0I&ÙS\'ê! ÀL@Ó@4zPÇ4ÄÀ``\0\00H2i1Iúm)¦Òf¦êl©aRâ¦AÔk7ÐCô_ªl?¦½xFÆK_!»ô$µ$ä2C(ÿÒK6¤´,8FâçS5\'B¥ M_BdÍ>2°IúsZÕ¹(ªp9{\nXÀÚó7\"Fo3/ôÇÈ?çô~Å9å·#MVFÑÔê±â#Ø$>eï=ÆñZÜAì$<Oq¬)÷I	aÙ_iDzKµ4Ø¼¡-²÷ÉK@EiêIÈì9#ÐwB`\Z$h;\rM 4Æ³5{aÔrxhhPÈÐ`\\a Qå¥\'8ÃLêfVm\'ÔÁ6ñï±Ï\"ÉêaI$QE)$Ln÷\ruÊqNâ `£¨ªk2!IÎR£\r&ÐØW	Vóó\"VV  Á±®æ&ù-:#a¡QL¸cU(ÈUSX)crIRÇÊ48ÈÄ¦ÊRD¢*jÅ)\ZoLñz*rÒÓSÃÆc9ué	n: {trk$P¼5Z­\"8F¢a¨°Ô¾ÓpÃ¥ÜEÞ{RÊ\"°Ct)L-BÕvZH¨¨\r.Â±b>8R¨%	`,A$KR´DHEé¡6ô6à®¤;?¾\nð¢í¨,²Úa&r%Ë©5½Vû¶en8¡ºÊ©7¦ÜÍ¦\rµ¡Ñ©ÚÇ!BuÚXÒ³6¡7ÌÊ£}RòhÉdÞlg¢ÙÉÞñsJ©jÇ?!é<££¸z1>*ùÆx{ÌË;ùFeúÉ¦f-uË<·+fíi$hôßæ%U8Bl¤Xæãï;PU|úvÏÌÍ|IàÙA¼xÐ í3?ØîiÀæQI½TNaéS¶ªÃ ÌÜ3äãàX;M|IÜRÇß¾=¤¸¹sCc¡RõL4É<àÚ0üNAKef§0ÛbC0Sc+ã:ô3Èdóï×Ç³°^×1$$~9èÑÛU9,OÍHÏ©]çaa¶	$Áy4Ø³%<Êby:Ü2ãáRÜ(õ	ÀÛaòýÆ¸âxR©ÞFìÌÞûéD¤À&KzÂÚ-ªßq¨y Hð¹ÐL óÅcð>Ï:áCqËÇÈÐ¡äS`¡EVµ4Æ· ¿ØUT)pú_Ñn9waÄö3×q\0À©åÏ2{üLz±£>B®eL.ZÝÝBÂc/¦O¡MáNº¾å\r&á\n¥H	&g)N¬ RQ®E(±£\0Á+$d%Èaü\ZÃx³â,Ó,MC¦Y¹SÁ[3¦~Úä÷v>©¼¨¿£êBþãÐdM±$K^Ómuª«¡@Ô	t{Õ$E´8°ô#+\ne(2Äd(<´{Äwgöõ§lër?@c¾PÑ	*¤bB+EP6$¡Á¤¡ÀÐîÔæwH°ä(¨y-D=²ª\"©ÝÆM\r±p©¬=²¥Ù4,ÖÊI±³õN`ÃSª$n¡âOVû|:9êxÑ.>mD+QEÜWõS à£þæ¤>¬DLÈ¨ÁâÉ]77¥	@\n)ïrE8P}½Ê', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'Y1BC1665028839', 'Pending', 'erikwinkeell@gmail.com', 'Abu Tayef', 'Bangladesh', '01571021921', 'Basundhara', 'Dhaka', '1400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-10-06 04:00:39', '2022-10-06 04:00:39', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(11, 36, 'BZh91AY&SYÍ\0_@\0Psø/ü$¿ïÿú`÷AU6 \0r55G¨Ädi¦4Ä=#LbdÄÐÄP%MCF\0&0	\0\0\0	\0%(C#@õ\0\r\0hz@s\00\0	\0\0	ÐM0E=¢14Óib*sOã:gi\071îHù[ÑõØ~dP¨Ékõ_¡¦I?QÚIf°ÁÚÅn¾\nhåÉÚ©hó²!6fYXOãÕ&o&êÕµSvÄ²$¹¸ËÐ8|ÉÜg\Z>#±ï;#`gOOPêzÌzê|T#M#àÀgIBVá¬0¹x»Áêv$I)\ZBcG©âP¦¬âÞë­ÌÜâ¨Ò2·°øÕ°:  *(¨ª4÷Võrp!(`Òm4E)KV-}$_Ü¨À`£(«÷-îÄ¬±[1T$jE&i{ÍâÄc`6\r¸¡O¼Ã\nS*\"ñª»Qnî¢o°SF4ps0¦1&8Xã\"JHçN]`+[>e¥Æ&%ÎÒ#¬æV¤&:N¼Ýã¤ÖÁD¡]]Z(È(CX1L5³¤}H:¹à #)¬Às>ZÆ)lÃ$§NhÑÄ#!1-¡8¡!&Ì@ÂP1¤Îñë¼Õ,J/Ìc6Ú´ãLíØÑ,s \n7n«[p÷Ìzªá×OÎpÇ/¥2Øá=9\nÈsi©Þ)Rl³º½Ü\'[»)×S6¨Ùn§zgWY«xª§úOÈ~G¢E=äROq¦7âê 9TX<`¯]aÃ¥Â®÷HW?&_ñùÄÕ;FÙÀ±£(A+&ßÜ~yÿýÁìAÞ<H°Iâh~cÁ\\Ê)?© ûªrª¡x\Z²ÛÞáÌØh·rESBÇøÚ Ø3461 TofcºXO86ÀÞbáÂ§¡±Õj@A$2Àjbçô%t!#<Bów{ÚÛÜ³ªmsÀk\r |<\rcn¢ÏÍ~ÅwË\r´ÌÐI$I®Ä¥ É)C±¼Ê	Fl3!ô©~x	±»#åûBïæBçÔÒ`Ã¾ò>´¢RAÝS&Ç j0 äôã¢¿êÛ\"D ôÉcìy÷,|ç+u\'Ä¹À?a±C2xP¢«[\ZûLín±=æae`®gàrIt[ÆÏÏ±¹±^§»¦¤û=¦<ÅQÄp«¡RÙV·÷¡q1XS$ïÉì÷Ø$În(U ©+ýJRq#	ÕèVFU®eh¸ iX,`Õ{NdÌÞ/kâ-Ó.MC¶_2§±_CLÐþÃj}¾³2\'¿7ÜºU8ú5üHYi´Øêw\"Zøë­R«	%ÔÉ=Õ$E´8üI{BÌe¡L¥ Ò¸s0à´tîoùxöwê8ú>=áÂREzãd!! BPÀ`Ð©c©ÛqÐí\"·$©DCÔÊn!IÉç*¨¡B!tã»\'\n9pIò;CÝfÉ4)[\r2Ë39ç<Ê0°£<ERF¾o÷õi¸óÉ~úW3¢àu+àþìuØrVh&ú±A©ÄÌ¬ª¾£)Çd1Ì¨mÛâBÈ,âîH§\n`¹²`', 'SSLCommerz', 'shipto', 'Azampur', '1', 57.5, 'SSLCZ_TXN_633f27e68d1aa', NULL, 'Pj4B1665083366', 'Pending', 'mmhminhaj532@gmail.com', 'Md Minhazul Haque', 'Bangladesh', '01816985847', 'mohadevpur', 'Rajshahi', '6530', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-10-06 19:09:26', '2022-10-06 19:09:26', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(12, NULL, 'BZh91AY&SYnU8\0âßP\0Xø;ü¿ÿÿú`_{£\0ZaÝÅqØd8¦Ø5=HÔò4õ4hM\0\Zh\0j$JQåP\0\0ê4Í10\0\0\0À\0Lêi¡Fô§¨Þ¡Ò\0ÐhsLL\0&\0&\00\0¤¢iéÓ4ÈmLi ÐI$ïµòw|ËÉñ£óý_/æl2QMvD_E\rE(0z).®âÃ¹?>hÂ\rQÒéämo²e²ªã8ßÏÍ¦AÙTÔu=oKÑg¡Û©¶lxÔäß©\\*Yñíû_&8ðÛØ×iÁºÞg½Hô$>lÞ/ì{ÝRjä§5Ï[&O{kKúS<äGx@h`3E!-uQu¡lÕíUîÓ¸´ïmiR Ä Â¢êsg%Ñ©R*8ÚÍ«î°n¦f­e0pË\Z¨fSz¡hÊ¸k1ËßNhä§d2±4\0	e¼+¾0,D²m²6ÇI&L]Få÷~\'BäL\"À¬ÉVxwg,C$2AWªÜaæ<´ÚqÜ!÷ºßháÛ©hhLÌÜÎ±îÐìÉÝÔÕàv}89FË 4@ìå1MÌËÐgZÓÄñ EÙ¸6ËmªËfr\'1àÕàCKn\Z²+V¸h*ò)á«ÕéÒì 	Ð9»*^Ê\rI¦£é´IÒ~±y!JR¡NÂÒ1{$µºê&6!\Z(^Ê¢1ndHkR,*Q%%)*BH¨½¤TE*Jv9«^mi$Ò~*.X¿Lo¹D³¡q©6l³8©j¬wSÝÃìÎnùåó/ 1«sR9·äÎ*N5¢íÅÆÈ%¢æ¾¥§Ì9ào*Ì§nkcÅçW;ÅI¶Äóí>£æø#ë$³ífã|bQx8\nò¦­>Û\03Q}Bß+]EiÂ{²ì0Ñ6ê¡a£zR³o£ñwßæã?úU8v+~;Ü_íZ5èò±.âì-³Ê|2wå0Ðíj¦éË§Ãîfw¹*3üOsØ±³7ùìÀuúÖÚ4jäèã°¼ýÃ\"	0Ö;%©<q hm(Ø½Æã\Z7LÞVÎnåÉbÍZÎN\Z*<ä{Aþòþ.¼1ó¿FÑvh\rõ³§Ü¦8MCg\rÞÐ#ú+©ì\ZL æàéè!OÀQÆêd)ÐCApº`Ê? ¢¨Q¬JÄB®ÔÕ­níYJôc]g{´fuä{TaW{WgïYýØHñÑàPZÝô¥+Åìõ7;qÔæ¥ðæîõzÚ°õ±ÈÃ*5ß®K4ö2ÐýÝ$ñÖsU;¼7v½þù¬P£Ë¿<}&x!1ýÁCW%°)7o·&B7cD¢z$øv×d#`íEDG!}©S;ÄÞ¬ÊÆé4\"êY8NåF£§bqíNR¯×ödôÌø·ªSîjF¯¿¥¹h¿º³\'c$þÂÓèð|ªUë^§Öå¶ÙL¨u`ÙiÂÖ.¿`ÈÚÌÆ­ ¸D/©(jÀdPæ\ZV\rä;î6ws6Ìôô£¬ÅÕQ¡ÆDÒLhcB ÒlHU$¡EI*VçF¯\rWÓwtÄxt\ZjËh@D%\ZFVúW¢ââEÜqåF³n/ éÂqíÕu6MµA¦@¶àâ;Þp$(ÆÀØtìD`Ü øÛþPÓßÇg¤u·ÓíÉ#9gÌÃâð/â}ÃÌñè*ÿaCalD21 Ö.qX$¿ ççè@Ø6\r8¿âîH§\n\rÊ§\0', 'SSLCommerz', 'shipto', 'Dhaka', '1', 131.41, 'SSLCZ_TXN_6383a31eccc8b', NULL, 'iWqi1669571358', 'Pending', 'abir34t@gmail.com', 'md Abir', 'Bangladesh', '01614690745', 'Surjo Bosh bari, dhiur, arialoy', 'Rangamati', '1587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-11-27 16:49:18', '2022-11-27 16:49:18', NULL, NULL, '৳', 85, 0, 120, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'dhaka', NULL, 0),
(13, NULL, 'BZh91AY&SYS÷­\0ÔßP\0Xø+ö¿ïÿú`hÄ@\0RSÔÒ=MÓÈB\0ÐhÐ\0\r\055PÉ¡ \0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0\02#M0¥=&Ô=&Ù©4D(DBSÍØðI©îïMìõpBµ	~Ã\Zë\'ð}´Å\n¶Za2I¨ÉcI%ÒJg³1$µM0¬PV¾´¢dÍ>2°ÒíÎÊ§1C»±y¸È½øwè[fvÄõ4ªÕò9	,xè$3<}y¼c¡°ÎÓræf5¶Ü«\'Q}2r/ñ²ß41¯	sBÅÌe	wgÆL>9ýÍ©¹zÉahEè4\ZBÀÚ4 ÓHkXW¶íÛ¨3ìIJ¸ffd,SbfC\"^u¤åcS\"«À`H\rd8\ZmbCÊiST1(X`HÊ¦Ø&4ÛM´Òl>ÆÅJ `Ø³ReïThl\"³8^ó&Ä0¨ÊUQ®.&èQÄuDE%ê&¨dEEª©§,cª1ÒëHÂbK(p±ÆN¤H5\0ºv{ÕFÒi.rxÌg5XtyºÓ¤ÖAD¡¬.®­Hd!Â,ÕÔHh-ÖB¢â·¯áÜÐ1¤R Gë0ÚA\r\r©PU1$1v²\0d1! cL`@ÐÆÐÉi(\ZÆ7¦ãF$®^\0ðNNI~hÎk\Z%]ê	4QÆæg\"uPüÜ6ÝVølÊØâíPeBé7M³88¶,V¦¤£/Å«3%Âo3)(ß)¬2Y7:êE­ëôªS¾}¹Náæð\ZMCTèúOS«cå{¡Zdô¥e×mn[Ýr¨Úô¾ÊÚ;ZI!Z ÿl·ÏïV,p6ÊEn<(A*Í¾GqþOØï¯ý5_ð\r¡ç@©úæÇBLÎ\n¤jtþ0:,LC¨Ì+jÒ¸YrW)hIjP§É4X¶Ý*LCJ&F\ZÊ)£\\Ûfêh%\r¼	¡°ò>xMÌÇ0ÝÌr\\Æ&áÈÍçàæ2BFxûÌ½lç³JU6-)«Ñ/ÈTY\rº,\'ÑzÜbpÓi IÉ¦Ä¥É)CÜGA°úT¶ú=p5ãÀúÿñ«R«Å®<ÈÛ0Íá¼s¥¡2\\â\\gÌ5SÔÀt>\"Øê¯ùÁïC`{®tô®LLcéàXãN¡¼47þ~¡Q6\nUkSLkqh_äUT)pìIw­FÎÎEë¼ñg´0*y÷fO_#P4e$ù¹0¸kw}Âb¡¦A¡±ù×Ç6öHÀã»ã£(k\"FÃVq`²X(27à0üíì¶HiÅÂ~vÎ>Æ¾CLù?@Ø}ª6ãéÞúJ¦ò¡÷\ZüWÓi±ÔøI£^ómuª*ÅàPÍfÂ^%hQ*ÚD[C´àv`2ÏBÄeaA-(2ædA*pÒ¸wv¹.GM=:ÓÜÛ:ÞÇö÷10M¡þLÐÐÆ¤Ø l@CI6BÇa×SÒE©DCÔÀ/H[$¸Éã*¨¡B!s]fkw\09pIît®4±{&Éj i,§Tñ<J*\"ÔgX e´aðGÕ¥}ã?Ç@Ç=ÃÇÖ¢ £N÷ì>xàg10f@ß&Ì\ZÄÄÇñãTÝ$^^hÁ°!ý¹\"(H)ûÖ', 'SSLCommerz', 'pickup', 'Azampur', '1', 110, 'SSLCZ_TXN_642c0e1d4c02c', NULL, 'XAwV1680608797', 'Pending', 'csa', 'sds', 'Afghanistan', 'sda', 'ds', 'a', '2333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-04-04 15:46:37', '2023-04-04 15:46:37', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'd', NULL, 0),
(14, 41, 'BZh91AY&SY©ð7\0ðßP\0Xø/Oý¿ïÿú`}ñ@ FÔ	`\00\0L`À@&ESL\0\0\0\0\0\0\0&L\0&Â0\0$&zQ@ \r\09dÀa0L!#\0	&L4Í(ýFICM4ÞoQ$$ÄP¶ä=Ã±-û\'ø==(/¿!·âIzI\'ä2C8üäzÒZ\\¢z~È·±­íUiã(²­m9C}3®©3y5­XÛ§3³êT(Z§-Æd5\ntÓ0È<5õbk«·x¿¨«-³\Z\"ñFA$Aê\\Ðõ>GØn1Ccbx û0§y!,-_B\\±]@aÉ%¥~R|å¯HngCPí5GÄy Fã¤i,°Ñ#AÐØÜÓ@ÖÑ=íôVg]3CDÊd¨\0¸3! QçÂÂ-PÈÐm¢ªNñreýÊM1Md	¶	!¶ÓE©8¤c/Ìò5,[Q Ìd´\Zf3Îe­J7ÐeÕI´6´Í«yÀÂÊÄD\0Ø6EïzVì.]nI&\nZI½)|E­ÌRiÞ÷µ+~@Ì6$$û f	 ©ÄÉ!AU,©T3½Ub ñXV\0b J)+=Aj¤Q1@)1JÒ½¬EmF2/kÚé¥ÂX­\"ÅCwZU\nz/T%É}) cI1 g\")0\n#ýL&6CCbM$65Q)\rC4Á&\Z\Z@Á1\r\rcIMÂ\0GhÐqãIåLrsE&/CgZ*×&y\\»¤ÄF.Q ÀÁd-(sÀ«»ÚÁI!ÞB0 Énê,hf,UT@ÅÃxèXy§¢êGV3)@P{dsA1ë&xgjA°kÒÎ_8ivZK¯¼·Ü>ëÓï:¯~6WÑÞòI\nñøIçíªÂª!AmrV8Â¨mþeÒÒV´Ölì7T;Nàz¯3©E&%R8Cí©ÝUCÐÔeÜøHv±ó.Ç¢üÄ ¾\rK~Ô\0ëñ \rScÃP©ö¡L4ÒÍ>m\rÀ?©ØÁs¹Üjr\"Üx``8\\hòÔ?ac\'»ÆQuÌ2ÖÉA!pÅðdH|ÊçÀ3£G¶ª,ø,Ïð¤g±]ÎÃ2ãm3?1BRk¹)h2JPÏ\0ùLFl2ãò©~tz¨-Ú¸õú\ZÀa&\\¦SvJmÂ5l,t` f2O:R ÷ÉëÄ=Xµ<Uþ$¸z H÷`ï=2bcýÇ¼±Îá°É¡±ÓßæhPó)Ä(QU­M2®¥H1öU\n`7Iv­FÎ]Æ+¹àÏ]HOwg{ü3>ö4g¸O¸VÐeKdZß­	Å2Ná=^ö$ÎnªTfp¤a<@¤£]\nQl;EÉ`# Y®c@7Ø\\9hË,¹æv{<Uô2\ZgÖhÐùò0`}{RéTÜ¨¿Q¯C©ÆÓ`êz-|\rliäkuvª³s$øªÈhs:¬2ÏFÊÂKÀÈP}CJáÚAÉÉr1Y»l³<î1qBJ\ZÜ20\ZhcBcC\ZH¤Ø6$¡Á¤©c¡á©ÜwÈ­Ñ*Q\'Pð17\\BD=²ª\"^Pp5ÃEH¸$x;áë.bé¡fµP4È,Ìç¶*xr¥PSHÕñEA8WX¬aÀ¬\nuFgÄpâyÜü¾.®fâ¤îÿa÷Ã;Ç!5fC}ÌD5z/Üe8Þ	/¢H2åÌ°l8_âîH§\n>ð ', 'Cash On Delivery', 'shipto', 'Azampur', '3', 260, NULL, NULL, 'y4mG1680983413', 'Pending', 'sascorporationltd@gmail.com', 'rajan', 'Bangladesh', '01911812221', 'Dhaka', 'Dhaka', '1200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-04-08 23:50:13', '2023-04-08 23:50:13', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(15, NULL, 'BZh91AY&SY=Ëùü\0êßPXø//ü¿ïÿú`}4 Ác\rm@PB`Ld0\0À\0\0J\0©ê\0\0\0\0444\0æ4À&C\00L\0\0¢RTü£Õ?M¥OQ´ÄÔhh\'¤\0æ4À&C\00L\0\0È@Õ6	ÚM4dÈ\Z?E6$©#y¬s=n§D!ü©?hþÞïwvÖâ	uM\n ÉÃráÇ>\ZnWOÄ0qAbÂ7;î¦G.N*/q	|²°ÚdKJLå&êÕ¹*u6ø+-\n¦û®#05#8ÿcÞ} þÜò?RÓºLôW5yÞÈøØ1àÜàð}Î×TàâªÇSCÒÐúOt)_ ¼Ju¯©EÄº¦%v/(Ku~rSHÈyL7¤ÎÆä|ì`@²I±c3W&æ,«,,×1­ånheÊ\Z\Z&P0?Ð²Xh!xÒ[J)	¶¨Ãpä¬8\Zm;âs®slý½jzFI¶	!¶ÓFS8¤c?A¨8+¼aQQB02­lbe­Ô¡°Ê&ÐØR³6½ç1FX£]ÜM¨YÒbÉÕºÆ\Z«Ö@ä\"*-ÝÜMlS#ÁÍHÂbL8Xã#R%IMZRQ§gX)TaÌ&ç4ÃÆrÎb²t¼ÝáÐÌJÉuuh¢C ¡`Æ(j$0ëC%P§û¡.+âi&4âM0úd«EÌeSIUi£F-Xç¬YQ°«)%¬Y\nJ\Zd\"¬ÉªðÕÂ¤(Þ(|pü#áEÕÁÔÂLæ\'ÃM;ªÒoo­](mDPºc\"¦é¶gS®ÇF¦X\nQ×RÅ«3\\&óÕÑ\nc3FescNNñÍª¦îÜóÚzCö|Oaú$Wø	\\té¿CÒ?U;¸âKÚÝ¸ã%·ÉË÷ùÒT3J2qéÎ×9â6Û×{Oå¾{Zrµúä¾=<ûÍyRhqU#q°|ªwUP¸s5e¿¯Ñ¸ò8¬nö´O­N\r¯Ã]Ñè`âìP¹©¼äi¸*@½ æ@$³OH6ÀÐ?¡Ð)s×#cqÈoÞ@ArHeÞc!£Àg¸?1c\'o}±Û\"ìµ° È/Ì?,ÃhÌmª¬¢ÅxÌÚfh$Gä×y)h2JPÅÁð/&	oûTË¡67wt?×ý\Zät(¿ï<¥S±44vä@ÇÚJH=á2\\Ô¸mðPz>¤àê½v?ã¶;<n¥núcéæXéNðâ2hq:ùú\Z=\no\nUkq®+qkRúU\n\\48¤¶P6r÷¯Á]Ä§]	íâcÜÆDp	òt*ZàU®PÈLeì)xdìøX9È!T©$ÌÞF£(ö$­t+EÀwa%D|MWQÐÞ>B× ´C°È2)eÛLÎï¡SÞ¯©¦PF§ßÎ7ÿ<6~Ò©È¨½¾btÚlO¸kí7ë­+0=\n½fÂ$C¡§C©ÊÃ _t$°2°¦R<ÒÈ6 æäÈÚ}óm¯ù¨ü=8L±VådQe±*²F,¤-I2Y%£­¹Îæy¸½Çiº¥J$ê¥ç%À Iq´ª¢ßÎ\r\r×p©çh{±Läkr¦@Yfg;EO TÂÀ\\ ÍFw\nÅC<WÕ ¿`ÆÏ6G?¶¢FK#ÎÏ+NWç^Bàé]\r;q½o£Ø³Å²JÙ©Ë¡×$ë|$ÏôBÒÒÑ¹?ñw$S	Ü¿À', 'SSLCommerz', 'shipto', 'Azampur', '1', 130, 'SSLCZ_TXN_6442443b4bb1d', NULL, 'grmF1682064443', 'Pending', 'bnvbn', 'b vnvbn', 'Vanuatu', 'bnvbn', 'vbn', 'vbnvbn', 'vnvbn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-04-21 12:07:23', '2023-04-21 12:07:23', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'bnvbnvb', NULL, 0),
(16, NULL, 'BZh91AY&SYDÚ\0îßP\0Xø+Ûü$¿ïÿú`}÷M¨#aµ\0\0	9M0	À\0L\0\0(Ê*m&h\0\0\0 Ó\0\0Á0\0\0jD&¦M©´46¡¦6 i£¦Ó\0\0Á0\0\0\"&	¡ 5M<S&i4Ú	µ=KC3H!ò9Î:lXv³§§\"åFK_ÄBßùZI É£ôYûRZ¹ßu0sRqT´	«á3O¬\'ãfDÒC½¤ÖµcnJ*Nÿb¡C¡o.B¾$HÌHô= ùo±ó)ßÞ´<&qÔèòÄð$\'ºu	ÌrÂ$Ý7ã(ñÓz#hSö\nX·­êTKhXÆPüýòSß¦ÖNF§CUd ÐLJF\ZF-\rJÈ\ZcMZD\Z=pËZø43L dJÌ`Xq UåZNQt.Rm\Z\'Q©ä\r67Vóa`Æ(KEB# «c®\Zó°nI;\n¢©¬È\'ã4T`Ü pµ±Ã+h,QÈ&PÈ¡@PTkºµD¤³å#*\")zÕµW)ÀñJ\"¢æeÄç!ÒâÜpr	$aKbK(pÐã$(Ð\nC\"¡¶¨Räí+@¥QnZZjrxÌg.°!-ÒqçTnRäJ«U¤Q!PÐ1tL5ÉÂæS\0¿¦uÂN	ÙI\"0*Bö ]¨Áª)Ò\"%¬X¡\'\nTRB!di1\r	(\ZÆ7MÅ\0!ò~H¾ExFQvÔYFm09uÉ³Yìk[îÛm­(n 2¡ªc	czmÌÚ`ÛZ\Z]¬r)G]¥+3&¡7ÌÊ£}RòhÉdÞlg¢ÙÉÞñsJ©jvNn3ÎrÅGÄú\r²ù÷Ø:Í%ç3¸¿8êÔ÷jïØÿ£kÓ´v´B´~[üýÑ*¬/(7e$ÏKZá¦*÷»öimõ>Føî\\?$ÍOÄw7q:RhoU#qÐ?µNuT1ãA-Üsïcï,ÍÃE¿\"Eð?RRÇß¾~±í1568î\n/¤Ä	0ÐvK$óchm/ôÄä¹s±ÔÜq#\r¶  Ä8X\ræXC;ôî=<¡øÞ/ÖÆ,Ã]HXÐeñ¹!#öæ£FcmTY~Æ#² ÏäÃqÈÌ°ÛLÍHàÆMv%,ÆIJÄó.Hè3aKp£Ð\'^ð5Üqn*¾$`Æv¢7è\Z<81øRIèIæ¡sé°z(9>Áx­ï úª<NÂ`À!­ØÆ?aéè`q§PØdÐØîôò4 ¡èFà¡EVµ4½q ÇâUT)oIrZ9×yÙ]HO>üÉëâ_£\Z/°O«S@«[s¡a1à)væöÀ)°B©R3ä^\nhÊ e\ZgqJ#aâ\r¸\"F@³]Ã¡¨7>\"ÉFAbYdwý\n\nÙ\ZgÚhÐþü#v$õï}K%Syc#_C¡ºm6ÀkÐ×]jªÀæ®ÂÉ=F\'@½a%q2\\d(<F¸{Åx´òq_È©Å£Ñ\"NZSZJA#a\n (H4`t08\Zu9dXw%J$êÓ²Ü$ÄdòTP¡ºp3\\\\*@åÁ$CÄë[ÒÆ6M%ª¦@`²2QSÀ(.®;ÅR{6åÿvñýNÁ :#»ËÝQ\"ÊÁaØQÔä>ÇAÀ!?32êÄAâp3$jõ_QÞcÉ)üÍx\n\n\n Ôÿ¹\"(H\0¢Dí\0', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'hM981683088070', 'Pending', 'thenmcltd1@gmail.com', 'V', 'Anguilla', '01', 'F', 'R', '8140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-05-03 08:27:50', '2023-05-03 08:27:50', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'F', NULL, 0),
(17, 43, 'BZh91AY&SY*ËN«\0©@\0\0Pø/ßõ¿ïÿú`=÷@ÛAe hÑ d*9¦&\0\0\0\0\0	P	RdÐ\0\0\0jb`00\0	\0$ÔTmTôj ÏQP\0M=A iÀÀ\0&\0`	 L#%&ýD4ÂzÄÒÉ! Ù¸á<@>äýÑ:úÙø7nå\n¿qúZd÷!{¤iHH4,#q÷S5\'%K@¾BdÍ>2°²&\n8I²µc¤\ZMN\'\"å,\Zí!`;bHÉ;S?QïÿÆQÜö7ÎÌèè$J.n3$äq5<và ð%¼M\"¬VP¾ÚÖFàÐÈ=RA)\ZÑA0±1ygt2\0©PiB,ë&Ñl(¶@À\ZÅ¯bòÆ¢æÀÃIÒFAV*Ú¬ÁNAJÁFQTÖdB1@ÈM\rLÍ-iEch¨`ªMUDÔ\ZM¸ÈhTt¡\nTJª¶ªíB\"¢Þf5ËV71Ààç0¥1%8hqbMHºH7rE´³Ýèª-ËKMNR#åÖé	n: {tÈ(/\rV«H¢C ¡ bèj*h`ªî-¨KÜ¿J\0cBc@ã!uA*¾wQª)Ëhe#Ø)!RD$B2\Zh\Z&wH i3q´zm4bKPO¢¼±ñ|ú\Z%Ü\"©7¹¬Ô??>÷³Zc{Ùnk@eôÆÉáÍ*fáÈ0V¦6(æåôÆ©8Ìº¡NcæKq63Ô;b¸¼]ZªmOäòmÇÌzJ;©î032>ääþsÙGùõ~÷ù³xÛ^ÇH³Í¬Ôã[YeLU_Â¯Jj´-rcÐí¿õÎãbüIÞØÍÃÆBäÏ¼w+©Ì¢ÞpU#aÐ>ÊUT.\rYk¿? 6FÈÔh·àH³*}ÚàT©C3S¤ßópH3ÑyÀ1´6à\rõ8\ZH¶Í$r\\a^ÆÃû%t!#=Opùq|°.Ë<nIuKR5fAööUI6ÐO1Õ2,6Ó1A$81MIHÌd¡ÁØÚ^$£5qô©ê<BllåÄý¢£^]ÒåÝµ c])D¤Ì&KF>aØaA³i5Ìl@	!Pý	<º\"1úû)Ð6\Z{w4(w\nj(ªÖÃOÊØb±>\nª18$¹­FÎN¦6àz|µ$`Tõç¡=»ùQ¸QW2¥®\"­nëC1Bs8l~Êów\rq1#@äDnF\njÊ`eZæRxÕÁ¢Ád2ÌÕÆh¼¸NBÍ\r3js±ÓâXõWÌÈi>>`øF¬¹=¹>Æ	TÜT=ã_©\nã\Zm6:\Zõ3Ï:¢¬\\\nÍdÂZ¬¨¨o\"0ÌÞp7Xd	[BÄeaL¢±\nÃK\0ò ÞäÀ¹úô§£lé \"DÁÚ0FHÈ )\0XH0fGxÐë°æu[E(¨|åÒ\0ø ÛCÎUQBBëÂ\r[¸2²à!Üó®4À¾	¡dµP4È,§TðP©¸h3¬P1ÄY°ö£ûi_hÏ³Ì1ÏS¸º#b`(Þ2Veì£Äp6=Æ(ê4~lP1\r\ZÌÎ«ä2¼;$¿ÙñIÄ\n\n\n Ôÿ¹\"(He§U', 'SSLCommerz', 'shipto', 'Azampur', '1', 89, 'SSLCZ_TXN_646673026b5d0', NULL, 'VxYM1684435714', 'Pending', 'Rayidfashion@gmail.com', 'Jubair Bin Hossain', 'Bangladesh', '01771487674', 'Mirpur-1,Dhaka-1216', 'Dhaka, Bangladesh', '1216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2023-05-18 22:48:34', '2023-05-18 22:48:34', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(18, 34, 'BZh91AY&SY¸]«`\0¨_@\0Pÿø/ïÿ¿ÿÿú`?\0\r(*²\0\0\0\05 ÓA¡§© 4\0@\r&%\0\0\0\0\0\0\0Ì`&F\0F&&	\ZbiÌ`&F\0F&&	\ZbiÌ`&F\0F&&	\Zbi ÄÐI¦É<jzLz§¦¦Qê@($ÏAø¡ÔõíBæ/©ù¡>gÀýPÿgËå&\n-|F\"ÀÓ$Gï$³Z@kBã¢>lÈõ5µbhÄl¥U­§(p/ã8Jê7ejÇHZÍNÒäìÚT®1¨Ã3îùLyÌx~$]ú³Z¿9Ð@#ÐzOH2;øwGÈ©°ý¸ÏOÄP{¸¤Ò5`2²½¼ï%¸È»!%ÐÒLhï\Z¬\r4\rb ÃË<³ Y\r4ÛHú\"ÊP;Öx¶(gDÁ¤1\Zm;^q|M° !0aÃ`Òm4Iiµ\"ÖýAA¦Ä\rµ©F^ü(\"B\nLÍoy±ë8nØ6dõJÔÄE`ªÊî|ÑEb´D2´`f6o*T$¦$ª ¨Çrð¦àñX^àËXÄXW®VJ	Z£A/@!)JR48	(Lô¡ÃððV!)!K±ZEî´.ªÑ.HKæ¿J\0cBc@Æ0@(Êa1´8\ZR ¢c&I bìd\0Ègh4	ÆbcH&¢¡i3y¸zî5bK$¡¤	|3nÚÓÎLV1yPÂC»)3R´º¦Mä%`ïÎªäÓFibðf2¬ÒÑ,ëC;ÁqÅ yÀ`)°»H,\"ªap¶LâËhì:ç´ÆNømcâIÔ¡Ðö>\'ä{OYð=FÃð ¹xÞw#	¤%óÁÔp§ÎèË 9ZHebÐ±bIPóÉñê& I\"pim/y$xõeþ¬MYÁÚ6çËG:¡¬6ÿcÀîY¢ø½³ñå@¡\'À\Zñ9DHØsÒ§eUQ[¸iØâÁæ6\rÿÜ~d\Z?¾ê\0r`n,hjn2Ô*v/¤ ðÓÒ¡°:qsÙc°ÞE¶|Í¤C.-¦xÌÿÄ-Ã$$gÉåÙ·(ËÌ2ÖÊÅýã#Ã Å\ZY\rº,g¹b»ÎFe\r34$Áí%-IJÀ;Áxè3hË¯2Æ8Õì	¹·§#÷ú\r{É^-sî#fFNÛÏ0Éî­R\rÃT¡sí9Tm6«ù`ô\0Øø:	z2bcûÏÇ\Zv0PØvxx:¸P¢«Ze\\²¤ûÊª7¤¾ÃÆqèbÜæ}½@±ççÈÔ§§V4gqSÎjT¶\0¶â¹\nÃ3¸¦MÅ0Å;¬E 9¸B©RIÄ\'FP6kZÁ¢¡T°,ÖóÖs$>Ñqà.ÌD4ËPë¦g?úTè¯¡Ó4=j{xÆÜ×ês0Øº^âÄ,i´Øê8kÈ×M*XHrXayJê¸×Ðàdn°È=M!23ÈþD¤ð\ZX1&é¯m;Ûgn9}è?@cÚß­¦4&41¤ hÐ04`P¡ÀÔë°èu[±*Q\'Pò17[H\0òI4O9UE\n¯5\r¸p eeÁ$CÁÝnT¹¦Ú iYÏ8©CpÐÞAæ0-o>ô¾ÍoìíõÜwr8jwúl$a` Ð;Et)Áþcí:\Z($\"Å ¸æÅâ¤\r^Þ2MÝR_TxøùÐ6\r`Cÿ¹\"(H\\.Õ°\0', 'SSLCommerz', 'shipto', 'Azampur', '1', 321.41, 'SSLCZ_TXN_646a4afa08101', NULL, 't77u1684687610', 'Pending', 'support@itnayeem.com.bd', 'Suyel Haque', 'Bangladesh', '+8801722597565', 'support@itnayeem.com.bd', 'Dhaka', '4578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-05-21 20:46:50', '2023-05-21 20:46:50', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Dhaka', NULL, 0),
(19, 44, 'BZh91AY&SYá¦R\0_@\0Psø/ô¿ïÿú`ð .\0$je&ª1hi£Fi \0d\Z©Òz)£@\r\Z\ri¦i \0æ\0\0\0\0\0\0\0\0*%\0õ\Zhm5\0Ð\r@\0\0\0\0\0\0\0\" !	©á4!ª~©´4Ñ§éOSbLI	#àæmèOÛÛÎÅèV¦¯»ë¤(TdµûD-H-2IûÌzÉ,ÚP¸è£_£2IzZ±A_©EÖÓp/®Õ&o&êÕ¶q.Svò¥lIµÍMyG\råäÉæi\Z¾g1 GSÌïFK2Ã¶ÆÖMïfý¢:òX´W{H~dàÂåâîæO2w$!dæAÐ@i j±¯m6Úf`É\ZP:Þhµþ¥J$0\ZcM§kÎ/¶*JØÂSl\ZCm¦­\"¶ÜkJ``d1~ùÍ*ë³I(  (2¤Á#PÂ)3KÞvp\Z¸Á°èñ\\bÅÎ$0XVhLÅiLæ-fBM;ZÕ¥m ÜHIüÊ f	 ©ÄÉ!*ªh5¥î\\ÃÆ.³,b,+×6J	¦sbÙ	TX\\Ío`J­³BÅQµítÅHC\nHRá,Vb¡»­ª<ÒÿKÕ}E)XaVFÌøé­ËÍ&5ZhÑUw+!YQ¤¤Uä,É\nK\Zä²d®ÓöàlÄA%³%þFß4§\ZcÈ¥`Ó	\nÅ$\\\"bÖ-HÇLÌ-­p\0ëÁ¡]d£YÒfÐdqht$e ³$ÍbeÍïE®sXfºf3k¬k\\6¨ë¤×wÃjYâzð>\'¸©ù;,|ðþÐô«Á¡Ò,<	/·2Òl*6d$F@Ôb	»ñÍY´oÒ\\sBWmýÏÔç?CEúÜ÷@¸2(9àx6ÉÐ¢ìw*¸êÒ§Jªa°Ë-üuäûñ¢ß©\"©©cå¾ Ë\Z\ZÌê _h8	3Aü%¢zÀÚ¸\"æNFÇ-¹n  Á$2Àn3sø%v!#<O>ø}ùô¹ZÑ0N/CJ\"¤yj\ZQ¥¨Û¨µÑh~Ü¯q3BÃm3DI#2mÀµ%.TÒ÷$7¸ûT¿\Z=loëÌõýÆ¡{ZçØ°aÛyjQ) ñ`ÔÁ&.¡î)ªèåN³lÿ­8ö6¤d7pÔª£ð<¼Køñ>\'KøÐÁÄo¸àPÔ¢î\nUk·¥²-Ö ÏÀÐ,¬Ðäï[ÆÎ}Wx³×yÀ©ïé©>^ã>\"Ì(àO¼UÔ©lV¸v¡úÍÅ2OpjOgÝ`Y¸¡T©ý)9îeùk¡Z.#À4¬K@Dlº>æð9{¯1hrjúhuû<Uõ24ÍOÄ>1½3%<º?	TâT?è×ØìBÀÆM§×änÛó7Y+0 vF!Ìä¨r\"-±Èæq°È94,¬) ÒH%Aí\ZW\\#¶¾ö¶Î>L9Ê©IlU¼Õ¥X«¬UC-!le±-KM\rÇS´Ü¥|¡a0C8IÒUQBBëì`ß\n9pIðv¿4Ð0g	¡JÜ iZ\ZOH©äP©Àl3 ªP3jÃàá£|øÃM·@uG//JW5ÂIîö:\0ì9	«2&ú±A¡ÀÐ¬U)ÃÁ%ùd{ýþhKFRäÿ¹\"(HCpÓ)\0', 'SSLCommerz', 'shipto', 'Azampur', '1', 57.5, 'SSLCZ_TXN_646e1ad54793f', NULL, 'e4l11684937429', 'Pending', 'sawonbhi754@gmail.com', 'Sawonbhi', 'Bangladesh', '01799234635', 'Ghhv', 'Chandpur', '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2023-05-24 18:10:29', '2023-05-24 18:10:29', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Chandpur', NULL, 0),
(20, 44, 'BZh91AY&SY½Î\0ðßP\0Xø/Oý¿ïÿú`\0L]M\0\r5=#CM=@\0\0\0\04Èª& ÈÁ\0Ì\0&\0	a\0I©*z¨\0\0\0\0\0\0\0À2`0&À !iGé6¤dzÊz&ò£b$#!s>gZ¸|Rù#ø+è~¿­*2ZúD-ß2KÒI>$3ÚIg¥ 5¡qÑF»2$½MmX ¯´¢Êµ´åë%uIÉ­jÆÜU8MI%dÖëpÌ\rcHÍÆf=G©íéÃSþêÏo¦«3lv!<w\"Bæ¡æ~ñZÄî 7x~Û\npt$%«äQ+ Kh02´¯óó\rÁÄäjf¨ø#$Þ0JFÉ1+\r4ÆòD`\ZcM[¢\rÏ}³ß@³6ä0ÐÑ2*¬ÀÐB(òÙIÎ-²Fe6Ñ	\0ÕGMÇ¯ºûaßt¼í.º2øªhµ\'eûæ¥j4ãAÆyÒµ¤ä2ê¤$Ú\nVfÕ¼àaeb\"\0l\"÷½+v.·IÂf/J_kq w½íJß3\"\rÄÔ©R`\n,H\\Y²ÊI£;ÐeV*¦.\nDä¤¦/PÃÚ© t²K¥éïBñV ºF#Q,È(YÂØ&Ù ¨`.ëBê¡O%è¸/TJHÒLhÀ*C\nÔ«ÆÕ`ÕÁIiEÑÖ,P£ä©¤`#1Ä4L$ hC\ZLÞnÂ\0GXÐmÛIáLpsEyÞ2Î´U®T®-GÙËIZÖZª48¡¥eCÅ\n]MCh¬ÞÆqÑ¡ÌYBuÍØÂ³6,ª¨Y,¤Õà«²jò3Áf2åõ4µTß>þÏyæ|Ãûqá äo>óæhyaì%zzÈ¶PnqûtÑm62øI²Í­P¡	©±Ct|E&m\n\r¹È²Øã©!Y·õ>\\ú¯;Û>!ñå@¬ØÐxÊ)48*´æNÊªF£,·qÙ!Ôãó.Ñ¢ûA{\Z?-Ô\0çð \rÇÀÁ©¸âlÔ*@¾°r IºY§²¡°6Äê\n`È8Üì58m»H0I°L®4wæa#\'³ºnQeÌ)HÃq%Åóè3eCBª¥ÄÎ\'è¤gÔ®ó¨Ì¸ÛLÏÄ`P¡AÁï%-IJàIAÈÍÃ.>úãG M´èBx±\"ÒÕÂC\0äDðÃD¡a2d`9í!\'¼ZÊÿ¸y HðÁÐL òÉcð<}¥4èM\rÇ/o¡CÄ¦Ð¡EVµ4Ê¸ ÇâUT)ÞëZ;WyÚÏMHO­ôï<Lú1£8á>¶*[ *Öþt,&3É;Ã2y½ö$ÎnªTfp¤a;@¤£\\QnÁ¢Ád°,×!ÔÐ\rû³¨fL¸RÁ×gWÔ©Ü¯¡Ó=æÏmçÔùJ¦ò¢þ¼d#	´Ø:DK^ã[\ZwÝ]@æ¬ÂÉ=Ê\"ÚNGyBK!2	3 ö\r+Y%Èé³Ç¶ÅML°ìI¿RJ`IR 10Á!C\"J@A(Ë\rÝNÃ¤Ü¥uÓu´ I×*¨¡B!sáÃ\\8TËH¤=r¥Ì]4,ÖªeõÅNà TÉdÀÖ:b¡bØÃù¯³AÃ<ú[6àv#º¢EÕÂÃ £;ßØ}ÁÀ!5fC}D\Z½Üe6îÔªH<<=¨j¹\"(HLÞç@', 'Nogod', 'shipto', 'Azampur', '1', 131.41, 'Ghhvccxh', NULL, 'uidO1684937525', 'Pending', 'sawonbhi754@gmail.com', 'Sawonbhi', 'Bangladesh', '01799234635', 'Ghhv', 'Fgg', '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-05-24 18:12:05', '2023-05-24 18:12:05', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Gv', NULL, 0),
(21, NULL, 'BZh91AY&SYp°Æ´\0Ãß@\0Q{ø;oü¤¿ïÿú`_2@¼aX\0i G0À	Âi\0É¦¦G¨\0\r\0\0\0\0\0s	L\0L&\0\0LhB)å=M<¦Ñ \0\0z\0hÂ`\0&	¦\0\0&\"&A4LLLM© \03LMCÔÚ$GØÞ\\þ¦gÍ\0QXªÃô?\"O©óùÉrFK_!ñ Âdä2Cý`vÒ`¥¯Ù Ê;]<ï2Ûª¸Û§øã³cLFAÞ«N=;v=DWz<Ñô6¡CR»u#ÑÜÊë7Ðâ$êlEÏqð(\ZäØ^\'àH{Îàb[Ri/(JÚúzÐÚÂåâïA¤Ä(h@Æ½Ð¨Ì\ní4Þ%\0Ñ$ ÇsuÍÈZìÂc¸aHXã;\ZS¹=ï±e±C)Þó!2L§Q»Ü^ãT4`Òm4N#\\5(kB!*1e-jQÂá@(1°ÂÌHÂH\"ó2k$Ü³Q`Ö/s«E®;D	2ÌËÎ89(¡ÄhÊ4YÍLm ±îDeËx®`\"ìÔ\Zm6A[¶g&··/a\r-¨jÜVXF¡ª÷%Æ¶eåã!¥ØA0æ¬©{(4ªLj\n{Rù¡/¢ÕÐÐ3°BE&Ffë¤³$¤Ðá¥Ñ Ða`ÆBb0,Ä!&W	ey¾[7Í®µqððñxàóNsRQ¢Íò¤z­Ôêæ<y¢7¾³:éùÎ¤ÎXç\ns¡hß&N[ÛrÑêÏVêMïvÝ§Ë;pkuféÛµhxºqËë[Y¤>ÏÌùO`ý<Óã<CÚ=Ãxú\ZqÈoÀ_õé5=6Ó`n9¦#ë.ið?Ð¨I½ÿk;¬È vÇsëFz?ëÅ#boáÈ9¸â¬ÛýOÊ~Ký¹³ìA¸xÐ7æñ\'ý9xUI°ÞªFÓ:ÕP¹°gQ[w­8Ýñ,£Fä©@30?¶Ú\0r`j`dfjcT} Ú$ÌdbPm\r´#Áº§3R0ÓBEm6TgÞBâ2BFv6å1fûXHdO©ÀÜ¦n	*Ýãet8\r´ÌI$dÓRRÌd¡ÁÚGA°ùÔ¶ê=üdA[òâ}>ÃP»5ßÐ|LL]»ü)D¤°L\rÝÆ*O!u;1pö¤HAãq1Bn,Lcåì07æW ¦>FeaMB­hgn.5 ¿¼ª¨SrKC\ZîæZ»}à@*xñÈÅù±£ñ2(VÀU­{ì*¾\'PäO\'·L¦ÀB©RI¼6Ñ\nÀÊ´ÃyJ,`h¨`Á2È7¤êl;·fñh È1)PïÓCêTê­Ó3=F Ðü8F·\'§\'Ð²U7ø1óF<Â&-EÛ6ìÙ¥tÁ :n¸!÷Ô«Ëí}~=I1Bä¢$Ó1 ò\ZWprXºyö§lía)\"¼A2D,I¸C@%\"ä´¨è\Z¶ÏÈëA[U¢O\0÷TºÜ@\"ÎUQBBðá¶î0£C¡Ö¸ÒÅìKULÃæIfué(b±9\n¥Öl=Rû´_hÏßS¨cÃØ.Ýìõ¨e`0ðs\'G÷CúBjÍ¦BÉ	75z¯ð2MÞTüI¹aA@d?ñw$S	k@', 'Cash On Delivery', 'shipto', 'Azampur', '1', 14.09, NULL, NULL, 'WjEK1708448073', 'Pending', 'arifulislamvps@gmail.com', 'আরিফুল ইসলাম', 'Bangladesh', '01700993800', 'আগানগর ইস্পাহানী কেরানীগঞ্জ ঢাকা', 'Dhaka', '1310', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2024-02-20 16:54:33', '2024-02-20 16:54:33', NULL, NULL, '৳', 85, 60, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Dhaka', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pending', 'You have successfully placed your order.', '2022-04-26 16:17:27', '2022-04-26 16:17:27'),
(2, 2, 'Pending', 'You have successfully placed your order.', '2022-04-27 03:23:52', '2022-04-27 03:23:52'),
(3, 3, 'Pending', 'You have successfully placed your order.', '2022-08-01 21:22:28', '2022-08-01 21:22:28'),
(4, 5, 'Pending', 'You have successfully placed your order.', '2022-09-04 17:56:34', '2022-09-04 17:56:34'),
(5, 6, 'Pending', 'You have successfully placed your order.', '2022-09-06 08:00:24', '2022-09-06 08:00:24'),
(6, 7, 'Pending', 'You have successfully placed your order.', '2022-09-06 14:59:02', '2022-09-06 14:59:02'),
(7, 10, 'Pending', 'You have successfully placed your order.', '2022-10-06 04:00:39', '2022-10-06 04:00:39'),
(8, 14, 'Pending', 'You have successfully placed your order.', '2023-04-08 23:50:13', '2023-04-08 23:50:13'),
(9, 16, 'Pending', 'You have successfully placed your order.', '2023-05-03 08:27:50', '2023-05-03 08:27:50'),
(10, 20, 'Pending', 'You have successfully placed your order.', '2023-05-24 18:12:05', '2023-05-24 18:12:05'),
(11, 21, 'Pending', 'You have successfully placed your order.', '2024-02-20 16:54:33', '2024-02-20 16:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 1.4117647058824);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'আমাদের সম্পর্কে', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 1, 0),
(2, 'প্রাইভেসি অ্যান্ড পলিসি', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><img src=\"https://i.imgur.com/BobQuyA.jpg\" width=\"591\"></h2><h2><font size=\"6\">Title number 1</font></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1),
(3, 'ট্রামস অ্যান্ড কন্ডিশন', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_title` text DEFAULT NULL,
  `contact_text` text DEFAULT NULL,
  `side_title` text DEFAULT NULL,
  `side_text` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `fax` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `site` text DEFAULT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text DEFAULT NULL,
  `best_seller_banner_link` text DEFAULT NULL,
  `big_save_banner` text DEFAULT NULL,
  `big_save_banner_link` text DEFAULT NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text DEFAULT NULL,
  `best_seller_banner_link1` text DEFAULT NULL,
  `big_save_banner1` text DEFAULT NULL,
  `big_save_banner_link1` text DEFAULT NULL,
  `featured_category` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'support@itnayeem.com.bd', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'House: Munshi Bari, Beside Nayar Hat High School,Kisamot Nagorbondh, Borobari, Lalmonir Hat, Bangladesh', '+8801511777744', '+8801511777744', 'support@itnayeem.com.bd', 'www.itnayeem.com.bd', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '165051247641cT4n4PQXL._AC_SX679_.jpg', 'http://google.com', '1565150264banner3.jpg', 'https://itnayeem.com.bd/', 1, 1, '1568889138banner2.jpg', 'http://google.com', '1565150264banner4.jpg', 'https://itnayeem.com.bd/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(11, '1685562515Hatil.png', 'https://hatil.com/'),
(12, '1685562636regal.png', 'https://rfleshop.com/regal-furniture-en-2/'),
(13, '1685562840parex.png', 'https://partex.com.bd'),
(14, '1685562934akter.png', 'https://itnayeem.com.bd/'),
(15, '1685563049otobi.png', 'https://itnayeem.com.bd/'),
(16, '1685563137ota.png', 'https://itnayeem.com.bd/'),
(17, '1685563255nav.png', 'https://itnayeem.com.bd/'),
(18, '1685563369ess.png', 'https://itnayeem.com.bd/');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `status`) VALUES
(46, 'Make payment on Bkash', 'Bkash Payment', '<font size=\"3\"><b>Bkash Merchant Number: 017XXXXXXX</b></font>', 1),
(47, 'Ok', 'Nogod', '<br>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `location`) VALUES
(2, 'Azampur'),
(3, 'Dhaka'),
(4, 'Kazipara'),
(5, 'Kamarpara'),
(6, 'Uttara'),
(7, 'any');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(183, '4dh67523Mz', 'normal', NULL, 0, 22, NULL, NULL, NULL, 'HATIL Sofa Durian-266', 'hatil-sofa-durian-266-4dh67523mz', '168555683436kli6MI.png', '1685556835VTfqJKw5.jpg', NULL, NULL, NULL, NULL, NULL, 58.823529411765, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Made from Kiln-dried imported&nbsp;Beech wood and veneered engineered wood.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt; text-align: justify;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Fabric can dry-cleaned</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Weight single seater 16.50</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">&nbsp;kgs, Double seater 27.50 kgs</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Made from Kiln-dried imported&nbsp;Beech wood and veneered engineered wood.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt; text-align: justify;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Fabric can dry-cleaned</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Weight single seater 16.50</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">&nbsp;kgs, Double seater 27.50 kgs</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 1, 41, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:13:54', '2024-11-29 04:10:22', 1, '06/13/2024', NULL, NULL, 0, 0),
(184, 'nJ96899DMk', 'normal', NULL, 0, 22, NULL, NULL, NULL, 'HATIL Sofa Wallace-283', 'hatil-sofa-wallace-283-nj96899dmk', '16855569823hk7qd59.png', '1685556982hikaopV0.jpg', NULL, NULL, NULL, NULL, NULL, 69.411764705882, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from Kiln-dried imported&nbsp;Beech veneered engineered wood.</li><li>High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</li><li>Please refer to images for dimension details</li><li>Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</li><li>Fabric can be dry-cleaned</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Indoor use only</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from Kiln-dried imported&nbsp;Beech veneered engineered wood.</li><li>High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</li><li>Please refer to images for dimension details</li><li>Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</li><li>Fabric can be dry-cleaned</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Indoor use only</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</li></ul>', 1, 41, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:16:22', '2024-11-28 20:41:31', 1, '06/04/2024', NULL, NULL, 0, 0),
(185, 'M3m7098jNu', 'normal', NULL, 0, 22, NULL, NULL, NULL, 'HATIL Sofa Moseley-281', 'hatil-sofa-moseley-281-m3m7098jnu', '1685557147Pju1TAdb.png', '1685557147AQPzgD6k.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from Kiln-dried imported Beech wood and veneered engineered wood.</li><li>High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</li><li>Please refer to images for dimension details</li><li>Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</li><li>Fabric can be dry-cleaned</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Indoor use only</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from Kiln-dried imported Beech wood and veneered engineered wood.</li><li>High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</li><li>Please refer to images for dimension details</li><li>Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</li><li>Fabric can be dry-cleaned</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Indoor use only</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</li></ul>', 1, 41, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:19:07', '2024-11-26 03:54:12', 1, '06/04/2024', NULL, NULL, 0, 0),
(186, 'mOf7217Qyr', 'normal', NULL, 0, 22, NULL, NULL, NULL, 'HATIL Sofa Apostrophe-316', 'hatil-sofa-apostrophe-316-mof7217qyr', '1685557263i2ARLopM.png', '1685557263HAypjCfI.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made&nbsp;from&nbsp;Kiln-dried imported Beech wood and veneered engineered wood</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt; text-align: justify;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Fabric can dry-cleaned</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made&nbsp;from&nbsp;Kiln-dried imported Beech wood and veneered engineered wood</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt; text-align: justify;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported fabric upholstery with soft and durable cushioning. Fabric can be selected from available options</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Fabric can dry-cleaned</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 1, 81, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:21:03', '2024-11-27 18:24:32', 1, '06/04/2024', NULL, NULL, 1, 0),
(187, 'oNW7484OED', 'normal', NULL, 0, 24, NULL, NULL, NULL, 'HATIL Bed Utopia-170', 'hatil-bed-utopia-170-onw7484oed', '1685557556nmRIRz0r.png', '1685557556tMpG482q.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Kiln-dried imported Beech wood, veneered engineered wood and veneered MDF.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Only bed without mattress</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 148.00</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;Kgs</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Kiln-dried imported Beech wood, veneered engineered wood and veneered MDF.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Only bed without mattress</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 148.00</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;Kgs</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 1, 70, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:25:56', '2024-11-28 18:25:52', 1, '06/11/2024', NULL, NULL, 1, 0),
(188, 'N7E7616Kcs', 'normal', NULL, 0, 24, NULL, NULL, NULL, 'HATIL Bed Stephen-194', 'hatil-bed-stephen-194-n7e7616kcs', '1685557706dnnCXfYU.png', '1685557706I3rGv8cM.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from superior quality melamine faced particle board with international standard density and load bearing capacity</li><li>Please refer to images for dimension details</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Only bed without mattress</li><li>Weight 140.00 kgs</li><li>Indoor use only</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from superior quality melamine faced particle board with international standard density and load bearing capacity</li><li>Please refer to images for dimension details</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Only bed without mattress</li><li>Weight 140.00 kgs</li><li>Indoor use only</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</li></ul>', 1, 74, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:28:26', '2024-11-28 18:39:46', 1, '06/04/2024', NULL, NULL, 1, 0),
(189, 'CL37761Rk1', 'normal', NULL, 0, 24, NULL, NULL, NULL, 'HATIL Bed Sweetheart-177', 'hatil-bed-sweetheart-177-cl37761rk1', '1685557858vczvZCiD.png', '1685557858kCNSGoTF.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Kiln-dried imported Beech wood,&nbsp;veneered engineered wood and veneered MDF.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Only bed without mattress</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 121.00</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;Kgs</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Kiln-dried imported Beech wood,&nbsp;veneered engineered wood and veneered MDF.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Only bed without mattress</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 121.00</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;Kgs</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish.</span></span></span></span></span></li></ul>', 1, 76, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:30:58', '2024-11-29 12:59:58', 1, '06/04/2024', NULL, NULL, 1, 0),
(190, '2tI8027SaU', 'normal', NULL, 0, 27, NULL, NULL, NULL, 'HATIL Wardrobe Rhone-173+175+176 (Body & Frame) Set', 'hatil-wardrobe-rhone-173175176-body-frame-set-2ti8027sau', '1685558079pnFzMYB0.png', '1685558079nJeLlXK6.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt; text-align: justify;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Made from superior quality melamine faced particle board with international standard density and load bearing capacity with&nbsp;mild Steel</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Same color edge banding done in latest Homag line&nbsp;</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 12pt;\"><span style=\"font-family: Arial, sans-serif;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 12pt;\"><span style=\"font-family: Arial, sans-serif;\">Size: L1626 x W590 x H1982 mm</span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 12pt;\"><span style=\"font-family: Arial, sans-serif;\">Weight 167.50 kgs</span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li></ul>', 9999, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt; text-align: justify;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Made from superior quality melamine faced particle board with international standard density and load bearing capacity with&nbsp;mild Steel</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Same color edge banding done in latest Homag line&nbsp;</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 12pt;\"><span style=\"font-family: Arial, sans-serif;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 12pt;\"><span style=\"font-family: Arial, sans-serif;\">Size: L1626 x W590 x H1982 mm</span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 12pt;\"><span style=\"font-family: Arial, sans-serif;\">Weight 167.50 kgs</span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li></ul>', 1, 72, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:34:39', '2024-11-26 17:59:36', 1, '06/04/2024', NULL, NULL, 1, 0);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(191, 'CIt8098T5H', 'normal', NULL, 0, 27, NULL, NULL, NULL, 'HATIL Wardrobe Coral-148', 'hatil-wardrobe-coral-148-cit8098t5h', '1685558148UklT1pHW.png', '16855581486Oe0wfOb.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Klin-dired imported Beech Wood, veneered engineered wood, veneered MDF and Lamination&nbsp;Board</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) Lacquer in antique (outside) and natural (inside) finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 101.50&nbsp;</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Kgs</span></span></span></span></span></li><li style=\"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"line-height: 16.4067px;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</span></span></span></span></li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Klin-dired imported Beech Wood, veneered engineered wood, veneered MDF and Lamination&nbsp;Board</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) Lacquer in antique (outside) and natural (inside) finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 101.50&nbsp;</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Kgs</span></span></span></span></span></li><li style=\"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"line-height: 16.4067px;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</span></span></span></span></li></ul>', 1, 107, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:35:48', '2024-11-29 03:51:17', 0, NULL, NULL, NULL, 1, 0),
(192, 'BYb8293KUW', 'normal', NULL, 0, 28, NULL, NULL, NULL, 'HATIL Dining Fairbanks-109 and Carp-109 (4 Chair and 1 Table with NTM Glass)', 'hatil-dining-fairbanks-109-and-carp-109-4-chair-and-1-table-with-ntm-glass-byb8293kuw', '1685558348EdxUjL9u.png', '16855583486UTYUKNo.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from Kiln-dried imported Beech wood and veneered engineered wood.</li><li>High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</li><li>Please refer to images for dimension details</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Imported high quality&nbsp;10&nbsp;mm thick tempered glass</li><li>Indoor use only</li><li>Weight Table 58.00&nbsp;kgs, Chair per unit 13.00 kgs</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li>Made from Kiln-dried imported Beech wood and veneered engineered wood.</li><li>High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</li><li>Please refer to images for dimension details</li><li>Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</li><li>Imported high quality hardware fittings</li><li>Imported high quality&nbsp;10&nbsp;mm thick tempered glass</li><li>Indoor use only</li><li>Weight Table 58.00&nbsp;kgs, Chair per unit 13.00 kgs</li><li>Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</li></ul>', 1, 144, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:39:08', '2025-02-10 05:52:09', 1, '06/11/2024', NULL, NULL, 1, 0),
(193, 'At48411TQ8', 'normal', NULL, 0, 28, NULL, NULL, NULL, 'HATIL Dining Gourmet-148 and Pancake-148 (6 Chair and 1 Table with NTM Glass)', 'hatil-dining-gourmet-148-and-pancake-148-6-chair-and-1-table-with-ntm-glass-at48411tq8', '1739133271M3gBceuM.png', '1739133271lmgAor3T.jpg', NULL, NULL, NULL, NULL, NULL, 13.388235294118, 0, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Kiln-dried imported Beech wood and veneered engineered wood.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality 10</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;mm thick tempered glass</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 58.00</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;kgs, Chair per unit 14 kgs</span></span></span></span></span></li><li style=\"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"line-height: 16.4067px;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</span></span></span></span></li></ul>', 10000, '<ul style=\"color: rgb(59, 58, 60); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 13px; background-color: rgb(249, 249, 249); list-style-type: circle;\"><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Made from Kiln-dried imported Beech wood and veneered engineered wood.</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">High quality environment friendly Italian Ultra Violet (UV) and Polyurethane (PU) Lacquer in antique finish</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Please refer to images for dimension details</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Any assembly or installation required will be done by the HATIL team at the time of delivery (one day after delivery for CKD items)</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality hardware fittings</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Imported high quality 10</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;mm thick tempered glass</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Indoor use only</span></span></span></span></span></li><li style=\"margin: 0in 0in 0.0001pt;\"><span style=\"background: white;\"><span style=\"line-height: 18pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Weight 58.00</span></span></span><span style=\"font-size: 11.5pt;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">&nbsp;kgs, Chair per unit 14 kgs</span></span></span></span></span></li><li style=\"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;\"><span style=\"font-size: 11.5pt;\"><span style=\"line-height: 16.4067px;\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\"><span style=\"color: black;\">Most of our furniture is made of natural components, which will have natural differences in grain construction and occasional minor blemish</span></span></span></span></li></ul>', 1, 129, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-31 22:40:57', '2025-02-09 14:34:35', 0, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(685, 192, '2023-05-31'),
(686, 192, '2023-05-31'),
(687, 190, '2023-05-31'),
(688, 192, '2023-06-02'),
(689, 192, '2023-06-03'),
(690, 191, '2023-06-07'),
(691, 188, '2023-06-07'),
(692, 186, '2023-06-08'),
(693, 187, '2023-06-08'),
(694, 192, '2023-06-09'),
(695, 193, '2023-06-10'),
(696, 190, '2023-06-10'),
(697, 184, '2023-06-10'),
(698, 185, '2023-06-13'),
(699, 183, '2023-06-15'),
(700, 193, '2023-06-18'),
(701, 193, '2023-06-19'),
(702, 191, '2023-06-27'),
(703, 193, '2023-07-02'),
(704, 186, '2023-07-02'),
(705, 187, '2023-07-06'),
(706, 190, '2023-07-07'),
(707, 191, '2023-07-07'),
(708, 188, '2023-07-07'),
(709, 193, '2023-07-10'),
(710, 192, '2023-07-12'),
(711, 193, '2023-07-14'),
(712, 192, '2023-07-25'),
(713, 190, '2023-07-26'),
(714, 187, '2023-07-27'),
(715, 193, '2023-08-03'),
(716, 193, '2023-08-03'),
(717, 192, '2023-08-03'),
(718, 192, '2023-08-03'),
(719, 193, '2023-08-04'),
(720, 186, '2023-08-04'),
(721, 191, '2023-08-08'),
(722, 192, '2023-08-08'),
(723, 192, '2023-08-16'),
(724, 186, '2023-08-18'),
(725, 187, '2023-08-18'),
(726, 188, '2023-08-18'),
(727, 189, '2023-08-18'),
(728, 192, '2023-08-24'),
(729, 187, '2023-08-24'),
(730, 186, '2023-08-25'),
(731, 192, '2023-08-28'),
(732, 192, '2023-08-28'),
(733, 192, '2023-08-31'),
(734, 191, '2023-09-09'),
(735, 188, '2023-09-10'),
(736, 189, '2023-09-10'),
(737, 186, '2023-09-10'),
(738, 187, '2023-09-11'),
(739, 192, '2023-09-11'),
(740, 193, '2023-09-12'),
(741, 190, '2023-09-13'),
(742, 183, '2023-09-14'),
(743, 185, '2023-09-16'),
(744, 191, '2023-09-26'),
(745, 191, '2023-09-26'),
(746, 192, '2023-10-20'),
(747, 192, '2023-10-20'),
(748, 193, '2023-10-20'),
(749, 190, '2023-10-21'),
(750, 191, '2023-10-21'),
(751, 189, '2023-10-29'),
(752, 193, '2023-12-06'),
(753, 193, '2023-12-06'),
(754, 193, '2023-12-06'),
(755, 193, '2023-12-07'),
(756, 191, '2023-12-08'),
(757, 189, '2023-12-08'),
(758, 193, '2023-12-08'),
(759, 186, '2023-12-08'),
(760, 190, '2023-12-08'),
(761, 187, '2023-12-08'),
(762, 188, '2023-12-08'),
(763, 189, '2023-12-08'),
(764, 185, '2023-12-08'),
(765, 184, '2023-12-08'),
(766, 183, '2023-12-08'),
(767, 186, '2023-12-08'),
(768, 187, '2023-12-08'),
(769, 188, '2023-12-08'),
(770, 192, '2023-12-08'),
(771, 192, '2023-12-08'),
(772, 193, '2023-12-09'),
(773, 188, '2023-12-10'),
(774, 189, '2023-12-10'),
(775, 186, '2023-12-11'),
(776, 190, '2023-12-13'),
(777, 184, '2023-12-13'),
(778, 187, '2023-12-15'),
(779, 192, '2023-12-15'),
(780, 191, '2023-12-17'),
(781, 183, '2023-12-18'),
(782, 185, '2023-12-20'),
(783, 187, '2023-12-22'),
(784, 187, '2023-12-22'),
(785, 193, '2023-12-22'),
(786, 193, '2023-12-22'),
(787, 192, '2023-12-22'),
(788, 192, '2023-12-23'),
(789, 190, '2023-12-23'),
(790, 192, '2023-12-23'),
(791, 187, '2023-12-23'),
(792, 192, '2023-12-23'),
(793, 192, '2023-12-23'),
(794, 192, '2023-12-24'),
(795, 192, '2023-12-25'),
(796, 188, '2023-12-26'),
(797, 191, '2023-12-26'),
(798, 191, '2023-12-26'),
(799, 191, '2023-12-26'),
(800, 191, '2023-12-26'),
(801, 189, '2023-12-26'),
(802, 193, '2023-12-28'),
(803, 192, '2023-12-28'),
(804, 187, '2023-12-31'),
(805, 190, '2024-01-01'),
(806, 188, '2024-01-01'),
(807, 192, '2024-01-01'),
(808, 193, '2024-01-01'),
(809, 186, '2024-01-01'),
(810, 191, '2024-01-02'),
(811, 193, '2024-01-03'),
(812, 189, '2024-01-03'),
(813, 193, '2024-01-04'),
(814, 184, '2024-01-04'),
(815, 193, '2024-01-05'),
(816, 189, '2024-01-05'),
(817, 183, '2024-01-05'),
(818, 184, '2024-01-05'),
(819, 183, '2024-01-05'),
(820, 185, '2024-01-06'),
(821, 188, '2024-01-06'),
(822, 186, '2024-01-06'),
(823, 192, '2024-01-06'),
(824, 193, '2024-01-06'),
(825, 192, '2024-01-06'),
(826, 192, '2024-01-06'),
(827, 183, '2024-01-06'),
(828, 192, '2024-01-08'),
(829, 188, '2024-01-08'),
(830, 191, '2024-01-08'),
(831, 191, '2024-01-08'),
(832, 191, '2024-01-08'),
(833, 191, '2024-01-08'),
(834, 188, '2024-01-08'),
(835, 192, '2024-01-18'),
(836, 193, '2024-01-18'),
(837, 188, '2024-01-19'),
(838, 189, '2024-01-19'),
(839, 193, '2024-01-20'),
(840, 193, '2024-01-20'),
(841, 187, '2024-01-22'),
(842, 187, '2024-01-22'),
(843, 193, '2024-01-22'),
(844, 193, '2024-01-22'),
(845, 193, '2024-01-22'),
(846, 193, '2024-01-22'),
(847, 191, '2024-01-22'),
(848, 186, '2024-02-07'),
(849, 186, '2024-02-10'),
(850, 187, '2024-02-10'),
(851, 188, '2024-02-10'),
(852, 189, '2024-02-10'),
(853, 185, '2024-02-10'),
(854, 184, '2024-02-10'),
(855, 190, '2024-02-10'),
(856, 183, '2024-02-10'),
(857, 186, '2024-02-10'),
(858, 189, '2024-02-10'),
(859, 187, '2024-02-10'),
(860, 188, '2024-02-10'),
(861, 185, '2024-02-10'),
(862, 183, '2024-02-10'),
(863, 184, '2024-02-10'),
(864, 190, '2024-02-10'),
(865, 192, '2024-02-11'),
(866, 188, '2024-02-11'),
(867, 187, '2024-02-11'),
(868, 193, '2024-02-11'),
(869, 193, '2024-02-11'),
(870, 186, '2024-02-12'),
(871, 192, '2024-02-12'),
(872, 191, '2024-02-15'),
(873, 189, '2024-02-15'),
(874, 193, '2024-02-15'),
(875, 188, '2024-02-15'),
(876, 192, '2024-02-15'),
(877, 192, '2024-02-16'),
(878, 191, '2024-02-19'),
(879, 189, '2024-02-19'),
(880, 193, '2024-02-19'),
(881, 193, '2024-02-19'),
(882, 186, '2024-02-19'),
(883, 189, '2024-02-19'),
(884, 190, '2024-02-19'),
(885, 186, '2024-02-19'),
(886, 185, '2024-02-19'),
(887, 191, '2024-02-19'),
(888, 191, '2024-02-19'),
(889, 191, '2024-02-19'),
(890, 191, '2024-02-19'),
(891, 191, '2024-02-19'),
(892, 193, '2024-02-20'),
(893, 193, '2024-02-20'),
(894, 186, '2024-02-20'),
(895, 187, '2024-02-20'),
(896, 187, '2024-02-20'),
(897, 193, '2024-02-20'),
(898, 190, '2024-02-20'),
(899, 193, '2024-02-20'),
(900, 192, '2024-02-20'),
(901, 193, '2024-02-21'),
(902, 187, '2024-02-23'),
(903, 191, '2024-02-23'),
(904, 193, '2024-02-23'),
(905, 186, '2024-02-24'),
(906, 186, '2024-02-24'),
(907, 184, '2024-02-24'),
(908, 192, '2024-02-25'),
(909, 188, '2024-02-25'),
(910, 193, '2024-02-26'),
(911, 189, '2024-02-26'),
(912, 193, '2024-02-26'),
(913, 186, '2024-02-26'),
(914, 186, '2024-02-26'),
(915, 186, '2024-02-26'),
(916, 190, '2024-02-27'),
(917, 193, '2024-02-27'),
(918, 193, '2024-02-27'),
(919, 193, '2024-02-27'),
(920, 193, '2024-02-27'),
(921, 189, '2024-02-27'),
(922, 193, '2024-02-27'),
(923, 193, '2024-02-27'),
(924, 192, '2024-02-28'),
(925, 186, '2024-02-28'),
(926, 192, '2024-02-28'),
(927, 193, '2024-02-28'),
(928, 190, '2024-02-28'),
(929, 192, '2024-02-29'),
(930, 190, '2024-02-29'),
(931, 187, '2024-03-01'),
(932, 193, '2024-03-02'),
(933, 190, '2024-03-03'),
(934, 189, '2024-03-03'),
(935, 185, '2024-03-03'),
(936, 192, '2024-03-05'),
(937, 192, '2024-03-06'),
(938, 192, '2024-03-06'),
(939, 187, '2024-03-06'),
(940, 184, '2024-03-06'),
(941, 192, '2024-03-07'),
(942, 192, '2024-03-15'),
(943, 192, '2024-03-16'),
(944, 191, '2024-03-21'),
(945, 191, '2024-03-24'),
(946, 192, '2024-03-25'),
(947, 186, '2024-03-25'),
(948, 188, '2024-03-28'),
(949, 188, '2024-03-28'),
(950, 193, '2024-03-29'),
(951, 191, '2024-03-29'),
(952, 191, '2024-03-29'),
(953, 188, '2024-03-31'),
(954, 189, '2024-03-31'),
(955, 187, '2024-03-31'),
(956, 192, '2024-03-31'),
(957, 193, '2024-03-31'),
(958, 186, '2024-03-31'),
(959, 183, '2024-03-31'),
(960, 185, '2024-03-31'),
(961, 184, '2024-03-31'),
(962, 191, '2024-03-31'),
(963, 190, '2024-03-31'),
(964, 192, '2024-03-31'),
(965, 192, '2024-03-31'),
(966, 183, '2024-04-01'),
(967, 191, '2024-04-02'),
(968, 189, '2024-04-02'),
(969, 186, '2024-04-02'),
(970, 187, '2024-04-02'),
(971, 192, '2024-04-03'),
(972, 193, '2024-04-03'),
(973, 185, '2024-04-03'),
(974, 190, '2024-04-04'),
(975, 190, '2024-04-04'),
(976, 187, '2024-04-04'),
(977, 184, '2024-04-04'),
(978, 191, '2024-04-04'),
(979, 190, '2024-04-04'),
(980, 188, '2024-04-04'),
(981, 192, '2024-04-05'),
(982, 192, '2024-04-05'),
(983, 188, '2024-04-05'),
(984, 186, '2024-04-05'),
(985, 193, '2024-04-06'),
(986, 189, '2024-04-07'),
(987, 185, '2024-04-07'),
(988, 184, '2024-04-08'),
(989, 190, '2024-04-09'),
(990, 192, '2024-04-09'),
(991, 188, '2024-04-09'),
(992, 186, '2024-04-09'),
(993, 189, '2024-04-09'),
(994, 187, '2024-04-09'),
(995, 185, '2024-04-09'),
(996, 191, '2024-04-09'),
(997, 183, '2024-04-09'),
(998, 193, '2024-04-09'),
(999, 184, '2024-04-09'),
(1000, 183, '2024-04-10'),
(1001, 193, '2024-04-13'),
(1002, 185, '2024-04-13'),
(1003, 192, '2024-04-16'),
(1004, 187, '2024-04-16'),
(1005, 192, '2024-04-20'),
(1006, 190, '2024-04-20'),
(1007, 189, '2024-04-22'),
(1008, 187, '2024-04-22'),
(1009, 185, '2024-04-22'),
(1010, 186, '2024-04-22'),
(1011, 191, '2024-04-23'),
(1012, 184, '2024-04-23'),
(1013, 183, '2024-04-23'),
(1014, 193, '2024-04-23'),
(1015, 188, '2024-04-23'),
(1016, 188, '2024-04-24'),
(1017, 193, '2024-04-24'),
(1018, 193, '2024-04-27'),
(1019, 190, '2024-04-27'),
(1020, 192, '2024-04-27'),
(1021, 188, '2024-07-10'),
(1022, 185, '2024-07-10'),
(1023, 186, '2024-07-10'),
(1024, 192, '2024-07-10'),
(1025, 188, '2024-07-10'),
(1026, 190, '2024-07-11'),
(1027, 190, '2024-07-11'),
(1028, 185, '2024-07-12'),
(1029, 191, '2024-07-13'),
(1030, 189, '2024-07-13'),
(1031, 191, '2024-07-13'),
(1032, 192, '2024-07-13'),
(1033, 184, '2024-07-14'),
(1034, 187, '2024-07-14'),
(1035, 185, '2024-07-15'),
(1036, 193, '2024-07-15'),
(1037, 188, '2024-07-15'),
(1038, 188, '2024-07-16'),
(1039, 193, '2024-07-16'),
(1040, 192, '2024-07-16'),
(1041, 187, '2024-07-16'),
(1042, 183, '2024-07-16'),
(1043, 189, '2024-07-17'),
(1044, 184, '2024-07-17'),
(1045, 185, '2024-07-17'),
(1046, 184, '2024-07-17'),
(1047, 191, '2024-07-17'),
(1048, 190, '2024-07-17'),
(1049, 186, '2024-07-17'),
(1050, 188, '2024-07-26'),
(1051, 189, '2024-07-26'),
(1052, 193, '2024-07-26'),
(1053, 192, '2024-07-26'),
(1054, 192, '2024-07-26'),
(1055, 193, '2024-07-26'),
(1056, 186, '2024-07-26'),
(1057, 186, '2024-07-26'),
(1058, 188, '2024-07-27'),
(1059, 192, '2024-07-27'),
(1060, 193, '2024-07-27'),
(1061, 190, '2024-07-27'),
(1062, 191, '2024-07-27'),
(1063, 189, '2024-07-27'),
(1064, 187, '2024-07-27'),
(1065, 188, '2024-07-27'),
(1066, 186, '2024-07-27'),
(1067, 185, '2024-07-27'),
(1068, 184, '2024-07-27'),
(1069, 183, '2024-07-27'),
(1070, 189, '2024-07-28'),
(1071, 189, '2024-07-29'),
(1072, 189, '2024-07-29'),
(1073, 185, '2024-07-29'),
(1074, 184, '2024-07-29'),
(1075, 193, '2024-07-29'),
(1076, 183, '2024-07-29'),
(1077, 186, '2024-07-30'),
(1078, 188, '2024-07-30'),
(1079, 191, '2024-07-31'),
(1080, 191, '2024-07-31'),
(1081, 186, '2024-08-03'),
(1082, 186, '2024-08-03'),
(1083, 184, '2024-08-03'),
(1084, 192, '2024-08-03'),
(1085, 191, '2024-08-03'),
(1086, 190, '2024-08-04'),
(1087, 193, '2024-08-06'),
(1088, 192, '2024-08-06'),
(1089, 189, '2024-08-06'),
(1090, 187, '2024-08-06'),
(1091, 188, '2024-08-06'),
(1092, 183, '2024-08-06'),
(1093, 185, '2024-08-06'),
(1094, 184, '2024-08-06'),
(1095, 186, '2024-08-06'),
(1096, 191, '2024-08-06'),
(1097, 190, '2024-08-06'),
(1098, 190, '2024-08-06'),
(1099, 183, '2024-08-07'),
(1100, 185, '2024-08-07'),
(1101, 189, '2024-08-07'),
(1102, 188, '2024-08-07'),
(1103, 184, '2024-08-07'),
(1104, 183, '2024-08-07'),
(1105, 192, '2024-08-07'),
(1106, 193, '2024-08-07'),
(1107, 186, '2024-08-07'),
(1108, 191, '2024-08-07'),
(1109, 187, '2024-08-07'),
(1110, 186, '2024-08-07'),
(1111, 185, '2024-08-08'),
(1112, 193, '2024-08-08'),
(1113, 190, '2024-08-08'),
(1114, 190, '2024-08-08'),
(1115, 191, '2024-08-09'),
(1116, 192, '2024-08-09'),
(1117, 193, '2024-08-09'),
(1118, 189, '2024-08-09'),
(1119, 189, '2024-08-10'),
(1120, 183, '2024-08-10'),
(1121, 185, '2024-08-10'),
(1122, 187, '2024-08-10'),
(1123, 190, '2024-08-10'),
(1124, 193, '2024-08-11'),
(1125, 184, '2024-08-12'),
(1126, 183, '2024-08-12'),
(1127, 193, '2024-08-12'),
(1128, 191, '2024-08-12'),
(1129, 186, '2024-08-12'),
(1130, 190, '2024-08-12'),
(1131, 192, '2024-08-12'),
(1132, 186, '2024-08-12'),
(1133, 187, '2024-08-12'),
(1134, 184, '2024-08-12'),
(1135, 188, '2024-08-12'),
(1136, 193, '2024-08-13'),
(1137, 185, '2024-08-13'),
(1138, 189, '2024-08-13'),
(1139, 188, '2024-08-13'),
(1140, 187, '2024-08-13'),
(1141, 192, '2024-08-14'),
(1142, 192, '2024-08-16'),
(1143, 192, '2024-08-16'),
(1144, 192, '2024-08-18'),
(1145, 193, '2024-08-18'),
(1146, 189, '2024-08-19'),
(1147, 190, '2024-08-19'),
(1148, 192, '2024-08-19'),
(1149, 191, '2024-08-19'),
(1150, 188, '2024-08-20'),
(1151, 188, '2024-08-20'),
(1152, 192, '2024-08-20'),
(1153, 191, '2024-08-20'),
(1154, 191, '2024-08-20'),
(1155, 192, '2024-08-20'),
(1156, 193, '2024-08-20'),
(1157, 189, '2024-08-20'),
(1158, 191, '2024-08-22'),
(1159, 192, '2024-08-22'),
(1160, 193, '2024-08-22'),
(1161, 188, '2024-08-22'),
(1162, 193, '2024-08-22'),
(1163, 193, '2024-08-22'),
(1164, 192, '2024-08-22'),
(1165, 193, '2024-08-22'),
(1166, 193, '2024-08-22'),
(1167, 187, '2024-08-23'),
(1168, 185, '2024-08-23'),
(1169, 190, '2024-08-23'),
(1170, 188, '2024-08-23'),
(1171, 183, '2024-08-25'),
(1172, 184, '2024-08-26'),
(1173, 192, '2024-08-26'),
(1174, 191, '2024-08-27'),
(1175, 188, '2024-08-28'),
(1176, 193, '2024-08-28'),
(1177, 186, '2024-08-28'),
(1178, 189, '2024-08-29'),
(1179, 192, '2024-08-29'),
(1180, 192, '2024-08-29'),
(1181, 193, '2024-08-30'),
(1182, 193, '2024-08-30'),
(1183, 187, '2024-08-30'),
(1184, 192, '2024-08-30'),
(1185, 191, '2024-08-31'),
(1186, 191, '2024-09-01'),
(1187, 190, '2024-09-01'),
(1188, 191, '2024-09-01'),
(1189, 193, '2024-09-01'),
(1190, 191, '2024-09-02'),
(1191, 192, '2024-09-02'),
(1192, 193, '2024-09-02'),
(1193, 189, '2024-09-03'),
(1194, 187, '2024-09-03'),
(1195, 188, '2024-09-03'),
(1196, 193, '2024-09-04'),
(1197, 190, '2024-09-04'),
(1198, 192, '2024-09-05'),
(1199, 191, '2024-09-05'),
(1200, 192, '2024-09-05'),
(1201, 191, '2024-09-06'),
(1202, 188, '2024-09-07'),
(1203, 189, '2024-09-07'),
(1204, 187, '2024-09-07'),
(1205, 192, '2024-09-07'),
(1206, 193, '2024-09-07'),
(1207, 186, '2024-09-07'),
(1208, 183, '2024-09-07'),
(1209, 185, '2024-09-07'),
(1210, 184, '2024-09-07'),
(1211, 191, '2024-09-07'),
(1212, 190, '2024-09-07'),
(1213, 192, '2024-09-07'),
(1214, 191, '2024-09-07'),
(1215, 191, '2024-09-07'),
(1216, 189, '2024-09-07'),
(1217, 191, '2024-09-08'),
(1218, 185, '2024-09-08'),
(1219, 188, '2024-09-08'),
(1220, 190, '2024-09-08'),
(1221, 183, '2024-09-08'),
(1222, 189, '2024-09-08'),
(1223, 187, '2024-09-08'),
(1224, 192, '2024-09-08'),
(1225, 186, '2024-09-08'),
(1226, 193, '2024-09-08'),
(1227, 192, '2024-09-08'),
(1228, 193, '2024-09-08'),
(1229, 184, '2024-09-08'),
(1230, 188, '2024-09-10'),
(1231, 190, '2024-09-11'),
(1232, 185, '2024-09-11'),
(1233, 187, '2024-09-11'),
(1234, 186, '2024-09-11'),
(1235, 191, '2024-09-12'),
(1236, 189, '2024-09-13'),
(1237, 187, '2024-09-13'),
(1238, 184, '2024-09-13'),
(1239, 193, '2024-09-14'),
(1240, 192, '2024-09-15'),
(1241, 188, '2024-09-15'),
(1242, 191, '2024-09-15'),
(1243, 187, '2024-09-15'),
(1244, 189, '2024-09-15'),
(1245, 183, '2024-09-16'),
(1246, 188, '2024-09-16'),
(1247, 185, '2024-09-16'),
(1248, 190, '2024-09-16'),
(1249, 188, '2024-09-17'),
(1250, 190, '2024-09-17'),
(1251, 192, '2024-09-17'),
(1252, 183, '2024-09-18'),
(1253, 184, '2024-09-18'),
(1254, 189, '2024-09-18'),
(1255, 193, '2024-09-18'),
(1256, 188, '2024-09-19'),
(1257, 186, '2024-09-20'),
(1258, 190, '2024-09-20'),
(1259, 193, '2024-09-20'),
(1260, 191, '2024-09-20'),
(1261, 183, '2024-09-22'),
(1262, 186, '2024-09-22'),
(1263, 186, '2024-09-22'),
(1264, 186, '2024-09-22'),
(1265, 191, '2024-09-23'),
(1266, 192, '2024-09-23'),
(1267, 184, '2024-09-23'),
(1268, 189, '2024-09-24'),
(1269, 192, '2024-09-24'),
(1270, 183, '2024-09-24'),
(1271, 186, '2024-09-24'),
(1272, 188, '2024-09-25'),
(1273, 192, '2024-09-26'),
(1274, 188, '2024-09-27'),
(1275, 193, '2024-09-27'),
(1276, 193, '2024-09-27'),
(1277, 186, '2024-09-28'),
(1278, 189, '2024-09-28'),
(1279, 189, '2024-09-29'),
(1280, 189, '2024-09-29'),
(1281, 186, '2024-09-29'),
(1282, 192, '2024-09-30'),
(1283, 193, '2024-09-30'),
(1284, 189, '2024-09-30'),
(1285, 191, '2024-09-30'),
(1286, 191, '2024-09-30'),
(1287, 191, '2024-09-30'),
(1288, 186, '2024-09-30'),
(1289, 191, '2024-09-30'),
(1290, 189, '2024-10-01'),
(1291, 184, '2024-10-02'),
(1292, 191, '2024-10-02'),
(1293, 191, '2024-10-02'),
(1294, 190, '2024-10-02'),
(1295, 191, '2024-10-02'),
(1296, 190, '2024-10-02'),
(1297, 190, '2024-10-02'),
(1298, 191, '2024-10-02'),
(1299, 183, '2024-10-03'),
(1300, 190, '2024-10-03'),
(1301, 187, '2024-10-03'),
(1302, 192, '2024-10-03'),
(1303, 186, '2024-10-03'),
(1304, 187, '2024-10-03'),
(1305, 186, '2024-10-04'),
(1306, 192, '2024-10-04'),
(1307, 187, '2024-10-04'),
(1308, 186, '2024-10-04'),
(1309, 188, '2024-10-04'),
(1310, 190, '2024-10-04'),
(1311, 185, '2024-10-04'),
(1312, 189, '2024-10-04'),
(1313, 183, '2024-10-04'),
(1314, 184, '2024-10-04'),
(1315, 190, '2024-10-05'),
(1316, 189, '2024-10-05'),
(1317, 187, '2024-10-05'),
(1318, 184, '2024-10-05'),
(1319, 188, '2024-10-05'),
(1320, 190, '2024-10-05'),
(1321, 187, '2024-10-06'),
(1322, 191, '2024-10-06'),
(1323, 184, '2024-10-06'),
(1324, 186, '2024-10-06'),
(1325, 186, '2024-10-06'),
(1326, 188, '2024-10-06'),
(1327, 183, '2024-10-06'),
(1328, 192, '2024-10-06'),
(1329, 185, '2024-10-06'),
(1330, 193, '2024-10-06'),
(1331, 186, '2024-10-06'),
(1332, 190, '2024-10-07'),
(1333, 193, '2024-10-07'),
(1334, 189, '2024-10-07'),
(1335, 189, '2024-10-08'),
(1336, 189, '2024-10-08'),
(1337, 193, '2024-10-08'),
(1338, 186, '2024-10-09'),
(1339, 191, '2024-10-09'),
(1340, 191, '2024-10-09'),
(1341, 190, '2024-10-09'),
(1342, 191, '2024-10-10'),
(1343, 189, '2024-10-11'),
(1344, 191, '2024-10-11'),
(1345, 186, '2024-10-11'),
(1346, 183, '2024-10-11'),
(1347, 188, '2024-10-11'),
(1348, 192, '2024-10-11'),
(1349, 193, '2024-10-12'),
(1350, 193, '2024-10-12'),
(1351, 193, '2024-10-12'),
(1352, 185, '2024-10-12'),
(1353, 185, '2024-10-14'),
(1354, 183, '2024-10-14'),
(1355, 188, '2024-10-14'),
(1356, 186, '2024-10-15'),
(1357, 191, '2024-10-16'),
(1358, 188, '2024-10-16'),
(1359, 188, '2024-10-16'),
(1360, 191, '2024-10-16'),
(1361, 193, '2024-10-16'),
(1362, 192, '2024-10-16'),
(1363, 191, '2024-10-16'),
(1364, 188, '2024-10-16'),
(1365, 184, '2024-10-17'),
(1366, 192, '2024-10-18'),
(1367, 189, '2024-10-18'),
(1368, 185, '2024-10-19'),
(1369, 192, '2024-10-19'),
(1370, 188, '2024-10-19'),
(1371, 190, '2024-10-19'),
(1372, 192, '2024-10-20'),
(1373, 189, '2024-10-20'),
(1374, 191, '2024-10-20'),
(1375, 187, '2024-10-24'),
(1376, 189, '2024-10-24'),
(1377, 192, '2024-10-25'),
(1378, 192, '2024-10-25'),
(1379, 193, '2024-10-25'),
(1380, 191, '2024-10-25'),
(1381, 191, '2024-10-25'),
(1382, 187, '2024-10-25'),
(1383, 190, '2024-10-25'),
(1384, 192, '2024-10-25'),
(1385, 187, '2024-10-25'),
(1386, 187, '2024-10-25'),
(1387, 187, '2024-10-25'),
(1388, 192, '2024-10-26'),
(1389, 192, '2024-10-26'),
(1390, 192, '2024-10-26'),
(1391, 192, '2024-10-26'),
(1392, 191, '2024-10-27'),
(1393, 192, '2024-10-27'),
(1394, 193, '2024-10-27'),
(1395, 186, '2024-10-27'),
(1396, 189, '2024-10-27'),
(1397, 188, '2024-10-30'),
(1398, 190, '2024-10-30'),
(1399, 187, '2024-10-30'),
(1400, 191, '2024-11-01'),
(1401, 193, '2024-11-01'),
(1402, 189, '2024-11-01'),
(1403, 187, '2024-11-02'),
(1404, 187, '2024-11-02'),
(1405, 183, '2024-11-02'),
(1406, 189, '2024-11-02'),
(1407, 187, '2024-11-02'),
(1408, 188, '2024-11-02'),
(1409, 192, '2024-11-03'),
(1410, 191, '2024-11-03'),
(1411, 184, '2024-11-03'),
(1412, 185, '2024-11-03'),
(1413, 190, '2024-11-03'),
(1414, 185, '2024-11-03'),
(1415, 186, '2024-11-03'),
(1416, 192, '2024-11-03'),
(1417, 193, '2024-11-03'),
(1418, 193, '2024-11-04'),
(1419, 190, '2024-11-06'),
(1420, 189, '2024-11-06'),
(1421, 191, '2024-11-06'),
(1422, 186, '2024-11-06'),
(1423, 192, '2024-11-06'),
(1424, 186, '2024-11-06'),
(1425, 191, '2024-11-06'),
(1426, 188, '2024-11-06'),
(1427, 186, '2024-11-07'),
(1428, 191, '2024-11-07'),
(1429, 192, '2024-11-07'),
(1430, 192, '2024-11-08'),
(1431, 192, '2024-11-08'),
(1432, 192, '2024-11-08'),
(1433, 183, '2024-11-08'),
(1434, 193, '2024-11-09'),
(1435, 193, '2024-11-09'),
(1436, 190, '2024-11-09'),
(1437, 189, '2024-11-09'),
(1438, 188, '2024-11-11'),
(1439, 183, '2024-11-11'),
(1440, 192, '2024-11-11'),
(1441, 186, '2024-11-12'),
(1442, 186, '2024-11-12'),
(1443, 187, '2024-11-12'),
(1444, 192, '2024-11-12'),
(1445, 188, '2024-11-12'),
(1446, 186, '2024-11-13'),
(1447, 189, '2024-11-13'),
(1448, 187, '2024-11-13'),
(1449, 191, '2024-11-13'),
(1450, 191, '2024-11-13'),
(1451, 193, '2024-11-14'),
(1452, 193, '2024-11-15'),
(1453, 186, '2024-11-15'),
(1454, 192, '2024-11-15'),
(1455, 191, '2024-11-16'),
(1456, 187, '2024-11-16'),
(1457, 186, '2024-11-16'),
(1458, 184, '2024-11-17'),
(1459, 193, '2024-11-17'),
(1460, 193, '2024-11-17'),
(1461, 191, '2024-11-17'),
(1462, 192, '2024-11-17'),
(1463, 188, '2024-11-18'),
(1464, 189, '2024-11-19'),
(1465, 192, '2024-11-19'),
(1466, 191, '2024-11-19'),
(1467, 190, '2024-11-19'),
(1468, 192, '2024-11-19'),
(1469, 192, '2024-11-19'),
(1470, 189, '2024-11-20'),
(1471, 190, '2024-11-20'),
(1472, 187, '2024-11-20'),
(1473, 186, '2024-11-20'),
(1474, 188, '2024-11-20'),
(1475, 183, '2024-11-20'),
(1476, 185, '2024-11-20'),
(1477, 184, '2024-11-20'),
(1478, 187, '2024-11-20'),
(1479, 188, '2024-11-20'),
(1480, 190, '2024-11-20'),
(1481, 186, '2024-11-20'),
(1482, 183, '2024-11-20'),
(1483, 189, '2024-11-20'),
(1484, 185, '2024-11-20'),
(1485, 184, '2024-11-20'),
(1486, 190, '2024-11-20'),
(1487, 190, '2024-11-20'),
(1488, 186, '2024-11-20'),
(1489, 190, '2024-11-20'),
(1490, 188, '2024-11-21'),
(1491, 192, '2024-11-21'),
(1492, 191, '2024-11-21'),
(1493, 187, '2024-11-21'),
(1494, 192, '2024-11-21'),
(1495, 189, '2024-11-21'),
(1496, 192, '2024-11-21'),
(1497, 190, '2024-11-21'),
(1498, 190, '2024-11-22'),
(1499, 192, '2024-11-22'),
(1500, 189, '2024-11-23'),
(1501, 191, '2024-11-23'),
(1502, 192, '2024-11-24'),
(1503, 189, '2024-11-24'),
(1504, 193, '2024-11-24'),
(1505, 186, '2024-11-24'),
(1506, 193, '2024-11-24'),
(1507, 193, '2024-11-24'),
(1508, 189, '2024-11-24'),
(1509, 191, '2024-11-25'),
(1510, 191, '2024-11-25'),
(1511, 191, '2024-11-25'),
(1512, 190, '2024-11-25'),
(1513, 188, '2024-11-26'),
(1514, 189, '2024-11-26'),
(1515, 187, '2024-11-26'),
(1516, 192, '2024-11-26'),
(1517, 193, '2024-11-26'),
(1518, 186, '2024-11-26'),
(1519, 183, '2024-11-26'),
(1520, 185, '2024-11-26'),
(1521, 184, '2024-11-26'),
(1522, 191, '2024-11-26'),
(1523, 190, '2024-11-26'),
(1524, 187, '2024-11-26'),
(1525, 190, '2024-11-26'),
(1526, 191, '2024-11-27'),
(1527, 191, '2024-11-27'),
(1528, 186, '2024-11-27'),
(1529, 191, '2024-11-27'),
(1530, 192, '2024-11-27'),
(1531, 186, '2024-11-27'),
(1532, 193, '2024-11-27'),
(1533, 192, '2024-11-27'),
(1534, 192, '2024-11-27'),
(1535, 191, '2024-11-27'),
(1536, 192, '2024-11-28'),
(1537, 193, '2024-11-28'),
(1538, 188, '2024-11-28'),
(1539, 192, '2024-11-28'),
(1540, 192, '2024-11-28'),
(1541, 193, '2024-11-28'),
(1542, 187, '2024-11-28'),
(1543, 187, '2024-11-28'),
(1544, 187, '2024-11-28'),
(1545, 188, '2024-11-28'),
(1546, 184, '2024-11-28'),
(1547, 189, '2024-11-28'),
(1548, 191, '2024-11-29'),
(1549, 183, '2024-11-29'),
(1550, 193, '2024-11-29'),
(1551, 193, '2024-11-29'),
(1552, 192, '2024-11-29'),
(1553, 193, '2024-11-29'),
(1554, 189, '2024-11-29'),
(1555, 192, '2024-11-30'),
(1556, 193, '2024-11-30'),
(1557, 192, '2024-11-30'),
(1558, 193, '2025-02-09'),
(1559, 193, '2025-02-09'),
(1560, 192, '2025-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `meta_keys` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'Genius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,Sea');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1571288944s1.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1571288950s2.png'),
(4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1571288955s3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1571288959s4.png'),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1571457250s1.png'),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1571457257s2.png'),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1571457261s3.png'),
(9, 13, 'HELP CENTER', '24/7 Support System', '1571457265s4.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(3, 0, 'SA Paribahan', '3-4 Days', 1.4117647058824),
(4, 0, 'Sundorban Courier Service', '3-4 Days', 1.4117647058824),
(5, 0, 'Redex', '24 Hours', 0.70588235294118);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, NULL, '24', '#000000', 'slideInUp', '২০% ছাড়ে কিনে নিন', '50', '#000000', 'slideInDown', 'সকল ধরনের আধুনিক ও উন্নমানের সোফা কিনুন, দেশ সেরা ফার্নিচার ব্রান্ড থেকে।', '16', '#942aff', 'slideInRight', '16855530311616303254slider5.jpg', 'slide-one', 'https://itnayeem.com.bd/'),
(9, NULL, '24', '#0d0d0d', 'slideInUp', '২০% ছাড়ে কিনে নিন', '50', '#0d0d0d', 'slideInDown', 'সকল ধরনের আধুনিক ও উন্নমানের সোফা কিনুন, দেশ সেরা ফার্নিচার ব্রান্ড থেকে।', '16', '#942aff', 'slideInDown', '16855529471616303287slider4.jpg', 'slide-two', 'https://itnayeem.com.bd/');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) NOT NULL,
  `gplus` varchar(191) NOT NULL,
  `twitter` varchar(191) NOT NULL,
  `linkedin` varchar(191) NOT NULL,
  `dribble` varchar(191) DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(4) DEFAULT NULL,
  `g_check` tinyint(4) DEFAULT NULL,
  `fclient_id` text DEFAULT NULL,
  `fclient_secret` text DEFAULT NULL,
  `fredirect` text DEFAULT NULL,
  `gclient_id` text DEFAULT NULL,
  `gclient_secret` text DEFAULT NULL,
  `gredirect` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 1, 1, 1, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/upgraded/kingcommerce-new/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/upgraded/kingcommerce-new/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`) VALUES
(5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>'),
(6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(7, 'Unlimited', '৳', 'BDT', 11.764705882353, 30, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(8, 'Basic', '৳', 'BDT', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `txn_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_sign` blob DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_value` double NOT NULL DEFAULT 0,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'plus, minus',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `txn_number`, `amount`, `currency_sign`, `currency_code`, `currency_value`, `method`, `txnid`, `details`, `type`, `created_at`, `updated_at`) VALUES
(1, 22, 'SKk0774sN9', 320, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-05-31 04:26:14', '2020-05-31 04:26:14'),
(2, 22, 'nNI0989op1', 130, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-05-31 04:29:49', '2020-05-31 04:29:49'),
(3, 22, '7re14878jD', 130, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-05-31 04:38:07', '2020-05-31 04:38:07'),
(4, 22, 'BYr2053KuN', 1600, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-06-01 22:27:33', '2020-06-01 22:27:33'),
(5, 22, 'Ee648427Nl', 2.4875621890547, 0x5224, 'BRL', 4.02, 'MercadoPago', '1235324161', 'Payment Deposit', 'plus', '2021-04-01 05:00:42', '2021-04-01 05:00:42'),
(6, 13, 'k0g0417jXR', 10, 0x24, 'USD', 1, 'Molly Payment', 'tr_g3Kc3sHWwb', 'Payment Deposit', 'plus', '2021-04-03 03:00:17', '2021-04-03 03:00:17'),
(7, 13, 'cNR0463svz', 0.02747864222533, 0xe282a6, 'NGN', 363.919, 'Paystack', '245249284', 'Payment Deposit', 'plus', '2021-04-03 03:01:03', '2021-04-03 03:01:03'),
(8, 13, 'N561202Ssb', 10, 0x24, 'USD', 1, 'Flutterwave', '2004551', 'Payment Deposit', 'plus', '2021-04-03 03:13:22', '2021-04-03 03:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `fax` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `verification_link` text DEFAULT NULL,
  `email_verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `affilate_code` text DEFAULT NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text DEFAULT NULL,
  `owner_name` text DEFAULT NULL,
  `shop_number` text DEFAULT NULL,
  `shop_address` text DEFAULT NULL,
  `reg_number` text DEFAULT NULL,
  `shop_message` text DEFAULT NULL,
  `shop_details` text DEFAULT NULL,
  `shop_image` varchar(191) DEFAULT NULL,
  `f_url` text DEFAULT NULL,
  `g_url` text DEFAULT NULL,
  `t_url` text DEFAULT NULL,
  `l_url` text DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `balance` decimal(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `state`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`, `balance`) VALUES
(13, 'Vendor', '1557677677bouquet_PNG62.png', '1234', NULL, 'Algeria', 'UN', NULL, '3453453345453411', '23123121', 'vendor@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'JKf1fVEBd1lMqPf0plI4qCpCZFDFi0Nu519MbWpsd1joyHlGXUAMDymwr9Vo', '2018-03-07 18:05:44', '2023-05-24 18:10:29', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 5000, 'Test Stores', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'sdf', 'TEST DETAILS', '1579424193adv-banner.jpg', NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 5789.52, '2021-09-30', 0, 119.82),
(22, 'User', NULL, '1231', 'Test City', 'United States', 'UN', 'Test Address', '34534534534', '34534534534', 'user@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', '8FYJ8gkV2fN8SApzPo4XB3WqxRmiyReibzK79hiSCvQe3JJKt0BB1ejxHVdA', '2019-06-20 12:26:24', '2021-04-01 05:00:42', 0, 0, '1edae93935fba69d9542192fb854a80a', 'Yes', '8f09b9691613ecb8c3f7e36e34b97b80', 4953.290000000001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 127296.67),
(27, 'Test User', NULL, '1234', 'Test City', 'United Kingdom', 'UN', 'Space Needle 400 Broad St, Seattles', '34534534', '34534534', 'junajunnun@gmail.com', '$2y$10$pxNqceuvTvYLuwA.gZ15aejOTtXGHrDT7t2m8wfIZhNO1e52z7aLS', 'aS8LRQD0tB168exjfojY7o4K7D84AlFIcn7GbhOFm52ZyEmUHlTDHkyrVyh9', '2019-10-05 04:15:08', '2022-08-22 18:47:47', 0, 0, '0521bba4c819528b6a18a581a5842f17', 'Yes', 'bb9d23401cd70f11998fe36ea7677797', 0, 'Test Store', 'User', '01858989394', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'ds', '<br>', NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, '2019-11-24', 0, 10000.00),
(28, 'User', NULL, '1234', 'Test City', 'Algeria', 'UN', NULL, '34534534', '034534534', 'junnun@gmail.com', '$2y$10$YDfElg7O3K6eQK5enu.TBOyo.8TIr6Ynf9hFQ8dsIDeWAfmmg6hA.', 'pNFebTvEQ3jRaky9p7XnCetHs9aNFFG7nqRFho0U7nWrgT7phS6MoX8f9EYz', '2019-10-13 05:39:13', '2020-01-12 01:36:05', 0, 0, '8036978c6d71501e893ba7d3f3ecc15d', 'Yes', '33899bafa30292165430cb90b545728a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 9000.00),
(29, 'Md nayeem hossain', NULL, NULL, NULL, NULL, NULL, 'House:35/3/1', '01875952626', NULL, 'kutta7575@gmail.com', '$2y$10$dztMv/oHs8rOzgd0XaVXcuZYlRRX/RsCPMQjNfeIDbL3l4JqJuChq', NULL, '2022-04-21 10:58:55', '2022-04-21 10:58:55', 0, 0, '9a9567cbd282c4d3637b0c13c541a3f5', 'Yes', 'ed53710ddb24e164605f752aa9bd9fb1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(30, 'md', NULL, NULL, NULL, NULL, NULL, 'ui', '0000000000', NULL, 'user30@itnayeem.com.bd', '$2y$10$aMlx34FizT8vLna76dkivOqxBCAGUDPvjIopadYLOmQEr9Dt0uG4K', NULL, '2022-04-28 09:36:59', '2022-04-28 09:36:59', 0, 0, '5de4b9406f3d8106786399dc00b735ae', 'Yes', '88bee4776f24ca6c6cc0f745d69d2e02', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(31, 'TechLock Gps', NULL, NULL, NULL, NULL, NULL, 'gangail', '01705090630', NULL, 'techlockbd@gmail.com', '$2y$10$UlNuYBdBbeYCJx7N6.0fseVmiTq7rXQnpji1E3ci3Fq9yH2KcIUSW', NULL, '2022-08-17 17:03:49', '2022-08-17 17:05:53', 0, 0, '887b2abcba68b586f268d6a7f798fe59', 'Yes', 'c7b4af58a1cf04f1c3db5cfac69548c8', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(32, 'SAIFUL ISLAM', NULL, NULL, NULL, NULL, NULL, 'Nobinogor housing, Mohammadpur, Dhaka', '01829368764', NULL, 'namiramart@gmail.com', '$2y$10$e/l57mA8g1cpE0fbWRKhnOBlTUHP00VErZnwU0h6m5aBIljqTK9HS', NULL, '2022-08-19 13:34:48', '2022-08-19 13:34:48', 0, 0, 'd0ad7fd4af5bd4f7fde197b6e32a49b3', 'Yes', 'a44b673255423bd5e71d0181019f2ee3', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(33, 'vcvcv', NULL, NULL, NULL, NULL, NULL, 'xcxcx', '01950090011', NULL, 'didarcoxmedia0@gmail.com', '$2y$10$5cKDTggq9XpfhWH2vbNuReOilzqpBdsCMlfeDMDmv6T5jvQOo0NOW', NULL, '2022-09-04 17:53:40', '2022-09-04 17:56:34', 0, 0, '2d4a6815671dd823e4317a03c14394f2', 'Yes', '42e73afba794a4597d68bac905e2b88d', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(34, 'Suyel Haque', NULL, NULL, NULL, NULL, NULL, 'user34@itnayeem.com.bd', '+8801722597565', NULL, 'user34@itnayeem.com.bd', '$2y$10$9TG3RzIU4CvbMKoufZjG2eSpyhIsIlDlzvW4oqUiDF8vnoe/KhOKG', NULL, '2022-09-06 07:59:09', '2023-05-21 20:46:50', 0, 0, '663d35a690e14620b531a5ca11a5c4ab', 'Yes', 'cd0c6ea07ec6831e38d55d3eec754ff7', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(35, 'Md Akbar Ali', NULL, NULL, NULL, NULL, NULL, 'Palash', '01941118331', NULL, 'mdakbaralibd98@gmail.com', '$2y$10$Wzw9Rnc5E4dXYXwyk6VwgeQPvcYJU26A8/T8trhmQi/t9hU2O0Eay', NULL, '2022-09-06 15:02:32', '2022-11-27 16:01:21', 0, 0, 'eb58cc8362db9b188c3952cce087fd19', 'Yes', 'bb3cea000c750bc0ed98d694a89a5066', 0, 'xdgtdr', 'dfsdfg', 'fdsfsfs', 'gdghd', 'fsdfsdgd', 'dfsdgf', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(36, 'Md Minhazul Haque', NULL, NULL, NULL, NULL, NULL, 'mohadevpur', '01816985847', NULL, 'mmhminhaj532@gmail.com', '$2y$10$Y9Fhga1c05zhEZGyTKQNTOZI/VAfVYqWN3ePaH9PN4Tj3B7Xfpi8O', NULL, '2022-10-06 19:07:51', '2022-10-06 19:09:26', 0, 0, 'cbba284435abe0881b7d270687191dfe', 'Yes', 'f80a56daf25103076e089d339355663a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(37, 'Md Minhazul Haque', NULL, NULL, NULL, NULL, NULL, 'mohadevpur', '01816985847', NULL, 'mmhbdshop@gmail.com', '$2y$10$MX5ViDuu/TA.pxV5TfA5p.MEN3kiUS6mi6FhhgDpJPjdOVp4ftkWa', NULL, '2022-10-07 03:55:32', '2022-10-07 03:56:16', 0, 0, 'c6efe8785ffcbfebdc4820feb378cd7f', 'Yes', '6cdeef4c6e17202a58fe7b0b84f3d29d', 0, 'MMH BD Shop', 'Md Minhazul Haque', '1234567890', 'Mohadevpur', '1234567890', 'Demo', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2022-11-06', 0, 0.00),
(38, 'Md Akbar Ali', NULL, NULL, NULL, NULL, NULL, 'Palash', '01941118331', NULL, 'info@oninhost.com', '$2y$10$Ky.2j2DigYMFA7y2t/cOQuqKILGxvFuesTWJhNOvrFVcC6OI/Xouu', NULL, '2022-11-27 16:02:41', '2022-11-27 16:02:41', 0, 0, '1bbabda73feb7e221b5c3a78c35a2fb5', 'Yes', '8e883dcd9fd97fa9dc85ec4f8280ea07', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(39, 'Md Minhazul Haque', NULL, NULL, NULL, NULL, NULL, 'হক', '+8801731860006', NULL, 'onticbd@gmail.com', '$2y$10$AMGRB5SziKGTxTJ0Pwk0X.5R1WmCVuv6GtOylc0VVOIgZXgYGuuDa', NULL, '2022-12-27 06:42:49', '2022-12-27 06:42:49', 0, 0, 'baeb53f3d4c8bb8f1b04c92ccf9001d8', 'Yes', 'fab19c270ebf16a59128bc1d8cb7547a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(40, 'Md Abu Sayed', NULL, NULL, NULL, NULL, NULL, '35/3', '01778208785', NULL, 'user40@itnayeem.com.bd', '$2y$10$XuqU1IU8aCOJJSYzEzGcmuj0MSox/K8RsxFbE9U4UhMMlKTiZJmf6', NULL, '2023-04-02 22:21:21', '2023-04-02 22:21:21', 0, 0, '5524167019a14e5679c2a1a278f9ecea', 'Yes', 'a20ac60c2d22cc6b654268cb40e29a0f', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(41, 'rajan', NULL, NULL, NULL, NULL, NULL, 'Dhaka', '01911812221', NULL, 'sascorporationltd@gmail.com', '$2y$10$xDXgVa/ryIhx9CwbANkuVO6ofCrky3RHYmYl95A4kW.nyOVI/xDJK', NULL, '2023-04-08 23:47:49', '2023-04-08 23:50:13', 0, 0, '3f0886141727fa030fc59fa43283543e', 'Yes', '40c34344e26df8679b9148ac6fef46a2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(42, 'aaaaa', NULL, NULL, NULL, NULL, NULL, 'dh', '01842336325', NULL, 'aaa@email.cv', '$2y$10$WkVCE4L0AOAZ0TcpTwEOhe1fB2Ids6HG2/yf6f6MIk783wjJgR4Z.', NULL, '2023-05-14 10:50:14', '2023-05-14 11:06:14', 0, 0, '2d1286cdb0acc4884eeb93c49970c271', 'Yes', 'b94263608f49e9a6447c71b2f5df5f75', 0, 'aaaa', 'aa', '123', 'ad', 'q', 'hi', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2023-06-13', 0, 0.00),
(43, 'Jubair Bin Hossain', NULL, NULL, NULL, NULL, NULL, 'Mirpur-1,Dhaka-1216', '01771487674', NULL, 'shovonboss99@gmail.com', '$2y$10$tCIuv1ATtbs43qb6nwEEOOoOK54Hk.g7/BqVp/Uo3CB6euHbqEseS', NULL, '2023-05-18 22:46:46', '2023-05-18 22:48:34', 0, 0, '9f6395699f998ec4ea1552d0a4c95855', 'Yes', '430eabedce83b50e8dcdf4bed6878662', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(44, 'Sawonbhi', NULL, NULL, NULL, NULL, NULL, 'Ghhv', '01799234635', NULL, 'sawonbhi754@gmail.com', '$2y$10$5Pc0fNFdBJBXGaZlCKezMuBYa72E7frS7xFaOwlPSGf0GhN.jrKpm', NULL, '2023-05-24 18:08:17', '2023-05-24 18:12:05', 0, 0, '54239e4261a3fb2a31e0dcbcffaadeab', 'Yes', 'db3f310162be0d5bb10f898a9b5339d9', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(45, 'Md Abu Sayed', NULL, NULL, NULL, NULL, NULL, '35/3/1-B', '+8801775457008', NULL, 'user45@itnayeem.com.bd', '$2y$10$RLa2ycHrkmYgGn8ogG1eXOiQsbLsWlju7eQ78SI/xI8e.JrjIqc7G', NULL, '2023-06-18 15:49:55', '2023-06-18 15:49:55', 0, 0, '20788acea2e6dfa8991e18d2183adb7e', 'Yes', '7f28e60e4808b6037e99a43ae4efb5f0', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(46, 'Ramjan', NULL, NULL, NULL, NULL, NULL, 'Isakhali', '01710163353', NULL, 'maruf.kashful@gmail.com', '$2y$10$H/MUssMtx0VATuAx9ymm4egBTjLdKMaaO650rzPJrflxVFvz9Yeam', NULL, '2024-02-29 06:06:52', '2024-02-29 06:06:52', 0, 0, '790dac2090a65c1dcc68d8330f081ffd', 'Yes', '22df42b907c2ef3e884ac7315d353880', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(47, 'jamus fulatz', NULL, NULL, NULL, NULL, NULL, '723 3rd Ave', '01764545683', NULL, 'santobiswas257@gmail.com', '$2y$10$twlsGA2pBVEOWiWWP1l3B.UPrvkBNW.QSxBp2eT26Rsxs/9ATWWy2', NULL, '2024-11-09 08:20:55', '2024-11-09 08:20:55', 0, 0, '372acf05cde6e0bb294829aa8ebbe1f6', 'Yes', '698e1244bcf9ebb4afddb7475cf43147', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_number`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 13, 'i2kY1650989847', 0, '2022-04-26 16:17:27', '2022-04-26 16:17:27'),
(2, 13, 'A38C1651029832', 0, '2022-04-27 03:23:52', '2022-04-27 03:23:52'),
(3, 13, 'JNS21659374548', 0, '2022-08-01 21:22:29', '2022-08-01 21:22:29'),
(4, 13, '2kWo1660741553', 0, '2022-08-17 17:05:53', '2022-08-17 17:05:53'),
(5, 13, 'jYqx1662299794', 0, '2022-09-04 17:56:34', '2022-09-04 17:56:34'),
(6, 13, 'Zf6d1662436824', 0, '2022-09-06 08:00:24', '2022-09-06 08:00:24'),
(7, 13, 'KZqe1662461942', 0, '2022-09-06 14:59:02', '2022-09-06 14:59:02'),
(8, 13, 'NUrF1662462001', 0, '2022-09-06 15:00:01', '2022-09-06 15:00:01'),
(9, 13, 'NEN11662462086', 0, '2022-09-06 15:01:26', '2022-09-06 15:01:26'),
(10, 13, 'Y1BC1665028839', 0, '2022-10-06 04:00:39', '2022-10-06 04:00:39'),
(11, 13, 'Pj4B1665083366', 0, '2022-10-06 19:09:26', '2022-10-06 19:09:26'),
(12, 13, 'iWqi1669571358', 0, '2022-11-27 16:49:18', '2022-11-27 16:49:18'),
(13, 13, 'XAwV1680608797', 0, '2023-04-04 15:46:37', '2023-04-04 15:46:37'),
(14, 13, 'y4mG1680983413', 0, '2023-04-08 23:50:13', '2023-04-08 23:50:13'),
(15, 13, 'grmF1682064443', 0, '2023-04-21 12:07:23', '2023-04-21 12:07:23'),
(16, 13, 'hM981683088070', 0, '2023-05-03 08:27:51', '2023-05-03 08:27:51'),
(17, 13, 'VxYM1684435714', 0, '2023-05-18 22:48:34', '2023-05-18 22:48:34'),
(18, 13, 't77u1684687610', 0, '2023-05-21 20:46:50', '2023-05-21 20:46:50'),
(19, 13, 'e4l11684937429', 0, '2023-05-24 18:10:29', '2023-05-24 18:10:29'),
(20, 13, 'uidO1684937525', 0, '2023-05-24 18:12:06', '2023-05-24 18:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`, `method`, `txnid`, `charge_id`, `flutter_id`, `created_at`, `updated_at`, `status`, `payment_number`) VALUES
(81, 27, 5, 'Standard', '$', 'NGN', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Paystack', '688094995', NULL, NULL, '2019-10-09 21:32:57', '2023-05-14 10:55:29', 1, NULL),
(94, 13, 5, 'Standard', '$', 'USD', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Voguepay', 'demo-5e1d577004e90', NULL, NULL, '2020-01-13 23:54:30', '2023-05-14 10:55:29', 1, NULL),
(95, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Stripe', 'txn_1IbOJiJlIV5dN9n733iPl3bf', 'ch_1IbOJiJlIV5dN9n78XPjQP8R', NULL, '2021-04-01 05:04:02', '2021-04-01 05:04:02', 1, NULL),
(96, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_VqBFPF2bxJ', NULL, NULL, '2021-04-03 01:38:06', '2021-04-03 01:38:06', 1, NULL),
(97, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paytm', '20210403111212800110168189602520839', NULL, NULL, '2021-04-03 01:39:37', '2021-04-03 01:39:55', 1, NULL),
(98, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', NULL, NULL, 'UlIV1617435825', '2021-04-03 01:43:45', '2021-04-03 01:43:45', 0, NULL),
(99, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paytm', '20210403111212800110168732702510494', NULL, NULL, '2021-04-03 01:44:25', '2021-04-03 01:44:42', 1, NULL),
(100, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 01:45:06', '2021-04-03 01:45:06', 0, NULL),
(101, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 01:48:12', '2021-04-03 01:48:12', 0, NULL),
(102, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Voguepay', 'demo-606827e13aeaf', NULL, NULL, '2021-04-03 02:32:28', '2021-04-03 02:32:28', 1, NULL),
(103, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'SSLCommerz', 'SSLCZ_TXN_606828350cde1', NULL, NULL, '2021-04-03 02:32:53', '2021-04-03 02:32:57', 1, NULL),
(104, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', NULL, NULL, 'KbDW1617438797', '2021-04-03 02:33:17', '2021-04-03 02:33:17', 0, NULL),
(105, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 02:34:22', '2021-04-03 02:34:22', 0, NULL),
(106, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paytm', '20210403111212800110168460302504788', NULL, NULL, '2021-04-03 02:34:31', '2021-04-03 02:34:52', 1, NULL),
(107, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_Pab6mUeUA5', NULL, NULL, '2021-04-03 02:35:23', '2021-04-03 02:35:23', 1, NULL),
(108, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 02:38:34', '2021-04-03 02:38:34', 0, NULL),
(109, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', 'pay_GuNyDg4A1IBj6c', NULL, NULL, '2021-04-03 02:39:38', '2021-04-03 02:40:53', 1, NULL),
(110, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', NULL, NULL, 'OLtG1617439285', '2021-04-03 02:41:25', '2021-04-03 02:41:25', 0, NULL),
(111, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', '2004501', NULL, 'ywWX1617439390', '2021-04-03 02:43:10', '2021-04-03 02:44:26', 1, NULL),
(112, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paystack', '347943714', NULL, NULL, '2021-04-03 02:56:55', '2021-04-03 02:56:55', 1, NULL),
(113, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 02:57:21', '2021-04-03 02:57:21', 0, NULL),
(114, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Authorize.net', '40062045020', NULL, NULL, '2021-04-03 02:58:10', '2021-04-03 02:58:10', 1, NULL),
(115, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_6CDckPKnW8', NULL, NULL, '2021-04-03 02:59:35', '2021-04-03 02:59:35', 1, NULL),
(116, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', '2004554', NULL, 'LGnk1617441223', '2021-04-03 03:13:43', '2021-04-03 03:15:14', 1, NULL),
(117, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_N42VHc8WPr', NULL, NULL, '2021-04-03 03:16:13', '2021-04-03 03:16:13', 1, NULL),
(118, 35, 5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'SSLCommerz', 'SSLCZ_TXN_631728f4c445c', NULL, NULL, '2022-09-06 15:03:16', '2023-05-14 10:55:29', 0, NULL),
(119, 35, 5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'SSLCommerz', 'SSLCZ_TXN_6317290a9277a', NULL, NULL, '2022-09-06 15:03:38', '2023-05-14 10:55:29', 0, NULL),
(120, 35, 6, 'Premium', '৳', 'BDT', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'SSLCommerz', 'SSLCZ_TXN_6317291ad8e59', NULL, NULL, '2022-09-06 15:03:54', '2022-09-06 15:03:54', 0, NULL),
(121, 37, 8, 'Basic', '$', 'USD', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Free', NULL, NULL, NULL, '2022-10-07 03:56:16', '2023-05-14 11:03:07', 1, NULL),
(122, 42, 5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'SSLCommerz', 'SSLCZ_TXN_6460884005453', NULL, NULL, '2023-05-14 11:05:36', '2023-05-14 11:05:36', 0, NULL),
(123, 42, 8, 'Basic', '৳', 'BDT', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Free', NULL, NULL, NULL, '2023-05-14 11:06:14', '2023-05-14 11:06:14', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vendor_orders`
--

INSERT INTO `vendor_orders` (`id`, `user_id`, `order_id`, `qty`, `price`, `order_number`, `status`) VALUES
(1, 13, 1, 1, 320, 'i2kY1650989847', 'completed'),
(2, 13, 2, 1, 130, 'A38C1651029832', 'pending'),
(3, 13, 3, 1, 130, 'JNS21659374548', 'pending'),
(4, 13, 4, 1, 57.5, '2kWo1660741553', 'pending'),
(5, 13, 5, 1, 130, 'jYqx1662299794', 'pending'),
(6, 13, 6, 1, 110, 'Zf6d1662436824', 'pending'),
(7, 13, 7, 1, 130, 'KZqe1662461942', 'pending'),
(8, 13, 8, 1, 130, 'NUrF1662462001', 'pending'),
(9, 13, 9, 1, 320, 'NEN11662462086', 'pending'),
(10, 13, 10, 1, 130, 'Y1BC1665028839', 'pending'),
(11, 13, 11, 1, 57.5, 'Pj4B1665083366', 'pending'),
(12, 13, 12, 1, 130, 'iWqi1669571358', 'pending'),
(13, 13, 13, 1, 110, 'XAwV1680608797', 'pending'),
(14, 13, 14, 2, 260, 'y4mG1680983413', 'pending'),
(15, 13, 15, 1, 130, 'grmF1682064443', 'pending'),
(16, 13, 16, 1, 130, 'hM981683088070', 'pending'),
(17, 13, 17, 1, 89, 'VxYM1684435714', 'pending'),
(18, 13, 18, 1, 320, 't77u1684687610', 'pending'),
(19, 13, 19, 1, 57.5, 'e4l11684937429', 'pending'),
(20, 13, 20, 1, 130, 'uidO1684937525', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `attachments`, `status`, `text`, `admin_warning`, `warning_reason`, `created_at`, `updated_at`) VALUES
(4, 13, '1573723849Baby.tux-800x800.png,1573723849Baby.tux-800x800.png', 'Verified', 'TEst', 0, NULL, '2019-11-14 03:30:49', '2022-04-28 17:39:35'),
(5, 27, NULL, NULL, NULL, 1, 'Your phone number?', '2022-08-22 18:43:03', '2022-08-22 18:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_banners`
--
ALTER TABLE `featured_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_links`
--
ALTER TABLE `featured_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `featured_banners`
--
ALTER TABLE `featured_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `featured_links`
--
ALTER TABLE `featured_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1561;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
