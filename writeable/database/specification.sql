-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2023 at 08:48 PM
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
  `prediction_id` bigint(20) DEFAULT NULL,
  `problem_specification_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`id`, `prediction_id`, `problem_specification_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 2),
(42, 41, 6),
(43, 42, 3),
(44, 43, 5),
(45, 44, 1),
(46, 45, 2),
(47, 45, 6),
(48, 46, 4),
(49, 47, 3),
(50, 48, 1),
(51, 49, 1),
(52, 50, 1),
(53, 51, 2),
(54, 51, 6),
(55, 52, 2),
(56, 52, 6),
(57, 53, 1),
(58, 54, 1),
(59, 55, 1),
(60, 56, 1),
(61, 57, 1),
(62, 58, 1),
(63, 59, 1),
(64, 60, 1),
(65, 61, 1),
(66, 62, 1),
(67, 63, 1),
(68, 64, 2),
(69, 64, 6),
(70, 65, 2),
(71, 66, 2),
(72, 66, 6),
(73, 67, 2),
(74, 67, 6),
(75, 68, 2),
(76, 68, 6),
(77, 69, 2),
(78, 69, 6),
(79, 70, 2),
(80, 70, 6),
(81, 71, 2),
(82, 71, 6),
(83, 72, 2),
(84, 72, 6),
(85, 73, 2),
(86, 73, 6),
(87, 74, 2),
(88, 74, 6),
(89, 75, 2),
(90, 75, 6),
(91, 76, 2),
(92, 76, 6),
(93, 77, 2),
(94, 77, 6),
(95, 78, 2),
(96, 78, 6),
(97, 79, 2),
(98, 79, 6),
(99, 80, 2),
(100, 80, 6),
(101, 81, 1),
(102, 82, 1),
(103, 83, 2),
(104, 83, 6),
(105, 84, 1),
(106, 85, 1),
(107, 85, 7),
(108, 85, 8),
(109, 86, 1),
(110, 86, 7),
(111, 86, 8),
(112, 87, 1),
(113, 87, 7),
(114, 87, 8),
(115, 88, 1),
(116, 88, 7),
(117, 88, 8),
(118, 89, 1),
(119, 89, 7),
(120, 89, 8),
(121, 90, 1),
(122, 90, 7),
(123, 90, 8),
(124, 91, 1),
(125, 91, 7),
(126, 91, 8);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

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
