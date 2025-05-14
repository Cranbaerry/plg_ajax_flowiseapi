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
-- Table structure for table `moz70_unicornr_table_shares`
--

CREATE TABLE `moz70_unicornr_table_shares` (
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
  `clientcode` varchar(255) NOT NULL DEFAULT '',
  `memcode` varchar(255) NOT NULL DEFAULT '',
  `tranno` varchar(255) NOT NULL DEFAULT '',
  `trandate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trantype` varchar(255) NOT NULL DEFAULT '',
  `btype` varchar(255) NOT NULL DEFAULT '',
  `frcertno` varchar(255) NOT NULL DEFAULT '',
  `tocertno` varchar(255) NOT NULL DEFAULT '',
  `certno` varchar(255) NOT NULL DEFAULT '',
  `sharecls` varchar(255) NOT NULL DEFAULT '',
  `sharecat` varchar(255) NOT NULL DEFAULT '',
  `sharetype` varchar(255) NOT NULL DEFAULT '',
  `shareheld` varchar(255) NOT NULL DEFAULT '',
  `certtype` varchar(255) NOT NULL DEFAULT '',
  `noshare` varchar(255) NOT NULL DEFAULT '',
  `sharevalue` varchar(255) NOT NULL DEFAULT '',
  `paidvalue` varchar(255) NOT NULL DEFAULT '',
  `unpaid` varchar(255) NOT NULL DEFAULT '',
  `premium` varchar(255) NOT NULL DEFAULT '',
  `memjoin` varchar(255) NOT NULL DEFAULT '',
  `memexe` varchar(255) NOT NULL DEFAULT '',
  `amount` varchar(255) NOT NULL DEFAULT '',
  `lastamount` varchar(255) NOT NULL DEFAULT '',
  `docease` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ceasetype` varchar(255) NOT NULL DEFAULT '',
  `ceaseno` varchar(255) NOT NULL DEFAULT '',
  `posttype` varchar(255) NOT NULL DEFAULT '',
  `posted` varchar(255) NOT NULL DEFAULT '',
  `lsubdiv` varchar(255) NOT NULL DEFAULT '',
  `serialno` varchar(255) NOT NULL DEFAULT '',
  `remark` text NOT NULL,
  `eventcode` varchar(255) NOT NULL DEFAULT '',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_shares`
--

INSERT INTO `moz70_unicornr_table_shares` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `clientcode`, `memcode`, `tranno`, `trandate`, `trantype`, `btype`, `frcertno`, `tocertno`, `certno`, `sharecls`, `sharecat`, `sharetype`, `shareheld`, `certtype`, `noshare`, `sharevalue`, `paidvalue`, `unpaid`, `premium`, `memjoin`, `memexe`, `amount`, `lastamount`, `docease`, `ceasetype`, `ceaseno`, `posttype`, `posted`, `lsubdiv`, `serialno`, `remark`, `eventcode`, `datechg`, `userid`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'TCP', 'A1', '1980-08-27 00:00:00', 'A', '', '', '', 'C1', 'ORDINARY', '2', '2', '1', '1', '10', '1', '1', '0', '0', 'FALSE', 'FALSE', '1', '0', '2000-01-01 00:00:00', 'T', 'T001', 'R', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'TSTH', 'A1', '1980-08-27 00:00:00', 'A', '', '', '', 'C2', 'ORDINARY', '2', '2', '1', '2', '10', '1', '1', '0', '0', 'FALSE', 'FALSE', '1', '0', '2000-01-01 00:00:00', 'S', 'S001', 'R', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'TSTH', 'S001', '2000-01-01 00:00:00', 'S', '', 'C2', 'C013', 'C003', 'ORDINARY', '2', '2', '1', '1', '5', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '2005-01-27 00:00:00', 'T', 'T005', 'R', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'TSTH', 'S001', '2000-01-01 00:00:00', 'S', '', 'C2', 'C013', 'C004', 'ORDINARY', '2', '2', '1', '1', '5', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '2005-01-27 00:00:00', 'T', 'T005', 'R', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'A2504940', 'T001', '2000-01-01 00:00:00', 'T', '', 'C1', '', 'C005', 'ORDINARY', '2', '2', '1', '1', '5', '1', '1', '0', '0', 'FALSE', 'FALSE', '5', '5', '2004-02-10 00:00:00', 'T', 'T003', 'R', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'A01', 'T001', '2000-01-01 00:00:00', 'T', '', 'C1', '', 'C006', 'ORDINARY', '2', '2', '1', '1', '5', '1', '1', '0', '0', 'FALSE', 'FALSE', '23', '5', '2004-02-10 00:00:00', 'T', 'T003', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FCORP', 'MKW', 'A001', '1995-09-01 00:00:00', 'A', '', '', '', '004', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FCORP', 'LTL', 'A001', '1995-09-01 00:00:00', 'A', '', '', '', '003', 'ORDINARY', '2', '0', '0', '0', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FCORP', 'LTK', 'A001', '1995-09-01 00:00:00', 'A', '', '', '', '002', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FCORP', 'CMF', 'A001', '1995-09-01 00:00:00', 'A', '', '', '', '001', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(11, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LJK', 'A001', '1994-01-14 00:00:00', 'A', '', '', '', '001', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(12, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LCH@LES', 'A001', '1994-01-14 00:00:00', 'A', '', '', '', '002', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(13, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'HCF', 'A001', '1994-01-14 00:00:00', 'A', '', '', '', '003', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(14, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LCH@LES', 'A002', '1994-04-27 00:00:00', 'A', '', '', '', '004', 'ORDINARY', '2', '2', '1', '1', '39999', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(15, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LJK', 'A002', '1994-04-27 00:00:00', 'A', '', '', '', '005', 'ORDINARY', '2', '2', '1', '1', '9999', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(16, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'HCF', 'A002', '1994-04-27 00:00:00', 'A', '', '', '', '006', 'ORDINARY', '2', '2', '1', '1', '9999', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(17, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LET', 'A002', '1994-04-27 00:00:00', 'A', '', '', '', '007', 'ORDINARY', '2', '2', '1', '1', '10000', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(18, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LCC', 'A002', '1994-04-27 00:00:00', 'A', '', '', '', '009', 'ORDINARY', '2', '2', '1', '1', '20000', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(19, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'FE(J)', 'LEL', 'A002', '1994-04-27 00:00:00', 'A', '', '', '', '008', 'ORDINARY', '2', '2', '1', '1', '10000', '1', '1', '0', '0', 'FALSE', 'FALSE', '0', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HE', 'ACH', 'A005', '2007-06-19 00:00:00', 'A', '', '', 'C034', 'C030', 'ORDINARY', '2', '2', '1', '1', '10', '1', '1', '0', '0', 'FALSE', 'FALSE', '10', '10', '2007-11-05 00:00:00', 'T', 'T009', 'R', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(21, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'HT(M)', 'AA', 'A002', '2001-03-04 00:00:00', 'A', '', '', '', '005', 'ORDINARY', '2', '2', '1', '1', '9996', '0.1', '0.1', '0', '0', 'FALSE', 'FALSE', '999.6', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(22, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'ER', 'TFH', 'A002', '2000-02-13 00:00:00', 'A', '', '', '', '005', 'ORDINARY', '2', '2', '1', '1', '60000', '1', '1', '0', '0', 'FALSE', 'FALSE', '1', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(23, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'ER', 'CPH', 'A002', '2000-02-13 00:00:00', 'A', '', '', '', '006', 'ORDINARY', '2', '2', '1', '2', '20000', '1', '1', '0', '0', 'FALSE', 'FALSE', '1', '0', '2015-11-05 00:00:00', 'S', 'S001', 'P', 'FALSE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(24, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'ER', 'TFH', 'A002', '2000-02-13 00:00:00', 'A', '', '', '', '003', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '1', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0),
(25, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '0', '', '', '', '', 'ER', 'CPH', 'A002', '2000-02-13 00:00:00', 'A', '', '', '', '004', 'ORDINARY', '2', '2', '1', '1', '1', '1', '1', '0', '0', 'FALSE', 'FALSE', '1', '0', '0000-00-00 00:00:00', '', '', 'P', 'TRUE', 'FALSE', '', '', '', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_shares`
--
ALTER TABLE `moz70_unicornr_table_shares`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_shares`
--
ALTER TABLE `moz70_unicornr_table_shares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12286;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
