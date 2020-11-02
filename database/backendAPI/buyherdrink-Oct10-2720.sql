-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2020 at 11:33 PM
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

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT 'Creator',
  `location_id` varchar(3000) DEFAULT NULL COMMENT 'Location ID from Google',
  `title` varchar(1000) NOT NULL COMMENT 'What Poster is seeking',
  `body` text COMMENT 'Long text of what user is looking for',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'created time of the request',
  `request_status` text NOT NULL COMMENT 'Status of the request(Pending, Active, Inactive, Accepted, Timed out, etc)',
  `place_location` varchar(500) DEFAULT NULL,
  `place_name` varchar(500) NOT NULL,
  `place_rating` int(11) NOT NULL,
  `place_photo` varchar(3000) NOT NULL,
  `place_icon` varchar(3000) NOT NULL,
  `place_service_type` varchar(300) NOT NULL,
  `town` varchar(500) NOT NULL COMMENT 'User town they are from?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Initial design for the Posts or Requests Table';

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `location_id`, `title`, `body`, `start_date`, `end_date`, `active`, `created_time`, `request_status`, `place_location`, `place_name`, `place_rating`, `place_photo`, `place_icon`, `place_service_type`, `town`) VALUES
(1, 1, NULL, 'I want a Cheeseburger', 'Blankitu', '2020-09-22 08:09:57', '2020-09-25 17:00:29', 1, '2020-09-27 00:20:21', 'I want something to Eat!', NULL, '', 0, '', '', '', ''),
(2, 8, NULL, 'Blank', 'Body Message', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:31:04', 'Pending', NULL, '', 0, '', '', '', ''),
(3, 8, NULL, 'Blank', 'Body Message', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:31:27', 'Pending', NULL, '', 0, '', '', '', ''),
(4, 8, NULL, 'dwad', 'dd', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:35:13', 'Pending', NULL, '', 0, '', '', '', ''),
(5, 8, NULL, 'Hello World', 'dad', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:37:30', 'Pending', NULL, '', 0, '', '', '', ''),
(6, 8, NULL, 'Blank', 'dd', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:43:49', 'Pending', NULL, '', 0, '', '', '', ''),
(7, 8, NULL, 'Blank', 'dd', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 1, '2020-09-27 02:44:01', 'Pending', NULL, '', 0, '', '', '', ''),
(8, 8, NULL, 'Blank', 'zs', '2020-09-26 00:00:00', '2020-09-26 00:00:00', 0, '2020-09-27 02:45:02', 'Pending', NULL, '', 0, '', '', '', ''),
(9, 1, NULL, 'Blank', 'Body Message', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 0, '2020-09-27 18:00:25', 'Pending', NULL, '', 0, '', '', '', ''),
(10, 1, NULL, 'Blank', 'Test', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 1, '2020-09-27 18:00:44', 'Pending', NULL, '', 0, '', '', '', ''),
(11, 1, NULL, 'Minker', 'I like to eat food', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 0, '2020-09-27 18:01:50', 'Pending', NULL, '', 0, '', '', '', ''),
(12, 1, NULL, 'Blank', 'I am a food money', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 1, '2020-09-27 18:02:14', 'Pending', NULL, '', 0, '', '', '', ''),
(13, 1, NULL, 'Blank', 'I am a food money', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 1, '2020-09-27 18:02:32', 'Pending', NULL, '', 0, '', '', '', ''),
(14, 1, NULL, 'Blank', 'I am a food money', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 1, '2020-09-27 18:03:15', 'Pending', NULL, '', 0, '', '', '', ''),
(15, 1, NULL, 'Blank', 'ad', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 0, '2020-09-27 18:03:26', 'Pending', NULL, '', 0, '', '', '', ''),
(16, 1, NULL, 'I want a food', 'I like to eat!', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 0, '2020-09-27 18:04:10', 'Pending', NULL, '', 0, '', '', '', ''),
(17, 9, NULL, 'Blank', 'Body Message', '2020-10-04 00:00:00', '2020-10-04 00:00:00', 0, '2020-10-04 18:24:50', 'Pending', NULL, '', 0, '', '', '', ''),
(18, 1, NULL, 'f1d', 'adawd', '2020-10-04 00:00:00', '2020-10-04 00:00:00', 0, '2020-10-05 03:10:29', 'Pending', NULL, '', 0, '', '', '', ''),
(19, 1, NULL, 'f1d', 'adawd', '2020-10-04 00:00:00', '2020-10-04 00:00:00', 1, '2020-10-05 03:10:54', 'Pending', NULL, '', 0, '', '', '', ''),
(20, 3, NULL, 'Posting Title One', 'Testing my braings', '2020-10-05 00:00:00', '2020-10-05 00:00:00', 1, '2020-10-05 17:36:10', 'Pending', NULL, '', 0, '', '', '', ''),
(21, 16, NULL, 'Blank', 'Body Message', '2020-10-19 00:00:00', '2020-10-19 00:00:00', 0, '2020-10-19 16:56:56', 'Pending', NULL, '', 0, '', '', '', ''),
(22, 1, 'Not Speced', 'Blank', 'Body Message', '2020-10-27 00:00:00', '2020-10-27 00:00:00', 0, '2020-10-27 22:54:41', 'Pending', 'Not Speced', 'Not Speced', 0, 'Not Speced', 'Not Speced', 'Not Speced', 'Not Speced'),
(23, 1, 'Not Speced', 'DrinkyBoy', 'Mixer', '2020-10-27 00:00:00', '2020-10-27 00:00:00', 0, '2020-10-27 23:18:17', 'Pending', 'Not Speced', 'Not Speced', 0, 'Not Speced', 'Not Speced', 'Not Speced', 'Not Speced'),
(24, 1, 'Not Speced', 'DrinkyBoy', 'Mixer', '2020-10-27 00:00:00', '2020-10-27 00:00:00', 0, '2020-10-27 23:18:46', 'Pending', 'Not Speced', 'Not Speced', 0, 'Not Speced', 'Not Speced', 'Not Speced', 'Not Speced'),
(25, 1, 'Not Speced', 'DrinkyBoy', 'Mixer', '2020-10-10 14:00:00', '2020-10-27 00:00:00', 0, '2020-10-27 23:18:58', 'Pending', 'Not Speced', 'Not Speced', 0, 'Not Speced', 'Not Speced', 'Not Speced', 'Not Speced'),
(26, 1, 'ddw', 'DrinkyBoy', 'Mixer', '2020-10-10 14:00:00', '2020-10-27 00:00:00', 0, '2020-10-27 23:23:26', 'Pending', 'Home', 'That hold by the river', 5, 'https://...', 'My place icon', 'My place', 'My Town'),
(27, 1, 'My Location ID', 'DrinkyBoy', 'Mixer', '2020-10-10 14:00:00', '2020-10-27 00:00:00', 0, '2020-10-27 23:24:50', 'Pending', 'My Place Location', 'My Place Name', 5, 'My Place Photo', 'My place icon', 'My place', 'My Town');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(80) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT 'Drink User',
  `email` varchar(80) NOT NULL DEFAULT 'Not Specified' COMMENT 'user email address',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT 'User stated',
  `phone` varchar(11) NOT NULL DEFAULT '5556669999' COMMENT 'User phone number',
  `sex_orientation` varchar(80) NOT NULL DEFAULT 'Not Specified' COMMENT 'user sexual orientation',
  `address` varchar(500) NOT NULL DEFAULT 'Not Specified' COMMENT 'User address',
  `interests` varchar(80) NOT NULL DEFAULT 'Not Specified' COMMENT 'User interested-in partner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Initial User Table';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`, `email`, `age`, `phone`, `sex_orientation`, `address`, `interests`) VALUES
(1, 'Test', 'test', 'Nano Bot king of games', '', 0, '0', '', '', ''),
(2, 'Test2', 'test', 'John Wayne', '', 0, '0', '', '', ''),
(3, 'Milk', 'test', 'Milky Way', '', 0, '0', '', '', ''),
(4, 'Milky', 'test', 'Drink User', '', 0, '0', '', '', ''),
(5, 'Tinkle', 'brownman', 'Drink User', '', 0, '0', '', '', ''),
(6, 'tinkles', 'dadwa', 'Drink User', '', 0, '0', '', '', ''),
(7, 'dads', 'dad', 'Drink User', '', 0, '0', '', '', ''),
(8, 'dad', 'dad', 'Drink User', '', 0, '0', '', '', ''),
(9, 'dandy', 'dandy', 'Drink User', '', 0, '0', '', '', ''),
(10, 'ss', 'ss', 'Drink User', '', 0, '0', '', '', ''),
(11, 'fff', 'f', 'Milking The Names', 'Not specified', 0, '0', 'Not specified', 'Not specified', 'Not specified'),
(12, 'F', 'f', 'Drink User', 'fadw', 64, '1234567788', '', '', ''),
(13, 'dd', 'd', 'Drink User', 'd', 2, '2', '', 'Not Specified', ''),
(14, 'd', 'd', 'Drink User', 'Not Specified', 0, '0', 'Not Specified', 'Not Specified', 'Not Specified'),
(15, 's', 's', 'John Rockman', 'Not Specified', 0, '0', 'None', '123 Main Street', 'Both'),
(16, 'ddd', 'd', 'Drink User', 'Not Specified', 0, 'r3wwr', 'Not Specified', 'Not Specified', 'Not Specifiedrr');

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
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
