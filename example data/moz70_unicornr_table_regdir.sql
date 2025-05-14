-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2025 at 03:39 PM
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
-- Table structure for table `moz70_unicornr_table_regdir`
--

CREATE TABLE `moz70_unicornr_table_regdir` (
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
  `clientcode` varchar(255) NOT NULL DEFAULT '',
  `dircode` varchar(255) NOT NULL DEFAULT '',
  `doapp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `docease` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `natureapp` varchar(255) NOT NULL DEFAULT '',
  `setorder` int(11) NOT NULL DEFAULT 0,
  `alttodir` varchar(255) NOT NULL DEFAULT '',
  `kin` varchar(255) NOT NULL DEFAULT '',
  `docusign` varchar(255) NOT NULL DEFAULT '',
  `occupation` varchar(255) NOT NULL DEFAULT '',
  `nxtdoapp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `doremind` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_regdir`
--

INSERT INTO `moz70_unicornr_table_regdir` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `userid`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `clientcode`, `dircode`, `doapp`, `docease`, `natureapp`, `setorder`, `alttodir`, `kin`, `docusign`, `occupation`, `nxtdoapp`, `doremind`, `datechg`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/011', '650622-08-5227', '2012-07-02 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/011', '680616-07-5468', '2012-07-02 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Businesswoman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/035', '680609-02-5665', '2010-07-13 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/035', '730623-02-5330', '2010-07-13 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Businesswoman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'OCC', '', '', '', '', '', '3210/041', '570515-02-6379', '2004-04-25 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'OCC', '', '', '', '', '', '3210/041', '640813-02-5682', '2004-04-25 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'FARA', '', '', '', '', '', '3210/001', '531010-02-5053', '1995-08-08 00:00:00', '2019-11-22 00:00:00', 'Resignation', 1, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'MUN', '', '', '', '', '', '3210/001', '620815-02-5055', '1995-08-08 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/040', '750317-02-5349', '2011-08-04 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/040', '860213-02-5261', '2011-08-04 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'INTN', '', '', '', '', '', '3210/002', '541106-02-5049', '2006-09-20 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'INTN', '', '', '', '', '', '3210/002', '601002-02-5150', '2006-09-20 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'INTN', '', '', '', '', '', '3210/002', '880825-02-5121', '2006-12-28 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 3, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'FARA', '', '', '', '', '', '3210/003', '491021-02-5215', '2006-10-11 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'FARA', '', '', '', '', '', '3210/003', '810521-02-5743', '2006-10-11 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'FARA', '', '', '', '', '', '3210/003', '770616-02-5443', '2006-10-11 00:00:00', '2018-12-31 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 3, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SITI', '', '', '', '', '', '3210/034', '750915-02-5621', '2010-06-24 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SITI', '', '', '', '', '', '3210/034', '760429-02-5406', '2010-06-24 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 2, '', '', 'TRUE', 'Businesswoman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'OCC', '', '', '', '', '', '3210/004', '810521-02-5743', '2005-01-26 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'ZRL', '', '', '', '', '', '3210/004', '770616-02-5443', '2005-01-26 00:00:00', '2020-11-09 00:00:00', 'Resignation', 2, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'ZRL', '', '', '', '', '', '3210/004', '491021-02-5215', '2006-01-04 00:00:00', '2020-11-09 00:00:00', 'Resignation', 3, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/032', '610124-02-5057', '2009-08-26 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 1, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', '3210/032', '861212-02-5301', '2009-08-26 00:00:00', '2016-04-13 00:00:00', '', 2, '', '', 'TRUE', 'Company Director', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/032', '651019-02-5793', '2009-09-07 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 3, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '', '', '', '', '', '3210/032', '911206-02-5033', '2016-05-17 00:00:00', '0000-00-00 00:00:00', 'First Director Named Pursuant To Companies Act 2016', 4, '', '', 'TRUE', 'Businessman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_regdir`
--
ALTER TABLE `moz70_unicornr_table_regdir`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_regdir`
--
ALTER TABLE `moz70_unicornr_table_regdir`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1893;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
