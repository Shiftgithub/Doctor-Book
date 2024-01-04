-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2024 at 08:09 PM
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
(1, '2024-01-03 12:26:15.132840', NULL, NULL, 'Mamun Mia', 'Kasem Ali', 'Hasina Begum', '+8801965572363', '2001-07-22', 1234567890, 'Dhaka , Narayanganj, Rupganj , Borpa , Dokkhin Masabo', 5, 1, 2, 1, 1);

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

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `created_at`, `updated_at`, `deleted_at`, `heading`, `tag`, `description`, `image`, `created_by_id`, `modified_by_id`) VALUES
(1, '2024-01-04 16:42:24.423590', NULL, NULL, 'Understanding Cancer: A Comprehensive Overview', 'Oncology', 'Introduction\r\nCancer is a complex and pervasive group of diseases characterized by the uncontrolled growth and spread of abnormal cells. It can affect virtually any part of the body, leading to a multitude of health challenges. In this article, we will explore the basics of cancer, its causes, common types, detection methods, and available treatments.\r\n\r\nWhat is Cancer?\r\nCancer occurs when the body\'s normal control mechanisms stop working. Old cells do not die, and instead, they form a mass of tissue known as a tumor. Not all tumors are cancerous; benign tumors do not spread to other parts of the body, while malignant tumors are cancerous and can invade surrounding tissues.\r\n\r\nCauses of Cancer\r\nUnderstanding the factors that contribute to cancer is crucial for prevention and early detection. The causes of cancer are multifaceted and may include genetic predisposition, environmental factors, lifestyle choices, and exposure to carcinogens.\r\n\r\nCommon Types of Cancer\r\nCancer can manifest in various forms, each with its unique characteristics and treatment approaches. Some of the most prevalent types include breast cancer, lung cancer, prostate cancer, colorectal cancer, and leukemia.\r\n\r\nBreast Cancer\r\nBreast cancer is a type of cancer that originates in the cells of the breast. It can occur in both men and women, though it is far more common in women.\r\n\r\nLung Cancer\r\nLung cancer primarily affects the lungs and is often associated with tobacco smoking. However, non-smokers can also develop lung cancer due to other risk factors.\r\n\r\nProstate Cancer\r\nProstate cancer occurs in the prostate, a small gland that produces seminal fluid in men. It is one of the most common cancers in men.\r\n\r\nColorectal Cancer\r\nColorectal cancer affects the colon or rectum and usually begins as a growth called a polyp. Early detection through screening can prevent its progression.\r\n\r\nLeukemia\r\nLeukemia is a cancer of the blood and bone marrow, resulting in the overproduction of abnormal white blood cells. It can be acute or chronic and requires specialized treatments.\r\n\r\nDetecting Cancer\r\nEarly detection significantly improves the chances of successful cancer treatment. Common methods of cancer detection include screenings, imaging tests, and biopsy procedures.\r\n\r\nCancer Treatment Options\r\nTreatment for cancer varies based on the type, stage, and location of the disease. Options include surgery, chemotherapy, radiation therapy, immunotherapy, and targeted therapy.\r\n\r\nConclusion\r\nCancer remains a formidable health challenge, but advancements in research and technology have led to improved diagnosis and treatment options. Understanding the basics of cancer, its causes, and available treatments is essential for both prevention and coping with a cancer diagnosis.', 'uploads/article_images/20240104231125_cancer.png', 1, 1),
(2, '2024-01-04 16:53:22.086476', NULL, NULL, 'Brain Cancer: A Unique Challenge', 'Neurology', 'Brain Cancer Overview\r\nBrain cancer is a specific type of cancer that originates in the tissues of the brain or spinal cord. Unlike cancers in other parts of the body, brain cancers can pose unique challenges due to the complexity and sensitivity of the central nervous system.\r\n\r\nTypes of Brain Cancer\r\nThere are various types of brain cancers, with gliomas being the most common. Glioblastoma multiforme (GBM), an aggressive form of glioma, is particularly challenging due to its rapid growth and resistance to treatment.\r\n\r\nSymptoms of Brain Cancer\r\nSymptoms of brain cancer can vary but may include persistent headaches, seizures, difficulty speaking or comprehending language, changes in personality, and impaired motor function. Early detection is crucial for timely intervention.\r\n\r\nCauses and Risk Factors\r\nWhile the exact causes of brain cancer are not always clear, certain risk factors may contribute to its development. These factors include exposure to radiation, family history of brain tumors, and certain genetic conditions.\r\n\r\nDiagnosis and Treatment\r\nDiagnosis\r\nDiagnosing brain cancer often involves imaging tests such as MRIs or CT scans, followed by a biopsy to confirm the type and grade of the tumor. The location of the tumor within the brain is a critical factor in determining the best course of treatment.\r\n\r\nTreatment\r\nTreatment for brain cancer depends on factors like the type, grade, and location of the tumor. Common treatment modalities include surgery to remove the tumor, radiation therapy, and chemotherapy. In some cases, a combination of these approaches may be recommended.\r\n\r\nOngoing Research and Hope for the Future\r\nMedical research is continually advancing our understanding of brain cancer, leading to the development of novel treatments and therapeutic approaches. Clinical trials and research studies offer hope for improved outcomes and quality of life for individuals diagnosed with brain cancer.\r\n\r\nConclusion\r\nBrain cancer presents a unique set of challenges due to its location within the central nervous system. Understanding the symptoms, risk factors, and available treatment options is crucial for early detection and effective management of this complex disease.', 'uploads/article_images/20240104225322_brain_cancer.png', 1, NULL),
(3, '2024-01-04 17:14:55.742016', NULL, NULL, 'Blood Cancer: Unraveling the Complexity', 'Hematology', 'Blood Cancer Overview\r\nBlood cancer, also known as hematologic cancer, originates in the blood-forming tissues, such as the bone marrow and lymphatic system. This category includes various types of cancers affecting the blood, bone marrow, lymph nodes, and immune system.\r\n\r\nTypes of Blood Cancer\r\nThere are three main types of blood cancer: leukemia, lymphoma, and myeloma.\r\n\r\nLeukemia: Affects the blood and bone marrow, causing an overproduction of abnormal white blood cells.\r\n\r\nLymphoma: Targets the lymphatic system, leading to the abnormal growth of lymphocytes, a type of white blood cell.\r\n\r\nMyeloma: Impacts plasma cells, a type of white blood cell that produces antibodies, resulting in weakened immune function.\r\n\r\nSymptoms of Blood Cancer\r\nCommon symptoms include fatigue, unexplained weight loss, frequent infections, easy bruising or bleeding, and swollen lymph nodes. Early diagnosis is crucial for effective treatment.\r\n\r\nCauses and Risk Factors\r\nThe causes of blood cancer are often complex and may involve genetic, environmental, and immune system factors. Some risk factors include exposure to certain chemicals or radiation, family history, and specific genetic mutations.\r\n\r\nDiagnosis and Treatment\r\nDiagnosis\r\nBlood cancer is typically diagnosed through blood tests, bone marrow biopsy, and imaging studies. Identifying the specific type and stage of blood cancer is essential for tailoring an effective treatment plan.\r\n\r\nTreatment\r\nTreatment approaches for blood cancer vary based on the type and stage of the disease. Common treatments include chemotherapy, radiation therapy, stem cell transplantation, and targeted therapies designed to address specific characteristics of cancer cells.\r\n\r\nOngoing Research and Progress\r\nResearch in blood cancer focuses on developing targeted therapies, immunotherapies, and improving the understanding of genetic factors influencing the disease. Clinical trials play a crucial role in testing new treatments and advancing our knowledge.\r\n\r\nConclusion\r\nBlood cancer encompasses a range of conditions affecting the blood and immune system. Recognizing early symptoms, understanding risk factors, and staying informed about evolving treatment options are vital for individuals and their families facing a blood cancer diagnosis.', 'uploads/article_images/20240104231455_blood_cancer.png', 1, NULL),
(4, '2024-01-04 17:24:20.381366', NULL, NULL, 'Understanding Migraine: Unraveling the Complexity of Headache Disorders', 'Migraine', 'Introduction\r\nMigraine is a neurological disorder characterized by recurring moderate to severe headaches, often accompanied by other symptoms such as nausea, sensitivity to light, and visual disturbances. These episodes, known as migraine attacks, can significantly impact an individual\'s quality of life. In this article, we delve into the intricacies of migraines, exploring their causes, symptoms, triggers, and available treatment options.\r\n\r\nWhat is Migraine?\r\nMigraine is not simply a severe headache; it is a complex neurological condition involving abnormal brain activity. The exact cause of migraines is not fully understood, but a combination of genetic and environmental factors is believed to contribute. Migraine attacks often go beyond head pain, involving the activation of the trigeminal nerve, leading to a cascade of symptoms.\r\n\r\nSymptoms of Migraine\r\nMigraine symptoms can vary from person to person, but common features include:\r\n\r\nIntense Headache: Typically throbbing or pulsating, often on one side of the head.\r\nSensory Sensitivity: Increased sensitivity to light (photophobia) and sound (phonophobia).\r\nNausea and Vomiting: Gastrointestinal symptoms frequently accompany migraine attacks.\r\nAura: Some individuals experience visual disturbances, such as flashes of light or blind spots, before or during a migraine.\r\nTriggers and Contributing Factors\r\nIdentifying triggers is crucial for managing migraines. Common triggers include:\r\n\r\nHormonal Changes: Many women experience migraines related to their menstrual cycle.\r\nCertain Foods: Trigger foods vary, but common culprits include chocolate, cheese, and processed foods.\r\nStress: Emotional stress and tension can trigger migraines.\r\nSleep Patterns: Irregular sleep patterns or insufficient sleep may contribute.\r\nEnvironmental Factors: Strong smells, bright lights, and changes in weather can trigger migraines for some.\r\nDiagnosis\r\nDiagnosing migraines involves a thorough medical history, symptom analysis, and, in some cases, imaging studies to rule out other potential causes. The International Classification of Headache Disorders provides criteria for diagnosing various types of migraines.\r\n\r\nTreatment Options\r\nLifestyle Modifications\r\nTrigger Management: Identifying and avoiding triggers can help reduce the frequency of migraine attacks.\r\nRegular Sleep: Establishing a consistent sleep pattern is essential for migraine management.\r\nStress Reduction: Stress management techniques, such as relaxation exercises and mindfulness, can be beneficial.\r\nMedications\r\nAcute Medications: Over-the-counter pain relievers and prescription medications can help alleviate pain during a migraine attack.\r\nPreventive Medications: For individuals with frequent or severe migraines, preventive medications may be prescribed to reduce the frequency and intensity of attacks.\r\nEmerging Therapies\r\nAdvancements in migraine research have led to the development of novel therapies, including:\r\n\r\nCGRP Inhibitors: Monoclonal antibodies targeting calcitonin gene-related peptide (CGRP), a key player in migraines.\r\nNeuromodulation Devices: Devices such as transcutaneous electrical nerve stimulation (TENS) and vagus nerve stimulation show promise in migraine management.\r\nConclusion\r\nWhile migraines can be challenging to manage, a comprehensive approach combining lifestyle modifications, trigger management, and appropriate medications can significantly improve the quality of life for those affected. Ongoing research continues to deepen our understanding of migraines and pave the way for innovative treatment options.\r\n\r\nIf you suspect you have migraines or experience recurrent severe headaches, consult with a healthcare professional for an accurate diagnosis and personalized treatment plan.', 'uploads/article_images/20240104232420_Migraine.png', 1, NULL),
(5, '2024-01-04 17:37:00.420942', NULL, NULL, 'Navigating Diabetes: Understanding, Managing, and Thriving', 'Diabetes', 'Introduction\r\nDiabetes is a chronic health condition characterized by elevated levels of blood glucose (sugar) due to either insufficient insulin production or the body\'s ineffective use of insulin. With millions of individuals worldwide grappling with diabetes, it is crucial to comprehend the intricacies of this condition. This article aims to shed light on the types of diabetes, symptoms, risk factors, and effective management strategies.\r\n\r\nTypes of Diabetes\r\nType 1 Diabetes\r\nIn Type 1 diabetes, the immune system mistakenly attacks and destroys insulin-producing beta cells in the pancreas. This results in little to no insulin production, requiring individuals to rely on insulin injections for survival.\r\n\r\nType 2 Diabetes\r\nType 2 diabetes, more common among adults, involves the body\'s inability to use insulin effectively. While genetics play a role, lifestyle factors such as poor diet and sedentary behavior contribute significantly to its development.\r\n\r\nGestational Diabetes\r\nGestational diabetes occurs during pregnancy when hormonal changes affect insulin\'s effectiveness. Though it usually resolves after childbirth, it increases the risk of Type 2 diabetes later in life.\r\n\r\nSymptoms of Diabetes\r\nRecognizing the signs of diabetes is crucial for early diagnosis and management. Common symptoms include:\r\n\r\nExcessive Thirst and Hunger\r\nFrequent Urination\r\nFatigue\r\nUnexplained Weight Loss\r\nBlurred Vision\r\nSlow Wound Healing\r\nRisk Factors\r\nSeveral factors increase the risk of developing diabetes:\r\n\r\nFamily History\r\nAge (Risk Increases with Age)\r\nObesity or Excess Body Weight\r\nPhysical Inactivity\r\nUnhealthy Diet High in Sugars and Processed Foods\r\nDiagnosis and Monitoring\r\nDiabetes is diagnosed through blood tests measuring blood glucose levels. Regular monitoring helps individuals manage their condition effectively, preventing complications.\r\n\r\nDiabetes Management\r\nLifestyle Modifications\r\nHealthy Eating: Adopting a balanced, nutrient-dense diet is crucial. Monitoring carbohydrate intake and choosing whole foods can help manage blood sugar levels.\r\n\r\nRegular Physical Activity: Engaging in regular exercise improves insulin sensitivity and helps control weight.\r\n\r\nWeight Management: Maintaining a healthy weight reduces insulin resistance.\r\n\r\nMedications\r\nOral Medications: Various oral medications help lower blood sugar levels in Type 2 diabetes.\r\n\r\nInsulin Therapy: Essential for Type 1 diabetes and sometimes required for Type 2 diabetes, insulin therapy aims to regulate blood glucose levels.\r\n\r\nContinuous Glucose Monitoring (CGM)\r\nAdvancements in technology have introduced CGM systems, providing real-time data on blood sugar levels, helping individuals make informed decisions about their diabetes management.\r\n\r\nComplications and Prevention\r\nUnmanaged diabetes can lead to complications such as heart disease, kidney damage, and nerve problems. However, proactive management and lifestyle changes significantly reduce these risks.\r\n\r\nConclusion\r\nLiving with diabetes requires a multifaceted approach encompassing lifestyle modifications, medication management, and regular monitoring. Understanding the nuances of this condition empowers individuals to take charge of their health, fostering a life not just marked by diabetes management but one of overall well-being.\r\n\r\nIf you suspect you have diabetes or are at risk, consult with a healthcare professional for proper diagnosis and personalized guidance.', 'uploads/article_images/20240104233700_diabetes.png', 1, NULL),
(6, '2024-01-04 17:39:47.481302', NULL, NULL, 'Understanding Common Eye Problems: Causes, Symptoms, and Care', 'Eye Care', 'Introduction\r\nOur eyes are essential for daily functioning, and maintaining good eye health is crucial. Various eye problems can affect individuals of all ages, from refractive errors to more serious conditions. This article provides an overview of common eye problems, their causes, symptoms, and suggested care.\r\n\r\nRefractive Errors\r\nMyopia (Nearsightedness)\r\nMyopia occurs when distant objects appear blurry. It happens when the eyeball is too long or the cornea is too curved.\r\n\r\nHyperopia (Farsightedness)\r\nHyperopia results in difficulty seeing close objects clearly. It happens when the eyeball is too short or the cornea has too little curvature.\r\n\r\nAstigmatism\r\nAstigmatism occurs due to an irregular shape of the cornea or lens, causing blurred or distorted vision at any distance.\r\n\r\nCommon Eye Conditions\r\nCataracts\r\nCataracts involve the clouding of the eye\'s natural lens, leading to blurred vision. Aging, injury, or certain medications can contribute to cataract formation.\r\n\r\nGlaucoma\r\nGlaucoma is a group of eye conditions that damage the optic nerve, often due to increased intraocular pressure. It can lead to gradual vision loss.\r\n\r\nAge-Related Macular Degeneration (AMD)\r\nAMD is a degenerative eye disease affecting the macula, leading to central vision loss. It commonly occurs with aging.\r\n\r\nDiabetic Retinopathy\r\nDiabetic retinopathy results from damage to the blood vessels in the retina due to diabetes. It can lead to vision impairment or blindness if left untreated.\r\n\r\nDry Eye Syndrome\r\nDry eye syndrome occurs when the eyes do not produce enough tears or the tears evaporate too quickly. It can cause discomfort, redness, and blurred vision.\r\n\r\nSymptoms of Eye Problems\r\nBlurred or Distorted Vision\r\nEye Pain or Discomfort\r\nRedness or Irritation\r\nSensitivity to Light\r\nDifficulty Seeing at Night\r\nFloaters or Flashing Lights\r\nChanges in Color Perception\r\nCare and Prevention\r\nRegular Eye Exams\r\nRoutine eye exams are crucial for early detection and management of eye problems. They help identify issues before symptoms arise.\r\n\r\nHealthy Lifestyle Choices\r\nBalanced Diet: Nutrient-rich foods support eye health.\r\nRegular Exercise: Promotes overall well-being, including eye health.\r\nAdequate Sleep: Ensures proper rest for the eyes.\r\nProtective Measures\r\nUV Protection: Wearing sunglasses with UV protection shields eyes from harmful rays.\r\nScreen Breaks: Follow the 20-20-20 rule to reduce eye strain when using digital devices.\r\nProper Contact Lens Care\r\nFor those using contact lenses, following proper hygiene and replacement schedules is essential to prevent infections and discomfort.\r\n\r\nConclusion\r\nMaintaining good eye health is vital for a high quality of life. Regular eye exams, a healthy lifestyle, and protective measures can significantly contribute to preventing and managing common eye problems. If you experience persistent symptoms or changes in vision, consult with an eye care professional for a thorough evaluation and personalized care.', 'uploads/article_images/20240104234146_images.jpeg', 1, 1);

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
(41, 'Can add doctor profile', 11, 'add_doctorprofile'),
(42, 'Can change doctor profile', 11, 'change_doctorprofile'),
(43, 'Can delete doctor profile', 11, 'delete_doctorprofile'),
(44, 'Can view doctor profile', 11, 'view_doctorprofile'),
(45, 'Can add awards', 12, 'add_awards'),
(46, 'Can change awards', 12, 'change_awards'),
(47, 'Can delete awards', 12, 'delete_awards'),
(48, 'Can view awards', 12, 'view_awards'),
(49, 'Can add appointment schedule', 13, 'add_appointmentschedule'),
(50, 'Can change appointment schedule', 13, 'change_appointmentschedule'),
(51, 'Can delete appointment schedule', 13, 'delete_appointmentschedule'),
(52, 'Can view appointment schedule', 13, 'view_appointmentschedule'),
(53, 'Can add education', 14, 'add_education'),
(54, 'Can change education', 14, 'change_education'),
(55, 'Can delete education', 14, 'delete_education'),
(56, 'Can view education', 14, 'view_education'),
(57, 'Can add off day', 15, 'add_offday'),
(58, 'Can change off day', 15, 'change_offday'),
(59, 'Can delete off day', 15, 'delete_offday'),
(60, 'Can view off day', 15, 'view_offday'),
(61, 'Can add schedule time', 16, 'add_scheduletime'),
(62, 'Can change schedule time', 16, 'change_scheduletime'),
(63, 'Can delete schedule time', 16, 'delete_scheduletime'),
(64, 'Can view schedule time', 16, 'view_scheduletime'),
(65, 'Can add social media', 17, 'add_socialmedia'),
(66, 'Can change social media', 17, 'change_socialmedia'),
(67, 'Can delete social media', 17, 'delete_socialmedia'),
(68, 'Can view social media', 17, 'view_socialmedia'),
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
(81, 'Can add medicine schedule', 21, 'add_medicineschedule'),
(82, 'Can change medicine schedule', 21, 'change_medicineschedule'),
(83, 'Can delete medicine schedule', 21, 'delete_medicineschedule'),
(84, 'Can view medicine schedule', 21, 'view_medicineschedule'),
(85, 'Can add medicine type', 22, 'add_medicinetype'),
(86, 'Can change medicine type', 22, 'change_medicinetype'),
(87, 'Can delete medicine type', 22, 'delete_medicinetype'),
(88, 'Can view medicine type', 22, 'view_medicinetype'),
(89, 'Can add strength', 23, 'add_strength'),
(90, 'Can change strength', 23, 'change_strength'),
(91, 'Can delete strength', 23, 'delete_strength'),
(92, 'Can view strength', 23, 'view_strength'),
(93, 'Can add medicine', 24, 'add_medicine'),
(94, 'Can change medicine', 24, 'change_medicine'),
(95, 'Can delete medicine', 24, 'delete_medicine'),
(96, 'Can view medicine', 24, 'view_medicine'),
(97, 'Can add lab test', 25, 'add_labtest'),
(98, 'Can change lab test', 25, 'change_labtest'),
(99, 'Can delete lab test', 25, 'delete_labtest'),
(100, 'Can view lab test', 25, 'view_labtest'),
(101, 'Can add organ', 26, 'add_organ'),
(102, 'Can change organ', 26, 'change_organ'),
(103, 'Can delete organ', 26, 'delete_organ'),
(104, 'Can view organ', 26, 'view_organ'),
(105, 'Can add organs problem specification', 27, 'add_organsproblemspecification'),
(106, 'Can change organs problem specification', 27, 'change_organsproblemspecification'),
(107, 'Can delete organs problem specification', 27, 'delete_organsproblemspecification'),
(108, 'Can view organs problem specification', 27, 'view_organsproblemspecification'),
(109, 'Can add patient profile', 28, 'add_patientprofile'),
(110, 'Can change patient profile', 28, 'change_patientprofile'),
(111, 'Can delete patient profile', 28, 'delete_patientprofile'),
(112, 'Can view patient profile', 28, 'view_patientprofile'),
(113, 'Can add blood_ group', 29, 'add_blood_group'),
(114, 'Can change blood_ group', 29, 'change_blood_group'),
(115, 'Can delete blood_ group', 29, 'delete_blood_group'),
(116, 'Can view blood_ group', 29, 'view_blood_group'),
(117, 'Can add board', 30, 'add_board'),
(118, 'Can change board', 30, 'change_board'),
(119, 'Can delete board', 30, 'delete_board'),
(120, 'Can view board', 30, 'view_board'),
(121, 'Can add day', 31, 'add_day'),
(122, 'Can change day', 31, 'change_day'),
(123, 'Can delete day', 31, 'delete_day'),
(124, 'Can view day', 31, 'view_day'),
(125, 'Can add division', 32, 'add_division'),
(126, 'Can change division', 32, 'change_division'),
(127, 'Can delete division', 32, 'delete_division'),
(128, 'Can view division', 32, 'view_division'),
(129, 'Can add gender', 33, 'add_gender'),
(130, 'Can change gender', 33, 'change_gender'),
(131, 'Can delete gender', 33, 'delete_gender'),
(132, 'Can view gender', 33, 'view_gender'),
(133, 'Can add matrimony', 34, 'add_matrimony'),
(134, 'Can change matrimony', 34, 'change_matrimony'),
(135, 'Can delete matrimony', 34, 'delete_matrimony'),
(136, 'Can view matrimony', 34, 'view_matrimony'),
(137, 'Can add religion', 35, 'add_religion'),
(138, 'Can change religion', 35, 'change_religion'),
(139, 'Can delete religion', 35, 'delete_religion'),
(140, 'Can view religion', 35, 'view_religion'),
(141, 'Can add district', 36, 'add_district'),
(142, 'Can change district', 36, 'change_district'),
(143, 'Can delete district', 36, 'delete_district'),
(144, 'Can view district', 36, 'view_district'),
(145, 'Can add upazila', 37, 'add_upazila'),
(146, 'Can change upazila', 37, 'change_upazila'),
(147, 'Can delete upazila', 37, 'delete_upazila'),
(148, 'Can view upazila', 37, 'view_upazila'),
(149, 'Can add prescription for lab test', 38, 'add_prescriptionforlabtest'),
(150, 'Can change prescription for lab test', 38, 'change_prescriptionforlabtest'),
(151, 'Can delete prescription for lab test', 38, 'delete_prescriptionforlabtest'),
(152, 'Can view prescription for lab test', 38, 'view_prescriptionforlabtest'),
(153, 'Can add lab test prescription', 39, 'add_labtestprescription'),
(154, 'Can change lab test prescription', 39, 'change_labtestprescription'),
(155, 'Can delete lab test prescription', 39, 'delete_labtestprescription'),
(156, 'Can view lab test prescription', 39, 'view_labtestprescription'),
(157, 'Can add prescription for medicine', 40, 'add_prescriptionformedicine'),
(158, 'Can change prescription for medicine', 40, 'change_prescriptionformedicine'),
(159, 'Can delete prescription for medicine', 40, 'delete_prescriptionformedicine'),
(160, 'Can view prescription for medicine', 40, 'view_prescriptionformedicine'),
(161, 'Can add medicine prescription', 41, 'add_medicineprescription'),
(162, 'Can change medicine prescription', 41, 'change_medicineprescription'),
(163, 'Can delete medicine prescription', 41, 'delete_medicineprescription'),
(164, 'Can view medicine prescription', 41, 'view_medicineprescription'),
(165, 'Can add user', 42, 'add_user'),
(166, 'Can change user', 42, 'change_user'),
(167, 'Can delete user', 42, 'delete_user'),
(168, 'Can view user', 42, 'view_user'),
(169, 'Can add present address', 43, 'add_presentaddress'),
(170, 'Can change present address', 43, 'change_presentaddress'),
(171, 'Can delete present address', 43, 'delete_presentaddress'),
(172, 'Can view present address', 43, 'view_presentaddress'),
(173, 'Can add permanent address', 44, 'add_permanentaddress'),
(174, 'Can change permanent address', 44, 'change_permanentaddress'),
(175, 'Can delete permanent address', 44, 'delete_permanentaddress'),
(176, 'Can view permanent address', 44, 'view_permanentaddress'),
(177, 'Can add images', 45, 'add_images'),
(178, 'Can change images', 45, 'change_images'),
(179, 'Can delete images', 45, 'delete_images'),
(180, 'Can view images', 45, 'view_images'),
(181, 'Can add admin profile', 46, 'add_adminprofile'),
(182, 'Can change admin profile', 46, 'change_adminprofile'),
(183, 'Can delete admin profile', 46, 'delete_adminprofile'),
(184, 'Can view admin profile', 46, 'view_adminprofile'),
(185, 'Can add verify otp', 47, 'add_verifyotp'),
(186, 'Can change verify otp', 47, 'change_verifyotp'),
(187, 'Can delete verify otp', 47, 'delete_verifyotp'),
(188, 'Can view verify otp', 47, 'view_verifyotp'),
(189, 'Can add get appointment', 48, 'add_getappointment'),
(190, 'Can change get appointment', 48, 'change_getappointment'),
(191, 'Can delete get appointment', 48, 'delete_getappointment'),
(192, 'Can view get appointment', 48, 'view_getappointment'),
(193, 'Can add prediction', 49, 'add_prediction'),
(194, 'Can change prediction', 49, 'change_prediction'),
(195, 'Can delete prediction', 49, 'delete_prediction'),
(196, 'Can view prediction', 49, 'view_prediction'),
(197, 'Can add specification', 50, 'add_specification'),
(198, 'Can change specification', 50, 'change_specification'),
(199, 'Can delete specification', 50, 'delete_specification'),
(200, 'Can view specification', 50, 'view_specification');

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
(3, '2023-08-16 16:19:22.580351', NULL, NULL, 'Thorax (থোরেক্স)', 'This is the main part of the body, consisting of the chest, abdomen, and back. (এটি শরীরের প্রধান অংশ, যা বুক, পেট এবং পিঠ অন্তর্ভুক্ত।)'),
(4, '2023-08-16 16:19:37.531450', NULL, NULL, 'Upper Limbs (উপরের অংশ)', 'These are the arms and hands, including the shoulder, upper arm, forearm, wrist, and fingers. (এটি হাত এবং হাতের অংশ, যেমন মাংস পিছন দিক, উপরোক্ত বাহু, উপরোক্ত হাত এবং আঙ্গুল অন্তর্ভুক্ত।)'),
(5, '2023-08-16 16:20:04.756456', NULL, NULL, 'Lower Limbs (নিচের অংশ)', 'These are the legs and feet, including the hip, thigh, lower leg, ankle, and toes. (এটি পা এবং পায়ের অংশ, যেমন কোমর, পায়ের উপরোক্ত অংশ, পায়ের নিচু অংশ এবং পায়ের আঙ্গুল অন্তর্ভুক্ত।)'),
(6, '2023-08-16 16:20:15.903351', NULL, NULL, 'Torso or Trunk (বডি বা ট্রাঙ্ক)', 'The area between the neck and abdomen, housing important organs like the heart and lungs. (মাথা এবং পেটের মধ্যবর্তী অংশ, যেখানে হৃদয় এবং ফুসফুস প্রধান অঙ্গ।)'),
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
(1, '2024-01-03 12:28:43.407577', NULL, NULL, 'Cardiology', 'Cardiology is the study of the heart. Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system. The field includes medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease, and electrophysiology. (কার্ডিওলজি হল হৃদয়ের অধ্যয়ন। কার্ডিওলজি হ\'ল ওষুধের একটি শাখা যা হৃৎপিণ্ড এবং কার্ডিওভাসকুলার সিস্টেমের ব্যাধিগুলির সাথে কাজ করে। এই ক্ষেত্রের মধ্যে রয়েছে জন্মগত হার্টের ত্রুটি, করোনারি ধমনী রোগ, হার্ট ফেইলিউর, ভালভুলার হার্ট ডিজিজ এবং ইলেক্ট্রোফিজিওলজির চিকিৎসা নির্ণয় এবং চিকিত্সা)', 'uploads/department_images/20240103182843_Cardiology.png'),
(2, '2024-01-03 12:35:13.650225', NULL, NULL, 'Radiology', 'Radiology is the medical discipline that uses medical imaging to diagnose diseases and guide their treatment, within the bodies of humans and other animals. (রেডিওলজি হল চিকিৎসা শাস্ত্র যা মানুষ ও অন্যান্য প্রাণীর দেহের মধ্যে রোগ নির্ণয় এবং তাদের চিকিৎসার নির্দেশনা দিতে মেডিকেল ইমেজিং ব্যবহার করে)', 'uploads/department_images/20240103190625_radiology.png'),
(3, '2024-01-03 12:37:23.228348', NULL, NULL, 'Orthopedic', 'Orthopedic surgery or orthopedics, is the branch of surgery concerned with conditions involving the musculoskeletal system. Orthopedic surgeons use both surgical and nonsurgical means to treat musculoskeletal trauma, spine diseases, sports injuries, degenerative diseases, infections, tumors, and congenital disorders. (অর্থোপেডিক সার্জারি বা অর্থোপেডিকস হল অস্ত্রোপচারের একটি শাখা যা পেশীর স্কেলিটাল সিস্টেমের সাথে জড়িত। অর্থোপেডিক সার্জনরা পেশীবহুল ট্রমা, মেরুদণ্ডের রোগ, খেলার আঘাত, অবক্ষয়জনিত রোগ, সংক্রমণ, টিউমার এবং জন্মগত ব্যাধিগুলির চিকিত্সার জন্য অস্ত্রোপচার এবং ননসার্জিক্যাল উভয় উপায় ব্যবহার করেন।)', 'uploads/department_images/20240103183723_orthopedic.png'),
(4, '2024-01-03 12:38:38.281525', NULL, NULL, 'Neurology', 'Neurology is the branch of medicine dealing with the diagnosis and treatment of all categories of conditions and disease involving the nervous system, which comprises the brain, the spinal cord and the peripheral nerves. (নিউরোলজি হল মেডিসিনের একটি শাখা যা মস্তিষ্ক, মেরুদন্ড এবং পেরিফেরাল স্নায়ু সমন্বিত স্নায়ুতন্ত্রের সাথে জড়িত সমস্ত বিভাগের অবস্থা এবং রোগের নির্ণয় এবং চিকিত্সার সাথে কাজ করে।)', 'uploads/department_images/20240103183838_neurology.png'),
(5, '2024-01-03 12:41:23.615449', NULL, NULL, 'Intensive care medicine', 'Intensive care medicine, also called critical care medicine, is a medical specialty that deals with seriously or critically ill patients who have, are at risk of, or are recovering from conditions that may be life-threatening. (ইনটেনসিভ কেয়ার মেডিসিন, যাকে ক্রিটিক্যাল কেয়ার মেডিসিনও বলা হয়, এটি একটি চিকিৎসা বিশেষত্ব যা গুরুতর বা গুরুতর অসুস্থ রোগীদের নিয়ে কাজ করে যাদের জীবন-হুমকি হতে পারে এমন অবস্থার ঝুঁকি রয়েছে বা সেরে উঠছে।)', 'uploads/department_images/20240103184123_Intensive_care_medicine.png'),
(6, '2024-01-03 12:42:14.681865', NULL, NULL, 'Gastroenterology', 'Gastroenterology is the branch of medicine focused on the digestive system and its disorders. The digestive system consists of the gastrointestinal tract, sometimes referred to as the GI tract. (গ্যাস্ট্রোএন্টারোলজি হল ওষুধের একটি শাখা যা পাচনতন্ত্র এবং এর ব্যাধিগুলির উপর দৃষ্টি নিবদ্ধ করে। পাচনতন্ত্র গ্যাস্ট্রোইনটেস্টাইনাল ট্র্যাক্ট নিয়ে গঠিত, কখনও কখনও জিআই ট্র্যাক্ট হিসাবে উল্লেখ করা হয়।)', 'uploads/department_images/20240103184214_gastroenterology.png'),
(7, '2024-01-03 12:45:25.321367', NULL, NULL, 'Obstetrics and Gynaecology', 'Obstetrics and Gynaecology is the medical specialty that encompasses the two subspecialties of obstetrics and gynecology. (প্রসূতি এবং স্ত্রীরোগবিদ্যা হল চিকিৎসা বিশেষত্ব যা প্রসূতি এবং স্ত্রীরোগবিদ্যার দুটি উপ-বিশেষতাকে অন্তর্ভুক্ত করে।)', 'uploads/department_images/20240103184525_obstetric__and_gynaecology.png'),
(8, '2024-01-03 12:46:52.523957', NULL, NULL, 'Otolaryngology', 'Otolaryngology logy is a surgical sub speciality within medicine that deals with the surgical and medical management of conditions of the head and neck. Doctors who specialize in this area are called otorhinolaryngologists, otolaryngologists, head and neck surgeons, or ENT surgeons or physicians. (অটোল্যারিঙ্গোলজি লজি হল মেডিসিনের মধ্যে একটি সার্জিক্যাল সাব স্পেশালিটি যা মাথা এবং ঘাড়ের অবস্থার অস্ত্রোপচার এবং চিকিৎসা ব্যবস্থাপনা নিয়ে কাজ করে। এই ক্ষেত্রে বিশেষজ্ঞ ডাক্তারদের বলা হয় অটোরিনোলারিঙ্গোলজিস্ট, অটোল্যারিঙ্গোলজিস্ট, হেড অ্যান্ড নেক সার্জন, বা ইএনটি সার্জন বা চিকিত্সক।)', 'uploads/department_images/20240103184652_otolaryngology.png'),
(9, '2024-01-03 12:49:30.247673', NULL, NULL, 'Anesthesiology', 'Anesthesiology, anaesthesiology, or anaesthesia is the medical specialty concerned with the total perioperative care of patients before, during and after surgery. It encompasses anesthesia, intensive care medicine, critical emergency medicine, and pain medicine. (অ্যানেস্থেসিওলজি, অ্যানেস্থেসিওলজি, বা অ্যানেস্থেসিয়া হল সার্জারির আগে, সময় এবং পরে রোগীদের মোট পেরিওপারেটিভ যত্নের সাথে সম্পর্কিত চিকিৎসা বিশেষত্ব। এটি অ্যানেস্থেশিয়া, নিবিড় যত্নের ওষুধ, গুরুতর জরুরী ওষুধ এবং ব্যথার ওষুধ অন্তর্ভুক্ত করে।)', 'uploads/department_images/20240103184930_annesthesiology.png'),
(10, '2024-01-03 12:50:31.599721', NULL, NULL, 'Hematology', 'Hematology is the branch of medicine concerned with the study of the cause, prognosis, treatment, and prevention of diseases related to blood. (হেমাটোলজি হল ওষুধের একটি শাখা যা রক্ত ​​সম্পর্কিত রোগের কারণ, পূর্বাভাস, চিকিত্সা এবং প্রতিরোধের অধ্যয়নের সাথে সম্পর্কিত।)', 'uploads/department_images/20240103185031_hematology.png'),
(11, '2024-01-03 12:51:27.450856', NULL, NULL, 'Casualty department', 'An emergency department, also known as an accident and emergency department, emergency room, emergency ward or casualty department, is a medical treatment facility specializing in emergency medicine, the acute care of patients who present without prior appointment; either by their own means or by that of an ambulance. (একটি জরুরী বিভাগ, যা দুর্ঘটনা ও জরুরী বিভাগ, জরুরী কক্ষ, জরুরী ওয়ার্ড বা হতাহত বিভাগ নামেও পরিচিত, একটি চিকিৎসা সুবিধা যা জরুরী ওষুধে বিশেষজ্ঞ, রোগীদের তীব্র যত্ন যারা পূর্বে অ্যাপয়েন্টমেন্ট ছাড়াই উপস্থিত থাকে; হয় তাদের নিজস্ব উপায়ে বা অ্যাম্বুলেন্সের মাধ্যমে।)', 'uploads/department_images/20240103185127_casualty_department.png'),
(12, '2024-01-03 12:53:14.135703', NULL, NULL, 'Geriatrics', 'Geriatrics, or geriatric medicine, is a medical specialty focused on providing care for the unique health needs of older adults. The term geriatrics originates from the Greek γέρων geron meaning \\\"old man\\\", and ιατρός iatros meaning healer. (জেরিয়াট্রিক্স, বা জেরিয়াট্রিক মেডিসিন হল একটি চিকিৎসা বিশেষত্ব যা বয়স্ক প্রাপ্তবয়স্কদের অনন্য স্বাস্থ্যের প্রয়োজনের যত্ন প্রদানের উপর দৃষ্টি নিবদ্ধ করে। জেরিয়াট্রিক্স শব্দটির উৎপত্তি গ্রীক γέρων জেরোন থেকে যার অর্থ \"বৃদ্ধ মানুষ\" এবং ιατρός iatros অর্থ নিরাময়কারী।)', 'uploads/department_images/20240103185314_geriatrics.png'),
(13, '2024-01-03 12:54:24.318925', NULL, NULL, 'ICU', 'An intensive care unit, also known as an intensive therapy unit or intensive treatment unit or critical care unit, is a special department of a hospital or health care facility that provides intensive care medicine.', 'uploads/department_images/20240103185424_icu.png'),
(14, '2024-01-03 12:55:43.040926', NULL, NULL, 'Coronary care unit', 'A coronary care unit or cardiac intensive care unit is a hospital ward specialized in the care of patients with heart attacks, unstable angina, cardiac dysrhythmia and various other cardiac conditions that require continuous monitoring and treatment.', 'uploads/department_images/20240103185543_coronary_care_unit.png'),
(15, '2024-01-03 12:56:34.170699', NULL, NULL, 'Unit of measurement', 'A unit of measurement is a definite magnitude of a quantity, defined and adopted by convention or by law, that is used as a standard for measurement of the same kind of quantity. Any other quantity of that kind can be expressed as a multiple of the unit of measurement. For example, a length is a physical quantity. (পরিমাপের একটি একক হল একটি পরিমাণের একটি নির্দিষ্ট মাত্রা, যা কনভেনশন বা আইন দ্বারা সংজ্ঞায়িত এবং গৃহীত হয়, যা একই ধরণের পরিমাণের পরিমাপের জন্য একটি মান হিসাবে ব্যবহৃত হয়। এই ধরণের অন্য যেকোন পরিমাণকে পরিমাপের এককের গুণিতক হিসাবে প্রকাশ করা যেতে পারে। উদাহরণস্বরূপ, একটি দৈর্ঘ্য একটি ভৌত ​​পরিমাণ।)', 'uploads/department_images/20240103185634_unit_of_measurement.png'),
(16, '2024-01-03 12:57:23.804592', NULL, NULL, 'Information', 'Information is an abstract concept that refers to that which has the power to inform. At the most fundamental level, information pertains to the interpretation of that which may be sensed, or their abstractions. (তথ্য একটি বিমূর্ত ধারণা যা বোঝায় যা জানার ক্ষমতা রাখে। সবচেয়ে মৌলিক স্তরে, তথ্য যা সংবেদন করা যেতে পারে, বা তাদের বিমূর্ততাগুলির ব্যাখ্যার সাথে সম্পর্কিত।)', 'uploads/department_images/20240103185723_information.png'),
(17, '2024-01-03 12:58:46.797486', NULL, NULL, 'Outpatient Department', 'An outpatient department or outpatient clinic is the part of a hospital designed for the treatment of outpatients, people with health problems who visit the hospital for diagnosis or treatment, but do not at this time require a bed or to be admitted for overnight care. (বহির্বিভাগের রোগী বিভাগ বা বহিরাগত ক্লিনিক হল একটি হাসপাতালের অংশ যা বহিরাগত রোগীদের চিকিৎসার জন্য ডিজাইন করা হয়েছে, স্বাস্থ্য সমস্যায় আক্রান্ত ব্যক্তিরা যারা রোগ নির্ণয় বা চিকিৎসার জন্য হাসপাতালে যান, কিন্তু এই সময়ে বিছানার প্রয়োজন হয় না বা রাতারাতি যত্নের জন্য ভর্তি হতে হয়।)', 'uploads/department_images/20240103185846_outpatient_department.png'),
(18, '2024-01-03 13:00:48.524096', NULL, NULL, 'Ophthalmology', 'Ophthalmology is a surgical subspecialty within medicine that deals with the diagnosis and treatment of eye disorders. A former term is oculism. An ophthalmologist is a physician who undergoes subspecialty training in medical and surgical eye care. (চক্ষুবিদ্যা হল ওষুধের মধ্যে একটি অস্ত্রোপচারের উপ-স্পেশালিটি যা চোখের রোগ নির্ণয় এবং চিকিত্সার সাথে কাজ করে। একটি প্রাক্তন শব্দটি হল ওকুলিজম। একজন চক্ষু বিশেষজ্ঞ হলেন একজন চিকিত্সক যিনি চিকিৎসা এবং অস্ত্রোপচারের চোখের যত্নে উপ-স্পেশালিটি প্রশিক্ষণ গ্রহণ করেন।)', 'uploads/department_images/20240103190048_ophthalmology.png'),
(19, '2024-01-03 13:03:38.524654', NULL, NULL, 'Dentistry or Oral Medicine', 'Oral medicine is a specialty of dentistry that focuses on the oral health care of medically complex patients and the diagnosis and management of medical conditions that affect the mouth and nearby structures. Oral medicine deals with oral mucosal diseases, orofacial pain, oral manifestations of systemic diseases, salivary gland disorders, and the dental management of medically complex patients. (ওরাল মেডিসিন দন্তচিকিৎসার একটি বিশেষত্ব যা চিকিৎসাগতভাবে জটিল রোগীদের মৌখিক স্বাস্থ্যসেবা এবং মুখ ও আশেপাশের কাঠামোকে প্রভাবিত করে এমন চিকিৎসা অবস্থার নির্ণয় ও ব্যবস্থাপনার উপর দৃষ্টি নিবদ্ধ করে। ওরাল মেডিসিন ওরাল মিউকোসাল ডিজিজ, অরোফেসিয়াল ব্যাথা, সিস্টেমিক রোগের মৌখিক প্রকাশ, লালা গ্রন্থির ব্যাধি এবং চিকিৎসাগত জটিল রোগীদের দাঁতের ব্যবস্থাপনা নিয়ে কাজ করে।)', 'uploads/department_images/20240104211645_dentistry_or_oral_medicine.png'),
(20, '2024-01-04 10:22:31.461086', NULL, NULL, 'Audiology and Ear-Nose-Throat', 'Advanced Care for the Ear, Nose and Throat\r\nClinical audiologists specialize in the treatment of hearing disorders. They measure and evaluate the ability of adults and children to hear sounds. Audiologists conduct hearing evaluations, test for middle ear disease, treat people with balance problems and fit hearing aids. (কান, নাক এবং গলার জন্য উন্নত যত্ন\r\nক্লিনিকাল অডিওলজিস্টরা শ্রবণজনিত রোগের চিকিৎসায় বিশেষজ্ঞ। তারা প্রাপ্তবয়স্কদের এবং শিশুদের শব্দ শোনার ক্ষমতা পরিমাপ করে এবং মূল্যায়ন করে। অডিওলজিস্টরা শ্রবণ মূল্যায়ন পরিচালনা করেন, মধ্য কানের রোগের জন্য পরীক্ষা করেন, ভারসাম্যের সমস্যায় আক্রান্ত ব্যক্তিদের চিকিত্সা করেন এবং শ্রবণযন্ত্রের জন্য উপযুক্ত।)', 'uploads/department_images/20240104162726_audiology_and_ear_nose_throat_ENT.png'),
(21, '2024-01-04 10:54:01.131947', NULL, NULL, 'Pulmonology', 'Pulmonology often involves managing patients who need life support and mechanical ventilation. Pulmonologists are specially trained in diseases and conditions of the chest, particularly pneumonia, asthma, tuberculosis, emphysema, and complicated chest infections. (পালমোনোলজি প্রায়শই এমন রোগীদের পরিচালনা করে যাদের জীবন সহায়তা এবং যান্ত্রিক বায়ুচলাচল প্রয়োজন। পালমোনোলজিস্টরা বিশেষভাবে বুকের রোগ ও অবস্থা, বিশেষ করে নিউমোনিয়া, হাঁপানি, যক্ষ্মা, এম্ফিসিমা এবং জটিল বুকের সংক্রমণে প্রশিক্ষিত।)', 'uploads/department_images/20240104165401_Pulmonology.png'),
(22, '2024-01-04 11:27:36.462547', NULL, NULL, 'Oncology', 'Oncology is a sub-specialty of medicine dedicated to the investigation, diagnosis and treatment of people with cancer or suspected cancer. It includes: preventative medicine. medical oncology (chemotherapy, immunotherapy, hormone therapy and other drugs to treat cancer) (ক্যান্সার বা সন্দেহভাজন ক্যান্সারে আক্রান্ত ব্যক্তিদের তদন্ত, নির্ণয় এবং চিকিত্সার জন্য নিবেদিত ওষুধের একটি উপ-বিশেষত্ব হল অনকোলজি। এর মধ্যে রয়েছে: প্রতিরোধমূলক ওষুধ। মেডিকেল অনকোলজি (কেমোথেরাপি, ইমিউনোথেরাপি, হরমোন থেরাপি এবং ক্যান্সারের চিকিৎসার জন্য অন্যান্য ওষুধ))', 'uploads/department_images/20240104173144_Oncology.png'),
(23, '2024-01-04 11:36:51.831548', NULL, NULL, 'Nephrology', 'Nephrology is the adult and pediatric study of the kidneys and its diseases. The nephrologist deals with the diagnosis and management of kidney disease. The kidneys are vital for maintaining normal fluid and electrolyte balance in the body. (নেফ্রোলজি হ\'ল কিডনি এবং এর রোগগুলির প্রাপ্তবয়স্ক এবং শিশুদের অধ্যয়ন। নেফ্রোলজিস্ট কিডনি রোগ নির্ণয় এবং ব্যবস্থাপনা নিয়ে কাজ করেন। কিডনি শরীরের স্বাভাবিক তরল এবং ইলেক্ট্রোলাইট ভারসাম্য বজায় রাখার জন্য গুরুত্বপূর্ণ।)', 'uploads/department_images/20240104173651_Nephrology.png'),
(24, '2024-01-04 11:52:05.211517', NULL, NULL, 'Urology', 'Urology is a part of health care that deals with diseases of the male and female urinary tract (kidneys, ureters, bladder and urethra). It also deals with the male organs that are able to make babies (penis, testes, scrotum, prostate, etc.). (ইউরোলজি হল স্বাস্থ্য পরিচর্যার একটি অংশ যা পুরুষ ও মহিলাদের মূত্রনালীর (কিডনি, মূত্রনালী, মূত্রাশয় এবং মূত্রনালী) রোগ নিয়ে কাজ করে। এটি পুরুষের অঙ্গগুলির সাথেও ডিল করে যা বাচ্চা তৈরি করতে সক্ষম (লিঙ্গ, অণ্ডকোষ, অণ্ডকোষ, প্রোস্টেট ইত্যাদি)।)', 'uploads/department_images/20240104175205_Urology.png'),
(25, '2024-01-04 12:40:30.551886', NULL, NULL, 'Hepatology', 'Hepatology is a branch of medicine concerned with the study, prevention, diagnosis, and management of diseases that affect the liver, gallbladder, biliary tree, and pancreas. The term hepatology is derived from the Greek words “hepatikos” and “logia,” which mean liver and study, respectively. (হেপাটোলজি হল ওষুধের একটি শাখা যা যকৃত, গলব্লাডার, পিত্তথলির গাছ এবং অগ্ন্যাশয়কে প্রভাবিত করে এমন রোগগুলির অধ্যয়ন, প্রতিরোধ, নির্ণয় এবং ব্যবস্থাপনার সাথে সম্পর্কিত। হেপাটোলজি শব্দটি গ্রীক শব্দ \"হেপাটিকোস\" এবং \"লগিয়া\" থেকে উদ্ভূত হয়েছে, যার অর্থ যথাক্রমে যকৃত এবং অধ্যয়ন।)', 'uploads/department_images/20240104184030_Hepatology.png'),
(26, '2024-01-04 12:46:47.596955', NULL, NULL, 'Neurosurgery', 'Neurosurgery is surgery of the nervous system.\r\nIt is the medical specialty concerned with the diagnosis and treatment of of patients with injury to, or diseases/disorders of the brain, spinal cord and spinal column, and peripheral nerves within all parts of the body. (নিউরোসার্জারি হল স্নায়ুতন্ত্রের সার্জারি।\r\nএটি শরীরের সমস্ত অংশের মধ্যে মস্তিষ্ক, মেরুদন্ড এবং মেরুদণ্ডের কলাম এবং পেরিফেরাল স্নায়ুতে আঘাত, বা রোগ/ব্যধিযুক্ত রোগীদের রোগ নির্ণয় এবং চিকিত্সার সাথে সম্পর্কিত চিকিৎসা বিশেষত্ব।)', 'uploads/department_images/20240104184647_Neurosurgery.png'),
(27, '2024-01-04 14:43:09.366843', NULL, NULL, 'Dermatology (চর্মরোগবিদ্যা)', 'Dermatology is the branch of medicine dealing with the skin. It is a speciality with both medical and surgical aspects. A dermatologist is a specialist medical doctor who manages diseases related to skin, hair, nails, and some cosmetic problems. (ডার্মাটোলজি হল ওষুধের একটি শাখা যা ত্বক নিয়ে কাজ করে। এটি চিকিৎসা এবং অস্ত্রোপচার উভয় দিক দিয়েই একটি বিশেষত্ব। একজন চর্মরোগ বিশেষজ্ঞ হলেন একজন বিশেষজ্ঞ চিকিত্সক যিনি ত্বক, চুল, নখ এবং কিছু প্রসাধনী সমস্যা সম্পর্কিত রোগগুলি পরিচালনা করেন।)', 'uploads/department_images/20240104204309_Dermatology.png');

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
(1, '2024-01-04 09:20:32.693759', NULL, NULL, 'N/A', 4, 1),
(2, '2024-01-04 09:20:56.680289', NULL, NULL, 'N/A', 4, 2),
(3, '2024-01-04 09:21:09.065298', NULL, NULL, 'N/A', 4, 3),
(4, '2024-01-04 09:21:19.906676', NULL, NULL, 'N/A', 4, 4),
(5, '2024-01-04 09:21:32.370908', NULL, NULL, 'N/A', 4, 5),
(6, '2024-01-04 09:22:17.320356', NULL, NULL, 'N/A', 4, 6),
(7, '2024-01-04 09:22:27.740683', NULL, NULL, 'N/A', 4, 7),
(8, '2024-01-04 09:22:44.895531', NULL, NULL, 'N/A', 4, 8),
(9, '2024-01-04 09:22:54.426394', NULL, NULL, 'N/A', 4, 9),
(10, '2024-01-04 09:23:03.566247', NULL, NULL, 'N/A', 4, 10),
(11, '2024-01-04 09:23:13.826366', NULL, NULL, 'N/A', 4, 11),
(12, '2024-01-04 10:12:51.187810', NULL, NULL, 'N/A', 18, 12),
(13, '2024-01-04 10:13:11.929684', NULL, NULL, 'N/A', 18, 13),
(14, '2024-01-04 10:13:19.237144', NULL, NULL, 'N/A', 18, 14),
(15, '2024-01-04 10:13:27.835861', NULL, NULL, 'N/A', 18, 15),
(16, '2024-01-04 10:13:35.997831', NULL, NULL, 'N/A', 18, 16),
(17, '2024-01-04 10:13:43.298675', NULL, NULL, 'N/A', 18, 17),
(18, '2024-01-04 10:13:51.560581', NULL, NULL, 'N/A', 18, 18),
(19, '2024-01-04 10:13:58.494287', NULL, NULL, 'N/A', 18, 19),
(20, '2024-01-04 10:14:08.370548', NULL, NULL, 'N/A', 18, 20),
(21, '2024-01-04 10:14:19.607464', NULL, NULL, 'N/A', 18, 21),
(22, '2024-01-04 10:22:45.273392', NULL, NULL, 'N/A', 20, 22),
(23, '2024-01-04 10:22:56.459286', NULL, NULL, 'N/A', 20, 23),
(24, '2024-01-04 10:23:02.650508', NULL, NULL, 'N/A', 20, 24),
(25, '2024-01-04 10:23:08.637958', NULL, NULL, 'N/A', 20, 25),
(26, '2024-01-04 10:23:19.857325', NULL, NULL, 'N/A', 20, 26),
(27, '2024-01-04 10:23:25.584894', NULL, NULL, 'N/A', 20, 27),
(28, '2024-01-04 10:23:31.090596', NULL, NULL, 'N/A', 20, 28),
(29, '2024-01-04 10:23:37.765614', NULL, NULL, 'N/A', 20, 29),
(30, '2024-01-04 10:24:01.264975', NULL, NULL, 'N/A', 20, 30),
(31, '2024-01-04 10:24:07.590588', NULL, NULL, 'N/A', 20, 31),
(32, '2024-01-04 10:29:51.290101', NULL, NULL, 'N/A', 8, 32),
(33, '2024-01-04 10:29:56.926167', NULL, NULL, 'N/A', 8, 33),
(34, '2024-01-04 10:30:02.426443', NULL, NULL, 'N/A', 8, 34),
(35, '2024-01-04 10:30:09.870673', NULL, NULL, 'N/A', 8, 35),
(36, '2024-01-04 10:30:16.109375', NULL, NULL, 'N/A', 8, 36),
(37, '2024-01-04 10:30:22.107713', NULL, NULL, 'N/A', 8, 37),
(38, '2024-01-04 10:30:28.921578', NULL, NULL, 'N/A', 8, 38),
(39, '2024-01-04 10:30:34.381036', NULL, NULL, 'N/A', 8, 39),
(40, '2024-01-04 10:30:40.852975', NULL, NULL, 'N/A', 8, 40),
(41, '2024-01-04 10:30:46.092171', NULL, NULL, 'N/A', 8, 41),
(42, '2024-01-04 10:41:54.059044', NULL, NULL, 'N/A', 19, 42),
(43, '2024-01-04 10:42:01.314461', NULL, NULL, 'N/A', 19, 43),
(44, '2024-01-04 10:42:08.529427', NULL, NULL, 'N/A', 19, 44),
(45, '2024-01-04 10:42:15.926796', NULL, NULL, 'N/A', 19, 45),
(46, '2024-01-04 10:42:21.912504', NULL, NULL, 'N/A', 19, 46),
(47, '2024-01-04 10:42:29.092096', NULL, NULL, 'N/A', 19, 47),
(48, '2024-01-04 10:42:35.476324', NULL, NULL, 'N/A', 19, 48),
(49, '2024-01-04 10:42:43.572205', NULL, NULL, 'N/A', 19, 49),
(50, '2024-01-04 10:42:50.376213', NULL, NULL, 'N/A', 19, 50),
(51, '2024-01-04 10:42:56.846780', NULL, NULL, 'N/A', 19, 51),
(52, '2024-01-04 10:46:11.717347', NULL, NULL, 'N/A', 8, 52),
(53, '2024-01-04 10:46:22.396228', NULL, NULL, 'N/A', 8, 53),
(54, '2024-01-04 10:46:29.776490', NULL, NULL, 'N/A', 8, 54),
(55, '2024-01-04 10:46:38.919044', NULL, NULL, 'N/A', 8, 55),
(56, '2024-01-04 10:46:48.481408', NULL, NULL, 'N/A', 8, 56),
(57, '2024-01-04 10:46:57.808767', NULL, NULL, 'N/A', 8, 57),
(58, '2024-01-04 10:47:08.017660', NULL, NULL, 'N/A', 8, 58),
(59, '2024-01-04 10:47:14.649735', NULL, NULL, 'N/A', 8, 59),
(60, '2024-01-04 10:47:21.521535', NULL, NULL, 'N/A', 8, 60),
(61, '2024-01-04 10:47:28.542914', NULL, NULL, 'N/A', 8, 61),
(62, '2024-01-04 10:49:27.328405', NULL, NULL, 'N/A', 1, 62),
(63, '2024-01-04 10:49:34.083650', NULL, NULL, 'N/A', 1, 63),
(64, '2024-01-04 10:49:41.725305', NULL, NULL, 'N/A', 1, 64),
(65, '2024-01-04 10:49:47.652577', NULL, NULL, 'N/A', 1, 65),
(66, '2024-01-04 10:49:54.491269', NULL, NULL, 'N/A', 1, 66),
(67, '2024-01-04 10:50:00.599038', NULL, NULL, 'N/A', 1, 67),
(68, '2024-01-04 10:50:07.378702', NULL, NULL, 'N/A', 1, 68),
(69, '2024-01-04 10:50:14.565361', NULL, NULL, 'N/A', 1, 69),
(70, '2024-01-04 10:50:21.325549', NULL, NULL, 'N/A', 1, 70),
(71, '2024-01-04 10:50:28.459900', NULL, NULL, 'N/A', 1, 71),
(72, '2024-01-04 10:54:14.496195', NULL, NULL, 'N/A', 21, 72),
(73, '2024-01-04 10:54:25.161639', NULL, NULL, 'N/A', 21, 73),
(74, '2024-01-04 10:54:30.648347', NULL, NULL, 'N/A', 21, 74),
(75, '2024-01-04 10:54:36.473723', NULL, NULL, 'N/A', 21, 75),
(76, '2024-01-04 10:54:42.423342', NULL, NULL, 'N/A', 21, 76),
(77, '2024-01-04 10:54:48.305367', NULL, NULL, 'N/A', 21, 77),
(78, '2024-01-04 10:55:09.349406', NULL, NULL, 'N/A', 21, 78),
(79, '2024-01-04 10:55:16.137205', NULL, NULL, 'N/A', 21, 79),
(80, '2024-01-04 10:55:21.677545', NULL, NULL, 'N/A', 21, 80),
(81, '2024-01-04 10:55:27.592324', NULL, NULL, 'N/A', 21, 81),
(82, '2024-01-04 10:58:56.944491', NULL, NULL, 'N/A', 3, 82),
(83, '2024-01-04 10:59:09.580715', NULL, NULL, 'N/A', 3, 83),
(84, '2024-01-04 10:59:16.240020', NULL, NULL, 'N/A', 3, 84),
(85, '2024-01-04 10:59:22.745095', NULL, NULL, 'N/A', 3, 85),
(86, '2024-01-04 10:59:29.554835', NULL, NULL, 'N/A', 3, 86),
(87, '2024-01-04 10:59:36.001882', NULL, NULL, 'N/A', 3, 87),
(88, '2024-01-04 10:59:45.612840', NULL, NULL, 'N/A', 3, 88),
(89, '2024-01-04 10:59:52.250696', NULL, NULL, 'N/A', 3, 89),
(90, '2024-01-04 11:00:00.684742', NULL, NULL, 'N/A', 3, 90),
(91, '2024-01-04 11:00:06.697183', NULL, NULL, 'N/A', 3, 91),
(92, '2024-01-04 11:02:15.202352', NULL, NULL, 'N/A', 3, 92),
(93, '2024-01-04 11:02:21.637085', NULL, NULL, 'N/A', 3, 93),
(94, '2024-01-04 11:02:27.490501', NULL, NULL, 'N/A', 3, 94),
(95, '2024-01-04 11:02:34.544824', NULL, NULL, 'N/A', 3, 95),
(96, '2024-01-04 11:02:41.419994', NULL, NULL, 'N/A', 3, 96),
(97, '2024-01-04 11:02:49.759056', NULL, NULL, 'N/A', 3, 97),
(98, '2024-01-04 11:02:56.274121', NULL, NULL, 'N/A', 3, 98),
(99, '2024-01-04 11:03:02.239402', NULL, NULL, 'N/A', 3, 99),
(100, '2024-01-04 11:03:08.499813', NULL, NULL, 'N/A', 3, 100),
(101, '2024-01-04 11:03:15.944780', NULL, NULL, 'N/A', 3, 101),
(102, '2024-01-04 11:05:14.356391', NULL, NULL, 'N/A', 3, 102),
(103, '2024-01-04 11:05:20.418382', NULL, NULL, 'N/A', 3, 103),
(104, '2024-01-04 11:05:28.468260', NULL, NULL, 'N/A', 3, 104),
(105, '2024-01-04 11:05:34.297849', NULL, NULL, 'N/A', 3, 105),
(106, '2024-01-04 11:05:40.273016', NULL, NULL, 'N/A', 3, 106),
(107, '2024-01-04 11:05:46.884977', NULL, NULL, 'N/A', 3, 107),
(108, '2024-01-04 11:05:53.401404', NULL, NULL, 'N/A', 3, 108),
(109, '2024-01-04 11:05:59.375803', NULL, NULL, 'N/A', 3, 109),
(110, '2024-01-04 11:06:05.817464', NULL, NULL, 'N/A', 3, 110),
(111, '2024-01-04 11:06:11.761091', NULL, NULL, 'N/A', 3, 111),
(112, '2024-01-04 11:06:19.861208', NULL, NULL, 'N/A', 3, 112),
(113, '2024-01-04 11:08:15.277868', NULL, NULL, 'N/A', 3, 113),
(114, '2024-01-04 11:08:25.006289', NULL, NULL, 'N/A', 3, 114),
(115, '2024-01-04 11:08:31.044988', NULL, NULL, 'N/A', 3, 115),
(116, '2024-01-04 11:08:38.190493', NULL, NULL, 'N/A', 3, 116),
(117, '2024-01-04 11:08:45.167410', NULL, NULL, 'N/A', 3, 117),
(118, '2024-01-04 11:08:51.288438', NULL, NULL, 'N/A', 3, 118),
(119, '2024-01-04 11:08:57.702317', NULL, NULL, 'N/A', 3, 119),
(120, '2024-01-04 11:09:04.035035', NULL, NULL, 'N/A', 3, 120),
(121, '2024-01-04 11:09:09.985575', NULL, NULL, 'N/A', 3, 121),
(122, '2024-01-04 11:09:19.775784', NULL, NULL, 'N/A', 3, 122),
(123, '2024-01-04 11:10:46.253106', NULL, NULL, 'N/A', 3, 123),
(124, '2024-01-04 11:10:54.779709', NULL, NULL, 'N/A', 3, 124),
(125, '2024-01-04 11:11:01.714401', NULL, NULL, 'N/A', 3, 125),
(126, '2024-01-04 11:11:07.612992', NULL, NULL, 'N/A', 3, 126),
(127, '2024-01-04 11:11:15.240709', NULL, NULL, 'N/A', 3, 127),
(128, '2024-01-04 11:11:20.917517', NULL, NULL, 'N/A', 3, 128),
(129, '2024-01-04 11:11:26.924164', NULL, NULL, 'N/A', 3, 129),
(130, '2024-01-04 11:11:32.853644', NULL, NULL, 'N/A', 3, 130),
(131, '2024-01-04 11:11:39.803888', NULL, NULL, 'N/A', 3, 131),
(132, '2024-01-04 11:19:00.701024', NULL, NULL, 'N/A', 3, 132),
(133, '2024-01-04 11:19:06.362694', NULL, NULL, 'N/A', 3, 133),
(134, '2024-01-04 11:19:13.943858', NULL, NULL, 'N/A', 3, 134),
(135, '2024-01-04 11:19:21.601127', NULL, NULL, 'N/A', 3, 135),
(136, '2024-01-04 11:19:26.926300', NULL, NULL, 'N/A', 3, 136),
(137, '2024-01-04 11:19:32.456447', NULL, NULL, 'N/A', 3, 137),
(138, '2024-01-04 11:19:38.597293', NULL, NULL, 'N/A', 3, 138),
(139, '2024-01-04 11:19:44.519135', NULL, NULL, 'N/A', 3, 139),
(140, '2024-01-04 11:19:50.411867', NULL, NULL, 'N/A', 3, 140),
(141, '2024-01-04 11:19:56.271072', NULL, NULL, 'N/A', 3, 141),
(142, '2024-01-04 11:20:01.694226', NULL, NULL, 'N/A', 3, 142),
(143, '2024-01-04 11:20:08.307058', NULL, NULL, 'N/A', 3, 143),
(144, '2024-01-04 11:20:15.045600', NULL, NULL, 'N/A', 3, 144),
(145, '2024-01-04 11:20:27.598450', NULL, NULL, 'N/A', 3, 145),
(146, '2024-01-04 11:20:34.221572', NULL, NULL, 'N/A', 3, 146),
(147, '2024-01-04 11:20:41.165958', NULL, NULL, 'N/A', 3, 147),
(148, '2024-01-04 11:20:49.930590', NULL, NULL, 'N/A', 3, 148),
(149, '2024-01-04 11:20:58.143265', NULL, NULL, 'N/A', 3, 149),
(150, '2024-01-04 11:21:04.151478', NULL, NULL, 'N/A', 3, 150),
(151, '2024-01-04 11:21:10.811933', NULL, NULL, 'N/A', 3, 151),
(152, '2024-01-04 11:21:17.501579', NULL, NULL, 'N/A', 3, 152),
(153, '2024-01-04 11:21:36.882961', NULL, NULL, 'N/A', 3, 153),
(154, '2024-01-04 11:21:46.223067', NULL, NULL, 'N/A', 3, 154),
(155, '2024-01-04 11:21:52.878063', NULL, NULL, 'N/A', 3, 155),
(156, '2024-01-04 11:22:00.027909', NULL, NULL, 'N/A', 3, 156),
(157, '2024-01-04 11:22:05.210158', NULL, NULL, 'N/A', 3, 157),
(158, '2024-01-04 11:22:11.172286', NULL, NULL, 'N/A', 3, 158),
(159, '2024-01-04 11:22:17.369152', NULL, NULL, 'N/A', 3, 159),
(160, '2024-01-04 11:22:23.704098', NULL, NULL, 'N/A', 3, 160),
(161, '2024-01-04 11:22:30.865385', NULL, NULL, 'N/A', 3, 161),
(162, '2024-01-04 11:22:36.653381', NULL, NULL, 'N/A', 3, 162),
(163, '2024-01-04 11:22:45.078737', NULL, NULL, 'N/A', 3, 163),
(164, '2024-01-04 11:22:51.038789', NULL, NULL, 'N/A', 3, 164),
(165, '2024-01-04 11:22:58.037364', NULL, NULL, 'N/A', 3, 165),
(166, '2024-01-04 11:23:05.306089', NULL, NULL, 'N/A', 3, 166),
(167, '2024-01-04 11:23:12.693943', NULL, NULL, 'N/A', 3, 167),
(168, '2024-01-04 11:23:18.773359', NULL, NULL, 'N/A', 3, 168),
(169, '2024-01-04 11:23:26.124256', NULL, NULL, 'N/A', 3, 169),
(170, '2024-01-04 11:23:32.905444', NULL, NULL, 'N/A', 3, 170),
(171, '2024-01-04 11:23:38.669190', NULL, NULL, 'N/A', 3, 171),
(172, '2024-01-04 11:24:07.954411', NULL, NULL, 'N/A', 3, 172),
(173, '2024-01-04 11:24:16.871736', NULL, NULL, 'N/A', 3, 173),
(174, '2024-01-04 11:24:23.764801', NULL, NULL, 'N/A', 3, 174),
(175, '2024-01-04 11:24:30.586154', NULL, NULL, 'N/A', 3, 175),
(176, '2024-01-04 11:24:36.086883', NULL, NULL, 'N/A', 3, 176),
(177, '2024-01-04 11:24:41.536752', NULL, NULL, 'N/A', 3, 177),
(178, '2024-01-04 11:24:46.966755', NULL, NULL, 'N/A', 3, 178),
(179, '2024-01-04 11:24:52.674928', NULL, NULL, 'N/A', 3, 179),
(180, '2024-01-04 11:24:58.044755', NULL, NULL, 'N/A', 3, 180),
(181, '2024-01-04 11:25:04.560744', NULL, NULL, 'N/A', 3, 181),
(182, '2024-01-04 11:27:46.854105', NULL, NULL, 'N/A', 22, 182),
(183, '2024-01-04 11:32:00.205870', NULL, NULL, 'N/A', 22, 183),
(184, '2024-01-04 11:32:05.892858', NULL, NULL, 'N/A', 22, 184),
(185, '2024-01-04 11:32:11.125628', NULL, NULL, 'N/A', 22, 185),
(186, '2024-01-04 11:32:16.714886', NULL, NULL, 'N/A', 22, 186),
(187, '2024-01-04 11:32:22.521353', NULL, NULL, 'N/A', 22, 187),
(188, '2024-01-04 11:32:27.858409', NULL, NULL, 'N/A', 22, 188),
(189, '2024-01-04 11:33:06.813138', NULL, NULL, 'N/A', 22, 189),
(190, '2024-01-04 11:33:12.050482', NULL, NULL, 'N/A', 22, 190),
(191, '2024-01-04 11:33:17.069300', NULL, NULL, 'N/A', 22, 191),
(192, '2024-01-04 11:34:40.839839', NULL, NULL, 'N/A', 6, 192),
(193, '2024-01-04 11:34:46.542797', NULL, NULL, 'N/A', 6, 193),
(194, '2024-01-04 11:34:52.612564', NULL, NULL, 'N/A', 6, 194),
(195, '2024-01-04 11:34:58.793309', NULL, NULL, 'N/A', 6, 195),
(196, '2024-01-04 11:35:13.391754', NULL, NULL, 'N/A', 6, 196),
(197, '2024-01-04 11:35:20.180827', NULL, NULL, 'N/A', 6, 197),
(198, '2024-01-04 11:35:25.979321', NULL, NULL, 'N/A', 6, 198),
(199, '2024-01-04 11:35:31.149493', NULL, NULL, 'N/A', 6, 199),
(200, '2024-01-04 11:35:36.384548', NULL, NULL, 'N/A', 6, 200),
(201, '2024-01-04 11:35:43.786634', NULL, NULL, 'N/A', 6, 201),
(202, '2024-01-04 11:37:00.284015', NULL, NULL, 'N/A', 23, 202),
(203, '2024-01-04 11:37:18.411393', NULL, NULL, 'N/A', 23, 203),
(204, '2024-01-04 11:37:23.336220', NULL, NULL, 'N/A', 23, 204),
(205, '2024-01-04 11:37:29.094819', NULL, NULL, 'N/A', 23, 205),
(206, '2024-01-04 11:37:34.248340', NULL, NULL, 'N/A', 23, 206),
(207, '2024-01-04 11:37:39.507275', NULL, NULL, 'N/A', 23, 207),
(208, '2024-01-04 11:37:44.470099', NULL, NULL, 'N/A', 23, 208),
(209, '2024-01-04 11:37:50.912130', NULL, NULL, 'N/A', 23, 209),
(210, '2024-01-04 11:37:57.125761', NULL, NULL, 'N/A', 23, 210),
(211, '2024-01-04 11:38:02.446535', NULL, NULL, 'N/A', 23, 211),
(212, '2024-01-04 11:38:30.635664', NULL, NULL, 'N/A', 7, 212),
(213, '2024-01-04 11:39:09.132400', NULL, NULL, 'N/A', 7, 213),
(214, '2024-01-04 11:47:12.418793', NULL, NULL, 'N/A', 7, 214),
(215, '2024-01-04 11:47:29.289044', NULL, NULL, 'N/A', 7, 216),
(216, '2024-01-04 11:47:49.643190', NULL, NULL, 'N/A', 7, 218),
(217, '2024-01-04 11:48:10.712290', NULL, NULL, 'N/A', 7, 221),
(218, '2024-01-04 11:48:29.082991', NULL, NULL, 'N/A', 7, 219),
(219, '2024-01-04 11:52:30.772028', NULL, NULL, 'N/A', 24, 242),
(220, '2024-01-04 11:52:42.877727', NULL, NULL, 'N/A', 24, 243),
(221, '2024-01-04 11:52:54.690893', NULL, NULL, 'N/A', 24, 246),
(222, '2024-01-04 11:53:07.475106', NULL, NULL, 'N/A', 24, 244),
(223, '2024-01-04 11:53:13.351968', NULL, NULL, 'N/A', 24, 245),
(224, '2024-01-04 11:53:22.808418', NULL, NULL, 'N/A', 24, 247),
(225, '2024-01-04 11:53:29.393623', NULL, NULL, 'N/A', 24, 248),
(226, '2024-01-04 11:53:36.540508', NULL, NULL, 'N/A', 24, 249),
(227, '2024-01-04 11:53:41.994920', NULL, NULL, 'N/A', 24, 250),
(228, '2024-01-04 11:53:54.152901', NULL, NULL, 'N/A', 24, 251),
(229, '2024-01-04 12:36:02.439512', NULL, NULL, 'N/A', 7, 215),
(230, '2024-01-04 12:37:00.490407', NULL, NULL, 'N/A', 7, 217),
(231, '2024-01-04 12:37:09.229465', NULL, NULL, 'N/A', 7, 220),
(232, '2024-01-04 12:40:40.181134', NULL, NULL, 'N/A', 25, 222),
(233, '2024-01-04 12:40:45.949707', NULL, NULL, 'N/A', 25, 223),
(234, '2024-01-04 12:40:50.794240', NULL, NULL, 'N/A', 25, 224),
(235, '2024-01-04 12:40:56.916891', NULL, NULL, 'N/A', 25, 225),
(236, '2024-01-04 12:41:02.749776', NULL, NULL, 'N/A', 25, 226),
(237, '2024-01-04 12:41:09.338043', NULL, NULL, 'N/A', 25, 227),
(238, '2024-01-04 12:41:14.248911', NULL, NULL, 'N/A', 25, 228),
(239, '2024-01-04 12:41:45.810057', NULL, NULL, 'N/A', 25, 229),
(240, '2024-01-04 12:41:50.781034', NULL, NULL, 'N/A', 25, 230),
(241, '2024-01-04 12:41:56.270118', NULL, NULL, 'N/A', 25, 231),
(242, '2024-01-04 12:43:03.338309', NULL, NULL, 'N/A', 6, 232),
(243, '2024-01-04 12:43:09.100331', NULL, NULL, 'N/A', 6, 233),
(244, '2024-01-04 12:43:24.692486', NULL, NULL, 'N/A', 6, 234),
(245, '2024-01-04 12:43:29.441784', NULL, NULL, 'N/A', 6, 235),
(246, '2024-01-04 12:43:34.899375', NULL, NULL, 'N/A', 6, 236),
(247, '2024-01-04 12:43:39.873076', NULL, NULL, 'N/A', 6, 237),
(248, '2024-01-04 12:43:52.492023', NULL, NULL, 'N/A', 6, 238),
(249, '2024-01-04 12:44:34.703289', NULL, NULL, 'N/A', 6, 239),
(250, '2024-01-04 12:44:40.510889', NULL, NULL, 'N/A', 6, 240),
(251, '2024-01-04 12:44:45.650143', NULL, NULL, 'N/A', 6, 241),
(252, '2024-01-04 12:46:56.247052', NULL, NULL, 'N/A', 26, 252),
(253, '2024-01-04 12:47:03.019938', NULL, NULL, 'N/A', 26, 253),
(254, '2024-01-04 12:47:07.306603', NULL, NULL, 'N/A', 26, 254),
(255, '2024-01-04 12:47:11.298223', NULL, NULL, 'N/A', 26, 255),
(256, '2024-01-04 12:47:16.688351', NULL, NULL, 'N/A', 26, 256),
(257, '2024-01-04 12:47:22.947848', NULL, NULL, 'N/A', 26, 257),
(258, '2024-01-04 12:47:29.348269', NULL, NULL, 'N/A', 26, 258),
(259, '2024-01-04 12:47:33.959933', NULL, NULL, 'N/A', 26, 259),
(260, '2024-01-04 12:47:38.596857', NULL, NULL, 'N/A', 26, 260),
(261, '2024-01-04 12:47:43.766032', NULL, NULL, 'N/A', 26, 261),
(262, '2024-01-04 12:48:43.743826', NULL, NULL, 'N/A', 3, 262),
(263, '2024-01-04 12:48:50.685049', NULL, NULL, 'N/A', 3, 263),
(264, '2024-01-04 12:48:55.410565', NULL, NULL, 'N/A', 3, 264),
(265, '2024-01-04 12:49:01.284660', NULL, NULL, 'N/A', 3, 265),
(266, '2024-01-04 12:49:06.286285', NULL, NULL, 'N/A', 3, 266),
(267, '2024-01-04 12:49:13.142911', NULL, NULL, 'N/A', 3, 267),
(268, '2024-01-04 12:49:19.014211', NULL, NULL, 'N/A', 3, 268),
(269, '2024-01-04 12:49:25.455458', NULL, NULL, 'N/A', 3, 269),
(270, '2024-01-04 12:49:33.513906', NULL, NULL, 'N/A', 3, 270),
(271, '2024-01-04 12:49:43.934464', NULL, NULL, 'N/A', 3, 271),
(272, '2024-01-04 12:50:20.067617', NULL, NULL, 'N/A', 3, 272),
(273, '2024-01-04 12:50:26.047103', NULL, NULL, 'N/A', 3, 273),
(274, '2024-01-04 12:50:31.525455', NULL, NULL, 'N/A', 3, 274),
(275, '2024-01-04 12:50:41.359834', NULL, NULL, 'N/A', 3, 275),
(276, '2024-01-04 12:50:46.080293', NULL, NULL, 'N/A', 3, 276),
(277, '2024-01-04 12:50:50.999189', NULL, NULL, 'N/A', 3, 277),
(278, '2024-01-04 12:50:56.275079', NULL, NULL, 'N/A', 3, 278),
(279, '2024-01-04 12:51:03.681619', NULL, NULL, 'N/A', 3, 279),
(280, '2024-01-04 12:51:09.239903', NULL, NULL, 'N/A', 3, 280),
(281, '2024-01-04 12:51:14.944646', NULL, NULL, 'N/A', 3, 281),
(282, '2024-01-04 12:51:59.767942', NULL, NULL, 'N/A', 6, 282),
(283, '2024-01-04 12:52:05.731321', NULL, NULL, 'N/A', 6, 283),
(284, '2024-01-04 12:52:28.427851', NULL, NULL, 'N/A', 6, 284),
(285, '2024-01-04 12:52:34.043833', NULL, NULL, 'N/A', 6, 285),
(286, '2024-01-04 12:52:39.073381', NULL, NULL, 'N/A', 6, 286),
(287, '2024-01-04 12:52:43.914263', NULL, NULL, 'N/A', 6, 287),
(288, '2024-01-04 12:52:50.553508', NULL, NULL, 'N/A', 6, 288),
(289, '2024-01-04 12:52:55.490303', NULL, NULL, 'N/A', 6, 289),
(290, '2024-01-04 12:53:00.490932', NULL, NULL, 'N/A', 6, 290),
(291, '2024-01-04 12:53:06.305642', NULL, NULL, 'N/A', 6, 291),
(292, '2024-01-04 12:57:15.573849', NULL, NULL, 'N/A', 1, 292),
(293, '2024-01-04 12:57:22.047536', NULL, NULL, 'N/A', 1, 293),
(294, '2024-01-04 12:57:27.877227', NULL, NULL, 'N/A', 1, 294),
(295, '2024-01-04 12:57:33.057459', NULL, NULL, 'N/A', 1, 295),
(296, '2024-01-04 12:57:38.227727', NULL, NULL, 'N/A', 1, 296),
(297, '2024-01-04 13:03:43.587767', NULL, NULL, 'N/A', 1, 297),
(298, '2024-01-04 13:31:42.851120', NULL, NULL, 'N/A', 1, 298),
(299, '2024-01-04 13:31:48.495799', NULL, NULL, 'N/A', 1, 299),
(300, '2024-01-04 13:31:53.221788', NULL, NULL, 'N/A', 1, 300),
(301, '2024-01-04 13:31:58.195488', NULL, NULL, 'N/A', 1, 301),
(302, '2024-01-04 13:54:41.585193', NULL, NULL, 'N/A', 3, 302),
(303, '2024-01-04 13:54:47.752562', NULL, NULL, 'N/A', 3, 303),
(304, '2024-01-04 13:54:52.971823', NULL, NULL, 'N/A', 3, 304),
(305, '2024-01-04 13:54:58.181157', NULL, NULL, 'N/A', 3, 305),
(306, '2024-01-04 13:55:04.468795', NULL, NULL, 'N/A', 3, 306),
(307, '2024-01-04 13:56:23.354036', NULL, NULL, 'N/A', 3, 307),
(308, '2024-01-04 14:04:48.556357', NULL, NULL, 'N/A', 3, 308),
(309, '2024-01-04 14:16:29.461745', NULL, NULL, 'N/A', 3, 309),
(310, '2024-01-04 14:16:35.411351', NULL, NULL, 'N/A', 3, 310),
(311, '2024-01-04 14:16:43.730608', NULL, NULL, 'N/A', 3, 311),
(312, '2024-01-04 14:16:48.682460', NULL, NULL, 'N/A', 3, 312),
(313, '2024-01-04 14:16:54.242100', NULL, NULL, 'N/A', 3, 314),
(314, '2024-01-04 14:16:59.701930', NULL, NULL, 'N/A', 3, 313),
(315, '2024-01-04 14:17:04.723491', NULL, NULL, 'N/A', 3, 315),
(316, '2024-01-04 14:17:09.939542', NULL, NULL, 'N/A', 3, 316),
(317, '2024-01-04 14:17:16.478651', NULL, NULL, 'N/A', 3, 317),
(318, '2024-01-04 14:17:22.086825', NULL, NULL, 'N/A', 3, 318),
(319, '2024-01-04 14:21:36.923919', NULL, NULL, 'N/A', 3, 319),
(320, '2024-01-04 14:21:42.422251', NULL, NULL, 'N/A', 3, 320),
(321, '2024-01-04 14:21:48.499769', NULL, NULL, 'N/A', 3, 321),
(322, '2024-01-04 14:28:47.695157', NULL, NULL, 'N/A', 3, 322),
(323, '2024-01-04 14:28:54.503423', NULL, NULL, 'N/A', 3, 323),
(324, '2024-01-04 14:28:59.631044', NULL, NULL, 'N/A', 3, 324),
(325, '2024-01-04 14:29:05.296510', NULL, NULL, 'N/A', 3, 325),
(326, '2024-01-04 14:29:10.624195', NULL, NULL, 'N/A', 3, 326),
(327, '2024-01-04 14:29:17.721711', NULL, NULL, 'N/A', 3, 327),
(328, '2024-01-04 14:29:23.126663', NULL, NULL, 'N/A', 3, 328),
(329, '2024-01-04 14:29:29.412977', NULL, NULL, 'N/A', 3, 329),
(330, '2024-01-04 14:29:35.822280', NULL, NULL, 'N/A', 3, 330),
(331, '2024-01-04 14:30:59.677143', NULL, NULL, 'N/A', 3, 331),
(332, '2024-01-04 14:39:33.194405', NULL, NULL, 'N/A', 22, 332),
(333, '2024-01-04 14:39:39.109933', NULL, NULL, 'N/A', 22, 333),
(334, '2024-01-04 14:39:44.014839', NULL, NULL, 'N/A', 22, 334),
(335, '2024-01-04 14:39:49.388523', NULL, NULL, 'N/A', 22, 335),
(336, '2024-01-04 14:39:55.846184', NULL, NULL, 'N/A', 22, 336),
(337, '2024-01-04 14:40:01.525154', NULL, NULL, 'N/A', 22, 337),
(338, '2024-01-04 14:40:06.590933', NULL, NULL, 'N/A', 22, 338),
(339, '2024-01-04 14:40:13.163408', NULL, NULL, 'N/A', 22, 339),
(340, '2024-01-04 14:40:18.788904', NULL, NULL, 'N/A', 22, 340),
(341, '2024-01-04 14:40:23.853548', NULL, NULL, 'N/A', 22, 341),
(342, '2024-01-04 14:51:55.656963', NULL, NULL, 'N/A', 27, 342),
(343, '2024-01-04 14:52:01.128273', NULL, NULL, 'N/A', 27, 343),
(344, '2024-01-04 14:52:06.866998', NULL, NULL, 'N/A', 27, 344),
(345, '2024-01-04 14:52:12.233781', NULL, NULL, 'N/A', 27, 345),
(346, '2024-01-04 14:52:16.880338', NULL, NULL, 'N/A', 27, 346),
(347, '2024-01-04 14:52:22.054185', NULL, NULL, 'N/A', 27, 347),
(348, '2024-01-04 14:52:27.228472', NULL, NULL, 'N/A', 27, 348),
(349, '2024-01-04 14:52:32.451519', NULL, NULL, 'N/A', 27, 349),
(350, '2024-01-04 14:52:37.385734', NULL, NULL, 'N/A', 27, 350),
(351, '2024-01-04 14:52:42.603617', NULL, NULL, 'N/A', 27, 351),
(352, '2024-01-04 15:02:24.416628', NULL, NULL, 'N/A', 27, 352),
(353, '2024-01-04 15:02:29.126821', NULL, NULL, 'N/A', 27, 353),
(354, '2024-01-04 15:02:33.951194', NULL, NULL, 'N/A', 27, 354),
(355, '2024-01-04 15:02:38.995742', NULL, NULL, 'N/A', 27, 355),
(356, '2024-01-04 15:02:43.761986', NULL, NULL, 'N/A', 27, 356),
(357, '2024-01-04 15:02:49.617692', NULL, NULL, 'N/A', 27, 357),
(358, '2024-01-04 15:02:55.301918', NULL, NULL, 'N/A', 27, 358),
(359, '2024-01-04 15:03:01.108115', NULL, NULL, 'N/A', 27, 359),
(360, '2024-01-04 15:03:06.005280', NULL, NULL, 'N/A', 27, 360),
(361, '2024-01-04 15:03:11.856710', NULL, NULL, 'N/A', 27, 361);

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
(48, 'appointment', 'getappointment'),
(7, 'article', 'article'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'bodypart', 'bodypart'),
(5, 'contenttypes', 'contenttype'),
(9, 'department', 'department'),
(10, 'department_speci', 'departmentspecification'),
(13, 'doctor', 'appointmentschedule'),
(12, 'doctor', 'awards'),
(11, 'doctor', 'doctorprofile'),
(14, 'doctor', 'education'),
(15, 'doctor', 'offday'),
(16, 'doctor', 'scheduletime'),
(17, 'doctor', 'socialmedia'),
(18, 'faq', 'faq'),
(25, 'labtest', 'labtest'),
(19, 'medicine', 'brand'),
(20, 'medicine', 'generic'),
(24, 'medicine', 'medicine'),
(21, 'medicine', 'medicineschedule'),
(22, 'medicine', 'medicinetype'),
(23, 'medicine', 'strength'),
(26, 'organ', 'organ'),
(27, 'organ_problem_speci', 'organsproblemspecification'),
(28, 'patient', 'patientprofile'),
(29, 'personal_data', 'blood_group'),
(30, 'personal_data', 'board'),
(31, 'personal_data', 'day'),
(36, 'personal_data', 'district'),
(32, 'personal_data', 'division'),
(33, 'personal_data', 'gender'),
(34, 'personal_data', 'matrimony'),
(35, 'personal_data', 'religion'),
(37, 'personal_data', 'upazila'),
(49, 'prediction', 'prediction'),
(50, 'prediction', 'specification'),
(39, 'prescription', 'labtestprescription'),
(41, 'prescription', 'medicineprescription'),
(38, 'prescription', 'prescriptionforlabtest'),
(40, 'prescription', 'prescriptionformedicine'),
(6, 'sessions', 'session'),
(46, 'user', 'adminprofile'),
(45, 'user', 'images'),
(44, 'user', 'permanentaddress'),
(43, 'user', 'presentaddress'),
(42, 'user', 'user'),
(47, 'verifyotp', 'verifyotp');

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
(1, 'contenttypes', '0001_initial', '2024-01-03 12:18:30.737952'),
(2, 'auth', '0001_initial', '2024-01-03 12:18:32.122936'),
(3, 'admin', '0001_initial', '2024-01-03 12:18:32.479214'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-03 12:18:32.493173'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-03 12:18:32.505148'),
(6, 'personal_data', '0001_initial', '2024-01-03 12:18:33.474546'),
(7, 'user', '0001_initial', '2024-01-03 12:18:35.822702'),
(8, 'patient', '0001_initial', '2024-01-03 12:18:36.707082'),
(9, 'department', '0001_initial', '2024-01-03 12:18:36.769726'),
(10, 'doctor', '0001_initial', '2024-01-03 12:18:40.267773'),
(11, 'appointment', '0001_initial', '2024-01-03 12:18:40.638781'),
(12, 'article', '0001_initial', '2024-01-03 12:18:41.062667'),
(13, 'contenttypes', '0002_remove_content_type_name', '2024-01-03 12:18:41.207262'),
(14, 'auth', '0002_alter_permission_name_max_length', '2024-01-03 12:18:41.339142'),
(15, 'auth', '0003_alter_user_email_max_length', '2024-01-03 12:18:41.367068'),
(16, 'auth', '0004_alter_user_username_opts', '2024-01-03 12:18:41.384028'),
(17, 'auth', '0005_alter_user_last_login_null', '2024-01-03 12:18:41.545592'),
(18, 'auth', '0006_require_contenttypes_0002', '2024-01-03 12:18:41.552578'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2024-01-03 12:18:41.567534'),
(20, 'auth', '0008_alter_user_username_max_length', '2024-01-03 12:18:41.593464'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2024-01-03 12:18:41.619396'),
(22, 'auth', '0010_alter_group_name_max_length', '2024-01-03 12:18:41.650313'),
(23, 'auth', '0011_update_proxy_permissions', '2024-01-03 12:18:41.687213'),
(24, 'auth', '0012_alter_user_first_name_max_length', '2024-01-03 12:18:41.714143'),
(25, 'bodypart', '0001_initial', '2024-01-03 12:18:41.764230'),
(26, 'organ', '0001_initial', '2024-01-03 12:18:41.929783'),
(27, 'organ_problem_speci', '0001_initial', '2024-01-03 12:18:42.213027'),
(28, 'department_speci', '0001_initial', '2024-01-03 12:18:42.564089'),
(29, 'faq', '0001_initial', '2024-01-03 12:18:42.901188'),
(30, 'labtest', '0001_initial', '2024-01-03 12:18:42.949061'),
(31, 'medicine', '0001_initial', '2024-01-03 12:18:44.331366'),
(32, 'prediction', '0001_initial', '2024-01-03 12:18:45.680042'),
(33, 'prescription', '0001_initial', '2024-01-03 12:18:48.584768'),
(34, 'sessions', '0001_initial', '2024-01-03 12:18:48.671377'),
(35, 'verifyotp', '0001_initial', '2024-01-03 12:18:48.883805');

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
  `modified_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `modified_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `doctor_off_day`
--

CREATE TABLE `doctor_off_day` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `doctor_profile_id` bigint(20) NOT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `off_day_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `biography` varchar(10000) DEFAULT NULL,
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
(1, '2024-01-04 09:55:54.637054', NULL, NULL, 'Dr. Arunangshu Das', 'Aimee Long', 'Brielle Melton', '1971-01-19', '6', '01965784645', '76', '5 Years', 'Dr Arunangshu Das passed MBBS from Mymensing Medical College in 2005. After that he joined Radiotherapy Department of Dhaka Medical College in 2007 as Honorary Medical Officer. At the end of 2008 he received a scholarship and went to National Cancer Center (NCC) Singapore for a clinical attachment and training. In 2009, he successfully completed Post Graduate Certificate in Palliative Medicine  from Flinders University Australia.  He joined Government Health Service (27th BCS) in December 2008. Subsequently in 2010 he was posted at National Institute of Cancer Research and Hospital (NICRH), Dhaka at the Department of Radiation Oncology. In 2012 he went to UKM, Malaysia for a higher training in Oncology. He successfully completed FCPS in Radiotherapy from Bangladesh College of Physicians and Surgeons of Bangladesh (BCPS) in 2014. At the middle of 2014 he went to TATA Memorial Hospital Mumbai for a clinical training in Radiation Oncology. He received the prestigious International Development and Education Award (IDEA) in January 2018 from American Society of Clinical Oncology (ASCO) USA. He also achieved the prestigious ESMO Asia Leadership Award in 2020. As a part of voluntary activity he is working as the General Secretary of Bangladesh Society for Breast Cancer Study. He is active in clinical research and published many articles both nationally and internationally. He has long 15 years experience working the field of Oncology. Currently he is working as Associate Consultant at Oncology Department of Square Hospitals Ltd.', 'Bangla, English', 'N/A', 1, 4, 1, 1, 2, 2),
(2, '2024-01-04 10:16:07.349043', NULL, NULL, 'Dr. Md. Towhiduzzaman', 'Kalia Shaw', 'Julie Dunlap', '1976-04-15', '8', '01963369911', '61', 'Assumenda rerum cons', 'Dr. Towhiduzzaman received SAARC Cardiology  hands on Fellowship in Interventional Cardiology at Escorts Heart Institute and Research Centre (EHIR&C), New Delhi, India for 01(one) year in June 2006. Subsequently he was selected for another 01 year hands on Fellowship program in Interventional Cardiology at National Heart Centre, Singapore and received the fellowship award in July 2007.  He has successfully completed Rotablation, Intravascular ultrasound Pressure wire and peripheral stenting course. He also gained and experienced a numerous number of invasive and clinical training and observatory fellowship and visited  USA, Canada, France, England, Japan, Italy, Sweden, Hong Kong, China, Jamaica, Costarica, Vietnam, Malaysia, Thailand, India, Pakistan and Nepal. Dr. Towhiduzzaman has published articles and presented cases at numerous national and international conferences. He has vast experiences of 10 years to perform invasive & interventional and complex diagnostic and therapeutic procedures independently & confidently. He is regular Faculty/Guest Speaker and participated in a large number of International workshops, seminars, symposiums both home and abroad that has enriched his decision making capacity, professional skills and care giving attitude to an international level. For last 10 years he is performing highest number of complex bifurcation, CTOs, primary PCI, and Renal & Peripheral Angioplasties at Square Hospital.His sub specialty interest is in Interventional Cardiology.Professional Appointment & Committee Membership:Life Member – Bangladesh Cardiac Society (BSC), Bangladesh Society of Cardiovascular Interventions (BSCI), Bangladesh Society of Echo Cardiography (BSE), Bangladesh Medical Association (BMA)Org. Secretary (Elect) Bangladesh Cardiac Society from 2015, Scientific Secretary (Elect), 2009 – 14.Others: Fellow, Society of Cardiac angiography &Intervention(FSCAI, USA), Associate Fellow American College of Cardiology (FACC), Member-American Society of Echocardiography (MASE), European Society of Percutaneous Cardiovascular Interventions. (EPACI), European Society of Cardiology (MESC)', 'Bangla, English', 'Ut ut blanditiis id', 3, 18, 1, 1, 1, 3),
(3, '2024-01-04 11:42:11.395957', NULL, NULL, 'Dr. Asif Manwar', 'Armand Nguyen', 'Ila Norris', '2018-06-14', '18', '+1 (993) 535-9147', '24', 'Praesentium in expli', 'Dr. Asif Manwar, a graduate of Chittagong Medical College, started career as Resident Medical Officer, BIRDEM in 2002 en-route to Ibrahim Cardiac Hospital.  Dr. Manwar pursued PG Dip Cardiology in 2004 under University of London with Distinction & Sir John Goodwin Prize for academic excellence by Imperial College London. Academic up-gradation in 2006 created an opportunity to serve Apollo Hospital Dhaka as Registrar, Cardiology. To aspire proficiency at masters’ level he completed MSc Cardiology with Distinction once again by Canterbury Christ Church & University College London (UCL) in 2008. To achieve superspeciality, he opted Fellowship in Paediatric Cardiology being registered with Medical Council of India in 2009.           \r\n\r\nDr. Manwar is proficient in all facets of non-invasive procedures like 3D-TOE-DSE, Dyssynchrony, Strain Rate, Tissue Doppler Imaging, Contrast & Intra-operative Echo. He got basic training from Hammersmith, Royal Brompton and advanced training from The Heart Hospital London. He obtained hands on training in Grown-Up Congenital, Paediatric, Neonatal & Fetal Echo from AMRITA Kerala & New Delhi India. \r\n\r\nDr. Asif Manwar joined SQUARE Hospital as Specialist Cardiologist, contributing his expertise since then before taking up position of Associate Consultant in 2015 & Coordinator Non-Invasive Lab in 2017.', 'Bangla, English', 'Distinctio Sed dolo', 8, 22, 1, 4, 3, 4),
(4, '2024-01-04 11:43:53.046856', NULL, NULL, 'Dr. Fowaz Hussain Shuvo', 'Haley Perkins', 'Silas Owen', '1989-04-12', '53', '+1 (965) 663-4104', '26', 'Provident occaecat', 'Dr. Fowaz Hussain graduated from Dhaka Medical College and obtained his MD (Hepatology) from Bangabandhu Sheikh Mujib Medical University (BSMMU). He gained experience through his working tenure of more than 10 years at department of Hepatology and Gastroenterology of a reputed corporate hospital of Dhaka where he groomed himself up as one of the dependable gastroenterologists of the country. He was also an Assistant Professor in the department of Hepatolgy at Mymensingh Medical College & Hospital. Dr. Fowaz Hussain is an expert in Interventional procedures like Endoscopy, Colonoscopy, Polypectomy, ERCP, Esophageal Stentings, Bleeding Homeostasis and Clippings. Dr. Fowaz Hussain got his advanced interventional training and joined many workshops in India, Singapore and different countries of Europe. He has many publications both in international and national levels.', 'Bangla, English', 'Tempor quo officia a', 5, 7, 1, 1, 1, 5);

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

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `created_at`, `updated_at`, `deleted_at`, `question`, `answer`, `created_by_id`, `modified_by_id`) VALUES
(1, '2024-01-04 16:24:07.938548', NULL, NULL, 'What is the purpose of this doctor prediction project?', 'This project aims to assist you in finding suitable doctors based on your problem specification.', 1, NULL),
(2, '2024-01-04 16:24:35.325966', NULL, NULL, 'How does the doctor book system work?', 'The system utilizes advanced algorithms and machine learning models to analyze historical data, user preferences, and real-time information to predict the most suitable doctors for a given query.', 1, 1),
(3, '2024-01-04 16:25:13.837017', NULL, NULL, 'What information is required for the doctor prediction process?', 'The system requires input such as preferred specialty, and desired appointment time to provide accurate predictions.', 1, NULL),
(4, '2024-01-04 16:25:39.934566', NULL, NULL, 'Is the doctor book system based on historical data or real-time information?', 'The system combines historical data with real-time information to ensure up-to-date and relevant predictions.', 1, NULL),
(5, '2024-01-04 16:27:21.591254', NULL, NULL, 'Can I trust the predictions made by the system?', 'Our system undergoes rigorous testing and validation to ensure accuracy. While no system is perfect, we continuously strive to improve and refine our prediction models.', 1, NULL),
(6, '2024-01-04 16:27:40.159945', NULL, NULL, 'What factors are considered in predicting the availability of a doctor?', 'Availability predictions take into account factors such as the doctor\'s schedule, historical appointment data, and any specific preferences provided by the user.', 1, NULL),
(7, '2024-01-04 16:27:56.461820', NULL, NULL, 'How often are the predictions updated?', 'predictions are updated regularly to reflect changes in doctor availability and ensure users receive the most current information.', 1, NULL),
(8, '2024-01-04 16:28:20.737305', NULL, NULL, 'Can I book an appointment directly through the system?', 'Yes, our system allows users to seamlessly book appointments with the predicted doctors. The booking process is user-friendly and efficient.', 1, NULL),
(9, '2024-01-04 16:28:41.258006', NULL, NULL, 'Is the doctor book system accessible on mobile devices?', 'Absolutely! Our system is designed to be responsive and accessible on various devices, including mobile phones and tablets.', 1, NULL),
(10, '2024-01-04 16:28:59.364381', NULL, NULL, 'What security measures are in place to protect user data?', 'We prioritize the security of user data and implement encryption protocols to safeguard personal information. Our privacy policy provides comprehensive details on data protection.', 1, NULL),
(11, '2024-01-04 16:29:15.927353', NULL, NULL, 'How can I provide feedback or report issues with the doctor book?', 'Users can easily provide feedback or report issues through our contact page or customer support email. We value user input and use it to enhance our system.', 1, NULL),
(12, '2024-01-04 16:29:32.941016', NULL, NULL, 'Are there any costs associated with using the doctor book system?', 'The basic features of our doctor prediction system are free to use. However, there may be additional charges for premium features or services.', 1, NULL),
(13, '2024-01-04 16:30:10.436614', NULL, NULL, 'What should I do if I encounter technical difficulties while using the system?', 'If you experience technical difficulties, please refer to our troubleshooting guide on the support page. For further assistance, contact our technical support team at [doctorbook.official@gmail.com].', 1, NULL),
(14, '2024-01-04 16:30:28.014806', NULL, NULL, 'Is my personal information kept confidential?', 'We take privacy seriously. Your personal information is securely stored and handled in accordance with our privacy policy. Rest assured that your data is kept confidential.', 1, NULL),
(15, '2024-01-04 16:32:10.796274', NULL, NULL, 'How does the system handle emergency situations?', 'In emergency situations, the system prioritizes and provides immediate access to available doctors. However, for critical emergencies, we strongly recommend contacting local emergency services.', 1, NULL),
(16, '2024-01-04 16:32:30.684857', NULL, NULL, 'Can I receive notifications for upcoming appointments?', 'Yes, our system offers the option to enable notifications. Users can receive alerts for upcoming appointments, ensuring they don\'t miss important meetings with their chosen doctors.', 1, NULL),
(17, '2024-01-04 16:32:39.672043', NULL, NULL, 'Are alternative or backup doctors suggested in case my preferred choice is unavailable?', 'Absolutely. If your preferred doctor is unavailable, the system automatically suggests alternative doctors based on similar criteria to ensure you still have options.', 1, NULL),
(18, '2024-01-04 16:33:22.230313', NULL, NULL, 'How does the system ensure fairness and avoid biases in doctor predictions?', 'We employ advanced algorithms designed to mitigate biases and ensure fairness in doctor predictions. Regular audits and updates are conducted to address any potential biases that may arise.', 1, NULL),
(19, '2024-01-04 16:33:40.354512', NULL, NULL, 'What information is required for user registration, and is it mandatory?', 'User registration typically requires basic information such as name, email, and location. While registration is not mandatory for browsing, it is necessary for booking appointments and accessing personalized features.', 1, NULL),
(20, '2024-01-04 16:33:52.108231', NULL, NULL, 'How does the system handle data privacy and compliance with regulations?', 'Our system adheres to strict data privacy regulations. We comply with industry standards and regulations, and our privacy policy outlines how user data is collected, stored, and processed.', 1, NULL);

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
(1, '2024-01-03 12:26:15.136829', NULL, NULL, 'uploads/images/20240103182615_1bca73153bbb4509a0831ca5bdd9bc50.jpg', 1),
(2, '2024-01-04 09:55:54.652016', NULL, NULL, 'uploads/images/20240104155554_32a7f847c00a4017b624c16785dec07d.png', 2),
(3, '2024-01-04 10:16:07.353033', NULL, NULL, 'uploads/images/20240104161607_e3771eebce404dc6ac651c66cf3dc6f8.jpg', 3),
(4, '2024-01-04 11:42:11.423879', NULL, NULL, 'uploads/images/20240104174211_489b0886c31c447380658497eb25a241.png', 4),
(5, '2024-01-04 11:43:53.048848', NULL, NULL, 'uploads/images/20240104174353_e2b6dcd3bde548109fcea2563d67ada6.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_test`
--

INSERT INTO `lab_test` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `description`) VALUES
(1, NULL, NULL, NULL, 'Blood Test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lab_test_prescription`
--

CREATE TABLE `lab_test_prescription` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `lab_test_id` bigint(20) DEFAULT NULL,
  `modified_by_id` bigint(20) DEFAULT NULL,
  `lab_prescription_id` bigint(20) DEFAULT NULL
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
  `modified_by_id` bigint(20) DEFAULT NULL,
  `medicine_type_id` bigint(20) NOT NULL,
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
-- Table structure for table `medicine_prescription`
--

CREATE TABLE `medicine_prescription` (
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
(8, '2023-08-16 16:42:38.990509', '2024-01-03 17:13:37.988262', NULL, 'Lungs  (শ্বাসযন্ত্র)', 'Exchange oxygen and carbon dioxide during breathing. (শ্বাসের সময় অক্সিজেন এবং কার্বন ডাই অক্সাইড বিনিময় করুন।)', 3),
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
(19, '2023-08-16 18:38:24.460260', '2024-01-03 17:09:33.397779', NULL, 'Thymus gland (থাইমাস গ্রন্থি)', 'The thymus gland is a specialized organ of the immune system located in the upper part of the chest, just behind the sternum (breastbone) and in front of the heart. It is most active during childhood and adolescence, gradually decreasing in size and activity as a person ages. Here is some detailed information about the thymus gland ( থাইমাস গ্রন্থি হ\'ল ইমিউন সিস্টেমের একটি বিশেষ অঙ্গ যা বুকের উপরের অংশে, স্টার্নামের ঠিক পিছনে (স্তনের হাড়) এবং হৃৎপিণ্ডের সামনে অবস্থিত। এটি শৈশব এবং বয়ঃসন্ধিকালে সর্বাধিক সক্রিয়, ধীরে ধীরে একজন ব্যক্তির বয়স হিসাবে আকার এবং কার্যকলাপ হ্রাস পায়। এখানে থাইমাস গ্রন্থি সম্পর্কে কিছু বিস্তারিত তথ্য রয়েছে:)', 6),
(20, '2023-08-16 18:38:24.467784', '2024-01-04 08:16:15.379547', NULL, 'Null', 'N/A', 6),
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
(38, '2023-08-16 18:54:13.572578', NULL, NULL, 'Subcutaneous Tissue (Hypodermis) (সাবকুটেনিয়াস টিস্যু (হাইপোডার্মিস))', 'The layer beneath the dermis that contains fat cells and helps insulate the body. (ডার্মিসের নীচের স্তর যাতে চর্বি কোষ থাকে এবং শরীরকে নিরোধক করতে সাহায্য করে।)', 12),
(39, '2024-01-03 17:15:58.725930', NULL, '2024-01-04 07:58:38.167832', 'Kidneys (কিডনি)', 'The kidneys are two bean-shaped organs, each about the size of a fist. They are located just below the rib cage, one on each side of your spine. Healthy kidneys filter about a half cup of blood every minute, removing wastes and extra water to make urine. (কিডনি হল দুটি শিমের আকৃতির অঙ্গ, প্রতিটি একটি মুষ্টির আকারের। এগুলি আপনার মেরুদণ্ডের প্রতিটি পাশে একটি পাঁজরের খাঁচার নীচে অবস্থিত। স্বাস্থ্যকর কিডনি প্রতি মিনিটে প্রায় দেড় কাপ রক্ত ফিল্টার করে, বর্জ্য অপসারণ করে এবং অতিরিক্ত পানি প্রস্রাব তৈরি করে।)', 6),
(40, '2024-01-04 05:05:38.349709', '2024-01-04 05:07:34.084786', '2024-01-04 08:07:45.540123', 'Reproductive organs (প্রজনন অঙ্গ)', 'The male reproductive system includes the testes (which produce sperm), penis, epididymis, vas deferens, ejaculatory ducts and urethra. The female reproductive system consists of the ovaries (which produce eggs or oocytes), fallopian tubes, uterus, cervix, vagina and vulva. (পুরুষ প্রজনন ব্যবস্থার মধ্যে রয়েছে অণ্ডকোষ (যা শুক্রাণু উৎপন্ন করে), লিঙ্গ, এপিডিডাইমিস, ভাস ডিফারেনস, বীর্যপাত নালী এবং মূত্রনালী। মহিলাদের প্রজনন ব্যবস্থায় ডিম্বাশয় (যা ডিম বা oocytes উৎপন্ন করে), ফ্যালোপিয়ান টিউব, জরায়ু, জরায়ু, যোনি এবং ভালভা নিয়ে গঠিত।)', 6);

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
(1, '2024-01-03 13:38:24.820027', NULL, NULL, 'Migraine (মাইগ্রেন)', 'Recurrent headaches often accompanied by nausea, vomiting, and sensitivity to light and sound. (বারবার মাথাব্যথার সাথে প্রায়ই বমি বমি ভাব, বমি এবং আলো ও শব্দের প্রতি সংবেদনশীলতা থাকে।)', 1),
(2, '2024-01-03 13:39:49.276380', NULL, NULL, 'Alzheimer\'s Disease (আলঝেইমার রোগ)', 'Progressive neurodegenerative disorder affecting memory, cognitive function, and behavior.(প্রগতিশীল নিউরোডিজেনারেটিভ ডিসঅর্ডার যা স্মৃতিশক্তি, জ্ঞানীয় কার্যকারিতা এবং আচরণকে প্রভাবিত করে।)', 1),
(3, '2024-01-03 13:43:44.424046', NULL, NULL, 'Concussion (মস্তিষ্কের আঘাত)', 'Traumatic brain injury resulting from a blow to the head, leading to temporary cognitive and physical impairment.(মাথায় আঘাতের ফলে আঘাতজনিত মস্তিষ্কের আঘাত, যা সাময়িক জ্ঞানীয় এবং শারীরিক প্রতিবন্ধকতার দিকে পরিচালিত করে।)', 1),
(4, '2024-01-03 13:43:44.430032', NULL, NULL, 'Parkinson\'s Disease (স্নায়বিক ব্যাধি ও কম্পন )', 'Neurological disorder causing tremors, stiffness, and difficulty with balance and coordination.(স্নায়বিক ব্যাধি যার ফলে কম্পন, দৃঢ়তা এবং ভারসাম্য ও সমন্বয়ে অসুবিধা হয়।)', 1),
(5, '2024-01-03 13:43:44.436009', NULL, NULL, 'Cerebral Palsy (অঙ্গবিন্যাসকে প্রভাবিত)', 'Group of disorders affecting movement and posture due to damage to the developing brain, often occurring before or during birth. (বিকাশমান মস্তিষ্কের ক্ষতির কারণে নড়াচড়া এবং অঙ্গবিন্যাসকে প্রভাবিত করে ব্যাধিগুলির গ্রুপ, প্রায়শই জন্মের আগে বা সময় ঘটে।)', 1),
(6, '2024-01-03 13:47:12.870119', NULL, NULL, ' Traumatic Brain Injury (TBI) (ট্রমাটিক ব্রেন ইনজুরি )', 'Damage to the brain caused by an external force, often resulting from accidents, falls, or sports injuries, leading to various cognitive and physical impairments. (বাহ্যিক শক্তির কারণে মস্তিষ্কের ক্ষতি, প্রায়শই দুর্ঘটনা, পড়ে যাওয়া বা খেলাধুলার আঘাতের ফলে বিভিন্ন জ্ঞানীয় এবং শারীরিক প্রতিবন্ধকতা দেখা দেয়।)', 1),
(7, '2024-01-03 13:48:37.490778', NULL, NULL, 'Encephalitis', 'Inflammation of the brain, often caused by viral infections, leading to symptoms such as fever, headache, and altered mental status. (মস্তিষ্কের প্রদাহ, প্রায়শই ভাইরাল সংক্রমণের কারণে হয়, যা জ্বর, মাথাব্যথা এবং পরিবর্তিত মানসিক অবস্থার মতো লক্ষণগুলির দিকে পরিচালিত করে।)', 1),
(8, '2024-01-03 13:49:50.723761', NULL, NULL, 'Brain Abscess (মস্তিষ্ক ফোড়া)', 'Collection of pus within the brain, usually caused by a bacterial or fungal infection. (ব্রেন অ্যাবসেস মস্তিষ্কের মধ্যে পুঁজ সংগ্রহ, সাধারণত ব্যাকটেরিয়া বা ছত্রাকের সংক্রমণের কারণে হয়।)', 1),
(9, '2024-01-03 13:52:44.699232', NULL, NULL, ' Brain Tumors (ব্রেন টিউমার)', 'Abnormal growth of cells in the brain that can be benign or malignant, causing various symptoms based on the location and size of the tumor. (মস্তিষ্কে কোষের অস্বাভাবিক বৃদ্ধি যা সৌম্য বা ম্যালিগন্যান্ট হতে পারে, যা টিউমারের অবস্থান এবং আকারের উপর ভিত্তি করে বিভিন্ন উপসর্গ সৃষ্টি করে।)', 1),
(10, '2024-01-03 13:52:44.713198', NULL, NULL, 'Stroke (স্ট্রোক)', 'neurological disorder causing seizures.  (রক্ত সরবরাহ ব্যাহত হওয়ার ফলে কোষের ক্ষতি হয়)', 1),
(11, '2024-01-03 13:52:44.717185', NULL, NULL, 'Epilepsy ( মৃগীরোগ)', 'disruption of blood supply leading to cell damage( স্নায়বিক ব্যাধি খিঁচুনি সৃষ্টি করে।)', 1),
(12, '2024-01-03 13:59:39.648036', NULL, NULL, 'Glaucoma ( গ্লুকোমা)', 'Increased intraocular pressure leading to optic nerve damage, often resulting in gradual vision loss. (বর্ধিত ইন্ট্রাওকুলার চাপ অপটিক স্নায়ুর ক্ষতির দিকে পরিচালিত করে, প্রায়শই ধীরে ধীরে দৃষ্টিশক্তি হ্রাস পায়।)', 2),
(13, '2024-01-03 13:59:39.653029', NULL, NULL, 'Conjunctivitis (কনজেক্টিভাইটিস)', 'Inflammation of the conjunctiva, causing redness, itching, and discharge. It can be caused by viruses, bacteria, or allergies. ( কনজেক্টিভা প্রদাহ, যার ফলে লালভাব, চুলকানি এবং স্রাব হয়। এটি ভাইরাস, ব্যাকটেরিয়া বা অ্যালার্জির কারণে হতে পারে।)', 2),
(14, '2024-01-03 13:59:39.659005', '2024-01-03 14:02:51.948646', NULL, 'Cataracts ( ছানি )', 'Clouding of the eye\'s natural lens, leading to blurry vision and visual impairment. (চোখের প্রাকৃতিক লেন্স ক্লাউডিং, ঝাপসা দৃষ্টি এবং দৃষ্টি প্রতিবন্ধকতার দিকে পরিচালিত করে।)', 2),
(15, '2024-01-03 14:08:09.583834', NULL, NULL, 'Retinal Detachment (রেটিনার বিচু্যতি)', 'Separation of the retina from the underlying layers of the eye, leading to vision loss if not promptly treated.(চোখের অন্তর্নিহিত স্তরগুলি থেকে রেটিনা বিচ্ছিন্ন হয়ে যায়, যা অবিলম্বে চিকিত্সা না করলে দৃষ্টিশক্তি হ্রাস পায়।)', 2),
(16, '2024-01-03 14:08:09.590813', NULL, NULL, 'Macular Degeneration (ম্যাকুলার ডিজেনারেশন)', ' Breakdown or damage to the macula, causing loss of central vision, especially in older adults. (ম্যাকুলার ভাঙ্গন বা ক্ষতি, যার ফলে কেন্দ্রীয় দৃষ্টিশক্তি নষ্ট হয়, বিশেষ করে বয়স্কদের ক্ষেত্রে।)', 2),
(17, '2024-01-03 14:08:09.604782', NULL, NULL, ' Diabetic Retinopathy (ডায়াবেটিক রেটিনা ক্ষয়)', 'Damage to the blood vessels of the retina due to diabetes, leading to vision impairment or blindness. (ডায়াবেটিসের কারণে রেটিনার রক্তনালীগুলির ক্ষতি হয়, যার ফলে দৃষ্টি প্রতিবন্ধকতা বা অন্ধত্ব হয়।)', 2),
(18, '2024-01-03 14:08:09.608773', NULL, NULL, 'Color Blindness (বর্ণান্ধতা)', ' Inability to perceive certain colors accurately due to a deficiency in color-sensitive pigments in the eyes. (চোখের রঙ-সংবেদনশীল রঙ্গকগুলির ঘাটতির কারণে নির্দিষ্ট রঙগুলি সঠিকভাবে উপলব্ধি করতে অক্ষমতা।)', 2),
(19, '2024-01-03 14:08:09.613752', NULL, NULL, 'Corneal Ulcer (কর্নিয়াল আলসার)', ' Open sore on the cornea, often caused by bacterial or fungal infections, leading to pain, redness, and vision problems.(কর্নিয়াতে খোলা কালশিটে, প্রায়শই ব্যাকটেরিয়া বা ছত্রাকের সংক্রমণের কারণে হয়, যার ফলে ব্যথা, লালভাব এবং দৃষ্টি সমস্যা হয়।)', 2),
(20, '2024-01-03 14:09:08.063323', NULL, NULL, ' Amblyopia (Lazy Eye) (অ্যাম্বলিওপিয়া (অলস চোখ))', 'Reduced vision in one eye that is not correctable by glasses or contact lenses, often due to a lack of proper visual stimulation during early childhood. ( একটি চোখের দৃষ্টি হ্রাস যা চশমা বা কন্টাক্ট লেন্স দ্বারা সংশোধন করা যায় না, প্রায়শই শৈশবকালে সঠিক চাক্ষুষ উদ্দীপনার অভাবের কারণে।)', 2),
(21, '2024-01-03 14:10:44.595244', NULL, NULL, 'Dry Eye Syndrome (ড্রাই আই সিনড্রোম)', 'Insufficient production of tears or poor-quality tears, causing discomfort, redness, and blurred vision.(অপর্যাপ্ত অশ্রু উৎপাদন বা নিম্নমানের অশ্রু, অস্বস্তি, লালভাব এবং দৃষ্টি ঝাপসা করে।)', 2),
(22, '2024-01-03 14:19:40.353551', NULL, NULL, 'Ear Infection (Otitis Externa) (কানের সংক্রমণ (ওটিটিস এক্সটার্না))', ' Infection of the outer ear canal, often caused by bacteria or fungi, leading to pain, itching, and sometimes hearing loss.(বাইরের কানের খালের সংক্রমণ, প্রায়শই ব্যাকটেরিয়া বা ছত্রাক দ্বারা সৃষ্ট, যার ফলে ব্যথা, চুলকানি এবং কখনও কখনও শ্রবণশক্তি হ্রাস পায়।)', 3),
(23, '2024-01-03 14:19:40.360533', NULL, NULL, 'Tinnitus (টিনিটাস)', 'Perception of noise or ringing in the ears without an external sound source, often associated with hearing loss or exposure to loud noise.(বাহ্যিক শব্দের উত্স ছাড়াই কানে আওয়াজ বা বাজানোর উপলব্ধি, প্রায়শই শ্রবণশক্তি হ্রাস বা উচ্চ শব্দের সংস্পর্শে আসার সাথে যুক্ত।)', 3),
(24, '2024-01-03 14:19:40.365520', NULL, NULL, ' Otitis Media (ওটিটিস মিডিয়া)', 'Inflammation of the middle ear, commonly seen in children, causing ear pain and sometimes hearing loss.(মধ্য কানের প্রদাহ, সাধারণত শিশুদের মধ্যে দেখা যায়, যার ফলে কানে ব্যথা হয় এবং কখনও কখনও শ্রবণশক্তি হ্রাস পায়।)', 3),
(25, '2024-01-03 14:19:40.389455', NULL, NULL, 'Meniere\'s Disease (মেনিয়ারের রোগ)', 'Inner ear disorder characterized by episodes of vertigo, hearing loss, tinnitus, and a feeling of fullness or pressure in the ear.(অভ্যন্তরীণ কানের ব্যাধি যা ভার্টিগো, শ্রবণশক্তি হ্রাস, টিনিটাস এবং কানে পূর্ণতা বা চাপের অনুভূতি দ্বারা চিহ্নিত করা হয়।)', 3),
(26, '2024-01-03 14:19:40.399431', NULL, NULL, ' Presbycusis(প্রেসবিকিউসিস)', 'Gradual hearing loss that occurs as a natural part of the aging process, typically affecting high-frequency sounds.(ধীরে ধীরে শ্রবণশক্তি হ্রাস যা বার্ধক্য প্রক্রিয়ার একটি প্রাকৃতিক অংশ হিসাবে ঘটে, সাধারণত উচ্চ-ফ্রিকোয়েন্সি শব্দগুলিকে প্রভাবিত করে।)', 3),
(27, '2024-01-03 14:19:40.409409', NULL, NULL, ' Acoustic Neuroma(অ্যাকোস্টিক নিউরোমা)', 'Benign tumor on the vestibulocochlear nerve, leading to hearing loss, tinnitus, and imbalance.(ভেস্টিবুলোকোক্লিয়ার নার্ভে সৌম্য টিউমার, যা শ্রবণশক্তি হ্রাস, টিনিটাস এবং ভারসাম্যহীনতার দিকে পরিচালিত করে।)', 3),
(28, '2024-01-03 14:19:40.419376', NULL, NULL, 'Eustachian Tube Dysfunction (ইউস্টাচিয়ান টিউবের কর্মহীনতা)', 'Impaired function of the Eustachian tubes, affecting pressure balance in the middle ear and causing ear discomfort.(ইউস্টাচিয়ান টিউবগুলির প্রতিবন্ধী কার্যকারিতা, মধ্যকর্ণে চাপের ভারসাম্যকে প্রভাবিত করে এবং কানের অস্বস্তি সৃষ্টি করে।)', 3),
(29, '2024-01-03 14:19:40.423365', NULL, NULL, 'Conductive Hearing Loss (পরিবাহী শ্রবণশক্তি হ্রাস)', ' Hearing loss caused by problems with the ear canal, eardrum, or middle ear, often resulting from infections or blockages.(কানের খাল, কানের পর্দা বা মধ্যকর্ণের সমস্যাগুলির কারণে শ্রবণশক্তি হ্রাস, প্রায়শই সংক্রমণ বা ব্লকেজের ফলে।)', 3),
(30, '2024-01-03 14:19:40.430349', NULL, NULL, ' Sensorineural Hearing Loss (সংবেদনশীল শ্রবণশক্তি হ্রাস)', 'Hearing loss due to damage to the inner ear or auditory nerve, commonly caused by aging, noise exposure, or certain medical conditions. (অভ্যন্তরীণ কান বা শ্রবণ স্নায়ুর ক্ষতির কারণে শ্রবণশক্তি হ্রাস, সাধারণত বার্ধক্য, শব্দ এক্সপোজার বা নির্দিষ্ট কিছু চিকিৎসা অবস্থার কারণে হয়।)', 3),
(31, '2024-01-03 14:19:40.438324', NULL, NULL, 'Otosclerosis(অটোস্ক্লেরোসিস)', 'Abnormal bone growth in the middle ear, often causing hearing loss by interfering with the movement of the stapes bone. (মধ্যকর্ণে অস্বাভাবিক হাড়ের বৃদ্ধি, প্রায়ই স্টেপস হাড়ের নড়াচড়ায় হস্তক্ষেপ করে শ্রবণশক্তি হ্রাস করে।)', 3),
(32, '2024-01-03 14:28:34.454141', NULL, NULL, 'Sinusitis (সাইনোসাইটিস)', ' Inflammation of the sinuses, often caused by infection, leading to nasal congestion, facial pain, and difficulty breathing. (সাইনাসের প্রদাহ, প্রায়শই সংক্রমণের কারণে হয়, যার ফলে নাক বন্ধ হয়ে যায়, মুখের ব্যথা হয় এবং শ্বাস নিতে অসুবিধা হয়।)', 4),
(33, '2024-01-03 14:28:34.459128', NULL, NULL, 'Allergic Rhinitis(অ্যালার্জিক রাইনাইটিস)', 'Inflammation of the nasal passages due to an allergic reaction, causing symptoms such as sneezing, runny nose, and itching. (অ্যালার্জির প্রতিক্রিয়ার কারণে অনুনাসিক প্যাসেজের প্রদাহ, যার ফলে হাঁচি, নাক দিয়ে পানি পড়া এবং চুলকানির মতো লক্ষণ দেখা দেয়।)', 4),
(34, '2024-01-03 14:28:34.464124', NULL, NULL, 'Deviated Septum(শ্বাস নিতে অসুবিধা, নাক বন্ধ)', 'Displacement of the nasal septum, the wall between the nostrils, which can cause difficulty breathing, nasal congestion, and recurrent sinus infections. (নাকের সেপ্টামের স্থানচ্যুতি, নাকের মধ্যবর্তী প্রাচীর, যা শ্বাস নিতে অসুবিধা, নাক বন্ধ এবং বারবার সাইনাস সংক্রমণের কারণ হতে পারে।)', 4),
(35, '2024-01-03 14:28:34.470100', NULL, NULL, 'Nasal Polyps(অনুনাসিক পলিপ)', 'Noncancerous growths that develop in the lining of the nasal passages, often causing congestion, loss of smell, and facial pressure. (অ-ক্যান্সারস বৃদ্ধি যা অনুনাসিক প্যাসেজের আস্তরণে বিকশিত হয়, প্রায়শই ভিড়, গন্ধ হ্রাস এবং মুখের চাপ সৃষ্টি করে।)', 4),
(36, '2024-01-03 14:28:34.480072', NULL, NULL, 'Rhinoplasty Complications (রাইনোপ্লাস্টি জটিলতা)', ' Issues arising after a nasal surgery (rhinoplasty), which may include infection, scarring, or dissatisfaction with the cosmetic outcome. (একটি অনুনাসিক অস্ত্রোপচারের (রাইনোপ্লাস্টি) পরে উদ্ভূত সমস্যা, যার মধ্যে সংক্রমণ, দাগ বা প্রসাধনী ফলাফলের সাথে অসন্তুষ্টি অন্তর্ভুক্ত থাকতে পারে।)', 4),
(37, '2024-01-03 14:28:34.486056', NULL, NULL, 'Epistaxis (Nosebleed)  (এপিস্ট্যাক্সিস (নাক দিয়ে রক্ত পড়া))', 'Bleeding from the nose, which can be caused by dry air, nasal injuries, or underlying health conditions. (নাক থেকে রক্তপাত, যা শুষ্ক বাতাস, নাকের আঘাত, বা অন্তর্নিহিত স্বাস্থ্যের অবস্থার কারণে হতে পারে।)', 4),
(38, '2024-01-03 14:28:34.512987', NULL, NULL, ' Nasal Fracture (নাকের ফাটল)', ' Break or crack in the bones of the nose, often resulting from trauma, causing pain, swelling, and difficulty breathing through the nose. (নাকের হাড় ভেঙ্গে যাওয়া বা ফাটল, প্রায়শই আঘাতের ফলে ব্যথা, ফুলে যাওয়া এবং নাক দিয়ে শ্বাস নিতে অসুবিধা হয়।)', 4),
(39, '2024-01-03 14:28:34.523956', NULL, NULL, ' Rhinitis Medicamentosa (ঔষধি রাইনাইটিস)', 'Nasal congestion and irritation caused by the overuse of nasal decongestant sprays or other medications. (অনুনাসিক ডিকনজেস্ট্যান্ট স্প্রে বা অন্যান্য ওষুধের অত্যধিক ব্যবহারের কারণে নাক বন্ধ এবং জ্বালা।)', 4),
(40, '2024-01-03 14:28:34.532931', NULL, NULL, 'Nasal Vestibulitis (নাকের ভেস্টিবুলাইটিস)', 'Inflammation of the nasal vestibule, the area just inside the nostrils, often accompanied by redness, swelling, and pain. (সমস্যার স্পেসিফিকেশন: অনুনাসিক ভেস্টিবুলের প্রদাহ, নাকের ছিদ্রের ঠিক ভিতরের অংশে প্রায়ই লালভাব, ফোলাভাব এবং ব্যথা হয়।)', 4),
(41, '2024-01-03 14:28:34.546895', NULL, NULL, 'Foreign Body in Nose  (নাকে বিদেশী শরীর)', ' Presence of an object or substance lodged in the nasal passages, causing discomfort, difficulty breathing, and sometimes infection. (অনুনাসিক প্যাসেজে কোনও বস্তু বা পদার্থের উপস্থিতি, অস্বস্তি, শ্বাস নিতে অসুবিধা এবং কখনও কখনও সংক্রমণের কারণ।)', 4),
(42, '2024-01-03 14:38:27.859647', NULL, NULL, 'Tooth Decay (Dental Caries) (দাঁতের ক্ষয় (ডেন্টাল ক্যারিস))', 'Destruction of the tooth enamel by acid-producing bacteria, leading to cavities, toothache, and potential infection. (অ্যাসিড-উৎপাদনকারী ব্যাকটেরিয়া দ্বারা দাঁতের এনামেল ধ্বংস করা, যা গহ্বর, দাঁতে ব্যথা এবং সম্ভাব্য সংক্রমণের দিকে পরিচালিত করে।)', 5),
(43, '2024-01-03 14:38:27.871616', NULL, NULL, 'Gingivitis (জিঞ্জিভাইটিস)', ' Inflammation of the gums, often caused by plaque buildup, resulting in redness, swelling, and bleeding during brushing. (মাড়ির প্রদাহ, প্রায়শই প্লাক তৈরির কারণে হয়, যার ফলে ব্রাশ করার সময় লালচেভাব, ফোলাভাব এবং রক্তপাত হয়।)', 5),
(44, '2024-01-03 14:38:27.897544', NULL, NULL, 'Periodontitis (পিরিওডোনটাইটিস)', 'Advanced stage of gum disease, involving inflammation and infection that can damage the gums and underlying bone, leading to tooth loss. (মাড়ির রোগের উন্নত পর্যায়ে, প্রদাহ এবং সংক্রমণ জড়িত যা মাড়ি এবং অন্তর্নিহিত হাড়ের ক্ষতি করতে পারে, যার ফলে দাঁতের ক্ষতি হতে পারে।)', 5),
(45, '2024-01-03 14:38:27.903531', NULL, NULL, 'Halitosis (Bad Breath). (হ্যালিটোসিস (নিঃশ্বাসের দুর্গন্ধ)।)', 'Persistent unpleasant odor from the mouth, often caused by bacteria on the tongue, gum disease, or other oral health issues. (মুখ থেকে ক্রমাগত অপ্রীতিকর গন্ধ, প্রায়ই জিহ্বায় ব্যাকটেরিয়া, মাড়ির রোগ বা অন্যান্য মৌখিক স্বাস্থ্য সমস্যাগুলির কারণে)', 5),
(46, '2024-01-03 14:38:27.908514', NULL, NULL, 'Oral Thrush (Candidiasis) (ওরাল থ্রাশ (ক্যান্ডিডিয়াসিস))', 'Fungal infection in the mouth, commonly caused by Candida yeast, resulting in white lesions on the tongue, inner cheeks, and throat. (মুখের মধ্যে ছত্রাকের সংক্রমণ, সাধারণত ক্যান্ডিডা ইস্ট দ্বারা সৃষ্ট, যার ফলে জিহ্বা, ভিতরের গাল এবং গলায় সাদা ক্ষত দেখা দেয়।)', 5),
(47, '2024-01-03 14:38:27.912504', NULL, NULL, 'Canker Sores (ক্যানকার ঘা)', 'Painful, shallow sores that can develop on the inside of the mouth, lips, or tongue, with the exact cause often unclear. (বেদনাদায়ক, অগভীর ঘা যা মুখ, ঠোঁট বা জিহ্বার ভিতরে বিকশিত হতে পারে, যার সঠিক কারণ প্রায়শই অস্পষ্ট থাকে।)', 5),
(48, '2024-01-03 14:38:27.918487', NULL, NULL, 'Temporomandibular Joint (TMJ) Disorder (টেম্পোরোম্যান্ডিবুলার জয়েন্ট (টিএমজে) ডিসঅর্ডার)', 'Dysfunction of the jaw joint and surrounding muscles, causing pain, clicking sounds, and difficulty with jaw movement. (চোয়ালের জয়েন্ট এবং আশেপাশের পেশীগুলির কর্মহীনতা, ব্যথা, ক্লিক শব্দ এবং চোয়াল চলাচলে অসুবিধা সৃষ্টি করে।)', 5),
(49, '2024-01-03 14:38:27.922476', NULL, NULL, 'Oral Cancer (মুখের ক্যান্সার)', 'Cancerous growth in the mouth, including the lips, tongue, cheeks, and throat, with symptoms like persistent sores, difficulty swallowing, and changes in voice. (ঠোঁট, জিহ্বা, গাল এবং গলা সহ মুখের মধ্যে ক্যান্সারের বৃদ্ধি, অবিরাম ঘা, গিলতে অসুবিধা এবং কণ্ঠস্বর পরিবর্তনের মতো লক্ষণ সহ।)', 5),
(50, '2024-01-03 14:38:27.927463', NULL, NULL, 'Bruxism (Teeth Grinding) (ব্রুক্সিজম (দাঁত পিষে))', 'Involuntary grinding or clenching of the teeth, often during sleep, leading to tooth wear, jaw pain, and headaches. (অনিচ্ছাকৃতভাবে দাঁত পিষে যাওয়া বা ক্লেঞ্চ করা, প্রায়শই ঘুমের সময়, যার ফলে দাঁত পরা, চোয়ালে ব্যথা এবং মাথাব্যথা হয়।)', 5),
(51, '2024-01-03 14:38:27.932453', NULL, NULL, 'Salivary Gland Disorders (লালা গ্রন্থির ব্যাধি)', 'Conditions affecting the salivary glands, such as infections, stones, or tumors, resulting in dry mouth, pain, and difficulty swallowing.', 5),
(52, '2024-01-03 14:46:55.439527', NULL, NULL, 'Pharyngitis (ফ্যারিঞ্জাইটিস)', 'Inflammation of the pharynx, causing a sore throat, difficulty swallowing, and often accompanied by symptoms like fever and cough. (গলবিল প্রদাহ, গলা ব্যথা, গিলতে অসুবিধা এবং প্রায়ই জ্বর এবং কাশির মতো উপসর্গের সাথে থাকে।)', 6),
(53, '2024-01-03 14:46:55.450499', NULL, NULL, 'Laryngitis (ল্যারিঞ্জাইটিস)', 'Inflammation of the larynx, leading to hoarseness, voice changes, and sometimes discomfort or pain while speaking. (স্বরযন্ত্রের প্রদাহ, কর্কশতা, কণ্ঠস্বর পরিবর্তন এবং কথা বলার সময় কখনও কখনও অস্বস্তি বা ব্যথার দিকে পরিচালিত করে।)', 6),
(54, '2024-01-03 14:46:55.456482', NULL, NULL, 'Tonsillitis (টনসিলাইটিস)', 'Inflammation of the tonsils, often due to viral or bacterial infections, resulting in throat pain, difficulty swallowing, and swollen lymph nodes. (টনসিলের প্রদাহ, প্রায়শই ভাইরাল বা ব্যাকটেরিয়া সংক্রমণের কারণে, যার ফলে গলা ব্যথা, গিলতে অসুবিধা এবং লিম্ফ নোডগুলি ফুলে যায়।)', 6),
(55, '2024-01-03 14:46:55.464459', NULL, NULL, ' Laryngopharyngeal Reflux (LPR) (ল্যারিঙ্গোফ্যারিঞ্জিয়াল রিফ্লাক্স (এলপিআর))', 'Backflow of stomach acid into the larynx and pharynx, causing irritation, throat clearing, and a sensation of a lump in the throat. (স্বরযন্ত্র এবং ফ্যারিনেক্সে পাকস্থলীর অ্যাসিডের পশ্চাদপ্রবাহ, যার ফলে জ্বালা, গলা পরিষ্কার হয় এবং গলায় পিণ্ডের অনুভূতি হয়।)', 6),
(56, '2024-01-03 14:46:55.469448', NULL, NULL, 'Strep Throat (স্ট্রেপ গলা)', 'Bacterial infection of the throat caused by Streptococcus bacteria, leading to severe sore throat, fever, and sometimes headache and rash. (স্ট্রেপ্টোকক্কাস ব্যাকটেরিয়া দ্বারা সৃষ্ট গলার ব্যাকটেরিয়া সংক্রমণ, যার ফলে গুরুতর গলা ব্যথা, জ্বর এবং কখনও কখনও মাথাব্যথা এবং ফুসকুড়ি হয়।)', 6),
(57, '2024-01-03 14:50:33.319638', NULL, NULL, 'Epiglottitis (এপিগ্লোটাইটিস)', 'Inflammation of the epiglottis, a flap-like structure in the throat that prevents food from entering the windpipe, leading to difficulty breathing, sore throat, and fever. (এপিগ্লোটিসের প্রদাহ, গলার মধ্যে একটি ফ্ল্যাপের মতো গঠন যা বায়ুনালীতে খাবার প্রবেশ করতে বাধা দেয়, যার ফলে শ্বাস নিতে অসুবিধা, গলা ব্যথা এবং জ্বর হয়।)', 6),
(58, '2024-01-03 14:50:33.325620', NULL, NULL, 'Vocal Cord Nodules (ভোকাল কর্ড নোডুলস)', 'Noncancerous growths on the vocal cords, often caused by vocal strain, resulting in hoarseness, a breathy voice, and difficulty with pitch and volume. (ভোকাল কর্ডে অ-ক্যান্সারস বৃদ্ধি, প্রায়শই কণ্ঠের স্ট্রেন দ্বারা সৃষ্ট হয়, যার ফলে কর্কশতা, একটি শ্বাসকষ্ট স্বর এবং পিচ এবং ভলিউম নিয়ে অসুবিধা হয়।)', 6),
(59, '2024-01-03 14:50:33.332604', NULL, NULL, 'Throat Cancer (গলার ক্যান্সার)', 'Cancerous growth in the throat, including the pharynx, larynx, and tonsils, with symptoms such as persistent cough, difficulty swallowing, and voice changes. (ক্রমাগত কাশি, গিলতে অসুবিধা এবং কণ্ঠস্বর পরিবর্তনের মতো উপসর্গ সহ গলবিল, স্বরযন্ত্র এবং টনসিল সহ গলায় ক্যান্সারের বৃদ্ধি।)', 6),
(60, '2024-01-03 14:50:33.348560', NULL, NULL, 'Throat Abscess (গলা ফোড়া)', 'Collection of pus in the throat, usually as a result of a bacterial infection, causing severe throat pain, difficulty swallowing, and sometimes drooling. (গলায় পুঁজ জমা হয়, সাধারণত ব্যাকটেরিয়া সংক্রমণের ফলে গলায় প্রচণ্ড ব্যথা হয়, গিলতে অসুবিধা হয় এবং কখনও কখনও ঢোলা হয়।)', 6),
(61, '2024-01-03 14:50:33.356539', NULL, NULL, 'Globus Pharyngeus (গ্লোবাস ফ্যারিঞ্জিয়াস)', 'Sensation of a lump or foreign object in the throat without any physical cause, often associated with anxiety or gastroesophageal reflux. (কোন শারীরিক কারণ ছাড়াই গলায় পিণ্ড বা বিদেশী বস্তুর সংবেদন, প্রায়ই উদ্বেগ বা গ্যাস্ট্রোইসোফেজিয়াল রিফ্লাক্সের সাথে যুক্ত।)', 6),
(62, '2024-01-03 14:55:20.083326', NULL, NULL, 'Coronary Artery Disease (CAD) (করোনারি আর্টারি ডিজিজ (CAD))', ' Buildup of plaque in the coronary arteries, leading to reduced blood flow to the heart muscle and increasing the risk of angina or heart attack. (করোনারি ধমনীতে ফলক তৈরি হয়, যার ফলে হৃদপিন্ডের পেশীতে রক্ত চলাচল কমে যায় এবং এনজিনা বা হার্ট অ্যাটাকের ঝুঁকি বেড়ে যায়।)', 7),
(63, '2024-01-03 14:55:20.088312', NULL, NULL, 'Myocardial Infarction (Heart Attack) (মায়োকার্ডিয়াল ইনফার্কশন (হার্ট অ্যাটাক))', 'Blockage of blood flow to a part of the heart muscle, resulting in damage or death of the heart tissue, often causing chest pain, shortness of breath, and fatigue. (হৃৎপিণ্ডের পেশীর একটি অংশে রক্ত প্রবাহে বাধা, যার ফলে হৃদপিণ্ডের টিস্যুর ক্ষতি বা মৃত্যু হয়, প্রায়ই বুকে ব্যথা, শ্বাসকষ্ট এবং ক্লান্তি দেখা দেয়।)\r\n', 7),
(64, '2024-01-03 14:55:20.093299', NULL, NULL, 'Arrhythmia (অ্যারিথমিয়া)', 'Irregular heart rhythm, which may cause the heart to beat too fast (tachycardia), too slow (bradycardia), or with an irregular pattern, potentially leading to palpitations or fainting. (অনিয়মিত হৃৎপিণ্ডের ছন্দ, যার কারণে হৃৎপিণ্ড খুব দ্রুত স্পন্দিত হতে পারে (টাকাইকার্ডিয়া), খুব ধীরগতি (ব্র্যাডিকার্ডিয়া), বা অনিয়মিত প্যাটার্ন সহ, সম্ভাব্যভাবে ধড়ফড় বা অজ্ঞান হয়ে যেতে পারে।)', 7),
(65, '2024-01-03 14:55:20.098286', NULL, NULL, 'Heart Failure (হার্ট ফেইলিউর)', 'Gradual weakening of the heart\'s pumping ability, causing symptoms such as shortness of breath, fatigue, and fluid retention. (হৃৎপিণ্ডের পাম্পিং ক্ষমতা ধীরে ধীরে দুর্বল হয়ে যাওয়া, যার ফলে শ্বাসকষ্ট, ক্লান্তি এবং তরল ধারণের মতো উপসর্গ দেখা দেয়।)', 7),
(66, '2024-01-03 14:55:20.110255', NULL, NULL, 'Valvular Heart Disease (হৃদরোগ)', 'Malfunction or damage to one or more of the heart valves, affecting blood flow and potentially leading to symptoms like chest pain, fatigue, or heart palpitations. (এক বা একাধিক হার্টের ভালভের ত্রুটি বা ক্ষতি, রক্ত ​​প্রবাহকে প্রভাবিত করে এবং সম্ভাব্যভাবে বুকে ব্যথা, ক্লান্তি বা হৃদস্পন্দনের মতো লক্ষণগুলির দিকে পরিচালিত করে।)', 7),
(67, '2024-01-03 15:00:24.672956', NULL, NULL, 'Atrial Fibrillation (AFib) (অ্যাট্রিয়াল ফাইব্রিলেশন))', 'Irregular and often rapid heartbeat originating in the atria, increasing the risk of stroke and other heart-related complications. (অনিয়মিত এবং প্রায়শই দ্রুত হৃদস্পন্দন অ্যাট্রিয়া থেকে উদ্ভূত হয়, যা স্ট্রোক এবং অন্যান্য হার্ট সংক্রান্ত জটিলতার ঝুঁকি বাড়ায়।)', 7),
(68, '2024-01-03 15:00:24.683447', NULL, NULL, 'Hypertension (High Blood Pressure) (উচ্চ রক্তচাপ (উচ্চ রক্তচাপ))', 'Persistent elevation of blood pressure, which can strain the heart and blood vessels, potentially leading to heart attack, stroke, or other cardiovascular issues. (রক্তচাপের ক্রমাগত উচ্চতা, যা হার্ট এবং রক্তনালীগুলিকে স্ট্রেন করতে পারে, সম্ভাব্য হার্ট অ্যাটাক, স্ট্রোক বা অন্যান্য কার্ডিওভাসকুলার সমস্যা হতে পারে।)', 7),
(69, '2024-01-03 15:00:24.688428', NULL, NULL, 'Cardiomyopathy (কার্ডিওমায়োপ্যাথি)', 'Disease of the heart muscle, affecting its structure and function, and potentially causing symptoms like fatigue, swelling, and shortness of breath. (হৃৎপিণ্ডের পেশীর রোগ, এর গঠন এবং কার্যকারিতাকে প্রভাবিত করে এবং সম্ভাব্যভাবে ক্লান্তি, ফোলাভাব এবং শ্বাসকষ্টের মতো উপসর্গ সৃষ্টি করে।)', 7),
(70, '2024-01-03 15:00:24.692418', NULL, NULL, 'Angina Pectoris (প্রশাসনিক উপস্থাপনা)', 'Chest pain or discomfort caused by reduced blood flow to the heart muscle, often triggered by physical exertion or stress. (বুকের ব্যথা বা অস্বস্তি হৃৎপিণ্ডের পেশীতে রক্ত ​​প্রবাহ কমে যাওয়ার কারণে, প্রায়শই শারীরিক পরিশ্রম বা চাপের কারণে শুরু হয়।)', 7),
(71, '2024-01-03 15:00:24.698402', NULL, NULL, 'Endocarditis (এন্ডোকার্ডাইটিস)', 'Inflammation of the inner lining of the heart chambers and valves, typically caused by a bacterial infection, leading to symptoms like fever, fatigue, and heart murmurs. (হৃদপিন্ডের চেম্বার এবং ভালভের অভ্যন্তরীণ আস্তরণের প্রদাহ, সাধারণত ব্যাকটেরিয়া সংক্রমণের কারণে হয়, যার ফলে জ্বর, ক্লান্তি এবং হার্টের বকবক হওয়ার মতো উপসর্গ দেখা দেয়।)', 7),
(72, '2024-01-03 15:08:44.734960', NULL, NULL, 'Lung Cancer (ফুসফুসের ক্যান্সার)', 'Uncontrolled growth of abnormal cells in the lungs, often presenting with symptoms like persistent cough, chest pain, and weight loss. (ফুসফুসে অস্বাভাবিক কোষের অনিয়ন্ত্রিত বৃদ্ধি, প্রায়ই ক্রমাগত কাশি, বুকে ব্যথা এবং ওজন হ্রাসের মতো উপসর্গ দেখা দেয়।)', 8),
(73, '2024-01-03 15:08:44.739946', NULL, NULL, 'Pulmonary Embolism (পালমোনারি )', 'Blockage of one or more pulmonary arteries by blood clots, causing sudden onset of shortness of breath, chest pain, and, in severe cases, heart failure. (রক্ত জমাট বেঁধে এক বা একাধিক পালমোনারি ধমনীতে বাধা, হঠাৎ করে শ্বাসকষ্ট, বুকে ব্যথা এবং গুরুতর ক্ষেত্রে হার্ট ফেইলিউর।)', 8),
(74, '2024-01-03 15:08:44.744932', NULL, NULL, 'Pneumonia (নিউমোনিয়া)', 'Infection that causes inflammation of the air sacs in one or both lungs, leading to symptoms such as fever, cough with phlegm, and difficulty breathing. (সংক্রমণ যা এক বা উভয় ফুসফুসে বাতাসের থলিতে প্রদাহ সৃষ্টি করে, যার ফলে জ্বর, কফের সাথে কাশি এবং শ্বাসকষ্টের মতো উপসর্গ দেখা দেয়।)', 8),
(75, '2024-01-03 15:08:44.750919', NULL, NULL, 'Asthma (হাঁপানি)', 'Chronic inflammation of the airways, leading to recurrent episodes of wheezing, shortness of breath, chest tightness, and coughing. (শ্বাসনালীতে দীর্ঘস্থায়ী প্রদাহ, যার ফলে বারবার শ্বাসকষ্ট, শ্বাসকষ্ট, বুকে আঁটসাঁটতা এবং কাশি হয়।)', 8),
(76, '2024-01-03 15:08:44.756901', NULL, NULL, 'Chronic Obstructive Pulmonary Disease (COPD) (ক্রনিক অবস্ট্রাকটিভ পালমোনারি ডিজিজ (সিওপিডি))', ' A group of progressive lung diseases, including chronic bronchitis and emphysema, characterized by airflow obstruction and difficulty breathing. (দীর্ঘস্থায়ী ব্রঙ্কাইটিস এবং এমফিসেমা সহ প্রগতিশীল ফুসফুসের রোগের একটি গ্রুপ, যা বায়ুপ্রবাহে বাধা এবং শ্বাস নিতে অসুবিধা দ্বারা চিহ্নিত করা হয়।)', 8),
(77, '2024-01-03 15:08:44.787818', NULL, NULL, 'Tuberculosis (TB) (যক্ষ্মা (টিবি))', 'Bacterial infection, usually affecting the lungs, causing symptoms like persistent cough, weight loss, and night sweats. (ব্যাকটেরিয়া সংক্রমণ, সাধারণত ফুসফুসকে প্রভাবিত করে, ক্রমাগত কাশি, ওজন হ্রাস এবং রাতের ঘামের মতো উপসর্গ সৃষ্টি করে।)', 8),
(78, '2024-01-03 15:08:44.802777', NULL, NULL, 'Pulmonary Fibrosis (পালমোনারি ফাইব্রোসিস)', 'Scarring of lung tissue, leading to progressive stiffness and reduced lung function, resulting in difficulty breathing. (ফুসফুসের টিস্যুতে দাগ পড়ে, যা প্রগতিশীল শক্ত হয়ে যায় এবং ফুসফুসের কার্যকারিতা হ্রাস পায়, যার ফলে শ্বাস নিতে অসুবিধা হয়।)', 8),
(79, '2024-01-03 15:08:44.807764', NULL, NULL, 'Bronchitis (ব্রংকাইটিস)', 'Inflammation of the bronchial tubes, often due to viral or bacterial infections, resulting in coughing, chest discomfort, and mucus production. (ব্রঙ্কিয়াল টিউবের প্রদাহ, প্রায়ই ভাইরাল বা ব্যাকটেরিয়া সংক্রমণের কারণে, যার ফলে কাশি, বুকে অস্বস্তি এবং শ্লেষ্মা তৈরি হয়।)', 8),
(80, '2024-01-03 15:08:44.812981', NULL, NULL, 'Pleurisy (প্লুরিসি)', 'Inflammation of the lining surrounding the lungs (pleura), causing chest pain that worsens during breathing. (ফুসফুসের (প্লুরা) আশেপাশের আস্তরণের প্রদাহ, যার ফলে বুকে ব্যথা হয় যা শ্বাস-প্রশ্বাসের সময় খারাপ হয়।)', 8),
(81, '2024-01-03 15:08:44.818964', NULL, NULL, 'Cystic Fibrosis (সিস্টিক ফাইব্রোসিস)', 'Inherited genetic disorder affecting the lungs and digestive system, leading to thick and sticky mucus production, respiratory infections, and digestive problems. (উত্তরাধিকারসূত্রে প্রাপ্ত জেনেটিক ব্যাধি ফুসফুস এবং পাচনতন্ত্রকে প্রভাবিত করে, যার ফলে ঘন এবং আঠালো শ্লেষ্মা উত্পাদন, শ্বাসযন্ত্রের সংক্রমণ এবং হজমের সমস্যা হয়।)', 8),
(82, '2024-01-04 05:21:47.097683', NULL, NULL, 'Rotator Cuff Tear (রোটেটর কাফ টিয়ার)', 'Partial or complete tear of the tendons in the rotator cuff, leading to pain, weakness, and limited range of motion in the shoulder. (রোটেটর কফের টেন্ডনগুলির আংশিক বা সম্পূর্ণ ছিঁড়ে যাওয়া, যার ফলে ব্যথা, দুর্বলতা এবং কাঁধে গতির সীমিত পরিসর হয়।)', 9),
(83, '2024-01-04 05:21:47.105661', NULL, NULL, 'Frozen Shoulder (Adhesive Capsulitis) (হিমায়িত কাঁধ (আঠালো ক্যাপসুলাইটিস))', 'Inflammation and thickening of the shoulder capsule, causing pain and stiffness, limiting the ability to move the shoulder. (কাঁধের ক্যাপসুলের প্রদাহ এবং ঘন হওয়া, ব্যথা এবং শক্ত হয়ে যাওয়া, কাঁধের নড়াচড়া করার ক্ষমতা সীমিত করে।)', 9),
(84, '2024-01-04 05:21:47.110648', NULL, NULL, 'Shoulder Impingement Syndrome (শোল্ডার ইম্পিংমেন্ট সিনড্রোম)', 'Compression of the tendons and bursa in the shoulder, resulting in pain, especially during overhead movements. (কাঁধে টেন্ডন এবং বার্সার সংকোচন, যার ফলে ব্যথা হয়, বিশেষ করে ওভারহেড নড়াচড়ার সময়।)', 9),
(85, '2024-01-04 05:21:47.116632', NULL, NULL, 'Shoulder Dislocation (কাঁধের স্থানচ্যুতি)', 'Displacement of the shoulder joint, often caused by trauma, resulting in intense pain and instability. (কাঁধের জয়েন্টের স্থানচ্যুতি, প্রায়ই ট্রমা দ্বারা সৃষ্ট, যার ফলে তীব্র ব্যথা এবং অস্থিরতা হয়।)', 9),
(86, '2024-01-04 05:21:47.121619', NULL, NULL, 'Bursitis (বারসাইটিস)', 'Inflammation of the bursa sac in the shoulder, leading to pain, swelling, and limited mobility. (কাঁধে বারসা থলির প্রদাহ, যার ফলে ব্যথা, ফোলাভাব এবং সীমিত গতিশীলতা দেখা দেয়।)', 9),
(87, '2024-01-04 05:21:47.136583', NULL, NULL, 'Tendinitis (Biceps Tendinitis) (টেন্ডিনাইটিস (বাইসেপস টেন্ডিনাইটিস))', ' Inflammation of the biceps tendon, causing pain in the front part of the shoulder, especially during specific movements. (বাইসেপ টেন্ডনের প্রদাহ, কাঁধের সামনের অংশে ব্যথা সৃষ্টি করে, বিশেষ করে নির্দিষ্ট নড়াচড়ার সময়।)', 9),
(88, '2024-01-04 05:21:47.141578', NULL, NULL, 'Labral Tear (ল্যাব্রাল টিয়ার)', 'Tear in the cartilage (labrum) that surrounds the shoulder socket, causing pain, instability, and a catching sensation. (কাঁধের সকেটের চারপাশে থাকা তরুণাস্থি (ল্যাব্রাম) ছিঁড়ে যায়, যার ফলে ব্যথা, অস্থিরতা এবং একটি আকর্ষক সংবেদন ঘটে।)', 9),
(89, '2024-01-04 05:21:47.146552', NULL, NULL, 'Acromioclavicular (AC) Joint Separation (অ্যাক্রোমিওক্ল্যাভিকুলার (AC) জয়েন্ট সেপারেশন)', 'Dislocation of the AC joint, often due to trauma, resulting in pain and a visible bump at the top of the shoulder. (এসি জয়েন্টের স্থানচ্যুতি, প্রায়শই আঘাতের কারণে, যার ফলে ব্যথা এবং কাঁধের শীর্ষে একটি দৃশ্যমান আচমকা দেখা দেয়।)', 9),
(90, '2024-01-04 05:21:47.150542', NULL, NULL, 'Fractured Humerus (ফ্র্যাকচারড হিউমারাস)', 'Break in the upper arm bone (humerus), leading to pain, swelling, and difficulty moving the arm. (উপরের বাহুর হাড় (হিউমারাস) ভেঙ্গে যায়, যার ফলে ব্যথা, ফোলাভাব এবং হাত নাড়াতে অসুবিধা হয়।)', 9),
(91, '2024-01-04 05:21:47.156527', NULL, NULL, 'Shoulder Arthritis (কাঁধের আর্থ্রাইটিস)', 'Degeneration of the shoulder joint, causing pain, stiffness, and reduced range of motion, often associated with aging or joint conditions. (কাঁধের জয়েন্টের অবক্ষয়, ব্যথা, দৃঢ়তা এবং গতির সীমা হ্রাস করে, যা প্রায়শই বার্ধক্য বা জয়েন্টের অবস্থার সাথে যুক্ত।)', 9),
(92, '2024-01-04 05:28:58.518938', NULL, NULL, 'Biceps Tendon Rupture (বাইসেপ টেন্ডন ফাটল)', 'Tear or rupture of the biceps tendon, causing pain, weakness, and a bulging deformity in the upper arm. (বাইসেপ টেন্ডন ছিঁড়ে যাওয়া বা ফেটে যাওয়া, যার ফলে ব্যথা, দুর্বলতা এবং উপরের বাহুতে বিকৃতি দেখা দেয়।)', 10),
(93, '2024-01-04 05:28:58.524921', NULL, NULL, 'Brachial Plexus Injury (ব্র্যাচিয়াল প্লেক্সাস ইনজুরি)', 'Damage to the network of nerves controlling the muscles of the upper arm, leading to weakness, numbness, or paralysis. (উপরের বাহুর পেশী নিয়ন্ত্রণকারী স্নায়ুর নেটওয়ার্কের ক্ষতি, যা দুর্বলতা, অসাড়তা বা পক্ষাঘাতের দিকে পরিচালিত করে।)', 10),
(94, '2024-01-04 05:28:58.533897', NULL, NULL, 'Tennis Elbow (Lateral Epicondylitis) (টেনিস এলবো (পার্শ্বীয় এপিকন্ডাইলাইটিস))', 'Inflammation of the tendons on the outer part of the elbow, causing pain and tenderness, often associated with repetitive arm movements. (কনুইয়ের বাইরের অংশে টেন্ডনের প্রদাহ, ব্যথা এবং কোমলতা সৃষ্টি করে, যা প্রায়ই বারবার হাতের নড়াচড়ার সাথে যুক্ত।)', 10),
(95, '2024-01-04 05:28:58.538884', NULL, NULL, 'Golfer\'s Elbow (Medial Epicondylitis) (গলফারের কনুই (মেডিয়াল এপিকন্ডাইলাইটিস))', 'Inflammation of the tendons on the inner part of the elbow, resulting in pain, stiffness, and weakness, commonly seen in golfers and those with repetitive gripping motions. (কনুইয়ের ভিতরের অংশে টেন্ডনগুলির প্রদাহ, যার ফলে ব্যথা, শক্ত হয়ে যাওয়া এবং দুর্বলতা দেখা যায়, সাধারণত গল্ফারদের এবং বারবার গ্রিপিং গতির সাথে দেখা যায়।)', 10),
(96, '2024-01-04 05:28:58.543870', NULL, NULL, 'Triceps Tendonitis (ট্রাইসেপস টেন্ডোনাইটিস)', 'Inflammation of the triceps tendon, leading to pain, swelling, and difficulty extending the forearm. (ট্রাইসেপস টেন্ডনের প্রদাহ, যার ফলে ব্যথা, ফুলে যাওয়া এবং বাহু প্রসারিত করতে অসুবিধা হয়।)', 10),
(97, '2024-01-04 05:28:58.549861', NULL, NULL, 'Myositis (মায়োসাইটিস)', 'Inflammation of the muscles, causing muscle pain, weakness, and swelling in the upper arm. (পেশীর প্রদাহ, পেশীতে ব্যথা, দুর্বলতা এবং উপরের বাহুতে ফুলে যাওয়া।)', 10),
(98, '2024-01-04 05:28:58.569800', NULL, NULL, 'Compartment Syndrome (কম্পার্টমেন্ট সিন্ড্রোম)', 'Increased pressure within the muscles, leading to pain, swelling, and potential nerve damage in the upper arm. (পেশীগুলির মধ্যে চাপ বৃদ্ধি, যার ফলে ব্যথা, ফুলে যাওয়া এবং উপরের বাহুতে সম্ভাব্য স্নায়ুর ক্ষতি হতে পারে।)', 10),
(99, '2024-01-04 05:28:58.574789', NULL, NULL, 'Upper Arm Fracture (উপরের আর্ম ফ্র্যাকচার)', 'Break in the upper arm bone (humerus), causing pain, swelling, and difficulty moving the arm. (উপরের বাহুর হাড় (হিউমারাস) ভেঙ্গে যাওয়া, যার ফলে ব্যথা, ফুলে যাওয়া এবং হাত নাড়াতে অসুবিধা হয়।)', 10),
(100, '2024-01-04 05:28:58.578777', NULL, NULL, 'Muscle Strain (মাংসপেশীর টান)', 'Overstretching or tearing of the muscle fibers, resulting in pain, swelling, and limited range of motion in the upper arm. (পেশীর ফাইবারগুলি অতিরিক্ত প্রসারিত করা বা ছিঁড়ে যাওয়া, যার ফলে ব্যথা, ফোলাভাব এবং উপরের বাহুতে সীমিত পরিসরের গতি।)', 10),
(101, '2024-01-04 05:28:58.583766', NULL, NULL, 'Thoracic Outlet Syndrome (থোরাসিক আউটলেট সিন্ড্রোম)', 'Compression of nerves or blood vessels between the neck and shoulder, causing pain, numbness, and weakness in the upper arm. (ঘাড় এবং কাঁধের মধ্যে স্নায়ু বা রক্তনালীগুলির সংকোচন, যার ফলে উপরের বাহুতে ব্যথা, অসাড়তা এবং দুর্বলতা দেখা দেয়।)', 10),
(102, '2024-01-04 05:37:54.246708', NULL, NULL, 'Forearm Tendonitis (ফরাম টেনডোনাইটিস)', 'Inflammation of the tendons in the forearm, resulting in pain, swelling, and difficulty with gripping or rotating the forearm. (ফরামের টেন্ডনগুলির সুজোন, যা ব্যথা, ফুলবে এবং ফরাম ঘোরানো বা ঘোরানো সহ সুবিধা দিতে অসুবিধা সৃষ্টি করে।)', 11),
(103, '2024-01-04 05:37:54.252684', NULL, NULL, 'Radial Tunnel Syndrome (রেডিয়াল টানেল সিনড্রোম)', 'Compression of the radial nerve in the forearm, leading to pain, tenderness, and weakness in the back of the hand and forearm. (ফরামের রেডিয়াল নার্ভের সংকোচন, হাত এবং ফরামে পিছু দিয়ে ব্যথা, সহানুভূতি এবং দুর্বলতা সৃষ্টি করে।)', 11),
(104, '2024-01-04 05:37:54.257671', NULL, NULL, 'Compartment Syndrome in Forearm (ফরামের কম্পার্টমেন্ট সিনড্রোম)', 'Increased pressure within the compartments of the forearm muscles, causing pain, swelling, and potential nerve or muscle damage. (ফরামের মাংসগুলির কম্পার্টমেন্টের অভ্যন্তরে চাপের বৃদ্ধি, যা ব্যথা, ফুলবে এবং সম্ভাব্যতঃ নার্ভ বা মাংসের ক্ষতি সৃষ্টি করে।)', 11),
(105, '2024-01-04 05:37:54.262658', NULL, NULL, 'Forearm Strain (ফরাম স্ট্রেইন)', 'Overexertion or injury to the muscles of the forearm, resulting in pain, stiffness, and limited range of motion. (ফরামের মাংস বা টেনডনগুলির উত্তীর্ণ বা আঘাত, যা ব্যথা, অস্থিরতা এবং সীমাবদ্ধ চলাচলের সাথে সৃষ্টি করে।)', 11),
(106, '2024-01-04 05:37:54.266647', NULL, NULL, 'Tennis Elbow (Lateral Epicondylitis) (টেনিস এলবো (ল্যাটারাল এপিকনডাইলাইটিস))', 'Inflammation of the tendons on the outer part of the elbow, extending into the forearm, causing pain and discomfort. (কন্ডাইলের বাইরে টেন্ডনগুলির সুজোন, ফুলবে এবং অসুবিধা সৃষ্টি করে।)', 11),
(107, '2024-01-04 05:37:54.272631', NULL, NULL, 'Golfer\'s Elbow (Medial Epicondylitis) (গলফারের কনু (মিডিয়াল এপিকনডাইলাইটিস))', 'Inflammation of the tendons on the inner part of the elbow, extending into the forearm, leading to pain and weakness. (কনুর অভ্যন্তরীণ অংশে টেন্ডনের সুজোন, যা ফরামে প্রসারিত হয় এবং ব্যথা এবং দুর্বলতা সৃষ্টি করতে পারে।)', 11),
(108, '2024-01-04 05:37:54.277618', NULL, NULL, 'Forearm Fracture (ফরাম ভাঙ্গ)', 'Break in the bones of the forearm (radius or ulna), causing pain, swelling, and difficulty moving the wrist and hand. (ফরামের হাড় (রেডিয়াস বা আলনা) ভাঙ্গ, যা ব্যথা, স্থূলতা এবং কাঁধ এবং হাত চলাচলে সীমাবদ্ধতা সৃষ্টি করতে পারে।)', 11),
(109, '2024-01-04 05:37:54.283601', NULL, NULL, 'Pronator Teres Syndrome (প্রোনাটর টিয়ারেস সিনড্রোম)', 'Compression of the median nerve in the forearm, resulting in pain, tingling, and weakness in the forearm and hand. (ফরামের মধ্যে মেডিয়ান নার্ভের সংকোচন, যা ফরাম এবং হাতে ব্যথা, ক্ষারবদ্ধতা এবং দুর্বলতা সৃষ্টি করতে পারে।)', 11),
(110, '2024-01-04 05:37:54.303555', NULL, NULL, 'Repetitive Strain Injury (RSI) - Forearm (নরাবৃত্তি ক্রিয়া আঘাত (RSI) - ফরাম)', 'Overuse injury affecting the muscles and tendons in the forearm due to repetitive motions, causing pain and discomfort. (পুনরাবৃত্তি ক্রিয়ার কারণে ফরামে মাংস এবং টেন্ডনগুলি প্রভাবিত হওয়া, যা ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 11),
(111, '2024-01-04 05:37:54.309532', NULL, NULL, 'Forearm Muscle Spasm (ফরাম মাংস স্প্যাসম)', 'Sudden and involuntary contraction of forearm muscles, leading to pain, tightness, and temporary loss of function. (কটি বার্তা এবং অকৌণী ফরাম মাংসের অস্বাভাবিক সংকোচন, যা ব্যথা, কঠিনতা এবং সাময়িক কার্যক্ষমতা হারাতে পারে।)', 11),
(112, '2024-01-04 05:51:57.779164', NULL, NULL, 'Wrist Joint Strain (কবাব সংযোগ কঠিনতা)', 'Overstretching or tearing of ligaments in the wrist joint, resulting in pain, bruising, and difficulty gripping. (কব্জির জয়েন্টে লিগামেন্টের অত্যধিক স্ট্রেচিং বা ছিঁড়ে যাওয়া, যার ফলে ব্যথা, ক্ষত এবং আঁকড়ে ধরতে অসুবিধা হয়।)', 12),
(113, '2024-01-04 05:51:57.784152', NULL, NULL, 'Wrist Tendinitis (কবাব সংযোগ টেনডাইটিস)', 'Inflammation of the tendons in the wrist, leading to pain, swelling, and reduced hand movement. (কব্জিতে টেন্ডনের প্রদাহ, যার ফলে ব্যথা, ফোলাভাব এবং হাতের নড়াচড়া কমে যায়।)', 12),
(114, '2024-01-04 05:51:57.789137', NULL, NULL, 'Carpal Tunnel Syndrome (কার্পাল টানেল সিনড্রোম)', 'Compression of the median nerve in the wrist, causing numbness, tingling, and weakness in the hand. (কব্জিতে মিডিয়ান নার্ভের সংকোচন, যার ফলে হাতে অসাড়তা, কাঁপুনি এবং দুর্বলতা দেখা দেয়।)', 12),
(115, '2024-01-04 05:51:57.794124', NULL, NULL, 'Wrist Fracture (কবাব ভাঙ্গা)', 'Break in the bones of the wrist, resulting in pain, swelling, and limited wrist mobility. (কব্জির হাড় ভেঙ্গে যায়, যার ফলে ব্যথা, ফোলাভাব এবং কব্জির গতিশীলতা সীমিত হয়।)', 12),
(116, '2024-01-04 05:51:57.799112', NULL, NULL, 'De Quervain\'s Tenosynovitis (ডি কুয়ারভেনস টেনোসাইনোভাইটিস)', 'Inflammation of the tendons on the thumb side of the wrist, causing pain and difficulty moving the thumb. (কব্জির বুড়ো আঙুলের পাশে টেন্ডনের প্রদাহ, যার ফলে ব্যথা হয় এবং বুড়ো আঙুল নাড়াতে অসুবিধা হয়।)', 12),
(117, '2024-01-04 05:51:57.803100', NULL, NULL, 'Ganglion Cyst (গ্যাঙ্গলিয়ন সিস্ট)', 'A non-cancerous lump filled with synovial fluid that develops near the wrist joint, often causing discomfort. (কব্জির জয়েন্টের কাছে বিকশিত সাইনোভিয়াল তরল দ্বারা ভরা একটি ক্যান্সারবিহীন পিণ্ড, প্রায়শই অস্বস্তি সৃষ্টি করে।)', 12),
(118, '2024-01-04 05:51:57.809084', NULL, NULL, 'Wrist Arthritis (কবাব আর্থ্রাইটিস)', 'Inflammation of the wrist joint, resulting in pain, stiffness, and reduced range of motion. (কব্জি জয়েন্টের প্রদাহ, যার ফলে ব্যথা, দৃঢ়তা এবং গতির পরিসীমা কমে যায়।)', 12),
(119, '2024-01-04 05:51:57.814070', NULL, NULL, 'Wrist Ligament Tear (কবাব বন্ধনী ফাট)', ' Rupture or tearing of ligaments in the wrist, leading to instability, pain, and swelling. (কব্জিতে লিগামেন্ট ফেটে যাওয়া বা ছিঁড়ে যাওয়া, যার ফলে অস্থিরতা, ব্যথা এবং ফুলে যাওয়া।)', 12),
(120, '2024-01-04 05:51:57.819058', NULL, NULL, 'Intersection Syndrome (ইন্টারসেকশন সিনড্রোম) ', 'Inflammation of the tendons in the wrist and forearm, often caused by repetitive motion, resulting in pain and swelling. (কব্জি এবং বাহুতে টেন্ডনগুলির প্রদাহ, প্রায়শই পুনরাবৃত্তিমূলক গতির কারণে হয়, যার ফলে ব্যথা এবং ফুলে যায়।)', 12),
(121, '2024-01-04 05:51:57.824045', NULL, NULL, 'Wrist Bursitis (কবাব বারসাইটিস) ', 'Inflammation of the bursae in the wrist joint, causing pain, swelling, and limited wrist movement. (কব্জি জয়েন্টে বার্সার প্রদাহ, ব্যথা, ফোলা এবং সীমিত কব্জি নড়াচড়ার কারণ।)', 12),
(122, '2024-01-04 06:05:08.895859', NULL, NULL, 'Fracture of Hand Bones (হাতের হাড়ের ভাঙ্গা)', 'Break in the bones of the hand, causing pain, swelling, and difficulty in hand movements. (হাতের হাড়ে (হাতের অংশের হাড়) ভাঙ্গার ফলে ব্যথা, স্থূলতা, এবং হাতে চলাচলে সমস্যা হতে পারে।)', 13),
(123, '2024-01-04 06:05:08.911816', NULL, NULL, 'Carpal Tunnel Syndrome (কারপাল টানেল সিনড্রোম)', 'Nerve compression in the carpal tunnel area of the hand, resulting in pain, numbness, and reduced manual dexterity. (হাতের কারপাল টানেল এলাকায় নার্ভ সংকোচনের ফলে হাতে ব্যথা, সোজা, এবং মৌখিক দক্ষতা হতে পারে।)', 13),
(124, '2024-01-04 06:05:08.923785', NULL, NULL, 'Trigger Finger (ট্রিগার ফিঙ্গার)', 'Prolonged constriction during finger flexion, causing difficulty in demonstrating a definite manual dexterity (আঙ্গুলের মৌখিক পদক্ষেপের সময় দীর্ঘকালিক বন্ধন হওয়ার ফলে আঙ্গুলটি একটি নিশ্চিত দক্ষতা দেখাতে সমস্যা হতে পারে।)', 13),
(125, '2024-01-04 06:05:08.933759', NULL, NULL, 'Hand Tendinitis (হাতের টেনডাইটিস)', ' Inflammation of hand tendons leading to hand pain, discomfort, and difficulty in movements. (হাতের টেনডনের সূজনের ফলে হাতে ব্যথা, অসুস্থতা, এবং চলাচলে সমস্যা হতে পারে।)', 13),
(126, '2024-01-04 06:05:08.942734', NULL, NULL, 'Hand Muscle Strain (হাতের মাংসিক সংকোচন)', 'Pain in the hand due to overuse of hand muscles, especially during activities. (হাতের মাংসিক অধিকতর ব্যবহারের জন্য তাদের অতিক্রম হওয়ার ফলে হাতে ব্যথা, বিশেষতঃ ব্যবহার সময়ে।)', 13),
(127, '2024-01-04 06:05:08.947720', NULL, NULL, 'Hand Osteoarthritis (হাতের অস্টিওআর্থ্রাইটিস)', 'Degenerative joint disease in the hand, causing pain, stiffness, and reduced range of motion. (হাতের মধ্যে পুনর্নবীকরণশীল সংযোগ রোগ, যা ব্যথা, কাঠিন্য, এবং চলাচলের পরিসীমা হ্রাস করতে পারে।)', 13),
(128, '2024-01-04 06:05:08.952707', NULL, NULL, 'Hand Rheumatoid Arthritis ( হাতের রিউমেটয়ইড আর্থ্রাইটিস)', 'Chronic inflammatory disorder affecting the hand joints, leading to pain, swelling, and potential joint deformities. ( হাতের সংযোগগুলির উপর দীর্ঘকালিক সূজন বা একটি মৌখিক রোগ, যা ব্যথা, স্থূলতা, এবং সংযোগ উদীরণের সম্ভাবনাও দেখাতে পারে।)', 13),
(129, '2024-01-04 06:05:08.957696', NULL, NULL, 'Hand Dupuytren\'s Contracture (হাতের ডুপুইট্রেনস কনট্র্যাকচার)', 'Thickening of the tissue beneath the skin of the hand, leading to the fingers being pulled inward, causing difficulty in straightening them. (হাতের চামড়ার নিচে ঊপরের দিকে শক্তিশালী হয়ে যাওয়া, যা আঙ্গুলগুলি মুক্ত করা সহ সমস্যা হতে পারে।)', 13),
(130, '2024-01-04 06:05:08.962681', NULL, NULL, 'Hand De Quervain\'s Tenosynovitis (হাতের ডি কারভানস টেনোসাইনোভাইটিস)', 'Inflammation of the tendons on the thumb side of the hand, causing pain and swelling. (হাতের মৌলিক দিকে টেনডনের সূজন, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 13),
(131, '2024-01-04 06:05:08.966670', NULL, NULL, 'Hand Ganglion Cyst ( হাতের গ্যাংগলিয়ন সিস্ট)', 'Noncancerous lumps filled with synovial fluid that can develop along tendons or joints in the hand, causing pain and discomfort. (হাতের টেনডন বা সংযোগের দিকে উত্থান করতে পারে সিনোভাইয়াল তরল দিয়ে পূর্ণ অক্সিজেন বুকের ছায়ায়, যা ব্যথা এবং অসুস্থতা সৃষ্টি করতে পারে।)', 13),
(132, '2024-01-04 06:49:54.672602', NULL, NULL, 'Hip Osteoarthritis (হিপ অস্টিওআর্থ্রাইটিস)', '    Degenerative joint disease in the hip, causing pain, stiffness, and reduced mobility. ( হিপে পুনর্নবীকরণশীল সংযোগ রোগ, যা ব্যথা, কাঠিন্য, এবং সংযোগ উদীরণের পরিসীমা হ্রাস করতে পারে।)', 14),
(133, '2024-01-04 06:49:54.684571', NULL, NULL, 'Hip Bursitis (হিপ বারসাইটিস)', 'Inflammation of the bursae (fluid-filled sacs) in the hip joint, causing pain and discomfort. (হিপ সংযোগের বারসা (তরল ভরাটে) সূজন এবং ব্যথা সৃষ্টি করতে পারে।)', 14),
(134, '2024-01-04 06:49:54.691552', NULL, NULL, 'Hip Labral Tear (হিপ লেব্রাল টেয়ার)', 'Damage or tear to the labrum (cartilage) in the hip joint, leading to pain, clicking, or locking. (হিপ সংযোগের লেব্রাম (কার্টিলেজ) ক্ষতি বা ফাটানো, যা ব্যথা, ক্লিকিং, অথবা তালমেন্ট সৃষ্টি করতে পারে।)', 14),
(135, '2024-01-04 06:49:54.695541', NULL, NULL, 'Hip Fracture (হিপ ফ্র্যাকচার)', 'Break or crack in the bones of the hip, often resulting from a fall or injury, causing severe pain and limited mobility. (হিপের হাড়ে ভাঙ্গা বা ফাটানো, সাধারিত একটি পড়া বা আঘাত থেকে হয়, যা তীব্র ব্যথা এবং সীমিত চলাচলের কারণে হতে পারে।)', 14),
(136, '2024-01-04 06:49:54.700527', NULL, NULL, 'Hip Dysplasia (হিপ ডিসপ্লেশিয়া)', 'Abnormal development of the hip joint, potentially leading to instability and early degeneration. (হিপ সংযোগের অস্বাভাবিক বিকাশ, যা অস্থিরতা এবং শীঘ্রই পুনর্নবীক)', 14),
(137, '2024-01-04 06:49:54.705513', NULL, NULL, 'Hip Tendinitis (হিপ টেন্ডাইটিস)', 'Inflammation of the tendons around the hip joint, causing pain and discomfort. (হিপ সংযোগের চারপাশের টেন্ডনের সূজন, যা ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 14),
(138, '2024-01-04 06:49:54.710500', NULL, NULL, 'Hip Impingement (হিপ ইমপিংমেন্ট)', 'Abnormal contact between the bones in the hip joint, leading to pain and reduced range of motion. (হিপ সংযোগের হাড়ের মধ্যে অস্বাভাবিক যোগস্পর্শ, যা ব্যথা এবং চলাচলের পরিসীমা হ্রাস করতে পারে।)', 14),
(139, '2024-01-04 06:49:54.725461', NULL, NULL, 'Hip Synovitis (হিপ সাইনোভাইটিস)', 'Inflammation of the synovial membrane in the hip joint, causing pain and swelling. (হিপ সংযোগের সাইনোভাইটিস মেম্ব্রেনের সূজন, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 14),
(140, '2024-01-04 06:49:54.733455', NULL, NULL, 'Hip Dislocation (হিপ ডিসলোকেশন)', 'Displacement of the bones in the hip joint, causing severe pain and loss of joint function. (হিপ সংযোগের হাড় অস্থানান, যা তীব্র ব্যথা এবং সংযোগ কার্যক্ষমতা হারাতে পারে।)', 14),
(141, '2024-01-04 06:49:54.741427', NULL, NULL, 'Hip Avulsion Fracture (হিপ অ্যাভালশন ফ্র্যাকচার)', 'Fracture caused by the pulling away of a tendon or ligament from the hip bone, resulting in pain and limited mobility.   (হিপ হাড় থেকে একটি টেন্ডন বা স্নায়ু টেনে টেনে বের হওয়ার ফলে ফ্র্যাকচার, যা ব্যথা এবং সীমিত চলাচলের কারণে হতে পারে।)', 14),
(142, '2024-01-04 06:56:30.770764', NULL, NULL, 'Hamstring Strain (হ্যামস্ট্রিং স্ট্রেইন)', 'Overstretching or tearing of the hamstring muscles, leading to pain, swelling, and difficulty in leg movement. (হ্যামস্ট্রিং মাংসের অত্যধিক প্রসারণ বা ফাটানো, যা ব্যথা, স্থূলতা, এবং পা চলাচলে সমস্যা সৃষ্টি করতে পারে।)', 15),
(143, '2024-01-04 06:56:30.774753', NULL, NULL, 'Quadriceps Tendinitis (কোয়াড্রিসেপ্স টেন্ডাইটিস)', 'Inflammation of the tendons in the quadriceps muscles, causing pain and discomfort in the front of the thigh. (কোয়াড্রিসেপ্স মাংসের টেন্ডনের সূজন, যা শইঁ দিকে ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 15),
(144, '2024-01-04 06:56:30.780736', NULL, NULL, 'Thigh Contusion (হাঁড়ি দুর্বলতা)', 'Bruising or injury to the muscles of the thigh due to a direct impact, resulting in pain and discoloration. (একটি সরাসরি আঘাতের ফলে হাঁড়ির মাংসে শক্তি বা আঘাত, যা ব্যথা এবং রঙ পরিবর্তন সৃষ্টি করতে পারে।)', 15),
(145, '2024-01-04 06:56:30.785738', NULL, NULL, 'Compartment Syndrome of the Thigh (হাঁড়ির ঘেরা সিন্ড্রোম)', 'Increased pressure within the muscles of the thigh, causing pain, swelling, and potential nerve damage. (হাঁড়ির মাংসের অভ্যন্তরে চাপ বাড়ানো, যা ব্যথা, স্থূলতা এবং সম্ভাব্য তারকা ক্ষতি সৃষ্টি করতে পারে।)', 15),
(146, '2024-01-04 06:56:30.794700', NULL, NULL, 'Iliotibial Band Syndrome (ইলিওটিবিয়াল ব্যান্ড সিন্ড্রোম)', 'Inflammation of the iliotibial band, a thick band of tissue running along the outer thigh, causing pain during movement. (ইলিওটিবিয়াল ব্যান্ডের সূজন, বাইরের হাঁড়ির দিকে দৌড়াতে ব্যথা সৃষ্টি করতে পারে।)', 15),
(147, '2024-01-04 06:56:30.801692', NULL, NULL, 'Thigh Sprain (হাঁড়ি স্প্রেন)', 'Overstretching or tearing of ligaments in the thigh, resulting in pain, swelling, and difficulty in leg movement. (হাঁড়ির মাংসের বন্ধনীস্তরের অত্যধিক প্রসারণ বা ফাটানো, যা ব্যথা, স্থূলতা, এবং পা চলাচলে সমস্যা সৃষ্টি করতে পারে।)', 15),
(148, '2024-01-04 06:56:30.807663', NULL, NULL, 'Adductor Muscle Strain (অ্যাডাক্টর মাংসের স্ট্রেইন)', 'Injury to the adductor muscles, located on the inner side of the thigh, causing pain and discomfort. (অ্যাডাক্টর মাংসের আঘাত, যা হাঁড়ির অভ্যন্তরীণ দিকে অবস্থিত, ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 15),
(149, '2024-01-04 06:56:30.812650', NULL, NULL, 'Compartment Syndrome of the Anterior Thigh (অ্যান্টেরিয়র হাঁড়ির ঘেরা সিন্ড্রোম)', 'Increased pressure within the anterior thigh muscles, leading to pain, swelling, and potential nerve damage. (অ্যান্টেরিয়র হাঁড়ির মাংসের অভ্যন্তরে চাপ বাড়ানো, যা ব্যথা, স্থূলতা এবং সম্ভাব্য তারকা ক্ষতি সৃষ্টি করতে পারে।)', 15),
(150, '2024-01-04 06:56:30.817637', NULL, NULL, 'Thigh Bursitis (হাঁড়ি বারসাইটিস)', 'Inflammation of the bursae (fluid-filled sacs) in the thigh, causing pain and swelling. (হাঁড়ির মাংসের বারসে (তরলপূর্ণ স্যাক) সূজন, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 15),
(151, '2024-01-04 06:56:30.821626', NULL, NULL, 'Thigh Nerve Compression (হাঁড়ি নার্ভ কমপ্রেশন)', 'Pressure or compression on the nerves in the thigh, leading to pain, tingling, and weakness. (হাঁড়ির নার্ভের উপর চাপ বা কমপ্রেশন, যা ব্যথা, ঝিঁকা, এবং দুর্বলতা সৃষ্টি করতে পারে।)', 15),
(152, '2024-01-04 07:04:37.229224', NULL, NULL, 'Shin Splints (হাঁটু বিবাদ)', 'Pain and inflammation along the inner edge of the shinbone (tibia) due to overuse or improper training. (ব্যবহারের বা অযথা প্রশিক্ষণের জন্য হাঁটুর অভ্যন্তরীণ দিকে ব্যথা এবং সুজোন।)', 16);
INSERT INTO `organ_problem_speci` (`id`, `created_at`, `updated_at`, `deleted_at`, `problem`, `problem_specification`, `organ_id`) VALUES
(153, '2024-01-04 07:04:37.239197', NULL, NULL, 'Calf Muscle Strain (পিঁড়ি মাংসের স্ট্রেইন)', 'Overstretching or tearing of the muscles in the calf, leading to pain and limited mobility. (পিঁড়ি মাংসের মাংসের অত্যধিক প্রসারণ বা ফাটানো, যা ব্যথা এবং সীমিত চলাচলের সৃষ্টি করতে পারে।)', 16),
(154, '2024-01-04 07:04:37.249169', NULL, NULL, 'Achilles Tendonitis (একিলিস টেনডোনাইটিস)', 'Inflammation of the Achilles tendon, the large tendon at the back of the ankle, causing pain and stiffness. (একিলিস টেনডনের সূজন, টাঙের পিছনের দিকে বড় টেনডন, ব্যথা এবং কাঠিন্য সৃষ্টি করতে পারে।)', 16),
(155, '2024-01-04 07:04:37.254157', NULL, NULL, 'Calf Cramps (পিঁড়ি মাংসের ক্র্যাম্প)', 'Sudden, painful, and involuntary contractions of the calf muscles, often caused by dehydration or muscle fatigue. (পিঁড়ি মাংসের অচেতন, ব্যথায়ুক্ত এবং অস্বাধীন সংকোচন, যার কারণ সাধারণভাবে অবসাদ বা মাংস ক্লান্তি।)', 16),
(156, '2024-01-04 07:04:37.271112', NULL, NULL, 'Compartment Syndrome of the Lower Leg (নিচের পা এর ঘেরা সিন্ড্রোম)', 'Increased pressure within the muscles of the lower leg, causing pain, swelling, and potential nerve damage. (নিচের পা মাংসের ভিতরে চাপ বাড়ানো, যা ব্যথা, স্থূলতা এবং সম্ভাব্য তারকা ক্ষতি সৃষ্টি করতে পারে।)', 16),
(157, '2024-01-04 07:04:37.276099', NULL, NULL, 'Ankle Sprain (কক্ষিকা মারানো)', 'Stretching or tearing of ligaments in the ankle, resulting in pain, swelling, and difficulty walking. (কক্ষিকা এর লিগামেন্ট গুলির প্রসার বা ফাটানো, যা ব্যথা, স্থূলতা, এবং চলাচলে সমস্যা সৃষ্টি করতে পারে।)', 16),
(158, '2024-01-04 07:04:37.311005', NULL, NULL, 'Plantar Fasciitis (প্ল্যান্টার ফ্যাসিআইটিস)', 'Inflammation of the plantar fascia, the tissue along the bottom of the foot, causing heel pain. (ল্যান্টার ফ্যাসিয়া, পা এর নিচের দিকের উপরে রয়েছে এমন উপকরণের সূজন, হীলে ব্যথা সৃষ্টি করতে পারে।)', 16),
(159, '2024-01-04 07:04:37.320989', NULL, NULL, 'Achilles Tendon Rupture (একিলিস টেনডন ফাটা)', 'Complete or partial tear of the Achilles tendon, often occurring during activities that involve pushing off the foot. (একিলিস টেনডনের সম্পূর্ণ বা আংশিক ফাটা, যা সাধারিতভাবে পা দিয়ে ধাক্কা মারার ক্রিয়ায় ঘটে।)', 16),
(160, '2024-01-04 07:04:37.329958', NULL, NULL, 'Deep Vein Thrombosis (গভীর শিরাসংকোচ)', 'Formation of blood clots in the deep veins of the leg, causing swelling and pain. (পা এর গভীর শিরায় রক্তক্লট তৈরি হয়, যা স্থূলতা এবং ব্যথা সৃষ্টি করতে পারে।)', 16),
(161, '2024-01-04 07:04:37.345109', NULL, NULL, 'Compartment Syndrome of the Foot (পা এর ঘেরা সিন্ড্রোম)', 'Increased pressure within the muscles of the foot, leading to pain, swelling, and potential nerve damage. (পা এর মাংসের ভিতরে চাপ বাড়ানো, যা ব্যথা, স্থূলতা এবং সম্ভাব্য তারকা ক্ষতি সৃষ্টি করতে পারে।)', 16),
(162, '2024-01-04 07:11:03.568478', NULL, NULL, 'Sprained Ankle (কক্ষিকা মারানো)', 'Overstretching or tearing of ligaments in the ankle joint, resulting in pain, swelling, and difficulty walking. (কক্ষিকা এর যৌক্তিক একটি অংশে লিগামেন্টের ব্যাপারে সীমানাহীন বা ফাটানো, যা ব্যথা, স্থূলতা, এবং চলাচলে সমস্যা সৃষ্টি করতে পারে।)', 17),
(163, '2024-01-04 07:11:03.581444', NULL, NULL, 'Ankle Arthritis (কক্ষিকা আর্থ্রাইটিস)', 'Inflammation of the ankle joint, leading to pain, stiffness, and reduced range of motion. (কক্ষিকা যৌক্তিকের সূজন, যা ব্যথা, ঠান্ডাই, এবং চলাচলের পরিসীমা কমাতে পারে।)', 17),
(164, '2024-01-04 07:11:03.588420', NULL, NULL, 'Achilles Tendonitis (একিলিস টেনডনাইটিস)', 'Inflammation of the Achilles tendon, causing pain and swelling in the back of the ankle. (একিলিস টেনডনের সূজন, যা কক্ষিকা এর পিঠে ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 17),
(165, '2024-01-04 07:11:03.594409', NULL, NULL, 'Ankle Fracture (কক্ষিকা ভাঙ্গা)', 'Break in the bones of the ankle, causing pain, swelling, and difficulty walking. (কক্ষিকা এর হাড়ে (কক্ষি এবং টাক্ষণিকা) ভাঙ্গা, যা ব্যথা, স্থূলতা, এবং চলাচলে সমস্যা সৃষ্টি করতে পারে।)', 17),
(166, '2024-01-04 07:11:03.601390', NULL, NULL, 'Gout in the Ankle (কক্ষিকায় গাউট)', 'Buildup of uric acid crystals in the ankle joint, leading to sudden and severe pain. (কক্ষিকা যৌক্তিকে ইউরিক এসিড ক্রিস্টালের সংগ্রহ, যা হাঠা এবং তীব্র ব্যথা সৃষ্টি করতে পারে।)', 17),
(167, '2024-01-04 07:11:03.605375', NULL, NULL, 'Ankle Bursitis (কক্ষিকা বারসাইটিস)', 'Inflammation of the bursae in the ankle joint, causing pain, swelling, and limited movement. (কক্ষিকা যৌক্তিকের বারসা সূজন, যা ব্যথা, স্থূলতা, এবং সীমিত চলাচল সৃষ্টি করতে পারে।)', 17),
(168, '2024-01-04 07:11:03.610362', NULL, NULL, 'Ankle Instability (কক্ষিকা অস্থিরতা)', 'Weakness or lack of support in the ligaments of the ankle, leading to recurrent sprains. (কক্ষিকা যৌক্তিকের লিগামেন্টে দুর্বলতা বা সহায় অভাব, যা পুনরায় স্প্রেনের কারণ হতে পারে।)', 17),
(169, '2024-01-04 07:11:03.615349', NULL, NULL, 'Ankle Tendon Rupture (কক্ষিকা টেনডন ভেঙ্গে যাওয়া)', 'Tear or breakage of the tendons in the ankle, resulting in pain, swelling, and difficulty walking. (কক্ষিকা যৌক্তিকের টেনডনের ফাটানো বা ভাঙ্গা, যা ব্যথা, স্থূলতা, এবং চলাচলে সমস্যা সৃষ্টি করতে পারে।)', 17),
(170, '2024-01-04 07:11:03.619338', NULL, NULL, 'Ankle Synovitis (কক্ষিকা সাইনোভাইটিস)', 'Inflammation of the synovial membrane in the ankle joint, causing pain and swelling. (কক্ষিকা যৌক্তিকের সাইনোভাইটিস এর সূজন, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 17),
(171, '2024-01-04 07:11:03.623326', NULL, NULL, 'Ankle Nerve Compression (কক্ষিকা তন্তু সংকোচন)', 'Pressure on the nerves in the ankle, leading to pain, tingling, and numbness. (কক্ষিকা যৌক্তিকে তন্তুগুলির উপর চাপ, যা ব্যথা, মোচন এবং অবোধ সৃষ্টি করতে পারে।)', 17),
(172, '2024-01-04 07:16:39.519243', NULL, NULL, 'Foot Stress Fracture (পা স্ট্রেস ফ্র্যাকচার)', 'Tiny cracks in the bones of the foot due to repetitive stress, causing pain and swelling. (পা হাড়ের অস্তিত্বের পুনঃপুনঃ চাপের ফলে ছোট ছোট ফাটল, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 18),
(173, '2024-01-04 07:16:39.524229', NULL, NULL, 'Foot Plantar Fasciitis (পা প্ল্যান্টার ফ্যাশিআইটিস)', 'Inflammation of the plantar fascia in the foot, leading to heel pain and stiffness. (পা হাড়ের প্ল্যান্টার ফ্যাশিয়া এর সূজন, যা হীল ব্যথা এবং অস্থিরতা সৃষ্টি করতে পারে।)', 18),
(174, '2024-01-04 07:16:39.530212', NULL, NULL, 'Foot Tendonitis (পা টেনডোনাইটিস)', 'Inflammation of the tendons in the foot, causing pain and swelling. (পা হাড়ের টেনডনের সূজন, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 18),
(175, '2024-01-04 07:16:39.541183', NULL, NULL, 'Foot Stress Fracture (পা স্ট্রেস ফ্র্যাকচার)', 'Tiny cracks in the bones of the foot due to repetitive stress, causing pain and swelling. (পা হাড়ের অস্তিত্বের পুনঃপুনঃ চাপের ফলে ছোট ছোট ফাটল, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 18),
(176, '2024-01-04 07:16:39.546171', NULL, NULL, 'Foot Neuroma (পা নিউরোমা)', 'Thickening of the tissue around a nerve in the foot, leading to pain and numbness.  (পা হাড়ে একটি তন্তুর চারপাশের ঊভীকরণ, যা ব্যথা এবং অবোধ সৃষ্টি করতে পারে।)', 18),
(177, '2024-01-04 07:16:39.554149', NULL, NULL, 'Foot Bunions (পা বাইনান)', 'Enlargement of the joint at the base of the big toe, causing pain and deformity. (বড় হাতের নিচের যৌথের বাড়ানো, যা ব্যথা এবং মোচন সৃষ্টি করতে পারে।)', 18),
(178, '2024-01-04 07:16:39.560133', NULL, NULL, 'Foot Achilles Tendinitis (পা একিলিস টেন্ডাইটিস)', 'Inflammation of the Achilles tendon, causing pain and stiffness in the back of the heel. (একিলিস টেন্ডনের সূজন, যা হীলের পিছনে ব্যথা এবং অস্থিরতা সৃষ্টি করতে পারে।)', 18),
(179, '2024-01-04 07:16:39.570107', NULL, NULL, 'Foot Gout (পা গাউট)', 'Buildup of uric acid crystals in the joints of the foot, causing intense pain and swelling. (পা যৌথে ইউরিক এসিড ক্রিস্টালের সংগ্রহ, যা কঠোর ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 18),
(180, '2024-01-04 07:16:39.580084', NULL, NULL, 'Foot Stress Fracture (পা স্ট্রেস ফ্র্যাকচার)', 'Tiny cracks in the bones of the foot due to repetitive stress, causing pain and swelling. (পা হাড়ের অস্তিত্বের পুনঃপুনঃ চাপের ফলে ছোট ছোট ফাটল, যা ব্যথা এবং স্থূলতা সৃষ্টি করতে পারে।)', 18),
(181, '2024-01-04 07:16:39.587061', NULL, NULL, 'Foot Corns and Calluses (পা কর্ণ এবং ক্যালিউস)', 'Thickened areas of skin on the feet, often caused by friction, leading to pain and discomfort. (পায়ে ত্বকের মোটার অংশ, সাধারিত ঘর্ষণের ফলে, যা ব্যথা এবং অসুখ সৃষ্টি করতে পারে।)', 18),
(182, '2024-01-04 07:27:18.544685', NULL, NULL, 'Thymoma (থাইমোমা)', 'Rare tumor of the thymus gland, potentially causing chest pain and respiratory issues. (থাইমাস গ্র্যান্ডের দুর্লভ টিউমর, যা মস্তিষ্ক ব্যথা এবং শ্বাসকঠিনতা সৃষ্টি করতে পারে।)', 19),
(183, '2024-01-04 07:27:18.550664', NULL, NULL, 'Thymus Hyperplasia (থাইমাস হাইপারপ্লেশিয়া)', 'Enlargement of the thymus gland, potentially affecting the immune system. (থাইমাস গ্র্যান্ডের বাড়ানো, যা সংজ্ঞানাত্মকভাবে ইমিউন সিস্টেম প্রভাবিত করতে পারে।)', 19),
(184, '2024-01-04 07:27:18.554661', NULL, NULL, 'Thymus Atrophy (থাইমাস এট্রফি)', 'Shrinking of the thymus gland, potentially leading to a weakened immune response. (থাইমাস গ্র্যান্ডের সঙ্কোচন, যা কমজোর ইমিউন প্রতিক্রিয়ার দিকে নেতৃত্ব করতে পারে।)', 19),
(185, '2024-01-04 07:27:18.564634', NULL, NULL, 'Thymic Carcinoma (থাইমিক কারসিনোমা)', 'Cancer originating in the cells of the thymus gland, potentially causing chest pain and respiratory issues. (থাইমাস গ্র্যান্ডের কোষগুলি হতে উত্পন্ন ক্যান্সার, যা মস্তিষ্ক ব্যথা এবং শ্বাসকঠিনতা সৃষ্টি করতে পারে।)', 19),
(186, '2024-01-04 07:27:18.571616', NULL, NULL, 'Thymus Cyst (থাইমাস সিস্ট)', 'Fluid-filled sac or cyst in the thymus gland, usually benign and asymptomatic. (থাইমাস গ্র্যান্ডে তরল পূর্ণ বলা বা সিস্ট, সাধারিতভাবে অহিংসাত্মক এবং লক্ষণহীন।)', 19),
(187, '2024-01-04 07:27:18.577593', NULL, NULL, 'Thymus Abscess (থাইমাস এবসেস)', 'Pus-filled cavity or abscess in the thymus gland, often resulting from bacterial infection. (থাইমাস গ্র্যান্ডে পাওয়া ময়ল বা এবসেস, সাধারিতভাবে ব্যাকটেরিয়াল সংক্রমণের ফলে হতে পারে।)', 19),
(188, '2024-01-04 07:27:18.586567', NULL, NULL, 'Thymus Hemangioma (থাইমাস হেম্যাঞ্জিওমা)', 'Benign tumor made up of blood vessels in the thymus gland, usually asymptomatic. (থাইমাস গ্র্যান্ডে রক্তদান থাকা একটি অহিংসাত্মক টিউমার, সাধারিতভাবে লক্ষণহীন।)', 19),
(189, '2024-01-04 07:27:18.590556', NULL, NULL, 'Thymus Granuloma (থাইমাস গ্র্যানুলোমা)', 'Inflammatory nodule or mass in the thymus gland, often due to immune system responses. (    থাইমাস গ্র্যান্ডে সূচির অথবা M\r\n\r\nmatiর একটি অস্বাভাবিক পৃথক অংশ, সাধারিতভাবে ইমিউন সিস্টেম প্রতিক্রিয়া দেওয়ার ফলে।)', 19),
(190, '2024-01-04 07:27:18.595545', NULL, NULL, 'Thymus Lipoma (থাইমাস লিপোমা)', 'Fatty tumor in the thymus gland, usually benign and non-cancerous. (থাইমাস গ্র্যান্ডে চর্বিত টিউমার, সাধারিতভাবে অহিংসাত্মক এবং ক্যান্সার নয়।)', 19),
(191, '2024-01-04 07:27:18.600530', NULL, NULL, 'Thymus Lymphoma (থাইমাস লিম্ফোমা)', 'Cancer affecting the lymphocytes in the thymus gland, potentially causing chest pain and respiratory issues. (থাইমাস গ্র্যান্ডে লিম্ফোসাইটগুলির প্রভাবিত ক্যান্সার, মস্তিষ্ক ব্যথা এবং শ্বাসকঠিনতা সৃষ্টি করতে পারে।)', 19),
(192, '2024-01-04 07:32:35.481561', NULL, NULL, 'Stomach Ulcer (পেটের জ্বালানি)', 'Open sore or lesion on the inner lining of the stomach, often caused by the erosion of stomach acid. (পেটের অভ্যন্তরীণ লাইনিং এ খোলা জড়া বা ক্ষত, সাধারিতভাবে পেটের এসিড অনশনের ফলে হতে পারে।)', 21),
(193, '2024-01-04 07:32:35.490536', NULL, NULL, 'Stomach Cancer (পেটের ক্যান্সার)', 'Uncontrolled growth of abnormal cells in the stomach, often forming tumors. (পেটে অস্বাভাবিক কোষের অনিয়ন্ত্রিত বৃদ্ধি, সাধারিতভাবে টিউমার তৈরি হয়।)', 21),
(194, '2024-01-04 07:32:35.495523', NULL, NULL, 'Stomach Polyps (পেটের পলিপ্স)', 'Abnormal growths on the inner lining of the stomach, often benign but may lead to cancer. (পেটের অভ্যন্তরীণ লাইনিং এ অস্বাভাবিক বৃদ্ধি, সাধারিতভাবে অহিংসাত্মক তবে ক্যান্সারে পৌঁছতে পারে।)', 21),
(195, '2024-01-04 07:32:35.501508', NULL, NULL, 'Stomach Bleeding (পেটের রক্তস্রাব)', 'Loss of blood from the stomach, often due to ulcers, inflammation, or other gastrointestinal issues. (পেট থেকে রক্ত হারানো, সাধারিতভাবে জ্বালানি, সূজ, বা অন্যান্য গ্যাস্ট্রোইনটেস্টাইনাল সমস্যার কারণে।)', 21),
(196, '2024-01-04 07:32:35.524446', NULL, NULL, 'Stomach Obstruction (পেটের বন্ধন)', 'Blockage or hindrance in the normal flow of food through the stomach, causing pain and discomfort. (খাদ্যের সাধারিত প্রবাহে পেটে বন্ধন বা বাধা, যা ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 21),
(197, '2024-01-04 07:32:35.528434', NULL, NULL, 'Gastroenteritis (গ্যাস্ট্রওএন্টেরাইটিস)', 'Inflammation of the stomach and intestines, often caused by viral or bacterial infections, leading to diarrhea and abdominal pain. (পেট এবং অস্তিরিতে সুজোন, সাধারিতভাবে ভাইরাল বা ব্যাকটেরিয়াল সংক্রমণের ফলে, যা ডায়রিয়া এবং পেট ব্যথার কারণ হতে পারে।)', 21),
(198, '2024-01-04 07:32:35.539405', NULL, NULL, 'Stomach Hernia (পেটের হার্নিয়া)', 'Protrusion of the stomach through the abdominal wall, causing a bulge and discomfort. (পেটের ভিতরের প্রবৃদ্ধি দ্বারা পেট মোড়া, একটি বুল্জ এবং অসুবিধা সৃষ্টি করতে পারে।)', 21),
(199, '2024-01-04 07:32:35.547387', NULL, NULL, 'Stomach Infection (পেটের সংক্রমণ)', 'Invasion of harmful microorganisms in the stomach, causing infection, nausea, and vomiting. (পেটে ক্ষতিকর ক্ষুদ্রজীবনু আক্রমণ, সংক্রমণ, মত্স্যক্তি এবং বমি সৃষ্টি করতে পারে।)', 21),
(200, '2024-01-04 07:32:35.557357', NULL, NULL, 'Stomach Spasm (পেটের স্প্যাসম)', 'Sudden and involuntary contraction of the stomach muscles, causing pain and cramps. (পেটের মাংসের অচেতন এবং ইচ্ছামুক্ত সংকোচন, যা ব্যথা এবং ক্র্যাম্প সৃষ্টি করতে পারে।)', 21),
(201, '2024-01-04 07:32:35.566333', NULL, NULL, 'Stomach Obstruction (পেটের বন্ধন)', 'Blockage or hindrance in the normal flow of food through the stomach, causing pain and discomfort. (খাদ্যের সাধারিত প্রবাহে পেটে বন্ধন বা বাধা, যা ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 21),
(202, '2024-01-04 07:37:24.267581', NULL, NULL, 'Kidney Stones (কিডনি পাথর)', 'Formation of hard deposits in the kidneys, causing severe pain and discomfort during urination. (কিডনিতে কঠিন জমা গঠন, মূত্রত্যাগের সময় কঠিন ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 24),
(203, '2024-01-04 07:37:24.276545', NULL, NULL, 'Kidney Infection (কিডনি সংক্রমণ)', 'Bacterial infection affecting the kidneys, leading to fever, pain, and urinary issues. (কিডনিগুলির ক্ষতিকর ব্যাকটেরিয়াল সংক্রমণ, জ্বর, ব্যথা এবং মূত্রসংক্রান্তি সমস্যার কারণ হতে পারে।)', 24),
(204, '2024-01-04 07:37:24.282530', NULL, NULL, 'Kidney Failure (কিডনি ব্যাধি)', 'Inability of the kidneys to perform their normal functions, leading to a buildup of toxins in the body. (কিডনিগুলির স্বাভাবিক কার্যক্রম পালনে অক্ষমতা, শরীরে জীবাণুবাদাম সংগ্রহ হয়ে আসা।)', 24),
(205, '2024-01-04 07:37:24.286519', NULL, NULL, 'Polycystic Kidney Disease (পলিসিস্টিক কিডনি রোগ)', 'Genetic disorder causing the formation of fluid-filled cysts in the kidneys, affecting their normal functioning. (জেনেটিক ব্যাধি, যা কিডনিতে তরলপূর্ণ সিস্ট গঠনের কারণে তাদের স্বাভাবিক কার্যক্রম প্রভাবিত করে।)', 24),
(206, '2024-01-04 07:37:24.292503', NULL, NULL, 'Hydronephrosis (হাইড্রোনেফ্রোসিস)', 'Swelling of the kidneys due to the accumulation of urine, often caused by obstruction in the urinary tract. (মূত্রদানের বন্ধন কারণে মূত্রের সংগ্রহের ফলে কিডনির ফোলা যায়।)', 24),
(207, '2024-01-04 07:37:24.297490', NULL, NULL, 'Glomerulonephritis (গ্লোমেরুলোনেফ্রাইটিস)', 'Inflammation of the glomeruli in the kidneys, affecting their ability to filter blood properly. (কিডনিতে গ্লোমেরুলাসে সুজোন, যা রক্ত ঠিকমতো শোধন করতে তাদের সক্ষমতা প্রভাবিত করে।)', 24),
(208, '2024-01-04 07:37:24.302477', NULL, NULL, 'Renal Artery Stenosis (রিনাল আর্টারি স্টেনোসিস)', 'Narrowing of the renal arteries, leading to reduced blood flow to the kidneys and potential hypertension. (কিডনির ধমনি দোর করা, যা কিডনিগুলিতে রক্ত প্রবাহের হ্রাস এবং সম্ভাব্য রক্তচাপে প্রাপ্তি হতে পারে।)', 24),
(209, '2024-01-04 07:37:24.306466', NULL, NULL, 'Renal Cell Carcinoma (রেনাল সেল কারসিনোমা)', 'Cancerous growth in the cells of the kidneys, potentially spreading to other parts of the body. (কিডনির কোষগুলির ভিতরে ক্যান্সারোজ বৃদ্ধি, সম্ভাব্যতঃ শরীরের অন্যান্য অংশে ছড়াতে পারে।)', 24),
(210, '2024-01-04 07:37:24.315441', NULL, NULL, 'Renal Hypertension (রিনাল হাইপারটেনশন)', 'High blood pressure caused by kidney-related factors, impacting overall cardiovascular health. (কিডনি সংক্রান্ত কারণে উত্তেজন প্রবৃদ্ধি, সামগ্রিক হৃদরোগ প্রভাবিত করতে পারে।)', 24),
(211, '2024-01-04 07:37:24.325422', NULL, NULL, 'Renal Cyst (রিনাল সিস্ট)', 'Fluid-filled sacs or pockets in the kidneys, which may lead to pain or complications if they grow larger. (কিডনিগুলিতে তরলপূর্ণ স্যাক বা জোড়াসুজোড়ি, যা তাদের বড় হলে ব্যথা বা সমস্যা সৃষ্টি করতে পারে।)', 24),
(212, '2024-01-04 07:42:56.718772', NULL, NULL, 'Ovarian Cyst (অয়ারিয়ান সিস্ট)', 'Formation of fluid-filled sacs within or on the surface of the ovaries, often causing pain or discomfort. (অয়ারিয়ান গলার ভিতরে অথবা সারফেসে তরলপূর্ণ স্যাক গঠন, যা সাধারিত ভাবে ব্যথা বা অসুবিধা সৃষ্টি করে।)', 25),
(213, '2024-01-04 07:42:56.722765', NULL, NULL, 'Testicular Cancer (টেস্টিকুলার ক্যান্সার)', 'Development of cancerous cells in the testicles, potentially spreading to other parts of the body. (টেস্টিকেলে ক্যান্সারোজ কোষগুলির উন্নতি, যা সম্ভাব্যতঃ শরীরের অন্যান্য অংশে ছড়াতে পারে।)', 25),
(214, '2024-01-04 07:42:56.727751', NULL, NULL, 'Polycystic Ovary Syndrome (PCOS) (পলিসিস্টিক অয়ারি সিন্ড্রোম)', 'Hormonal disorder causing enlarged ovaries with small cysts, leading to irregular menstrual cycles and other symptoms. (সুস্থতা হরমোনের অস্তিত্বের কারণে অয়ারিয়ান বড় হয়ে উঠে এবং ছোট সিস্ট থাকতে, যা অনিৰ্বাচনীয় মাসিক চক্র এবং অন্যান্য লক্ষণের কারণে।)', 25),
(215, '2024-01-04 07:42:56.731735', NULL, NULL, 'Erectile Dysfunction (ED) (ইরেক্টাইল ডিসফাংকশন)', 'Inability to achieve or maintain an erection, often affecting sexual performance. (একটি উত্তেজন অর্জন বা বজায় রাখতে অক্ষমতা, সাধারিত ভাবে যৌন কর্মক্ষমতা প্রভাবিত করতে সহায় করে।)', 25),
(216, '2024-01-04 07:42:56.737718', NULL, NULL, 'Endometriosis (এন্ডোমিট্রিওসিস)', 'Growth of endometrial tissue outside the uterus, causing pain, inflammation, and potential fertility issues. (গর্ভাশয়ের বাইরে এন্ডোমেট্রিয়াল ঊপস্থিতির বৃদ্ধি, যা ব্যথা, সুজোন, এবং সম্ভাব্য সান্তানিকামনা সমস্যা সৃষ্টি করতে পারে।)', 25),
(217, '2024-01-04 07:42:56.743704', NULL, NULL, 'Prostate Enlargement (প্রোস্টেট বৃদ্ধি)', 'The abnormal growth of the prostate gland, leading to urinary problems and other complications. (প্রোস্টেট গ্র্যান্ডের অস্বাভাবিক বৃদ্ধি, যা মূত্রনালী সমস্যা এবং অন্যান্য জটিলতা সৃষ্টি করতে পারে।)', 25),
(218, '2024-01-04 07:42:56.753682', NULL, NULL, 'Pelvic Inflammatory Disease (PID) (পেলভিক ইনফ্লামেটরি ডিজিজ)', 'Infection of the female reproductive organs, often causing pelvic pain and affecting fertility. (মহিলা প্রজনন অঙ্গগুলির সংক্রামণ, যা সাধারিত পেলভিক ব্যথা এবং সান্তানিকামনা প্রভাবিত করতে পারে।)', 25),
(219, '2024-01-04 07:42:56.769632', NULL, NULL, 'Ectopic Pregnancy (একটপিক গর্ভাবস্থা)', 'Implantation of the fertilized egg outside the uterus, posing a serious health risk. (উত্তেজিত ডিম্ব গর্ভাশয়ের বাইরে অবস্থান হয়, যা একটি গম্ভীর স্বাস্থ্য ঝুঁকি তৈরি করে।)', 25),
(220, '2024-01-04 07:42:56.774621', NULL, NULL, 'Benign Prostatic Hyperplasia (BPH) (অলসরোগ প্রোস্টেটিক হাইপারপ্লেশিয়া)', 'Non-cancerous enlargement of the prostate gland, causing urinary symptoms. (প্রোস্টেট গ্র্যান্ডের অক্যানসারোজ বৃদ্ধি, যা মূত্রনালী লক্ষণ সৃষ্টি করে।)', 25),
(221, '2024-01-04 07:42:56.783596', NULL, NULL, 'Vaginal Infections (ভ্যাজিনাল সংক্রমণ)', 'Infections affecting the vaginal area, leading to discomfort, discharge, and itching. (ভ্যাজিনাল এলাকার উপর প্রভাব ফেলা সংক্রমণ, যা অসুবিধা, ডিসচার্জ, এবং খোচায়।)', 25),
(222, '2024-01-04 08:36:16.304326', NULL, NULL, 'Hepatitis (হেপাটাইটিস)', 'Inflammation of the liver, often caused by viral infections, leading to liver dysfunction. (লিভারের সুজোন, সাধারিতভাবে ভাইরাসোজোকার ফলে, যা লিভার দৌর্বল্যে পরিণত হয়।)', 22),
(223, '2024-01-04 08:36:16.311313', NULL, NULL, 'Fatty Liver Disease (চর্বির লিভার রোগ)', 'Accumulation of fat in the liver cells, often associated with obesity and metabolic disorders. (লিভার কোষে চর্বির সংগ্রহ, সাধারিতভাবে স্থূলতা এবং মেটাবলিক অসুষ্ঠীর সাথে যোগাযোগ করা হয়।)', 22),
(224, '2024-01-04 08:36:16.316292', NULL, NULL, 'Cirrhosis (সার্কোসিস)', 'Scarring of the liver tissue, often the result of long-term liver damage or chronic conditions. (লিভার ঊষ্ণতার স্কারিং, সাধারিতভাবে দীর্ঘকালিক লিভার ক্ষতি বা অবস্থানগুলির ফল।)', 22),
(225, '2024-01-04 08:36:16.321279', NULL, NULL, 'Liver Cancer (লিভার ক্যান্সার)', 'Uncontrolled growth of cells in the liver, forming tumors that can be cancerous. (লিভারে কোষের অসীম বৃদ্ধি, যা ক্যানসারের হতে পারে টিউমার গঠন হয়।)', 22),
(226, '2024-01-04 08:36:16.330261', NULL, NULL, 'Hemochromatosis (হেমোক্রোমাটোসিস)', 'Excessive accumulation of iron in the liver, leading to complications in various organs.  (লিভারে আয়রনের অত্যধিক সংগ্রহ, বিভিন্ন অঙ্গে জটিলতা সৃষ্টি করতে পারে।)', 22),
(227, '2024-01-04 08:36:16.340238', NULL, NULL, 'Primary Biliary Cirrhosis (প্রাথমিক বিলিয়ারি সার্কোসিস)', 'Chronic liver disease where the bile ducts inside the liver are damaged, leading to cirrhosis. (লিভারের মধ্যে বিলিয়ারি সার্কোসিস হয়, যেখানে বিলি ডাক্টের ক্ষতি হয়, সার্কোসিসে পরিণত হয়।)', 22),
(228, '2024-01-04 08:36:16.348214', NULL, NULL, 'Fatty Liver Disease (ফ্যাটি লিভার রোগ)', 'Accumulation of fat in liver cells, often associated with obesity and metabolic syndrome. (লিভার কোষে চর্বির সংগ্রহ, যা সাধারিতা এবং ময়লাটিক সিন্ড্রোমের সাথে সম্পর্কিত।)', 22),
(229, '2024-01-04 08:36:16.358181', NULL, NULL, 'Liver Hemangioma (লিভার হেম‌্যাঞ্জিওমা)', 'A non-cancerous tumor made up of blood vessels in the liver. (লিভারে রক্তনালীগুলি দ্বারা গঠিত একটি অসঙ্গতি টিউমার।)', 22),
(230, '2024-01-04 08:36:16.366160', NULL, NULL, 'Autoimmune Hepatitis (অটোইমিউন হেপাটাইটিস)', 'The immune system mistakenly attacks liver cells, leading to inflammation and liver damage. (অসুস্থ প্রণালী ভুলভাবে লিভার কোষগুলি আক্রমণ করে, যা সূজন এবং লিভার ক্ষতি সৃষ্টি করে।)', 22),
(231, '2024-01-04 08:36:16.370149', NULL, NULL, 'Liver Cyst (লিভার সিস্ট)', 'Fluid-filled sacs in the liver, which are usually benign but can cause discomfort. (লিভারে পানি দিয়ে পূর্ণ স্যাক, যা সাধারিতা দিয়ে অসাধারিত হতে পারে তবে অসুখগ্রস্ত হতে পারে।)', 22),
(232, '2024-01-04 08:42:17.164747', NULL, NULL, 'Irritable Bowel Syndrome (IBS) - (ইরিটেবল বাওল সিন্ড্রোম)', 'A functional gastrointestinal disorder characterized by abdominal pain, bloating, and changes in bowel habits. (একটি কার্যক্ষম পাচনতাত্ত্বিক সমস্যা, যা পেটের ব্যথা, সুজন, এবং বাওল অভ্যন্তরের পরিবর্তনের দ্বারা চিহ্নিত।)', 23),
(233, '2024-01-04 08:42:17.169734', NULL, NULL, 'Crohn\'s Disease (ক্রোনস রোগ)', 'An inflammatory bowel disease causing inflammation of the digestive tract, leading to abdominal pain and diarrhea.\r\n(একটি দাহ্য বাওল রোগ, যা পেটের ব্যথা এবং পাতলা পায়ের কারণে পাচনতাত্ত্বিক দ্বারা সূজন হয়।)', 23),
(234, '2024-01-04 08:42:17.180705', NULL, NULL, 'Diverticulitis (ডাইভারটিকুলাইটিস)', 'Inflammation or infection of small pouches (diverticula) that can form in the walls of the intestines. (ক্ষুদ্র পাউচ (ডাইভারটিকুলা), যা বয়স করার সাথে ইনটেস্টাইনের দেওয়ারে গঠিত হতে পারে, তাদের সূজন বা সংক্রমণ।)', 23),
(235, '2024-01-04 08:42:17.184694', NULL, NULL, 'Celiac Disease (সিলিয়াক রোগ)', 'An autoimmune disorder where the ingestion of gluten leads to damage in the small intestine. (একটি অটোইমিউন ব্যবস্থার অসুস্থতা, যেখানে গ্লুটেন খাওয়ার ফলে ছোট ইনটেস্টাইনে ক্ষতি হয়।)', 23),
(236, '2024-01-04 08:42:17.190677', NULL, NULL, 'Colon Polyps (কোলন পলিপ)', 'Growth on the inner lining of the colon or rectum, which can lead to colorectal cancer. (কোলন বা মলায় অভ্যন্তরীণ লাইনিংয়ে বৃদ্ধি, যা কোলোরেক্টাল ক্যান্সারে পৌঁছতে পারে।)', 23),
(237, '2024-01-04 08:42:17.196668', NULL, NULL, 'Ulcerative Colitis (অলসারেটিভ কলাইটিস)', 'Chronic inflammation of the colon, causing ulcers and long-term digestive issues. (কোলনের দীর্ঘকালীন সূজন, যা অলসার এবং দীর্ঘকালীন পাচনতাত্ত্বিক সমস্যা সৃষ্টি করে।)', 23),
(238, '2024-01-04 08:42:17.210628', NULL, NULL, 'Gastroenteritis (গ্যাস্ট্রোএন্টেরাইটিস)', 'Inflammation of the stomach and intestines, often caused by viral or bacterial infections. (পেট এবং ইনটেস্টাইনের সূজন, যা সাধারিত ভাইরাল বা ব্যাকটেরিয়াল সংক্রমণের কারণে হতে পারে।)', 23),
(239, '2024-01-04 08:42:17.225591', NULL, NULL, 'Intestinal Obstruction (ইনটেস্টাইনাল অবস্থান)', 'Blockage that prevents the normal flow of food and liquids through the intestines. (খাদ্য এবং তরলের মাধ্যমে ইনটেস্টাইনের মাধ্যমে সাধারিত প্রবাহ প্রতিরোধ করে তাত্ক্ষণিক।)', 23),
(240, '2024-01-04 08:42:17.233573', NULL, NULL, 'Malabsorption Syndrome (ম্যালঅ্যাবসরপশন সিন্ড্রোম)', 'Inability to absorb nutrients from food, leading to nutritional deficiencies. (খাদ্য থেকে পুষ্টিতত্ত্ব শোষণ করতে অক্ষমতা, যা পুষ্টি অভাবে পরিচিত।)', 23),
(241, '2024-01-04 08:42:17.242540', NULL, NULL, 'Gallstones (পিতপথরী)', 'Hardened deposits in the gallbladder, often causing pain and other digestive issues. (পিতাশয়ে কঠিন ঠোঁট, সাধারিত ব্যথা এবং অন্যান্য পাচনতাত্ত্বিক সমস্যা সৃষ্টি করতে সাধারিত।)', 23),
(242, '2024-01-04 08:49:51.351654', NULL, NULL, 'Bladder Infection (ব্ল্যাডার ইনফেকশন)', 'Inflammation of the bladder, often caused by bacterial infection, leading to pain and frequent urination. (ব্ল্যাডারের সূজন, সাধারিতভাবে ব্যাকটেরিয়াল সংক্রমণের কারণে, যা ব্যথা এবং সচল মূত্রাশয় সৃষ্টি করতে পারে।)', 26),
(243, '2024-01-04 08:49:51.357639', NULL, NULL, 'Bladder Stones (ব্ল্যাডার পাথর)', 'Hardened deposits in the bladder, causing pain, blood in urine, and discomfort during urination. (ব্ল্যাডারে কঠিন ঠোঁট, যা ব্যথা, মূত্রে রক্ত, এবং মূত্রক্রিয়ার সময় অসুবিধা সৃষ্টি করতে পারে।)', 26),
(244, '2024-01-04 08:49:51.362627', NULL, NULL, 'Interstitial Cystitis (ইন্টারস্টিশিয়াল সিসটাইটিস)', 'Chronic inflammation of the bladder wall, causing pelvic pain and a frequent urge to urinate. (ব্ল্যাডারের দেয়ালের দীর্ঘকালীন সূজন, যা পেলভিক ব্যথা এবং সাধারিত মূত্রাশয়ে আগ্রহ সৃষ্টি করতে পারে।)', 26),
(245, '2024-01-04 08:49:51.367613', NULL, NULL, 'Neurogenic Bladder (নিউরোজেনিক ব্ল্যাডার)', 'Dysfunction of the bladder due to nerve damage, leading to problems with urination control. (নার্ভ ক্ষতির কারণে ব্ল্যাডারের অকার্যকরতা, যা মূত্রাশয় নিয়ন্ত্রণে সমস্যা সৃষ্টি করতে পারে।)', 26),
(246, '2024-01-04 08:49:51.376596', NULL, NULL, 'Bladder Cancer (ব্ল্যাডার ক্যান্সার)', 'Uncontrolled cell growth in the bladder, often leading to blood in urine, pain, and changes in urination habits (ব্ল্যাডারে অনিয়ন্ত্রিত কোষ বৃদ্ধি, সাধারিতভাবে মূত্রে রক্ত, ব্যথা এবং মূত্রক্রিয়ার অভ্যন্তরে পরিবর্তনের ফলে হতে পারে।)', 26),
(247, '2024-01-04 08:49:51.414487', NULL, NULL, 'Urinary Incontinence (মূত্রাশয় অসংযতি)', 'Inability to control urine flow, leading to involuntary leakage, often due to weakened pelvic floor muscles. (মূত্র প্রবাহ নিয়ন্ত্রণ করতে অক্ষম, অসংজ্ঞানে ছড়ানো, সাধারিতভাবে পেলভিক মাঝের মাংসপেশী দলীয় হওয়ার কারণে।)', 26),
(248, '2024-01-04 08:49:51.422471', NULL, NULL, 'Overactive Bladder (অভাবমূত্রাশয়)', 'Urgent and frequent need to urinate, often associated with sudden and uncontrollable bladder contractions (মূত্রাশয়ে জরুরিপূর্ণ এবং সাধারিতভাবে মূত্রাশয়ের অচেতন সংকোচগুলির সাথে সম্পর্কিত অসংযতি হতে পারে।)', 26),
(249, '2024-01-04 08:49:51.431442', NULL, NULL, 'Bladder Diverticulum (ব্ল্যাডার ডাইভারটিকুলাম)', 'Pouch or sac-like bulges that form in the bladder wall, leading to difficulties in emptying the bladder. (ব্ল্যাডারের দেয়ালে গঠিত পাউচ বা স্যাকের মতো উত্তোলন, ব্ল্যাডার খালি করতে সমস্যা সৃষ্টি করতে পারে।)', 26),
(250, '2024-01-04 08:49:51.439434', NULL, NULL, 'Bladder Fistula (ব্ল্যাডার ফিস্টুলা)', 'Abnormal connection between the bladder and nearby organs, causing urine to leak into places it shouldn\'t. (ব্ল্যাডার এবং সামীপ্যবর্তী অঙ্গ মধ্যে অস্বাভাবিক সংযোগ, যা মূত্র তার অবাঞ্ছিত জায়গায় ছড়ানোর কারণে হতে পারে।)', 26),
(251, '2024-01-04 08:49:51.447400', NULL, NULL, 'Bladder Prolapse (ব্ল্যাডার প্রোল্যাপ্স)', 'Descending or dropping of the bladder into the vagina, leading to discomfort and difficulties in urination. (ব্ল্যাডারটি ভ্যাজাইনায় অবনতি বা পড়তে, যা ব্যথা এবং মূত্রাশয়ে সমস্যা সৃষ্টি করতে পারে।)', 26),
(252, '2024-01-04 08:55:39.907329', NULL, NULL, 'Spinal Cord Injury (স্পাইনাল কর্ড আঘাত)', 'Damage to the spinal cord resulting in loss of function, sensation, or mobility. (স্পাইনাল কর্ডে ক্ষতি হয়ে কারণে কার্যক্ষমতা, অববোধ, বা চলাচলের ক্ষতি হতে পারে।)', 27),
(253, '2024-01-04 08:55:39.914307', NULL, NULL, 'Spinal Stenosis (স্পাইনাল স্টেনোসিস)', 'Narrowing of the spinal canal, putting pressure on the spinal cord and nerves, leading to pain and numbness. (স্পাইনাল ক্যানালের সংকোচন, স্পাইনাল কর্ড এবং তার উপর চাপ দেওয়া, যা ব্যথা এবং অববোধ সৃষ্টি করতে পারে।)', 27),
(254, '2024-01-04 08:55:39.919295', NULL, NULL, 'Herniated Disc (হার্নিয়েটেড ডিস্ক)', 'Protrusion or rupture of the cushion-like discs between the vertebrae, causing back pain and nerve compression. \r\n (ভার্টিব্রের মধ্যে মোচার মত ডিস্কের উত্তোলন বা ফাটা, যা পিঠে ব্যথা এবং তার পিছনে দবি সংকোচণ সৃষ্টি করতে পারে।)', 27),
(255, '2024-01-04 08:55:39.925278', NULL, NULL, 'Spinal Tumor (স্পাইনাল টিউমার)', 'Abnormal growth of cells within or near the spinal cord, potentially causing neurological symptoms. (স্পাইনাল কর্ডের ভিতর বা সামীপ্যবর্তী কোষের অস্বাভাবিক বৃদ্ধি, যা স্পাইনাল সংকেত সৃষ্টি করতে পারে।)', 27),
(256, '2024-01-04 08:55:39.935266', NULL, NULL, 'Spinal Cord Abscess (স্পাইনাল কর্ড এবং পাশাপাশি স্থিত পোঁকা)', 'Collection of infected material (pus) near the spinal cord, leading to inflammation and potential damage. (স্পাইনাল কর্ড এবং তার কাছাকাছি স্থিত আক্রান্ত উপাদানের (পুস) সংগ্রহ, যা প্রদাহ এবং সম্ভাব্য ক্ষতি সৃষ্টি করতে পারে।)', 27),
(257, '2024-01-04 08:55:39.944228', NULL, NULL, 'Cauda Equina Syndrome (কডা ইকউইনা সিনড্রোম)', 'Compression of the nerve roots at the lower end of the spinal cord, leading to lower back pain, weakness, and bowel/bladder dysfunction. (স্পাইনাল কর্ডের নীচের শেষে নার্ভ রুট সংকোচন, যা নিচের পিঠে ব্যথা, দুর্বলতা, এবং বৌল/ব্ল্যাডার অক্ষমতা সৃষ্টি করতে পারে।)', 27),
(258, '2024-01-04 08:55:39.948217', NULL, NULL, 'Degenerative Disc Disease (অসংক্রান্ত ডিস্ক রোগ)', 'Wear and tear of the intervertebral discs over time, causing pain, stiffness, and reduced flexibility. (সময়ের সাথে ইন্টাভার্টিব্রাল ডিস্কের পোড়ার আবর্জন, যা ব্যথা, অস্থিরতা, এবং কম চমৎকারতা সৃষ্টি করতে পারে।)', 27),
(259, '2024-01-04 08:55:39.952206', NULL, NULL, 'Spinal Cord Hemorrhage (স্পাইনাল কর্ড হেমরেজ)', 'Bleeding within the spinal cord, leading to pressure on the nerves and potential damage. (স্পাইনাল কর্ডের ভিতরে রক্তস্রাব, যা নার্ভে চাপ এবং সম্ভাব্য ক্ষতি সৃষ্টি করতে পারে।)', 27),
(260, '2024-01-04 08:55:39.960189', NULL, NULL, 'Spinal Cord Ischemia (স্পাইনাল কর্ড আইসকেমিয়া)', 'Lack of blood supply to the spinal cord, leading to cell damage and neurological symptoms. (স্পাইনাল কর্ডে রক্ত সরবরাহের অভাব, যা কোষ ক্ষতি এবং স্নায়বিক লক্ষণ সৃষ্টি করতে পারে।)', 27),
(261, '2024-01-04 08:55:39.981139', NULL, NULL, 'Spinal Cord Infection (স্পাইনাল কর্ড সংক্রামণ)', 'Infection of the spinal cord, causing inflammation and potential damage to the nerve tissues. (স্পাইনাল কর্ডের সংক্রমণ, যা প্রদাহ এবং নার্ভ ঊঁচু স্থানে ক্ষতি সৃষ্টি করতে পারে।)', 27),
(262, '2024-01-04 09:00:54.723749', NULL, NULL, 'Muscle Strain (মাংসপেশী স্ট্রেইন)', 'Overstretching or tearing of muscles supporting the spine, leading to pain, stiffness, and limited mobility. (স্পাইন সাপোর্ট করা মাংসপেশীর অধিক আঙ্গুলভঙ্গ, যা ব্যথা, অস্থিরতা, এবং সীমিত চলাচল সৃষ্টি করতে পারে।)', 28),
(263, '2024-01-04 09:00:54.728734', NULL, NULL, 'Herniated Disc (হার্নিয়েটেড ডিস্ক)', 'The intervertebral disc bulges or ruptures, putting pressure on the spinal nerves, causing pain and numbness (ইন্টাভার্টিব্রাল ডিস্ক ফোটার বা ফাটার ফলে, স্পাইনাল নার্ভের উপর চাপ পড়ে, যা ব্যথা এবং অস্তিত্বের কারণ হতে পারে।)', 28),
(264, '2024-01-04 09:00:54.734720', NULL, NULL, 'Spinal Stenosis (স্পাইনাল স্টেনোসিস)', 'Narrowing of the spinal canal, putting pressure on the nerves and causing pain, weakness, or numbness. (স্পাইনাল ক্যানালের সংকোচন, নার্ভে চাপ পড়ার ফলে ব্যথা, দুর্বলতা, অথবা অস্তিত্বের কারণ হতে পারে।)', 28),
(265, '2024-01-04 09:00:54.739705', NULL, NULL, 'Muscle Spasms (মাংসপেশী স্প্যাসম)', 'Sudden and involuntary contractions of the muscles supporting the spine, causing pain and discomfort. (স্পাইন সাপোর্ট করা মাংসপেশীর অচেতন এবং ইচ্ছামুক্ত সংকোচন, যা ব্যথা এবং অসুবিধা সৃষ্টি করতে পারে।)', 28),
(266, '2024-01-04 09:00:54.744691', NULL, NULL, 'Muscle Atrophy (মাংসপেশী ক্ষয়)', 'Wasting away or loss of muscle mass supporting the spine, leading to weakness and decreased function. (স্পাইন সাপোর্ট করা মাংসপেশীর স্নায়ু ক্ষয় বা হারানো, যা দুর্বলতা এবং ক্ষমতা কমে আনতে পারে।)', 28),
(267, '2024-01-04 09:00:54.750677', NULL, NULL, 'Kyphosis (কাইফোসিস)', 'Excessive outward curvature of the spine, leading to a hunchback appearance and potential pain. (স্পাইনের অত্যধিক বাইরে কার্ভেচার, যা একটি হাঞ্চির মুখোমুখি দেখা দেয় এবং সম্ভাব্যতঃ ব্যথা সৃষ্টি করতে পারে।)', 28),
(268, '2024-01-04 09:00:54.755662', NULL, NULL, 'Lordosis (লর্ডোসিস)', 'Excessive inward curvature of the spine, often in the lower back, causing a swayback appearance. (স্পাইনের অত্যধিক অভ্যন্তরে কার্ভেচার, সাধারণভাবে নিচের পিঠে, একটি সোয়েব্যাক মুখোমুখি করতে পারে।)', 28),
(269, '2024-01-04 09:00:54.763651', NULL, NULL, 'Scoliosis (স্কলিওসিস)', 'Sideways curvature of the spine, often in an S or C shape, causing uneven shoulders or hips. (স্পাইনের পাশাপাশি কার্ভেচার, সাধারণভাবে S বা C আকারে, অসমত কন্ধ বা হিপ সৃষ্টি করতে পারে।)', 28),
(270, '2024-01-04 09:00:54.773614', NULL, NULL, 'Sciatica (সাইয়াটিকা)', 'Compression or irritation of the sciatic nerve, causing pain, numbness, and tingling down the leg. (সাইয়াটিক নার্ভের সংকোচন বা চিন্তার ফলে, পা নিচে ব্যথা, অসুবিধা এবং মাঝে মাঝে ঝিঁঝিঁ বা মোমড়ক হতে পারে।)', 28),
(271, '2024-01-04 09:00:54.782592', NULL, NULL, 'Ankylosing Spondylitis (এঙ্কিলোজিং স্পন্ডিলাইটিস)', 'Inflammatory arthritis affecting the spine, leading to stiffness, pain, and fusion of vertebrae. (স্পাইন প্রভৃতি প্রভৃতি আক্রান্তকারী আর্থ্রাইটিস, যা অস্থিরতা, ব্যথা, এবং ভার্টিব্রার একোটা হতে পারে।)', 28),
(272, '2024-01-04 09:07:03.551906', NULL, NULL, 'Muscle Strain (মাংসপেশী স্ট্রেইন)', 'Overstretching or tearing of muscle fibers, leading to pain, swelling, and limited movement. (মাংসপেশী তন্তুগুলির অতিস্থূলন বা ছিদ্রান্বেষণ, যা ব্যথা, স্থূলতা, এবং সীমিত চলাচল সৃষ্টি করতে পারে।)', 29),
(273, '2024-01-04 09:07:03.567873', NULL, NULL, 'Muscle Spasm (মাংসপেশী স্প্যাসম)', 'Sudden and involuntary contraction of muscles, causing pain, tightness, and temporary loss of function. (মাংসপেশী অচেতন এবং ইচ্ছামুক্ত সংকোচন, যা ব্যথা, সঙ্গতি এবং অস্থায়ী কার্যক্ষমতা হারাতে উপনিবৃত্ত।)', 29),
(274, '2024-01-04 09:07:03.581825', NULL, NULL, 'Muscular Dystrophy (মাসকুলার ডিসট্রোফি)', 'Genetic disorders leading to progressive muscle degeneration and weakness. (ধারাবাহিক মাংসপেশীর পুনঃউদ্ধার এবং দুর্বলতা সৃষ্টি করতে যাওয়া আত্মীয় ব্যাধি।)', 29),
(275, '2024-01-04 09:07:03.590801', NULL, NULL, 'Compartment Syndrome (কম্পার্টমেন্ট সিনড্রোম)', 'Increased pressure within the muscles, leading to reduced blood flow, pain, and potential nerve damage. (মাংসপেশীতে বৃদ্ধি প্রয়োজন, যা রক্তচাপের কমতির ফলে, ব্যথা এবং সম্ভাব্য নার্ভ ক্ষতি সৃষ্টি করতে পারে।)', 29),
(276, '2024-01-04 09:07:03.600775', NULL, NULL, 'Myositis (মায়োসাইটিস)', 'Inflammation of muscle tissues, causing weakness, pain, and sometimes, difficulty in swallowing or breathing.\r\n(মাংসপেশী ঊষ্ণাংশের সুজোন, যা দুর্বলতা, ব্যথা এবং কখনই, কুচকানো বা শ্বাস নিতে সমস্যা সৃষ্টি করতে পারে।)', 29),
(277, '2024-01-04 09:07:03.616748', NULL, NULL, 'Tendonitis (টেনডোনাইটিস)', 'Inflammation of the tendons, often caused by overuse or injury, resulting in pain and limited joint movement. (টেনডনগুলির সুজোন, সাধারিত ব্যবহার বা আঘাতের ফলে হতে, যা ব্যথা এবং সীমিত জয়েন্ট চলাচল সৃষ্টি করতে পারে।)', 29),
(278, '2024-01-04 09:07:03.628702', NULL, NULL, 'Muscle Atrophy (মাসকুলার এট্রফি)', 'Wasting away or loss of muscle tissue, leading to weakness and decreased muscle mass. (মাংসপেশী ঊষ্ণাংশের বা হানা হয় বা মাংসপেশী পরিমাণের কমতির ফলে, যা দুর্বলতা এবং মাংসপেশী দ্রবতা কমতি করে।)', 29),
(279, '2024-01-04 09:07:03.646653', NULL, NULL, 'Rhabdomyolysis (র্যাবডোমাইোলাইসিস)', 'Breakdown of muscle tissue, releasing a protein into the bloodstream that can cause kidney damage. (মাংসপেশী ঊষ্ণাংশের বিচ্ছেদ, যা রক্তপাতে একটি প্রোটিন মুক্ত করে যা কিডনি ক্ষতি সৃষ্টি করতে পারে।)', 29),
(280, '2024-01-04 09:07:03.656626', NULL, NULL, 'Frozen Shoulder (হলুদ কনু):', 'Stiffness and pain in the shoulder joint, limiting its range of motion. (কনু জয়েন্টে মোচ এবং ব্যথা, যা তার চলাচলের পরিসীমা সীমিত করে।)', 29),
(281, '2024-01-04 09:07:03.667602', NULL, NULL, 'Muscle Cramps (মাসকুলার ক্র্যাম্প)', 'Sudden and involuntary contractions of muscles, causing intense pain and temporary immobility. (মাংসপেশীর অচেতন এবং ইচ্ছামুক্ত সংকোচন, যা তীব্র ব্যথা এবং অস্থায়ী অচলতা সৃষ্টি করতে পারে।)', 29),
(282, '2024-01-04 09:14:50.847678', NULL, NULL, 'Gastroesophageal Reflux Disease (GERD) (গ্যাস্ট্রোইসোফাগিয়াল রিফ্লাক্স রোগ)', 'Chronic condition where stomach acid flows back into the esophagus, causing irritation and discomfort. (যেখানে পেটের অ্যাসিড আসলে পুনঃইসোফেগাসে ফিরে যায়, যা উদ্বেগ এবং অসুখ সৃষ্টি করে।)', 30),
(283, '2024-01-04 09:14:50.856655', NULL, NULL, 'Irritable Bowel Syndrome (IBS) (আইবিএস)', 'Functional gastrointestinal disorder characterized by abdominal pain, bloating, and changes in bowel habits. (কার্যক্ষম পেট অসুখের প্রতিষ্ঠান যা পেটের ব্যথা, স্তন্যতা এবং পায়ের অভ্যন্তরীণ পরিবর্তনের মাধ্যমে চিহ্নিত।)', 30),
(284, '2024-01-04 09:14:50.862638', NULL, NULL, 'Uterine Fibroids (গর্ভাশয়ের ফাইব্রয়েড)', 'Non-cancerous growths of the uterus that often appear during childbearing years, causing pelvic pain and heavy menstrual bleeding. (গর্ভাশয়ের অস্ত্রাণু যা সাধারণভাবে সন্তানধারণ বছরে দেখা যায়, যা হাতড়ি ব্যথা এবং ভারী মাসিকধরা সৃষ্টি করে।)', 30),
(285, '2024-01-04 09:14:50.867624', NULL, NULL, 'Achalasia (অ্যাকালাসিয়া)', 'Disorder of the esophagus where the lower sphincter doesn\'t relax properly, causing difficulty in swallowing (এসোফাগাসের ব্যথা যেখানে নিচু স্ফিংক্টার সঠিকভাবে শান্ত হয়না, যা কুণ্ডল করতে কষ্ট সৃষ্টি করে।)', 30),
(286, '2024-01-04 09:14:50.872616', NULL, NULL, 'Gallstones (পিত্তাশয়ের পাথর)', 'Hardened deposits in the gallbladder, causing pain and discomfort, especially after consuming fatty foods. (পিত্তাশয়ে কঠিন জমা, ব্যথা এবং অসুখ সৃষ্টি করে, সহজে ভোজন করার পরে বিশেষভাবে পরবর্তী।)', 30),
(287, '2024-01-04 09:14:50.877599', NULL, NULL, 'Pancreatitis (প্যাঙ্ক্রিয়াটাইটিস)', 'Inflammation of the pancreas, leading to abdominal pain, nausea, and digestive issues. (অগ্ন্যাশয়ের প্রদাহ, যার ফলে পেটে ব্যথা, বমি বমি ভাব এবং হজমের সমস্যা হয়।)', 30),
(288, '2024-01-04 09:14:50.883582', NULL, NULL, 'Rotator Cuff Injury (রোটেটর কাফ ক্ষতি)', 'Damage to the group of muscles and tendons around the shoulder joint, causing pain and limited range of motion. (কাঁধের জয়েন্টের চারপাশে পেশী এবং টেন্ডনের গোষ্ঠীর ক্ষতি, ব্যথা এবং গতির সীমিত পরিসরের কারণ।)', 30),
(289, '2024-01-04 09:14:50.891564', NULL, NULL, 'Herniated Disc (হার্নিয়েটেড ডিস্ক)', 'Protrusion of the intervertebral disc, pressing on nerves and causing back pain and numbness. (ইন্টারভার্টেব্রাল ডিস্কের প্রোট্রুশন, স্নায়ুতে চাপ দেয় এবং পিঠে ব্যথা এবং অসাড়তা সৃষ্টি করে।)', 30),
(290, '2024-01-04 09:14:50.902532', NULL, NULL, 'Glaucoma (গ্লাউকোমা)', 'Eye condition characterized by increased intraocular pressure, leading to optic nerve damage and vision loss. (চোখের অবস্থা বর্ধিত ইন্ট্রাওকুলার চাপ দ্বারা চিহ্নিত, যা অপটিক স্নায়ুর ক্ষতি এবং দৃষ্টিশক্তি হ্রাসের দিকে পরিচালিত করে।)', 30),
(291, '2024-01-04 09:14:50.922479', NULL, NULL, 'Cervical Spondylosis (সার্ভিক্যোল স্পণ্ডিলোসিস)', 'Degeneration of the cervical spine, causing neck pain, stiffness, and sometimes numbness or weakness. (সার্ভিকাল মেরুদণ্ডের অবক্ষয় ঘাড়ে ব্যথা, শক্ত হয়ে যাওয়া এবং কখনও কখনও অসাড়তা বা দুর্বলতা সৃষ্টি করে।)', 30),
(292, '2024-01-04 12:56:09.618200', NULL, NULL, 'Myocardial Infarction (Heart Attack) (মাইকার্ডিয়াল ইনফারকশন - হার্ট অ্যাট্যাক)', 'Blockage of blood flow to the heart muscle, leading to damage or death of heart tissue. (হৃদপিন্ডের পেশীতে রক্ত ​​প্রবাহে বাধা, যার ফলে হৃদপিন্ডের টিস্যুর ক্ষতি বা মৃত্যু হয়।)', 31),
(293, '2024-01-04 12:56:09.631164', '2024-01-04 13:31:17.222405', NULL, 'Pericarditis (পেরিকার্ডাইটিস)', 'Inflammation of the pericardium, the sac around the heart, causing chest pain and discomfort. (পেরিকার্ডিয়ামের প্রদাহ, হৃৎপিণ্ডের চারপাশে থলি, বুকে ব্যথা এবং অস্বস্তি সৃষ্টি করে।)', 31),
(294, '2024-01-04 12:56:09.646124', NULL, NULL, 'Heart Failure (হার্ট ফেইলার)', 'Inability of the heart to pump blood effectively, leading to symptoms like shortness of breath and fatigue. (হৃৎপিণ্ড কার্যকরভাবে রক্ত ​​পাম্প করার ক্ষমতা, যার ফলে শ্বাসকষ্ট এবং ক্লান্তির মতো উপসর্গ দেখা দেয়।)', 31),
(295, '2024-01-04 12:56:09.656101', NULL, NULL, 'Cardiomyopathy (কার্ডিওমায়োপাথি)', 'Disease of the heart muscle, affecting its structure and function. (হৃৎপিণ্ডের পেশীর রোগ, এর গঠন এবং কার্যকারিতা প্রভাবিত করে।)', 31),
(296, '2024-01-04 12:56:09.664079', NULL, NULL, 'Valvular Heart Disease (ভালভুলার হার্ট ডিজিজ)', 'Malfunction or damage to the heart valves, leading to impaired blood flow (হার্টের ভালভের ত্রুটি বা ক্ষতি, যার ফলে রক্ত ​​চলাচল ব্যাহত হয়)', 31),
(297, '2024-01-04 13:00:06.139180', NULL, NULL, 'Hypertrophic Cardiomyopathy (হাইপারট্রোফিক কার্ডিওমায়োপাথি)', 'Problem Specification: Genetic condition causing thickening of the heart muscle, increasing the risk of heart failure, arrhythmias, and sudden cardiac death. (হৃদয়ের মাংসপেশীর মাসুকে মোটামুটি করা, হৃদয় ব্যাধি, অতএব হৃদয়ের প্রভাবকে বাড়াতে পারে এবং অসমাপ্ত হৃদয় মৃত্যুর ঝুঁকিতে বাড়াতে পারে।)', 31),
(298, '2024-01-04 13:27:31.042494', NULL, NULL, 'Heart Valve Disease (হৃদয় ভালভ রোগ)', 'Problem Specification (সমস্যার বিবরণ): Malfunction or damage to one or more of the heart valves, affecting blood flow and potentially leading to symptoms like chest pain, fatigue, or heart palpitations. (সমস্যা স্পেসিফিকেশন (সমস্যার বিবরণ): এক বা একাধিক হার্টের ভালভের ত্রুটি বা ক্ষতি, রক্ত ​​​​প্রবাহকে প্রভাবিত করে এবং সম্ভাব্যভাবে বুকে ব্যথা, ক্লান্তি বা হৃদস্পন্দনের মতো লক্ষণগুলির দিকে পরিচালিত করে।)', 31),
(299, '2024-01-04 13:29:29.987013', NULL, NULL, 'Peripheral Artery Disease (PAD) (পেরিফেরাল আর্টারি রোগ)', 'Narrowing of the peripheral arteries, often in the legs, reducing blood flow and increasing the risk of complications like leg pain and non-healing wounds. (পেরিফেরাল ধমনী সংকুচিত করা, প্রায়শই পায়ে, রক্ত ​​প্রবাহ হ্রাস করে এবং পায়ে ব্যথা এবং অ নিরাময় ক্ষতের মতো জটিলতার ঝুঁকি বাড়ায়।)', 31),
(300, '2024-01-04 13:29:29.996980', NULL, NULL, 'Myocarditis (মায়োকার্ডাইটিস)', 'Inflammation of the heart muscle, which can weaken the heart and lead to symptoms like chest pain, fatigue, and shortness of breath. (হৃৎপিণ্ডের পেশীর প্রদাহ, যা হৃৎপিণ্ডকে দুর্বল করে দিতে পারে এবং বুকে ব্যথা, ক্লান্তি এবং শ্বাসকষ্টের মতো উপসর্গ দেখা দিতে পারে।)', 31),
(301, '2024-01-04 13:30:30.115076', NULL, NULL, 'Coronary Artery Spasm (করোনারি আর্টারি স্প্যাসম)', 'Sudden contraction of the coronary arteries, leading to a temporary reduction in blood flow to the heart muscle and causing chest pain or discomfort. (করোনারি ধমনীর আকস্মিক সংকোচন, যার ফলে হৃৎপিণ্ডের পেশীতে রক্ত ​​চলাচল সাময়িকভাবে কমে যায় এবং বুকে ব্যথা বা অস্বস্তি হয়।)', 31),
(302, '2024-01-04 13:36:42.656243', NULL, NULL, 'Osteoporosis (অস্তিস্ক যন্ত্রণা)', 'A condition characterized by weakened and porous bones, often affecting the spine, which can lead to fractures and a reduction in overall bone density. (দুর্বল এবং ছিদ্রযুক্ত হাড় দ্বারা চিহ্নিত একটি অবস্থা, প্রায়শই মেরুদণ্ডকে প্রভাবিত করে, যা ফ্র্যাকচার এবং সামগ্রিক হাড়ের ঘনত্ব হ্রাস করতে পারে।)', 32),
(303, '2024-01-04 13:36:42.662225', NULL, NULL, 'Scoliosis (স্কলিওসিস)', 'Problem Specification (সমস্যার বিবরণ): Abnormal sideways curvature of the spine, which can affect posture, cause back pain, and, in severe cases, impact organ function. (সমস্যা স্পেসিফিকেশন (সমস্যার বিবরণ): মেরুদণ্ডের অস্বাভাবিক পার্শ্ববর্তী বক্রতা, যা অঙ্গবিন্যাসকে প্রভাবিত করতে পারে, পিঠে ব্যথা হতে পারে এবং গুরুতর ক্ষেত্রে অঙ্গের কার্যকারিতাকে প্রভাবিত করতে পারে।)', 32),
(304, '2024-01-04 13:36:42.668210', NULL, NULL, 'Herniated Disc (হার্নিয়েটেড ডিস্ক)', 'The displacement or rupture of an intervertebral disc, leading to pressure on nearby nerves, resulting in pain, numbness, or weakness. (একটি ইন্টারভার্টেব্রাল ডিস্কের স্থানচ্যুতি বা ফেটে যাওয়া, যা কাছাকাছি স্নায়ুর উপর চাপ সৃষ্টি করে, যার ফলে ব্যথা, অসাড়তা বা দুর্বলতা দেখা দেয়।)', 32),
(305, '2024-01-04 13:36:42.673197', NULL, NULL, 'Spinal Stenosis (স্পাইনাল স্টেনোসিস)', 'Narrowing of the spinal canal, putting pressure on the spinal cord and nerves, leading to symptoms like back pain, leg pain, or numbness. (মেরুদন্ডের খাল সরু হয়ে যাওয়া, মেরুদন্ড এবং স্নায়ুর উপর চাপ পড়ে, যার ফলে পিঠে ব্যথা, পায়ে ব্যথা বা অসাড়তার মতো উপসর্গ দেখা দেয়।)', 32),
(306, '2024-01-04 13:53:55.875523', NULL, NULL, 'Craniosynostosis (ক্র্যানিওসিনোস্টোসিস)', 'Craniosynostosis is a condition where the bones in an infant\'s skull fuse prematurely. This can affect the shape of the head and may require surgical intervention. (ক্রেনিওসিনোস্টোসিস হল এমন একটি অবস্থা যেখানে একটি শিশুর মাথার খুলির হাড় অকালে ফিউজ হয়ে যায়। এটি মাথার আকৃতিকে প্রভাবিত করতে পারে এবং অস্ত্রোপচারের হস্তক্ষেপের প্রয়োজন হতে পারে।)', 32),
(307, '2024-01-04 13:56:12.416020', NULL, NULL, 'Rib Fractures (পাঁজরের ফাটল)', 'Rib fractures involve breaks or cracks in the ribs. They can result from trauma, such as a direct blow to the chest, and can cause pain and difficulty breathing. (পাঁজরের ফাটল বা পাঁজরে ফাটল দেখা দেয়। এগুলি আঘাতের ফলে হতে পারে, যেমন বুকে সরাসরি আঘাত, এবং ব্যথা এবং শ্বাস নিতে অসুবিধা হতে পারে।)', 32),
(308, '2024-01-04 14:04:38.837938', NULL, NULL, 'Osteomyelitis of the Spine (মেরুদণ্ডের অস্টিওমাইলাইটিস)', 'Osteomyelitis is an infection of the bone, and when it affects the spine, it can lead to pain, swelling, and potential damage to the spinal cord. (অস্টিওমাইলাইটিস হল হাড়ের একটি সংক্রমণ, এবং যখন এটি মেরুদণ্ডকে প্রভাবিত করে, তখন এটি ব্যথা, ফুলে যাওয়া এবং মেরুদণ্ডের সম্ভাব্য ক্ষতি হতে পারে।)', 32),
(309, '2024-01-04 14:16:10.785580', NULL, NULL, 'Rotator Cuff Tear (রোটেটর কাফ টিয়ার)', 'A tear in the tendons of the rotator cuff in the shoulder, leading to pain, weakness, and limited range of motion. (কাঁধের রোটেটর কাফের টেন্ডনে ছিঁড়ে যাওয়া, যার ফলে ব্যথা, দুর্বলতা এবং গতি সীমিত হয়।)', 33),
(310, '2024-01-04 14:16:10.803530', NULL, NULL, 'Frozen Shoulder (Adhesive Capsulitis) (ফ্রোজেন শোল্ডার (আঠালো ক্যাপসুলাইটিস):)', ' Inflammation and thickening of the shoulder joint capsule, causing pain and stiffness in the shoulder. (কাঁধের জয়েন্ট ক্যাপসুলের প্রদাহ এবং ঘন হয়ে যাওয়া, কাঁধে ব্যথা এবং শক্ত হয়ে যাওয়া।)', 33),
(311, '2024-01-04 14:16:10.810509', NULL, NULL, 'Tennis Elbow (Lateral Epicondylitis) (টেনিস এলবো (পার্শ্বীয় এপিকন্ডাইলাইটিস))', 'Inflammation of the tendons on the outer part of the elbow, resulting in pain and tenderness. (কনুইয়ের বাইরের অংশে টেন্ডনগুলির প্রদাহ, যার ফলে ব্যথা এবং কোমলতা হয়।)', 33),
(312, '2024-01-04 14:16:10.814500', NULL, NULL, 'Carpal Tunnel Syndrome (কার্পাল টানেল সিনড্রোম)', 'Compression of the median nerve in the wrist, leading to numbness, tingling, and weakness in the hand. (কব্জির মধ্যবর্তী স্নায়ুর সংকোচন, যার ফলে হাতের অসাড়তা, কাঁপুনি এবং দুর্বলতা দেখা দেয়।)', 33),
(313, '2024-01-04 14:16:10.819485', NULL, NULL, 'Hip Labral Tear (হিপ ল্যাব্রাল টিয়ার)', 'A tear in the cartilage (labrum) of the hip joint, causing hip pain and potential joint instability. (নিতম্বের জয়েন্টের তরুণাস্থিতে (ল্যাব্রাম) একটি ছিঁড়ে যাওয়া, যার ফলে নিতম্বের ব্যথা এবং সম্ভাব্য জয়েন্টের অস্থিরতা।)', 33),
(314, '2024-01-04 14:16:10.823475', NULL, NULL, 'Patellofemoral Pain Syndrome (প্যাটেলোফেমোরাল পেইন সিনড্রোম)', 'Knee pain around or under the kneecap, often related to activities that load the joint. (হাঁটুর আশেপাশে বা হাঁটুর নীচে হাঁটু ব্যথা, প্রায়শই জয়েন্ট লোড করে এমন কার্যকলাপের সাথে সম্পর্কিত।)', 33),
(315, '2024-01-04 14:16:10.829460', NULL, NULL, 'Achilles Tendinitis (অ্যাকিলিস টেন্ডিনাইটিস)', 'Inflammation of the Achilles tendon, resulting in pain and stiffness in the back of the heel. (অ্যাকিলিস টেন্ডনের প্রদাহ, যার ফলে গোড়ালির পিছনে ব্যথা এবং শক্ত হয়ে যায়।)', 33),
(316, '2024-01-04 14:16:10.833449', NULL, NULL, 'Shin Splints (শিন স্প্লিন্টস)', 'Pain along the shinbone (tibia), typically caused by excessive stress on the shin tissues. (শিনবোন (টিবিয়া) বরাবর ব্যথা, সাধারণত শিন টিস্যুতে অতিরিক্ত চাপের কারণে হয়।)', 33),
(317, '2024-01-04 14:16:10.837438', NULL, NULL, 'Ankle Sprain (গোড়ালি মচকে যাওয়া)', 'Stretching or tearing of the ligaments around the ankle, leading to pain and swelling. (গোড়ালির চারপাশের লিগামেন্টগুলি প্রসারিত বা ছিঁড়ে যাওয়া, যার ফলে ব্যথা এবং ফুলে যায়।)', 33),
(318, '2024-01-04 14:16:10.842436', NULL, NULL, 'Stress Fracture (Stress Fracture)', 'Tiny cracks in the bone often caused by repetitive stress, resulting in localized pain. (হাড়ের ছোট ফাটল প্রায়ই পুনরাবৃত্তিমূলক চাপের কারণে ঘটে, যার ফলে স্থানীয় ব্যথা হয়।)', 33),
(319, '2024-01-04 14:19:09.397196', NULL, NULL, 'Herniated Disc (Slipped Disc) (হার্নিয়েটেড ডিস্ক (স্লিপড ডিস্ক))', 'Displacement of the intervertebral disc, causing compression of nearby nerves and resulting in pain and weakness. (ইন্টারভার্টেব্রাল ডিস্কের স্থানচ্যুতি, কাছাকাছি স্নায়ুর সংকোচন ঘটায় এবং এর ফলে ব্যথা এবং দুর্বলতা দেখা দেয়।)', 32),
(320, '2024-01-04 14:20:28.496850', NULL, NULL, 'Thoracic Outlet Syndrome (থোরাসিক আউটলেট সিন্ড্রোম)', 'Thoracic outlet syndrome occurs when nerves or blood vessels between the collarbone and first rib are compressed, leading to pain, numbness, and tingling in the arm. (থোরাসিক আউটলেট সিন্ড্রোম ঘটে যখন কলারবোন এবং প্রথম পাঁজরের মধ্যবর্তী স্নায়ু বা রক্তনালীগুলি সংকুচিত হয়, যার ফলে বাহুতে ব্যথা, অসাড়তা এবং ঝাঁকুনি দেখা দেয়।)', 32),
(321, '2024-01-04 14:21:20.477540', NULL, NULL, 'Tarlov Cysts (টারলোভ সিস্ট)', 'Tarlov cysts are fluid-filled sacs that can form on nerve roots in the spine, causing pain, weakness, and sensory abnormalities. (টারলোভ সিস্ট হল তরল-ভরা থলি যা মেরুদন্ডের স্নায়ুর শিকড়ে গঠন করতে পারে, যার ফলে ব্যথা, দুর্বলতা এবং সংবেদনশীল অস্বাভাবিকতা দেখা দেয়।)', 32);
INSERT INTO `organ_problem_speci` (`id`, `created_at`, `updated_at`, `deleted_at`, `problem`, `problem_specification`, `organ_id`) VALUES
(322, '2024-01-04 14:28:29.306668', NULL, NULL, 'Osteoarthritis (অস্টিওআর্থারাইটিস)', 'Degeneration of joint cartilage and underlying bone, leading to pain, swelling, and reduced joint mobility. (জয়েন্ট কার্টিলেজ এবং অন্তর্নিহিত হাড়ের অবক্ষয়, যার ফলে ব্যথা, ফোলাভাব এবং জয়েন্টের গতিশীলতা হ্রাস পায়।)', 34),
(323, '2024-01-04 14:28:29.317638', NULL, NULL, 'Rheumatoid Arthritis (রিউমাটয়েড আর্থ্রাইটিস)', 'Autoimmune disorder causing inflammation of joint synovium, leading to pain, stiffness, and joint deformities. (অটোইমিউন ডিসঅর্ডার যা জয়েন্ট সাইনোভিয়ামের প্রদাহ সৃষ্টি করে, যার ফলে ব্যথা, শক্ত হওয়া এবং জয়েন্টের বিকৃতি ঘটে।)', 34),
(324, '2024-01-04 14:28:29.326612', NULL, NULL, 'Gout (গাউট)', 'Buildup of uric acid crystals in joints, causing sudden, intense pain and inflammation. (জয়েন্টগুলোতে ইউরিক অ্যাসিড স্ফটিক তৈরি হয়, যা হঠাৎ, তীব্র ব্যথা এবং প্রদাহ সৃষ্টি করে।)', 34),
(325, '2024-01-04 14:28:29.333600', NULL, NULL, 'Bursitis (বারসাইটিস)', 'Inflammation of the bursae (fluid-filled sacs), causing pain and swelling in the joints. (বারসার প্রদাহ (তরল ভরা থলি), যার ফলে জয়েন্টগুলোতে ব্যথা এবং ফোলাভাব হয়।)', 34),
(326, '2024-01-04 14:28:29.340576', NULL, NULL, 'Tendonitis (টেন্ডোনাইটিস)', 'Inflammation of tendons, leading to pain and restricted movement in the joints. (টেন্ডনের প্রদাহ, জয়েন্টগুলোতে ব্যথা এবং সীমিত নড়াচড়ার দিকে পরিচালিত করে।)', 34),
(327, '2024-01-04 14:28:29.357530', NULL, NULL, 'Ligament Sprain (লিগামেন্ট স্প্রেইন)', 'Stretching or tearing of ligaments supporting joints, resulting in pain, swelling, and instability. (জয়েন্টগুলিকে সমর্থনকারী লিগামেন্টগুলি প্রসারিত করা বা ছিঁড়ে যাওয়া, যার ফলে ব্যথা, ফুলে যাওয়া এবং অস্থিরতা দেখা দেয়।)', 34),
(328, '2024-01-04 14:28:29.366507', NULL, NULL, 'Meniscus Tear (মেনিস্কাস টিয়ার)', 'Tearing of the meniscus cartilage in the knee, causing pain, swelling, and limited joint movement. (হাঁটুতে মেনিস্কাস কার্টিলেজ ছিঁড়ে যাওয়া, ব্যথা, ফোলা এবং সীমিত জয়েন্ট নড়াচড়ার কারণ।)', 34),
(329, '2024-01-04 14:28:29.375497', NULL, NULL, 'Synovitis (সাইনোভাইটিস)', 'Inflammation of the synovial membrane in joints, leading to pain, swelling, and stiffness. (জয়েন্টগুলোতে সাইনোভিয়াল ঝিল্লির প্রদাহ, যার ফলে ব্যথা, ফোলাভাব এবং শক্ত হয়ে যায়।)', 34),
(330, '2024-01-04 14:28:29.384459', NULL, NULL, 'Joint Infection (জয়েন্ট ইনফেকশন)', 'Infection affecting joints, causing pain, swelling, and potential joint damage. (সংক্রমণ জয়েন্টগুলিকে প্রভাবিত করে, যার ফলে ব্যথা, ফোলাভাব এবং সম্ভাব্য জয়েন্টের ক্ষতি হয়।)', 34),
(331, '2024-01-04 14:30:47.969130', NULL, NULL, 'Osteoporosis-Related Joint Problems (অস্টিওপোরোসিস-সম্পর্কিত জয়েন্ট সমস্যা)', 'Weakening of bones, including joints, leading to an increased risk of fractures and joint-related issues. (জয়েন্টগুলি সহ হাড়ের দুর্বলতা, হাড় ভাঙার ঝুঁকি এবং জয়েন্ট-সম্পর্কিত সমস্যাগুলির দিকে পরিচালিত করে।)', 34),
(332, '2024-01-04 14:39:16.792377', NULL, NULL, 'Leukemia (লিউকেমিয়া)', 'Cancer of the blood-forming tissues, including bone marrow, leading to the overproduction of abnormal white blood cells. (অস্থি মজ্জা সহ রক্ত ​​গঠনকারী টিস্যুগুলির ক্যান্সার, যা অস্বাভাবিক শ্বেত রক্ত ​​​​কোষের অতিরিক্ত উৎপাদনের দিকে পরিচালিত করে।)', 35),
(333, '2024-01-04 14:39:16.800353', NULL, NULL, 'Multiple Myeloma (একাধিক মেলোমা)', 'Cancer that forms in plasma cells, a type of white blood cell found in the bone marrow, leading to weakened bones and other complications. ( ক্যান্সার যা প্লাজমা কোষে তৈরি হয়, অস্থি মজ্জাতে পাওয়া এক ধরনের শ্বেত রক্তকণিকা, যা দুর্বল হাড় এবং অন্যান্য জটিলতার দিকে পরিচালিত করে।)', 35),
(334, '2024-01-04 14:39:16.807334', NULL, NULL, 'Aplastic Anemia', 'A condition where the bone marrow fails to produce an adequate number of blood cells, resulting in fatigue, increased infection risk, and bleeding. (এমন একটি অবস্থা যেখানে অস্থি মজ্জা পর্যাপ্ত সংখ্যক রক্তকণিকা তৈরি করতে ব্যর্থ হয়, যার ফলে ক্লান্তি, সংক্রমণের ঝুঁকি বেড়ে যায় এবং রক্তপাত হয়।)', 35),
(335, '2024-01-04 14:39:16.819302', NULL, NULL, 'Myelodysplastic Syndromes (MDS) (মাইলোডিসপ্লাস্টিক সিনড্রোম (এমডিএস))', 'Disorders caused by poorly formed or dysfunctional blood cells, often leading to anemia, infection, and bleeding issues. (দুর্বলভাবে গঠিত বা অকার্যকর রক্তকণিকার কারণে সৃষ্ট ব্যাধি, যা প্রায়ই রক্তাল্পতা, সংক্রমণ এবং রক্তপাতের সমস্যার দিকে পরিচালিত করে।)', 35),
(336, '2024-01-04 14:39:16.824290', NULL, NULL, 'Polycythemia Vera (পলিসিথেমিয়া ভেরা)', 'Overproduction of red blood cells in the bone marrow, leading to thickened blood and increased risk of clotting. (অস্থি মজ্জাতে লোহিত রক্তকণিকার অতিরিক্ত উৎপাদন, যার ফলে রক্ত ​​ঘন হয়ে যায় এবং জমাট বাঁধার ঝুঁকি বেড়ে যায়।)', 35),
(337, '2024-01-04 14:39:16.829277', NULL, NULL, 'Hairy Cell Leukemia (হেয়ারি সেল লিউকেমিয়া)', 'A rare type of leukemia affecting B cells in the bone marrow, leading to low blood counts and an enlarged spleen. (একটি বিরল ধরনের লিউকেমিয়া অস্থি মজ্জার বি কোষকে প্রভাবিত করে, যার ফলে রক্তের সংখ্যা কম হয় এবং প্লীহা বড় হয়।)', 35),
(338, '2024-01-04 14:39:16.835260', NULL, NULL, 'Bone Marrow Fibrosis (অস্থি মজ্জা ফাইব্রোসিস)', 'Abnormal formation of fibrous tissue in the bone marrow, affecting blood cell production and leading to organ dysfunction. (অস্থি মজ্জাতে ফাইব্রাস টিস্যুর অস্বাভাবিক গঠন, রক্তকণিকা উৎপাদনকে প্রভাবিত করে এবং অঙ্গের কর্মহীনতার দিকে পরিচালিত করে।)', 35),
(339, '2024-01-04 14:39:16.840246', NULL, NULL, 'Macrophage Activation Syndrome (MAS) (ম্যাক্রোফেজ অ্যাক্টিভেশন সিন্ড্রোম (এমএএস))', 'Overactivation of immune cells in the bone marrow, causing systemic inflammation and organ damage. (অস্থি মজ্জাতে ইমিউন কোষের অত্যধিক সক্রিয়করণ, যা সিস্টেমিক প্রদাহ এবং অঙ্গের ক্ষতি করে।)', 35),
(340, '2024-01-04 14:39:16.844235', NULL, NULL, 'Chronic Myelomonocytic Leukemia (CMML) (ক্রনিক মাইলোমোনোসাইটিক লিউকেমিয়া (CMML))', 'A type of leukemia characterized by an increase in monocytes in the bone marrow, leading to various blood-related issues. (এক ধরনের লিউকেমিয়া অস্থি মজ্জাতে মনোসাইট বৃদ্ধির দ্বারা চিহ্নিত করা হয়, যা বিভিন্ন রক্ত-সম্পর্কিত সমস্যার দিকে পরিচালিত করে।)', 35),
(341, '2024-01-04 14:39:16.849222', NULL, NULL, 'Erythropoietic Protoporphyria (EPP) (এরিথ্রোপয়েটিক প্রোটোপোরফাইরিয়া (ইপিপি))', 'A rare genetic disorder affecting heme production in the bone marrow, leading to photosensitivity and skin-related symptoms. (একটি বিরল জেনেটিক ব্যাধি যা অস্থি মজ্জাতে হিম উৎপাদনকে প্রভাবিত করে, যা আলোক সংবেদনশীলতা এবং ত্বক-সম্পর্কিত লক্ষণগুলির দিকে পরিচালিত করে।)', 35),
(342, '2024-01-04 14:48:38.208058', NULL, NULL, 'Eczema (Dermatitis) (একজিমা (ডার্মাটাইটিস))', 'Inflammation of the epidermis, causing redness, itching, and the development of rashes (এপিডার্মিসের প্রদাহ, লালভাব, চুলকানি এবং ফুসকুড়ির বিকাশ ঘটায়)', 36),
(343, '2024-01-04 14:48:38.213044', NULL, NULL, 'Psoriasis (সোরিয়াসিস)', 'Chronic autoimmune condition leading to the rapid buildup of skin cells, resulting in scaly, itchy patches on the epidermis. (দীর্ঘস্থায়ী অটোইমিউন অবস্থা যা ত্বকের কোষগুলিকে দ্রুত গঠনের দিকে নিয়ে যায়, যার ফলে এপিডার্মিসে আঁশযুক্ত, চুলকানি প্যাচ হয়।)', 36),
(344, '2024-01-04 14:48:38.218032', NULL, NULL, 'Acne Vulgaris (ব্রণ)', 'Common skin condition characterized by the formation of pimples, blackheads, and whiteheads on the epidermis. (এপিডার্মিসে ব্রণ, ব্ল্যাকহেডস এবং হোয়াইটহেডস গঠনের দ্বারা চিহ্নিত ত্বকের সাধারণ অবস্থা।)', 36),
(345, '2024-01-04 14:48:38.223018', NULL, NULL, 'Contact Dermatitis (ডার্মাটাইটিসা)', 'Skin inflammation caused by contact with irritants or allergens, resulting in redness, itching, and sometimes blisters. (বিরক্তিকর বা অ্যালার্জেনের সংস্পর্শের কারণে ত্বকের প্রদাহ, যার ফলে লালভাব, চুলকানি এবং কখনও কখনও ফোসকা দেখা দেয়।)', 36),
(346, '2024-01-04 14:48:38.229002', NULL, NULL, 'Skin Cancer (Melanoma, Basal Cell Carcinoma, Squamous Cell Carcinoma) (আত্মীয় ক্যান্সার (মেলানোমা, বেসাল সেল কার্সিনোমা, স্কোয়ামাস সেল কার্সিনোমা))', 'Uncontrolled growth of skin cells leading to the formation of cancerous lesions on the epidermis. (ত্বকের কোষের অনিয়ন্ত্রিত বৃদ্ধির ফলে এপিডার্মিসে ক্যান্সারজনিত ক্ষত তৈরি হয়।)', 36),
(347, '2024-01-04 14:48:38.233989', NULL, NULL, 'Rosacea (রোসেসিয়া)', 'Chronic skin condition causing redness, visible blood vessels, and sometimes small, red, pus-filled bumps on the face. (দীর্ঘস্থায়ী ত্বকের অবস্থা যার ফলে লালচেভাব, দৃশ্যমান রক্তনালী, এবং কখনও কখনও মুখে ছোট, লাল, পুঁজ-ভরা দাগ দেখা দেয়।)', 36),
(348, '2024-01-04 14:48:38.238974', NULL, NULL, 'Ichthyosis (ইচথিওসিস)', 'Genetic skin disorder characterized by dry, scaly skin due to the accumulation of dead skin cells on the epidermis. (এপিডার্মিসে মৃত ত্বকের কোষ জমে থাকার কারণে শুষ্ক, আঁশযুক্ত ত্বক দ্বারা চিহ্নিত জিনগত ত্বকের ব্যাধি।)', 36),
(349, '2024-01-04 14:51:37.617944', NULL, NULL, 'Vitiligo (ভিটিলিগো)', 'Loss of skin color in patches, occurs when pigment-producing cells in the epidermis are destroyed. (প্যাচগুলিতে ত্বকের রঙের ক্ষতি ঘটে, যখন এপিডার্মিসের রঙ্গক-উৎপাদনকারী কোষগুলি ধ্বংস হয়ে যায়।)', 36),
(350, '2024-01-04 14:51:37.625924', NULL, NULL, 'Impetigo (ইমপেটিগো)', 'Contagious bacterial skin infection causing red sores and blisters, often seen in children. (সংক্রামক ব্যাকটেরিয়াজনিত ত্বকের সংক্রমণ যা লাল ঘা এবং ফোস্কা সৃষ্টি করে, প্রায়শই শিশুদের মধ্যে দেখা যায়।)', 36),
(351, '2024-01-04 14:51:37.631908', NULL, NULL, 'Pruritus (Itching) (প্রুরিটাস (চুলকানি))', 'Persistent itching of the skin, often a symptom of an underlying skin condition or systemic disease. (ত্বকের ক্রমাগত চুলকানি, প্রায়ই একটি অন্তর্নিহিত ত্বকের অবস্থা বা সিস্টেমিক রোগের লক্ষণ।)', 36),
(352, '2024-01-04 14:57:08.539511', NULL, NULL, 'Dermal Abscess (ডার্মাল অ্যাবসেস)', 'Collection of pus within the dermis, often caused by bacterial infection, resulting in a painful, swollen lump. (ডার্মিসের মধ্যে পুঁজ সংগ্রহ, প্রায়শই ব্যাকটেরিয়া সংক্রমণের কারণে হয়, যার ফলে একটি বেদনাদায়ক, ফোলা পিণ্ড হয়।)', 37),
(353, '2024-01-04 14:57:08.545495', NULL, NULL, 'Cellulitis (সেলুলাইটিস)', 'Bacterial infection affecting the dermis and subcutaneous tissues, leading to redness, warmth, and swelling. (ব্যাকটেরিয়া সংক্রমণ ডার্মিস এবং ত্বকের নিচের টিস্যুগুলিকে প্রভাবিত করে, যার ফলে লালভাব, উষ্ণতা এবং ফোলাভাব দেখা দেয়।)', 37),
(354, '2024-01-04 14:57:08.552477', NULL, NULL, 'Hives (Urticaria) (আমবাত (আর্টিকারিয়া))', 'Allergic reaction causing itchy, raised welts on the skin due to the release of histamine in the dermis. (ডার্মিসে হিস্টামিন নিঃসরণের কারণে ত্বকে চুলকানি, উত্থিত ওয়েল্টস সৃষ্টি করে অ্যালার্জির প্রতিক্রিয়া।)', 37),
(355, '2024-01-04 15:02:09.780811', NULL, NULL, 'Dermal Hematoma (ডার্মাল হেমাটোমা)', 'Blood accumulation within the dermal tissue, usually caused by trauma or injury. (ডার্মাল টিস্যুর মধ্যে রক্ত ​​জমে, সাধারণত আঘাত বা আঘাতের কারণে।)', 37),
(356, '2024-01-04 15:02:09.790885', NULL, NULL, 'Dermal Cyst (ডার্মাল সিস্ট)', 'Fluid-filled sac within the dermis, often benign but may require removal if causing discomfort. (ডার্মিসের মধ্যে তরল-ভরা থলি, প্রায়ই সৌম্য কিন্তু অস্বস্তির কারণ হলে অপসারণের প্রয়োজন হতে পারে।)', 37),
(357, '2024-01-04 15:02:09.795867', NULL, NULL, 'Granuloma Annulare (গ্রানুলোমা অ্যানুলারে)', 'Chronic skin condition characterized by the formation of raised, reddish bumps in the dermal layer. (দীর্ঘস্থায়ী ত্বকের অবস্থা যা ত্বকের স্তরে উত্থিত, লালচে আঁচড়ের গঠন দ্বারা চিহ্নিত করা হয়।)', 37),
(358, '2024-01-04 15:02:09.800854', NULL, NULL, 'Scleroderma (স্ক্লেরোডার্মা)', 'Autoimmune disorder causing thickening and hardening of the skin due to excess collagen production in the dermis. (অটোইমিউন ডিসঅর্ডার ডার্মিসে অতিরিক্ত কোলাজেন উৎপাদনের কারণে ত্বক ঘন এবং শক্ত হয়ে যায়।)', 37),
(359, '2024-01-04 15:02:09.806839', NULL, NULL, 'Dermal Ulcer (ডার্মাল আলসার)', ' Open sore or wound affecting the dermal layer, often associated with poor blood circulation. (খোলা কালশিটে বা ক্ষত ত্বকের স্তরকে প্রভাবিত করে, যা প্রায়ই দুর্বল রক্ত ​​সঞ্চালনের সাথে যুক্ত।)', 37),
(360, '2024-01-04 15:02:09.811824', NULL, NULL, 'Dermatofibroma (ডার্মাটোফাইব্রোমা)', 'Non-cancerous skin growth in the dermis, typically firm to the touch and brownish in color. (ডার্মিসে ক্যান্সারবিহীন ত্বকের বৃদ্ধি, সাধারণত স্পর্শে দৃঢ় এবং বাদামী রঙের।)', 37),
(361, '2024-01-04 15:02:09.816812', NULL, NULL, 'Dermal Necrosis (ডার্মাল নেক্রোসিস)', 'Death of skin tissue in the dermal layer, often caused by inadequate blood supply. (ত্বকের স্তরে ত্বকের টিস্যুর মৃত্যু, প্রায়ই অপর্যাপ্ত রক্ত ​​সরবরাহের কারণে ঘটে।)', 37),
(362, '2024-01-04 15:10:43.648577', NULL, NULL, 'Lipoma (লিপোমা)', 'Benign growth of fat cells in the subcutaneous tissue, forming soft, movable lumps beneath the skin. (ত্বকের নিচের টিস্যুতে চর্বি কোষের সৌম্য বৃদ্ধি, ত্বকের নিচে নরম, চলমান পিণ্ড তৈরি করে।)', 38),
(363, '2024-01-04 15:10:43.656555', NULL, NULL, 'Cellulitis (সেলুলাইটিস)', 'Bacterial infection of the subcutaneous tissue, causing redness, swelling, and tenderness. (ত্বকের নিচের টিস্যুর ব্যাকটেরিয়া সংক্রমণ, লালভাব, ফোলাভাব এবং কোমলতা সৃষ্টি করে।)', 38),
(364, '2024-01-04 15:10:43.669518', NULL, NULL, 'Hypodermic Abscess (হাইপোডার্মিক অ্যাবসেস)', 'Collection of pus within the subcutaneous tissue, often resulting from bacterial infection. (সাবকিউটেনিয়াস টিস্যুর মধ্যে পুঁজ সংগ্রহ, প্রায়ই ব্যাকটেরিয়া সংক্রমণের ফলে।)', 38),
(365, '2024-01-04 15:10:43.711406', NULL, NULL, 'Panniculitis (প্যানিকুলাইটিস)', ' Inflammation of the subcutaneous fat, leading to painful nodules or lumps (সাবকুটেনিয়াস ফ্যাটের প্রদাহ, যা বেদনাদায়ক নোডুলস বা পিণ্ডের দিকে পরিচালিত করে।)', 38),
(366, '2024-01-04 15:10:43.751298', NULL, NULL, 'Subcutaneous Hematoma (সাবকুটেনিয়াস হেমাটোমা)', 'Accumulation of blood in the subcutaneous tissue, usually caused by trauma or injury. (সাবকুটেনিয়াস টিস্যুতে রক্ত ​​জমে, সাধারণত আঘাত বা আঘাতের কারণে হয়।)', 38),
(367, '2024-01-04 15:10:43.758280', NULL, NULL, 'Erythema Nodosum (এরিথেমা নোডোসাম)', 'Inflammatory condition affecting the subcutaneous fat, causing tender, red nodules, often associated with underlying systemic conditions. (প্রদাহজনক অবস্থা যা ত্বকের নিচের চর্বিকে প্রভাবিত করে, যার ফলে কোমল, লাল নোডিউল হয়, যা প্রায়ই অন্তর্নিহিত সিস্টেমিক অবস্থার সাথে যুক্ত।)', 38),
(368, '2024-01-04 15:10:43.763266', NULL, NULL, 'Hidradenitis Suppurativa (হাইড্রাডেনাইটিস)', 'Chronic skin condition characterized by inflamed hair follicles and abscesses in the subcutaneous tissue, usually in areas with skin folds. (দীর্ঘস্থায়ী ত্বকের অবস্থা যা ত্বকের নিচের টিস্যুতে স্ফীত লোমকূপ এবং ফোড়া দ্বারা চিহ্নিত করা হয়, সাধারণত ত্বকের ভাঁজযুক্ত অঞ্চলে।)', 38),
(369, '2024-01-04 15:10:43.772248', NULL, NULL, 'Scleroderma (Subcutaneous Variant) (স্ক্লেরোডার্মা (সাবকুটেনিয়াস ভ্যারিয়েন্ট))', 'Rare form of scleroderma affecting the subcutaneous tissue, leading to hardening and thickening of the skin. (স্ক্লেরোডার্মার বিরল রূপ যা ত্বকের নিচের টিস্যুকে প্রভাবিত করে, যা ত্বককে শক্ত ও ঘন করে তোলে।)', 38),
(370, '2024-01-04 15:10:43.778226', NULL, NULL, 'Subcutaneous Emphysema', 'Presence of air in the subcutaneous tissue, often visible as swelling and a crackling sensation upon touch. (সাবকুটেনিয়াস টিস্যুতে বাতাসের উপস্থিতি, প্রায়শই ফোলা হিসাবে দৃশ্যমান হয় এবং স্পর্শে কর্কশ সংবেদন হয়।)', 38),
(371, '2024-01-04 15:10:43.792189', '2024-01-04 15:11:27.585915', NULL, 'Lipoatrophy (লিপোএট্রফি)', 'Loss of subcutaneous fat, resulting in localized or generalized depressions in the skin. (ত্বকের নিচের চর্বি হ্রাস, যার ফলে ত্বকে স্থানীয় বা সাধারণ বিষণ্নতা দেখা দেয়।)', 38);

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
(1, '2024-01-03 12:26:15.151789', '2024-01-03 18:27:11.387022', NULL, '0', 1, 1),
(2, '2024-01-04 09:55:54.628081', '2024-01-05 00:26:13.003608', NULL, '593202', 1, 2),
(3, '2024-01-04 10:16:07.347051', NULL, NULL, '0', 1, 3),
(4, '2024-01-04 11:42:11.379998', NULL, NULL, '0', 1, 4),
(5, '2024-01-04 11:43:53.045858', NULL, NULL, '0', 1, 5);

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
(1, '2024-01-04 09:55:54.674954', NULL, NULL, 'Bancharampur', 5, 28, 5, 211, 2),
(2, '2024-01-04 10:16:07.366004', NULL, NULL, 'Sint culpa repudia', 26, 52, 7, 446, 3),
(3, '2024-01-04 11:42:11.458785', NULL, NULL, 'Quis dignissimos vol', 50, 40, 6, 360, 4),
(4, '2024-01-04 11:43:53.367995', NULL, NULL, 'Neque qui sit dolore', 97, 29, 5, 222, 5);

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
(5, '2024-01-04 10:05:16.451331', NULL, NULL, 1, NULL, 4, 5, 1),
(6, '2024-01-04 10:17:41.167258', NULL, NULL, 1, NULL, 18, 12, 2),
(7, '2024-01-04 11:45:57.030771', NULL, NULL, 8, NULL, 7, 212, 25),
(8, '2024-01-04 11:49:48.318457', NULL, NULL, 8, NULL, 7, 212, 25),
(9, '2024-01-04 13:22:02.346601', NULL, NULL, 3, NULL, 1, 64, 7);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_for_lab_test`
--

CREATE TABLE `prescription_for_lab_test` (
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
-- Table structure for table `prescription_for_medicine`
--

CREATE TABLE `prescription_for_medicine` (
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
(1, '2024-01-04 09:55:54.658996', NULL, NULL, 'Bancharampur', 52, 2, 1, 8, 2),
(2, '2024-01-04 10:16:07.364004', NULL, NULL, 'Qui in in optio dui', 81, 29, 5, 221, 3),
(3, '2024-01-04 11:42:11.443827', NULL, NULL, 'Quo deleniti volupta', 82, 2, 1, 7, 4),
(4, '2024-01-04 11:43:53.367001', NULL, NULL, 'Amet et eveniet qu', 38, 19, 3, 143, 5);

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
-- Table structure for table `specification`
--

CREATE TABLE `specification` (
  `id` bigint(20) NOT NULL,
  `accuracy` decimal(10,3) DEFAULT NULL,
  `prediction_id` bigint(20) DEFAULT NULL,
  `problem_specification_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`id`, `accuracy`, `prediction_id`, `problem_specification_id`) VALUES
(1, NULL, 1, 1),
(2, NULL, 2, 2),
(3, NULL, 3, 3),
(4, NULL, 4, 4),
(5, NULL, 5, 5),
(6, '1.000', 6, 12),
(7, '0.000', 7, 212),
(8, '0.000', 7, 213),
(9, '1.000', 8, 212),
(10, '0.000', 9, 64);

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
  `password` varchar(255) NOT NULL,
  `hash` varchar(64) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_at`, `updated_at`, `deleted_at`, `user_name`, `email`, `password`, `hash`, `role`, `status`) VALUES
(1, '2024-01-03 12:26:15.130846', NULL, NULL, 'admin', 'mamunmiaturan@gmail.com', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', 'active'),
(2, '2024-01-04 09:55:54.624091', NULL, NULL, 'doctor1', 'doctor1@gmail.com.com', '0123456789', '84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', 'doctor', 'active'),
(3, '2024-01-04 10:16:07.343059', NULL, NULL, 'doctor2', 'doctor2@gmail.com.com', '0123456789', '84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', 'doctor', 'active'),
(4, '2024-01-04 11:42:11.376007', NULL, NULL, 'doctor3', 'doctor3@gmail.com.com', '0123456789', '84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', 'doctor', 'active'),
(5, '2024-01-04 11:43:53.042867', NULL, NULL, 'doctor4', 'doctor4@gmail.com.com', '0123456789', '84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', 'doctor', 'active');

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
  ADD KEY `doctor_appointment_schedule_created_by_id_07123948_fk_user_id` (`created_by_id`),
  ADD KEY `doctor_appointment_schedule_modified_by_id_0536e92f_fk_user_id` (`modified_by_id`),
  ADD KEY `doctor_appointment_s_doctor_profile_id_e7c71ff8_fk_doctor_pr` (`doctor_profile_id`);

--
-- Indexes for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_awards_created_by_id_4cd1bfbe_fk_user_id` (`created_by_id`),
  ADD KEY `doctor_awards_modified_by_id_e6c328bb_fk_user_id` (`modified_by_id`),
  ADD KEY `doctor_awards_doctor_profile_id_48d2d29b_fk_doctor_profile_id` (`doctor_profile_id`);

--
-- Indexes for table `doctor_educations`
--
ALTER TABLE `doctor_educations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_educations_board_id_c79ab04b_fk_board_id` (`board_id`),
  ADD KEY `doctor_educations_doctor_profile_id_229d8373_fk_doctor_pr` (`doctor_profile_id`);

--
-- Indexes for table `doctor_off_day`
--
ALTER TABLE `doctor_off_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_off_day_created_by_id_9ecd5442_fk_user_id` (`created_by_id`),
  ADD KEY `doctor_off_day_doctor_profile_id_599d7342_fk_doctor_profile_id` (`doctor_profile_id`),
  ADD KEY `doctor_off_day_modified_by_id_333cba54_fk_user_id` (`modified_by_id`),
  ADD KEY `doctor_off_day_off_day_id_ffcca83b_fk_days_id` (`off_day_id`);

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
-- Indexes for table `lab_test_prescription`
--
ALTER TABLE `lab_test_prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_test_prescription_created_by_id_782a713d_fk_user_id` (`created_by_id`),
  ADD KEY `lab_test_prescription_lab_test_id_6014dcc1_fk_lab_test_id` (`lab_test_id`),
  ADD KEY `lab_test_prescription_modified_by_id_055cd99c_fk_user_id` (`modified_by_id`),
  ADD KEY `lab_test_prescriptio_lab_prescription_id_7fe85013_fk_prescript` (`lab_prescription_id`);

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
  ADD KEY `medicine_modified_by_id_e885a48c_fk_user_id` (`modified_by_id`),
  ADD KEY `medicine_medicine_type_id_d22bcead_fk_medicine_type_id` (`medicine_type_id`),
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
-- Indexes for table `medicine_prescription`
--
ALTER TABLE `medicine_prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_prescription_created_by_id_3865a48e_fk_user_id` (`created_by_id`),
  ADD KEY `medicine_prescription_medicine_id_74fda704_fk_medicine_id` (`medicine_id`),
  ADD KEY `medicine_prescriptio_medicine_schedule_id_3e7e98bf_fk_medicine_` (`medicine_schedule_id`),
  ADD KEY `medicine_prescription_modified_by_id_2021769b_fk_user_id` (`modified_by_id`),
  ADD KEY `medicine_prescriptio_prescription_id_8d96c710_fk_prescript` (`prescription_id`);

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
-- Indexes for table `prescription_for_lab_test`
--
ALTER TABLE `prescription_for_lab_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_for_lab_test_created_by_id_d69fbaac_fk_user_id` (`created_by_id`),
  ADD KEY `prescription_for_lab_doctor_profile_id_903338e0_fk_doctor_pr` (`doctor_profile_id`),
  ADD KEY `prescription_for_lab_test_modified_by_id_e6156b35_fk_user_id` (`modified_by_id`),
  ADD KEY `prescription_for_lab_patient_profile_id_f6c86607_fk_patient_p` (`patient_profile_id`);

--
-- Indexes for table `prescription_for_medicine`
--
ALTER TABLE `prescription_for_medicine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_for_medicine_created_by_id_4460f0c5_fk_user_id` (`created_by_id`),
  ADD KEY `prescription_for_med_doctor_profile_id_2b12ac1d_fk_doctor_pr` (`doctor_profile_id`),
  ADD KEY `prescription_for_medicine_modified_by_id_62638823_fk_user_id` (`modified_by_id`),
  ADD KEY `prescription_for_med_patient_profile_id_475486f6_fk_patient_p` (`patient_profile_id`);

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
-- Indexes for table `specification`
--
ALTER TABLE `specification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specification_prediction_id_d014949a_fk_prediction_id` (`prediction_id`),
  ADD KEY `specification_problem_specificatio_9db51dd9_fk_organ_pro` (`problem_specification_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `department_speci`
--
ALTER TABLE `department_speci`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `doctor_appointment_schedule`
--
ALTER TABLE `doctor_appointment_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_awards`
--
ALTER TABLE `doctor_awards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_educations`
--
ALTER TABLE `doctor_educations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_off_day`
--
ALTER TABLE `doctor_off_day`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_profile`
--
ALTER TABLE `doctor_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor_schedule_times`
--
ALTER TABLE `doctor_schedule_times`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_social_media`
--
ALTER TABLE `doctor_social_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lab_test`
--
ALTER TABLE `lab_test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lab_test_prescription`
--
ALTER TABLE `lab_test_prescription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `medicine_prescription`
--
ALTER TABLE `medicine_prescription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `organ`
--
ALTER TABLE `organ`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `organ_problem_speci`
--
ALTER TABLE `organ_problem_speci`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient_appointment`
--
ALTER TABLE `patient_appointment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_profile`
--
ALTER TABLE `patient_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permanent_address`
--
ALTER TABLE `permanent_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prediction`
--
ALTER TABLE `prediction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prescription_for_lab_test`
--
ALTER TABLE `prescription_for_lab_test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_for_medicine`
--
ALTER TABLE `prescription_for_medicine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `present_address`
--
ALTER TABLE `present_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `religion`
--
ALTER TABLE `religion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `specification`
--
ALTER TABLE `specification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `upazila`
--
ALTER TABLE `upazila`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `doctor_off_day`
--
ALTER TABLE `doctor_off_day`
  ADD CONSTRAINT `doctor_off_day_created_by_id_9ecd5442_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_off_day_doctor_profile_id_599d7342_fk_doctor_profile_id` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `doctor_off_day_modified_by_id_333cba54_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_off_day_off_day_id_ffcca83b_fk_days_id` FOREIGN KEY (`off_day_id`) REFERENCES `days` (`id`);

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
-- Constraints for table `lab_test_prescription`
--
ALTER TABLE `lab_test_prescription`
  ADD CONSTRAINT `lab_test_prescriptio_lab_prescription_id_7fe85013_fk_prescript` FOREIGN KEY (`lab_prescription_id`) REFERENCES `prescription_for_lab_test` (`id`),
  ADD CONSTRAINT `lab_test_prescription_created_by_id_782a713d_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `lab_test_prescription_lab_test_id_6014dcc1_fk_lab_test_id` FOREIGN KEY (`lab_test_id`) REFERENCES `lab_test` (`id`),
  ADD CONSTRAINT `lab_test_prescription_modified_by_id_055cd99c_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

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
-- Constraints for table `medicine_prescription`
--
ALTER TABLE `medicine_prescription`
  ADD CONSTRAINT `medicine_prescriptio_medicine_schedule_id_3e7e98bf_fk_medicine_` FOREIGN KEY (`medicine_schedule_id`) REFERENCES `medicine_schedule` (`id`),
  ADD CONSTRAINT `medicine_prescriptio_prescription_id_8d96c710_fk_prescript` FOREIGN KEY (`prescription_id`) REFERENCES `prescription_for_medicine` (`id`),
  ADD CONSTRAINT `medicine_prescription_created_by_id_3865a48e_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medicine_prescription_medicine_id_74fda704_fk_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  ADD CONSTRAINT `medicine_prescription_modified_by_id_2021769b_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

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
-- Constraints for table `prediction`
--
ALTER TABLE `prediction`
  ADD CONSTRAINT `prediction_body_part_id_38a9b3c2_fk_body_part_id` FOREIGN KEY (`body_part_id`) REFERENCES `body_part` (`id`),
  ADD CONSTRAINT `prediction_created_by_id_dcb9923e_fk_patient_profile_id` FOREIGN KEY (`created_by_id`) REFERENCES `patient_profile` (`id`),
  ADD CONSTRAINT `prediction_department_id_a5dabb64_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `prediction_department_speci_id_03db92a4_fk_department_speci_id` FOREIGN KEY (`department_speci_id`) REFERENCES `department_speci` (`id`),
  ADD CONSTRAINT `prediction_organ_id_87623336_fk_organ_id` FOREIGN KEY (`organ_id`) REFERENCES `organ` (`id`);

--
-- Constraints for table `prescription_for_lab_test`
--
ALTER TABLE `prescription_for_lab_test`
  ADD CONSTRAINT `prescription_for_lab_doctor_profile_id_903338e0_fk_doctor_pr` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `prescription_for_lab_patient_profile_id_f6c86607_fk_patient_p` FOREIGN KEY (`patient_profile_id`) REFERENCES `patient_profile` (`id`),
  ADD CONSTRAINT `prescription_for_lab_test_created_by_id_d69fbaac_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_for_lab_test_modified_by_id_e6156b35_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `prescription_for_medicine`
--
ALTER TABLE `prescription_for_medicine`
  ADD CONSTRAINT `prescription_for_med_doctor_profile_id_2b12ac1d_fk_doctor_pr` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profile` (`id`),
  ADD CONSTRAINT `prescription_for_med_patient_profile_id_475486f6_fk_patient_p` FOREIGN KEY (`patient_profile_id`) REFERENCES `patient_profile` (`id`),
  ADD CONSTRAINT `prescription_for_medicine_created_by_id_4460f0c5_fk_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_for_medicine_modified_by_id_62638823_fk_user_id` FOREIGN KEY (`modified_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `present_address`
--
ALTER TABLE `present_address`
  ADD CONSTRAINT `present_address_present_district_id_96ab1d03_fk_district_id` FOREIGN KEY (`present_district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `present_address_present_division_id_4c3ef850_fk_division_id` FOREIGN KEY (`present_division_id`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `present_address_present_upazila_id_6403653a_fk_upazila_id` FOREIGN KEY (`present_upazila_id`) REFERENCES `upazila` (`id`),
  ADD CONSTRAINT `present_address_user_id_dfc03294_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `specification`
--
ALTER TABLE `specification`
  ADD CONSTRAINT `specification_prediction_id_d014949a_fk_prediction_id` FOREIGN KEY (`prediction_id`) REFERENCES `prediction` (`id`),
  ADD CONSTRAINT `specification_problem_specificatio_9db51dd9_fk_organ_pro` FOREIGN KEY (`problem_specification_id`) REFERENCES `organ_problem_speci` (`id`);

--
-- Constraints for table `upazila`
--
ALTER TABLE `upazila`
  ADD CONSTRAINT `upazila_district_id_d82ee865_fk_district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
