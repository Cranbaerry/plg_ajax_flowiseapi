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
-- Table structure for table `moz70_unicornr_transaction_custom`
--

CREATE TABLE `moz70_unicornr_transaction_custom` (
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
  `fieldtype` varchar(255) NOT NULL,
  `fielddata` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_transaction_custom`
--

INSERT INTO `moz70_unicornr_transaction_custom` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `fieldtype`, `fielddata`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'transaction', 'AGM'),
(2, 1, 2, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'transaction', 'Resolution'),
(3, 1, 3, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Form Uploaded'),
(4, 1, 4, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Waiting All Sign Back Form To Upload'),
(5, 1, 5, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Pending All Sign Back Form To Be Uploaded'),
(6, 1, 6, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Waiting Return Form Upload'),
(7, 1, 7, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Return Form Uploaded'),
(8, 1, 8, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Waiting Register Book Upload'),
(9, 1, 9, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Register Book Uploaded'),
(10, 1, 10, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Waiting Minutes Book Upload'),
(11, 1, 11, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Minutes Book Uploaded'),
(12, 1, 12, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Sign Back Form Rejected'),
(13, 1, 13, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Sign Back Form Completed and Processing to SSM'),
(14, 1, 14, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Transaction Complete'),
(15, 1, 15, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', 'status', 'Complete but pending original signed copy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_transaction_custom`
--
ALTER TABLE `moz70_unicornr_transaction_custom`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_transaction_custom`
--
ALTER TABLE `moz70_unicornr_transaction_custom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
