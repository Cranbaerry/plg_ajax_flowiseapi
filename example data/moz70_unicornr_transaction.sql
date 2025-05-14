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
-- Table structure for table `moz70_unicornr_transaction`
--

CREATE TABLE `moz70_unicornr_transaction` (
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
  `custom_field11` varchar(255) NOT NULL DEFAULT '',
  `custom_field12` varchar(255) NOT NULL DEFAULT '',
  `custom_field13` varchar(255) NOT NULL DEFAULT '',
  `custom_field14` varchar(255) NOT NULL DEFAULT '',
  `custom_field15` varchar(255) NOT NULL DEFAULT '',
  `topic` varchar(255) NOT NULL,
  `transtype` text NOT NULL,
  `createddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assignedcompany` text NOT NULL,
  `assignedmember` text DEFAULT NULL,
  `doreminder` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `formupload` text NOT NULL,
  `signbackform` text NOT NULL,
  `returnform` text NOT NULL,
  `certifiedtruecopy` text NOT NULL,
  `minutesbook` text NOT NULL,
  `transstatus` text NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_transaction`
--

INSERT INTO `moz70_unicornr_transaction` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `custom_field11`, `custom_field12`, `custom_field13`, `custom_field14`, `custom_field15`, `topic`, `transtype`, `createddate`, `assignedcompany`, `assignedmember`, `doreminder`, `formupload`, `signbackform`, `returnform`, `certifiedtruecopy`, `minutesbook`, `transstatus`, `remark`) VALUES
(1, -2, 1, 0, '0000-00-00 00:00:00', 414, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AGM Transaction', '1', '2023-07-09 16:00:00', '3220/037', '850607-01-6537', '2023-07-09 16:00:00', '', '', '', '', '', '14', ''),
(2, -2, 2, 0, '0000-00-00 00:00:00', 414, 414, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AGM 2', '1', '2023-07-10 00:00:00', '000000000003466', '1451729-M', '0000-00-00 00:00:00', '[]', '[]', '[]', '[]', '[]', '', ''),
(4, -2, 3, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AGM Meeting', '1', '2023-07-23 16:00:00', '3220/037', '850607-01-6537', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(5, -2, 4, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AGM Meeting Test', '1', '2023-07-18 16:00:00', '3220/037', '850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(6, -2, 5, 0, '0000-00-00 00:00:00', 405, 414, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Testing', '2', '2023-08-02 16:00:00', '3220/037', '850607-01-6537', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(7, -2, 6, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Test 2', '2', '2023-08-02 16:00:00', '3220/037', '1342704-P,850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(8, -2, 7, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Test 3', '2', '2023-08-05 16:00:00', '3220/037', '1342704-P,850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', 'agmsample.pdf', '', '', '', '', '4', ''),
(9, -2, 8, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Test 3', '2', '2023-08-05 16:00:00', '3220/037', '1342704-P,850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', '', '', '', '', '', '3', ''),
(10, -2, 9, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Test 3', '2', '2023-08-05 16:00:00', '3220/037', '1342704-P,850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(11, -2, 10, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Test 4', '2', '2023-08-05 16:00:00', '3220/037', '850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', '', '', '', '', 'Razer---Payment----Plugin.pdf', '14', ''),
(12, -2, 11, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Unicornr', '2', '2023-08-15 16:00:00', '3220/037', '850607-01-6537,970203-01-5032', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(13, -2, 12, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Resolution Unicornr Test', '2', '2023-08-16 16:00:00', '3220/037', '930829-01-6188,850607-01-6537,970203-01-5032,E55975562', '0000-00-00 00:00:00', 'agmsample.pdf', '', '', '', '', '4', ''),
(14, -2, 13, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AUDITED REPORT', '2', '2023-09-05 16:00:00', '3210/012', '', '0000-00-00 00:00:00', '', '', '', '', 'DIY-ACCESSORIES---A--REPORT-2022.pdf', '11', ''),
(15, -2, 14, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AUDITED REPORT', '2', '2023-09-05 16:00:00', '000000000003405', '', '0000-00-00 00:00:00', '', '', '', '', '8090-SUPERSTORE--TELIPID--SDN-BHD---SIGN-PAGES.pdf', '11', ''),
(16, -2, 15, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AUDITED REPORT', '2', '2023-09-12 16:00:00', '000000000003529', '', '0000-00-00 00:00:00', '', '', '', '', 'Trial_20230919090737.pdf', '3', ''),
(17, -2, 16, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ANNUAL RETURN ', '2', '2023-09-26 16:00:00', '000000000003530', '751110-01-6431', '0000-00-00 00:00:00', 'KOI-MOBILIZE-SDN-BHD---COMPANY-PROFILE_20230927023415.pdf', '', '', '', '', '5', ''),
(18, -2, 17, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AUDITED REPORT', '1', '2023-10-02 16:00:00', '000000000003310', '850706-07-5399,840129-07-5073,681010-08-5789,701012-07-5483', '0000-00-00 00:00:00', '', '', '', '', '', '11', ''),
(19, -2, 18, 0, '0000-00-00 00:00:00', 405, 405, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Test', '2', '2023-10-02 16:00:00', '', '', '0000-00-00 00:00:00', '', '', '', '', '', '', ''),
(20, -2, 19, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ANNUAL RETURN ', '2', '2023-10-04 16:00:00', '000000000003522', '', '0000-00-00 00:00:00', '', '', '', '', 'YYDF-FENGSHUI-SDN--BHD----SECTION-17_20231005052743.pdf', '11', ''),
(21, -2, 20, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'APPROVAL OF ACCOUNT ', '2', '2023-10-05 16:00:00', 'ACN301201915399', '', '0000-00-00 00:00:00', '', '', '', '', '12--RESOLUTION-APPROVAL-ACC--10-09-2022_20231006104046.pdf', '11', ''),
(22, 1, 21, 0, '0000-00-00 00:00:00', 1167, 1167, '20231214090917', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'AUDITED REPORT 2022', '1', '2023-05-03 16:00:00', '3220/037', '930829-01-6188,850607-01-6537,LLP0007951-LGN,1342704-P,791115-01-6381,850419-13-5141,750624-05-5011,1423989-A,E55975562,900816-01-6229,780702-05-5023,950802-01-5343,1342898-T,1111840-H,970203-01-5032,910627-01-6413,880910-56-6358,870312-23-5669', '0000-00-00 00:00:00', '', '', '', '', '', '14', ''),
(23, 1, 22, 0, '0000-00-00 00:00:00', 1167, 1167, '20250319063917', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ANNUAL RETURN 2023', '2', '2023-07-13 16:00:00', '000000000003408', '890509-13-6427,880313-52-5974', '0000-00-00 00:00:00', 'RECEIPT-2023_20250319063917.pdf', '', '', '', '', '14', ''),
(24, 1, 23, 0, '0000-00-00 00:00:00', 1167, 1167, '20240816041618', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ANNUAL RETURN 2023', '2', '2023-09-28 16:00:00', '000000000003521', '821103-08-5077', '0000-00-00 00:00:00', '', '', '', '', '', '15', ''),
(25, 1, 24, 0, '0000-00-00 00:00:00', 1167, 1167, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ANNUAL RETURN 2022', '2', '2022-11-04 16:00:00', '000000000003359', '811201-10-5319,720604-01-5525', '0000-00-00 00:00:00', 'LABELZ-HOLDINGS---AR-2022_20231206033836.pdf', '', '', '', '', '14', ''),
(26, 1, 25, 0, '0000-00-00 00:00:00', 1167, 1167, '20231219030009', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ANNUAL RETURN 2023', '2', '2023-08-23 16:00:00', '000000000003471', '020418-14-0317,830501-05-5222', '0000-00-00 00:00:00', '1A-HOLDINGS-BERHAD---AR-2023-APPROVAL_20231219030009.pdf', '', '', '', '', '14', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_transaction`
--
ALTER TABLE `moz70_unicornr_transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_transaction`
--
ALTER TABLE `moz70_unicornr_transaction`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7513;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
