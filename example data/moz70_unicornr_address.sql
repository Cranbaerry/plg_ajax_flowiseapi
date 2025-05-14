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
-- Table structure for table `moz70_unicornr_address`
--

CREATE TABLE `moz70_unicornr_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `clientcode` varchar(255) NOT NULL DEFAULT '',
  `setorder` int(11) NOT NULL DEFAULT 0,
  `addrtype` varchar(255) NOT NULL DEFAULT '',
  `add1` longtext NOT NULL,
  `add2` longtext NOT NULL,
  `add3` longtext NOT NULL,
  `postcode` varchar(255) NOT NULL DEFAULT '',
  `town` varchar(255) NOT NULL DEFAULT '',
  `addstate` varchar(255) NOT NULL DEFAULT '',
  `countryid` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `webmail` varchar(255) NOT NULL DEFAULT '',
  `sameas` varchar(255) NOT NULL DEFAULT '',
  `doeff` date NOT NULL DEFAULT '0000-00-00',
  `docease` date NOT NULL DEFAULT '0000-00-00',
  `closure` varchar(255) NOT NULL DEFAULT '',
  `stime` varchar(255) NOT NULL DEFAULT '',
  `etime` varchar(255) NOT NULL DEFAULT '',
  `donotice` date NOT NULL DEFAULT '0000-00-00',
  `mustmember` varchar(255) NOT NULL DEFAULT '',
  `lresomem` varchar(255) NOT NULL DEFAULT '',
  `chgfrid` int(11) NOT NULL DEFAULT 0,
  `priority` varchar(255) NOT NULL DEFAULT '',
  `eventcode` varchar(255) NOT NULL DEFAULT '',
  `desc` longtext NOT NULL,
  `desc1` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_address`
--

INSERT INTO `moz70_unicornr_address` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `clientcode`, `setorder`, `addrtype`, `add1`, `add2`, `add3`, `postcode`, `town`, `addstate`, `countryid`, `tel`, `fax`, `email`, `webmail`, `sameas`, `doeff`, `docease`, `closure`, `stime`, `etime`, `donotice`, `mustmember`, `lresomem`, `chgfrid`, `priority`, `eventcode`, `desc`, `desc1`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'ER', 1, 'R', '32, Jalan Bukit Kempas 2/6', 'Taman Bukit Kempas,', '81200 Johor Bahru,', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'HCR', 1, 'R', 'Austin Centre Point', 'No. 01-15, Jalan Austin Perdana 2/22,', 'Taman Austin Perdana,', '81100', 'Johor Bahru', 'J', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'HT(M)', 1, 'R', 'Austin Centre Point', 'No. 01-15, Jalan Austin Perdana 2/22,', 'Taman Austin Perdana,', '81100', 'Johor Bahru', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'HE', 1, 'R', '16-01, Jalan Ros Merah 2/16', 'Taman Johor Jaya', '81100 Johor Bahru', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '000000000000001', 1, 'R', 'Austin Centre Point', 'No. 01-15, Jalan Austin Perdana 2/22', 'Taman Austin Perdana', '81200', 'Johor Bahru', 'J', 'MYS', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'TRUE', '', '', 'All registers, books, records and documents of the Company as required under Section 47(d) of the Companies Act 2016'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '000000000000177', 1, 'R', '7 & 7a Jalan Tangki Air, Larkin,', '80200 Johor Bahru, Johor', '', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '000000000000005', 1, 'R', '8b, Lorong 24,', 'Taman Patani Jaya,', '08000 Sungai Petani, Kedah', '', '', '', '', '', '', '', '', '3', '2006-07-06', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '000000000000178', 1, 'R', '7 & 7a Jalan Tangki Air, Larkin,', '80200 Johor Bahru, Johor', '', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '577', 1, 'R', '38d-2a, Jalan Radin Anum', 'Bandar Baru Seri Petaling', '57000 Kuala Lumpur.', '', '', '', '', '', '', '', '', '3', '2008-02-25', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', ''),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '000000000000091', 1, 'R', '53a(1st Floor), Lorong Perda Selatan 1', 'Bandar Perda', '', '14000', 'Bukit Mertajam', 'P', '', '', '', '', '', '3', '2005-11-21', '0000-00-00', 'FALSE', '', '', '0000-00-00', 'FALSE', 'FALSE', 0, 'FALSE', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_address`
--
ALTER TABLE `moz70_unicornr_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `moz70_unicornr_address_doeff` (`doeff`),
  ADD KEY `moz70_unicornr_address_docease` (`docease`),
  ADD KEY `moz70_unicornr_address_donotice` (`donotice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_address`
--
ALTER TABLE `moz70_unicornr_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5053;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
