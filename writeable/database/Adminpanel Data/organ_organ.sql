-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 08:54 PM
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
-- Table structure for table `organ_organ`
--

CREATE TABLE `organ_organ` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `body_part_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organ_organ`
--

INSERT INTO `organ_organ` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`, `body_part_id`) VALUES
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `organ_organ`
--
ALTER TABLE `organ_organ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organ_organ_body_part_id_47ba3545_fk_bodypart_bodypart_id` (`body_part_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `organ_organ`
--
ALTER TABLE `organ_organ`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `organ_organ`
--
ALTER TABLE `organ_organ`
  ADD CONSTRAINT `organ_organ_body_part_id_47ba3545_fk_bodypart_bodypart_id` FOREIGN KEY (`body_part_id`) REFERENCES `bodypart_bodypart` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
