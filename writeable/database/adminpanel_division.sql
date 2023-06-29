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
-- Table structure for table `adminpanel_division`
--

CREATE TABLE `adminpanel_division` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_division`
--

INSERT INTO `adminpanel_division` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rajshahi Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(2, 'Rangpur Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(3, 'Mymensingh Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(4, 'Barishal Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(5, 'Chattogram Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(6, 'Dhaka Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(7, 'Khulna Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL),
(8, 'Sylhet Division', '2020-11-11 12:25:13.000000', '2020-11-11 12:25:13.000000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpanel_division`
--
ALTER TABLE `adminpanel_division`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpanel_division`
--
ALTER TABLE `adminpanel_division`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
