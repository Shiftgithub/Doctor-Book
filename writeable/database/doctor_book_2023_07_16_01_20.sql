-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2023 at 09:19 PM
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
-- Table structure for table `adminpanel_article`
--

CREATE TABLE `adminpanel_article` (
  `id` bigint(20) NOT NULL,
  `heading` varchar(1000) NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_availability`
--

CREATE TABLE `adminpanel_availability` (
  `id` bigint(20) NOT NULL,
  `appointment_availability` varchar(255) DEFAULT NULL,
  `accepting_new_patients` varchar(255) DEFAULT NULL,
  `average_wait_time` varchar(255) DEFAULT NULL,
  `consultation_fee` decimal(10,2) DEFAULT NULL,
  `available_facilities` varchar(255) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_awards`
--

CREATE TABLE `adminpanel_awards` (
  `id` bigint(20) NOT NULL,
  `awards_and_honors` varchar(255) DEFAULT NULL,
  `publications` varchar(255) DEFAULT NULL,
  `memberships` varchar(255) DEFAULT NULL,
  `board_certification_number` varchar(255) DEFAULT NULL,
  `research_interests` varchar(255) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_blood_group`
--

CREATE TABLE `adminpanel_blood_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_blood_group`
--

INSERT INTO `adminpanel_blood_group` (`id`, `name`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'O+'),
(6, 'O-'),
(7, 'AB+'),
(8, 'AB-');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_board`
--

CREATE TABLE `adminpanel_board` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_board`
--

INSERT INTO `adminpanel_board` (`id`, `name`) VALUES
(1, 'Barisal Board'),
(2, 'Chittagong Board'),
(3, 'Comilla Board'),
(4, 'Dhaka Board'),
(5, 'Dinajpur Board'),
(6, 'Jessore Board'),
(7, 'Mymensingh Board'),
(8, 'Rajshahi Board'),
(9, 'Sylhet Board'),
(10, 'Madrasah Education Board'),
(11, 'Technical Education Board'),
(12, 'National Curriculum and Textbook Board.');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_bodypart`
--

CREATE TABLE `adminpanel_bodypart` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_departmentspecification`
--

CREATE TABLE `adminpanel_departmentspecification` (
  `id` bigint(20) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `organ_problem_specification_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `division_id` bigint(20) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_doctor_profile`
--

CREATE TABLE `adminpanel_doctor_profile` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `nid_no` varchar(255) NOT NULL,
  `phone_no` varchar(110) NOT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `languages_spoken` varchar(255) NOT NULL,
  `passport_no` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `blood_group_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `gender_id` bigint(20) NOT NULL,
  `matrimony_id` bigint(20) NOT NULL,
  `religion_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_education`
--

CREATE TABLE `adminpanel_education` (
  `id` bigint(20) NOT NULL,
  `certificate_degree` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `passing_year` date NOT NULL,
  `board_id` bigint(20) NOT NULL,
  `doctor_profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_faq`
--

CREATE TABLE `adminpanel_faq` (
  `id` bigint(20) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_gender`
--

CREATE TABLE `adminpanel_gender` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_gender`
--

INSERT INTO `adminpanel_gender` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_images`
--

CREATE TABLE `adminpanel_images` (
  `id` bigint(20) NOT NULL,
  `doctor_photos` varchar(100) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_matrimony`
--

CREATE TABLE `adminpanel_matrimony` (
  `id` bigint(20) NOT NULL,
  `name` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_matrimony`
--

INSERT INTO `adminpanel_matrimony` (`id`, `name`) VALUES
(1, 'Married'),
(2, 'Unmarried'),
(3, 'Separated, or Widowed'),
(4, 'Divorced'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_organ`
--

CREATE TABLE `adminpanel_organ` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `body_part_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_organsproblemspecification`
--

CREATE TABLE `adminpanel_organsproblemspecification` (
  `id` bigint(20) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `problem_specification` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `organ_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_permanentaddress`
--

CREATE TABLE `adminpanel_permanentaddress` (
  `id` bigint(20) NOT NULL,
  `permanent_village_state` varchar(255) NOT NULL,
  `permanent_postal_code` int(11) NOT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `permanent_district_id` bigint(20) NOT NULL,
  `permanent_division_id` bigint(20) NOT NULL,
  `permanent_upazila_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_presentaddress`
--

CREATE TABLE `adminpanel_presentaddress` (
  `id` bigint(20) NOT NULL,
  `present_village_state` varchar(255) NOT NULL,
  `present_postal_code` int(11) NOT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `present_district_id` bigint(20) NOT NULL,
  `present_division_id` bigint(20) NOT NULL,
  `present_upazila_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_religion`
--

CREATE TABLE `adminpanel_religion` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_religion`
--

INSERT INTO `adminpanel_religion` (`id`, `name`) VALUES
(1, 'Islam'),
(2, 'Hinduism'),
(3, 'Christianity'),
(4, 'Buddhism'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_services`
--

CREATE TABLE `adminpanel_services` (
  `id` bigint(20) NOT NULL,
  `treatments` varchar(255) DEFAULT NULL,
  `procedures` varchar(255) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_social_media`
--

CREATE TABLE `adminpanel_social_media` (
  `id` bigint(20) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_upazila`
--

CREATE TABLE `adminpanel_upazila` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `district_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_upazila`
--

INSERT INTO `adminpanel_upazila` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `district_id`) VALUES
(1, 'Akkelpur Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 1),
(2, 'Joypurhat Sadar Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 1),
(3, 'Kalai Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 1),
(4, 'Khetlal Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 1),
(5, 'Panchbibi Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 1),
(6, 'Adamdighi Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(7, 'Bogura SadarUpazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(8, 'Dhunat Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(9, 'Dhupchanchia Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(10, 'Gabtali Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(11, 'Kahaloo Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(12, 'Nandigram Upazila', '2020-11-11 12:26:07.000000', '2020-11-11 12:26:07.000000', NULL, 2),
(13, 'Sariakandi Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 2),
(14, 'Shajahanpur Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 2),
(15, 'Sherpur Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 2),
(16, 'ShibganjUpazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 2),
(17, 'Sonatola Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 2),
(18, 'Atrai Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(19, 'Badalgachhi Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(20, 'Manda Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(21, 'Dhamoirhat Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(22, 'Mohadevpur Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(23, 'Naogaon Sadar Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(24, 'Niamatpur Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(25, 'Patnitala Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(26, 'Porsha Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(27, 'Raninagar Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(28, 'Sapahar Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 3),
(29, 'Bagatipara Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(30, 'Baraigram Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(31, 'Gurudaspur Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(32, 'Lalpur Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(33, 'Natore Sadar Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(34, 'Singra Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(35, 'Naldanga Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 4),
(36, 'Bholahat Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 5),
(37, 'GomastapurUpazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 5),
(38, 'Nachole Upazila', '2020-11-11 12:26:08.000000', '2020-11-11 12:26:08.000000', NULL, 5),
(39, 'NawabganjSadar Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 5),
(40, 'ShibganjUpazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 5),
(41, 'Atgharia Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(42, 'Bera Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(43, 'Bhangura Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(44, 'Chatmohar Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(45, 'Faridpur Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(46, 'Ishwardi Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(47, 'Pabna Sadar Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(48, 'Santhia Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(49, 'Sujanagar Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 6),
(50, 'Belkuchi Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(51, 'Chauhali Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(52, 'Kamarkhanda Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(53, 'Kazipur Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(54, 'Raiganj Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(55, 'Shahjadpur Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(56, 'Sirajganj Sadar Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(57, 'Tarash Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(58, 'Ullahpara Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 7),
(59, 'Bagha Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(60, 'Bagmara Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(61, 'Charghat Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(62, 'Durgapur Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(63, 'Godagari Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(64, 'Mohanpur Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(65, 'Paba Upazila', '2020-11-11 12:26:09.000000', '2020-11-11 12:26:09.000000', NULL, 8),
(66, 'Puthia Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 8),
(67, 'Tanore Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 8),
(68, 'Birampur Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(69, 'Birganj Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(70, 'Biral Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(71, 'Bochaganj Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(72, 'Chirirbandar Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(73, 'PhulbariUpazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(74, 'Ghoraghat Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(75, 'Hakimpur Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(76, 'Kaharole Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(77, 'Khansama Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(78, 'Dinajpur Sadar Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(79, 'Nawabganj Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(80, 'Parbatipur Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 9),
(81, 'Phulchhari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(82, 'Gaibandha Sadar Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(83, 'Gobindaganj Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(84, 'Palashbari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(85, 'Sadullapur Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(86, 'Sughatta Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(87, 'Sundarganj Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 10),
(88, 'Bhurungamari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(89, 'Char Rajibpur Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(90, 'Chilmari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(91, 'Phulbari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(92, 'Kurigram Sadar Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(93, 'Nageshwari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(94, 'Rajarhat Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(95, 'Raomari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(96, 'Ulipur Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 11),
(97, 'Aditmari Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 12),
(98, 'Hatibandha Upazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 12),
(99, 'KaliganjUpazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 12),
(100, 'Lalmonirhat SadarUpazila', '2020-11-11 12:26:10.000000', '2020-11-11 12:26:10.000000', NULL, 12),
(101, 'Patgram Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 12),
(102, 'Dimla Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 13),
(103, 'Domar Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 13),
(104, 'Jaldhaka Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 13),
(105, 'Kishoreganj Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 13),
(106, 'Nilphamari Sadar Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 13),
(107, 'Saidpur Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 13),
(108, 'Atwari Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 14),
(109, 'Boda Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 14),
(110, 'Debiganj Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 14),
(111, 'Panchagarh Sadar Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 14),
(112, 'Tetulia Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 14),
(113, 'Badarganj Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(114, 'GangachharaUpazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(115, 'Kaunia Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(116, 'Rangpur Sadar Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(117, 'Mithapukur Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(118, 'Pirgachha Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(119, 'Pirganj Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(120, 'Taraganj Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 15),
(121, 'Baliadangi Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 16),
(122, 'Haripur Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 16),
(123, 'Pirganj Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 16),
(124, 'Ranisankail Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 16),
(125, 'Thakurgaon Sadar Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 16),
(126, 'Atpara Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 17),
(127, 'Barhatta Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 17),
(128, 'Durgapur Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 17),
(129, 'Khaliajuri Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 17),
(130, 'Kalmakanda Upazila', '2020-11-11 12:26:11.000000', '2020-11-11 12:26:11.000000', NULL, 17),
(131, 'Kendua Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 17),
(132, 'Madan Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 17),
(133, 'Mohanganj Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 17),
(134, 'Netrokona Sadar Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 17),
(135, 'Purbadhala Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 17),
(136, 'Jhenaigati Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 18),
(137, 'Nakla Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 18),
(138, 'Nalitabari Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 18),
(139, 'Sherpur Sadar Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 18),
(140, 'Sreebardi Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 18),
(141, 'Baksiganj Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(142, 'Dewanganj Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(143, 'Islampur Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(144, 'Jamalpur Sadar Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(145, 'Madarganj Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(146, 'Melandaha Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(147, 'Sarishabari Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 19),
(148, 'Trishal Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(149, 'Dhobaura Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(150, 'Fulbaria Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(151, 'Gafargaon Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(152, 'Gauripur Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(153, 'Haluaghat Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(154, 'Ishwarganj Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(155, 'Mymensingh Sadar Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(156, 'MuktagachhaUpazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(157, 'Nandail Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(158, 'Phulpur Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(159, 'Bhaluka Upazila', '2020-11-11 12:26:12.000000', '2020-11-11 12:26:12.000000', NULL, 20),
(160, 'Tara KhandaUpazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 20),
(161, 'Amtali Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 21),
(162, 'Bamna Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 21),
(163, 'Barguna Sadar Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 21),
(164, 'Betagi Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 21),
(165, 'Patharghata Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 21),
(166, 'Taltali Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 21),
(167, 'Agailjhara Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(168, 'Babuganj Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(169, 'Bakerganj Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(170, 'Banaripara Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(171, 'Gaurnadi Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(172, 'Hizla Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(173, 'BarishalSadar Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(174, 'Mehendiganj Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(175, 'Muladi Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(176, 'Wazirpur Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 22),
(177, 'Bhola Sadar Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(178, 'BurhanuddinUpazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(179, 'Char Fasson Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(180, 'Daulatkhan Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(181, 'Lalmohan Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(182, 'Manpura Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(183, 'Tazumuddin Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 23),
(184, 'Jhalokati Sadar Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 24),
(185, 'Kathalia Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 24),
(186, 'Nalchity Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 24),
(187, 'Rajapur Upazila', '2020-11-11 12:26:13.000000', '2020-11-11 12:26:13.000000', NULL, 24),
(188, 'Bauphal Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(189, 'Dashmina Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(190, 'Galachipa Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(191, 'Kalapara Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(192, 'Mirzaganj Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(193, 'Patuakhali Sadar Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(194, 'Rangabali Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(195, 'Dumki Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 25),
(196, 'Bhandaria Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(197, 'Kawkhali Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(198, 'Mathbaria Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(199, 'Nazirpur Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(200, 'Pirojpur Sadar Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(201, 'Nesarabad(Swarupkati) Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(202, 'Indurkani Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 26),
(203, 'Ali Kadam Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(204, 'Bandarban Sadar Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(205, 'Lama Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(206, 'Naikhongchhari Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(207, 'Rowangchhari Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(208, 'Ruma Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(209, 'Thanchi Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 27),
(210, 'Akhaura Upazila', '2020-11-11 12:26:14.000000', '2020-11-11 12:26:14.000000', NULL, 28),
(211, 'Bancharampur Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(212, 'Brahmanbaria SadarUpazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(213, 'Kasba Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(214, 'Nabinagar Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(215, 'Nasirnagar Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(216, 'Sarail Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(217, 'Ashuganj Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(218, 'Bijoynagar Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 28),
(219, 'Chandpur Sadar Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(220, 'Faridganj Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(221, 'Haimchar Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(222, 'Haziganj Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(223, 'Kachua Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(224, 'Matlab Dakshin Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(225, 'Matlab Uttar Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(226, 'Shahrasti Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 29),
(227, 'Anwara Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(228, 'Banshkhali Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(229, 'Boalkhali Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(230, 'Chandanaish Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(231, 'Fatikchhari Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(232, 'Hathazari Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(233, 'Karnaphuli Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(234, 'LohagaraUpazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(235, 'Mirsharai Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(236, 'Patiya Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(237, 'Rangunia Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(238, 'Raozan Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(239, 'Sandwip Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(240, 'Satkania Upazila', '2020-11-11 12:26:15.000000', '2020-11-11 12:26:15.000000', NULL, 30),
(241, 'Sitakunda Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 30),
(242, 'Barura Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(243, 'Brahmanpara Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(244, 'Burichang Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(245, 'Chandina Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(246, 'Chauddagram Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(247, 'Daudkandi Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(248, 'Debidwar Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(249, 'Homna Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(250, 'Laksam Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(251, 'Lalmai Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(252, 'Muradnagar Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(253, 'Nangalkot Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(254, 'Cumilla Adarsha Sadar Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(255, 'Meghna Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(256, 'Titas Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(257, 'MonohargonjUpazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(258, 'Cumilla Sadar Dakshin Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 31),
(259, 'Chakaria Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(260, 'Cox\'s Bazar SadarUpazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(261, 'Kutubdia Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(262, 'Maheshkhali Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(263, 'Ramu Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(264, 'Teknaf Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(265, 'Ukhia Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(266, 'Pekua Upazila', '2020-11-11 12:26:16.000000', '2020-11-11 12:26:16.000000', NULL, 32),
(267, 'Chhagalnaiya Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 33),
(268, 'Daganbhuiyan Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 33),
(269, 'Feni Sadar Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 33),
(270, 'Parshuram Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 33),
(271, 'Sonagazi Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 33),
(272, 'Fulgazi Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 33),
(273, 'Dighinala Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(274, 'KhagrachhariUpazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(275, 'Lakshmichhari Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(276, 'Mahalchhari Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(277, 'Manikchhari Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(278, 'Matiranga Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(279, 'Panchhari Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(280, 'Ramgarh Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 34),
(281, 'Lakshmipur Sadar Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 35),
(282, 'Raipur Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 35),
(283, 'Ramganj Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 35),
(284, 'Ramgati Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 35),
(285, 'Kamalnagar Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 35),
(286, 'Begumganj Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(287, 'Noakhali Sadar Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(288, 'Chatkhil Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(289, 'CompaniganjUpazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(290, 'Hatiya Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(291, 'Senbagh Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(292, 'Sonaimuri Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(293, 'SubarnacharUpazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(294, 'Kabirhat Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 36),
(295, 'Bagaichhari Upazila', '2020-11-11 12:26:17.000000', '2020-11-11 12:26:17.000000', NULL, 37),
(296, 'Barkal Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(297, 'Kawkhali(Betbunia) Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(298, 'Belaichhari Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(299, 'Kaptai Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(300, 'Juraichhari Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(301, 'Langadu Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(302, 'NaniyacharUpazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(303, 'Rajasthali Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(304, 'Rangamati Sadar Upazila', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 37),
(305, 'Metropolitan Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(306, 'Adabor Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(307, 'Uttar Khan Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(308, 'Uttara Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(309, 'Kadamtali Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(310, 'Kalabagan Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(311, 'Kafrul Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(312, 'Kamrangirchar Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(313, 'Cantonment Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(314, 'Kotwali Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(315, 'Khilkhet Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(316, 'Khilgaon Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(317, 'Gulshan Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(318, 'Gendaria Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(319, 'Chawkbazar Model Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(320, 'Demra Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(321, 'Turag Thana', '2020-11-11 12:26:18.000000', '2020-11-11 12:26:18.000000', NULL, 38),
(322, 'Tejgaon Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(323, 'Tejgaon I/A Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(324, 'Dakshinkhan Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(325, 'Darus Salam Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(326, 'Dhanmondi  Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(327, 'New Market Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(328, 'Paltan Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(329, 'Pallabi Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(330, 'Bangshal Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(331, 'Badda Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(332, 'Bimanbandar Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(333, 'Motijheel Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(334, 'Mirpur Model Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(335, 'Mohammadpur Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(336, 'Jatrabari Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(337, 'Ramna Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(338, 'Rampura Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(339, 'Lalbagh Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(340, 'Shah Ali Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(341, 'Shahbagh Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(342, 'Sher-e-Bangla Nagar Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(343, 'Shyampur Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(344, 'Sabujbagh Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(345, 'Sutrapur Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(346, 'Hazaribagh Thana', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(347, 'Dhamrai Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(348, 'Dohar Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(349, 'Keraniganj Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(350, 'Nawabganj Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(351, 'Savar Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(352, 'Tejgaon Circle Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 38),
(353, 'Gazipur Sadar Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 39),
(354, 'Kaliakair Upazila', '2020-11-11 12:26:19.000000', '2020-11-11 12:26:19.000000', NULL, 39),
(355, 'Kaliganj Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 39),
(356, 'Kapasia Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 39),
(357, 'Sreepur Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 39),
(358, 'Gopalganj Sadar Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 40),
(359, 'Kashiani Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 40),
(360, 'Kotalipara Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 40),
(361, 'Muksudpur Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 40),
(362, 'Tungipara Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 40),
(363, 'Austagram Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(364, 'Bajitpur Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(365, 'Bhairab Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(366, 'Hossainpur Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(367, 'Itna Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(368, 'Karimganj Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(369, 'Katiadi Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(370, 'Kishoreganj SadarUpazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(371, 'Kuliarchar Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(372, 'Mithamain Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(373, 'Nikli Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(374, 'Pakundia Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(375, 'Tarail Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 41),
(376, 'Rajoir Upazila', '2020-11-11 12:26:20.000000', '2020-11-11 12:26:20.000000', NULL, 42),
(377, 'MadaripurSadar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 42),
(378, 'Kalkini Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 42),
(379, 'Shibchar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 42),
(380, 'DaulatpurUpazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(381, 'Ghior Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(382, 'Harirampur Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(383, 'ManikgonjSadar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(384, 'Saturia Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(385, 'Shivalaya Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(386, 'Singair Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 43),
(387, 'Gazaria Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 44),
(388, 'Lohajang Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 44),
(389, 'Munshiganj Sadar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 44),
(390, 'Sirajdikhan Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 44),
(391, 'Sreenagar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 44),
(392, 'Tongibari Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 44),
(393, 'Araihazar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 45),
(394, 'Bandar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 45),
(395, 'Narayanganj SadarUpazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 45),
(396, 'Rupganj Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 45),
(397, 'Sonargaon Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 45),
(398, 'Baliakandi Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 46),
(399, 'GoalandaghatUpazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 46),
(400, 'Pangsha Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 46),
(401, 'Rajbari Sadar Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 46),
(402, 'Kalukhali Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 46),
(403, 'Bhedarganj Upazila', '2020-11-11 12:26:21.000000', '2020-11-11 12:26:21.000000', NULL, 47),
(404, 'Damudya Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 47),
(405, 'Gosairhat Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 47),
(406, 'Naria Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 47),
(407, 'Shariatpur Sadar Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 47),
(408, 'Zajira Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 47),
(409, 'Shakhipur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 47),
(410, 'Alfadanga Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(411, 'Bhanga Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(412, 'Boalmari Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(413, 'Charbhadrasan Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(414, 'Faridpur Sadar Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(415, 'Madhukhali Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(416, 'Nagarkanda Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(417, 'Sadarpur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(418, 'Saltha Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 48),
(419, 'Gopalpur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(420, 'Basail Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(421, 'Bhuapur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(422, 'Delduar Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(423, 'Ghatail Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(424, 'Kalihati Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(425, 'Madhupur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(426, 'Mirzapur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(427, 'Nagarpur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(428, 'Sakhipur Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(429, 'Dhanbari Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(430, 'Tangail Sadar Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 49),
(431, 'Narsingdi Sadar Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 50),
(432, 'Belabo Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 50),
(433, 'Monohardi Upazila', '2020-11-11 12:26:22.000000', '2020-11-11 12:26:22.000000', NULL, 50),
(434, 'Palash Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 50),
(435, 'RaipuraUpazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 50),
(436, 'Shibpur Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 50),
(437, 'Bagerhat Sadar Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(438, 'Chitalmari Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(439, 'Fakirhat Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(440, 'Kachua Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(441, 'Mollahat Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(442, 'Mongla Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(443, 'Morrelganj Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(444, 'Rampal Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(445, 'Sarankhola Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 51),
(446, 'Alamdanga Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 52),
(447, 'Chuadanga Sadar Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 52),
(448, 'Damurhuda Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 52),
(449, 'Jibannagar Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 52),
(450, 'Abhaynagar Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(451, 'Bagherpara Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(452, 'Chaugachha Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(453, 'JhikargachhaUpazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(454, 'Keshabpur Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(455, 'Jashore SadarUpazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(456, 'Manirampur Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(457, 'Sharsha Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 53),
(458, 'Harinakunda Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 54),
(459, 'Jhenaidah Sadar Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 54),
(460, 'Kaliganj Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 54),
(461, 'Kotchandpur Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 54),
(462, 'Maheshpur Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 54),
(463, 'Shailkupa Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 54),
(464, 'Batiaghata Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 55),
(465, 'Dacope Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 55),
(466, 'Dumuria Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 55),
(467, 'Dighalia Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 55),
(468, 'Koyra Upazila', '2020-11-11 12:26:23.000000', '2020-11-11 12:26:23.000000', NULL, 55),
(469, 'Paikgachha Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 55),
(470, 'Phultala Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 55),
(471, 'Rupsha Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 55),
(472, 'Terokhada Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 55),
(473, 'Bheramara Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 56),
(474, 'Daulatpur Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 56),
(475, 'Khoksa Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 56),
(476, 'Kumarkhali Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 56),
(477, 'Kushtia Sadar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 56),
(478, 'Mirpur Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 56),
(479, 'Magura Sadar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 57),
(480, 'Mohammadpur Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 57),
(481, 'Shalikha Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 57),
(482, 'Sreepur Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 57),
(483, 'Gangni Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 58),
(484, 'Meherpur Sadar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 58),
(485, 'Mujibnagar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 58),
(486, 'Kalia Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 59),
(487, 'Lohagara Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 59),
(488, 'Narail Sadar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 59),
(489, 'Naragati Thana', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 59),
(490, 'Assasuni Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(491, 'Debhata Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(492, 'Kalaroa Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(493, 'Kaliganj Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(494, 'Satkhira Sadar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(495, 'Shyamnagar Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(496, 'Tala Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 60),
(497, 'Ajmiriganj Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 61),
(498, 'Bahubal Upazila', '2020-11-11 12:26:24.000000', '2020-11-11 12:26:24.000000', NULL, 61),
(499, 'BaniyachongUpazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(500, 'Chunarughat Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(501, 'Habiganj Sadar Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(502, 'Lakhai Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(503, 'Madhabpur Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(504, 'Nabiganj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(505, 'SayestaganjUpazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 61),
(506, 'Barlekha Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(507, 'Juri Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(508, 'Kamalganj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(509, 'Kulaura Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(510, 'Moulvibazar SadarUpazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(511, 'Rajnagar Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(512, 'Sreemangal Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 62),
(513, 'Bishwamvarpur Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(514, 'Chhatak Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(515, 'Dakshin SunamganjUpazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(516, 'Derai Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(517, 'DharamapashaUpazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(518, 'Dowarabazar Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(519, 'Jagannathpur Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(520, 'Jamalganj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(521, 'Sullah Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(522, 'Sunamganj Sadar Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63);
INSERT INTO `adminpanel_upazila` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `district_id`) VALUES
(523, 'Tahirpur Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 63),
(524, 'Balaganj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(525, 'Beanibazar Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(526, 'Bishwanath Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(527, 'Companigonj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(528, 'Dakshin Surma Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(529, 'Fenchuganj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(530, 'Golapganj Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(531, 'Gowainghat Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(532, 'Jaintiapur Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(533, 'Kanaighat Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(534, 'Osmani Nagar Upazila', '2020-11-11 12:26:25.000000', '2020-11-11 12:26:25.000000', NULL, 64),
(535, 'Sylhet Sadar Upazila', '2020-11-11 12:26:26.000000', '2020-11-11 12:26:26.000000', NULL, 64),
(536, 'Zakiganj Upazila', '2020-11-11 12:26:26.000000', '2020-11-11 12:26:26.000000', NULL, 64);

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_user`
--

CREATE TABLE `adminpanel_user` (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hash` varchar(64) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_user`
--

INSERT INTO `adminpanel_user` (`id`, `user_name`, `email`, `password`, `hash`, `role`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', 'active', '2023-07-02 23:27:25.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_varifyotp`
--

CREATE TABLE `adminpanel_varifyotp` (
  `id` bigint(20) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add blood_ group', 7, 'add_blood_group'),
(26, 'Can change blood_ group', 7, 'change_blood_group'),
(27, 'Can delete blood_ group', 7, 'delete_blood_group'),
(28, 'Can view blood_ group', 7, 'view_blood_group'),
(29, 'Can add board', 8, 'add_board'),
(30, 'Can change board', 8, 'change_board'),
(31, 'Can delete board', 8, 'delete_board'),
(32, 'Can view board', 8, 'view_board'),
(33, 'Can add body part', 9, 'add_bodypart'),
(34, 'Can change body part', 9, 'change_bodypart'),
(35, 'Can delete body part', 9, 'delete_bodypart'),
(36, 'Can view body part', 9, 'view_bodypart'),
(37, 'Can add department', 10, 'add_department'),
(38, 'Can change department', 10, 'change_department'),
(39, 'Can delete department', 10, 'delete_department'),
(40, 'Can view department', 10, 'view_department'),
(41, 'Can add district', 11, 'add_district'),
(42, 'Can change district', 11, 'change_district'),
(43, 'Can delete district', 11, 'delete_district'),
(44, 'Can view district', 11, 'view_district'),
(45, 'Can add division', 12, 'add_division'),
(46, 'Can change division', 12, 'change_division'),
(47, 'Can delete division', 12, 'delete_division'),
(48, 'Can view division', 12, 'view_division'),
(49, 'Can add doctor_ profile', 13, 'add_doctor_profile'),
(50, 'Can change doctor_ profile', 13, 'change_doctor_profile'),
(51, 'Can delete doctor_ profile', 13, 'delete_doctor_profile'),
(52, 'Can view doctor_ profile', 13, 'view_doctor_profile'),
(53, 'Can add gender', 14, 'add_gender'),
(54, 'Can change gender', 14, 'change_gender'),
(55, 'Can delete gender', 14, 'delete_gender'),
(56, 'Can view gender', 14, 'view_gender'),
(57, 'Can add matrimony', 15, 'add_matrimony'),
(58, 'Can change matrimony', 15, 'change_matrimony'),
(59, 'Can delete matrimony', 15, 'delete_matrimony'),
(60, 'Can view matrimony', 15, 'view_matrimony'),
(61, 'Can add organ', 16, 'add_organ'),
(62, 'Can change organ', 16, 'change_organ'),
(63, 'Can delete organ', 16, 'delete_organ'),
(64, 'Can view organ', 16, 'view_organ'),
(65, 'Can add religion', 17, 'add_religion'),
(66, 'Can change religion', 17, 'change_religion'),
(67, 'Can delete religion', 17, 'delete_religion'),
(68, 'Can view religion', 17, 'view_religion'),
(69, 'Can add user', 18, 'add_user'),
(70, 'Can change user', 18, 'change_user'),
(71, 'Can delete user', 18, 'delete_user'),
(72, 'Can view user', 18, 'view_user'),
(73, 'Can add varify otp', 19, 'add_varifyotp'),
(74, 'Can change varify otp', 19, 'change_varifyotp'),
(75, 'Can delete varify otp', 19, 'delete_varifyotp'),
(76, 'Can view varify otp', 19, 'view_varifyotp'),
(77, 'Can add upazila', 20, 'add_upazila'),
(78, 'Can change upazila', 20, 'change_upazila'),
(79, 'Can delete upazila', 20, 'delete_upazila'),
(80, 'Can view upazila', 20, 'view_upazila'),
(81, 'Can add social_ media', 21, 'add_social_media'),
(82, 'Can change social_ media', 21, 'change_social_media'),
(83, 'Can delete social_ media', 21, 'delete_social_media'),
(84, 'Can view social_ media', 21, 'view_social_media'),
(85, 'Can add services', 22, 'add_services'),
(86, 'Can change services', 22, 'change_services'),
(87, 'Can delete services', 22, 'delete_services'),
(88, 'Can view services', 22, 'view_services'),
(89, 'Can add present address', 23, 'add_presentaddress'),
(90, 'Can change present address', 23, 'change_presentaddress'),
(91, 'Can delete present address', 23, 'delete_presentaddress'),
(92, 'Can view present address', 23, 'view_presentaddress'),
(93, 'Can add permanent address', 24, 'add_permanentaddress'),
(94, 'Can change permanent address', 24, 'change_permanentaddress'),
(95, 'Can delete permanent address', 24, 'delete_permanentaddress'),
(96, 'Can view permanent address', 24, 'view_permanentaddress'),
(97, 'Can add organs problem specification', 25, 'add_organsproblemspecification'),
(98, 'Can change organs problem specification', 25, 'change_organsproblemspecification'),
(99, 'Can delete organs problem specification', 25, 'delete_organsproblemspecification'),
(100, 'Can view organs problem specification', 25, 'view_organsproblemspecification'),
(101, 'Can add images', 26, 'add_images'),
(102, 'Can change images', 26, 'change_images'),
(103, 'Can delete images', 26, 'delete_images'),
(104, 'Can view images', 26, 'view_images'),
(105, 'Can add faq', 27, 'add_faq'),
(106, 'Can change faq', 27, 'change_faq'),
(107, 'Can delete faq', 27, 'delete_faq'),
(108, 'Can view faq', 27, 'view_faq'),
(109, 'Can add education', 28, 'add_education'),
(110, 'Can change education', 28, 'change_education'),
(111, 'Can delete education', 28, 'delete_education'),
(112, 'Can view education', 28, 'view_education'),
(113, 'Can add department specification', 29, 'add_departmentspecification'),
(114, 'Can change department specification', 29, 'change_departmentspecification'),
(115, 'Can delete department specification', 29, 'delete_departmentspecification'),
(116, 'Can view department specification', 29, 'view_departmentspecification'),
(117, 'Can add awards', 30, 'add_awards'),
(118, 'Can change awards', 30, 'change_awards'),
(119, 'Can delete awards', 30, 'delete_awards'),
(120, 'Can view awards', 30, 'view_awards'),
(121, 'Can add availability', 31, 'add_availability'),
(122, 'Can change availability', 31, 'change_availability'),
(123, 'Can delete availability', 31, 'delete_availability'),
(124, 'Can view availability', 31, 'view_availability'),
(125, 'Can add article', 32, 'add_article'),
(126, 'Can change article', 32, 'change_article'),
(127, 'Can delete article', 32, 'delete_article'),
(128, 'Can view article', 32, 'view_article'),
(129, 'Can add patient_ profile', 33, 'add_patient_profile'),
(130, 'Can change patient_ profile', 33, 'change_patient_profile'),
(131, 'Can delete patient_ profile', 33, 'delete_patient_profile'),
(132, 'Can view patient_ profile', 33, 'view_patient_profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(32, 'adminpanel', 'article'),
(31, 'adminpanel', 'availability'),
(30, 'adminpanel', 'awards'),
(7, 'adminpanel', 'blood_group'),
(8, 'adminpanel', 'board'),
(9, 'adminpanel', 'bodypart'),
(10, 'adminpanel', 'department'),
(29, 'adminpanel', 'departmentspecification'),
(11, 'adminpanel', 'district'),
(12, 'adminpanel', 'division'),
(13, 'adminpanel', 'doctor_profile'),
(28, 'adminpanel', 'education'),
(27, 'adminpanel', 'faq'),
(14, 'adminpanel', 'gender'),
(26, 'adminpanel', 'images'),
(15, 'adminpanel', 'matrimony'),
(16, 'adminpanel', 'organ'),
(25, 'adminpanel', 'organsproblemspecification'),
(24, 'adminpanel', 'permanentaddress'),
(23, 'adminpanel', 'presentaddress'),
(17, 'adminpanel', 'religion'),
(22, 'adminpanel', 'services'),
(21, 'adminpanel', 'social_media'),
(20, 'adminpanel', 'upazila'),
(18, 'adminpanel', 'user'),
(19, 'adminpanel', 'varifyotp'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(33, 'landing', 'patient_profile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-15 19:18:21.753996'),
(2, 'auth', '0001_initial', '2023-07-15 19:18:23.111380'),
(3, 'admin', '0001_initial', '2023-07-15 19:18:23.501574'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-15 19:18:23.516845'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-15 19:18:23.530742'),
(6, 'adminpanel', '0001_initial', '2023-07-15 19:18:31.333828'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-07-15 19:18:31.504399'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-07-15 19:18:31.651974'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-07-15 19:18:31.688973'),
(10, 'auth', '0004_alter_user_username_opts', '2023-07-15 19:18:31.707120'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-07-15 19:18:31.819106'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-07-15 19:18:31.834297'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-07-15 19:18:31.857708'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-07-15 19:18:31.957372'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-07-15 19:18:32.006245'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-07-15 19:18:32.039774'),
(17, 'auth', '0011_update_proxy_permissions', '2023-07-15 19:18:32.075251'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-07-15 19:18:32.117209'),
(19, 'landing', '0001_initial', '2023-07-15 19:18:32.881159'),
(20, 'sessions', '0001_initial', '2023-07-15 19:18:33.051133');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `landing_patient_profile`
--

CREATE TABLE `landing_patient_profile` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(110) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nid_no` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `blood_group_id` bigint(20) DEFAULT NULL,
  `gender_id` bigint(20) DEFAULT NULL,
  `matrimony_id` bigint(20) DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpanel_article`
--
ALTER TABLE `adminpanel_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_article_created_by_id_a17110c1_fk_adminpanel_user_id` (`created_by_id`),
  ADD KEY `adminpanel_article_modified_by_id_1caf1b55_fk_adminpanel_user_id` (`modified_by_id`);

--
-- Indexes for table `adminpanel_availability`
--
ALTER TABLE `adminpanel_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_availabil_doctor_profile_id_2164014c_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_awards`
--
ALTER TABLE `adminpanel_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_awards_doctor_profile_id_8a212cb1_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_blood_group`
--
ALTER TABLE `adminpanel_blood_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_board`
--
ALTER TABLE `adminpanel_board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_bodypart`
--
ALTER TABLE `adminpanel_bodypart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_department`
--
ALTER TABLE `adminpanel_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_departmentspecification`
--
ALTER TABLE `adminpanel_departmentspecification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_departmen_department_id_36a3130d_fk_adminpane` (`department_id`),
  ADD KEY `adminpanel_departmen_organ_problem_specif_cc6990f1_fk_adminpane` (`organ_problem_specification_id`);

--
-- Indexes for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_district_division_id_cead86ca_fk_adminpane` (`division_id`);

--
-- Indexes for table `adminpanel_division`
--
ALTER TABLE `adminpanel_division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_doctor_profile`
--
ALTER TABLE `adminpanel_doctor_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_doctor_pr_gender_id_336c5df2_fk_adminpane` (`gender_id`),
  ADD KEY `adminpanel_doctor_pr_matrimony_id_f8614aef_fk_adminpane` (`matrimony_id`),
  ADD KEY `adminpanel_doctor_pr_religion_id_04558daa_fk_adminpane` (`religion_id`),
  ADD KEY `adminpanel_doctor_profile_user_id_ab620e9f_fk_adminpanel_user_id` (`user_id`),
  ADD KEY `adminpanel_doctor_pr_blood_group_id_b7d86c86_fk_adminpane` (`blood_group_id`),
  ADD KEY `adminpanel_doctor_pr_department_id_73f6d080_fk_adminpane` (`department_id`);

--
-- Indexes for table `adminpanel_education`
--
ALTER TABLE `adminpanel_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_education_board_id_85e5cbb8_fk_adminpanel_board_id` (`board_id`),
  ADD KEY `adminpanel_education_doctor_profile_id_dfe3a9a8_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_faq`
--
ALTER TABLE `adminpanel_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_faq_created_by_id_7f3c9366_fk_adminpanel_user_id` (`created_by_id`),
  ADD KEY `adminpanel_faq_modified_by_id_b3d0f2ab_fk_adminpanel_user_id` (`modified_by_id`);

--
-- Indexes for table `adminpanel_gender`
--
ALTER TABLE `adminpanel_gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_images`
--
ALTER TABLE `adminpanel_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_images_doctor_profile_id_c588c3f1_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_matrimony`
--
ALTER TABLE `adminpanel_matrimony`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_organ`
--
ALTER TABLE `adminpanel_organ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_organ_body_part_id_0c3e2b95_fk_adminpanel_bodypart_id` (`body_part_id`);

--
-- Indexes for table `adminpanel_organsproblemspecification`
--
ALTER TABLE `adminpanel_organsproblemspecification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_organspro_organ_id_0b63d7fb_fk_adminpane` (`organ_id`);

--
-- Indexes for table `adminpanel_permanentaddress`
--
ALTER TABLE `adminpanel_permanentaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_permanent_doctor_profile_id_75229c0e_fk_adminpane` (`doctor_profile_id`),
  ADD KEY `adminpanel_permanent_permanent_district_i_2985c0ac_fk_adminpane` (`permanent_district_id`),
  ADD KEY `adminpanel_permanent_permanent_division_i_5f98fbbd_fk_adminpane` (`permanent_division_id`),
  ADD KEY `adminpanel_permanent_permanent_upazila_id_0e3e5141_fk_adminpane` (`permanent_upazila_id`);

--
-- Indexes for table `adminpanel_presentaddress`
--
ALTER TABLE `adminpanel_presentaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_presentad_doctor_profile_id_009d9956_fk_adminpane` (`doctor_profile_id`),
  ADD KEY `adminpanel_presentad_present_district_id_db798df3_fk_adminpane` (`present_district_id`),
  ADD KEY `adminpanel_presentad_present_division_id_5cf3f6dc_fk_adminpane` (`present_division_id`),
  ADD KEY `adminpanel_presentad_present_upazila_id_e1608841_fk_adminpane` (`present_upazila_id`);

--
-- Indexes for table `adminpanel_religion`
--
ALTER TABLE `adminpanel_religion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_services`
--
ALTER TABLE `adminpanel_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_services_doctor_profile_id_2b3017c7_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_social_media`
--
ALTER TABLE `adminpanel_social_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_social_me_doctor_profile_id_c8311008_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_upazila`
--
ALTER TABLE `adminpanel_upazila`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_upazila_district_id_117c100b_fk_adminpane` (`district_id`);

--
-- Indexes for table `adminpanel_user`
--
ALTER TABLE `adminpanel_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_varifyotp`
--
ALTER TABLE `adminpanel_varifyotp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_varifyotp_user_id_b55e44d6_fk_adminpanel_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `landing_patient_profile`
--
ALTER TABLE `landing_patient_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `landing_patient_prof_blood_group_id_39ad4652_fk_adminpane` (`blood_group_id`),
  ADD KEY `landing_patient_prof_gender_id_ea271215_fk_adminpane` (`gender_id`),
  ADD KEY `landing_patient_prof_matrimony_id_4dfc7197_fk_adminpane` (`matrimony_id`),
  ADD KEY `landing_patient_prof_religion_id_26d8885c_fk_adminpane` (`religion_id`),
  ADD KEY `landing_patient_profile_user_id_b0ef12bd_fk_adminpanel_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpanel_article`
--
ALTER TABLE `adminpanel_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_availability`
--
ALTER TABLE `adminpanel_availability`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_awards`
--
ALTER TABLE `adminpanel_awards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_blood_group`
--
ALTER TABLE `adminpanel_blood_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `adminpanel_board`
--
ALTER TABLE `adminpanel_board`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `adminpanel_bodypart`
--
ALTER TABLE `adminpanel_bodypart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_department`
--
ALTER TABLE `adminpanel_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `adminpanel_departmentspecification`
--
ALTER TABLE `adminpanel_departmentspecification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `adminpanel_division`
--
ALTER TABLE `adminpanel_division`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `adminpanel_doctor_profile`
--
ALTER TABLE `adminpanel_doctor_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_education`
--
ALTER TABLE `adminpanel_education`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_faq`
--
ALTER TABLE `adminpanel_faq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_gender`
--
ALTER TABLE `adminpanel_gender`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminpanel_images`
--
ALTER TABLE `adminpanel_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_matrimony`
--
ALTER TABLE `adminpanel_matrimony`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adminpanel_organ`
--
ALTER TABLE `adminpanel_organ`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_organsproblemspecification`
--
ALTER TABLE `adminpanel_organsproblemspecification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_permanentaddress`
--
ALTER TABLE `adminpanel_permanentaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_presentaddress`
--
ALTER TABLE `adminpanel_presentaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_religion`
--
ALTER TABLE `adminpanel_religion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adminpanel_services`
--
ALTER TABLE `adminpanel_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_social_media`
--
ALTER TABLE `adminpanel_social_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_upazila`
--
ALTER TABLE `adminpanel_upazila`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT for table `adminpanel_user`
--
ALTER TABLE `adminpanel_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adminpanel_varifyotp`
--
ALTER TABLE `adminpanel_varifyotp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `landing_patient_profile`
--
ALTER TABLE `landing_patient_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminpanel_article`
--
ALTER TABLE `adminpanel_article`
  ADD CONSTRAINT `adminpanel_article_created_by_id_a17110c1_fk_adminpanel_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `adminpanel_user` (`id`),
  ADD CONSTRAINT `adminpanel_article_modified_by_id_1caf1b55_fk_adminpanel_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `adminpanel_user` (`id`);

--
-- Constraints for table `adminpanel_availability`
--
ALTER TABLE `adminpanel_availability`
  ADD CONSTRAINT `adminpanel_availabil_doctor_profile_id_2164014c_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_awards`
--
ALTER TABLE `adminpanel_awards`
  ADD CONSTRAINT `adminpanel_awards_doctor_profile_id_8a212cb1_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_departmentspecification`
--
ALTER TABLE `adminpanel_departmentspecification`
  ADD CONSTRAINT `adminpanel_departmen_department_id_36a3130d_fk_adminpane` FOREIGN KEY (`department_id`) REFERENCES `adminpanel_department` (`id`),
  ADD CONSTRAINT `adminpanel_departmen_organ_problem_specif_cc6990f1_fk_adminpane` FOREIGN KEY (`organ_problem_specification_id`) REFERENCES `adminpanel_organsproblemspecification` (`id`);

--
-- Constraints for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  ADD CONSTRAINT `adminpanel_district_division_id_cead86ca_fk_adminpane` FOREIGN KEY (`division_id`) REFERENCES `adminpanel_division` (`id`);

--
-- Constraints for table `adminpanel_doctor_profile`
--
ALTER TABLE `adminpanel_doctor_profile`
  ADD CONSTRAINT `adminpanel_doctor_pr_blood_group_id_b7d86c86_fk_adminpane` FOREIGN KEY (`blood_group_id`) REFERENCES `adminpanel_blood_group` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_department_id_73f6d080_fk_adminpane` FOREIGN KEY (`department_id`) REFERENCES `adminpanel_department` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_gender_id_336c5df2_fk_adminpane` FOREIGN KEY (`gender_id`) REFERENCES `adminpanel_gender` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_matrimony_id_f8614aef_fk_adminpane` FOREIGN KEY (`matrimony_id`) REFERENCES `adminpanel_matrimony` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_religion_id_04558daa_fk_adminpane` FOREIGN KEY (`religion_id`) REFERENCES `adminpanel_religion` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_profile_user_id_ab620e9f_fk_adminpanel_user_id` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_user` (`id`);

--
-- Constraints for table `adminpanel_education`
--
ALTER TABLE `adminpanel_education`
  ADD CONSTRAINT `adminpanel_education_board_id_85e5cbb8_fk_adminpanel_board_id` FOREIGN KEY (`board_id`) REFERENCES `adminpanel_board` (`id`),
  ADD CONSTRAINT `adminpanel_education_doctor_profile_id_dfe3a9a8_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_faq`
--
ALTER TABLE `adminpanel_faq`
  ADD CONSTRAINT `adminpanel_faq_created_by_id_7f3c9366_fk_adminpanel_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `adminpanel_user` (`id`),
  ADD CONSTRAINT `adminpanel_faq_modified_by_id_b3d0f2ab_fk_adminpanel_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `adminpanel_user` (`id`);

--
-- Constraints for table `adminpanel_images`
--
ALTER TABLE `adminpanel_images`
  ADD CONSTRAINT `adminpanel_images_doctor_profile_id_c588c3f1_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_organ`
--
ALTER TABLE `adminpanel_organ`
  ADD CONSTRAINT `adminpanel_organ_body_part_id_0c3e2b95_fk_adminpanel_bodypart_id` FOREIGN KEY (`body_part_id`) REFERENCES `adminpanel_bodypart` (`id`);

--
-- Constraints for table `adminpanel_organsproblemspecification`
--
ALTER TABLE `adminpanel_organsproblemspecification`
  ADD CONSTRAINT `adminpanel_organspro_organ_id_0b63d7fb_fk_adminpane` FOREIGN KEY (`organ_id`) REFERENCES `adminpanel_organ` (`id`);

--
-- Constraints for table `adminpanel_permanentaddress`
--
ALTER TABLE `adminpanel_permanentaddress`
  ADD CONSTRAINT `adminpanel_permanent_doctor_profile_id_75229c0e_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`),
  ADD CONSTRAINT `adminpanel_permanent_permanent_district_i_2985c0ac_fk_adminpane` FOREIGN KEY (`permanent_district_id`) REFERENCES `adminpanel_district` (`id`),
  ADD CONSTRAINT `adminpanel_permanent_permanent_division_i_5f98fbbd_fk_adminpane` FOREIGN KEY (`permanent_division_id`) REFERENCES `adminpanel_division` (`id`),
  ADD CONSTRAINT `adminpanel_permanent_permanent_upazila_id_0e3e5141_fk_adminpane` FOREIGN KEY (`permanent_upazila_id`) REFERENCES `adminpanel_upazila` (`id`);

--
-- Constraints for table `adminpanel_presentaddress`
--
ALTER TABLE `adminpanel_presentaddress`
  ADD CONSTRAINT `adminpanel_presentad_doctor_profile_id_009d9956_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`),
  ADD CONSTRAINT `adminpanel_presentad_present_district_id_db798df3_fk_adminpane` FOREIGN KEY (`present_district_id`) REFERENCES `adminpanel_district` (`id`),
  ADD CONSTRAINT `adminpanel_presentad_present_division_id_5cf3f6dc_fk_adminpane` FOREIGN KEY (`present_division_id`) REFERENCES `adminpanel_division` (`id`),
  ADD CONSTRAINT `adminpanel_presentad_present_upazila_id_e1608841_fk_adminpane` FOREIGN KEY (`present_upazila_id`) REFERENCES `adminpanel_upazila` (`id`);

--
-- Constraints for table `adminpanel_services`
--
ALTER TABLE `adminpanel_services`
  ADD CONSTRAINT `adminpanel_services_doctor_profile_id_2b3017c7_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_social_media`
--
ALTER TABLE `adminpanel_social_media`
  ADD CONSTRAINT `adminpanel_social_me_doctor_profile_id_c8311008_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_upazila`
--
ALTER TABLE `adminpanel_upazila`
  ADD CONSTRAINT `adminpanel_upazila_district_id_117c100b_fk_adminpane` FOREIGN KEY (`district_id`) REFERENCES `adminpanel_district` (`id`);

--
-- Constraints for table `adminpanel_varifyotp`
--
ALTER TABLE `adminpanel_varifyotp`
  ADD CONSTRAINT `adminpanel_varifyotp_user_id_b55e44d6_fk_adminpanel_user_id` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `landing_patient_profile`
--
ALTER TABLE `landing_patient_profile`
  ADD CONSTRAINT `landing_patient_prof_blood_group_id_39ad4652_fk_adminpane` FOREIGN KEY (`blood_group_id`) REFERENCES `adminpanel_blood_group` (`id`),
  ADD CONSTRAINT `landing_patient_prof_gender_id_ea271215_fk_adminpane` FOREIGN KEY (`gender_id`) REFERENCES `adminpanel_gender` (`id`),
  ADD CONSTRAINT `landing_patient_prof_matrimony_id_4dfc7197_fk_adminpane` FOREIGN KEY (`matrimony_id`) REFERENCES `adminpanel_matrimony` (`id`),
  ADD CONSTRAINT `landing_patient_prof_religion_id_26d8885c_fk_adminpane` FOREIGN KEY (`religion_id`) REFERENCES `adminpanel_religion` (`id`),
  ADD CONSTRAINT `landing_patient_profile_user_id_b0ef12bd_fk_adminpanel_user_id` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
