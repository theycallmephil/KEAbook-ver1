-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2018 at 04:36 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keabook`
--
CREATE DATABASE IF NOT EXISTS `keabook` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `keabook`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `countUsers` ()  SELECT COUNT(*) FROM users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getNumberOfUsers` ()  SELECT COUNT(*) AS numberOfUsers FROM users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserFromEmail` (IN `userEmail` VARCHAR(20))  NO SQL
SELECT name, last_name FROM users WHERE email = userEmail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsers` ()  SELECT * FROM users$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(140) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `message`, `date`) VALUES
(11, 1, 'asdfg', '2018-10-30 12:58:19'),
(12, 1, 'xxxx', '2018-10-30 12:58:27'),
(14, 1, 'testttt', '2018-10-30 15:53:16'),
(15, 1, 'hello', '2018-10-30 08:14:35'),
(16, 1, 'test', '2018-11-06 18:00:22'),
(17, 1, 'it works!', '2018-11-08 15:05:59'),
(18, 1, 'test2', '2018-11-03 21:06:44'),
(19, 1, 'Have a nice day', '2018-11-06 13:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `activation_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `active`, `activation_key`) VALUES
(1, 'aa', 'bb', 'aa@aa.com', 'abc123', 1, '$2y$10$dwlfsS/xhsIs4Og.94rsE.qLOC.BGko7w3IktVU005YfOU0TLadGW'),
(2, 'xx', 'yy', 'xx@yy.com', 'abc123', 1, '$2y$10$O9noSxOork.RO6uCZs6H.uW5AMkNzGqmkqlNmRm8Wzu1G/Y4RKFKe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `name` (`name`),
  ADD KEY `last_name` (`last_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
