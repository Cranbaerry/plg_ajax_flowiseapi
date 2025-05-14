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
-- Table structure for table `moz70_unicornr_table_allot`
--

CREATE TABLE `moz70_unicornr_table_allot` (
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
  `allotno` varchar(255) NOT NULL DEFAULT '',
  `doallot` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `posttype` varchar(255) NOT NULL DEFAULT '',
  `eventcode` varchar(255) NOT NULL DEFAULT '',
  `bdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bratio` varchar(255) NOT NULL DEFAULT '',
  `bpershare` varchar(255) NOT NULL DEFAULT '',
  `btype` varchar(255) NOT NULL DEFAULT '',
  `c11` varchar(255) NOT NULL DEFAULT '',
  `c12` varchar(255) NOT NULL DEFAULT '',
  `c13` varchar(255) NOT NULL DEFAULT '',
  `c2` varchar(255) NOT NULL DEFAULT '',
  `c21` varchar(255) NOT NULL DEFAULT '',
  `c22` varchar(255) NOT NULL DEFAULT '',
  `c3` varchar(255) NOT NULL DEFAULT '',
  `c31` varchar(255) NOT NULL DEFAULT '',
  `c32` varchar(255) NOT NULL DEFAULT '',
  `c4` varchar(255) NOT NULL DEFAULT '',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_allot`
--

INSERT INTO `moz70_unicornr_table_allot` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `userid`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `clientcode`, `allotno`, `doallot`, `posttype`, `eventcode`, `bdate`, `bratio`, `bpershare`, `btype`, `c11`, `c12`, `c13`, `c2`, `c21`, `c22`, `c3`, `c31`, `c32`, `c4`, `datechg`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'A002', '2001-03-04 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'A001', '1994-01-14 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FE(J)', 'A002', '1994-04-27 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FCORP', 'A001', '1995-09-01 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'ER', 'A002', '2000-02-13 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HZPF(M)', 'A001', '0000-00-00 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', '000000000000176', 'OPEN', '2008-01-04 00:00:00', 'R', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HT(M)', 'A001', '1994-02-21 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', '000000000000003', 'A001', '1999-07-26 00:00:00', 'R', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HCR', 'A001', '1994-01-01 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(11, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HSAD', 'A001', '1996-01-01 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(12, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HE', 'A1', '1980-08-27 00:00:00', 'R', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(13, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'HE', 'A002', '2003-06-04 00:00:00', 'R', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(14, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'AAAA', '', '', '', '', '', '000000000000003', 'A002', '1999-08-26 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(15, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', '000000000000001', 'A001', '1991-01-01 00:00:00', 'R', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(16, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'FAJ336', 'A001', '1995-04-10 00:00:00', 'R', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(17, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A001', '1997-02-17 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(18, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A002', '1997-09-16 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(19, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A003', '1997-10-14 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A004', '1997-11-15 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(21, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A005', '1998-04-15 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(22, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A006', '1998-09-09 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(23, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A007', '1998-11-12 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(24, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A008', '1998-12-16 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00'),
(25, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '', 'SEC/1522', 'A009', '1999-02-04 00:00:00', 'P', '', '0000-00-00 00:00:00', '0', '0', '', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_allot`
--
ALTER TABLE `moz70_unicornr_table_allot`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_allot`
--
ALTER TABLE `moz70_unicornr_table_allot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1936;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
