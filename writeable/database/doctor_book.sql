-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2023 at 07:35 PM
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
-- Table structure for table `article`
--

CREATE TABLE `article` (
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

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `heading`, `tag`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`, `created_by_id`, `modified_by_id`) VALUES
(1, 'Recognizing the Signs of a Heart Attack: A Life-Saving Guide', 'Medical', 'In the quiet town of Oakridge, Sarah, a 55-year-old grandmother, was enjoying a leisurely afternoon in her garden. As she tended to her blooming roses, she suddenly felt a discomfort in her chest. It was a feeling she hadn\'t experienced before, and it left her feeling uneasy.\r\n\r\nSarah sat down on a nearby bench, hoping the discomfort would pass. But within minutes, the sensation intensified. It felt like a heavy pressure on her chest, and she began to feel lightheaded. She knew something was wrong.\r\n\r\nRecognizing the potential severity of her symptoms, Sarah immediately reached for her phone and dialed 911. She described her chest pain and the accompanying symptoms to the dispatcher, who assured her that help was on the way.\r\n\r\nWithin minutes, paramedics arrived at Sarah\'s home and quickly assessed her condition. They confirmed that she was having a heart attack and administered life-saving treatment. Sarah was rushed to the local hospital, where doctors performed an emergency procedure to clear the blockage in her coronary artery.\r\n\r\nThanks to her quick action and the timely response of emergency medical services, Sarah\'s life was saved. She had recognized the signs of a heart attack and knew that seeking help immediately was crucial.\r\n\r\nThis scenario highlights the importance of knowing the signs of a heart attack, which can include chest pain or discomfort, lightheadedness, shortness of breath, and pain radiating to the arm, neck, jaw, or back. Recognizing these symptoms and calling 911 without delay can make all the difference in saving a life.\r\n\r\nRemember, if you or someone you know experiences symptoms suggestive of a heart attack, don\'t hesitate to seek emergency medical assistance. Quick action can mean the difference between life and death.\r\n\r\nThis scenario-based article emphasizes the importance of recognizing the signs of a heart attack and taking prompt action, which is crucial for saving lives in such critical situations.', 'static/uploads/article_images/20230904142211_istockphoto-1032637132-612x612.jpg', '2023-09-04 08:22:11.723880', NULL, NULL, 1, NULL),
(2, 'A Day in the Life of a Pediatric Nurse: Nurturing Young Hearts', 'Medical', 'In the bustling pediatric ward of St. Grace Hospital, Nurse Emily begins her day with a warm smile. She knows that today\'s shift will be filled with the laughter and tears of young patients, each with their unique story.\r\n\r\nAs she enters Room 203, Emily is greeted by Lily, a 6-year-old girl with a bright pink cast on her arm. Lily broke her arm while playing on the playground, and she\'s feeling a mix of discomfort and curiosity. Emily kneels down to Lily\'s eye level and explains the process of cast care. She reassures the young girl that she\'ll be back with some colorful stickers to decorate her cast.\r\n\r\nDown the hall, in Room 205, is Max, a 4-year-old boy with a high fever and a worried expression. Emily takes his temperature and listens to his chest, all while making funny faces to ease his anxiety. She explains to Max\'s parents that he has a viral infection and offers guidance on managing his symptoms at home.\r\n\r\nIn Room 210, Emily finds 8-year-old Sophia, who is preparing for surgery to remove her appendix. Sophia is understandably nervous, and Emily takes the time to answer her questions and introduce her to the surgical team. With a teddy bear in hand, Sophia heads to the operating room, comforted by Emily\'s presence.\r\n\r\nThroughout the day, Emily administers medications, changes dressings, and offers emotional support to her young patients and their families. She knows that pediatric nursing isn\'t just about treating illnesses; it\'s about providing comfort, reassurance, and a caring touch.\r\n\r\nAs Emily wraps up her shift, she reflects on the fulfilling moments of the day. From helping a child conquer their fear of needles to witnessing the resilient spirit of young patients, she knows that being a pediatric nurse is a privilege. It\'s about nurturing not only their bodies but also their young hearts and spirits.\r\n\r\nIn the world of pediatric nursing, every day brings new challenges and rewards. For Emily, it\'s a calling that reminds her of the importance of compassion, patience, and the healing power of a kind smile.\r\n\r\nThis scenario-based article provides a glimpse into the life of a pediatric nurse, highlighting the compassion and dedication required to care for young patients and their families in a healthcare setting. It emphasizes the crucial role of pediatric nurses in providing both medical care and emotional support to children.', 'static/uploads/article_images/20230904142453_download.jpeg', '2023-09-04 08:24:53.217418', NULL, NULL, 1, NULL),
(3, 'A Journey to Recovery: Overcoming Addiction', 'Medical', 'In a quiet corner of the bustling city, Alex, a 32-year-old software engineer, had been battling a hidden demon for years. His struggle with addiction had taken a toll on his health, relationships, and career. But one fateful day, he made a life-changing decision.\r\n\r\nAlex recognized that his addiction to opioids had spiraled out of control. He had reached a point where he could no longer deny the devastating impact it had on his life. With the support of his family, he took the courageous step of seeking help.\r\n\r\nHis journey to recovery began with a phone call to a local addiction treatment center. The voice on the other end offered reassurance and guidance. Alex was admitted for a comprehensive assessment, where healthcare professionals evaluated his physical and psychological health.\r\n\r\nOver the coming weeks, Alex underwent detoxification under medical supervision to safely withdraw from the drugs. He experienced challenging withdrawal symptoms but remained determined. Therapy sessions, both individual and group, helped him address the underlying issues contributing to his addiction.\r\n\r\nAs he progressed in his recovery, Alex learned coping strategies and relapse prevention techniques. He also found solace in a supportive community of fellow individuals in recovery who shared their stories and offered encouragement.\r\n\r\nMonths turned into years, and Alex\'s life transformed. He mended broken relationships, rekindled his passion for programming, and became a beacon of hope for others struggling with addiction. He now volunteers at the same treatment center that helped him, guiding others on their path to recovery.\r\n\r\nAlex\'s journey highlights the power of resilience and the possibility of overcoming addiction with the right support and determination. Addiction is a complex medical condition, but with professional treatment, therapy, and a strong support system, recovery is attainable.\r\n\r\nIf you or someone you know is battling addiction, remember that seeking help is a courageous first step toward a healthier, happier life.\r\n\r\nThis scenario-based article tells the story of a person\'s journey to recovery from addiction, emphasizing the importance of seeking help, the role of professional treatment, and the possibility of reclaiming one\'s life from the grip of addiction.', 'static/uploads/article_images/20230904142753_istockphoto-1181387462-612x612.jpg', '2023-09-04 08:27:53.739609', NULL, NULL, 1, NULL);

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
(41, 'Can add board', 11, 'add_board'),
(42, 'Can change board', 11, 'change_board'),
(43, 'Can delete board', 11, 'delete_board'),
(44, 'Can view board', 11, 'view_board'),
(45, 'Can add doctor_ profile', 12, 'add_doctor_profile'),
(46, 'Can change doctor_ profile', 12, 'change_doctor_profile'),
(47, 'Can delete doctor_ profile', 12, 'delete_doctor_profile'),
(48, 'Can view doctor_ profile', 12, 'view_doctor_profile'),
(49, 'Can add social_ media', 13, 'add_social_media'),
(50, 'Can change social_ media', 13, 'change_social_media'),
(51, 'Can delete social_ media', 13, 'delete_social_media'),
(52, 'Can view social_ media', 13, 'view_social_media'),
(53, 'Can add services', 14, 'add_services'),
(54, 'Can change services', 14, 'change_services'),
(55, 'Can delete services', 14, 'delete_services'),
(56, 'Can view services', 14, 'view_services'),
(57, 'Can add present address', 15, 'add_presentaddress'),
(58, 'Can change present address', 15, 'change_presentaddress'),
(59, 'Can delete present address', 15, 'delete_presentaddress'),
(60, 'Can view present address', 15, 'view_presentaddress'),
(61, 'Can add permanent address', 16, 'add_permanentaddress'),
(62, 'Can change permanent address', 16, 'change_permanentaddress'),
(63, 'Can delete permanent address', 16, 'delete_permanentaddress'),
(64, 'Can view permanent address', 16, 'view_permanentaddress'),
(65, 'Can add images', 17, 'add_images'),
(66, 'Can change images', 17, 'change_images'),
(67, 'Can delete images', 17, 'delete_images'),
(68, 'Can view images', 17, 'view_images'),
(69, 'Can add education', 18, 'add_education'),
(70, 'Can change education', 18, 'change_education'),
(71, 'Can delete education', 18, 'delete_education'),
(72, 'Can view education', 18, 'view_education'),
(73, 'Can add awards', 19, 'add_awards'),
(74, 'Can change awards', 19, 'change_awards'),
(75, 'Can delete awards', 19, 'delete_awards'),
(76, 'Can view awards', 19, 'view_awards'),
(77, 'Can add availability', 20, 'add_availability'),
(78, 'Can change availability', 20, 'change_availability'),
(79, 'Can delete availability', 20, 'delete_availability'),
(80, 'Can view availability', 20, 'view_availability'),
(81, 'Can add faq', 21, 'add_faq'),
(82, 'Can change faq', 21, 'change_faq'),
(83, 'Can delete faq', 21, 'delete_faq'),
(84, 'Can view faq', 21, 'view_faq'),
(85, 'Can add organ', 22, 'add_organ'),
(86, 'Can change organ', 22, 'change_organ'),
(87, 'Can delete organ', 22, 'delete_organ'),
(88, 'Can view organ', 22, 'view_organ'),
(89, 'Can add organs problem specification', 23, 'add_organsproblemspecification'),
(90, 'Can change organs problem specification', 23, 'change_organsproblemspecification'),
(91, 'Can delete organs problem specification', 23, 'delete_organsproblemspecification'),
(92, 'Can view organs problem specification', 23, 'view_organsproblemspecification'),
(93, 'Can add patient_ profile', 24, 'add_patient_profile'),
(94, 'Can change patient_ profile', 24, 'change_patient_profile'),
(95, 'Can delete patient_ profile', 24, 'delete_patient_profile'),
(96, 'Can view patient_ profile', 24, 'view_patient_profile'),
(97, 'Can add blood_ group', 25, 'add_blood_group'),
(98, 'Can change blood_ group', 25, 'change_blood_group'),
(99, 'Can delete blood_ group', 25, 'delete_blood_group'),
(100, 'Can view blood_ group', 25, 'view_blood_group'),
(101, 'Can add district', 26, 'add_district'),
(102, 'Can change district', 26, 'change_district'),
(103, 'Can delete district', 26, 'delete_district'),
(104, 'Can view district', 26, 'view_district'),
(105, 'Can add division', 27, 'add_division'),
(106, 'Can change division', 27, 'change_division'),
(107, 'Can delete division', 27, 'delete_division'),
(108, 'Can view division', 27, 'view_division'),
(109, 'Can add gender', 28, 'add_gender'),
(110, 'Can change gender', 28, 'change_gender'),
(111, 'Can delete gender', 28, 'delete_gender'),
(112, 'Can view gender', 28, 'view_gender'),
(113, 'Can add matrimony', 29, 'add_matrimony'),
(114, 'Can change matrimony', 29, 'change_matrimony'),
(115, 'Can delete matrimony', 29, 'delete_matrimony'),
(116, 'Can view matrimony', 29, 'view_matrimony'),
(117, 'Can add religion', 30, 'add_religion'),
(118, 'Can change religion', 30, 'change_religion'),
(119, 'Can delete religion', 30, 'delete_religion'),
(120, 'Can view religion', 30, 'view_religion'),
(121, 'Can add upazila', 31, 'add_upazila'),
(122, 'Can change upazila', 31, 'change_upazila'),
(123, 'Can delete upazila', 31, 'delete_upazila'),
(124, 'Can view upazila', 31, 'view_upazila'),
(125, 'Can add user', 32, 'add_user'),
(126, 'Can change user', 32, 'change_user'),
(127, 'Can delete user', 32, 'delete_user'),
(128, 'Can view user', 32, 'view_user'),
(129, 'Can add varify otp', 33, 'add_varifyotp'),
(130, 'Can change varify otp', 33, 'change_varifyotp'),
(131, 'Can delete varify otp', 33, 'delete_varifyotp'),
(132, 'Can view varify otp', 33, 'view_varifyotp'),
(133, 'Can add board', 34, 'add_board'),
(134, 'Can change board', 34, 'change_board'),
(135, 'Can delete board', 34, 'delete_board'),
(136, 'Can view board', 34, 'view_board'),
(137, 'Can add images', 35, 'add_images'),
(138, 'Can change images', 35, 'change_images'),
(139, 'Can delete images', 35, 'delete_images'),
(140, 'Can view images', 35, 'view_images'),
(141, 'Can add permanent address', 36, 'add_permanentaddress'),
(142, 'Can change permanent address', 36, 'change_permanentaddress'),
(143, 'Can delete permanent address', 36, 'delete_permanentaddress'),
(144, 'Can view permanent address', 36, 'view_permanentaddress'),
(145, 'Can add present address', 37, 'add_presentaddress'),
(146, 'Can change present address', 37, 'change_presentaddress'),
(147, 'Can delete present address', 37, 'delete_presentaddress'),
(148, 'Can view present address', 37, 'view_presentaddress');

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

-- --------------------------------------------------------

--
-- Table structure for table `bodypart`
--

CREATE TABLE `bodypart` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bodypart`
--

INSERT INTO `bodypart` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ophthalmology', 'N/A', '2023-06-27 15:31:23.024744', '2023-09-04 10:55:42.238866', NULL),
(2, 'Radiology', 'Radiology is the medical discipline that uses medical imaging to diagnose diseases and guide their treatment, within the bodies of humans and other animals', '2023-06-27 15:31:51.912129', NULL, NULL),
(3, 'Orthopedic', 'Orthopedic surgery or orthopedics, is the branch of surgery concerned with conditions involving the musculoskeletal system. Orthopedic surgeons use both surgical and nonsurgical means to treat musculoskeletal trauma, spine diseases, sports injuries, degenerative diseases, infections, tumors, and congenital disorders', '2023-06-27 15:37:36.134056', NULL, NULL),
(4, 'Neurology', 'Neurology is the branch of medicine dealing with the diagnosis and treatment of all categories of conditions and disease involving the nervous system, which comprises the brain, the spinal cord and the peripheral nerves', '2023-06-27 15:37:56.654819', NULL, NULL),
(5, 'Intensive care medicine', 'Intensive care medicine, also called critical care medicine, is a medical specialty that deals with seriously or critically ill patients who have, are at risk of, or are recovering from conditions that may be life-threatening.', '2023-06-27 15:38:29.445529', NULL, NULL),
(6, 'Gastroenterology', 'Gastroenterology is the branch of medicine focused on the digestive system and its disorders. The digestive system consists of the gastrointestinal tract, sometimes referred to as the GI tract', '2023-06-27 15:38:52.349986', NULL, NULL),
(7, 'Outpatient Department', 'An outpatient department or outpatient clinic is the part of a hospital designed for the treatment of outpatients, people with health problems who visit the hospital for diagnosis or treatment, but do not at this time require a bed or to be admitted for overnight care', '2023-06-27 15:39:16.256063', NULL, NULL),
(8, 'Obstetrics and Gynaecology', 'Obstetrics and Gynaecology is the medical specialty that encompasses the two subspecialties of obstetrics and gynecology.', '2023-06-27 15:39:40.515379', NULL, NULL),
(9, 'Otolaryngology logy', 'Otolaryngology logy is a surgical sub speciality within medicine that deals with the surgical and medical management of conditions of the head and neck. Doctors who specialize in this area are called otorhinolaryngologists, otolaryngologists, head and neck surgeons, or ENT surgeons or physicians', '2023-06-27 15:39:57.423909', NULL, NULL),
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
-- Table structure for table `department_speci`
--

CREATE TABLE `department_speci` (
  `id` bigint(20) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `organ_problem_specification_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_speci`
--

INSERT INTO `department_speci` (`id`, `description`, `created_at`, `updated_at`, `deleted_at`, `department_id`, `organ_problem_specification_id`) VALUES
(1, 'N/A', '2023-09-04 10:35:26.108647', '2023-09-04 10:36:08.939604', NULL, 4, 7),
(2, 'N/A', '2023-09-04 10:35:37.448250', NULL, NULL, 4, 6),
(3, 'N/A', '2023-09-04 10:35:57.376782', NULL, NULL, 4, 9),
(4, 'N/A', '2023-09-04 10:36:28.292374', '2023-09-04 10:36:55.711912', NULL, 4, 8),
(5, 'N/A', '2023-09-04 10:36:38.250007', NULL, NULL, 4, 10),
(6, 'N/A', '2023-09-04 10:56:08.454697', NULL, NULL, 1, 11),
(7, 'N/A', '2023-09-04 10:56:17.118455', NULL, NULL, 1, 12),
(8, 'N/A', '2023-09-04 10:56:26.634610', '2023-09-04 10:56:59.388091', NULL, 1, 13),
(9, 'N/A', '2023-09-04 10:56:34.537201', NULL, NULL, 1, 14),
(10, 'N/A', '2023-09-04 10:56:42.672019', NULL, NULL, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `division_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `division_id`) VALUES
(1, 'Joypurhat District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(2, 'Bogura District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(3, 'Naogaon District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(4, 'Natore District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(5, 'NawabganjDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(6, 'Pabna District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(7, 'Sirajganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(8, 'Rajshahi District', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(9, 'Dinajpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(10, 'Gaibandha District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(11, 'Kurigram District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(12, 'Lalmonirhat District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(13, 'Nilphamari District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(14, 'Panchagarh District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(15, 'Rangpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(16, 'Thakurgaon District', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(17, 'Netrokona District', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(18, 'Sherpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(19, 'Jamalpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(20, 'Mymensingh District', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(21, 'Barguna District', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(22, 'BarishalDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(23, 'Bhola District', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(24, 'Jhalokati District', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(25, 'Patuakhali District', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(26, 'Pirojpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(27, 'Bandarban District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(28, 'Brahmanbaria District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(29, 'Chandpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(30, 'ChattogramDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(31, 'CumillaDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(32, 'Cox Bazar District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(33, 'Feni District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(34, 'Khagrachhari District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(35, 'Lakshmipur District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(36, 'Noakhali District', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(37, 'RangamatiDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(38, 'Dhaka District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(39, 'Gazipur District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(40, 'GopalganjDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(41, 'Kishoreganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(42, 'Madaripur District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(43, 'Manikganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(44, 'Munshiganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(45, 'Narayanganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(46, 'Rajbari District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(47, 'Shariatpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(48, 'Faridpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(49, 'Tangail District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(50, 'Narsingdi District', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(51, 'Bagerhat District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(52, 'Chuadanga District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(53, 'JashoreDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(54, 'JhenaidaDistrict', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(55, 'Khulna District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(56, 'Kushtia District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(57, 'Magura District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(58, 'Meherpur District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(59, 'Narail District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(60, 'Satkhira District', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(61, 'Habiganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(62, 'Moulvibazar District', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(63, 'Sunamganj District', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(64, 'Sylhet District', '2023-07-18 02:29:37.183232', NULL, NULL, 8);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rajshahi Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(2, 'Rangpur Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(3, 'Mymensingh Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(4, 'Barishal Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(5, 'Chattogram Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(6, 'Dhaka Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(7, 'Khulna Division', '2023-07-18 02:29:37.183232', NULL, NULL),
(8, 'Sylhet Division', '2023-07-18 02:29:37.183232', NULL, NULL);

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
(7, 'article', 'article'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'bodypart', 'bodypart'),
(5, 'contenttypes', 'contenttype'),
(9, 'department', 'department'),
(10, 'department_speci', 'departmentspecification'),
(20, 'doctor', 'availability'),
(19, 'doctor', 'awards'),
(11, 'doctor', 'board'),
(12, 'doctor', 'doctor_profile'),
(18, 'doctor', 'education'),
(17, 'doctor', 'images'),
(16, 'doctor', 'permanentaddress'),
(15, 'doctor', 'presentaddress'),
(14, 'doctor', 'services'),
(13, 'doctor', 'social_media'),
(21, 'faq', 'faq'),
(22, 'organ', 'organ'),
(23, 'organ_problem_speci', 'organsproblemspecification'),
(24, 'patient', 'patient_profile'),
(25, 'personal_data', 'blood_group'),
(34, 'personal_data', 'board'),
(26, 'personal_data', 'district'),
(27, 'personal_data', 'division'),
(28, 'personal_data', 'gender'),
(29, 'personal_data', 'matrimony'),
(30, 'personal_data', 'religion'),
(31, 'personal_data', 'upazila'),
(6, 'sessions', 'session'),
(35, 'user', 'images'),
(36, 'user', 'permanentaddress'),
(37, 'user', 'presentaddress'),
(32, 'user', 'user'),
(33, 'verifyotp', 'varifyotp');

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
(1, 'contenttypes', '0001_initial', '2023-08-16 10:42:35.092905'),
(2, 'auth', '0001_initial', '2023-08-16 10:42:40.226177'),
(3, 'admin', '0001_initial', '2023-08-16 10:42:40.922397'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-16 10:42:40.974369'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-16 10:42:41.038463'),
(6, 'user', '0001_initial', '2023-08-16 10:42:41.874434'),
(7, 'article', '0001_initial', '2023-08-16 10:42:42.955742'),
(8, 'contenttypes', '0002_remove_content_type_name', '2023-08-16 10:42:44.188819'),
(9, 'auth', '0002_alter_permission_name_max_length', '2023-08-16 10:42:44.624470'),
(10, 'auth', '0003_alter_user_email_max_length', '2023-08-16 10:42:44.756387'),
(11, 'auth', '0004_alter_user_username_opts', '2023-08-16 10:42:44.818559'),
(12, 'auth', '0005_alter_user_last_login_null', '2023-08-16 10:42:45.061446'),
(13, 'auth', '0006_require_contenttypes_0002', '2023-08-16 10:42:45.081996'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2023-08-16 10:42:45.158857'),
(15, 'auth', '0008_alter_user_username_max_length', '2023-08-16 10:42:45.220761'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2023-08-16 10:42:45.328999'),
(17, 'auth', '0010_alter_group_name_max_length', '2023-08-16 10:42:45.476516'),
(18, 'auth', '0011_update_proxy_permissions', '2023-08-16 10:42:45.512771'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2023-08-16 10:42:45.597873'),
(20, 'bodypart', '0001_initial', '2023-08-16 10:42:45.827511'),
(21, 'department', '0001_initial', '2023-08-16 10:42:46.014565'),
(22, 'organ', '0001_initial', '2023-08-16 10:42:46.639665'),
(23, 'organ_problem_speci', '0001_initial', '2023-08-16 10:42:47.789228'),
(24, 'department_speci', '0001_initial', '2023-08-16 10:42:48.504028'),
(25, 'personal_data', '0001_initial', '2023-08-16 10:42:51.661222'),
(26, 'doctor', '0001_initial', '2023-08-16 10:43:03.456404'),
(27, 'faq', '0001_initial', '2023-08-16 10:43:04.632804'),
(28, 'patient', '0001_initial', '2023-08-16 10:43:06.946116'),
(29, 'sessions', '0001_initial', '2023-08-16 10:43:07.365166'),
(30, 'verifyotp', '0001_initial', '2023-08-16 10:43:07.859060'),
(31, 'personal_data', '0002_board', '2023-08-19 06:14:38.901427'),
(32, 'doctor', '0002_alter_doctor_profile_languages_spoken_and_more', '2023-08-19 06:14:40.231704'),
(33, 'article', '0002_alter_article_table', '2023-09-04 16:49:41.242322'),
(34, 'bodypart', '0002_alter_bodypart_table', '2023-09-04 16:55:28.721275'),
(35, 'department', '0002_alter_department_table', '2023-09-04 16:55:28.772088'),
(36, 'department_speci', '0002_alter_departmentspecification_table', '2023-09-04 16:55:28.832532'),
(37, 'faq', '0002_alter_faq_table', '2023-09-04 16:55:28.892051'),
(38, 'organ', '0002_alter_organ_table', '2023-09-04 16:55:28.952102'),
(39, 'organ_problem_speci', '0002_alter_organsproblemspecification_table', '2023-09-04 16:55:29.002078'),
(40, 'patient', '0002_alter_patient_profile_table', '2023-09-04 16:55:29.076213'),
(41, 'personal_data', '0003_alter_blood_group_table_alter_board_table_and_more', '2023-09-04 16:55:29.536803'),
(42, 'user', '0002_alter_user_table', '2023-09-04 16:55:29.584606'),
(43, 'verifyotp', '0002_alter_varifyotp_table', '2023-09-04 16:55:29.785730'),
(44, 'user', '0003_presentaddress_permanentaddress_images', '2023-09-04 17:34:09.751110');

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
('09xx9us9mzhtalsm1r142yw67442yhbj', '.eJxlzbEKgDAMBNB_ySyCjk7-iYQaJWBSSVNBxH-3iou4HY_j7gAnWYeNjKd9IEFeoANBySqMng21n2-tQxSoPm0eoWsryInsyc2bFYXKCI7CCq9ZXH6WvBykW4PzRnBeM3IyIw:1qWE1X:ZQFHey8-M-c1I6XmuqPEhBNDoLPHtQD45bVod7-YE5I', '2023-08-30 10:45:11.209819'),
('0soo3pfdxlh7pk4pzmiuqik834ut8az7', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qWw5P:wtoACXksxxiTJ65f6Up6K9cRYfOES-H8X3PPaZlFpBU', '2023-09-01 09:48:07.124309'),
('4570uspz3h2jywoavqfezckmx1xl570w', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qd8QX:v-P-bSVglc3MI2b3DYPxSDgY5mrX5TCkZVEOieeO0z4', '2023-09-18 12:11:33.146863'),
('7350r4pszkiin21xu1nj1q2trkomzh8h', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qd3Te:ambAAtuvHZc223s_9C3IGWFN-T5gyuwlPh2Inu60efQ', '2023-09-18 06:54:26.419538'),
('dgp7431x6fr7vumr7r5ocbphsnlrsshb', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qdDFG:SqWC5UTnOmtcBkmaCZfBeVZN9gHCE3DC5L4965t3s70', '2023-09-18 17:20:14.888021'),
('ffae77oscd1hyrxj6mogrkbnxqbf7f9m', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qd6pm:0ylwRJmEK3978MlVwEpEbiTD-u8Yf17JyRjrW496hPo', '2023-09-18 10:29:30.839048'),
('pehr6wu8wsod8f5b5hfp7vvir1ufvbta', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qWJBj:62iQqBQy2GCs676M9JjWczSk_qhOA-bMtTQJdy_2CBk', '2023-08-30 16:16:03.613003'),
('psquq20915s8p3ko9hj4ldf186xi8x5n', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qWECM:9XZj9sddn7WDqsee0fKQ2w0ufDeY1mntuuxvNuHIxNI', '2023-08-30 10:56:22.274753'),
('u1b3u0tm8580rhga512114l7f82hkz6r', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qXDL9:pD7ZO_Z9vHifYgZWRbKz5J7BLL2nNH8p1O2xraz8Bv8', '2023-09-02 04:13:31.037212'),
('w2o2ke4i8jc8wqlme3pjin068jzxsmce', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qd3Mn:RXaqbi0023gAJFXl2qqqqvXre0z4EF2awnaR0Jnb0rM', '2023-09-18 06:47:21.901760'),
('xadz09mtvh134cxe1klcq7krrauw180o', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qdDFz:6dSLQY6mnf22Ilf812zC6Qld7w33BZXNl0vO-tAtWsA', '2023-09-18 17:20:59.792933'),
('y87q24mlhmngogo0b4gok4ga0jv0eaf4', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_OUoGJF-TkYYsUliSWlxSDR5JLMslSlWgDmWxo8:1qWwIy:bBrAayc3cJHVqfRrsgf50GmvnkiGw0RkMwWL0CEtTDE', '2023-09-01 10:02:08.329451');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_availability`
--

CREATE TABLE `doctor_availability` (
  `id` bigint(20) NOT NULL,
  `appointment_availability` varchar(255) DEFAULT NULL,
  `accepting_new_patients` varchar(255) DEFAULT NULL,
  `average_wait_time` varchar(255) DEFAULT NULL,
  `consultation_fee` decimal(10,2) DEFAULT NULL,
  `available_facilities` varchar(255) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_availability`
--

INSERT INTO `doctor_availability` (`id`, `appointment_availability`, `accepting_new_patients`, `average_wait_time`, `consultation_fee`, `available_facilities`, `doctor_profile_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_awards`
--

CREATE TABLE `doctor_awards` (
  `id` bigint(20) NOT NULL,
  `awards_and_honors` varchar(255) DEFAULT NULL,
  `publications` varchar(255) DEFAULT NULL,
  `memberships` varchar(255) DEFAULT NULL,
  `board_certification_number` varchar(255) DEFAULT NULL,
  `research_interests` varchar(255) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_awards`
--

INSERT INTO `doctor_awards` (`id`, `awards_and_honors`, `publications`, `memberships`, `board_certification_number`, `research_interests`, `doctor_profile_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_doctor_profile`
--

CREATE TABLE `doctor_doctor_profile` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `nid_no` varchar(255) DEFAULT NULL,
  `phone_no` varchar(110) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `languages_spoken` varchar(255) DEFAULT NULL,
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

--
-- Dumping data for table `doctor_doctor_profile`
--

INSERT INTO `doctor_doctor_profile` (`id`, `full_name`, `father_name`, `mother_name`, `date_of_birth`, `nid_no`, `phone_no`, `experience`, `biography`, `languages_spoken`, `passport_no`, `created_at`, `updated_at`, `deleted_at`, `blood_group_id`, `department_id`, `gender_id`, `matrimony_id`, `religion_id`, `user_id`) VALUES
(1, 'Dr. Meherun Nesa', 'K.M Humayun', 'Nurjahan Begum', '2002-11-23', '1234567890', '01987654322', '5 Years', 'Associate Professor (Ophthalmologist)', 'Bangla, English', 'Not Applicable', '2023-08-16 11:00:22.873819', '2023-09-04 11:07:33.906842', NULL, 5, 1, 2, 1, 1, 3),
(2, 'Dr.-Ahmed-Sharif', 'Kane Holcomb', 'Kyla Burnett', '1975-01-16', 'Quas sit dolores inc', '+1 (139) 603-2056', 'Commodi accusamus ve', 'Associate Professor (Neurologist)', 'Placeat anim dolore', 'Qui voluptate dolor', '2023-09-04 10:38:24.035528', '2023-09-04 10:45:30.400107', NULL, 1, 4, 1, 2, 1, 4),
(3, 'Dr.-Tanbir-Al-Misbah', 'Farrah Small', 'Kendall Bright', '2001-02-15', 'Non tenetur quod ita', '+1 (459) 644-8556', 'Tempora quia et aspe', 'Professor (Neurologist)', 'Est qui et vel omnis', 'Nulla molestias dolo', '2023-09-04 10:44:02.194825', '2023-09-04 10:45:54.284808', NULL, 1, 4, 1, 3, 1, 5),
(4, 'Dr.-Mousumi-Marjiara', 'Darryl Valdez', 'Lacy Rice', '2005-12-13', '12234', '+1 (934) 803-2309', 'Elit sapiente qui d', 'Associate Professor (Neurologist)', 'Et distinctio Minim', 'Et dolores quis even', '2023-09-04 10:49:52.973206', '2023-09-04 10:50:18.562564', NULL, 2, 4, 2, 1, 1, 6),
(5, 'Dr.-Rowshan-Ara', 'Georgia Emerson', 'Quinn Flowers', '2023-08-30', 'Voluptas et non eum', '+1 (631) 207-1677', 'Dolor culpa volupta', 'Assistant Professor (Neurologist)', 'Debitis quia eos es', 'Ut cupiditate id ver', '2023-09-04 10:51:53.824036', '2023-09-04 11:03:18.957690', NULL, 1, 4, 2, 1, 1, 7),
(6, 'Dr.-Md.-Abdullahis-Safi', 'Eve Lowery', 'Leandra Mitchell', '2014-06-01', 'Aliquam deserunt imp', '+1 (829) 956-8863', 'Ut consequat Lorem', 'Associate Professor (Ophthalmologist)', 'Nulla ea molestias v', 'Hic libero fugiat vi', '2023-09-04 10:58:07.167792', '2023-09-04 11:06:46.044497', NULL, 5, 1, 1, 4, 3, 8),
(7, 'Dr.-Shakti-Chowdhury', 'Sophia Rivas', 'Carol Randolph', '1974-08-07', 'Cum aliquam culpa pr', '+1 (367) 804-4358', 'Error qui aliquid ni', 'Associate Professor (Ophthalmologist)', 'Recusandae Quia con', 'Ut aut possimus qui', '2023-09-04 10:59:02.424015', '2023-09-04 11:07:51.629338', NULL, 7, 1, 2, 4, 1, 9),
(8, 'Dr.-Feroza-Meher', 'Abigail Bentley', 'Gavin Chan', '2019-12-04', 'Dolorum dolore ipsa', '+1 (222) 184-5965', 'Omnis alias et venia', 'Associate Professor (Ophthalmologist)', 'Rerum earum consequa', 'Dignissimos voluptat', '2023-09-04 10:59:50.607604', '2023-09-04 11:07:57.182261', NULL, 5, 1, 2, 3, 4, 10),
(9, 'Dr.-Nishith-Ranjan-Dey', 'Shea Spencer', 'Eaton Wilkins', '2011-01-10', 'Voluptatum dolore se', '+1 (357) 342-6144', 'Voluptas velit dolor', 'Associate Professor (Ophthalmologist)', 'Saepe beatae volupta', 'Consequatur non dolo', '2023-09-04 11:00:29.223183', '2023-09-04 11:07:05.695866', NULL, 2, 1, 1, 2, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_education`
--

CREATE TABLE `doctor_education` (
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
-- Table structure for table `doctor_images`
--

CREATE TABLE `doctor_images` (
  `id` bigint(20) NOT NULL,
  `doctor_photos` varchar(100) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_images`
--

INSERT INTO `doctor_images` (`id`, `doctor_photos`, `doctor_profile_id`) VALUES
(1, 'static/uploads/doctor_images/20230904170530_Meherun_Nesa.jpg', 1),
(2, 'static/uploads/doctor_images/20230904163824_Dr.-Ahmed-Sharif.jpg', 2),
(3, 'static/uploads/doctor_images/20230904164402_Dr.-Tanbir-Al-Misbah.jpg', 3),
(4, 'static/uploads/doctor_images/20230904164952_Dr.-Mousumi-Marjiara.jpg', 4),
(5, 'static/uploads/doctor_images/20230904165153_Asst.-Prof.-Dr.-Rowshan-Ara.jpg', 5),
(6, 'static/uploads/doctor_images/20230904165807_Major-Dr.-Md.-Abdullahis-Safi.jpg', 6),
(7, 'static/uploads/doctor_images/20230904165902_Dr.-Shakti-Chowdhury.jpg', 7),
(8, 'static/uploads/doctor_images/20230904165950_Dr.-Feroza-Meher.jpg', 8),
(9, 'static/uploads/doctor_images/20230904170029_Dr.-Nishith-Ranjan-Dey.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_permanentaddress`
--

CREATE TABLE `doctor_permanentaddress` (
  `id` bigint(20) NOT NULL,
  `permanent_village_state` varchar(255) NOT NULL,
  `permanent_postal_code` int(11) NOT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `permanent_district_id` bigint(20) NOT NULL,
  `permanent_division_id` bigint(20) NOT NULL,
  `permanent_upazila_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_permanentaddress`
--

INSERT INTO `doctor_permanentaddress` (`id`, `permanent_village_state`, `permanent_postal_code`, `doctor_profile_id`, `permanent_district_id`, `permanent_division_id`, `permanent_upazila_id`) VALUES
(1, 'Rayebag', 1230, 1, 38, 6, 309),
(2, 'Pariatur Enim magni', 18, 2, 57, 7, 480),
(3, 'Non qui voluptas min', 54, 3, 44, 6, 390),
(4, 'Est inventore harum', 14, 4, 17, 3, 134),
(5, 'Aut id in sunt qui p', 92, 5, 10, 2, 83),
(6, 'Commodo in quia saep', 24, 6, 2, 1, 6),
(7, 'Modi et facere cillu', 53, 7, 9, 2, 78),
(8, 'Proident et volupta', 45, 8, 62, 8, 508),
(9, 'Possimus possimus', 15, 9, 17, 3, 128);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_presentaddress`
--

CREATE TABLE `doctor_presentaddress` (
  `id` bigint(20) NOT NULL,
  `present_village_state` varchar(255) NOT NULL,
  `present_postal_code` int(11) NOT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL,
  `present_district_id` bigint(20) NOT NULL,
  `present_division_id` bigint(20) NOT NULL,
  `present_upazila_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_presentaddress`
--

INSERT INTO `doctor_presentaddress` (`id`, `present_village_state`, `present_postal_code`, `doctor_profile_id`, `present_district_id`, `present_division_id`, `present_upazila_id`) VALUES
(1, 'Rayebag', 1230, 1, 38, 6, 309),
(2, 'Ad perspiciatis max', 100, 2, 34, 5, 276),
(3, 'Anim nemo magnam nul', 77, 3, 18, 3, 139),
(4, 'Et vel quis sint exe', 40, 4, 18, 3, 138),
(5, 'Qui eaque quas labor', 86, 5, 47, 6, 404),
(6, 'Est fugiat aliqua', 48, 6, 18, 3, 137),
(7, 'Eum quos atque ipsum', 80, 7, 47, 6, 403),
(8, 'Id quo aut iusto ips', 72, 8, 12, 2, 98),
(9, 'Porro deserunt repre', 83, 9, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_services`
--

CREATE TABLE `doctor_services` (
  `id` bigint(20) NOT NULL,
  `treatments` varchar(255) DEFAULT NULL,
  `procedures` varchar(255) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_services`
--

INSERT INTO `doctor_services` (`id`, `treatments`, `procedures`, `hours`, `location`, `doctor_profile_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_social_media`
--

CREATE TABLE `doctor_social_media` (
  `id` bigint(20) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_social_media`
--

INSERT INTO `doctor_social_media` (`id`, `website`, `facebook`, `instagram`, `linkedin`, `doctor_profile_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `created_at`, `updated_at`, `deleted_at`, `created_by_id`, `modified_by_id`) VALUES
(1, 'What is a General Practitioner (GP)?', 'A General Practitioner, often referred to as a GP or family doctor, is a medical professional who provides primary healthcare services, including preventive care, diagnosis, and treatment of common medical conditions.', '2023-09-04 08:06:26.294221', NULL, NULL, 1, NULL),
(2, 'How can I find a healthcare provider or specialist in my area?', 'You can search for healthcare providers and specialists in your area by using online directories, contacting your insurance company for a list of in-network providers, or asking for recommendations from friends and family.', '2023-09-04 08:07:37.075153', NULL, NULL, 1, NULL),
(3, 'What is the difference between a virus and bacteria?', 'Viruses and bacteria are both microorganisms, but they differ in structure and behavior. Viruses require a host cell to replicate and cause infections, while bacteria are single-celled organisms that can reproduce independently.', '2023-09-04 08:08:06.031224', NULL, NULL, 1, NULL),
(4, 'What is telemedicine, and how does it work?', 'Telemedicine is a method of providing medical care remotely using telecommunications technology. Patients can consult with healthcare providers via video calls, phone calls, or secure messaging for diagnosis, treatment, and follow-up care.', '2023-09-04 08:08:28.348686', NULL, NULL, 1, NULL),
(5, 'What are the common symptoms of COVID-19?', 'Common symptoms of COVID-19 include fever, cough, shortness of breath, loss of taste or smell, fatigue, and body aches. However, symptoms can vary among individuals.', '2023-09-04 08:08:55.861650', NULL, NULL, 1, NULL),
(6, 'How can I prevent the spread of infectious diseases like the flu or COVID-19?', 'Preventive measures include getting vaccinated, practicing good hand hygiene, wearing masks when necessary, maintaining physical distance from sick individuals, and following public health guidelines.', '2023-09-04 08:09:23.528573', NULL, NULL, 1, NULL),
(7, 'What is the recommended schedule for childhood vaccinations?', 'Answer: Childhood vaccination schedules can vary by country, but they typically include vaccinations against diseases like measles, mumps, rubella, polio, and more. Consult with your child\'s healthcare provider for the recommended vaccination schedule in your area.', '2023-09-04 08:09:51.863026', NULL, NULL, 1, NULL),
(8, 'What is the difference between Type 1 and Type 2 diabetes?', 'Answer: Type 1 diabetes is an autoimmune condition in which the immune system attacks and destroys insulin-producing cells. Type 2 diabetes is characterized by insulin resistance and is often associated with lifestyle factors like diet and exercise.', '2023-09-04 08:10:16.513852', NULL, NULL, 1, NULL),
(9, 'How do I manage my chronic condition, such as hypertension or diabetes?', 'Answer: Managing chronic conditions typically involves medication, lifestyle modifications (diet and exercise), regular check-ups with a healthcare provider, and adherence to a treatment plan.', '2023-09-04 08:10:30.636554', NULL, NULL, 1, NULL),
(10, 'What should I include in my emergency first-aid kit at home?', '- Answer: A basic first-aid kit should include items like bandages, antiseptic wipes, adhesive tape, scissors, tweezers, pain relievers, and emergency contact information. Customize it based on your family\'s specific needs.', '2023-09-04 08:10:45.848816', NULL, NULL, 1, NULL),
(11, 'What are the risk factors for heart disease?', 'Answer: Risk factors for heart disease include high blood pressure, high cholesterol, smoking, obesity, family history, and physical inactivity.', '2023-09-04 08:11:07.615928', NULL, NULL, 1, NULL),
(12, 'When should I have a mammogram, and how often should I get one?', 'Answer: Mammogram recommendations vary by age and risk factors, but generally, women should start regular mammograms at age 40 and discuss the frequency with their healthcare provider.', '2023-09-04 08:11:21.054402', NULL, NULL, 1, NULL),
(13, 'What is the difference between a virus and a vaccine?', 'Answer: A virus is a microorganism that can cause diseases, while a vaccine is a substance that stimulates the immune system to provide protection against specific viruses or bacteria.', '2023-09-04 08:11:35.168330', NULL, NULL, 1, NULL),
(14, 'How can I manage stress and anxiety effectively?', 'Answer: Stress management techniques include relaxation exercises, mindfulness, therapy, regular exercise, and maintaining a healthy lifestyle.', '2023-09-04 08:11:49.522200', NULL, NULL, 1, NULL),
(15, 'What are the benefits of regular physical activity for my health?', 'Answer: Regular physical activity can improve cardiovascular health, reduce the risk of chronic diseases, boost mental well-being, and promote overall fitness.', '2023-09-04 08:12:02.920132', NULL, NULL, 1, NULL),
(16, 'What is the recommended daily water intake for adults?', 'Answer: The recommended daily water intake varies, but a general guideline is to drink about 8 cups (64 ounces) of water per day. Individual needs may vary based on factors like climate and activity level.', '2023-09-04 08:12:16.079637', NULL, NULL, 1, NULL),
(17, 'How do I know if I have a food allergy or food intolerance?', 'Answer: Food allergies typically involve immediate and severe reactions, while food intolerances often result in digestive symptoms and are less severe. Allergies should be diagnosed and managed by a healthcare provider.', '2023-09-04 08:12:32.155387', NULL, NULL, 1, NULL),
(18, 'What is the importance of regular eye exams, and how often should I have one?', 'Answer: Regular eye exams can detect vision problems and eye diseases early. The frequency of exams depends on your age and risk factors, but adults should have one every 1-2 years.', '2023-09-04 08:12:43.975798', NULL, NULL, 1, NULL),
(19, 'How can I maintain a healthy diet and nutrition?', 'Answer: Maintaining a healthy diet involves eating a variety of foods, focusing on fruits and vegetables, limiting processed foods, and moderating portion sizes. It\'s also important to stay hydrated.', '2023-09-04 08:12:55.553675', NULL, NULL, 1, NULL),
(20, 'What are the signs of a medical emergency, and when should I call 911?', 'Answer: Signs of a medical emergency include severe chest pain, difficulty breathing, sudden weakness or numbness, severe injuries, and loss of consciousness. Call 911 immediately in these situations.', '2023-09-04 08:13:08.766554', NULL, NULL, 1, NULL);

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
  `photo_name` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `organ`
--

CREATE TABLE `organ` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `body_part_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ`
--

INSERT INTO `organ` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`, `body_part_id`) VALUES
(1, 'Brain (মস্তিষ্ক)', 'The central control center of the nervous system, responsible for processing. (স্নায়ু তন্ত্রের কেন্দ্রীয় নিয়ন্ত্রণ কেন্দ্র, তথ্য প্রক্রিয়া করা, শারীরিক কাজ নিয়ন্ত্রণ এবং ভাবনা এবং আবেগ উৎপন্ন করা জন্য দায়িত্বপ্রাপ্ত।)', '2023-08-16 16:39:35.767875', NULL, NULL, 1),
(2, 'Eyes (চোখ:)', 'Sensory organs that detect light and allow us to see and perceive our environment. (প্রকাশ চিহ্নিত করে এবং আমাদেরকে দেখতে এবং আমাদের পরিবেশ অনুভব করতে সাহায্য করে যেমন দৃষ্টি এবং পর্যবেক্ষণ।)', '2023-08-16 16:39:35.775348', NULL, NULL, 1),
(3, 'Ears (কান)', 'Sensory organs that enable hearing and help maintain balance. (শ্রবণ সহায়ক অঙ্গ, যা শ্রবণ সক্ষমতা সৃষ্টি করে এবং সমর্থন করে মধ্যবর্তী সমতল।)', '2023-08-16 16:39:35.782385', NULL, NULL, 1),
(4, 'Nose (নাক)', 'An organ of smell and also plays a role in filtering and humidifying the air we breathe. (গন্ধের একটি অঙ্গ এবং আমাদের শ্বাসকশগুলি শোধন এবং আমরা শ্বাস সাহায্য করে এটি একটি ভূমি বায়ুকে ফিল্টার এবং উষ্ণতা পরিস্থিতি পরিপন্থিত করে।)', '2023-08-16 16:39:35.797873', NULL, NULL, 1),
(5, 'Mouth  (মুখ)', 'Used for eating, speaking, and breathing. Contains structures like the tongue and teeth. (খাবার গ্রাহণ, কথা বলা এবং শ্বাস নেওয়ার জন্য ব্যবহৃত হয়। জিভ এবং দাঁতের মতো অঙ্গগুলি এখানে অন্তর্ভুক্ত রয়েছে।)', '2023-08-16 16:39:35.813459', NULL, NULL, 1),
(6, 'Throat structures (গলা প্রতিরক্ষা)', 'Include the pharynx and larynx, which are involved in swallowing, speaking, and breathing. (গ্যারগল এবং ল্যারিংক্স অন্তর্ভুক্ত, যা নেত্রমোক্ষণ, বলা এবং শ্বাসকে নিয়ন্ত্রণ করে।\r\nশরীরের উপাংশ:)', '2023-08-16 16:41:15.634343', NULL, NULL, 2),
(7, 'Heart (হৃদয়)', ' A muscular organ that pumps blood throughout the body, supplying oxygen and nutrients to cells. (শরীরের সারস্বত্বিক অঙ্গ, যা রক্ত পূর্বাধ এবং নিঃশ্বাসিত রক্ত পাঠানোর জন্য ব্যবহৃত হয়, পূর্বাধবৃদ্ধি এবং পুষ্টি সংক্রিয়া করে।)', '2023-08-16 16:42:38.982906', NULL, NULL, 3),
(8, 'Lungs (ফুসফুস)', 'Respiratory organs responsible for exchanging oxygen and carbon dioxide with the blood. (রক্ত দ্বারা অক্সিজেন এবং কার্বন ডাইঅক্সাইড পরিবর্তনের জন্য জিবনবৃত্তি সঞ্চালন করে।)', '2023-08-16 16:42:38.990509', NULL, NULL, 3),
(9, 'Shoulder joint (কাঁধ জয়েন্ট)', 'Allows a wide range of arm movements. (পয়েন্ট হয় এবং আয়ত্তকার বাহু চলাচল সাহায্য করে।)', '2023-08-16 16:49:00.823126', NULL, NULL, 4),
(10, 'Upper arm muscles ( উপরের বাহুর পেশী)', 'Responsible for arm movement and stability. (বাহু চলাচল এবং স্থিতির জন্য দায়িত্বপ্রাপ্ত।)', '2023-08-16 16:49:00.829623', NULL, NULL, 4),
(11, 'Forearm muscles ( হাতের পেশী)', 'Control hand and finger movements. (হাত এবং আঙ্গুল চলাচল নিয়ন্ত্রণ করে।)', '2023-08-16 16:49:00.843031', NULL, NULL, 4),
(12, 'Wrist joint (কব্জি জয়েন্ট)', 'Enables wrist movement. (কব্জি নড়াচড়া সক্ষম করে।)', '2023-08-16 16:49:00.848632', NULL, NULL, 4),
(13, 'Hand bones and muscles (হাতের হাড় এবং পেশী)', 'Allow intricate hand movements and dexterity. (জটিল হাত চলাচল এবং দক্ষতা সক্ষম হতে সাহায্য করে।)', '2023-08-16 16:49:00.854171', NULL, NULL, 4),
(14, 'Hip joint (ঊরুসন্ধি)', 'Supports the upper body and allows leg movement. (শরীরের উপরের অংশকে সমর্থন করে এবং পায়ের নড়াচড়ার অনুমতি দেয়।)', '2023-08-16 17:20:48.003273', NULL, NULL, 5),
(15, 'Thigh muscles (উরুর পেশী)', 'Power leg movements, including walking and running. (হাঁটা এবং দৌড় সহ পাওয়ার পায়ের নড়াচড়া।)', '2023-08-16 17:20:48.009783', NULL, NULL, 5),
(16, 'Lower leg muscles (নীচের পায়ের পেশী)', 'Control movements of the foot and ankle. (পা এবং গোড়ালির গতিবিধি নিয়ন্ত্রণ করুন।)', '2023-08-16 17:20:48.019845', NULL, NULL, 5),
(17, 'Ankle joint (গোড়ালি জয়েন্ট)', 'Enables foot movement. (পা নড়াচড়া সক্ষম করে।)', '2023-08-16 17:20:48.025952', NULL, NULL, 5),
(18, 'Foot bones and muscles (পায়ের হাড় এবং পেশী)', 'Provide support and enable standing, walking, and running. (সমর্থন প্রদান করুন এবং দাঁড়ানো, হাঁটা এবং দৌড়ানো সক্ষম করুন।)', '2023-08-16 17:20:48.031306', NULL, NULL, 5),
(19, 'Heart (হৃদয়)', 'Pumps oxygenated blood to the body and deoxygenated blood to the lungs. (শরীরে অক্সিজেনযুক্ত রক্ত ​​এবং ফুসফুসে অক্সিজেনযুক্ত রক্ত ​​পাম্প করে।)', '2023-08-16 18:38:24.460260', NULL, NULL, 6),
(20, 'Lungs  (শ্বাসযন্ত্র)', 'Exchange oxygen and carbon dioxide during breathing. (শ্বাসের সময় অক্সিজেন এবং কার্বন ডাই অক্সাইড বিনিময় করুন।)', '2023-08-16 18:38:24.467784', NULL, NULL, 6),
(21, 'Stomach (পেট)', 'Digests food and breaks it down into nutrients. (খাবার হজম করে এবং পুষ্টিতে ভেঙ্গে দেয়।)', '2023-08-16 18:40:11.699053', NULL, NULL, 7),
(22, 'Liver (লিভার)', 'Performs various metabolic functions, including detoxification and nutrient processing. (ডিটক্সিফিকেশন এবং পুষ্টি প্রক্রিয়াকরণ সহ বিভিন্ন বিপাকীয় কার্য সম্পাদন করে।)', '2023-08-16 18:40:11.705056', NULL, NULL, 7),
(23, 'Intestines (small and large) (অন্ত্র (ছোট এবং বড়)', 'Absorb nutrients and water from digested food. (হজম হওয়া খাবার থেকে পুষ্টি এবং জল শোষণ করে।)', '2023-08-16 18:41:46.340305', NULL, NULL, 7),
(24, 'Kidneys (কিডনি)', 'Filter blood, remove waste products, and regulate fluid balance. (রক্ত ​​ফিল্টার করুন, বর্জ্য পণ্য অপসারণ করুন এবং তরল ভারসাম্য নিয়ন্ত্রণ করুন।)', '2023-08-16 18:41:46.346815', NULL, NULL, 7),
(25, 'Reproductive organs (প্রজনন অঙ্গ)', 'Vary by sex and include structures such as the ovaries and uterus in females and the testes and prostate in males. (লিঙ্গ অনুসারে পরিবর্তিত হয় এবং নারীদের ডিম্বাশয় এবং জরায়ু এবং পুরুষদের মধ্যে টেস্টিস এবং প্রোস্টেটের মতো গঠন অন্তর্ভুক্ত করে।)', '2023-08-16 18:43:22.281975', NULL, NULL, 8),
(26, 'Bladder (মূত্রাশয়)', 'Stores urine before elimination. (নির্মূলের আগে প্রস্রাব সঞ্চয় করে।)', '2023-08-16 18:43:22.288015', NULL, NULL, 8),
(27, 'Spinal cord (স্পাইনাল কর্ড)', 'Transmits signals between the brain and the rest of the body, controlling movement and sensation. (মস্তিষ্ক এবং শরীরের বাকি অংশের মধ্যে সংকেত প্রেরণ করে, চলাচল এবং সংবেদন নিয়ন্ত্রণ করে।)', '2023-08-16 18:44:35.104805', NULL, NULL, 9),
(28, 'Muscles supporting the spine (মেরুদণ্ডকে সমর্থনকারী পেশী)', 'Stabilize and allow movement of the spine. (স্পাইন নিরাপত্তা এবং চলাচল নিয়ন্ত্রণ করতে স্পাইন সমর্থন করে।)', '2023-08-16 18:44:35.112309', NULL, NULL, 9),
(29, 'Skeletal Muscles (কঙ্কালের পেশী)', 'Muscles attached to bones that allow voluntary movement, such as biceps, quadriceps, and hamstrings. (হাড়ের সাথে সংযুক্ত পেশী যা স্বেচ্ছায় চলাচলের অনুমতি দেয়, যেমন বাইসেপ, কোয়াড্রিসেপ এবং হ্যামস্ট্রিং।)', '2023-08-16 18:49:15.632387', NULL, NULL, 10),
(30, 'Smooth Muscles (মসৃণ পেশী)', 'Found in organs like the digestive tract and blood vessels, they control involuntary movements. (পরিপাকতন্ত্র এবং রক্তনালীগুলির মতো অঙ্গগুলিতে পাওয়া যায়, তারা অনিচ্ছাকৃত আন্দোলন নিয়ন্ত্রণ করে।)', '2023-08-16 18:49:15.638881', NULL, NULL, 10),
(31, 'Cardiac Muscle (কার্ডিয়াক পেশী)', 'The muscle of the heart that contracts to pump blood. (হৃৎপিণ্ডের পেশী যা রক্ত ​​পাম্প করতে সংকোচন করে।)', '2023-08-16 18:49:15.652053', NULL, NULL, 10),
(32, 'Axial Skeleton (অক্ষীয় কঙ্কাল)', 'The central part of the skeleton, including the skull, vertebral column (spine), and rib cage. (কঙ্কালের কেন্দ্রীয় অংশ, মাথার খুলি, কশেরুকা কলাম (মেরুদন্ড) এবং পাঁজরের খাঁচা সহ।)', '2023-08-16 18:50:41.473372', NULL, NULL, 11),
(33, 'Appendicular Skeleton (অ্যাপেন্ডিকুলার কঙ্কাল)', 'The bones of the limbs and girdles (shoulder and pelvic), which facilitate movement. (অঙ্গ এবং কোমরের হাড় (কাঁধ এবং শ্রোণী), যা নড়াচড়ার সুবিধা দেয়।)', '2023-08-16 18:50:41.480650', NULL, NULL, 11),
(34, 'Joints (জয়েন্টগুলি)', 'Points where bones meet, enabling movement. Examples include ball-and-socket joints, hinge joints, and pivot joints. (বিন্দু যেখানে হাড় মিলিত হয়, আন্দোলন সক্ষম করে। উদাহরণের মধ্যে রয়েছে বল-এবং-সকেট জয়েন্ট, কব্জা জয়েন্ট এবং পিভট জয়েন্ট।)', '2023-08-16 18:51:55.261312', NULL, NULL, 11),
(35, 'Bone Marrow (অস্থিমজ্জা)', 'Soft tissue within bones that produces blood cells (red marrow) and stores fat (yellow marrow). (হাড়ের মধ্যে নরম টিস্যু যা রক্ত ​​​​কোষ (লাল মজ্জা) তৈরি করে এবং চর্বি (হলুদ মজ্জা) সঞ্চয় করে।)', '2023-08-16 18:51:55.268335', NULL, NULL, 11),
(36, 'Epidermis (এপিডার্মিস)', 'The outer layer of the skin, consisting of multiple layers of cells that provide a barrier against pathogens and UV radiation. (ত্বকের বাইরের স্তর, কোষের একাধিক স্তর নিয়ে গঠিত যা প্যাথোজেন এবং ইউভি বিকিরণের বিরুদ্ধে বাধা প্রদান করে।)', '2023-08-16 18:54:13.561291', NULL, NULL, 12),
(37, 'Dermis (ডার্মিস)', 'The layer beneath the epidermis that contains blood vessels, nerves, sweat glands, hair follicles, and connective tissue. (এপিডার্মিসের নীচের স্তর যা রক্তনালী, স্নায়ু, ঘাম গ্রন্থি, চুলের ফলিকল এবং সংযোগকারী টিস্যু ধারণ করে।)', '2023-08-16 18:54:13.566648', NULL, NULL, 12),
(38, 'Subcutaneous Tissue (Hypodermis) (সাবকুটেনিয়াস টিস্যু (হাইপোডার্মিস))', 'The layer beneath the dermis that contains fat cells and helps insulate the body. (ডার্মিসের নীচের স্তর যাতে চর্বি কোষ থাকে এবং শরীরকে নিরোধক করতে সাহায্য করে।)', '2023-08-16 18:54:13.572578', NULL, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `organ_problem_speci`
--

CREATE TABLE `organ_problem_speci` (
  `id` bigint(20) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `problem_specification` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `organ_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ_problem_speci`
--

INSERT INTO `organ_problem_speci` (`id`, `problem`, `problem_specification`, `created_at`, `updated_at`, `deleted_at`, `organ_id`) VALUES
(1, 'Ringing in the Ears (Tinnitus) (কানে বাজছে (টিনিটাস))', 'I\'ve been having this sharp or dull pain in my ear. It\'s uncomfortable, and sometimes it even radiates to my jaw or head. (আমি আমার কানে এই ধারালো বা নিস্তেজ ব্যথা আছে. এটি অস্বস্তিকর, এবং কখনও কখনও এটি আমার চোয়াল বা মাথা পর্যন্ত বিকিরণ করে)', '2023-09-04 07:15:54.957687', NULL, NULL, 3),
(2, 'Reduced Hearing (শ্রবণশক্তি হ্রাস)', 'I keep hearing this constant ringing or buzzing sound in my ears. It\'s really distracting and hard to ignore. (আমি আমার কানে এই ক্রমাগত বাজানো বা গুঞ্জন শব্দ শুনতে থাকি। এটা সত্যিই বিভ্রান্তিকর এবং উপেক্ষা করা কঠিন.)', '2023-09-04 07:15:54.965669', NULL, NULL, 3),
(3, 'Vertigo and Dizziness (ভার্টিগো এবং মাথা ঘোরা)', 'I\'ve noticed that my hearing has become muffled or reduced. It\'s like sounds are not as clear as they used to be. (আমি লক্ষ্য করেছি যে আমার শ্রবণশক্তি কম হয়ে গেছে বা কমে গেছে। মনে হচ্ছে শব্দগুলো আগের মতো পরিষ্কার নয়।)', '2023-09-04 07:15:54.972648', NULL, NULL, 3),
(4, 'Ear Fullness or Pressure (কানের পূর্ণতা বা চাপ)', 'I feel like the room is spinning, and I\'m dizzy. It can be triggered by certain head movements or just come on suddenly. (আমার মনে হচ্ছে ঘরটা ঘুরছে, আর আমার মাথা ঘোরাচ্ছে। এটি নির্দিষ্ট মাথা নড়াচড়ার দ্বারা ট্রিগার হতে পারে বা হঠাৎ করেই আসতে পারে।)', '2023-09-04 07:15:54.988609', NULL, NULL, 3),
(5, 'Fluid Drainage from the Ear (কান থেকে তরল নিষ্কাশন)', 'My ears feel blocked or pressured, like there\'s something inside. It\'s affecting my hearing and making me uncomfortable. (আমার কান অবরুদ্ধ বা চাপ অনুভব করছে, যেন ভিতরে কিছু আছে। এটি আমার শ্রবণশক্তিকে প্রভাবিত করছে এবং আমাকে অস্বস্তিকর করে তুলছে।)', '2023-09-04 07:15:54.994110', NULL, NULL, 3),
(6, 'Dizziness and Vertigo (মাথা ঘোরা )', 'I\'ve been having this persistent pain in my head. It\'s like a throbbing or pressure, and it can range from mild to really intense. (আমার মাথায় এই ক্রমাগত ব্যথা হচ্ছে। এটি একটি থ্রবিং বা চাপের মতো, এবং এটি হালকা থেকে সত্যিই তীব্র পর্যন্ত হতে পারে।)', '2023-09-04 07:21:51.012223', NULL, NULL, 1),
(7, 'Memory Loss (স্মৃতিশক্তি হ্রাস)', 'I feel like the room is spinning, and I\'m dizzy even when I\'m sitting still. It\'s disorienting and makes me unsteady. (আমার মনে হচ্ছে ঘরটা ঘুরছে, এবং আমি যখন বসে আছি তখনও আমার মাথা ঘোরাচ্ছে। এটা আমাকে অস্থির করে তোলে)', '2023-09-04 07:21:51.019380', NULL, NULL, 1),
(8, 'Difficulty Concentrating (মনোনিবেশ করতে অসুবিধা)', 'I\'ve been forgetting things more often than usual. It\'s not just small details; sometimes I can\'t remember important stuff. (আমি স্বাভাবিকের চেয়ে বেশি বার জিনিস ভুলে গেছি। এটা শুধু ছোট বিবরণ নয়, কখনও কখনও আমি গুরুত্বপূর্ণ জিনিস মনে করতে পারি না।)', '2023-09-04 07:21:51.026689', NULL, NULL, 1),
(9, 'Nausea and Vomiting (বমি বমি ভাব এবং বমি)', 'I\'m finding it really hard to focus on tasks. My mind keeps wandering, and even simple things take a lot of effort.(আমি কাজগুলিতে ফোকাস করা সত্যিই কঠিন বলে মনে করছি। আমার মন ঘুরপাক খায়, এমনকি সাধারণ জিনিসগুলিও অনেক প্রচেষ্টা নেয়)', '2023-09-04 07:21:51.040718', NULL, NULL, 1),
(10, 'Weakness or Numbness in Limbs (অঙ্গ-প্রত্যঙ্গে দুর্বলতা বা অসাড়তা)', 'I\'m experiencing extreme highs and lows, and it\'s affecting my daily life. (আমি চরম উচ্চ এবং নিচু অভিজ্ঞতা করছি, এবং এটি আমার দৈনন্দিন জীবনকে প্রভাবিত করছে।)', '2023-09-04 07:21:51.046725', NULL, NULL, 1),
(11, 'Blurry Vision (ঝাপসা দৃষ্টি)', 'I\'ve noticed my eyes are really red and itchy. There\'s this discharge that\'s making my eyelids stick together in the morning. It feels like there\'s something gritty in my eyes. (আমি লক্ষ্য করেছি আমার চোখ সত্যিই লাল এবং চুলকায়। এই স্রাব আছে যা সকালে আমার চোখের পাতা একসাথে লেগে আছে। মনে হচ্ছে আমার চোখে কিছু নোংরা আছে।)', '2023-09-04 07:26:23.663755', NULL, NULL, 2),
(12, 'Sudden Onset of Floaters and Flashes. (ফ্লোটার এবং ফ্ল্যাশের আকস্মিক সূত্রপাত)', 'Things have been getting blurry lately, especially when I try to read or watch TV. I find myself squinting a lot to see things clearly. (জিনিসগুলি ইদানীং ঝাপসা হয়ে আসছে, বিশেষ করে যখন আমি টিভি পড়ার বা দেখার চেষ্টা করি।)', '2023-09-04 07:26:23.669736', NULL, NULL, 2),
(13, 'Severe Eye Pain (তীব্র চোখে ব্যথা)', 'Out of nowhere, I\'ve started seeing these tiny floating spots in my vision, and every now and then, I see flashes of light, almost like lightning. (কোথাও থেকে, আমি আমার দৃষ্টিতে এই ছোট ভাসমান দাগগুলি দেখতে শুরু করেছি, এবং প্রতিবার, আমি প্রায় বিদ্যুতের মতো আলোর ঝলক দেখতে পাচ্ছি।)', '2023-09-04 07:26:23.674724', NULL, NULL, 2),
(14, 'Eye Injury (চোখের আঘাত)', 'My eye has been hurting a lot, like a sharp pain. It\'s really uncomfortable, and even blinking is painful. There\'s also redness and I can\'t stand bright lights. (আমার চোখ অনেক ব্যাথা করছে, তীক্ষ্ণ ব্যাথার মত। এটা সত্যিই অস্বস্তিকর, এবং এমনকি জ্বলজ্বলে বেদনাদায়ক। এছাড়াও লালভাব আছে এবং আমি উজ্জ্বল আলো সহ্য করতে পারি না।)', '2023-09-04 07:26:23.682704', NULL, NULL, 2),
(15, 'Persistent Dryness and Discomfort (ক্রমাগত শুষ্কতা এবং অস্বস্তি)', 'Something got into my eye after an accident. It\'s been watering excessively, and it feels like there\'s still something in there. It\'s quite uncomfortable and worrying. (একটা দুর্ঘটনার পর আমার চোখে কিছু ঢুকে গেল। এটি অত্যধিক জল দেওয়া হয়েছে, এবং মনে হচ্ছে সেখানে এখনও কিছু আছে। এটা বেশ অস্বস্তিকর এবং উদ্বেগজনক।)', '2023-09-04 07:26:23.696665', NULL, NULL, 2),
(16, 'Runny Nose (সর্দি)', 'My nose feels blocked, and it\'s hard to breathe through it. I\'ve been congested and it\'s affecting my ability to smell and taste. (আমার নাক আটকে আছে, এবং এটা দিয়ে শ্বাস নিতে কষ্ট হচ্ছে। আমি যানজটে ছিলাম এবং এটি আমার গন্ধ এবং স্বাদের ক্ষমতাকে প্রভাবিত করছে।)', '2023-09-04 07:33:38.485244', NULL, NULL, 4),
(17, 'Sneezing (হাঁচি)', 'My nose is constantly dripping, and I have to keep wiping it. It\'s like I have a never-ending cold. (আমার নাক ক্রমাগত ফোঁটাচ্ছে, এবং আমাকে এটি মুছতে হবে। মনে হচ্ছে আমার কখনো শেষ না হওয়া সর্দি আছে।)', '2023-09-04 07:33:38.492223', NULL, NULL, 4),
(18, 'Sinus Pressure ( শোষ চাপ)', 'I\'ve been sneezing a lot, and it\'s not due to a cold. It\'s like something in the air triggers these sneezing fits. (আমি অনেক হাঁচি দিয়েছি, এবং এটি ঠান্ডার কারণে নয়। বাতাসের মধ্যে কিছু এই হাঁচি ফিট ট্রিগার মত.)', '2023-09-04 07:33:38.510508', NULL, NULL, 4),
(19, 'Change in Sense of Smell (Hyposmia) (গন্ধের অনুভূতির পরিবর্তন (হাইপোসমিয়া))', 'I\'ve noticed that I can\'t smell things like I used to. It\'s like my sense of smell has vanished. (আমি লক্ষ্য করেছি যে আমি আগের মতো গন্ধ পাচ্ছি না। যেন আমার ঘ্রাণশক্তি হারিয়ে গেছে।)', '2023-09-04 07:33:38.516548', NULL, NULL, 4),
(20, 'Nosebleeds (নাক দিয়ে রক্ত ​​পড়া)', 'My nose starts bleeding spontaneously, and it can be difficult to stop. It\'s concerning and sometimes messy. (আমার নাক থেকে স্বতঃস্ফূর্তভাবে রক্তপাত শুরু হয় এবং এটি বন্ধ করা কঠিন হতে পারে। এটি উদ্বেগজনক এবং কখনও কখনও অগোছালো)', '2023-09-04 07:33:38.521889', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` bigint(20) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `otp`, `is_verified`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '0', 1, '2023-07-18 02:29:37.183232', '2023-08-19 11:59:14.582148', NULL, 1),
(2, '0', 1, '2023-08-16 10:44:23.145973', '2023-08-16 16:44:35.115911', NULL, 2),
(3, '0', 1, '2023-08-16 11:00:22.867285', NULL, NULL, 3),
(4, '0', 1, '2023-09-04 10:38:24.029771', NULL, NULL, 4),
(5, '0', 1, '2023-09-04 10:44:02.188073', NULL, NULL, 5),
(6, '0', 1, '2023-09-04 10:49:52.970214', NULL, NULL, 6),
(7, '0', 1, '2023-09-04 10:51:53.818051', NULL, NULL, 7),
(8, '0', 1, '2023-09-04 10:58:07.164801', NULL, NULL, 8),
(9, '0', 1, '2023-09-04 10:59:02.415042', NULL, NULL, 9),
(10, '0', 1, '2023-09-04 10:59:50.604612', NULL, NULL, 10),
(11, '0', 1, '2023-09-04 11:00:29.221172', NULL, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
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
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `full_name`, `father_name`, `mother_name`, `phone_no`, `date_of_birth`, `nid_no`, `address`, `created_at`, `updated_at`, `deleted_at`, `blood_group_id`, `gender_id`, `matrimony_id`, `religion_id`, `user_id`) VALUES
(1, 'Mamun Mia', 'Kasem Ali', 'Hasina Begum', '+8801965572363', '2001-06-22', '12345', 'Dhaka , Narayanganj, Rupganj , Borpa , Dokkhin Masabo', '2023-08-16 10:44:23.141057', '2023-08-16 16:54:02.931161', NULL, 1, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permanent_address`
--

CREATE TABLE `permanent_address` (
  `id` bigint(20) NOT NULL,
  `permanent_village_state` varchar(255) NOT NULL,
  `permanent_postal_code` int(11) NOT NULL,
  `permanent_district_id` bigint(20) NOT NULL,
  `permanent_division_id` bigint(20) NOT NULL,
  `permanent_upazila_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `present_address`
--

CREATE TABLE `present_address` (
  `id` bigint(20) NOT NULL,
  `present_village_state` varchar(255) NOT NULL,
  `present_postal_code` int(11) NOT NULL,
  `present_district_id` bigint(20) NOT NULL,
  `present_division_id` bigint(20) NOT NULL,
  `present_upazila_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `district_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upazila`
--

INSERT INTO `upazila` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `district_id`) VALUES
(1, 'Akkelpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(2, 'Joypurhat Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(3, 'Kalai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(4, 'Khetlal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(5, 'Panchbibi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 1),
(6, 'Adamdighi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(7, 'Bogura SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(8, 'Dhunat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(9, 'Dhupchanchia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(10, 'Gabtali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(11, 'Kahaloo Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(12, 'Nandigram Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(13, 'Sariakandi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(14, 'Shajahanpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(15, 'Sherpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(16, 'ShibganjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(17, 'Sonatola Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 2),
(18, 'Atrai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(19, 'Badalgachhi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(20, 'Manda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(21, 'Dhamoirhat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(22, 'Mohadevpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(23, 'Naogaon Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(24, 'Niamatpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(25, 'Patnitala Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(26, 'Porsha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(27, 'Raninagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(28, 'Sapahar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 3),
(29, 'Bagatipara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(30, 'Baraigram Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(31, 'Gurudaspur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(32, 'Lalpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(33, 'Natore Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(34, 'Singra Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(35, 'Naldanga Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 4),
(36, 'Bholahat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(37, 'GomastapurUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(38, 'Nachole Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(39, 'NawabganjSadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(40, 'ShibganjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 5),
(41, 'Atgharia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(42, 'Bera Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(43, 'Bhangura Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(44, 'Chatmohar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(45, 'Faridpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(46, 'Ishwardi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(47, 'Pabna Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(48, 'Santhia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(49, 'Sujanagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 6),
(50, 'Belkuchi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(51, 'Chauhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(52, 'Kamarkhanda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(53, 'Kazipur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(54, 'Raiganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(55, 'Shahjadpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(56, 'Sirajganj Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(57, 'Tarash Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(58, 'Ullahpara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 7),
(59, 'Bagha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(60, 'Bagmara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(61, 'Charghat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(62, 'Durgapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(63, 'Godagari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(64, 'Mohanpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(65, 'Paba Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(66, 'Puthia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(67, 'Tanore Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 8),
(68, 'Birampur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(69, 'Birganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(70, 'Biral Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(71, 'Bochaganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(72, 'Chirirbandar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(73, 'PhulbariUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(74, 'Ghoraghat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(75, 'Hakimpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(76, 'Kaharole Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(77, 'Khansama Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(78, 'Dinajpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(79, 'Nawabganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(80, 'Parbatipur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 9),
(81, 'Phulchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(82, 'Gaibandha Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(83, 'Gobindaganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(84, 'Palashbari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(85, 'Sadullapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(86, 'Sughatta Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(87, 'Sundarganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 10),
(88, 'Bhurungamari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(89, 'Char Rajibpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(90, 'Chilmari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(91, 'Phulbari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(92, 'Kurigram Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(93, 'Nageshwari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(94, 'Rajarhat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(95, 'Raomari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(96, 'Ulipur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 11),
(97, 'Aditmari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 12),
(98, 'Hatibandha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 12),
(99, 'KaliganjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 12),
(100, 'Lalmonirhat SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 12),
(101, 'Patgram Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 12),
(102, 'Dimla Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 13),
(103, 'Domar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 13),
(104, 'Jaldhaka Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 13),
(105, 'Kishoreganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 13),
(106, 'Nilphamari Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 13),
(107, 'Saidpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 13),
(108, 'Atwari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 14),
(109, 'Boda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 14),
(110, 'Debiganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 14),
(111, 'Panchagarh Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 14),
(112, 'Tetulia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 14),
(113, 'Badarganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(114, 'GangachharaUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(115, 'Kaunia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(116, 'Rangpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(117, 'Mithapukur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(118, 'Pirgachha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(119, 'Pirganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(120, 'Taraganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 15),
(121, 'Baliadangi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 16),
(122, 'Haripur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 16),
(123, 'Pirganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 16),
(124, 'Ranisankail Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 16),
(125, 'Thakurgaon Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 16),
(126, 'Atpara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(127, 'Barhatta Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(128, 'Durgapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(129, 'Khaliajuri Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(130, 'Kalmakanda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(131, 'Kendua Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(132, 'Madan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(133, 'Mohanganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(134, 'Netrokona Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(135, 'Purbadhala Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 17),
(136, 'Jhenaigati Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 18),
(137, 'Nakla Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 18),
(138, 'Nalitabari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 18),
(139, 'Sherpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 18),
(140, 'Sreebardi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 18),
(141, 'Baksiganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(142, 'Dewanganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(143, 'Islampur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(144, 'Jamalpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(145, 'Madarganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(146, 'Melandaha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(147, 'Sarishabari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 19),
(148, 'Trishal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(149, 'Dhobaura Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(150, 'Fulbaria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(151, 'Gafargaon Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(152, 'Gauripur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(153, 'Haluaghat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(154, 'Ishwarganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(155, 'Mymensingh Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(156, 'MuktagachhaUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(157, 'Nandail Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(158, 'Phulpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(159, 'Bhaluka Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(160, 'Tara KhandaUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 20),
(161, 'Amtali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 21),
(162, 'Bamna Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 21),
(163, 'Barguna Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 21),
(164, 'Betagi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 21),
(165, 'Patharghata Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 21),
(166, 'Taltali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 21),
(167, 'Agailjhara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(168, 'Babuganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(169, 'Bakerganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(170, 'Banaripara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(171, 'Gaurnadi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(172, 'Hizla Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(173, 'BarishalSadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(174, 'Mehendiganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(175, 'Muladi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(176, 'Wazirpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 22),
(177, 'Bhola Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(178, 'BurhanuddinUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(179, 'Char Fasson Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(180, 'Daulatkhan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(181, 'Lalmohan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(182, 'Manpura Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(183, 'Tazumuddin Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 23),
(184, 'Jhalokati Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 24),
(185, 'Kathalia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 24),
(186, 'Nalchity Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 24),
(187, 'Rajapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 24),
(188, 'Bauphal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(189, 'Dashmina Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(190, 'Galachipa Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(191, 'Kalapara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(192, 'Mirzaganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(193, 'Patuakhali Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(194, 'Rangabali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(195, 'Dumki Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 25),
(196, 'Bhandaria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(197, 'Kawkhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(198, 'Mathbaria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(199, 'Nazirpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(200, 'Pirojpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(201, 'Nesarabad(Swarupkati) Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(202, 'Indurkani Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 26),
(203, 'Ali Kadam Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(204, 'Bandarban Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(205, 'Lama Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(206, 'Naikhongchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(207, 'Rowangchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(208, 'Ruma Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(209, 'Thanchi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 27),
(210, 'Akhaura Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(211, 'Bancharampur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(212, 'Brahmanbaria SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(213, 'Kasba Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(214, 'Nabinagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(215, 'Nasirnagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(216, 'Sarail Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(217, 'Ashuganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(218, 'Bijoynagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 28),
(219, 'Chandpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(220, 'Faridganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(221, 'Haimchar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(222, 'Haziganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(223, 'Kachua Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(224, 'Matlab Dakshin Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(225, 'Matlab Uttar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(226, 'Shahrasti Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 29),
(227, 'Anwara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(228, 'Banshkhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(229, 'Boalkhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(230, 'Chandanaish Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(231, 'Fatikchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(232, 'Hathazari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(233, 'Karnaphuli Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(234, 'LohagaraUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(235, 'Mirsharai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(236, 'Patiya Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(237, 'Rangunia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(238, 'Raozan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(239, 'Sandwip Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(240, 'Satkania Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(241, 'Sitakunda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 30),
(242, 'Barura Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(243, 'Brahmanpara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(244, 'Burichang Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(245, 'Chandina Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(246, 'Chauddagram Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(247, 'Daudkandi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(248, 'Debidwar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(249, 'Homna Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(250, 'Laksam Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(251, 'Lalmai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(252, 'Muradnagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(253, 'Nangalkot Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(254, 'Cumilla Adarsha Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(255, 'Meghna Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(256, 'Titas Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(257, 'MonohargonjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(258, 'Cumilla Sadar Dakshin Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 31),
(259, 'Chakaria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(260, 'Cox\'s Bazar SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(261, 'Kutubdia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(262, 'Maheshkhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(263, 'Ramu Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(264, 'Teknaf Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(265, 'Ukhia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(266, 'Pekua Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 32),
(267, 'Chhagalnaiya Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 33),
(268, 'Daganbhuiyan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 33),
(269, 'Feni Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 33),
(270, 'Parshuram Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 33),
(271, 'Sonagazi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 33),
(272, 'Fulgazi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 33),
(273, 'Dighinala Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(274, 'KhagrachhariUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(275, 'Lakshmichhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(276, 'Mahalchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(277, 'Manikchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(278, 'Matiranga Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(279, 'Panchhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(280, 'Ramgarh Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 34),
(281, 'Lakshmipur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 35),
(282, 'Raipur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 35),
(283, 'Ramganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 35),
(284, 'Ramgati Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 35),
(285, 'Kamalnagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 35),
(286, 'Begumganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(287, 'Noakhali Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(288, 'Chatkhil Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(289, 'CompaniganjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(290, 'Hatiya Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(291, 'Senbagh Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(292, 'Sonaimuri Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(293, 'SubarnacharUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(294, 'Kabirhat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 36),
(295, 'Bagaichhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(296, 'Barkal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(297, 'Kawkhali(Betbunia) Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(298, 'Belaichhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(299, 'Kaptai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(300, 'Juraichhari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(301, 'Langadu Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(302, 'NaniyacharUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(303, 'Rajasthali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(304, 'Rangamati Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 37),
(305, 'Metropolitan Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(306, 'Adabor Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(307, 'Uttar Khan Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(308, 'Uttara Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(309, 'Kadamtali Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(310, 'Kalabagan Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(311, 'Kafrul Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(312, 'Kamrangirchar Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(313, 'Cantonment Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(314, 'Kotwali Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(315, 'Khilkhet Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(316, 'Khilgaon Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(317, 'Gulshan Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(318, 'Gendaria Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(319, 'Chawkbazar Model Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(320, 'Demra Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(321, 'Turag Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(322, 'Tejgaon Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(323, 'Tejgaon I/A Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(324, 'Dakshinkhan Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(325, 'Darus Salam Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(326, 'Dhanmondi  Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(327, 'New Market Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(328, 'Paltan Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(329, 'Pallabi Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(330, 'Bangshal Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(331, 'Badda Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(332, 'Bimanbandar Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(333, 'Motijheel Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(334, 'Mirpur Model Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(335, 'Mohammadpur Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(336, 'Jatrabari Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(337, 'Ramna Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(338, 'Rampura Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(339, 'Lalbagh Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(340, 'Shah Ali Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(341, 'Shahbagh Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(342, 'Sher-e-Bangla Nagar Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(343, 'Shyampur Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(344, 'Sabujbagh Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(345, 'Sutrapur Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(346, 'Hazaribagh Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(347, 'Dhamrai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(348, 'Dohar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(349, 'Keraniganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(350, 'Nawabganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(351, 'Savar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(352, 'Tejgaon Circle Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 38),
(353, 'Gazipur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 39),
(354, 'Kaliakair Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 39),
(355, 'Kaliganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 39),
(356, 'Kapasia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 39),
(357, 'Sreepur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 39),
(358, 'Gopalganj Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 40),
(359, 'Kashiani Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 40),
(360, 'Kotalipara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 40),
(361, 'Muksudpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 40),
(362, 'Tungipara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 40),
(363, 'Austagram Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(364, 'Bajitpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(365, 'Bhairab Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(366, 'Hossainpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(367, 'Itna Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(368, 'Karimganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(369, 'Katiadi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(370, 'Kishoreganj SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(371, 'Kuliarchar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(372, 'Mithamain Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(373, 'Nikli Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(374, 'Pakundia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(375, 'Tarail Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 41),
(376, 'Rajoir Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 42),
(377, 'MadaripurSadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 42),
(378, 'Kalkini Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 42),
(379, 'Shibchar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 42),
(380, 'DaulatpurUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(381, 'Ghior Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(382, 'Harirampur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(383, 'ManikgonjSadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(384, 'Saturia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(385, 'Shivalaya Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(386, 'Singair Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 43),
(387, 'Gazaria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 44),
(388, 'Lohajang Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 44),
(389, 'Munshiganj Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 44),
(390, 'Sirajdikhan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 44),
(391, 'Sreenagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 44),
(392, 'Tongibari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 44),
(393, 'Araihazar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 45),
(394, 'Bandar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 45),
(395, 'Narayanganj SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 45),
(396, 'Rupganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 45),
(397, 'Sonargaon Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 45),
(398, 'Baliakandi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 46),
(399, 'GoalandaghatUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 46),
(400, 'Pangsha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 46),
(401, 'Rajbari Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 46),
(402, 'Kalukhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 46),
(403, 'Bhedarganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(404, 'Damudya Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(405, 'Gosairhat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(406, 'Naria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(407, 'Shariatpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(408, 'Zajira Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(409, 'Shakhipur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 47),
(410, 'Alfadanga Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(411, 'Bhanga Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(412, 'Boalmari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(413, 'Charbhadrasan Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(414, 'Faridpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(415, 'Madhukhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(416, 'Nagarkanda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(417, 'Sadarpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(418, 'Saltha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 48),
(419, 'Gopalpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(420, 'Basail Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(421, 'Bhuapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(422, 'Delduar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(423, 'Ghatail Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(424, 'Kalihati Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(425, 'Madhupur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(426, 'Mirzapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(427, 'Nagarpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(428, 'Sakhipur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(429, 'Dhanbari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(430, 'Tangail Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 49),
(431, 'Narsingdi Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 50),
(432, 'Belabo Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 50),
(433, 'Monohardi Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 50),
(434, 'Palash Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 50),
(435, 'RaipuraUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 50),
(436, 'Shibpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 50),
(437, 'Bagerhat Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(438, 'Chitalmari Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(439, 'Fakirhat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(440, 'Kachua Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(441, 'Mollahat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(442, 'Mongla Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(443, 'Morrelganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(444, 'Rampal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(445, 'Sarankhola Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 51),
(446, 'Alamdanga Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 52),
(447, 'Chuadanga Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 52),
(448, 'Damurhuda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 52),
(449, 'Jibannagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 52),
(450, 'Abhaynagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(451, 'Bagherpara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(452, 'Chaugachha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(453, 'JhikargachhaUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(454, 'Keshabpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(455, 'Jashore SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(456, 'Manirampur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(457, 'Sharsha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 53),
(458, 'Harinakunda Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 54),
(459, 'Jhenaidah Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 54),
(460, 'Kaliganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 54),
(461, 'Kotchandpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 54),
(462, 'Maheshpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 54),
(463, 'Shailkupa Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 54),
(464, 'Batiaghata Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(465, 'Dacope Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(466, 'Dumuria Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(467, 'Dighalia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(468, 'Koyra Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(469, 'Paikgachha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(470, 'Phultala Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(471, 'Rupsha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(472, 'Terokhada Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 55),
(473, 'Bheramara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 56),
(474, 'Daulatpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 56),
(475, 'Khoksa Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 56),
(476, 'Kumarkhali Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 56),
(477, 'Kushtia Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 56),
(478, 'Mirpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 56),
(479, 'Magura Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 57),
(480, 'Mohammadpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 57),
(481, 'Shalikha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 57),
(482, 'Sreepur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 57),
(483, 'Gangni Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 58),
(484, 'Meherpur Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 58),
(485, 'Mujibnagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 58),
(486, 'Kalia Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 59),
(487, 'Lohagara Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 59),
(488, 'Narail Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 59),
(489, 'Naragati Thana', '2023-07-18 02:29:37.183232', NULL, NULL, 59),
(490, 'Assasuni Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(491, 'Debhata Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(492, 'Kalaroa Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(493, 'Kaliganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(494, 'Satkhira Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(495, 'Shyamnagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(496, 'Tala Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 60),
(497, 'Ajmiriganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(498, 'Bahubal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(499, 'BaniyachongUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(500, 'Chunarughat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(501, 'Habiganj Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(502, 'Lakhai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(503, 'Madhabpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(504, 'Nabiganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(505, 'SayestaganjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 61),
(506, 'Barlekha Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(507, 'Juri Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(508, 'Kamalganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(509, 'Kulaura Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(510, 'Moulvibazar SadarUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(511, 'Rajnagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(512, 'Sreemangal Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 62),
(513, 'Bishwamvarpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(514, 'Chhatak Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(515, 'Dakshin SunamganjUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(516, 'Derai Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(517, 'DharamapashaUpazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(518, 'Dowarabazar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(519, 'Jagannathpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(520, 'Jamalganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(521, 'Sullah Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(522, 'Sunamganj Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(523, 'Tahirpur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 63),
(524, 'Balaganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(525, 'Beanibazar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(526, 'Bishwanath Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(527, 'Companigonj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(528, 'Dakshin Surma Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(529, 'Fenchuganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(530, 'Golapganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(531, 'Gowainghat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(532, 'Jaintiapur Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(533, 'Kanaighat Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(534, 'Osmani Nagar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(535, 'Sylhet Sadar Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64),
(536, 'Zakiganj Upazila', '2023-07-18 02:29:37.183232', NULL, NULL, 64);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `email`, `password`, `hash`, `role`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', 'active', '2023-07-02 23:27:25.000000', NULL, NULL),
(2, 'mamun', 'mamunmiaturan@gmail.com', '12345678', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'patient', 'active', '2023-08-16 10:44:23.132539', NULL, NULL),
(3, 'meherun', 'meherun.nesa@gmail.com', '12345678', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'doctor', 'inactive', '2023-08-16 11:00:22.853511', NULL, NULL),
(4, 'Ahmed_Sharif', 'vygozeh@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:38:24.024375', NULL, NULL),
(5, 'Misbah', 'lyfun@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:44:02.184040', NULL, NULL),
(6, 'Marjiara', 'wefetoxi@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:49:52.963233', NULL, NULL),
(7, 'Rowshan-Ara', 'keva@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:51:53.801097', NULL, NULL),
(8, 'tifakugama', 'satop@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:58:07.158817', NULL, NULL),
(9, 'xabokycuci', 'keti@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:59:02.407981', NULL, NULL),
(10, 'wylumimev', 'vyhapojoz@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 10:59:50.594637', NULL, NULL),
(11, 'sezezuv', 'necidux@mailinator.com', 'Pa$$w0rd!', 'b2fe8b46929bfa4c65fee9d5d43a2423799b18e360782e9abc27bd420877243e', 'doctor', 'active', '2023-09-04 11:00:29.214192', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_article_created_by_id_73fd01a5_fk_user_user_id` (`created_by_id`),
  ADD KEY `article_article_modified_by_id_8d3ee9ee_fk_user_user_id` (`modified_by_id`);

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
-- Indexes for table `bodypart`
--
ALTER TABLE `bodypart`
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
  ADD KEY `department_speci_dep_department_id_c9268ec5_fk_departmen` (`department_id`),
  ADD KEY `department_speci_dep_organ_problem_specif_31a794fd_fk_organ_pro` (`organ_problem_specification_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_data_distri_division_id_8de7ada1_fk_personal_` (`division_id`);

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
-- Indexes for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_availability_doctor_profile_id_d59b238f_fk_doctor_do` (`doctor_profile_id`);

--
-- Indexes for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_awards_doctor_profile_id_48d2d29b_fk_doctor_do` (`doctor_profile_id`);

--
-- Indexes for table `doctor_doctor_profile`
--
ALTER TABLE `doctor_doctor_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_doctor_profil_blood_group_id_0492c90d_fk_personal_` (`blood_group_id`),
  ADD KEY `doctor_doctor_profil_department_id_705d3e2d_fk_departmen` (`department_id`),
  ADD KEY `doctor_doctor_profil_gender_id_d6acaa82_fk_personal_` (`gender_id`),
  ADD KEY `doctor_doctor_profil_matrimony_id_532db78f_fk_personal_` (`matrimony_id`),
  ADD KEY `doctor_doctor_profil_religion_id_b48aa139_fk_personal_` (`religion_id`),
  ADD KEY `doctor_doctor_profile_user_id_a868c621_fk_user_user_id` (`user_id`);

--
-- Indexes for table `doctor_education`
--
ALTER TABLE `doctor_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_education_doctor_profile_id_a90958e9_fk_doctor_do` (`doctor_profile_id`),
  ADD KEY `doctor_education_board_id_ddb8e82e_fk_personal_data_board_id` (`board_id`);

--
-- Indexes for table `doctor_images`
--
ALTER TABLE `doctor_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_images_doctor_profile_id_66d3c6ad_fk_doctor_do` (`doctor_profile_id`);

--
-- Indexes for table `doctor_permanentaddress`
--
ALTER TABLE `doctor_permanentaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_permanentaddr_doctor_profile_id_61ded381_fk_doctor_do` (`doctor_profile_id`),
  ADD KEY `doctor_permanentaddr_permanent_district_i_2b8ea53f_fk_personal_` (`permanent_district_id`),
  ADD KEY `doctor_permanentaddr_permanent_division_i_f685ca3b_fk_personal_` (`permanent_division_id`),
  ADD KEY `doctor_permanentaddr_permanent_upazila_id_cd1f6979_fk_personal_` (`permanent_upazila_id`);

--
-- Indexes for table `doctor_presentaddress`
--
ALTER TABLE `doctor_presentaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_presentaddres_doctor_profile_id_d9d0d4b1_fk_doctor_do` (`doctor_profile_id`),
  ADD KEY `doctor_presentaddres_present_district_id_dec7d124_fk_personal_` (`present_district_id`),
  ADD KEY `doctor_presentaddres_present_division_id_3d0ae5c9_fk_personal_` (`present_division_id`),
  ADD KEY `doctor_presentaddres_present_upazila_id_1f84e4c8_fk_personal_` (`present_upazila_id`);

--
-- Indexes for table `doctor_services`
--
ALTER TABLE `doctor_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_services_doctor_profile_id_01dd2e68_fk_doctor_do` (`doctor_profile_id`);

--
-- Indexes for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_social_media_doctor_profile_id_b8ca1381_fk_doctor_do` (`doctor_profile_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_faq_created_by_id_c5bdb65c_fk_user_user_id` (`created_by_id`),
  ADD KEY `faq_faq_modified_by_id_fa7d188f_fk_user_user_id` (`modified_by_id`);

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
-- Indexes for table `matrimony`
--
ALTER TABLE `matrimony`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organ`
--
ALTER TABLE `organ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organ_organ_body_part_id_47ba3545_fk_bodypart_bodypart_id` (`body_part_id`);

--
-- Indexes for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organ_problem_speci__organ_id_c9927d21_fk_organ_org` (`organ_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifyotp_varifyotp_user_id_59225dda_fk_user_user_id` (`user_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_patient_prof_blood_group_id_1f3a85da_fk_personal_` (`blood_group_id`),
  ADD KEY `patient_patient_prof_gender_id_9d3712ce_fk_personal_` (`gender_id`),
  ADD KEY `patient_patient_prof_matrimony_id_ca18d646_fk_personal_` (`matrimony_id`),
  ADD KEY `patient_patient_prof_religion_id_ef1fc635_fk_personal_` (`religion_id`),
  ADD KEY `patient_patient_profile_user_id_8ab50d3c_fk_user_user_id` (`user_id`);

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
  ADD KEY `personal_data_upazil_district_id_219b4e70_fk_personal_` (`district_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

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
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `board`
--
ALTER TABLE `board`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bodypart`
--
ALTER TABLE `bodypart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `department_speci`
--
ALTER TABLE `department_speci`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctor_doctor_profile`
--
ALTER TABLE `doctor_doctor_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor_education`
--
ALTER TABLE `doctor_education`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_images`
--
ALTER TABLE `doctor_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor_permanentaddress`
--
ALTER TABLE `doctor_permanentaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor_presentaddress`
--
ALTER TABLE `doctor_presentaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor_services`
--
ALTER TABLE `doctor_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrimony`
--
ALTER TABLE `matrimony`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `organ`
--
ALTER TABLE `organ`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permanent_address`
--
ALTER TABLE `permanent_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `present_address`
--
ALTER TABLE `present_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_article_created_by_id_73fd01a5_fk_user_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `article_article_modified_by_id_8d3ee9ee_fk_user_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

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
  ADD CONSTRAINT `department_speci_dep_department_id_c9268ec5_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `department_speci_dep_organ_problem_specif_31a794fd_fk_organ_pro` FOREIGN KEY (`organ_problem_specification_id`) REFERENCES `organ_problem_speci` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `personal_data_distri_division_id_8de7ada1_fk_personal_` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  ADD CONSTRAINT `doctor_availability_doctor_profile_id_d59b238f_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`);

--
-- Constraints for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  ADD CONSTRAINT `doctor_awards_doctor_profile_id_48d2d29b_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`);

--
-- Constraints for table `doctor_doctor_profile`
--
ALTER TABLE `doctor_doctor_profile`
  ADD CONSTRAINT `doctor_doctor_profil_blood_group_id_0492c90d_fk_personal_` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_group` (`id`),
  ADD CONSTRAINT `doctor_doctor_profil_department_id_705d3e2d_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `doctor_doctor_profil_gender_id_d6acaa82_fk_personal_` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `doctor_doctor_profil_matrimony_id_532db78f_fk_personal_` FOREIGN KEY (`matrimony_id`) REFERENCES `matrimony` (`id`),
  ADD CONSTRAINT `doctor_doctor_profil_religion_id_b48aa139_fk_personal_` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`),
  ADD CONSTRAINT `doctor_doctor_profile_user_id_a868c621_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `doctor_education`
--
ALTER TABLE `doctor_education`
  ADD CONSTRAINT `doctor_education_board_id_ddb8e82e_fk_personal_data_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`),
  ADD CONSTRAINT `doctor_education_doctor_profile_id_a90958e9_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`);

--
-- Constraints for table `doctor_images`
--
ALTER TABLE `doctor_images`
  ADD CONSTRAINT `doctor_images_doctor_profile_id_66d3c6ad_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`);

--
-- Constraints for table `doctor_permanentaddress`
--
ALTER TABLE `doctor_permanentaddress`
  ADD CONSTRAINT `doctor_permanentaddr_doctor_profile_id_61ded381_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`),
  ADD CONSTRAINT `doctor_permanentaddr_permanent_district_i_2b8ea53f_fk_personal_` FOREIGN KEY (`permanent_district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `doctor_permanentaddr_permanent_division_i_f685ca3b_fk_personal_` FOREIGN KEY (`permanent_division_id`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `doctor_permanentaddr_permanent_upazila_id_cd1f6979_fk_personal_` FOREIGN KEY (`permanent_upazila_id`) REFERENCES `upazila` (`id`);

--
-- Constraints for table `doctor_presentaddress`
--
ALTER TABLE `doctor_presentaddress`
  ADD CONSTRAINT `doctor_presentaddres_doctor_profile_id_d9d0d4b1_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`),
  ADD CONSTRAINT `doctor_presentaddres_present_district_id_dec7d124_fk_personal_` FOREIGN KEY (`present_district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `doctor_presentaddres_present_division_id_3d0ae5c9_fk_personal_` FOREIGN KEY (`present_division_id`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `doctor_presentaddres_present_upazila_id_1f84e4c8_fk_personal_` FOREIGN KEY (`present_upazila_id`) REFERENCES `upazila` (`id`);

--
-- Constraints for table `doctor_services`
--
ALTER TABLE `doctor_services`
  ADD CONSTRAINT `doctor_services_doctor_profile_id_01dd2e68_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`);

--
-- Constraints for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  ADD CONSTRAINT `doctor_social_media_doctor_profile_id_b8ca1381_fk_doctor_do` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_doctor_profile` (`id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_faq_created_by_id_c5bdb65c_fk_user_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `faq_faq_modified_by_id_fa7d188f_fk_user_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_user_id_401d96d0_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `organ`
--
ALTER TABLE `organ`
  ADD CONSTRAINT `organ_organ_body_part_id_47ba3545_fk_bodypart_bodypart_id` FOREIGN KEY (`body_part_id`) REFERENCES `bodypart` (`id`);

--
-- Constraints for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  ADD CONSTRAINT `organ_problem_speci__organ_id_c9927d21_fk_organ_org` FOREIGN KEY (`organ_id`) REFERENCES `organ` (`id`);

--
-- Constraints for table `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `verifyotp_varifyotp_user_id_59225dda_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_patient_prof_blood_group_id_1f3a85da_fk_personal_` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_group` (`id`),
  ADD CONSTRAINT `patient_patient_prof_gender_id_9d3712ce_fk_personal_` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `patient_patient_prof_matrimony_id_ca18d646_fk_personal_` FOREIGN KEY (`matrimony_id`) REFERENCES `matrimony` (`id`),
  ADD CONSTRAINT `patient_patient_prof_religion_id_ef1fc635_fk_personal_` FOREIGN KEY (`religion_id`) REFERENCES `religion` (`id`),
  ADD CONSTRAINT `patient_patient_profile_user_id_8ab50d3c_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `permanent_address`
--
ALTER TABLE `permanent_address`
  ADD CONSTRAINT `permanent_address_permanent_district_id_d3ecbc22_fk_district_id` FOREIGN KEY (`permanent_district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `permanent_address_permanent_division_id_30c9f9fe_fk_division_id` FOREIGN KEY (`permanent_division_id`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `permanent_address_permanent_upazila_id_d00d1369_fk_upazila_id` FOREIGN KEY (`permanent_upazila_id`) REFERENCES `upazila` (`id`),
  ADD CONSTRAINT `permanent_address_user_id_d9af6d04_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
  ADD CONSTRAINT `personal_data_upazil_district_id_219b4e70_fk_personal_` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
