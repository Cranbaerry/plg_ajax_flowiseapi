-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2025 at 03:40 PM
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
-- Table structure for table `moz70_unicornr_table_sharetp`
--

CREATE TABLE `moz70_unicornr_table_sharetp` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `userid` varchar(255) NOT NULL DEFAULT '',
  `custom_field1` varchar(255) NOT NULL DEFAULT '',
  `custom_field2` varchar(255) NOT NULL DEFAULT '',
  `custom_field3` varchar(255) NOT NULL DEFAULT '',
  `custom_field4` varchar(255) NOT NULL DEFAULT '',
  `custom_field5` varchar(255) NOT NULL DEFAULT '',
  `sharecls` varchar(255) NOT NULL DEFAULT '',
  `sharedesc` varchar(255) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 0,
  `inactive` varchar(255) NOT NULL DEFAULT '',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_sharetp`
--

INSERT INTO `moz70_unicornr_table_sharetp` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `userid`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `sharecls`, `sharedesc`, `category`, `inactive`, `datechg`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'ORDINARY', 'Ordinary shares', 2, 'FALSE', '0000-00-00 00:00:00'),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'PREFERENCE', 'Preference shares', 1, 'FALSE', '0000-00-00 00:00:00'),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'AAAA', '', '', '', '', '', 'OTHER KINDS', 'Other Kinds', 3, 'FALSE', '0000-00-00 00:00:00'),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'AAAA', '', '', '', '', '', 'ORDINARY1', 'Subscriber\'s Shares', 2, 'FALSE', '0000-00-00 00:00:00'),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'ORDINARY3', 'Ordinary Shares', 2, 'TRUE', '0000-00-00 00:00:00'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'ORDINARY NON-VOTING', 'Ordinary Non-Voting shares', 2, 'FALSE', '0000-00-00 00:00:00'),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '', '', '', '', '', 'CLASS B', 'Ordinary Shares', 2, 'FALSE', '0000-00-00 00:00:00'),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'TEH', '', '', '', '', '', 'CLASS B NON-VOTING', 'Ordinary Non-Voting Shares', 2, 'FALSE', '0000-00-00 00:00:00'),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'FARA', '', '', '', '', '', 'ORD-CLASS1', 'Ordinary Shares Class 1', 2, 'FALSE', '0000-00-00 00:00:00'),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'IKIN', '', '', '', '', '', 'CLASS A', 'Ordinary Shares', 2, 'FALSE', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_sharetp`
--
ALTER TABLE `moz70_unicornr_table_sharetp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_sharetp`
--
ALTER TABLE `moz70_unicornr_table_sharetp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
