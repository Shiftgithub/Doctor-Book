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
-- Table structure for table `adminpanel_department`
--

CREATE TABLE `adminpanel_department` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_department`
--

INSERT INTO `adminpanel_department` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cardiology', 'Cardiology is the study of the heart. Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system. The field includes medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease, and electrophysiology', '2023-06-27 15:31:23.024744', NULL, NULL),
(2, 'Radiology', 'Radiology is the medical discipline that uses medical imaging to diagnose diseases and guide their treatment, within the bodies of humans and other animals', '2023-06-27 15:31:51.912129', NULL, NULL),
(3, 'Orthopedic', 'Orthopedic surgery or orthopedics, is the branch of surgery concerned with conditions involving the musculoskeletal system. Orthopedic surgeons use both surgical and nonsurgical means to treat musculoskeletal trauma, spine diseases, sports injuries, degenerative diseases, infections, tumors, and congenital disorders', '2023-06-27 15:37:36.134056', NULL, NULL),
(4, 'Neurology', 'Neurology is the branch of medicine dealing with the diagnosis and treatment of all categories of conditions and disease involving the nervous system, which comprises the brain, the spinal cord and the peripheral nerves', '2023-06-27 15:37:56.654819', NULL, NULL),
(5, 'Intensive care medicine', 'Intensive care medicine, also called critical care medicine, is a medical specialty that deals with seriously or critically ill patients who have, are at risk of, or are recovering from conditions that may be life-threatening.', '2023-06-27 15:38:29.445529', NULL, NULL),
(6, 'Gastroenterology', 'Gastroenterology is the branch of medicine focused on the digestive system and its disorders. The digestive system consists of the gastrointestinal tract, sometimes referred to as the GI tract', '2023-06-27 15:38:52.349986', NULL, NULL),
(7, 'Outpatient Department', 'An outpatient department or outpatient clinic is the part of a hospital designed for the treatment of outpatients, people with health problems who visit the hospital for diagnosis or treatment, but do not at this time require a bed or to be admitted for overnight care', '2023-06-27 15:39:16.256063', NULL, NULL),
(8, 'Obstetrics and Gynaecology', 'Obstetrics and Gynaecology is the medical specialty that encompasses the two subspecialties of obstetrics and gynecology.', '2023-06-27 15:39:40.515379', NULL, NULL),
(9, 'Otorhinolaryngology', 'Otorhinolaryngology is a surgical subspeciality within medicine that deals with the surgical and medical management of conditions of the head and neck. Doctors who specialize in this area are called otorhinolaryngologists, otolaryngologists, head and neck surgeons, or ENT surgeons or physicians', '2023-06-27 15:39:57.423909', NULL, NULL),
(10, 'Anesthesiology', 'Anesthesiology, anaesthesiology, or anaesthesia is the medical specialty concerned with the total perioperative care of patients before, during and after surgery. It encompasses anesthesia, intensive care medicine, critical emergency medicine, and pain medicine.', '2023-06-27 15:40:39.684386', NULL, NULL),
(11, 'Hematology', 'Hematology is the branch of medicine concerned with the study of the cause, prognosis, treatment, and prevention of diseases related to blood.', '2023-06-27 15:40:58.618505', NULL, NULL),
(12, 'Casualty department', 'An emergency department, also known as an accident and emergency department, emergency room, emergency ward or casualty department, is a medical treatment facility specializing in emergency medicine, the acute care of patients who present without prior appointment; either by their own means or by that of an ambulance', '2023-06-27 15:41:23.975982', NULL, NULL),
(13, 'Geriatrics', 'Geriatrics, or geriatric medicine, is a medical specialty focused on providing care for the unique health needs of older adults. The term geriatrics originates from the Greek γέρων geron meaning \"old man\", and ιατρός iatros meaning \"healer\".', '2023-06-27 15:41:36.877078', NULL, NULL),
(14, 'ICU', 'An intensive care unit, also known as an intensive therapy unit or intensive treatment unit or critical care unit, is a special department of a hospital or health care facility that provides intensive care medicine', '2023-06-27 15:41:53.719358', NULL, NULL),
(15, 'Coronary care unit', 'A coronary care unit or cardiac intensive care unit is a hospital ward specialized in the care of patients with heart attacks, unstable angina, cardiac dysrhythmia and various other cardiac conditions that require continuous monitoring and treatment', '2023-06-27 15:42:26.252353', NULL, NULL),
(16, 'Unit of measurement', 'A unit of measurement is a definite magnitude of a quantity, defined and adopted by convention or by law, that is used as a standard for measurement of the same kind of quantity. Any other quantity of that kind can be expressed as a multiple of the unit of measurement. For example, a length is a physical quantity.', '2023-06-27 15:42:42.684938', NULL, NULL),
(17, 'Information', 'Information is an abstract concept that refers to that which has the power to inform. At the most fundamental level, information pertains to the interpretation of that which may be sensed, or their abstractions', '2023-06-27 15:42:58.511780', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpanel_department`
--
ALTER TABLE `adminpanel_department`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpanel_department`
--
ALTER TABLE `adminpanel_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
