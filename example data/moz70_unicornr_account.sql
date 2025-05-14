-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2025 at 03:37 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demosyscos_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `moz70_unicornr_account`
--

CREATE TABLE `moz70_unicornr_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `custom_field1` varchar(255) NOT NULL DEFAULT '',
  `custom_field2` varchar(255) NOT NULL DEFAULT '',
  `custom_field3` varchar(255) NOT NULL DEFAULT '',
  `custom_field4` varchar(255) NOT NULL DEFAULT '',
  `custom_field5` varchar(255) NOT NULL DEFAULT '',
  `custom_field6` varchar(255) NOT NULL DEFAULT '',
  `custom_field7` varchar(255) NOT NULL DEFAULT '',
  `custom_field8` varchar(255) NOT NULL DEFAULT '',
  `custom_field9` varchar(255) NOT NULL DEFAULT '',
  `custom_field10` varchar(255) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL,
  `access_company` text NOT NULL,
  `access_time_from` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_time_to` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_account`
--

INSERT INTO `moz70_unicornr_account` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `user`, `access_company`, `access_time_from`, `access_time_to`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', 417, '3220/037,000000000003405', '2023-07-31 16:00:00', '2023-08-23 16:00:00'),
(2, 1, 2, 405, '2024-04-29 04:58:42', 405, 405, '', '', '', '', '', '', '', '', '', '', 3975, '3220/037,3220/010', '2024-03-31 16:00:00', '0000-00-00 00:00:00'),
(3, 1, 3, 0, '0000-00-00 00:00:00', 405, 1167, '', '', '', '', '', '', '', '', '', '', 1205, '000000000003357', '2025-02-03 16:00:00', '2025-02-10 16:00:00'),
(4, -2, 4, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1206, '000000000003295,000000000003243,000000000003301', '2024-02-04 16:00:00', '2024-03-04 16:00:00'),
(5, -2, 5, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1209, '000000000003439', '2024-03-10 16:00:00', '2024-03-17 16:00:00'),
(6, 1, 6, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1207, '000000000003423,000000000003433', '2025-02-05 16:00:00', '2025-02-12 16:00:00'),
(7, 1, 7, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1227, '000000000003363', '2024-03-13 16:00:00', '2024-03-20 16:00:00'),
(8, -2, 8, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1210, '000000000003618', '2024-03-13 16:00:00', '2024-03-27 16:00:00'),
(9, -2, 9, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1206, '000000000003301', '2024-03-14 16:00:00', '2024-03-21 16:00:00'),
(10, -2, 10, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', 1206, '000000000003301', '2024-03-14 16:00:00', '2024-03-21 16:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_account`
--
ALTER TABLE `moz70_unicornr_account`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_account`
--
ALTER TABLE `moz70_unicornr_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
