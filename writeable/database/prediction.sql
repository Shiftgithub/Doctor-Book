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
-- Table structure for table `prediction`
--

CREATE TABLE `prediction` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `body_part_id` bigint(20) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `department_speci_id` bigint(20) DEFAULT NULL,
  `organ_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prediction`
--

INSERT INTO `prediction` (`id`, `created_at`, `updated_at`, `deleted_at`, `body_part_id`, `created_by_id`, `department_id`, `department_speci_id`, `organ_id`) VALUES
(1, '2024-01-04 10:01:09.851738', NULL, NULL, 1, NULL, 4, 1, 1),
(2, '2024-01-04 10:04:37.743454', NULL, NULL, 1, NULL, 4, 2, 1),
(3, '2024-01-04 10:04:47.596500', NULL, NULL, 1, NULL, 4, 3, 1),
(4, '2024-01-04 10:04:56.448011', NULL, NULL, 1, NULL, 4, 4, 1),
(5, '2024-01-04 10:05:16.451331', NULL, NULL, 1, NULL, 4, 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `prediction`
--
ALTER TABLE `prediction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prediction_body_part_id_38a9b3c2_fk_body_part_id` (`body_part_id`),
  ADD KEY `prediction_created_by_id_dcb9923e_fk_patient_profile_id` (`created_by_id`),
  ADD KEY `prediction_department_id_a5dabb64_fk_department_id` (`department_id`),
  ADD KEY `prediction_department_speci_id_03db92a4_fk_department_speci_id` (`department_speci_id`),
  ADD KEY `prediction_organ_id_87623336_fk_organ_id` (`organ_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prediction`
--
ALTER TABLE `prediction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prediction`
--
ALTER TABLE `prediction`
  ADD CONSTRAINT `prediction_body_part_id_38a9b3c2_fk_body_part_id` FOREIGN KEY (`body_part_id`) REFERENCES `body_part` (`id`),
  ADD CONSTRAINT `prediction_created_by_id_dcb9923e_fk_patient_profile_id` FOREIGN KEY (`created_by_id`) REFERENCES `patient_profile` (`id`),
  ADD CONSTRAINT `prediction_department_id_a5dabb64_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `prediction_department_speci_id_03db92a4_fk_department_speci_id` FOREIGN KEY (`department_speci_id`) REFERENCES `department_speci` (`id`),
  ADD CONSTRAINT `prediction_organ_id_87623336_fk_organ_id` FOREIGN KEY (`organ_id`) REFERENCES `organ` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
