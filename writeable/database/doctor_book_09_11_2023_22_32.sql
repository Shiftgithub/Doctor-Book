-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 05:30 PM
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
-- Table structure for table `admin_profile`
--

CREATE TABLE `admin_profile` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(110) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nid_no` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `blood_group_id` bigint(20) DEFAULT NULL,
  `gender_id` bigint(20) DEFAULT NULL,
  `matrimony_id` bigint(20) DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_profile`
--

INSERT INTO `admin_profile` (`id`, `created_at`, `updated_at`, `deleted_at`, `full_name`, `father_name`, `mother_name`, `phone_no`, `date_of_birth`, `nid_no`, `address`, `blood_group_id`, `gender_id`, `matrimony_id`, `religion_id`, `user_id`) VALUES
(1, '2023-11-08 14:08:12.242751', '2023-11-09 21:37:23.799593', NULL, 'Mamun Mia Turan', 'kasem Ali', 'Hasina Begum', '01965572363', '2001-07-22', 1234598712, 'Borpa', 5, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `heading` varchar(1000) NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
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
(29, 'Can add body part', 8, 'add_bodypart'),
(30, 'Can change body part', 8, 'change_bodypart'),
(31, 'Can delete body part', 8, 'delete_bodypart'),
(32, 'Can view body part', 8, 'view_bodypart'),
(33, 'Can add department', 9, 'add_department'),
(34, 'Can change department', 9, 'change_department'),
(35, 'Can delete department', 9, 'delete_department'),
(36, 'Can view department', 9, 'view_department'),
(37, 'Can add department specification', 10, 'add_departmentspecification'),
(38, 'Can change department specification', 10, 'change_departmentspecification'),
(39, 'Can delete department specification', 10, 'delete_departmentspecification'),
(40, 'Can view department specification', 10, 'view_departmentspecification'),
(41, 'Can add appointment schedule', 11, 'add_appointmentschedule'),
(42, 'Can change appointment schedule', 11, 'change_appointmentschedule'),
(43, 'Can delete appointment schedule', 11, 'delete_appointmentschedule'),
(44, 'Can view appointment schedule', 11, 'view_appointmentschedule'),
(45, 'Can add doctor profile', 12, 'add_doctorprofile'),
(46, 'Can change doctor profile', 12, 'change_doctorprofile'),
(47, 'Can delete doctor profile', 12, 'delete_doctorprofile'),
(48, 'Can view doctor profile', 12, 'view_doctorprofile'),
(49, 'Can add social media', 13, 'add_socialmedia'),
(50, 'Can change social media', 13, 'change_socialmedia'),
(51, 'Can delete social media', 13, 'delete_socialmedia'),
(52, 'Can view social media', 13, 'view_socialmedia'),
(53, 'Can add schedule time', 14, 'add_scheduletime'),
(54, 'Can change schedule time', 14, 'change_scheduletime'),
(55, 'Can delete schedule time', 14, 'delete_scheduletime'),
(56, 'Can view schedule time', 14, 'view_scheduletime'),
(57, 'Can add off day', 15, 'add_offday'),
(58, 'Can change off day', 15, 'change_offday'),
(59, 'Can delete off day', 15, 'delete_offday'),
(60, 'Can view off day', 15, 'view_offday'),
(61, 'Can add education', 16, 'add_education'),
(62, 'Can change education', 16, 'change_education'),
(63, 'Can delete education', 16, 'delete_education'),
(64, 'Can view education', 16, 'view_education'),
(65, 'Can add awards', 17, 'add_awards'),
(66, 'Can change awards', 17, 'change_awards'),
(67, 'Can delete awards', 17, 'delete_awards'),
(68, 'Can view awards', 17, 'view_awards'),
(69, 'Can add faq', 18, 'add_faq'),
(70, 'Can change faq', 18, 'change_faq'),
(71, 'Can delete faq', 18, 'delete_faq'),
(72, 'Can view faq', 18, 'view_faq'),
(73, 'Can add brand', 19, 'add_brand'),
(74, 'Can change brand', 19, 'change_brand'),
(75, 'Can delete brand', 19, 'delete_brand'),
(76, 'Can view brand', 19, 'view_brand'),
(77, 'Can add generic', 20, 'add_generic'),
(78, 'Can change generic', 20, 'change_generic'),
(79, 'Can delete generic', 20, 'delete_generic'),
(80, 'Can view generic', 20, 'view_generic'),
(81, 'Can add medicine type', 21, 'add_medicinetype'),
(82, 'Can change medicine type', 21, 'change_medicinetype'),
(83, 'Can delete medicine type', 21, 'delete_medicinetype'),
(84, 'Can view medicine type', 21, 'view_medicinetype'),
(85, 'Can add strength', 22, 'add_strength'),
(86, 'Can change strength', 22, 'change_strength'),
(87, 'Can delete strength', 22, 'delete_strength'),
(88, 'Can view strength', 22, 'view_strength'),
(89, 'Can add medicine', 23, 'add_medicine'),
(90, 'Can change medicine', 23, 'change_medicine'),
(91, 'Can delete medicine', 23, 'delete_medicine'),
(92, 'Can view medicine', 23, 'view_medicine'),
(93, 'Can add organ', 24, 'add_organ'),
(94, 'Can change organ', 24, 'change_organ'),
(95, 'Can delete organ', 24, 'delete_organ'),
(96, 'Can view organ', 24, 'view_organ'),
(97, 'Can add organs problem specification', 25, 'add_organsproblemspecification'),
(98, 'Can change organs problem specification', 25, 'change_organsproblemspecification'),
(99, 'Can delete organs problem specification', 25, 'delete_organsproblemspecification'),
(100, 'Can view organs problem specification', 25, 'view_organsproblemspecification'),
(101, 'Can add patient profile', 26, 'add_patientprofile'),
(102, 'Can change patient profile', 26, 'change_patientprofile'),
(103, 'Can delete patient profile', 26, 'delete_patientprofile'),
(104, 'Can view patient profile', 26, 'view_patientprofile'),
(105, 'Can add blood_ group', 27, 'add_blood_group'),
(106, 'Can change blood_ group', 27, 'change_blood_group'),
(107, 'Can delete blood_ group', 27, 'delete_blood_group'),
(108, 'Can view blood_ group', 27, 'view_blood_group'),
(109, 'Can add board', 28, 'add_board'),
(110, 'Can change board', 28, 'change_board'),
(111, 'Can delete board', 28, 'delete_board'),
(112, 'Can view board', 28, 'view_board'),
(113, 'Can add day', 29, 'add_day'),
(114, 'Can change day', 29, 'change_day'),
(115, 'Can delete day', 29, 'delete_day'),
(116, 'Can view day', 29, 'view_day'),
(117, 'Can add district', 30, 'add_district'),
(118, 'Can change district', 30, 'change_district'),
(119, 'Can delete district', 30, 'delete_district'),
(120, 'Can view district', 30, 'view_district'),
(121, 'Can add division', 31, 'add_division'),
(122, 'Can change division', 31, 'change_division'),
(123, 'Can delete division', 31, 'delete_division'),
(124, 'Can view division', 31, 'view_division'),
(125, 'Can add gender', 32, 'add_gender'),
(126, 'Can change gender', 32, 'change_gender'),
(127, 'Can delete gender', 32, 'delete_gender'),
(128, 'Can view gender', 32, 'view_gender'),
(129, 'Can add matrimony', 33, 'add_matrimony'),
(130, 'Can change matrimony', 33, 'change_matrimony'),
(131, 'Can delete matrimony', 33, 'delete_matrimony'),
(132, 'Can view matrimony', 33, 'view_matrimony'),
(133, 'Can add religion', 34, 'add_religion'),
(134, 'Can change religion', 34, 'change_religion'),
(135, 'Can delete religion', 34, 'delete_religion'),
(136, 'Can view religion', 34, 'view_religion'),
(137, 'Can add upazila', 35, 'add_upazila'),
(138, 'Can change upazila', 35, 'change_upazila'),
(139, 'Can delete upazila', 35, 'delete_upazila'),
(140, 'Can view upazila', 35, 'view_upazila'),
(141, 'Can add lab test', 36, 'add_labtest'),
(142, 'Can change lab test', 36, 'change_labtest'),
(143, 'Can delete lab test', 36, 'delete_labtest'),
(144, 'Can view lab test', 36, 'view_labtest'),
(145, 'Can add medicine schedule', 37, 'add_medicineschedule'),
(146, 'Can change medicine schedule', 37, 'change_medicineschedule'),
(147, 'Can delete medicine schedule', 37, 'delete_medicineschedule'),
(148, 'Can view medicine schedule', 37, 'view_medicineschedule'),
(149, 'Can add prescription', 38, 'add_prescription'),
(150, 'Can change prescription', 38, 'change_prescription'),
(151, 'Can delete prescription', 38, 'delete_prescription'),
(152, 'Can view prescription', 38, 'view_prescription'),
(153, 'Can add prescription medicine', 39, 'add_prescriptionmedicine'),
(154, 'Can change prescription medicine', 39, 'change_prescriptionmedicine'),
(155, 'Can delete prescription medicine', 39, 'delete_prescriptionmedicine'),
(156, 'Can view prescription medicine', 39, 'view_prescriptionmedicine'),
(157, 'Can add prescription lab test', 40, 'add_prescriptionlabtest'),
(158, 'Can change prescription lab test', 40, 'change_prescriptionlabtest'),
(159, 'Can delete prescription lab test', 40, 'delete_prescriptionlabtest'),
(160, 'Can view prescription lab test', 40, 'view_prescriptionlabtest'),
(161, 'Can add user', 41, 'add_user'),
(162, 'Can change user', 41, 'change_user'),
(163, 'Can delete user', 41, 'delete_user'),
(164, 'Can view user', 41, 'view_user'),
(165, 'Can add present address', 42, 'add_presentaddress'),
(166, 'Can change present address', 42, 'change_presentaddress'),
(167, 'Can delete present address', 42, 'delete_presentaddress'),
(168, 'Can view present address', 42, 'view_presentaddress'),
(169, 'Can add permanent address', 43, 'add_permanentaddress'),
(170, 'Can change permanent address', 43, 'change_permanentaddress'),
(171, 'Can delete permanent address', 43, 'delete_permanentaddress'),
(172, 'Can view permanent address', 43, 'view_permanentaddress'),
(173, 'Can add images', 44, 'add_images'),
(174, 'Can change images', 44, 'change_images'),
(175, 'Can delete images', 44, 'delete_images'),
(176, 'Can view images', 44, 'view_images'),
(177, 'Can add admin profile', 45, 'add_adminprofile'),
(178, 'Can change admin profile', 45, 'change_adminprofile'),
(179, 'Can delete admin profile', 45, 'delete_adminprofile'),
(180, 'Can view admin profile', 45, 'view_adminprofile'),
(181, 'Can add verify otp', 46, 'add_verifyotp'),
(182, 'Can change verify otp', 46, 'change_verifyotp'),
(183, 'Can delete verify otp', 46, 'delete_verifyotp'),
(184, 'Can view verify otp', 46, 'view_verifyotp'),
(185, 'Can add get appointment', 47, 'add_getappointment'),
(186, 'Can change get appointment', 47, 'change_getappointment'),
(187, 'Can delete get appointment', 47, 'delete_getappointment'),
(188, 'Can view get appointment', 47, 'view_getappointment');

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

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$6hHJgIiUVjutM0y9qL2M1j$cncAqOQBPn4cF7KjtXt4Go7KpU0ETsVX7pdaANjdLSk=', NULL, 1, 'mamunmiaturan', '', '', 'mamunmiaturan@gmail.com', 1, 1, '2023-11-08 14:05:03.357281');

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
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`id`, `name`) VALUES
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
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`id`, `name`) VALUES
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
-- Table structure for table `body_part`
--

CREATE TABLE `body_part` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `body_part`
--

INSERT INTO `body_part` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `description`) VALUES
(1, '2023-08-16 16:18:47.181475', NULL, NULL, 'Head (মাথা)', 'This includes the skull, brain, eyes, ears, nose, and mouth. (এটি ক্রানিয়াম, মস্তিষ্ক, চোখ, কান, নাক এবং মুখ অন্তর্ভুক্ত।)'),
(2, '2023-08-16 16:19:05.773641', NULL, NULL, 'Neck (গলা)', 'Connects the head to the rest of the body and contains important structures like the throat and neck muscles. (মাথা থেকে বাকি শরীরে যোগ করে এবং গলায় মহত্তম ধরনে গঠিত হতে থাকে, যেখানে জিবক এবং গলা মাংস অবস্থিত থাকে।)'),
(3, '2023-08-16 16:19:22.580351', NULL, NULL, 'Torso or Trunk (বডি বা ট্রাঙ্ক)', 'This is the main part of the body, consisting of the chest, abdomen, and back. (এটি শরীরের প্রধান অংশ, যা বুক, পেট এবং পিঠ অন্তর্ভুক্ত।)'),
(4, '2023-08-16 16:19:37.531450', NULL, NULL, 'Upper Limbs (উপরের অংশ)', 'These are the arms and hands, including the shoulder, upper arm, forearm, wrist, and fingers. (এটি হাত এবং হাতের অংশ, যেমন মাংস পিছন দিক, উপরোক্ত বাহু, উপরোক্ত হাত এবং আঙ্গুল অন্তর্ভুক্ত।)'),
(5, '2023-08-16 16:20:04.756456', NULL, NULL, 'Lower Limbs (নিচের অংশ)', 'These are the legs and feet, including the hip, thigh, lower leg, ankle, and toes. (এটি পা এবং পায়ের অংশ, যেমন কোমর, পায়ের উপরোক্ত অংশ, পায়ের নিচু অংশ এবং পায়ের আঙ্গুল অন্তর্ভুক্ত।)'),
(6, '2023-08-16 16:20:15.903351', NULL, NULL, 'Thorax (থোরেক্স)', 'The area between the neck and abdomen, housing important organs like the heart and lungs. (মাথা এবং পেটের মধ্যবর্তী অংশ, যেখানে হৃদয় এবং ফুসফুস প্রধান অঙ্গ।)'),
(7, '2023-08-16 16:20:48.681571', NULL, NULL, 'Abdomen (পেট)', 'The area between the thorax and pelvis, containing organs such as the stomach, liver, intestines, and kidneys. (থোরেক্স এবং কোমরের মধ্যের অংশ, যেখানে পাচক অবয়ব সহ অন্যান্য গুরুত্বপূর্ণ অঙ্গ অবস্থিত।)'),
(8, '2023-08-16 16:21:00.335954', NULL, NULL, 'Pelvis (প্যালভিস)', 'The bony structure at the base of the spine, supporting the lower part of the body and containing the reproductive organs and bladder. (মেডোয়ের স্ত্রী জননী অঙ্গ এবং মূত্রবাহিনী অন্তর্ভুক্ত এই হল কোণিকা ধারণ করে, যা শরীরের তলদিকে অবস্থিত।)'),
(9, '2023-08-16 16:21:13.260970', NULL, NULL, 'Back (পিঠ)', 'The posterior aspect of the body, including the spine and associated muscles. (শরীরের পশ্চিমাংশ, স্পাইন এবং সহযোগী মাংস অন্তর্ভুক্ত।)'),
(10, '2023-08-16 16:21:26.155763', NULL, NULL, 'Muscles (পেশি)', 'These are found throughout the body and are responsible for movement and support. (এগুলি শরীরের সারাংশে পাওয়া যায় এবং চলাচল এবং সমর্থনের জন্য জরুরি।)'),
(11, '2023-08-16 16:21:37.610542', NULL, NULL, 'Skeleton (আস্থি)', 'The framework of bones that provides structure and protection for the body\'s organs. (অঙ্গগুলির কাঠামো, যা শরীরের অঙ্গগুলির জন্য স্ট্রাকচার এবং রক্ষা সরঞ্জাম প্রদান করে।)'),
(12, '2023-08-16 16:21:49.187009', NULL, NULL, 'Skin (চামড়া)', 'The body\'s largest organ, providing a protective barrier and helping regulate temperature. (শরীরের সর্ববৃহৎ অঙ্গ, যা একটি রক্ষণাত্মক বিভাগ প্রদান করে এবং তাপমাত্রা নিয়ন্ত্রণ করতে সাহায্য করে।)');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `name`) VALUES
(1, 'Saturday'),
(2, 'Sunday'),
(3, 'Monday'),
(4, 'Tuesday'),
(5, 'Wednesday'),
(6, 'Thursday'),
(7, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `description`, `image`) VALUES
(1, '2023-06-27 15:31:23.024744', NULL, NULL, 'Cardiology', 'Cardiology is the study of the heart. Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system. The field includes medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease, and electrophysiology', NULL),
(2, '2023-06-27 15:31:51.912129', NULL, NULL, 'Radiology', 'Radiology is the medical discipline that uses medical imaging to diagnose diseases and guide their treatment, within the bodies of humans and other animals', NULL),
(3, '2023-06-27 15:37:36.134056', NULL, NULL, 'Orthopedic', 'Orthopedic surgery or orthopedics, is the branch of surgery concerned with conditions involving the musculoskeletal system. Orthopedic surgeons use both surgical and nonsurgical means to treat musculoskeletal trauma, spine diseases, sports injuries, degenerative diseases, infections, tumors, and congenital disorders', NULL),
(4, '2023-06-27 15:37:56.654819', NULL, NULL, 'Neurology', 'Neurology is the branch of medicine dealing with the diagnosis and treatment of all categories of conditions and disease involving the nervous system, which comprises the brain, the spinal cord and the peripheral nerves', NULL),
(5, '2023-06-27 15:38:29.445529', NULL, NULL, 'Intensive care medicine', 'Intensive care medicine, also called critical care medicine, is a medical specialty that deals with seriously or critically ill patients who have, are at risk of, or are recovering from conditions that may be life-threatening.', NULL),
(6, '2023-06-27 15:38:52.349986', NULL, NULL, 'Gastroenterology', 'Gastroenterology is the branch of medicine focused on the digestive system and its disorders. The digestive system consists of the gastrointestinal tract, sometimes referred to as the GI tract', NULL),
(7, '2023-06-27 15:39:16.256063', NULL, NULL, 'Outpatient Department', 'An outpatient department or outpatient clinic is the part of a hospital designed for the treatment of outpatients, people with health problems who visit the hospital for diagnosis or treatment, but do not at this time require a bed or to be admitted for overnight care', NULL),
(8, '2023-06-27 15:39:40.515379', NULL, NULL, 'Obstetrics and Gynaecology', 'Obstetrics and Gynaecology is the medical specialty that encompasses the two subspecialties of obstetrics and gynecology.', NULL),
(9, '2023-06-27 15:39:57.423909', NULL, NULL, 'Otolaryngology', 'Otolaryngology logy is a surgical sub speciality within medicine that deals with the surgical and medical management of conditions of the head and neck. Doctors who specialize in this area are called otorhinolaryngologists, otolaryngologists, head and neck surgeons, or ENT surgeons or physicians', NULL),
(10, '2023-06-27 15:40:39.684386', NULL, NULL, 'Anesthesiology', 'Anesthesiology, anaesthesiology, or anaesthesia is the medical specialty concerned with the total perioperative care of patients before, during and after surgery. It encompasses anesthesia, intensive care medicine, critical emergency medicine, and pain medicine.', NULL),
(11, '2023-06-27 15:40:58.618505', NULL, NULL, 'Hematology', 'Hematology is the branch of medicine concerned with the study of the cause, prognosis, treatment, and prevention of diseases related to blood.', NULL),
(12, '2023-06-27 15:41:23.975982', NULL, NULL, 'Casualty department', 'An emergency department, also known as an accident and emergency department, emergency room, emergency ward or casualty department, is a medical treatment facility specializing in emergency medicine, the acute care of patients who present without prior appointment; either by their own means or by that of an ambulance', NULL),
(13, '2023-06-27 15:41:36.877078', NULL, NULL, 'Geriatrics', 'Geriatrics, or geriatric medicine, is a medical specialty focused on providing care for the unique health needs of older adults. The term geriatrics originates from the Greek γέρων geron meaning \"old man\", and ιατρός iatros meaning \"healer\".', NULL),
(14, '2023-06-27 15:41:53.719358', NULL, NULL, 'ICU', 'An intensive care unit, also known as an intensive therapy unit or intensive treatment unit or critical care unit, is a special department of a hospital or health care facility that provides intensive care medicine', NULL),
(15, '2023-06-27 15:42:26.252353', NULL, NULL, 'Coronary care unit', 'A coronary care unit or cardiac intensive care unit is a hospital ward specialized in the care of patients with heart attacks, unstable angina, cardiac dysrhythmia and various other cardiac conditions that require continuous monitoring and treatment', NULL),
(16, '2023-06-27 15:42:42.684938', NULL, NULL, 'Unit of measurement', 'A unit of measurement is a definite magnitude of a quantity, defined and adopted by convention or by law, that is used as a standard for measurement of the same kind of quantity. Any other quantity of that kind can be expressed as a multiple of the unit of measurement. For example, a length is a physical quantity.', NULL),
(17, '2023-06-27 15:42:58.511780', NULL, NULL, 'Information', 'Information is an abstract concept that refers to that which has the power to inform. At the most fundamental level, information pertains to the interpretation of that which may be sensed, or their abstractions', NULL),
(18, '2023-11-09 15:58:28.363521', NULL, NULL, 'Ophthalmology', 'Ophthalmology is a surgical subspecialty within medicine that deals with the diagnosis and treatment of eye disorders. A former term is oculism. An ophthalmologist is a physician who undergoes subspecialty training in medical and surgical eye care', ''),
(19, '2023-11-09 16:03:23.570401', NULL, NULL, 'Dentistry or Oral Medicine', 'Oral medicine is a specialty of dentistry that focuses on the oral health care of medically complex patients and the diagnosis and management of medical conditions that affect the mouth and nearby structures. Oral medicine deals with oral mucosal diseases, orofacial pain, oral manifestations of systemic diseases, salivary gland disorders, and the dental management of medically complex patients.', '');

-- --------------------------------------------------------

--
-- Table structure for table `department_speci`
--

CREATE TABLE `department_speci` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `organ_problem_specification_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_speci`
--

INSERT INTO `department_speci` (`id`, `created_at`, `updated_at`, `deleted_at`, `description`, `department_id`, `organ_problem_specification_id`) VALUES
(1, '2023-11-09 15:57:00.610974', NULL, NULL, 'N/A', 4, 1),
(2, '2023-11-09 16:00:04.620841', NULL, NULL, 'N/A', 18, 2),
(3, '2023-11-09 16:01:11.777925', NULL, NULL, 'N/A', 9, 3),
(4, '2023-11-09 16:02:03.717110', NULL, NULL, 'N/A', 9, 4),
(5, '2023-11-09 16:03:32.824346', NULL, NULL, 'N/A', 19, 5);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `division_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `division_id`) VALUES
(1, '2023-07-18 02:29:37.183232', NULL, NULL, 'Joypurhat District', 1),
(2, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bogura District', 1),
(3, '2023-07-18 02:29:37.183232', NULL, NULL, 'Naogaon District', 1),
(4, '2023-07-18 02:29:37.183232', NULL, NULL, 'Natore District', 1),
(5, '2023-07-18 02:29:37.183232', NULL, NULL, 'NawabganjDistrict', 1),
(6, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pabna District', 1),
(7, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sirajganj District', 1),
(8, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajshahi District', 1),
(9, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dinajpur District', 2),
(10, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gaibandha District', 2),
(11, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kurigram District', 2),
(12, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lalmonirhat District', 2),
(13, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nilphamari District', 2),
(14, '2023-07-18 02:29:37.183232', NULL, NULL, 'Panchagarh District', 2),
(15, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rangpur District', 2),
(16, '2023-07-18 02:29:37.183232', NULL, NULL, 'Thakurgaon District', 2),
(17, '2023-07-18 02:29:37.183232', NULL, NULL, 'Netrokona District', 3),
(18, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sherpur District', 3),
(19, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jamalpur District', 3),
(20, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mymensingh District', 3),
(21, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barguna District', 4),
(22, '2023-07-18 02:29:37.183232', NULL, NULL, 'BarishalDistrict', 4),
(23, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhola District', 4),
(24, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jhalokati District', 4),
(25, '2023-07-18 02:29:37.183232', NULL, NULL, 'Patuakhali District', 4),
(26, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pirojpur District', 4),
(27, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bandarban District', 5),
(28, '2023-07-18 02:29:37.183232', NULL, NULL, 'Brahmanbaria District', 5),
(29, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chandpur District', 5),
(30, '2023-07-18 02:29:37.183232', NULL, NULL, 'ChattogramDistrict', 5),
(31, '2023-07-18 02:29:37.183232', NULL, NULL, 'CumillaDistrict', 5),
(32, '2023-07-18 02:29:37.183232', NULL, NULL, 'Cox Bazar District', 5),
(33, '2023-07-18 02:29:37.183232', NULL, NULL, 'Feni District', 5),
(34, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khagrachhari District', 5),
(35, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lakshmipur District', 5),
(36, '2023-07-18 02:29:37.183232', NULL, NULL, 'Noakhali District', 5),
(37, '2023-07-18 02:29:37.183232', NULL, NULL, 'RangamatiDistrict', 5),
(38, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhaka District', 6),
(39, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gazipur District', 6),
(40, '2023-07-18 02:29:37.183232', NULL, NULL, 'GopalganjDistrict', 6),
(41, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kishoreganj District', 6),
(42, '2023-07-18 02:29:37.183232', NULL, NULL, 'Madaripur District', 6),
(43, '2023-07-18 02:29:37.183232', NULL, NULL, 'Manikganj District', 6),
(44, '2023-07-18 02:29:37.183232', NULL, NULL, 'Munshiganj District', 6),
(45, '2023-07-18 02:29:37.183232', NULL, NULL, 'Narayanganj District', 6),
(46, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajbari District', 6),
(47, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shariatpur District', 6),
(48, '2023-07-18 02:29:37.183232', NULL, NULL, 'Faridpur District', 6),
(49, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tangail District', 6),
(50, '2023-07-18 02:29:37.183232', NULL, NULL, 'Narsingdi District', 6),
(51, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagerhat District', 7),
(52, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chuadanga District', 7),
(53, '2023-07-18 02:29:37.183232', NULL, NULL, 'JashoreDistrict', 7),
(54, '2023-07-18 02:29:37.183232', NULL, NULL, 'JhenaidaDistrict', 7),
(55, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khulna District', 7),
(56, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kushtia District', 7),
(57, '2023-07-18 02:29:37.183232', NULL, NULL, 'Magura District', 7),
(58, '2023-07-18 02:29:37.183232', NULL, NULL, 'Meherpur District', 7),
(59, '2023-07-18 02:29:37.183232', NULL, NULL, 'Narail District', 7),
(60, '2023-07-18 02:29:37.183232', NULL, NULL, 'Satkhira District', 7),
(61, '2023-07-18 02:29:37.183232', NULL, NULL, 'Habiganj District', 8),
(62, '2023-07-18 02:29:37.183232', NULL, NULL, 'Moulvibazar District', 8),
(63, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sunamganj District', 8),
(64, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sylhet District', 8);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajshahi Division'),
(2, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rangpur Division'),
(3, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mymensingh Division'),
(4, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barishal Division'),
(5, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chattogram Division'),
(6, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhaka Division'),
(7, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khulna Division'),
(8, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sylhet Division');

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
(47, 'appointment', 'getappointment'),
(7, 'article', 'article'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'bodypart', 'bodypart'),
(5, 'contenttypes', 'contenttype'),
(9, 'department', 'department'),
(10, 'department_speci', 'departmentspecification'),
(11, 'doctor', 'appointmentschedule'),
(17, 'doctor', 'awards'),
(12, 'doctor', 'doctorprofile'),
(16, 'doctor', 'education'),
(15, 'doctor', 'offday'),
(14, 'doctor', 'scheduletime'),
(13, 'doctor', 'socialmedia'),
(18, 'faq', 'faq'),
(19, 'medicine', 'brand'),
(20, 'medicine', 'generic'),
(23, 'medicine', 'medicine'),
(21, 'medicine', 'medicinetype'),
(22, 'medicine', 'strength'),
(24, 'organ', 'organ'),
(25, 'organ_problem_speci', 'organsproblemspecification'),
(26, 'patient', 'patientprofile'),
(27, 'personal_data', 'blood_group'),
(28, 'personal_data', 'board'),
(29, 'personal_data', 'day'),
(30, 'personal_data', 'district'),
(31, 'personal_data', 'division'),
(32, 'personal_data', 'gender'),
(33, 'personal_data', 'matrimony'),
(34, 'personal_data', 'religion'),
(35, 'personal_data', 'upazila'),
(36, 'prescription', 'labtest'),
(37, 'prescription', 'medicineschedule'),
(38, 'prescription', 'prescription'),
(40, 'prescription', 'prescriptionlabtest'),
(39, 'prescription', 'prescriptionmedicine'),
(6, 'sessions', 'session'),
(45, 'user', 'adminprofile'),
(44, 'user', 'images'),
(43, 'user', 'permanentaddress'),
(42, 'user', 'presentaddress'),
(41, 'user', 'user'),
(46, 'verifyotp', 'verifyotp');

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
(1, 'contenttypes', '0001_initial', '2023-11-08 14:03:47.492919'),
(2, 'auth', '0001_initial', '2023-11-08 14:03:48.882779'),
(3, 'admin', '0001_initial', '2023-11-08 14:03:49.210826'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-08 14:03:49.226450'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-08 14:03:49.242068'),
(6, 'personal_data', '0001_initial', '2023-11-08 14:03:49.906181'),
(7, 'user', '0001_initial', '2023-11-08 14:03:52.263077'),
(8, 'patient', '0001_initial', '2023-11-08 14:03:53.110041'),
(9, 'department', '0001_initial', '2023-11-08 14:03:53.172525'),
(10, 'doctor', '0001_initial', '2023-11-08 14:03:56.870781'),
(11, 'appointment', '0001_initial', '2023-11-08 14:03:57.176447'),
(12, 'article', '0001_initial', '2023-11-08 14:03:57.515429'),
(13, 'contenttypes', '0002_remove_content_type_name', '2023-11-08 14:03:57.697390'),
(14, 'auth', '0002_alter_permission_name_max_length', '2023-11-08 14:03:57.895643'),
(15, 'auth', '0003_alter_user_email_max_length', '2023-11-08 14:03:57.926885'),
(16, 'auth', '0004_alter_user_username_opts', '2023-11-08 14:03:57.958130'),
(17, 'auth', '0005_alter_user_last_login_null', '2023-11-08 14:03:58.051857'),
(18, 'auth', '0006_require_contenttypes_0002', '2023-11-08 14:03:58.067478'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2023-11-08 14:03:58.084651'),
(20, 'auth', '0008_alter_user_username_max_length', '2023-11-08 14:03:58.124566'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2023-11-08 14:03:58.150974'),
(22, 'auth', '0010_alter_group_name_max_length', '2023-11-08 14:03:58.182220'),
(23, 'auth', '0011_update_proxy_permissions', '2023-11-08 14:03:58.260327'),
(24, 'auth', '0012_alter_user_first_name_max_length', '2023-11-08 14:03:58.303766'),
(25, 'bodypart', '0001_initial', '2023-11-08 14:03:58.368363'),
(26, 'organ', '0001_initial', '2023-11-08 14:03:58.534647'),
(27, 'organ_problem_speci', '0001_initial', '2023-11-08 14:03:58.701496'),
(28, 'department_speci', '0001_initial', '2023-11-08 14:03:59.173102'),
(29, 'faq', '0001_initial', '2023-11-08 14:03:59.515020'),
(30, 'medicine', '0001_initial', '2023-11-08 14:04:00.652550'),
(31, 'prescription', '0001_initial', '2023-11-08 14:04:03.073937'),
(32, 'sessions', '0001_initial', '2023-11-08 14:04:03.168602'),
(33, 'verifyotp', '0001_initial', '2023-11-08 14:04:03.430184');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('udf9zcxf1xjzltsu6x15cucuruf6d0ab', '.eJxlkEuOwjAQRK-CvEYktqMwsOIC7NhHjd2JGvkT-QNCo7n72JCMkGbXfl1dpfI3yxHDQJod-fY9O7DIjgy0JccWFrz5x9ACmQIt2OwsQcoB3GmqdKe8XWUxlU2sxyrRHQv-DBuzMWviuRptzgSbS7VaDcjChEMONaupbqSaPBsPOjavXWxEKyTn7UFwuRdyEF3PxbWX-16IrlPjVY0tBw2g1eELpd7dZpyKfUI7D9qr5N8_IBd0x0Dj86_gAydMoE_1SQ6Keun3KX6V6n5-ASRcchQ:1r17vG:yWPkXBp99boKH6srEnCvynNpkJ6PJOHAZBTPkQahFI8', '2023-11-23 16:30:26.661320');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_appointment_schedule`
--

CREATE TABLE `doctor_appointment_schedule` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `per_patient_time` int(11) DEFAULT NULL,
  `consultation_fee` int(11) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_appointment_schedule`
--

INSERT INTO `doctor_appointment_schedule` (`id`, `created_at`, `updated_at`, `deleted_at`, `per_patient_time`, `consultation_fee`, `created_by_id`, `doctor_profile_id`, `modified_by_id`) VALUES
(1, '2023-11-09 16:10:38.189276', NULL, NULL, 15, 500, NULL, 1, NULL),
(2, '2023-11-09 16:11:59.477327', NULL, NULL, 10, 500, NULL, 3, NULL),
(3, '2023-11-09 16:12:39.006539', NULL, NULL, 20, 800, NULL, 2, NULL),
(4, '2023-11-09 16:16:02.529383', NULL, NULL, 10, 400, NULL, 4, NULL),
(5, '2023-11-09 16:16:58.807805', NULL, NULL, 10, 300, NULL, 5, NULL),
(6, '2023-11-09 16:17:38.302403', NULL, NULL, 15, 500, NULL, 6, NULL),
(7, '2023-11-09 16:21:14.870005', NULL, NULL, 10, 500, NULL, 10, NULL),
(8, '2023-11-09 16:21:51.794009', NULL, NULL, 10, 500, NULL, 7, NULL),
(9, '2023-11-09 16:22:21.425981', NULL, NULL, 10, 500, NULL, 8, NULL),
(10, '2023-11-09 16:23:30.691493', NULL, NULL, 10, 400, NULL, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_awards`
--

CREATE TABLE `doctor_awards` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `awards` varchar(255) DEFAULT NULL,
  `honors` varchar(255) DEFAULT NULL,
  `publications` varchar(255) DEFAULT NULL,
  `research_interests` varchar(255) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_awards`
--

INSERT INTO `doctor_awards` (`id`, `created_at`, `updated_at`, `deleted_at`, `awards`, `honors`, `publications`, `research_interests`, `created_by_id`, `doctor_profile_id`, `modified_by_id`) VALUES
(1, '2023-11-09 16:10:38.206797', NULL, NULL, 'Quia consequuntur ut', 'Atque corrupti dolo', 'Cum est rerum recusa', 'Non et obcaecati non', NULL, 1, NULL),
(2, '2023-11-09 16:10:38.238979', NULL, NULL, 'Dicta consectetur s', 'Sit incididunt ullam', 'Nisi magna dolore qu', 'Id nulla magna ab mo', NULL, 1, NULL),
(3, '2023-11-09 16:11:59.500239', NULL, NULL, 'Minim officia aliqui', 'Ex in accusamus eos ', 'Dolorum repudiandae ', 'Voluptate et aliquam', NULL, 3, NULL),
(4, '2023-11-09 16:12:39.019138', NULL, NULL, 'Molestiae voluptatem', 'Quod expedita expedi', 'Repellendus Sint al', 'Consequat Qui saepe', NULL, 2, NULL),
(5, '2023-11-09 16:16:02.553807', NULL, NULL, 'Fugiat optio nemo ', 'Culpa praesentium f', 'In in corporis tempo', 'Et molestiae nisi vo', NULL, 4, NULL),
(6, '2023-11-09 16:16:58.814785', NULL, NULL, 'Sequi non excepteur ', 'Dolores id magna ut ', 'Ut laudantium omnis', 'Assumenda et cillum ', NULL, 5, NULL),
(7, '2023-11-09 16:17:38.326908', NULL, NULL, 'Voluptas vero adipis', 'Amet quas expedita ', 'Aut aliquip et volup', 'Excepteur consectetu', NULL, 6, NULL),
(8, '2023-11-09 16:21:14.876149', NULL, NULL, 'Necessitatibus proid', 'Aut quia deserunt qu', 'Laboriosam consequa', 'Qui expedita sed dol', NULL, 10, NULL),
(9, '2023-11-09 16:21:51.827074', NULL, NULL, 'Veniam eos eu volup', 'Mollitia esse aut i', 'Voluptatum atque ea ', 'Temporibus blanditii', NULL, 7, NULL),
(10, '2023-11-09 16:22:21.437043', NULL, NULL, 'Est sunt quod ut t', 'Eu sint suscipit exp', 'Exercitation molesti', 'Ipsa asperiores ips', NULL, 8, NULL),
(11, '2023-11-09 16:23:30.701853', NULL, NULL, 'Possimus laboriosam', 'Autem optio est au', 'Harum est facere do', 'Fugit molestias duc', NULL, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_educations`
--

CREATE TABLE `doctor_educations` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `certificate_degree` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `result` decimal(10,2) DEFAULT NULL,
  `passing_year` date NOT NULL,
  `board_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_educations`
--

INSERT INTO `doctor_educations` (`id`, `created_at`, `updated_at`, `deleted_at`, `certificate_degree`, `institution`, `result`, `passing_year`, `board_id`, `doctor_profile_id`) VALUES
(1, '2023-11-09 16:10:38.214609', NULL, NULL, 'Alea Thompson', 'Quia consequatur no', '30.00', '2004-03-19', 6, 1),
(2, '2023-11-09 16:10:38.240979', NULL, NULL, 'Elton Rose', 'Voluptatibus maxime ', '89.00', '2017-07-21', 7, 1),
(3, '2023-11-09 16:11:59.516725', NULL, NULL, 'Edan Castillo', 'Sed eum iste in dolo', '32.00', '2008-01-20', 9, 3),
(4, '2023-11-09 16:12:39.021133', NULL, NULL, 'Ivana Flynn', 'Labore quia exceptur', '34.00', '1990-06-22', 2, 2),
(5, '2023-11-09 16:16:02.565774', NULL, NULL, 'Deanna Johnston', 'Laborum Aut deserun', '41.00', '1984-09-07', 7, 4),
(6, '2023-11-09 16:16:58.815785', NULL, NULL, 'Alma Knox', 'Anim sapiente eiusmo', '30.00', '2011-07-23', 5, 5),
(7, '2023-11-09 16:17:38.335467', NULL, NULL, 'Dacey Nunez', 'Suscipit tempore se', '16.00', '1980-08-22', 6, 6),
(8, '2023-11-09 16:21:14.878142', NULL, NULL, 'Hayfa Burch', 'Veniam fugiat eum ', '86.00', '2011-01-17', 10, 10),
(9, '2023-11-09 16:21:51.835024', NULL, NULL, 'Vernon Flores', 'Et libero accusamus ', '28.00', '1997-11-03', 10, 7),
(10, '2023-11-09 16:22:21.444175', NULL, NULL, 'Kylan Patterson', 'Hic ut id impedit o', '10.00', '2005-10-19', 3, 8),
(11, '2023-11-09 16:23:30.703850', NULL, NULL, 'Patrick Graves', 'Quo illum consequat', '60.00', '1994-06-06', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_profile`
--

CREATE TABLE `doctor_profile` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `birth_registration_no` varchar(255) DEFAULT NULL,
  `phone_no` varchar(110) DEFAULT NULL,
  `nid_no` varchar(20) DEFAULT NULL,
  `experience` varchar(1000) DEFAULT NULL,
  `biography` varchar(1000) DEFAULT NULL,
  `languages_spoken` varchar(255) DEFAULT NULL,
  `passport_no` varchar(255) DEFAULT NULL,
  `blood_group_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `gender_id` bigint(20) NOT NULL,
  `matrimony_id` bigint(20) NOT NULL,
  `religion_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_profile`
--

INSERT INTO `doctor_profile` (`id`, `created_at`, `updated_at`, `deleted_at`, `full_name`, `father_name`, `mother_name`, `date_of_birth`, `birth_registration_no`, `phone_no`, `nid_no`, `experience`, `biography`, `languages_spoken`, `passport_no`, `blood_group_id`, `department_id`, `gender_id`, `matrimony_id`, `religion_id`, `user_id`) VALUES
(1, '2023-11-09 16:07:26.576657', NULL, NULL, 'Dr Korim', 'Cara Lancaster', 'Joel Madden', '2016-08-31', '4', '+1 (609) 302-5159', '3', 'Eos eligendi volupt', 'Sit fugit impedit', 'Incididunt alias qui', 'Aspernatur quo nisi', 1, 4, 1, 5, 1, 2),
(2, '2023-11-09 16:08:31.013008', NULL, NULL, 'Dominique Lewis', 'Skyler Strickland', 'Hermione Park', '2014-07-01', '58', '+1 (625) 438-4247', '78', 'Magna amet beatae r', 'Aliquip qui voluptat', 'Omnis sit eius sint', 'Ex cupidatat est ips', 5, 4, 1, 3, 1, 3),
(3, '2023-11-09 16:08:51.931694', NULL, NULL, 'Barry Dejesus', 'Patience Boone', 'Malachi Mcintyre', '1982-04-18', '97', '+1 (181) 497-3919', '74', 'Vero quo ex quos off', 'Esse quam laudantiu', 'Quos in sunt est vo', 'Itaque proident vol', 3, 4, 1, 1, 1, 4),
(4, '2023-11-09 16:14:25.627912', NULL, NULL, 'Trevor Marshall', 'Boris Dean', 'Ina Hall', '1984-02-20', '82', '+1 (989) 417-5326', '55', 'Id omnis ab qui sun', 'Aut praesentium ulla', 'Occaecat consectetur', 'Maxime numquam ad la', 2, 18, 2, 1, 1, 5),
(5, '2023-11-09 16:14:44.931129', NULL, NULL, 'Hector Maynard', 'Sean Hernandez', 'Reed Vinson', '2020-07-24', '85', '+1 (573) 401-9528', '25', 'Irure doloribus qui', 'Aperiam nulla incidu', 'Dolore dolore pariat', 'Id inventore ullamco', 1, 19, 1, 2, 3, 6),
(6, '2023-11-09 16:14:58.613620', NULL, NULL, 'Colleen Hewitt', 'Hermione Phelps', 'Thor Baird', '1990-10-04', '51', '+1 (724) 217-4795', '82', 'Optio facilis anim', 'Voluptatem velit asp', 'Aute excepturi quis', 'Quisquam qui quaerat', 6, 18, 2, 4, 5, 7),
(7, '2023-11-09 16:18:39.282363', NULL, NULL, 'Hector Landry', 'Zephania Snow', 'Amela Valenzuela', '1982-02-11', '47', '+1 (137) 812-5613', '45', 'Ullam hic pariatur', 'Alias et vitae a ess', 'Qui autem nihil volu', 'Consequatur aliquip', 5, 9, 1, 3, 1, 8),
(8, '2023-11-09 16:18:58.251047', NULL, NULL, 'Unity Terry', 'Gannon Sheppard', 'Lael Nolan', '1979-06-21', '46', '+1 (754) 943-5865', '91', 'Quia elit eos repr', 'Ipsum iusto illum', 'Quia ut sit fugiat', 'Neque aut iure nemo', 5, 9, 1, 3, 1, 9),
(9, '2023-11-09 16:19:16.812586', NULL, NULL, 'Larissa Delgado', 'Wyoming Berger', 'Shelby Mccormick', '1985-12-20', '5', '+1 (518) 499-7255', '50', 'Et at dolor explicab', 'Nihil et quis eiusmo', 'Porro vel nostrud de', 'Non nihil et volupta', 3, 9, 2, 1, 1, 10),
(10, '2023-11-09 16:19:59.638722', NULL, NULL, 'Cassady Davis', 'Lillith Goodwin', 'Karina Vincent', '1987-08-23', '37', '+1 (771) 156-5665', '65', 'Fugit maiores paria', 'Consectetur dolor e', 'Non dolor quam est i', 'Sit sint aperiam mo', 2, 9, 2, 1, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule_times`
--

CREATE TABLE `doctor_schedule_times` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `appointment_schedule_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_schedule_times`
--

INSERT INTO `doctor_schedule_times` (`id`, `created_at`, `updated_at`, `deleted_at`, `start_time`, `end_time`, `appointment_schedule_id`, `doctor_profile_id`) VALUES
(1, '2023-11-09 16:10:38.234412', NULL, NULL, '09:00:00.000000', '13:00:00.000000', 1, 1),
(2, '2023-11-09 16:10:38.262727', NULL, NULL, '17:00:00.000000', '22:00:00.000000', 1, 1),
(3, '2023-11-09 16:11:59.520714', NULL, NULL, '11:00:00.000000', '14:00:00.000000', 2, 3),
(4, '2023-11-09 16:12:39.055827', NULL, NULL, '17:00:00.000000', '23:00:00.000000', 3, 2),
(5, '2023-11-09 16:16:02.582328', NULL, NULL, '09:00:00.000000', '14:00:00.000000', 4, 4),
(6, '2023-11-09 16:16:58.835204', NULL, NULL, '10:00:00.000000', '13:00:00.000000', 5, 5),
(7, '2023-11-09 16:17:38.339456', NULL, NULL, '16:00:00.000000', '22:00:00.000000', 6, 6),
(8, '2023-11-09 16:21:14.903167', NULL, NULL, '09:00:00.000000', '13:00:00.000000', 7, 10),
(9, '2023-11-09 16:21:51.839103', NULL, NULL, '10:00:00.000000', '14:00:00.000000', 8, 7),
(10, '2023-11-09 16:22:21.453475', NULL, NULL, '17:00:00.000000', '23:00:00.000000', 9, 8),
(11, '2023-11-09 16:23:30.740996', NULL, NULL, '10:00:00.000000', '13:30:00.000000', 10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_social_media`
--

CREATE TABLE `doctor_social_media` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_social_media`
--

INSERT INTO `doctor_social_media` (`id`, `created_at`, `updated_at`, `deleted_at`, `website`, `facebook`, `instagram`, `linkedin`, `doctor_profile_id`) VALUES
(1, '2023-11-09 16:10:38.197254', NULL, NULL, 'https://www.ronon.me.uk', 'https://www.xak.ca', 'https://www.jubypywaqew.cm', 'https://www.befediberunozy.org.uk', 1),
(2, '2023-11-09 16:11:59.481846', NULL, NULL, 'https://www.saho.info', 'https://www.neguqygulik.ca', 'https://www.loculomupur.org', 'https://www.rawebuvigac.com', 3),
(3, '2023-11-09 16:12:39.006539', NULL, NULL, 'https://www.nehalowu.me', 'https://www.varazu.in', 'https://www.lizunuguwoqysas.in', 'https://www.tulygy.tv', 2),
(4, '2023-11-09 16:16:02.535365', NULL, NULL, 'https://www.qopurozapynek.me.uk', 'https://www.vohanevede.com.au', 'https://www.wabatopyfoli.com.au', 'https://www.jun.in', 4),
(5, '2023-11-09 16:16:58.810811', NULL, NULL, 'https://www.vypygomyc.tv', 'https://www.tutoladube.cc', 'https://www.mihexogagoji.co.uk', 'https://www.vukedusosocuho.org', 5),
(6, '2023-11-09 16:17:38.306965', NULL, NULL, 'https://www.qizetubafunec.in', 'https://www.fajaluci.biz', 'https://www.cycez.org.uk', 'https://www.cyroxomil.net', 6),
(7, '2023-11-09 16:21:14.872997', NULL, NULL, 'https://www.reja.me.uk', 'https://www.wumagowofuqekus.cc', 'https://www.fywuconawaledik.ws', 'https://www.tiboda.co', 10),
(8, '2023-11-09 16:21:51.799842', NULL, NULL, 'https://www.tewymudonigaseh.us', 'https://www.sanipiqep.com.au', 'https://www.nix.us', 'https://www.kozihitu.me.uk', 7),
(9, '2023-11-09 16:22:21.429059', NULL, NULL, 'https://www.hewo.cc', 'https://www.bozi.me.uk', 'https://www.sydecawyhu.ws', 'https://www.naxo.net', 8),
(10, '2023-11-09 16:23:30.694872', NULL, NULL, 'https://www.vefoxareqezuq.me.uk', 'https://www.juraba.info', 'https://www.jawe.co', 'https://www.wilyfoje.us', 9);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `photo_name` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `created_at`, `updated_at`, `deleted_at`, `photo_name`, `user_id`) VALUES
(1, '2023-11-08 14:08:12.258487', '2023-11-09 21:37:23.807572', NULL, 'static/uploads/images/20231109213723_24612b63762244cfbcf01adaadc98e3d.jpeg', 1),
(2, '2023-11-09 16:07:26.585949', NULL, NULL, '', 2),
(3, '2023-11-09 16:08:31.026602', NULL, NULL, '', 3),
(4, '2023-11-09 16:08:51.936426', NULL, NULL, '', 4),
(5, '2023-11-09 16:14:25.639879', NULL, NULL, '', 5),
(6, '2023-11-09 16:14:44.933131', NULL, NULL, '', 6),
(7, '2023-11-09 16:14:58.622130', NULL, NULL, '', 7),
(8, '2023-11-09 16:18:39.284346', NULL, NULL, '', 8),
(9, '2023-11-09 16:18:58.269845', NULL, NULL, '', 9),
(10, '2023-11-09 16:19:16.816573', NULL, NULL, '', 10),
(11, '2023-11-09 16:19:59.639719', NULL, NULL, '', 11),
(12, '2023-11-09 16:29:29.987848', NULL, NULL, '', 12),
(13, '2023-11-09 16:30:05.937996', NULL, NULL, '', 13),
(14, '2023-11-09 16:30:18.569045', NULL, NULL, '', 14);

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_test`
--

INSERT INTO `lab_test` (`id`, `name`) VALUES
(1, 'Blood Test');

-- --------------------------------------------------------

--
-- Table structure for table `matrimony`
--

CREATE TABLE `matrimony` (
  `id` bigint(20) NOT NULL,
  `name` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matrimony`
--

INSERT INTO `matrimony` (`id`, `name`) VALUES
(1, 'Married'),
(2, 'Unmarried'),
(3, 'Separated, or Widowed'),
(4, 'Divorced'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) NOT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `generic_id` bigint(20) NOT NULL,
  `medicine_type_id` bigint(20) NOT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `strength_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_brand`
--

CREATE TABLE `medicine_brand` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_brand`
--

INSERT INTO `medicine_brand` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, NULL, NULL, NULL, 'ACI Limited'),
(2, NULL, NULL, NULL, 'ACME Laboratories Ltd.'),
(3, NULL, NULL, NULL, 'Ad-din Pharmaceuticals Ltd.'),
(4, NULL, NULL, NULL, 'Aexim Pharmaceuticals Ltd.'),
(5, NULL, NULL, NULL, 'Al-Madina Pharmaceuticals Ltd.'),
(6, NULL, NULL, NULL, 'Alco Pharma Ltd.'),
(7, NULL, NULL, NULL, 'Alkad Laboratories'),
(8, NULL, NULL, NULL, 'Allied Pharmaceuticals Ltd.'),
(9, NULL, NULL, NULL, 'Ambee Pharmaceuticals Ltd.'),
(10, NULL, NULL, NULL, 'Amico Laboratories Ltd.'),
(11, NULL, NULL, NULL, 'Amulet Pharmaceuticals Ltd.'),
(12, NULL, NULL, NULL, 'APC Pharma Ltd.'),
(13, NULL, NULL, NULL, 'Apex Pharmaceuticals Ltd.'),
(14, NULL, NULL, NULL, 'Apollo Pharmaceutical Ltd.'),
(15, NULL, NULL, NULL, 'Arges Life Science Limited'),
(16, NULL, NULL, NULL, 'Aristopharma Ltd.'),
(17, NULL, NULL, NULL, 'Asiatic Laboratories Ltd.'),
(18, NULL, NULL, NULL, 'Astra Biopharmaceuticals Ltd.'),
(19, NULL, NULL, NULL, 'Aztec Pharmaceuticals Ltd.'),
(20, NULL, NULL, NULL, 'Bangladesh Immunity Co'),
(21, NULL, NULL, NULL, 'Beacon Pharmaceuticals Ltd.'),
(22, NULL, NULL, NULL, 'Belsen Pharmaceuticals Ltd.'),
(23, NULL, NULL, NULL, 'Bengal drugs Ltd.'),
(24, NULL, NULL, NULL, 'Benham Pharmaceuticals Ltd.'),
(25, NULL, NULL, NULL, 'Beximco Pharmaceuticals Ltd.'),
(26, NULL, NULL, NULL, 'Biogene Pharma Ltd.'),
(27, NULL, NULL, NULL, 'Biopharma Laboratories Ltd.'),
(28, NULL, NULL, NULL, 'BioRx'),
(29, NULL, NULL, NULL, 'BOTS Pvt. Limited'),
(30, NULL, NULL, NULL, 'Bristol Pharmaceuticals Ltd.'),
(31, NULL, NULL, NULL, 'Centeon Pharma Ltd.'),
(32, NULL, NULL, NULL, 'Central Pharmaceuticals Ltd.'),
(33, NULL, NULL, NULL, 'Chemist Laboratories Ltd.'),
(34, NULL, NULL, NULL, 'City Overseas Ltd.'),
(35, NULL, NULL, NULL, 'Concord Pharmaceuticals Ltd.'),
(36, NULL, NULL, NULL, 'Cosmic Pharma Ltd.'),
(37, NULL, NULL, NULL, 'Cosmo Pharma Ltd.'),
(38, NULL, NULL, NULL, 'Credence Pharmaceuticals Ltd.'),
(39, NULL, NULL, NULL, 'Crystal Pharmaceuticals Ltd.'),
(40, NULL, NULL, NULL, 'D16 Pharma & Biotec'),
(41, NULL, NULL, NULL, 'Decent Pharma Laboratories Ltd.'),
(42, NULL, NULL, NULL, 'Delta Pharma Ltd.'),
(43, NULL, NULL, NULL, 'Desh Pharmaceuticals Ltd.'),
(44, NULL, NULL, NULL, 'Doctor TIMS Pharmaceuticals Ltd.'),
(45, NULL, NULL, NULL, 'Doctor’s Chemical Works Ltd.'),
(46, NULL, NULL, NULL, 'Drug International Ltd.'),
(47, NULL, NULL, NULL, 'Eastern Pharmaceuticals Ltd.'),
(48, NULL, NULL, NULL, 'Edruc Ltd.'),
(49, NULL, NULL, NULL, 'Elixir Pharmaceuticals Ltd.'),
(50, NULL, NULL, NULL, 'Eskayef Pharmaceuticals Ltd.'),
(51, NULL, NULL, NULL, 'Ethical Drug Ltd.'),
(52, NULL, NULL, NULL, 'Euro Pharma Ltd.'),
(53, NULL, NULL, NULL, 'Everest Pharmaceuticals Ltd.'),
(54, NULL, NULL, NULL, 'Fabrique en France'),
(55, NULL, NULL, NULL, 'FnF Pharmaceuticals Ltd.'),
(56, NULL, NULL, NULL, 'Gaco Pharmaceuticals Ltd.'),
(57, NULL, NULL, NULL, 'General Pharmaceuticals Ltd.'),
(58, NULL, NULL, NULL, 'Genvio Pharma Ltd.'),
(59, NULL, NULL, NULL, 'Get Well Ltd.'),
(60, NULL, NULL, NULL, 'GlaxoSmithKline'),
(61, NULL, NULL, NULL, 'Globe Pharmaceuticals Ltd.'),
(62, NULL, NULL, NULL, 'Globex Pharmaceuticals Ltd.'),
(63, NULL, NULL, NULL, 'Gonoshasthaya Pharma Ltd.'),
(64, NULL, NULL, NULL, 'Goodman Pharmaceuticals Ltd.'),
(65, NULL, NULL, NULL, 'Greenland Pharmaceuticals Ltd.'),
(66, NULL, NULL, NULL, 'Guardian Healthcare Ltd.'),
(67, NULL, NULL, NULL, 'Hallmark Pharmaceuticals Ltd.'),
(68, NULL, NULL, NULL, 'Healthcare Pharmaceuticals Ltd.'),
(69, NULL, NULL, NULL, 'Hudson Pharmaceuticals Ltd.'),
(70, NULL, NULL, NULL, 'Ibn Sina Pharmaceuticals Ltd.'),
(71, NULL, NULL, NULL, 'Incepta Pharmaceuticals Ltd.'),
(72, NULL, NULL, NULL, 'Indo Bangla Pharmaceutical'),
(73, NULL, NULL, NULL, 'Innova Pharma (Albion)'),
(74, NULL, NULL, NULL, 'Institute of Public Health (IPH)'),
(75, NULL, NULL, NULL, 'International Agencies (Bd.) Limited'),
(76, NULL, NULL, NULL, 'Janata Traders'),
(77, NULL, NULL, NULL, 'Jayson Pharma Ltd.'),
(78, NULL, NULL, NULL, 'Julphar Bangladesh Ltd.'),
(79, NULL, NULL, NULL, 'Kawsar Chemicals'),
(80, NULL, NULL, NULL, 'Kemiko Pharmaceuticals Ltd.'),
(81, NULL, NULL, NULL, 'Kumudini Pharma Ltd.'),
(82, NULL, NULL, NULL, 'Labaid Pharma Ltd.'),
(83, NULL, NULL, NULL, 'Legends Pharma'),
(84, NULL, NULL, NULL, 'Leon Pharmaceuticals Ltd.'),
(85, NULL, NULL, NULL, 'Libra Infusions Ltd.'),
(86, NULL, NULL, NULL, 'Libra Pharmaceuticls Ltd.'),
(87, NULL, NULL, NULL, 'Linde Bangladesh Ltd.'),
(88, NULL, NULL, NULL, 'Marie Stopes Bangladesh'),
(89, NULL, NULL, NULL, 'Marker Pharma Ltd.'),
(90, NULL, NULL, NULL, 'Marksman Pharmaceuticals Ltd.'),
(91, NULL, NULL, NULL, 'Medicon Pharmaceuticals Ltd.'),
(92, NULL, NULL, NULL, 'Medimet Pharmaceuticals Ltd.'),
(93, NULL, NULL, NULL, 'MedRx Life Science Ltd.'),
(94, NULL, NULL, NULL, 'Millat Pharmaceuticals Ltd.'),
(95, NULL, NULL, NULL, 'Modern Pharmaceuticals Ltd.'),
(96, NULL, NULL, NULL, 'Momotaz Pharmaceuticals Ltd.'),
(97, NULL, NULL, NULL, 'Monicopharma Ltd.'),
(98, NULL, NULL, NULL, 'MST Pharma'),
(99, NULL, NULL, NULL, 'Mundipharma (BD) Pvt. Ltd.'),
(100, NULL, NULL, NULL, 'Mystic Pharmaceuticals Ltd.'),
(101, NULL, NULL, NULL, 'Naafco Pharma Ltd.'),
(102, NULL, NULL, NULL, 'Navana Pharmaceuticals Ltd.'),
(103, NULL, NULL, NULL, 'Nipa Pharmaceuticals Ltd.'),
(104, NULL, NULL, NULL, 'NIPRO JMI Pharma Ltd.'),
(105, NULL, NULL, NULL, 'Novartis (Bangladesh) Ltd.'),
(106, NULL, NULL, NULL, 'Novelta Bestway Pharmaceuticals Ltd.'),
(107, NULL, NULL, NULL, 'Novo Healthcare and Pharma Ltd.'),
(108, NULL, NULL, NULL, 'Novo Nordisk'),
(109, NULL, NULL, NULL, 'Novus Pharmaceuticals Ltd.'),
(110, NULL, NULL, NULL, 'Nuvista Pharma Ltd.'),
(111, NULL, NULL, NULL, 'One Pharma Ltd.'),
(112, NULL, NULL, NULL, 'Opso Saline Ltd.'),
(113, NULL, NULL, NULL, 'Opsonin Pharma Ltd.'),
(114, NULL, NULL, NULL, 'Orbit Pharmaceuticals Ltd.'),
(115, NULL, NULL, NULL, 'Organic Health Care'),
(116, NULL, NULL, NULL, 'Orion Infusion Ltd.'),
(117, NULL, NULL, NULL, 'Orion Pharma Ltd.'),
(118, NULL, NULL, NULL, 'Oyster Pharmaceuticals Ltd.'),
(119, NULL, NULL, NULL, 'Pacific Pharmaceuticals Ltd.'),
(120, NULL, NULL, NULL, 'Peoples Pharma Ltd.'),
(121, NULL, NULL, NULL, 'Pfizer'),
(122, NULL, NULL, NULL, 'Pharmacil Limited'),
(123, NULL, NULL, NULL, 'Pharmadesh Laboratories Ltd.'),
(124, NULL, NULL, NULL, 'Pharmasia Limited'),
(125, NULL, NULL, NULL, 'Pharmik Laboratories Ltd.'),
(126, NULL, NULL, NULL, 'Phoenix Chemical Laboratory'),
(127, NULL, NULL, NULL, 'Popular Pharmaceuticals Ltd.'),
(128, NULL, NULL, NULL, 'Premier Pharmaceuticals Ltd.'),
(129, NULL, NULL, NULL, 'Prime Pharmaceuticals Ltd.'),
(130, NULL, NULL, NULL, 'Quality Pharmaceuticals Ltd.'),
(131, NULL, NULL, NULL, 'Radiant Pharmaceuticals Ltd.'),
(132, NULL, NULL, NULL, 'Rangs Pharmaceuticals Ltd.'),
(133, NULL, NULL, NULL, 'Reckitt & Benckiser Bangladesh Ltd.'),
(134, NULL, NULL, NULL, 'Reliance Pharmaceuticals Ltd.'),
(135, NULL, NULL, NULL, 'Reman Drug Laboratories Ltd.'),
(136, NULL, NULL, NULL, 'Renata Limited'),
(137, NULL, NULL, NULL, 'Rephco Pharmaceuticals Ltd.'),
(138, NULL, NULL, NULL, 'RN Pharmaceuticals'),
(139, NULL, NULL, NULL, 'Roche Bangladesh Ltd.'),
(140, NULL, NULL, NULL, 'S.N. Pharmaceutical Ltd.'),
(141, NULL, NULL, NULL, 'Salton Pharmaceuticals Ltd.'),
(142, NULL, NULL, NULL, 'SANDOZ (A Novartis Division)'),
(143, NULL, NULL, NULL, 'Sanofi Bangladesh Ltd.'),
(144, NULL, NULL, NULL, 'Seba Laboratories Ltd.'),
(145, NULL, NULL, NULL, 'Seema Pharmaceuticals Ltd.'),
(146, NULL, NULL, NULL, 'Servier Bangladesh Operation'),
(147, NULL, NULL, NULL, 'Sharif Pharmaceuticals Ltd.'),
(148, NULL, NULL, NULL, 'Silco Pharmaceutical Ltd.'),
(149, NULL, NULL, NULL, 'Silva Pharmaceuticals Ltd.'),
(150, NULL, NULL, NULL, 'Skylab Pharmaceuticals Ltd.'),
(151, NULL, NULL, NULL, 'Social Marketing Company'),
(152, NULL, NULL, NULL, 'Somatec Pharmaceuticals Ltd.'),
(153, NULL, NULL, NULL, 'Sonear Laboratories Ltd.'),
(154, NULL, NULL, NULL, 'Square Pharmaceuticals Ltd.'),
(155, NULL, NULL, NULL, 'Sun Pharmaceutical Ltd.'),
(156, NULL, NULL, NULL, 'Sunman-Birdem Pharma Ltd.'),
(157, NULL, NULL, NULL, 'Supreme Pharmaceutical Ltd.'),
(158, NULL, NULL, NULL, 'Syntho Laboratories Ltd.'),
(159, NULL, NULL, NULL, 'Team Pharmaceuticals Ltd.'),
(160, NULL, NULL, NULL, 'Techno Drugs Ltd.'),
(161, NULL, NULL, NULL, 'The White Horse Pharma'),
(162, NULL, NULL, NULL, 'Therapeutics Bangladesh Ltd.'),
(163, NULL, NULL, NULL, 'Ultra Pharma Ltd.'),
(164, NULL, NULL, NULL, 'Unimed Unihealth MFG. Ltd.'),
(165, NULL, NULL, NULL, 'Unique Pharmaceuticals Ltd.'),
(166, NULL, NULL, NULL, 'United Pharmaceuticals Ltd.'),
(167, NULL, NULL, NULL, 'Veritas Pharmaceuticals Ltd.'),
(168, NULL, NULL, NULL, 'Virgo Pharmaceuticals Ltd.'),
(169, NULL, NULL, NULL, 'ZAS Corporation'),
(170, NULL, NULL, NULL, 'Zenith Pharmaceuticals Ltd.'),
(171, NULL, NULL, NULL, 'Ziska Pharmaceuticals Ltd.');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_generic`
--

CREATE TABLE `medicine_generic` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_generic`
--

INSERT INTO `medicine_generic` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, NULL, NULL, NULL, 'Aceclofenac'),
(2, NULL, NULL, NULL, 'Acetylcysteine USP'),
(3, NULL, NULL, NULL, 'Aciclovir'),
(4, NULL, NULL, NULL, 'Aciclovir BP 5% & Hydrocortisone BP 1%'),
(5, NULL, NULL, NULL, 'Acyclovir USP'),
(6, NULL, NULL, NULL, 'Adapalene'),
(7, NULL, NULL, NULL, 'Adapalene+Benzoyl peroxide'),
(8, NULL, NULL, NULL, 'Adefovir Dipivoxil'),
(9, NULL, NULL, NULL, 'Albendazole'),
(10, NULL, NULL, NULL, 'Allopurinol'),
(11, NULL, NULL, NULL, 'Allylestrenol'),
(12, NULL, NULL, NULL, 'Ambrisentan'),
(13, NULL, NULL, NULL, 'Ambroxol'),
(14, NULL, NULL, NULL, 'Amikacin Sulfate USP'),
(15, NULL, NULL, NULL, 'Amitriptyline HCl'),
(16, NULL, NULL, NULL, 'Amlexanox'),
(17, NULL, NULL, NULL, 'Amlodipine'),
(18, NULL, NULL, NULL, 'Amlodipine + Atenolol'),
(19, NULL, NULL, NULL, 'Amlodipine + Olmesartan Medoxomil'),
(20, NULL, NULL, NULL, 'Amoxicillin'),
(21, NULL, NULL, NULL, 'Amoxicillin + Clavulanic acid'),
(22, NULL, NULL, NULL, 'Antacid'),
(23, NULL, NULL, NULL, 'Antacid'),
(24, NULL, NULL, NULL, 'Antiallergic'),
(25, NULL, NULL, NULL, 'Aripiprazole'),
(26, NULL, NULL, NULL, 'Artemether + Lumefantrine'),
(27, NULL, NULL, NULL, 'Aspirin'),
(28, NULL, NULL, NULL, 'Astaxanthin'),
(29, NULL, NULL, NULL, 'Atorvastatin'),
(30, NULL, NULL, NULL, 'Azelastine Hydrochloride & Fluticasone Propionate'),
(31, NULL, NULL, NULL, 'Azithromycin'),
(32, NULL, NULL, NULL, 'Baclofen'),
(33, NULL, NULL, NULL, 'Baricitinib 2 mg'),
(34, NULL, NULL, NULL, 'Beclometasone Dipropionate'),
(35, NULL, NULL, NULL, 'Beclomethasone dipropionate'),
(36, NULL, NULL, NULL, 'Benzydamine Hydrochloride BP'),
(37, NULL, NULL, NULL, 'Beta Carotene + Vit. C + Vit. E'),
(38, NULL, NULL, NULL, 'Betahistine Mesilate'),
(39, NULL, NULL, NULL, 'Betamethasone + Salicylic Acid'),
(40, NULL, NULL, NULL, 'Betamethasone Dipropionate'),
(41, NULL, NULL, NULL, 'Betamethasone Dipropionate & Clotrimazole'),
(42, NULL, NULL, NULL, 'Betamethasone Dipropionate & Neomycin Sulphate'),
(43, NULL, NULL, NULL, 'Betrixaban'),
(44, NULL, NULL, NULL, 'Bicarbonate Hemodialysis Solution (Acidic Component)'),
(45, NULL, NULL, NULL, 'Bicarbonate Hemodialysis Solution (Basic Component)'),
(46, NULL, NULL, NULL, 'Bilastine'),
(47, NULL, NULL, NULL, 'Bimatoprost 0.03% & Timolol 0.5%'),
(48, NULL, NULL, NULL, 'Bisoprolol + Amlodipine'),
(49, NULL, NULL, NULL, 'Bisoprolol Fumarate'),
(50, NULL, NULL, NULL, 'Bisoprolol Fumarate+ Hydrochlorothiazide'),
(51, NULL, NULL, NULL, 'Bromazepam'),
(52, NULL, NULL, NULL, 'Bromfenac Sodium'),
(53, NULL, NULL, NULL, 'Bromhexine HCl'),
(54, NULL, NULL, NULL, 'Bromocriptine mesilate'),
(55, NULL, NULL, NULL, 'Budesonide+ Formoterol Fumarate Dihydrate'),
(56, NULL, NULL, NULL, 'Butamirate CItrate'),
(57, NULL, NULL, NULL, 'Cabergoline'),
(58, NULL, NULL, NULL, 'Calcipotriol'),
(59, NULL, NULL, NULL, 'Calcipotriol+Betamethasone Dipropionate'),
(60, NULL, NULL, NULL, 'Calcitriol'),
(61, NULL, NULL, NULL, 'Calcium + Vitamin-D'),
(62, NULL, NULL, NULL, 'Calcium 500 mg (algae Source) and Vitamin D3 200 IU'),
(63, NULL, NULL, NULL, 'Calcium 600 mg + Vitamin D 400 IU'),
(64, NULL, NULL, NULL, 'Calcium Carbonate'),
(65, NULL, NULL, NULL, 'Calcium Carbonate'),
(66, NULL, NULL, NULL, 'Calcium Carbonate (from Coral source) USP 1250 mg & Vit'),
(67, NULL, NULL, NULL, 'Calcium laclate gluconate + Calcium carbonate + Ascorbi'),
(68, NULL, NULL, NULL, 'Calcium+Vitamin-D+Multimineral'),
(69, NULL, NULL, NULL, 'Canagliflozin'),
(70, NULL, NULL, NULL, 'Carbamazepine'),
(71, NULL, NULL, NULL, 'Carbimazole'),
(72, NULL, NULL, NULL, 'Carboxymethylcellulose Sodium 1%'),
(73, NULL, NULL, NULL, 'Cefaclor'),
(74, NULL, NULL, NULL, 'Cefadroxil Monohydrate'),
(75, NULL, NULL, NULL, 'Cefazolin'),
(76, NULL, NULL, NULL, 'Cefepime'),
(77, NULL, NULL, NULL, 'Cefixime'),
(78, NULL, NULL, NULL, 'Cefoperazone'),
(79, NULL, NULL, NULL, 'Cefotaxime'),
(80, NULL, NULL, NULL, 'Cefpodoxime Proxetil'),
(81, NULL, NULL, NULL, 'Ceftazidime'),
(82, NULL, NULL, NULL, 'Ceftibuten'),
(83, NULL, NULL, NULL, 'Ceftriaxone'),
(84, NULL, NULL, NULL, 'Cefuroxime & Clavulanic Acid'),
(85, NULL, NULL, NULL, 'Cefuroxime Sodium'),
(86, NULL, NULL, NULL, 'Cephradine'),
(87, NULL, NULL, NULL, 'Cetirizine HCl'),
(88, NULL, NULL, NULL, 'Chloramphenicol'),
(89, NULL, NULL, NULL, 'Chlorhexidine Gluconate'),
(90, NULL, NULL, NULL, 'Chlorhexidine Gluconate 7.1% Solution'),
(91, NULL, NULL, NULL, 'Chlorpheniramine maleate BP'),
(92, NULL, NULL, NULL, 'Cholecalciferol EP (Vitamin D3)'),
(93, NULL, NULL, NULL, 'Ciclopirox Olamine'),
(94, NULL, NULL, NULL, 'Ciclopirox Olamine USP 1%'),
(95, NULL, NULL, NULL, 'Cilnidipine'),
(96, NULL, NULL, NULL, 'Cilostazol'),
(97, NULL, NULL, NULL, 'Cinchocaine HCI + Hydrocortisone + Framycetin Sulphate'),
(98, NULL, NULL, NULL, 'Cinnarizine'),
(99, NULL, NULL, NULL, 'Cinnarizine+Dimenhydrinate'),
(100, NULL, NULL, NULL, 'Ciprofloxacin'),
(101, NULL, NULL, NULL, 'Ciprofloxacin'),
(102, NULL, NULL, NULL, 'Ciprofloxacin 0.2% w/v IV Infusion'),
(103, NULL, NULL, NULL, 'Citicoline'),
(104, NULL, NULL, NULL, 'Clarithromycin'),
(105, NULL, NULL, NULL, 'Clindamycin HCl'),
(106, NULL, NULL, NULL, 'Clindamycin Phosphate+Tretinoin'),
(107, NULL, NULL, NULL, 'Clobetasol Propionate'),
(108, NULL, NULL, NULL, 'Clobetasol Propionate +Neomycin Sulphate +Nystatin'),
(109, NULL, NULL, NULL, 'Clobetasol Propionate BP'),
(110, NULL, NULL, NULL, 'Clobetasol Propionate, Ofloxacin, Ornidazole & Terbinaf'),
(111, NULL, NULL, NULL, 'Clobetasone Butyrate'),
(112, NULL, NULL, NULL, 'Clonazepam'),
(113, NULL, NULL, NULL, 'Clopidogrel'),
(114, NULL, NULL, NULL, 'Clopidogrel + Aspirin'),
(115, NULL, NULL, NULL, 'Clotrimazole'),
(116, NULL, NULL, NULL, 'Clotrimazole'),
(117, NULL, NULL, NULL, 'Coenzyme Q10 (Ubidecarenone USP)'),
(118, NULL, NULL, NULL, 'Colchicine'),
(119, NULL, NULL, NULL, 'Colistimethate Sodium'),
(120, NULL, NULL, NULL, 'Coral Calcium 600 mg + Vitamin D 400 IU Tablet'),
(121, NULL, NULL, NULL, 'Dantrolene Sodium'),
(122, NULL, NULL, NULL, 'Dapoxetine Hydrochloride INN'),
(123, NULL, NULL, NULL, 'Deflazacort'),
(124, NULL, NULL, NULL, 'Desloratadine'),
(125, NULL, NULL, NULL, 'Dex-Ibuprofen'),
(126, NULL, NULL, NULL, 'Dexamethasone'),
(127, NULL, NULL, NULL, 'Dexamethasone+Chloramphenicol'),
(128, NULL, NULL, NULL, 'Dexlansoprazole'),
(129, NULL, NULL, NULL, 'Dextran 70 + Hypromellose'),
(130, NULL, NULL, NULL, 'Dextromethorphan'),
(131, NULL, NULL, NULL, 'Dextromethorphan HBr + Phenylephrine HCl + Triprolidine'),
(132, NULL, NULL, NULL, 'Dextrose Anhydrous USP'),
(133, NULL, NULL, NULL, 'Dextrose Anhydrous USP 4.30% w/v & Sodium Chloride BP 0'),
(134, NULL, NULL, NULL, 'Diazepam'),
(135, NULL, NULL, NULL, 'Diclofenac'),
(136, NULL, NULL, NULL, 'Diclofenac Sodium + Misoprostol'),
(137, NULL, NULL, NULL, 'Diclofenac Sodium BP'),
(138, NULL, NULL, NULL, 'Dictofenac Sodium & Lidocain Hydrochloride'),
(139, NULL, NULL, NULL, 'Dicycloverine HCl'),
(140, NULL, NULL, NULL, 'Dienogest 2 mg Tablet'),
(141, NULL, NULL, NULL, 'Diltiazem HCl'),
(142, NULL, NULL, NULL, 'Diosmin + Hesperidine'),
(143, NULL, NULL, NULL, 'Diosmin BP 900 mg & Hesperidin USP 100 mg'),
(144, NULL, NULL, NULL, 'Diphenhydramine HCl'),
(145, NULL, NULL, NULL, 'Diphenhydramine HCl+ Zn Acetate'),
(146, NULL, NULL, NULL, 'Domperidone'),
(147, NULL, NULL, NULL, 'Domperidone'),
(148, NULL, NULL, NULL, 'Doxofylline INN'),
(149, NULL, NULL, NULL, 'Doxycycline HCI'),
(150, NULL, NULL, NULL, 'Doxylamine Succinate + Pyridoxine Hydrochloride'),
(151, NULL, NULL, NULL, 'Drospirenone & Estradiol'),
(152, NULL, NULL, NULL, 'Dry Powder Inhaler (DPI) Device'),
(153, NULL, NULL, NULL, 'Duloxetine'),
(154, NULL, NULL, NULL, 'Ebastine BP'),
(155, NULL, NULL, NULL, 'Econazole Nitrate +Triamcenolone Acetonide'),
(156, NULL, NULL, NULL, 'Eflornithine Hydrochloride 13.9%'),
(157, NULL, NULL, NULL, 'Empagliflozin'),
(158, NULL, NULL, NULL, 'Empagliflozin and Metformin Hydrochloride'),
(159, NULL, NULL, NULL, 'Enoxaparin Sodium'),
(160, NULL, NULL, NULL, 'Entecavir'),
(161, NULL, NULL, NULL, 'Eperisone HCl'),
(162, NULL, NULL, NULL, 'Erythromycin'),
(163, NULL, NULL, NULL, 'Erythromycin'),
(164, NULL, NULL, NULL, 'Erythropoietin BP'),
(165, NULL, NULL, NULL, 'Escitalopram'),
(166, NULL, NULL, NULL, 'Esomeprazole'),
(167, NULL, NULL, NULL, 'Esomeprazole'),
(168, NULL, NULL, NULL, 'Estriol'),
(169, NULL, NULL, NULL, 'Etodolac'),
(170, NULL, NULL, NULL, 'Etoricoxib'),
(171, NULL, NULL, NULL, 'Eucalyptol+Menthol+Methyl Salicylate+Thymol+Sodium Fluo'),
(172, NULL, NULL, NULL, 'Famotidine'),
(173, NULL, NULL, NULL, 'Favipiravir'),
(174, NULL, NULL, NULL, 'Febuxostat'),
(175, NULL, NULL, NULL, 'Fenofibrate'),
(176, NULL, NULL, NULL, 'Fenticonazole Nitrate BP'),
(177, NULL, NULL, NULL, 'Ferric Carboxymaltose'),
(178, NULL, NULL, NULL, 'Fexofenadine HCl'),
(179, NULL, NULL, NULL, 'Filgrastim'),
(180, NULL, NULL, NULL, 'Finsteride'),
(181, NULL, NULL, NULL, 'Flucloxacillin'),
(182, NULL, NULL, NULL, 'Fluconazole'),
(183, NULL, NULL, NULL, 'Flunarizine HCl'),
(184, NULL, NULL, NULL, 'Fluocinolone Acetonide USP 0.1 mg, Tretinoin USP 0.5 mg'),
(185, NULL, NULL, NULL, 'Fluoxetine HCl'),
(186, NULL, NULL, NULL, 'Flupenthixol + Melitracen'),
(187, NULL, NULL, NULL, 'Fluticasone Furoate'),
(188, NULL, NULL, NULL, 'Fluticasone propionate'),
(189, NULL, NULL, NULL, 'Fluticasone propionate'),
(190, NULL, NULL, NULL, 'Folic Acid and Zinc Sulfate Monohydrate'),
(191, NULL, NULL, NULL, 'Fondaparinux Sodium'),
(192, NULL, NULL, NULL, 'Fosfomycin 3 gm'),
(193, NULL, NULL, NULL, 'Furosemide'),
(194, NULL, NULL, NULL, 'Fusidic Acid & Hydrocortisone Acetate'),
(195, NULL, NULL, NULL, 'Gabapentin'),
(196, NULL, NULL, NULL, 'Gemifloxacin'),
(197, NULL, NULL, NULL, 'Gentamicin'),
(198, NULL, NULL, NULL, 'Glibenclamide'),
(199, NULL, NULL, NULL, 'Gliclazide'),
(200, NULL, NULL, NULL, 'Glimepiride'),
(201, NULL, NULL, NULL, 'Glimepiride and Metformin Hydrochloride'),
(202, NULL, NULL, NULL, 'Glucosamine Sulfate & Diacerein'),
(203, NULL, NULL, NULL, 'Glucosamine Sulfate + Chondroitin'),
(204, NULL, NULL, NULL, 'Glycerin BP'),
(205, NULL, NULL, NULL, 'Glycopyrronium + Indacaterol'),
(206, NULL, NULL, NULL, 'Granisetron HCl'),
(207, NULL, NULL, NULL, 'Guaifenesin + Levomenthol + Diphenhydramine HCl'),
(208, NULL, NULL, NULL, 'Halobetasol Propionate'),
(209, NULL, NULL, NULL, 'Haloperidol'),
(210, NULL, NULL, NULL, 'Hartmann’s solution'),
(211, NULL, NULL, NULL, 'Hydrocortisone Acetate'),
(212, NULL, NULL, NULL, 'Hydroxychloroquine Sulfate'),
(213, NULL, NULL, NULL, 'Ibandronic acid'),
(214, NULL, NULL, NULL, 'Imipramine'),
(215, NULL, NULL, NULL, 'Indapamide'),
(216, NULL, NULL, NULL, 'Insulin Glargine'),
(217, NULL, NULL, NULL, 'Insulin Human (rDNA)'),
(218, NULL, NULL, NULL, 'Insulin Human (rDNA)'),
(219, NULL, NULL, NULL, 'Ipratropium Bromide'),
(220, NULL, NULL, NULL, 'Ipratropium Bromide'),
(221, NULL, NULL, NULL, 'Iron (III) Hydroxide Polymaltose Complex, Folic Acid, T'),
(222, NULL, NULL, NULL, 'Iron Polymaltose + Thiamine + Riboflavin + Nicotinamide'),
(223, NULL, NULL, NULL, 'Iron Sucrose'),
(224, NULL, NULL, NULL, 'Itraconazole'),
(225, NULL, NULL, NULL, 'Ivabradine'),
(226, NULL, NULL, NULL, 'Ivermectin BP'),
(227, NULL, NULL, NULL, 'Ivermectin BP 0.5%'),
(228, NULL, NULL, NULL, 'Ketoconazole'),
(229, NULL, NULL, NULL, 'Ketoprofen'),
(230, NULL, NULL, NULL, 'Ketorolac Tromethamine'),
(231, NULL, NULL, NULL, 'Ketotifen Fumarate'),
(232, NULL, NULL, NULL, 'Ketotifen Fumarate'),
(233, NULL, NULL, NULL, 'L-Ornithine L-Aspartate 150 mg'),
(234, NULL, NULL, NULL, 'Lactulose'),
(235, NULL, NULL, NULL, 'Lamivudine'),
(236, NULL, NULL, NULL, 'Lamotrigine'),
(237, NULL, NULL, NULL, 'Lansoprazole'),
(238, NULL, NULL, NULL, 'Lansoprazole + Clarithromycin + Amoxicillin'),
(239, NULL, NULL, NULL, 'Letrozole'),
(240, NULL, NULL, NULL, 'Leucovorin (Folinic Acid)'),
(241, NULL, NULL, NULL, 'Levetiracetam'),
(242, NULL, NULL, NULL, 'Levocarnitine'),
(243, NULL, NULL, NULL, 'Levocetirizine'),
(244, NULL, NULL, NULL, 'Levodopa + Carbidopa'),
(245, NULL, NULL, NULL, 'Levofloxacin'),
(246, NULL, NULL, NULL, 'Levofloxacin 0.5% w/v IV Infusion'),
(247, NULL, NULL, NULL, 'Levonorgestrel'),
(248, NULL, NULL, NULL, 'Levosalbutamol'),
(249, NULL, NULL, NULL, 'Levothyroxine Sodium'),
(250, NULL, NULL, NULL, 'Light liquid paraffin & White soft paraffin'),
(251, NULL, NULL, NULL, 'Linagliptin'),
(252, NULL, NULL, NULL, 'Linagliptin and Metformin Hydrochloride'),
(253, NULL, NULL, NULL, 'Linezolid USP'),
(254, NULL, NULL, NULL, 'Lomefloxacin'),
(255, NULL, NULL, NULL, 'Lomefloxacin'),
(256, NULL, NULL, NULL, 'Loperamide HCl'),
(257, NULL, NULL, NULL, 'Loratadine'),
(258, NULL, NULL, NULL, 'Losartan Potassium'),
(259, NULL, NULL, NULL, 'Losartan Potassium + Hydrochlorthiazide'),
(260, NULL, NULL, NULL, 'Lubiprostone 8 mcg'),
(261, NULL, NULL, NULL, 'Lurasidone'),
(262, NULL, NULL, NULL, 'Macrogol & Electrolytes'),
(263, NULL, NULL, NULL, 'Magaldrate+Simethicone'),
(264, NULL, NULL, NULL, 'Magnesium Hydroxide & Liquid Paraffin'),
(265, NULL, NULL, NULL, 'Mebeverine Hydrochloride BP'),
(266, NULL, NULL, NULL, 'Meclizine HCl + Pyridoxine HCl'),
(267, NULL, NULL, NULL, 'Mecobalamin'),
(268, NULL, NULL, NULL, 'Melatonin'),
(269, NULL, NULL, NULL, 'Meloxicam'),
(270, NULL, NULL, NULL, 'Menthol + Thymol + Eucalyptol + Methyl Salicylate'),
(271, NULL, NULL, NULL, 'Meropenem'),
(272, NULL, NULL, NULL, 'Mesalamine USP 800 mg'),
(273, NULL, NULL, NULL, 'Metformin HCl'),
(274, NULL, NULL, NULL, 'Methyl Salicylate + Menthol'),
(275, NULL, NULL, NULL, 'Methylprednisolone'),
(276, NULL, NULL, NULL, 'Metronidazole'),
(277, NULL, NULL, NULL, 'Metronidazole 0.5% w/v IV Infusion'),
(278, NULL, NULL, NULL, 'Metronidazole+ Neomycin Sulphate+ Polymyxin B Sulphate'),
(279, NULL, NULL, NULL, 'Miconazole'),
(280, NULL, NULL, NULL, 'Miconazole Nitrate'),
(281, NULL, NULL, NULL, 'Miconazole nitrate+ Hydrocortisone'),
(282, NULL, NULL, NULL, 'Midazolam'),
(283, NULL, NULL, NULL, 'Mifepristone & Misoprostol'),
(284, NULL, NULL, NULL, 'Minoxidil BP'),
(285, NULL, NULL, NULL, 'Mirtazapine'),
(286, NULL, NULL, NULL, 'Misoprostol'),
(287, NULL, NULL, NULL, 'Mometasone Furoate'),
(288, NULL, NULL, NULL, 'Monobasic Sodium Phospate and Dibasic Sodium Phosphate'),
(289, NULL, NULL, NULL, 'Montelukast'),
(290, NULL, NULL, NULL, 'Moxifloxacin'),
(291, NULL, NULL, NULL, 'Moxifloxacin 0.16% w/v IV Infusion'),
(292, NULL, NULL, NULL, 'Moxifloxacin 0.5% & Dexamethasone Phosphate 0.1%'),
(293, NULL, NULL, NULL, 'Moxifloxacin USP'),
(294, NULL, NULL, NULL, 'Find More'),
(295, NULL, NULL, NULL, 'Multivitamin & Multimineral'),
(296, NULL, NULL, NULL, 'Multivitamin with Cod Liver Oil'),
(297, NULL, NULL, NULL, 'Multivitamin with L-Lysine'),
(298, NULL, NULL, NULL, 'Mupirocin'),
(299, NULL, NULL, NULL, 'Naproxen'),
(300, NULL, NULL, NULL, 'Naproxen+Esomeprazole'),
(301, NULL, NULL, NULL, 'Nebivolol Hydrochloride'),
(302, NULL, NULL, NULL, 'Nebivolol+Hydrochlorothiazide (β -blocker & Combinatio'),
(303, NULL, NULL, NULL, 'Nelfinavir'),
(304, NULL, NULL, NULL, 'Neomycin Sulphate + Bacitracin Zinc'),
(305, NULL, NULL, NULL, 'Neomycin Sulphate, Bacitracin Zinc & Polymyxin B Sulpha'),
(306, NULL, NULL, NULL, 'Nifedipine'),
(307, NULL, NULL, NULL, 'Nimodipine'),
(308, NULL, NULL, NULL, 'Nitazoxanide'),
(309, NULL, NULL, NULL, 'Nitrofurantoin USP'),
(310, NULL, NULL, NULL, 'Nitroglycerin'),
(311, NULL, NULL, NULL, 'Norepinephrine 2 mg/ 2 ml'),
(312, NULL, NULL, NULL, 'Norethisterone'),
(313, NULL, NULL, NULL, 'Nystatin'),
(314, NULL, NULL, NULL, 'Obeticholic Acid 5 mg'),
(315, NULL, NULL, NULL, 'Ofloxacin'),
(316, NULL, NULL, NULL, 'Olanzapine'),
(317, NULL, NULL, NULL, 'Olmesartan Medoxomil'),
(318, NULL, NULL, NULL, 'Olmesartan Medoxomil+Hydrochlorothiazide'),
(319, NULL, NULL, NULL, 'Olopatadine HCl'),
(320, NULL, NULL, NULL, 'Omeprazole'),
(321, NULL, NULL, NULL, 'Ondansetron HCl'),
(322, NULL, NULL, NULL, 'Orlistat'),
(323, NULL, NULL, NULL, 'Ornidazole'),
(324, NULL, NULL, NULL, 'Oxiconazole'),
(325, NULL, NULL, NULL, 'Oxymetazoline'),
(326, NULL, NULL, NULL, 'Palonosetron'),
(327, NULL, NULL, NULL, 'Pancreatin BP'),
(328, NULL, NULL, NULL, 'Pantoprazole'),
(329, NULL, NULL, NULL, 'Paracetamol & Caffeine'),
(330, NULL, NULL, NULL, 'Paracetamol+Tramadol'),
(331, NULL, NULL, NULL, 'Paroxetine HCl'),
(332, NULL, NULL, NULL, 'Pentoxifylline'),
(333, NULL, NULL, NULL, 'Permethrin'),
(334, NULL, NULL, NULL, 'Phenoxymethyl Penicillin'),
(335, NULL, NULL, NULL, 'Phytomenadione'),
(336, NULL, NULL, NULL, 'Piperacillin and Tazobactam'),
(337, NULL, NULL, NULL, 'Piracetam'),
(338, NULL, NULL, NULL, 'Pivmecillinam'),
(339, NULL, NULL, NULL, 'Pizotifen Malate'),
(340, NULL, NULL, NULL, 'Potassium Citrate & Citric Acid Monohydrate'),
(341, NULL, NULL, NULL, 'Povidone Iodine'),
(342, NULL, NULL, NULL, 'Prazosin'),
(343, NULL, NULL, NULL, 'Prednisolone'),
(344, NULL, NULL, NULL, 'Pregabalin'),
(345, NULL, NULL, NULL, 'Prochlorperazine Mesilate'),
(346, NULL, NULL, NULL, 'Procyclidine HCl'),
(347, NULL, NULL, NULL, 'Prucalopride 1 mg & 2 mg'),
(348, NULL, NULL, NULL, 'Rabeprazole Sodium INN'),
(349, NULL, NULL, NULL, 'Rabeprazole, Amoxicillin & Clarithromycin'),
(350, NULL, NULL, NULL, 'Racecadotril BP'),
(351, NULL, NULL, NULL, 'Ramipril'),
(352, NULL, NULL, NULL, 'Ranolazine'),
(353, NULL, NULL, NULL, 'Rasagiline'),
(354, NULL, NULL, NULL, 'Raubasine + Almitrine Bismesylate'),
(355, NULL, NULL, NULL, 'Remdesivir'),
(356, NULL, NULL, NULL, 'Retapamulin'),
(357, NULL, NULL, NULL, 'Reusable Insulin Pen'),
(358, NULL, NULL, NULL, 'Reusable Insulin Pen'),
(359, NULL, NULL, NULL, 'Rice based oral rehydration salt'),
(360, NULL, NULL, NULL, 'Rifaximin'),
(361, NULL, NULL, NULL, 'Risedronate Sodium'),
(362, NULL, NULL, NULL, 'Risedronate Sodium & Calcium'),
(363, NULL, NULL, NULL, 'Rivaroxaban'),
(364, NULL, NULL, NULL, 'Ropinirole'),
(365, NULL, NULL, NULL, 'Rosuvastatin'),
(366, NULL, NULL, NULL, 'Rupatadine 10 mg'),
(367, NULL, NULL, NULL, 'Sacubitril & Valsartan'),
(368, NULL, NULL, NULL, 'Salbutamol + Ipratropium Bromide'),
(369, NULL, NULL, NULL, 'Salbutamol + Ipratropium Bromide'),
(370, NULL, NULL, NULL, 'Salbutamol Sulphate'),
(371, NULL, NULL, NULL, 'Salbutamol Sulphate'),
(372, NULL, NULL, NULL, 'Salicylic Acid BP 12%'),
(373, NULL, NULL, NULL, 'Salmeterol & Fluticasone Propionate BP'),
(374, NULL, NULL, NULL, 'Salmeterol + Fluticasone'),
(375, NULL, NULL, NULL, 'Secnidazole'),
(376, NULL, NULL, NULL, 'Sildenafil Citrate INN'),
(377, NULL, NULL, NULL, 'Silodosin INN 8 mg'),
(378, NULL, NULL, NULL, 'Silver Sulfadiazine'),
(379, NULL, NULL, NULL, 'Simethicone'),
(380, NULL, NULL, NULL, 'Sitagliptin'),
(381, NULL, NULL, NULL, 'Sitagliptin + Metformin Hydrochloride'),
(382, NULL, NULL, NULL, 'Sodium Alendronate +Vit D3'),
(383, NULL, NULL, NULL, 'Sodium Alginate + Potassium Bicarbonate'),
(384, NULL, NULL, NULL, 'Sodium Chloride'),
(385, NULL, NULL, NULL, 'Sodium Chloride 0.5% w/v, Potassium Chloride 0.1% w/v a'),
(386, NULL, NULL, NULL, 'Sodium Chloride BP 0.225% w/v and Dextrose Anhydrous US'),
(387, NULL, NULL, NULL, 'Sodium Chloride BP 0.45% w/v and Dextrose Anhydrous USP'),
(388, NULL, NULL, NULL, 'Sodium Chloride BP 0.9% w/v'),
(389, NULL, NULL, NULL, 'Sodium Chloride BP 0.9% w/v and Dextrose USP 5% w/v'),
(390, NULL, NULL, NULL, 'Sodium Cromoglicate + Xylometazoline HCl'),
(391, NULL, NULL, NULL, 'Sodium Polystyrene Sulfonate USP'),
(392, NULL, NULL, NULL, 'Sodium valproate+ Valproic acid'),
(393, NULL, NULL, NULL, 'Sofosbuvir'),
(394, NULL, NULL, NULL, 'Solifenacin Succinate'),
(395, NULL, NULL, NULL, 'Solution of 5% Composite Amino Acid with Electrolytes'),
(396, NULL, NULL, NULL, 'Sparfloxacin'),
(397, NULL, NULL, NULL, 'Spironolactone + Furosemide'),
(398, NULL, NULL, NULL, 'Sucralfate 1 gm/5 ml Suspension'),
(399, NULL, NULL, NULL, 'Sulphamethoxazole+Trimethoprim'),
(400, NULL, NULL, NULL, 'Suvorexant'),
(401, NULL, NULL, NULL, 'Tacrolimus'),
(402, NULL, NULL, NULL, 'Tadalafil'),
(403, NULL, NULL, NULL, 'Tamsulosin HCl'),
(404, NULL, NULL, NULL, 'Tamsulosin Hydrochloride 0.4 mg & Dutasteride 0.5 mg'),
(405, NULL, NULL, NULL, 'Tenofovir Alafenamide'),
(406, NULL, NULL, NULL, 'Tenofovir Disoproxil Fumarate'),
(407, NULL, NULL, NULL, 'Tenoxicam'),
(408, NULL, NULL, NULL, 'Terbinafine HCL'),
(409, NULL, NULL, NULL, 'Tetracycline HCl'),
(410, NULL, NULL, NULL, 'Theophylline'),
(411, NULL, NULL, NULL, 'Thiopental Sodium'),
(412, NULL, NULL, NULL, 'TiboloneSteroid Hormone'),
(413, NULL, NULL, NULL, 'Find More'),
(414, NULL, NULL, NULL, 'Ticagrelor'),
(415, NULL, NULL, NULL, 'Tiemonium Methylsulfate'),
(416, NULL, NULL, NULL, 'Tofacitinib'),
(417, NULL, NULL, NULL, 'Tolfenamic Acid'),
(418, NULL, NULL, NULL, 'Tolterodine Tartrate'),
(419, NULL, NULL, NULL, 'Torsemide'),
(420, NULL, NULL, NULL, 'Tramadol HCl'),
(421, NULL, NULL, NULL, 'Tranexamic acid'),
(422, NULL, NULL, NULL, 'Travoprost 0.004%'),
(423, NULL, NULL, NULL, 'Triamcenolone Acetonide'),
(424, NULL, NULL, NULL, 'Trihexyphenidyl Hydrochloride USP'),
(425, NULL, NULL, NULL, 'Trimebutine Maleate'),
(426, NULL, NULL, NULL, 'Trimetazidine HCl'),
(427, NULL, NULL, NULL, 'Ulipristal Acetate INN 5 mg'),
(428, NULL, NULL, NULL, 'Urea'),
(429, NULL, NULL, NULL, 'Ursodeoxycholic Acid BP'),
(430, NULL, NULL, NULL, 'Valaciclovir'),
(431, NULL, NULL, NULL, 'Vildagliptin'),
(432, NULL, NULL, NULL, 'Vildagliptin+Metformin'),
(433, NULL, NULL, NULL, 'Vinpocetine'),
(434, NULL, NULL, NULL, 'Vitamin B Complex'),
(435, NULL, NULL, NULL, 'Vitamin B Complex and Zinc'),
(436, NULL, NULL, NULL, 'Vitamin B1 +Vitamin B6 +Vitamin B12'),
(437, NULL, NULL, NULL, 'Vitamin C+Vitamin E+ Zinc+Copper+Lutein'),
(438, NULL, NULL, NULL, 'Vitamin E as alpha-Tocopheryl Acetate'),
(439, NULL, NULL, NULL, 'Vitamin-C'),
(440, NULL, NULL, NULL, 'Voriconazole'),
(441, NULL, NULL, NULL, 'Xylometazoline HCl'),
(442, NULL, NULL, NULL, 'Zinc Oxide'),
(443, NULL, NULL, NULL, 'Zinc Oxide USP 10%, Avobenzone USP 1%, Octinoxate USP 7'),
(444, NULL, NULL, NULL, 'Zinc Sulfate Monohydrate'),
(445, NULL, NULL, NULL, 'Zinc Sulfate+Folic Acid+Carbonyl Iron'),
(446, NULL, NULL, NULL, 'Zinc Sulphate'),
(447, NULL, NULL, NULL, 'Zinc Sulphate Monohydrate + Ferrous Sulphate + Folic Ac'),
(448, NULL, NULL, NULL, 'Zinc sulphate Monohydrate +Carbonyl Iron+Folicacid+ Thi'),
(449, NULL, NULL, NULL, 'Zoledronic Acid 5 mg solution for infusion'),
(450, NULL, NULL, NULL, 'Zolmitriptan');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_schedule`
--

CREATE TABLE `medicine_schedule` (
  `id` bigint(20) NOT NULL,
  `schedule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_schedule`
--

INSERT INTO `medicine_schedule` (`id`, `schedule`) VALUES
(1, 'After Meal'),
(2, 'Before Meal');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_strength`
--

CREATE TABLE `medicine_strength` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_strength`
--

INSERT INTO `medicine_strength` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, '2021-02-15 16:59:49.000000', NULL, NULL, '100 gm'),
(2, '2021-02-15 16:59:49.000000', NULL, NULL, '250 gm'),
(3, '2021-02-15 16:59:49.000000', NULL, NULL, '500 gm');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_type`
--

CREATE TABLE `medicine_type` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_type`
--

INSERT INTO `medicine_type` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, NULL, NULL, NULL, 'Syrup'),
(2, NULL, NULL, NULL, 'Tablet'),
(3, NULL, NULL, NULL, 'Capsule'),
(4, NULL, NULL, NULL, 'Topical medicine'),
(5, NULL, NULL, NULL, 'Suppositor'),
(6, NULL, NULL, NULL, 'Drop'),
(7, NULL, NULL, NULL, 'Inhaler'),
(8, NULL, NULL, NULL, 'Injection'),
(9, NULL, NULL, NULL, 'Gel'),
(10, NULL, NULL, NULL, 'Suspension'),
(11, NULL, NULL, NULL, 'Effervescent Tablet'),
(12, NULL, NULL, NULL, 'IV Injection'),
(13, NULL, NULL, NULL, 'Injection(Pre-filled Syringe)'),
(14, NULL, NULL, NULL, 'Sublingual Spray'),
(15, NULL, NULL, NULL, 'Tablet(Chewable)'),
(16, NULL, NULL, NULL, 'Infusion'),
(17, NULL, NULL, NULL, 'Powder for Suspension'),
(18, NULL, NULL, NULL, 'Intramuscular'),
(19, NULL, NULL, NULL, 'Intravenous'),
(20, NULL, NULL, NULL, 'Dry Syrup'),
(21, NULL, NULL, NULL, 'IM Injection'),
(22, NULL, NULL, NULL, 'Cream'),
(23, NULL, NULL, NULL, 'Ointment'),
(24, NULL, NULL, NULL, 'Cream & Ointment'),
(25, NULL, NULL, NULL, 'Eye Drop'),
(26, NULL, NULL, NULL, 'Ped. Drop'),
(27, NULL, NULL, NULL, 'MDI(Manual Daily Injection)'),
(28, NULL, NULL, NULL, 'DPI(Dry Powder Inhaler)'),
(29, NULL, NULL, NULL, 'Oral Solution');

-- --------------------------------------------------------

--
-- Table structure for table `off_day`
--

CREATE TABLE `off_day` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) NOT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `off_day_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `off_day`
--

INSERT INTO `off_day` (`id`, `created_at`, `updated_at`, `deleted_at`, `created_by_id`, `doctor_profile_id`, `modified_by_id`, `off_day_id`) VALUES
(1, '2023-11-09 16:10:38.224787', NULL, NULL, NULL, 1, NULL, 7),
(2, '2023-11-09 16:10:38.253919', NULL, NULL, NULL, 1, NULL, 1),
(3, '2023-11-09 16:11:59.519716', NULL, NULL, NULL, 3, NULL, 1),
(4, '2023-11-09 16:12:39.038594', NULL, NULL, NULL, 2, NULL, 7),
(5, '2023-11-09 16:16:02.573757', NULL, NULL, NULL, 4, NULL, 6),
(6, '2023-11-09 16:16:58.818775', NULL, NULL, NULL, 5, NULL, 7),
(7, '2023-11-09 16:17:38.337476', NULL, NULL, NULL, 6, NULL, 3),
(8, '2023-11-09 16:21:14.900700', NULL, NULL, NULL, 10, NULL, 6),
(9, '2023-11-09 16:21:51.838103', NULL, NULL, NULL, 7, NULL, 4),
(10, '2023-11-09 16:22:21.449484', NULL, NULL, NULL, 8, NULL, 6),
(11, '2023-11-09 16:23:30.726368', NULL, NULL, NULL, 9, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `organ`
--

CREATE TABLE `organ` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `body_part_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ`
--

INSERT INTO `organ` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `description`, `body_part_id`) VALUES
(1, '2023-08-16 16:39:35.767875', NULL, NULL, 'Brain (মস্তিষ্ক)', 'The central control center of the nervous system, responsible for processing. (স্নায়ু তন্ত্রের কেন্দ্রীয় নিয়ন্ত্রণ কেন্দ্র, তথ্য প্রক্রিয়া করা, শারীরিক কাজ নিয়ন্ত্রণ এবং ভাবনা এবং আবেগ উৎপন্ন করা জন্য দায়িত্বপ্রাপ্ত।)', 1),
(2, '2023-08-16 16:39:35.775348', NULL, NULL, 'Eyes (চোখ:)', 'Sensory organs that detect light and allow us to see and perceive our environment. (প্রকাশ চিহ্নিত করে এবং আমাদেরকে দেখতে এবং আমাদের পরিবেশ অনুভব করতে সাহায্য করে যেমন দৃষ্টি এবং পর্যবেক্ষণ।)', 1),
(3, '2023-08-16 16:39:35.782385', NULL, NULL, 'Ears (কান)', 'Sensory organs that enable hearing and help maintain balance. (শ্রবণ সহায়ক অঙ্গ, যা শ্রবণ সক্ষমতা সৃষ্টি করে এবং সমর্থন করে মধ্যবর্তী সমতল।)', 1),
(4, '2023-08-16 16:39:35.797873', NULL, NULL, 'Nose (নাক)', 'An organ of smell and also plays a role in filtering and humidifying the air we breathe. (গন্ধের একটি অঙ্গ এবং আমাদের শ্বাসকশগুলি শোধন এবং আমরা শ্বাস সাহায্য করে এটি একটি ভূমি বায়ুকে ফিল্টার এবং উষ্ণতা পরিস্থিতি পরিপন্থিত করে।)', 1),
(5, '2023-08-16 16:39:35.813459', NULL, NULL, 'Mouth  (মুখ)', 'Used for eating, speaking, and breathing. Contains structures like the tongue and teeth. (খাবার গ্রাহণ, কথা বলা এবং শ্বাস নেওয়ার জন্য ব্যবহৃত হয়। জিভ এবং দাঁতের মতো অঙ্গগুলি এখানে অন্তর্ভুক্ত রয়েছে।)', 1),
(6, '2023-08-16 16:41:15.634343', NULL, NULL, 'Throat structures (গলা প্রতিরক্ষা)', 'Include the pharynx and larynx, which are involved in swallowing, speaking, and breathing. (গ্যারগল এবং ল্যারিংক্স অন্তর্ভুক্ত, যা নেত্রমোক্ষণ, বলা এবং শ্বাসকে নিয়ন্ত্রণ করে।\r\nশরীরের উপাংশ:)', 2),
(7, '2023-08-16 16:42:38.982906', NULL, NULL, 'Heart (হৃদয়)', ' A muscular organ that pumps blood throughout the body, supplying oxygen and nutrients to cells. (শরীরের সারস্বত্বিক অঙ্গ, যা রক্ত পূর্বাধ এবং নিঃশ্বাসিত রক্ত পাঠানোর জন্য ব্যবহৃত হয়, পূর্বাধবৃদ্ধি এবং পুষ্টি সংক্রিয়া করে।)', 3),
(8, '2023-08-16 16:42:38.990509', NULL, NULL, 'Lungs (ফুসফুস)', 'Respiratory organs responsible for exchanging oxygen and carbon dioxide with the blood. (রক্ত দ্বারা অক্সিজেন এবং কার্বন ডাইঅক্সাইড পরিবর্তনের জন্য জিবনবৃত্তি সঞ্চালন করে।)', 3),
(9, '2023-08-16 16:49:00.823126', NULL, NULL, 'Shoulder joint (কাঁধ জয়েন্ট)', 'Allows a wide range of arm movements. (পয়েন্ট হয় এবং আয়ত্তকার বাহু চলাচল সাহায্য করে।)', 4),
(10, '2023-08-16 16:49:00.829623', NULL, NULL, 'Upper arm muscles ( উপরের বাহুর পেশী)', 'Responsible for arm movement and stability. (বাহু চলাচল এবং স্থিতির জন্য দায়িত্বপ্রাপ্ত।)', 4),
(11, '2023-08-16 16:49:00.843031', NULL, NULL, 'Forearm muscles ( হাতের পেশী)', 'Control hand and finger movements. (হাত এবং আঙ্গুল চলাচল নিয়ন্ত্রণ করে।)', 4),
(12, '2023-08-16 16:49:00.848632', NULL, NULL, 'Wrist joint (কব্জি জয়েন্ট)', 'Enables wrist movement. (কব্জি নড়াচড়া সক্ষম করে।)', 4),
(13, '2023-08-16 16:49:00.854171', NULL, NULL, 'Hand bones and muscles (হাতের হাড় এবং পেশী)', 'Allow intricate hand movements and dexterity. (জটিল হাত চলাচল এবং দক্ষতা সক্ষম হতে সাহায্য করে।)', 4),
(14, '2023-08-16 17:20:48.003273', NULL, NULL, 'Hip joint (ঊরুসন্ধি)', 'Supports the upper body and allows leg movement. (শরীরের উপরের অংশকে সমর্থন করে এবং পায়ের নড়াচড়ার অনুমতি দেয়।)', 5),
(15, '2023-08-16 17:20:48.009783', NULL, NULL, 'Thigh muscles (উরুর পেশী)', 'Power leg movements, including walking and running. (হাঁটা এবং দৌড় সহ পাওয়ার পায়ের নড়াচড়া।)', 5),
(16, '2023-08-16 17:20:48.019845', NULL, NULL, 'Lower leg muscles (নীচের পায়ের পেশী)', 'Control movements of the foot and ankle. (পা এবং গোড়ালির গতিবিধি নিয়ন্ত্রণ করুন।)', 5),
(17, '2023-08-16 17:20:48.025952', NULL, NULL, 'Ankle joint (গোড়ালি জয়েন্ট)', 'Enables foot movement. (পা নড়াচড়া সক্ষম করে।)', 5),
(18, '2023-08-16 17:20:48.031306', NULL, NULL, 'Foot bones and muscles (পায়ের হাড় এবং পেশী)', 'Provide support and enable standing, walking, and running. (সমর্থন প্রদান করুন এবং দাঁড়ানো, হাঁটা এবং দৌড়ানো সক্ষম করুন।)', 5),
(19, '2023-08-16 18:38:24.460260', NULL, NULL, 'Heart (হৃদয়)', 'Pumps oxygenated blood to the body and deoxygenated blood to the lungs. (শরীরে অক্সিজেনযুক্ত রক্ত ​​এবং ফুসফুসে অক্সিজেনযুক্ত রক্ত ​​পাম্প করে।)', 6),
(20, '2023-08-16 18:38:24.467784', NULL, NULL, 'Lungs  (শ্বাসযন্ত্র)', 'Exchange oxygen and carbon dioxide during breathing. (শ্বাসের সময় অক্সিজেন এবং কার্বন ডাই অক্সাইড বিনিময় করুন।)', 6),
(21, '2023-08-16 18:40:11.699053', NULL, NULL, 'Stomach (পেট)', 'Digests food and breaks it down into nutrients. (খাবার হজম করে এবং পুষ্টিতে ভেঙ্গে দেয়।)', 7),
(22, '2023-08-16 18:40:11.705056', NULL, NULL, 'Liver (লিভার)', 'Performs various metabolic functions, including detoxification and nutrient processing. (ডিটক্সিফিকেশন এবং পুষ্টি প্রক্রিয়াকরণ সহ বিভিন্ন বিপাকীয় কার্য সম্পাদন করে।)', 7),
(23, '2023-08-16 18:41:46.340305', NULL, NULL, 'Intestines (small and large) (অন্ত্র (ছোট এবং বড়)', 'Absorb nutrients and water from digested food. (হজম হওয়া খাবার থেকে পুষ্টি এবং জল শোষণ করে।)', 7),
(24, '2023-08-16 18:41:46.346815', NULL, NULL, 'Kidneys (কিডনি)', 'Filter blood, remove waste products, and regulate fluid balance. (রক্ত ​​ফিল্টার করুন, বর্জ্য পণ্য অপসারণ করুন এবং তরল ভারসাম্য নিয়ন্ত্রণ করুন।)', 7),
(25, '2023-08-16 18:43:22.281975', NULL, NULL, 'Reproductive organs (প্রজনন অঙ্গ)', 'Vary by sex and include structures such as the ovaries and uterus in females and the testes and prostate in males. (লিঙ্গ অনুসারে পরিবর্তিত হয় এবং নারীদের ডিম্বাশয় এবং জরায়ু এবং পুরুষদের মধ্যে টেস্টিস এবং প্রোস্টেটের মতো গঠন অন্তর্ভুক্ত করে।)', 8),
(26, '2023-08-16 18:43:22.288015', NULL, NULL, 'Bladder (মূত্রাশয়)', 'Stores urine before elimination. (নির্মূলের আগে প্রস্রাব সঞ্চয় করে।)', 8),
(27, '2023-08-16 18:44:35.104805', NULL, NULL, 'Spinal cord (স্পাইনাল কর্ড)', 'Transmits signals between the brain and the rest of the body, controlling movement and sensation. (মস্তিষ্ক এবং শরীরের বাকি অংশের মধ্যে সংকেত প্রেরণ করে, চলাচল এবং সংবেদন নিয়ন্ত্রণ করে।)', 9),
(28, '2023-08-16 18:44:35.112309', NULL, NULL, 'Muscles supporting the spine (মেরুদণ্ডকে সমর্থনকারী পেশী)', 'Stabilize and allow movement of the spine. (স্পাইন নিরাপত্তা এবং চলাচল নিয়ন্ত্রণ করতে স্পাইন সমর্থন করে।)', 9),
(29, '2023-08-16 18:49:15.632387', NULL, NULL, 'Skeletal Muscles (কঙ্কালের পেশী)', 'Muscles attached to bones that allow voluntary movement, such as biceps, quadriceps, and hamstrings. (হাড়ের সাথে সংযুক্ত পেশী যা স্বেচ্ছায় চলাচলের অনুমতি দেয়, যেমন বাইসেপ, কোয়াড্রিসেপ এবং হ্যামস্ট্রিং।)', 10),
(30, '2023-08-16 18:49:15.638881', NULL, NULL, 'Smooth Muscles (মসৃণ পেশী)', 'Found in organs like the digestive tract and blood vessels, they control involuntary movements. (পরিপাকতন্ত্র এবং রক্তনালীগুলির মতো অঙ্গগুলিতে পাওয়া যায়, তারা অনিচ্ছাকৃত আন্দোলন নিয়ন্ত্রণ করে।)', 10),
(31, '2023-08-16 18:49:15.652053', NULL, NULL, 'Cardiac Muscle (কার্ডিয়াক পেশী)', 'The muscle of the heart that contracts to pump blood. (হৃৎপিণ্ডের পেশী যা রক্ত ​​পাম্প করতে সংকোচন করে।)', 10),
(32, '2023-08-16 18:50:41.473372', NULL, NULL, 'Axial Skeleton (অক্ষীয় কঙ্কাল)', 'The central part of the skeleton, including the skull, vertebral column (spine), and rib cage. (কঙ্কালের কেন্দ্রীয় অংশ, মাথার খুলি, কশেরুকা কলাম (মেরুদন্ড) এবং পাঁজরের খাঁচা সহ।)', 11),
(33, '2023-08-16 18:50:41.480650', NULL, NULL, 'Appendicular Skeleton (অ্যাপেন্ডিকুলার কঙ্কাল)', 'The bones of the limbs and girdles (shoulder and pelvic), which facilitate movement. (অঙ্গ এবং কোমরের হাড় (কাঁধ এবং শ্রোণী), যা নড়াচড়ার সুবিধা দেয়।)', 11),
(34, '2023-08-16 18:51:55.261312', NULL, NULL, 'Joints (জয়েন্টগুলি)', 'Points where bones meet, enabling movement. Examples include ball-and-socket joints, hinge joints, and pivot joints. (বিন্দু যেখানে হাড় মিলিত হয়, আন্দোলন সক্ষম করে। উদাহরণের মধ্যে রয়েছে বল-এবং-সকেট জয়েন্ট, কব্জা জয়েন্ট এবং পিভট জয়েন্ট।)', 11),
(35, '2023-08-16 18:51:55.268335', NULL, NULL, 'Bone Marrow (অস্থিমজ্জা)', 'Soft tissue within bones that produces blood cells (red marrow) and stores fat (yellow marrow). (হাড়ের মধ্যে নরম টিস্যু যা রক্ত ​​​​কোষ (লাল মজ্জা) তৈরি করে এবং চর্বি (হলুদ মজ্জা) সঞ্চয় করে।)', 11),
(36, '2023-08-16 18:54:13.561291', NULL, NULL, 'Epidermis (এপিডার্মিস)', 'The outer layer of the skin, consisting of multiple layers of cells that provide a barrier against pathogens and UV radiation. (ত্বকের বাইরের স্তর, কোষের একাধিক স্তর নিয়ে গঠিত যা প্যাথোজেন এবং ইউভি বিকিরণের বিরুদ্ধে বাধা প্রদান করে।)', 12),
(37, '2023-08-16 18:54:13.566648', NULL, NULL, 'Dermis (ডার্মিস)', 'The layer beneath the epidermis that contains blood vessels, nerves, sweat glands, hair follicles, and connective tissue. (এপিডার্মিসের নীচের স্তর যা রক্তনালী, স্নায়ু, ঘাম গ্রন্থি, চুলের ফলিকল এবং সংযোগকারী টিস্যু ধারণ করে।)', 12),
(38, '2023-08-16 18:54:13.572578', NULL, NULL, 'Subcutaneous Tissue (Hypodermis) (সাবকুটেনিয়াস টিস্যু (হাইপোডার্মিস))', 'The layer beneath the dermis that contains fat cells and helps insulate the body. (ডার্মিসের নীচের স্তর যাতে চর্বি কোষ থাকে এবং শরীরকে নিরোধক করতে সাহায্য করে।)', 12);

-- --------------------------------------------------------

--
-- Table structure for table `organ_problem_speci`
--

CREATE TABLE `organ_problem_speci` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `problem` varchar(255) NOT NULL,
  `problem_specification` varchar(1000) NOT NULL,
  `organ_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ_problem_speci`
--

INSERT INTO `organ_problem_speci` (`id`, `created_at`, `updated_at`, `deleted_at`, `problem`, `problem_specification`, `organ_id`) VALUES
(1, '2023-11-09 15:51:24.223814', NULL, NULL, '  Brain Tumor, Stroke, Epilepsy (মস্তিষ্কের টিউমার, স্ট্রোক, মৃগীরোগ)', 'Abnormal cell growth in the brain, disruption of blood supply leading to cell damage, neurological disorder causing seizures. (মস্তিষ্কে অস্বাভাবিক কোষের বৃদ্ধি, রক্ত সরবরাহ ব্যাহত হওয়ার ফলে কোষের ক্ষতি হয়, স্নায়বিক ব্যাধি খিঁচুনি সৃষ্টি করে।)', 1),
(2, '2023-11-09 15:52:20.439895', NULL, NULL, ' Cataracts, Glaucoma, Conjunctivitis ( ছানি, গ্লুকোমা, কনজেক্টিভাইটিস)', 'Clouding of the eye\'s lens, increased intraocular pressure, inflammation of the conjunctiva. (চোখের লেন্সের মেঘ, ইন্ট্রাওকুলার চাপ বৃদ্ধি, কনজেক্টিভার প্রদাহ।)', 2),
(3, '2023-11-09 15:53:12.062282', NULL, NULL, 'Hearing Loss, Tinnitus, Ear Infections (শ্রবণশক্তি হ্রাস, টিনিটাস, কানের সংক্রমণ)', ' Impairment of auditory function, ringing in the ears, inflammation or infection of the ear. ( শ্রবণ ফাংশনের দুর্বলতা, কানে বাজানো, কানের প্রদাহ বা সংক্রমণ।)', 3),
(4, '2023-11-09 15:54:06.646672', NULL, NULL, 'Sinusitis, Allergic Rhinitis, Deviated Septum (সাইনোসাইটিস, অ্যালার্জিক রাইনাইটিস, বিচ্যুত সেপ্টাম)', 'Inflammation of the sinuses, allergic reaction affecting the nasal passages, displacement of the nasal septum. (সাইনাসের প্রদাহ, অনুনাসিক প্যাসেজগুলিকে প্রভাবিত করে অ্যালার্জির প্রতিক্রিয়া, অনুনাসিক সেপ্টামের স্থানচ্যুতি।)', 4),
(5, '2023-11-09 15:55:01.306669', NULL, NULL, 'Tooth Decay, Gum Disease, Oral Cancer (দাঁত ক্ষয়, মাড়ির রোগ, মুখের ক্যান্সার)', ' Deterioration of tooth structure, inflammation of the gums, cancer affecting the oral cavity. ( দাঁতের গঠনের অবনতি, মাড়ির প্রদাহ, মুখের গহ্বরকে প্রভাবিত করে ক্যান্সার।)', 5);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `otp` varchar(6) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `created_at`, `updated_at`, `deleted_at`, `otp`, `is_verified`, `user_id`) VALUES
(1, '2023-11-08 14:08:12.258487', '2023-11-08 20:11:10.698217', NULL, '0', 1, 1),
(2, '2023-11-09 16:07:26.568281', NULL, NULL, '0', 1, 2),
(3, '2023-11-09 16:08:30.994662', NULL, NULL, '0', 1, 3),
(4, '2023-11-09 16:08:51.929705', NULL, NULL, '0', 1, 4),
(5, '2023-11-09 16:14:25.613975', NULL, NULL, '0', 1, 5),
(6, '2023-11-09 16:14:44.930132', NULL, NULL, '0', 1, 6),
(7, '2023-11-09 16:14:58.597554', NULL, NULL, '0', 1, 7),
(8, '2023-11-09 16:18:39.281354', NULL, NULL, '0', 1, 8),
(9, '2023-11-09 16:18:58.231803', NULL, NULL, '0', 1, 9),
(10, '2023-11-09 16:19:16.799908', NULL, NULL, '0', 1, 10),
(11, '2023-11-09 16:19:59.636727', NULL, NULL, '0', 1, 11),
(12, '2023-11-09 16:29:29.988845', '2023-11-09 22:30:01.383793', NULL, '0', 1, 12),
(13, '2023-11-09 16:30:05.949992', '2023-11-09 22:30:13.343524', NULL, '0', 1, 13),
(14, '2023-11-09 16:30:18.571040', '2023-11-09 22:30:26.523058', NULL, '0', 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `patient_appointment`
--

CREATE TABLE `patient_appointment` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `appointment_date` longtext DEFAULT NULL,
  `appointment_time` longtext DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_profile`
--

CREATE TABLE `patient_profile` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(110) DEFAULT NULL,
  `registration_no` varchar(18) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nid_no` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `blood_group_id` bigint(20) DEFAULT NULL,
  `gender_id` bigint(20) DEFAULT NULL,
  `matrimony_id` bigint(20) DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_profile`
--

INSERT INTO `patient_profile` (`id`, `created_at`, `updated_at`, `deleted_at`, `full_name`, `father_name`, `mother_name`, `phone_no`, `registration_no`, `date_of_birth`, `nid_no`, `address`, `blood_group_id`, `gender_id`, `matrimony_id`, `religion_id`, `user_id`) VALUES
(1, '2023-11-09 16:29:29.966906', NULL, NULL, 'Joseph Spears', NULL, NULL, NULL, 'NKI-87037831594315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(2, '2023-11-09 16:30:05.936002', NULL, NULL, 'Bryar Winters', NULL, NULL, NULL, 'VJG-44809174126990', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(3, '2023-11-09 16:30:18.549727', NULL, NULL, 'Eugenia Pacheco', NULL, NULL, NULL, 'MOZ-64915440863147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `permanent_address`
--

CREATE TABLE `permanent_address` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `permanent_village_state` varchar(255) NOT NULL,
  `permanent_postal_code` int(11) NOT NULL,
  `permanent_district_id` bigint(20) NOT NULL,
  `permanent_division_id` bigint(20) NOT NULL,
  `permanent_upazila_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permanent_address`
--

INSERT INTO `permanent_address` (`id`, `created_at`, `updated_at`, `deleted_at`, `permanent_village_state`, `permanent_postal_code`, `permanent_district_id`, `permanent_division_id`, `permanent_upazila_id`, `user_id`) VALUES
(1, '2023-11-09 16:07:26.618417', NULL, NULL, 'Quibusdam recusandae', 47, 9, 2, 78, 2),
(2, '2023-11-09 16:08:31.029595', NULL, NULL, 'Incidunt dolor impe', 16, 29, 5, 221, 3),
(3, '2023-11-09 16:08:51.964495', NULL, NULL, 'In repellendus Inci', 5, 22, 4, 169, 4),
(4, '2023-11-09 16:14:25.645865', NULL, NULL, 'Doloribus quas animi', 51, 2, 1, 14, 5),
(5, '2023-11-09 16:14:44.958067', NULL, NULL, 'Dolorem quo ut enim', 60, 18, 3, 138, 6),
(6, '2023-11-09 16:14:58.624260', NULL, NULL, 'Aut culpa maiores re', 99, 52, 7, 447, 7),
(7, '2023-11-09 16:18:39.316916', NULL, NULL, 'Eum asperiores velit', 76, 58, 7, 484, 8),
(8, '2023-11-09 16:18:58.272836', NULL, NULL, 'Voluptatem est temp', 91, 31, 5, 252, 9),
(9, '2023-11-09 16:19:16.834017', NULL, NULL, 'Veritatis consequatu', 55, 12, 2, 99, 10),
(10, '2023-11-09 16:19:59.651414', NULL, NULL, 'Eu ut et debitis duc', 61, 2, 1, 14, 11);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `cc` longtext DEFAULT NULL,
  `oe` longtext DEFAULT NULL,
  `dd` longtext DEFAULT NULL,
  `ad` longtext DEFAULT NULL,
  `tl` longtext DEFAULT NULL,
  `pmh` longtext DEFAULT NULL,
  `issue_date` date NOT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `patient_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_lab_test`
--

CREATE TABLE `prescription_lab_test` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `lab_test_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `prescription_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_medicine`
--

CREATE TABLE `prescription_medicine` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `medicine_id` bigint(20) DEFAULT NULL,
  `medicine_schedule_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `prescription_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `present_address`
--

CREATE TABLE `present_address` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `present_village_state` varchar(255) NOT NULL,
  `present_postal_code` int(11) NOT NULL,
  `present_district_id` bigint(20) NOT NULL,
  `present_division_id` bigint(20) NOT NULL,
  `present_upazila_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `present_address`
--

INSERT INTO `present_address` (`id`, `created_at`, `updated_at`, `deleted_at`, `present_village_state`, `present_postal_code`, `present_district_id`, `present_division_id`, `present_upazila_id`, `user_id`) VALUES
(1, '2023-11-09 16:07:26.587946', NULL, NULL, 'Ipsum aute quam plac', 86, 3, 1, 20, 2),
(2, '2023-11-09 16:08:31.028597', NULL, NULL, 'In nulla do asperior', 85, 42, 6, 377, 3),
(3, '2023-11-09 16:08:51.949067', NULL, NULL, 'Necessitatibus facer', 42, 18, 3, 138, 4),
(4, '2023-11-09 16:14:25.641875', NULL, NULL, 'Perspiciatis repudi', 76, 10, 2, 82, 5),
(5, '2023-11-09 16:14:44.957068', NULL, NULL, 'Eos ad omnis ea cons', 18, 24, 4, 186, 6),
(6, '2023-11-09 16:14:58.623127', NULL, NULL, 'Est qui est est aliq', 61, 22, 4, 170, 7),
(7, '2023-11-09 16:18:39.301753', NULL, NULL, 'Consectetur non in', 48, 10, 2, 84, 8),
(8, '2023-11-09 16:18:58.271854', NULL, NULL, 'Et animi molestias', 9, 2, 1, 11, 9),
(9, '2023-11-09 16:19:16.827723', NULL, NULL, 'Libero minim quasi n', 87, 34, 5, 275, 10),
(10, '2023-11-09 16:19:59.641712', NULL, NULL, 'Quaerat magna quasi', 26, 3, 1, 21, 11);

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`id`, `name`) VALUES
(1, 'Islam'),
(2, 'Hinduism'),
(3, 'Christianity'),
(4, 'Buddhism'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `upazila`
--

CREATE TABLE `upazila` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `district_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upazila`
--

INSERT INTO `upazila` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `district_id`) VALUES
(1, '2023-07-18 02:29:37.183232', NULL, NULL, 'Akkelpur Upazila', 1),
(2, '2023-07-18 02:29:37.183232', NULL, NULL, 'Joypurhat Sadar Upazila', 1),
(3, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalai Upazila', 1),
(4, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khetlal Upazila', 1),
(5, '2023-07-18 02:29:37.183232', NULL, NULL, 'Panchbibi Upazila', 1),
(6, '2023-07-18 02:29:37.183232', NULL, NULL, 'Adamdighi Upazila', 2),
(7, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bogura SadarUpazila', 2),
(8, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhunat Upazila', 2),
(9, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhupchanchia Upazila', 2),
(10, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gabtali Upazila', 2),
(11, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kahaloo Upazila', 2),
(12, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nandigram Upazila', 2),
(13, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sariakandi Upazila', 2),
(14, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shajahanpur Upazila', 2),
(15, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sherpur Upazila', 2),
(16, '2023-07-18 02:29:37.183232', NULL, NULL, 'ShibganjUpazila', 2),
(17, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sonatola Upazila', 2),
(18, '2023-07-18 02:29:37.183232', NULL, NULL, 'Atrai Upazila', 3),
(19, '2023-07-18 02:29:37.183232', NULL, NULL, 'Badalgachhi Upazila', 3),
(20, '2023-07-18 02:29:37.183232', NULL, NULL, 'Manda Upazila', 3),
(21, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhamoirhat Upazila', 3),
(22, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mohadevpur Upazila', 3),
(23, '2023-07-18 02:29:37.183232', NULL, NULL, 'Naogaon Sadar Upazila', 3),
(24, '2023-07-18 02:29:37.183232', NULL, NULL, 'Niamatpur Upazila', 3),
(25, '2023-07-18 02:29:37.183232', NULL, NULL, 'Patnitala Upazila', 3),
(26, '2023-07-18 02:29:37.183232', NULL, NULL, 'Porsha Upazila', 3),
(27, '2023-07-18 02:29:37.183232', NULL, NULL, 'Raninagar Upazila', 3),
(28, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sapahar Upazila', 3),
(29, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagatipara Upazila', 4),
(30, '2023-07-18 02:29:37.183232', NULL, NULL, 'Baraigram Upazila', 4),
(31, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gurudaspur Upazila', 4),
(32, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lalpur Upazila', 4),
(33, '2023-07-18 02:29:37.183232', NULL, NULL, 'Natore Sadar Upazila', 4),
(34, '2023-07-18 02:29:37.183232', NULL, NULL, 'Singra Upazila', 4),
(35, '2023-07-18 02:29:37.183232', NULL, NULL, 'Naldanga Upazila', 4),
(36, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bholahat Upazila', 5),
(37, '2023-07-18 02:29:37.183232', NULL, NULL, 'GomastapurUpazila', 5),
(38, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nachole Upazila', 5),
(39, '2023-07-18 02:29:37.183232', NULL, NULL, 'NawabganjSadar Upazila', 5),
(40, '2023-07-18 02:29:37.183232', NULL, NULL, 'ShibganjUpazila', 5),
(41, '2023-07-18 02:29:37.183232', NULL, NULL, 'Atgharia Upazila', 6),
(42, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bera Upazila', 6),
(43, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhangura Upazila', 6),
(44, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chatmohar Upazila', 6),
(45, '2023-07-18 02:29:37.183232', NULL, NULL, 'Faridpur Upazila', 6),
(46, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ishwardi Upazila', 6),
(47, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pabna Sadar Upazila', 6),
(48, '2023-07-18 02:29:37.183232', NULL, NULL, 'Santhia Upazila', 6),
(49, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sujanagar Upazila', 6),
(50, '2023-07-18 02:29:37.183232', NULL, NULL, 'Belkuchi Upazila', 7),
(51, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chauhali Upazila', 7),
(52, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kamarkhanda Upazila', 7),
(53, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kazipur Upazila', 7),
(54, '2023-07-18 02:29:37.183232', NULL, NULL, 'Raiganj Upazila', 7),
(55, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shahjadpur Upazila', 7),
(56, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sirajganj Sadar Upazila', 7),
(57, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tarash Upazila', 7),
(58, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ullahpara Upazila', 7),
(59, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagha Upazila', 8),
(60, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagmara Upazila', 8),
(61, '2023-07-18 02:29:37.183232', NULL, NULL, 'Charghat Upazila', 8),
(62, '2023-07-18 02:29:37.183232', NULL, NULL, 'Durgapur Upazila', 8),
(63, '2023-07-18 02:29:37.183232', NULL, NULL, 'Godagari Upazila', 8),
(64, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mohanpur Upazila', 8),
(65, '2023-07-18 02:29:37.183232', NULL, NULL, 'Paba Upazila', 8),
(66, '2023-07-18 02:29:37.183232', NULL, NULL, 'Puthia Upazila', 8),
(67, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tanore Upazila', 8),
(68, '2023-07-18 02:29:37.183232', NULL, NULL, 'Birampur Upazila', 9),
(69, '2023-07-18 02:29:37.183232', NULL, NULL, 'Birganj Upazila', 9),
(70, '2023-07-18 02:29:37.183232', NULL, NULL, 'Biral Upazila', 9),
(71, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bochaganj Upazila', 9),
(72, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chirirbandar Upazila', 9),
(73, '2023-07-18 02:29:37.183232', NULL, NULL, 'PhulbariUpazila', 9),
(74, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ghoraghat Upazila', 9),
(75, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hakimpur Upazila', 9),
(76, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaharole Upazila', 9),
(77, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khansama Upazila', 9),
(78, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dinajpur Sadar Upazila', 9),
(79, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nawabganj Upazila', 9),
(80, '2023-07-18 02:29:37.183232', NULL, NULL, 'Parbatipur Upazila', 9),
(81, '2023-07-18 02:29:37.183232', NULL, NULL, 'Phulchhari Upazila', 10),
(82, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gaibandha Sadar Upazila', 10),
(83, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gobindaganj Upazila', 10),
(84, '2023-07-18 02:29:37.183232', NULL, NULL, 'Palashbari Upazila', 10),
(85, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sadullapur Upazila', 10),
(86, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sughatta Upazila', 10),
(87, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sundarganj Upazila', 10),
(88, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhurungamari Upazila', 11),
(89, '2023-07-18 02:29:37.183232', NULL, NULL, 'Char Rajibpur Upazila', 11),
(90, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chilmari Upazila', 11),
(91, '2023-07-18 02:29:37.183232', NULL, NULL, 'Phulbari Upazila', 11),
(92, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kurigram Sadar Upazila', 11),
(93, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nageshwari Upazila', 11),
(94, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajarhat Upazila', 11),
(95, '2023-07-18 02:29:37.183232', NULL, NULL, 'Raomari Upazila', 11),
(96, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ulipur Upazila', 11),
(97, '2023-07-18 02:29:37.183232', NULL, NULL, 'Aditmari Upazila', 12),
(98, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hatibandha Upazila', 12),
(99, '2023-07-18 02:29:37.183232', NULL, NULL, 'KaliganjUpazila', 12),
(100, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lalmonirhat SadarUpazila', 12),
(101, '2023-07-18 02:29:37.183232', NULL, NULL, 'Patgram Upazila', 12),
(102, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dimla Upazila', 13),
(103, '2023-07-18 02:29:37.183232', NULL, NULL, 'Domar Upazila', 13),
(104, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jaldhaka Upazila', 13),
(105, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kishoreganj Upazila', 13),
(106, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nilphamari Sadar Upazila', 13),
(107, '2023-07-18 02:29:37.183232', NULL, NULL, 'Saidpur Upazila', 13),
(108, '2023-07-18 02:29:37.183232', NULL, NULL, 'Atwari Upazila', 14),
(109, '2023-07-18 02:29:37.183232', NULL, NULL, 'Boda Upazila', 14),
(110, '2023-07-18 02:29:37.183232', NULL, NULL, 'Debiganj Upazila', 14),
(111, '2023-07-18 02:29:37.183232', NULL, NULL, 'Panchagarh Sadar Upazila', 14),
(112, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tetulia Upazila', 14),
(113, '2023-07-18 02:29:37.183232', NULL, NULL, 'Badarganj Upazila', 15),
(114, '2023-07-18 02:29:37.183232', NULL, NULL, 'GangachharaUpazila', 15),
(115, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaunia Upazila', 15),
(116, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rangpur Sadar Upazila', 15),
(117, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mithapukur Upazila', 15),
(118, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pirgachha Upazila', 15),
(119, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pirganj Upazila', 15),
(120, '2023-07-18 02:29:37.183232', NULL, NULL, 'Taraganj Upazila', 15),
(121, '2023-07-18 02:29:37.183232', NULL, NULL, 'Baliadangi Upazila', 16),
(122, '2023-07-18 02:29:37.183232', NULL, NULL, 'Haripur Upazila', 16),
(123, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pirganj Upazila', 16),
(124, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ranisankail Upazila', 16),
(125, '2023-07-18 02:29:37.183232', NULL, NULL, 'Thakurgaon Sadar Upazila', 16),
(126, '2023-07-18 02:29:37.183232', NULL, NULL, 'Atpara Upazila', 17),
(127, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barhatta Upazila', 17),
(128, '2023-07-18 02:29:37.183232', NULL, NULL, 'Durgapur Upazila', 17),
(129, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khaliajuri Upazila', 17),
(130, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalmakanda Upazila', 17),
(131, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kendua Upazila', 17),
(132, '2023-07-18 02:29:37.183232', NULL, NULL, 'Madan Upazila', 17),
(133, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mohanganj Upazila', 17),
(134, '2023-07-18 02:29:37.183232', NULL, NULL, 'Netrokona Sadar Upazila', 17),
(135, '2023-07-18 02:29:37.183232', NULL, NULL, 'Purbadhala Upazila', 17),
(136, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jhenaigati Upazila', 18),
(137, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nakla Upazila', 18),
(138, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nalitabari Upazila', 18),
(139, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sherpur Sadar Upazila', 18),
(140, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sreebardi Upazila', 18),
(141, '2023-07-18 02:29:37.183232', NULL, NULL, 'Baksiganj Upazila', 19),
(142, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dewanganj Upazila', 19),
(143, '2023-07-18 02:29:37.183232', NULL, NULL, 'Islampur Upazila', 19),
(144, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jamalpur Sadar Upazila', 19),
(145, '2023-07-18 02:29:37.183232', NULL, NULL, 'Madarganj Upazila', 19),
(146, '2023-07-18 02:29:37.183232', NULL, NULL, 'Melandaha Upazila', 19),
(147, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sarishabari Upazila', 19),
(148, '2023-07-18 02:29:37.183232', NULL, NULL, 'Trishal Upazila', 20),
(149, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhobaura Upazila', 20),
(150, '2023-07-18 02:29:37.183232', NULL, NULL, 'Fulbaria Upazila', 20),
(151, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gafargaon Upazila', 20),
(152, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gauripur Upazila', 20),
(153, '2023-07-18 02:29:37.183232', NULL, NULL, 'Haluaghat Upazila', 20),
(154, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ishwarganj Upazila', 20),
(155, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mymensingh Sadar Upazila', 20),
(156, '2023-07-18 02:29:37.183232', NULL, NULL, 'MuktagachhaUpazila', 20),
(157, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nandail Upazila', 20),
(158, '2023-07-18 02:29:37.183232', NULL, NULL, 'Phulpur Upazila', 20),
(159, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhaluka Upazila', 20),
(160, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tara KhandaUpazila', 20),
(161, '2023-07-18 02:29:37.183232', NULL, NULL, 'Amtali Upazila', 21),
(162, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bamna Upazila', 21),
(163, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barguna Sadar Upazila', 21),
(164, '2023-07-18 02:29:37.183232', NULL, NULL, 'Betagi Upazila', 21),
(165, '2023-07-18 02:29:37.183232', NULL, NULL, 'Patharghata Upazila', 21),
(166, '2023-07-18 02:29:37.183232', NULL, NULL, 'Taltali Upazila', 21),
(167, '2023-07-18 02:29:37.183232', NULL, NULL, 'Agailjhara Upazila', 22),
(168, '2023-07-18 02:29:37.183232', NULL, NULL, 'Babuganj Upazila', 22),
(169, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bakerganj Upazila', 22),
(170, '2023-07-18 02:29:37.183232', NULL, NULL, 'Banaripara Upazila', 22),
(171, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gaurnadi Upazila', 22),
(172, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hizla Upazila', 22),
(173, '2023-07-18 02:29:37.183232', NULL, NULL, 'BarishalSadar Upazila', 22),
(174, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mehendiganj Upazila', 22),
(175, '2023-07-18 02:29:37.183232', NULL, NULL, 'Muladi Upazila', 22),
(176, '2023-07-18 02:29:37.183232', NULL, NULL, 'Wazirpur Upazila', 22),
(177, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhola Sadar Upazila', 23),
(178, '2023-07-18 02:29:37.183232', NULL, NULL, 'BurhanuddinUpazila', 23),
(179, '2023-07-18 02:29:37.183232', NULL, NULL, 'Char Fasson Upazila', 23),
(180, '2023-07-18 02:29:37.183232', NULL, NULL, 'Daulatkhan Upazila', 23),
(181, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lalmohan Upazila', 23),
(182, '2023-07-18 02:29:37.183232', NULL, NULL, 'Manpura Upazila', 23),
(183, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tazumuddin Upazila', 23),
(184, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jhalokati Sadar Upazila', 24),
(185, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kathalia Upazila', 24),
(186, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nalchity Upazila', 24),
(187, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajapur Upazila', 24),
(188, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bauphal Upazila', 25),
(189, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dashmina Upazila', 25),
(190, '2023-07-18 02:29:37.183232', NULL, NULL, 'Galachipa Upazila', 25),
(191, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalapara Upazila', 25),
(192, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mirzaganj Upazila', 25),
(193, '2023-07-18 02:29:37.183232', NULL, NULL, 'Patuakhali Sadar Upazila', 25),
(194, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rangabali Upazila', 25),
(195, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dumki Upazila', 25),
(196, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhandaria Upazila', 26),
(197, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kawkhali Upazila', 26),
(198, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mathbaria Upazila', 26),
(199, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nazirpur Upazila', 26),
(200, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pirojpur Sadar Upazila', 26),
(201, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nesarabad(Swarupkati) Upazila', 26),
(202, '2023-07-18 02:29:37.183232', NULL, NULL, 'Indurkani Upazila', 26),
(203, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ali Kadam Upazila', 27),
(204, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bandarban Sadar Upazila', 27),
(205, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lama Upazila', 27),
(206, '2023-07-18 02:29:37.183232', NULL, NULL, 'Naikhongchhari Upazila', 27),
(207, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rowangchhari Upazila', 27),
(208, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ruma Upazila', 27),
(209, '2023-07-18 02:29:37.183232', NULL, NULL, 'Thanchi Upazila', 27),
(210, '2023-07-18 02:29:37.183232', NULL, NULL, 'Akhaura Upazila', 28),
(211, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bancharampur Upazila', 28),
(212, '2023-07-18 02:29:37.183232', NULL, NULL, 'Brahmanbaria SadarUpazila', 28),
(213, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kasba Upazila', 28),
(214, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nabinagar Upazila', 28),
(215, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nasirnagar Upazila', 28),
(216, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sarail Upazila', 28),
(217, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ashuganj Upazila', 28),
(218, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bijoynagar Upazila', 28),
(219, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chandpur Sadar Upazila', 29),
(220, '2023-07-18 02:29:37.183232', NULL, NULL, 'Faridganj Upazila', 29),
(221, '2023-07-18 02:29:37.183232', NULL, NULL, 'Haimchar Upazila', 29),
(222, '2023-07-18 02:29:37.183232', NULL, NULL, 'Haziganj Upazila', 29),
(223, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kachua Upazila', 29),
(224, '2023-07-18 02:29:37.183232', NULL, NULL, 'Matlab Dakshin Upazila', 29),
(225, '2023-07-18 02:29:37.183232', NULL, NULL, 'Matlab Uttar Upazila', 29),
(226, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shahrasti Upazila', 29),
(227, '2023-07-18 02:29:37.183232', NULL, NULL, 'Anwara Upazila', 30),
(228, '2023-07-18 02:29:37.183232', NULL, NULL, 'Banshkhali Upazila', 30),
(229, '2023-07-18 02:29:37.183232', NULL, NULL, 'Boalkhali Upazila', 30),
(230, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chandanaish Upazila', 30),
(231, '2023-07-18 02:29:37.183232', NULL, NULL, 'Fatikchhari Upazila', 30),
(232, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hathazari Upazila', 30),
(233, '2023-07-18 02:29:37.183232', NULL, NULL, 'Karnaphuli Upazila', 30),
(234, '2023-07-18 02:29:37.183232', NULL, NULL, 'LohagaraUpazila', 30),
(235, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mirsharai Upazila', 30),
(236, '2023-07-18 02:29:37.183232', NULL, NULL, 'Patiya Upazila', 30),
(237, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rangunia Upazila', 30),
(238, '2023-07-18 02:29:37.183232', NULL, NULL, 'Raozan Upazila', 30),
(239, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sandwip Upazila', 30),
(240, '2023-07-18 02:29:37.183232', NULL, NULL, 'Satkania Upazila', 30),
(241, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sitakunda Upazila', 30),
(242, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barura Upazila', 31),
(243, '2023-07-18 02:29:37.183232', NULL, NULL, 'Brahmanpara Upazila', 31),
(244, '2023-07-18 02:29:37.183232', NULL, NULL, 'Burichang Upazila', 31),
(245, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chandina Upazila', 31),
(246, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chauddagram Upazila', 31),
(247, '2023-07-18 02:29:37.183232', NULL, NULL, 'Daudkandi Upazila', 31),
(248, '2023-07-18 02:29:37.183232', NULL, NULL, 'Debidwar Upazila', 31),
(249, '2023-07-18 02:29:37.183232', NULL, NULL, 'Homna Upazila', 31),
(250, '2023-07-18 02:29:37.183232', NULL, NULL, 'Laksam Upazila', 31),
(251, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lalmai Upazila', 31),
(252, '2023-07-18 02:29:37.183232', NULL, NULL, 'Muradnagar Upazila', 31),
(253, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nangalkot Upazila', 31),
(254, '2023-07-18 02:29:37.183232', NULL, NULL, 'Cumilla Adarsha Sadar Upazila', 31),
(255, '2023-07-18 02:29:37.183232', NULL, NULL, 'Meghna Upazila', 31),
(256, '2023-07-18 02:29:37.183232', NULL, NULL, 'Titas Upazila', 31),
(257, '2023-07-18 02:29:37.183232', NULL, NULL, 'MonohargonjUpazila', 31),
(258, '2023-07-18 02:29:37.183232', NULL, NULL, 'Cumilla Sadar Dakshin Upazila', 31),
(259, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chakaria Upazila', 32),
(260, '2023-07-18 02:29:37.183232', NULL, NULL, 'Cox\'s Bazar SadarUpazila', 32),
(261, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kutubdia Upazila', 32),
(262, '2023-07-18 02:29:37.183232', NULL, NULL, 'Maheshkhali Upazila', 32),
(263, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ramu Upazila', 32),
(264, '2023-07-18 02:29:37.183232', NULL, NULL, 'Teknaf Upazila', 32),
(265, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ukhia Upazila', 32),
(266, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pekua Upazila', 32),
(267, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chhagalnaiya Upazila', 33),
(268, '2023-07-18 02:29:37.183232', NULL, NULL, 'Daganbhuiyan Upazila', 33),
(269, '2023-07-18 02:29:37.183232', NULL, NULL, 'Feni Sadar Upazila', 33),
(270, '2023-07-18 02:29:37.183232', NULL, NULL, 'Parshuram Upazila', 33),
(271, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sonagazi Upazila', 33),
(272, '2023-07-18 02:29:37.183232', NULL, NULL, 'Fulgazi Upazila', 33),
(273, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dighinala Upazila', 34),
(274, '2023-07-18 02:29:37.183232', NULL, NULL, 'KhagrachhariUpazila', 34),
(275, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lakshmichhari Upazila', 34),
(276, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mahalchhari Upazila', 34),
(277, '2023-07-18 02:29:37.183232', NULL, NULL, 'Manikchhari Upazila', 34),
(278, '2023-07-18 02:29:37.183232', NULL, NULL, 'Matiranga Upazila', 34),
(279, '2023-07-18 02:29:37.183232', NULL, NULL, 'Panchhari Upazila', 34),
(280, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ramgarh Upazila', 34),
(281, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lakshmipur Sadar Upazila', 35),
(282, '2023-07-18 02:29:37.183232', NULL, NULL, 'Raipur Upazila', 35),
(283, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ramganj Upazila', 35),
(284, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ramgati Upazila', 35),
(285, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kamalnagar Upazila', 35),
(286, '2023-07-18 02:29:37.183232', NULL, NULL, 'Begumganj Upazila', 36),
(287, '2023-07-18 02:29:37.183232', NULL, NULL, 'Noakhali Sadar Upazila', 36),
(288, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chatkhil Upazila', 36),
(289, '2023-07-18 02:29:37.183232', NULL, NULL, 'CompaniganjUpazila', 36),
(290, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hatiya Upazila', 36),
(291, '2023-07-18 02:29:37.183232', NULL, NULL, 'Senbagh Upazila', 36),
(292, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sonaimuri Upazila', 36),
(293, '2023-07-18 02:29:37.183232', NULL, NULL, 'SubarnacharUpazila', 36),
(294, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kabirhat Upazila', 36),
(295, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagaichhari Upazila', 37),
(296, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barkal Upazila', 37),
(297, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kawkhali(Betbunia) Upazila', 37),
(298, '2023-07-18 02:29:37.183232', NULL, NULL, 'Belaichhari Upazila', 37),
(299, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaptai Upazila', 37),
(300, '2023-07-18 02:29:37.183232', NULL, NULL, 'Juraichhari Upazila', 37),
(301, '2023-07-18 02:29:37.183232', NULL, NULL, 'Langadu Upazila', 37),
(302, '2023-07-18 02:29:37.183232', NULL, NULL, 'NaniyacharUpazila', 37),
(303, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajasthali Upazila', 37),
(304, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rangamati Sadar Upazila', 37),
(305, '2023-07-18 02:29:37.183232', NULL, NULL, 'Metropolitan Thana', 38),
(306, '2023-07-18 02:29:37.183232', NULL, NULL, 'Adabor Thana', 38),
(307, '2023-07-18 02:29:37.183232', NULL, NULL, 'Uttar Khan Thana', 38),
(308, '2023-07-18 02:29:37.183232', NULL, NULL, 'Uttara Thana', 38),
(309, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kadamtali Thana', 38),
(310, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalabagan Thana', 38),
(311, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kafrul Thana', 38),
(312, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kamrangirchar Thana', 38),
(313, '2023-07-18 02:29:37.183232', NULL, NULL, 'Cantonment Thana', 38),
(314, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kotwali Thana', 38),
(315, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khilkhet Thana', 38),
(316, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khilgaon Thana', 38),
(317, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gulshan Thana', 38),
(318, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gendaria Thana', 38),
(319, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chawkbazar Model Thana', 38),
(320, '2023-07-18 02:29:37.183232', NULL, NULL, 'Demra Thana', 38),
(321, '2023-07-18 02:29:37.183232', NULL, NULL, 'Turag Thana', 38),
(322, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tejgaon Thana', 38),
(323, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tejgaon I/A Thana', 38),
(324, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dakshinkhan Thana', 38),
(325, '2023-07-18 02:29:37.183232', NULL, NULL, 'Darus Salam Thana', 38),
(326, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhanmondi  Thana', 38),
(327, '2023-07-18 02:29:37.183232', NULL, NULL, 'New Market Thana', 38),
(328, '2023-07-18 02:29:37.183232', NULL, NULL, 'Paltan Thana', 38),
(329, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pallabi Thana', 38),
(330, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bangshal Thana', 38),
(331, '2023-07-18 02:29:37.183232', NULL, NULL, 'Badda Thana', 38),
(332, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bimanbandar Thana', 38),
(333, '2023-07-18 02:29:37.183232', NULL, NULL, 'Motijheel Thana', 38),
(334, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mirpur Model Thana', 38),
(335, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mohammadpur Thana', 38),
(336, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jatrabari Thana', 38),
(337, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ramna Thana', 38),
(338, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rampura Thana', 38),
(339, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lalbagh Thana', 38),
(340, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shah Ali Thana', 38),
(341, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shahbagh Thana', 38),
(342, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sher-e-Bangla Nagar Thana', 38),
(343, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shyampur Thana', 38),
(344, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sabujbagh Thana', 38),
(345, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sutrapur Thana', 38),
(346, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hazaribagh Thana', 38),
(347, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhamrai Upazila', 38),
(348, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dohar Upazila', 38),
(349, '2023-07-18 02:29:37.183232', NULL, NULL, 'Keraniganj Upazila', 38),
(350, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nawabganj Upazila', 38),
(351, '2023-07-18 02:29:37.183232', NULL, NULL, 'Savar Upazila', 38),
(352, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tejgaon Circle Upazila', 38),
(353, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gazipur Sadar Upazila', 39),
(354, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaliakair Upazila', 39),
(355, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaliganj Upazila', 39),
(356, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kapasia Upazila', 39),
(357, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sreepur Upazila', 39),
(358, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gopalganj Sadar Upazila', 40),
(359, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kashiani Upazila', 40),
(360, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kotalipara Upazila', 40),
(361, '2023-07-18 02:29:37.183232', NULL, NULL, 'Muksudpur Upazila', 40),
(362, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tungipara Upazila', 40),
(363, '2023-07-18 02:29:37.183232', NULL, NULL, 'Austagram Upazila', 41),
(364, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bajitpur Upazila', 41),
(365, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhairab Upazila', 41),
(366, '2023-07-18 02:29:37.183232', NULL, NULL, 'Hossainpur Upazila', 41),
(367, '2023-07-18 02:29:37.183232', NULL, NULL, 'Itna Upazila', 41),
(368, '2023-07-18 02:29:37.183232', NULL, NULL, 'Karimganj Upazila', 41),
(369, '2023-07-18 02:29:37.183232', NULL, NULL, 'Katiadi Upazila', 41),
(370, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kishoreganj SadarUpazila', 41),
(371, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kuliarchar Upazila', 41),
(372, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mithamain Upazila', 41),
(373, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nikli Upazila', 41),
(374, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pakundia Upazila', 41),
(375, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tarail Upazila', 41),
(376, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajoir Upazila', 42),
(377, '2023-07-18 02:29:37.183232', NULL, NULL, 'MadaripurSadar Upazila', 42),
(378, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalkini Upazila', 42),
(379, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shibchar Upazila', 42),
(380, '2023-07-18 02:29:37.183232', NULL, NULL, 'DaulatpurUpazila', 43),
(381, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ghior Upazila', 43),
(382, '2023-07-18 02:29:37.183232', NULL, NULL, 'Harirampur Upazila', 43),
(383, '2023-07-18 02:29:37.183232', NULL, NULL, 'ManikgonjSadar Upazila', 43),
(384, '2023-07-18 02:29:37.183232', NULL, NULL, 'Saturia Upazila', 43),
(385, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shivalaya Upazila', 43),
(386, '2023-07-18 02:29:37.183232', NULL, NULL, 'Singair Upazila', 43),
(387, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gazaria Upazila', 44),
(388, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lohajang Upazila', 44),
(389, '2023-07-18 02:29:37.183232', NULL, NULL, 'Munshiganj Sadar Upazila', 44),
(390, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sirajdikhan Upazila', 44),
(391, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sreenagar Upazila', 44),
(392, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tongibari Upazila', 44),
(393, '2023-07-18 02:29:37.183232', NULL, NULL, 'Araihazar Upazila', 45),
(394, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bandar Upazila', 45),
(395, '2023-07-18 02:29:37.183232', NULL, NULL, 'Narayanganj SadarUpazila', 45),
(396, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rupganj Upazila', 45),
(397, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sonargaon Upazila', 45),
(398, '2023-07-18 02:29:37.183232', NULL, NULL, 'Baliakandi Upazila', 46),
(399, '2023-07-18 02:29:37.183232', NULL, NULL, 'GoalandaghatUpazila', 46),
(400, '2023-07-18 02:29:37.183232', NULL, NULL, 'Pangsha Upazila', 46),
(401, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajbari Sadar Upazila', 46),
(402, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalukhali Upazila', 46),
(403, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhedarganj Upazila', 47),
(404, '2023-07-18 02:29:37.183232', NULL, NULL, 'Damudya Upazila', 47),
(405, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gosairhat Upazila', 47),
(406, '2023-07-18 02:29:37.183232', NULL, NULL, 'Naria Upazila', 47),
(407, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shariatpur Sadar Upazila', 47),
(408, '2023-07-18 02:29:37.183232', NULL, NULL, 'Zajira Upazila', 47),
(409, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shakhipur Upazila', 47),
(410, '2023-07-18 02:29:37.183232', NULL, NULL, 'Alfadanga Upazila', 48),
(411, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhanga Upazila', 48),
(412, '2023-07-18 02:29:37.183232', NULL, NULL, 'Boalmari Upazila', 48),
(413, '2023-07-18 02:29:37.183232', NULL, NULL, 'Charbhadrasan Upazila', 48),
(414, '2023-07-18 02:29:37.183232', NULL, NULL, 'Faridpur Sadar Upazila', 48),
(415, '2023-07-18 02:29:37.183232', NULL, NULL, 'Madhukhali Upazila', 48),
(416, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nagarkanda Upazila', 48),
(417, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sadarpur Upazila', 48),
(418, '2023-07-18 02:29:37.183232', NULL, NULL, 'Saltha Upazila', 48),
(419, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gopalpur Upazila', 49),
(420, '2023-07-18 02:29:37.183232', NULL, NULL, 'Basail Upazila', 49),
(421, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bhuapur Upazila', 49),
(422, '2023-07-18 02:29:37.183232', NULL, NULL, 'Delduar Upazila', 49),
(423, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ghatail Upazila', 49),
(424, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalihati Upazila', 49),
(425, '2023-07-18 02:29:37.183232', NULL, NULL, 'Madhupur Upazila', 49),
(426, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mirzapur Upazila', 49),
(427, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nagarpur Upazila', 49),
(428, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sakhipur Upazila', 49),
(429, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dhanbari Upazila', 49),
(430, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tangail Sadar Upazila', 49),
(431, '2023-07-18 02:29:37.183232', NULL, NULL, 'Narsingdi Sadar Upazila', 50),
(432, '2023-07-18 02:29:37.183232', NULL, NULL, 'Belabo Upazila', 50),
(433, '2023-07-18 02:29:37.183232', NULL, NULL, 'Monohardi Upazila', 50),
(434, '2023-07-18 02:29:37.183232', NULL, NULL, 'Palash Upazila', 50),
(435, '2023-07-18 02:29:37.183232', NULL, NULL, 'RaipuraUpazila', 50),
(436, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shibpur Upazila', 50),
(437, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagerhat Sadar Upazila', 51),
(438, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chitalmari Upazila', 51),
(439, '2023-07-18 02:29:37.183232', NULL, NULL, 'Fakirhat Upazila', 51),
(440, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kachua Upazila', 51),
(441, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mollahat Upazila', 51),
(442, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mongla Upazila', 51),
(443, '2023-07-18 02:29:37.183232', NULL, NULL, 'Morrelganj Upazila', 51),
(444, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rampal Upazila', 51),
(445, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sarankhola Upazila', 51),
(446, '2023-07-18 02:29:37.183232', NULL, NULL, 'Alamdanga Upazila', 52),
(447, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chuadanga Sadar Upazila', 52),
(448, '2023-07-18 02:29:37.183232', NULL, NULL, 'Damurhuda Upazila', 52),
(449, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jibannagar Upazila', 52),
(450, '2023-07-18 02:29:37.183232', NULL, NULL, 'Abhaynagar Upazila', 53),
(451, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bagherpara Upazila', 53),
(452, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chaugachha Upazila', 53),
(453, '2023-07-18 02:29:37.183232', NULL, NULL, 'JhikargachhaUpazila', 53),
(454, '2023-07-18 02:29:37.183232', NULL, NULL, 'Keshabpur Upazila', 53),
(455, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jashore SadarUpazila', 53),
(456, '2023-07-18 02:29:37.183232', NULL, NULL, 'Manirampur Upazila', 53),
(457, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sharsha Upazila', 53),
(458, '2023-07-18 02:29:37.183232', NULL, NULL, 'Harinakunda Upazila', 54),
(459, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jhenaidah Sadar Upazila', 54),
(460, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaliganj Upazila', 54),
(461, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kotchandpur Upazila', 54),
(462, '2023-07-18 02:29:37.183232', NULL, NULL, 'Maheshpur Upazila', 54),
(463, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shailkupa Upazila', 54),
(464, '2023-07-18 02:29:37.183232', NULL, NULL, 'Batiaghata Upazila', 55),
(465, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dacope Upazila', 55),
(466, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dumuria Upazila', 55),
(467, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dighalia Upazila', 55),
(468, '2023-07-18 02:29:37.183232', NULL, NULL, 'Koyra Upazila', 55),
(469, '2023-07-18 02:29:37.183232', NULL, NULL, 'Paikgachha Upazila', 55),
(470, '2023-07-18 02:29:37.183232', NULL, NULL, 'Phultala Upazila', 55),
(471, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rupsha Upazila', 55),
(472, '2023-07-18 02:29:37.183232', NULL, NULL, 'Terokhada Upazila', 55),
(473, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bheramara Upazila', 56),
(474, '2023-07-18 02:29:37.183232', NULL, NULL, 'Daulatpur Upazila', 56),
(475, '2023-07-18 02:29:37.183232', NULL, NULL, 'Khoksa Upazila', 56),
(476, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kumarkhali Upazila', 56),
(477, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kushtia Sadar Upazila', 56),
(478, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mirpur Upazila', 56),
(479, '2023-07-18 02:29:37.183232', NULL, NULL, 'Magura Sadar Upazila', 57),
(480, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mohammadpur Upazila', 57),
(481, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shalikha Upazila', 57),
(482, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sreepur Upazila', 57),
(483, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gangni Upazila', 58),
(484, '2023-07-18 02:29:37.183232', NULL, NULL, 'Meherpur Sadar Upazila', 58),
(485, '2023-07-18 02:29:37.183232', NULL, NULL, 'Mujibnagar Upazila', 58),
(486, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalia Upazila', 59),
(487, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lohagara Upazila', 59),
(488, '2023-07-18 02:29:37.183232', NULL, NULL, 'Narail Sadar Upazila', 59),
(489, '2023-07-18 02:29:37.183232', NULL, NULL, 'Naragati Thana', 59),
(490, '2023-07-18 02:29:37.183232', NULL, NULL, 'Assasuni Upazila', 60),
(491, '2023-07-18 02:29:37.183232', NULL, NULL, 'Debhata Upazila', 60),
(492, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kalaroa Upazila', 60),
(493, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kaliganj Upazila', 60),
(494, '2023-07-18 02:29:37.183232', NULL, NULL, 'Satkhira Sadar Upazila', 60),
(495, '2023-07-18 02:29:37.183232', NULL, NULL, 'Shyamnagar Upazila', 60),
(496, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tala Upazila', 60),
(497, '2023-07-18 02:29:37.183232', NULL, NULL, 'Ajmiriganj Upazila', 61),
(498, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bahubal Upazila', 61),
(499, '2023-07-18 02:29:37.183232', NULL, NULL, 'BaniyachongUpazila', 61),
(500, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chunarughat Upazila', 61),
(501, '2023-07-18 02:29:37.183232', NULL, NULL, 'Habiganj Sadar Upazila', 61),
(502, '2023-07-18 02:29:37.183232', NULL, NULL, 'Lakhai Upazila', 61),
(503, '2023-07-18 02:29:37.183232', NULL, NULL, 'Madhabpur Upazila', 61),
(504, '2023-07-18 02:29:37.183232', NULL, NULL, 'Nabiganj Upazila', 61),
(505, '2023-07-18 02:29:37.183232', NULL, NULL, 'SayestaganjUpazila', 61),
(506, '2023-07-18 02:29:37.183232', NULL, NULL, 'Barlekha Upazila', 62),
(507, '2023-07-18 02:29:37.183232', NULL, NULL, 'Juri Upazila', 62),
(508, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kamalganj Upazila', 62),
(509, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kulaura Upazila', 62),
(510, '2023-07-18 02:29:37.183232', NULL, NULL, 'Moulvibazar SadarUpazila', 62),
(511, '2023-07-18 02:29:37.183232', NULL, NULL, 'Rajnagar Upazila', 62),
(512, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sreemangal Upazila', 62),
(513, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bishwamvarpur Upazila', 63),
(514, '2023-07-18 02:29:37.183232', NULL, NULL, 'Chhatak Upazila', 63),
(515, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dakshin SunamganjUpazila', 63),
(516, '2023-07-18 02:29:37.183232', NULL, NULL, 'Derai Upazila', 63),
(517, '2023-07-18 02:29:37.183232', NULL, NULL, 'DharamapashaUpazila', 63),
(518, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dowarabazar Upazila', 63),
(519, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jagannathpur Upazila', 63),
(520, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jamalganj Upazila', 63),
(521, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sullah Upazila', 63),
(522, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sunamganj Sadar Upazila', 63),
(523, '2023-07-18 02:29:37.183232', NULL, NULL, 'Tahirpur Upazila', 63),
(524, '2023-07-18 02:29:37.183232', NULL, NULL, 'Balaganj Upazila', 64),
(525, '2023-07-18 02:29:37.183232', NULL, NULL, 'Beanibazar Upazila', 64),
(526, '2023-07-18 02:29:37.183232', NULL, NULL, 'Bishwanath Upazila', 64),
(527, '2023-07-18 02:29:37.183232', NULL, NULL, 'Companigonj Upazila', 64),
(528, '2023-07-18 02:29:37.183232', NULL, NULL, 'Dakshin Surma Upazila', 64),
(529, '2023-07-18 02:29:37.183232', NULL, NULL, 'Fenchuganj Upazila', 64),
(530, '2023-07-18 02:29:37.183232', NULL, NULL, 'Golapganj Upazila', 64),
(531, '2023-07-18 02:29:37.183232', NULL, NULL, 'Gowainghat Upazila', 64),
(532, '2023-07-18 02:29:37.183232', NULL, NULL, 'Jaintiapur Upazila', 64),
(533, '2023-07-18 02:29:37.183232', NULL, NULL, 'Kanaighat Upazila', 64),
(534, '2023-07-18 02:29:37.183232', NULL, NULL, 'Osmani Nagar Upazila', 64),
(535, '2023-07-18 02:29:37.183232', NULL, NULL, 'Sylhet Sadar Upazila', 64),
(536, '2023-07-18 02:29:37.183232', NULL, NULL, 'Zakiganj Upazila', 64);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hash` varchar(64) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_at`, `updated_at`, `deleted_at`, `user_name`, `email`, `password`, `hash`, `role`, `status`) VALUES
(1, '2023-11-08 14:08:12.242751', NULL, NULL, 'admin', 'mamunmiaturan@gmail.com', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', 'active'),
(2, '2023-11-09 16:07:26.563295', NULL, NULL, 'qyquj', 'pyloriko@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(3, '2023-11-09 16:08:30.983167', NULL, NULL, 'vibiquseqy', 'powu@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(4, '2023-11-09 16:08:51.922783', NULL, NULL, 'sahaj', 'fafoh@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(5, '2023-11-09 16:14:25.606995', NULL, NULL, 'denekugy', 'mesini@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(6, '2023-11-09 16:14:44.925267', NULL, NULL, 'wagap', 'taryw@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(7, '2023-11-09 16:14:58.592003', NULL, NULL, 'tyfuqu', 'dutojehet@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(8, '2023-11-09 16:18:39.274372', NULL, NULL, 'damuq', 'jefe@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(9, '2023-11-09 16:18:58.225821', NULL, NULL, 'jilikeqa', 'xisy@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(10, '2023-11-09 16:19:16.799908', NULL, NULL, 'wovyluc', 'curysemur@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(11, '2023-11-09 16:19:59.631739', NULL, NULL, 'pikew', 'cyfyrygol@mailinator.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'doctor', 'active'),
(12, '2023-11-09 16:29:29.963914', NULL, NULL, 'kyjilyti', 'catyvyny@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'patient', 'active'),
(13, '2023-11-09 16:30:05.932011', NULL, NULL, 'kedamal', 'kybil@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'patient', 'active'),
(14, '2023-11-09 16:30:18.548692', NULL, NULL, 'keqaguhuce', 'wegetad@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'patient', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_profile`
--
ALTER TABLE `admin_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_profile_blood_group_id_c4ef3e37_fk_blood_group_id` (`blood_group_id`),
  ADD KEY `admin_profile_gender_id_d9e92df4_fk_gender_id` (`gender_id`),
  ADD KEY `admin_profile_matrimony_id_28bdacac_fk_matrimony_id` (`matrimony_id`),
  ADD KEY `admin_profile_religion_id_db009fb7_fk_religion_id` (`religion_id`),
  ADD KEY `admin_profile_user_id_d54f9ef3_fk_user_id` (`user_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_created_by_id_e2143df5_fk_user_id` (`created_by_id`),
  ADD KEY `article_modified_by_id_6a87312d_fk_user_id` (`modified_by_id`);

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
-- Indexes for table `blood_group`
--
ALTER TABLE `blood_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `body_part`
--
ALTER TABLE `body_part`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_speci`
--
ALTER TABLE `department_speci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_speci_department_id_750da136_fk_department_id` (`department_id`),
  ADD KEY `department_speci_organ_problem_specif_adaa4b9d_fk_organ_pro` (`organ_problem_specification_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_division_id_1d14e452_fk_division_id` (`division_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `doctor_appointment_schedule`
--
ALTER TABLE `doctor_appointment_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_appointment_s_doctor_profile_id_e7c71ff8_fk_doctor_pr` (`doctor_profile_id`),
  ADD KEY `doctor_appointment_schedule_modified_by_id_0536e92f_fk_user_id` (`modified_by_id`),
  ADD KEY `doctor_appointment_schedule_created_by_id_07123948_fk_user_id` (`created_by_id`);

--
-- Indexes for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_awards_created_by_id_4cd1bfbe_fk_user_id` (`created_by_id`),
  ADD KEY `doctor_awards_doctor_profile_id_48d2d29b_fk_doctor_profile_id` (`doctor_profile_id`),
  ADD KEY `doctor_awards_modified_by_id_e6c328bb_fk_user_id` (`modified_by_id`);

--
-- Indexes for table `doctor_educations`
--
ALTER TABLE `doctor_educations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_educations_board_id_c79ab04b_fk_board_id` (`board_id`),
  ADD KEY `doctor_educations_doctor_profile_id_229d8373_fk_doctor_pr` (`doctor_profile_id`);

--
-- Indexes for table `doctor_profile`
--
ALTER TABLE `doctor_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_profile_blood_group_id_f58bb879_fk_blood_group_id` (`blood_group_id`),
  ADD KEY `doctor_profile_department_id_589f35c2_fk_department_id` (`department_id`),
  ADD KEY `doctor_profile_gender_id_d3822713_fk_gender_id` (`gender_id`),
  ADD KEY `doctor_profile_matrimony_id_f1f111d8_fk_matrimony_id` (`matrimony_id`),
  ADD KEY `doctor_profile_religion_id_0e65f525_fk_religion_id` (`religion_id`),
  ADD KEY `doctor_profile_user_id_422dfdfe_fk_user_id` (`user_id`);

--
-- Indexes for table `doctor_schedule_times`
--
ALTER TABLE `doctor_schedule_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_schedule_time_appointment_schedule_38f657ed_fk_doctor_ap` (`appointment_schedule_id`),
  ADD KEY `doctor_schedule_time_doctor_profile_id_1743997b_fk_doctor_pr` (`doctor_profile_id`);

--
-- Indexes for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_social_media_doctor_profile_id_b8ca1381_fk_doctor_pr` (`doctor_profile_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_created_by_id_5cb5711f_fk_user_id` (`created_by_id`),
  ADD KEY `faq_modified_by_id_393934a1_fk_user_id` (`modified_by_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_user_id_401d96d0_fk_user_id` (`user_id`);

--
-- Indexes for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrimony`
--
ALTER TABLE `matrimony`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_brand_id_29366812_fk_medicine_brand_id` (`brand_id`),
  ADD KEY `medicine_created_by_id_273e3ab9_fk_user_id` (`created_by_id`),
  ADD KEY `medicine_generic_id_df7b5970_fk_medicine_generic_id` (`generic_id`),
  ADD KEY `medicine_medicine_type_id_d22bcead_fk_medicine_type_id` (`medicine_type_id`),
  ADD KEY `medicine_modified_by_id_e885a48c_fk_user_id` (`modified_by_id`),
  ADD KEY `medicine_strength_id_88f25c4f_fk_medicine_strength_id` (`strength_id`);

--
-- Indexes for table `medicine_brand`
--
ALTER TABLE `medicine_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_generic`
--
ALTER TABLE `medicine_generic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_schedule`
--
ALTER TABLE `medicine_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_strength`
--
ALTER TABLE `medicine_strength`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_type`
--
ALTER TABLE `medicine_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `off_day`
--
ALTER TABLE `off_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `off_day_created_by_id_c32ed0b5_fk_user_id` (`created_by_id`),
  ADD KEY `off_day_doctor_profile_id_8b8c9301_fk_doctor_profile_id` (`doctor_profile_id`),
  ADD KEY `off_day_modified_by_id_1f0500c2_fk_user_id` (`modified_by_id`),
  ADD KEY `off_day_off_day_id_3f53d780_fk_days_id` (`off_day_id`);

--
-- Indexes for table `organ`
--
ALTER TABLE `organ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organ_body_part_id_5ce7bea7_fk_body_part_id` (`body_part_id`);

--
-- Indexes for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organ_problem_speci_organ_id_5e7fc6fa_fk_organ_id` (`organ_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_user_id_b2909ade_fk_user_id` (`user_id`);

--
-- Indexes for table `patient_appointment`
--
ALTER TABLE `patient_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_appointment_doctor_id_c26ad40f_fk_doctor_profile_id` (`doctor_id`),
  ADD KEY `patient_appointment_patient_id_5003de55_fk_patient_profile_id` (`patient_id`);

--
-- Indexes for table `patient_profile`
--
ALTER TABLE `patient_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_no` (`registration_no`),
  ADD KEY `patient_profile_blood_group_id_bbe75427_fk_blood_group_id` (`blood_group_id`),
  ADD KEY `patient_profile_gender_id_ab042666_fk_gender_id` (`gender_id`),
  ADD KEY `patient_profile_matrimony_id_f9d7ae97_fk_matrimony_id` (`matrimony_id`),
  ADD KEY `patient_profile_religion_id_39f046cd_fk_religion_id` (`religion_id`),
  ADD KEY `patient_profile_user_id_d58d613f_fk_user_id` (`user_id`);

--
-- Indexes for table `permanent_address`
--
ALTER TABLE `permanent_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permanent_address_permanent_district_id_d3ecbc22_fk_district_id` (`permanent_district_id`),
  ADD KEY `permanent_address_permanent_division_id_30c9f9fe_fk_division_id` (`permanent_division_id`),
  ADD KEY `permanent_address_permanent_upazila_id_d00d1369_fk_upazila_id` (`permanent_upazila_id`),
  ADD KEY `permanent_address_user_id_d9af6d04_fk_user_id` (`user_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_created_by_id_5ca4bb80_fk_user_id` (`created_by_id`),
  ADD KEY `prescription_doctor_profile_id_24965a11_fk_doctor_profile_id` (`doctor_profile_id`),
  ADD KEY `prescription_modified_by_id_d9d3b5b5_fk_user_id` (`modified_by_id`),
  ADD KEY `prescription_patient_profile_id_c74cdbe9_fk_patient_profile_id` (`patient_profile_id`);

--
-- Indexes for table `prescription_lab_test`
--
ALTER TABLE `prescription_lab_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_lab_test_created_by_id_991259a8_fk_user_id` (`created_by_id`),
  ADD KEY `prescription_lab_test_lab_test_id_02125792_fk_lab_test_id` (`lab_test_id`),
  ADD KEY `prescription_lab_test_modified_by_id_3fb9e69a_fk_user_id` (`modified_by_id`),
  ADD KEY `prescription_lab_tes_prescription_id_19d1adb9_fk_prescript` (`prescription_id`);

--
-- Indexes for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_medicine_created_by_id_eed0dc63_fk_user_id` (`created_by_id`),
  ADD KEY `prescription_medicine_medicine_id_62c1d3b0_fk_medicine_id` (`medicine_id`),
  ADD KEY `prescription_medicin_medicine_schedule_id_2d0bc243_fk_medicine_` (`medicine_schedule_id`),
  ADD KEY `prescription_medicine_modified_by_id_1f6031d2_fk_user_id` (`modified_by_id`),
  ADD KEY `prescription_medicin_prescription_id_21d51c0c_fk_prescript` (`prescription_id`);

--
-- Indexes for table `present_address`
--
ALTER TABLE `present_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `present_address_present_district_id_96ab1d03_fk_district_id` (`present_district_id`),
  ADD KEY `present_address_present_division_id_4c3ef850_fk_division_id` (`present_division_id`),
  ADD KEY `present_address_present_upazila_id_6403653a_fk_upazila_id` (`present_upazila_id`),
  ADD KEY `present_address_user_id_dfc03294_fk_user_id` (`user_id`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazila`
--
ALTER TABLE `upazila`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upazila_district_id_d82ee865_fk_district_id` (`district_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_profile`
--
ALTER TABLE `admin_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `board`
--
ALTER TABLE `board`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `body_part`
--
ALTER TABLE `body_part`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `department_speci`
--
ALTER TABLE `department_speci`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `doctor_appointment_schedule`
--
ALTER TABLE `doctor_appointment_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `doctor_educations`
--
ALTER TABLE `doctor_educations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `doctor_profile`
--
ALTER TABLE `doctor_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor_schedule_times`
--
ALTER TABLE `doctor_schedule_times`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lab_test`
--
ALTER TABLE `lab_test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrimony`
--
ALTER TABLE `matrimony`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_brand`
--
ALTER TABLE `medicine_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `medicine_generic`
--
ALTER TABLE `medicine_generic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `medicine_schedule`
--
ALTER TABLE `medicine_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine_strength`
--
ALTER TABLE `medicine_strength`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medicine_type`
--
ALTER TABLE `medicine_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `off_day`
--
ALTER TABLE `off_day`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `organ`
--
ALTER TABLE `organ`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `patient_appointment`
--
ALTER TABLE `patient_appointment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_profile`
--
ALTER TABLE `patient_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permanent_address`
--
ALTER TABLE `permanent_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_lab_test`
--
ALTER TABLE `prescription_lab_test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `present_address`
--
ALTER TABLE `present_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `religion`
--
ALTER TABLE `religion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `upazila`
--
ALTER TABLE `upazila`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_profile`
--
ALTER TABLE `admin_profile`
  ADD CONSTRAINT `admin_profile_blood_group_id_c4ef3e37_fk_blood_group_id` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_group` (`id`),
  ADD CONSTRAINT `admin_profile_gender_id_d9e92df4_fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `admin_profile_matrimony_id_28bdacac_fk_matrimony_id` FOREIGN KEY (`matrimony_id`) REFERENCES `matrimony` (`id`),
  ADD CONSTRAINT `admin_profile_religion_id_db009fb7_fk_religion_id` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`),
  ADD CONSTRAINT `admin_profile_user_id_d54f9ef3_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_created_by_id_e2143df5_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `article_modified_by_id_6a87312d_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

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
-- Constraints for table `department_speci`
--
ALTER TABLE `department_speci`
  ADD CONSTRAINT `department_speci_department_id_750da136_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `department_speci_organ_problem_specif_adaa4b9d_fk_organ_pro` FOREIGN KEY (`organ_problem_specification_id`) REFERENCES `organ_problem_speci` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_division_id_1d14e452_fk_division_id` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `doctor_appointment_schedule`
--
ALTER TABLE `doctor_appointment_schedule`
  ADD CONSTRAINT `doctor_appointment_s_doctor_profile_id_e7c71ff8_fk_doctor_pr` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `doctor_appointment_schedule_created_by_id_07123948_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_appointment_schedule_modified_by_id_0536e92f_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  ADD CONSTRAINT `doctor_awards_created_by_id_4cd1bfbe_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_awards_doctor_profile_id_48d2d29b_fk_doctor_profile_id` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `doctor_awards_modified_by_id_e6c328bb_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `doctor_educations`
--
ALTER TABLE `doctor_educations`
  ADD CONSTRAINT `doctor_educations_board_id_c79ab04b_fk_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`),
  ADD CONSTRAINT `doctor_educations_doctor_profile_id_229d8373_fk_doctor_pr` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`);

--
-- Constraints for table `doctor_profile`
--
ALTER TABLE `doctor_profile`
  ADD CONSTRAINT `doctor_profile_blood_group_id_f58bb879_fk_blood_group_id` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_group` (`id`),
  ADD CONSTRAINT `doctor_profile_department_id_589f35c2_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `doctor_profile_gender_id_d3822713_fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `doctor_profile_matrimony_id_f1f111d8_fk_matrimony_id` FOREIGN KEY (`matrimony_id`) REFERENCES `matrimony` (`id`),
  ADD CONSTRAINT `doctor_profile_religion_id_0e65f525_fk_religion_id` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`),
  ADD CONSTRAINT `doctor_profile_user_id_422dfdfe_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `doctor_schedule_times`
--
ALTER TABLE `doctor_schedule_times`
  ADD CONSTRAINT `doctor_schedule_time_appointment_schedule_38f657ed_fk_doctor_ap` FOREIGN KEY (`appointment_schedule_id`) REFERENCES `doctor_appointment_schedule` (`id`),
  ADD CONSTRAINT `doctor_schedule_time_doctor_profile_id_1743997b_fk_doctor_pr` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`);

--
-- Constraints for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  ADD CONSTRAINT `doctor_social_media_doctor_profile_id_b8ca1381_fk_doctor_pr` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_created_by_id_5cb5711f_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `faq_modified_by_id_393934a1_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_user_id_401d96d0_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine_brand_id_29366812_fk_medicine_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `medicine_brand` (`id`),
  ADD CONSTRAINT `medicine_created_by_id_273e3ab9_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medicine_generic_id_df7b5970_fk_medicine_generic_id` FOREIGN KEY (`generic_id`) REFERENCES `medicine_generic` (`id`),
  ADD CONSTRAINT `medicine_medicine_type_id_d22bcead_fk_medicine_type_id` FOREIGN KEY (`medicine_type_id`) REFERENCES `medicine_type` (`id`),
  ADD CONSTRAINT `medicine_modified_by_id_e885a48c_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medicine_strength_id_88f25c4f_fk_medicine_strength_id` FOREIGN KEY (`strength_id`) REFERENCES `medicine_strength` (`id`);

--
-- Constraints for table `off_day`
--
ALTER TABLE `off_day`
  ADD CONSTRAINT `off_day_created_by_id_c32ed0b5_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `off_day_doctor_profile_id_8b8c9301_fk_doctor_profile_id` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `off_day_modified_by_id_1f0500c2_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `off_day_off_day_id_3f53d780_fk_days_id` FOREIGN KEY (`off_day_id`) REFERENCES `days` (`id`);

--
-- Constraints for table `organ`
--
ALTER TABLE `organ`
  ADD CONSTRAINT `organ_body_part_id_5ce7bea7_fk_body_part_id` FOREIGN KEY (`body_part_id`) REFERENCES `body_part` (`id`);

--
-- Constraints for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  ADD CONSTRAINT `organ_problem_speci_organ_id_5e7fc6fa_fk_organ_id` FOREIGN KEY (`organ_id`) REFERENCES `organ` (`id`);

--
-- Constraints for table `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `otp_user_id_b2909ade_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `patient_appointment`
--
ALTER TABLE `patient_appointment`
  ADD CONSTRAINT `patient_appointment_doctor_id_c26ad40f_fk_doctor_profile_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `patient_appointment_patient_id_5003de55_fk_patient_profile_id` FOREIGN KEY (`patient_id`) REFERENCES `patient_profile` (`id`);

--
-- Constraints for table `patient_profile`
--
ALTER TABLE `patient_profile`
  ADD CONSTRAINT `patient_profile_blood_group_id_bbe75427_fk_blood_group_id` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_group` (`id`),
  ADD CONSTRAINT `patient_profile_gender_id_ab042666_fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `patient_profile_matrimony_id_f9d7ae97_fk_matrimony_id` FOREIGN KEY (`matrimony_id`) REFERENCES `matrimony` (`id`),
  ADD CONSTRAINT `patient_profile_religion_id_39f046cd_fk_religion_id` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`),
  ADD CONSTRAINT `patient_profile_user_id_d58d613f_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `permanent_address`
--
ALTER TABLE `permanent_address`
  ADD CONSTRAINT `permanent_address_permanent_district_id_d3ecbc22_fk_district_id` FOREIGN KEY (`permanent_district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `permanent_address_permanent_division_id_30c9f9fe_fk_division_id` FOREIGN KEY (`permanent_division_id`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `permanent_address_permanent_upazila_id_d00d1369_fk_upazila_id` FOREIGN KEY (`permanent_upazila_id`) REFERENCES `upazila` (`id`),
  ADD CONSTRAINT `permanent_address_user_id_d9af6d04_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_created_by_id_5ca4bb80_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_doctor_profile_id_24965a11_fk_doctor_profile_id` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `prescription_modified_by_id_d9d3b5b5_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_patient_profile_id_c74cdbe9_fk_patient_profile_id` FOREIGN KEY (`patient_profile_id`) REFERENCES `patient_profile` (`id`);

--
-- Constraints for table `prescription_lab_test`
--
ALTER TABLE `prescription_lab_test`
  ADD CONSTRAINT `prescription_lab_tes_prescription_id_19d1adb9_fk_prescript` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`),
  ADD CONSTRAINT `prescription_lab_test_created_by_id_991259a8_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_lab_test_lab_test_id_02125792_fk_lab_test_id` FOREIGN KEY (`lab_test_id`) REFERENCES `lab_test` (`id`),
  ADD CONSTRAINT `prescription_lab_test_modified_by_id_3fb9e69a_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `prescription_medicine`
--
ALTER TABLE `prescription_medicine`
  ADD CONSTRAINT `prescription_medicin_medicine_schedule_id_2d0bc243_fk_medicine_` FOREIGN KEY (`medicine_schedule_id`) REFERENCES `medicine_schedule` (`id`),
  ADD CONSTRAINT `prescription_medicin_prescription_id_21d51c0c_fk_prescript` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`),
  ADD CONSTRAINT `prescription_medicine_created_by_id_eed0dc63_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_medicine_medicine_id_62c1d3b0_fk_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  ADD CONSTRAINT `prescription_medicine_modified_by_id_1f6031d2_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `present_address`
--
ALTER TABLE `present_address`
  ADD CONSTRAINT `present_address_present_district_id_96ab1d03_fk_district_id` FOREIGN KEY (`present_district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `present_address_present_division_id_4c3ef850_fk_division_id` FOREIGN KEY (`present_division_id`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `present_address_present_upazila_id_6403653a_fk_upazila_id` FOREIGN KEY (`present_upazila_id`) REFERENCES `upazila` (`id`),
  ADD CONSTRAINT `present_address_user_id_dfc03294_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `upazila`
--
ALTER TABLE `upazila`
  ADD CONSTRAINT `upazila_district_id_d82ee865_fk_district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
