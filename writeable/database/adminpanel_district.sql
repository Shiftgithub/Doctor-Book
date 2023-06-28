-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2023 at 06:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_book`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_district`
--

CREATE TABLE `adminpanel_district` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `division_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_district`
--

INSERT INTO `adminpanel_district` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `division_id`) VALUES
(1, 'Joypurhat District', '2020-11-11 12:25:10.000000', '2020-11-11 12:25:10.000000', NULL, 1),
(2, 'Bogura District', '2020-11-11 12:25:10.000000', '2020-11-11 12:25:10.000000', NULL, 1),
(3, 'Naogaon District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 1),
(4, 'Natore District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 1),
(5, 'NawabganjDistrict', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 1),
(6, 'Pabna District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 1),
(7, 'Sirajganj District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 1),
(8, 'Rajshahi District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 1),
(9, 'DinajpurDistrict', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(10, 'Gaibandha District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(11, 'Kurigram District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(12, 'Lalmonirhat District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(13, 'Nilphamari District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(14, 'Panchagarh District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(15, 'Rangpur District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(16, 'Thakurgaon District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 2),
(17, 'Netrokona District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 3),
(18, 'Sherpur District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 3),
(19, 'Jamalpur District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 3),
(20, 'Mymensingh District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 3),
(21, 'Barguna District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 4),
(22, 'BarishalDistrict', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 4),
(23, 'Bhola District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 4),
(24, 'Jhalokati District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 4),
(25, 'Patuakhali District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 4),
(26, 'Pirojpur District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 4),
(27, 'Bandarban District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 5),
(28, 'Brahmanbaria District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 5),
(29, 'Chandpur District', '2020-11-11 12:25:11.000000', '2020-11-11 12:25:11.000000', NULL, 5),
(30, 'ChattogramDistrict', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(31, 'CumillaDistrict', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(32, 'Cox Bazar District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(33, 'Feni District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(34, 'Khagrachhari District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(35, 'Lakshmipur District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(36, 'Noakhali District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(37, 'RangamatiDistrict', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 5),
(38, 'Dhaka District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(39, 'Gazipur District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(40, 'GopalganjDistrict', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(41, 'Kishoreganj District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(42, 'Madaripur District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(43, 'Manikganj District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(44, 'Munshiganj District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(45, 'Narayanganj District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(46, 'Rajbari District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(47, 'Shariatpur District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(48, 'Faridpur District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(49, 'Tangail District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(50, 'Narsingdi District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 6),
(51, 'Bagerhat District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(52, 'Chuadanga District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(53, 'JashoreDistrict', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(54, 'JhenaidaDistrict', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(55, 'Khulna District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(56, 'Kushtia District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(57, 'Magura District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(58, 'Meherpur District', '2020-11-11 12:25:12.000000', '2020-11-11 12:25:12.000000', NULL, 7),
(59, 'Narail District', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL, 7),
(60, 'Satkhira District', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL, 7),
(61, 'Habiganj District', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL, 8),
(62, 'Moulvibazar District', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL, 8),
(63, 'Sunamganj District', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL, 8),
(64, 'Sylhet District', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_district_division_id_cead86ca_fk_adminpane` (`division_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  ADD CONSTRAINT `adminpanel_district_division_id_cead86ca_fk_adminpane` FOREIGN KEY (`division_id`) REFERENCES `adminpanel_division` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
