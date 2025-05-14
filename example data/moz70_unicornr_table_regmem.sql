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
-- Table structure for table `moz70_unicornr_table_regmem`
--

CREATE TABLE `moz70_unicornr_table_regmem` (
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
  `memcode` varchar(255) NOT NULL DEFAULT '',
  `doapp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `docease` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `natureapp` varchar(255) NOT NULL DEFAULT '',
  `setorder` int(11) NOT NULL DEFAULT 0,
  `folio` varchar(255) NOT NULL DEFAULT '',
  `repcode` varchar(255) NOT NULL DEFAULT '',
  `occupation` varchar(255) NOT NULL DEFAULT '',
  `tnoshares` varchar(255) NOT NULL DEFAULT '',
  `percent` varchar(255) NOT NULL DEFAULT '',
  `tnosharesp` varchar(255) NOT NULL DEFAULT '',
  `percentp` varchar(255) NOT NULL DEFAULT '',
  `tnosharesk` varchar(255) NOT NULL DEFAULT '',
  `percentk` varchar(255) NOT NULL DEFAULT '',
  `trusttype` varchar(255) NOT NULL DEFAULT '',
  `memship` varchar(255) NOT NULL DEFAULT '',
  `amount` varchar(255) NOT NULL DEFAULT '',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_regmem`
--

INSERT INTO `moz70_unicornr_table_regmem` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `userid`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `clientcode`, `memcode`, `doapp`, `docease`, `natureapp`, `setorder`, `folio`, `repcode`, `occupation`, `tnoshares`, `percent`, `tnosharesp`, `percentp`, `tnosharesk`, `percentk`, `trusttype`, `memship`, `amount`, `datechg`) VALUES
(1, 1, 0, 5640, '2025-04-22 07:37:22', 0, 0, '', '', '', '', '', '', 'HE', 'A2504940', '2000-01-01 00:00:00', '2004-02-10 00:00:00', 'Appoint', 3, '3A', '', 'Merchant/Company Director', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HE', 'A01', '2000-01-01 00:00:00', '2004-02-10 00:00:00', 'Appoint', 4, '    4', '', 'Business Woman', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HE', 'TCP', '2005-01-27 00:00:00', '2007-05-23 00:00:00', 'Appoint', 10, '1', '', 'Company Director', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'ER', 'CPH', '1993-11-27 00:00:00', '0000-00-00 00:00:00', '', 1, '3', '', 'Company Director', '2020303', '97.12', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'ER', 'TFH', '1993-11-27 00:00:00', '0000-00-00 00:00:00', '', 2, '2', '', 'Company Director', '6060202', '75', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FCORP', 'CMF', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FCORP', 'LTK', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FCORP', 'LTLIONG', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 3, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FCORP', 'MKW', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 4, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'HCF', '1994-01-07 00:00:00', '0000-00-00 00:00:00', '', 1, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(11, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'LCH@LES', '1994-01-07 00:00:00', '0000-00-00 00:00:00', '', 2, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(12, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'LJK', '1994-01-07 00:00:00', '0000-00-00 00:00:00', '', 3, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(13, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'LCC', '1994-01-22 00:00:00', '0000-00-00 00:00:00', '', 4, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(14, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'LEL', '1994-01-22 00:00:00', '0000-00-00 00:00:00', '', 5, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(15, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'LET', '1994-01-22 00:00:00', '0000-00-00 00:00:00', '', 6, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(16, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'AA', '2001-03-04 00:00:00', '0000-00-00 00:00:00', 'Appoint', 5, '    0', '', '', '9996', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(17, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HCR', 'KWK', '1979-02-02 00:00:00', '0000-00-00 00:00:00', '', 2, '    0', '', '', '100000', '40', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(18, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HSAD', 'LCLI', '1988-09-29 00:00:00', '0000-00-00 00:00:00', '', 1, '    0', '', '', '1', '50', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(19, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HSAD', 'OSG', '1988-09-29 00:00:00', '0000-00-00 00:00:00', '', 2, '    0', '', '', '1', '50', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HSAD', 'TEK', '1988-09-29 00:00:00', '0000-00-00 00:00:00', '', 3, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(21, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HSAD', 'PSH', '1990-07-05 00:00:00', '0000-00-00 00:00:00', '', 4, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(22, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'CEM', '1994-02-15 00:00:00', '0000-00-00 00:00:00', '', 1, '3', '', 'Company Director', '2', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(23, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'HSL', '1994-02-15 00:00:00', '0000-00-00 00:00:00', '', 2, '    0', '', '', '2', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(24, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'OKG', '1994-02-15 00:00:00', '0000-00-00 00:00:00', '', 3, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00'),
(25, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'OKL', '1994-02-15 00:00:00', '1999-11-17 00:00:00', '', 4, '    0', '', '', '0', '0', '0', '0', '0', '0', '', '', '0', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_regmem`
--
ALTER TABLE `moz70_unicornr_table_regmem`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_regmem`
--
ALTER TABLE `moz70_unicornr_table_regmem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6744;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
