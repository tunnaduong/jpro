-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2022 at 01:34 PM
-- Server version: 10.3.30-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jpro_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(4) NOT NULL,
  `name` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `avatar` varchar(999) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(1) NOT NULL COMMENT '0=user, 1=admin',
  `verified` int(1) NOT NULL COMMENT '0=not verified, 1=verified',
  `verification_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `username`, `password`, `email`, `created_time`, `avatar`, `role`, `verified`, `verification_code`) VALUES
(1, 'Admin', 'admin', 'jpro2022', 'example@gmail.com', '2022-03-16 15:08:57', '/static/images/default_pic.jpg', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(4) NOT NULL,
  `title` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(4) NOT NULL,
  `show_likes` int(1) NOT NULL COMMENT '0=no, 1=yes',
  `comments_limit` int(1) NOT NULL COMMENT '0=no, 1=yes',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `cover_image` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `tag`, `category_id`, `show_likes`, `comments_limit`, `content`, `cover_image`, `created_time`) VALUES
(1, 'Xin chào, testing 123...', 'hello,world,test', 101, 1, 0, 'Mai Chau district has a total population of 55.663 people whilst 50% are women. There are 5 majoritty ethnic in Mai Chau including 73,3% Thai Ethnic, 17,33% Muong Ethnic, 11,96 Kinh Ethnic, 9,83 % Mong Ethnic, 3.58 % Giao Ethnic. Mai Chau is divided into 22 villages with the percent of poor households take 21,14%( households with income of average 30$ per month). Average population of Mai Chau is 35 years ', '/static/images/japan_mountain.png', '2022-03-16 15:42:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(4) NOT NULL,
  `name` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `total_posts` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `total_posts`) VALUES
(101, 'Tiếng Nhật', 'Các bài viết về Tiếng Nhật trên JPro', 1),
(102, 'Lập trình', 'Các bài viết về lập trình trên JPro', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tech_talk_events`
--

CREATE TABLE `tech_talk_events` (
  `id` int(4) NOT NULL,
  `name` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` varchar(9999) COLLATE utf8_unicode_ci NOT NULL,
  `is_online` int(1) NOT NULL COMMENT '0=no, 1=yes',
  `created_by` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `total_users_joined` int(4) NOT NULL,
  `hosting_place` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(99) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tech_talk_events`
--

INSERT INTO `tech_talk_events` (`id`, `name`, `deadline`, `created_time`, `description`, `is_online`, `created_by`, `total_users_joined`, `hosting_place`, `host`) VALUES
(1, 'Buổi bảo vệ đầu tiên', '2022-04-11', '2022-03-16 15:54:07', 'Sau khoảng thời gian làm việc vui vẻ cùng nhau. Hôm nay, Team 1 chính thức bắt đầu buổi bảo vệ của mình. Mong rằng Team 1 sẽ hoàn thành thật tốt buổi bảo vệ của mình...', 1, 'admin', 1, 'Zoom', 'Lê Thanh Bình');

-- --------------------------------------------------------

--
-- Table structure for table `tech_talk_event_participants`
--

CREATE TABLE `tech_talk_event_participants` (
  `id` int(4) NOT NULL,
  `username` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `tech_talk_event_id` int(4) NOT NULL,
  `time_of_subscribe` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL COMMENT '0=cannot participate, 1=may join, 2=will join'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tech_talk_events`
--
ALTER TABLE `tech_talk_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tech_talk_event_participants`
--
ALTER TABLE `tech_talk_event_participants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tech_talk_events`
--
ALTER TABLE `tech_talk_events`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tech_talk_event_participants`
--
ALTER TABLE `tech_talk_event_participants`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
