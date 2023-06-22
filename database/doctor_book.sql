-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 07:37 PM
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
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_availability`
--

CREATE TABLE `adminpanel_availability` (
  `id` bigint(20) NOT NULL,
  `appointment_availability` datetime(6) DEFAULT NULL,
  `accepting_new_patients` tinyint(1) NOT NULL,
  `cancellation_policy` varchar(255) NOT NULL,
  `insurance_accepted` varchar(255) DEFAULT NULL,
  `average_wait_time` bigint(20) NOT NULL,
  `consultation_fee` decimal(10,2) NOT NULL,
  `available_facilities` longtext NOT NULL,
  `research_interests` longtext NOT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_blood_group`
--

CREATE TABLE `adminpanel_blood_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_blood_group`
--

INSERT INTO `adminpanel_blood_group` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A+', '2023-06-21 23:25:18.000000', NULL, NULL),
(2, 'A-', '2023-06-21 23:29:40.000000', NULL, NULL),
(3, 'B+', '2023-06-21 23:29:59.000000', NULL, NULL),
(4, 'B-', '2023-06-21 23:29:59.000000', NULL, NULL),
(5, 'O+', '2023-06-21 23:29:59.000000', NULL, NULL),
(6, 'O-', '2023-06-21 23:29:59.000000', NULL, NULL),
(7, 'AB+', '2023-06-21 23:29:59.000000', NULL, NULL),
(8, 'AB-', '2023-06-21 23:29:59.000000', NULL, NULL);

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
-- Table structure for table `adminpanel_certification`
--

CREATE TABLE `adminpanel_certification` (
  `id` bigint(20) NOT NULL,
  `board_certifications` varchar(255) NOT NULL,
  `awards_and_honors` varchar(255) NOT NULL,
  `publications` varchar(255) NOT NULL,
  `memberships` varchar(255) NOT NULL,
  `patient_satisfaction` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_countries`
--

CREATE TABLE `adminpanel_countries` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_credentials`
--

CREATE TABLE `adminpanel_credentials` (
  `id` bigint(20) NOT NULL,
  `medical_license` varchar(255) NOT NULL,
  `dea_number` varchar(255) NOT NULL,
  `npi_number` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `board_certified` tinyint(1) NOT NULL,
  `board_certified_in` varchar(255) NOT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
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
  `division_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_division`
--

CREATE TABLE `adminpanel_division` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `specialty` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `biography` varchar(255) NOT NULL,
  `languages_spoken` varchar(255) NOT NULL,
  `passport_no` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `blood_group_id` bigint(20) DEFAULT NULL,
  `gender_id` bigint(20) DEFAULT NULL,
  `matrimony_id` bigint(20) NOT NULL,
  `religion_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_education`
--

CREATE TABLE `adminpanel_education` (
  `id` bigint(20) NOT NULL,
  `education` varchar(255) NOT NULL,
  `medical_school` varchar(255) NOT NULL,
  `residency_program` varchar(255) NOT NULL,
  `fellowship_program` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
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
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_gender`
--

CREATE TABLE `adminpanel_gender` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_gender`
--

INSERT INTO `adminpanel_gender` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Male', '2023-06-21 23:29:59.000000', NULL, NULL),
(2, 'Female', '2023-06-21 23:29:59.000000', NULL, NULL),
(3, 'Other', '2023-06-21 23:29:59.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_images`
--

CREATE TABLE `adminpanel_images` (
  `id` bigint(20) NOT NULL,
  `doctor_photos` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_matrimonie`
--

CREATE TABLE `adminpanel_matrimonie` (
  `id` bigint(20) NOT NULL,
  `name` varchar(110) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_matrimonie`
--

INSERT INTO `adminpanel_matrimonie` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Married', '2023-06-21 23:34:25.000000', NULL, NULL),
(2, 'Unmarried', '2023-06-21 23:34:25.000000', NULL, NULL),
(3, 'Separated, or Widowed', '2023-06-21 23:34:25.000000', NULL, NULL),
(4, 'Divorced', '2023-06-21 23:34:25.000000', NULL, NULL),
(5, 'Other', '2023-06-21 23:34:25.000000', NULL, NULL);

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
  `permanent_address` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
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
  `present_address` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
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
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_religion`
--

INSERT INTO `adminpanel_religion` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Islam', '2023-06-21 23:31:59.000000', NULL, NULL),
(2, 'Hinduism', '2023-06-21 23:31:59.000000', NULL, NULL),
(3, 'Christianity', '2023-06-21 23:31:59.000000', NULL, NULL),
(4, 'Buddhism', '2023-06-21 23:31:59.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_services`
--

CREATE TABLE `adminpanel_services` (
  `id` bigint(20) NOT NULL,
  `treatments` varchar(255) NOT NULL,
  `procedures` varchar(255) NOT NULL,
  `hours` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
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
  `insta` varchar(200) DEFAULT NULL,
  `linkdin` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
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
  `district_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_userprofile`
--

CREATE TABLE `adminpanel_userprofile` (
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
(25, 'Can add article', 7, 'add_article'),
(26, 'Can change article', 7, 'change_article'),
(27, 'Can delete article', 7, 'delete_article'),
(28, 'Can view article', 7, 'view_article'),
(29, 'Can add blood_ group', 8, 'add_blood_group'),
(30, 'Can change blood_ group', 8, 'change_blood_group'),
(31, 'Can delete blood_ group', 8, 'delete_blood_group'),
(32, 'Can view blood_ group', 8, 'view_blood_group'),
(33, 'Can add body part', 9, 'add_bodypart'),
(34, 'Can change body part', 9, 'change_bodypart'),
(35, 'Can delete body part', 9, 'delete_bodypart'),
(36, 'Can view body part', 9, 'view_bodypart'),
(37, 'Can add countries', 10, 'add_countries'),
(38, 'Can change countries', 10, 'change_countries'),
(39, 'Can delete countries', 10, 'delete_countries'),
(40, 'Can view countries', 10, 'view_countries'),
(41, 'Can add department', 11, 'add_department'),
(42, 'Can change department', 11, 'change_department'),
(43, 'Can delete department', 11, 'delete_department'),
(44, 'Can view department', 11, 'view_department'),
(45, 'Can add district', 12, 'add_district'),
(46, 'Can change district', 12, 'change_district'),
(47, 'Can delete district', 12, 'delete_district'),
(48, 'Can view district', 12, 'view_district'),
(49, 'Can add division', 13, 'add_division'),
(50, 'Can change division', 13, 'change_division'),
(51, 'Can delete division', 13, 'delete_division'),
(52, 'Can view division', 13, 'view_division'),
(53, 'Can add doctor_ profile', 14, 'add_doctor_profile'),
(54, 'Can change doctor_ profile', 14, 'change_doctor_profile'),
(55, 'Can delete doctor_ profile', 14, 'delete_doctor_profile'),
(56, 'Can view doctor_ profile', 14, 'view_doctor_profile'),
(57, 'Can add faq', 15, 'add_faq'),
(58, 'Can change faq', 15, 'change_faq'),
(59, 'Can delete faq', 15, 'delete_faq'),
(60, 'Can view faq', 15, 'view_faq'),
(61, 'Can add gender', 16, 'add_gender'),
(62, 'Can change gender', 16, 'change_gender'),
(63, 'Can delete gender', 16, 'delete_gender'),
(64, 'Can view gender', 16, 'view_gender'),
(65, 'Can add matrimonie', 17, 'add_matrimonie'),
(66, 'Can change matrimonie', 17, 'change_matrimonie'),
(67, 'Can delete matrimonie', 17, 'delete_matrimonie'),
(68, 'Can view matrimonie', 17, 'view_matrimonie'),
(69, 'Can add organ', 18, 'add_organ'),
(70, 'Can change organ', 18, 'change_organ'),
(71, 'Can delete organ', 18, 'delete_organ'),
(72, 'Can view organ', 18, 'view_organ'),
(73, 'Can add religion', 19, 'add_religion'),
(74, 'Can change religion', 19, 'change_religion'),
(75, 'Can delete religion', 19, 'delete_religion'),
(76, 'Can view religion', 19, 'view_religion'),
(77, 'Can add user profile', 20, 'add_userprofile'),
(78, 'Can change user profile', 20, 'change_userprofile'),
(79, 'Can delete user profile', 20, 'delete_userprofile'),
(80, 'Can view user profile', 20, 'view_userprofile'),
(81, 'Can add upazila', 21, 'add_upazila'),
(82, 'Can change upazila', 21, 'change_upazila'),
(83, 'Can delete upazila', 21, 'delete_upazila'),
(84, 'Can view upazila', 21, 'view_upazila'),
(85, 'Can add social_ media', 22, 'add_social_media'),
(86, 'Can change social_ media', 22, 'change_social_media'),
(87, 'Can delete social_ media', 22, 'delete_social_media'),
(88, 'Can view social_ media', 22, 'view_social_media'),
(89, 'Can add services', 23, 'add_services'),
(90, 'Can change services', 23, 'change_services'),
(91, 'Can delete services', 23, 'delete_services'),
(92, 'Can view services', 23, 'view_services'),
(93, 'Can add present address', 24, 'add_presentaddress'),
(94, 'Can change present address', 24, 'change_presentaddress'),
(95, 'Can delete present address', 24, 'delete_presentaddress'),
(96, 'Can view present address', 24, 'view_presentaddress'),
(97, 'Can add permanent address', 25, 'add_permanentaddress'),
(98, 'Can change permanent address', 25, 'change_permanentaddress'),
(99, 'Can delete permanent address', 25, 'delete_permanentaddress'),
(100, 'Can view permanent address', 25, 'view_permanentaddress'),
(101, 'Can add organs problem specification', 26, 'add_organsproblemspecification'),
(102, 'Can change organs problem specification', 26, 'change_organsproblemspecification'),
(103, 'Can delete organs problem specification', 26, 'delete_organsproblemspecification'),
(104, 'Can view organs problem specification', 26, 'view_organsproblemspecification'),
(105, 'Can add images', 27, 'add_images'),
(106, 'Can change images', 27, 'change_images'),
(107, 'Can delete images', 27, 'delete_images'),
(108, 'Can view images', 27, 'view_images'),
(109, 'Can add education', 28, 'add_education'),
(110, 'Can change education', 28, 'change_education'),
(111, 'Can delete education', 28, 'delete_education'),
(112, 'Can view education', 28, 'view_education'),
(113, 'Can add department specification', 29, 'add_departmentspecification'),
(114, 'Can change department specification', 29, 'change_departmentspecification'),
(115, 'Can delete department specification', 29, 'delete_departmentspecification'),
(116, 'Can view department specification', 29, 'view_departmentspecification'),
(117, 'Can add credentials', 30, 'add_credentials'),
(118, 'Can change credentials', 30, 'change_credentials'),
(119, 'Can delete credentials', 30, 'delete_credentials'),
(120, 'Can view credentials', 30, 'view_credentials'),
(121, 'Can add certification', 31, 'add_certification'),
(122, 'Can change certification', 31, 'change_certification'),
(123, 'Can delete certification', 31, 'delete_certification'),
(124, 'Can view certification', 31, 'view_certification'),
(125, 'Can add availability', 32, 'add_availability'),
(126, 'Can change availability', 32, 'change_availability'),
(127, 'Can delete availability', 32, 'delete_availability'),
(128, 'Can view availability', 32, 'view_availability'),
(129, 'Can add patient', 33, 'add_patient'),
(130, 'Can change patient', 33, 'change_patient'),
(131, 'Can delete patient', 33, 'delete_patient'),
(132, 'Can view patient', 33, 'view_patient');

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
(7, 'adminpanel', 'article'),
(32, 'adminpanel', 'availability'),
(8, 'adminpanel', 'blood_group'),
(9, 'adminpanel', 'bodypart'),
(31, 'adminpanel', 'certification'),
(10, 'adminpanel', 'countries'),
(30, 'adminpanel', 'credentials'),
(11, 'adminpanel', 'department'),
(29, 'adminpanel', 'departmentspecification'),
(12, 'adminpanel', 'district'),
(13, 'adminpanel', 'division'),
(14, 'adminpanel', 'doctor_profile'),
(28, 'adminpanel', 'education'),
(15, 'adminpanel', 'faq'),
(16, 'adminpanel', 'gender'),
(27, 'adminpanel', 'images'),
(17, 'adminpanel', 'matrimonie'),
(18, 'adminpanel', 'organ'),
(26, 'adminpanel', 'organsproblemspecification'),
(25, 'adminpanel', 'permanentaddress'),
(24, 'adminpanel', 'presentaddress'),
(19, 'adminpanel', 'religion'),
(23, 'adminpanel', 'services'),
(22, 'adminpanel', 'social_media'),
(21, 'adminpanel', 'upazila'),
(20, 'adminpanel', 'userprofile'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(33, 'landing', 'patient'),
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
(1, 'contenttypes', '0001_initial', '2023-06-21 17:07:00.193249'),
(2, 'auth', '0001_initial', '2023-06-21 17:07:01.599104'),
(3, 'admin', '0001_initial', '2023-06-21 17:07:02.038980'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-21 17:07:02.054620'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-21 17:07:02.070244'),
(6, 'adminpanel', '0001_initial', '2023-06-21 17:07:07.809921'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-06-21 17:07:07.975286'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-06-21 17:07:08.085074'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-06-21 17:07:08.131951'),
(10, 'auth', '0004_alter_user_username_opts', '2023-06-21 17:07:08.147469'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-06-21 17:07:08.263265'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-06-21 17:07:08.272269'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-06-21 17:07:08.287919'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-06-21 17:07:08.319169'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-06-21 17:07:08.429005'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-06-21 17:07:08.491958'),
(17, 'auth', '0011_update_proxy_permissions', '2023-06-21 17:07:08.523236'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-06-21 17:07:08.554851'),
(19, 'landing', '0001_initial', '2023-06-21 17:07:08.601868'),
(20, 'sessions', '0001_initial', '2023-06-21 17:07:08.695393');

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
-- Table structure for table `landing_patient`
--

CREATE TABLE `landing_patient` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpanel_article`
--
ALTER TABLE `adminpanel_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_availability`
--
ALTER TABLE `adminpanel_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_availabil_doctor_profile_id_2164014c_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_blood_group`
--
ALTER TABLE `adminpanel_blood_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_bodypart`
--
ALTER TABLE `adminpanel_bodypart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_certification`
--
ALTER TABLE `adminpanel_certification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_certifica_doctor_profile_id_a218003e_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_countries`
--
ALTER TABLE `adminpanel_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_credentials`
--
ALTER TABLE `adminpanel_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_credentia_doctor_profile_id_7db59d41_fk_adminpane` (`doctor_profile_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_division_country_id_af0b84dd_fk_adminpane` (`country_id`);

--
-- Indexes for table `adminpanel_doctor_profile`
--
ALTER TABLE `adminpanel_doctor_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_doctor_pr_gender_id_336c5df2_fk_adminpane` (`gender_id`),
  ADD KEY `adminpanel_doctor_pr_matrimony_id_f8614aef_fk_adminpane` (`matrimony_id`),
  ADD KEY `adminpanel_doctor_pr_religion_id_04558daa_fk_adminpane` (`religion_id`),
  ADD KEY `adminpanel_doctor_pr_user_id_ab620e9f_fk_adminpane` (`user_id`),
  ADD KEY `adminpanel_doctor_pr_blood_group_id_b7d86c86_fk_adminpane` (`blood_group_id`);

--
-- Indexes for table `adminpanel_education`
--
ALTER TABLE `adminpanel_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminpanel_education_doctor_profile_id_dfe3a9a8_fk_adminpane` (`doctor_profile_id`);

--
-- Indexes for table `adminpanel_faq`
--
ALTER TABLE `adminpanel_faq`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `adminpanel_matrimonie`
--
ALTER TABLE `adminpanel_matrimonie`
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
-- Indexes for table `adminpanel_userprofile`
--
ALTER TABLE `adminpanel_userprofile`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `landing_patient`
--
ALTER TABLE `landing_patient`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `adminpanel_blood_group`
--
ALTER TABLE `adminpanel_blood_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `adminpanel_bodypart`
--
ALTER TABLE `adminpanel_bodypart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_certification`
--
ALTER TABLE `adminpanel_certification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_countries`
--
ALTER TABLE `adminpanel_countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_credentials`
--
ALTER TABLE `adminpanel_credentials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_department`
--
ALTER TABLE `adminpanel_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_departmentspecification`
--
ALTER TABLE `adminpanel_departmentspecification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_district`
--
ALTER TABLE `adminpanel_district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_division`
--
ALTER TABLE `adminpanel_division`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `adminpanel_matrimonie`
--
ALTER TABLE `adminpanel_matrimonie`
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_userprofile`
--
ALTER TABLE `adminpanel_userprofile`
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
-- AUTO_INCREMENT for table `landing_patient`
--
ALTER TABLE `landing_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminpanel_availability`
--
ALTER TABLE `adminpanel_availability`
  ADD CONSTRAINT `adminpanel_availabil_doctor_profile_id_2164014c_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_certification`
--
ALTER TABLE `adminpanel_certification`
  ADD CONSTRAINT `adminpanel_certifica_doctor_profile_id_a218003e_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

--
-- Constraints for table `adminpanel_credentials`
--
ALTER TABLE `adminpanel_credentials`
  ADD CONSTRAINT `adminpanel_credentia_doctor_profile_id_7db59d41_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

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
-- Constraints for table `adminpanel_division`
--
ALTER TABLE `adminpanel_division`
  ADD CONSTRAINT `adminpanel_division_country_id_af0b84dd_fk_adminpane` FOREIGN KEY (`country_id`) REFERENCES `adminpanel_countries` (`id`);

--
-- Constraints for table `adminpanel_doctor_profile`
--
ALTER TABLE `adminpanel_doctor_profile`
  ADD CONSTRAINT `adminpanel_doctor_pr_blood_group_id_b7d86c86_fk_adminpane` FOREIGN KEY (`blood_group_id`) REFERENCES `adminpanel_blood_group` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_gender_id_336c5df2_fk_adminpane` FOREIGN KEY (`gender_id`) REFERENCES `adminpanel_gender` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_matrimony_id_f8614aef_fk_adminpane` FOREIGN KEY (`matrimony_id`) REFERENCES `adminpanel_matrimonie` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_religion_id_04558daa_fk_adminpane` FOREIGN KEY (`religion_id`) REFERENCES `adminpanel_religion` (`id`),
  ADD CONSTRAINT `adminpanel_doctor_pr_user_id_ab620e9f_fk_adminpane` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_userprofile` (`id`);

--
-- Constraints for table `adminpanel_education`
--
ALTER TABLE `adminpanel_education`
  ADD CONSTRAINT `adminpanel_education_doctor_profile_id_dfe3a9a8_fk_adminpane` FOREIGN KEY (`doctor_profile_id`) REFERENCES `adminpanel_doctor_profile` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
