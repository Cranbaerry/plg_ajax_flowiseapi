-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2025 at 03:38 PM
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
-- Table structure for table `moz70_unicornr_history_logs`
--

CREATE TABLE `moz70_unicornr_history_logs` (
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
  `logdata` varchar(255) NOT NULL DEFAULT '',
  `createdby` int(11) NOT NULL DEFAULT 0,
  `createddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_history_logs`
--

INSERT INTO `moz70_unicornr_history_logs` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `logdata`, `createdby`, `createddate`) VALUES
(1, -2, 0, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'Super User Has Uploaded Minute Book [sample.pdf] in transaction - (AGM Transaction)', 405, '2023-07-21 16:00:00'),
(2, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Chiew Lerk Chern Has downloaded the Minutes Book [sample.pdf] in transaction - (AGM Transaction)', 414, '2023-07-21 22:19:00'),
(8, -2, 0, 0, '0000-00-00 00:00:00', 405, 405, '68.78', '3220/037', '', '', '', 'Chiew Lerk Chern Has Updated the Upcoming Share Price of [DREAMZTECH (M) BERHAD] - 68.78', 414, '2023-07-23 16:00:00'),
(9, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '66.66', '3220/037', '', '', '', '', 414, '2023-07-23 23:29:17'),
(10, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '200', '000000000003530', '', '', '', '', 405, '2023-07-24 15:13:09'),
(11, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '400', '000000000003530', '', '', '', '', 405, '2023-07-24 15:14:53'),
(12, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has Uploaded Form Upload [agmsample.pdf] in transaction - (AGM Meeting)', 405, '2023-07-24 17:55:13'),
(13, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Chiew Lerk Chern Has Uploaded Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting)', 414, '2023-07-24 18:12:36'),
(14, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has Uploaded Form Upload [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-25 14:00:02'),
(15, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Chiew Lerk Chern Has downloaded the upload form [agmsample.pdf] in transaction - (AGM Meeting Test)', 414, '2023-07-25 15:13:15'),
(16, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Chiew Lerk Chern Has Uploaded Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 414, '2023-07-25 15:13:56'),
(17, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Chiew Lerk Chern Has Uploaded Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 414, '2023-07-25 15:19:52'),
(18, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Chiew Hui Lian Has Uploaded Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 416, '2023-07-25 15:21:28'),
(19, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has Uploaded Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-25 15:25:33'),
(20, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has proceed transaction - (AGM Meeting Test) to Proceed to SSM for Processing', 405, '2023-07-25 15:34:38'),
(21, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has Uploaded Return Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-25 15:35:22'),
(22, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has Uploaded Minute Book [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-25 15:40:08'),
(23, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Return Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:19:35'),
(24, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Return Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:23:59'),
(25, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:26:07'),
(26, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:26:07'),
(27, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:26:07'),
(28, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:28:50'),
(29, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 'Super User Has downloaded the Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:31:36'),
(30, -2, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', 'DREAMZTECH (M) BERHAD', '', 'Super User Has downloaded the Sign Back Form [agmsample.pdf] in transaction - (AGM Meeting Test)', 405, '2023-07-26 20:32:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_history_logs`
--
ALTER TABLE `moz70_unicornr_history_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_history_logs`
--
ALTER TABLE `moz70_unicornr_history_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57572;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
