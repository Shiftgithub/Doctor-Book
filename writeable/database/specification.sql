-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2024 at 11:08 AM
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
-- Table structure for table `specification`
--

CREATE TABLE `specification` (
  `id` bigint(20) NOT NULL,
  `accuracy` decimal(10,3) DEFAULT NULL,
  `prediction_id` bigint(20) DEFAULT NULL,
  `problem_specification_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`id`, `accuracy`, `prediction_id`, `problem_specification_id`) VALUES
(1, NULL, 1, 1),
(2, NULL, 2, 2),
(3, NULL, 3, 3),
(4, NULL, 4, 4),
(5, NULL, 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `specification`
--
ALTER TABLE `specification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specification_prediction_id_d014949a_fk_prediction_id` (`prediction_id`),
  ADD KEY `specification_problem_specificatio_9db51dd9_fk_organ_pro` (`problem_specification_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `specification`
--
ALTER TABLE `specification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `specification`
--
ALTER TABLE `specification`
  ADD CONSTRAINT `specification_prediction_id_d014949a_fk_prediction_id` FOREIGN KEY (`prediction_id`) REFERENCES `prediction` (`id`),
  ADD CONSTRAINT `specification_problem_specificatio_9db51dd9_fk_organ_pro` FOREIGN KEY (`problem_specification_id`) REFERENCES `organ_problem_speci` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
