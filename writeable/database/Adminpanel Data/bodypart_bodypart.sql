-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 07:23 PM
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
-- Table structure for table `bodypart_bodypart`
--

CREATE TABLE `bodypart_bodypart` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bodypart_bodypart`
--

INSERT INTO `body_part` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Head (মাথা)', 'This includes the skull, brain, eyes, ears, nose, and mouth. (এটি ক্রানিয়াম, মস্তিষ্ক, চোখ, কান, নাক এবং মুখ অন্তর্ভুক্ত।)', '2023-08-16 16:18:47.181475', NULL, NULL),
(2, 'Neck (গলা)', 'Connects the head to the rest of the body and contains important structures like the throat and neck muscles. (মাথা থেকে বাকি শরীরে যোগ করে এবং গলায় মহত্তম ধরনে গঠিত হতে থাকে, যেখানে জিবক এবং গলা মাংস অবস্থিত থাকে।)', '2023-08-16 16:19:05.773641', NULL, NULL),
(3, 'Torso or Trunk (বডি বা ট্রাঙ্ক)', 'This is the main part of the body, consisting of the chest, abdomen, and back. (এটি শরীরের প্রধান অংশ, যা বুক, পেট এবং পিঠ অন্তর্ভুক্ত।)', '2023-08-16 16:19:22.580351', NULL, NULL),
(4, 'Upper Limbs (উপরের অংশ)', 'These are the arms and hands, including the shoulder, upper arm, forearm, wrist, and fingers. (এটি হাত এবং হাতের অংশ, যেমন মাংস পিছন দিক, উপরোক্ত বাহু, উপরোক্ত হাত এবং আঙ্গুল অন্তর্ভুক্ত।)', '2023-08-16 16:19:37.531450', NULL, NULL),
(5, 'Lower Limbs (নিচের অংশ)', 'These are the legs and feet, including the hip, thigh, lower leg, ankle, and toes. (এটি পা এবং পায়ের অংশ, যেমন কোমর, পায়ের উপরোক্ত অংশ, পায়ের নিচু অংশ এবং পায়ের আঙ্গুল অন্তর্ভুক্ত।)', '2023-08-16 16:20:04.756456', NULL, NULL),
(6, 'Thorax (থোরেক্স)', 'The area between the neck and abdomen, housing important organs like the heart and lungs. (মাথা এবং পেটের মধ্যবর্তী অংশ, যেখানে হৃদয় এবং ফুসফুস প্রধান অঙ্গ।)', '2023-08-16 16:20:15.903351', NULL, NULL),
(7, 'Abdomen (পেট)', 'The area between the thorax and pelvis, containing organs such as the stomach, liver, intestines, and kidneys. (থোরেক্স এবং কোমরের মধ্যের অংশ, যেখানে পাচক অবয়ব সহ অন্যান্য গুরুত্বপূর্ণ অঙ্গ অবস্থিত।)', '2023-08-16 16:20:48.681571', NULL, NULL),
(8, 'Pelvis (প্যালভিস)', 'The bony structure at the base of the spine, supporting the lower part of the body and containing the reproductive organs and bladder. (মেডোয়ের স্ত্রী জননী অঙ্গ এবং মূত্রবাহিনী অন্তর্ভুক্ত এই হল কোণিকা ধারণ করে, যা শরীরের তলদিকে অবস্থিত।)', '2023-08-16 16:21:00.335954', NULL, NULL),
(9, 'Back (পিঠ)', 'The posterior aspect of the body, including the spine and associated muscles. (শরীরের পশ্চিমাংশ, স্পাইন এবং সহযোগী মাংস অন্তর্ভুক্ত।)', '2023-08-16 16:21:13.260970', NULL, NULL),
(10, 'Muscles (পেশি)', 'These are found throughout the body and are responsible for movement and support. (এগুলি শরীরের সারাংশে পাওয়া যায় এবং চলাচল এবং সমর্থনের জন্য জরুরি।)', '2023-08-16 16:21:26.155763', NULL, NULL),
(11, 'Skeleton (আস্থি)', 'The framework of bones that provides structure and protection for the body\'s organs. (অঙ্গগুলির কাঠামো, যা শরীরের অঙ্গগুলির জন্য স্ট্রাকচার এবং রক্ষা সরঞ্জাম প্রদান করে।)', '2023-08-16 16:21:37.610542', NULL, NULL),
(12, 'Skin (চামড়া)', 'The body\'s largest organ, providing a protective barrier and helping regulate temperature. (শরীরের সর্ববৃহৎ অঙ্গ, যা একটি রক্ষণাত্মক বিভাগ প্রদান করে এবং তাপমাত্রা নিয়ন্ত্রণ করতে সাহায্য করে।)', '2023-08-16 16:21:49.187009', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodypart_bodypart`
--
ALTER TABLE `bodypart_bodypart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bodypart_bodypart`
--
ALTER TABLE `bodypart_bodypart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
