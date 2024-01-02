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
(1, '2023-12-27 11:05:08.353729', NULL, NULL, 1, NULL, 4, 1, 1),
(2, '2023-12-27 11:05:13.934775', NULL, NULL, 1, NULL, 4, 1, 1),
(3, '2023-12-27 11:05:17.714741', NULL, NULL, 1, NULL, 4, 1, 1),
(4, '2023-12-27 11:05:21.018455', NULL, NULL, 1, NULL, 4, 1, 1),
(5, '2023-12-27 11:05:26.600929', NULL, NULL, 1, NULL, 4, 1, 1),
(6, '2023-12-27 11:05:47.296839', NULL, NULL, 1, NULL, 4, 1, 1),
(7, '2023-12-27 11:06:11.529496', NULL, NULL, 1, NULL, 4, 1, 1),
(8, '2023-12-27 11:06:16.490582', NULL, NULL, 1, NULL, 4, 1, 1),
(9, '2023-12-27 11:06:19.283665', NULL, NULL, 1, NULL, 4, 1, 1),
(10, '2023-12-27 11:06:21.422579', NULL, NULL, 1, NULL, 4, 1, 1),
(11, '2023-12-27 11:06:23.782630', NULL, NULL, 1, NULL, 4, 1, 1),
(12, '2023-12-27 11:06:25.781008', NULL, NULL, 1, NULL, 4, 1, 1),
(13, '2023-12-27 11:06:33.282123', NULL, NULL, 1, NULL, 4, 1, 1),
(14, '2023-12-27 11:06:35.256952', NULL, NULL, 1, NULL, 4, 1, 1),
(15, '2023-12-27 11:06:37.347396', NULL, NULL, 1, NULL, 4, 1, 1),
(16, '2023-12-27 11:06:39.634000', NULL, NULL, 1, NULL, 4, 1, 1),
(17, '2023-12-27 11:06:41.664473', NULL, NULL, 1, NULL, 4, 1, 1),
(18, '2023-12-27 11:06:43.691908', NULL, NULL, 1, NULL, 4, 1, 1),
(19, '2023-12-27 11:06:45.631340', NULL, NULL, 1, NULL, 4, 1, 1),
(20, '2023-12-27 11:06:47.646759', NULL, NULL, 1, NULL, 4, 1, 1),
(21, '2023-12-27 11:07:01.939278', NULL, NULL, 1, NULL, 4, 1, 1),
(22, '2023-12-27 11:07:03.823526', NULL, NULL, 1, NULL, 4, 1, 1),
(23, '2023-12-27 11:07:05.640678', NULL, NULL, 1, NULL, 4, 1, 1),
(24, '2023-12-27 11:07:07.734838', NULL, NULL, 1, NULL, 4, 1, 1),
(25, '2023-12-27 11:07:10.319673', NULL, NULL, 1, NULL, 4, 1, 1),
(26, '2023-12-27 11:07:12.741656', NULL, NULL, 1, NULL, 4, 1, 1),
(27, '2023-12-27 11:07:15.033621', NULL, NULL, 1, NULL, 4, 1, 1),
(28, '2023-12-27 11:07:17.516487', NULL, NULL, 1, NULL, 4, 1, 1),
(29, '2023-12-27 11:07:19.439175', NULL, NULL, 1, NULL, 4, 1, 1),
(30, '2023-12-27 11:07:21.362203', NULL, NULL, 1, NULL, 4, 1, 1),
(31, '2023-12-27 11:07:23.782940', NULL, NULL, 1, NULL, 4, 1, 1),
(32, '2023-12-27 16:58:03.054382', NULL, NULL, 1, NULL, 4, 1, 1),
(33, '2023-12-27 17:00:02.390946', NULL, NULL, 1, NULL, 4, 1, 1),
(34, '2023-12-27 17:27:11.158595', NULL, NULL, 1, NULL, 4, 1, 1),
(35, '2023-12-27 17:31:09.685760', NULL, NULL, 1, NULL, 4, 1, 1),
(36, '2023-12-27 17:31:33.451917', NULL, NULL, 1, NULL, 4, 1, 1),
(37, '2023-12-27 17:34:23.225001', NULL, NULL, 1, NULL, 4, 1, 1),
(38, '2023-12-27 17:39:20.339740', NULL, NULL, 1, NULL, 4, 1, 1),
(39, '2023-12-27 17:40:06.493043', NULL, NULL, 1, NULL, 4, 1, 1),
(40, '2023-12-27 17:41:44.742499', NULL, NULL, 1, NULL, 4, 1, 1),
(41, '2023-12-27 17:43:01.965294', NULL, NULL, 1, NULL, 18, 2, 2),
(42, '2023-12-27 17:43:13.049278', NULL, NULL, 1, NULL, 9, 3, 3),
(43, '2023-12-27 17:43:30.047512', NULL, NULL, 1, NULL, 19, 5, 5),
(44, '2023-12-27 17:44:10.322352', NULL, NULL, 1, NULL, 4, 1, 1),
(45, '2023-12-27 17:44:31.117626', NULL, NULL, 1, NULL, 18, 2, 2),
(46, '2023-12-27 17:46:09.493787', NULL, NULL, 1, NULL, 9, 4, 4),
(47, '2023-12-27 17:46:30.399356', NULL, NULL, 1, NULL, 9, 3, 3),
(48, '2023-12-27 17:46:39.111275', NULL, NULL, 1, NULL, 4, 1, 1),
(49, '2023-12-27 17:47:38.530365', NULL, NULL, 1, NULL, 4, 1, 1),
(50, '2023-12-27 17:52:33.422280', NULL, NULL, 1, NULL, 4, 1, 1),
(51, '2023-12-27 17:52:46.286524', NULL, NULL, 1, NULL, 18, 2, 2),
(52, '2023-12-27 17:53:26.288997', NULL, NULL, 1, NULL, 18, 2, 2),
(53, '2023-12-27 17:54:48.381285', NULL, NULL, 1, NULL, 4, 1, 1),
(54, '2023-12-27 17:55:51.934028', NULL, NULL, 1, NULL, 4, 1, 1),
(55, '2023-12-27 17:56:51.169416', NULL, NULL, 1, NULL, 4, 1, 1),
(56, '2023-12-27 17:58:23.361485', NULL, NULL, 1, NULL, 4, 1, 1),
(57, '2023-12-27 18:01:18.394623', NULL, NULL, 1, NULL, 4, 1, 1),
(58, '2023-12-27 18:03:32.614441', NULL, NULL, 1, NULL, 4, 1, 1),
(59, '2023-12-27 18:03:49.839571', NULL, NULL, 1, NULL, 4, 1, 1),
(60, '2023-12-27 18:04:43.480271', NULL, NULL, 1, NULL, 4, 1, 1),
(61, '2023-12-27 18:07:04.345520', NULL, NULL, 1, NULL, 4, 1, 1),
(62, '2023-12-27 18:17:48.258347', NULL, NULL, 1, NULL, 4, 1, 1),
(63, '2023-12-27 18:18:18.044489', NULL, NULL, 1, NULL, 4, 1, 1),
(64, '2023-12-27 18:24:11.337597', NULL, NULL, 1, NULL, 18, 2, 2),
(65, '2023-12-27 18:26:00.215155', NULL, NULL, 1, NULL, 18, 2, 2),
(66, '2023-12-27 18:26:14.663225', NULL, NULL, 1, NULL, 18, 2, 2),
(67, '2023-12-27 18:27:44.034569', NULL, NULL, 1, NULL, 18, 2, 2),
(68, '2023-12-27 18:35:50.217669', NULL, NULL, 1, NULL, 18, 2, 2),
(69, '2023-12-27 18:37:00.713245', NULL, NULL, 1, NULL, 18, 2, 2),
(70, '2023-12-27 18:38:18.803872', NULL, NULL, 1, NULL, 18, 2, 2),
(71, '2023-12-27 18:48:24.506139', NULL, NULL, 1, NULL, 18, 2, 2),
(72, '2023-12-27 18:48:49.126566', NULL, NULL, 1, NULL, 18, 2, 2),
(73, '2023-12-27 18:49:49.852682', NULL, NULL, 1, NULL, 18, 2, 2),
(74, '2023-12-27 18:53:26.854316', NULL, NULL, 1, NULL, 18, 2, 2),
(75, '2023-12-27 19:06:36.062027', NULL, NULL, 1, NULL, 18, 2, 2),
(76, '2023-12-27 19:08:36.803357', NULL, NULL, 1, NULL, 18, 2, 2),
(77, '2023-12-27 19:14:28.483419', NULL, NULL, 1, NULL, 18, 2, 2),
(78, '2023-12-27 19:16:44.381172', NULL, NULL, 1, NULL, 18, 2, 2),
(79, '2023-12-27 19:17:15.623052', NULL, NULL, 1, NULL, 18, 2, 2),
(80, '2023-12-27 19:17:53.514178', NULL, NULL, 1, NULL, 18, 2, 2),
(81, '2023-12-27 19:21:13.540799', NULL, NULL, 1, NULL, 4, 1, 1),
(82, '2023-12-27 19:22:47.491778', NULL, NULL, 1, NULL, 4, 1, 1),
(83, '2023-12-27 19:23:15.149708', NULL, NULL, 1, NULL, 18, 2, 2),
(84, '2023-12-27 19:24:29.596965', NULL, NULL, 1, NULL, 4, 1, 1),
(85, '2023-12-27 19:26:36.830295', NULL, NULL, 1, NULL, 4, 1, 1),
(86, '2023-12-27 19:29:20.131748', NULL, NULL, 1, NULL, 4, 1, 1),
(87, '2023-12-27 19:29:28.748606', NULL, NULL, 1, NULL, 4, 1, 1),
(88, '2023-12-27 19:30:28.055897', NULL, NULL, 1, NULL, 4, 1, 1),
(89, '2023-12-27 19:30:53.405432', NULL, NULL, 1, NULL, 4, 1, 1),
(90, '2023-12-27 19:31:01.686041', NULL, NULL, 1, NULL, 4, 1, 1),
(91, '2023-12-27 19:47:40.416615', NULL, NULL, 1, NULL, 4, 1, 1);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

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
