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
-- Table structure for table `moz70_unicornr_table_clientdata`
--

CREATE TABLE `moz70_unicornr_table_clientdata` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `custom_field1` varchar(155) NOT NULL DEFAULT '',
  `custom_field2` varchar(155) NOT NULL DEFAULT '',
  `custom_field3` varchar(155) NOT NULL DEFAULT '',
  `custom_field4` varchar(155) NOT NULL DEFAULT '',
  `custom_field5` varchar(155) NOT NULL DEFAULT '',
  `clientcode` varchar(155) NOT NULL DEFAULT '',
  `refno` varchar(155) NOT NULL DEFAULT '',
  `name` varchar(155) NOT NULL DEFAULT '',
  `comno` varchar(155) NOT NULL DEFAULT '',
  `comno_old` varchar(155) NOT NULL DEFAULT '',
  `gstno` varchar(155) NOT NULL DEFAULT '',
  `doformer` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `formername` varchar(155) NOT NULL DEFAULT '',
  `doi` varchar(155) NOT NULL DEFAULT '',
  `countryi` varchar(255) DEFAULT NULL,
  `curr` varchar(255) DEFAULT NULL,
  `capital` int(11) DEFAULT NULL,
  `capitalp` int(11) DEFAULT NULL,
  `capitalk` int(11) DEFAULT NULL,
  `parvalue` int(11) DEFAULT NULL,
  `paidcapc` varchar(155) NOT NULL DEFAULT '',
  `paidcapn` varchar(155) NOT NULL DEFAULT '',
  `paidcap` varchar(155) NOT NULL DEFAULT '',
  `paidcapp` varchar(155) NOT NULL DEFAULT '',
  `paidcapk` varchar(155) NOT NULL DEFAULT '',
  `sharesc` varchar(155) NOT NULL DEFAULT '',
  `sharesn` varchar(155) NOT NULL DEFAULT '',
  `shareso` varchar(155) NOT NULL DEFAULT '',
  `sharesp` varchar(155) NOT NULL DEFAULT '',
  `sharesk` varchar(155) NOT NULL DEFAULT '',
  `lcallup` varchar(155) NOT NULL DEFAULT '',
  `callupo` varchar(155) NOT NULL DEFAULT '',
  `callupp` varchar(155) NOT NULL DEFAULT '',
  `callupk` varchar(155) NOT NULL DEFAULT '',
  `status` varchar(155) NOT NULL DEFAULT '',
  `taxagent` varchar(155) NOT NULL DEFAULT '',
  `auditor` varchar(155) NOT NULL DEFAULT '',
  `yearend` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accdead` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastagm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastar` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastac` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agmdead` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lallotno` varchar(155) NOT NULL DEFAULT '',
  `ltranno` varchar(155) NOT NULL DEFAULT '',
  `lcertno` varchar(155) NOT NULL DEFAULT '',
  `lsplitno` varchar(155) NOT NULL DEFAULT '',
  `llostno` varchar(155) NOT NULL DEFAULT '',
  `lconno` varchar(155) NOT NULL DEFAULT '',
  `lresono` varchar(155) NOT NULL DEFAULT '',
  `ldivno` varchar(155) NOT NULL DEFAULT '',
  `lredeemno` varchar(155) NOT NULL DEFAULT '',
  `lsubdivno` varchar(155) NOT NULL DEFAULT '',
  `workday` varchar(155) NOT NULL DEFAULT '',
  `workhour` varchar(155) NOT NULL DEFAULT '',
  `contact` varchar(155) NOT NULL DEFAULT '',
  `tel` varchar(155) NOT NULL DEFAULT '',
  `fax` varchar(155) NOT NULL DEFAULT '',
  `email` varchar(155) NOT NULL DEFAULT '',
  `comptype` varchar(155) NOT NULL DEFAULT '',
  `compstatus` varchar(155) NOT NULL DEFAULT '',
  `compseal` varchar(155) NOT NULL DEFAULT '',
  `doapp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `docease` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dolisted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dosubmit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `doroclet` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dorocnoti` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dorocnoti4` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dogaz` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dowstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dowfinal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dissolved` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comphold` varchar(155) NOT NULL DEFAULT '',
  `repcode` varchar(155) NOT NULL DEFAULT '',
  `compgroup` varchar(155) NOT NULL DEFAULT '',
  `compattrib` varchar(155) NOT NULL DEFAULT '',
  `compfee` varchar(155) NOT NULL DEFAULT '',
  `feetype` varchar(155) NOT NULL DEFAULT '',
  `bill_day` varchar(155) NOT NULL DEFAULT '',
  `bill_mth` varchar(155) NOT NULL DEFAULT '',
  `accno` varchar(155) NOT NULL DEFAULT '',
  `buscode1` varchar(155) NOT NULL DEFAULT '',
  `buscode2` varchar(155) NOT NULL DEFAULT '',
  `buscode3` varchar(155) NOT NULL DEFAULT '',
  `com` varchar(155) NOT NULL DEFAULT '',
  `cob` varchar(155) NOT NULL DEFAULT '',
  `dirsign` varchar(155) NOT NULL DEFAULT '',
  `mdirector` varchar(155) NOT NULL DEFAULT '',
  `seccode` varchar(155) NOT NULL DEFAULT '',
  `sharecert` varchar(155) NOT NULL DEFAULT '',
  `doapprove` varchar(155) NOT NULL DEFAULT '',
  `approvalno` varchar(155) NOT NULL DEFAULT '',
  `roccode` varchar(155) NOT NULL DEFAULT '',
  `lodger` varchar(155) NOT NULL DEFAULT '',
  `feecode` varchar(155) NOT NULL DEFAULT '',
  `jurisdict` varchar(155) NOT NULL DEFAULT '',
  `chqno` varchar(155) NOT NULL DEFAULT '',
  `posttype` varchar(155) NOT NULL DEFAULT '',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_clientdata`
--

INSERT INTO `moz70_unicornr_table_clientdata` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `clientcode`, `refno`, `name`, `comno`, `comno_old`, `gstno`, `doformer`, `formername`, `doi`, `countryi`, `curr`, `capital`, `capitalp`, `capitalk`, `parvalue`, `paidcapc`, `paidcapn`, `paidcap`, `paidcapp`, `paidcapk`, `sharesc`, `sharesn`, `shareso`, `sharesp`, `sharesk`, `lcallup`, `callupo`, `callupp`, `callupk`, `status`, `taxagent`, `auditor`, `yearend`, `accdead`, `lastagm`, `lastar`, `lastac`, `agmdead`, `lallotno`, `ltranno`, `lcertno`, `lsplitno`, `llostno`, `lconno`, `lresono`, `ldivno`, `lredeemno`, `lsubdivno`, `workday`, `workhour`, `contact`, `tel`, `fax`, `email`, `comptype`, `compstatus`, `compseal`, `doapp`, `docease`, `dolisted`, `dosubmit`, `doroclet`, `dorocnoti`, `dorocnoti4`, `dogaz`, `dowstart`, `dowfinal`, `dissolved`, `comphold`, `repcode`, `compgroup`, `compattrib`, `compfee`, `feetype`, `bill_day`, `bill_mth`, `accno`, `buscode1`, `buscode2`, `buscode3`, `com`, `cob`, `dirsign`, `mdirector`, `seccode`, `sharecert`, `doapprove`, `approvalno`, `roccode`, `lodger`, `feecode`, `jurisdict`, `chqno`, `posttype`, `datechg`, `userid`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/011', '3210/011', 'ONG COOLING RESOURCES SDN.BHD.', '201201023814', '1008304-M', '001405304832', '0000-00-00 00:00:00', '', '2012-07-02', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-04-30 00:00:00', '2022-12-31 00:00:00', '2021-12-31 00:00:00', '2023-07-02 00:00:00', '2022-11-30 00:00:00', '2022-12-31 00:00:00', 'A002', 'T000', '004', 'S000', 'L000', 'T000', '', 'D008', '', '', '', '', 'ONG LAI OO', '044338696', '044338698', 'ongresources@hotmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45300', '', '', '650622-08-5227', '650622-08-5227', '650622-08-5227', '650622-08-5227', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/035', '3210/035', 'CENMAY SDN. BHD.', '201001023904', '907676-K', '000130826240', '0000-00-00 00:00:00', '', '2010-07-13', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2022-07-31 00:00:00', '2023-01-31 00:00:00', '2022-01-31 00:00:00', '2024-07-13 00:00:00', '2022-03-02 00:00:00', '2023-01-31 00:00:00', 'A002', 'T000', '004', 'S000', 'L000', 'T000', '', '', '', '', '', '', 'CHIN CHING FUI', '0194412039', '', 'cenmay68@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '75', '0', '', '', '', '46419', '', '', '680609-02-5665', '680609-02-5665', '680609-02-5665', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/041', '3210/041', 'MEN HUAT MOTORS SDN. BHD.', '200401011927', '650430-A', '000462184448', '0000-00-00 00:00:00', '', '2004-04-25', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '1000000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-06-30 00:00:00', '2023-12-31 00:00:00', '2022-12-31 00:00:00', '2024-04-25 00:00:00', '2023-01-30 00:00:00', '2023-12-31 00:00:00', 'A004', 'T000', '008', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '049163558', '049171855', 'menhuatmotor@yahoo.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45401', '', '', '570515-02-6379', '570515-02-6379', '570515-02-6379', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/001', '3210/001', 'PRIME ASSIGNMENT SDN. BHD.', '199501021462', '350665-H', '001859452928', '0000-00-00 00:00:00', '', '1995-07-12', 'MYS', '', 0, 0, 0, 0, '0', '0', '220000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-08-31 00:00:00', '2024-02-29 00:00:00', '2023-02-28 00:00:00', '2024-07-12 00:00:00', '2023-03-30 00:00:00', '2024-02-29 00:00:00', 'BF001', 'T000', '035', 'S000', 'L000', 'T001', '', 'D002', '', '', '', '', 'TOK KIEN GUAN', '047302477', '047314712', 'primeassignmentaggiefoo@gmail.com', 'A0001', 'F0001', 'E0002', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '25999', '46531', '46531i', '', '620815-02-5055', '620815-02-5055', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/040', '3210/040', 'MOKO COLOUR SDN. BHD.', '201101027550', '955685-P', '', '0000-00-00 00:00:00', '', '2011-08-04', 'MYS', '', 0, 0, 0, 0, '100000', '0', '100000', '0', '0', '100000', '0', '100000', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2019-09-30 00:00:00', '2020-03-31 00:00:00', '0000-00-00 00:00:00', '2020-08-04 00:00:00', '2017-09-30 00:00:00', '0000-00-00 00:00:00', 'A2', 'T000', '007', 'S000', 'L000', 'T001', '', '', '', '', '', '', '', '044213541', '', 'moko.colour@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '46632', '', '', '750317-02-5349', '750317-02-5349', '750317-02-5349', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/002', '3210/002', 'YON HENG TRADING SDN. BHD.', '200601028198', '747954-M', '001616527360', '0000-00-00 00:00:00', '', '2006-09-20', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-09-30 00:00:00', '2024-03-31 00:00:00', '2023-03-31 00:00:00', '2024-09-20 00:00:00', '2023-04-30 00:00:00', '2024-03-31 00:00:00', 'A002', 'T000', '007', 'S001', 'L000', 'T001', '', '', '', '', '', '', 'LI CHENG WING', '044210982', '044253897', 'yonheng9051@live.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '01610', '47734', '52299', '541106-02-5049', '541106-02-5049', '541106-02-5049', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/003', '3210/003', 'NAM KHIANG TAYAR (GURUN) SDN. BHD.', '200601030442', '750200-W', '001201086464', '0000-00-00 00:00:00', '', '2006-10-11', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '1000000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2025-06-30 00:00:00', '2025-12-31 00:00:00', '2023-12-31 00:00:00', '2024-10-11 00:00:00', '2024-01-30 00:00:00', '2025-12-31 00:00:00', 'A003', 'T000', '010', 'S000', 'L000', 'T001', '', 'D002', '', '', '', '', 'MS YEOH', '044687503', '044686282', 'namkhianggurun@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45201', '45300', '', '', '491021-02-5215', '491021-02-5215', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/034', '3210/034', 'CHOW HUNG MOTOR SDN. BHD.', '201001014069', '898303-U', '000799031296', '0000-00-00 00:00:00', '', '2010-04-14', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2025-06-30 00:00:00', '2025-12-31 00:00:00', '2021-12-31 00:00:00', '2024-04-14 00:00:00', '2022-01-30 00:00:00', '2025-12-31 00:00:00', 'A002', 'T000', '004', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '047723599', '047723599', 'chm89982gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45401', '', '', '', '750915-02-5621', '750915-02-5621', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/004', '3210/004', 'NAM KHIANG TAYAR SDN. BHD.', '200501002407', '679453-K', '001795047424', '0000-00-00 00:00:00', '', '2005-01-26', 'MYS', 'MYR', 0, 0, 0, 0, '1000000', '0', '1000000', '0', '0', '1000000', '0', '1000000', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2024-12-31 00:00:00', '2025-06-30 00:00:00', '2023-12-31 00:00:00', '2025-01-26 00:00:00', '2023-07-30 00:00:00', '2025-06-30 00:00:00', 'A005', 'T000', '010', 'S000', 'L000', 'T001', '', 'D003', '', '', '', '', '', '047723503', '047723502', 'namkhiang@hotmail.com', 'A0001', 'F0001', 'E0002', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45201', '', '', '', '810521-02-5743', '810521-02-5743', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/032', '3210/032 (S)', 'TRYZEX SDN. BHD.', '200901026865', '869967-D', '000886759424', '0000-00-00 00:00:00', '', '2009-08-26', 'MYS', '', 0, 0, 0, 0, '0', '0', '25000', '0', '0', '0', '0', '0', '0', '0', 'TRUE', '0', '0', '0', '0', 'NF 0771', '1014', '2019-06-30 00:00:00', '2019-12-31 00:00:00', '2016-12-31 00:00:00', '2020-08-26 00:00:00', '2016-06-30 00:00:00', '2019-12-31 00:00:00', 'BF001', 'T000', '015', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '044213824', '', 'tryzex2107@yahoo.com', 'A0001', 'F0005', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-02-17 00:00:00', '2023-03-20 00:00:00', '2023-04-20 00:00:00', '2023-05-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '42203', '', '', '', '610124-02-5057', '610124-02-5057', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(11, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/036', '3210/M036', 'MEISHO ENTERPRISE SDN. BHD.', '200301022368', '624788-W', '', '0000-00-00 00:00:00', '', '2003-08-13', 'MYS', 'MYR', 0, 0, 0, 0, '60000', '0', '60000', '0', '0', '60000', '0', '60000', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1432', '2021-12-31 00:00:00', '2022-06-30 00:00:00', '2021-06-30 00:00:00', '2020-08-13 00:00:00', '2021-07-30 00:00:00', '2022-06-30 00:00:00', 'BF001', 'T000', 'A12', 'S001', 'L000', 'T001', '', '', '', '', '', '', 'CHANG POH GUM', '0124384771', '', '', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '46909', '', '', '620815-02-5055', '620815-02-5055', '620815-02-5055', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(12, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/005', '3210/005', 'NCS BEST MOTORS SDN. BHD.', '200601003508', '723255-W', '000438304768', '0000-00-00 00:00:00', '', '2006-02-09', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2024-02-28 00:00:00', '2024-08-28 00:00:00', '2023-08-31 00:00:00', '2025-02-09 00:00:00', '2023-09-30 00:00:00', '2024-08-31 00:00:00', 'A002', 'T000', '005', 'S000', 'L000', 'T001', '', '', '', '', '', '', '', '047142595', '', 'ncsbmng@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45401', '', '', '', '461216-71-5171', '461216-71-5171', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(13, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/044', '3210/044', 'ECO RICH EMPIRE SDN. BHD.', '201301030066', '1059896-P', '001935626240', '0000-00-00 00:00:00', '', '2013-08-28', 'MYS', 'MYR', 0, 0, 0, 0, '60000', '0', '60000', '0', '0', '60000', '0', '60000', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-10-31 00:00:00', '2024-04-30 00:00:00', '2023-04-30 00:00:00', '2024-08-28 00:00:00', '2023-05-30 00:00:00', '2024-04-30 00:00:00', 'A002', 'T000', '005', 'S000', 'L000', 'T001', '', '', '', '', '', '', 'LOW SEH LING', '0123171900', '', '', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '46909', '', '', '830101-02-6174', '830101-02-6174', '830101-02-6174', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(14, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/006', '3210/006', 'THYE SENG MOTOR SDN. BHD.', '200001019430', '522037-U', '002098806784', '0000-00-00 00:00:00', '', '2000-07-28', 'MYS', 'MYR', 0, 0, 0, 0, '100000', '100000', '200000', '0', '0', '100000', '100000', '200000', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-07-31 00:00:00', '2024-01-31 00:00:00', '2023-01-31 00:00:00', '2024-07-28 00:00:00', '2023-03-02 00:00:00', '2024-01-31 00:00:00', 'A003', 'T000', '010', 'S001', 'L000', 'T001', '', '', '', '', '', '', 'CHENG SHIAU KIAN', '044684688', '044684868', 'thyesengmotor@yahoo.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '85', '0', '', '', '', '45401', '47635', '45403', '500711-02-5185', '500711-02-5185', '500711-02-5185', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(15, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/007', '3210/007', 'LBL METAL SDN. BHD.', '200601007202', '726951-K', '000756793344', '0000-00-00 00:00:00', '', '2006-03-16', 'MYS', 'MYR', 0, 0, 0, 0, '100000', '0', '100000', '0', '0', '100000', '0', '100000', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2022-06-30 00:00:00', '2022-12-31 00:00:00', '2021-12-31 00:00:00', '2024-03-16 00:00:00', '2022-01-30 00:00:00', '2022-12-31 00:00:00', 'A002', 'T002', '008', 'S001', 'L000', 'T000', '', '', '', '', '', '', '', '044312884', '044312884', 'lblmetal_1975@yahoo.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '24311', '', '', '', '750531-07-5638', '750531-07-5638', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(16, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/042', '3210/042', 'BENTOP COLLECTION SDN. BHD.', '199901012542', '487442-P', '000729219072', '0000-00-00 00:00:00', '', '1999-07-06', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '1000000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2024-12-31 00:00:00', '2024-12-31 00:00:00', '2023-12-31 00:00:00', '2023-07-06 00:00:00', '2023-07-30 00:00:00', '2025-06-30 00:00:00', 'BF001', 'T000', '026', 'S000', 'L000', 'T000', '', 'D001', '', '', '', '', '', '047729691', '', 'bentopcollectionsb@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '46419', '', '', '', '650910-02-5771', '650910-02-5771', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(17, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/038', '3210/038', 'MOKO CAR DETAILING HOUSE SDN. BHD.', '201201015464', '988981-H', '', '0000-00-00 00:00:00', '', '2012-04-30', 'MYS', '', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2019-04-30 00:00:00', '2019-10-31 00:00:00', '0000-00-00 00:00:00', '2018-04-30 00:00:00', '2018-04-30 00:00:00', '0000-00-00 00:00:00', 'BF001', 'T000', '014', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '', '', '', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45203', '', '', '750317-02-5349', '750317-02-5349', '750317-02-5349', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(18, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/008', '3210/008 (X)', 'ECO BILLIONS SDN. BHD.', '1058002-V', '1058002-V', '', '0000-00-00 00:00:00', '', '2013-08-13', 'MYS', '', 0, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', '', '', '0000-00-00 00:00:00', '2015-02-13 00:00:00', '0000-00-00 00:00:00', '2017-08-13 00:00:00', '2017-10-31 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'A0001', 'F0005', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-12-13 00:00:00', '2018-01-12 00:00:00', '2018-02-14 00:00:00', '2018-02-23 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '  -   -', '', 'ROC-KEDAH', '', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(19, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/009', '3210/009R', 'SONCIN AUTOMOBILE SDN. BHD.', '200501023034', '705165-D', '000550477824', '0000-00-00 00:00:00', '', '2005-08-03', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2021-06-30 00:00:00', '2021-12-31 00:00:00', '2019-12-31 00:00:00', '2022-08-03 00:00:00', '2021-01-30 00:00:00', '2021-12-31 00:00:00', 'A002', 'T000', '003', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '044319692', '044319692', '', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45101', '45102', '', '', '500121-02-5003', '500121-02-5003', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/043', '3210/043', 'SP CEMERLANG SDN. BHD.', '200701019425', '777437-P', '', '0000-00-00 00:00:00', '', '2007-06-18', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '550000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', 'AF 001929', '2023-09-30 00:00:00', '2024-03-31 00:00:00', '2023-03-31 00:00:00', '2023-06-18 00:00:00', '2023-04-30 00:00:00', '2024-03-31 00:00:00', 'BF001', 'T000', '020', 'S000', 'L000', 'T001', '', '', '', '', '', '', '', '044218909', '', 'sp_cemerlang@yahoo.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '66125', '', '', '690508-07-5355', '690508-07-5355', '690508-07-5355', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(21, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/031', '3210/031', 'KEDAI EMAS POOH CHAN SDN. BHD.', '200701011539', '769543-U', '001961132032', '0000-00-00 00:00:00', '', '2007-04-15', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '137000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', '', '1014', '2025-04-30 00:00:00', '2025-10-31 00:00:00', '2024-10-31 00:00:00', '2024-04-15 00:00:00', '2024-11-30 00:00:00', '2025-10-31 00:00:00', 'A002', 'T000', '004', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '047723669', '', '', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '47733', '', '', '', '650910-02-5771', '650910-02-5771', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(22, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/010', '3210/010', 'WH WENG SDN. BHD.', '201001021911', '905681-T', '000201105408', '0000-00-00 00:00:00', '', '2010-06-24', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2024-04-30 00:00:00', '2024-10-31 00:00:00', '2020-10-31 00:00:00', '2023-06-24 00:00:00', '2020-11-30 00:00:00', '2021-12-31 00:00:00', 'A002', 'T000', '004', 'S000', 'L000', 'T000', '', 'D005', '', '', '', '', '', '047347472', '', 'whweng8@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45300', '', '', '', '600119-02-5221', '600119-02-5221', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(23, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/048', '3210/048', 'HUP YU MOTOR SDN. BHD.', '201001014163', '898397-V', '', '0000-00-00 00:00:00', '', '2010-04-14', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2023-05-31 00:00:00', '2023-11-30 00:00:00', '2022-11-30 00:00:00', '2024-04-14 00:00:00', '2022-12-30 00:00:00', '2023-11-30 00:00:00', 'A002', 'T001', '006', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '047643050', '', 'hupyumotor @hotmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45401', '45402', '45403', '', '590228-02-6163', '590228-02-6163', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(24, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/012', '3210/012', 'DIY ACCESSORIES SDN. BHD.', '201201018608', '1004121-D', '000903495680', '0000-00-00 00:00:00', '', '2012-05-30', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '100000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2025-06-30 00:00:00', '2025-12-31 00:00:00', '2024-12-31 00:00:00', '2024-05-30 00:00:00', '2025-01-30 00:00:00', '2025-12-31 00:00:00', 'A002', 'T000', '004', 'S000', 'L000', 'T000', '', '012', '', '', '', '', '', '0125251191', '', 'diymobileaccessories@gmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '47413', '47640', '47411', '', '810925-02-5651', '810925-02-5651', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0),
(25, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', '3210/046', '3210/046', 'HUP YU MOTORS (K) SDN. BHD.', '199601041371', '413724-U', '001466699776', '0000-00-00 00:00:00', '', '1996-12-14', 'MYS', 'MYR', 0, 0, 0, 0, '0', '0', '500000', '0', '0', '0', '0', '0', '0', '0', 'FALSE', '0', '0', '0', '0', 'NF 0771', '1014', '2022-03-31 00:00:00', '2022-09-30 00:00:00', '2021-09-30 00:00:00', '2024-12-14 00:00:00', '2021-10-30 00:00:00', '2022-09-30 00:00:00', 'BF001', 'T000', '007', 'S000', 'L000', 'T000', '', '', '', '', '', '', '', '047643050', '', 'hupyumotor@hotmail.com', 'A0001', 'F0001', 'E0001', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 'KY TAN', '0', '0', '', '', '', '45401', '', '', '590228-02-6163', '590228-02-6163', '590228-02-6163', '', '751122-11-5197', 'SHARECERT', '  -   -', '', 'ROC-KEDAH', '751122-11-5197', '', '', '', 'P', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_clientdata`
--
ALTER TABLE `moz70_unicornr_table_clientdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moz70_unicornr_table_clientdata_capital` (`capital`),
  ADD KEY `moz70_unicornr_table_clientdata_capitalp` (`capitalp`),
  ADD KEY `moz70_unicornr_table_clientdata_capitalk` (`capitalk`),
  ADD KEY `moz70_unicornr_table_clientdata_parvalue` (`parvalue`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_clientdata`
--
ALTER TABLE `moz70_unicornr_table_clientdata`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=846;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
