-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2020 at 04:26 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buyherdrink`
--
CREATE DATABASE IF NOT EXISTS `buyherdrink` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `buyherdrink`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT 'Creator',
  `location_id` bigint(20) DEFAULT NULL COMMENT 'FK to Locations',
  `title` varchar(1000) NOT NULL COMMENT 'What Poster is seeking',
  `body` text COMMENT 'Long text of what user is looking for',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'created time of the request',
  `request_status` text NOT NULL COMMENT 'Status of the request(Pending, Active, Inactive, Accepted, Timed out, etc)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Initial design for the Posts or Requests Table';

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `location_id`, `title`, `body`, `start_date`, `end_date`, `active`, `created_time`, `request_status`) VALUES
(1, 1, NULL, 'I want a Cheeseburger', NULL, '2020-09-22 08:09:57', '2020-09-25 17:00:29', 0, '2020-09-27 00:20:21', 'I want something to Eat!'),
(2, 8, NULL, 'Blank', 'Body Message', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:31:04', 'Pending'),
(3, 8, NULL, 'Blank', 'Body Message', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:31:27', 'Pending'),
(4, 8, NULL, 'dwad', 'dd', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:35:13', 'Pending'),
(5, 8, NULL, 'Hello World', 'dad', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:37:30', 'Pending'),
(6, 8, NULL, 'Blank', 'dd', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:43:49', 'Pending'),
(7, 8, NULL, 'Blank', 'dd', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 1, '2020-09-27 02:44:01', 'Pending'),
(8, 8, NULL, 'Blank', 'zs', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:45:02', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(80) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT 'Drink User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Initial User Table';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`) VALUES
(1, 'Test', 'test', 'Drink User'),
(2, 'Test2', 'test', 'John Wayne'),
(3, 'Milk', 'test', 'mocha'),
(4, 'Milky', 'test', 'Drink User'),
(5, 'Tinkle', 'brownman', 'Drink User'),
(6, 'tinkles', 'dadwa', 'Drink User'),
(7, 'dads', 'dad', 'Drink User'),
(8, 'dad', 'dad', 'Drink User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
