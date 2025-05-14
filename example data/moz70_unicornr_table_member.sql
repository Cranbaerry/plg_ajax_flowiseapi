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
-- Table structure for table `moz70_unicornr_table_member`
--

CREATE TABLE `moz70_unicornr_table_member` (
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
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `formername` varchar(255) NOT NULL DEFAULT '',
  `doformer` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idtype` varchar(255) NOT NULL DEFAULT '',
  `icno` varchar(255) NOT NULL DEFAULT '',
  `oldicno` varchar(255) NOT NULL DEFAULT '',
  `iccolor` varchar(255) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `passtype` varchar(255) NOT NULL DEFAULT '',
  `passissue` varchar(255) NOT NULL DEFAULT '',
  `passexpire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `emppass` varchar(255) NOT NULL DEFAULT '',
  `depenpass` varchar(255) NOT NULL DEFAULT '',
  `empexpire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `occupation` varchar(255) NOT NULL DEFAULT '',
  `sex` varchar(255) NOT NULL DEFAULT '',
  `local_resaddr` varchar(255) NOT NULL,
  `race` varchar(255) NOT NULL DEFAULT '',
  `add1` varchar(255) NOT NULL DEFAULT '',
  `add2` varchar(255) NOT NULL DEFAULT '',
  `add3` varchar(255) NOT NULL DEFAULT '',
  `postcode` varchar(255) NOT NULL DEFAULT '',
  `town` varchar(255) NOT NULL DEFAULT '',
  `mem_state` varchar(255) NOT NULL,
  `countryid` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `hphone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `lhideeml` varchar(255) NOT NULL DEFAULT '',
  `srv_add1` varchar(255) NOT NULL DEFAULT '',
  `srv_add2` varchar(255) NOT NULL DEFAULT '',
  `srv_add3` varchar(255) NOT NULL DEFAULT '',
  `srv_post` varchar(255) NOT NULL DEFAULT '',
  `srv_town` varchar(255) NOT NULL DEFAULT '',
  `srv_state` varchar(255) NOT NULL DEFAULT '',
  `srv_countryid` varchar(255) NOT NULL DEFAULT '',
  `local_busaddr` varchar(255) NOT NULL,
  `bus_add1` varchar(255) NOT NULL,
  `bus_add2` varchar(255) NOT NULL,
  `bus_add3` varchar(255) NOT NULL,
  `bus_post` varchar(255) NOT NULL,
  `bus_town` varchar(255) NOT NULL,
  `bus_state` varchar(255) NOT NULL,
  `bus_countryid` varchar(255) NOT NULL,
  `d_town` varchar(255) NOT NULL DEFAULT '',
  `d_state` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `nationcode` varchar(255) NOT NULL DEFAULT '',
  `citizenship` varchar(255) NOT NULL,
  `dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ydob` varchar(255) NOT NULL DEFAULT '',
  `malaysian` varchar(255) NOT NULL DEFAULT '',
  `shareheld` int(11) NOT NULL DEFAULT 0,
  `repcode` varchar(255) NOT NULL DEFAULT '',
  `memtype` varchar(255) NOT NULL DEFAULT '',
  `regtype` varchar(255) NOT NULL DEFAULT '',
  `inactive` varchar(255) NOT NULL DEFAULT '',
  `pracertno` varchar(255) NOT NULL DEFAULT '',
  `lictype` varchar(255) NOT NULL DEFAULT '',
  `license` varchar(255) NOT NULL DEFAULT '',
  `licenseexp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `licenseisu` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `issec` varchar(255) NOT NULL DEFAULT '',
  `datechg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dgtcertexp` varchar(255) NOT NULL,
  `pracertexp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moz70_unicornr_table_member`
--

INSERT INTO `moz70_unicornr_table_member` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `userid`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `code`, `name`, `formername`, `doformer`, `idtype`, `icno`, `oldicno`, `iccolor`, `passport`, `passtype`, `passissue`, `passexpire`, `emppass`, `depenpass`, `empexpire`, `occupation`, `sex`, `local_resaddr`, `race`, `add1`, `add2`, `add3`, `postcode`, `town`, `mem_state`, `countryid`, `tel`, `hphone`, `email`, `lhideeml`, `srv_add1`, `srv_add2`, `srv_add3`, `srv_post`, `srv_town`, `srv_state`, `srv_countryid`, `local_busaddr`, `bus_add1`, `bus_add2`, `bus_add3`, `bus_post`, `bus_town`, `bus_state`, `bus_countryid`, `d_town`, `d_state`, `title`, `nationcode`, `citizenship`, `dob`, `ydob`, `malaysian`, `shareheld`, `repcode`, `memtype`, `regtype`, `inactive`, `pracertno`, `lictype`, `license`, `licenseexp`, `licenseisu`, `issec`, `datechg`, `dgtcertexp`, `pracertexp`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '650622085227', '', '', '', '', '650622-08-5227', 'Ong Lai Oo', '', '0000-00-00 00:00:00', 'I1000', '650622-08-5227', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', '12, Solok Samagagah 1', 'Taman Himalaya', 'Permatang Pauh', '13500', 'Bukit Mertajam', 'P', 'MYS', '', '', '', 'TRUE', '31, Lebuh Fairuz 1', 'Kawasan Perusahaan Ringan Bakar Arang', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2065-06-22 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(2, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '680616075468', '', '', '', '', '680616-07-5468', 'Geh Sock Eang', '', '0000-00-00 00:00:00', 'I1000', '680616-07-5468', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businesswoman', 'Female', 'TRUE', 'C', '12, Solok Samagagah 1', 'Taman Himalaya', 'Permatang Pauh', '13500', 'Bukit Mertajam', 'P', 'MYS', '', '', '', 'TRUE', '31, Lebuh Fairuz 1', 'Kawasan Perusahaan Ringan Bakar Arang', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2068-06-16 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(3, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '680609025665', '', '', '', '', '680609-02-5665', 'Chin Ching Fui', '', '0000-00-00 00:00:00', 'I1000', '680609-02-5665', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'B283A, Jalan 12', 'Cinta Sayang Resort Homes', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', 'A32, Jalan 3A', 'Cinta Sayang Resort Homes', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2068-06-09 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(4, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '730623025330', '', '', '', '', '730623-02-5330', 'Yeoh Yan Chyn', '', '0000-00-00 00:00:00', 'I1000', '730623-02-5330', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businesswoman', 'Female', 'TRUE', 'C', 'B283A, Jalan 12', 'Cinta Sayang Resort Homes', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', 'A32, Jalan 3A', 'Cinta Sayang Resort Homes', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '1973-06-23 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(5, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'TEH', '570515026379', '', '', '', '', '570515-02-6379', 'Ng Chin Keong', '', '0000-00-00 00:00:00', 'I1000', '570515-02-6379', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 167A, Jalan PJ 7', 'Pekan Jitra 2', '', '06000', 'Jitra', 'K', 'MYS', '0125229029', '', 'menhuat@gmail.com', 'TRUE', 'No. 167A, Jalan PJ 7', 'Pekan Jitra 2', '', '06000', 'Jitra', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Jitra', 'K', '', 'MYS', 'MALAYSIAN', '2057-05-15 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(6, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'TEH', '640813025682', '', '', '', '', '640813-02-5682', 'Tee Ai Leng', '', '0000-00-00 00:00:00', 'I1000', '640813-02-5682', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businesswoman', 'Female', 'TRUE', 'C', 'No.167A, Jalan PJ 7', 'Pekan Jitra 2', '', '06000', 'Jitra', 'K', 'MYS', '0125229029', '', 'menhuat@gmail.com', 'TRUE', 'No.167A, Jalan PJ 7', 'Pekan Jitra 2', '', '06000', 'Jitra', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Jitra', 'K', '', 'MYS', 'MALAYSIAN', '2064-08-13 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(7, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '531010025053', '', '', '', '', '531010-02-5053', 'Khoo Ewe Chin', '', '0000-00-00 00:00:00', 'I1000', '531010-02-5053', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No 12, Lorong Putih 9', 'Taman Rakyat Mergong', '', '05150', 'Alor Setar', 'K', 'MYS', '', '', '', 'TRUE', '73, Lot 128,Jalan Timur 4', 'Mergong Barrage II', '', '05050', 'Alor Setar', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', '', '2053-10-10 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(8, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '620815025055', '', '', '', '', '620815-02-5055', 'Tok Kien Guan', '', '0000-00-00 00:00:00', 'I1000', '620815-02-5055', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'FALSE', 'C', '28-G, Taman Gunung Bayu Fasa 4', 'Lebuhraya Sultanah Bahiyah', '', '05400', 'Alor Setar', 'K', 'MYS', '012-4871133', '', 'primeassignmentaggiefoo@gmail.com', 'TRUE', '73, Lot 128, Jalan Timur 4', 'Mergong Barrage II', '', '05050', 'Alor Setar', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', '', '2062-08-15 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(9, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'HUDA', '750317025349', '', '', '', '', '750317-02-5349', 'Lau Soo Thong', '', '0000-00-00 00:00:00', 'I1000', '750317-02-5349', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'B3B, Lorong Desa Jaya 6/10', 'Taman Desa Jaya', '', '08000', 'Sungai Petani', 'K', 'MYS', '0125921678', '', '', 'TRUE', 'No.67, Lorong 7', 'Taman Bakar Arang', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '1975-03-17 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(10, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '860213025261', '', '', '', '', '860213-02-5261', 'Beh Chun Cheak', '', '0000-00-00 00:00:00', 'I1000', '860213-02-5261', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 123, Lorong Berlian Indah 5', 'Taman Berlian Indah', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', '12, Jalan Beringin Indah 1', 'Taman Beringin Indah', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '1986-02-13 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(11, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SARA', '541106025049', '', '', '', '', '541106-02-5049', 'Li Cheng Wing', '', '0000-00-00 00:00:00', 'I1000', '541106-02-5049', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No.16, Lorong 5A', 'Taman Peruda', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '0194424751', 'yonheng9051@live.com', 'TRUE', '206A & 207A', 'Kg Sungai Tukang', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2054-11-06 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(12, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '601002025150', '', '', '', '', '601002-02-5150', 'Tan Kee Heah', '', '0000-00-00 00:00:00', 'I1000', '601002-02-5150', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businesswoman', 'Female', 'TRUE', 'C', 'No.16, Lorong 5A', 'Taman Peruda', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', '206A & 207A', 'Kg Sungai Tukang', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2060-10-02 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(13, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SARA', '880825025121', '', '', '', '', '880825-02-5121', 'Li Kian Hau', '', '0000-00-00 00:00:00', 'I1000', '880825-02-5121', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No.16, Lorong 5A', 'Taman Peruda', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '0124875715', 'yonheng9051@live.com', 'TRUE', '206A & 207A', 'Kg Sungai Tukang', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '1988-08-25 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(14, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '491021025215', '', '', '', '', '491021-02-5215', 'Aiu Ting Chuai @ Yeoh Theng Chooi', '', '0000-00-00 00:00:00', 'I1000', '491021-02-5215', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 113, Jalan Jerai Maju 7', 'Taman Jerai Maju', '', '08300', 'Gurun', 'K', 'MYS', '', '0132473333', 'namkhianggurun@gmail.com', 'TRUE', 'Lot 606, Jalan Raya', '', '', '08300', 'Gurun', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', '', '2049-10-21 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(15, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'OCC', '810521025743', '', '', '', '', '810521-02-5743', 'Yeoh Kee Chuan', '', '0000-00-00 00:00:00', 'I1000', '810521-02-5743', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 30, Jalan Raya', '', '', '08300', 'Gurun', 'K', 'MYS', '', '0124867727', 'kcyeoh81@yahoo.com', 'TRUE', '', '', '', '', '', '', '', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', '', '1981-05-21 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(16, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'DIV', '770616025443', '', '', '', '', '770616-02-5443', 'Yeoh Chee Tiong', '', '0000-00-00 00:00:00', 'I1000', '770616-02-5443', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 113, Jalan Jerai Maju 7', 'Taman Jerai Maju', '', '08300', 'Gurun', 'K', 'MYS', '', '016-498 8880', 'maxx.alloy@gmail.com', 'TRUE', '', '', '', '', '', '', '', 'FALSE', '', '', '', '', '', '', '', 'Gurun', 'K', '', 'MYS', '', '1977-06-16 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(17, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'NITA', '750915025621', '', '', '', '', '750915-02-5621', 'Loo Chow Hung', '', '0000-00-00 00:00:00', 'I1000', '750915-02-5621', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No.8, Taman Pelangi', 'Jalan Kuala Kedah', '', '05400', 'Alor Setar', 'K', 'MYS', '', '012-4718998', 'chm8998@gmail.com', 'TRUE', 'No.8, Taman Pelangi', 'Lorong Mega 1', 'Batu 2, Jalan Kuala Kedah', '06600', 'Alor Setar', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', 'MALAYSIAN', '1975-09-15 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(18, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'NITA', '760429025406', '', '', '', '', '760429-02-5406', 'Lim Siow Yen', '', '0000-00-00 00:00:00', 'I1000', '760429-02-5406', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businesswoman', 'Female', 'TRUE', 'C', 'No.8, Taman Pelangi', 'Jalan Kuala Kedah', '', '05400', 'Alor Setar', 'K', 'MYS', '', '017-4718998', 'chm8998@gmail.com', 'TRUE', 'No.8, Taman Pelangi', 'Lorong Mega 1', 'Batu 2, Jalan Kuala Kedah', '06600', 'Alor Setar', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', 'MALAYSIAN', '1976-04-29 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(19, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '610124025057', '', '', '', '', '610124-02-5057', 'Md Akhir Bin Darus', '', '0000-00-00 00:00:00', 'I1000', '610124-02-5057', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'M', 'B17, Jalan Meriah', 'Taman Sari', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', 'Lot 2107, Batu Dua', 'Jalan Kuala Ketil', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2061-01-24 00:00:00', 'FALSE', '', 1, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '651019025793', '', '', '', '', '651019-02-5793', 'Rosli Bin Man', '', '0000-00-00 00:00:00', 'I1000', '651019-02-5793', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'M', '1369, Lorong Teja 27', 'Taman Keladi', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', 'Lot 2107, Batu Dua', 'Jalan Kuala Ketil', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '2065-10-19 00:00:00', 'FALSE', '', 1, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(21, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, '', '861212025301', '', '', '', '', '861212-02-5301', 'Khairul Izwan Bin Md Akhir', '', '0000-00-00 00:00:00', 'I1000', '861212-02-5301', '', '', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Company Director', 'Male', 'TRUE', 'M', 'B17, Jalan Meriah', '', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'FALSE', 'B17, Jalan Meriah', '', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', '', '', '', 'MYS', '', '1986-12-12 00:00:00', 'FALSE', '', 3, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(22, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '911206025033', '', '', '', '', '911206-02-5033', 'Khairul Akmal Bin Md Akhir', '', '0000-00-00 00:00:00', 'I1000', '911206-02-5033', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'M', '649 Jalan Batik 1', 'Taman Batik', '', '08000', 'Sungai Petani', 'K', 'MYS', '', '', '', 'TRUE', 'Lot 2107, Batu Dua', 'Jalan Kuala Ketil', '', '08000', 'Sungai Petani', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Sungai Petani', 'K', '', 'MYS', '', '1991-12-06 00:00:00', 'FALSE', '', 1, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(23, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'FARA', '610206025501', '', '', '', '', '610206-02-5501', 'Chang Poh Gum', '', '0000-00-00 00:00:00', 'I1000', '610206-02-5501', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No.2903-A, Lorong Tun Syed', 'Sheikh Shahabudin 1/2', 'Taman Golf', '05250', 'Alor Setar', 'K', 'MYS', '', '', '', 'TRUE', '73, Lot 128A, Jalan Timur 4', 'Mergong Barrage II', '', '05050', 'Alor Setar', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', 'Alor Setar', 'K', '', 'MYS', '', '2061-02-06 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(24, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '461216715171', '', '', '', '', '461216-71-5171', 'Ng Choon Swee', '', '0000-00-00 00:00:00', 'I1000', '461216-71-5171', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 1149, Pekan Kepala Batas', '', '', '06200', 'Jitra', 'K', 'MYS', '', '', '', 'TRUE', '', '', '', '', '', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', '', 'K', '', 'MYS', '', '2046-12-16 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -'),
(25, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 'SUGU', '780501025135', '', '', '', '', '780501-02-5135', 'Ng Boon Way', '', '0000-00-00 00:00:00', 'I1000', '780501-02-5135', '', 'B', '', '', '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', 'Businessman', 'Male', 'TRUE', 'C', 'No. 1149, Pekan Kepala Batas', '', '', '06200', 'Jitra', 'K', 'MYS', '', '', '', 'TRUE', '', '', '', '', '', 'K', 'MYS', 'FALSE', '', '', '', '', '', '', '', '', 'K', '', 'MYS', '', '1978-05-01 00:00:00', 'FALSE', '', 2, '', 'I', '', 'FALSE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FALSE', '0000-00-00 00:00:00', '  -   -', '  -   -');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moz70_unicornr_table_member`
--
ALTER TABLE `moz70_unicornr_table_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_index` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moz70_unicornr_table_member`
--
ALTER TABLE `moz70_unicornr_table_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5824;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
