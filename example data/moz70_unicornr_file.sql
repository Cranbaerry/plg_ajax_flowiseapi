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
-- Table structure for table `moz70_unicornr_file`
--

CREATE TABLE `moz70_unicornr_file` (
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
  `filename` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_year` varchar(255) NOT NULL DEFAULT '',
  `filetype` varchar(255) DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_file`
--

INSERT INTO `moz70_unicornr_file` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `filename`, `created_date`, `created_year`, `filetype`, `transaction_id`, `form_type`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '405', 'Form Uploaded', '', '', '', 'sample.pdf', '2023-07-20 00:00:00', '2023', 'application/pdf', '1', 'formupload'),
(2, 1, 0, 0, '0000-00-00 00:00:00', 405, 405, '414', 'Sign Back Form Rejected', 'Did not follow the request to select the tasks', '', '', 'sample.pdf', '2023-07-19 16:00:00', '2023', 'application/pdf', '1', 'signbackform'),
(3, 1, 0, 0, '0000-00-00 00:00:00', 405, 405, '414', 'Sign Back Form Rejected', 'Using the wrong image format', '', '', 'sample.pdf', '2023-07-19 16:00:00', '2023', 'application/pdf', '1', 'signbackform'),
(4, 1, 0, 0, '0000-00-00 00:00:00', 405, 405, '414', 'Sign Back Form Rejected', 'Did not sign the form', '', '', 'sample.pdf', '2023-07-20 16:00:00', '2023', 'application/pdf', '1', 'signbackform'),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '414', 'Sign Back Form Approved', '', '', '', 'sample.pdf', '2023-07-21 00:00:00', '2023', 'application/pdf', '1', 'signbackform'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '405', 'Return Form Uploaded', '', '', '', 'sample.pdf', '2023-07-21 00:00:00', '2023', 'application/pdf', '1', 'returnform'),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '405', 'Certified True Copy Uploaded', '', '', '', 'sample.pdf', '2023-07-21 00:00:00', '2023', 'application/pdf', '1', 'certifiedtruecopy'),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '405', 'Minute Book Uploaded', '', '', '', 'sample.pdf', '2023-07-21 00:00:00', '2023', 'application/pdf', '1', 'minutesbook'),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '405', 'Form Uploaded', '', '', '', 'agmsample.pdf', '2023-07-24 00:00:00', '2023', 'application/pdf', '4', 'formupload'),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '414', 'Sign Back Form Rejected', 'Form fill incorrectly', '', '', 'agmsample.pdf', '2023-07-24 00:00:00', '2023', 'application/pdf', '4', 'signbackform');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_file`
--
ALTER TABLE `moz70_unicornr_file`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_file`
--
ALTER TABLE `moz70_unicornr_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20973;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
