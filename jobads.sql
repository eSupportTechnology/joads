-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 20, 2025 at 03:46 AM
-- Server version: 10.6.21-MariaDB-cll-lve-log
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsgcuuta_jobads`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'Jobads.lk isn’t just another job portal — it’s a revolutionary approach to hiring and job hunting. Leveraging smart technology, Jobads.lk streamlines the entire recruitment journey, making it faster, smarter, and more effective for both employers and job seekers. Whether you\'re a business eager to find the right talent or a professional on the hunt for your next opportunity, Jobads.lk brings everything you need into one powerful platform. Step into the future of recruitment — join the Jobads.lk community today.', '2025-01-27 20:52:03', '2025-04-20 21:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `role` enum('super_admin','admin') NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `contact`, `is_active`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$tv67ah7ZbeT0xmp1cMHk..iYVQaEGtg8rPdxVfvawndh2U6iBLDsy', '0752076892', 1, 'super_admin', NULL, '2025-01-24 04:44:43', '2025-01-24 08:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employer_id` bigint(20) UNSIGNED NOT NULL,
  `company_mail` varchar(255) NOT NULL,
  `cv_path` varchar(255) DEFAULT NULL,
  `job_posting_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `name`, `email`, `contact_number`, `message`, `user_id`, `employer_id`, `company_mail`, `cv_path`, `job_posting_id`, `created_at`, `updated_at`) VALUES
(4, 'Sachitha Madhuranga', 'sachithmaduranga2001@gmail.com', '0782020201', NULL, 1, 2, 'kavindu@gmail.com', 'resumes/cv_1_1738899713.pdf', 48, '2025-02-07 08:41:53', '2025-02-07 08:41:53'),
(6, 'Anjana Umayanga Wickramasinghe', 'UmayangaA@icloud.com', '0752238310', 'දුම්රිය නියාමක තනතුර සදහා,', NULL, 27, 'name@gmail.com', '/tmp/phpo90iffd03aqm2zwfya1', 280, '2025-03-11 14:25:19', '2025-03-11 14:25:19'),
(7, 'Chethaka thihara', 'rashuperera2000@gmail.com', '0774702977', 'test1', 31, 27, 'name@gmail.com', 'resumes/cv_31_1742191672.pdf', 300, '2025-03-17 10:07:53', '2025-03-17 10:07:53'),
(8, 'rashmi Sewwandi', 'rashuperera2000@gmail.com', '0714845276', 'Test1', 31, 3, 'madhushan@gmail.com', 'resumes/cv_31_1742192460.pdf', 87, '2025-03-17 10:21:00', '2025-03-17 10:21:00'),
(9, 'dinithi perera', 'rashuperera2000@gmail.com', '0774702977', 'Test 1', 31, 3, 'madhushan@gmail.com', '/tmp/phpa2lld6ukto7161V4vIb', 87, '2025-03-17 10:31:03', '2025-03-17 10:31:03'),
(10, 'test 3', 'rashuperera2000@gmail.com', '0768622255', 'test 3', 31, 3, 'madhushan@gmail.com', '/tmp/phpj4iddvmqcbgg8X4kuGq', 90, '2025-03-17 10:43:29', '2025-03-17 10:43:29'),
(11, 'rashu perera', 'rashuperera2000@gmail.com', '0768622255', 'testing', 31, 27, 'name@gmail.com', 'resumes/cv_31_1742361629.pdf', 101, '2025-03-19 09:20:30', '2025-03-19 09:20:30'),
(12, 'rashu perera', 'rashuperera2000@gmail.com', '0768622255', 'testing', 31, 27, 'name@gmail.com', '/tmp/phpdvddta6seshf0XQrnRE', 102, '2025-03-19 09:22:15', '2025-03-19 09:22:15'),
(13, 'Sachitha Madhuranga', 'sachithmaduranga2001@gmail.com', '0752076892', 'ergthhy', 1, 27, 'name@gmail.com', '/tmp/phpe87ai90l4c447E3jYWl', 102, '2025-03-19 09:25:05', '2025-03-19 09:25:05'),
(14, 'rashu perera', 'rashmiswa09@gmail.com', '0768622255', 'testing', 31, 29, 'rashuperera2000@gmail.com', '/tmp/phpvdluskk12u9caV8nrPi', 323, '2025-03-19 10:03:04', '2025-03-19 10:03:04'),
(15, 'rashu perera2', 'rashmiswa09@gmail.com', '0712445045', 'test 2', 31, 29, 'rashuperera2000@gmail.com', 'resumes/cv_31_1742364246.pdf', 323, '2025-03-19 10:04:07', '2025-03-19 10:04:07'),
(16, 'test 5', 'rashmiswa09@gmail.com', '0712445045', 'hguhk', 31, 29, 'rashuperera2000@gmail.com', 'resumes/cv_31_1742365812.pdf', 323, '2025-03-19 10:30:13', '2025-03-19 10:30:13'),
(17, 'Sachitha Madhuranga', 'sachithmaduranga2001@gmail.com', '0752076892', 'dafbvfdghnghnjgh', 1, 29, 'rashuperera2000@gmail.com', '/tmp/php1nm6liqhksgu6MCHBKq', 323, '2025-03-19 11:19:41', '2025-03-19 11:19:41'),
(18, 'Sachitha Madhuranga', 'sachithmaduranga2001@gmail.com', '0752076892', 'sfgfhytyjut gb gdf', 1, 29, 'rashuperera2000@gmail.com', '/tmp/phpoq7qb0cg6n8tfDoV29o', 323, '2025-03-19 11:27:07', '2025-03-19 11:27:07'),
(19, 'Sachitha Madhuranga', 'sachithmaduranga2001@gmail.com', '0752076892', 'hjyuju7ij87', 1, 27, 'name@gmail.com', 'resumes/cv_1_1742381484.pdf', 162, '2025-03-19 14:51:25', '2025-03-19 14:51:25'),
(20, 'Nuwan Sameera', 'slnuwansameera@gmail.com', '0723864292', 'slnuwansameera@gmail.com', NULL, 27, 'name@gmail.com', '/tmp/phph6bk2c8icohne6aMbXj', 257, '2025-03-23 07:26:27', '2025-03-23 07:26:27'),
(21, 'Eradamanalan dushanthan', 'Dusha0726dusha@gmail.com', '0752691224', 'Any vacancy for education', NULL, 27, 'name@gmail.com', '/tmp/phpiholsikru35l6VMufys', 340, '2025-03-24 13:34:11', '2025-03-24 13:34:11'),
(22, 'Mahesh Perera', 'pamaheshjanaka@gmail.com', '0776366608', 'I\'m interested', NULL, 27, 'name@gmail.com', '/tmp/phphl75nkjl7c100GLaJTk', 334, '2025-03-24 21:42:43', '2025-03-24 21:42:43'),
(23, 'Mahesh Perera', 'pajanakaperera@gmail.com', '0776366608', 'I\'m interested', NULL, 27, 'name@gmail.com', '/tmp/phprt0harkprfph6RviKLx', 343, '2025-03-24 21:46:31', '2025-03-24 21:46:31'),
(24, 'Lakshitha Nuwan', 'lakshitha.nuwan517@gmail.com', '0740992309', 'I’m looking job.', NULL, 27, 'name@gmail.com', '/tmp/phpn2jfjcflsi1p7E1nqDg', 328, '2025-03-25 09:44:12', '2025-03-25 09:44:12'),
(25, 'Hiran Kavindu', 'djhiran6@gmail.com', '0766577375', 'Hello sir any job vacancy', NULL, 27, 'name@gmail.com', '/tmp/phpnjcrmf5v9j33coyTrLt', 335, '2025-03-25 14:18:56', '2025-03-25 14:18:56'),
(26, 'Kavindu Pahasara', 'kavindupahasara100@gmail.com', '0703911457', 'Dear Sir/Madam, \r\n\r\nPlease find my CV attached for the Assistant - Human Resource position. \r\nI look forward to your response.\r\n\r\nBest regards,\r\nPahasara', NULL, 27, 'name@gmail.com', '/tmp/phppf3amrml3acv18Mwyzk', 345, '2025-03-26 16:25:33', '2025-03-26 16:25:33'),
(27, 'Kavindu Pahasara', 'kavindupahasara100@gmail.com', '0703911457', 'Dear Sir/Madam, \r\n\r\nPlease find my CV attached for the Assistant - Human Resource position. \r\nI look forward to your response.\r\n\r\nBest regards,\r\nPahasara', NULL, 27, 'name@gmail.com', '/tmp/phpujffs7rar2p22jRPbDV', 345, '2025-03-26 16:25:37', '2025-03-26 16:25:37'),
(28, 'Kavindu Pahasara', 'kavindupahasara100@gmail.com', '0703911457', 'Dear Sir/Madam, \r\n\r\nPlease find my CV attached for the Assistant - Human Resource position. \r\nI look forward to your response.\r\n\r\nBest regards,\r\nPahasara', NULL, 27, 'name@gmail.com', '/tmp/phpo7cr8q8jp785fLcV5yi', 361, '2025-03-26 16:27:13', '2025-03-26 16:27:13'),
(29, 'H.w.niluka madushani', 'nilu15771@gmail.com', '0764997468', 'Job vacency', NULL, 27, 'name@gmail.com', '/tmp/phph06ohg3igj3d7FgnVBI', 341, '2025-04-18 15:39:38', '2025-04-18 15:39:38'),
(30, 'subanu dasanayaka', 'dsubanu@gmail.com', '0718513126', 'Your welcome', NULL, 27, 'name@gmail.com', '/tmp/phpjha9b46jd91c7gIUHZt', 516, '2025-04-18 20:04:54', '2025-04-18 20:04:54'),
(31, 'subanu dasanayaka', 'dsubanu@gmail.com', '0718513126', 'YOUR WELCOME', NULL, 27, 'name@gmail.com', '/tmp/php8vadqlc1ekhj0wGlXNG', 425, '2025-04-20 10:36:34', '2025-04-20 10:36:34'),
(32, 'R.B.Dinesha sammani', 'Sammanidinesha7@gmail.com', '0778048547', 'I need suitable job', 69, 27, 'name@gmail.com', '/tmp/php6uf3plstilsibEhyP0g', 380, '2025-04-21 13:57:33', '2025-04-21 13:57:33'),
(33, 'Randika dilshan ranasinghe', 'randikadilshan540@gmail.com', '0503013948', 'Good evening', NULL, 27, 'name@gmail.com', '/tmp/phpdv4p7m0fqphn2Fzq9pT', 529, '2025-04-21 16:08:45', '2025-04-21 16:08:45'),
(34, 'Avishka maduranga', 'avishkamchandrasekara@gmail.com', '0740498388', 'I am worke banking training now I like hotel feeld job please give me chance', NULL, 27, 'name@gmail.com', '/tmp/phpnaes53086d9kcqBQXKf', 399, '2025-04-22 15:26:19', '2025-04-22 15:26:19'),
(35, 'Kolitha Amaraweera', 'kolithaamaraweera@ymail.com', '0707114292', 'Dear Sir/Madam\r\n\r\nI am writing to express my interest in the position on your company  . With extensive experience in sales, marketing, insurance, and business development across Sri Lanka, UAE, Qatar, and Saudi Arabia, I am confident in my ability to contribute effectively to your team. My background in leadership, customer relationship management, and strategic planning aligns well with the role’s responsibilities.\r\n\r\nIn my most recent role as an Assistant Field Sales Development Manager at Arpico Insurance, I successfully led teams, developed sales strategies, and maintained high customer retention rates. My ability to source potential leads, train junior agents, and exceed sales targets has been a key part of my success. Additionally, my experience as a Hire Purchase Manager at Softlogic Retail helped me develop strong analytical and financial management skills.\r\n\r\nBeyond sales and management, I bring expertise in IT solutions, including networking, security systems, and structured cabling. My technical knowledge complements my business acumen, allowing me to provide well-rounded solutions to clients.\r\n\r\nI am excited about the opportunity to bring my skills and experience to your company and would welcome the chance to discuss how I can contribute to your success. Please find my resume attached for your review. I look forward to your response.\r\n\r\nThank you for your time and consideration.\r\n\r\nBest regards,\r\nKolitha Amaraweera', NULL, 27, 'name@gmail.com', '/tmp/phpea7mgpt9gtume146cEg', 395, '2025-04-23 09:18:32', '2025-04-23 09:18:32'),
(36, 'D.W.A.C.M.Kumari', 'chamalimadusha86@gmail.com', '0719587951', '.', NULL, 27, 'name@gmail.com', '/tmp/phpmtti6vod1v2vcYskR79', 403, '2025-04-25 11:23:51', '2025-04-25 11:23:51'),
(37, 'D.W.A.C.M Kumari', 'chamalimadusha86@gmail.com', '0719587951', 'This CV for social media management', NULL, 27, 'name@gmail.com', '/tmp/phpjs8g7an6dtqndjdbnvN', 403, '2025-04-25 11:25:48', '2025-04-25 11:25:48'),
(38, 'D.W.A.C.M Kumari', 'chamalimadusha86@gmail.com', '0719587951', 'This CV for social media management', NULL, 27, 'name@gmail.com', '/tmp/phplp6oj9ri22f33OV0d4n', 403, '2025-04-25 11:25:55', '2025-04-25 11:25:55'),
(39, 'Eugenio Pio Hadson Rich', 'hadson555@icloud.com', '0767769322', 'I would like to apply for the above vacancy', NULL, 27, 'name@gmail.com', '/tmp/phpekhrqbcobsui19DCxhx', 395, '2025-04-29 09:44:34', '2025-04-29 09:44:34'),
(40, 'Eugenio Pio Hadson Rich', 'hadson555@icloud.com', '0767769322', 'I would like to apply for this job.', NULL, 66, 'hr.suva@tappoo.com.fj', '/tmp/php8qiutru9pbce1OZb5VX', 591, '2025-04-29 09:47:19', '2025-04-29 09:47:19'),
(41, 'Eugenio Pio Hadson Rich', 'hadson555@icloud.com', '0767769322', 'I would like to apply for this job.', NULL, 66, 'hr.suva@tappoo.com.fj', '/tmp/php8i25mm6tfpovbarioW3', 591, '2025-04-29 09:47:34', '2025-04-29 09:47:34'),
(42, 'Eugenio Pio Hadson Rich', 'hadson555@icloud.com', '0767769322', 'I would like to apply for this job.', NULL, 66, 'hr.suva@tappoo.com.fj', '/tmp/phpt690u898tfn43O4zdMw', 591, '2025-04-29 09:47:55', '2025-04-29 09:47:55'),
(43, 'Eugenio Pio Hadson Rich', 'hadson555@icloud.com', '0767769322', 'I would like to apply for the this job', NULL, 27, 'name@gmail.com', '/tmp/php0p7v9nn3eqna0Pxp2KT', 532, '2025-04-29 09:50:35', '2025-04-29 09:50:35'),
(44, 'Eugenio Pio Hadson Rich', 'hadson555@icloud.com', '0767769322', 'I would like to apply for this job', NULL, 66, 'hr.suva@tappoo.com.fj', '/tmp/phpt90oc80df3ntbxMzrwW', 600, '2025-04-29 09:53:18', '2025-04-29 09:53:18'),
(45, 'Himoshan Hendry', 'himoshanh@gmail.com', '0759031705', 'I’m looking for a work', NULL, 27, 'name@gmail.com', '/tmp/phpj9n3v258ife0fHbzGDb', 378, '2025-04-29 23:08:51', '2025-04-29 23:08:51'),
(46, 'Himoshan Hendry', 'himoshanh@gmail.com', '0759031705', 'I’m looking for a work', NULL, 27, 'name@gmail.com', '/tmp/phpsfjgad3re3il39VfyzJ', 378, '2025-04-29 23:08:53', '2025-04-29 23:08:53'),
(47, 'irfana', 'irfanayacub23@gmail.com', '0766491034', 'I can join immediately', NULL, 55, 'careers@dhl.com', '/tmp/phpvimf6e33un43a9IeiLX', 564, '2025-04-30 09:33:06', '2025-04-30 09:33:06'),
(48, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', 'Dear Sirs \r\nReference to your advertisement \r\nI apply for office assistant', 80, 27, 'name@gmail.com', '/tmp/phpjeajuklgab6sbvbL31m', 420, '2025-04-30 09:54:58', '2025-04-30 09:54:58'),
(49, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', 'Dear Sirs \r\nReference to your advertisement \r\nI apply for office assistant', 80, 27, 'name@gmail.com', '/tmp/phpplu28okfupvvfx1gLGC', 420, '2025-04-30 09:55:01', '2025-04-30 09:55:01'),
(50, 'Madhara Hansalee Premasiri', 'kgmadara97@gmail.com', '0770692628', 'I am eager to express my interest in joining your organization in a suitable position. I am a motivated individual with a strong academic background and practical experience, dedicated to contributing effectively to any team I become a part of.\r\nI have gained valuable experience working in administrative and operational roles where I was responsible for collecting and analyzing production data, preparing operational and project reports, coordinating with teams to optimize processes, and implementing efficiency improvements using modern tools such as Excel. My exposure to both corporate and field environments has developed my skills in data management, workflow coordination, research documentation, and productivity analysis.\r\nAcademically, I have successfully completed a Bachelor of Arts (Hons) in Social Statistics with a Second Class (Upper Division), achieving a GPA of 3.86 from the University of Kelaniya. Additionally, I hold a Diploma in Human Resource Management, further enhancing my understanding of organizational practices and people management. I am confident that my blend of education and experience makes me a strong candidate to contribute positively to your organization.\r\nThank you for considering my application. I look forward to the opportunity to discuss how I can add value to your team.', NULL, 27, 'name@gmail.com', '/tmp/phpph6sobb5dpbbeqHChMO', 404, '2025-04-30 09:56:09', '2025-04-30 09:56:09'),
(51, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', 'Reference to your advertisement', 80, 27, 'name@gmail.com', '/tmp/phpcibereo6g6ju0PSvcZR', 486, '2025-04-30 09:59:12', '2025-04-30 09:59:12'),
(52, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', 'Reference to your advertisement', 80, 27, 'name@gmail.com', '/tmp/phprqh3ga44klvkf63nZHT', 495, '2025-04-30 10:00:45', '2025-04-30 10:00:45'),
(53, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', 'Reference to your advertisement', 80, 66, 'hr.suva@tappoo.com.fj', '/tmp/php415r0kpfl5joaWPo8m6', 591, '2025-04-30 10:06:50', '2025-04-30 10:06:50'),
(54, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', 'Reference to your advertisement', 80, 66, 'hr.suva@tappoo.com.fj', '/tmp/php1onmph07r9349xSs5Ih', 601, '2025-04-30 10:09:01', '2025-04-30 10:09:01'),
(55, 'irfana', 'irfanayacub23@gmail.com', '0766491034', 'Im looking job for immediately', NULL, 27, 'name@gmail.com', '/tmp/php242kf29rc4gi90Sq916', 521, '2025-04-30 10:50:14', '2025-04-30 10:50:14'),
(56, 'Sinnaththurai Nirmalan', 'nimal19910801@gmail.com', '0762626241', 'Hi sir,I have applied for this job', NULL, 27, 'name@gmail.com', '/tmp/phpbbuq5957d57875vcQ3l', 502, '2025-04-30 14:14:35', '2025-04-30 14:14:35'),
(57, 'Mohamed Irham', 'yimirham@gmail.com', '0773388433', 'Dear Recruitment Manager, \r\n\r\nWith reference to the subject and further to a job portal post, I would like to share my details.\r\n\r\nI am an enthusiastic, highly motivated person with an excellent working Knowledge of pre & post construction contracts, and proactive team member with More than 16 years experience of major construction projects including around 11 years in Qatar. I have gained a deep awareness of Commercial, Contract administration, Construction management and IT Skills.\r\n \r\nI am enclosing my resume herewith for your kind perusal.\r\n\r\nI assure that I will render my services to the best of my effort and skills to your Esteemed organization with my hard & bona-fide work. I am looking for an immediate opportunity to prove my worth in your organization.\r\n\r\nThanks & Regards,\r\n\r\nIrham Yoosuf\r\nQuantity Surveyor\r\nColombo, Sri Lanka\r\nMobile: +97 77 338 8433\r\nyimirham@gmail.com', NULL, 27, 'name@gmail.com', '/tmp/php47t9p60f6v51frjNHB9', 398, '2025-04-30 16:05:09', '2025-04-30 16:05:09'),
(58, 'Shanika lakshani', 'lakshanishanika172@gmail.com', '0707434862', 'Graphic design', NULL, 27, 'name@gmail.com', '/tmp/phpsq6lgp7j9dn2eXKNBj7', 385, '2025-04-30 17:55:44', '2025-04-30 17:55:44'),
(59, 'Kodiakara arachchige danushkarathnakumara', 'danushkarathnakumara9@gmail.com', '0765326890', 'Technical officer', NULL, 27, 'name@gmail.com', '/tmp/phpe1ro2ts31jo2baNnS6G', 398, '2025-05-01 03:34:28', '2025-05-01 03:34:28'),
(60, 'Ishan Chinthaka', 'ishanchinthaka2002@gmail.com', '0765274750', 'To Apply Internship', NULL, 27, 'name@gmail.com', '/tmp/php8643527tpgps9Am8J6y', 482, '2025-05-01 06:11:02', '2025-05-01 06:11:02'),
(61, 'Mohamed Rusdy', 'mohamedrusdy882@gmail.com', '0772317176', 'Vacancy for Accounts Executive', NULL, 27, 'name@gmail.com', '/tmp/phpnt6nnbv41aekcjwEXve', 581, '2025-05-01 07:43:19', '2025-05-01 07:43:19'),
(62, 'Priyangika Dissanayake', 'priyangikadissanayake1997@gmail.com', '0702032966', 'Please find the attached CV Accounts Executive', NULL, 59, 'careers@abansgroup.com', '/tmp/php7j2hh2snv87bfajQTFy', 574, '2025-05-01 09:13:14', '2025-05-01 09:13:14'),
(63, 'H.T.N Madhushi', 'nethmamadhushi8@gamil.com', '0767558514', 'S', NULL, 27, 'name@gmail.com', '/tmp/php0edb2tidjuks6nK2Ej6', 380, '2025-05-01 15:43:18', '2025-05-01 15:43:18'),
(64, 'Suraweera Gamage Hasith Chamidu Lakshan', 'hasithl285@gmail.com', '0767827483', 'Qualifications', NULL, 104, 'careers.cblf@cbllk.com', '/tmp/phplsug16235o9t9vr3lae', 668, '2025-05-03 11:42:07', '2025-05-03 11:42:07'),
(65, 'Suraweera Gamage Hasith Chamidu Lakshan', 'hasithl285@gmail.con', '0767827483', 'qualifications', NULL, 161, 'omegasign100@gmail.com', '/tmp/phpdqk950hoh6813wUS3H2', 734, '2025-05-03 11:45:16', '2025-05-03 11:45:16'),
(66, 'Suraweera Gamage Hasith Chamidu Lakshan', 'hasithl285@gmail.con', '0767827483', 'qualifications', NULL, 161, 'omegasign100@gmail.com', '/tmp/phpspnpt155q1vo4OkOp3d', 734, '2025-05-03 11:45:52', '2025-05-03 11:45:52'),
(67, 'Suraweera Gamage Hasith Chamidu Lakshan', 'hasithl285@gmail.con', '0767827483', 'qualifications', NULL, 161, 'omegasign100@gmail.com', '/tmp/php0lrrsfdtcovjd85GixL', 734, '2025-05-03 11:46:27', '2025-05-03 11:46:27'),
(68, 'Suraweera Gamage Hasith Chamidu Lakshan', 'hasithl285@gmail.con', '0767827483', 'qualifications', NULL, 161, 'omegasign100@gmail.com', '/tmp/php9ebkdmitb84v5DYlkQp', 734, '2025-05-03 11:47:20', '2025-05-03 11:47:20'),
(69, 'Suraweera Gamage Hasith Chamidu Lakshan', 'hasithl285@gmail.con', '0767827483', 'vacancy', NULL, 84, 'careers@mas.com', '/tmp/phpgm2bsquo5evr4Uz0ip9', 635, '2025-05-03 11:50:45', '2025-05-03 11:50:45'),
(70, 'Pattiyage Shanaka Roshan Gomes', 'shanakagomes44@gmail.com', '94716886207', 'Results driven Senior Operation officer with 12+ years of progressive experience at Singer Group ( Singer (Sri lanka) And Singer finance (Lanka) PLC )Specializing in financial operations,Leasing, credit management and Customer service ...', NULL, 27, 'name@gmail.com', '/tmp/phpj8k8qpbmetu30eTdRcs', 423, '2025-05-03 14:22:54', '2025-05-03 14:22:54'),
(71, 'MUTHTHALIBU PATHIMA MUSRIFA', 'nawsadmushrifa1115@gmail.com', '0740611178', 'Dear Hiring Manager,\r\n\r\nPlease find attached my resume for your consideration for the junior finance executive position. I have reviewed the job description and am confident that my skills and experience align well with the requirements of this exciting opportunity at your company.\r\n\r\nMy resume provides further detail on my qualifications. I am eager to discuss how my background can contribute to your team. Thank you for your time and consideration. I look forward to hearing from you soon regarding my application.\r\nBest Regards,\r\n\r\nM.P Musrifa.', NULL, 61, 'sonaklanka@gmail.com', '/tmp/phphafdpfilkur607OwrqH', 579, '2025-05-03 15:40:56', '2025-05-03 15:40:56'),
(72, 'MUTHTHALIBU PATHIMA MUSRIFA', 'nawsadmushrifa1115@gmail.com', '0740611178', 'Dear Hiring Manager,\r\n\r\nPlease find attached my resume for your consideration for the Accounts clerk position. I have reviewed the job description and am confident that my skills and experience align well with the requirements of this exciting opportunity at your company.\r\n\r\nMy resume provides further detail on my qualifications. I am eager to discuss how my background can contribute to your team. Thank you for your time and consideration. I look forward to hearing from you soon regarding my application.\r\nBest Regards,\r\n\r\nM.P Musrifa.', NULL, 67, 'careers@dibpak.com', '/tmp/phpfv181geunqk8be8yfKz', 605, '2025-05-03 15:42:21', '2025-05-03 15:42:21'),
(73, 'MUTHTHALIBU PATHIMA MUSRIFA', 'nawsadmushrifa1115@gmail.com', '0740611178', 'Dear Hiring Manager,\r\n\r\nPlease find attached my resume for your consideration for the Audit trainee position. I have reviewed the job description and am confident that my skills and experience align well with the requirements of this exciting opportunity at your company.\r\n\r\nMy resume provides further detail on my qualifications. I am eager to discuss how my background can contribute to your team. Thank you for your time and consideration. I look forward to hearing from you soon regarding my application.\r\nBest Regards,\r\n\r\nM.P Musrifa.', NULL, 145, 'info@nmassociates.lk', '/tmp/php0angbmbdkvt2fKuWgNI', 710, '2025-05-03 15:43:57', '2025-05-03 15:43:57'),
(74, 'MUTHTHALIBU PATHIMA MUSRIFA', 'nawsadmushrifa1115@gmail.com', '0740611178', 'Dear Hiring Manager,\r\n\r\nPlease find attached my resume for your consideration for the Accountant position. I have reviewed the job description and am confident that my skills and experience align well with the requirements of this exciting opportunity at your company.\r\n\r\nMy resume provides further detail on my qualifications. I am eager to discuss how my background can contribute to your team. Thank you for your time and consideration. I look forward to hearing from you soon regarding my application.\r\nBest Regards,\r\n\r\nM.P Musrifa.', NULL, 120, 'careers@cargillsceylon.com', '/tmp/php30ks2vjmdabe9DFdlal', 682, '2025-05-03 15:45:50', '2025-05-03 15:45:50'),
(75, 'Binura', 'binurakavinda03@gmail.com', '0753129448', '.', NULL, 27, 'name@gmail.com', '/tmp/phpptkkfrqrv8qh5RVwea4', 441, '2025-05-04 05:45:12', '2025-05-04 05:45:12'),
(76, 'Warusha Hennedige Binura Kavinda Zoysa', 'binurakavinda242@gmail.com', '0753129448', '.', NULL, 27, 'name@gmail.com', '/tmp/phpv24k0q0b930heConbVj', 589, '2025-05-04 05:49:58', '2025-05-04 05:49:58'),
(77, 'Warusha Hennedige Binura Kavinda Zoysa', 'binurakavinda242@gmail.com', '0753129448', '.', NULL, 27, 'name@gmail.com', '/tmp/phpcvescu4bkov1exCd9cQ', 589, '2025-05-04 05:50:03', '2025-05-04 05:50:03'),
(78, 'Warusha Hennedige Binura Kavinda Zoysa', 'binurakavinda242@gmail.com', '0753129448', '.', NULL, 115, 'hr4@micronetglobal.net', '/tmp/phps85ket42ngsf5WnSFpL', 675, '2025-05-04 05:53:46', '2025-05-04 05:53:46'),
(79, 'Warusha Hennedige Binura Kavinda Zoysa', 'binurakavinda242@gmail.com', '0753129448', '.', NULL, 27, 'name@gmail.com', '/tmp/phpq5386otqje6ua10yHqJ', 753, '2025-05-04 05:55:41', '2025-05-04 05:55:41'),
(80, 'Shanaka Madusanka', 'shanaka406@gmail.com', '0753026374', 'Dear Sir/Madam,\r\n\r\nI am Interested in applying for this position in your Company. Currently i am working as a Accountant in the Vogue Hotel And Restaurant anuradhapura. Please Find my resume attached.\r\n\r\nThank You.', NULL, 79, 'careers@antzconsultancy.com', '/tmp/php0efeutpdbjva8ZKQLVB', 626, '2025-05-04 20:01:25', '2025-05-04 20:01:25'),
(81, 'Shanaka Madusanka', 'shanaka406@gmail.com', '0753026374', 'Dear Sir/Madam,\r\n\r\nI am Interested in applying for this position in your company. Currently i am working as a Accountant in the Vogue Hotel And Restaurant anuradhapura. Please Find my resume attached.\r\n\r\nThank You.', NULL, 121, 'careers@vallibelfinance.com', '/tmp/php87dd55j44jm6cXoll5O', 683, '2025-05-04 20:07:14', '2025-05-04 20:07:14'),
(82, 'Amila dissanayake', 'dissanayakeamila27@gmail.com', '0702710448', '.', 88, 113, 'careers@lalnrubber.com', '/tmp/phpl3do1tlp3er31AFttjE', 671, '2025-05-05 14:42:26', '2025-05-05 14:42:26'),
(83, 'Rashmi Shashiprabha', 'shashiprabharashmi798@gmail.com', '0759811329', 'I successfully completed my G.C.E. O/L examination in 2017 and A/L examination in 2020, obtaining passes in Business Studies (C) and Accounting (S). My practical experience has helped me build strong administrative and organizational skills, especially in areas such as document handling, customer coordination, and data entry. I am also proficient in Microsoft Word and other basic computer applications.', NULL, 34, 'info@tgwater.lk', '/tmp/phpp42aeali45ju4tQUGoq', 487, '2025-05-05 19:27:09', '2025-05-05 19:27:09'),
(84, 'L g n s kumara', 'nsk5nim@gmail.com', '0776108585', 'Please check and cantact this number', NULL, 27, 'name@gmail.com', '/tmp/phpo3i4enqk3lqv3VbfelU', 472, '2025-05-05 19:36:22', '2025-05-05 19:36:22'),
(85, 'Hasan Ali Muhammadh', 'Mhdmuhammadh982@gmail.com', '0773123495', 'Applying for the job role audit assistant', NULL, 27, 'name@gmail.com', '/tmp/php1i0vl4dgor0c9JEuRMw', 454, '2025-05-05 21:48:17', '2025-05-05 21:48:17'),
(86, 'Hasan Ali Muhammadh', 'Mhdmuhammadh982@gmail.com', '0773123495', 'Applying for the job accounts and cash management role', NULL, 138, 'Nameinside@jobads.lk', '/tmp/phprqot26fh9536ddZSHT4', 759, '2025-05-05 21:51:22', '2025-05-05 21:51:22'),
(87, 'Hasan Ali Muhammadh', 'Mhdmuhammadh982@gmail.com', '0773123495', 'Applying for the job role accounts executive', NULL, 59, 'careers@abansgroup.com', '/tmp/phpks14u3m5v00r7atVEkt', 574, '2025-05-05 21:58:24', '2025-05-05 21:58:24'),
(88, 'Hasan Ali Muhammadh', 'Mhdmuhammadh982@gmail.com', '0773123495', 'Applying for the job role Online Assistant', NULL, 55, 'careers@dhl.com', '/tmp/phpam6nor320hv3cOQCq4H', 564, '2025-05-05 22:01:41', '2025-05-05 22:01:41'),
(89, 'Sudeshika weerasingha', 'sudeshikaweerasingha@gmail.com', '0705523166', 'Dear sir/ Madam,\r\n\r\nYour strong emphasis on providing excellent customer service set a benchmark in the industry and it is the main reason for interest in working for your company as a.                   \r\nI think my talents are the best match for your needs\r\n\r\nI have excellent interpersonal skills and type of personality that make it easy to from good working relationships with all stakeholders. I have complete understanding in finance related areas since i have degree regarding finance\r\n\r\nI very much hope that you will look favorably upon my application by recognizing my enthusiasm talent in the filed of finance and my future potential.In closing i would like to thank you for taking the time to consider my application, and i eagerly looking forward to hearing from you.\r\n\r\nThank you \r\nSudeshika Harshani Weerasingha \r\nContact mobile: 0705523166 , 0770886946', NULL, 59, 'careers@abansgroup.com', '/tmp/phpi8fqqcs79ms48I6SQth', 574, '2025-05-06 04:50:29', '2025-05-06 04:50:29'),
(90, 'Manoj', 'kalumsamarajeewa@gmail.com', '0764129648', 'Dear Sir\r\n\r\nPlease find attachment \r\n\r\nthanks', NULL, 27, 'name@gmail.com', '/tmp/php52tn91uk5mp3eavG4Wm', 449, '2025-05-07 07:27:01', '2025-05-07 07:27:01'),
(91, 'Aslub Ahamed', 'ahamedaslub@gmail.com', '0706309864', 'Hi Sir,\r\nI\'m Aslub Ahamed From Kalmunai and I\'m a Electrical Engineer Student Now I\'m doing HND Program in Esoft Engineering College Katubedda in Part-time Sat and Sun If i Suitable for this Job Please Let me know 🙂', 93, 137, 'courierhr@sitrekgroup.com', 'resumes/cv_93_1746596034.pdf', 703, '2025-05-07 09:33:55', '2025-05-07 09:33:55'),
(92, 'Aslub Ahamed', 'ahamedaslub@gmail.com', '0706309864', 'Hi Sir,\r\nI\'m Aslub Ahamed From Kalmunai and I\'m a Electrical Engineer Student Now I\'m doing HND Program in Esoft Engineering College Katubedda in Part-time Sat and Sun If i Suitable for this Job Please Let me know 🙂\r\nI don\'t have any Experience in Data Entry if you\'re able to teach me i can pick it up as well', 93, 137, 'courierhr@sitrekgroup.com', '/tmp/phpr4pq0t9qejjmaJpBZnu', 703, '2025-05-07 09:35:47', '2025-05-07 09:35:47'),
(93, 'Amanda Serasinghe', 'amandasewmini2020@gmail.com', '0719953128', 'Applying for an online assistant job vacancy', 95, 55, 'careers@dhl.com', '/tmp/phpld58n1hgpqlp3SGUF1g', 564, '2025-05-07 15:39:25', '2025-05-07 15:39:25'),
(94, 'Inosha lankani', 'lankaniinusha@gmail.com', '0759315056', 'I’m looking forward your response \r\nThan you', NULL, 27, 'name@gmail.com', '/tmp/phpjakucrgpgmim56mQ4Uj', 609, '2025-05-07 16:12:07', '2025-05-07 16:12:07'),
(95, 'THEVARASA PUVALAKSHAN', 'shanlakshan729@gmail.com', '0775355593', 'Dear Sir/Madam,\r\n\r\nPlease find attached my CV and supporting documents for the position of Application for Senior HVAC Technician (Operation & Maintenance) as advertised.\r\n\r\nI am very interested in this opportunity and believe my skills and experience align well with the requirements outlined in the advertisement.\r\n\r\nThank you for your time and consideration. I look forward to hearing from you.\r\n\r\nSincerely,\r\nPuvalakshan\r\n775355593', NULL, 199, 'haniff@tgl.lk', '/tmp/phpkdil6a0aj0o86jk2NPN', 797, '2025-05-07 18:51:58', '2025-05-07 18:51:58'),
(96, 'J.M.H.V.Jayasinghe', 'hansikajayasinghe2001@gmail.com', '0705706801', 'Dear Sir/Madam,\r\n\r\nPlease find attached my CV and supporting documents for the position of Application for Senior Marketing Executive as advertised.\r\n\r\nI am very interested in this opportunity and believe my skills and experience align well with the requirements outlined in the advertisement.\r\n\r\nThank you for your time and consideration. I look forward to hearing from you.\r\n\r\nSincerely,\r\nHansika\r\n0705706801', NULL, 63, 'powerhand@gmail.com', '/tmp/phpivmi5bnol8929URGgox', 585, '2025-05-07 19:04:31', '2025-05-07 19:04:31'),
(97, 'Isuru Serasinghe', 'isuruserasinghe2023@gmail.com', '0719953128', '-', NULL, 115, 'hr4@micronetglobal.net', '/tmp/php4h1ujd3kupe8ayxmxNA', 675, '2025-05-07 19:15:54', '2025-05-07 19:15:54'),
(98, 'loganath kumareshan', 'lkumaresh93@gmail.com', '0777517482', '.', NULL, 55, 'careers@dhl.com', '/tmp/php97m8pmedggr05U60Zr0', 563, '2025-05-08 06:12:52', '2025-05-08 06:12:52'),
(99, 'loganath kumareshan', 'lkumaresh93@gmail.com', '0777517482', '.', NULL, 178, 'infor@firstnotch-solutions.com', '/tmp/phpfnneiuqvpcc67BntBjG', 762, '2025-05-08 06:50:37', '2025-05-08 06:50:37'),
(100, 'loganath kumareshan', 'lkumaresh93@gmail.com', '0777517482', '.', NULL, 185, 'pcl-job@prima.com.lk', '/tmp/phppvttbdgr5lqd2pLtKxA', 774, '2025-05-08 06:52:36', '2025-05-08 06:52:36'),
(101, 'loganath kumareshan', 'lkumaresh93@gmail.com', '0777517482', '.', NULL, 27, 'name@gmail.com', '/tmp/phpqs24g9rqogft0fcqg1f', 529, '2025-05-08 07:01:51', '2025-05-08 07:01:51'),
(102, 'loganath kumareshan', 'lkumaresh93@gmail.com', '0777517482', '.', NULL, 27, 'name@gmail.com', '/tmp/phpglgbga10dgc15rIqYCh', 529, '2025-05-08 07:22:44', '2025-05-08 07:22:44'),
(103, 'Kabilan', 'skabilan0920@gmail.com', '0740421567', 'I like to join this online job', NULL, 27, 'name@gmail.com', '/tmp/php37a5m9slhbcvdgi6qK3', 580, '2025-05-08 10:39:57', '2025-05-08 10:39:57'),
(104, 'Somesha Hewage', 'someshahewage@gmail.com', '0710344837', 'I certify that above mentioned details true and accurate to the best of my knowledge. I shall be grateful if you could provide me an opportunity in your esteemed company', NULL, 27, 'name@gmail.com', '/tmp/phpkh3kutauao2jaV4c8p3', 482, '2025-05-08 11:31:42', '2025-05-08 11:31:42'),
(105, 'Rashmi Senanayake', 'rashmiayesha430@gmail.com', '0703823122', 'I’m BA hons geography,graduated student', NULL, 27, 'name@gmail.com', '/tmp/phphq6kl08d9osidIiDg6e', 521, '2025-05-08 12:07:37', '2025-05-08 12:07:37'),
(106, 'Rashmi Senanayake', 'rashmiayesha430@gmail.com', '0703823122', 'I’m BA hons geography,graduated student', NULL, 27, 'name@gmail.com', '/tmp/phpk7hlc9u7u3f93AU56SC', 521, '2025-05-08 12:07:43', '2025-05-08 12:07:43'),
(107, 'Surenthiran Kabilan', 'skabilan0920@gmail.com', '0740421567', 'I like to join this job', 97, 27, 'name@gmail.com', '/tmp/php6a8998kuhksl3uVWWux', 580, '2025-05-08 12:40:53', '2025-05-08 12:40:53'),
(108, 'Ruwani Madhusha Waravita', 'ruwanimadhusha0000@gmail.com', '0711597550', 'Dear sir/madam,\r\nI am writing to express my interest in the Junior Executive Trainee Position at PAN ASIA Bank. As a fresh graduate in Physical Science at the University of Kelaniya, I am eager to contribute my analytical skills to your esteemed team.\r\nPlease find my CV attached for your consideration. I would be delighted to discuss how my skills and enthusiasm align with the requirements of the role.\r\nThank you for your time and consideration.\r\n\r\nW.Ruwani Madhusha\r\nBSc Physical Science (Undergraduate)\r\nUniversity of Kelaniya.\r\nContact no: +94 711597550\r\nE-mail: ruwanimadhusha0000@gmail.com\r\nLinkedIn: http://www.linkedin.com/in/ruwani-waravita', NULL, 190, 'info@jobads.lk', '/tmp/phppbovvf5ba5sb17OG1yM', 822, '2025-05-08 14:52:22', '2025-05-08 14:52:22'),
(109, 'manoj', 'kalumsamrajeewa@gmail.com', '0764129648', 'Dear Sir \r\n\r\nPlease find attachment \r\n\r\nthanks', NULL, 27, 'name@gmail.com', '/tmp/php560q5t935fpseF8ePkg', 444, '2025-05-08 17:02:11', '2025-05-08 17:02:11'),
(110, 'manoj', 'kalumsamarajeewa@gmail.com', '0764129648', 'Dear Sir\r\n\r\nplease find attachment \r\n\r\nthanks', NULL, 27, 'name@gmail.com', '/tmp/phpvjbnge8qki987PepIAt', 449, '2025-05-08 17:04:14', '2025-05-08 17:04:14'),
(111, 'Indika Pradeep Jayathissa', 'indikapradeep19961116@gmail.com', '0773965141', 'Please collect this attached CV for Network Engineer vacancy.', NULL, 59, 'careers@abansgroup.com', '/tmp/php71qfdk7a3i7u6ShxOFD', 573, '2025-05-08 19:35:06', '2025-05-08 19:35:06'),
(112, 'Alakeshwarage Dimal Wijesinghe', 'dimalwije7@gmail.com', '0762544149', 'HI I\'M DIMAL I LIKE TO JOIN YOUR COMPANY', NULL, 183, 'laamagrand@gmail.com', '/tmp/phpt5m74tc2p95a4OtgKsC', 770, '2025-05-08 20:19:57', '2025-05-08 20:19:57'),
(113, 'Kabilan', 'skabilan0920@gmail.com', '0740421567', 'I like to join this job', NULL, 55, 'careers@dhl.com', '/tmp/phpjvrvsvej6oqu0uLN3dI', 564, '2025-05-09 07:16:44', '2025-05-09 07:16:44'),
(114, 'Isurika pramodi Gunawardana', 'gunawardanaisurika@gmail.com', '0718842411', 'Applying For The Custom Support Agent', NULL, 55, 'careers@dhl.com', '/tmp/phpsqf5ufpg330q9frPBAR', 563, '2025-05-09 10:12:33', '2025-05-09 10:12:33'),
(115, 'Isurika pramodi Gunawardana', 'gunawardanaisurika@gmail.com', '0718842422', 'Applying For The custom support agent', NULL, 55, 'careers@dhl.com', '/tmp/php6jls69p47f471Hp0c0k', 563, '2025-05-09 10:15:01', '2025-05-09 10:15:01'),
(116, 'Nawoda Dulanjali', 'akashanethu4@gmail.com', '0770754344', 'I am jenuinely interested in this job', NULL, 104, 'careers.cblf@cbllk.com', '/tmp/php1bpptbkeqtv6bBShuFO', 668, '2025-05-09 10:17:21', '2025-05-09 10:17:21'),
(117, 'Nawoda Dulanjali', 'akashanethu4@gmail.com', '0770754344', 'Iam genuinely interested in this job', NULL, 110, 'nipponacc123@gmail.com', '/tmp/phps01181tlo5l88g8CSXn', 666, '2025-05-09 10:24:15', '2025-05-09 10:24:15'),
(118, 'G Shanika Harshani', 'Sharshani182@gmail.com', '0704020828', 'Shanika Harshani \r\n0704020828\r\nSharshani182@gamil.com', NULL, 27, 'name@gmail.com', '/tmp/phpp21b71b9qt5m5rketQG', 268, '2025-05-09 11:18:12', '2025-05-09 11:18:12'),
(119, 'G Shanika Harshani', 'Sharshani182@gmail.com', '0704020828', 'Shanika Harshani \r\n0704020828\r\nSharshani182@gamil.com', NULL, 27, 'name@gmail.com', '/tmp/phpplgevo4b2sd83OFz0sN', 268, '2025-05-09 11:18:17', '2025-05-09 11:18:17'),
(120, 'G Shanika Harshani', 'Sharshani182@gmail.com', '0704020828', 'Shanika Harshani \r\n0704020828', NULL, 27, 'name@gmail.com', '/tmp/php4hss9hadgrvfbQEzW5u', 268, '2025-05-09 11:18:53', '2025-05-09 11:18:53'),
(121, 'ISURIKA PRAMODI GUNAWARDANA', 'gunawardanaisurika@gmail.com', '0718842411', 'APPLYING FOR THE CUSTOMER EXPERIENCE SPECIALIST', NULL, 116, 'careers.sl@johnmorrisgroup.com', '/tmp/phpms0dvr240ldnaES1SD9', 677, '2025-05-09 11:45:43', '2025-05-09 11:45:43'),
(122, 'Lavanniya Vijayakumar', 'lavanniyav@gmail.com', '0773336156', 'Herewith I have attached the CV', NULL, 55, 'careers@dhl.com', '/tmp/phpdb3pk220n6g3fIBFYca', 564, '2025-05-09 13:29:19', '2025-05-09 13:29:19'),
(123, 'U.A.Kavindi Himasha', 'kavindihimasha977@gmail.com', '0761684071', 'I Applied Store keeper or accounts executive', NULL, 89, 'ranbimae@gmail.com', '/tmp/phpdb0k1alt26dcfRT7k5m', 640, '2025-05-09 17:48:04', '2025-05-09 17:48:04'),
(124, 'Shobitha', 'udayakumarshobitha3@gmail.com', '0743255144', 'I need this job I will do my best.', NULL, 59, 'careers@abansgroup.com', '/tmp/phpfc22o6r9pq3jcj5rFXp', 570, '2025-05-09 21:43:21', '2025-05-09 21:43:21'),
(125, 'Shobitha', 'udayakumarshobitha3@gmail.com', '0743255144', 'I need this job very much I can give my best to this job.', NULL, 115, 'hr4@micronetglobal.net', '/tmp/phpmnqdl07uhsvu10vVYOV', 675, '2025-05-09 21:44:47', '2025-05-09 21:44:47'),
(126, 'B.S.M.L.De Silva', 'shashidesilva465@gmail.com', '0701401544', 'I would like to join this.', NULL, 55, 'careers@dhl.com', '/tmp/phpug6val78e1a2cT4seSZ', 564, '2025-05-10 11:22:30', '2025-05-10 11:22:30'),
(127, 'Shashika wickramaarachchi', 'shashika.3.0.3.0@gmail.com', '0776281922', 'Dear Sir/Madam,\r\n\r\nI would like to apply for the following job vacancy\r\nI need to know more details about this job.\r\nGive your kind attention in this regard.\r\nAttached is a sheet containing my resume along my qualifications.if you meet the required qualifications,please be kind to give me a reply.\r\n\r\nThank you..!\r\n\r\nRegard’s \r\nW A L Shashika Ranjana \r\nTel:- 071 5771922 / 036 2253246 / 036 3360000', NULL, 59, 'careers@abansgroup.com', '/tmp/phpft6t098m77q4dRtjzNs', 570, '2025-05-10 20:57:18', '2025-05-10 20:57:18'),
(128, 'Shashika wickramaarachchi', 'shashika.0.11.0@gmail.com', '0776281922', 'Dear Sir/Madam,\r\n\r\nI would like to apply for the following job vacancy\r\nI need to know more details about this job.\r\nGive your kind attention in this regard.\r\nAttached is a sheet containing my resume along my qualifications.if you meet the required qualifications,please be kind to give me a reply.\r\n\r\nThank you..!\r\n\r\nRegard’s \r\nW A L Shashika Ranjana \r\nTel:- 071 5771922 / 036 2253246 / 036 3360000', NULL, 54, 'career@heron.lk', '/tmp/php2ojat5guuq9hb4Bcw7l', 562, '2025-05-10 20:59:50', '2025-05-10 20:59:50'),
(129, 'Shashika wickramaarachchi', 'shashika.0.11.0@gmail.com', '0776281922', 'Dear Sir/Madam,\r\n\r\nI would like to apply for the following job vacancy\r\nI need to know more details about this job.\r\nGive your kind attention in this regard.\r\nAttached is a sheet containing my resume along my qualifications.if you meet the required qualifications,please be kind to give me a reply.\r\n\r\nThank you..!\r\n\r\nRegard’s \r\nW A L Shashika Ranjana \r\nTel:- 071 5771922 / 036 2253246 / 036 3360000', NULL, 27, 'name@gmail.com', '/tmp/phpglpv6e3icr4bb2mLqIT', 496, '2025-05-10 21:01:39', '2025-05-10 21:01:39'),
(130, 'Deshani Jayawardana', 'danushikadeshani077@gmail.com', '0764230833', 'Dear Hiring Team,\r\n\r\nI am writing to express my keen interest in the Divisional Lean Enterprise Internship opportunity at MAS Capital – Active, Nawala. With a BSc (Honours) in Applied Mathematics from the University of Colombo and a solid foundation in statistics, computer science, and data analysis and machine learning. I am excited about the chance to contribute to your digitization initiatives and analytical efforts.\r\n\r\nI am proficient in Python, mysql, Excel, and Power BI, with hands-on experience in descriptive and predictive analysis through academic projects. My strong analytical thinking, attention to detail, and passion for data-driven problem-solving make me a strong fit for your team of changemakers.\r\n\r\nThank you for considering my application. I would welcome the opportunity to further discuss how I can support your goals at MAS.\r\n\r\nWarm regards,\r\nDeshani Jayawardana', NULL, 84, 'careers@mas.com', '/tmp/phpm0fa1e7h07l18fHqGGq', 634, '2025-05-10 21:22:26', '2025-05-10 21:22:26'),
(131, 'Deshani Danushika Jayawardana', 'danushikadeshani077@gmail.com', '0764230833', 'Dear Hiring Team,\r\n\r\nI am writing to express my keen interest in the Divisional Lean Enterprise Internship opportunity at MAS Capital – Active, Nawala. With a BSc (Honours) in Applied Mathematics from the University of Colombo and a solid foundation in Mathematics, statistics, computer science, and data analysis, machine learning. I am excited about the chance to contribute to your digitization initiatives and analytical efforts.\r\n\r\nI am proficient in Python, mysql and Excel, and Power BI, with hands-on experience in descriptive and predictive analysis through academic projects. My strong analytical thinking, attention to detail, and passion for data-driven problem-solving make me a strong fit for your team of changemakers.\r\n\r\nThank you for considering my application. I would welcome the opportunity to further discuss how I can support your goals at MAS.\r\n\r\nWarm regards,\r\nDeshani Jayawardana', NULL, 84, 'careers@mas.com', '/tmp/phpvkq6sb88igsg2eA4JO2', 634, '2025-05-10 21:43:51', '2025-05-10 21:43:51'),
(132, 'F.F.Hamna', 'hamnafathima783@gmail.com', '0706443631', 'I would like to apply for a data entry job.', NULL, 180, 'careers@leisuresportsholdings.com', '/tmp/phpa89f5k62ap832ZYp3Q8', 766, '2025-05-12 01:30:14', '2025-05-12 01:30:14'),
(133, 'Dansika Rameskaran', 'dansikarames@gmail.com', '0764620008', 'Quality Assurance/ quality checking related job as training or temporary or permanent job.', NULL, 131, 'careers.lpi@keels.com', '/tmp/php0mj2brjpdrg04pbdqZp', 698, '2025-05-14 20:21:39', '2025-05-14 20:21:39'),
(134, 'Dansika Rameskaran', 'dansikarames@gmail.com', '0764620008', 'Permanent job is most preferred', NULL, 62, 'govrnment@gov.org', '/tmp/phpma0ra86effaacTZPUCm', 582, '2025-05-14 20:25:01', '2025-05-14 20:25:01'),
(135, 'Thakshila Botheju', 'thakshi212@gmail.com', '0787976043', 'Applying for the online assistant job vacancy', NULL, 55, 'careers@dhl.com', '/tmp/phpq91fsdc8h4jmfTUr2BN', 564, '2025-05-14 20:26:43', '2025-05-14 20:26:43'),
(136, 'Thakshila Botheju', 'thakshi212@gmail.com', '0787976043', 'Applying for the recovery call center officers job position', NULL, 190, 'info@jobads.lk', '/tmp/phpv717oht5p5v118xvbao', 1010, '2025-05-14 20:31:00', '2025-05-14 20:31:00'),
(137, 'Sachika Pehesara', 'sachikapehesara33@gmail.com', '0764705246', 'Applying for trainee staff assistance position', NULL, 190, 'info@jobads.lk', '/tmp/phprtvtf0ik4vut8XAWfAz', 1013, '2025-05-15 07:22:06', '2025-05-15 07:22:06'),
(138, 'A.M.Sandunika Palindi', 'palindi419@gmail.com', '0702564333', 'I am here to express my keen interest in the position of accounts executive, advertised on your company. I have attached my cv for your consideration.', NULL, 59, 'careers@abansgroup.com', '/tmp/phpt88bjllca0uq9wCV9QI', 574, '2025-05-15 08:19:03', '2025-05-15 08:19:03'),
(139, 'jeewantha mallawa', 'mallawajeewantha400@gmail.com', '0774178730', 'Hi,\r\n\r\nI’m Jeewantha Mallawa, a recent graduate with a Bachelor of Science in Information Technology (Specialized in IT) from the Sri Lanka Institute of Information Technology (SLIIT). I’m reaching out because I’m excited about the Quality Assurance position at your company and think I’d be a great fit.\r\n\r\n\r\nCurrently, I am enhancing my knowledge in software quality assurance by following a short-term training course on \r\n \r\n\r\n“Software Quality Assurance Using Test Automation Framework” \r\n\r\nconducted by the University of Colombo School of Computing (UCSC). This eight-week program, running from January to February 2025, focuses on advanced testing techniques, which I believe will further equip me to excel in a QA role.\r\n\r\n\r\nIn my role as Quality Assurance Program-me Associate Tabulation Officer at the Centre of Monitoring Election Violence (CMEV), I gained hands-on experience with data analysis and learned the importance of accuracy and meeting tight deadlines—skills that are key for a QA role.\r\n\r\nOn the technical side, I’m comfortable with languages like C++, Python, and Java, as well as frameworks like React and Node.js. In university, I led a team to create a machine-learning-based mobile solution for maternal health monitoring, which helped me understand how to blend creativity with problem-solving. I’m also familiar with tools like MySQL, Firebase, and Android Studio that focus on maintaining quality in tech products.\r\n\r\nOutside of academics, I’ve built leadership and teamwork skills as a school prefect and through extracurricular activities like the SLIIT Leo Club. I’m confident these experiences have prepared me to collaborate effectively and contribute to your team.\r\n\r\nI’d love the chance to bring my passion for technology and quality assurance to your organization. If you’d like to chat more about how I can contribute, feel free to reach me at jeewanthamallawa99@gmail.com or ‪+94 77 417 8730‬.\r\n\r\nLooking forward to hearing from you!\r\n\r\nBest,\r\nJeewantha Mallawa', 107, 27, 'name@gmail.com', '/tmp/phph2s178q8565obJUreKV', 292, '2025-05-15 09:10:05', '2025-05-15 09:10:05'),
(140, 'Agasthi makaranda', 'agasthiguruge123@gmail.com', '0703264110', '.', NULL, 190, 'info@jobads.lk', '/tmp/phpp6hdistac48u4v3gorj', 1013, '2025-05-15 10:08:33', '2025-05-15 10:08:33'),
(141, 'Dhanushka Madubashana Rathnayaka', 'dhanurathnayaka3@gmail.com', '0769228723', 'Executive - Administration & General Affairs', NULL, 185, 'pcl-job@prima.com.lk', '/tmp/phpdopa15s21f395znmvOe', 774, '2025-05-15 11:57:26', '2025-05-15 11:57:26'),
(142, 'Oshadhi eshmini', 'eshminio@gmail.com', '0740478116', 'Im looking for job', NULL, 190, 'info@jobads.lk', '/tmp/phpte3l6n0rqrh9cHAbZtc', 852, '2025-05-15 12:29:48', '2025-05-15 12:29:48'),
(143, 'Oshadhi eshmini', 'eshminio@gmail.com', '0740478116', 'Im looking for job', NULL, 190, 'info@jobads.lk', '/tmp/phpthqfe75pjg2405FTCDW', 852, '2025-05-15 12:30:08', '2025-05-15 12:30:08'),
(144, 'Ambiga yogeshwaran', 'abiambiga2024@gmail.com', '0753032389', 'Trainee staff assistant', NULL, 190, 'info@jobads.lk', '/tmp/phps1h0390d6h354xmSmke', 1013, '2025-05-15 16:13:28', '2025-05-15 16:13:28'),
(145, 'Ambiga yogeshwaran', 'abiambiga2024@gmail.com', '0753032389', 'Trainee staff assistant', NULL, 190, 'info@jobads.lk', '/tmp/phpinj25tc3jd999pF4Jsx', 1013, '2025-05-15 16:14:39', '2025-05-15 16:14:39'),
(146, 'sathsarani kavindya', 'sathsarani206@gmail.com', '0762833746', 'Dear sir/ madam ,\r\nApplying for the position of accounts assistant. Here, I attached my resume & give me reply for this message.', NULL, 299, 'careers@accsence.lk', '/tmp/phpicv5m3ncp5dl1QQCTiK', 1029, '2025-05-16 08:59:54', '2025-05-16 08:59:54'),
(147, 'Natasha', 'natashalincy122@gmail.com', '0776875256', 'Hi this my cv', NULL, 190, 'info@jobads.lk', '/tmp/phpe5n7mg7v00788wPvLEw', 1013, '2025-05-16 09:15:15', '2025-05-16 09:15:15'),
(148, 'Sirisena RaRanathungage Hiruni Shyamika Deshani Ranathunga', 'hiruranathunga422@gmail.com', '0704022006', 'Account assistant', NULL, 299, 'careers@accsence.lk', '/tmp/phpcco6p0f5cihbdPmbFsm', 1029, '2025-05-16 09:21:17', '2025-05-16 09:21:17'),
(149, 'umesha welagedara', 'umeshawelagedara2000@gmail.com', '0761618385', 'I am umesha. I have more work experience. I like to join your bank. Please let me know.', NULL, 190, 'info@jobads.lk', '/tmp/php0tdpicvtppba9Zv8hFn', 1013, '2025-05-16 09:56:14', '2025-05-16 09:56:14'),
(150, 'umesha welagedara', 'umeshawelagedara2000@gmail.com', '0761618385', 'I am umesha. I have more work experience. I like to join your bank. Please let me know.', NULL, 190, 'info@jobads.lk', '/tmp/phpgk9otk7ahgvq5n3DeOX', 1013, '2025-05-16 09:56:17', '2025-05-16 09:56:17'),
(151, 'sripali erandi chandrasekara yapa', 'sripalierandi655@gmail.com', '0764220439', 'Dear Sir/Madam,\r\n\r\nI hope you are doing well.\r\n\r\nI am writing to express my interest in the Office Coordinator position at [Company Name]. I hold a Bachelor’s Degree in Information Technology (Hons) in Networking and Mobile Computing from Horizon Campus.\r\n\r\nI have gained valuable experience through my recent roles, including 6 months as a Project Coordinator and 6 months as an IT Administrator. These roles helped me develop strong organizational, communication, and multitasking skills while supporting team operations and managing technical and administrative responsibilities effectively.\r\n\r\nI am confident that my academic background combined with my practical experience makes me a strong candidate for this position. I am eager to contribute to your team by ensuring smooth office operations and supporting your organizational goals.\r\n\r\nPlease find my attached resume for your review. I would be grateful for the opportunity to discuss how I can contribute to your organization.\r\n\r\nThank you for considering my application. I look forward to your response.\r\n\r\nBest regards,\r\nSripali Erandi\r\n0764220439', NULL, 27, 'name@gmail.com', '/tmp/php3trch4r8eqt45aCukBZ', 496, '2025-05-16 10:06:08', '2025-05-16 10:06:08'),
(152, 'sripali erandi chandrasekara yapa', 'sripalierandi655@gmail.com', '0764220439', 'Dear Sir/Madam,\r\n\r\nI hope you are doing well.\r\n\r\nI am writing to express my interest in the Program Coordinator position at igniterspace . I hold a Bachelor’s Degree in Information Technology (Hons) in Networking and Mobile Computing from Horizon Campus.\r\n\r\nI have gained valuable experience through my recent roles, including 6 months as a Project Coordinator and 6 months as an IT Administrator. These roles helped me develop strong organizational, communication, and multitasking skills while supporting team operations and managing technical and administrative responsibilities effectively.\r\n\r\nI am confident that my academic background combined with my practical experience makes me a strong candidate for this position. I am eager to contribute to your team by ensuring smooth office operations and supporting your organizational goals.\r\n\r\nPlease find my attached resume for your review. I would be grateful for the opportunity to discuss how I can contribute to your organization.\r\n\r\nThank you for considering my application. I look forward to your response.\r\n\r\nBest regards,\r\nSripali Erandi\r\n0764220439', NULL, 135, 'careers@igniterspace.com', '/tmp/php3lv7pdg8dvuubiE1zRA', 702, '2025-05-16 10:10:15', '2025-05-16 10:10:15'),
(153, 'P.W.G.H.Udani Bandara', 'udani.bandara2020@gmail.com', '0762454810', '.', NULL, 287, 'genuineinvestment01@gmail.com', '/tmp/phpunt9p8ifu48kaVmPLvj', 1005, '2025-05-16 12:14:21', '2025-05-16 12:14:21'),
(154, 'P.W.G.H.Udani Bandara', 'udani.bandara2020@gmail.com', '0762454810', '.', NULL, 287, 'genuineinvestment01@gmail.com', '/tmp/php4pts90eg5j1d2JjySCu', 1005, '2025-05-16 12:14:27', '2025-05-16 12:14:27');
INSERT INTO `applications` (`id`, `name`, `email`, `contact_number`, `message`, `user_id`, `employer_id`, `company_mail`, `cv_path`, `job_posting_id`, `created_at`, `updated_at`) VALUES
(155, 'P.W.G.H.Udani Bandara', 'udani.bandara2020@gmail.com', '0762454810', '.', NULL, 278, 'gm@julianalk.com', '/tmp/php5mi7mpfeg8hm7Ooz58M', 979, '2025-05-16 12:18:51', '2025-05-16 12:18:51'),
(156, 'P.W.G.H.Udani Bandara', 'udani.bandara2020@gmail.com', '0762454810', 'With CV', NULL, 269, 'thilini@lankatalents.lk', '/tmp/phph3pcpt2fr4qe06gBkS4', 1025, '2025-05-16 12:20:16', '2025-05-16 12:20:16'),
(157, 'Jeewantha Mallawa', 'mallawajeewantha400@gmail.com', '0774178730', 'I’m Jeewantha Mallawa, a recent graduate with a Bachelor of Science in Information Technology (Specialized in IT) from the Sri Lanka Institute of Information Technology (SLIIT). I’m reaching out because I’m excited about the Quality Assurance position at your company and think I’d be a great fit.\r\n\r\n\r\nCurrently, I am enhancing my knowledge in software quality assurance by following a short-term training course on \r\n\r\n“Software Quality Assurance Using Test Automation Framework” \r\n\r\nconducted by the University of Colombo School of Computing (UCSC). This eight-week program, running from January to February 2025, focuses on advanced testing techniques, which I believe will further equip me to excel in a QA role.', 107, 27, 'name@gmail.com', '/tmp/phpkht5uf4octuj04wHBwh', 499, '2025-05-16 14:13:51', '2025-05-16 14:13:51'),
(158, 'Jeewantha Mallawa', 'mallawajeewantha400@gmail.com', '0774178730', 'Hi,\r\nI’m Jeewantha Mallawa, a recent graduate with a Bachelor of Science in Information Technology (Specialized in IT) from the Sri Lanka Institute of Information Technology (SLIIT). I’m reaching out because I’m excited about the Quality Assurance position at your company and think I’d be a great fit.\r\n\r\n\r\nCurrently, I am enhancing my knowledge in software quality assurance by following a short-term training course on \r\n\r\n“Software Quality Assurance Using Test Automation Framework” \r\n\r\nconducted by the University of Colombo School of Computing (UCSC). This eight-week program, running from January to February 2025, focuses on advanced testing techniques, which I believe will further equip me to excel in a QA role.\r\n\r\n\r\nIn my role as Quality Assurance Program-me Associate Tabulation Officer at the Centre of Monitoring Election Violence (CMEV), I gained hands-on experience with data analysis and learned the importance of accuracy and meeting tight deadlines—skills that are key for a QA role.\r\n\r\nOn the technical side, I’m comfortable with languages like C++, Python, and Java, as well as frameworks like React and Node.js. In university, I led a team to create a machine-learning-based mobile solution for maternal health monitoring, which helped me understand how to blend creativity with problem-solving. I’m also familiar with tools like MySQL, Firebase, and Android Studio that focus on maintaining quality in tech products.\r\n\r\nOutside of academics, I’ve built leadership and teamwork skills as a school prefect and through extracurricular activities like the SLIIT Leo Club. I’m confident these experiences have prepared me to collaborate effectively and contribute to your team.\r\n\r\nI’d love the chance to bring my passion for technology and quality assurance to your organization. If you’d like to chat more about how I can contribute, feel free to reach me at jeewanthamallawa99@gmail.com or ‪+94 77 417 ‪8730‬.at‬ jeewanthamallawa99@gmail.com or ‪‪+94 77 417 8730‬‬.\r\n\r\nLooking forward to hearing from you!\r\n\r\nBest,\r\nJeewantha Mallawa', 107, 27, 'name@gmail.com', '/tmp/phph3tf6k8nk4io2aryjCG', 482, '2025-05-16 14:58:36', '2025-05-16 14:58:36'),
(159, 'Dulanjani Nilakshika', 'niludulanji0@gmail.com', '0740695188', 'I need to work with DHL group.', NULL, 55, 'careers@dhl.com', '/tmp/phpv471uorqi2qn7kWRWkD', 564, '2025-05-16 16:48:34', '2025-05-16 16:48:34'),
(160, 'Areeb Abdunnazer', 'areebabdunnazer@gmail.com', '0774690781', 'Dear Hiring Team,\r\n\r\nI hope this message finds you well.\r\nI am writing to express my interest in the Accounts Assistant role at Accsense. I have recently completed the ACCA Diploma in Accounting and Business and I am currently continuing my studies to acquire the ACCA qualification. I am looking forward to applying my knowledge and gaining valuable experience in a professional environment. I strongly believe that I would be a good fit for this role. Thank you for your time.\r\n\r\nBest regards,\r\nAreeb Abdunnazer', NULL, 299, 'careers@accsence.lk', '/tmp/php54v07ah6bktnd3x3UYJ', 1029, '2025-05-16 18:11:21', '2025-05-16 18:11:21'),
(161, 'Ambiga yogeshwaran', 'abiambiga2024@gmail.com', '0753032389', 'Account assistent', NULL, 299, 'careers@accsence.lk', '/tmp/phpsbq2qju2f6ib5yk2PAe', 1029, '2025-05-17 06:28:02', '2025-05-17 06:28:02'),
(162, 'A M I S AMARAKOON', 'isharasewwandiam@gmail.com', '0713183346', 'Look forwarding for Officer post If I qualified', NULL, 27, 'name@gmail.com', '/tmp/php9neitmsjphpbfdJTEcb', 609, '2025-05-17 09:36:22', '2025-05-17 09:36:22'),
(163, 'A M I S Amarakoon', 'isharasewwandiam@gmail.com', '0713183346', 'I am a degree holder but not in AL commerce stream. But I have 7 years of experience at a reputed bank.', NULL, 299, 'careers@accsence.lk', '/tmp/phpu1pq3j04h1m2bKrM7f0', 1029, '2025-05-17 09:41:15', '2025-05-17 09:41:15'),
(164, 'Vishagan', 'mahendran.vishagan@gmail.com', '0777241757', 'Store assistant', NULL, 27, 'name@gmail.com', '/tmp/phpuha8b3a9phjm2KjYPe3', 589, '2025-05-17 10:32:56', '2025-05-17 10:32:56'),
(165, 'Vishagan', 'mahendran.vishagan@gmail.com', '0777241757', 'Data entry officer', NULL, 137, 'courierhr@sitrekgroup.com', '/tmp/php1ejfc5hfq2seayxLbcv', 703, '2025-05-17 10:36:32', '2025-05-17 10:36:32'),
(166, 'Vishagan', 'mahendran.vishagan@gmail.com', '0777241757', 'Online assistant', NULL, 55, 'careers@dhl.com', '/tmp/phpigvtuu988s74aFgPFm5', 564, '2025-05-17 10:39:02', '2025-05-17 10:39:02'),
(167, 'Dulan', 'dulanprasanna@gmail.com', '0773219992', 'I have 25 years marketing experience in the FMCG and hardware feiled', NULL, 294, 'info@royalflourmills.com', '/tmp/phpe5f4srjlhav11Uh8q0h', 1015, '2025-05-17 11:36:56', '2025-05-17 11:36:56'),
(168, 'Vishagan', 'mahendran.vishagan@gmail.com', '0777241757', 'Data entry officer', NULL, 180, 'careers@leisuresportsholdings.com', '/tmp/php9sv9b9dsa2gef4qhzOU', 766, '2025-05-17 11:57:22', '2025-05-17 11:57:22'),
(169, 'lakshitha bhagyanath', 'lakshithabhagya@gmail.com', '0787814618', 'im student at institute of technology university of moratuwa. im interesting about your company office cordinater vacancy.', NULL, 34, 'info@tgwater.lk', '/tmp/phplal3qhd4s4vn0iPNh9O', 487, '2025-05-17 13:42:14', '2025-05-17 13:42:14'),
(170, 'lakshitha bhagyanath', 'lakshithabhagya@gmail.com', '0787814618', 'I have gained a strong foundation in various aspects of management, including business strategy, organizational behavior, and project management.I am confident that my dedication, willingness to learn, and strong academic background make me a suitable candidate for this position', 113, 27, 'name@gmail.com', '/tmp/phpvuiflbfh9cvj4V3pEhu', 513, '2025-05-17 14:17:24', '2025-05-17 14:17:24'),
(171, 'Chamodhi Wijayawardana', 'chamodhiwijayawardana@gmail.com', '0762518086', 'chamodhiwijayawardana@gmail.com', NULL, 290, 'hr.milkybakers@gmail.com', '/tmp/phpk2nl6p8ko7k2fMCbyTO', 1008, '2025-05-17 16:10:44', '2025-05-17 16:10:44'),
(172, 'lakshitha bhagyanath', 'lakshithabhagya@gmail.com', '0787814618', 'I have gained a strong foundation in various aspects of management, including business strategy, organizational behavior, and project management.I am confident that my dedication, willingness to learn, and strong academic background make me a suitable candidate for this position', NULL, 50, 'careers@sliit.lk', '/tmp/phpflsftl7rdm3geykuSUB', 558, '2025-05-17 16:34:45', '2025-05-17 16:34:45'),
(173, 'Rathnayaka Liyanage Nayomi Heshani Buddhima', 'ssbuddhima@gamil.com', '0719248509', 'Geography special degree (University of sri Jayewardenepura )', NULL, 190, 'info@jobads.lk', '/tmp/phpupep2trspaq48ktHIcE', 1038, '2025-05-17 19:50:46', '2025-05-17 19:50:46'),
(174, 'Rathnayaka Liyanage Nayomi Heshani Buddhima', 'ssbuddhima@gamil.com', '0719248509', 'Geography special degree (University of sri Jayewardenepura )', NULL, 190, 'info@jobads.lk', '/tmp/php3k7rprj2hldscVzmAeZ', 1038, '2025-05-17 19:50:52', '2025-05-17 19:50:52'),
(175, 'Rathnayaka Liyanage Nayomi Heshani Buddhima', 'ssbuddhima@gmail.com', '0719248509', 'Geography special degree', NULL, 190, 'info@jobads.lk', '/tmp/phpdnvro45mk46cfVVDBNL', 1026, '2025-05-17 19:54:39', '2025-05-17 19:54:39'),
(176, 'Hasindu chamod rajapaksha', 'chamodhasidu28@gmail.com', '0715970746', 'Sir i have not job experience . I will need to get the good job experience .', NULL, 299, 'careers@accsence.lk', '/tmp/phph5mennh5ivus1l2R3Cr', 1029, '2025-05-18 07:56:39', '2025-05-18 07:56:39'),
(177, 'Vishagan', 'mahendran.vishagan@gmail.com', '0777241757', 'Store assistant', NULL, 27, 'name@gmail.com', '/tmp/php1gf93gf76tpb6Cednj2', 589, '2025-05-18 12:06:28', '2025-05-18 12:06:28'),
(178, 'Deshani Danushika Jayawardana', 'danushikadeshani077@gmail.com', '0764230833', 'Dear Hiring Team,\r\n\r\nI hope this message finds you well. I am writing to express my interest in the Intern – Divisional Lean Enterprise opportunity at MAS Capital – Active, Nawala.\r\n\r\nI am a recent graduate in Applied Mathematics from the University of Colombo, with strong analytical skills and a solid foundation in descriptive and predictive data analysis. I am proficient in Microsoft Office and analytical tools, and I am excited about the opportunity to support your factory strategy and digitization initiatives.\r\n\r\nPlease find my resume attached for your review. I would be grateful for the opportunity to contribute to your dynamic and forward-thinking team.\r\n\r\nThank you for your time and consideration.\r\n\r\nBest regards,\r\nDeshani Danushika Jayawardana', NULL, 84, 'careers@mas.com', '/tmp/phpe320b5phngufeAl9rnm', 634, '2025-05-18 17:09:11', '2025-05-18 17:09:11'),
(179, 'ama ishadi chathurangi', 'amaishadeechathurangi@gmail.com', '0754449105', 'apply job vacancy', NULL, 307, 'careers@rokyholdings.com', '/tmp/php2fb5v2c4g54f3yJWlhD', 1120, '2025-05-18 17:30:48', '2025-05-18 17:30:48'),
(180, 'Isuru Sanjula Rajapaksha', 'isuru.rajapaksha08@gmail.com', '0776181356', 'I hope a good response', NULL, 211, 'hr@itgallery.lk', '/tmp/phpkve0tbclh7d2d97yx9q', 818, '2025-05-18 20:10:34', '2025-05-18 20:10:34'),
(181, 'Isuru Sanjula Rajapaksha', 'isuru.rajapaksha08@gmail.com', '0776181356', 'I hope a good response', NULL, 225, 'careers@apts.lk', '/tmp/phpl5cedhv7nkre60T2LwB', 848, '2025-05-18 20:12:31', '2025-05-18 20:12:31'),
(182, 'Bawanthi Elvitigala', 'bawanthimadushika@gmail.com', '0769786528', 'Applying for the vacancy of Accounts Assistant', NULL, 299, 'careers@accsence.lk', '/tmp/phptsnvqhs1bhbh7m0RwQh', 1029, '2025-05-19 05:57:07', '2025-05-19 05:57:07'),
(183, 'Ramesh Sanjeewa', 'sanjeevaramesh20@gmail.com', '0717241468', 'I hope to serve to the best of my ability.', 117, 190, 'info@jobads.lk', '/tmp/phpa9lebmm623afauuQjV5', 822, '2025-05-19 07:21:00', '2025-05-19 07:21:00'),
(184, 'Suranga Dissanayaka', 'surangadissanayaka@live.com', '0711160170', 'Please find my attached CV', NULL, 27, 'name@gmail.com', '/tmp/phpgi8jv0s3mnmh7ROU3Yf', 584, '2025-05-19 08:43:45', '2025-05-19 08:43:45'),
(185, 'H.P.Shashikala Madhurenu', 'smadhurenu2000@gmail.com', '0704330808', 'Dear Sir or Medam,\r\n\r\nI am writing to express my interest in the position of Junior Executive - finane. My qualifications, skills, and experience align closely with your requirements for this role.\r\n\r\nPlease find my CV attached for your review. I would be delighted to discuss how I can contribute to your team and look forward to hearing from you soon about this exciting opportunity.\r\n\r\nKind regards,\r\nH.P.S.Madhurenu', NULL, 61, 'sonaklanka@gmail.com', '/tmp/phphectub9u6cu2bVbiEaJ', 579, '2025-05-19 08:57:16', '2025-05-19 08:57:16'),
(186, 'H.P.Shashikala Madhurenu', 'smadhurenu2000@gmail.com', '0704330808', 'Dear Sir or Medam,\r\n\r\nI am writing to express my interest in the position of Junior Executive - finane. My qualifications, skills, and experience align closely with your requirements for this role.\r\n\r\nPlease find my CV attached for your review. I would be delighted to discuss how I can contribute to your team and look forward to hearing from you soon about this exciting opportunity.\r\n\r\nKind regards,\r\nH.P.S.Madhurenu', NULL, 61, 'sonaklanka@gmail.com', '/tmp/php0pomka3u84h32rsiqxm', 579, '2025-05-19 09:10:09', '2025-05-19 09:10:09'),
(187, 'H.P.Shashikala Madhurenu', 'smadhurenu2000@gmail.com', '0704330808', 'Dear Sir or Medam,\r\n\r\nI am writing to express my interest in the position of Junior Executive - finance. My qualifications, skills, and experience align closely with your requirements for this role.\r\n\r\nPlease find my CV attached for your review. I would be delighted to discuss how I can contribute to your team and look forward to hearing from you soon about this exciting opportunity.\r\n\r\nKind regards,\r\nH.P.S.Madhurenu', NULL, 61, 'sonaklanka@gmail.com', '/tmp/phptnnl3177tfs4by7vwJn', 579, '2025-05-19 09:13:31', '2025-05-19 09:13:31'),
(188, 'MOHAMED IRFAN MUSTHAFA', 'irfanmmm@gmail.com', '0750637957', 'Kindly consider my resume for the above position.  Regards', NULL, 318, 'PHAMTHU@movenpick.com', '/tmp/php83rp3gk45n4o3imqI9Z', 1078, '2025-05-19 11:14:49', '2025-05-19 11:14:49'),
(189, 'MOHAMED IRFAN MUSTHAFA', 'irfanmmm@gmail.com', '0750637957', 'Kindly consider my resume for the above position.  Regards', NULL, 211, 'hr@itgallery.lk', '/tmp/phpm9lfop3hltbh1DLwuRC', 818, '2025-05-19 11:16:43', '2025-05-19 11:16:43'),
(190, 'MOHAMED IRFAN MUSTHAFA', 'irfanmmm@gmail.com', '0750637957', 'Kindly consider my resume for the above position.  Regards', NULL, 59, 'careers@abansgroup.com', '/tmp/php1lbekigvg5p6dXPYNTc', 573, '2025-05-19 11:18:22', '2025-05-19 11:18:22'),
(191, 'Abdull hai', 'abdullhai0607@gamil.com', '0762059796', 'Online assistant', NULL, 55, 'careers@dhl.com', '/tmp/php23qismpl6pcp5vmNqIM', 564, '2025-05-19 13:36:26', '2025-05-19 13:36:26'),
(192, 'Ruchini sathyangana', 'ruchinisathyangana7788@gmail.com', '0718968519', 'I like to apply for this vacancy.', NULL, 190, 'info@jobads.lk', '/tmp/phpsgahg6lgtpoe4X5y71T', 1134, '2025-05-19 14:17:27', '2025-05-19 14:17:27'),
(193, 'Ruchini sathyangana', 'ruchinisathyangana7788@gmail.com', '0718968519', 'I like to apply for this vacancy.', NULL, 190, 'info@jobads.lk', '/tmp/phpgk94jqndpk5daCVGkR7', 1134, '2025-05-19 14:17:29', '2025-05-19 14:17:29'),
(194, 'Ruchini sathyangana', 'ruchinisathyangana7788@gmail.com', '0718968519', 'I like to apply for this job.', NULL, 299, 'careers@accsence.lk', '/tmp/phpbh1aual0s8m7e8wX9ob', 1029, '2025-05-19 14:19:39', '2025-05-19 14:19:39'),
(195, 'Manushi Thilakarathna', 'manushithilakarathna92@gmail.com', '0720571345', 'Application for trainee staff assistant', NULL, 190, 'info@jobads.lk', '/tmp/php6ockiadphn2a9Lj3uxt', 1013, '2025-05-19 16:03:13', '2025-05-19 16:03:13'),
(196, 'Rakmitha', 'rmansanda@gmail.com', '0782370290', '.', NULL, 186, 'dgvacancy2023@gmail.com', '/tmp/phpib805kao8q7ccdXuT3G', 775, '2025-05-19 16:43:23', '2025-05-19 16:43:23'),
(197, 'Rusiru Udantha Karunarathna', 'rusiru.udantha01@gmail.com', '0718896228', 'Dear Hiring Team,\r\n\r\nI am very interested in the IT Administrator position. I have experience in IT support, networking, and system maintenance. I am passionate about technology and always willing to learn and grow. I would be grateful for the opportunity to contribute to your team.\r\n\r\nThank you for considering my application.\r\n\r\nBest regards,\r\nRusiru Udantha', NULL, 318, 'PHAMTHU@movenpick.com', '/tmp/phpg9v38e707539fN8khzt', 1078, '2025-05-19 18:26:33', '2025-05-19 18:26:33'),
(198, 'Mohamed Thalif', 'mohamedthalifziyawdeen@gmail.com', '0778733623', 'Experienced Pastry & Bakery Commis with 5+ years in professional kitchens, including top-tier hotels and fine dining in Kuwait. Skilled in crafting a variety of baked goods and desserts with focus on quality, creativity, and hygiene. Team-oriented, detail-driven, and committed to excellence in every dish.', NULL, 27, 'name@gmail.com', '/tmp/phpclqad5s7i4g7bk7XWRX', 529, '2025-05-19 19:58:48', '2025-05-19 19:58:48'),
(199, 'Mohamed Thalif', 'mohamedthalifziyawdeen@gmail.com', '778733623', 'Experienced Pastry & Bakery Commis with 5+ years in professional kitchens, including top-tier hotels and fine dining in Kuwait. Skilled in crafting a variety of baked goods and desserts with focus on quality, creativity, and hygiene. Team-oriented, detail-driven, and committed to excellence in every dish.', NULL, 27, 'name@gmail.com', '/tmp/phppb9blqpodhm4bg9dqr0', 529, '2025-05-19 19:59:03', '2025-05-19 19:59:03'),
(200, 'Mohamed Thalif', 'mohamedthalifziyawdeen@gmail.com', '0094778733623', 'Experienced Pastry & Bakery Commis with 5+ years in professional kitchens, including top-tier hotels and fine dining in Kuwait. Skilled in crafting a variety of baked goods and desserts with focus on quality, creativity, and hygiene. Team-oriented, detail-driven, and committed to excellence in every dish.', NULL, 27, 'name@gmail.com', '/tmp/php8505d7etkc970uPInJl', 529, '2025-05-19 21:10:24', '2025-05-19 21:10:24'),
(201, 'Udeshika Adhikari', 'udheshikaadhikari123@gmail.com', '0717893590', 'Dear Sir/Madam,\r\n\r\nI am writing to express my interest in the position of office Assisstant  as advertised recently. My qualifications, skills, and experience align closely with your requirements for this role.\r\n\r\nPlease find my CV and supporting documents attached for your review. I would be delighted to discuss how I can contribute to your team and look forward to hearing from you soon about this exciting opportunity.\r\n\r\n \r\nBest regards,\r\nUdeshika Adhikari', NULL, 27, 'name@gmail.com', '/tmp/phpmd6b4q6va0ph36yMxPH', 491, '2025-05-19 22:45:57', '2025-05-19 22:45:57'),
(202, 'Niroshan', 'jsniroshan@gmail.com', '0752930521', 'Good morning Madam/sir.\r\nI have been a teacher since 2018 and I have experience with the local as well as the students from other countries. I would be grateful if I am chosen for the post of Secretory and students coordinator.\r\nThank you', NULL, 190, 'info@jobads.lk', '/tmp/php50q128ced9665fdxOgj', 825, '2025-05-20 06:48:00', '2025-05-20 06:48:00'),
(203, 'D.M Mahesh Buddhika', 'Maheshbuddhika314@gmail.com', '0719753035', 'im ok', NULL, 27, 'name@gmail.com', '/tmp/phpdi8s0i1d7etrdlf68Wi', 580, '2025-05-20 08:12:24', '2025-05-20 08:12:24'),
(204, 'Saibuthamby Mohamed Siyad', 'stmsiyad@gmail.com', '0777415596', 'I have 16 Years experience in the financial sector', NULL, 27, 'name@gmail.com', '/tmp/phpoc8gje46klr6cP5YCY5', 493, '2025-05-20 09:40:54', '2025-05-20 09:40:54'),
(205, 'Saibuthamby Mohamed Siyad', 'stmsiyad@gmail.com', '0777415596', 'I have 16 Years experience in the financial sector', NULL, 27, 'name@gmail.com', '/tmp/phpfhk9uoivogul2ROWp2E', 493, '2025-05-20 09:41:05', '2025-05-20 09:41:05'),
(206, 'Saibuthamby Mohamed Siyad', 'stmsiyad@gmail.com', '0777415596', 'I have 16 years experience in the banking sector', NULL, 87, 'careers@primelands.lk', '/tmp/php2chp4mk9pk4l3ESJjYw', 638, '2025-05-20 09:51:40', '2025-05-20 09:51:40'),
(207, 'S.Logasundaram', 'Logeshsomu2000@gmail.com', '0763319930', 'Somasundaram Logasundaram\r\nNo 03, New Colony\r\nNorwood, 22058\r\n+94763319930\r\nlogeshsomu2000@gmail.com\r\n\r\nHR Manager\r\nHoliday Tribes (PVT) Ltd,\r\nColombo, Sri Lanka\r\n\r\nDear Sir/Madam,\r\n\r\nApplication for Internship - Tour Consultant\r\n\r\nI am writing to express my keen interest in the internship opportunity at Holiday Tribes (PVT) Ltd, as advertised. I am currently following a bachelor\'s degree in tourism at Sabaragamuwa University of Sri Lanka, and as part of my academic program, I am seeking an internship placement to gain practical experience in the travel and tourism industry.\r\n\r\nWith a strong passion for promoting Sri Lanka\'s diverse cultural and natural attractions, I am particularly impressed by Holiday Tribes (PVT) Ltd, commitment to delivering personalized and unforgettable travel experiences. I am eager to contribute to your honorable company by supporting itinerary planning, client coordination, and travel consulting services.\r\n\r\nDuring my studies, I have developed a solid understanding of tourism operations, customer service, and destination management. I am confident in my communication skills, detail orientation, and ability to work collaboratively in dynamic environments. I am also intermediate in English and have a working knowledge of Tamil and Sinhala, which I believe will be an asset in interacting with international travelers.\r\n\r\nI would be grateful for the opportunity to join your team and further develop my professional skills while contributing positively to your operations. I am available for an interview at your earliest convenience and look forward to the possibility of working with Holiday Tribes (PVT) Ltd.\r\nI have uploaded my CV\r\n\r\nThank you for considering my application.\r\n\r\nYours sincerely,\r\nS.Logasundaram', NULL, 237, 'contact@holidaytrines.com', '/tmp/phpne486cf1ko7mbA3xBFB', 872, '2025-05-20 10:24:30', '2025-05-20 10:24:30'),
(208, 'H.P.Shashikala Madhurenu', 'smadhurenu2000@gmail.com', '0704330808', 'Dear Sir or Medam,\r\n\r\nI am writing to express my interest in the position of account assistant. My qualifications, skills, and experience align closely with your requirements for this role.\r\n\r\nPlease find my CV attached for your review. I would be delighted to discuss how I can contribute to your team and look forward to hearing from you soon about this exciting opportunity.\r\n\r\nKind regards,\r\nH.P.S.Madhurenu', NULL, 186, 'dgvacancy2023@gmail.com', '/tmp/php9gsbodrb8vjt4g80xof', 775, '2025-05-20 10:24:55', '2025-05-20 10:24:55'),
(209, 'H.P.Shashikala Madhurenu', 'smadhurenu2000@gmail.com', '0704330808', 'Dear Sir or Medam,\r\n\r\nI am writing to express my interest in the position of account assistant. My qualifications, skills, and experience align closely with your requirements for this role.\r\n\r\nPlease find my CV attached for your review. I would be delighted to discuss how I can contribute to your team and look forward to hearing from you soon about this exciting opportunity.\r\n\r\nKind regards,\r\nH.P.S.Madhurenu', NULL, 299, 'careers@accsence.lk', '/tmp/php8o0fqoc177i4fGsAIMs', 1029, '2025-05-20 10:33:33', '2025-05-20 10:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `swift_code` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `localorforeign` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `account_name`, `account_no`, `bank_code`, `branch_code`, `branch_name`, `swift_code`, `currency`, `logo`, `localorforeign`, `created_at`, `updated_at`) VALUES
(7, 'Bank of Ceylon', 'JSG Ceylon (Pvt) Ltd', '93961634', '7010', '757', 'Athurugiriya', 'BCEYLKLX', 'LKR', 'bank-logos/opKF3aLQi7IOx8nZHa4jvT2hlmmb9wqQWYpOeV5h.png', 'local', '2025-02-01 00:57:08', '2025-02-24 22:33:55'),
(8, 'National Development Bank PLC', 'JSG Ceylon (Pvt) Ltd', '111000242825', '7214', '001', 'Nawam Mawatha', 'NDBSLKLX', 'LKR', 'bank-logos/t4OnXB9LzXsupI23Mkb83LVEAk4utwY8sDIsmEc5.png', 'local', '2025-02-01 00:57:35', '2025-02-24 22:32:45'),
(10, 'Hatton National Bank', 'JSG Ceylon (Pvt) Ltd', '154010013588', '7083', '154', 'Athurugiriya', 'HBLILKLX', 'LKR', 'bank-logos/AqUE4ofbuD8vwcQRnD6ATpi4Yk201bn3UCG7KYtB.png', 'local', '2025-02-01 00:58:41', '2025-02-24 20:02:12'),
(11, 'Bank of Ceylon', 'JSG Ceylon (Pvt) Ltd', '93965091', '7010', '757', 'Athurugiriya', 'BCEYLKLX', 'USD', 'bank-logos/xD40oej0zzuWIAk8KocynTE9aOlIOfZyCCEl04qd.png', 'foreign', '2025-02-01 00:59:17', '2025-02-24 22:34:16');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Stores the payment method: online, contact_contributor',
  `placement` enum('banner','category_page') NOT NULL DEFAULT 'banner' COMMENT 'Indicates if the banner is for the main banner or category page',
  `rejection_reason` text DEFAULT NULL COMMENT 'Stores the reason for rejection if banner is rejected',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','published','rejected') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `image`, `category_id`, `package_id`, `employer_id`, `payment_method`, `placement`, `rejection_reason`, `admin_id`, `created_at`, `updated_at`, `status`) VALUES
(24, 'jhgj', NULL, 'banner_images/nFopiwZNIHJdEFleZRpEz2ApkrvGi7TDp4977n6G.png', NULL, 3, 1, 'contact_admin', 'category_page', NULL, 1, '2025-02-04 22:45:18', '2025-02-06 12:41:30', 'published'),
(27, 'Recruitments', NULL, 'banner_images/XesgVZZ9TexWSBuF6tTVMfSevbqeAMScjgAckew2.jpg', NULL, 3, 8, 'contact_admin', 'category_page', NULL, 1, '2025-02-06 20:26:09', '2025-02-06 20:26:20', 'published'),
(28, 'Recruitment Full', NULL, 'banner_images/hmn0m9Pox2pp67k1J285Xw9bNQyptbhvOeC3rUC1.jpg', NULL, 3, 5, 'contact_admin', 'banner', NULL, 1, '2025-02-08 15:06:35', '2025-02-08 15:06:44', 'published'),
(29, 'Recruitment', NULL, 'banner_images/NYkklsiS08WsiWOaS0mFHFWhANh2Y8cR308aEDV3.jpg', NULL, 3, 5, 'contact_admin', 'banner', NULL, 1, '2025-02-08 15:07:17', '2025-02-08 15:07:29', 'published'),
(32, 'Recruitment New', NULL, 'banner_images/iZ0PI1r1uijnoIJgrvZ65mV4fUgkXfEn5Kb2THcG.jpg', NULL, 3, 5, 'contact_admin', 'category_page', NULL, 1, '2025-02-08 22:03:04', '2025-02-08 22:03:12', 'published'),
(33, 'Job advertisements', NULL, 'banner_images/G72UdSrZfCvlgheHZEbUm90Mh59eb9gd4AxCDVPm.jpg', NULL, 4, 5, 'contact_admin', 'banner', NULL, 1, '2025-02-16 09:13:17', '2025-02-16 09:13:29', 'published'),
(34, 'Full Service', NULL, 'banner_images/WLFRqQroEw72kyt2Su5GljFUwgzEgbxSQcn0UqBa.jpg', NULL, 4, 5, 'contact_admin', 'banner', NULL, 1, '2025-02-16 09:15:42', '2025-02-16 09:15:48', 'published'),
(36, 'Orange', NULL, 'banner_images/j17V8EKcQ5GahUZY8xZH4hJ2DMgRlkVmruVKOHPv.jpg', NULL, 4, 5, 'contact_admin', 'category_page', NULL, 1, '2025-02-16 09:21:55', '2025-02-16 09:22:06', 'published'),
(37, 'Green', NULL, 'banner_images/R1kaHz81lrh7lz4Nvt5q7s8gTksOQbScHt5ZKskt.jpg', NULL, 4, 5, 'contact_admin', 'category_page', NULL, 1, '2025-02-16 09:23:39', '2025-02-16 09:23:53', 'published'),
(38, 'Category Job Seeker', NULL, 'banner_images/6Wqpi5S8N4GAyri4DclTMV6Ix3OzxPiWY3vIdeJF.jpg', NULL, 4, 5, 'contact_admin', 'category_page', NULL, 1, '2025-02-17 17:20:24', '2025-02-17 17:20:29', 'published'),
(39, 'Employers', NULL, 'banner_images/pRnDjCvHWqrCFLXcDo4xtDZTUWSqHYMCJuuWqJbc.jpg', NULL, 4, 8, 'contact_admin', 'banner', NULL, 1, '2025-03-13 10:46:41', '2025-03-13 10:46:49', 'published'),
(40, 'Employer', NULL, 'banner_images/jgvebFwmOIME2KnZU1793a0gMHDsdJJMOJ6jYy5H.jpg', NULL, 4, 8, 'contact_admin', 'banner', NULL, 1, '2025-03-13 10:47:37', '2025-03-13 10:47:46', 'published'),
(41, 'Job Seekers', NULL, 'banner_images/2egPBSAa6iPtuWT1GaAlydESAcmCV6gfdrsppjas.jpg', NULL, 4, 8, 'contact_admin', 'category_page', NULL, 1, '2025-03-13 10:49:23', '2025-03-13 10:49:33', 'published'),
(42, 'Employer', NULL, 'banner_images/phhRQkrkOo9jk4tZ7dbQJzy8cGnRV0raGc2TUR6K.jpg', NULL, 4, 8, 'contact_admin', 'category_page', NULL, 1, '2025-03-13 10:51:49', '2025-03-13 10:52:03', 'published'),
(43, 'Employer', NULL, 'banner_images/hF6udjyWoG0poXP4wZKNVJ6RZc0J4vwdJY8tQE3k.jpg', NULL, 4, 8, 'contact_admin', 'banner', NULL, 1, '2025-04-05 14:20:18', '2025-04-05 14:20:29', 'published'),
(44, 'Employee', NULL, 'banner_images/AOL9FaKrIprycGFx7YadOksX54BSTmqPin1PDedM.jpg', NULL, 4, 8, 'contact_admin', 'banner', NULL, 1, '2025-04-05 14:21:25', '2025-04-05 14:21:33', 'published'),
(45, 'Category', NULL, 'banner_images/wwF5eibPbUorJ4gPj4UdVbApWFaqGk7KJIPm0sRN.jpg', NULL, 4, 8, 'contact_admin', 'category_page', NULL, 1, '2025-04-05 14:22:13', '2025-04-05 14:24:05', 'published'),
(46, 'Employee', NULL, 'banner_images/3mcM9kLrOZYakL1ZkmIZ4gjTVmZMK4uDkrsmoob4.jpg', NULL, 4, 8, 'contact_admin', 'category_page', NULL, 1, '2025-04-05 14:22:54', '2025-04-05 14:23:41', 'published'),
(47, 'Employers', NULL, 'banner_images/MOX8X3W3FDvvLNfIyEhUF85s8RiwkXVvU6Mwn2rt.jpg', NULL, 4, 8, 'contact_admin', 'banner', NULL, 1, '2025-05-11 11:42:37', '2025-05-11 11:42:49', 'published'),
(48, 'Full Recruitment', NULL, 'banner_images/Wlj45KgyukV1znG5HkgbL1EOus2Z3kocAIbPQt5a.jpg', NULL, 4, 5, 'contact_admin', 'banner', NULL, 1, '2025-05-11 11:44:06', '2025-05-11 11:44:12', 'published'),
(49, 'Employees', NULL, 'banner_images/lroVZ6zjt5ci1yHcXyGdcOUpdOkKP8oFp7RMufBX.jpg', NULL, 4, 5, 'contact_admin', 'category_page', NULL, 1, '2025-05-11 11:45:11', '2025-05-11 11:45:21', 'published'),
(50, 'Employee', NULL, 'banner_images/blMs6z42eYXrsa9TvkHFRloY8HxEBiSOrqpiNtHE.jpg', NULL, 4, 5, 'contact_admin', 'category_page', NULL, 1, '2025-05-11 11:46:10', '2025-05-11 11:46:17', 'published'),
(51, 'JobAds.lk', NULL, 'banner_images/qHhtnxafjWF3Gy67KG897zfEO7kDr8xZrA8xIM9I.png', NULL, 4, 5, 'contact_admin', 'banner', NULL, 1, '2025-05-14 18:41:19', '2025-05-14 18:41:28', 'published'),
(52, 'WhatsApp Channel', NULL, 'banner_images/GDDlfhXQg9RQExMurEvT7QYaYlRY51ov8t3fvVKh.jpg', NULL, 4, 5, 'contact_admin', 'category_page', NULL, 1, '2025-05-14 18:42:08', '2025-05-14 18:42:14', 'published');

-- --------------------------------------------------------

--
-- Table structure for table `banner_details`
--

CREATE TABLE `banner_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `effective_date` date NOT NULL,
  `mbsize` varchar(255) NOT NULL,
  `cbsize` varchar(255) NOT NULL,
  `description_one` text NOT NULL,
  `description_two` text NOT NULL,
  `description_three` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banner_details`
--

INSERT INTO `banner_details` (`id`, `email`, `effective_date`, `mbsize`, `cbsize`, `description_one`, `description_two`, `description_three`, `created_at`, `updated_at`) VALUES
(1, 'jobads@jobads.lk', '2025-03-01', '100*200', '200*100', '<p><span style=\"color: rgb(255, 255, 0);\">hello world</span></p>', '<p><em><u>hello world</u></em></p>', '<p><strong>hello world</strong></p>', '2025-02-01 00:20:53', '2025-02-01 00:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `banner_packages`
--

CREATE TABLE `banner_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `duration_id` bigint(20) UNSIGNED NOT NULL,
  `price_lkr` decimal(10,2) NOT NULL DEFAULT 0.00,
  `price_usd` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_packages`
--

INSERT INTO `banner_packages` (`id`, `duration_id`, `price_lkr`, `price_usd`, `created_at`, `updated_at`) VALUES
(3, 3, 1500.00, 20.00, '2025-02-04 22:42:18', '2025-02-04 22:42:18'),
(4, 4, 5000.00, 30.00, '2025-02-13 11:29:16', '2025-02-13 11:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'IT & Software Development', 'active', '2025-01-27 20:02:43', '2025-01-27 20:02:43'),
(2, 'Engineering & QS', 'active', '2025-01-27 20:03:08', '2025-03-01 20:49:27'),
(3, 'Accounting, Auditing & Finance', 'active', '2025-01-27 20:03:26', '2025-01-29 21:23:49'),
(4, 'Sales & Marketing', 'active', '2025-01-27 20:03:44', '2025-01-29 21:22:17'),
(5, 'Customer Support / BPO', 'active', '2025-01-27 20:04:06', '2025-01-27 20:04:06'),
(6, 'Education & Training', 'active', '2025-01-27 20:04:27', '2025-01-27 20:04:27'),
(7, 'Healthcare & Pharmaceuticals', 'active', '2025-01-27 20:04:46', '2025-01-27 20:04:46'),
(8, 'Human Resources', 'active', '2025-01-27 20:05:07', '2025-01-27 20:05:07'),
(9, 'Legal & Counseling', 'active', '2025-01-27 20:05:27', '2025-02-27 22:17:28'),
(10, 'Media & Advertising', 'active', '2025-01-27 20:05:43', '2025-01-27 20:05:43'),
(11, 'Logistics/ Supply Chain/ Warehousing', 'active', '2025-01-27 20:06:01', '2025-03-01 20:57:07'),
(12, 'Construction & Real Estates', 'active', '2025-01-27 20:06:36', '2025-01-29 21:25:24'),
(13, 'Hospitality & Tourism', 'active', '2025-01-27 20:06:53', '2025-01-27 20:06:53'),
(14, 'Freelance & Remote Work', 'active', '2025-01-27 20:07:13', '2025-01-27 20:07:13'),
(15, 'Art & Design', 'active', '2025-01-27 20:07:35', '2025-01-27 20:07:35'),
(16, 'Writing & Content Creation', 'active', '2025-01-27 20:07:56', '2025-01-27 20:07:56'),
(17, 'Data Analysis', 'active', '2025-01-27 20:08:13', '2025-01-27 20:08:13'),
(18, 'Machine Learning & AI, Robotic', 'active', '2025-01-27 20:08:32', '2025-05-12 09:27:02'),
(19, 'Cloud Computing, Cybersecurity', 'active', '2025-01-27 20:08:51', '2025-03-29 19:41:49'),
(20, 'Beauty Salon Professional', 'active', '2025-01-27 20:09:06', '2025-03-29 19:44:17'),
(21, 'Corporate/ Business Management', 'active', '2025-01-27 20:09:23', '2025-01-29 21:27:41'),
(22, 'Retail & Wholesale', 'active', '2025-01-27 20:09:40', '2025-01-27 20:09:40'),
(23, 'Banking & Insurance', 'active', '2025-01-27 20:10:11', '2025-01-27 20:10:11'),
(24, 'Public Sector & Government', 'active', '2025-01-27 20:10:27', '2025-01-27 20:10:27'),
(26, 'Agriculture & Farming', 'active', '2025-01-27 20:10:54', '2025-01-27 20:10:54'),
(27, 'Environmental Science', 'active', '2025-01-27 20:11:13', '2025-01-27 20:11:13'),
(28, 'Renewable Energy', 'active', '2025-01-27 20:11:30', '2025-01-27 20:11:30'),
(29, 'Gems & Jewelry', 'active', '2025-01-27 20:11:43', '2025-03-02 21:28:08'),
(30, 'Automotive & Automobile', 'active', '2025-01-27 20:11:58', '2025-03-29 19:44:54'),
(31, 'Food & Beverage', 'active', '2025-01-27 20:12:12', '2025-01-27 20:12:12'),
(32, 'Fashion & Textile', 'active', '2025-01-27 20:12:27', '2025-01-27 20:12:27'),
(33, 'Video Animation/Gaming Industry', 'active', '2025-01-27 20:12:42', '2025-05-12 09:30:55'),
(35, 'Electronics & Hardware', 'active', '2025-01-27 20:13:11', '2025-01-27 20:13:11'),
(36, 'Manufacturing & Production', 'active', '2025-01-27 20:13:27', '2025-01-27 20:13:27'),
(37, 'R&D/Lab/Science', 'active', '2025-01-27 20:13:42', '2025-04-29 14:58:21'),
(38, 'Entertainment, Event/Project Management', 'active', '2025-01-27 20:13:55', '2025-03-29 19:49:08'),
(39, 'Sports & Recreation', 'active', '2025-01-27 20:14:10', '2025-01-27 20:14:10'),
(42, 'Plantation', 'active', '2025-02-10 21:17:22', '2025-02-10 21:17:22'),
(43, 'Leasing/Micro Finance/ Gold Loan', 'active', '2025-02-10 21:18:19', '2025-02-27 22:19:48'),
(44, 'Apparel', 'active', '2025-02-10 21:27:56', '2025-02-10 21:27:56'),
(45, 'All', 'active', '2025-02-24 21:52:34', '2025-05-07 18:37:17'),
(46, 'Administration & Operation', 'active', '2025-02-24 21:53:17', '2025-02-24 21:53:17'),
(47, 'Airline & Ticketing', 'active', '2025-02-26 21:15:07', '2025-02-26 21:15:07'),
(48, 'Interior & Design', 'active', '2025-02-26 22:15:23', '2025-02-26 22:15:23'),
(49, 'Maintenance/Repair', 'active', '2025-02-27 22:20:47', '2025-02-27 22:20:47'),
(50, 'Technician, Maintenance, Repair', 'active', '2025-03-29 19:53:42', '2025-03-29 19:53:42'),
(51, 'Drivers/Helpers/House Maid', 'active', '2025-05-12 10:06:55', '2025-05-12 10:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `logo_img` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `email`, `phone`, `address`, `logo_img`, `created_at`, `updated_at`) VALUES
(1, 'jobs@jobads.lk', '+94 777 580 451', 'No 0001, Kaduwela Road, Athurugiriya, Colombo ,Sri Lanka', 'contactus/OjdlzDyMLWuEZajZEhzDtXdNZ89R8tNwY5SYkIKv.png', '2025-01-27 20:53:20', '2025-04-20 21:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `contact_list`
--

CREATE TABLE `contact_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_list`
--

INSERT INTO `contact_list` (`id`, `name`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Surendra', '0777 580 451', '2025-01-27 20:54:09', '2025-02-24 20:31:31'),
(2, 'Shalini', '0777 580 452', '2025-01-27 20:54:09', '2025-02-24 20:31:44'),
(3, 'Saman', '0777 580 462', '2025-02-10 21:53:06', '2025-02-24 20:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sri Lanka', '2025-01-27 20:22:40', '2025-01-27 20:22:40'),
(2, 'USA', '2025-01-27 20:22:50', '2025-01-27 20:22:50'),
(3, 'India', '2025-01-27 20:23:02', '2025-01-27 20:23:02'),
(4, 'UK', '2025-01-27 20:23:10', '2025-01-27 20:23:10'),
(5, 'UAE', '2025-01-27 20:23:18', '2025-01-27 20:23:18'),
(6, 'Dubai', '2025-01-27 20:23:28', '2025-01-27 20:23:28'),
(8, 'Latvia', '2025-02-03 11:41:01', '2025-02-03 11:41:01'),
(9, 'Japan', '2025-02-03 16:47:01', '2025-02-03 16:47:01'),
(10, 'Bangladesh', '2025-02-03 16:47:19', '2025-02-03 16:47:19'),
(11, 'Maldives', '2025-02-03 16:47:50', '2025-02-03 16:47:50'),
(12, 'Oman', '2025-02-03 16:48:19', '2025-02-03 16:48:19'),
(13, 'Pakisthan', '2025-02-03 16:48:43', '2025-02-03 16:48:43'),
(14, 'Singapore', '2025-02-03 16:48:57', '2025-02-03 16:48:57'),
(15, 'Malaysia', '2025-02-03 16:49:08', '2025-02-03 16:49:08'),
(16, 'Botswana', '2025-02-03 16:49:23', '2025-02-03 16:49:23'),
(17, 'Qatar', '2025-02-03 16:49:35', '2025-02-03 16:49:35'),
(18, 'New Zeeland', '2025-02-03 16:49:56', '2025-02-03 16:49:56'),
(19, 'Australia', '2025-02-03 16:50:05', '2025-02-03 16:50:05'),
(20, 'South Africa', '2025-02-03 16:50:25', '2025-02-03 16:50:25'),
(21, 'Indonesia', '2025-02-03 16:50:42', '2025-02-03 16:50:42'),
(22, 'Thailand', '2025-02-03 16:51:03', '2025-02-03 16:51:03'),
(23, 'Myanmar', '2025-02-03 16:51:14', '2025-02-03 16:51:14'),
(24, 'China', '2025-02-03 16:51:35', '2025-02-03 16:51:35'),
(25, 'Hong Kong', '2025-02-03 16:51:48', '2025-02-03 16:51:48'),
(26, 'France', '2025-02-03 16:52:04', '2025-02-03 16:52:04'),
(27, 'Canada', '2025-02-03 16:52:36', '2025-02-03 16:52:36'),
(28, 'Bahrain', '2025-02-03 16:55:10', '2025-02-03 16:55:10'),
(29, 'Brazil', '2025-02-03 16:55:33', '2025-02-03 16:55:33'),
(30, 'Bolivia', '2025-02-03 16:56:13', '2025-02-03 16:56:13'),
(31, 'Cayman-Islands', '2025-02-03 16:56:46', '2025-02-03 16:56:46'),
(32, 'Chile', '2025-02-03 16:57:33', '2025-02-03 16:57:33'),
(33, 'Cuba', '2025-02-03 16:57:51', '2025-02-03 16:57:51'),
(34, 'Denmark', '2025-02-03 16:58:13', '2025-02-03 16:58:13'),
(35, 'Egypt', '2025-02-03 16:58:38', '2025-02-03 16:58:38'),
(36, 'Ethiopia', '2025-02-03 16:58:53', '2025-02-03 16:58:53'),
(37, 'Fiji', '2025-02-03 16:59:15', '2025-02-03 16:59:15'),
(38, 'Finland', '2025-02-03 16:59:24', '2025-02-03 16:59:24'),
(39, 'Germany', '2025-02-03 16:59:53', '2025-02-03 16:59:53'),
(40, 'Ireland', '2025-02-03 17:00:32', '2025-02-03 17:00:32'),
(41, 'Iraq', '2025-02-03 17:00:45', '2025-02-03 17:00:45'),
(42, 'Jordan', '2025-02-03 17:00:58', '2025-02-03 17:00:58'),
(43, 'Korea', '2025-02-03 17:01:40', '2025-02-03 17:01:40'),
(44, 'Kenya', '2025-02-03 17:02:34', '2025-02-03 17:02:34'),
(45, 'Kuwait', '2025-02-03 17:03:02', '2025-02-03 17:03:02'),
(46, 'Lebanon', '2025-02-03 17:03:24', '2025-02-03 17:03:24'),
(47, 'Laos', '2025-02-03 17:03:44', '2025-02-03 17:03:44'),
(48, 'Mexico', '2025-02-03 17:04:15', '2025-02-03 17:04:15'),
(49, 'Mongolia', '2025-02-03 17:04:37', '2025-02-03 17:04:37'),
(50, 'Namibia', '2025-02-03 17:04:55', '2025-02-03 17:04:55'),
(51, 'Nepal', '2025-02-03 17:05:13', '2025-02-03 17:05:13'),
(52, 'Norway', '2025-02-03 17:05:36', '2025-02-03 17:05:36'),
(53, 'Panama', '2025-02-03 17:06:18', '2025-02-03 17:06:18'),
(54, 'Poland', '2025-02-03 17:06:28', '2025-02-03 17:06:28'),
(55, 'Philippines', '2025-02-03 17:06:45', '2025-02-03 17:06:45'),
(56, 'Russia', '2025-02-03 17:07:10', '2025-02-03 17:07:10'),
(57, 'Switzerland', '2025-02-03 17:07:42', '2025-02-03 17:07:42'),
(58, 'Uganda', '2025-02-03 17:07:59', '2025-02-03 17:07:59'),
(59, 'Ukraine', '2025-02-03 17:08:19', '2025-02-03 17:08:19'),
(60, 'Vietnam', '2025-02-03 17:08:43', '2025-02-03 17:08:43'),
(61, 'Yemen', '2025-02-03 17:08:56', '2025-02-03 17:08:56'),
(62, 'Zimbabwe', '2025-02-03 17:09:17', '2025-02-03 17:09:17'),
(63, 'Saudi Arabia', '2025-03-01 21:51:06', '2025-03-01 21:51:06'),
(64, 'LIBYA', '2025-03-02 20:56:10', '2025-03-02 20:56:10'),
(65, 'Foreign Jobs', '2025-03-06 21:42:51', '2025-03-06 21:42:51'),
(66, 'Thaiwan', '2025-03-21 06:38:01', '2025-03-21 06:38:01'),
(67, 'Turkey', '2025-03-21 07:23:26', '2025-03-21 07:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `duration`
--

CREATE TABLE `duration` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `duration` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `duration`
--

INSERT INTO `duration` (`id`, `duration`, `type`, `created_at`, `updated_at`) VALUES
(1, '20', 'job', NULL, '2025-04-23 07:32:49'),
(2, '35', 'job', NULL, '2025-05-18 19:09:43'),
(3, '21', 'banner', NULL, '2025-04-29 12:56:56'),
(4, '35', 'banner', NULL, '2025-04-29 12:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_details` varchar(255) DEFAULT NULL,
  `business_info` text DEFAULT NULL,
  `job_posting_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`job_posting_settings`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `logo` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`id`, `company_name`, `email`, `password`, `contact_details`, `business_info`, `job_posting_settings`, `is_active`, `logo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Company1', 'company@gmail.com', '$2y$12$6QLbhc1Ci/EGhdb0yOfq4e6EZfq8DTdiFhunJ2fKl/CqaH5OaTH7m', '0782020201', 'dwgthgtrg', NULL, 0, 'logos/DG85nmx1QBCkdaE5VPXCRfRZKLEtO8mOpu3pWVqB.png', NULL, '2025-01-24 10:26:39', '2025-02-26 20:37:02'),
(2, 'abc Company', 'kavindu@gmail.com', '$2y$12$vTR0ToggX.e.S5qrMPUB2.yTv/ecniMxgrpffkBtKSk4M4CpzSXBq', '0713767045', 'abc Company', NULL, 0, 'logos/XBP7pDjY0xpmtmDlEWrcTCdRMLqFrGGamBWaOE4g.jpg', NULL, '2025-01-29 09:32:52', '2025-03-01 20:07:28'),
(3, 'xyz Company', 'madhushan@gmail.com', '$2y$12$ue87X3dlxdgbAdi0LqVW1.qTReTN3qQiQYUtL6.fIMFae.kPT0zoS', '0713767046', 'aaaaaa', NULL, 0, NULL, NULL, '2025-01-29 15:18:39', '2025-03-01 20:07:39'),
(4, 'cba company', 'pahan@gmail.com', '$2y$12$hTwqrqyCyeBNV5.dmoL6r.7wNbagt79yyIPeYBCRoUTZsNGjT.5HW', '0713767047', 'aaaaaa', NULL, 1, NULL, NULL, '2025-01-29 15:20:44', '2025-01-29 15:20:44'),
(5, 'JSG Ceylon (Pvt) Ltd', '123@jsgceylon.lk', '$2y$12$Le3uxatuW/oMHpNGXUhQJ.PnqkA.N1Akav4K1Ug7eYiYqrg7Sp71O', 'Jeewan', 'HR Manager', NULL, 0, NULL, NULL, '2025-01-29 20:08:09', '2025-03-01 20:07:50'),
(6, 'sample company', 'himashahiru921@gmail.com', '$2y$12$mgW/LLoQnHKoqVRZmaJZMefGmXfdz7hBEdXTQ9XfIv.nSaMJvI7CK', '0741225494', 'aaaa', NULL, 0, NULL, NULL, '2025-01-30 10:43:29', '2025-03-01 20:04:47'),
(7, 'kmpLPrJKGWTM', 'Randy9Austin6375@gmail.com', '$2y$12$fpeubRKFSX68nSGyubUIUuZShCLE5Gw59x9ItwUlJF/dOf93/25Ga', 'JFQGgTZp', NULL, NULL, 1, NULL, NULL, '2025-01-30 19:40:58', '2025-03-01 20:04:57'),
(8, 'JSG Ceylon (Pvt) Ltd', 'Jeewan@jsgceylon.lk', '$2y$12$1SllwjMjmXWLsMg5W0V7s.uwzSfF7oSP7FQNUaEGwXhDEe7O5goei', 'Jeewan', 'MD', NULL, 1, NULL, NULL, '2025-01-31 19:30:15', '2025-01-31 19:30:15'),
(9, 'muqAenrfxEjKIdi', 'eibruschi@yahoo.com', '$2y$12$TmuUIqnK9DiLv4qWP3yoYee1ZmjNue38VZrXc774Q8ukfAv3G5Aqu', 'mYWIxDECYCfExVV', NULL, NULL, 1, NULL, NULL, '2025-02-01 06:28:38', '2025-03-01 20:05:04'),
(10, 'tHPTpJJgVBjMnmD', 'kosabibuqi76@gmail.com', '$2y$12$562lC2Ci8T48tCH5PeP3s.8KBtDWz3.2GvvCSAytjLQxbi8YnDoZS', 'KtmPONxUI', NULL, NULL, 1, NULL, NULL, '2025-02-02 05:47:48', '2025-03-01 20:05:12'),
(11, 'AeDTCfggTzWoYO', 'erugiqawoqe284@gmail.com', '$2y$12$piMbYZEx4/BRpO904QuT1.tseCJf5LzJvsbDvCrYXYPlnS0.IJR5e', 'DYEbnJVJMXeWYg', NULL, NULL, 1, NULL, NULL, '2025-02-03 02:51:02', '2025-03-01 20:06:30'),
(12, 'chanuka nimesh', 'chanuka1234@gmail.com', '$2y$12$EVVHTsh78uhyMNXSVwWgDuXPafg3JcoQIKW2hCWv8YFKPbU26TFtK', '0714558246', 'restaurant and cafe', NULL, 1, 'logos/CAS5A8k13gnVQ8CF7vGwJXlDVvaF0MdzW27qO5FV.png', NULL, '2025-02-03 09:35:42', '2025-02-18 13:26:03'),
(13, 'HkCBPnFK', 'auobsidianeaglyphua@gmail.com', '$2y$12$tpCs/tUxDl3uOOZHtteb9uiyM.W9ZpvHpd3As33Pf8vlel67nzcN.', 'NRGUHKde', NULL, NULL, 1, NULL, NULL, '2025-02-04 04:30:06', '2025-03-01 20:06:22'),
(14, 'nhacfECBshVMAe', 'obsidianoepinnacle@gmail.com', '$2y$12$iDbu.Ll1Rh.7mkjPP.EBvOWxMCeso9hoKMXenGwhfvywWZ5U6JhGi', 'ZWFvdAcswzmAw', NULL, NULL, 1, NULL, NULL, '2025-02-05 05:16:25', '2025-03-01 20:06:13'),
(15, 'bxplNgayrsDo', 'stellariu2quartz@gmail.com', '$2y$12$Raujz2WE7p1SHyC5Be7A/.dk9YDouu4NclU24vUx69U5SZH26ukLO', 'JVmBxmHDQ', NULL, NULL, 1, NULL, NULL, '2025-02-06 04:25:25', '2025-03-01 20:06:06'),
(16, 'IriWYUDPfptj', 'crescentai64oracle21ay@gmail.com', '$2y$12$qPIDwev2N9zfJcJ3b9.WQep9GVZivcz1xtAQ/EfUQDRtPu0TiwhH.', 'OyDOcfSAA', NULL, NULL, 1, NULL, NULL, '2025-02-07 04:44:42', '2025-03-01 20:05:35'),
(17, 'ZNqlgdWY', 'illuminateay72horizon96@gmail.com', '$2y$12$X/YgAHkE1IPRfyebg0Xfm.0IOx.zFn9vdji/qV7MD.dmKIHl6/hne', 'FXvDwNNejDMyRY', NULL, NULL, 1, NULL, NULL, '2025-02-08 13:11:19', '2025-03-01 20:05:24'),
(18, 'hhpUEhqg', 'vishjaxtkp@yahoo.com', '$2y$12$bSLq9naKpEFUV9sDZF9pSOXTwrxaKSoc7miuGcCFd/VsYXUZN1x/W', 'mYjxdkKxBS', NULL, NULL, 1, NULL, NULL, '2025-02-11 13:56:19', '2025-02-11 13:56:19'),
(19, 'lltGwyBndO', 'uwizoles96@gmail.com', '$2y$12$OEx8Wj3ZM6VEqtCwh6SE5eVfHA/lIZ/Hvk8DmzrtIXRC1mjWm9RbO', 'sPvMASmKJht', NULL, NULL, 1, NULL, NULL, '2025-02-14 06:13:29', '2025-02-14 06:13:29'),
(20, 'oObtMFitL', 'dawsonmonisa2@gmail.com', '$2y$12$OapO77/VZEqPI2vTgIGnp.uSLYYhOGDmDaouRlpVJrRoOt4Ouua5e', 'HLEzYgxdEhRu', NULL, NULL, 1, NULL, NULL, '2025-02-15 20:38:49', '2025-02-15 20:38:49'),
(21, 'ZPAUQbub', 'tloveib6@gmail.com', '$2y$12$ZLnYk.kec2CWaHBYCQQtS.NaNRcHCxzY0upF4E18fjT4greW.dP8a', 'yvLzYtgpz', NULL, NULL, 1, NULL, NULL, '2025-02-16 12:19:29', '2025-02-16 12:19:29'),
(22, 'TRQngmOZjde', 'howerorpo@gmail.com', '$2y$12$PdYu1ZVElZFv8qCH3HP82.EBL7tzYkilQlj06ijXQdo80X4xmmNUK', 'TyaoPdqjrbZu', NULL, NULL, 1, NULL, NULL, '2025-02-17 04:52:04', '2025-02-17 04:52:04'),
(23, 'bthYYNwGWn', 'stripaylad1993@gmail.com', '$2y$12$1bEcwnZm3xnu7okCB0HuK.7.wKgk3ipxWM0J80pFj5rrvxKHfWnGi', 'JoWNVYeP', NULL, NULL, 1, NULL, NULL, '2025-02-18 05:33:15', '2025-02-18 05:33:15'),
(24, 'wWVIcicEMraWz', 'okguewsfmlmsecsa@yahoo.com', '$2y$12$Ch4uRr5iRdZIUcXpf.U3Q.LYFLHCNHAOBk513jUUZ.XHGdU8hcZSO', 'fxmKmODdlX', NULL, NULL, 1, NULL, NULL, '2025-02-19 13:24:56', '2025-02-19 13:24:56'),
(25, 'SDLyBbCcY', 'illuminateoexenon@gmail.com', '$2y$12$JGTL3coWeCsTfRtSsNcYv.svHxjzr1tvYmHTb/biNdNx0cRSi.jRa', 'rItLLYUACwkfO', NULL, NULL, 1, NULL, NULL, '2025-02-20 14:56:28', '2025-02-20 14:56:28'),
(26, 'AGdqDxEqRttpYt', 'rayanwatkinsu@gmail.com', '$2y$12$.9q3L9Bqu5szxtQ.l7edFuBVa4OrBHhLnnQCCJNvAc20AQmoRhhWa', 'LVNVsmvsyqH', NULL, NULL, 1, NULL, NULL, '2025-02-21 13:51:11', '2025-02-21 13:51:11'),
(27, 'Name Inside', 'name@gmail.com', '$2y$12$GbiPk/.qxTupxo9yj6tes.BZI2hswTlEsgmLVA9UgB.EhZPOPjaNK', 'Jeewan', 'Nameinside', NULL, 0, NULL, NULL, '2025-02-26 20:38:52', '2025-03-01 20:08:34'),
(28, 'Fairway Holdings', 'ishara.p@fairwayholdings.com', '$2y$12$vxePI.hljTbsanYqFuiij.62QI2eqyqXLPz/ndrllbuR5QnHGcCWm', '0774441648', 'Real estate and other businesses', NULL, 1, NULL, NULL, '2025-02-28 15:06:00', '2025-03-04 11:59:29'),
(29, 'chanuka nimesh', 'rashuperera2000@gmail.com', '$2y$12$TNyT2bS7pYLI3xOsi9suNe9ZIZy.RwC7GMqfmNfvO6t2wdbO7/ZyC', '0715448246', NULL, NULL, 1, NULL, NULL, '2025-03-03 10:14:51', '2025-03-19 09:57:12'),
(30, 'SL Life', 'aselairan90@gmail.com', '$2y$12$dg8EMWfCnNwTFCeVWqLkSerEZY4tDYmj2wXyJr6xiV2Z.rzIrtSu6', '0701123124', 'Advertising', NULL, 1, NULL, NULL, '2025-03-12 09:02:01', '2025-03-12 09:02:01'),
(31, 'A plus technology service pvt ltd', 'aplustechnologyservice@gmail.com', '$2y$12$ekfQV3ot/P2vun9j6rTVCeDbVMRLrrO.vgwS96qw6LpvTHUImi9hi', '0713355755', 'It and network solutions', NULL, 1, NULL, NULL, '2025-03-18 04:50:49', '2025-03-18 04:50:49'),
(32, 'Sampath shoe center', 'sampathshoecenter.emb@gmail.com', '$2y$12$R4XmmQwraN68jrNjtUq/1OB9hAK/JyEmiE98SAxl2ngTGuzkn2dVC', '0768427805', 'Shoe centre', NULL, 1, NULL, NULL, '2025-03-18 12:37:30', '2025-03-18 12:37:30'),
(33, 'AAAA', 'kamal123@gmail.com', '$2y$12$sLSgwvBY5Xa1/416xTo3uudgYlZb2p/lHTFX3iv6oPn2sZ3gmhKa6', '0715448246', NULL, NULL, 1, NULL, NULL, '2025-03-20 13:39:20', '2025-03-20 13:39:20'),
(34, 'TG Water Technology (Pvt) Ltd', 'info@tgwater.lk', '$2y$12$gB1r97LEgg61nTw6YxrF7ek/U1UOcM.B3YsO9N35kqHuHhj.u5swe', 'Jeewan', 'TG Water Technology', NULL, 1, NULL, NULL, '2025-04-15 13:35:38', '2025-04-15 13:35:38'),
(35, 'Ceylinco Life Insurance Limited', 'jobs@ceylife.lk', '$2y$12$z.3eaKZ1A9JyCsK8LIwGd.JAMSSoTzHD0axFp7/gMD.IU0P/iL8Ky', 'HR Department', 'Ceylinco Life Insurance', NULL, 1, NULL, NULL, '2025-04-15 13:44:55', '2025-04-15 13:44:55'),
(36, 'SAA visa consulting pvt ltd', 'shana.era@gmail.com', '$2y$12$3f4bm2DA0QqI7t1VjoHjwOrq5F4LJ5s/XbGgzwtX9Nf6NRZprNnHq', '0117252524', 'Travel Agents', NULL, 1, NULL, NULL, '2025-04-15 21:32:50', '2025-04-15 21:32:50'),
(37, 'Smart Quest Consult', 'jobs@smartquestconsult.com', '$2y$12$xWniXoRhAOKcoM0ecXXdAuT.SspDXo/SLGXfn9ymDuV6n3DgNo6vK', 'HR Department', 'Smart Quest', NULL, 1, NULL, NULL, '2025-04-20 20:20:53', '2025-04-20 20:20:53'),
(38, 'Aus Talent Network', 'careers@austalentnetwork.com', '$2y$12$Xstc7viajN5Cih4bGb.MeuxLilruWGK1kemoJiMNzgz7Ooy6W1JIm', 'HR Department', 'Export - garments', NULL, 1, NULL, NULL, '2025-04-20 20:36:12', '2025-04-20 20:36:12'),
(39, 'Juniper', 'chairman.juniper@gmail.com', '$2y$12$y99JmckCJZdVdB5RzAxAFusw27WMBxDD52Kttj9lCdHddg71K82n2', 'HR Department', 'Sales', NULL, 1, NULL, NULL, '2025-04-21 19:29:56', '2025-04-21 19:29:56'),
(40, 'Lanka Talents', 'sammani@lankatalents.lk', '$2y$12$oqjUvley8UwCBatvNxrFG.QW7eiw.FkqgQHMp/zB81//XB0Iikj.S', 'HR Department', 'AM', NULL, 1, NULL, NULL, '2025-04-21 19:38:39', '2025-04-21 19:38:39'),
(41, 'CJ Patel Group', 'careers@cjpatel.com', '$2y$12$5HVqqggrIGWcdq4EagSq4eo4f.cZd28kQXoluANrZ4Qh7Z/zySST.', 'HR Department', 'Executive', NULL, 1, NULL, NULL, '2025-04-21 19:49:19', '2025-04-21 19:49:19'),
(42, 'Credit Corporation (Fiji) Lte Ltd', 'lalit.raj@creditcorp.com', '$2y$12$zpL/Vhd8/GH4syuKqhqwQu0lLeuanABPydE.gW6xtkqraRlst.1SG', 'HR Department', 'Credit Corporation', NULL, 1, NULL, NULL, '2025-04-21 19:56:54', '2025-04-21 19:56:54'),
(43, 'SPX', 'vacancies@spx.com', '$2y$12$gVdaCvya4hOlNRdla8QbTesbuTfC1tYzrTPfamqctpgTzp21KjRIu', 'HR Department', 'Team Lead', NULL, 1, NULL, NULL, '2025-04-21 20:03:08', '2025-04-21 20:03:08'),
(44, 'Arora.lk', 'recruitment@arora.lk', '$2y$12$hDZQn0lpGw9OIjmnAehL4eJNq0hnCtW81f3GpDomS8QWaOtl8Wa/a', 'HR Department', 'Sales', NULL, 1, NULL, NULL, '2025-04-21 20:12:43', '2025-04-21 20:12:43'),
(45, 'Pacific Fishing Company', 'info@pafcofiji.com', '$2y$12$.xyWfctyr2HHOMFoSGVxAe9Vdtsv1OPfDON6F3OW8MwzKgz9/p0tK', 'HR Department', 'Levuka', NULL, 1, NULL, NULL, '2025-04-21 20:19:50', '2025-04-21 20:19:50'),
(46, 'People Connect', 'risad@peopleconnectlk.com', '$2y$12$l/Sph1Zk4eyX5z0KeJzoM.Dzzz0JUgOSkWGIz01p/HaLT94lEs20.', 'HR Department', 'Restaurant', NULL, 1, NULL, NULL, '2025-04-21 20:34:53', '2025-04-21 20:34:53'),
(47, 'Iphonik', 'hrm@iphonik.com', '$2y$12$pfE3EooY6uDsfN6M55siQ.aYKnKQBB/WGLWL5e2L5O75sdXFdaL8y', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-22 19:33:05', '2025-04-22 19:33:05'),
(48, 'UB Finance PLC', 'careers@ubf.lk', '$2y$12$SBZ8ECLbJ99Evkbi.plegOD96T8liJzZQtiK9529Xp/lQZ7PIrEV6', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-22 19:42:25', '2025-04-22 19:42:25'),
(49, 'Elya', 'hello@elya.lk', '$2y$12$NrC.r0ck3t5qHHleHqdhJ.klgUcWqgQthkm.PIqaHavUgeGo6t9c6', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-22 19:56:53', '2025-04-22 19:56:53'),
(50, 'SLIIT', 'careers@sliit.lk', '$2y$12$7kTG0HUuYpoHK0F.mkUYCeAnpfnE/jrixHTSB9iWl9A3kpl844uW.', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-22 20:02:22', '2025-04-22 20:02:22'),
(51, 'David Pieris Group', 'careers@dpmco.com', '$2y$12$WY4daQemmrCJKirvw.2vueWb5nHorgp2H6pD5gBXVk3BueTC4dwIK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-22 20:36:43', '2025-04-22 20:36:43'),
(52, 'Eagle Logistic', 'erecovery@e-visible.lk', '$2y$12$D0HzgD.Pjy76CgBkrLLeaOgVAkTx95UkwEYqxSHR5pvdZyDaY.jXC', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-22 20:41:58', '2025-04-22 20:41:58'),
(53, 'Brew master academy', 'gayanrukmal1994@gmail.com', '$2y$12$g5Gy4tzeyCZJpV6CzxgZdOAhoiNUtaLdDCDVY/kbIs4i0YnVLEJUW', '0706661466', 'Academy', NULL, 1, NULL, NULL, '2025-04-24 18:45:39', '2025-04-24 18:45:39'),
(54, 'Heron Consultancy', 'career@heron.lk', '$2y$12$Ploh5L0p8tsZbqQrSzEML.c.pT/J4rSqDUYXM7c6yLv7DQtfEFiG2', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-24 19:58:14', '2025-04-24 19:58:14'),
(55, 'DHL Group', 'careers@dhl.com', '$2y$12$cD6VgJUJpKX5.KQdjWR6me2EiKROUjCmxF1cuaF0/phyLyLm3NNZO', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-24 20:02:41', '2025-04-24 20:02:41'),
(56, 'UBT Campus', 'info@ubtc.edu.lk', '$2y$12$NN0j7Ld/WkplN5CdQjqm.Opo0VqKM5eW0A938k0PDR0eZo2Y4ctma', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-24 20:18:03', '2025-04-24 20:18:03'),
(57, 'GCL International', 'srilanka@gcl-intl.com', '$2y$12$wlQSdg5FbsUNuvVTfRjO9O8Jz14wLr9LtPOhlx69tGg5dMbgDVgJ.', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-24 20:23:19', '2025-04-24 20:23:19'),
(58, 'Dearo Investment', 'prasannas@dearoinvestment.com', '$2y$12$10Tn1WbgkS11FPIMSmZngOIL0C4rO9YvwaBjImIL9IjJwxiPqk2EG', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-24 21:03:48', '2025-04-24 21:03:48'),
(59, 'Abans Group', 'careers@abansgroup.com', '$2y$12$1RxXIBBD8BdohqOqMEsqZeAiNbLKMxU9KjABH5jc13m9aFpNLIuIy', 'HR Department', 'Abans Gruop', NULL, 1, NULL, NULL, '2025-04-25 15:43:30', '2025-04-25 15:43:30'),
(60, 'Daiki Axis', 'carrierlanka@daiki-axis.com', '$2y$12$1qAdg.8qYVE6h0YPCmXlcOIYuq2/YQNoL3RXUtOGhJCXtQwpQ0ema', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-25 16:00:33', '2025-04-25 16:00:33'),
(61, 'Sonak Lanka Foreign Employment', 'sonaklanka@gmail.com', '$2y$12$qAM0wZDJnK49coVnrbVjjOAUKstpYTFw8WLr9xPbyxX75kIEZfKJm', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-25 16:07:11', '2025-04-25 16:07:11'),
(62, 'Government', 'govrnment@gov.org', '$2y$12$ql545f1DDEgQg4gIFwERMutbuB9.2tPCS00g0cMXOUCn4YV6fT/6C', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-25 16:17:06', '2025-04-25 16:17:06'),
(63, 'Power hand Plantation Pvt Ltd', 'powerhand@gmail.com', '$2y$12$9FdcsHsbtXWMHhXzE.RhfOQoboJut94CdCAaavyER85wVSVKrCM8C', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-25 16:25:51', '2025-04-25 16:25:51'),
(64, 'Floor lanka', 'floorlanka@gmail.com', '$2y$12$i93/YHJJDjT/QSLuh7EALOcwsYdK1k.KqeMXjvkugOCIFvvESzety', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-25 16:28:22', '2025-04-25 16:28:22'),
(65, 'PROWATCHER Security System', 'den.prowatcher@gmail.com', '$2y$12$FmvyJJZmDhIBSZfWgviSye6S7llC0NEsudI2usMKDtzW.1fSi8a1y', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-25 16:31:52', '2025-04-25 16:31:52'),
(66, 'Tappoo Pte Ltd', 'hr.suva@tappoo.com.fj', '$2y$12$bnAhYF4tanmehvLxkcpqLOGL1PFw20Z8HYBLOMAWOk2YQnfssrTWK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 18:38:36', '2025-04-26 18:48:00'),
(67, 'Dubai Islamic Bank', 'careers@dibpak.com', '$2y$12$xqRrRHcwH14pqTFoaYH2mO5JmpmPCiJZYW74D8lhStI9n8pZxlpZy', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 19:41:36', '2025-04-26 19:41:36'),
(68, 'ShiftX Media', 'hr@shiftxmedia.com', '$2y$12$fX61PT6GZlHHhUcgR6EoqupBASwKWn.FJ9K6BM2wViEsPmlh9VG0e', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 19:48:25', '2025-04-26 19:48:25'),
(69, 'Power hand Plantation Pvt Ltd', 'sujipowerhands@gmail.com', '$2y$12$D6x3eTPWuMiaOllNFMusY.DGXALZxlGNV4cRqiuvYW/I6dYxt9v3W', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 19:51:20', '2025-04-26 19:51:20'),
(70, 'Eduvin Lanka', 'eduwinlanka@gmail.com', '$2y$12$janiekqv5OSoHhEXZCJPv.KB/WZpBtfPHkbXOmQROC9xcrE2eLBLu', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 19:58:56', '2025-04-26 19:58:56'),
(71, 'In Talent Asia', 'sachini@intalent.asia', '$2y$12$M0737gXDBbYj2PXgRcwM.OWowX7Ilf/6y0vD3Zz1im5X7sH2juPEG', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 20:01:53', '2025-04-26 20:01:53'),
(72, 'CTBC Bank', 'talentacquisition@ctbcbank.com.ph', '$2y$12$3WrV15kXslFQShfkveIcE.BojTOnarmn5Qz5mIo6xNhfn7wy7wtiq', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 20:08:50', '2025-04-26 20:08:50'),
(73, 'AIA Insurance', 'lke.vacancies@aia.com', '$2y$12$6BR9zBKqIcXIRiIfgO1mQudhHlbGN.bAWHtl2xvpRiyyx1lKLKD2W', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-26 20:11:47', '2025-04-26 20:11:47'),
(74, 'Seylan Bank', 'careers@seylan.lk', '$2y$12$X.wqgEwqcsfVsTzthtLjDOlir0A0WqI5RiRENpsBmvFf8ERia1DnC', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-27 19:48:11', '2025-04-27 19:48:11'),
(75, 'Kandy Cafe', 'careers@kandycafe.lk', '$2y$12$Pq7QkkZK9A4IDCTGWA2nPOksQ6BWpLN0ffacSA2m.czaX55rJivpS', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-27 19:51:36', '2025-04-27 19:51:36'),
(76, 'Cargills bank', 'career@cargillsbank.com', '$2y$12$azT3fdRg7mmbLBNrnBVL6.jC33BBcHmCr3rIZ24dZNlJTvhaym40q', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-28 08:53:04', '2025-04-28 08:53:04'),
(77, 'SPDH', 'spdhcareers@yahoo.com', '$2y$12$B/KC3nir4AAA6XrY9EsWIexDRpv1d0kAsPbx/1VJjDbH/dykWsoTq', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-28 09:09:23', '2025-04-28 09:09:23'),
(78, 'Travel port', 'hr@thetravelport.lk', '$2y$12$RmSfiexsYlpTj/iWHARLmuhcytEeCVbz2/UrFsCJ/reEakIoKqyLG', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-28 19:52:15', '2025-04-28 19:52:15'),
(79, 'ANTZ Consultancy', 'careers@antzconsultancy.com', '$2y$12$wNq/rwRwEpTqq2E01NNNiuhAVXj/VFgBKkTC2GU6gHPY8EYBXB872', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-28 19:59:40', '2025-04-28 19:59:40'),
(80, 'DLC Holdings', 'info@dlcholdingslk.com', '$2y$12$A7STBgCVOgy7BuSMg1sQBuUHNgol5X7dP8VMh6VSBhn3pFzjSugB2', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-28 20:08:44', '2025-04-28 20:08:44'),
(81, 'Stafford Motor Co. (Pvt) Ltd', 'caareers@honda.lk', '$2y$12$ptlmykFj84RoFS4qlfAO.u1cDdU9TjbpbvULz1wasAqv0m6k0LCMW', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:07:36', '2025-04-29 13:07:36'),
(82, 'Asia building Society Ltd', 'harshani@absl.lk', '$2y$12$vzsWhLsglF6WbFHNnfK7a.d1jXX7Pn5A/xguQwGOz.GAsQrVmSJtK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:12:00', '2025-04-29 13:12:00'),
(83, 'BRD De Silva & Co', 'careers@brdesilva.com', '$2y$12$hrGEQ64ODAWELC.oRkyM1ewwi5yMDdDFn49lcj4cv3tEbNeu8/lge', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:24:22', '2025-04-29 13:24:22'),
(84, 'MAS Holdings', 'careers@mas.com', '$2y$12$j9N.MhvyFkjjGWht.I/KRu3WwTGHZS/A9FdkA1B2JEZFg7OnYqh7i', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:28:36', '2025-04-29 13:28:36'),
(85, 'Neon Global Colombo Pvt Ltd', 'neonglobalhr@gmai.com', '$2y$12$nWeJX55cRa63xir2512HFuzjXaIkdU1WfiW3G.e.6Og5M.FcX0ypS', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:38:04', '2025-04-29 13:38:04'),
(86, 'VERGER', 'careers@vergersl.com', '$2y$12$D8q2uU5q3ax0a8/Cf4qpduS5TULxOch.KmtNUnL44fkhojo6iPacm', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:41:20', '2025-04-29 13:41:20'),
(87, 'Prime Group', 'careers@primelands.lk', '$2y$12$DTPGEFqIdOSV8GAy1nEmauPvk7QJHrj2Rw8RMLYaPuCWu8E22n01S', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:43:57', '2025-04-29 13:43:57'),
(88, 'KPMG', 'lk-fmcareers@kpmg.com', '$2y$12$DXYqHuk9qW4LLLsRf5MEL.DezUQ.NIihREznLo4l5qpGESTPTXGmO', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:46:45', '2025-04-29 13:46:45'),
(89, 'Ranbima Ceramics Pvt Ltd', 'ranbimae@gmail.com', '$2y$12$p5ZGIb7t1K38oA0pRcbveOe5xYUZuNzrS204SFVfvsnV.m6X2B.lC', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:49:13', '2025-04-29 13:49:13'),
(90, 'CA Sri Lanka', 'careers@casrilanka.org', '$2y$12$IBRpusIoJGVPu8xYybrbhelsgqQYR4n4WGsoum6A76ByAuMztbW1u', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:51:35', '2025-04-29 13:51:35'),
(91, 'Mifco', 'expat.careers@mifco.mv', '$2y$12$v/t.u2bIkLhJXTkpNLPoMuqog8cZrt/9eYvvTzLWDExVgJWf8TyeO', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:54:04', '2025-04-29 13:54:04'),
(92, 'HR Connecting', 'hr2@connecting.biz', '$2y$12$B9Cypyv2vDEmm9k7PnI/BOyqMnNcOgzSpNqVLqPnwvQZdW2IxBSCS', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:55:59', '2025-04-29 13:55:59'),
(93, 'N Vision', 'hr@n-vision.com', '$2y$12$ucdssnRT1m0X20M934Qn/O1JJKi1iKXKzrBQ1807kR7ZeAQyNv75y', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 13:57:56', '2025-04-29 13:57:56'),
(94, 'Goodhope', 'careers-lk@goodhope.co', '$2y$12$D3i7Xtoavu6aOhmn10uuw.O.6OtctqQmhgw/Jk.94ZORNqHuL/H5u', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:04:37', '2025-04-29 14:04:37'),
(95, 'Micronet Group', '10@micronetglobal.net', '$2y$12$JjzREgGSlQGRe47i10k2Q.EhQQZoVZDSb28CZtuLh7tKbmyN6Ose6', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:07:22', '2025-04-29 14:07:22'),
(96, 'Sumathi Holdings pvt Ltd', 'careers@sumathi.com', '$2y$12$Bsfsf5lBlbWTVKlOtZeH/eqKuAAdRuSxP/NfXMjeBlYfzCpHruwfC', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:11:10', '2025-04-29 14:11:10'),
(97, 'Randenigala Distilaries Pvt Ltd', 'sakselnatualfb@gmail.com', '$2y$12$g5RdMLs2gks3dZQDIrJlrutn1RA8WTapX2vzkeBnxqZV1APFVIb3m', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:22:45', '2025-04-29 14:22:45'),
(98, 'Globactiv', 'careers@globactiv.lk', '$2y$12$kNU5SfPVASH7JXFbYX5xJOwmJWSFfPx/ujp2tSKIa9ofmvJOq5C0y', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:26:19', '2025-04-29 14:26:19'),
(99, 'PikMe', 'careers@pikme.lk', '$2y$12$qr3KEsXxN4w9e9QEPV2/p.Q6NKejK8WCP2wy7k/KMV24A3JF8vZ6e', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:28:10', '2025-04-29 14:28:10'),
(100, 'Miami Clothing (Pvt) Ltd', 'careers@bamholdings.com', '$2y$12$O6zS3GulHboRi9q.JFzUTeM0xYI/zjOHJs677WR6r9n.yM7d9Ngbi', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:35:35', '2025-04-29 14:35:35'),
(101, 'Star Garments', 'hrsoutherncluster@star.lk', '$2y$12$XBQZbOijrIHOTZYARFRP/OLFGHuAlmdKW01mlAHBLlazI8dHYi.9G', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:40:24', '2025-04-29 14:40:24'),
(102, 'Timex Garments', 'opportunities@timexsl.com', '$2y$12$KscTZBpYcND7tjYBjsJvVu8MJsbivk2EzPHJTJUqM34SuNNrjdPXi', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 14:43:16', '2025-04-29 14:43:16'),
(103, 'St. Joseph Hospitals', 'hr@ktdoctor.com', '$2y$12$rcAUrFbjl9jFJm1LRQ4r7O2ab2ubeYGBwIdOK6xgMMlaJmW7q8oVy', '0742208704', 'Hospital', NULL, 1, NULL, NULL, '2025-04-29 15:11:46', '2025-04-29 15:11:46'),
(104, 'CBL Foods International (Pvt) Ltd', 'careers.cblf@cbllk.com', '$2y$12$yv7tNTflN.7Ngd1i6UWU4e.ISYeRl8WS0FesbAMtBxrdFGJpaugOK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:25:59', '2025-04-29 17:25:59'),
(105, 'Richard Peiris (Pvt) Ltd', 'careers@arpico.com', '$2y$12$Hd4UIAeuSWj1WeF20iHSd.AtavGtdfuMGDyqHOZbpMyioOb0z4AQC', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:32:13', '2025-04-29 17:32:13'),
(106, 'Econopack Industries (Pvt) Ltd', 'recruitment@econopackltd.com', '$2y$12$eVt5.83z8YfS7thumTcXX.9.HLcxIRjHs4dTlvtptsFP6xsIJ6YfK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:36:28', '2025-04-29 17:36:28'),
(107, 'Lion Beer', 'careers@lionbeer.com', '$2y$12$PvJl3/pQu1hPjDz2wb2tqOP09h.3h5p8I9dQvO4ahLzqrLJsZ0zjW', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:48:17', '2025-04-29 17:48:17'),
(108, 'Teejay', 'careers@teejay.com', '$2y$12$RFKPHo5ZUQCa.IgIbYp9IuDqTKIg/I98lAJ9WZheHvWHIST8B6xTm', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:50:30', '2025-04-29 17:50:30'),
(109, 'Kulasekara Oil Mills (Pvt) Ltd', 'golweecoconutoil@gmail.com', '$2y$12$EvMT8H/7Gc1Uh3mH0jRDHOi8Z9KKAevSbW4QV1g83j05oX944iG6C', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:56:23', '2025-04-29 17:56:23'),
(110, 'Nippon Bags (Pvt) Ltd', 'nipponacc123@gmail.com', '$2y$12$qYTJ6iMp6oVJRrbzFxbQBu2MMsN4oh4l0V6VWfE9.JTQkTgnSLQLq', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 17:59:26', '2025-04-29 17:59:26'),
(111, 'Milky Fresh', 'info@milkyfresh.lk', '$2y$12$ZmBn5pxs2ptG0balMfLL2.as4hFUvsZjRAHaB/BVk.4nRVUsOfW9W', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 18:02:21', '2025-04-29 18:02:21'),
(112, 'SMS Holdings (Pvt) Ltd', 'kaushalya@smspavers.com', '$2y$12$tEJwHVSFq1sp1tq2PvesfuiOnfpnGqBASymT0bVElV62aLp8Yv4wG', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 18:10:13', '2025-04-29 18:10:13'),
(113, 'Lalan Rubber (Pvt) Ltd', 'careers@lalnrubber.com', '$2y$12$h.RThJnPR0Mohd7oMvNmnuglwh3LpDYqwfgYtWM8C42sFoyZX9nqm', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 18:16:46', '2025-04-29 18:16:46'),
(114, 'TCIS Inspection Lanka (Pvt) Ltd', 'info@tcislanka.lk', '$2y$12$R8SF2Xstch2/7cUA9Nza5OnihnGa4ZjmuDEynHP81vgrtZ760ORdy', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 18:25:48', '2025-04-29 18:25:48'),
(115, 'Micronet Global', 'hr4@micronetglobal.net', '$2y$12$lJoVNfcdHRETIRNuAxnG2.lN6KtwuXo6Q5gZldl3NN.x6LSXwvCCS', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-29 18:33:33', '2025-04-29 18:33:33'),
(116, 'John Morris Group', 'careers.sl@johnmorrisgroup.com', '$2y$12$gOVvoUDmPXMgRQoJE5U3/u2P6zpB.OeDNd.T.CA1zO7pv1TkptNmW', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 04:49:40', '2025-04-30 04:49:40'),
(117, 'NDB', 'career@ndbbank.com', '$2y$12$hAYfF5yc6lk7ymHg2Htao.p/.Sc1sH31k65g0g73PkWD6S.NjB2ru', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 04:55:35', '2025-04-30 04:55:35'),
(118, 'Marine Bay Colombo', 'careers@marinebaycolombo.com', '$2y$12$jKdHZLa2b3Q97wpbfcoBR.0zsQeL7dk3wbAIbK3gkRWj3vnM/GiFi', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 05:03:17', '2025-04-30 05:03:17'),
(119, 'Mandarina Colombo', 'careers@mandarinacolombo.com', '$2y$12$L4wxLOCUrrAIdmRfLp1I6u2bzoiiI4GsPNqL.WipYjZiJ4YWdQBLK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 05:07:13', '2025-04-30 05:07:13'),
(120, 'Cargills Ceylon PLC', 'careers@cargillsceylon.com', '$2y$12$FKhxk7WUqSUklaMyiLc/3../.JxhP3kBGDhqvwkC86VWMDK72xl9W', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 05:09:45', '2025-04-30 05:09:45'),
(121, 'Vallibel Finance', 'careers@vallibelfinance.com', '$2y$12$TSVg1eXLliFSZ5rkEn/P8e3u5exKQ72kP82pd78lDE5HzcV//qF3O', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 19:59:31', '2025-04-30 19:59:31'),
(122, 'Sathuta Builders (Pvt) Ltd', 'careers@sathuta.net', '$2y$12$/jVRmOYTbYHPHfwJ7npsMeAn3CbNwvU0t.4qe4zhBInYhJ0U4Todm', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:03:08', '2025-04-30 20:03:08'),
(123, 'The Voice Png', 'info@thevoicepng.org', '$2y$12$uj7QdVQIxx4wGSnO4BV.1OLMLUQtSwG7a/aQB/iG0jvH/m/yztyDK', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:07:26', '2025-04-30 20:07:26'),
(124, 'Sanasa General Insurance', 'careers@sgic.lk', '$2y$12$CB1PoZjGS/LfJQ8PBCqsn.P3IUX1uGizt7iaDEqoKVlCmwuRkXKHG', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:19:14', '2025-04-30 20:19:14'),
(125, 'Kahawathte Plantation PLC', 'damith.priyathialke@kwpl.lk', '$2y$12$UomHuqJZ5NOKgYYLxWfXI.YlD/SQoNVZXnReruroDDXLJsNNz0qrW', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:25:24', '2025-04-30 20:25:24'),
(126, 'Powerhands Plantation', 'recruitment@powerhandsplantation.com', '$2y$12$apHn.9vxmRdpKhyjUTHMwuZkioGSJcdGGRTxLxEB67WOW6PxgYLZu', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:29:13', '2025-04-30 20:29:13'),
(127, 'Helios Ventures', 'a@helios-ventures.co', '$2y$12$sQj4FAAWqWYJ/L1adVOe9OwPw8y7PtuD0xkK6p1r9iB.M/AyjX2ai', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:39:57', '2025-04-30 20:39:57'),
(128, 'Ministry of Crab', 'dharshan@ministryofcrab.com', '$2y$12$a4Rz2F9un3IZtgSfrD1owOU.5DOdqcXCHIRyYjh0.ype1l8H0gt1a', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:43:36', '2025-04-30 20:43:36'),
(129, 'Three Sinha Industries (Pvt) Ltd', 'vacancy@threesinha.lk', '$2y$12$67mJelhKG5f.Lr0.jRijNuEKMJw.mHOrXuehlTB.6/wkJzPehHCg2', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:50:15', '2025-04-30 20:50:15'),
(130, 'eMarketingEye', 'future@emarketingeye.com', '$2y$12$.HrUPsYg8psyzKAiU2TFSe6k4e7WfXb0ep8URcElDt2Uj1LiTlvrG', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 20:55:41', '2025-04-30 20:55:41'),
(131, 'Keels', 'careers.lpi@keels.com', '$2y$12$q03.ASZlJUyYnepzYD5MIuXBoQDct7AsupIjy14kAu8F/Y0AeMoPi', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-04-30 21:10:16', '2025-04-30 21:10:16'),
(132, 'JF Packaging Pvt Ltd', 'careers@jfpackaing.lk', '$2y$12$Lu5zc054/QGuJLqziTzp7eNUICCFoN6gZykVAMzEalr2su4ZgplCK', 'HR Department', 'Packaging', NULL, 1, NULL, NULL, '2025-05-01 08:33:49', '2025-05-01 08:33:49'),
(133, 'Mercantile Fortunes (PVT) Ltd', 'flooring@mi.com.lk', '$2y$12$TwgpPS9rM0YGALkZIJk3p.CFFvxDpgVI8gFWjoSpjSG/WtA7Ttex.', 'HR Department', 'Mercantile Fortunes (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-01 08:59:27', '2025-05-01 08:59:27'),
(134, 'Econopack Industrial (PVT) Ltd', 'recuritment@econopackltd.com', '$2y$12$c5Ti07fWcsfFPqlSSJq1m.59vW4hrudcSt8WjeaxJkgSmaFo68Qb.', 'HR Department', 'Econopack Industrial (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-01 09:30:19', '2025-05-01 09:30:19'),
(135, 'Igniterspace (PVT) Ltd', 'careers@igniterspace.com', '$2y$12$wbE2fzzAiuV/Tn1oHoU9OOoY4A57v2Jx98HOPZQ8RpVkodtAh3dAu', 'HR Department', 'Igniterspace (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-01 09:43:18', '2025-05-01 09:43:18'),
(136, 'M3 Force', 'marketing@m3force', '$2y$12$PqJHw5.Sn9axQH3bTD9G2euAwk2pFH691.zk3yDshly9Gk3ZvMre.', 'HR Department', 'M3 Force', NULL, 1, NULL, NULL, '2025-05-01 10:11:53', '2025-05-01 10:11:53'),
(137, 'Sitrek Courier Services (PVT) Ltd', 'courierhr@sitrekgroup.com', '$2y$12$ipaHQ5a7UfP7qA8nBY86ge.9uDzSIrvJSbLRI/mHe5IgQEFcHWZri', 'HR Department', 'Sitrek Courier Services (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-01 10:14:16', '2025-05-01 10:14:16'),
(138, 'Name inside', 'Nameinside@jobads.lk', '$2y$12$NXOMr933uWa31pMYQ8gBjeCTmrTdAy7Jc1St9WOA4GZCqvORivlua', 'HR Department', 'Name inside', NULL, 1, NULL, NULL, '2025-05-01 10:25:06', '2025-05-01 10:25:06'),
(139, 'Champions Table', 'careers@tastycaterers.lk', '$2y$12$u/bYd32Vdx9H.VorRhgIIetV5K5U6Gc.iQQRYgxSEkoaWhgMKYFlK', 'HR Department', 'Champions Table', NULL, 1, NULL, NULL, '2025-05-01 10:40:24', '2025-05-01 10:40:24'),
(140, 'MAKEEN Energy Lanka (PVT) Ltd', 'ads@makeenenergy.com', '$2y$12$/0l/pOdzAzPexJgao6S/xecQ.rJHq4xKOcwwPemxKcy6l0EucMv6S', 'HR Department', 'MAKEEN Energy Lanka (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-01 11:09:05', '2025-05-01 11:09:05'),
(141, 'Ebony Holdings (Pvt) Ltd', 'hr@ebonyholdings.com', '$2y$12$qlXOkN4Zk2snhE.pgfpcbem37Hy/Zxh793oqttcA22vPUah7bEW56', 'HR Department', 'Ebony Holdings (Pvt) Ltd', NULL, 1, NULL, NULL, '2025-05-01 11:21:34', '2025-05-01 11:21:34'),
(142, 'Ramsel Trading', 'madusha@ramseltrading.com', '$2y$12$HbUuf1aw00kfpgHDutnSkObl5rR0zRWoU8r7N1nN48EOF.x8N.JgK', 'HR Department', 'Ramsel Trading', NULL, 1, NULL, NULL, '2025-05-01 11:57:50', '2025-05-01 11:57:50'),
(143, 'Neochem Group of Companies', 'info@neochem.lk', '$2y$12$T1j0hV2zV2CYglzaG.7XoujqgeDKcIta6ojq6FthxUKB1tRt44p6q', 'HR Department', 'Neochem Group of Companies', NULL, 1, NULL, NULL, '2025-05-01 12:07:12', '2025-05-01 12:07:12'),
(144, 'MAGA', 'hr@maga.lk', '$2y$12$YWm.ERZF37kPrc5GR3GkhefYYv8fN0OchP/lbp6CUw6IogrHLrXvm', 'HR Department', 'MAGA', NULL, 1, NULL, NULL, '2025-05-01 12:17:02', '2025-05-01 12:17:02'),
(145, 'NM Associates', 'info@nmassociates.lk', '$2y$12$ui3mY8YHd8zpsedCxjvas.p73zdBlFAUED5aAdPvlsOtE7OpZd/Eq', 'HR Department', 'NM Associates', NULL, 1, NULL, NULL, '2025-05-01 12:26:24', '2025-05-01 12:26:24'),
(146, 'Lanka Sathosa', 'vacancies@lankasathosa.org', '$2y$12$1y3YF6lWiDIodxJN5wMCCOl8c24qPsc4i1oIvt/u.ilQ6VDV.SUNm', 'HR Department', 'Lanka Sathosa', NULL, 1, NULL, NULL, '2025-05-01 12:30:53', '2025-05-01 12:30:53'),
(147, 'OREL IT', 'careers@orelit.com', '$2y$12$1APWQVGxYSMsfSYqZunKxuYyEYmFne9VCBuhmeosq1Vku5k3lRZsm', 'HR Department', 'OREL IT', NULL, 1, NULL, NULL, '2025-05-01 12:36:36', '2025-05-01 12:36:36'),
(148, 'Grand Hotel', 'grandhotelslanka@gmail.com', '$2y$12$/2CUBAGF.bhbTtDoWd9vNeaAYqk5ngD3nS/WRIIJ80U3tZtZKfc6G', 'HR Department', 'Grand Hotel', NULL, 1, NULL, NULL, '2025-05-01 14:35:31', '2025-05-01 14:35:31'),
(149, 'AF Associates', 'career.afassociates@gmail.com', '$2y$12$G114Z3DKKBxodk9AEUwdsusvky3HijnS8LVxieLJIDVMwDkC7bC1q', 'HR Department', 'AF Associates', NULL, 1, NULL, NULL, '2025-05-01 18:40:54', '2025-05-01 18:40:54'),
(150, 'Vallibel Finance', 'career@vallibelfinace.com', '$2y$12$ApY9DGPOvScss9sf8XjDjeHHFU7CVFCnmv9WMQFTn5fsF54qbP60O', 'HR Department', 'Vallibel Finance', NULL, 1, NULL, NULL, '2025-05-01 18:50:22', '2025-05-01 18:50:22'),
(151, 'BRAC Bank', 'career@bracbank.com', '$2y$12$eOA9pDpmn9n.AFaaITn/x.73ILgwNY.31EIK8m0amlzOs5NEWbgsa', 'HR Department', 'BRAC Bank', NULL, 1, NULL, NULL, '2025-05-01 19:03:16', '2025-05-01 19:03:16'),
(152, 'AIA', 'vacancies@aia.com', '$2y$12$7509eVsk3Hvg/gIVJmsDueQxRdsVpJPJlm/cPxR5/Zz6iLSzC5PUS', 'HR Department', 'AIA', NULL, 1, NULL, NULL, '2025-05-01 19:08:30', '2025-05-01 19:08:30'),
(153, 'Sri Lanka institute of Nanotechnology', 'career@slintec.lk', '$2y$12$/P309.TD3YUuAjO0jd3Zv.r2wVFT43bMPatEM4iPlZwRJzYWxp3fS', 'HR Department', 'Sri Lanka institute of Nanotechnology', NULL, 1, NULL, NULL, '2025-05-01 19:21:57', '2025-05-01 19:21:57'),
(154, 'College of Aviation & Technology', 'hr@collegeofaviation.com', '$2y$12$FcUlUnDjA41biMgysM2WbuBoduQAcEfSI0FXpDlPU1PPR3o12Kaoe', 'HR Department', 'College of Aviation & Technology', NULL, 1, NULL, NULL, '2025-05-01 19:28:58', '2025-05-01 19:28:58'),
(155, 'Global English academy', 'globalenglishacademy@gmail.com', '$2y$12$RkyriTPPJIOmjQap0Cf6RedodreiomdgW8/vI3IAywmPpHb5zhzSW', 'HR Department', 'Global English academy', NULL, 1, NULL, NULL, '2025-05-01 19:39:14', '2025-05-01 19:39:14'),
(156, 'Nations Group', 'nationsgroup@gmail.com', '$2y$12$DFpxSRvyJkF0J6RF1PKfSuxxzQs2XFIaUMoMyhcILZV/hN.hiEgHG', 'HR Department', 'Nations Group', NULL, 1, NULL, NULL, '2025-05-01 19:43:22', '2025-05-01 19:43:22'),
(157, 'Grand Hotel', 'info.grandhotelslanka@gmail.com', '$2y$12$fTWxLB2yEdbFPGC55T2tT.p6epEG0YsfO8FEgHYNfDPrtWGbDz2X2', 'HR Department', 'Grand Hotel', NULL, 1, NULL, NULL, '2025-05-01 19:53:19', '2025-05-01 19:53:19'),
(158, 'Central Finance', 'rasikan@cf.lk', '$2y$12$tJHF.18VOnnImdMK8kTqi.NFIrcZvZexgqJmiU.HKqwHukpNaT/ge', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 14:24:22', '2025-05-02 14:24:22'),
(159, 'Leader Group', 'hrm@leadergroup.lk', '$2y$12$eihOxFNuujBfzyOQLXmzE.Z5LWUXDS0h6FKrp4hw5AXS1f8cZ2ea6', 'HR Department', 'Leader Group', NULL, 1, NULL, NULL, '2025-05-02 14:34:22', '2025-05-02 14:34:22'),
(160, 'Orient Finance', 'careers@orient.lk', '$2y$12$D4nxtVFfs8QoIfsd3ciIo.wWtTWNd7tgWg/6GZMhnSM15Bo4ZEPdm', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 14:41:41', '2025-05-02 14:41:41'),
(161, 'Omega Advertising & Aluminum Fabricators', 'omegasign100@gmail.com', '$2y$12$WBDw0kFOswoz26QlT5d2O.9Xsnh8z0RTykdEWApuwkMMCZbTNI2Zu', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 14:47:03', '2025-05-02 14:47:03'),
(162, 'Iota Consulting', 'sakib.tanmoy@gmail.com', '$2y$12$cr9nkp/LEhYddDHVZAX9iO2esLHu2kasSYVLGIEaE9Cm75IqoVroa', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 14:57:19', '2025-05-02 14:57:19'),
(163, 'Hod Marketing', 'hod.marketing@ronin.pk', '$2y$12$liUxoX3qY50GQlNyGL4vUeBZmoJ5BhGzu6iGyMtQtBNp.zdtWhGh2', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 15:12:48', '2025-05-02 15:12:48'),
(164, 'Tara Group', 'talent@taragroup.pk', '$2y$12$UhY1ANzMRbH5zakwV.YSDOUlRC.O13exr.BWAPKuXV4LeCdQSShMS', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 15:15:22', '2025-05-02 15:15:22'),
(165, 'Charcoal (Pvt) Ltd', 'career@charcoal.com.pk', '$2y$12$YLucQyJqPqThlvIOmeBOCOCyqPyg6ITGJNN.riMLCKZZciIo7QD9e', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 15:20:38', '2025-05-02 15:20:38'),
(166, 'Union Enterprises', 'careershrunion@gmail.com', '$2y$12$dMF//yat.XduRijDq6Rzi.84ANzf9.nvZkvHP/i9kn/FRbQhk0U/a', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 15:24:48', '2025-05-02 15:24:48'),
(167, 'Padakhep', 'career@padakhep.org', '$2y$12$ALSD99HBWMrnTg2FE2yQvewOlNgqBDSYfawSj3L6.a3SLEVgjhHJu', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 15:40:33', '2025-05-02 15:40:33'),
(168, 'Nippon BPO Service (Pvt) ltd', 'hr@nipponbpo.lk', '$2y$12$mTJ9IEu89ElKzRiLLJDc/eGiobK/rrTgFyaFbOR8LSZ6/spagJ6tS', 'HR Department', 'HR', NULL, 1, NULL, NULL, '2025-05-02 15:45:36', '2025-05-02 15:45:36'),
(169, 'Arcade Of Aluminium', 'accounts@aracdeofaluminium.com', '$2y$12$/JeuHNgVq8n4sW4TMr4lye.1BRScwJch7aesHO4q4KMmI0HSUiyJS', 'HR Department', 'Arcade Of Aluminium', NULL, 1, NULL, NULL, '2025-05-03 13:14:33', '2025-05-03 13:14:33'),
(170, 'FAKIR Group', 'career@fakirgroup.com', '$2y$12$OSpufc26XMWQUPsZpug8pOTEFVIvcbor0HZL1LU/HQQwNvuOFV2oW', 'HR Department', 'FAKIR Group', NULL, 1, NULL, NULL, '2025-05-03 13:26:10', '2025-05-03 13:26:10'),
(171, 'WICHY Beverages', 'careers@wichy.com', '$2y$12$bFm9Nt2QZ4CrfHpynh1WYONTLW51EyjYsZHEykLpz8zZ8oGCK1xT.', 'HR Department', 'WICHY Beverages', NULL, 1, NULL, NULL, '2025-05-03 13:35:27', '2025-05-03 13:35:27'),
(172, 'Padakhep', 'careers@padakhep.org', '$2y$12$VwjI319ocao73onU8RzUWevov1QpKXNrjq5DKzyQKcOlmj0CJX8o.', 'HR Department', 'Padakhep', NULL, 1, NULL, NULL, '2025-05-03 13:40:26', '2025-05-03 13:40:26'),
(173, 'unicampus', 'sohel@myunicampas.com', '$2y$12$IjEisUgo1pJyOZd0ITWzbOQEs/koTMC.wkaNIO59gRX/4n8YLQb3.', 'HR Department', 'unicampus', NULL, 1, NULL, NULL, '2025-05-03 13:49:16', '2025-05-03 13:49:16'),
(174, 'Bata', 'hrd.footwear@softlogic.lk', '$2y$12$CYp78P5MxMx0VGNtbk93xe9MOzi5b6WhQ2/rJoEwpjMZAKzoIYHXm', 'HR Department', 'Bata', NULL, 1, NULL, NULL, '2025-05-04 14:26:21', '2025-05-04 14:26:21'),
(175, 'Salon Susee', 'jobs@jobads.lk', '$2y$12$KCPB0.CualGRqmQ4LaMIouWLOryotgmTT4qWEeItfDrGAVVcw5grK', 'HR Department', 'Salon Susee', NULL, 0, NULL, NULL, '2025-05-04 14:42:19', '2025-05-06 08:12:42'),
(176, 'Grand Flora', 'hrmanagergrandflora@gmail.com', '$2y$12$LJ0LpvdDOMugrLCi6FEUgOJYXhgtwfXcxVdDmodGYqCVwWhFadWRy', 'HR Department', 'Grand Flora', NULL, 1, NULL, NULL, '2025-05-04 14:48:26', '2025-05-04 14:48:26'),
(177, 'DEMPSEY Resource Management Services, INC.', 'dempseyinc11@gmail.com', '$2y$12$g0h5VaPWUQ16wty8vOKeAOhA7SFfkfN1w6svfoBHKWVaJ.l6GlSmW', 'HR Department', 'DEMPSEY Resource Management Services, INC.', NULL, 1, NULL, NULL, '2025-05-04 15:50:19', '2025-05-04 15:50:19'),
(178, 'FirstNotch Solution', 'infor@firstnotch-solutions.com', '$2y$12$RvsLCwd4W2mRKyRcUoJ9IegjNFrjp5Iod8riNZzE/IbTkoygm0vF.', 'HR Department', 'FirstNotch Solution', NULL, 1, NULL, NULL, '2025-05-04 15:57:58', '2025-05-04 15:57:58'),
(179, 'Senuk Solar', 'hr@senukeng.com', '$2y$12$dg5P8.8VaIRfLQkqHSDJxOFcqnvrS4llQTg093KAkNLXJB2ckBoF2', 'HR Department', 'Senuk Solar', NULL, 1, NULL, NULL, '2025-05-04 16:05:29', '2025-05-04 16:05:29'),
(180, 'Sumathi Ventures', 'careers@leisuresportsholdings.com', '$2y$12$iKmcUoB7da/tNjE1KU2rtu1hHM1/YOXIUmUGosVswE0TekXnESVc.', 'HR Department', 'Sumathi Ventures', NULL, 1, NULL, NULL, '2025-05-04 18:09:08', '2025-05-04 18:09:08'),
(181, 'Star Holding', 'careers@starholdings.lk', '$2y$12$h12oK/yM2JoPTAXOgtspHOLagZ0xyknebgDe29zyLqV8ddrQPMEe2', 'HR Department', 'Star Holding', NULL, 1, NULL, NULL, '2025-05-04 18:17:20', '2025-05-04 18:17:20'),
(182, 'Ceylon Group of Companies', 'careers@ceyline.lk', '$2y$12$aChpY28vrClvxIE.RRHXOuql3pOhkEkqhlK4LSKvwafcz6r8wIdNa', 'HR Department', 'Ceylon Group of Companies', NULL, 1, NULL, NULL, '2025-05-04 18:50:41', '2025-05-04 18:50:41'),
(183, 'Laama', 'laamagrand@gmail.com', '$2y$12$5co9fTzETWHVsKafWlu.beI1RRlAgLPVLby3.In4I5X4ewpPXeq3q', 'HR Department', 'Laama', NULL, 1, NULL, NULL, '2025-05-04 18:57:09', '2025-05-04 18:57:09'),
(184, 'Leisure Sports', 'carees@leisuresportsholding.com', '$2y$12$cZEc8fuNGlKCTcFNYbMoluEPBO0ArM.b2/ZIwp0duoibqCvT0BpXS', 'HR Department', 'Leisure Sports', NULL, 1, NULL, NULL, '2025-05-04 19:13:33', '2025-05-04 19:13:33'),
(185, 'Prima', 'pcl-job@prima.com.lk', '$2y$12$mYQHSKgkU6S3ylL0fLX0P.gOA/d7v7dNTigcMDou9GdFZC/RG3RDO', 'HR Department', 'Prima', NULL, 1, NULL, NULL, '2025-05-04 19:19:47', '2025-05-04 19:19:47'),
(186, 'Danhinda Garment (PVT) Ltd', 'dgvacancy2023@gmail.com', '$2y$12$lUwVackIjnD9vm9rxXorceweQokjXQI3ResTZ7AuzKYvQ19sdpSIS', 'HR Department', 'Danhinda Garment (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-04 19:26:06', '2025-05-04 19:26:06'),
(187, 'Green Eco Food Products (PVT) Ltd', 'info@greenecofoodproducts.com', '$2y$12$fdNn9d3npxpOAMatybPapOTtt9Ng0tQCAKbfJV8INxIVFZlTkCoNu', 'HR Department', 'Green Eco Food Products (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-04 19:35:08', '2025-05-04 19:35:08'),
(188, 'YUNIK Travels', 'careers.yunik@gmail.com', '$2y$12$rQ2DKqJ1n3.QRD1I3Myc3uOmjlIwaIHjbz6F22GSi5WTawRvKTNve', 'HR Department', 'YUNIK Travels', NULL, 1, NULL, NULL, '2025-05-04 19:44:04', '2025-05-04 19:44:04'),
(189, 'CMS', 'humanresouces@cms.ph', '$2y$12$PwGhthLIXIBMD4H2HOmfa.oXzHUos7FTkCDWL3VEF1UO5qLtIdpZy', 'HR Department', 'CMS', NULL, 1, NULL, NULL, '2025-05-06 07:54:39', '2025-05-06 07:54:39'),
(190, 'JobAds.lk', 'info@jobads.lk', '$2y$12$1feazK1IeCgcZ/yBCx95GuJOgy/z4njRry4avetcmy2PU5yRRy7.m', '0777580451', 'Jobads.lk', NULL, 1, NULL, NULL, '2025-05-06 08:16:41', '2025-05-06 08:16:41'),
(191, 'B.R.DE Silva & Co', 'sadun@brdesilva.com', '$2y$12$pYZrOOamBksGt0X9J4BkQOhktdXQ.Jv8Jz/beHUKtEhmsK2zdwKna', 'HR Department', 'B.R.DE Silva & Co', NULL, 1, NULL, NULL, '2025-05-06 08:42:01', '2025-05-06 08:42:01'),
(192, 'QJ Quartz Stone (Pvt) Ltd', 'hr@jaysonsholdings.com', '$2y$12$bfyYNlZnpI6.EsZPGunTqO614xBX4iIi/zfwUKDavpwGjc3dSKtAK', 'HR Department', 'QJ Quartz Stone (Pvt) Ltd', NULL, 1, NULL, NULL, '2025-05-06 08:51:24', '2025-05-06 08:51:24'),
(193, 'Sanara Holding Private Limited', 'asirih@gmail.com', '$2y$12$sDlMpOZzZpVPdH4ZeFLqTOK1Y4VPPn/x.vdRSbz4G.D/ZTV8dhb6y', 'HR Department', 'Sanara Holding Private Limited', NULL, 1, NULL, NULL, '2025-05-06 09:04:31', '2025-05-06 09:04:31'),
(194, 'Lakderana Investment Limited', 'hr@lakderana.lk', '$2y$12$NU2qlKnZCUAageZdEvyJRO/Ymjj3SH2sjVTl8jbOKLH6Qa3oXeDMq', 'HR Department', 'Lakderana Investment Limited', NULL, 1, NULL, NULL, '2025-05-06 09:12:46', '2025-05-06 09:12:46'),
(195, 'Pathway Globlal Recruitment Manpower Service', 'pathwaygroupjobs@gmail.com', '$2y$12$2ML7s40oAvRtGj.MQEAgw.K57nbBGupFMa63054oV.fqgwdQRSAC2', 'HR Department', 'Pathway Globlal Recruitment Manpower Service', NULL, 1, NULL, NULL, '2025-05-06 09:23:17', '2025-05-06 09:23:17'),
(196, 'Movenpick', 'Goc.HO@movenpick.com', '$2y$12$bh3PCplW6Tiaw7HYPcXriez9QRJchtBy7FpwTM07Za2h7R8J1Cj4C', 'HR Department', 'Movenpick', NULL, 1, NULL, NULL, '2025-05-06 11:29:56', '2025-05-06 11:29:56'),
(197, 'Vogue Jewellers', 'candidates@voguejeweellers.com', '$2y$12$tSK.tH1PbIlQbzeOUmAyVuY4nwCrFinMmFobulXjYvV3dt1EdVjke', 'HR Department', 'Vogue Jewellers', NULL, 1, NULL, NULL, '2025-05-06 11:42:01', '2025-05-06 11:42:01'),
(198, 'read foundation', 'sponsor@readfoundation.org', '$2y$12$7DkQIMzs5muLMUSK5f.rJecXceInkaHaGGj3792FP5/pzaP1RbnCe', 'HR Department', 'read foundation', NULL, 1, NULL, NULL, '2025-05-06 11:49:21', '2025-05-06 11:49:21'),
(199, 'TGL', 'haniff@tgl.lk', '$2y$12$mc4IcpHiOKaiAI.hr6X2iuIZrwnkAzk4tnWZAfoiUJXCiF5E3OKoq', 'HR Department', 'TGL', NULL, 1, NULL, NULL, '2025-05-06 11:59:01', '2025-05-06 11:59:01'),
(200, 'CIM Business', 'madushiw@lbfinance.lk', '$2y$12$cWlPM3KafLQV5yCv.2QhBOpph4xjQdRjtmD.MoRW.fs0wOQte41rS', 'HR Department', 'CIM Business', NULL, 1, NULL, NULL, '2025-05-06 12:06:05', '2025-05-06 12:06:05'),
(201, 'Asian Lanka', 'asianlankaacademy.ltd@gmail.com', '$2y$12$nH76NkDyQs1j2btAsNksaO34VFik2B0LjND9JRi0YJQ/CD/zwC3Z.', 'HR Department', 'Asian Lanka', NULL, 1, NULL, NULL, '2025-05-06 12:11:22', '2025-05-06 12:11:22'),
(202, 'Barcelo Hotel Group', 'nasandhuramale.recruitment@barcelo.com', '$2y$12$3u64kUnY/NXzUtOTSBcfkeLTlqtp6cZY7O/aCOK7b/vqQMCUEyMNO', 'HR Department', 'Barcelo Hotel Group', NULL, 1, NULL, NULL, '2025-05-06 12:24:05', '2025-05-06 12:24:05'),
(203, 'Embassy Of Japan', 'consular@kl.mo.go.jp', '$2y$12$UesJAEvtFSWSNZuHa84AUeUdOfRrt7NNTBykkZatSwXXV741ALWkm', 'HR Department', 'Embassy Of Japan', NULL, 1, NULL, NULL, '2025-05-06 12:44:14', '2025-05-06 12:44:14'),
(204, 'Xmart Mobile', 'careers.xmart@gmail.com', '$2y$12$XmNE84BitxpyDfKtCoQ5LOjfSiIye8qCpjujoHDZdGQaIr1u1G1MW', 'HR Department', 'Xmart Mobile', NULL, 1, NULL, NULL, '2025-05-06 14:46:16', '2025-05-06 14:46:16'),
(205, 'VG Supply Chain', 'recruitment@victory.ph', '$2y$12$pQHUGaROJzD99xOAWXgyY.Xr334lUPFhUSm8EUp9hMtbp5tXEpTJ.', 'HR Department', 'VG Supply Chain', NULL, 1, NULL, NULL, '2025-05-06 15:22:32', '2025-05-06 15:22:32'),
(206, 'Global GIS (PVT) Ltd', 'marketing@globalgis.lk', '$2y$12$HHrjfE/FnzJlivnQMmMneOo0/JKJtvz8KP7FCDjPI.Y3cld74Y6Pa', 'HR Department', 'Global GIS (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-06 15:28:26', '2025-05-06 15:28:26'),
(207, 'The Bajaj Motor House (PVT) Ltd', 'bajajmotorhouse@gmail.com', '$2y$12$R2.svFDxHKsFlZOO.1hq8uPMb9juXETU9orjVQNTDILOBWoSmnun.', 'HR Department', 'The Bajaj Motor House (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-06 15:35:29', '2025-05-06 15:35:29'),
(208, 'Troja', 'trojamanagement91@gmail.com', '$2y$12$7.6MTsG3g5mZv1re/Or43eEp47dA06LG/DYjIOcGI4O6yDn0.jrRa', 'HR Department', 'Troja', NULL, 1, NULL, NULL, '2025-05-06 19:48:37', '2025-05-06 19:48:37'),
(209, 'KAS Consulting', 'kassynil@gmail.com', '$2y$12$9XBnM/gE6.xkUV2mIYB2F.bvNtOK0cTI4Bf9bdFiECfIVMTevzL.e', 'HR Department', 'KAS Consulting', NULL, 1, NULL, NULL, '2025-05-06 20:17:09', '2025-05-06 20:17:09'),
(210, 'CIMS', 'hrm@cims.lk', '$2y$12$ekJvOsKQzyIUzu01HUZKm.gKOdGy.rhPK81dqfWVz2dEizq/hHsdm', 'HR Department', 'CIMS', NULL, 1, NULL, NULL, '2025-05-06 20:32:17', '2025-05-06 20:32:17'),
(211, 'IT Gallery (Pvt) Ltd', 'hr@itgallery.lk', '$2y$12$ZxxGmhUYur33esOWi8Ae.OxEVPCI2gsno6OFdR2BefQ1iK4RaVPpK', 'HR Department', 'IT Gallery', NULL, 1, NULL, NULL, '2025-05-07 09:55:52', '2025-05-07 09:55:52'),
(212, 'Vogue Jewelers (Pvt) Ltd', 'candidates@voguejewellers.com', '$2y$12$svFuxV1FX5nEWAjGhVViL.Tica9n3JsQ4bq.eKjfZTTZaK9ThTz7y', '0777580451', 'Vogue Jewellers', NULL, 1, NULL, NULL, '2025-05-07 19:53:16', '2025-05-07 19:53:16'),
(213, 'Kiddies & Toys International (Pvt) Ltd', 'hr@limraholdings.com', '$2y$12$xbXmArtOc3VywVolSmU4Qe0x0cDYwsVlMIuXeXDHgkqw1DE3J.Reu', '0777580451', 'Limra Holdings', NULL, 1, NULL, NULL, '2025-05-08 09:31:46', '2025-05-08 09:31:46'),
(214, 'Nuvola Industires', 'careers@nuvola.lk', '$2y$12$KXJz8kD0Gr8UTyW.FpM7P.YQj3uCpaR41tJ8ZePcEzbA4VEtDok1y', '0777580451', 'Nuvola Industries', NULL, 1, NULL, NULL, '2025-05-08 09:35:04', '2025-05-08 09:35:04'),
(215, 'LCB Finance PLC', 'careers@lcbfinace.lk', '$2y$12$jDY7YZklOqS9WAPkSU93Ced/LGHwnvhRQMdt.ZUEj.lXDTLho3WT2', '0777580451', 'LCB Finance', NULL, 1, NULL, NULL, '2025-05-09 07:30:23', '2025-05-09 07:30:23'),
(216, 'LGL Marketing Services (Pvt) Ltd', 'hr@lgl.lk', '$2y$12$f82Pe7ptP..jLqYegT6J0Oo4K9IPjyq5xX5e4j2FiO3A.nKgyEcp.', '0777580451', 'LGL Marketing', NULL, 1, NULL, NULL, '2025-05-09 07:40:47', '2025-05-09 07:40:47'),
(217, 'RAYIN Food Products (Pvt) Ltd', 'careers@rayinfood.com', '$2y$12$0oReYkYDjgeyClOXreDa4.mtB.VE0UG7l.EWwJNokG5CIkjG5nZmq', '0777580451', 'RAYIN FOODS', NULL, 1, NULL, NULL, '2025-05-09 07:43:57', '2025-05-09 07:43:57'),
(218, 'Delmege Insurance Brokers (Pvt) Ltd', 'careers@delmege.com', '$2y$12$FkeFGyp0aCuMet8rGwDpseTyQexfPdMlpr/IQT6XHHL69ezlIMtYC', '0777580451', 'Delmege', NULL, 1, NULL, NULL, '2025-05-09 14:39:40', '2025-05-09 14:39:40'),
(219, 'LB Finance PLC', 'careers@lbfinnace.lk', '$2y$12$3W7IHWWXXEFav3OPpLZaBuvuSPVfOvVdD2m9QH6g/sd7NFmDsiTiO', '0777580451', 'LB Finance', NULL, 1, NULL, NULL, '2025-05-09 14:44:05', '2025-05-09 14:44:05'),
(220, 'Regional Development Bank', 'careers@rdb.lk', '$2y$12$wHPtUzkq4DU9WlK7GkLmguGfM4Mm0JMp1alT.bhpP6T9JpDYqy.O6', '0777580451', 'RDB Bank', NULL, 1, NULL, NULL, '2025-05-09 14:48:11', '2025-05-09 14:48:11'),
(221, 'Singer Finance (Lanka) PLC', 'hrsfi@singersl.com', '$2y$12$gxhWp95ua2Pv5G5iNLVlYOjBAlBtllFzsTUNm1DlJf4PqKJKun16C', '0777580451', 'Singer Finance', NULL, 1, NULL, NULL, '2025-05-09 19:49:05', '2025-05-09 19:49:05'),
(222, 'ALTA VISION', 'careers@altavision.lk', '$2y$12$rss88w28uxB4CzL.vhxGxuYsqBLW8rsM6GHN/ahQ4JPWZ6bMu888q', '0777580451', 'ALTA Vision', NULL, 1, NULL, NULL, '2025-05-09 19:55:45', '2025-05-09 19:55:45'),
(223, 'LAKE HOUSE', 'careers@lakehouse.lk', '$2y$12$Sg54n72QuxeyebShSIuVBObr3tMwsQJs70fQLX0B9lLniEDpfJ4eu', '0777580451', 'LAKE HOUSE', NULL, 1, NULL, NULL, '2025-05-09 19:59:23', '2025-05-09 19:59:23'),
(224, 'LANKATILES', 'hrho@lankatiles.com', '$2y$12$ayYVjWXOVAiyLzzgYWcCK.zH6Dn7vPmUeQ7dXSBs.lv4h8bT3m16O', 'HR Department', 'LANKATILES', NULL, 1, NULL, NULL, '2025-05-10 10:09:33', '2025-05-10 10:09:33'),
(225, 'APTS', 'careers@apts.lk', '$2y$12$s8NvlLWjOCk4K1hZ9FNHFuEpN.KjT8OviLmuRiXru5fUgiMcva1DS', 'HR Department', 'APTS', NULL, 1, NULL, NULL, '2025-05-10 10:24:16', '2025-05-10 10:24:16'),
(226, 'TGL', 'inquiry@tgl.lk', '$2y$12$uBl/.CLobGTavLmfv9hDEOJFn.Ne8oK0ECmtZbmEnqmEXWt6vAP5C', 'HR Department', 'TGL', NULL, 1, NULL, NULL, '2025-05-10 10:40:29', '2025-05-10 10:40:29'),
(227, 'Real Estate', 'cv@immaculateintl.com', '$2y$12$boAlWW9s7u1M/tmt36aHie/CUtRjZmnplEhirkbQOhg5B7NuJu9/G', 'HR Department', 'Sales Manger (Sales Leader )', NULL, 1, NULL, NULL, '2025-05-10 11:12:43', '2025-05-10 11:13:47'),
(228, 'IJVR', 'info@ijvr.lk', '$2y$12$o7fcO5bnb9IotEvqoGEvdeOoNeHsMjqCxHg8vHkdH/39DG5RM4i/q', 'HR Department', 'IJVR', NULL, 1, NULL, NULL, '2025-05-10 11:31:56', '2025-05-10 11:31:56'),
(229, 'TALAL Group of Company', 'careers@talalgroupintl.com', '$2y$12$dbIwsUw71cCG9XV5CUoug.HFRz1JYmlMNHRkYfRXZJ1K4tZAgEUSm', 'HR Department', 'TALAL Group of Company', NULL, 1, NULL, NULL, '2025-05-10 12:10:23', '2025-05-10 12:10:23'),
(230, 'SLTMOBITEL', 'careers@slt.lk', '$2y$12$/VRy8ozcP878l5W1VbCk1Ocdf5qhnFyL5NbGDJB77ZsPnJNPvVXgy', '0777580451', 'SLT MOBITEL', NULL, 1, NULL, NULL, '2025-05-11 13:57:02', '2025-05-11 13:57:02'),
(231, 'Sarala Venture Solutions', 'info@salaraa.com', '$2y$12$k3iZJ57ugZiGqZqHNBV1uuZ.X/TUaJAHbyXFgMzkvWFo3SNpApXa.', '0777580451', 'Salara Venture', NULL, 1, NULL, NULL, '2025-05-11 14:03:37', '2025-05-11 14:03:37'),
(232, 'Fantasy maldives', 'hrteam@fantasy.com.mv', '$2y$12$i2nr5zJPCt/HCoYCKy9u8e/qFx7GPzs7N7pi7Pf0isztuSt1/USMe', '0777580451', 'Fantasy Maldives', NULL, 1, NULL, NULL, '2025-05-11 14:07:25', '2025-05-11 14:07:25'),
(233, 'Fab', 'hr@thefab.lk', '$2y$12$B2p17qy6sKquumLXDl85zu6PswVltjTh7nX.GVucCF1jOnhhp5Dse', '0777580451', 'Fab', NULL, 1, NULL, NULL, '2025-05-11 14:22:49', '2025-05-11 14:22:49'),
(234, 'New Interiors (PVT) Ltd', 'sales@newint.co', '$2y$12$GaL3KTebvUBJ/CWkqlccUeIHgRq/pFJDpwzz3DTCARyeqWiTYU3Em', 'HR Department', 'New Interiors (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-12 07:38:30', '2025-05-12 07:38:30'),
(235, 'D.P.R Consultants (PVT) Ltd', 'Careers@dpr.lk', '$2y$12$2aNqOINBBap6jg3aki3IP.I78s7wZEslBFJJcRsnkEMarNSpq0/ay', 'HR Department', 'D.P.R Consultants (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-12 08:04:57', '2025-05-12 08:04:57'),
(236, 'Reinhardt Transport Group (PVT) Ltd', 'jobs@reinhardt.co.za', '$2y$12$J8AXbKL/rm703peRpgXnq.nCHLByOQmRZVsD6aDTR4VbJqXeV5l5.', 'HR Department', 'Reinhardt Transport Group (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-12 08:11:55', '2025-05-12 08:11:55');
INSERT INTO `employers` (`id`, `company_name`, `email`, `password`, `contact_details`, `business_info`, `job_posting_settings`, `is_active`, `logo`, `remember_token`, `created_at`, `updated_at`) VALUES
(237, 'Holiday Tribes', 'contact@holidaytrines.com', '$2y$12$Pp19/TEpgInXc57.I24Q4.nfI.VxqlMn79RDbpCiezIJ07PZ.pJyC', 'HR Department', 'Holiday Tribes', NULL, 1, NULL, NULL, '2025-05-12 08:17:48', '2025-05-12 08:17:48'),
(238, 'Goodwood Ship Management pte. Ltd', 'gsm-rtd@trans-global.com.ph', '$2y$12$7Y1aPSA/7lWpZwLIA30/9./U2/DZ95QdHacq7dY3cTKWNQdBgC60m', 'HR Department', 'Goodwood Ship Management pte. Ltd', NULL, 1, NULL, NULL, '2025-05-12 08:25:28', '2025-05-12 08:25:28'),
(239, 'Lucky Lanka Milk Processing Co. PLC', 'Careers@luckylanka.com', '$2y$12$I6as2TGt8TF8HAl5G97bk.R936nTLVwwyNsROFQRs6Ka6iy1b8eO2', 'HR Department', 'Lucky Lanka', NULL, 1, NULL, NULL, '2025-05-12 08:44:56', '2025-05-12 08:47:50'),
(240, 'ASM', 'asm-rtd@trans-global.com', '$2y$12$TP4M2J3JULjOeT0PXqrrF.NuwRqSmPYyB84bgrpDQo8zYBo86.mBO', 'HR Department', 'ASM', NULL, 1, NULL, NULL, '2025-05-12 09:01:50', '2025-05-12 09:01:50'),
(241, 'Talenx', 'talenxjobs.lk@gmail.com', '$2y$12$v1SPsuHyFXBPHtNrSYwQ6OuOBCCMHaS3r9RPkvHuPcsPRrUHYiQGe', 'HR Department', 'Talenx', NULL, 1, NULL, NULL, '2025-05-12 09:32:57', '2025-05-12 09:32:57'),
(242, 'Tilapiya Colombo', 'hr@tilapiyacolombo.lk', '$2y$12$.CVnpwHgGp718dEWJ611TusROSaZGFe6iR6.R48wNHgntq8IFVc5S', 'HR Department', 'Tilapiya Colombo', NULL, 1, NULL, NULL, '2025-05-12 09:49:38', '2025-05-12 09:49:38'),
(243, 'BM Transport', 'recruitment@bmt.ie', '$2y$12$hywk2IzFJ/JYe4BVU3o92Ow/ORXWKU0V5ZWjt/KLN8BiUJqdb5gnO', 'HR Department', 'BM Transport', NULL, 1, NULL, NULL, '2025-05-12 09:58:35', '2025-05-12 09:58:35'),
(244, 'Ensured Quality Lanka Pvt Ltd', 'hr.eqsolutions@outlook.com', '$2y$12$n1Jw08q9ZECXS1pevrF3IeBQWRP4yAR7677.l0cbTQ3y.lgWrnGG2', 'HR Department', 'Ensured Quality Lanka Pvt Ltd', NULL, 1, NULL, NULL, '2025-05-12 10:06:08', '2025-05-12 10:06:08'),
(245, 'Whirlpool', 'salesandmarketing@exatech.com.ph', '$2y$12$AtWyvAIThKjdIk.zPcdGUu6wIRdDCiYMWK0DveA3dHNjn5.s5IG0S', 'HR Department', 'Whirlpool', NULL, 1, NULL, NULL, '2025-05-12 10:32:22', '2025-05-12 10:36:00'),
(246, 'Acadian Contractors INC', 'acadiainc2@gmail.com', '$2y$12$kVnf6wF8SauqvggYX1gL.e02bcDRl.USixNWG0X99KQGPer1y22oC', 'HR Department', 'Acadian Contractors INC', NULL, 1, NULL, NULL, '2025-05-12 13:34:18', '2025-05-12 13:34:18'),
(247, 'CT.Marketing', 'HR@CHAMINDA.CC', '$2y$12$3UA1YGkxZ4rTAj.srcBfDO/O/W8LEMiuWXUUhC2GtIS4z8XGjljOO', 'HR Department', 'CT.Marketing', NULL, 1, NULL, NULL, '2025-05-12 14:00:12', '2025-05-12 14:00:12'),
(248, 'Quilox', 'admin@clubquilox.com', '$2y$12$B/wB.lTeacmjCXjPFFI28.kF9e8JZ.XMT0PyxoD9cCVt/MAdCIQKy', 'HR Department', 'Quilox', NULL, 1, NULL, NULL, '2025-05-12 14:04:19', '2025-05-12 14:04:19'),
(249, 'APS', 'allprofessionalservices@gmail.com', '$2y$12$eqLUDmd.iFnQXfcgKTkpPuUAHntnVqwq24FI3xMstN1KdnUgSbxLC', 'HR Department', 'APS', NULL, 1, NULL, NULL, '2025-05-13 09:00:18', '2025-05-13 09:00:18'),
(250, 'ADA Derana', 'yusuf@derana.lk', '$2y$12$/bGlKEqNUP5MgC26TAgnD.85wuMgRmLu31xMXakSXovUjs583gds2', 'HR Department', 'ADA Derana', NULL, 1, NULL, NULL, '2025-05-13 09:03:36', '2025-05-13 09:03:36'),
(251, 'Alpha', 'careers@alpha.lk', '$2y$12$74zIw6GfYKwjoqZllGaPq.xmdfE7hmKZrEjPcvq5kJvFFaLr6j3je', 'HR Department', 'Alpha', NULL, 1, NULL, NULL, '2025-05-13 09:12:11', '2025-05-13 09:12:11'),
(252, 'Sinclus Marketing Services Pvt Ltd', 'sin12@sinclus.com', '$2y$12$pkfHWD2GbOR3BgJFytJvfePY4.8ht/FGvyTtudQctXPju6G.W0AkC', 'HR Department', 'Sinclus Marketing Services Pvt Ltd', NULL, 1, NULL, NULL, '2025-05-13 09:24:31', '2025-05-13 09:24:31'),
(253, 'Vortex', 'infor@vortexaventure.com', '$2y$12$h.w7xHVPZWrgQDiQBIu9P.yYoXxGHIR7j.epS6ftkxB.DeW1bUCn2', 'HR Department', 'Vortex', NULL, 1, NULL, NULL, '2025-05-13 09:41:35', '2025-05-13 09:41:35'),
(254, 'M Lhuillier', 'ml-tg-hiring@mlhuillier.com', '$2y$12$hgh0Gb2HRr.ygdD10PCxOuVUajDpBKR05biXPXc4rrce.PfcU4Iq.', 'HR Department', 'M Lhuillier', NULL, 1, NULL, NULL, '2025-05-13 09:48:31', '2025-05-13 09:48:31'),
(255, 'Infinity Nature Resort', 'HASITHA@INFINITYNATURERESORT.COM', '$2y$12$nNExmIZBekIwZRg965QV5uVtrKJsDymXqp6h4h6mwTJMY7IN9KGyS', 'HR Department', 'Infinity Nature Resort', NULL, 1, NULL, NULL, '2025-05-13 09:56:18', '2025-05-13 09:56:18'),
(256, 'Lanka Talents', 'samalka@lankalalents.lk', '$2y$12$ICaJQNTXKDXsoSuJ/uk5Jer3ze4kSSXbnqes6sgfXsedExk1B0Bgy', '0705002122', 'Lanka Talents', NULL, 1, NULL, NULL, '2025-05-13 10:44:26', '2025-05-13 10:44:26'),
(257, 'PrimeHope.ltd', 'hrd@primehope.ltd', '$2y$12$m35/wWXayEchL6PfHXIJT.FM1cVE0fQHdMTmATlNery2nQi08eXki', '0760549241', 'PrimeHope.ltd', NULL, 1, NULL, NULL, '2025-05-13 11:03:59', '2025-05-13 11:03:59'),
(258, 'SuperServ', 'jobs@superserv.lk', '$2y$12$CWdSFBOODcqu6WchpDOBQuK7M32NjJ.4l25eBY79q7hz/Tj.S10um', 'HR Department', 'SuperServ', NULL, 1, NULL, NULL, '2025-05-13 11:14:00', '2025-05-13 11:14:00'),
(259, 'Upali Arts & Advertising', 'accounts@upaliarts.lk', '$2y$12$yJv01LFruiG4d0HoUazRsOMBPe/8zJHOGKslixe.Cxda02p5c/QUy', 'HR Department', 'Upali Arts & Advertising', NULL, 1, NULL, NULL, '2025-05-13 14:19:19', '2025-05-13 14:19:19'),
(260, 'IEBT', 'HR@IEBTCAMPAS.LK', '$2y$12$wocj2OufTbqrkQ/tHsnW1e89bSuk6MP4sJmIfM2lnyjJAS7AASWxy', 'HR Department', 'IEBT', NULL, 1, NULL, NULL, '2025-05-13 14:28:38', '2025-05-13 14:28:38'),
(261, 'Hilly Spring', 'HRColombo.SL@gmail.com', '$2y$12$114SG.YEuZQdVIT/ssexk.NKn2SODHbqCBrsczwcdY/rhoXw.NZcS', 'HR Department', 'Hilly Spring', NULL, 1, NULL, NULL, '2025-05-13 14:45:43', '2025-05-13 14:48:50'),
(262, 'Citypak', 'vacancy@citypak.lk', '$2y$12$rFRrWX/4Rsmaa33q8w/r/uvJ93dGTP8mnnb8thyZASDb/8gEYJuZS', 'HR Department', 'Citypak', NULL, 1, NULL, NULL, '2025-05-13 14:57:35', '2025-05-13 14:57:35'),
(263, 'Pathway Global', 'admin@pathwayglobal.lk', '$2y$12$Y.efvUg5JIVlRYgN7K6mWujS3ZQM5.Z6UiACm/AYSVM8Q6sDPN4hm', 'HR Department', 'Pathway Global', NULL, 1, NULL, NULL, '2025-05-13 15:17:16', '2025-05-13 15:17:16'),
(264, 'The John Keells Group', 'careers@keellslogistics.com', '$2y$12$QZZMkRuR2gIL3586e0F7uuwPNb21AJfClMshFuECsdQqySGw/Bm.O', 'HR Department', 'The John Keells Group', NULL, 1, NULL, NULL, '2025-05-13 15:34:28', '2025-05-13 15:34:28'),
(265, 'BridgePoint Resource Solutions', 'bridgepointresource@gmail.com', '$2y$12$V6NC5w.QOT920Z29o5kEleT7GIJ0z6QsoSpG3T91qCBGrJ4LF9/6K', 'HR Department', 'BridgePoint Resource Solutions', NULL, 1, NULL, NULL, '2025-05-13 15:45:31', '2025-05-13 15:45:31'),
(266, 'Dr.Hair', 'drtharinduamarajeewa@gmail.com', '$2y$12$.QsGZ7pZF9Yov634fa24jOMo4ywOKCq3OsqR0YCV0IT1vMUHBTAf2', 'HR Department', 'Dr.Hair', NULL, 1, NULL, NULL, '2025-05-13 16:04:19', '2025-05-13 16:04:19'),
(267, 'PrimeHope LTD', 'recruiter1@primehope.ltd', '$2y$12$91dKaz2TjUO1zXMCQayGO.1L./99YY0ltwe2937i1WBuQvqTX4Rgy', 'HR Department', 'PrimeHope LTD', NULL, 1, NULL, NULL, '2025-05-13 16:08:14', '2025-05-13 16:08:14'),
(268, 'GIC GEM LAB', 'careers.jewellers@bpdesilvasi.com', '$2y$12$dTFzzIy60hes9oFfyJLFZuZWTatlS/Qv5Ocv4BkHpP8xRo28mxzI6', 'HR Department', 'GIC GEM LAB', NULL, 1, NULL, NULL, '2025-05-13 16:13:52', '2025-05-13 16:13:52'),
(269, 'Lanka Talents', 'thilini@lankatalents.lk', '$2y$12$URHEqUVjgLW9cDnnzF3YWO737pAMipa4nx9ovYjuOPiautVW2adbC', 'HR Department', 'Lanka Talents', NULL, 1, NULL, NULL, '2025-05-13 16:23:33', '2025-05-13 16:23:33'),
(270, 'Collons International Pvt Ltd', 'collonscv@gmail.com', '$2y$12$7RmiwsFD.ZaxCb66xManKOJ2c1cRn0OcHQtRlEPogagMz/ebZVTvy', 'HR Department', 'Collons International Pvt Ltd', NULL, 1, NULL, NULL, '2025-05-13 16:30:46', '2025-05-13 16:30:46'),
(271, 'Safetynet (Private) Limited', 'careers@bimsara.com', '$2y$12$joTvq7fIYnhfrwK1cM/MpuXi8Cgpiwc./jORwIso7XV0SaLpKUUU.', 'HR Department', 'Safetynet (Private) Limited', NULL, 1, NULL, NULL, '2025-05-14 09:57:08', '2025-05-14 09:57:08'),
(272, 'ChargeNeT', 'Careers@vega.lk', '$2y$12$BXUblk5Z3wt6HihS5LWxe.zkWmPiCo4vuUZsC4mmwra.oBTCacBTm', 'HR Department', 'ChargeNeT', NULL, 1, NULL, NULL, '2025-05-14 10:13:14', '2025-05-14 10:13:14'),
(273, 'Blue Ocean Group of Company', 'Career@blueocean.lk', '$2y$12$jqehHeoyYi0Zi1ZxIpiV5OjGz.lgD3FzoYCLxIKkgb5oak/FLeqW2', 'HR Department', 'Blue Ocean Group of Company', NULL, 1, NULL, NULL, '2025-05-14 10:18:15', '2025-05-14 10:18:15'),
(274, 'Voice Print Academy', 'voiceprintmusicacademy@gmail.com', '$2y$12$8G7pXkYZKDjFO0fU9ZcXsOWft4OxG55V75NDBT6Bb8P2.W1Kd9FyK', 'HR Department', 'Voice Print Academy', NULL, 1, NULL, NULL, '2025-05-14 10:23:34', '2025-05-14 10:23:34'),
(275, 'Drugstore Pharmacy', 'healthgradepharmacy@gmail.com', '$2y$12$GcF2AEpA6rJovlg95zpjuuPbq64LzlL9fYzEYniF6m8ix/hve5XPi', 'HR Department', 'Drugstore Pharmacy', NULL, 1, NULL, NULL, '2025-05-14 10:37:47', '2025-05-14 10:37:47'),
(276, 'West Eastern Recruitment', 'info@westeastern.lk', '$2y$12$XJocLZSQ4OgkUXcC.LPCj.95VkMHZ01EWOX8zh3G52JsyFgcWebpy', '0774106830', 'West Eastern Recruitment', NULL, 1, NULL, NULL, '2025-05-14 11:24:11', '2025-05-14 11:24:11'),
(277, 'Echelon', 'careers@echelon.media', '$2y$12$m4EOcMy6eZHnzEG7zTdHZuRc2quSbjxYROTcOOJoEIS.7qc3w.6VK', 'HR Department', 'Echelon', NULL, 1, NULL, NULL, '2025-05-14 11:59:08', '2025-05-14 11:59:08'),
(278, 'Juliana Hotel', 'gm@julianalk.com', '$2y$12$Kpf2vhbXpZOgcaBwac5S6.ytlYvlBsIaNOULIvH/FrNkJCxdwhP/G', 'HR Department', 'Juliana Hotel', NULL, 1, NULL, NULL, '2025-05-14 12:06:49', '2025-05-14 12:06:49'),
(279, 'CEDA', 'recruitment@cgpconsultants.com', '$2y$12$jHjExOJG51lL6i.c/vP/SOBdXhBafBiLNVJ6bq3sxXMkLI76hQz8G', 'HR Department', 'CEDA', NULL, 1, NULL, NULL, '2025-05-14 12:24:33', '2025-05-14 12:24:33'),
(280, 'Costumiere', 'studiocostumiere@gmail.com', '$2y$12$1GUgiVzdHh.4uc3S9hX9Hu5aRJAk.oB2kKxYgLc1kwHofSfu6Vbze', 'HR Department', 'Costumiere', NULL, 1, NULL, NULL, '2025-05-14 12:42:15', '2025-05-14 12:42:15'),
(281, 'KSA', 'cvs@delhioverseas.in', '$2y$12$npLVWn.HuWSt/gsEZBFvpepMQL56vDwsKUwsQU0zawbIxZy/e1toy', 'HR Department', 'KSA', NULL, 1, NULL, NULL, '2025-05-14 13:01:52', '2025-05-14 13:01:52'),
(282, 'Sobha Constructions', 'corpjobs@sobhaconst.com', '$2y$12$h3aKjhRyNrQ7GAXoW370He/1I4RPA9Gg0JaGZXzXkByB.oM3aTQKK', 'HR Department', 'Sobha Constructions', NULL, 1, NULL, NULL, '2025-05-14 13:16:36', '2025-05-14 13:16:36'),
(283, 'MERCURE', 'thuy.trant@accor.com', '$2y$12$jUZT.FBq1F2Vg1.EWdvNOuRJZvzp4xOpknnfriF2qB1LmsKHMH32W', 'HR Department', 'MERCURE', NULL, 1, NULL, NULL, '2025-05-14 13:27:26', '2025-05-14 13:27:26'),
(284, 'Rathna Group', 'hasan.rathnagroup@gmail.com', '$2y$12$Z0hQLiWLeJueOHBdlPBzM./h.ytrAxEU4/Ok6XHbbJtH66h75sqKm', 'HR Department', 'Rathna Group', NULL, 1, NULL, NULL, '2025-05-14 13:33:08', '2025-05-14 13:33:08'),
(285, 'House Of Sandwich Colombo', 'HOSCOLOMBO@OUTLOOK.COM', '$2y$12$ur.CLEI6mbYi1TwQr5TFF.EJOxdhBfHQ.WcDHn37y/hnGB2rTAgDO', 'HR Department', 'House Of Sandwich Colombo', NULL, 1, NULL, NULL, '2025-05-14 13:38:00', '2025-05-14 13:38:00'),
(286, 'BMC Group', 'wblanka2022@gmail.com', '$2y$12$eY1YwQ2Zdk.rANvOiE0G8Obg0RApPWux3U1dW6eAaIZTkQlxC38Ci', 'HR Department', 'BMC Group', NULL, 1, NULL, NULL, '2025-05-14 14:14:39', '2025-05-14 14:14:39'),
(287, 'Genuine Investment & Micro Credit (PVT) Ltd', 'genuineinvestment01@gmail.com', '$2y$12$wUNfpJ3X49ncVSWUSB9Zr.dpZdAiGfOENsvWncH0MpOB1b1SzL8Lm', 'HR Department', 'Genuine Investment & Micro Credit (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-14 14:21:22', '2025-05-14 14:21:22'),
(288, 'OG Consultancy', 'hr@ogconsultancy.org', '$2y$12$KTLzukr39/d8CqUEkn9yZ.v.COf6dGpS7Og6sV/CvLFCAXszGBKa.', 'HR Department', 'OG Consultancy', NULL, 1, NULL, NULL, '2025-05-14 14:29:05', '2025-05-14 14:29:05'),
(289, 'Samaranayaka Trading PVT', 'accdep.stb@gmail.com', '$2y$12$nP2FSXyWesbH.zE6Q6IqCusEn0hu/G1lffjUtcd1.vF6WloAUQoFO', 'HR Department', 'Samaranayaka Trading PVT', NULL, 1, NULL, NULL, '2025-05-14 14:34:10', '2025-05-14 14:34:10'),
(290, 'Milky Bakers (Pvt) Ltd', 'hr.milkybakers@gmail.com', '$2y$12$jJow3Xec3Pjr06eOcZ8Bu.LwOMucCOks5SQc0X/BSyurSW/3XDow.', 'HR Department', 'Milky Bakers (Pvt) Ltd', NULL, 1, NULL, NULL, '2025-05-14 14:38:36', '2025-05-14 14:38:36'),
(291, 'Clemens Pharmaceuticals', 'hr.support@clemens.lk', '$2y$12$XmP3nK36hKKX4t3pxYy4S.kXcjuexajXSO31adyfKAg/Jfe98IGMy', 'HR Department', 'Clemens Pharmaceuticals', NULL, 1, NULL, NULL, '2025-05-14 14:51:38', '2025-05-14 14:51:38'),
(292, '360 Aesthetics', 'asha360bydrcherry@gmail.com', '$2y$12$Cc6SIzyOEb10ReWjnNaRneZFnVjMbG0enETCt.QUoMfo4nbr8WmsW', 'HR Department', '360 Aesthetics', NULL, 1, NULL, NULL, '2025-05-14 14:57:19', '2025-05-14 14:57:19'),
(293, 'SOLAR JOINT (Pvt) Ltd', 'hr@solarjoint.lk', '$2y$12$3I8itf.rmO2N5YpaPg8wpuRzhu55RvH9Hf5Wnz7J0rjyPXoVo0Cdi', '0777580451', 'Solar Joint', NULL, 1, NULL, NULL, '2025-05-15 07:07:14', '2025-05-15 07:07:14'),
(294, 'Royal Flour Mills', 'info@royalflourmills.com', '$2y$12$GslzlL/kk2htBAXjGg2uIe0rmSGyAIfQhWV8mzR2DiLqdg85d48uq', '0777580451', 'Royal Flour Mills', NULL, 1, NULL, NULL, '2025-05-15 07:18:23', '2025-05-15 07:18:23'),
(295, 'eSupport', 'info@esuport.live', '$2y$12$Ytnl8uKQ0vBz.DMpgy699O1GN5/9CtDWTdvAZMeTE3W8pbONhuabm', '(+94) 115-810-810', 'At eSupport Technologies, we\'re the architects of digital brilliance, situated in Rajagiriya. With over 900 projects, our team of 22 experts crafts tailored solutions that transcend expectations. From web and system development to cutting-edge digital marketing, our journey is defined by a commitment to perfection.', NULL, 1, NULL, NULL, '2025-05-15 11:26:37', '2025-05-15 11:26:37'),
(296, 'GKSV Consultancy', 'careers@gksvconsultancy.com', '$2y$12$f/lHDubKoVzoGOjMqv9Ouev5J.KMlhgIcMcNORQfBSAnt5lTR5ko6', '0777580451', 'GKSV Consultancy', NULL, 1, NULL, NULL, '2025-05-16 05:19:59', '2025-05-16 05:19:59'),
(297, 'Best Dives (Pvt) Ltd', 'hr@bestdivesmaldives.com', '$2y$12$PBz8ZdD7ytUXtc5OMC4Ejej4LEPc9C1fIcvnlcLrxEB57xo0kjaqK', '0777580451', 'Best Dives Maldives', NULL, 1, NULL, NULL, '2025-05-16 05:30:33', '2025-05-16 05:30:33'),
(298, 'Dial Trade & Travel Pte Ltd', 'marketing@dialtrade.com', '$2y$12$g5af9Fu55/ow4x6PbaBPjODg0xrp3ouKHdWpSX.4ZuNA0UBpJoAG.', '0777580451', 'Dial Trade', NULL, 1, NULL, NULL, '2025-05-16 06:04:39', '2025-05-16 06:04:39'),
(299, 'AccSense', 'careers@accsence.lk', '$2y$12$JGHVhTkutOLpGpwR5tCxo.mkm/HDS3m1b210NSt4B7liCXKhAiy/G', '0777580451', 'AccSense', NULL, 1, NULL, NULL, '2025-05-16 06:11:48', '2025-05-16 06:11:48'),
(300, 'Siyengo Management (PVT) Ltd', 'cvsiyengo123@gmail.com', '$2y$12$kcDgg/yV795oq4FnHU380.PIBqYkrFQ2oZ8aCq1qhfF.Qp0jmyCey', 'HR Department', 'Siyengo Management (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-17 07:51:16', '2025-05-17 07:51:16'),
(301, 'ARS Associates', 'arsaudit77@gmail.com', '$2y$12$rGo2oALIoP4lyV1xWj5d1uvNkZYKh0/GL9QdoNZ63LRNMDowd0SK6', 'HR Department', 'ARS Associates', NULL, 1, NULL, NULL, '2025-05-17 07:58:13', '2025-05-17 07:58:13'),
(302, 'PAK QATAR Group', 'recruitment@pakqatar.com.pk', '$2y$12$IDT9lRzgW5j7Uf6kKItxG.FFCxNJoIsPZ43i4X2G0wyeuxT7VF7Ea', 'HR Department', 'PAK QATAR Group', NULL, 1, NULL, NULL, '2025-05-17 08:04:21', '2025-05-17 08:04:21'),
(303, 'My Virtual Mate', 'avleen@myvirtualmate.com', '$2y$12$FE6qc86DBdpRyaSGbZuTDePmGvxXzg.l3wwtH0E/bmKGGrJn5AyN6', 'HR Department', 'My Virtual Mate', NULL, 1, NULL, NULL, '2025-05-17 08:48:14', '2025-05-17 08:48:14'),
(304, 'Pannipitiya Medical Services (PVT) Ltd', 'pnh.info@yahoo.com', '$2y$12$0jOW25lynT7yMJtdDYkrS.N0EI1ffUoO1QmElHK7lawb7X9zOrV/.', 'HR Department', 'Pannipitiya Medical Services (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-17 09:04:22', '2025-05-17 09:04:22'),
(305, 'AccSense', 'careers@accsense.lk', '$2y$12$N.RuAKBTyRLOq9r8.aPs3uaFRwvjiBnNFDyub0gSAwYbJBqbV2JMK', 'HR Department', 'AccSense', NULL, 1, NULL, NULL, '2025-05-17 09:17:01', '2025-05-17 09:17:01'),
(306, 'SNR', 'snrassociatesaudit@gmail.com', '$2y$12$H9g4orxFinE31Jt0X5TcEuD5Cru27mtxF3H4lX9A3YX9g.NrX7L92', 'HR Department', 'SNR', NULL, 1, NULL, NULL, '2025-05-17 09:32:04', '2025-05-17 09:32:04'),
(307, 'Roky Holding (Pvt) Ltd', 'careers@rokyholdings.com', '$2y$12$Rkxz1LG5EasWfaqRHdsELu1ENdKIu4bYG8.qp0UScwpwPcXZBfhCO', 'HR Department', 'Roky Holding (Pvt) Ltd', NULL, 1, NULL, NULL, '2025-05-17 09:42:15', '2025-05-17 09:42:15'),
(308, 'POLO Engineering (PVT) Ltd', 'polovacancy@gmail.com', '$2y$12$FCz3kIdLKYo5r1U9viad2ekTQIyXW5iWMPJ3kb5MjLrax/FAFLmCG', 'HR Department', 'POLO Engineering (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-17 09:53:05', '2025-05-17 09:53:05'),
(309, 'Reliance INT\'L Academy', 'hr@riaschool.edu.np', '$2y$12$j6wYgP3FTCH5ximlKkiZLeqxX7LP7PJtvL3WWDQsTI7nicsQn98y.', 'HR Department', 'Reliance INT\'L Academy', NULL, 1, NULL, NULL, '2025-05-17 10:11:38', '2025-05-17 10:11:38'),
(310, 'PRG Industrial Solutions', 'paulinerasonabe@triunityexecsearch.com', '$2y$12$K2YYhQvMURk8Ip26RPW3Tui.P6rYp9K0aO8fG/y5hzgFOJMRVkRJ6', 'HR Department', 'PRG Industrial Solutions', NULL, 1, NULL, NULL, '2025-05-17 10:21:06', '2025-05-17 10:21:06'),
(311, 'Utande', 'recruitment@dandemutande.co.zw', '$2y$12$bXIxZ2.2xjLXB7iBkTFbC.eDkPQ7LQOAOF5dXBYFXaWPReaW0Vad.', 'HR Department', 'Utande', NULL, 1, NULL, NULL, '2025-05-17 10:26:33', '2025-05-17 10:26:33'),
(312, 'GTH Career', 'support@aroratalent.com', '$2y$12$IfNh.makfCUu1VHYLet/yOVrlcKI/iaVYNyDYniDF.g1lG8VAV/ha', 'HR Department', 'GTH Career', NULL, 1, NULL, NULL, '2025-05-17 10:29:52', '2025-05-17 10:29:52'),
(313, 'Lanka Talents', 'milantha@lankatalents.lk', '$2y$12$OpZGRu0ajEmna./yQNohPeVUPjaDEJNxjjp/Yd7UMAaUwhhvKuF1m', 'HR Department', 'Lanka Talents', NULL, 1, NULL, NULL, '2025-05-17 10:35:19', '2025-05-17 10:35:19'),
(314, 'Northwood University', 'm.fonseka@northwood.ae', '$2y$12$KePoa18dSYq9LtCRc0a8E.kl1z8bPVyBWDqDnoFnp7dCCMUdcR8oO', 'HR Department', 'Northwood University', NULL, 1, NULL, NULL, '2025-05-17 10:43:23', '2025-05-17 10:43:23'),
(315, 'Sri Lanka Country Head', 'KCLAW12@KENTONLAW.CO.NZ', '$2y$12$wTmWQsAdH65DYHPNbQq4ZOZpYDgDs5R5k8Z/ttvYvVbYG.h2PkNGW', 'HR Department', 'Sri Lanka Country Head', NULL, 1, NULL, NULL, '2025-05-17 12:11:43', '2025-05-17 12:11:43'),
(316, 'Enova', 'recruitment@enova-me.com', '$2y$12$zqz9SgFkAP.qYAVfYmRzu.LSAc2zmHNOTV240UqG6lterM3BB9kpa', 'HR Department', 'Enova', NULL, 1, NULL, NULL, '2025-05-17 12:15:50', '2025-05-17 12:15:50'),
(317, 'Soundines Group', 'oilgasslg@gmail.com', '$2y$12$.mBU7fyTlIwIdA2xaEY8TeOwxLvlZQaPVDur/LkB9vCY.NBFRXij6', 'HR Department', 'Soundines Group', NULL, 1, NULL, NULL, '2025-05-17 12:27:08', '2025-05-17 12:27:08'),
(318, 'Movenpick', 'PHAMTHU@movenpick.com', '$2y$12$FzqwVo48TREzyUxVIbx5guE3kLn.PxZ1oYEfHnwF2i6cliN5XrypS', 'HR Department', 'Movenpick', NULL, 1, NULL, NULL, '2025-05-17 12:36:42', '2025-05-17 12:36:42'),
(319, 'Sea Farer', 'franchesca.arceo@seafarerconsulting.com', '$2y$12$xdlRXwPRN1o8FAAqwJUP/elI42ZvLz8fJMUK79.wJb9N8gRwVzCmG', 'HR Department', 'Sea Farer', NULL, 1, NULL, NULL, '2025-05-17 12:58:00', '2025-05-17 12:58:00'),
(320, 'Mansions', 'cv@mansions.ae', '$2y$12$4d4gW1FwWpNAWZA21g.meOHdiR2zYIimwNebILi0Vk4acCZXNvYZS', 'HR Department', 'Mansions', NULL, 1, NULL, NULL, '2025-05-17 13:04:50', '2025-05-17 13:04:50'),
(321, 'Sobha Constructions', 'scl.sou2@sobhaconst.com', '$2y$12$opHFnXN6l37d4AvnFWTAWuQe8NXIbS0MJ.wPyGmgIHv.EosV1mjay', 'HR Department', 'Sobha Constructions', NULL, 1, NULL, NULL, '2025-05-17 13:08:35', '2025-05-17 13:08:35'),
(322, 'Saubi Heavy Driver', 'cv.transgulflanka@gmail.com', '$2y$12$m2apcYWbLQbjxz1AdyUy..WFzCm1uNk5t42xurmeh2C/BdTR2k0bi', 'HR Department', 'Saubi Heavy Driver', NULL, 1, NULL, NULL, '2025-05-17 13:12:54', '2025-05-17 13:12:54'),
(323, 'Bitulink Group of Company', 'careers.bitulink@gmail.com', '$2y$12$5JDdX4gnFsdfvUYD74IPhelyx5ANFKAJBmO171UJCmrwy4eS9bzua', 'HR Department', 'Bitulink Group of Company', NULL, 1, NULL, NULL, '2025-05-17 13:20:33', '2025-05-17 13:20:33'),
(324, 'Finez', 'Careers@finez.lk', '$2y$12$xEvaxiZ9XY8jBvhlDlyfhO1ZTcLDrZuuf7AxOu0MFd75lrcjt04yW', 'HR Department', 'Finez', NULL, 1, NULL, NULL, '2025-05-17 13:28:52', '2025-05-17 13:28:52'),
(325, 'CLEANCO', 'RECRUITMENT@CLEANCO.Ae', '$2y$12$KXN9dwC53ffk1I8o8H4lfeSMYLcyhxoEtt8YeS4e3b/kGzT7EYO/i', 'HR Department', 'CLEANCO', NULL, 1, NULL, NULL, '2025-05-18 08:49:56', '2025-05-18 08:49:56'),
(326, 'Sinclus Marketing Services Pvt Ltd', 'sin4@sinclus.com', '$2y$12$FGWdwlnzBwfN..b5RnRgV.UAvCE67NBK69WGJWUUN/ikSj7Up0sFi', 'HR Department', 'Sinclus Marketing Services Pvt Ltd', NULL, 1, NULL, NULL, '2025-05-18 09:15:34', '2025-05-18 09:15:34'),
(327, 'SEAGULL', 'seagullchennai.info@gmail.com', '$2y$12$MwK5Ynu/rM1J5/EFb3uxjunuhSZL77FrUThFRvdL6ypWTl2jgo1X2', 'HR Department', 'SEAGULL', NULL, 1, NULL, NULL, '2025-05-18 09:31:30', '2025-05-18 09:31:30'),
(328, 'TREEHOUSE CHALETS', 'info@TREEHOUSECHALETS.COM', '$2y$12$tWRQQHLLSM9iwLtGz5MSPO4Y6E1Y7U3NTvjkK5TXTeSwNwQ34bD0i', 'HR Department', 'TREEHOUSE CHALETS', NULL, 1, NULL, NULL, '2025-05-18 09:43:13', '2025-05-18 09:43:13'),
(329, 'read foundation', 'readcareers@readfoundation.org', '$2y$12$HbLhQLzSauGyjSWZmnEFj.8gv8bdfoCRPKAKg4egU2/41n7Ipvdsy', 'HR Department', 'read foundation', NULL, 1, NULL, NULL, '2025-05-18 09:50:22', '2025-05-18 09:50:22'),
(330, 'SEAGULL', 'job.seagullintemational@gmail.com', '$2y$12$1UYnzJ6Qf7taahXB./pAheXue2jl6fdhavKY68HGBJlocsg6pAT6W', 'HR Department', 'SEAGULL', NULL, 1, NULL, NULL, '2025-05-18 09:57:56', '2025-05-18 09:57:56'),
(331, 'Credit Corporation', 'Recruitment@creditbank.com.pg', '$2y$12$tcLz6liG1qxphblgkyz/puuk6q9gB/9d0L7EIfTaHLnb9rs3HFfAa', 'HR Department', 'Credit Corporation', NULL, 1, NULL, NULL, '2025-05-18 10:10:32', '2025-05-18 10:13:29'),
(332, 'Iphonik', 'info@iphonik.com', '$2y$12$i3Qn.A45OtbsVt9GiuE5COTac3/UHfvInANSkXwzybiGAIQqy5k0K', 'HR Department', 'Iphonik', NULL, 1, NULL, NULL, '2025-05-18 12:10:20', '2025-05-18 12:10:20'),
(333, 'Star Services', 'cv@starservices.ae', '$2y$12$o8J4ee0VYMVLwI2qfD23Q.pVhzeVIQFv4ag4Q1d5ypAPcUq65hEIm', 'HR Department', 'Star Services', NULL, 1, NULL, NULL, '2025-05-18 12:38:41', '2025-05-18 12:38:41'),
(334, 'Rumi International', 'cv@rumilnternational.com', '$2y$12$FwJCu4WRH.3l9rFVUXEjTu6s9FjKoATDz9XS12K5tOcmsmU334Ssq', 'HR Department', 'Rumi International', NULL, 1, NULL, NULL, '2025-05-18 12:52:30', '2025-05-18 12:52:30'),
(335, 'Grand Hotel', 'info.grandhotelslanka@gmai.com', '$2y$12$AbsGxyH2hsoThwWBXlEKbe6DskDzw21rC4.elzbhBCQ.c3YQdl3EC', 'HR Department', 'Grand Hotel', NULL, 1, NULL, NULL, '2025-05-18 12:53:45', '2025-05-18 12:53:45'),
(336, 'WYNDHAM GARDEN', 'hr@cml.com.fj', '$2y$12$Vhxs8RTknyUjfL0eXgLzJ.KHTnz72nzi5jri3PuP1UTw9/wUeEK/6', 'HR Department', 'WYNDHAM GARDEN', NULL, 1, NULL, NULL, '2025-05-18 13:10:01', '2025-05-18 13:10:01'),
(337, 'The Crow\'s Nest', 'sales@crowsnestresortfiji.com', '$2y$12$juIlEgnpCiQ0Qps/uSuN2.BW7EGASgIs3NL.IXdkRUuza/i8yBB/a', 'HR Department', 'The Crow\'s Nest', NULL, 1, NULL, NULL, '2025-05-18 13:17:26', '2025-05-18 13:17:26'),
(338, 'BlueWave International', 'mombase@bwis.co.ke', '$2y$12$c8byosUo3E2ORLVVH4bMFuZ/rJe1q534Bsvye1B14XIftzy/rrJaO', 'HR Department', 'BlueWave International', NULL, 1, NULL, NULL, '2025-05-18 13:48:53', '2025-05-18 13:48:53'),
(339, 'ADS Security Service', 'adsservice.office@gmail.com', '$2y$12$xkv0ggwCdebVVuZblkLX9.9ESzyPpGuothdtdEPJLSIa0.Zhv4DMm', 'HR Department', NULL, NULL, 1, NULL, NULL, '2025-05-18 13:51:22', '2025-05-18 13:51:22'),
(340, 'MERCURE', 'careers.mercuredubaihotel@accor.com', '$2y$12$aDuAWo0PXoZtSXEBYbbqxOGytRfsB3MqewsGgczuunPmopw8.AHTu', 'HR Department', 'MERCURE', NULL, 1, NULL, NULL, '2025-05-18 13:59:54', '2025-05-18 13:59:54'),
(341, 'Olivarez General Hospital', 'hrdepartment@oilvarezgenhospital.com', '$2y$12$tczPmu2ihd1yvTtDof71zOvUL1ipQMSxuC/QWlni7Ldadg6nTcvtS', 'HR Department', 'Olivarez General Hospital', NULL, 1, NULL, NULL, '2025-05-18 14:29:34', '2025-05-18 14:29:34'),
(342, 'BioNutri international (PVT) Ltd', 'hr@bionutri.lk', '$2y$12$DYdrQ9gpixBt3imA1fP1UeUmGW1AwATcHp5j8QncQQ0Oso9Gm1t.K', 'HR Department', 'BioNutri international (PVT) Ltd', NULL, 1, NULL, NULL, '2025-05-18 14:37:02', '2025-05-18 14:37:02'),
(343, 'ECC', 'hr@europeancitycampus.lk', '$2y$12$oV4UEydgdot9KaVzx2zkWutWtuwvXCt1C1TzKHijpUieQiYbkWsha', 'HR Department', 'ECC', NULL, 1, NULL, NULL, '2025-05-18 14:43:23', '2025-05-18 14:43:23'),
(344, 'Soneva Jani', 'careers-maldives@soneva.com', '$2y$12$8HFGv9aWEWlTfSKsI7MzJe1kQ.AF/vyZqr9qAcFZspHpDJWt5sZP.', NULL, NULL, NULL, 1, NULL, NULL, '2025-05-18 14:45:29', '2025-05-18 14:45:29'),
(345, 'British Way English Academy', 'vacancy.britishway@gmail.com', '$2y$12$V.KNpJWn7O0RnjDe9r0WCeX6cwz71jMf5hTnLyqe4IjP76tRIB3gS', NULL, NULL, NULL, 1, NULL, NULL, '2025-05-18 16:38:40', '2025-05-18 16:38:40'),
(346, 'Visaya Ortigas', 'apply@visayakpo.com', '$2y$12$NxXMOx0cYXRSOkzKRF94eOpQvmvWYbQPxXIS5MhK90UIRgDtK.3V2', NULL, NULL, NULL, 1, NULL, NULL, '2025-05-18 17:04:56', '2025-05-18 17:04:56'),
(347, 'ATN Services Pvt Ltd', 'careers@auastalentnetwork.com', '$2y$12$La/xTyE3tnpV6Ekjqfsqw.naSeayMYyLXZPckx4t3.EPGIROTGFGm', NULL, NULL, NULL, 1, NULL, NULL, '2025-05-18 18:59:02', '2025-05-18 18:59:02'),
(348, 'Kelvin Catering Services & Facilities Management', 'CAREER@KCS.AE', '$2y$12$vJd.0kbB/9Lbd4fyDrGOpOE2yTOk2cP6IakTtZH5GD8dV8lPWi3Ze', NULL, NULL, NULL, 1, NULL, NULL, '2025-05-18 19:33:16', '2025-05-18 19:33:16'),
(349, '3Rive Technologies (Pvt) Ltd', 'shamla@3rivetech.com', '$2y$12$iJGLB7aczWr/BIZFZI034.BwTSbVhCGYIpUBGxr9LRGD3sNWzqJLm', 'Shamla - 0777646699', NULL, NULL, 1, NULL, NULL, '2025-05-19 08:26:47', '2025-05-19 08:26:47'),
(350, 'Gulf Patches', 'noahadam2104@gmail.com', '$2y$12$LrZ2/eCul7Ygvaua4zIOFeMucx/cMqpunv/ZK1v.Ry0aFJ0nQ9aii', NULL, NULL, NULL, 1, NULL, NULL, '2025-05-20 09:57:02', '2025-05-20 09:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approve','reject') NOT NULL DEFAULT 'pending',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `message`, `rating`, `user_id`, `employer_id`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2, 'Very Good', 4, NULL, 5, 'approve', NULL, '2025-01-29 20:25:15', '2025-01-29 20:26:26'),
(4, 'Best Website', 5, 1, NULL, 'approve', NULL, '2025-01-29 22:58:59', '2025-02-03 16:44:08'),
(5, '123123', 4, 6, NULL, 'approve', NULL, '2025-01-30 15:28:51', '2025-01-30 15:29:32'),
(6, 'very good', 4, 6, NULL, 'approve', NULL, '2025-01-30 17:05:39', '2025-02-03 16:44:19'),
(7, 'well', 3, NULL, 1, 'pending', NULL, '2025-02-03 09:08:48', '2025-02-03 09:08:48'),
(8, 'Excellent', 5, NULL, 12, 'approve', NULL, '2025-02-03 09:53:12', '2025-02-03 11:39:25'),
(10, 'highly recommended', 5, 107, NULL, 'pending', NULL, '2025-05-15 15:30:23', '2025-05-15 15:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `flagged_jobs`
--

CREATE TABLE `flagged_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `job_posting_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flagged_jobs`
--

INSERT INTO `flagged_jobs` (`id`, `user_id`, `job_posting_id`, `created_at`, `updated_at`) VALUES
(1, 11, 49, '2025-02-17 12:07:34', '2025-02-17 12:07:34'),
(3, 113, 494, '2025-05-17 14:07:49', '2025-05-17 14:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_education`
--

CREATE TABLE `job_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_seeker_id` bigint(20) UNSIGNED NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `field_of_study` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_education`
--

INSERT INTO `job_education` (`id`, `job_seeker_id`, `institution_name`, `degree`, `field_of_study`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(9, 17, 'University  Of Sri Jayewardenepura', 'Bachelor of Commerce', 'Finance Accounting', '2018-08-01', '2023-08-28', '2025-02-10 20:44:59', '2025-02-10 20:52:20'),
(10, 17, 'Association Of Accounting Technicians Of Sri Lanka', 'Passed Finalists', 'Accounting', '2014-01-01', '2023-08-12', '2025-02-10 20:44:59', '2025-02-10 20:52:43'),
(11, 17, 'Aquinas College in Borella', 'English Diploma', 'English', '2024-06-01', '2025-02-10', '2025-02-10 20:44:59', '2025-02-10 20:44:59'),
(13, 3, 'Sliit', 'Software Engineering', '<p><br></p>', '2025-02-01', '2025-02-01', '2025-02-18 16:44:49', '2025-02-18 16:44:49'),
(31, 65, 'Nalanda College', 'Management', '<p>Finance </p>', '1999-04-01', '2040-04-30', '2025-04-18 21:16:45', '2025-04-18 21:16:45'),
(32, 78, 'Pyay Technological University', 'Electrical', '<p>I have completed the Electrical Engineer(Bachelor of Technology) in myanmar</p>', '2013-11-30', '2017-10-30', '2025-04-29 21:35:57', '2025-04-29 21:35:57'),
(33, 96, 'BCS', 'BCS Diploma', '<p>Computer science </p>', '2005-05-02', '2010-05-08', '2025-05-07 23:24:19', '2025-05-07 23:24:19'),
(34, 96, 'Lyceum Campus', 'Early Childhood Education', '<p>Early Childhood Education</p>', '2024-04-30', '2025-06-30', '2025-05-07 23:24:19', '2025-05-07 23:24:19'),
(35, 113, 'institute of technology university of moratuwa', 'National Diploma in Technology', '<p>mechanical engineering technology including material science, fluid mechanics ,thermodynamics, ict, manufacturing ,industrial engineering,production ,building service engineering.</p>', '2022-05-17', '2025-12-31', '2025-05-17 13:58:03', '2025-05-17 13:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `job_experience`
--

CREATE TABLE `job_experience` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_seeker_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `job_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_experience`
--

INSERT INTO `job_experience` (`id`, `job_seeker_id`, `company_name`, `job_title`, `start_date`, `end_date`, `job_description`, `created_at`, `updated_at`) VALUES
(1, 4, 'Fairway Holdings (Pvt) Ltd', 'Group CFO', '2022-10-04', '2025-01-15', '<p>Oversee group finance and operational functions</p>', '2025-01-31 19:27:20', '2025-02-12 13:01:34'),
(2, 2, 'Esupport', 'Project Manager', '2025-01-31', '2025-02-01', 'hello world', '2025-02-03 09:04:04', '2025-02-03 09:04:04'),
(4, 17, 'Co-operative Rural Banks', 'Branch Maneger', '2019-08-01', '2024-02-04', '•	Supervision of bank branch Operational activities\r\n•	Maintain daily reports & send them to head office within the time frame.\r\n•	Handling & managing loan (Issuing, collection, recovery & interest calculation)    \r\n•	Handling pawing according to operation manually.  \r\n•	Keep custardy of fix deposit certificate, jewelry item & other valuable item.\r\n•	Maintain accurate ledger accounts & reconcile with Trail balance to ensure accuracy.\r\n•	Maintain branch cash flow & petty cash float.\r\n•	Follow-up recovery action for unsettle loan. \r\n•	Activate Doman accounts.  \r\n•	Maintaining the satisfactory relationship with bank customer & inter bank branches and \r\n        head office.\r\n•	Participate the Mid & yearend stock count.\r\n•	Sharing details to audit with Co-operative department.', '2025-02-10 20:32:45', '2025-02-10 20:32:45'),
(5, 17, 'Fairway Colombo Hotel', 'Accountant Assistant', '2024-02-06', '2024-06-09', '•	Processing invoices based on customer request (Corporate, Online & Direct)\r\n•	Managed the invoicing process to ensured timely collection of receivable and maintained accurate records of all receivables.\r\n•	Assist to prepare financial statements by providing accurate accounts receivable data.\r\n•	Reconciled accounts and resolved discrepancies to maintain accurate financial records.\r\n•	Check and reconcile credit card payments to validate customer payments.\r\n•	Handle the petty cash payment for operational expenses.', '2025-02-10 20:32:46', '2025-02-10 20:32:46'),
(6, 17, 'Chamber of Contraction Industry of Sri Lanka', 'Accountant Assistant', '2024-06-11', '2025-02-10', 'Processing invoices based on customer request \r\n•	Reconcile the Customer Outside\r\n•	Processing Supplier Payment \r\n•	Maintain the Bank account and reconciliation\r\n•	Processing Monthly Revenue Collection \r\n•	Enter the Journal entry (ETF, EPF, Salary)\r\n•	Create the salary Detail', '2025-02-10 20:32:46', '2025-02-10 20:32:46'),
(7, 19, 'Fairway Holdings (Pvt) Ltd', 'Group CFO', '2022-10-04', '2025-02-15', '<p class=\"ql-align-justify\">Currently working as the GCFO and overlooking the Group Finance activities, Give recommendations &amp; suggestions to strategic decisions, sustainable growth and expansion of the group operation. Maintain good relationship with bankers to manage loan portfolio and working capital requirements.</p><p><br></p>', '2025-02-13 20:31:00', '2025-02-13 20:31:00'),
(8, 19, 'Beijing Enterprises Water Group Limited', 'Finance Controller', '2022-04-01', '2022-10-03', '<p>Due to bad Economic conditions in Sri Lanka, Government and China Parent company has decided to stop Sri Lankan operation</p>', '2025-02-13 20:31:00', '2025-02-13 20:31:00'),
(9, 19, 'EL Holdings (Pvt) Ltd', 'Finance & Administration Manager', '2020-12-01', '2022-03-30', '<p class=\"ql-align-justify\">As the Finance Manager, oversee the entire finance operation of the group and handled the IT, HR, and administration functions.</p><p><br></p>', '2025-02-13 20:31:00', '2025-02-13 20:31:00'),
(10, 19, 'Global Food & Beverage (Pvt) Ltd', 'Finance Manager', '2018-03-01', '2020-12-31', '<p class=\"ql-align-justify\">I have handled the entire Finance, Administration, HR &amp; Payroll functions and IT section. Also directly reported to the Director Board and the Managing Director.</p><p><br></p>', '2025-02-13 20:31:00', '2025-02-13 20:31:00'),
(11, 19, 'Crown Royal Holdings (Pvt) Ltd', 'Group Accountnant', '2015-06-01', '2017-12-15', '<p class=\"ql-align-justify\">I worked as the Second oﬃcer (Accountant) of the Group Finance Department and directly reported to the Group Finance Controller, Group Director Finance and the Managing Director.</p><p><br></p>', '2025-02-13 20:31:00', '2025-02-13 20:31:00'),
(12, 19, 'PWC Sri Lanka', 'Trainee Accountant', '2012-03-01', '2015-03-30', '<p class=\"ql-align-justify\">·&nbsp;&nbsp;&nbsp;&nbsp;Performing statutory audits in accordance with Sri Lanka Auditing standards and International Auditing Standards</p><p class=\"ql-align-justify\">·&nbsp;&nbsp;&nbsp;&nbsp;Preparing the ﬁnancial statements in line with LKAS, SLFRSs and other regulations.</p><p class=\"ql-align-justify\">·&nbsp;&nbsp;&nbsp;&nbsp;Identifying internal control deﬁciencies of companies and developing recommendations to overcome them.</p><p class=\"ql-align-justify\">·&nbsp;&nbsp;&nbsp;Preparing the Internal Audit Reports in line with the clients’ requirement and International Internal Audit Practices.</p><p><br></p>', '2025-02-13 20:31:00', '2025-02-13 20:31:00'),
(13, 31, 'HSBC', 'Marketing Executive', '2025-02-04', '2025-02-28', '<ul><li>Complying with the code of sales ethics and professional conduct by:</li><li class=\"ql-indent-1\">Maintaining a professional and fair conduct in all dealings with customers at all times</li><li class=\"ql-indent-1\">Maintaining absolute confidentiality with regard to customer information</li></ul><p><br></p>', '2025-02-26 12:11:59', '2025-02-26 12:11:59'),
(14, 31, 'HSBC', 'Marketing Executive', '2025-02-06', '2025-02-28', '<ul><li>Complying with the code of sales ethics and professional conduct by:</li><li class=\"ql-indent-1\">Maintaining a professional and fair conduct in all dealings with customers at all times</li><li class=\"ql-indent-1\">Maintaining absolute confidentiality with regard to customer information</li></ul><p><br></p>', '2025-02-26 12:12:53', '2025-02-26 12:12:53'),
(15, 1, 'tasma1', 'data entry', '2025-03-19', '2025-03-22', '<p>gtghthg6uyjikik</p>', '2025-03-03 10:47:44', '2025-03-03 10:47:44'),
(16, 4, 'BEWG', 'Finance Controller - Oversees Sector', '2022-04-01', '2022-09-30', '<p><br></p>', '2025-03-07 21:49:43', '2025-03-07 21:49:43'),
(17, 4, 'Beijing Enterprises Water Group Limited', 'Finance Controller', '2022-04-01', '2022-09-30', '<p><br></p>', '2025-03-07 21:49:43', '2025-03-07 21:49:43'),
(18, 4, 'EL Holdings (Pvt) Ltd', 'Finance & Administration Manager', '2020-03-31', '2021-03-31', '<p><br></p>', '2025-03-07 21:49:43', '2025-03-07 21:49:43'),
(19, 4, 'Global Food & Beverage (Pvt) Ltd', 'Finance Manager', '2018-03-01', '2020-11-30', '<p><br></p>', '2025-03-07 21:49:43', '2025-03-07 21:49:43'),
(20, 4, 'Crown Royal Holdings (Pvt) Ltd', 'Group Accountnant', '2015-06-01', '2017-12-01', '<p><br></p>', '2025-03-07 21:49:43', '2025-03-07 21:49:43'),
(21, 4, 'PWC Sri Lanka', 'Trainee Accountant', '2013-01-01', '2015-03-31', '<p><br></p>', '2025-03-07 21:49:43', '2025-03-07 21:49:43'),
(22, 4, 'Ideal Motors', 'Accountant', '2017-10-01', '2018-03-01', '<p><br></p>', '2025-03-07 21:54:12', '2025-03-07 21:54:12'),
(23, 4, 'KPMG Maldives', 'Trainee Accountant', '2010-08-01', '2012-11-30', '<p><br></p>', '2025-03-07 21:54:13', '2025-03-07 21:54:13'),
(24, 39, 'Priyadarshani Contractors', 'Quantity Surveyor', '2020-02-10', '2023-11-10', '<ul><li>Prepare the Bill of Quantities</li><li>Prepared the Interim Payment Applications and Final Bills</li><li>Measured the Join Measurements &amp; Prepared the Sub Contractors Bills</li><li>Joined the Pre-Bid Meeting and prepared the Tender documents</li><li>Used AutoCAD and Revit for material order</li><li>Draw the detail Drawings</li></ul>', '2025-03-10 15:03:19', '2025-03-10 15:03:19'),
(25, 39, 'Gaia Greenenergy Holdings', 'Draughtsman', '2024-03-18', '2025-03-25', '<p>Draw the solar projects</p>', '2025-03-10 15:05:24', '2025-03-10 15:05:24'),
(26, 53, 'Tropic frozen, Noratel International', 'Production supervisor', '2025-02-05', '2025-03-25', '<p><br></p>', '2025-03-25 11:24:45', '2025-03-25 11:24:45'),
(27, 1, 'Company2', 'Software Engineer', '2024-12-10', '2025-03-25', '<p>Software Engineer in web base application solution</p>', '2025-03-25 19:39:56', '2025-03-25 19:39:56'),
(28, 43, 'eSupport Technologies', 'Information Technology company', '2025-03-01', '2025-06-08', '<p>Trainee software engineer</p>', '2025-03-26 10:09:22', '2025-03-26 10:09:22'),
(29, 43, 'Testing', 'Information Technology company', '2025-03-30', '2025-10-11', '<p>sgfghsghjs bdjhdjhkd gjdhjkd hdkjdkdjknd dbjd khb,djhd </p>', '2025-03-26 10:12:45', '2025-03-26 10:12:45'),
(30, 78, 'ShweMinThMee Hotel', 'Supervisor', '2022-11-30', '2024-10-30', '<p>Maintenance&amp;Operation </p><p>Building service and Electrical installations &amp;Maintenance</p>', '2025-04-29 21:37:56', '2025-04-29 21:37:56'),
(31, 91, 'Successfully Completed Six Months In Plant Training Programme At CiC Seed Farm, Pelwehera, Dambulla:', 'Training', '2024-09-02', '2025-02-28', '<ul><li>Vegetable research and Development</li><li>CIC quality banana production</li><li>Rice research and development</li><li>Seed Paddy production and Processing</li><li>Plants Nursery Vegetable Seed Processing</li><li>Soil, Plant and Water Analytical laboratory</li><li>Seed Testing Laboratory</li><li>High Land Project (Mango,papaya,coconut,pineapple)</li><li>ales Center</li></ul>', '2025-05-06 16:59:00', '2025-05-06 16:59:00'),
(33, 96, 'Colombo Commercial Fertilizer Ltd', 'Management Assistant', '2005-01-01', '2024-06-30', '<p>Management assistant as Finance department </p>', '2025-05-07 23:28:55', '2025-05-07 23:28:55'),
(34, 107, 'CMEV', 'Quality Assurance Engineer', '2024-08-15', '2025-03-25', '<p><br></p><p>In my role as Quality Assurance Program-me Associate Tabulation Officer at the Centre of Monitoring Election Violence (CMEV), I gained hands-on experience with data analysis and learned the importance of accuracy and meeting tight deadlines—skills that are key for a QA role.</p><p><br></p>', '2025-05-15 11:06:24', '2025-05-15 11:06:24'),
(35, 113, 'D samson industries plc', 'assistant engineering', '2024-05-01', '2025-05-17', '<p>working with research and development section and going through the new design and marketing strategies.3d printing experience. experience corrective and predictive maintainance . work with using reliability engineering consept and set up sustainability at work station.</p>', '2025-05-17 14:06:05', '2025-05-17 14:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `salary_range` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `employer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `closing_date` date NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Stores the payment method: online, contact_contributor',
  `rejection_reason` varchar(255) DEFAULT NULL,
  `job_id` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `view_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(47, 'jhgj', 'kkjk', 16, 108, 'vbnb', 14, 15000.00, 'job_images/TJO2IjiOpclEYVhcz81fTw3sbnJU3EWc26rq43mE.png', 'nbvnvbn', 9, 1, 1, '2025-02-20', '2025-02-06 07:26:55', NULL, 'approved', 'contact_contributor', NULL, 'J27845', 1, '2025-02-04 22:40:09', '2025-05-17 16:47:46', 7, 148),
(48, 'QA Engineer', 'Qa Qualification', 1, 77, 'Gampha', 1, 250000.00, NULL, 'Testing', 2, 1, 1, '2025-02-15', '2025-02-06 07:29:32', NULL, 'approved', 'contact_contributor', NULL, 'J80278', 1, '2025-02-06 12:28:13', '2025-05-18 01:34:07', 7, 149),
(49, 'Software Enginner', 'Software development', 1, 77, 'London', 4, 400000.00, NULL, 'SE Development', 1, 1, 1, '2025-02-28', '2025-02-06 07:29:41', NULL, 'approved', 'contact_contributor', NULL, 'J96876', 1, '2025-02-06 12:29:19', '2025-05-17 15:56:50', 7, 157),
(50, 'Electricians', 'We are Hiring', 5, 91, 'Colombo', 1, 65000.00, 'job_images/ytJbjieTFS3L8bvBklbuONHdvyYCVYcwb9JsJIUc.jpg', '1 year experience', 8, 1, NULL, '2025-02-10', '2025-02-06 15:12:25', NULL, 'approved', 'contact_contributor', NULL, 'J71506', 1, '2025-02-06 20:09:53', '2025-05-19 14:08:48', 7, 150),
(51, 'Front Office Manager', 'FYI', 13, 99, 'Pasikuda', 1, 150000.00, 'job_images/A2kI3B5JgZd4pcO5KXJCsMEYIsT56r4SznGoOfL3.jpg', '3 years', 8, 1, NULL, '2025-02-15', '2025-02-06 15:12:34', NULL, 'approved', 'contact_contributor', NULL, 'J24936', 1, '2025-02-06 20:11:35', '2025-05-17 21:15:11', 7, 170),
(52, 'Data Entry Operator', 'aadfs', 5, 88, 'Kandy', 1, 75000.00, 'job_images/9EJ7YsYMN2McG6aSxnz6PeKJ8pzffM2pVdCm7nd0.jpg', 'sqwadS', 3, 1, 1, '2025-02-10', '2025-02-06 15:18:07', NULL, 'approved', 'contact_contributor', NULL, 'J16229', 1, '2025-02-06 20:15:31', '2025-05-16 16:15:28', 7, 127),
(53, 'Front Office Manager', 'No Description', 13, 99, 'Dubai', 5, NULL, 'job_images/NrThXbrEothWrL66lExcozfnoccFHDwr6qUOAC5A.jpg', NULL, 8, 1, NULL, '2025-02-17', '2025-02-10 15:18:55', NULL, 'approved', 'contact_contributor', NULL, 'J47419', 1, '2025-02-10 20:12:01', '2025-05-18 04:30:17', 7, 143),
(54, 'Accounts Executive', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/Dm2BHPcGjt4HDuw6oVOOQZLclJSF5TKDCfOJV2BX.jpg', NULL, 8, 1, NULL, '2025-02-20', '2025-02-10 15:19:12', NULL, 'approved', 'contact_contributor', NULL, 'J67881', 1, '2025-02-10 20:13:47', '2025-05-19 13:48:58', 7, 150),
(55, 'Manager - Factory Operation', 'No Description', 36, 167, 'Male', 11, NULL, 'job_images/DsTDuUBCYUVmwoL5KQm2xcfQoLIA3MYx1tKYuIbY.jpg', NULL, 8, 1, NULL, '2025-02-25', '2025-02-10 15:19:23', NULL, 'approved', 'contact_contributor', NULL, 'J66776', 1, '2025-02-10 20:17:41', '2025-05-18 10:27:25', 8, 128),
(60, 'Executive - Gold Loans', 'No Description', 23, 132, 'Dambulla', 1, NULL, 'job_images/zNMrTlW6NviGeLqW8Iyp1LY6YY62xi9fkfTWihKq.jpg', NULL, 3, 1, 1, '2025-02-22', '2025-02-10 15:36:43', NULL, 'approved', 'contact_contributor', NULL, 'J21494', 1, '2025-02-10 20:36:31', '2025-05-19 01:32:41', 7, 136),
(61, 'abc', 'ghhhhh', 1, 77, 'colombo', 1, 9000.00, NULL, 'abcd', 2, 1, 1, '2025-02-10', '2025-02-10 16:21:30', NULL, 'approved', 'contact_contributor', NULL, 'J83782', 1, '2025-02-10 21:03:33', '2025-05-20 09:42:24', 7, 91),
(62, 'Testing 1', 'chghjghjg', 1, 77, 'Gampha', 1, 75000.00, NULL, 'fxdfvcvhnbj', 1, 1, 1, '2025-02-28', '2025-02-10 16:21:41', NULL, 'approved', 'contact_contributor', NULL, 'J95176', 1, '2025-02-10 21:03:36', '2025-05-17 09:56:00', 7, 146),
(63, 'Finance Manager', 'We are on the lookout for a Finance Manager for our well reputed Apparel client company located in Central Province.\r\nSector: Apparel', 44, 193, 'Biyagama', 1, NULL, NULL, 'Candidate should posses\r\n* Experience: Minimum 3 years in the Similar capacity\r\n* Product range - Lingeries, Bra, brief, sports and Swim wear.\r\n* ⁠knowledge in Lean and IE will be an added advantage\r\n* ⁠Computer Literacy and Fluent in English\r\n\r\nTo apply, kindly submit your resume to 360degrees.talentsearch@gmail.com For further inquiries, contact us at +94742302122', 8, 1, NULL, '2025-02-25', '2025-02-10 16:31:20', NULL, 'approved', 'contact_contributor', NULL, 'J96577', 1, '2025-02-10 21:30:43', '2025-05-19 12:34:14', 8, 148),
(67, 'Office Assistant, Receptionist', 'No Description', 5, 89, 'UAE', 5, NULL, 'job_images/fTiGyQ35LJdi0AtBNcSgRk8Q83YoQiWtWgFp3uak.jpg', NULL, 3, 1, 1, '2025-03-11', '2025-02-11 00:23:38', NULL, 'approved', 'contact_contributor', NULL, 'J84341', 1, '2025-02-11 05:23:28', '2025-05-20 03:20:46', 8, 143),
(69, 'FACTORY MANAGER', 'We are on the lookout for a Factory Manager for our well reputed client company\r\n\r\nSector: FMCG\r\nLocation : Monaragala', 31, 153, 'Monaragala', 1, NULL, NULL, 'Candidate should posses\r\n•Bachelor\'s degree in.    Engineering, Food Science, or \r\na related field (preferred). \r\n•Masters Degree in Supply Chain, Logistics & Operations \r\nadded advantage\r\n•Proven experience in Food & \r\nBeverage manufacturing; prior \r\nexposure to the dairy sector is \r\nhighly desirable.\r\n•Strong leadership, communication and problem-\r\nsolving skills.\r\n•Ability to work under pressure and meet production deadlines.\r\n\r\nWhat\'s on Offer \r\n* Competitive salary \r\n • Company vehicle with fuel and driver.\r\n • Fully furnished accommodation for the employee and their family.\r\n\r\nTo apply, kindly submit your resume to 360degrees.talentsearch@gmail.com \r\nFor further inquiries, contact us at +94742302122', 3, 1, 1, '2025-03-15', '2025-02-11 14:28:12', NULL, 'approved', 'contact_contributor', NULL, 'J70281', 1, '2025-02-11 19:28:01', '2025-05-18 06:20:26', 8, 141),
(70, 'MANAGER INDUSTRIAL ENGINEERING', 'We are on the lookout for a Associate Manager – Industrial Engineering for our well reputed Apparel client company.\r\n* Sector: Apparel\r\n* Location -Katunayake', 44, 189, 'Katunayake', 1, NULL, NULL, 'Candidate should posses\r\n•Bachelor\'s Degree in Industrial Engineering or a related field.\r\n•Minimum 5+ years of experience in industrial engineering, preferably in a manufacturing environment.\r\n•Strong knowledge of lean manufacturing, process optimization, and automation.\r\n•Proficiency in data analysis and production planning tools.\r\n•Excellent leadership, communication, and problem-solving skills.\r\n\r\n To apply,kindly submit your resume to 360degrees.talentsearch@gmail.com For further inquiries, contact us at +94742302122', 2, 1, 1, '2025-03-15', '2025-02-11 14:31:22', NULL, 'approved', 'contact_contributor', NULL, 'J32566', 1, '2025-02-11 19:31:04', '2025-05-20 08:18:29', 8, 141),
(71, 'DGM - MANUFACTURING', 'We are on the lookout for a Deputy General Manager Manufacturing for our well reputed client.\r\nSector - Apparel', 44, 193, 'Kurunegala', 1, NULL, NULL, 'Candidate should posses\r\n•Bachelor’s degree in Engineering, Business Management, or a related field. A Master’s degree is preferred.\r\n•Minimum of 5 years of experience in a senior manufacturing role within the apparel industry.\r\n•Proven track record of successfully managing large-scale manufacturing operations.\r\n•Strong knowledge of production management, quality control, and supply chain processes.\r\n•Excellent leadership, communication, and problem-solving skills.\r\n•Ability to work under pressure and meet tight deadlines.\r\n\r\nTo apply, kindly submit your resume to 360degrees.talentsearch@gmail.com For further inquiries, contact us at +94742302122', 4, 1, 1, '2025-03-15', '2025-02-11 14:34:59', NULL, 'approved', 'contact_contributor', NULL, 'J77042', 1, '2025-02-11 19:34:49', '2025-05-17 21:35:10', 8, 125),
(73, 'Testing 1', 'dfref', 15, 105, 'London', 4, 300000.00, 'job_images/Mqkm2udl2EQcZ9cq6cZ3IhWM836EFlAu9qUrAiBg.jpg', 'rftgythy', 1, 1, 1, '2025-02-27', '2025-02-12 05:48:34', NULL, 'approved', 'contact_contributor', NULL, 'J69346', 1, '2025-02-11 21:33:58', '2025-05-17 20:32:38', 7, 117),
(76, 'hello world', 'hello', 14, 103, 'colombo', 9, 56000.00, 'job_images/DQGn80rRjjziPXzQWLRpZAFBSPXJM0Adq82SRo0W.png', 'none', 11, 1, 1, '2025-02-18', NULL, '2025-02-17 11:54:55', 'reject', 'contact_contributor', 'Not matching', 'J13969', 1, '2025-02-17 16:50:11', '2025-02-18 00:11:34', 7, 1),
(82, 'Testing 101', 'rtteytoiop', 1, 77, 'Gampha', 1, 55667.00, NULL, 'hngnmjgmjh', 2, 1, 1, '2025-02-28', NULL, '2025-02-24 16:48:25', 'reject', 'contact_contributor', 'No ad', 'J74474', 1, '2025-02-17 21:35:15', '2025-02-25 00:21:43', 7, 1),
(86, 'Admin Executive', 'No Description', 8, 74, 'Rajagiriya', 1, NULL, 'job_images/18XwBzPrEVg3lrvKSb3j2ui0PnDG1ly4gGKJ0PUf.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 16:52:06', NULL, 'approved', 'contact_contributor', NULL, 'J24471', 1, '2025-02-24 21:51:54', '2025-05-20 10:04:37', 8, 120),
(87, 'IT Officer', 'No Description', 1, 79, 'Bangalore & Mumbai', 3, NULL, 'job_images/0xl5A0HecNuBpmnMWX95cGFIuPPqGb6Pe6lVGo4J.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 16:55:57', NULL, 'approved', 'contact_contributor', NULL, 'J10665', 1, '2025-02-24 21:55:42', '2025-05-18 05:18:11', 8, 137),
(90, 'Business Development Executive', 'No Description', 21, 123, 'Colombo', 1, NULL, 'job_images/nISpJYapckXMbgpdRgXLfbWsMBZOXJTT66QyjRoU.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 17:05:45', NULL, 'approved', 'contact_contributor', NULL, 'J38328', 1, '2025-02-24 22:03:17', '2025-05-19 21:45:45', 8, 108),
(91, 'Travel Executives', 'No Description', 13, 100, 'Colombo', 1, NULL, 'job_images/TQPykgAZNW9muMrk09m7dF0CPjhPCkNRUMAMa04K.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 17:05:36', NULL, 'approved', 'contact_contributor', NULL, 'J33808', 1, '2025-02-24 22:05:24', '2025-05-19 13:14:57', 8, 100),
(94, 'Branch Manager', 'No Description', 23, 132, 'Anuradapura', 1, NULL, 'job_images/x8FqcQlgOlHICn6JBXGerSJG8Sy9sW052sbTqaTu.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 17:15:09', NULL, 'approved', 'contact_contributor', NULL, 'J39740', 1, '2025-02-24 22:14:58', '2025-05-18 05:18:24', 8, 111),
(95, 'Unit Manager - Pawning', 'No Description', 23, 132, 'Colombo', 1, NULL, 'job_images/4mmLW2heiVz7emg5ZFcFVIIxzfo22fxonuW5Kg04.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 17:17:05', NULL, 'approved', 'contact_contributor', NULL, 'J85159', 1, '2025-02-24 22:16:56', '2025-05-18 05:18:26', 8, 116),
(96, 'Client Ambassador', 'No Description', 23, 132, 'Colombo', 1, NULL, 'job_images/nvYuruMMoxUln3dQcKP1rStZejco7XUJZASGscOB.jpg', NULL, 3, 1, 1, '2025-03-24', '2025-02-24 17:20:28', NULL, 'approved', 'contact_contributor', NULL, 'J53433', 1, '2025-02-24 22:20:18', '2025-05-18 05:18:28', 8, 107),
(100, 'Management Trainee', 'No Description', 21, 122, 'Boralesgamuwa', 1, NULL, 'job_images/z9BhQ5UeddBRsUR6PhYJzTryWmmTp5POichYBAJf.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 15:52:32', NULL, 'approved', 'contact_contributor', NULL, 'J23403', 1, '2025-02-26 20:48:09', '2025-05-19 20:35:53', 8, 115),
(101, 'Coordinating officer', 'No Description', 5, 88, 'Dehiwala', 1, NULL, 'job_images/DmnRqVnb6ulqvbktUYnezDgnih1XYLByaTU7gyz0.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 15:52:43', NULL, 'approved', 'contact_contributor', NULL, 'J61023', 1, '2025-02-26 20:52:11', '2025-05-20 03:21:47', 8, 138),
(102, 'Business Development Executive', 'No Description', 21, 123, 'Colombo', 1, NULL, 'job_images/Thwl6cg1IUMlt73rdNWgvmjknP3QlW3nwEgAH8GY.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 16:04:51', NULL, 'approved', 'contact_contributor', NULL, 'J12195', 1, '2025-02-26 20:58:03', '2025-05-20 10:47:48', 8, 109),
(108, 'Receptionist', 'No Description', 46, 196, 'Mount Lavinia', 1, NULL, 'job_images/PRRdTmCK8OC9xAokCosbaeCw8lJaADmQGEIfcdI1.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 16:22:53', NULL, 'approved', 'contact_contributor', NULL, 'J46571', 1, '2025-02-26 21:22:18', '2025-05-19 21:11:39', 8, 105),
(109, 'Executive Admin & General Affair', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/aMslvhae8QdXyFigETl13VRAOunYpRBBqcxrFgV6.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 16:25:54', NULL, 'approved', 'contact_contributor', NULL, 'J99953', 1, '2025-02-26 21:25:29', '2025-05-20 03:39:16', 8, 110),
(114, 'Senior Quality Assurance Executive', 'No Description', 36, 167, 'Colombo', 1, NULL, 'job_images/aoKzr6YddM1SoFXRJdagPKNYpPEKGa0FXSOaB2rO.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 16:51:31', NULL, 'approved', 'contact_contributor', NULL, 'J45062', 1, '2025-02-26 21:50:57', '2025-05-20 08:32:27', 8, 110),
(116, 'Front Office Executive', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/ursrvVeJtYMppPhSuDffeU7OqvwiubZhkcXvDBkD.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-28 07:18:12', NULL, 'approved', 'contact_contributor', NULL, 'J10260', 1, '2025-02-26 21:56:46', '2025-05-20 11:45:17', 8, 152),
(117, 'Operation Manager', 'No Description', 46, 196, 'Colombo', 1, NULL, 'job_images/zul7Y9XV0d4UBb6BODkHSvwuI7gGr3zOefBgBp9O.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 16:59:39', NULL, 'approved', 'contact_contributor', NULL, 'J35050', 1, '2025-02-26 21:59:00', '2025-05-19 21:24:40', 8, 112),
(119, 'HR Assistant', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/SlYjstVkeKDsEYElWdqVw7oFbiI8J9Iyxthgs619.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 17:05:58', NULL, 'approved', 'contact_contributor', NULL, 'J60229', 1, '2025-02-26 22:05:24', '2025-05-19 21:47:34', 8, 137),
(122, 'Interior Design', 'No Description', 48, 201, 'Colombo', 1, NULL, 'job_images/spTIEFlQwsCJAUcdJ960X90DdNYxy2V410VUqE1n.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 17:17:57', NULL, 'approved', 'contact_contributor', NULL, 'J11764', 1, '2025-02-26 22:17:20', '2025-05-19 22:09:04', 8, 109),
(125, 'Manager & Ass. Manager', 'No Description', 5, 88, 'Colombo', 1, NULL, 'job_images/B7RvEGoW1dplZcsj4G0EWARkxyek9TcZNu7DdmiC.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-26 17:27:20', NULL, 'approved', 'contact_contributor', NULL, 'J24167', 1, '2025-02-26 22:26:30', '2025-05-19 22:21:44', 8, 118),
(131, 'Executive HR & Admin', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/y1RISCydHfWxYEYqouw84CaIfZbbBvG4pu52BSF2.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 16:36:44', NULL, 'approved', 'contact_contributor', NULL, 'J69810', 1, '2025-02-27 21:31:16', '2025-05-19 03:58:43', 8, 112),
(135, 'Interns - Administration', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/dYGcFCIXf9eWjzAg89MVmySNx1SWqsAosjnQFuq5.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 16:43:10', NULL, 'approved', 'contact_contributor', NULL, 'J12644', 1, '2025-02-27 21:39:14', '2025-05-19 08:04:15', 8, 102),
(138, 'Computer Technician', 'No Description', 1, 77, 'Kadawatha', 1, NULL, 'job_images/PXtXRo7WbrTMY7hswZtd4TTLUYugmUlra7PVso5U.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:05:39', NULL, 'approved', 'contact_contributor', NULL, 'J34521', 1, '2025-02-27 21:46:02', '2025-05-19 08:27:10', 8, 111),
(139, 'Industrial Automation Engineering', 'No Description', 1, 79, 'Himbutana', 1, NULL, 'job_images/eDBSdq7QqoZK9rUkx6ocHmjYX2izQBoEf0defcr0.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:05:28', NULL, 'approved', 'contact_contributor', NULL, 'J13210', 1, '2025-02-27 21:47:39', '2025-05-18 05:17:59', 8, 113),
(142, 'Call Operators', 'No Description', 5, 90, 'Thalawathugoda', 1, NULL, 'job_images/OW53bokBg3BhN0vvMH5JizjOB97gXwX09kzHhNZJ.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:06:13', NULL, 'approved', 'contact_contributor', NULL, 'J74844', 1, '2025-02-27 21:55:38', '2025-05-18 05:18:03', 8, 108),
(143, 'Aluminium Fabricators', 'No Description', 48, 201, 'Thalawathugoda', 1, NULL, 'job_images/nCrSOmlMcngAFm3f9Hoi0uLB8emzswIcPjteCDbo.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:06:39', NULL, 'approved', 'contact_contributor', NULL, 'J92677', 1, '2025-02-27 22:03:28', '2025-05-18 23:15:12', 8, 110),
(145, 'Kitchen Helper', 'No Description', 13, 99, 'Rathmalana', 1, NULL, 'job_images/sDDslePBHtG572sVtZDbCiGj0dUER6TDay2VZYZu.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:12:07', NULL, 'approved', 'contact_contributor', NULL, 'J52332', 1, '2025-02-27 22:08:53', '2025-05-18 04:31:51', 8, 102),
(146, 'Office Assistants', 'No Description', 46, 195, 'Thalawathugoda', 1, NULL, 'job_images/iqfuKZyHUPrzn2PQSD5h4k6hyI7fQuSvKKVZCH18.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:11:58', NULL, 'approved', 'contact_contributor', NULL, 'J17065', 1, '2025-02-27 22:10:35', '2025-05-18 04:48:01', 8, 109),
(147, 'Web Developers', 'No Description', 1, 78, 'Colombo', 1, NULL, 'job_images/1RsCnHVJgb0rRslMpmg08m9a7RLISJKSgum5nkpo.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:12:17', NULL, 'approved', 'contact_contributor', NULL, 'J56543', 1, '2025-02-27 22:11:47', '2025-05-19 04:34:55', 8, 111),
(149, 'Elevator technician', 'No Description', 49, 217, 'Colombo', 1, NULL, 'job_images/4ZzgErO2wK8Mb8EeJUGWkfPgL20FrDCRSpfaa707.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:23:02', NULL, 'approved', 'contact_contributor', NULL, 'J49459', 1, '2025-02-27 22:22:53', '2025-05-20 09:17:46', 8, 94),
(152, 'Receptionist', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/qUrbMl6kOBjcKf1TiCukydOZ0pqygQSRCgT4hNEO.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-02-27 17:36:25', NULL, 'approved', 'contact_contributor', NULL, 'J85353', 1, '2025-02-27 22:32:16', '2025-05-18 03:27:57', 8, 108),
(158, 'Receptionist', 'No Description', 13, 99, 'Wadduwa', 1, NULL, 'job_images/CYGlGDC8BBrKowZydMJsXmYKTdSFgaOwEZtuRqft.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-02-28 15:49:41', NULL, 'approved', 'contact_contributor', NULL, 'J12943', 1, '2025-02-28 20:48:29', '2025-05-19 10:01:34', 8, 91),
(161, 'Help Desk Executive', 'No Description', 5, 89, 'Nawala', 1, NULL, 'job_images/Da9Fvh5GNl52RWgbVD2NVTYdffgfWfNeOnAKeWGO.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-02-28 15:57:27', NULL, 'approved', 'contact_contributor', NULL, 'J38084', 1, '2025-02-28 20:55:14', '2025-05-18 08:22:51', 8, 103),
(162, 'HR Executive', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/aRzoD94NHhFhT9iK0bMD3OAzgvaGBZ4ofv82UK3E.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-02-28 15:57:35', NULL, 'approved', 'contact_contributor', NULL, 'J55583', 1, '2025-02-28 20:56:23', '2025-05-18 08:30:24', 8, 110),
(168, 'Customer Relationship Officer', 'No Description', 5, 90, 'Colombo', 1, NULL, 'job_images/2u61pw40FCQCqoItUUFSRY1YS8xWbmA7BX3QWyi2.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-02-28 16:41:59', NULL, 'approved', 'contact_contributor', NULL, 'J66116', 1, '2025-02-28 21:37:42', '2025-05-20 08:46:22', 8, 95),
(169, 'Pasty / Bakery Commi', 'No Description', 31, 151, 'Ella, Welipanna', 1, NULL, 'job_images/8y7a0RstmOfG8dpYl74cpes7THASDtXUKJ1W5G9x.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-02-28 16:42:19', NULL, 'approved', 'contact_contributor', NULL, 'J88785', 1, '2025-02-28 21:39:39', '2025-05-18 08:33:34', 8, 102),
(172, 'Senior Executive /Junior Executive', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/fvKGacbi1IkpuGz8fWxH4HNbNpLWJNPRKwTjXssl.jpg', NULL, 27, 1, NULL, '2025-03-22', '2025-03-01 15:16:42', NULL, 'approved', 'contact_contributor', NULL, 'J27004', 1, '2025-03-01 20:14:55', '2025-05-19 02:56:47', 8, 99),
(184, 'Inbound Tour Executive', 'No Description', 13, 100, 'Colombo', 1, NULL, 'job_images/5g2Sv52AFYzGOGo49qjgxRqZrZUCHXFu3cMVkxAR.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-01 15:42:23', NULL, 'approved', 'contact_contributor', NULL, 'J64551', 1, '2025-03-01 20:40:54', '2025-05-18 09:12:41', 8, 105),
(189, 'Store Keeper/Assistance', 'No Description', 3, 233, 'Nawala', 1, NULL, 'job_images/Wy97t0B5bVIkKRPjmS2tEgBeyevPye5gmeMydJWs.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-01 16:23:25', NULL, 'approved', 'contact_contributor', NULL, 'J67093', 1, '2025-03-01 21:21:45', '2025-05-19 14:03:14', 8, 106),
(190, 'Accounts Assistant', 'No Description', 3, 229, 'Seeduwa', 1, NULL, 'job_images/lC3uUvRS2OHS3HfUDdXd5rDh7TSxiBDUQdB4olwg.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:23:33', NULL, 'approved', 'contact_contributor', NULL, 'J18137', 1, '2025-03-01 21:23:12', '2025-05-19 18:04:18', 8, 114),
(191, 'Senior Finance Associates', 'No Description', 3, 229, 'Pannipitiya', 1, NULL, 'job_images/HKBv8egcEKJcXQmB7zoER3ZdJBHzlDoTU35kApAt.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:29:02', NULL, 'approved', 'contact_contributor', NULL, 'J64100', 1, '2025-03-01 21:24:50', '2025-05-18 10:00:52', 8, 99),
(192, 'Digital Marketing', 'No Description', 4, 234, 'Colombo', 1, NULL, 'job_images/SDswPuY7KrEAgD9RBDDPs0FF90V4SDavv2zvPnvm.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-01 16:32:08', NULL, 'approved', 'contact_contributor', NULL, 'J74084', 1, '2025-03-01 21:26:43', '2025-05-17 22:16:59', 8, 112),
(193, 'Accounting Interns', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/vh5Gte260XCXQNVr3BrS9jbIHhTf8sRZugFxIIul.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:32:18', NULL, 'approved', 'contact_contributor', NULL, 'J20462', 1, '2025-03-01 21:27:59', '2025-05-19 22:40:32', 8, 98),
(194, 'Audit Internship', 'No Description', 3, 230, 'Colombo', 1, NULL, 'job_images/0yvuSkwrwmKC6Vx0dBbUrk0MpvpbzHIi4IQJhJRd.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:32:26', NULL, 'approved', 'contact_contributor', NULL, 'J93299', 1, '2025-03-01 21:28:49', '2025-05-19 08:02:49', 8, 115),
(195, 'Accounts Executive', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/EBghosyFe9PoPa3SlabPCf69ZBZlwLixltHQ2GsK.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-01 16:36:28', NULL, 'approved', 'contact_contributor', NULL, 'J66010', 1, '2025-03-01 21:33:46', '2025-05-18 11:07:47', 8, 111),
(196, 'Accounts Assistant', 'No Description', 3, 229, 'Wellampitiya', 1, NULL, 'job_images/flDqaUaGFZh1VfoQdT1DQo4LwUXEuONUrWROEtID.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:36:35', NULL, 'approved', 'contact_contributor', NULL, 'J87252', 1, '2025-03-01 21:34:36', '2025-05-19 19:06:45', 8, 104),
(197, 'Accounts Executive', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/pghYlz2Nb1bwBpUG4AmpePaRBlNgp5nOa6P4mgUn.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 16:36:43', NULL, 'approved', 'contact_contributor', NULL, 'J67333', 1, '2025-03-01 21:35:27', '2025-05-19 20:16:38', 8, 87),
(198, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/S9q04MZsRUCnBtzFfY51twwZIEiuxpwMpUt07osB.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:36:52', NULL, 'approved', 'contact_contributor', NULL, 'J55142', 1, '2025-03-01 21:36:12', '2025-05-18 11:58:13', 8, 106),
(199, 'Finance Executives', 'No Description', 3, 229, 'Rajagiriya', 1, NULL, 'job_images/tevBOLKW7oJiky6kM5sDO9Pmwbze1TqRLQSm12yq.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:38:52', NULL, 'approved', 'contact_contributor', NULL, 'J82985', 1, '2025-03-01 21:37:56', '2025-05-19 21:39:24', 8, 120),
(200, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/Nbre0Qw3FClght5yI566tvBJwWdgKwJZCcDGyd17.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:39:00', NULL, 'approved', 'contact_contributor', NULL, 'J19944', 1, '2025-03-01 21:38:44', '2025-05-19 21:51:14', 8, 83),
(201, 'Teacher -Fashion Design', 'No Description', 6, 242, 'Kandy', 1, NULL, 'job_images/2gaqXrjhZWJOj2QU2zBQBnFW2zOqYqlgYTNZf0ON.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:45:25', NULL, 'approved', 'contact_contributor', NULL, 'J28709', 1, '2025-03-01 21:41:16', '2025-05-18 13:36:16', 8, 107),
(202, 'Account Clerks', 'No Description', 3, 229, 'Kadawatha, Kiribathgoda', 1, NULL, 'job_images/zGSjCJnbIORZBDKDF0CUpMtISejV7DchLjcbZ20V.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-01 16:45:42', NULL, 'approved', 'contact_contributor', NULL, 'J23374', 1, '2025-03-01 21:42:25', '2025-05-19 18:16:50', 8, 106),
(203, 'Accounts Executive', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/63x9EGcafGi436GUIZalxrFyUHEYRwXRx7TyrE0j.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 16:45:34', NULL, 'approved', 'contact_contributor', NULL, 'J29252', 1, '2025-03-01 21:43:13', '2025-05-18 14:45:54', 8, 98),
(204, 'Teacher Maths/Computers', 'No Description', 6, 242, 'Dehiwala', 1, NULL, 'job_images/oMSN0FlaEG9PNGNOPQAyRJG2hycjQzK2DhQRLDAb.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-01 16:45:50', NULL, 'approved', 'contact_contributor', NULL, 'J36423', 1, '2025-03-01 21:44:11', '2025-05-18 22:20:14', 8, 101),
(205, 'Accounting Specialist', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/iPVFBQH2X6vFKvFFwF6YB1kw8FBpIU9sup86ktm9.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:46:00', NULL, 'approved', 'contact_contributor', NULL, 'J77782', 1, '2025-03-01 21:45:17', '2025-05-19 05:40:03', 8, 94),
(206, 'Sales Executive', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/9LPnUYMFiElnP5FXPHr4hI3n5f4zZ7zrnbG24kIN.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:52:39', NULL, 'approved', 'contact_contributor', NULL, 'J26223', 1, '2025-03-01 21:47:48', '2025-05-19 06:20:20', 8, 103),
(207, 'Kitchen Helper', 'No Description', 13, 99, 'Saudi Arabia', 63, NULL, 'job_images/45M46yZX3egZEbRUT5sRxYIjR1DkE74sTBcH0nKU.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 16:52:49', NULL, 'approved', 'contact_contributor', NULL, 'J60348', 1, '2025-03-01 21:52:29', '2025-05-18 15:09:02', 8, 106),
(208, 'Assistant Server Commis II', 'No Description', 13, 99, 'KSA', 63, NULL, 'job_images/sMeQ2HpQe6ecVIUkg03S7TlDfc7OFh5hKclowLk3.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-01 16:57:49', NULL, 'approved', 'contact_contributor', NULL, 'J98468', 1, '2025-03-01 21:55:14', '2025-05-18 15:26:24', 8, 94),
(209, 'House Keeping', 'No Description', 13, 99, 'Saudi Arabia', 63, NULL, 'job_images/7OxGsQvLe1IXx4xKDWRtowOrLqMnznMJhAdaRtxV.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 16:58:07', NULL, 'approved', 'contact_contributor', NULL, 'J40079', 1, '2025-03-01 21:56:17', '2025-05-19 21:25:01', 8, 108),
(210, 'Guest Relation Officer', 'No Description', 13, 101, 'Galle, Colombo', 1, NULL, 'job_images/onsi9gOtZlWZNNVBhjGlvuxgkqlIGc6Rc4PvTEXE.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-01 16:57:58', NULL, 'approved', 'contact_contributor', NULL, 'J31650', 1, '2025-03-01 21:57:40', '2025-05-18 18:10:36', 8, 103),
(211, 'Marketing Officer', 'No Description', 4, 237, 'Kurunegala', 1, NULL, 'job_images/bgMrQLyCzMwe5M4DsKXfdXlFsy94uzWqSvySlMpM.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 17:01:38', NULL, 'approved', 'contact_contributor', NULL, 'J46966', 1, '2025-03-01 21:59:15', '2025-05-19 05:51:36', 8, 115),
(212, 'Store Manager', 'No Description', 3, 233, 'Negombo', 1, NULL, 'job_images/fCtZUd3TC9kSEBoDIsoMFuJOBZDIUjeJTV9zKwLT.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 17:01:45', NULL, 'approved', 'contact_contributor', NULL, 'J80379', 1, '2025-03-01 22:00:31', '2025-05-19 06:29:50', 8, 102),
(213, 'Admin Officer', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/NjDRC96DctnAtrrPD2SOpgdKF1OkPkgQ5xfyJh2a.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 17:01:53', NULL, 'approved', 'contact_contributor', NULL, 'J69468', 1, '2025-03-01 22:01:29', '2025-05-20 09:33:58', 8, 100),
(214, 'CIVIL ENGINEER', 'No Description', 2, 224, 'Colombo', 1, NULL, 'job_images/79yfeMn1gPLE5Un9cqB1EpKZUXDWETkAw38nHkf1.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-01 17:05:08', NULL, 'approved', 'contact_contributor', NULL, 'J30256', 1, '2025-03-01 22:04:00', '2025-05-18 13:12:51', 8, 110),
(215, 'Marketing Officer', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/U5FD0Y9tGYFhg24Vq5AalhawgWVa0vVC8rp5hHAR.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 17:05:21', NULL, 'approved', 'contact_contributor', NULL, 'J36893', 1, '2025-03-01 22:05:04', '2025-05-17 21:18:42', 8, 112),
(216, 'Bookkeeping', 'No Description', 6, 242, 'Colombo', 1, NULL, 'job_images/Dg3J1EU2JwRYnTHU5i5towJqZ3V2JIDYAPm1DZGP.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 17:10:05', NULL, 'approved', 'contact_contributor', NULL, 'J15548', 1, '2025-03-01 22:06:46', '2025-05-19 07:24:38', 8, 119),
(217, 'Computer Technician', 'No Description', 2, 227, 'Kadawatha', 1, NULL, 'job_images/PuvyDXZzB8HjRB9yA9i0m9eNR04XOWSJGfSujcZd.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-01 17:10:16', NULL, 'approved', 'contact_contributor', NULL, 'J16072', 1, '2025-03-01 22:08:47', '2025-05-19 16:52:31', 8, 100),
(218, 'Production Supervisor and', 'No Description', 44, 189, 'Katubedda', 1, NULL, 'job_images/Wth1eOO51V4gRA6YsBHZmIQmf2oAvrqgrS6EYiE0.jpg', NULL, 27, 1, NULL, '2025-04-01', '2025-03-01 17:10:45', NULL, 'approved', 'contact_contributor', NULL, 'J62380', 1, '2025-03-01 22:09:58', '2025-05-19 14:10:17', 8, 97),
(219, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/mwacNoEUyWdqpEhSv64XEKuGse31D579UuBEKzfR.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 17:13:53', NULL, 'approved', 'contact_contributor', NULL, 'J16762', 1, '2025-03-01 22:12:02', '2025-05-19 06:47:07', 8, 96),
(220, 'Digital Marketing', 'No Description', 4, 234, 'Colombo', 1, NULL, 'job_images/61Af5auzKkBU4ufsO9mDvY0RyfY2KOQHSdmSQfBj.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 17:14:05', NULL, 'approved', 'contact_contributor', NULL, 'J78201', 1, '2025-03-01 22:13:34', '2025-05-18 22:41:29', 8, 103),
(221, 'Sales Executive', 'No Description', 4, 235, 'Malabe', 1, NULL, 'job_images/xV0PDyzmJGees3qEagcoXKqZ4TQ75OggfLeBE7m5.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-01 17:20:50', NULL, 'approved', 'contact_contributor', NULL, 'J85003', 1, '2025-03-01 22:15:14', '2025-05-19 07:14:29', 8, 100),
(222, 'Auto Electrician/Mechanic', 'No Description', 49, 217, 'Colombo', 1, NULL, 'job_images/qWZ2tgbELjDMLRzbsZfFqvhiSkZWskvlV5PYVb6E.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-01 17:20:59', NULL, 'approved', 'contact_contributor', NULL, 'J95392', 1, '2025-03-01 22:16:52', '2025-05-20 10:00:29', 8, 113),
(223, 'Floor & Store Executives', 'No Description', 22, 127, 'Dodangoda', 1, NULL, 'job_images/CbZiE8nd05VDWhh5hG5tGHKTdTLgA84DoJPLVUtc.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-01 17:21:06', NULL, 'approved', 'contact_contributor', NULL, 'J33824', 1, '2025-03-01 22:19:47', '2025-05-16 22:46:41', 8, 99),
(224, 'Accounts Executive', 'No Description', 3, 229, 'Kiribathgoda', 1, NULL, 'job_images/3uDPGa2I4mzf6rx88GcAm6aVxKrfDDrAojqK6ZSL.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-01 17:24:05', NULL, 'approved', 'contact_contributor', NULL, 'J74770', 1, '2025-03-01 22:22:27', '2025-05-19 00:19:48', 8, 113),
(226, 'Accounts Executive', 'EPSILONE', 3, 229, 'Kiribathgoda', 1, NULL, 'job_images/A7bdjfvhhsAJ6G4jZRrcua7IhFMyvZVSblfkcBSA.jpg', NULL, 27, 1, NULL, '2025-03-25', '2025-03-02 15:32:25', NULL, 'approved', 'contact_contributor', NULL, 'J23316', 1, '2025-03-02 20:28:20', '2025-05-19 16:51:09', 8, 103),
(227, 'Painters/Motor Mechanic', 'Australian Opportunities', 49, 217, 'Australia', 19, NULL, 'job_images/izJfOpNl0VfrrhlHss65jUU4Ub6eMgSRXW4kZflT.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 15:32:37', NULL, 'approved', 'contact_contributor', NULL, 'J57162', 1, '2025-03-02 20:30:12', '2025-05-19 11:13:23', 8, 103),
(228, 'Auto Electrician/ Mechanic', 'Qatar Jobs', 49, 217, 'Qatar', 17, NULL, 'job_images/l40lS13a2dd6Lg6aCZ6lJvdqnmniy5RdTA8n9aO1.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 15:33:07', NULL, 'approved', 'contact_contributor', NULL, 'J27915', 1, '2025-03-02 20:32:11', '2025-05-19 00:41:41', 8, 99),
(229, 'Welders / Steel Fabricators', 'Dubai Jobs', 49, 217, 'Dubai', 6, NULL, 'job_images/m02oAjU1r5PppLiBNXWnDmPSZ08olfhzJmySDzwn.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 15:57:47', NULL, 'approved', 'contact_contributor', NULL, 'J36297', 1, '2025-03-02 20:55:56', '2025-05-19 03:10:33', 8, 102),
(230, 'House Keeper & Cleaner', 'No Description', 13, 99, 'Libya', 64, NULL, 'job_images/BApgVPvy9JelcrNX1PHV3SpylWCseHjgpuKucBpC.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 15:57:55', NULL, 'approved', 'contact_contributor', NULL, 'J53783', 1, '2025-03-02 20:57:30', '2025-05-19 11:42:03', 8, 104),
(231, 'Chef', 'Dubai VIP House', 13, 99, 'Dubai', 6, NULL, 'job_images/Fju6Ljlx3i6M55akU6BeA3HkXjM9BvQDVEUfIQ8H.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 16:05:21', NULL, 'approved', 'contact_contributor', NULL, 'J17674', 1, '2025-03-02 20:59:34', '2025-05-19 01:10:34', 8, 114),
(232, 'Branch Manager/ Sales Managers & Executives', 'Insurance/Finance', 4, 235, 'Open', 1, NULL, 'job_images/lGv1b9j7j01jZcdikWOkU36SolOyYh5h1porDHPh.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 16:05:35', NULL, 'approved', 'contact_contributor', NULL, 'J95822', 1, '2025-03-02 21:01:33', '2025-05-20 10:46:25', 8, 93),
(233, 'Factory Supervisors', '2 years Experience', 36, 168, 'Makola', 1, NULL, 'job_images/euXFyE2J7JPJVQuJgDJyiQKuazVxKb0VPpxiZnho.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:05:42', NULL, 'approved', 'contact_contributor', NULL, 'J87700', 1, '2025-03-02 21:02:59', '2025-05-19 01:57:24', 8, 105),
(234, 'Shift Supervisor', 'Vacancy in KSA', 31, 151, 'KSA', 6, NULL, 'job_images/Rm2FiKg0VEKBMGsjUWege5ECyUKAkPUn1atAu6vm.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:05:50', NULL, 'approved', 'contact_contributor', NULL, 'J20142', 1, '2025-03-02 21:05:14', '2025-05-19 02:07:40', 8, 91),
(235, 'Manager - Credit', 'Seylan Bank', 23, 132, 'Colombo', 1, NULL, 'job_images/0cWf3NflQSI1N2LAc6X4oXr89vMRrRCtMHyExXuo.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:09:43', NULL, 'approved', 'contact_contributor', NULL, 'J59902', 1, '2025-03-02 21:09:05', '2025-05-19 02:28:43', 8, 92),
(236, 'Accountant', 'SLT Mobitel', 3, 229, 'Colombo', 1, NULL, 'job_images/lp18WKPU9yIIHtLCFJJYZz8wBUIXXzNuBg2d7IPE.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:14:07', NULL, 'approved', 'contact_contributor', NULL, 'J10338', 1, '2025-03-02 21:11:24', '2025-05-19 02:37:00', 8, 109),
(237, 'Document Processing Technician', 'No Description', 46, 195, 'Arangala', 1, NULL, 'job_images/TpCq4zao0XqE49MNxCKJSW2YPubugupfTErtKkSU.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:14:15', NULL, 'approved', 'contact_contributor', NULL, 'J38182', 1, '2025-03-02 21:13:56', '2025-05-19 10:22:07', 8, 102),
(238, 'Bookkeeping', 'No Description', 3, 229, 'Sta Rosa, Laguna', 1, NULL, 'job_images/1XUyIGvNnx1vw1giTGLD8ktPJ8WJ8kGpOJBsEr0a.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:17:16', NULL, 'approved', 'contact_contributor', NULL, 'J69520', 1, '2025-03-02 21:16:01', '2025-05-19 02:56:14', 8, 91),
(239, 'Electrician & Labour', 'No Description', 49, 217, 'Jaffna', 1, NULL, 'job_images/XFflMhC5N8Klp0L0JMcgp69W3e2aFV1Zy67PhFsU.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:17:24', NULL, 'approved', 'contact_contributor', NULL, 'J60068', 1, '2025-03-02 21:17:01', '2025-05-19 03:08:20', 8, 96),
(240, 'Admin Officer', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/c3KsC1KD5GSOGLMe7YnvQAY37eZE3lmgERsRspaC.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 16:24:13', NULL, 'approved', 'contact_contributor', NULL, 'J41484', 1, '2025-03-02 21:18:35', '2025-05-19 03:24:13', 8, 106),
(241, 'Machine Operators/ Mechanical Technician', 'Saudi Arabia Jobs', 49, 217, 'Saudi Arabia', 63, NULL, 'job_images/vtSTC6ov8MV3Ha5UhF1TA9hvDrNUUdqMG4qYQHOR.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:24:21', NULL, 'approved', 'contact_contributor', NULL, 'J86438', 1, '2025-03-02 21:20:00', '2025-05-19 17:15:58', 8, 100),
(242, 'MEP Engineers', 'Mechanical, Electrical & Plumbing', 2, 224, 'Nugegoda', 1, NULL, 'job_images/aGhAw75QCdyL1tDZyVkpxg1vkPe3TzSBdxkM1n1v.jpg', NULL, 27, 1, NULL, '2025-04-03', '2025-03-02 16:24:28', NULL, 'approved', 'contact_contributor', NULL, 'J94252', 1, '2025-03-02 21:22:14', '2025-05-19 03:38:45', 8, 96),
(244, 'Branch Manager & Sales Executives', 'Three Maali Jewellers', 29, 259, 'Nittambuwa', 1, NULL, 'job_images/vlkwt0QtUdd150PHcGCIn2zUUd6u6lSRp9DRvyIe.jpg', NULL, 27, 1, NULL, '2025-04-04', '2025-03-02 16:33:03', NULL, 'approved', 'contact_contributor', NULL, 'J16020', 1, '2025-03-02 21:30:46', '2025-05-18 16:53:52', 8, 105),
(245, 'Comi 1,2,3', 'Bood & Beverages', 13, 99, 'Hikkaduwa', 1, NULL, 'job_images/97BxgiptuuEbUejIDpj8LlyFWO4YKihVEtrjap7p.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-02 16:33:10', NULL, 'approved', 'contact_contributor', NULL, 'J91142', 1, '2025-03-02 21:32:53', '2025-05-19 20:15:16', 8, 91),
(246, 'Ayurweda Doctor', 'Ceylon Ayurweda', 7, 245, 'Colombo', 1, NULL, 'job_images/kllLjjLQQeXmHwnCbP3CZeQmX2Q2CjocJb90HsUF.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-02 16:42:03', NULL, 'approved', 'contact_contributor', NULL, 'J12997', 1, '2025-03-02 21:37:01', '2025-05-20 09:36:46', 8, 93),
(247, 'Customer Service Assistant', 'No Description', 4, 235, 'Port Louis', 2, NULL, 'job_images/PXZ51LOe648kd6lX4fxJFECOw4os1vusNxF6x00M.jpg', NULL, 27, 1, NULL, '2025-04-04', '2025-03-02 16:42:10', NULL, 'approved', 'contact_contributor', NULL, 'J48378', 1, '2025-03-02 21:39:34', '2025-05-19 10:45:15', 8, 104),
(248, 'Office Assistants', 'Global Alliance', 46, 195, 'Rathmalana', 1, NULL, 'job_images/khvfHkHUsHWm5s896U6QHMBmRxkc9dC3IMnOweto.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-02 16:47:47', NULL, 'approved', 'contact_contributor', NULL, 'J17983', 1, '2025-03-02 21:44:08', '2025-05-19 04:02:59', 8, 102),
(249, 'Call Center Executive', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/D33Wu6pkGUkIxc36JuqsCn218i0De50wKhaLEmgx.jpg', NULL, 27, 1, NULL, '2025-04-04', '2025-03-02 16:47:55', NULL, 'approved', 'contact_contributor', NULL, 'J72216', 1, '2025-03-02 21:45:49', '2025-05-19 04:08:07', 8, 100),
(250, 'Assistant Manager & Senior Executive', 'Merchant Credit & Investments', 43, 216, 'Island wide', 1, NULL, 'job_images/9ijtIJ5EgdnWbEQDmhK5iVNE7mDUSDZrkfyEXZj7.jpg', NULL, 27, 1, NULL, '2025-04-04', '2025-03-02 16:48:03', NULL, 'approved', 'contact_contributor', NULL, 'J57115', 1, '2025-03-02 21:47:39', '2025-05-19 04:13:39', 8, 100),
(251, 'Software engineer', 'fbfkgkfglfklb', 1, 77, 'gampha', 1, 250000.00, NULL, 'sfrsgtdjk dfyj', 1, 1, NULL, '2025-03-30', NULL, '2025-03-03 18:12:13', 'reject', 'contact_contributor', 'No ads', 'J82357', 1, '2025-03-03 16:19:42', '2025-03-10 06:56:44', 7, 1),
(252, 'Call Center Agent', 'Galle Road, Colombo', 46, 196, 'Colombo', 1, NULL, 'job_images/ZAnItQHrse5v63VtpCjEZNVtNKbY9lRqqVdOrXZ4.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-03 18:11:14', NULL, 'approved', 'contact_contributor', NULL, 'J76915', 1, '2025-03-03 23:01:25', '2025-05-19 05:49:02', 8, 104),
(253, 'Customer Support Executive', 'No Description', 46, 195, 'Nugegoda', 1, NULL, 'job_images/6AtMJ2ZPBtf9xEC0sPATgICmSreCEqeEL8dMT8ED.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-03 18:11:24', NULL, 'approved', 'contact_contributor', NULL, 'J51210', 1, '2025-03-03 23:02:36', '2025-05-19 10:22:20', 8, 89),
(254, 'Sales Executive', 'Goldmine Properties (Pvt) Ltd', 12, 98, 'Homagama,Panadura', 1, NULL, 'job_images/5lSs5y0RzpvYnvvQjaEScyLXTGZMtSfHKzYbn5ca.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-03 18:11:36', NULL, 'approved', 'contact_contributor', NULL, 'J32056', 1, '2025-03-03 23:05:36', '2025-05-19 11:23:14', 8, 97),
(255, 'Restaurant Manager', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/W0bSac2ZO1Dbl1hYlWgGXGqMNSsCBdDRFsJ6c6uC.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-03 18:11:46', NULL, 'approved', 'contact_contributor', NULL, 'J77768', 1, '2025-03-03 23:07:52', '2025-05-19 19:30:05', 8, 98),
(256, 'Social Media Managers', 'No Description', 4, 236, 'Colombo', 1, NULL, 'job_images/qJMryIo92LW7iCnrbH5LmLSsDLhnTJCwlcbM117v.jpg', NULL, 27, 1, NULL, '2025-04-02', '2025-03-03 18:12:23', NULL, 'approved', 'contact_contributor', NULL, 'J39644', 1, '2025-03-03 23:09:09', '2025-05-20 08:06:06', 8, 103),
(257, 'CIVIL ENGINEER', 'No Description', 2, 224, 'Welisara', 1, NULL, 'job_images/KWf9YytR6g4PHRPmXSQzjZkuTOvSjeM6hlFL3exY.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-03 18:12:49', NULL, 'approved', 'contact_contributor', NULL, 'J78315', 1, '2025-03-03 23:10:24', '2025-05-18 15:12:32', 8, 108),
(258, 'Solar Technicians', 'Senuk Engineering', 28, 140, 'Colombo', 1, NULL, 'job_images/t4JV9dboXWpZQvuBKLKr01onYxS2zUyJXo8WQ4BH.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-03 18:17:49', NULL, 'approved', 'contact_contributor', NULL, 'J82698', 1, '2025-03-03 23:16:07', '2025-05-19 08:01:25', 8, 96),
(259, 'House Keeper', 'Asian Grand Hotel', 13, 99, 'Negombo', 1, NULL, 'job_images/n9IpkRTUwdhPZqY987BUEq3w5VcuCL4UwyCwDsXs.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-03 18:17:57', NULL, 'approved', 'contact_contributor', NULL, 'J15414', 1, '2025-03-03 23:17:28', '2025-05-19 09:52:38', 8, 88),
(260, 'Senior QY/MEP Engineers', 'No Description', 12, 96, 'Rajagiriya', 1, NULL, 'job_images/6j3kQ0df7IKyGNN5OJXtj3TwfO8CmMiOAqYkjHfR.jpg', NULL, 28, 1, 1, '2025-04-03', '2025-03-04 16:07:26', NULL, 'approved', 'contact_contributor', NULL, 'J59762', 1, '2025-03-04 21:01:38', '2025-05-20 09:00:13', 8, 96),
(261, 'Head Teacher/Class Teachers', 'Kidsdom PreSchool', 6, 242, 'Colombo', 1, NULL, 'job_images/dGIcxe0J8IuCeopw7BzSJdpcQbiM0Qv0ylQF1mQK.jpg', NULL, 27, 1, 1, '2025-04-04', '2025-03-04 16:07:17', NULL, 'approved', 'contact_contributor', NULL, 'J48317', 1, '2025-03-04 21:04:03', '2025-05-17 22:43:44', 8, 88),
(262, 'Nurses', 'Siva HomeCare and Medicals', 7, 247, 'Colombo', 1, NULL, 'job_images/PV3o2By6D4HZPeILYZGidbROn7mswyw1crqiHGrs.jpg', NULL, 27, 1, 1, '2025-04-04', '2025-03-04 16:07:34', NULL, 'approved', 'contact_contributor', NULL, 'J39381', 1, '2025-03-04 21:05:35', '2025-05-18 11:13:52', 8, 100),
(263, 'Showroom Sales & Marketing Executives', 'Utech Zone', 4, 235, 'Kiribathgoda', 1, NULL, 'job_images/n6NhQkANakpUIb7elUmtHEJ1quDlG66jfhMruiBL.jpg', NULL, 27, 1, 1, '2025-04-04', '2025-03-04 16:07:43', NULL, 'approved', 'contact_contributor', NULL, 'J87391', 1, '2025-03-04 21:07:04', '2025-05-18 07:17:16', 8, 102),
(264, 'Hot Kitchen Comm I/II', 'Midland Group', 13, 99, 'Polonnaruwa', 1, NULL, 'job_images/5FXSXXfCPGkx3R8RxCvehADKZGXswP9K0qYG66v1.jpg', NULL, 27, 1, 1, '2025-04-04', '2025-03-04 16:09:58', NULL, 'approved', 'contact_contributor', NULL, 'J73911', 1, '2025-03-04 21:09:46', '2025-05-19 01:47:27', 8, 85),
(265, 'Sales Executive', 'Sanara Holdings', 4, 235, 'Malabe', 1, NULL, 'job_images/fOEvcULjGpvJ1LWbLA5wdVILvI6qPlo4jhp4M16E.jpg', NULL, 27, 1, 1, '2025-04-04', '2025-03-04 16:12:02', NULL, 'approved', 'contact_contributor', NULL, 'J10236', 1, '2025-03-04 21:11:46', '2025-05-19 19:05:26', 8, 85),
(266, 'Sales Interns', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/hvXN0QUoOOLU0tU8EJn2ICFbOUo5yoeV3SVvW2Ap.jpg', NULL, 27, 1, 1, '2025-04-04', '2025-03-04 16:14:17', NULL, 'approved', 'contact_contributor', NULL, 'J30419', 1, '2025-03-04 21:14:04', '2025-05-20 09:50:42', 8, 95),
(267, 'Mobile Phone Technician', 'RNG - RT Holdings', 49, 218, 'Pilimathalawa', 1, NULL, 'job_images/hRIIcWMK163JJTpcxGZSLJiBvAZPRycoivUcLHqp.jpg', NULL, 27, 1, 1, '2025-04-05', '2025-03-04 16:16:17', NULL, 'approved', 'contact_contributor', NULL, 'J38501', 1, '2025-03-04 21:16:03', '2025-05-19 11:10:01', 8, 116),
(268, 'Customer Relation Executive/ Office Assistant', 'SLEGA College', 6, 244, 'Kadawatha', 1, NULL, 'job_images/38cd8RHBX03vsKjexQk9r0NxO0z1GcACWO0zvL7j.jpg', NULL, 27, 1, 1, '2025-04-05', '2025-03-04 16:20:35', NULL, 'approved', 'contact_contributor', NULL, 'J57010', 1, '2025-03-04 21:18:45', '2025-05-19 09:13:37', 8, 102),
(269, 'Client Ambassador - Tamil Speaking', 'Commercial Credit', 43, 214, 'Kiribathgoda', 1, NULL, 'job_images/leTYCmMpBnAXg4CXYe9vhag3XUzKYmS40m2dMXrG.jpg', NULL, 27, 1, 1, '2025-04-05', '2025-03-04 16:20:48', NULL, 'approved', 'contact_contributor', NULL, 'J67013', 1, '2025-03-04 21:20:21', '2025-05-18 07:53:59', 8, 89),
(270, 'Cosmetologist/ Nurses', 'AgeLess Doctor', 7, 247, 'Colombo', 1, NULL, 'job_images/W9IGvkckzeuXW8xY6RjLVvDZXqTZNMyi1XENJyov.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:05:39', NULL, 'approved', 'contact_contributor', NULL, 'J59089', 1, '2025-03-05 14:46:18', '2025-05-18 23:54:56', 8, 91),
(271, 'Accounting Associates', 'Cauayan Island Resort', 13, 99, 'Southern', 1, NULL, 'job_images/oSq7Qi2rS8qb8p1hVbD4pHdgdfd7IeF0lO0UahDC.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-05 10:05:59', NULL, 'approved', 'contact_contributor', NULL, 'J77184', 1, '2025-03-05 14:48:14', '2025-05-18 16:57:59', 8, 91),
(272, 'Account Executive', 'ICBM', 3, 229, 'Colombo', 1, NULL, 'job_images/GkJXMDAAglBlhaYSDmPP9UBdArPSPpiXCxjUs4oO.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:06:12', NULL, 'approved', 'contact_contributor', NULL, 'J83974', 1, '2025-03-05 14:49:32', '2025-05-18 08:46:15', 8, 88),
(273, 'Technician', 'Technician/ Drivers', 49, 217, 'Romania/ Europe', 52, NULL, 'job_images/B7e6mpCJ0wUNTdDu2WgHnPbCbj0dSCqzRm2SFDjH.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:06:25', NULL, 'approved', 'contact_contributor', NULL, 'J64829', 1, '2025-03-05 14:52:13', '2025-05-19 16:18:22', 8, 105),
(274, 'Secretary / Coordinators', 'Asian Lanka', 46, 195, 'Maharagama', 1, NULL, 'job_images/lVRyqTGS6TmamePA0LT4R8zV9mwIg7rj1lmm4PPm.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:06:36', NULL, 'approved', 'contact_contributor', NULL, 'J35454', 1, '2025-03-05 14:53:58', '2025-05-19 12:31:26', 8, 104),
(275, 'Junior Accountant', 'CMS - Alabang, Muntinlupa City', 3, 229, 'Alabang, Muntinlupa City', 1, NULL, 'job_images/6aVP8GuNnslGbhVhXUI7hJaDYTWUv5tLELSryAW4.jpg', NULL, 27, 1, NULL, '2025-04-04', '2025-03-05 10:06:51', NULL, 'approved', 'contact_contributor', NULL, 'J12742', 1, '2025-03-05 14:56:33', '2025-05-18 20:23:00', 8, 101),
(276, 'Accountant', 'DEMPSEY', 3, 229, 'Colombo', 1, NULL, 'job_images/b7dqwIEyocasAP9mQvZpOWTQnxwAY10Pv9fyD18q.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:07:07', NULL, 'approved', 'contact_contributor', NULL, 'J68835', 1, '2025-03-05 14:57:54', '2025-05-18 11:32:48', 8, 95),
(277, 'Administration Manager (Female)', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/0IcTm8y6d9qBXCjvA7S18tBQ7ckDaeM7A9GlTRmd.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:07:24', NULL, 'approved', 'contact_contributor', NULL, 'J45743', 1, '2025-03-05 14:59:17', '2025-05-19 00:21:53', 8, 91),
(278, 'Customer Service Representative', 'No Description', 5, 88, 'Colombo', 1, NULL, 'job_images/gVrLNLfQ3KWum3vjph1wP1UgSrYsW6onhQRfDA8I.jpg', NULL, 27, 1, NULL, '2025-03-29', '2025-03-05 10:07:40', NULL, 'approved', 'contact_contributor', NULL, 'J59651', 1, '2025-03-05 15:00:29', '2025-05-19 21:22:14', 8, 110),
(279, 'Inventory & Pricing Analysis', 'No Description', 3, 229, 'Colombo', 1, NULL, NULL, NULL, 27, 1, NULL, '2025-03-31', NULL, '2025-03-05 10:08:11', 'reject', 'contact_contributor', 'No ads', 'J64455', 1, '2025-03-05 15:01:40', '2025-03-12 22:22:50', 8, 1),
(280, 'Dumriya Niyamaka', 'Government Services', 24, 129, 'Colombo', 1, NULL, 'job_images/yuWeTfuanyMD2MeuVgVfPhUgC478M0LT44pRUojt.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:08:21', NULL, 'approved', 'contact_contributor', NULL, 'J33224', 1, '2025-03-05 15:03:11', '2025-05-20 08:32:59', 8, 238),
(281, 'Tele Sales Executive', 'No Description', 4, 234, 'Colombo', 1, NULL, 'job_images/16ODKOzHcf0RVJjH9IR7e6FmAHv2S5N1cypNQvLe.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:08:32', NULL, 'approved', 'contact_contributor', NULL, 'J95142', 1, '2025-03-05 15:04:09', '2025-05-18 16:37:59', 8, 99),
(282, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/o7AgX8t6N4jfZQ2ewbLHzxaNJlRBEsRvSIPtyFsO.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-05 10:08:50', NULL, 'approved', 'contact_contributor', NULL, 'J48761', 1, '2025-03-05 15:05:02', '2025-05-18 14:30:48', 8, 95),
(283, 'Accountant (Female)', 'Southern CoolTech', 3, 229, 'Southern', 1, NULL, 'job_images/WhqWq1vdOyHewTCK3PGppymBGd7k8HyBh9Vlmme2.jpg', NULL, 27, 1, 1, '2025-04-05', '2025-03-05 10:16:59', NULL, 'approved', 'contact_contributor', NULL, 'J95259', 1, '2025-03-05 15:12:21', '2025-05-18 17:35:46', 8, 96),
(285, 'Social Media Executive', 'Wijaya News Papers', 10, 251, 'Colombo', 1, NULL, 'job_images/Z0oWK7tCz2DzWn4QKTkKDojfJpJXaBVbWc9oVzkM.jpg', NULL, 27, 1, NULL, '2025-03-31', '2025-03-06 16:49:49', NULL, 'approved', 'contact_contributor', NULL, 'J49435', 1, '2025-03-06 21:39:01', '2025-05-18 17:49:43', 8, 98),
(286, 'Senior Social Media Executive', 'Wijaya News Paper', 10, 251, 'Colombo', 1, NULL, 'job_images/DiPkXYcnrfbP6iahjClVVAaVEudz1H1GU199EFUk.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-06 16:49:57', NULL, 'approved', 'contact_contributor', NULL, 'J21039', 1, '2025-03-06 21:40:17', '2025-05-19 08:11:39', 8, 90),
(287, 'Senior Associates', 'Sison Corillo Parone', 3, 229, 'Columbia', 50, NULL, NULL, NULL, 27, 1, NULL, '2025-04-05', '2025-03-06 16:50:06', NULL, 'approved', 'contact_contributor', NULL, 'J39607', 1, '2025-03-06 21:42:28', '2025-05-19 01:33:07', 8, 92),
(288, 'Senior Executive - Credit', 'Lakderana Investments', 43, 214, 'Rajagiriya', 1, NULL, 'job_images/8uvBNd7LdPykhT9yfd3MAALbiZNU5qK9CfdXrmwq.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-06 16:50:18', NULL, 'approved', 'contact_contributor', NULL, 'J79770', 1, '2025-03-06 21:44:46', '2025-05-19 00:16:15', 8, 99),
(289, 'Front Desk Officer (Female)', 'Sapn Engineering (Pvt) Ltd', 46, 195, 'Colombo', 1, NULL, 'job_images/1T9eoaNnvC70LbI78rtDQ7TjSB7ovRQp3Lcz4NhU.jpg', NULL, 27, 1, NULL, '2025-04-05', '2025-03-06 16:50:28', NULL, 'approved', 'contact_contributor', NULL, 'J10082', 1, '2025-03-06 21:46:15', '2025-05-19 09:11:06', 8, 98),
(290, 'Senior Banking Assistant - Digital Channels', 'Cargills Bank', 23, 132, 'Colombo', 1, NULL, 'job_images/2MGaReBWcjRF28LvRHUhQoDCi7AOcL6oo45xEBly.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 16:50:36', NULL, 'approved', 'contact_contributor', NULL, 'J73157', 1, '2025-03-06 21:48:03', '2025-05-19 09:16:13', 8, 107);
INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(291, 'Junior Executive/ Executive - Credit Control', 'LakaTalents', 5, 88, 'Colombo', 1, NULL, 'job_images/Hd7TuOtCgvcIHRdqgOQiiJ1kdjDGgEgRK2LKacNj.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 16:50:44', NULL, 'approved', 'contact_contributor', NULL, 'J50864', 1, '2025-03-06 21:49:34', '2025-05-19 00:13:19', 8, 94),
(292, 'Sales Manager/ Designer', 'Grand Flora', 4, 235, 'Colombo', 1, NULL, 'job_images/ZdHuEL4UAfOqa5H3KMsLHO5iacUkN3tg9DtOdW3x.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:00:13', NULL, 'approved', 'contact_contributor', NULL, 'J69444', 1, '2025-03-06 21:57:05', '2025-05-19 06:14:21', 8, 119),
(293, 'Marketing Executives', 'Asian Campus', 6, 240, 'Gampaha', 1, NULL, 'job_images/difnbyCShxx2ixhdPlXkZq6pt8P5sarbYPw2bX25.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:00:22', NULL, 'approved', 'contact_contributor', NULL, 'J97992', 1, '2025-03-06 21:58:07', '2025-05-19 00:35:27', 8, 96),
(294, 'FACTORY MANAGER/ Accountant', 'SHS International (Pvt) Ltd', 36, 167, 'Piliyandala', 1, NULL, 'job_images/y3VUDDyG82fQw13PTCSo70cT1dGHshBZELYBYOLw.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:00:31', NULL, 'approved', 'contact_contributor', NULL, 'J33530', 1, '2025-03-06 22:00:06', '2025-05-20 10:34:00', 8, 92),
(295, 'Accounts & Cash Management', 'Coco Beach Club - Negombo', 3, 229, 'Negombo', 1, NULL, 'job_images/k1LaeXqxY424MzvWCMYpDYuKmZeN8NTNXg2hbDfB.jpg', NULL, 27, 1, NULL, '2025-04-04', '2025-03-06 17:30:41', NULL, 'approved', 'contact_contributor', NULL, 'J27645', 1, '2025-03-06 22:18:31', '2025-05-19 19:27:16', 8, 92),
(296, 'Junior Supervisor', 'ST.Xavier Timber', 48, 201, 'Kochchikade', 1, NULL, 'job_images/pwl6fShH9zM0TDTXMKdbCXm45Z5EKKsNzjECLZDb.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:30:53', NULL, 'approved', 'contact_contributor', NULL, 'J93482', 1, '2025-03-06 22:22:17', '2025-05-19 06:24:00', 8, 105),
(297, 'Showroom Manager/ Dealer', 'Softlogic/ Bata', 4, 235, 'Colombo', 1, NULL, 'job_images/8bv2YjjguLtvFoOPb30EmjBxiApswF5DWPnDgozA.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:31:12', NULL, 'approved', 'contact_contributor', NULL, 'J28863', 1, '2025-03-06 22:26:16', '2025-05-19 03:49:46', 8, 108),
(298, 'Sales Officers', 'Island Wide', 4, 235, 'Island Wide', 1, NULL, 'job_images/zFKSqCG0ihpZEfEJIWmfqMf5g6nuqVXfxt1UJkod.jpg', NULL, 27, 1, NULL, '2025-04-09', '2025-03-06 17:31:22', NULL, 'approved', 'contact_contributor', NULL, 'J46404', 1, '2025-03-06 22:28:09', '2025-05-19 03:52:52', 8, 102),
(299, 'Floor Executive/ Store Executive', 'Sampath Super Trading', 46, 196, 'Dodangoda', 1, NULL, 'job_images/ejYIY9lczPIBc8HQK8SsLg1PGXDVAzHFxn8jBvAu.jpg', NULL, 27, 1, NULL, '2025-04-09', '2025-03-06 17:31:32', NULL, 'approved', 'contact_contributor', NULL, 'J91136', 1, '2025-03-06 22:30:29', '2025-05-19 03:59:28', 8, 98),
(300, 'Finance Manager', 'Pasadena, San Juan City', 3, 229, 'Hong Kong', 1, NULL, 'job_images/5CT2UpkIUSYZESYCaRmezLrDGFmNWwxzlpZBjD0h.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:39:27', NULL, 'approved', 'contact_contributor', NULL, 'J25055', 1, '2025-03-06 22:34:25', '2025-05-19 04:19:29', 8, 95),
(301, 'Area Sales Executive - Channels', 'Ceedecs Lanka Holdings (Pvt) Ltd', 4, 235, 'Kadawatha', 1, NULL, 'job_images/4OTGRtWLrUyoBbH3j9EFmBGxlhpI00KUXprAdwz8.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:39:37', NULL, 'approved', 'contact_contributor', NULL, 'J65206', 1, '2025-03-06 22:36:58', '2025-05-19 04:22:17', 8, 89),
(302, 'Front Office Executive', 'BodyDoc', 5, 89, 'Malabe', 1, NULL, 'job_images/u9zmW88pUrdIUezVIwyOryYtwBhmL4ZScTFKsII1.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:39:53', NULL, 'approved', 'contact_contributor', NULL, 'J20927', 1, '2025-03-06 22:39:02', '2025-05-19 04:24:43', 8, 112),
(303, 'Teachers', 'HDI College', 6, 240, 'Ja-Ela', 1, NULL, 'job_images/jUDsBeOQbLDVNuD0Q9WYYoWsHrN3pgde619rdhNb.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:47:11', NULL, 'approved', 'contact_contributor', NULL, 'J80573', 1, '2025-03-06 22:42:02', '2025-05-18 22:09:58', 8, 102),
(304, 'Senior Finance Role/ Quality Control Team Leader', 'Second Pay Financing  Inc', 3, 229, 'Ortigas Pasis City', 65, NULL, 'job_images/ZTTRSrGjwjd0CafeyLsEZqLhmqp9XL9rpPS7QpsS.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:47:22', NULL, 'approved', 'contact_contributor', NULL, 'J40033', 1, '2025-03-06 22:45:15', '2025-05-19 17:58:39', 8, 120),
(305, 'Audit Executive', 'Lake House', 3, 230, 'Colombo', 1, NULL, 'job_images/s6bJBU4B7nz7AayI803mCFmCWa8F3BZRtqV58M0v.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:47:38', NULL, 'approved', 'contact_contributor', NULL, 'J38848', 1, '2025-03-06 22:47:03', '2025-05-19 04:43:11', 8, 119),
(306, 'Accounting Staff', 'No Description', 3, 229, 'Ibaan, Batangas', 65, NULL, 'job_images/y2nOTD5HD4mVEXGrN1IvbdiMAc81WENSbx2AVVxH.jpg', NULL, 27, 1, NULL, '2025-04-10', '2025-03-06 17:50:43', NULL, 'approved', 'contact_contributor', NULL, 'J58992', 1, '2025-03-06 22:50:23', '2025-05-19 04:46:04', 8, 94),
(307, 'Machine Operators', 'Hiring for Lanka Tiles', 36, 168, 'Ranala', 1, NULL, 'job_images/SqaMsLOApe1Ttuy6RrEk5gz5G0wUczM0EHYjtsCv.jpg', NULL, 27, 1, 1, '2025-04-14', '2025-03-14 15:24:37', NULL, 'approved', 'contact_contributor', NULL, 'J43557', 1, '2025-03-14 19:22:15', '2025-05-19 01:00:55', 8, 81),
(308, 'Advertising Assistant', 'LGL Marketing Services (Pvt) Ltd', 35, 165, 'Rathmalana', 1, NULL, 'job_images/REBPYpMrcme6zAJgr0OSA5hSEzHTpZoLxwIP6h1h.jpg', NULL, 27, 1, 1, '2025-04-14', '2025-03-14 15:24:47', NULL, 'approved', 'contact_contributor', NULL, 'J87905', 1, '2025-03-14 19:24:26', '2025-05-19 21:20:48', 8, 93),
(309, 'Teachers - Dubai', 'Pathway Globale - for Dubai Vacancies', 6, 242, 'Dubai', 6, NULL, 'job_images/aihuv7ZPiLqjQXB0zffecxbTAgptqQSYbk2fSCiM.jpg', NULL, 27, 1, 1, '2025-04-14', '2025-03-14 16:04:25', NULL, 'approved', 'contact_contributor', NULL, 'J62212', 1, '2025-03-14 20:02:54', '2025-05-19 10:56:15', 8, 99),
(310, 'Senior Sales Executive', 'D.P.R Construction Pvt Ltd', 4, 235, 'Rajagiriya', 1, NULL, 'job_images/y7ffa9Jx7F2NF6we1TPAzS6C0VhZsNjpeTUg4Wpz.jpg', NULL, 27, 1, NULL, '2025-04-15', '2025-03-15 14:51:23', NULL, 'approved', 'contact_contributor', NULL, 'J97358', 1, '2025-03-15 18:50:45', '2025-05-17 15:44:58', 8, 90),
(311, 'Interior Sales Executive', 'Alpha Industries Pvt Ltd', 48, 201, 'Colombo', 1, NULL, 'job_images/8NgCpSwHeYLj3ExSxpkGRh9lFNXBFjiI41Prj1A0.jpg', NULL, 27, 1, NULL, '2025-04-15', '2025-03-15 14:55:10', NULL, 'approved', 'contact_contributor', NULL, 'J73060', 1, '2025-03-15 18:54:49', '2025-05-19 19:25:53', 8, 86),
(312, 'Sales Assistant', 'Thilakawardana Textiles', 32, 155, 'Kiribathgoda', 1, NULL, 'job_images/Gyuj0KmiMucJblyhLWCyrsCVADc7TF39DHh0rKAc.jpg', NULL, 27, 1, 1, '2025-04-15', '2025-03-15 15:03:58', NULL, 'approved', 'contact_contributor', NULL, 'J28683', 1, '2025-03-15 19:00:34', '2025-05-17 16:12:46', 8, 104),
(313, 'Drivers', 'Europe Job Vacancies', 11, 254, 'Europe', 65, NULL, 'job_images/DgpE5PtpgeGe70IB45wq8073IxjFfhth0eETrNSh.jpg', NULL, 27, 1, 1, '2025-04-15', '2025-03-15 15:04:08', NULL, 'approved', 'contact_contributor', NULL, 'J39426', 1, '2025-03-15 19:03:43', '2025-05-18 11:47:04', 8, 79),
(315, 'Customer Care Executive - Tamil', 'Ensured Quality Lanka Pvt Ltd', 4, 234, 'Bambalapitiya', 1, NULL, 'job_images/WTMDoOqyiKVz76GLAAYxEMV5dSKjt0GbsFRDy6QK.jpg', NULL, 27, 1, NULL, '2025-04-15', '2025-03-15 15:19:27', NULL, 'approved', 'contact_contributor', NULL, 'J17497', 1, '2025-03-15 19:11:46', '2025-05-20 08:56:52', 8, 90),
(316, 'Junior Credit Executive', 'Vortex Aventura', 4, 238, 'Rajagiriya', 1, NULL, 'job_images/hGgh6kNTyHFla9swqZ7nj8TNIzuyJJA1lc8nqSgt.jpg', NULL, 27, 1, 1, '2025-04-15', '2025-03-15 15:19:38', NULL, 'approved', 'contact_contributor', NULL, 'J22675', 1, '2025-03-15 19:19:06', '2025-05-19 07:57:20', 8, 89),
(317, 'Digital Journalists', 'Dailymirror, Lankadeepa', 10, 250, 'Colombo', 1, NULL, 'job_images/FEsrQI6yMJNBHBvb5TbG3i3wcIKdvWY0ZhBwBrY1.jpg', NULL, 27, 1, 1, '2025-04-15', '2025-03-15 15:33:25', NULL, 'approved', 'contact_contributor', NULL, 'J33070', 1, '2025-03-15 19:33:09', '2025-05-18 05:09:51', 8, 87),
(318, 'Audit Supervisor', 'Sison Corillo Parone & Co', 3, 230, 'Ortigas, Pasig City', 65, NULL, 'job_images/kR3mpmqom7yXldMJKdWXocyozjSQADNkhPISpoMc.jpg', NULL, 27, 1, 1, '2025-04-15', '2025-03-15 15:37:39', NULL, 'approved', 'contact_contributor', NULL, 'J54552', 1, '2025-03-15 19:36:34', '2025-05-18 16:36:40', 8, 94),
(319, 'chggvhjfsdh', 'fhjydgdfahj', 8, 74, 'Gampha', 1, 565767.00, NULL, 'fshnjgmkk,jkl,', 1, 1, NULL, '2025-03-29', NULL, '2025-03-18 08:49:03', 'reject', 'contact_contributor', 'No ad', 'J099954', 1, '2025-03-17 09:46:44', '2025-03-22 19:51:44', 7, 2),
(320, 'Testing 1', 'kjlkl;kl', 16, 108, 'Gampha', 1, 87698709.00, NULL, '.,ll,k\';,l\';l\';l;ujkguyvigtuitm,.jkggl/', 7, 1, 1, '2025-03-29', NULL, '2025-03-21 02:31:41', 'reject', 'contact_contributor', 'No ad', 'J099955', 1, '2025-03-17 09:48:42', '2025-03-21 06:31:41', 7, 0),
(321, 'Supervisor/cashier/sales assistant', 'No Description', 4, 235, 'Embilipitiya', 1, NULL, 'job_images/IbAyGRQLz09oBx4tTyYNequc8f6SovKPJuMIp6ry.jpg', NULL, 32, 1, NULL, '2025-04-08', '2025-03-18 08:56:20', NULL, 'approved', 'contact_contributor', NULL, 'J099956', 1, '2025-03-18 12:53:16', '2025-05-17 06:14:16', 8, 99),
(322, 'testing 4', 'testing', 1, 77, 'kotte', 1, NULL, 'job_images/jc0RqmeBvCdDMHozMxkHRoypAAWf8gjLjhY2IKvP.png', 'testing', 29, 1, NULL, '2025-03-29', '2025-03-19 05:51:23', '2025-03-19 05:52:49', 'reject', 'contact_contributor', 'testing', 'J099957', 1, '2025-03-19 09:45:58', '2025-03-19 09:52:49', 7, 1),
(323, 'testing', 'testing', 1, 79, 'kotte', 1, NULL, 'job_images/J8wOJkVCyBz6zjibQfArrLrhFRS4UC5cS0xQU9Qz.png', NULL, 29, 1, NULL, '2025-03-29', '2025-03-19 06:01:31', '2025-03-22 18:41:26', 'reject', 'contact_contributor', 'Not Suitable', 'J099958', 1, '2025-03-19 10:00:18', '2025-05-19 16:36:56', 7, 65),
(324, 'Testing 2', 'Testing 2', 1, 80, 'kotte', 1, NULL, 'job_images/d20AWK5peZQ3ynkAYGrsgLNUGCykLV9SSGrd36k3.png', NULL, 33, 1, NULL, '2025-04-05', '2025-03-20 09:42:45', '2025-03-22 18:41:54', 'reject', 'contact_contributor', 'Not', 'J099959', 1, '2025-03-20 13:41:04', '2025-05-16 17:25:24', 7, 45),
(325, 'Web Editor', 'Derana  Media', 10, 250, 'Colombo', 1, NULL, 'job_images/spTZqm4th1xkuLWYVbOn8UHMrmARuC58oBHDdBFQ.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:32:21', NULL, 'approved', 'contact_contributor', NULL, 'J099960', 1, '2025-03-21 06:30:14', '2025-05-20 04:05:42', 8, 81),
(326, 'Executive - Brand & Communication', 'Travelchamp', 13, 100, 'Colombo', 1, NULL, 'job_images/XjgRRMknS5XqDIeM7YgySs3Ii9U1KB5h6ux7DT7s.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:40:37', NULL, 'approved', 'contact_contributor', NULL, 'J099961', 1, '2025-03-21 06:35:11', '2025-05-20 06:17:16', 8, 85),
(327, 'Technician', 'Thaiwan - Greatek Electronic Inc', 49, 217, 'Taiwan', 22, NULL, NULL, NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:49:11', NULL, 'approved', 'contact_contributor', NULL, 'J099962', 1, '2025-03-21 06:37:41', '2025-05-20 06:34:52', 8, 82),
(328, 'Hotel Jobs for all Depts', 'Seethawaka Regency', 13, 99, 'Avissawella', 1, NULL, 'job_images/E9xK6cz3jSu0cNz7Eh8jMalONIv6K37MNrYRXhNc.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:41:07', NULL, 'approved', 'contact_contributor', NULL, 'J099963', 1, '2025-03-21 06:40:18', '2025-05-20 09:14:02', 8, 79),
(329, 'Web Application Developers', 'Foeign Job - Dhaka', 1, 78, 'Dhaka', 65, NULL, 'job_images/MgnWYBpo5lX29vKlGEH1UnNvJ15dzRw5XKNgY4hx.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:49:37', NULL, 'approved', 'contact_contributor', NULL, 'J099964', 1, '2025-03-21 06:44:30', '2025-05-20 09:23:35', 8, 88),
(330, 'Long Truck Drivers', 'Chennai - India', 11, 254, 'Chennai - India', 3, NULL, 'job_images/gHBiLMj0gey8QlT8N8zUOq4OUH73T0l9b6kBzi5X.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:49:47', NULL, 'approved', 'contact_contributor', NULL, 'J099965', 1, '2025-03-21 06:47:04', '2025-05-17 03:22:38', 8, 72),
(331, 'Ecommerce Sales Coordinators', 'Exatech', 4, 235, 'Island wide', 1, NULL, 'job_images/IJEuzqU2tSTXG2Xs5lzoSuyk2VYURK1Kmnf9Hv7v.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:49:55', NULL, 'approved', 'contact_contributor', NULL, 'J099966', 1, '2025-03-21 06:48:56', '2025-05-20 10:02:45', 8, 81),
(332, 'HR Interns', 'Talent Xjobs', 8, 74, 'Colombo', 1, NULL, 'job_images/IgpM9N6zqCKzu5XBks59AG0fdPCJGf62A5cSYRLt.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 02:51:54', NULL, 'approved', 'contact_contributor', NULL, 'J099967', 1, '2025-03-21 06:51:32', '2025-05-20 10:51:51', 8, 85),
(333, 'Sales Associates', 'HS Marketing', 4, 235, 'Moratuwa', 1, NULL, 'job_images/DzMNnG5iVEaj9Il4k6rPK5lsxQv9gp2IWwV1wQC4.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:13:11', NULL, 'approved', 'contact_contributor', NULL, 'J099968', 1, '2025-03-21 07:09:44', '2025-05-17 05:13:29', 8, 78),
(334, 'Forklift Operator', 'No Description', 11, 257, 'Colombo', 1, NULL, 'job_images/MV7j70bkCflP8RFmbdi8Tca7edXhwEEMyxv8cgT2.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:13:21', NULL, 'approved', 'contact_contributor', NULL, 'J099969', 1, '2025-03-21 07:12:36', '2025-05-20 08:40:46', 8, 78),
(335, 'Sales Assistant - Signature', 'HS Marketing Pvt Ltd', 32, 155, 'Negambo', 1, NULL, 'job_images/88sXKR2WjlLFBaGaOu6FU1MTv4XRUat7jW0n6Pfo.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:21:27', NULL, 'approved', 'contact_contributor', NULL, 'J099970', 1, '2025-03-21 07:15:37', '2025-05-17 05:27:15', 8, 94),
(336, 'Receptionist', 'Hameedia', 32, 155, 'Colombo', 1, NULL, 'job_images/oSjVUzL66T2yzweOCJvBwmCMP1GgAYHOeIDdI5X3.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:21:39', NULL, 'approved', 'contact_contributor', NULL, 'J099971', 1, '2025-03-21 07:17:17', '2025-05-17 05:36:21', 8, 84),
(337, 'Graphic Designer /Video Editor', 'HS Marketing Pvt Ltd', 15, 106, 'Morattuwa', 1, NULL, 'job_images/ft059YEooeuI1OFRB9ajyTtvnsmPmDx9chkJzggT.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:21:50', NULL, 'approved', 'contact_contributor', NULL, 'J099972', 1, '2025-03-21 07:21:10', '2025-05-19 01:36:06', 8, 79),
(338, 'ROC Operators/ Drivers', 'Foreign Jobs', 11, 254, 'Turkey', 67, NULL, 'job_images/yYeZhmmyD8sZfJFUBewzHCmBDWLDKXM6MN4ALAN4.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:31:18', NULL, 'approved', 'contact_contributor', NULL, 'J099973', 1, '2025-03-21 07:29:46', '2025-05-20 09:38:11', 8, 78),
(339, 'Content Manager', 'CT Marketing', 4, 239, 'Colombo', 1, NULL, 'job_images/YoS7u5XgZxn9w0Ba4KubHLyW993Wvdmkatcii2SZ.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:31:26', NULL, 'approved', 'contact_contributor', NULL, 'J099974', 1, '2025-03-21 07:31:07', '2025-05-19 04:11:10', 8, 76),
(340, 'All Vacancies', 'QUILOX', 13, 99, 'Colombo', 1, NULL, 'job_images/iijhXQwFvBhHXjalXC1VJG8ATRHzraOkiJH2e1aM.jpg', NULL, 27, 1, 1, '2025-04-21', '2025-03-21 03:33:46', NULL, 'approved', 'contact_contributor', NULL, 'J099975', 1, '2025-03-21 07:33:35', '2025-05-19 09:23:40', 8, 85),
(341, 'Bakeshop Assistant', 'Masuma Food Industry Inc', 31, 151, 'Taguig City', 65, NULL, 'job_images/sWklvueHTzzKU7BwU3RDJfDfPGbJ6FSkq1XwyOt2.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:27:14', NULL, 'approved', 'contact_contributor', NULL, 'J099976', 1, '2025-03-24 18:33:28', '2025-05-19 20:40:09', 8, 96),
(342, 'Internal Audit Executive', 'Electric Manufacturing Company', 35, 165, 'Colombo', 1, NULL, 'job_images/yvwc877npNPOcBdxYl0Xkr1VQHvVuY0CpvjAulxp.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:27:37', NULL, 'approved', 'contact_contributor', NULL, 'J099977', 1, '2025-03-24 18:36:18', '2025-05-18 03:15:30', 8, 81),
(343, 'Showroom Sales Executive', 'Abans', 4, 235, 'Colombo', 1, NULL, 'job_images/YzjeHweHIBHY0cXt4xA7CfYiB9gBMKI7U5TJvMQE.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:27:56', NULL, 'approved', 'contact_contributor', NULL, 'J099978', 1, '2025-03-24 18:37:51', '2025-05-19 19:54:32', 8, 87),
(344, 'Engineer & Fitter', 'Goodwood Ship Management', 2, 226, 'Philippine', 55, NULL, 'job_images/Dx9LYDCwjfOqymC7se2qUK92hPK11p2F9z0SLOjS.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:28:08', NULL, 'approved', 'contact_contributor', NULL, 'J099979', 1, '2025-03-24 18:40:49', '2025-05-19 21:22:33', 8, 85),
(345, 'HR Assistant', 'TalentXjobs', 8, 74, 'Ja Ela', 1, NULL, 'job_images/yI9VeVP6laSLMhCG6gVbPECQINQhZMwDVB3KE65F.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:28:19', NULL, 'approved', 'contact_contributor', NULL, 'J099980', 1, '2025-03-24 18:43:04', '2025-05-19 19:43:18', 8, 98),
(346, 'Senior Developer', 'M Lhuiller Financial Service', 1, 78, 'NRA Cebu City', 65, NULL, 'job_images/HlH5YjMCXPUgtSWmrJDV3VQe7KVlJv0zE1EgpAuN.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:28:29', NULL, 'approved', 'contact_contributor', NULL, 'J099981', 1, '2025-03-24 18:46:31', '2025-05-19 21:32:49', 8, 80),
(347, 'Call Center Agent', 'South Africa', 46, 195, 'South Africa', 65, NULL, 'job_images/aqDSqzfpUNRy3pcYZ32qY60lVT45ZVWNZ4vgiUZI.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:28:38', NULL, 'approved', 'contact_contributor', NULL, 'J099982', 1, '2025-03-24 18:49:15', '2025-05-19 21:45:38', 8, 89),
(348, 'Travel Consultant', 'Holiday Tribes', 13, 100, 'Colombo', 1, NULL, 'job_images/4TsQyHM9YnadvHoL2U8tqWPaGqJbcfE8iSecPab0.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:28:50', NULL, 'approved', 'contact_contributor', NULL, 'J099983', 1, '2025-03-24 18:51:38', '2025-05-16 17:42:42', 8, 88),
(349, 'Junior Engineer', 'Goodwood Ship Management', 11, 254, 'Philippine', 55, NULL, 'job_images/MR7u7lqVHesI7x6AuqqWS1euuwa2deoBnDUPg33E.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:28:59', NULL, 'approved', 'contact_contributor', NULL, 'J099984', 1, '2025-03-24 18:56:12', '2025-05-19 21:55:59', 8, 79),
(350, 'Bar Utility', 'Magsaysay Maritime Corporations', 13, 99, 'Foreign Jobs', 65, NULL, 'job_images/Ghmro4JIJiJLeMlwpD7oBld2Fi0TAEzcdoRt5DyT.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:29:08', NULL, 'approved', 'contact_contributor', NULL, 'J099985', 1, '2025-03-24 18:59:56', '2025-05-18 00:25:43', 8, 91),
(351, 'Area Sales Executive', 'Lucky Lanka Milk Processing Co PLC', 4, 235, 'Bibulewela', 1, NULL, 'job_images/AoUKDxESTXIqJTC5lKOotX8PZXB6J7OBxVroVoMi.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:29:18', NULL, 'approved', 'contact_contributor', NULL, 'J099986', 1, '2025-03-24 19:02:44', '2025-05-20 06:04:43', 8, 85),
(352, 'Van Driver & Assistant', 'Phakisa Holdings', 5, 91, 'Colombo', 1, NULL, 'job_images/9VlSBoQO07K3mPH4JNx6ASO9qjqptyBmMNVnB2Gl.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:29:27', NULL, 'approved', 'contact_contributor', NULL, 'J099987', 1, '2025-03-24 19:06:07', '2025-05-19 22:23:53', 8, 90),
(353, 'Deck Steward', 'Magsaysay Maritime Corporation', 31, 152, 'Marella Cruises', 65, NULL, 'job_images/0Oxg2KwRRshDXES5MWRBmx2rphP4npy1tOIG3snr.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:29:40', NULL, 'approved', 'contact_contributor', NULL, 'J099988', 1, '2025-03-24 19:08:30', '2025-05-19 22:50:12', 8, 77),
(354, 'Chemical Tanker', 'Trans Global Maritime Agency Inc', 11, 254, 'Philippine', 65, NULL, 'job_images/40hHtgY4LJ5NuF3ca2QwiE3DFAxKCijrO3bxthSN.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:52:48', NULL, 'approved', 'contact_contributor', NULL, 'J099989', 1, '2025-03-24 19:32:23', '2025-05-19 22:52:41', 8, 83),
(355, 'Long Hual Trailer Truck Driver', 'Seagull International LLP', 11, 254, 'Karakatt', 3, NULL, 'job_images/0XZ84sDtJ1SHNWybfPEFMMfPu4Sw4x8JS0JaeKM6.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:52:57', NULL, 'approved', 'contact_contributor', NULL, 'J099990', 1, '2025-03-24 19:35:22', '2025-05-20 03:29:22', 8, 83),
(356, 'HR Assistant', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/Ahi5uZLMgicPUBedC9bDDdmm9GjNjOCUAhDB1U67.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:53:08', NULL, 'approved', 'contact_contributor', NULL, 'J099991', 1, '2025-03-24 19:36:58', '2025-05-20 08:01:53', 8, 82),
(357, 'HR Executive', 'Thilapiya Colombo', 8, 74, 'Colombo 7', 1, NULL, 'job_images/H16qfPCYJMQ36Li2aehsEyadmAnJOzKyAylE6Ctx.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:53:18', NULL, 'approved', 'contact_contributor', NULL, 'J099992', 1, '2025-03-24 19:40:37', '2025-05-20 11:04:05', 8, 97),
(358, 'HGV Drivers', 'Ireland', 11, 254, 'Dublin', 40, NULL, 'job_images/9VZtOwDZydyzuOJuRqgSSz4i7lf7JH0nfOWpNc1O.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:53:27', NULL, 'approved', 'contact_contributor', NULL, 'J099993', 1, '2025-03-24 19:42:20', '2025-05-20 10:07:23', 8, 93),
(359, 'All Vacancies', 'PNB India Bank', 23, 132, 'India', 3, NULL, 'job_images/4L6RtRnzyjm8qHdkFiLfY0Q1vDarCgCdoRmWhOzQ.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:53:36', NULL, 'approved', 'contact_contributor', NULL, 'J099994', 1, '2025-03-24 19:44:25', '2025-05-20 03:33:33', 8, 93),
(360, 'Operational Executive', 'Ensured Quality Lanka Pvt Ltd', 46, 195, 'Colombo', 1, NULL, 'job_images/t06OqMKBxQBbqQxQcXhprcBmDLOyDXt9a6uyIsy2.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:53:46', NULL, 'approved', 'contact_contributor', NULL, 'J099995', 1, '2025-03-24 19:46:14', '2025-05-19 02:55:31', 8, 87),
(361, 'HR Officer', 'TalentXJobs', 8, 74, 'Ja Ela, Ekala', 1, NULL, 'job_images/pJ6IXLP4VlDKvmUa7dz7eqBHfTScdMoCYJANj1WY.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:53:55', NULL, 'approved', 'contact_contributor', NULL, 'J099996', 1, '2025-03-24 19:47:34', '2025-05-17 20:12:59', 8, 82),
(362, 'Sales Executive', 'HS Marketing Pvt Ltd', 4, 235, 'Island Wise', 1, NULL, 'job_images/MU3A5voLGFGFDIYRudBrwzRX0ZhkIhzeVhEPmkU8.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:54:31', NULL, 'approved', 'contact_contributor', NULL, 'J099997', 1, '2025-03-24 19:49:17', '2025-05-20 08:46:04', 8, 88),
(363, 'Senior QS', 'New Interiors (Pvt) Ltd', 48, 201, 'Colombo', 1, NULL, 'job_images/zOyVNMfN0HIutGwx0IqqPMyv8uO730ZVfxFfpLdq.jpg', NULL, 27, 1, 1, '2025-04-24', '2025-03-24 15:54:41', NULL, 'approved', 'contact_contributor', NULL, 'J099998', 1, '2025-03-24 19:52:34', '2025-05-16 17:33:20', 8, 75),
(364, 'HR Interns', 'TalentXjob', 8, 74, 'Colombo', 1, NULL, 'job_images/UsEJ8VqTSNhODnu7k5gTyhqvp3lAYJMlitv9Hs8S.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:39:46', NULL, 'approved', 'contact_contributor', NULL, 'J099999', 1, '2025-03-24 20:29:46', '2025-05-17 20:11:35', 8, 77),
(365, 'HR Interns', 'TalentXjob', 8, 74, 'Colombo', 1, NULL, 'job_images/ZMkRG4IxnYREDKFw5pkFZ3r5nPCSP8pg4KCMSrOX.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:39:54', NULL, 'approved', 'contact_contributor', NULL, 'J100000', 1, '2025-03-24 20:29:49', '2025-05-18 11:12:29', 8, 91),
(366, 'Sales Assistants', 'Kiribathgoda', 4, 235, 'Colombo', 1, NULL, 'job_images/ATmzhf9nEPMMZ77OAUM9cO5KmmfQnMpKJL96lFaf.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:40:03', NULL, 'approved', 'contact_contributor', NULL, 'J100001', 1, '2025-03-24 20:32:05', '2025-05-16 17:37:30', 8, 81),
(367, 'Operational Executive', 'Ensured Quality Lanka Pvt Ltd', 46, 195, 'Online', 1, NULL, 'job_images/tCozC9LRkASzI0DKoFNvFcVKzz7blltocb3dUx7h.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:40:13', NULL, 'approved', 'contact_contributor', NULL, 'J100002', 1, '2025-03-24 20:35:20', '2025-05-19 00:53:53', 8, 72),
(368, 'Interior Sales Executive', 'Alpha Industries (Pvt) Ltd', 48, 201, 'Colombo', 1, NULL, 'job_images/XIKhn1JQvEclhxAuJjveiOh5z7gak8cb4rV09Tvl.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:40:33', NULL, 'approved', 'contact_contributor', NULL, 'J100003', 1, '2025-03-24 20:39:34', '2025-05-20 10:22:15', 8, 91),
(369, 'Senior Sales Executive', 'DPR Consultants (Pvt) Ltd', 4, 235, 'Rajagiriya', 1, NULL, 'job_images/FYAJOHdhRc6bYKJGh88OhWl2xzOaDQfbEZCAZP9K.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:42:54', NULL, 'approved', 'contact_contributor', NULL, 'J100004', 1, '2025-03-24 20:42:35', '2025-05-20 08:39:24', 8, 87),
(370, 'Account Executive', 'Colombo', 3, 229, 'Colombo', 1, NULL, 'job_images/8Fj1s8tr9kGivR7IRUTw40c9CMSwECxa7OARicjU.jpg', NULL, 27, 1, 1, '2025-04-25', '2025-03-24 16:47:21', NULL, 'approved', 'contact_contributor', NULL, 'J100005', 1, '2025-03-24 20:47:11', '2025-05-17 03:31:10', 8, 92),
(371, 'Accounts Assistant', 'Eranga Motors', 3, 229, 'Colombo', 1, NULL, 'job_images/NhHyEE56PccpltuWaWvfieRyuTxH71MoV2OX7JZz.jpg', NULL, 27, 1, 1, '2025-04-26', '2025-03-25 14:36:47', NULL, 'approved', 'contact_contributor', NULL, 'J100006', 1, '2025-03-25 18:24:35', '2025-05-17 20:34:01', 8, 84),
(372, 'Head of Business Developments', 'CIMS', 21, 123, 'Colombo', 1, NULL, 'job_images/ZVrvam9FVqcQzuqygk6dey8ev4ybIHIXUCM14Yyu.jpg', NULL, 27, 1, 1, '2025-04-26', '2025-03-25 14:36:57', NULL, 'approved', 'contact_contributor', NULL, 'J100007', 1, '2025-03-25 18:26:37', '2025-05-17 16:05:43', 8, 92),
(373, 'HR Executive', 'Metracorp', 8, 74, 'Colombo', 1, NULL, 'job_images/bFElFTpROaG0YBKJTSc6gw03iXHV7qfNj5ubP6QZ.jpg', NULL, 27, 1, 1, '2025-04-26', '2025-03-25 14:37:05', NULL, 'approved', 'contact_contributor', NULL, 'J100008', 1, '2025-03-25 18:28:15', '2025-05-17 23:46:29', 8, 91),
(374, 'Sales Team', 'Hameedia', 32, 155, 'Colombo', 1, NULL, 'job_images/FuT6zI0XgbdsgrthYod0ZmVq0TbmmNSxBUvHL4du.jpg', NULL, 27, 1, 1, '2025-04-26', '2025-03-25 14:37:14', NULL, 'approved', 'contact_contributor', NULL, 'J100009', 1, '2025-03-25 18:30:45', '2025-05-19 12:41:11', 8, 80),
(375, 'Seagull International', 'Kuwait Jobs', 36, 168, 'Kuwait', 45, NULL, 'job_images/PIfJR6WbWCULyaVejQGjX6tJjF2NHM6vat1I7XiG.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-25 14:37:22', NULL, 'approved', 'contact_contributor', NULL, 'J100010', 1, '2025-03-25 18:33:34', '2025-05-19 10:41:09', 8, 81),
(376, 'Juki Machine Operator', 'Dubai - Jobs', 44, 189, 'Colombo', 1, NULL, 'job_images/FVEOCdYGlhxcnN5dgEswVoAEJ3knrAl3kQlvKpH7.jpg', NULL, 27, 1, 1, '2025-04-27', '2025-03-27 16:09:08', NULL, 'approved', 'contact_contributor', NULL, 'J100011', 1, '2025-03-27 19:42:22', '2025-05-20 09:54:11', 8, 118),
(377, 'Truck Mechanic', 'Europe - Romania Job', 49, 218, 'Romania/ Europe', 65, NULL, 'job_images/te5OWTpyOQPhEfNoh8ZkojD1fctQ5rDC9wLVJMVI.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:09:19', NULL, 'approved', 'contact_contributor', NULL, 'J100012', 1, '2025-03-27 19:47:26', '2025-05-18 17:09:10', 8, 67),
(378, 'Call Center Assistant (Tamil)', 'Ensured Quality Lanka', 46, 195, 'Colombo', 1, NULL, 'job_images/Svy7tdlWSOHJGQNpO45h1N9pM5zAgFHP4HeEkpm0.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:09:28', NULL, 'approved', 'contact_contributor', NULL, 'J100013', 1, '2025-03-27 19:53:03', '2025-05-20 09:56:42', 8, 89),
(379, 'Drivers - Europe', 'Iduwara Lanka', 11, 254, 'Europe', 65, NULL, 'job_images/nOWS7RPznbpr6sbT8vSha3Jdv9fd0KaRDwwMioW8.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:09:37', NULL, 'approved', 'contact_contributor', NULL, 'J100014', 1, '2025-03-27 19:57:15', '2025-05-20 10:35:11', 8, 92),
(380, 'HR Executive', 'Three Sinha', 8, 74, 'Rajagiriya', 1, NULL, 'job_images/p0g0IxrFccjqGx6fDjdhnnk8QNCpgplZJaeTUlvt.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:09:49', NULL, 'approved', 'contact_contributor', NULL, 'J100015', 1, '2025-03-27 20:00:39', '2025-05-18 01:12:24', 8, 91),
(381, 'Visa/Admission Executive, Branch Manager', 'Accredited Consultancy Center', 46, 196, 'Island Wide', 1, NULL, 'job_images/OHXHWWKS7yhjKFUjTdBmzCyRrUKfNqUCsItnAkSs.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:10:05', NULL, 'approved', 'contact_contributor', NULL, 'J100016', 1, '2025-03-27 20:04:37', '2025-05-19 20:32:06', 8, 84),
(382, 'Assistant Lecturer', 'IEBT Campus', 6, 242, 'Mawanella', 1, NULL, 'job_images/oIT751rcWTuhpTfX62tIIL6cZtdwDux03gqQ72AX.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:10:18', NULL, 'approved', 'contact_contributor', NULL, 'J100017', 1, '2025-03-27 20:06:40', '2025-05-17 22:38:21', 8, 91),
(383, 'Admin Assistant', 'Kesbawa', 46, 195, 'Kesbawa', 1, NULL, 'job_images/swcSTU9n3Iru4DWBU5adDMBIilrkRZQhrGUhMqX5.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:10:29', NULL, 'approved', 'contact_contributor', NULL, 'J100018', 1, '2025-03-27 20:08:51', '2025-05-18 01:45:16', 8, 85),
(384, 'SEO Experts', 'No Description', 1, 79, 'Colombo', 1, NULL, 'job_images/ZAbOTzu0ZRK7hL5tRwyahz5po9aWFwHDv9kW3hg2.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:21:14', NULL, 'approved', 'contact_contributor', NULL, 'J100019', 1, '2025-03-27 20:12:49', '2025-05-18 23:41:54', 8, 79),
(385, 'Senior Graphic Designer', 'No Description', 1, 79, 'Colombo', 1, NULL, 'job_images/SPnm7jcxzWcCOaOa7lsUeZ9C1rkwvwzTZnagelCr.jpg', NULL, 27, 1, 1, '2025-04-28', '2025-03-27 16:21:24', NULL, 'approved', 'contact_contributor', NULL, 'J100020', 1, '2025-03-27 20:14:37', '2025-05-19 12:18:49', 8, 86),
(386, 'Accounts Assistant', 'LGL Marketing Services', 3, 229, 'Rathmalana', 1, NULL, 'job_images/qcp2qqvVyRn4GYtOZQRkt1ODP3he7A3JHngO1Pvv.jpg', NULL, 27, 1, 1, '2025-04-29', '2025-03-27 16:21:32', NULL, 'approved', 'contact_contributor', NULL, 'J100021', 1, '2025-03-27 20:16:40', '2025-05-18 02:18:55', 8, 93),
(387, 'Finance Associates', 'CJ Smart Freight', 11, 254, 'Taguig City', 1, NULL, 'job_images/HqmVgQEqxl7qEW9bxbFUo2bEnfgK6rswKc5fTTmw.jpg', NULL, 27, 1, 1, '2025-04-29', '2025-03-27 16:21:43', NULL, 'approved', 'contact_contributor', NULL, 'J100022', 1, '2025-03-27 20:21:04', '2025-05-18 03:31:32', 8, 79),
(388, 'Executive Credit Controls', 'Colombo 5', 11, 254, 'Colombo', 1, NULL, 'job_images/LQ9jPXFO9gSBphPz7W5ZfaaeDi0lEi5sapLb8mG4.jpg', NULL, 27, 1, 1, '2025-04-29', '2025-03-27 16:25:25', NULL, 'approved', 'contact_contributor', NULL, 'J100023', 1, '2025-03-27 20:23:19', '2025-05-18 20:48:02', 8, 81),
(389, 'Finance Supervisor', 'CJ Smart Freight', 11, 254, 'Foreign Jobs', 65, NULL, 'job_images/DJs1jrqVy3lkBNn9nLyGoW1MOoqWhE3xqgaW8FQN.jpg', NULL, 27, 1, 1, '2025-04-29', '2025-03-27 16:25:38', NULL, 'approved', 'contact_contributor', NULL, 'J100024', 1, '2025-03-27 20:25:09', '2025-05-18 21:00:59', 8, 78),
(390, 'Book Keeper', 'CJ Smart Freight', 3, 229, 'Foreign Jobs', 65, NULL, 'job_images/ySlh2CMm4Uqhvmo5llEgrBBgrTrcilUKdJP3j2rh.jpg', NULL, 27, 1, 1, '2025-04-29', '2025-03-27 16:28:09', NULL, 'approved', 'contact_contributor', NULL, 'J100025', 1, '2025-03-27 20:27:56', '2025-05-19 19:04:25', 8, 86),
(391, 'Draughtsman (Designer)', 'Ja Ela', 48, 201, 'Ja Ela', 1, NULL, 'job_images/jnrgHPgbpfdL1c1btOgHid9G7b2vBx7tCZ7CqsG2.jpg', NULL, 27, 1, 1, '2025-04-29', '2025-03-27 16:31:29', NULL, 'approved', 'contact_contributor', NULL, 'J100026', 1, '2025-03-27 20:31:18', '2025-05-18 12:27:06', 8, 83),
(392, 'Receptionist', 'Empire Education (Pvt) Ltd', 6, 240, 'Battaramulla', 1, NULL, 'job_images/uLlHiu5fHEkOdmxDC2CprjKmMKjtzrAKuFSlS2ZF.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:19:13', NULL, 'approved', 'contact_contributor', NULL, 'J100027', 1, '2025-03-28 13:27:45', '2025-05-18 17:43:24', 8, 86),
(393, 'Sales Executive /Assistant', 'AccSense', 4, 235, 'Nugegoda', 1, NULL, 'job_images/JZ3FnH6eLnhVpXPmLYzHgdW1ALgnySUb5K9VzZF3.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:19:22', NULL, 'approved', 'contact_contributor', NULL, 'J100028', 1, '2025-03-28 13:29:55', '2025-05-18 04:28:55', 8, 91),
(394, 'Sales & Marketing Executive', 'No Description', 6, 240, 'Colombo', 1, NULL, 'job_images/7kaLOhDjXGZuIj7CpWrpuzBXyLhuFzzFBnALeI9A.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:19:45', NULL, 'approved', 'contact_contributor', NULL, 'J100029', 1, '2025-03-28 13:31:21', '2025-05-17 23:45:43', 8, 76),
(395, 'Sales Manager', 'SATASME', 4, 235, 'Colombo', 1, NULL, 'job_images/coxeKTj01d5mkhwmGOlXuMx5bvWWTDpmwvhvyNnm.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:19:57', NULL, 'approved', 'contact_contributor', NULL, 'J100030', 1, '2025-03-28 13:32:45', '2025-05-19 01:56:03', 8, 88),
(396, 'Video Content Editor', 'Ceedecs Lanka Holdings', 16, 108, 'Kadawatha', 1, NULL, 'job_images/VIuSmSTz0hNsxD9GlvMA2ciHsD2eqQV2KzFlPK47.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:20:09', NULL, 'approved', 'contact_contributor', NULL, 'J100031', 1, '2025-03-28 13:34:59', '2025-05-18 02:27:40', 8, 85),
(397, 'Accounts Assistant', 'EME', 3, 229, 'Colombo', 1, NULL, 'job_images/ycgapxwbJ7BAiAJr9d5nNb2dF7velfu0bxzdl2s4.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:20:23', NULL, 'approved', 'contact_contributor', NULL, 'J100032', 1, '2025-03-28 13:36:12', '2025-05-18 03:51:19', 8, 82),
(398, 'QS & Technical officer', 'I TEC Engineering (Pvt) Ltd', 2, 225, 'Colombo', 1, NULL, 'job_images/hlmcS0ezP5c7CsaRhrJ9PwdwV29K0SYexpbZYpBE.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:20:33', NULL, 'approved', 'contact_contributor', NULL, 'J100033', 1, '2025-03-28 13:37:54', '2025-05-20 10:45:04', 8, 92),
(399, 'Hotel Manager', 'No Description', 13, 99, 'Nuwara Eliya/Kataragama', 1, NULL, 'job_images/NdOldVkAX7co1kD3sr69nwjAi6dXJVHkWVWpZFzE.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:20:43', NULL, 'approved', 'contact_contributor', NULL, 'J100034', 1, '2025-03-28 13:39:27', '2025-05-18 04:14:12', 8, 92),
(400, 'Restaurant Stewart', 'Blue Lagoon Resort', 13, 99, 'Kalpitiya', 1, NULL, 'job_images/DAhQaJA6yzRudisNbL5Rrb4HS2HEaGrk3qO1OksT.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:20:55', NULL, 'approved', 'contact_contributor', NULL, 'J100035', 1, '2025-03-28 13:41:38', '2025-05-18 13:01:57', 8, 81),
(401, 'Marketing Executives', 'Pharmaceutical Company Jobs', 7, 246, 'Colombo', 1, NULL, 'job_images/mhPlpQRDx4Kyk3AdsW7oCtXBfASCTA78IiJsIZ50.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-03-28 10:21:06', NULL, 'approved', 'contact_contributor', NULL, 'J100036', 1, '2025-03-28 13:44:12', '2025-05-18 22:34:43', 8, 92),
(402, 'Sales Manager', 'Union Assurance', 23, 133, 'Colombo', 1, NULL, 'job_images/6GyfOovBf1FppmRaP683xZV9Nat9FV0cKcXZWTuG.jpg', NULL, 27, 1, 1, '2025-05-02', '2025-03-28 10:21:18', NULL, 'approved', 'contact_contributor', NULL, 'J100037', 1, '2025-03-28 13:45:33', '2025-05-18 08:06:13', 8, 99),
(403, 'Social Media Management', 'FB, Instagram, TikTok, Contet  Creation', 16, 108, 'Open', 1, NULL, 'job_images/RaX72EAf5y1LApCcvol7xY5cT2PGgs6eDJHShkeM.jpg', NULL, 27, 1, 1, '2025-05-02', '2025-03-28 10:21:28', NULL, 'approved', 'contact_contributor', NULL, 'J100038', 1, '2025-03-28 13:48:07', '2025-05-19 21:03:03', 8, 89),
(404, 'HR Professionals', 'AdvenTec', 8, 74, 'Colombo', 1, NULL, 'job_images/CCYEfxmuN1850KDVqWxWCpz73hxoCtYtrW6Ambeb.jpg', NULL, 27, 1, 1, '2025-05-03', '2025-03-28 10:21:36', NULL, 'approved', 'contact_contributor', NULL, 'J100039', 1, '2025-03-28 13:49:27', '2025-05-19 01:45:30', 8, 83),
(405, 'Computer hardware Executive', 'NetCore', 1, 80, 'Nugegoda/Maharagama', 1, NULL, 'job_images/4jwFOm3bs0XBIsFrJ4yUXKhqs3BX0zSm3MHXkEhQ.jpg', NULL, 27, 1, 1, '2025-05-03', '2025-03-28 10:21:46', NULL, 'approved', 'contact_contributor', NULL, 'J100040', 1, '2025-03-28 13:51:49', '2025-05-19 00:57:07', 8, 78),
(406, 'MArketing Officers', 'PML', 4, 238, 'Open', 1, NULL, 'job_images/b2SjRVFAqIRRw687xnhLBQwLMoPQMDS614GnuDsm.jpg', NULL, 27, 1, 1, '2025-05-03', '2025-03-28 10:21:56', NULL, 'approved', 'contact_contributor', NULL, 'J100041', 1, '2025-03-28 13:54:32', '2025-05-19 01:04:09', 8, 85),
(407, 'Factory Manager', 'Furniture Gallery', 36, 167, 'Boralesgamuwa', 1, NULL, 'job_images/J9YsEQVeMYlTKdWQ7tdm78TbfEwhajQIeKSICLcr.jpg', NULL, 27, 1, 1, '2025-05-06', '2025-03-28 10:22:11', NULL, 'approved', 'contact_contributor', NULL, 'J100042', 1, '2025-03-28 13:58:28', '2025-05-19 01:13:52', 8, 83),
(409, 'Business Development Executive', 'Spring Water', 31, 152, 'Rathnapura/ Colombo', 1, NULL, 'job_images/cY8MaSPYjN0H5Gh4G9FSPz8qI4x1DsFSYaJqTkzb.jpg', NULL, 27, 1, 1, '2025-05-06', '2025-03-28 10:23:01', NULL, 'approved', 'contact_contributor', NULL, 'J100044', 1, '2025-03-28 14:03:23', '2025-05-19 01:23:51', 8, 80),
(410, 'Accounting Officer', 'Perzim Land Inc', 3, 229, 'Foreign Jobs', 65, NULL, 'job_images/y70L2fRaepimSYfPtHkicpLyx1ieSEyZ0Am48lUg.jpg', NULL, 27, 1, 1, '2025-05-06', '2025-03-28 10:23:12', NULL, 'approved', 'contact_contributor', NULL, 'J100045', 1, '2025-03-28 14:05:17', '2025-05-19 01:30:27', 8, 86),
(411, 'Accounts & HR Manager', 'Ceylon Clothing Company', 3, 229, 'Katubedda', 1, NULL, 'job_images/PZZdlTNOTjoQXQ9xBbKsLWnpVyp8N2kix4HA9ws0.jpg', NULL, 27, 1, 1, '2025-05-06', '2025-03-28 10:23:22', NULL, 'approved', 'contact_contributor', NULL, 'J100046', 1, '2025-03-28 14:06:57', '2025-05-19 03:15:33', 8, 85),
(412, 'Personal Assistant to CEO', 'SATA SME', 46, 195, 'Hanwella', 1, NULL, 'job_images/XksUunGALQcz1XsuBBHhS5dW9qE1VV3qPPN7gOds.jpg', NULL, 27, 1, 1, '2025-05-06', '2025-03-28 10:23:32', NULL, 'approved', 'contact_contributor', NULL, 'J100047', 1, '2025-03-28 14:08:22', '2025-05-19 21:23:37', 8, 97),
(413, 'English Teachers', 'Cambridge College - Kandy', 6, 242, 'Kandy', 1, NULL, 'job_images/FjOi8eaHZUYopwBy5Qvq7cWbeknRZyMpDOpN957n.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-28 10:23:42', NULL, 'approved', 'contact_contributor', NULL, 'J100048', 1, '2025-03-28 14:10:55', '2025-05-19 02:04:23', 8, 85),
(414, 'Accounts Executive', 'Metro Lands', 3, 229, 'Nugegoda', 1, NULL, 'job_images/Qn7AB38sxxS93ID5x5uFZe081ETqwR5jXRLOCnHl.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-28 10:23:53', NULL, 'approved', 'contact_contributor', NULL, 'J100049', 1, '2025-03-28 14:12:33', '2025-05-19 02:17:57', 8, 81),
(415, 'Digital marketing Specialists', 'Pathway Global Recruitments', 4, 234, 'Dehiwala', 1, NULL, 'job_images/PHtOGumCfp8OpwXQ0INmeALfG8yUH497n8t638UE.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-28 10:24:04', NULL, 'approved', 'contact_contributor', NULL, 'J100050', 1, '2025-03-28 14:14:52', '2025-05-19 02:21:08', 8, 80),
(416, 'Client Relation Executive', 'Voice Print Academy', 46, 195, 'Wattala', 1, NULL, 'job_images/U9v4RtUiBLPtrWn5dAYBa9m8F9mjCDfzpV5guU8Q.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-28 10:24:19', NULL, 'approved', 'contact_contributor', NULL, 'J100051', 1, '2025-03-28 14:16:17', '2025-05-19 07:32:39', 8, 74),
(417, 'Accounts Assistant', 'LGL marketing Services', 3, 229, 'Rathmalana', 1, NULL, 'job_images/PVyWhSwddL1gAxHjkTio9m7wuEF4F8nGi6Emr4dZ.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-28 10:24:31', NULL, 'approved', 'contact_contributor', NULL, 'J100052', 1, '2025-03-28 14:17:28', '2025-05-20 10:22:46', 8, 82),
(418, 'Data Entry Operators', 'CityPack by Advantis', 5, 88, 'Katunayake/ Kalutara', 1, NULL, 'job_images/6ZGzh7vw8wSNKdesISsMmo7pa9be9Kkbkksm0Z5l.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:07:30', NULL, 'approved', 'contact_contributor', NULL, 'J100053', 1, '2025-03-29 18:46:29', '2025-05-20 10:43:35', 8, 111),
(419, 'General Accountant', 'Eye Connect HR Solutions', 3, 229, 'Foreign Jobs', 65, NULL, 'job_images/ter6eGA13h20K002hu2VcAh4uMHzXfBQ8G9zmuZv.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:07:38', NULL, 'approved', 'contact_contributor', NULL, 'J100054', 1, '2025-03-29 18:48:54', '2025-05-19 05:17:17', 8, 78),
(420, 'Office Assistants', 'Smart Electronic Pvt Ltd', 46, 195, 'Colombo', 1, NULL, 'job_images/1dXI1TMBk1uxAUSJxoiWNDYMdc055uxWWENbqwaM.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:07:47', NULL, 'approved', 'contact_contributor', NULL, 'J100055', 1, '2025-03-29 18:50:19', '2025-05-19 05:20:31', 8, 92),
(421, 'Recruitment Consultants', 'Pathway Global - Dehiwala', 8, 74, 'Dehiwala', 1, NULL, 'job_images/MiEYzQF0MXoE33eILWOcAKLVxhke9bC1j1FOQQEU.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:07:55', NULL, 'approved', 'contact_contributor', NULL, 'J100056', 1, '2025-03-29 18:53:59', '2025-05-19 05:43:05', 8, 77),
(422, 'Project Coordinator', 'Esupport', 1, 78, 'Borella', 1, NULL, 'job_images/KBkMO74iUDI5hgi46DzsqdNcLpYqrbI7lu0h3yu7.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:08:02', NULL, 'approved', 'contact_contributor', NULL, 'J100057', 1, '2025-03-29 18:55:52', '2025-05-19 19:34:35', 8, 95),
(423, 'Relationship Executive', 'Seylan Bank', 23, 132, 'Colombo', 1, NULL, 'job_images/Vtx6PNpULt4J1ohxxeoHgm3AW29jPzfJTnfUnFDq.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:08:11', NULL, 'approved', 'contact_contributor', NULL, 'J100058', 1, '2025-03-29 18:57:51', '2025-05-19 05:54:01', 8, 79),
(424, 'Personal Secretary', 'LGL', 46, 195, 'Colombo', 1, NULL, 'job_images/Xwq3pNlbbnVpOX3mwbIQDuw44vKovqcaZDXLkWzx.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:08:20', NULL, 'approved', 'contact_contributor', NULL, 'J100059', 1, '2025-03-29 19:01:22', '2025-05-19 05:59:41', 8, 85),
(425, 'Executive Logistic', 'JohneKeels Logistics', 11, 254, 'Awissawella', 1, NULL, 'job_images/BEihDREoKbum67zg5HxCcRswnNPe3a7J0TazkOUZ.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:08:28', NULL, 'approved', 'contact_contributor', NULL, 'J100060', 1, '2025-03-29 19:03:15', '2025-05-19 06:05:23', 8, 90),
(426, 'Accounting Supervisor', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/Jm0fq51oYyFqPMj3bnuNtZUtzWg1Nzs7iqZXQ6Q2.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:08:36', NULL, 'approved', 'contact_contributor', NULL, 'J100061', 1, '2025-03-29 19:05:06', '2025-05-19 19:16:58', 8, 73),
(427, 'Managers', 'Power Hand Plantations', 4, 235, 'Open', 1, NULL, 'job_images/xjim0qOwm4GAt6kKrBSgOC2rfI6nrFUATzVtWUHc.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-03-29 15:08:44', NULL, 'approved', 'contact_contributor', NULL, 'J100062', 1, '2025-03-29 19:06:56', '2025-05-19 08:05:58', 8, 78),
(428, 'Personal Assistant', 'Dr.Hair', 7, 247, 'Colombo', 1, NULL, 'job_images/Kz3Rbo0ZfboajPRc8j3ry74OaluvmASGFAqoD1Xa.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:34:13', NULL, 'approved', 'contact_contributor', NULL, 'J100063', 1, '2025-03-29 19:11:07', '2025-05-19 04:56:53', 8, 87),
(429, 'Receptionist', 'PrimeHope Ltd', 46, 196, 'Open', 1, NULL, 'job_images/cGlALPnHshYYWNdp1wzlihkvULVR33ssJbVM1Xpi.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:34:22', NULL, 'approved', 'contact_contributor', NULL, 'J100064', 1, '2025-03-29 19:12:32', '2025-05-19 19:18:57', 8, 87),
(430, 'Junior Executive - Operation', 'Gemological Institute of Colombo', 7, 245, 'Colombo', 1, NULL, 'job_images/Mb4wcu70MA7lNp3T4gcqYQW1VObIobbPvmvb6Fcr.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:34:44', NULL, 'approved', 'contact_contributor', NULL, 'J100065', 1, '2025-03-29 19:15:12', '2025-05-19 07:34:13', 8, 95),
(432, 'F&B Manager (Femail)', 'Collons International Pvt Ltd', 13, 99, 'Colombo', 1, NULL, 'job_images/is4UK9t9A0XOfP7eMaD5Ik4HMG7DUVrb7UDnkk4P.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:35:54', NULL, 'approved', 'contact_contributor', NULL, 'J100067', 1, '2025-03-29 19:19:28', '2025-05-19 10:03:57', 8, 71),
(433, 'Customer Support Executive', 'SafetyNet Pvt Ltd', 12, 98, 'Colombo', 1, NULL, 'job_images/3jpolgciyAzi5nOl7nzxOaioFvHSJK5je3xPEdnj.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:36:03', NULL, 'approved', 'contact_contributor', NULL, 'J100068', 1, '2025-03-29 19:22:34', '2025-05-19 19:00:09', 8, 78),
(434, 'Sales Manager/ Ass.Manager', 'Power Hands Plantations Pvt Ltd', 26, 135, 'Open', 1, NULL, 'job_images/djZ8AM7uwvoASbu0xLW15CoxkzkwSeJXBfLtcsBY.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:36:12', NULL, 'approved', 'contact_contributor', NULL, 'J100069', 1, '2025-03-29 19:25:21', '2025-05-19 10:13:44', 8, 78),
(435, 'Hair Dresser/ Beauticians', 'Chamya Salon', 32, 154, 'Boralesgamuwa', 1, NULL, 'job_images/RXZoccISLxLlc5uFKYOIbYple0XM3O1Nknqtzj5s.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:36:20', NULL, 'approved', 'contact_contributor', NULL, 'J100070', 1, '2025-03-29 19:31:52', '2025-05-19 18:14:02', 8, 79),
(436, 'Sales Executive', 'APlus Technology Services', 1, 79, 'Kekirawa', 1, NULL, 'job_images/p1UVWRZhs7IF7Wa3kdVpKcoEWwtgf2ESo1VThENt.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:36:30', NULL, 'approved', 'contact_contributor', NULL, 'J100071', 1, '2025-03-29 19:34:01', '2025-05-18 03:08:39', 8, 74),
(437, 'Sales Officers', 'Island wide', 4, 235, 'Island wide', 1, NULL, 'job_images/nzSkZQkGtThcIAPLeo87eVhXmo1mJ4b22J74pkms.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:40:44', NULL, 'approved', 'contact_contributor', NULL, 'J100072', 1, '2025-03-29 19:38:30', '2025-05-19 10:42:40', 8, 86),
(438, 'Mechanical Technicians', 'ChargeNet', 49, 217, 'Colombo', 1, NULL, 'job_images/wJoWbrkjJHdfrAGNNB9lUYsBHQTmRzLMa7GatLpl.jpg', NULL, 27, 1, 1, '2025-05-12', '2025-03-29 15:40:52', NULL, 'approved', 'contact_contributor', NULL, 'J100073', 1, '2025-03-29 19:40:35', '2025-05-19 19:12:31', 8, 71),
(439, 'Manager/Assistant Marketing Manager', 'Blue Ocean Group of Companies', 12, 96, 'Colombo', 1, NULL, 'job_images/df49yQ6wpZ1LU8gbtqBduZIwgK5NlSTVXZZgqB0X.jpg', NULL, 8, 1, 1, '2025-05-15', '2025-04-08 16:32:07', NULL, 'approved', 'contact_contributor', NULL, 'J100074', 1, '2025-04-08 20:09:25', '2025-05-20 01:54:11', 8, 92),
(440, 'Operation & Client Relations Executive', 'Voice Print Academy', 46, 195, 'Wattala', 1, NULL, 'job_images/0DqPWKlj0FBwpRy7a2Dafp5UTOmmJ6PX0aahbIwR.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:32:34', NULL, 'approved', 'contact_contributor', NULL, 'J100075', 1, '2025-04-08 20:15:16', '2025-05-19 04:59:29', 8, 64),
(441, 'Pharmacist', 'Healthgrade pharmacy', 7, 246, 'Colombo', 1, NULL, 'job_images/ta9geAco5P0N9rWPEwXGZ14GdeuK1VNHNqyVBWAj.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:32:59', NULL, 'approved', 'contact_contributor', NULL, 'J100076', 1, '2025-04-08 20:17:32', '2025-05-19 05:02:30', 8, 78),
(442, 'Pattern Maker', 'SHS International Pvt Ltd', 44, 189, 'Colombo', 1, NULL, 'job_images/AUND6NeYpG8wa0I4452kqytk6BLovjcy31FSqKbd.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:33:23', NULL, 'approved', 'contact_contributor', NULL, 'J100077', 1, '2025-04-08 20:21:53', '2025-05-19 05:05:31', 8, 68),
(443, 'Accounting Executive', 'No Description', 3, 229, 'Battaramulla', 1, NULL, 'job_images/bFJvH0qIRDnubyDfrRtOKY1iT97V34SQD0lRFUzL.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:33:48', NULL, 'approved', 'contact_contributor', NULL, 'J100078', 1, '2025-04-08 20:25:39', '2025-05-19 18:20:44', 8, 93),
(444, 'Steward/Waiter', 'DINEHUT', 13, 99, 'Kurunegala', 1, NULL, 'job_images/l7DvTL9jgWi2W9OGmgKiV71dIx5UcSmBvgbbgzes.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:34:16', NULL, 'approved', 'contact_contributor', NULL, 'J100079', 1, '2025-04-08 20:28:06', '2025-05-19 20:48:44', 8, 84),
(445, 'Personal Secretary', 'LGL', 46, 195, 'Colombo', 1, NULL, 'job_images/iiHcEQ0cOdBPbrAsnolhVGy1BTnynpz6UsEumZh7.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:34:44', NULL, 'approved', 'contact_contributor', NULL, 'J100080', 1, '2025-04-08 20:29:56', '2025-05-19 05:31:39', 8, 83),
(446, 'Project Manager', 'Blue Ocean Group of Companies', 12, 96, 'Colombo', 1, NULL, 'job_images/0t6IB0TNG0bHs5Xmt8A0kqpOAFDYbxIoTAzkmw2r.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-08 16:35:27', NULL, 'approved', 'contact_contributor', NULL, 'J100081', 1, '2025-04-08 20:31:39', '2025-05-19 05:37:05', 8, 78),
(447, 'Junior Sales Executive', 'IEBT Campus', 6, 240, 'Mawanella', 1, NULL, 'job_images/BLfemybqwxUnuyw5UJYaz98YsGqzd7pjHWDYmpF7.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:43:17', NULL, 'approved', 'contact_contributor', NULL, 'J100082', 1, '2025-04-09 20:18:42', '2025-05-19 05:34:09', 8, 86),
(448, 'Relationship Manager - Leasing', 'Central Finance', 43, 216, 'Colombo', 1, NULL, 'job_images/gg8xLhoW9lQyl170qwSceuaMfxzVACV8BLA7G5Wq.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:43:29', NULL, 'approved', 'contact_contributor', NULL, 'J100083', 1, '2025-04-09 20:21:58', '2025-05-19 05:46:09', 8, 80),
(449, 'Assistant Store Keeper', 'Abans', 22, 127, 'Seeduwa', 1, NULL, 'job_images/xOH2eVrTMgOrZoYCtzIqkqMKj4XhcRmcUXTgkCVI.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:43:47', NULL, 'approved', 'contact_contributor', NULL, 'J100084', 1, '2025-04-09 20:23:41', '2025-05-19 04:27:14', 8, 93),
(450, 'Assistant Manager', 'Invogage', 1, 79, 'Colombo', 1, NULL, 'job_images/85O6Ehep0rvejYRnziPX0hWk9itBO8MOHXkpOTWq.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:43:58', NULL, 'approved', 'contact_contributor', NULL, 'J100085', 1, '2025-04-09 20:26:55', '2025-05-19 04:54:04', 8, 89),
(451, 'Audit Assistant', 'EMME Security Group', 3, 230, 'Manila', 65, NULL, 'job_images/W7oCOGxUiak4VxNcfjxFodJkphk9SEuzrcYiIL99.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:44:13', NULL, 'approved', 'contact_contributor', NULL, 'J100086', 1, '2025-04-09 20:29:49', '2025-05-19 11:19:35', 8, 84),
(452, 'Anti Money Laundering - Officer', 'Seylan Bank', 3, 232, 'Colombo', 1, NULL, 'job_images/t4wkcbRk1q8vOVCCKKoucgEbERQP5O4kA5UNFxMM.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:44:30', NULL, 'approved', 'contact_contributor', NULL, 'J100087', 1, '2025-04-09 20:33:16', '2025-05-19 19:24:30', 8, 84),
(453, 'Managers', 'ESOFT', 6, 240, 'Colombo', 1, NULL, 'job_images/KAlanSXmbkDTnb6XmbtnbtM5Nk5Ago3KAEYaZAsC.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:44:43', NULL, 'approved', 'contact_contributor', NULL, 'J100088', 1, '2025-04-09 20:34:53', '2025-05-19 06:08:37', 8, 87),
(454, 'Audit Assistant', 'EMME', 3, 229, 'Manila', 65, NULL, 'job_images/pD28MqUAAkNu3pXtF9VEMbrSGZvbnoAHOqb42RI3.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:44:54', NULL, 'approved', 'contact_contributor', NULL, 'J100089', 1, '2025-04-09 20:36:28', '2025-05-19 10:30:37', 8, 71),
(455, 'Chief Accountant', 'No Description', 13, 99, 'Vietnam', 60, NULL, 'job_images/FKBeLhytZaoKCRVc2vM3niNmCOOyQOCAI4WOu0vl.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:45:06', NULL, 'approved', 'contact_contributor', NULL, 'J100090', 1, '2025-04-09 20:38:52', '2025-05-19 06:26:53', 8, 81);
INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(456, 'Chief Accountant', 'No Description', 13, 99, 'Vietnam', 60, NULL, 'job_images/Dk6Pj2FPJIgiX31ml61qjnYjeKFer9T6YB5VNJ7Q.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:45:28', NULL, 'approved', 'contact_contributor', NULL, 'J100091', 1, '2025-04-09 20:38:58', '2025-05-19 06:32:46', 8, 69),
(457, 'Sales Officers', 'ATN Services Pvt Ltd', 4, 235, 'Kelaniya', 1, NULL, 'job_images/X4vK6ZSAeBwySjHRLZkBZ6NN185T0ITMYyUI85jr.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:45:39', NULL, 'approved', 'contact_contributor', NULL, 'J100092', 1, '2025-04-09 20:41:22', '2025-05-19 11:06:20', 8, 75),
(458, 'Sales Executive /Assistant', 'AccSense', 4, 235, 'Nugegoda', 1, NULL, 'job_images/SyZAXHJqloxIlM1gNFqc4kWQzpYTnJ3Z71ckOfOi.jpg', NULL, 27, 1, 1, '2025-05-16', '2025-04-09 16:45:56', NULL, 'approved', 'contact_contributor', NULL, 'J100093', 1, '2025-04-09 20:43:01', '2025-05-20 10:42:12', 8, 79),
(459, 'Digital marketing Specialists', 'Pathway Global Recruitment', 4, 234, 'Dehiwala', 1, NULL, 'job_images/77ug1PqFAJvn25pcpvsjzSpXEPqBET7XU6I1DqBw.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-04-10 15:41:35', NULL, 'approved', 'contact_contributor', NULL, 'J100094', 1, '2025-04-10 19:35:17', '2025-05-19 06:38:03', 8, 85),
(460, 'Guest Relation Officer', 'XGuard', 46, 196, 'Nugegoda', 1, NULL, 'job_images/k68v8kw2hjwyF1EgXvlxMP9W4NxqyyW5yhxQOJkz.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-04-10 15:41:54', NULL, 'approved', 'contact_contributor', NULL, 'J100095', 1, '2025-04-10 19:38:37', '2025-05-19 06:44:16', 8, 72),
(461, 'Postal Officers', 'Romania', 5, 91, 'Romania', 65, NULL, 'job_images/diwJS09yrK6Qklc4qh8kJqU79HGaTaDj5dTwbwHP.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:43:08', NULL, 'approved', 'contact_contributor', NULL, 'J100096', 1, '2025-04-10 19:41:22', '2025-05-19 06:49:51', 8, 94),
(462, 'Nurses', 'New Zealand', 7, 245, 'New Zealand', 18, NULL, 'job_images/JRHtGLYY9P8l3zsgieIDis5NelWpxVJuEQxhl97i.jpg', NULL, 27, 1, 1, '2025-05-10', '2025-04-10 15:53:11', NULL, 'approved', 'contact_contributor', NULL, 'J100097', 1, '2025-04-10 19:44:58', '2025-05-19 07:53:03', 8, 78),
(463, 'Client Relation Executive', 'Wattala', 46, 196, 'Wattala', 1, NULL, 'job_images/vMXCkZWFtF0LLq0LJMCeLtW4dM7Mjp11OzTD3uLw.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:53:26', NULL, 'approved', 'contact_contributor', NULL, 'J100098', 1, '2025-04-10 19:46:32', '2025-05-20 09:32:36', 8, 72),
(464, 'Accounts Executive', 'Metro Lands', 12, 96, 'Nugegoda', 1, NULL, 'job_images/N9TSKyrfgoaERdjJFW54lHP8hT450hAwxLYDGEcZ.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:53:45', NULL, 'approved', 'contact_contributor', NULL, 'J100099', 1, '2025-04-10 19:49:10', '2025-05-19 07:37:31', 8, 79),
(465, 'English Teachers', 'Kandy', 6, 242, 'Kandy', 1, NULL, 'job_images/9fl4yMXwRIPVOmcPaFjnR8rf6hRvjozYnqJzZNie.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:53:57', NULL, 'approved', 'contact_contributor', NULL, 'J100100', 1, '2025-04-10 19:51:04', '2025-05-19 06:11:28', 8, 88),
(466, 'Personal Assistant to CEO', 'SATASME', 46, 195, 'Hanwella', 1, NULL, 'job_images/KPsG2rlTg7wZiUBysgWUukml9GBWr3IH2P3ozNno.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:54:08', NULL, 'approved', 'contact_contributor', NULL, 'J100101', 1, '2025-04-10 19:52:47', '2025-05-19 07:40:35', 8, 76),
(467, 'Marketing Officer', 'Racks Car Wash', 4, 235, 'Jaffna', 1, NULL, 'job_images/GsD57W60SlcPdicqGOXnfYFAObdxOwXgJHR4sdt7.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:58:41', NULL, 'approved', 'contact_contributor', NULL, 'J100102', 1, '2025-04-10 19:56:14', '2025-05-19 13:12:10', 8, 77),
(468, 'Computer Hardware Executive', 'NetCore', 1, 79, 'Nugegoda', 1, NULL, 'job_images/U6Yk1FJU3RqajUM8f1AR5bDpIEzcjr7vyHImbEw2.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 15:59:01', NULL, 'approved', 'contact_contributor', NULL, 'J100103', 1, '2025-04-10 19:58:28', '2025-05-19 07:53:25', 8, 69),
(469, 'Business Development Executive', 'Hilly Spring Water', 36, 168, 'Rathnapura & Colombo', 1, NULL, 'job_images/PW0gXNlLXWADKStckDigFLaVhcGLYV12vWprrQaX.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:09:41', NULL, 'approved', 'contact_contributor', NULL, 'J100104', 1, '2025-04-10 20:02:43', '2025-05-19 07:56:26', 8, 68),
(470, 'Talent Acquisition Executives', 'Superserv', 31, 151, 'Colombo', 1, NULL, 'job_images/avaotALwjVYZkuOMc4nC1U1phc1jg2MN8wjIvtTJ.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:09:52', NULL, 'approved', 'contact_contributor', NULL, 'J100105', 1, '2025-04-10 20:06:24', '2025-05-19 07:59:34', 8, 73),
(471, 'Sales Officers', 'FMCG', 36, 169, 'Western Province', 1, NULL, 'job_images/9UX3Bb9dacoc0YkbsOQ2zvNj3AIOiOx8PQUCmMU4.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:13:40', NULL, 'approved', 'contact_contributor', NULL, 'J100106', 1, '2025-04-10 20:13:30', '2025-05-19 07:43:31', 8, 70),
(472, 'Sales Executive', 'Colombo - Abans', 4, 235, 'Colombo', 1, NULL, 'job_images/ysWcOGi37NsOV7s4Sc0MOZZ1eZ0AendKn2ic2plO.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:16:22', NULL, 'approved', 'contact_contributor', NULL, 'J100107', 1, '2025-04-10 20:16:13', '2025-05-19 08:09:03', 8, 93),
(473, 'Marketing Executives', 'Truvicconsumer', 7, 246, 'Colombo', 1, NULL, 'job_images/DMWufYLwK3XdkEpIWfjBBmsfNx5mc4z8TobAZNDH.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:21:56', NULL, 'approved', 'contact_contributor', NULL, 'J100108', 1, '2025-04-10 20:19:48', '2025-05-19 10:09:24', 8, 67),
(474, 'Accountant', 'Lanka Talents', 8, 74, 'Colombo', 1, NULL, 'job_images/TDJIUz2AthJUzfAzmVhiQhCIuQW5pu6HSaIPCJHY.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:22:05', NULL, 'approved', 'contact_contributor', NULL, 'J100109', 1, '2025-04-10 20:21:47', '2025-05-20 08:55:33', 8, 73),
(475, 'Business Development Executive - Japanies', 'PrimeHope', 21, 122, 'Colombo', 1, NULL, 'job_images/gY3zVRwVIyhfPYK5CMuxWvQN0sbSRyGn8rwTgR9J.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:25:32', NULL, 'approved', 'contact_contributor', NULL, 'J100110', 1, '2025-04-10 20:25:10', '2025-05-19 10:36:58', 8, 62),
(476, 'Executive - Cyber Security', 'PrideSyS', 19, 269, 'Dhaka', 13, NULL, 'job_images/RFfb5ZTn6VBCVDLIMLa5rjifR0T47mNT45s0EDSr.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-10 16:28:54', NULL, 'approved', 'contact_contributor', NULL, 'J100111', 1, '2025-04-10 20:28:35', '2025-05-20 02:25:00', 8, 83),
(477, 'Sales Executive', 'Upali Arts & Advertising', 4, 235, 'Kirindiwela', 1, NULL, 'job_images/Nnb4375k6i3rRsKTTsXrhbOFoVbHSwCvX7LUVw4n.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:16:56', NULL, 'approved', 'contact_contributor', NULL, 'J100112', 1, '2025-04-11 20:56:03', '2025-05-20 08:54:34', 8, 69),
(478, 'Junior Sales Executive', 'IEBT Campus', 6, 240, 'Mawanella', 1, NULL, 'job_images/BJjusxLgt9fJOadtlw02HVCXGDsxcZJjM997YdeK.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:17:07', NULL, 'approved', 'contact_contributor', NULL, 'J100113', 1, '2025-04-11 20:57:59', '2025-05-19 20:51:14', 8, 74),
(479, 'Managers', 'Colombo - Nugegoda', 46, 195, 'Colombo', 1, NULL, 'job_images/Ft0DVXpk8W9AbJUKsvzX3oBldm85bqrR2THhihNB.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:17:20', NULL, 'approved', 'contact_contributor', NULL, 'J100114', 1, '2025-04-11 20:59:42', '2025-05-19 20:57:52', 8, 64),
(480, 'Administrative Assistant', 'Royal Flour Mills', 36, 167, 'Jaffna', 1, NULL, 'job_images/itqIf0PAs58LmyGFgFBKfqTXTQf9YffMGUGuyroH.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:17:34', NULL, 'approved', 'contact_contributor', NULL, 'J100115', 1, '2025-04-11 21:02:43', '2025-05-19 03:54:33', 8, 75),
(481, 'Recruitment Consultants', 'Pathway Global', 8, 74, 'Mount Lavinia', 1, NULL, 'job_images/CUCkjiZe3XU3Of0aSJfH21FXRaP7vnQ0r53gOjMe.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:17:47', NULL, 'approved', 'contact_contributor', NULL, 'J100116', 1, '2025-04-11 21:05:16', '2025-05-19 21:28:32', 8, 63),
(482, 'Web Developer - Trainee', 'Shraddha Media Network', 1, 78, 'Kaduwela', 1, NULL, 'job_images/7YuVe2xh5jvuz5FM2CqoX66esWhGKezWhV8h0okF.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:18:00', NULL, 'approved', 'contact_contributor', NULL, 'J100117', 1, '2025-04-11 21:07:44', '2025-05-19 21:41:41', 8, 107),
(483, 'Accounting Executive', 'Rainbow Global Education', 6, 240, 'Battaramulla', 1, NULL, 'job_images/K48evC3weschES3uoYW7LGsAFPIzjAId7ilx28Vb.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:18:10', NULL, 'approved', 'contact_contributor', NULL, 'J100118', 1, '2025-04-11 21:09:50', '2025-05-20 01:48:06', 8, 73),
(484, 'Factory manager/Accountant', 'SHS International Pvt Ltd', 3, 229, 'Piliyandala', 1, NULL, 'job_images/ZB3Ol6PWfiw0A6IUufxIhySiwxBAYYdBb6vNAeoT.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:18:21', NULL, 'approved', 'contact_contributor', NULL, 'J100119', 1, '2025-04-11 21:12:12', '2025-05-19 22:11:06', 8, 82),
(485, 'Graduate trainees', 'Total Energies', 28, 141, 'Suva- Fiji', 37, NULL, 'job_images/44l55docLF3YMA3Y5qLxfMHIHtKaaIjSjm4AkR0p.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:18:32', NULL, 'approved', 'contact_contributor', NULL, 'J100120', 1, '2025-04-11 21:14:51', '2025-05-19 22:13:26', 8, 84),
(486, 'Store Assistants', 'No Description', 3, 233, 'Colombo', 1, NULL, 'job_images/IXghzDz1MpbWMbhAb0fTXMy5UiZMxRDuj7Z9ZxZO.jpg', NULL, 27, 1, 1, '2025-05-18', '2025-04-11 17:18:45', NULL, 'approved', 'contact_contributor', NULL, 'J100121', 1, '2025-04-11 21:16:40', '2025-05-19 22:15:35', 8, 87),
(487, 'Office Cordinator', 'Malabe', 3, 229, 'Malabe', 1, NULL, 'job_images/QRHLdTmJKrOUBZys2i5YtIYGPynbfBjlGGNe9cPi.jpg', NULL, 34, 1, NULL, '2025-05-22', '2025-04-15 09:39:22', NULL, 'approved', 'contact_contributor', NULL, 'J100122', 1, '2025-04-15 13:39:02', '2025-05-20 08:01:37', 8, 86),
(488, 'Assistant Manager - Risk Management', 'Ceylinco Life Insurance Limited', 23, 133, 'Colombo', 1, NULL, 'job_images/qURZbhPlAQW0Dtcem1HkGxGk4E6XWD5RRuVUS0oW.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-15 10:01:03', NULL, 'approved', 'contact_contributor', NULL, 'J100123', 1, '2025-04-15 13:49:21', '2025-05-19 19:22:38', 8, 65),
(489, 'Assistant Manager - Compliance', 'Ceylinco Life Insurance', 23, 133, 'Colombo', 1, NULL, 'job_images/Q3ZAhP1G8DIFQbo898MQfdMhUfWmemCuLTnsfN9L.jpg', NULL, 27, 1, 1, '2025-05-22', '2025-04-15 10:01:30', NULL, 'approved', 'contact_contributor', NULL, 'J100124', 1, '2025-04-15 13:50:54', '2025-05-19 19:23:05', 8, 61),
(490, 'Student Affairs Officer', 'IDMNC International', 6, 240, 'Vauniya', 1, NULL, 'job_images/rRibM2MoTOJvcmwurhWRQmGvyMEOIfzTWQpXouEO.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-15 10:01:57', NULL, 'approved', 'contact_contributor', NULL, 'J100125', 1, '2025-04-15 13:53:51', '2025-05-20 08:02:37', 8, 61),
(491, 'Graphic Designer', 'Gampaha - Female', 1, 79, 'Gampaha', 1, NULL, 'job_images/Z4H1jhBN0cjX6gaQ1g8cTbmLPQycqVZsPMMgQydB.jpg', NULL, 27, 1, 1, '2025-05-22', '2025-04-15 10:02:25', NULL, 'approved', 'contact_contributor', NULL, 'J100126', 1, '2025-04-15 13:56:28', '2025-05-19 22:46:00', 8, 63),
(492, 'IT Hardware Technician', 'Abans', 1, 77, 'Colombo', 1, NULL, 'job_images/mmdcnau78HgnB0C5ud0p5EMBLt0ulncy1bk1mh6w.jpg', NULL, 27, 1, 1, '2025-05-15', '2025-04-15 10:02:46', NULL, 'approved', 'contact_contributor', NULL, 'J100127', 1, '2025-04-15 13:58:23', '2025-05-20 10:00:41', 8, 66),
(493, 'Branch manager/ Ass. Manager & Executives', 'Asian Trust Pvt Ltd', 43, 214, 'Colombo', 1, NULL, 'job_images/qqAIIzzL1m3od6x99zQS2txBWGiUxaDRQGyymycd.jpg', NULL, 27, 1, 1, '2025-05-22', '2025-04-15 10:03:04', NULL, 'approved', 'contact_contributor', NULL, 'J100128', 1, '2025-04-15 14:00:38', '2025-05-20 09:41:07', 8, 62),
(494, 'Production Engineer', 'Sukkur Beverage', 31, 152, 'Sukkur', 65, NULL, 'job_images/h8NnhAekVIWjBmISeDK3iWSUoJDvLmC6Z8thj0Db.jpg', NULL, 27, 1, 1, '2025-04-30', '2025-04-15 10:09:30', NULL, 'approved', 'contact_contributor', NULL, 'J100129', 1, '2025-04-15 14:09:20', '2025-05-19 10:55:12', 8, 77),
(495, 'Front Desk Officer Receptionist', 'Doctor GSM', 46, 195, 'Colombo', 1, NULL, 'job_images/yas0Ho8d8fO37emiZcWBFBQimedd0UTXtCi3ittR.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:53:44', NULL, 'approved', 'contact_contributor', NULL, 'J100130', 1, '2025-04-16 18:37:47', '2025-05-20 05:53:40', 8, 86),
(496, 'Office Coordinator', 'TG Water Technologies Pvt Ltd', 1, 80, 'Malabe', 1, NULL, 'job_images/KDLsfmpPlAOZDoBPd1IkqrkSkewmk07PnajWOFqd.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:53:55', NULL, 'approved', 'contact_contributor', NULL, 'J100131', 1, '2025-04-16 18:40:22', '2025-05-19 18:58:56', 8, 97),
(497, 'Graphic Designer', 'Central Finance', 15, 106, 'Colombo', 1, NULL, 'job_images/R06IheV0AVJLBKV90whPWLsZRSzf0iuhB2czCc9C.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:54:08', NULL, 'approved', 'contact_contributor', NULL, 'J100132', 1, '2025-04-16 18:43:06', '2025-05-19 19:17:31', 8, 74),
(498, 'Management Trainee', 'Katmandu', 21, 122, 'Colombo', 1, NULL, 'job_images/AYI9KX1p61IwGu267DbdrQLq3IZNUC8dwip0FRFo.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:54:18', NULL, 'approved', 'contact_contributor', NULL, 'J100133', 1, '2025-04-16 18:45:16', '2025-05-20 10:40:51', 8, 75),
(499, 'Mechanical Field Draftsman', 'Abans', 2, 224, 'Colombo', 1, NULL, 'job_images/jgjxxpcjP1yKP4iA48rg9fbK9cecj0vPshsnc5IP.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:54:30', NULL, 'approved', 'contact_contributor', NULL, 'J100134', 1, '2025-04-16 18:49:15', '2025-05-20 09:41:41', 8, 71),
(500, 'Battery Manufacturing Team', 'Avaada Group - India', 35, 165, 'India', 3, NULL, 'job_images/WK7tJmIio3Kb3kGG5aLajItuqPVAgEZXfVIv7Aoj.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:54:43', NULL, 'approved', 'contact_contributor', NULL, 'J100135', 1, '2025-04-16 18:53:13', '2025-05-20 10:39:25', 8, 64),
(501, 'Head of Logistic & Supply Chain', 'Zentrofly', 11, 255, 'Colombo', 1, NULL, 'job_images/vk8mevLE9aEwkyT3IsFRa0S1rqkXzDoZjwLjizRO.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:59:20', NULL, 'approved', 'contact_contributor', NULL, 'J100136', 1, '2025-04-16 18:57:05', '2025-05-19 17:32:39', 8, 68),
(502, 'Accounts Assistant', 'Royal Mills Flour', 3, 229, 'Jaffna', 1, NULL, 'job_images/YamCFdbYn9vJctJVIR9MyHh2fFoQCJxAjW6yeivR.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 14:59:32', NULL, 'approved', 'contact_contributor', NULL, 'J100137', 1, '2025-04-16 18:59:08', '2025-05-20 07:12:46', 8, 83),
(503, 'Driver to CEO', 'Botswana', 46, 196, 'Botswana', 16, NULL, 'job_images/JN91ZtGMByhzCyPEMnP1U5MfQ2HlHarPVDCzNGLi.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:02:34', NULL, 'approved', 'contact_contributor', NULL, 'J100138', 1, '2025-04-16 19:02:21', '2025-05-20 07:40:41', 8, 73),
(504, 'Administrative Assistant', 'Zentrofly', 46, 195, 'Botswana', 16, NULL, 'job_images/xFtiaPHsd0FAfPbVdvK4weGY5SKeqiewgBGRmGxC.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:19:36', NULL, 'approved', 'contact_contributor', NULL, 'J100139', 1, '2025-04-16 19:04:39', '2025-05-19 12:45:36', 8, 69),
(505, 'Store Manager', 'Jel Home', 11, 257, 'Botswana', 16, NULL, 'job_images/oHkMKWoXtaA1wmMuROhHUHFHYnNjfJbubC8Sfafm.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:19:48', NULL, 'approved', 'contact_contributor', NULL, 'J100140', 1, '2025-04-16 19:06:00', '2025-05-20 08:03:24', 8, 62),
(506, 'Business Administrator Trainees', 'Zentrofly', 46, 195, 'Botswana', 16, NULL, 'job_images/4QShkdGAmFf7NOPfexaOb1wHWGGoYU4GnFBCJVZT.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:20:03', NULL, 'approved', 'contact_contributor', NULL, 'J100141', 1, '2025-04-16 19:07:35', '2025-05-18 19:26:19', 8, 66),
(507, 'Trainee Diamond Polisher', 'Botswana', 29, 260, 'Botswana', 16, NULL, 'job_images/QlQGFvKEjtYNmPFqDGmO7p3wAf8cAdo9VnoEMmfz.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:20:20', NULL, 'approved', 'contact_contributor', NULL, 'J100142', 1, '2025-04-16 19:11:37', '2025-05-19 06:50:18', 8, 54),
(508, 'Contract Officer - Supply Chain', 'Botswana', 11, 255, 'Botswana', 16, NULL, 'job_images/bVLIkuaVA0iyKGRd4tbwtBa0wSLu1pxiQK0o9QfE.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:20:31', NULL, 'approved', 'contact_contributor', NULL, 'J100143', 1, '2025-04-16 19:13:08', '2025-05-18 11:13:14', 8, 60),
(509, 'Rolling Mill Fitter', 'Botswana - RINO STEEL', 50, 287, 'Botswana', 16, NULL, 'job_images/BzHiLLpF7CWcWlCDyvGo5pVdKiuSMCHt7XhpogXK.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:20:43', NULL, 'approved', 'contact_contributor', NULL, 'J100144', 1, '2025-04-16 19:14:58', '2025-05-19 20:38:04', 8, 55),
(510, 'Capital Accountant', 'KHOEMACAU - Copper Mining', 3, 229, 'Botswana', 16, NULL, 'job_images/Qzeqx35Qwx8QZtUuhbo3rgoa49CxKomu4wprOoYv.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:20:54', NULL, 'approved', 'contact_contributor', NULL, 'J100145', 1, '2025-04-16 19:17:06', '2025-05-18 12:18:09', 8, 51),
(511, 'Executive Quality Assurance', 'MAS Active', 44, 193, 'Embilipitiya', 1, NULL, 'job_images/eInfUxTajYAxTf4bCULBTpHI9FVvTbeCsKjnbOzv.jpg', NULL, 27, 1, 1, '2025-05-23', '2025-04-16 15:21:04', NULL, 'approved', 'contact_contributor', NULL, 'J100146', 1, '2025-04-16 19:19:20', '2025-05-19 17:00:38', 8, 64),
(512, 'Business Development Executive', 'Prime Hope Ltd', 6, 244, 'Colombo', 1, NULL, 'job_images/v9fkISRiyzcVSnxNmNDjxd39elCyQU7QJkZjqNLM.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 03:37:40', NULL, 'approved', 'contact_contributor', NULL, 'J100147', 1, '2025-04-17 07:37:22', '2025-05-19 06:50:24', 8, 50),
(513, 'Senior Executive - Industrial Engineering', 'MAS Active', 44, 189, 'Embilipitiya', 1, NULL, 'job_images/0sVKwizLnh9br2x8V5ZUVmGr2JbE5ADEcXNXkizN.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 03:40:04', NULL, 'approved', 'contact_contributor', NULL, 'J100148', 1, '2025-04-17 07:39:46', '2025-05-20 02:33:25', 8, 60),
(514, 'Sales Executive', 'Lanka Talent - Kadawatha', 7, 246, 'Kadawatha', 1, NULL, 'job_images/9zutGHrp3cxgKGi7xWCqZMCOqC9JqPgcX1VU5P5Y.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:08:03', NULL, 'approved', 'contact_contributor', NULL, 'J100149', 1, '2025-04-17 07:56:39', '2025-05-20 08:04:40', 8, 57),
(515, 'Video Editor & Social Media Admin', 'StarEvents', 1, 80, 'Online', 1, NULL, 'job_images/sB3Oy7ZYWd1tRgYbolByzqJpyS2eaXetabxB6Sx7.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:08:17', NULL, 'approved', 'contact_contributor', NULL, 'J100150', 1, '2025-04-17 07:59:36', '2025-05-19 19:06:26', 8, 68),
(516, 'Executive Assistant to Country Manager', 'DHL - Fiji', 11, 254, 'Fiji', 37, NULL, 'job_images/QCbyJQpCVXe6vclwGWEzSPhGFEakSKuBHx9TPk8x.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:08:38', NULL, 'approved', 'contact_contributor', NULL, 'J100151', 1, '2025-04-17 08:01:31', '2025-05-19 17:42:21', 8, 60),
(517, 'Finance Manager', 'Kuwait - Restaurant', 13, 99, 'Kuwait', 45, NULL, 'job_images/TIUnVIKF7bVkQfWITyffzzCCEeZBpmZOYs9xdHCL.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:08:51', NULL, 'approved', 'contact_contributor', NULL, 'J100152', 1, '2025-04-17 08:04:03', '2025-05-19 06:50:36', 8, 62),
(518, 'Restaurant Manager & Trainees', 'Fab', 13, 99, 'Colombo', 1, NULL, 'job_images/0d5W2xrMiJvpvTfohvHVUYcN1vmkM8yU99RczRRq.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:09:04', NULL, 'approved', 'contact_contributor', NULL, 'J100153', 1, '2025-04-17 08:06:05', '2025-05-20 10:09:45', 8, 74),
(519, 'HR Manager', 'QS4QS', 8, 74, 'Colombo', 1, NULL, 'job_images/YgpLYGhcqJXjtrWEBUqZiJJg8W4ou8JUx8kHs9VG.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:09:15', NULL, 'approved', 'contact_contributor', NULL, 'J100154', 1, '2025-04-17 08:07:49', '2025-05-20 08:45:14', 8, 78),
(520, 'Jr Business Consultant', 'Pridesys', 21, 122, 'Colombo', 1, NULL, 'job_images/BVx9vnhNziCaFR316KGT38TD381g0EXEJkpVMOCg.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:13:36', NULL, 'approved', 'contact_contributor', NULL, 'J100155', 1, '2025-04-17 08:11:20', '2025-05-19 17:42:52', 8, 50),
(521, 'Finance Consultant - Freelance', 'Lanka Talents', 14, 102, 'Colombo', 1, NULL, 'job_images/kqlOgOoP0vb1TVO575tOPJ5AvGjJv7Ak0zcAlBm1.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:13:53', NULL, 'approved', 'contact_contributor', NULL, 'J100156', 1, '2025-04-17 08:13:18', '2025-05-19 18:35:41', 8, 83),
(522, 'Area Sales Executive - Channels', 'Ceedecs Lanka Holdings Pvt Ltd', 4, 235, 'Kadawatha', 1, NULL, 'job_images/QwL5fTkVxwMv2Q5hRWktVCkisTla00KIFoaiZdJQ.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:27:35', NULL, 'approved', 'contact_contributor', NULL, 'J100157', 1, '2025-04-17 08:21:26', '2025-05-19 12:52:27', 8, 57),
(523, 'Investigation and Admin Officer', 'Bellagio limited', 46, 196, 'Colombo', 1, NULL, 'job_images/1vxyJcckbtuHC9hPcHS86Zp6jAUAxzDpvlPpAgA2.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:27:48', NULL, 'approved', 'contact_contributor', NULL, 'J100158', 1, '2025-04-17 08:23:42', '2025-05-19 18:27:01', 8, 72),
(524, 'Executive Client Management', 'WESTFORD', 46, 195, 'Foreign Jobs', 65, NULL, 'job_images/WBCsB9pZ9SsJVEYjuneJlDhmMnn6IF8lAwieZLIW.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:28:01', NULL, 'approved', 'contact_contributor', NULL, 'J100159', 1, '2025-04-17 08:27:14', '2025-05-20 10:38:04', 8, 66),
(525, 'Finance & Accounting Officer', 'No Description', 3, 229, 'Philippine', 55, NULL, 'job_images/E9XRtdwmtAZCUDjbT5SIjH7vSbs0x9HOmBNmTEyq.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:32:57', NULL, 'approved', 'contact_contributor', NULL, 'J100160', 1, '2025-04-17 08:32:41', '2025-05-19 11:20:23', 8, 64),
(526, 'Executive Client Services', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/d1rFrnIfDbx5uNPqE6vLgDdVCV9yUVwI3bX24nca.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:38:17', NULL, 'approved', 'contact_contributor', NULL, 'J100161', 1, '2025-04-17 08:34:26', '2025-05-19 17:04:43', 8, 58),
(527, 'Learning & Development Officer', 'Read Foundation', 6, 240, 'Colombo', 1, NULL, 'job_images/BBjvMfinsGYcG5H7VUpF8xtlfvV07v1zhEQJxkUE.jpg', NULL, 27, 1, 1, '2025-05-17', '2025-04-17 04:38:32', NULL, 'approved', 'contact_contributor', NULL, 'J100162', 1, '2025-04-17 08:37:50', '2025-05-20 08:00:41', 8, 65),
(528, 'Head of HR & Customer Relationship Management', 'NKAR Travels & Tours Pvt Ltd', 13, 100, 'Colombo', 1, NULL, 'job_images/HLBX1dFWEBiNys6zyfWDFLKgE2NC7HuWuMpGWdwN.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:41:36', NULL, 'approved', 'contact_contributor', NULL, 'J100163', 1, '2025-04-17 08:41:13', '2025-05-19 10:14:20', 8, 57),
(529, 'Resort Jobs - Dubai', 'Seyahi Beach Resorts - Dubai', 13, 99, 'Dubai', 6, NULL, 'job_images/cctGNtBj2yY7nrHCbStWr6G9cFBazyqlZUt8WXXN.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:50:28', NULL, 'approved', 'contact_contributor', NULL, 'J100164', 1, '2025-04-17 08:43:56', '2025-05-19 21:10:25', 8, 82),
(530, 'Junior Video Editor', 'BusinessBoosterLK', 10, 250, 'Colombo', 1, NULL, 'job_images/QC0fuGCL3egwQYYJs3KrfsLhEhTWSE7COGQ2t4Qw.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:50:47', NULL, 'approved', 'contact_contributor', NULL, 'J100165', 1, '2025-04-17 08:46:14', '2025-05-20 05:36:59', 8, 74),
(531, 'Tele Sales Executive', 'First Notch Solutions', 4, 235, 'Colombo', 1, NULL, 'job_images/dj21YBGACEvGXUXFnyDxgRL3lG0dMEbQbH0f7fm7.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:51:11', NULL, 'approved', 'contact_contributor', NULL, 'J100166', 1, '2025-04-17 08:47:58', '2025-05-18 19:14:51', 8, 50),
(532, 'Visual Merchandisers', 'Tappo Group', 4, 235, 'Fiji', 37, NULL, 'job_images/pci0MzCYUzec9O5v9DuDVxfBZuJjEyTMp2BNyxSs.jpg', NULL, 27, 1, 1, '2025-05-24', '2025-04-17 04:51:29', NULL, 'approved', 'contact_contributor', NULL, 'J100167', 1, '2025-04-17 08:49:59', '2025-05-18 19:20:51', 8, 53),
(533, 'Accountant', 'Smart Quest', 3, 229, 'Kuliyapitiya', 1, NULL, 'job_images/iASRhE2CfKQpqTF1k4r0tMQT0R8YtfZLNeUYwVrC.jpg', NULL, 37, 1, NULL, '2025-05-27', '2025-04-20 16:23:02', NULL, 'approved', 'contact_contributor', NULL, 'J100168', 1, '2025-04-20 20:22:33', '2025-05-20 05:03:31', 8, 68),
(534, 'Costing Analysts', 'Smart Quest', 3, 229, 'Colombo', 1, NULL, 'job_images/vuDHdjtFDID21PVG7NYGH1RhNjeQDUZlLdMrEJ8F.jpg', NULL, 37, 1, NULL, '2025-05-27', '2025-04-20 16:25:24', NULL, 'approved', 'contact_contributor', NULL, 'J100169', 1, '2025-04-20 20:25:00', '2025-05-19 22:44:45', 8, 59),
(535, 'HR Assistant', 'New Philip Hospitals Pvt Ltd', 7, 245, 'Kalutara', 1, NULL, 'job_images/5foLdZERAB4Wpusp6r4aFhzkONtkl9dOqH9nONZi.jpg', NULL, 37, 1, NULL, '2025-05-27', '2025-04-20 16:27:42', NULL, 'approved', 'contact_contributor', NULL, 'J100170', 1, '2025-04-20 20:27:25', '2025-05-20 08:04:52', 8, 60),
(536, 'Assistant Director Sales', 'NHI LETHUC', 13, 99, 'Viet Nam', 60, NULL, 'job_images/qVSXuQco7mjoo3Wb7ZRgkD1HkRUINgmlXSUyA92i.jpg', NULL, 27, 1, 1, '2025-05-27', '2025-04-20 16:33:51', NULL, 'approved', 'contact_contributor', NULL, 'J100171', 1, '2025-04-20 20:33:39', '2025-05-19 17:45:38', 8, 60),
(537, 'Head of Operation', 'Aus Talent Network', 44, 193, 'Sri Lanka', 1, NULL, 'job_images/ZmICw7dITeb3vMyNasVnVrfR4H2yo7aykyIANyKu.jpg', NULL, 38, 1, NULL, '2025-05-27', '2025-04-20 16:39:30', NULL, 'approved', 'contact_contributor', NULL, 'J100172', 1, '2025-04-20 20:39:06', '2025-05-20 10:33:51', 8, 52),
(538, 'Senior Sales Executive', 'Juniper', 4, 235, 'Colombo 7', 1, NULL, 'job_images/Twdzt66x4ON1NIKYIxSSG14pdLn7kHcAGbmbUPpP.jpg', NULL, 39, 1, NULL, '2025-05-28', '2025-04-21 15:34:10', NULL, 'approved', 'contact_contributor', NULL, 'J100173', 1, '2025-04-21 19:32:50', '2025-05-19 13:12:27', 8, 41),
(539, 'Assistant Manager', 'Lanka Talents', 8, 74, 'Colombo', 1, NULL, 'job_images/I9CpfjBgmPnLRnm90QoX3wxv0Q331K3XfxzyAYxS.jpg', NULL, 40, 1, NULL, '2025-05-28', '2025-04-21 15:44:16', NULL, 'approved', 'contact_contributor', NULL, 'J100174', 1, '2025-04-21 19:41:01', '2025-05-20 06:57:11', 8, 54),
(540, 'Sales Executive', 'Lanka Talents', 4, 235, 'Colombo', 1, NULL, 'job_images/Bxt4IJn0RGMKnOCLsoigE3enX3S7RVQDe91dRDYK.jpg', NULL, 40, 1, NULL, '2025-05-28', '2025-04-21 15:44:47', NULL, 'approved', 'contact_contributor', NULL, 'J100175', 1, '2025-04-21 19:43:03', '2025-05-19 07:06:52', 8, 49),
(541, 'Executive Assistant to Group CEO', 'CJ Patel Group', 21, 122, 'Foreign Jobs', 65, NULL, 'job_images/ooOSfpKMevVVIo7fgViM85Sn1kOhJOzRZSu0hxUx.jpg', NULL, 41, 1, NULL, '2025-05-28', '2025-04-21 15:52:53', NULL, 'approved', 'contact_contributor', NULL, 'J100176', 1, '2025-04-21 19:52:19', '2025-05-19 17:47:48', 8, 43),
(542, 'Accountant', 'Credit Corporation', 3, 229, 'Colombo', 1, NULL, 'job_images/gKqlM8aKnKaSLgRKRA6ia4sOg5V60Y9SeTzCbxsF.jpg', NULL, 42, 1, NULL, '2025-05-28', '2025-04-21 15:59:16', NULL, 'approved', 'contact_contributor', NULL, 'J100177', 1, '2025-04-21 19:58:40', '2025-05-19 19:11:01', 8, 48),
(543, 'Team Lead - Market Operation', 'Fiji Capital Markets', 24, 130, 'Foreign Jobs', 37, NULL, 'job_images/BffZnlYDp7O33HX3tKyWOjbAeKhRKRz7PJV8bBp6.jpg', NULL, 43, 1, NULL, '2025-05-28', '2025-04-21 16:10:28', NULL, 'approved', 'contact_contributor', NULL, 'J100178', 1, '2025-04-21 20:09:55', '2025-05-19 19:21:41', 8, 52),
(544, 'Sales & Store Assistant', 'Arora.lk', 4, 235, 'Ratmalana', 1, NULL, 'job_images/lr959Bb4sydWqv64jOmY8eKTsXHcQiHEPp6sy6Fe.jpg', NULL, 44, 1, NULL, '2025-05-28', '2025-04-21 16:15:21', NULL, 'approved', 'contact_contributor', NULL, 'J100179', 1, '2025-04-21 20:14:43', '2025-05-20 08:48:36', 8, 41),
(545, 'Manager People & Capabilities', 'Pacific Fishing Company', 36, 167, 'Colombo', 1, NULL, 'job_images/mSE6pRwksadumbWxU6qkJ7iJEe3OuvvPuX7jbb5G.jpg', NULL, 45, 1, NULL, '2025-05-28', '2025-04-21 16:30:23', NULL, 'approved', 'contact_contributor', NULL, 'J100180', 1, '2025-04-21 20:24:37', '2025-05-19 17:48:21', 8, 44),
(546, 'Internal Audit Supervisor', 'Tappoo Pte Ltd', 3, 229, 'Suva', 65, NULL, 'job_images/Jogv4MkoyF5nEB5XQ2KOWHya2b4fp3E7ncuyUDNZ.jpg', NULL, 45, 1, NULL, '2025-05-28', '2025-04-21 16:30:54', NULL, 'approved', 'contact_contributor', NULL, 'J100181', 1, '2025-04-21 20:27:51', '2025-05-19 01:17:18', 8, 42),
(547, 'Operations Coordinator', 'Tour Managers - Fiji', 13, 100, 'Fiji', 37, NULL, 'job_images/cZMj6not1E9hBleqQKSYkpmife3C3f2zK6vdnd3E.jpg', NULL, 45, 1, NULL, '2025-05-28', '2025-04-21 16:31:13', NULL, 'approved', 'contact_contributor', NULL, 'J100182', 1, '2025-04-21 20:30:00', '2025-05-19 20:42:32', 8, 56),
(548, 'General Manager', 'Kuwait', 13, 99, 'Kuwait', 45, NULL, 'job_images/nyQLxl2OB8myLEY4V0bfRcnObYRHG8w8QEFoLi5j.jpg', NULL, 46, 1, NULL, '2025-05-28', '2025-04-21 16:39:21', NULL, 'approved', 'contact_contributor', NULL, 'J100183', 1, '2025-04-21 20:36:37', '2025-05-19 17:48:37', 8, 40),
(549, 'WareHouse Clerks', 'Fiji', 13, 99, 'Fiji', 37, NULL, 'job_images/VBNuJE1iFor9SLNGTBheHKvVJDmDMKzgS4036rWP.jpg', NULL, 46, 1, NULL, '2025-05-28', '2025-04-21 16:39:40', NULL, 'approved', 'contact_contributor', NULL, 'J100184', 1, '2025-04-21 20:38:34', '2025-05-19 13:54:49', 8, 51),
(550, 'WareHouse Clerks', 'Fiji', 13, 99, 'Fiji', 37, NULL, 'job_images/em0uGmMtdImHX4YSmChnKsXeABPvXZOAaYVfxRET.jpg', NULL, 46, 1, NULL, '2025-05-28', '2025-04-21 16:40:07', NULL, 'approved', 'contact_contributor', NULL, 'J100185', 1, '2025-04-21 20:38:44', '2025-05-19 09:20:58', 8, 53),
(551, 'Customer Care Executives', 'Iphonik', 4, 238, 'Colombo', 1, NULL, 'job_images/z8EdrlTNkppbIqdeIjt5mha5O1Qih06zbPDDkXK4.jpg', NULL, 47, 1, NULL, '2025-05-29', '2025-04-22 15:39:29', NULL, 'approved', 'contact_contributor', NULL, 'J100186', 1, '2025-04-22 19:35:38', '2025-05-20 08:05:45', 8, 53),
(552, 'Sales Manager', 'Iphonik', 4, 235, 'Colombo', 1, NULL, 'job_images/nAozl0PEeiyMaCsDHajLg3FavBbClEN63EsDhAUu.jpg', NULL, 47, 1, NULL, '2025-05-29', '2025-04-22 15:39:50', NULL, 'approved', 'contact_contributor', NULL, 'J100187', 1, '2025-04-22 19:37:51', '2025-05-20 06:08:41', 8, 53),
(553, 'Senior Finance Manager', 'UB Finance PLC', 3, 229, 'Colombo', 1, NULL, 'job_images/hchjgg8gZ1ZeFXhGRBblaY9JBvVNFuMCvcxWCI2r.jpg', NULL, 48, 1, NULL, '2025-05-29', '2025-04-22 15:45:08', NULL, 'approved', 'contact_contributor', NULL, 'J100188', 1, '2025-04-22 19:44:13', '2025-05-20 03:48:12', 8, 36),
(554, 'English Teachers', 'British Way English Academy', 6, 241, 'Galle', 1, NULL, 'job_images/ZRjCqgvf3cmzavrziFo7l4eQjbGsqQn2nDMhGD8M.jpg', NULL, 48, 1, NULL, '2025-05-29', '2025-04-22 15:53:49', NULL, 'approved', 'contact_contributor', NULL, 'J100189', 1, '2025-04-22 19:50:24', '2025-05-20 06:52:20', 8, 50),
(555, 'Digital Marketing Executive', 'Alchemy', 4, 234, 'Colombo', 1, NULL, 'job_images/mPCTyP7WFa5Adg7PqUHnB5S7R5MAWDtx0V0vD915.jpg', NULL, 27, 1, 1, '2025-05-29', '2025-04-22 15:54:05', NULL, 'approved', 'contact_contributor', NULL, 'J100190', 1, '2025-04-22 19:53:26', '2025-05-18 07:13:53', 8, 46),
(556, 'Sales Associates', 'Elya.lk - Colombo', 4, 238, 'Colombo', 1, NULL, 'job_images/VcalGKecT0pOsJ6jdLThIEyXkk7wprqhjcPvZFtc.jpg', NULL, 49, 1, NULL, '2025-05-29', '2025-04-22 15:59:42', NULL, 'approved', 'contact_contributor', NULL, 'J100191', 1, '2025-04-22 19:58:52', '2025-05-20 08:48:54', 8, 55),
(557, 'Senior Manager - Academic Affairs', 'SLIIT', 6, 243, 'Colombo', 1, NULL, 'job_images/trCbPrnRreVklbqYLnrArbd5skCJZrL2shSAsb6i.jpg', NULL, 50, 1, NULL, '2025-05-29', '2025-04-22 16:16:16', NULL, 'approved', 'contact_contributor', NULL, 'J100192', 1, '2025-04-22 20:11:45', '2025-05-20 03:31:34', 8, 43),
(558, 'Management Associate Faculty of Engineering', 'SLIIT', 6, 243, 'Colombo', 1, NULL, 'job_images/aoFp25dwosrg7MwL8i6NUujjL7z1AifWvnmrSZ64.jpg', NULL, 50, 1, NULL, '2025-05-29', '2025-04-22 16:17:06', NULL, 'approved', 'contact_contributor', NULL, 'J100193', 1, '2025-04-22 20:15:39', '2025-05-20 03:32:39', 8, 42),
(559, 'Assistant Manager Branding', 'SLIIT', 6, 243, 'Colombo', 1, NULL, 'job_images/ZtIrvv0ZhlX0Hsj0q28Xni9Ug3XWkyGkV48GhzFS.jpg', NULL, 50, 1, NULL, '2025-05-29', '2025-04-22 16:27:53', NULL, 'approved', 'contact_contributor', NULL, 'J100194', 1, '2025-04-22 20:25:08', '2025-05-20 03:38:19', 8, 44),
(560, 'Manager Finance & Operation', 'David Pieris', 3, 229, 'Colombo', 1, NULL, 'job_images/kMMmE636qK5yT4YvmVubotXP6ronf7HtHmKPT3yB.jpg', NULL, 51, 1, NULL, '2025-05-29', '2025-04-22 16:45:28', NULL, 'approved', 'contact_contributor', NULL, 'J100195', 1, '2025-04-22 20:39:16', '2025-05-19 03:35:59', 8, 47),
(561, 'Business Associate International', 'E-Visible', 46, 196, 'Colombo', 1, NULL, 'job_images/BCZxaHA14SJZ0dH4bYWv8RMZ7r4kluVFfCVU6tSR.jpg', NULL, 52, 1, NULL, '2025-05-29', '2025-04-22 16:45:53', NULL, 'approved', 'contact_contributor', NULL, 'J100196', 1, '2025-04-22 20:44:44', '2025-05-19 03:44:14', 8, 35),
(562, 'Customer Relationship Executive', 'Heron Consultancy', 5, 89, 'Colombo', 1, NULL, 'job_images/bGcpc9oJHnaItyiCeN2lxV4LjUwzM09NAMOsj3vf.jpg', NULL, 54, 1, NULL, '2025-05-31', '2025-04-24 16:13:27', NULL, 'approved', 'contact_contributor', NULL, 'J100197', 1, '2025-04-24 20:00:34', '2025-05-19 17:12:17', 8, 46),
(563, 'Australian Custom Support Agent', 'DHL Group', 5, 88, 'Fiji', 37, NULL, 'job_images/4ZpnNIUVP7mKzzbUDnykeoTeVVPcGZ6SqyrAMwfy.jpg', NULL, 55, 1, NULL, '2025-05-31', '2025-04-24 16:13:36', NULL, 'approved', 'contact_contributor', NULL, 'J100198', 1, '2025-04-24 20:05:10', '2025-05-20 07:42:57', 8, 66),
(564, 'Online Assistants', 'No Description', 5, 88, 'Colombo', 1, NULL, 'job_images/NKuqD3KqcG8MCGDjcY7rT0iJdcFVv5Exds6sxAyM.jpg', NULL, 55, 1, NULL, '2025-05-31', '2025-04-24 16:13:46', NULL, 'approved', 'contact_contributor', NULL, 'J100199', 1, '2025-04-24 20:07:09', '2025-05-20 08:06:25', 8, 110),
(565, 'Cooks', 'Stag Restaurant', 13, 99, 'Kadana', 1, NULL, 'job_images/1TvMwYqa3ZM4OzMDll3ViGtbVSs08ipGmIQQPZ67.jpg', NULL, 27, 1, 1, '2025-05-31', '2025-04-24 16:13:54', NULL, 'approved', 'contact_contributor', NULL, 'J100200', 1, '2025-04-24 20:12:36', '2025-05-20 07:48:20', 8, 41),
(566, 'Marketing Executive', 'UBT Campus', 6, 244, 'Kalmunai', 1, NULL, 'job_images/NuvbfLfTtVvA3gJfNV8XGN4Sv9VuoWLfSodpEaaE.jpg', NULL, 56, 1, NULL, '2025-05-31', '2025-04-24 16:20:51', NULL, 'approved', 'contact_contributor', NULL, 'J100201', 1, '2025-04-24 20:20:33', '2025-05-18 04:56:42', 8, 49),
(567, 'Compliance Auditor', 'GCL International', 3, 230, 'Sri Lanka', 1, NULL, 'job_images/1kQRYW4HXYZqrlt6dZR5rRJzqUTysQMu2yBjJKTj.jpg', NULL, 57, 1, NULL, '2025-05-31', '2025-04-24 16:26:57', NULL, 'approved', 'contact_contributor', NULL, 'J100202', 1, '2025-04-24 20:26:46', '2025-05-20 09:23:24', 8, 47),
(568, 'Branch Manager', 'Global Islamic Bank', 23, 132, 'Dubai', 6, NULL, 'job_images/OFzl5kEmaSfO4ZZUys5VnkqXs3M88Bu4tNqQWQt9.jpg', NULL, 27, 1, 1, '2025-05-31', '2025-04-24 17:01:01', NULL, 'approved', 'contact_contributor', NULL, 'J100203', 1, '2025-04-24 21:00:49', '2025-05-20 07:43:25', 8, 59),
(569, 'Chartered Accountant', 'Dearo Investment', 3, 229, 'Nawala', 1, NULL, 'job_images/DmUVKHFFwVCbXylXrF1999e3q5XASS9eMbrbzJvu.jpg', NULL, 58, 1, NULL, '2025-05-31', '2025-04-24 17:06:43', NULL, 'approved', 'contact_contributor', NULL, 'J100204', 1, '2025-04-24 21:05:50', '2025-05-20 08:53:21', 8, 50),
(570, 'Customer Care Executives', 'Abans - Colombo', 5, 88, 'Colombo', 1, NULL, 'job_images/J6Zl0fwjOOnPHr6YLSyIW7zEwp9RcikJUA3ddpbK.jpg', NULL, 59, 1, NULL, '2025-06-01', '2025-04-25 11:49:15', NULL, 'approved', 'contact_contributor', NULL, 'J100205', 1, '2025-04-25 15:44:57', '2025-05-20 09:43:36', 8, 67),
(571, 'Engineer/Ass. Engineer', 'Abans - Field Support', 2, 226, 'Colombo', 1, NULL, 'job_images/NZjmIAcpyV6rqQBu0sKqv3eGEx2g6Q4MFyb54EhP.jpg', NULL, 59, 1, NULL, '2025-06-02', '2025-04-25 11:49:23', NULL, 'approved', 'contact_contributor', NULL, 'J100206', 1, '2025-04-25 15:46:30', '2025-05-17 17:58:20', 8, 59),
(572, 'IT Hardware Technician', 'Abans - Colombo', 1, 80, 'Colombo', 1, NULL, 'job_images/x9DXWyDLptFmzT5kzGRmGavfTx13dFW23n3NTiGK.jpg', NULL, 59, 1, NULL, '2025-06-02', '2025-04-25 11:49:32', NULL, 'approved', 'contact_contributor', NULL, 'J100207', 1, '2025-04-25 15:47:36', '2025-05-20 10:01:07', 8, 43),
(573, 'System Engineer', 'Abans - Colombo', 1, 77, 'Colombo', 1, NULL, 'job_images/1LAWJpUT04gM5HQGdNDlwnkrSnuFXOQFVVeeuIyI.jpg', NULL, 59, 1, NULL, '2025-06-02', '2025-04-25 11:49:41', NULL, 'approved', 'contact_contributor', NULL, 'J100208', 1, '2025-04-25 15:49:00', '2025-05-19 11:18:23', 8, 57),
(574, 'Accounts Executive', 'Abans', 3, 229, 'Colombo', 1, NULL, 'job_images/Zd8vcOndITzh9ux1AMHg6kLt579SV61fTFNTzOSo.jpg', NULL, 59, 1, NULL, '2025-06-02', '2025-04-25 11:55:47', NULL, 'approved', 'contact_contributor', NULL, 'J100209', 1, '2025-04-25 15:52:45', '2025-05-20 10:26:07', 8, 91),
(575, 'Senior Sales Executive', 'Abans', 4, 235, 'Colombo', 1, NULL, 'job_images/w5uu9u75QumDwn3JHR7sS1mkHeZxwvC4ijJQ22kh.jpg', NULL, 59, 1, NULL, '2025-06-02', '2025-04-25 11:55:55', NULL, 'approved', 'contact_contributor', NULL, 'J100210', 1, '2025-04-25 15:54:16', '2025-05-18 18:01:25', 8, 40),
(576, 'Content Writer - Sinhala/English', 'Abans', 16, 109, 'Colombo', 1, NULL, 'job_images/bKs57L5geSgHFqrrdQqrhy9UD1dK9GsG3TKyVtBY.jpg', NULL, 59, 1, NULL, '2025-06-02', '2025-04-25 11:57:34', NULL, 'approved', 'contact_contributor', NULL, 'J100211', 1, '2025-04-25 15:57:20', '2025-05-19 15:23:47', 8, 62),
(578, 'Compliance Officer/Coordinators/Sales Agent', 'Dubai Jobs', 46, 196, 'Dubai', 6, NULL, 'job_images/8eJlnyEFltQ0GAi23zdmBU4kYVtZCUndi2taiPtc.jpg', NULL, 61, 1, NULL, '2025-06-02', '2025-04-25 12:10:11', NULL, 'approved', 'contact_contributor', NULL, 'J100213', 1, '2025-04-25 16:08:56', '2025-05-19 17:11:19', 8, 51),
(579, 'Junior Executive Finance', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/EH4p4gRfdPgQ2jHu7EPOACFe4oQAikzhdfzsoog1.jpg', NULL, 61, 1, NULL, '2025-06-02', '2025-04-25 12:10:19', NULL, 'approved', 'contact_contributor', NULL, 'J100214', 1, '2025-04-25 16:09:59', '2025-05-19 11:04:19', 8, 56),
(580, 'Online Order Assistant', 'Daraz', 4, 238, 'Online', 1, NULL, 'job_images/XUwyIGfP4nqaJDS4Q1YsA7qgVjAyNA93n9WA7ylh.jpg', NULL, 27, 1, 1, '2025-06-02', '2025-04-25 12:15:01', NULL, 'approved', 'contact_contributor', NULL, 'J100215', 1, '2025-04-25 16:13:15', '2025-05-20 08:12:24', 8, 81),
(581, 'Accountant/Executive', 'Redline Lanka', 3, 229, 'Colombo', 1, NULL, 'job_images/NdX9QUTtRBcnGF74PHMmBQE5ksdsAXs1rNOWH780.jpg', NULL, 27, 1, 1, '2025-06-02', '2025-04-25 12:15:12', NULL, 'approved', 'contact_contributor', NULL, 'J100216', 1, '2025-04-25 16:14:32', '2025-05-20 07:08:17', 8, 56),
(582, 'Banking Assistant - Trainee', 'Government - Central Bank', 24, 129, 'Colombo', 1, NULL, 'job_images/cB5OK2gZCt59gtEZoFUxrB56HDSL6mc0O9nRTwfC.jpg', NULL, 62, 1, NULL, '2025-05-23', '2025-04-25 12:18:43', NULL, 'approved', 'contact_contributor', NULL, 'J100217', 1, '2025-04-25 16:18:30', '2025-05-19 17:23:23', 8, 58),
(583, 'Assistan/Associate/Professor', 'PESHAWAR Campus', 6, 242, 'Foreign Jobs', 65, NULL, 'job_images/X8ZLJKZx6SKlKjB6CGfsXWMyVFgvKRuUKYpny4R0.jpg', NULL, 27, 1, 1, '2025-06-02', '2025-04-25 12:24:25', NULL, 'approved', 'contact_contributor', NULL, 'J100218', 1, '2025-04-25 16:21:31', '2025-05-19 17:11:42', 8, 42),
(584, 'Manager - Restaurant', 'Danovita', 13, 99, 'Danovita', 1, NULL, 'job_images/DtVW3JCsS9APtVEXSY3LCDbQVl9tXTmT0uj4tEZT.jpg', NULL, 27, 1, 1, '2025-06-02', '2025-04-25 12:24:33', NULL, 'approved', 'contact_contributor', NULL, 'J100219', 1, '2025-04-25 16:24:15', '2025-05-20 10:01:47', 8, 53),
(585, 'Sales Executive/Business Development Manager', 'No Description', 26, 135, 'Colombo', 1, NULL, 'job_images/ZguijTCpyr8YSsD6XRpHKc9TYSeQQdKE0C6S1EM6.jpg', NULL, 63, 1, NULL, '2025-06-02', '2025-04-25 12:29:39', NULL, 'approved', 'contact_contributor', NULL, 'J100220', 1, '2025-04-25 16:27:28', '2025-05-20 09:04:00', 8, 47),
(586, 'Sales Representatives', 'Floor Lanka', 4, 235, 'Colombo', 1, NULL, 'job_images/u1fBPAZKl3nwHksPHHXjqqQGz2kckwBc1Zj9dJpY.jpg', NULL, 64, 1, NULL, '2025-06-02', '2025-04-25 12:29:47', NULL, 'approved', 'contact_contributor', NULL, 'J100221', 1, '2025-04-25 16:29:32', '2025-05-20 10:24:23', 8, 43),
(587, 'Accountant', 'PAMPANGA Branch', 3, 229, 'PAMPANGA Branch', 65, NULL, 'job_images/s9D8Zyk7T6osHP6lUZAT4SyJOvVWzehyGTjMD289.jpg', NULL, 65, 1, NULL, '2025-06-02', '2025-04-25 12:38:58', NULL, 'approved', 'contact_contributor', NULL, 'J100222', 1, '2025-04-25 16:36:13', '2025-05-18 12:06:05', 8, 42),
(588, 'Business Development Team', 'Cargills Bank', 23, 132, 'Colombo', 1, NULL, 'job_images/w3XeT07RjyBUMmIUQJSkR1LuL99TSkfOCLsw9PwM.jpg', NULL, 27, 1, 1, '2025-05-25', '2025-04-25 12:39:09', NULL, 'approved', 'contact_contributor', NULL, 'J100223', 1, '2025-04-25 16:38:49', '2025-05-18 18:11:41', 8, 53),
(589, 'Stores Assistant', 'Interior Decorations', 11, 257, 'Colombo', 1, NULL, 'job_images/fIqtwYDmE7fSTtOaQBHTtkuiybM3RcpbVulQfdyi.jpg', NULL, 27, 1, 1, '2025-06-02', '2025-04-25 12:41:33', NULL, 'approved', 'contact_contributor', NULL, 'J100224', 1, '2025-04-25 16:41:24', '2025-05-20 08:49:21', 8, 63),
(590, 'Finance officer', 'Fiji', 3, 229, 'Fiji', 37, NULL, 'job_images/uyn43SOtNTtfDGRWHbyG1qfg7XBvppzn46hYF3cV.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:45:59', NULL, 'approved', 'contact_contributor', NULL, 'J100225', 1, '2025-04-26 18:39:43', '2025-05-18 17:53:24', 8, 43),
(591, 'Sales Assistant & Cashier', 'Fiji', 4, 235, 'Nadi - Fiji', 37, NULL, 'job_images/zJSNQWfXMuYjVJPerHZVqjkbB82H5anMf7kVIdQP.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:46:29', NULL, 'approved', 'contact_contributor', NULL, 'J100226', 1, '2025-04-26 18:46:09', '2025-05-19 00:14:57', 8, 61),
(592, 'Baker', 'Lautoka', 31, 151, 'Fiji', 37, NULL, 'job_images/7YUes3Bzo9V5gaU8hekIbo4aIjIRlGGbM2rScTED.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:46:37', NULL, 'approved', 'contact_contributor', NULL, 'J100227', 1, '2025-04-26 18:46:09', '2025-05-19 07:11:16', 8, 43),
(593, 'Internal Audit Supervisor', 'Fiji - Suva', 3, 230, 'Suva', 37, NULL, 'job_images/hzSXsK1DW6JU1GfEXL9NlVmTuMYzmUYKWGiUCuRH.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:46:45', NULL, 'approved', 'contact_contributor', NULL, 'J100228', 1, '2025-04-26 18:46:09', '2025-05-19 19:11:12', 8, 38),
(594, 'BARISTA', 'No Description', 31, 152, 'Fiji', 37, NULL, 'job_images/FQZGPvceVWTMYyi6baMyC1epGsLvdbY3WsTIyTsA.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:46:53', NULL, 'approved', 'contact_contributor', NULL, 'J100229', 1, '2025-04-26 18:46:09', '2025-05-18 02:59:37', 8, 41),
(595, 'F&B Manager', 'No Description', 31, 151, 'Nadi Airport', 37, NULL, 'job_images/PfFdXwOpmwDkz0ep0tfIc4Soe2CStTX3GPDC7g9C.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:47:02', NULL, 'approved', 'contact_contributor', NULL, 'J100230', 1, '2025-04-26 18:46:09', '2025-05-20 07:38:31', 8, 39),
(596, 'Office Administrator', 'No Description', 46, 195, 'Fiji', 37, NULL, 'job_images/psiD4BbVQYR19moJ7M0yn6n7NP5VaZtJzOk7AWEm.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:47:10', NULL, 'approved', 'contact_contributor', NULL, 'J100231', 1, '2025-04-26 18:46:09', '2025-05-19 17:12:19', 8, 60),
(597, 'Beauty Advisor', 'No Description', 20, 271, 'Fiji - Nadi Airport', 37, NULL, 'job_images/mpZgGQvDnn8cL0UW5ADUHw4kVXSxTWcR7g5PaN7q.jpg', NULL, 66, 1, NULL, '2025-06-02', '2025-04-26 14:54:41', NULL, 'approved', 'contact_contributor', NULL, 'J100232', 1, '2025-04-26 18:54:26', '2025-05-18 02:42:47', 8, 38),
(598, 'Draftsman /Admin Engineering', 'No Description', 2, 224, 'Central Division', 37, NULL, 'job_images/MOadRX21afHun2DQFvfZ1cmqqP5AnFXSYyOSXYWK.jpg', NULL, 66, 1, NULL, '2025-06-03', '2025-04-26 14:54:48', NULL, 'approved', 'contact_contributor', NULL, 'J100233', 1, '2025-04-26 18:54:26', '2025-05-18 02:56:35', 8, 50),
(599, 'Visual Merchandiser', 'No Description', 4, 238, 'Nadi', 37, NULL, 'job_images/KeH8xGJ12WyPjQPbI4HT2A6u9hqW0sJaF4qC8DRA.jpg', NULL, 66, 1, NULL, '2025-06-03', '2025-04-26 14:54:57', NULL, 'approved', 'contact_contributor', NULL, 'J100234', 1, '2025-04-26 18:54:26', '2025-05-18 03:56:22', 8, 50),
(600, 'Sales Representative', 'No Description', 4, 235, 'Nadi', 37, NULL, 'job_images/E01kpbdaNWc6b26hIYu1STIT1SySBGvJaeCgfj17.jpg', NULL, 66, 1, NULL, '2025-06-03', '2025-04-26 14:55:04', NULL, 'approved', 'contact_contributor', NULL, 'J100235', 1, '2025-04-26 18:54:26', '2025-05-18 06:43:06', 8, 40),
(601, 'Cashier', 'No Description', 3, 229, 'Nadi - Fiji', 37, NULL, 'job_images/yYwIwURCRTfkkHIwaPFSWYu02PuZsE4GZuCdfSnK.jpg', NULL, 66, 1, NULL, '2025-06-03', '2025-04-26 14:57:17', NULL, 'approved', 'contact_contributor', NULL, 'J100236', 1, '2025-04-26 18:56:52', '2025-05-20 09:18:31', 8, 49),
(602, 'Quality Controller', 'No Description', 36, 168, 'Weliweriya', 1, NULL, 'job_images/2jjkcPAzVzLpAcw1FRCqiQVuf1x0x6jurVHITXzx.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-26 15:35:10', NULL, 'approved', 'contact_contributor', NULL, 'J100237', 1, '2025-04-26 19:34:58', '2025-05-19 20:30:27', 8, 43),
(603, 'Business Development Ass.Manager', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/RG2vjQiT2bY4aamNoB8YGDp4j8H8GY9hep3W7OcU.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-26 15:37:52', NULL, 'approved', 'contact_contributor', NULL, 'J100238', 1, '2025-04-26 19:37:40', '2025-05-19 20:43:52', 8, 47),
(604, 'Senior Relationship Manager', 'No Description', 23, 132, 'Dubai/Pakistan', 6, NULL, 'job_images/FXHnhpu1Tj7MK3d7k5z1PX18SeH0PLeH2Yxf6tEr.jpg', NULL, 67, 1, NULL, '2025-06-03', '2025-04-26 15:44:58', NULL, 'approved', 'contact_contributor', NULL, 'J100239', 1, '2025-04-26 19:43:29', '2025-05-19 18:32:26', 8, 48),
(605, 'Accounting Clerk', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/7Eu4UwlhUxGmu02a2whoDFFOKkLAmxmtXFLV52rC.jpg', NULL, 67, 1, NULL, '2025-06-03', '2025-04-26 15:45:08', NULL, 'approved', 'contact_contributor', NULL, 'J100240', 1, '2025-04-26 19:44:51', '2025-05-20 10:32:27', 8, 65),
(606, 'Senior Account Manager', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/L3xkzFChT0P2ke6qeFN215rvE3koKRmW2wytZQ8o.jpg', NULL, 68, 1, NULL, '2025-06-02', '2025-04-26 15:54:45', NULL, 'approved', 'contact_contributor', NULL, 'J100241', 1, '2025-04-26 19:49:42', '2025-05-20 10:31:08', 8, 45),
(607, 'Business Dev.manager/Ass. Sales Manager', 'No Description', 4, 235, 'Kottawa', 1, NULL, 'job_images/HQi4Y0vcfSQoQGqrlJWopDvbCC4rY3cWvXQLDfct.jpg', NULL, 69, 1, NULL, '2025-06-03', '2025-04-26 15:54:55', NULL, 'approved', 'contact_contributor', NULL, 'J100242', 1, '2025-04-26 19:52:42', '2025-05-19 09:08:25', 8, 41),
(608, 'Sales Officers -Dialog SIM', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/RY3CAzJdVjILQNtVWeSfjW022oUu67gXmNSM6xkm.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-26 15:55:06', NULL, 'approved', 'contact_contributor', NULL, 'J100243', 1, '2025-04-26 19:54:35', '2025-05-20 10:29:41', 8, 45),
(609, 'Officer/Assistant Level', 'No Description', 23, 132, 'Foreign Jobs', 65, NULL, 'job_images/gIPvn51Rh57XqqeMuiji6FVBOrTXptnrrpJGmqgh.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-26 15:57:35', NULL, 'approved', 'contact_contributor', NULL, 'J100244', 1, '2025-04-26 19:57:25', '2025-05-20 08:55:06', 8, 64),
(610, 'Marketing Executives', 'No Description', 4, 235, 'Kurunegala', 1, NULL, 'job_images/gZN7cxmSKnZN8hU5h9IvpI3544myDujWN0gWCZ7x.jpg', NULL, 70, 1, NULL, '2025-06-03', '2025-04-26 16:06:33', NULL, 'approved', 'contact_contributor', NULL, 'J100245', 1, '2025-04-26 20:00:33', '2025-05-19 13:46:17', 8, 49),
(611, 'Senior Operation Executive', 'No Description', 46, 196, 'Rajagiriya', 1, NULL, 'job_images/hyQBTx0bcaF7UruTvFqGF5NVrw5vjnQRtp8bgBr8.jpg', NULL, 71, 1, NULL, '2025-06-03', '2025-04-26 16:06:42', NULL, 'approved', 'contact_contributor', NULL, 'J100246', 1, '2025-04-26 20:03:23', '2025-05-20 07:44:41', 8, 40),
(612, 'SPA Therapists', 'Maldives -Resort', 13, 99, 'Maldives', 11, NULL, 'job_images/dVg2ayymSwyZMWlyK86E1Se32qyneii3sjvm4WG1.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-26 16:06:50', NULL, 'approved', 'contact_contributor', NULL, 'J100247', 1, '2025-04-26 20:06:24', '2025-05-19 21:13:56', 8, 46),
(613, 'Banking Jobs - All Departments', 'No Description', 23, 132, 'Foreign Jobs', 65, NULL, 'job_images/nBNKfPMgqdASkvwPd0W1m2mwcCwiR4c70vjJ5HVI.jpg', NULL, 72, 1, NULL, '2025-06-03', '2025-04-26 16:16:58', NULL, 'approved', 'contact_contributor', NULL, 'J100248', 1, '2025-04-26 20:10:14', '2025-05-19 18:00:42', 8, 54),
(614, 'Relationship Manager', 'No Description', 23, 133, 'Colombo', 1, NULL, 'job_images/nTDHRCc9liqNF9NhpMWx02E99nXBHTDZRXWbWikX.jpg', NULL, 73, 1, NULL, '2025-06-03', '2025-04-26 16:17:10', NULL, 'approved', 'contact_contributor', NULL, 'J100249', 1, '2025-04-26 20:13:08', '2025-05-20 09:28:24', 8, 51),
(615, 'Account Clerks', 'Shihan Tyres', 3, 229, 'Makola', 1, NULL, 'job_images/hR93fVd3HjZYXSCO6lbDsxCskCAZBFGC1jUKHLkM.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-26 16:17:18', NULL, 'approved', 'contact_contributor', NULL, 'J100250', 1, '2025-04-26 20:16:48', '2025-05-19 21:30:35', 8, 50),
(616, 'Assistant Team Leader - Product Management', 'Seylan Bank', 23, 132, 'Colombo', 1, NULL, 'job_images/cRnjz6MplFVEmeqhcrmXDkP2RnUAEMIrDqximPPv.jpg', NULL, 74, 1, NULL, '2025-06-03', '2025-04-27 15:50:20', NULL, 'approved', 'contact_contributor', NULL, 'J100251', 1, '2025-04-27 19:50:08', '2025-05-20 09:06:56', 8, 53),
(617, 'Accountant', 'Kandy Cafe', 3, 229, 'Kandy', 1, NULL, 'job_images/sLnbkAgyayPNUM0eP9iEXSRPGVSkOE8pEV4wPXMw.jpg', NULL, 75, 1, NULL, '2025-06-03', '2025-04-27 15:52:47', NULL, 'approved', 'contact_contributor', NULL, 'J100252', 1, '2025-04-27 19:52:37', '2025-05-20 09:24:03', 8, 52),
(618, 'School Principal', 'Islamic Minded and Appearance', 6, 240, 'Colombo', 1, NULL, 'job_images/zkHGqPYnvKaoi6gNux6ZVxQ2t9JsMKJzhMyU1M5g.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-27 15:55:15', NULL, 'approved', 'contact_contributor', NULL, 'J100253', 1, '2025-04-27 19:54:45', '2025-05-19 21:43:35', 8, 47);
INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(619, 'Presenters', 'No Description', 38, 283, 'Maharagama', 1, NULL, 'job_images/2RucdOQy4shSQgwCVK8ilqJ4jJoNzjkPZpL4m8op.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-04-27 16:00:34', NULL, 'approved', 'contact_contributor', NULL, 'J100254', 1, '2025-04-27 19:57:11', '2025-05-19 21:49:23', 8, 48),
(620, 'Sales Executive', 'Abans', 4, 235, 'Colombo', 1, NULL, 'job_images/KciE7TVRPChqvBnvXzPp7RU0uRDyHirF2vraZIcM.jpg', NULL, 59, 1, NULL, '2025-06-03', '2025-04-27 16:00:44', NULL, 'approved', 'contact_contributor', NULL, 'J100255', 1, '2025-04-27 20:00:06', '2025-05-20 08:52:30', 8, 41),
(621, 'Manager Business Banking', 'Cargills Bank', 23, 132, 'Colombo', 1, NULL, 'job_images/vENriy2qGAzNR1f7sdE53IN20oq4rVhRnbHD71Pw.jpg', NULL, 76, 1, NULL, '2025-06-04', '2025-04-28 05:31:10', NULL, 'approved', 'contact_contributor', NULL, 'J100256', 1, '2025-04-28 09:07:31', '2025-05-20 06:12:44', 8, 42),
(622, 'Boo Keeper', 'Philippines', 3, 229, 'Philippine', 55, NULL, 'job_images/1wf3ptKZGADYzhpfJVVo3UhBjF3S40QLEFA3chbI.jpg', NULL, 77, 1, NULL, '2025-06-04', '2025-04-28 05:31:21', NULL, 'approved', 'contact_contributor', NULL, 'J100257', 1, '2025-04-28 09:11:23', '2025-05-19 13:01:20', 8, 37),
(623, 'Bank of Ceylon', 'BOC', 23, 132, 'BOC', 1, NULL, 'job_images/IHrsGKxt2g24CiAISyO5EEBJ6p6Y7sddxMGk2kgO.jpg', NULL, 27, 1, 1, '2025-05-09', '2025-04-28 05:31:33', NULL, 'approved', 'contact_contributor', NULL, 'J100258', 1, '2025-04-28 09:15:11', '2025-05-19 21:47:12', 8, 83),
(624, 'Ticketing Executive', 'No Description', 47, 261, 'Kurunegala/Gampaha', 1, NULL, 'job_images/DFT8nm0PEXrC4vvvJ6khSjLMvHUxa0CqrmceMdOQ.jpg', NULL, 78, 1, NULL, '2025-06-04', '2025-04-28 16:05:29', NULL, 'approved', 'contact_contributor', NULL, 'J100259', 1, '2025-04-28 19:54:47', '2025-05-20 08:56:53', 8, 44),
(625, 'Manager - Faculty of Humanities & Sciences', 'No Description', 6, 243, 'Malabe', 1, NULL, 'job_images/P4XeKH9RRRWNynIryz44Ge39XZutPioag8IyvWZ1.jpg', NULL, 50, 1, NULL, '2025-06-04', '2025-04-28 16:05:46', NULL, 'approved', 'contact_contributor', NULL, 'J100260', 1, '2025-04-28 19:57:34', '2025-05-20 06:53:31', 8, 40),
(626, 'Accounting Manager/Supervisor', 'No Description', 3, 229, 'Sri Lanka', 1, NULL, 'job_images/XhIY580KYkEFIv2t4n8cACrX3YejUeofmK7v9MQt.jpg', NULL, 79, 1, NULL, '2025-06-04', '2025-04-28 16:05:59', NULL, 'approved', 'contact_contributor', NULL, 'J100261', 1, '2025-04-28 20:01:04', '2025-05-20 09:42:07', 8, 35),
(627, 'Assistant Branch Manager', 'No Description', 43, 214, 'Colombo', 1, NULL, 'job_images/CbdGsIMnxmv6yZaGsUBYwK9PelNUsnrEfg8Ts8BH.jpg', NULL, 27, 1, 1, '2025-06-04', '2025-04-28 16:06:11', NULL, 'approved', 'contact_contributor', NULL, 'J100262', 1, '2025-04-28 20:05:12', '2025-05-19 22:00:54', 8, 39),
(628, 'TeleSales Representative', 'No Description', 4, 237, 'Battaramulla', 1, NULL, 'job_images/ZBO95N0p46DMIl9p20BdRVx2XIjv5zCi5axotMJt.jpg', NULL, 80, 1, NULL, '2025-06-04', '2025-04-28 16:12:13', NULL, 'approved', 'contact_contributor', NULL, 'J100263', 1, '2025-04-28 20:11:26', '2025-05-20 09:45:44', 8, 32),
(629, 'Assistant Accountant/Financial Analyst', 'Honda Sri Lanka', 3, 229, 'Colombo', 1, NULL, 'job_images/3ohtHQV1LRdiv4mKuJryZi2FgmuVKvTIY0esqKLY.png', NULL, 81, 1, NULL, '2025-06-05', '2025-04-29 09:09:37', NULL, 'approved', 'contact_contributor', NULL, 'J100264', 1, '2025-04-29 13:09:19', '2025-05-20 09:50:29', 8, 42),
(630, 'Head of Finance', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/JbiHqKeVVSa2yM9ibOz5cwespJ6tp7Tx5i4HX8fU.jpg', NULL, 82, 1, NULL, '2025-06-05', '2025-04-29 09:34:48', NULL, 'approved', 'contact_contributor', NULL, 'J100265', 1, '2025-04-29 13:13:23', '2025-05-20 10:08:26', 8, 32),
(631, 'Manager/Assistant manager Tax', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/pykzJuDMMaq4naergP7crnjAxOoE0Fan9LCZFs6x.png', NULL, 83, 1, NULL, '2025-06-05', '2025-04-29 09:34:58', NULL, 'approved', 'contact_contributor', NULL, 'J100266', 1, '2025-04-29 13:25:49', '2025-05-20 10:12:44', 8, 29),
(632, 'Management Accountant', 'No Description', 3, 229, 'Biyagama', 1, NULL, 'job_images/HSqN6VS6csckV5psYlADYrZCyy4VE820YO3C6ugG.png', NULL, 84, 1, NULL, '2025-05-28', '2025-04-29 09:36:09', NULL, 'approved', 'contact_contributor', NULL, 'J100267', 1, '2025-04-29 13:35:23', '2025-05-20 06:30:25', 8, 32),
(633, 'Executive Planning', 'No Description', 21, 122, 'Pannala', 1, NULL, 'job_images/kTvAhWoO1e6ZrH52BAcRKBof1Go5JFIwJTuvEaXY.png', NULL, 84, 1, NULL, '2025-05-29', '2025-04-29 09:36:18', NULL, 'approved', 'contact_contributor', NULL, 'J100268', 1, '2025-04-29 13:35:24', '2025-05-20 06:44:22', 8, 34),
(634, 'Interns - Lean Enterprise', 'No Description', 21, 122, 'Nawala', 1, NULL, 'job_images/R0WKmupocRmV71zAO3a8CnpPR4ApflsVbZiEayCy.png', NULL, 84, 1, NULL, '2025-05-29', '2025-04-29 09:36:29', NULL, 'approved', 'contact_contributor', NULL, 'J100269', 1, '2025-04-29 13:35:24', '2025-05-20 07:04:52', 8, 54),
(635, 'Interns - Production Control', 'No Description', 21, 122, 'Biyagama', 1, NULL, 'job_images/LxeWBwnkRVOgVV6NivmKlnXV0lsVZHizwXx97uzL.png', NULL, 84, 1, NULL, '2025-05-29', '2025-04-29 09:36:40', NULL, 'approved', 'contact_contributor', NULL, 'J100270', 1, '2025-04-29 13:35:24', '2025-05-20 07:18:47', 8, 52),
(636, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/Qy7GgcAQZNirGxKB6KvM8L973icWJhhTJHelxTrL.jpg', NULL, 85, 1, NULL, '2025-05-29', '2025-04-29 09:40:17', NULL, 'approved', 'contact_contributor', NULL, 'J100271', 1, '2025-04-29 13:40:07', '2025-05-20 10:40:42', 8, 36),
(637, 'Assistant Manager - Treasury', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/MIBNCvoAGWJ9H4sKOfWcSOtAtB4c5j7tTMrSqIYD.png', NULL, 86, 1, NULL, '2025-06-05', '2025-04-29 10:02:44', NULL, 'approved', 'contact_contributor', NULL, 'J100272', 1, '2025-04-29 13:42:40', '2025-05-20 11:18:15', 8, 40),
(638, 'Executive - Recovery', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/jM91CTkWQ0dH4IHfCp1CaYwM3YxdqnFPVocfNEq4.jpg', NULL, 87, 1, NULL, '2025-06-05', '2025-04-29 10:02:54', NULL, 'approved', 'contact_contributor', NULL, 'J100273', 1, '2025-04-29 13:45:18', '2025-05-20 11:38:15', 8, 39),
(639, 'Associate Consultant/Consultants ESG', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/iErGKWz3wovagO6nu5QTtGAL3d6ZsGSvznXM1ypj.png', NULL, 88, 1, NULL, '2025-06-05', '2025-04-29 10:03:02', NULL, 'approved', 'contact_contributor', NULL, 'J100274', 1, '2025-04-29 13:48:17', '2025-05-20 06:26:01', 8, 37),
(640, 'Accounts Executive/Store Keeper', 'No Description', 3, 229, 'Kalagedihena', 1, NULL, 'job_images/vYYt8RAb37tVcQ7g8yldTY48YVsPsNG8ItAMyxOO.png', NULL, 89, 1, NULL, '2025-06-05', '2025-04-29 10:03:10', NULL, 'approved', 'contact_contributor', NULL, 'J100275', 1, '2025-04-29 13:50:26', '2025-05-20 10:56:15', 8, 39),
(641, 'Executive - Audit Quality Assurance', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/37qDY8jKGWQ9Z0pjVwOv13ivoH7LcfZCaihiyeSV.png', NULL, 90, 1, NULL, '2025-06-05', '2025-04-29 10:03:20', NULL, 'approved', 'contact_contributor', NULL, 'J100276', 1, '2025-04-29 13:52:47', '2025-05-19 23:24:55', 7, 90),
(642, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/l7bPa0k7vNNVU8e9UetzU8UVc4aW6sreyfl6uEhY.png', NULL, 91, 1, NULL, '2025-06-05', '2025-04-29 10:03:28', NULL, 'approved', 'contact_contributor', NULL, 'J100277', 1, '2025-04-29 13:55:05', '2025-05-20 07:14:53', 8, 37),
(643, 'Head of Customer Success', 'No Description', 21, 122, 'Colombo', 1, NULL, 'job_images/HXbuj3CYhnqZs9cQ3HUIKih3a9tGAF0uFW93xK2J.png', NULL, 93, 1, NULL, '2025-06-05', '2025-04-29 10:03:37', NULL, 'approved', 'contact_contributor', NULL, 'J100278', 1, '2025-04-29 13:59:35', '2025-05-19 19:21:42', 8, 34),
(644, 'Assistant Manager - Finance & Accounting', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/hQ2IWWBV85EkwZgcUjEGxLekjKiCp0bzU9m8A80Y.jpg', NULL, 94, 1, NULL, '2025-06-05', '2025-04-29 10:13:58', NULL, 'approved', 'contact_contributor', NULL, 'J100279', 1, '2025-04-29 14:06:01', '2025-05-19 12:38:25', 8, 36),
(645, 'Senior Secretary', 'No Description', 21, 122, 'Colombo', 1, NULL, 'job_images/x8R171gqwEqFjVFhmWDHsseC76kmjMrWRJ4Lwcuy.jpg', NULL, 95, 1, NULL, '2025-06-05', '2025-04-29 10:14:06', NULL, 'approved', 'contact_contributor', NULL, 'J100280', 1, '2025-04-29 14:08:37', '2025-05-19 19:13:21', 8, 28),
(646, 'HR Manager', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/QrjO1zoHF3b3W339Oe7gfHDbyUflx0GVXvJXmr6R.jpg', NULL, 27, 1, 1, '2025-06-05', '2025-04-29 10:14:21', NULL, 'approved', 'contact_contributor', NULL, 'J100281', 1, '2025-04-29 14:10:20', '2025-05-19 21:20:17', 8, 43),
(647, 'Head of Supply Chain', 'No Description', 11, 255, 'Colombo', 1, NULL, 'job_images/GjrvuMSLuN3Jnx0BzMfzBXNAaWNmywK7IRs3tp4H.jpg', NULL, 96, 1, NULL, '2025-06-05', '2025-04-29 10:14:14', NULL, 'approved', 'contact_contributor', NULL, 'J100282', 1, '2025-04-29 14:12:42', '2025-05-15 06:48:16', 8, 30),
(648, 'Forklift Operators', 'No Description', 11, 257, 'Foreign Jobs', 65, NULL, 'job_images/FXa0I3uvsAVluX43qMgBVZKbSJFO2TAbfwRPpMlp.png', NULL, 27, 1, 1, '2025-06-05', '2025-04-29 10:29:26', NULL, 'approved', 'contact_contributor', NULL, 'J100283', 1, '2025-04-29 14:21:31', '2025-05-19 22:17:45', 8, 36),
(649, 'Transport Superior', 'No Description', 11, 254, 'Hokandara', 1, NULL, 'job_images/HzMVJtViv5fPh4oXUGjOMlesHFNjZJjtGBhtx4DF.png', NULL, 97, 1, NULL, '2025-06-05', '2025-04-29 10:29:35', NULL, 'approved', 'contact_contributor', NULL, 'J100284', 1, '2025-04-29 14:25:15', '2025-05-20 07:28:25', 8, 35),
(650, 'Drivers - Heavy & Normal', 'No Description', 11, 254, 'Hokandara', 1, NULL, 'job_images/wLulPNG8OzKMaEwlav20tHUprUJdhjmEF54QxV7s.png', NULL, 97, 1, NULL, '2025-06-05', '2025-04-29 10:29:43', NULL, 'approved', 'contact_contributor', NULL, 'J100285', 1, '2025-04-29 14:25:15', '2025-05-20 07:33:05', 8, 33),
(651, 'Branch Manager', 'No Description', 11, 254, 'Colombo', 1, NULL, 'job_images/IsyPOZxESlUZzDyun9O6ZtF1YyJhBWCbv1ll9c1U.png', NULL, 99, 1, NULL, '2025-06-05', '2025-04-29 10:29:50', NULL, 'approved', 'contact_contributor', NULL, 'J100286', 1, '2025-04-29 14:29:17', '2025-05-20 07:46:03', 8, 34),
(652, 'Fabric Technologist', 'No Description', 44, 189, 'Homagama', 1, NULL, 'job_images/5q8lrpb2QbUfXTOfaYunTDE4vSCWAgarrjRkJSwa.png', NULL, 100, 1, NULL, '2025-06-05', '2025-04-29 10:38:25', NULL, 'approved', 'contact_contributor', NULL, 'J100287', 1, '2025-04-29 14:37:09', '2025-05-20 07:42:31', 8, 34),
(653, 'Manager Quality Assurance', 'No Description', 44, 189, 'Homagama', 1, NULL, 'job_images/WEXkUSoas9FoZUH2S8vYP8a2OYXrh1S7RvVPr9Zm.png', NULL, 100, 1, NULL, '2025-06-05', '2025-04-29 10:38:35', NULL, 'approved', 'contact_contributor', NULL, 'J100288', 1, '2025-04-29 14:38:08', '2025-05-20 07:51:55', 8, 39),
(654, 'Production Manager', 'No Description', 44, 189, 'Koggala', 1, NULL, 'job_images/pD2xf7BIuNX5Jh8d9FLIs783hGyeVidFLsArz0Qs.png', NULL, 101, 1, NULL, '2025-06-05', '2025-04-29 10:44:35', NULL, 'approved', 'contact_contributor', NULL, 'J100289', 1, '2025-04-29 14:41:58', '2025-05-19 10:21:22', 8, 30),
(655, 'Senior Executive - Panning', 'No Description', 44, 189, 'Wathupitiwala', 1, NULL, 'job_images/BsyXb1V4fRWJ7xu235FBEhQwXZH2smRU6bYtS2ZX.jpg', NULL, 102, 1, NULL, '2025-06-05', '2025-04-29 10:44:44', NULL, 'approved', 'contact_contributor', NULL, 'J100290', 1, '2025-04-29 14:44:31', '2025-05-18 11:11:03', 8, 30),
(656, 'Chief Nursing Officer/Matron/Nursing Sister/Snr Nursing Officer', 'No Description', 7, 245, 'Negombo', 1, NULL, 'job_images/aUrc79ydTLIVb06RnAaaaG31Ug84I8T8z8JBeh6R.jpg', NULL, 103, 1, NULL, '2025-06-05', '2025-04-29 11:16:22', NULL, 'approved', 'contact_contributor', NULL, 'J100291', 1, '2025-04-29 15:13:39', '2025-05-19 07:37:57', 8, 36),
(657, 'Manager - Manufacturing Excellence', 'No Description', 36, 167, 'Ranala', 1, NULL, 'job_images/toIotYRpinSpgwODhWMD7AYL7c1PYX1o9MDN53iF.png', NULL, 104, 1, NULL, '2025-06-05', '2025-04-29 13:29:30', NULL, 'approved', 'contact_contributor', NULL, 'J100292', 1, '2025-04-29 17:29:10', '2025-05-20 08:05:35', 8, 37),
(658, 'Production Executive', 'No Description', 36, 167, 'Ranala', 1, NULL, 'job_images/sYxh6rDLranXhiQOOUYiyPdww5QKHOTzUxSG0IAS.png', NULL, 104, 1, NULL, '2025-06-05', '2025-04-29 13:29:38', NULL, 'approved', 'contact_contributor', NULL, 'J100293', 1, '2025-04-29 17:29:10', '2025-05-20 08:21:44', 8, 36),
(659, 'Planning Assistant', 'No Description', 36, 167, 'Bandaragama', 1, NULL, 'job_images/X7VMz1oEhy5Kx6uXBSKPBPxJGgxdAoHUCRKk90ow.png', NULL, 106, 1, NULL, '2025-06-05', '2025-04-29 13:38:03', NULL, 'approved', 'contact_contributor', NULL, 'J100294', 1, '2025-04-29 17:37:51', '2025-05-20 08:39:07', 8, 42),
(660, 'Production Manager', 'No Description', 36, 167, 'Kalutara', 1, NULL, 'job_images/YSK48RWWo6vOpk7mxIWSdLbKe5ugk3NRzYjC1Jow.png', NULL, 106, 1, NULL, '2025-06-05', '2025-04-29 14:04:12', NULL, 'approved', 'contact_contributor', NULL, 'J100295', 1, '2025-04-29 17:47:09', '2025-05-20 08:42:25', 8, 41),
(661, 'Production Executive', 'No Description', 36, 167, 'Kalutara', 1, NULL, 'job_images/WPEWVfmNEhwHSDw6rKLitc2hImttjQ4I3HKFMTur.png', NULL, 106, 1, NULL, '2025-06-05', '2025-04-29 14:04:25', NULL, 'approved', 'contact_contributor', NULL, 'J100296', 1, '2025-04-29 17:47:09', '2025-05-19 21:15:55', 8, 42),
(662, 'Senior Executive - Production Planning', 'No Description', 36, 167, 'Ranala', 1, NULL, 'job_images/WDJMnXhV0AUQMkanwm796Gdlmsu5EW0NiTvt4l60.jpg', NULL, 107, 1, NULL, '2025-06-05', '2025-04-29 14:04:32', NULL, 'approved', 'contact_contributor', NULL, 'J100297', 1, '2025-04-29 17:49:43', '2025-05-19 19:32:36', 8, 32),
(663, 'Interns - Compliance and Occupational Safety', 'No Description', 44, 193, 'Awissawella', 1, NULL, 'job_images/IXVsT9xgSRNgHjFxoJv062FuusdEnJrTWViLiYjA.jpg', NULL, 108, 1, NULL, '2025-06-05', '2025-04-29 14:04:41', NULL, 'approved', 'contact_contributor', NULL, 'J100298', 1, '2025-04-29 17:51:58', '2025-05-20 08:48:50', 8, 40),
(664, 'Analyst - ESG', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/eeQ9yFGtKyNbE0QEbfvwdoozC3N2FULDjBMP77CY.jpg', NULL, 88, 1, NULL, '2025-06-05', '2025-04-29 14:04:49', NULL, 'approved', 'contact_contributor', NULL, 'J100299', 1, '2025-04-29 17:54:05', '2025-05-20 09:34:12', 8, 41),
(665, 'Factory Superior', 'No Description', 36, 167, 'Minuwangoda', 1, NULL, 'job_images/Tm3T4l7wMCkXFuEmUnSN0NSbiFgwTZziNaoDOPMC.png', NULL, 109, 1, NULL, '2025-06-05', '2025-04-29 14:05:00', NULL, 'approved', 'contact_contributor', NULL, 'J100300', 1, '2025-04-29 17:57:48', '2025-05-19 12:03:16', 8, 37),
(666, 'Production Supervisor', 'No Description', 36, 167, 'Kurunegala', 1, NULL, 'job_images/00R68qSmqYln8tRqvgKeQUONL9Q21RozDpF2xhDN.png', NULL, 110, 1, NULL, '2025-06-05', '2025-04-29 14:05:11', NULL, 'approved', 'contact_contributor', NULL, 'J100301', 1, '2025-04-29 18:01:12', '2025-05-19 11:33:03', 8, 48),
(667, 'Production Manager', 'No Description', 36, 167, 'Colombo', 1, NULL, 'job_images/p3gbvXEIU7eslGG0M5PdnfD1SbqyKdYph3LQXmvG.png', NULL, 111, 1, NULL, '2025-06-05', '2025-04-29 14:05:20', NULL, 'approved', 'contact_contributor', NULL, 'J100302', 1, '2025-04-29 18:03:50', '2025-05-19 07:39:11', 8, 31),
(668, 'Assistant R&D', 'No Description', 37, 289, 'Alawwa', 1, NULL, 'job_images/upBCtIhRm8pTvrsU06z4jrX2UZVcC2JS1mPZb89a.png', NULL, 104, 1, NULL, '2025-06-05', '2025-04-29 14:14:49', NULL, 'approved', 'contact_contributor', NULL, 'J100303', 1, '2025-04-29 18:08:56', '2025-05-20 09:38:00', 8, 63),
(669, 'Lab Assistant', 'No Description', 37, 290, 'Hanwella', 1, NULL, 'job_images/TVMq11K5rMQGxiGWNKtyEBRA1MjoH9joG4IcywPP.png', NULL, 112, 1, NULL, '2025-06-05', '2025-04-29 14:14:58', NULL, 'approved', 'contact_contributor', NULL, 'J100304', 1, '2025-04-29 18:11:43', '2025-05-20 03:44:59', 8, 50),
(670, 'Laboratory Manager', 'No Description', 37, 290, 'Colombo', 1, NULL, 'job_images/UyCPvH860iStx0PE2aiDtmN1EeaXKVCNy14H7kbh.jpg', NULL, 27, 1, 1, '2025-06-05', '2025-04-29 14:15:08', NULL, 'approved', 'contact_contributor', NULL, 'J100305', 1, '2025-04-29 18:14:16', '2025-05-20 01:56:11', 8, 47),
(671, 'Microbiology Lab Technician', 'No Description', 37, 290, 'Malwana', 1, NULL, 'job_images/D1NTqAYVF7Upx4p8t5yEi7kPTsiffUwoQ3qrbxaR.png', NULL, 113, 1, NULL, '2025-06-05', '2025-04-29 14:24:04', NULL, 'approved', 'contact_contributor', NULL, 'J100306', 1, '2025-04-29 18:18:39', '2025-05-19 16:54:31', 8, 47),
(672, 'Manager R&D', 'No Description', 37, 289, 'Ja Ela', 1, NULL, 'job_images/6E11MUobeY5waOEO6usDKJ9JYI6Z7BerWvQWTJgP.jpg', NULL, 37, 1, NULL, '2025-06-05', '2025-04-29 14:24:23', NULL, 'approved', 'contact_contributor', NULL, 'J100307', 1, '2025-04-29 18:24:05', '2025-05-20 10:26:16', 8, 39),
(673, 'Laboratory Technician', 'No Description', 37, 289, 'Colombo', 1, NULL, 'job_images/xBLmMEdTkxEkMpD6IgjmA4Es7d8vcH2SmpQmEe8v.png', NULL, 114, 1, NULL, '2025-06-05', '2025-04-29 14:31:58', NULL, 'approved', 'contact_contributor', NULL, 'J100308', 1, '2025-04-29 18:29:25', '2025-05-20 10:46:38', 8, 40),
(674, 'Laboratory Technician', 'No Description', 37, 289, 'Colombo', 1, NULL, 'job_images/mkg63arngjqgxgzJo3qlnAP0KeiRZZM6ApRiAaVB.png', 'R&D', 114, 1, NULL, '2025-06-05', '2025-04-29 14:32:07', NULL, 'approved', 'contact_contributor', NULL, 'J100309', 1, '2025-04-29 18:31:01', '2025-05-20 11:10:55', 8, 41),
(675, 'Data Entry Operator', 'No Description', 5, 88, 'Colombo', 1, NULL, 'job_images/BkkawGH3Dm1ws5lhEqKZs0X9J5pcfaWsoY0Cextv.png', NULL, 115, 1, NULL, '2025-06-05', '2025-04-29 14:40:14', NULL, 'approved', 'contact_contributor', NULL, 'J100310', 1, '2025-04-29 18:39:49', '2025-05-19 17:26:24', 8, 82),
(676, 'Call Center Executives', 'No Description', 5, 90, 'Nugegoda', 1, NULL, 'job_images/HUeBQJkKYVu8TriQNCBkjpohVPYcfC922jlEfchp.png', NULL, 27, 1, 1, '2025-06-05', '2025-04-29 14:43:25', NULL, 'approved', 'contact_contributor', NULL, 'J100311', 1, '2025-04-29 18:43:06', '2025-05-20 09:47:57', 8, 49),
(677, 'Customer Experience Specialist', 'No Description', 5, 88, 'Colombo', 1, NULL, 'job_images/LfKwYIQ2Hc5pr6vJei4s9dpVsOL7BCTiCzRUjU29.png', NULL, 116, 1, NULL, '2025-06-06', '2025-04-30 00:51:22', NULL, 'approved', 'contact_contributor', NULL, 'J100312', 1, '2025-04-30 04:51:08', '2025-05-20 04:00:35', 8, 50),
(678, 'Manager Business Banking', 'No Description', 23, 132, 'Colombo', 1, NULL, 'job_images/jivOe5xmBVXN8WODqzhGH9A97WNY5i4J6ktaRTqk.jpg', NULL, 76, 1, NULL, '2025-05-06', '2025-04-30 01:05:16', NULL, 'approved', 'contact_contributor', NULL, 'J100313', 1, '2025-04-30 04:54:13', '2025-05-20 06:53:53', 8, 33),
(679, 'Regional Lawyer - North East', 'No Description', 9, 211, 'North East', 1, NULL, 'job_images/uQXmvsfrE34XLwiToJCqBjmgYWhmoaUoDlctTJYB.jpg', NULL, 117, 1, NULL, '2025-06-06', '2025-04-30 01:05:31', NULL, 'approved', 'contact_contributor', NULL, 'J100314', 1, '2025-04-30 04:57:18', '2025-05-20 08:15:12', 8, 30),
(680, 'Resident Manager & All Hotel Vacancies', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/gjQhQOhzfbFrJNQLMj9ivVMUutRu3AeFi0yxeF69.jpg', NULL, 118, 1, NULL, '2025-06-06', '2025-04-30 01:05:40', NULL, 'approved', 'contact_contributor', NULL, 'J100315', 1, '2025-04-30 05:05:08', '2025-05-19 10:21:51', 8, 32),
(681, 'Chief Engineer', 'No Description', 2, 226, 'Colombo', 1, NULL, 'job_images/W0ugpFEP2OyjkQsqm6o8oirqm2kGlljfnaCGnc8A.jpg', NULL, 119, 1, NULL, '2025-06-06', '2025-04-30 01:08:30', NULL, 'approved', 'contact_contributor', NULL, 'J100316', 1, '2025-04-30 05:08:18', '2025-05-19 07:25:57', 8, 44),
(682, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/64CrB1QRNlkgagodqrjA3le6YZhQsMRCeuGoXhYl.png', NULL, 120, 1, NULL, '2025-06-06', '2025-04-30 01:11:37', NULL, 'approved', 'contact_contributor', NULL, 'J100317', 1, '2025-04-30 05:11:19', '2025-05-19 20:34:49', 8, 54),
(683, 'Executive/Jnr Executive - Gold Loan', 'No Description', 43, 215, 'All Island', 1, NULL, 'job_images/t8pCJVFCDW65UlZWObcvpvkUPxAVfTFklAhxYYEq.jpg', NULL, 121, 1, NULL, '2025-06-06', '2025-04-30 16:01:57', NULL, 'approved', 'contact_contributor', NULL, 'J100318', 1, '2025-04-30 20:01:30', '2025-05-20 01:25:06', 8, 38),
(684, 'Quantity Surveyors/Procurement Officer', 'No Description', 2, 225, 'Kurunegala', 1, NULL, 'job_images/NI2HjnKlO0nG3hNISrwiHAuyddW2ejfImgQSsqIq.jpg', NULL, 122, 1, NULL, '2025-06-06', '2025-04-30 16:05:48', NULL, 'approved', 'contact_contributor', NULL, 'J100319', 1, '2025-04-30 20:05:24', '2025-05-19 15:29:42', 8, 40),
(685, 'Operations Manager', 'No Description', 21, 122, 'Papuwa New Guinea', 65, NULL, 'job_images/2RCcPBTtjJL8SoMDTajLVwI0PNXHKeNvbqM0aCe3.jpg', NULL, 123, 1, NULL, '2025-06-06', '2025-04-30 16:10:41', NULL, 'approved', 'contact_contributor', NULL, 'J100320', 1, '2025-04-30 20:10:19', '2025-05-18 11:42:54', 8, 28),
(686, 'Compliance Officer', 'No Description', 9, 211, 'Colombo', 1, NULL, 'job_images/3hn2n6SKdh97K0JrB1rR3pkt8AseTROcULOOaZyw.png', NULL, 124, 1, NULL, '2025-06-06', '2025-04-30 16:21:17', NULL, 'approved', 'contact_contributor', NULL, 'J100321', 1, '2025-04-30 20:21:01', '2025-05-18 14:52:28', 8, 30),
(687, 'Director - Legal', 'No Description', 9, 211, 'Colombo', 1, NULL, 'job_images/noLRaIGcfnE3QB0ucUcQUEYQcw9b2sqZ0JE0DkDr.png', NULL, 27, 1, 1, '2025-06-06', '2025-04-30 16:23:44', NULL, 'approved', 'contact_contributor', NULL, 'J100322', 1, '2025-04-30 20:23:34', '2025-05-17 10:57:16', 8, 33),
(688, 'Legal Officer', 'No Description', 9, 211, 'Colombo', 1, NULL, 'job_images/Uwl2c6lIMZJhRBH2wbTdiUb4mprCjtF5vSjRmvcM.jpg', NULL, 125, 1, NULL, '2025-06-06', '2025-04-30 16:31:21', NULL, 'approved', 'contact_contributor', NULL, 'J100323', 1, '2025-04-30 20:26:38', '2025-05-20 10:18:15', 8, 36),
(689, 'Legal Clerk', 'No Description', 9, 211, 'Colombo', 1, NULL, 'job_images/wyHkgkMVOjR3qoS4F6kKUnZbolLsPnUjAPjL8ovY.png', NULL, 126, 1, NULL, '2025-06-06', '2025-04-30 16:31:33', NULL, 'approved', 'contact_contributor', NULL, 'J100324', 1, '2025-04-30 20:31:10', '2025-05-20 05:48:54', 8, 40),
(690, 'Content Manager/Executive', 'No Description', 10, 250, 'Remote', 1, NULL, 'job_images/6uDlKQgGPiYjI3n27FKADPihhw35T0D6cQRXOaWd.png', NULL, 127, 1, NULL, '2025-06-06', '2025-04-30 16:42:31', NULL, 'approved', 'contact_contributor', NULL, 'J100325', 1, '2025-04-30 20:42:12', '2025-05-19 10:30:11', 8, 40),
(691, 'Group Heads - PR & Marcomms', 'No Description', 10, 251, 'Colombo', 1, NULL, 'job_images/eUHcUqU7Jk22Wl3t7XjK4HovydEncbfGEODAC8Hm.png', NULL, 128, 1, NULL, '2025-06-06', '2025-04-30 16:45:45', NULL, 'approved', 'contact_contributor', NULL, 'J100326', 1, '2025-04-30 20:45:24', '2025-05-20 02:36:25', 8, 36),
(692, 'Digital Marketing Executive', 'Leather Collection', 10, 251, 'Colombo', 1, NULL, 'job_images/lMTuKEjeSFTRl1KQLkGjX9Xz4RjYIndtUAZHCkig.png', NULL, 27, 1, 1, '2025-06-06', '2025-04-30 16:49:01', NULL, 'approved', 'contact_contributor', NULL, 'J100327', 1, '2025-04-30 20:48:47', '2025-05-19 12:30:03', 8, 38),
(693, 'Social Media Managers', 'No Description', 10, 251, 'Colombo', 1, NULL, 'job_images/8ZbF2XsNaRoiLSXGhtyhb0wd8ffgp9SwOqDca4ei.png', NULL, 129, 1, NULL, '2025-06-06', '2025-04-30 16:54:07', NULL, 'approved', 'contact_contributor', NULL, 'J100328', 1, '2025-04-30 20:51:48', '2025-05-20 08:18:26', 8, 29),
(694, 'Digital Media Specialists', 'No Description', 10, 251, 'Colombo', 1, NULL, 'job_images/sYE9DmMWPcDJL5Ay1QYH3LqC2rWq8TzVErMv2OdT.jpg', NULL, 27, 1, 1, '2025-06-06', '2025-04-30 16:54:18', NULL, 'approved', 'contact_contributor', NULL, 'J100329', 1, '2025-04-30 20:53:55', '2025-05-18 20:28:00', 8, 40),
(695, 'Social Media Analysts - Advertising', 'No Description', 10, 251, 'Colombo', 1, NULL, 'job_images/6rjIPft5xJZ1XeiLrHET50nmkcuU50pIPA0CBs4m.jpg', NULL, 130, 1, NULL, '2025-06-06', '2025-04-30 16:58:10', NULL, 'approved', 'contact_contributor', NULL, 'J100330', 1, '2025-04-30 20:57:59', '2025-05-19 16:45:52', 8, 28),
(696, 'Junior Content Writer', 'No Description', 10, 251, 'Colombo', 1, NULL, 'job_images/IcpHuIMR6P77anEalqoEFm9i1AojcS4MqlV9Rg2d.jpg', NULL, 130, 1, NULL, '2025-06-06', '2025-04-30 16:58:19', NULL, 'approved', 'contact_contributor', NULL, 'J100331', 1, '2025-04-30 20:58:00', '2025-05-19 07:03:48', 8, 28),
(697, 'Assistant Manager ESG', 'No Description', 26, 135, 'Colombo', 1, NULL, 'job_images/b3qJUZoSQLoaAsiD7FUhpNtWz3jXbqs2m0Duoudq.png', NULL, 88, 1, NULL, '2025-06-06', '2025-04-30 17:11:50', NULL, 'approved', 'contact_contributor', NULL, 'J100332', 1, '2025-04-30 21:09:00', '2025-05-16 14:23:30', 8, 33),
(698, 'Quality Auditor', 'No Description', 26, 134, 'Colombo', 1, NULL, 'job_images/JoOtaIanSwsXJtM5JUsrC92q6aEZzkgZt38BfSns.png', NULL, 131, 1, NULL, '2025-06-06', '2025-04-30 17:12:15', NULL, 'approved', 'contact_contributor', NULL, 'J100333', 1, '2025-04-30 21:11:59', '2025-05-19 17:01:02', 8, 51),
(699, 'Junior Secretary', 'No Description', 9, 211, 'Kotugoda', 1, NULL, 'job_images/A0UNIc2m2dSiMG7BKY8mX7vz8W3OtHhjEu5eMKBt.png', NULL, 132, 1, NULL, '2025-06-08', '2025-05-01 04:42:11', NULL, 'approved', 'contact_contributor', NULL, 'J100334', 1, '2025-05-01 08:39:19', '2025-05-19 20:18:02', 8, 31),
(700, 'Executive - Cost Accounts', 'No Description', 3, 229, 'Colombo 03', 1, NULL, 'job_images/ntHq8HDPDtWWzV5gIMxPc4kWs12mOkbh6NgwRZQw.jpg', NULL, 133, 1, NULL, '2025-06-08', '2025-05-01 05:05:41', NULL, 'approved', 'contact_contributor', NULL, 'J100335', 1, '2025-05-01 09:04:53', '2025-05-20 10:25:48', 8, 32),
(701, 'Planning Assistant', 'No Description', 21, 122, 'Bandaragama', 1, NULL, 'job_images/SbypSVCGIvda68UyLrmRzMgVa0QzPpwsPOZGQ5Km.png', NULL, 134, 1, NULL, '2025-06-08', NULL, '2025-05-01 07:16:49', 'reject', 'contact_contributor', 'Not matching Top Jobs ads', 'J100336', 1, '2025-05-01 09:38:37', '2025-05-01 11:16:49', 8, 0),
(702, 'Program Coordinator', 'No Description', 1, 80, 'Maharagama', 1, NULL, 'job_images/hIP5r3mumP975m79RWC5YTMQUX1kvma0RcDzQE6K.png', NULL, 135, 1, NULL, '2025-06-08', '2025-05-01 07:17:06', NULL, 'approved', 'contact_contributor', NULL, 'J100337', 1, '2025-05-01 09:46:26', '2025-05-20 10:02:56', 8, 40),
(703, 'Data Entry Officer', 'No Description', 11, 254, 'Colombo 02', 1, NULL, 'job_images/3HfdtHNnezD89OIpcHzzJTYF1iWR9gPWOGqCEkPI.jpg', NULL, 137, 1, NULL, '2025-06-08', '2025-05-01 07:17:19', NULL, 'approved', 'contact_contributor', NULL, 'J100338', 1, '2025-05-01 10:18:20', '2025-05-19 22:46:04', 8, 61),
(704, 'Cashiers', 'No Description', 5, 89, 'Colombo', 1, NULL, 'job_images/CvUQ0XRwgS6GgyVrtKlw2owR8tM8ScIuetFE94tA.png', NULL, 138, 1, NULL, '2025-06-08', '2025-05-01 07:17:29', NULL, 'approved', 'contact_contributor', NULL, 'J100339', 1, '2025-05-01 10:32:40', '2025-05-19 11:11:34', 8, 48),
(705, 'Female Waiters', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/OIGPiIHHH64Fb4ITOyDuROuVoBhbWtPFJiwDJ8GU.png', NULL, 139, 1, NULL, '2025-06-08', '2025-05-01 07:17:43', NULL, 'approved', 'contact_contributor', NULL, 'J100340', 1, '2025-05-01 11:04:15', '2025-05-18 14:05:45', 8, 33),
(706, 'Creative Graphic Designer', 'No Description', 48, 202, 'Colombo', 1, NULL, 'job_images/jikTMXhunVI6graC5Bor9nO583S7kScN0H743z5R.jpg', NULL, 141, 1, NULL, '2025-06-08', '2025-05-01 07:30:06', NULL, 'approved', 'contact_contributor', NULL, 'J100341', 1, '2025-05-01 11:28:57', '2025-05-19 16:52:56', 8, 38),
(707, 'Assistant Accountant & Cashiers', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/b3I1G1QfSwrBmoU8wKCv08pdEv3rPCPTC1MZG7LE.png', NULL, 142, 1, NULL, '2025-06-08', '2025-05-01 08:32:54', NULL, 'approved', 'contact_contributor', NULL, 'J100342', 1, '2025-05-01 12:02:33', '2025-05-19 16:38:57', 8, 37),
(708, 'Nutritionist - Animal Feed', 'No Description', 26, 135, 'Battaramulla', 1, NULL, 'job_images/KFGhHEXQtjlTWyEgzMhP7o2kcsWx5avFpp0hqfh6.jpg', NULL, 143, 1, NULL, '2025-06-08', '2025-05-01 08:33:07', NULL, 'approved', 'contact_contributor', NULL, 'J100343', 1, '2025-05-01 12:13:13', '2025-05-20 10:10:17', 8, 43),
(709, 'Quantity Surveyor', 'No Description', 12, 96, 'Rathnapura', 1, NULL, 'job_images/gcz5j8iEEKihsKQqgAgzDRS3NGfAHQ0DJrAivQmI.jpg', '.', 144, 1, NULL, '2025-06-08', '2025-05-01 08:33:25', NULL, 'approved', 'contact_contributor', NULL, 'J100344', 1, '2025-05-01 12:21:45', '2025-05-20 00:44:35', 8, 34),
(710, 'Audit trainee', 'No Description', 3, 230, 'Colombo', 1, NULL, 'job_images/IeGqqGba3xIOEHzhcQ4qta6kF2ezsJ99uABztM3S.jpg', NULL, 145, 1, NULL, '2025-06-08', '2025-05-01 08:33:44', NULL, 'approved', 'contact_contributor', NULL, 'J100345', 1, '2025-05-01 12:28:07', '2025-05-20 10:26:54', 8, 43),
(711, 'Manager Internal Audit', 'No Description', 3, 230, 'Colombo', 1, NULL, 'job_images/5mba6V7dZoHeIl7ZwMPIrrmcIlknWUgwjEDV7fRf.jpg', NULL, 146, 1, NULL, '2025-06-08', '2025-05-01 08:34:05', NULL, 'approved', 'contact_contributor', NULL, 'J100346', 1, '2025-05-01 12:33:50', '2025-05-20 06:54:38', 8, 36),
(712, 'Civil Engineer', 'No Description', 12, 96, 'Colombo', 1, NULL, 'job_images/slbqqx5FoldK0VmAvTj0cYbhImlbwRUn8ZWCqOAw.png', NULL, 147, 1, NULL, '2025-06-08', '2025-05-01 08:40:40', NULL, 'approved', 'contact_contributor', NULL, 'J100347', 1, '2025-05-01 12:38:44', '2025-05-20 00:21:27', 8, 37),
(713, 'Monitoring Officer', 'No Description', 1, 80, 'Colombo', 1, NULL, 'job_images/i2631FyfIsKOHjms4uAgDhn2CGI5tadnFvroHRTn.jpg', NULL, 136, 1, NULL, '2025-06-08', '2025-05-01 11:18:53', NULL, 'approved', 'contact_contributor', NULL, 'J100348', 1, '2025-05-01 14:26:30', '2025-05-19 05:26:47', 8, 34),
(714, 'cashier', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/AbMTuwwFXcFqYsW4ZuEoR1GT5g5ChyBHIRbF3kDI.jpg', NULL, 148, 1, NULL, '2025-06-08', '2025-05-01 11:19:05', NULL, 'approved', 'contact_contributor', NULL, 'J100349', 1, '2025-05-01 14:40:52', '2025-05-19 16:36:28', 8, 36),
(715, 'Marketing Executive', 'No Description', 13, 100, 'Malabe', 1, NULL, 'job_images/xJTI08MRBEKYqoODqJJEDtGKxScVmC54NnI5elnt.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-01 15:13:08', NULL, 'approved', 'contact_contributor', NULL, 'J100350', 1, '2025-05-01 18:36:34', '2025-05-20 10:25:31', 8, 32),
(716, 'Admission Officer / Student Counselor / TELE Marketer', 'No Description', 6, 243, 'Dhaka', 10, NULL, 'job_images/7B2RwlrSpAWOvhrQBZe3Z5W0zhGaIip9uRTghX1t.jpg', NULL, 149, 1, NULL, '2025-06-08', '2025-05-01 15:13:30', NULL, 'approved', 'contact_contributor', NULL, 'J100351', 1, '2025-05-01 18:45:22', '2025-05-18 09:53:41', 8, 29),
(717, 'Regional Manager - Eastern Province', 'No Description', 43, 216, 'Eastern Province', 1, NULL, 'job_images/opLdkXuYrRmSnnFl8uCBwMlTOcD3HLiXyrCgVDHV.jpg', NULL, 150, 1, NULL, '2025-06-08', '2025-05-01 15:13:52', NULL, 'approved', 'contact_contributor', NULL, 'J100352', 1, '2025-05-01 18:54:07', '2025-05-18 15:38:13', 8, 34),
(718, 'Recoveries Officer', 'No Description', 43, 216, 'All Island', 1, NULL, 'job_images/eEJSE12x3WFoCvYHbPA1dUVfPVvCu4dgm4hM3HHI.jpg', NULL, 150, 1, NULL, '2025-06-08', '2025-05-01 15:14:17', NULL, 'approved', 'contact_contributor', NULL, 'J100353', 1, '2025-05-01 18:56:25', '2025-05-19 14:01:56', 8, 34),
(719, 'Manger Audit', 'No Description', 43, 216, 'Colombo', 1, NULL, 'job_images/2oSF6vb8fCkksKlDhXAnEKOygmAOW8jcuSmuM9AW.jpg', NULL, 150, 1, NULL, '2025-06-08', '2025-05-01 15:14:30', NULL, 'approved', 'contact_contributor', NULL, 'J100354', 1, '2025-05-01 18:58:49', '2025-05-18 06:11:16', 8, 31),
(720, 'Trainee Officer ( Female)', 'No Description', 43, 216, 'Colombo', 1, NULL, 'job_images/kxIMkbHiGpk7FdPHJYho2ZJQd7FNK1pHzT0lK5YB.jpg', NULL, 150, 1, NULL, '2025-06-08', '2025-05-01 15:14:40', NULL, 'approved', 'contact_contributor', NULL, 'J100355', 1, '2025-05-01 19:01:09', '2025-05-19 17:29:48', 8, 41),
(721, 'Officer, Talent Acquisition & Employer Branding', 'No Description', 23, 132, 'Dhaka', 10, NULL, 'job_images/6GQSUfXIg3Go16xO9AJ2QMg3p7BLYV3xM35ELbPv.jpg', NULL, 151, 1, NULL, '2025-06-08', '2025-05-01 15:15:02', NULL, 'approved', 'contact_contributor', NULL, 'J100356', 1, '2025-05-01 19:06:19', '2025-05-19 11:23:59', 8, 35),
(722, 'Relationship Manager / Financial Planning Manager', 'No Description', 23, 133, 'Colombo', 1, NULL, 'job_images/yWhGKj8eUh61aC7y7FdhKogk9b7iY81cliYFW0xp.jpg', NULL, 152, 1, NULL, '2025-06-08', '2025-05-01 15:15:19', NULL, 'approved', 'contact_contributor', NULL, 'J100357', 1, '2025-05-01 19:11:29', '2025-05-19 18:34:18', 8, 33),
(723, 'Motor Mechanic / Auto Electrician / Auto painter / Auto Denter', 'No Description', 30, 273, 'Qatar', 17, NULL, 'job_images/ugR0t4Brmlew7JcnZ23STT7yw8qNkLJiJhuy089l.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-01 15:33:07', NULL, 'approved', 'contact_contributor', NULL, 'J100358', 1, '2025-05-01 19:18:42', '2025-05-19 18:09:53', 8, 35),
(724, 'Instrumentation Technician', 'No Description', 50, 287, 'Homagama', 1, NULL, 'job_images/vVrwMMLzHSkqI1Gl4OF3A3wc8bFkzDV5g4kYHkdq.jpg', NULL, 153, 1, NULL, '2025-06-08', '2025-05-01 15:33:19', NULL, 'approved', 'contact_contributor', NULL, 'J100359', 1, '2025-05-01 19:25:25', '2025-05-18 11:41:36', 8, 31),
(725, 'Admission Officer', 'No Description', 46, 195, 'KUWAIT', 45, NULL, 'job_images/KNwCG9Nqr1k3dc4LVN1NVFY3P1RlFDTBgZ1wDSzJ.jpg', NULL, 154, 1, NULL, '2025-06-08', '2025-05-01 15:33:29', NULL, 'approved', 'contact_contributor', NULL, 'J100360', 1, '2025-05-01 19:32:41', '2025-05-19 12:51:26', 8, 37),
(726, 'Brand Promoters', 'No Description', 4, 235, 'Negombo', 1, NULL, 'job_images/ryyle7lujiOygMtDoQ4gpXfd1Yxl4Q4Dw6iAVThK.jpg', NULL, 155, 1, NULL, '2025-06-08', '2025-05-01 15:46:10', NULL, 'approved', 'contact_contributor', NULL, 'J100361', 1, '2025-05-01 19:41:17', '2025-05-19 05:46:25', 8, 31),
(727, 'Call Center / Administration / Training Supervisor / HR manager', 'No Description', 46, 195, 'Dehiwela', 1, NULL, 'job_images/2yZQQidRVap1tAtec6kFUawwmxktD7Rk4BamkKjY.jpg', NULL, 156, 1, NULL, '2025-06-08', '2025-05-01 15:50:17', NULL, 'approved', 'contact_contributor', NULL, 'J100362', 1, '2025-05-01 19:46:56', '2025-05-19 07:10:49', 8, 34),
(728, 'Cashier - Female', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/KDFHqqoe4Pc7wEHe4R4jnHIKZ12W8jwluV6wn9eE.jpg', NULL, 157, 1, NULL, '2025-06-08', '2025-05-01 15:58:50', NULL, 'approved', 'contact_contributor', NULL, 'J100363', 1, '2025-05-01 19:54:59', '2025-05-18 22:02:09', 8, 30),
(729, 'Sales Representative', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/7OinrzH2AmqIzB1Q5LKRWuGa2yvVO5uT8YundrD4.png', NULL, 64, 1, NULL, '2025-06-08', '2025-05-01 15:58:59', NULL, 'approved', 'contact_contributor', NULL, 'J100364', 1, '2025-05-01 19:57:34', '2025-05-19 12:37:00', 8, 33),
(730, 'Relationship Manager/Ass. Marketing Manager', 'No Description', 43, 216, 'Kandy', 1, NULL, 'job_images/HyEzfsntpwyQ3RIYSnFpFdLiaKIBifq3TJxsADip.jpg', NULL, 158, 1, NULL, '2025-07-07', '2025-05-02 10:32:27', NULL, 'approved', 'contact_contributor', NULL, 'J100365', 1, '2025-05-02 14:31:59', '2025-05-20 10:24:07', 8, 31),
(731, 'Battery Showroom Executive', 'No Description', 28, 141, 'Colombo', 1, NULL, 'job_images/VuttQQkV4jhu90rV8n7D2vNRx8QBzcn2JUlLBsTw.jpg', NULL, 159, 1, NULL, '2025-07-07', '2025-05-02 10:40:22', NULL, 'approved', 'contact_contributor', NULL, 'J100366', 1, '2025-05-02 14:39:32', '2025-05-20 08:21:13', 8, 35),
(732, 'Branch Manager', 'No Description', 43, 216, 'Colombo', 1, NULL, 'job_images/QrK8mwEQjedi05tLvaVfWImiim1KiPVm5Pnvud3R.jpg', NULL, 160, 1, NULL, '2025-07-07', '2025-05-02 10:51:19', NULL, 'approved', 'contact_contributor', NULL, 'J100367', 1, '2025-05-02 14:44:21', '2025-05-20 09:25:40', 8, 31),
(733, 'Jnr Executive/Executive - Gold Loan', 'No Description', 43, 216, 'Borella', 1, NULL, 'job_images/3CLthUSqujmMZGej9cqNjNUw2iM4ET799eVk12Wm.jpg', NULL, 160, 1, NULL, '2025-07-07', '2025-05-02 10:51:30', NULL, 'approved', 'contact_contributor', NULL, 'J100368', 1, '2025-05-02 14:44:21', '2025-05-19 08:22:45', 8, 25),
(734, 'Accountant/HR Executive/Store Keeper', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/xobry8kr8bRfwZ8GduuTZ433cdcd6M88URyElJpD.jpg', NULL, 161, 1, NULL, '2025-07-07', '2025-05-02 10:51:40', NULL, 'approved', 'contact_contributor', NULL, 'J100369', 1, '2025-05-02 14:48:42', '2025-05-19 13:58:11', 8, 32),
(735, 'Senior Video Producer & Motion Manager', 'No Description', 10, 251, 'Foreign Jobs', 65, NULL, 'job_images/18LcYSycdWEClWquV3NmgJAZfjjhw7tqnNJyIYx9.jpg', NULL, 162, 1, NULL, '2025-07-07', '2025-05-02 11:09:54', NULL, 'approved', 'contact_contributor', NULL, 'J100370', 1, '2025-05-02 15:06:20', '2025-05-19 16:40:31', 8, 33),
(736, 'SEO & Email Marketing Specialist', 'No Description', 4, 234, 'Foreign Job', 65, NULL, 'job_images/h0segWKVLRX81Tpvg4rLeiIlNji3xTl1gR7KJdlH.jpg', NULL, 162, 1, NULL, '2025-07-07', '2025-05-02 11:10:08', NULL, 'approved', 'contact_contributor', NULL, 'J100371', 1, '2025-05-02 15:06:20', '2025-05-18 00:40:49', 8, 31),
(737, 'Graphic Designer', 'No Description', 15, 106, 'Foreign Job', 65, NULL, 'job_images/MMqcaIMp4Ib1ZcCyJaK6Bob6Xsr60udWCicOLA6P.jpg', NULL, 162, 1, NULL, '2025-07-07', '2025-05-02 11:10:23', NULL, 'approved', 'contact_contributor', NULL, 'J100372', 1, '2025-05-02 15:06:20', '2025-05-20 09:46:35', 8, 40),
(738, 'Ass.Manager Marketing & Strategy', 'No Description', 4, 238, 'Foreign Job', 65, NULL, 'job_images/3OAD2PmCJgFrMEPSrrefvpzSEhfKL8hkl0BSEi93.jpg', NULL, 162, 1, NULL, '2025-07-07', '2025-05-02 11:10:38', NULL, 'approved', 'contact_contributor', NULL, 'J100373', 1, '2025-05-02 15:06:20', '2025-05-18 21:45:07', 8, 27),
(739, 'Snr Video Producer & Motion Designer', 'No Description', 15, 106, 'Foreign Jobs', 65, NULL, 'job_images/mBuBIQr09IMrHH0IUY9ZBqCswDHhLpEl6QRKRDBb.jpg', NULL, 162, 1, NULL, '2025-07-07', '2025-05-02 11:10:54', NULL, 'approved', 'contact_contributor', NULL, 'J100374', 1, '2025-05-02 15:09:48', '2025-05-19 21:46:30', 8, 32),
(740, 'Assistant Brand Manager', 'No Description', 4, 235, 'Karachchi', 13, NULL, 'job_images/WoZQnwU8f2jtWq5hSacLKGHEJPPzxmeWp2ndbNj4.jpg', NULL, 163, 1, NULL, '2025-07-07', '2025-05-02 11:14:22', NULL, 'approved', 'contact_contributor', NULL, 'J100375', 1, '2025-05-02 15:14:01', '2025-05-19 12:23:12', 8, 29),
(741, 'Area Manager/Snr Terriory Manager', 'No Description', 4, 235, 'Foreign Jobs', 13, NULL, 'job_images/WPnW8rEs1flTY5w5zuQyIIHCuymsU3lNmxnzgp1V.jpg', NULL, 164, 1, NULL, '2025-07-07', '2025-05-02 11:18:13', NULL, 'approved', 'contact_contributor', NULL, 'J100376', 1, '2025-05-02 15:17:33', '2025-05-20 00:44:33', 8, 25),
(742, 'Customer Representative officer', 'No Description', 46, 196, 'Larhore', 13, NULL, 'job_images/1Vh47rRCaro9eHU0swduwvPEsassqcQla4xGmCuI.jpg', NULL, 165, 1, NULL, '2025-07-07', '2025-05-02 11:22:42', NULL, 'approved', 'contact_contributor', NULL, 'J100377', 1, '2025-05-02 15:22:22', '2025-05-19 18:31:21', 8, 27),
(743, 'Officer - Logistic', 'No Description', 11, 254, 'Open', 1, NULL, 'job_images/yYTmj9ju09jGtPbQmTIHwSunrenxLxzlwPBvNZoh.jpg', NULL, 166, 1, NULL, '2025-07-07', '2025-05-02 11:35:22', NULL, 'approved', 'contact_contributor', NULL, 'J100378', 1, '2025-05-02 15:34:58', '2025-05-19 17:30:22', 8, 38),
(744, 'Social Development Leader', 'No Description', 8, 74, 'Bangladesh', 10, NULL, 'job_images/PiXJfFHq2rATQye0o0iD6SYp9W1zMBxTShN3FkYk.jpg', NULL, 167, 1, NULL, '2025-07-07', '2025-05-02 11:44:04', NULL, 'approved', 'contact_contributor', NULL, 'J100379', 1, '2025-05-02 15:43:47', '2025-05-19 09:53:36', 8, 32),
(745, 'International Sales Executive', 'No Description', 4, 235, 'Ratmalana', 1, NULL, 'job_images/Srpyu6VKwmut15gYKDZhmewOJLCMlK4Mx8DSUKHr.jpg', NULL, 168, 1, NULL, '2025-06-06', '2025-05-02 11:47:20', NULL, 'approved', 'contact_contributor', NULL, 'J100380', 1, '2025-05-02 15:47:03', '2025-05-18 16:00:58', 8, 26),
(746, 'Sales Executive', 'No Description', 4, 238, 'Athurugiriya', 1, NULL, 'job_images/Pm9wjrpOVLSdqUBGiufhdUc1PaR2UhmwyDUjwVsH.jpg', NULL, 169, 1, NULL, '2025-06-08', '2025-05-03 09:44:32', NULL, 'approved', 'contact_contributor', NULL, 'J100381', 1, '2025-05-03 13:22:30', '2025-05-19 13:16:58', 8, 28),
(747, 'Manager / Sr.Manager (Admin, HR & Compliance )', 'No Description', 46, 195, 'Narayanganj', 10, NULL, 'job_images/rO2slF6NY54Clw51OAacPERkbFdNzs9tAsOZDAOA.jpg', NULL, 170, 1, NULL, '2025-06-08', '2025-05-03 09:44:46', NULL, 'approved', 'contact_contributor', NULL, 'J100382', 1, '2025-05-03 13:30:23', '2025-05-19 16:53:41', 8, 26),
(748, 'Sales Executive', 'No Description', 4, 238, 'Hanwella', 1, NULL, 'job_images/sOMDyDkKFzjw9PVA34kk9QRQ5Oj6O7As7fjY28Lr.jpg', NULL, 171, 1, NULL, '2025-06-08', '2025-05-03 09:44:56', NULL, 'approved', 'contact_contributor', NULL, 'J100383', 1, '2025-05-03 13:37:40', '2025-05-18 22:04:31', 8, 22),
(749, 'Management Trainee', 'No Description', 43, 214, 'Bangladesh', 10, NULL, 'job_images/KjDsZTtRqAWGr9OddVNshTeMgz3ra2GCkFIMREyh.jpg', NULL, 172, 1, NULL, '2025-06-08', '2025-05-03 09:45:17', NULL, 'approved', 'contact_contributor', NULL, 'J100384', 1, '2025-05-03 13:43:07', '2025-05-18 16:31:51', 8, 26),
(750, 'Sr Student Counselor (Australia)', 'No Description', 6, 240, 'Banani', 10, NULL, 'job_images/veYio0KXbtaOGtvAIDjpgEksIyjCBzuyyRBe2ihS.jpg', NULL, 173, 1, NULL, '2025-06-08', '2025-05-03 09:55:57', NULL, 'approved', 'contact_contributor', NULL, 'J100385', 1, '2025-05-03 13:52:45', '2025-05-19 23:35:48', 8, 28),
(751, 'IT Technicians/Interns', 'Nugegoda', 1, 80, 'Nugegoda', 1, NULL, 'job_images/pLFq5bdvotwIs79LahxwglHpPVSToA9XiyejrXMo.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-05-03 16:38:02', NULL, 'approved', 'contact_contributor', NULL, 'J100386', 1, '2025-05-03 20:37:48', '2025-05-20 10:08:47', 8, 57),
(752, 'Finance Internship', 'No Description', 3, 229, 'Nugegoda', 1, NULL, 'job_images/BleAwbe8FLbCadyk0TxEE79eYPbujrQNpiibULor.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-05-03 16:39:20', NULL, 'approved', 'contact_contributor', NULL, 'J100387', 1, '2025-05-03 20:39:12', '2025-05-19 10:57:19', 8, 44),
(753, 'Sales Executive/Field Officers/Coordinators', 'No Description', 4, 235, 'Nugegoda', 1, NULL, 'job_images/5qManpU5YdYbkM9EuXphpLZ5ogVIuN3XWicbpkhe.jpg', NULL, 27, 1, 1, '2025-06-03', '2025-05-03 16:41:13', NULL, 'approved', 'contact_contributor', NULL, 'J100388', 1, '2025-05-03 20:41:04', '2025-05-17 19:35:45', 8, 40),
(754, 'Show room Manager / Dealers & Franchise Dealers', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/g3dLSfMrsUAw7LKniX5p2NqfPgVnA4DSvJ9q7DQQ.jpg', NULL, 174, 1, NULL, '2025-06-08', '2025-05-04 11:19:59', NULL, 'approved', 'contact_contributor', NULL, 'J100389', 1, '2025-05-04 14:33:04', '2025-05-20 05:55:56', 8, 33),
(755, 'Beauticians (Female)', 'No Description', 20, 270, 'Kandy & Kiribathgoda', 1, NULL, 'job_images/u2O6vNaV3afVg5MBO3HSLYpIYow6pXo6sXCCxXIB.jpg', NULL, 175, 1, NULL, '2025-06-08', '2025-05-04 11:20:09', NULL, 'approved', 'contact_contributor', NULL, 'J100390', 1, '2025-05-04 14:45:22', '2025-05-20 08:00:29', 8, 27),
(756, 'Sales Manger / Designer', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/rsKAHz8lIV6s36aoW92Zcai5dkX4BntsjTgCjwQf.jpg', NULL, 176, 1, NULL, '2025-06-08', '2025-05-04 11:20:25', NULL, 'approved', 'contact_contributor', NULL, 'J100391', 1, '2025-05-04 14:53:51', '2025-05-20 06:58:54', 8, 27),
(757, 'Factory Manager / Accountant / Accounts Assistant', 'No Description', 3, 229, 'Piliyandala', 1, NULL, 'job_images/yhkJgxRvl2jf3dbikh817WakmSpZjr7pzJpmUsCA.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-04 11:20:37', NULL, 'approved', 'contact_contributor', NULL, 'J100392', 1, '2025-05-04 15:09:26', '2025-05-20 03:22:38', 8, 27),
(758, 'Pattern Maker / Graphic Designers', 'No Description', 48, 202, 'Piliyandala', 1, NULL, 'job_images/KEQRIBmyA3qXLguYNqiKFwj1WIfF15xgPIPLhUDR.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-04 11:20:51', NULL, 'approved', 'contact_contributor', NULL, 'J100393', 1, '2025-05-04 15:12:22', '2025-05-20 09:31:17', 8, 33),
(759, 'Accounts and Cash Management role', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/M3Zb0zghWNYwJSvSzxeMa84k0Mh740iI7yZKUGDk.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-04 11:20:59', NULL, 'approved', 'contact_contributor', NULL, 'J100394', 1, '2025-05-04 15:14:35', '2025-05-20 10:26:14', 8, 38),
(760, 'Asst. Administration Manager', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/vpH15IVzH11DawdTbm2b6paE3bNVIsy7Rusw0AQH.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-04 11:21:07', NULL, 'approved', 'contact_contributor', NULL, 'J100395', 1, '2025-05-04 15:17:53', '2025-05-20 03:25:15', 8, 32),
(761, 'Inventory and Pricing Analyst', 'No Description', 3, 229, 'Makati City', 55, NULL, 'job_images/1ee6TXHrJGj9clE7P1iBWHO4ivGjRBEwJdDhilXh.jpg', NULL, 177, 1, NULL, '2025-06-08', '2025-05-04 12:07:03', NULL, 'approved', 'contact_contributor', NULL, 'J100396', 1, '2025-05-04 15:54:15', '2025-05-20 07:09:33', 8, 29),
(762, 'Tele Sales Executives', 'No Description', 4, 234, 'Colombo 04', 1, NULL, 'job_images/AcqCJB5XKsPl9gCjEeHzYSNTZ0lnlFblNpi9pTME.jpg', NULL, 178, 1, NULL, '2025-06-08', '2025-05-04 12:07:16', NULL, 'approved', 'contact_contributor', NULL, 'J100397', 1, '2025-05-04 16:00:19', '2025-05-20 07:23:06', 8, 22),
(763, 'Accountant', 'No Description', 3, 229, 'Makati City', 55, NULL, 'job_images/fvQgRjVMCEAJ2OtweiGXEgM2bOVf0xvv1dYyhsFc.jpg', NULL, 177, 1, NULL, '2025-06-08', '2025-05-04 12:07:28', NULL, 'approved', 'contact_contributor', NULL, 'J100398', 1, '2025-05-04 16:03:15', '2025-05-20 07:37:54', 8, 26),
(764, 'Solar Technician', 'No Description', 50, 287, 'Colombo', 1, NULL, 'job_images/g0XwOSktZpxXhV3Sig5Pyth2flYGmZ3yOE8pFBAy.jpg', NULL, 179, 1, NULL, '2025-06-08', '2025-05-04 12:07:40', NULL, 'approved', 'contact_contributor', NULL, 'J100399', 1, '2025-05-04 16:07:17', '2025-05-20 07:57:01', 8, 25),
(765, 'Accountant Executive (Male)', 'No Description', 3, 229, 'Colombo 01', 1, NULL, 'job_images/UaCdkW42kiBZ5b9ivjAOmGeGbqrIXidWmuMCb80v.jpg', NULL, 180, 1, NULL, '2025-06-08', '2025-05-04 14:49:07', NULL, 'approved', 'contact_contributor', NULL, 'J100400', 1, '2025-05-04 18:12:01', '2025-05-20 08:09:00', 8, 22),
(766, 'Data Entry Officer', 'No Description', 46, 195, 'Colombo 01', 1, NULL, 'job_images/5JfkJGF3uhiGWXuO63CcZBiazmZuFZ7xzwyQHF67.jpg', NULL, 180, 1, NULL, '2025-06-08', '2025-05-04 14:49:15', NULL, 'approved', 'contact_contributor', NULL, 'J100401', 1, '2025-05-04 18:14:12', '2025-05-20 08:15:34', 8, 43),
(767, 'Sales Administrative Assistant', 'No Description', 46, 195, 'Boralasgamuwa', 1, NULL, 'job_images/cJCGO2VNBaWvqY2dnIEXMcgtCvpgXStRxBcr3urV.jpg', NULL, 181, 1, NULL, '2025-06-08', '2025-05-04 14:49:26', NULL, 'approved', 'contact_contributor', NULL, 'J100402', 1, '2025-05-04 18:20:42', '2025-05-20 08:35:29', 8, 22),
(768, 'Assistant Manager - Treasury', 'No Description', 3, 231, 'Colombo', 1, NULL, 'job_images/XzZPbc2fiaMT8j0Q2soLuYDbKCjkuFlmyE4zKcJk.jpg', NULL, 182, 1, NULL, '2025-06-08', '2025-05-04 15:01:32', NULL, 'approved', 'contact_contributor', NULL, 'J100403', 1, '2025-05-04 18:52:47', '2025-05-20 08:45:24', 8, 24),
(769, 'Assistant Accountant', 'No Description', 3, 229, 'Kandy', 1, NULL, 'job_images/mAvHBakLvXeBYFVaADjP0qQ28mpaXKNI0fGXouJq.jpg', NULL, 183, 1, NULL, '2025-06-08', '2025-05-04 15:01:53', NULL, 'approved', 'contact_contributor', NULL, 'J100404', 1, '2025-05-04 18:58:41', '2025-05-20 09:24:23', 8, 49),
(770, 'Therapist (Males & Female )', 'No Description', 20, 272, 'Kandy', 1, NULL, 'job_images/F3jL0RwcpeL0HXKrYYYjvYvk8cRTgQ83c565saqx.jpg', NULL, 183, 1, NULL, '2025-06-08', '2025-05-04 15:11:19', NULL, 'approved', 'contact_contributor', NULL, 'J100405', 1, '2025-05-04 19:01:53', '2025-05-20 08:25:15', 8, 29),
(771, 'Receptionist / Kitchen Helper', 'No Description', 13, 99, 'Kandy', 1, NULL, 'job_images/6LIoN0um8XUqkkJroCoJppDQ0sxBfIblXUwldvAk.jpg', NULL, 183, 1, NULL, '2025-06-08', '2025-05-04 15:11:28', NULL, 'approved', 'contact_contributor', NULL, 'J100406', 1, '2025-05-04 19:05:10', '2025-05-20 08:28:33', 8, 34),
(772, 'Marketing Executive / Client Relationship Coordinator', 'No Description', 4, 238, 'Rathmalana', 1, NULL, 'job_images/dcL9feWWfJL0v7WMqR7nuhtTB73SFJhHGTtoFRmi.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-04 15:11:42', NULL, 'approved', 'contact_contributor', NULL, 'J100407', 1, '2025-05-04 19:10:40', '2025-05-20 03:26:13', 8, 31),
(773, 'Assistant Quantity Surveyor', 'No Description', 2, 225, 'Colombo 01', 1, NULL, 'job_images/e7qb6sm34nUwxJRKbRDYZ9kZBZVIskzIjEpYJzhB.jpg', NULL, 184, 1, NULL, '2025-06-08', '2025-05-04 15:18:36', NULL, 'approved', 'contact_contributor', NULL, 'J100408', 1, '2025-05-04 19:16:52', '2025-05-20 08:51:13', 8, 28),
(774, 'Executive - Administration & General Affairs', 'No Description', 46, 195, 'Rajagiriya', 1, NULL, 'job_images/kO47385a76qkSSXxvosdum3Md0lb9EzNOi3HsXn0.jpg', NULL, 185, 1, NULL, '2025-06-08', '2025-05-04 15:30:47', NULL, 'approved', 'contact_contributor', NULL, 'J100409', 1, '2025-05-04 19:22:45', '2025-05-20 08:54:12', 8, 27),
(775, 'Account Assistant', 'No Description', 3, 229, 'Kottawa', 1, NULL, 'job_images/bjmWvWe4IsjehPmtFL2FzZ048mCxM1DiNWmcuMf3.jpg', NULL, 186, 1, NULL, '2025-06-08', '2025-05-04 15:31:14', NULL, 'approved', 'contact_contributor', NULL, 'J100410', 1, '2025-05-04 19:28:10', '2025-05-20 10:24:56', 8, 31),
(776, 'Financial Advisor', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/jE9jpICUQ1ExlJ54UGwoff5jIaTctgeJZMbFcG2V.jpg', NULL, 138, 1, NULL, '2025-06-08', '2025-05-04 15:42:04', NULL, 'approved', 'contact_contributor', NULL, 'J100411', 1, '2025-05-04 19:32:06', '2025-05-20 03:27:10', 8, 27),
(777, 'Account Executive', 'No Description', 3, 229, 'Thalawathugoda', 1, NULL, 'job_images/aGegNw7Ug6l0JOxnEcCkpetYNjsViD1XFwASg36f.jpg', NULL, 187, 1, NULL, '2025-06-08', '2025-05-04 15:42:16', NULL, 'approved', 'contact_contributor', NULL, 'J100412', 1, '2025-05-04 19:36:56', '2025-05-20 09:10:38', 8, 23);
INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(778, 'Ticketing Executive', 'No Description', 47, 261, 'Colombo', 1, NULL, 'job_images/U7nrKGRpAZoraGYEeN9kSjEae4WR7paYTV5lxwYR.jpg', NULL, 188, 1, NULL, '2025-06-08', '2025-05-04 15:51:41', NULL, 'approved', 'contact_contributor', NULL, 'J100413', 1, '2025-05-04 19:46:27', '2025-05-20 09:18:14', 8, 29),
(779, 'Senior Travel Executive /  Travel Executive', 'No Description', 47, 261, 'Colombo', 1, NULL, 'job_images/VgY1c4GkWgaO6J6lIwyUtO78GV9P6uYU1McmBWew.jpg', NULL, 188, 1, NULL, '2025-06-08', '2025-05-04 15:51:52', NULL, 'approved', 'contact_contributor', NULL, 'J100414', 1, '2025-05-04 19:48:50', '2025-05-20 09:29:32', 8, 27),
(780, 'Manager - credit Risk', 'No Description', 3, 232, 'Colombo', 1, NULL, 'job_images/xuixqAkfDAR1epmnjcSHxlJkHeAWcbstVZJBh2Nh.jpg', NULL, 74, 1, NULL, '2025-06-08', '2025-05-04 15:54:59', NULL, 'approved', 'contact_contributor', NULL, 'J100415', 1, '2025-05-04 19:54:04', '2025-05-20 08:01:23', 8, 24),
(781, 'Junior Accountant', 'No Description', 3, 229, 'Muntinlupa city', 55, NULL, 'job_images/m51MPHEj8DBjrT9BqJFg6wIRUqvK3OAbvMy8kJJR.jpg', NULL, 189, 1, NULL, '2025-06-08', '2025-05-06 04:03:54', NULL, 'approved', 'contact_contributor', NULL, 'J100416', 1, '2025-05-06 07:58:42', '2025-05-19 12:16:20', 8, 24),
(782, 'Accountants', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/lLVngj2SxWWfUC82NZHxJMRb0GK8Zt8NxNzXobXu.jpg', NULL, 190, 1, NULL, '2025-06-08', '2025-05-06 05:31:49', NULL, 'approved', 'contact_contributor', NULL, 'J100417', 1, '2025-05-06 08:33:42', '2025-05-20 09:40:57', 8, 28),
(783, 'Mechanical, Electric & Plumbing in Engineering', 'No Description', 6, 240, 'Nugegoda & Galle', 1, NULL, 'job_images/DnR8zvef23erT4KL06dsyqOYqIkQ7D6edv0Dvd4d.jpg', NULL, 190, 1, NULL, '2025-06-15', '2025-05-06 05:32:31', NULL, 'approved', 'contact_contributor', NULL, 'J100418', 1, '2025-05-06 08:39:54', '2025-05-18 06:23:02', 8, 25),
(784, 'Assistant Manager / Senior Associate', 'No Description', 3, 230, 'Colombo', 1, NULL, 'job_images/UKWaEXUBXKugkI59meYWWhYi7uISt8f3Dy1LiHGz.jpg', NULL, 191, 1, NULL, '2025-06-15', '2025-05-06 05:32:44', NULL, 'approved', 'contact_contributor', NULL, 'J100419', 1, '2025-05-06 08:44:13', '2025-05-19 03:36:52', 8, 20),
(785, 'Social Media / Digital Content Creator', 'No Description', 10, 249, 'Dehiwela', 1, NULL, 'job_images/14aMBRXtRgfLxRZi8kXyIkDlTMqHwrVFsGP2pJ20.jpg', NULL, 192, 1, NULL, '2025-06-15', '2025-05-06 05:32:57', NULL, 'approved', 'contact_contributor', NULL, 'J100420', 1, '2025-05-06 08:55:55', '2025-05-20 10:36:38', 8, 21),
(786, 'Executive - HR & Admini', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/iZKBHEuNunyluyX9mXZVAZZLrZnM3U6yu9U8AOae.jpg', NULL, 190, 1, NULL, '2025-06-15', '2025-05-06 05:33:08', NULL, 'approved', 'contact_contributor', NULL, 'J100421', 1, '2025-05-06 09:02:14', '2025-05-19 12:36:41', 8, 25),
(787, 'Sales Executive', 'No Description', 4, 235, 'Malabe', 1, NULL, 'job_images/a5kp60nHp2pZ7JTBJguRb58TsuHKm3SMtnlAkir6.jpg', NULL, 193, 1, NULL, '2025-06-15', '2025-05-06 05:33:43', NULL, 'approved', 'contact_contributor', NULL, 'J100422', 1, '2025-05-06 09:06:05', '2025-05-19 22:01:08', 8, 24),
(788, 'Branch Manager / Executive - Accounts', 'No Description', 3, 229, 'Rajagiriya', 1, NULL, 'job_images/6XP8dfURsFPsOcgmmEgKG0Ba9MQWEdTtm5hzMj6n.jpg', NULL, 194, 1, NULL, '2025-06-15', '2025-05-06 05:34:02', NULL, 'approved', 'contact_contributor', NULL, 'J100423', 1, '2025-05-06 09:15:16', '2025-05-19 19:03:48', 8, 23),
(789, 'Executive / Office In Charge - Gold Loan', 'No Description', 43, 215, 'Rajagiriya', 1, NULL, 'job_images/zioqh0WTnPCRq9GFh1zXZsKokhjy36XyPKCMraOr.jpg', NULL, 194, 1, NULL, '2025-06-15', '2025-05-06 05:34:12', NULL, 'approved', 'contact_contributor', NULL, 'J100424', 1, '2025-05-06 09:18:09', '2025-05-19 07:34:03', 8, 22),
(790, 'Executive / Senior Executive / Assistant Manager - Sales', 'No Description', 4, 238, 'Rajagiriya', 1, NULL, 'job_images/Zs8LpyGxGEPN5aAjhlFOzdTlq39KvwSXLt5NIFDZ.jpg', NULL, 194, 1, NULL, '2025-06-15', '2025-05-06 05:34:21', NULL, 'approved', 'contact_contributor', NULL, 'J100425', 1, '2025-05-06 09:20:18', '2025-05-19 19:20:19', 8, 22),
(791, 'Office Admin', 'No Description', 46, 195, 'Mount Lavinia', 1, NULL, 'job_images/h75OShcabtvErAsnmeaCuh8BmJUHaEAdpkyPhsKW.jpg', NULL, 195, 1, NULL, '2025-06-15', '2025-05-06 05:34:30', NULL, 'approved', 'contact_contributor', NULL, 'J100426', 1, '2025-05-06 09:24:51', '2025-05-20 00:13:44', 8, 26),
(792, 'Management Trainee - Marketing', 'No Description', 4, 238, 'Boralasgamuwa', 1, NULL, 'job_images/6PSJOqWtaYXYZ9Hfdluh2Gcx4VK5J3Vdd1XKiWIr.jpg', NULL, 190, 1, NULL, '2025-06-15', '2025-05-06 05:34:40', NULL, 'approved', 'contact_contributor', NULL, 'J100427', 1, '2025-05-06 09:28:19', '2025-05-19 14:55:17', 8, 31),
(793, 'Contact Center officers', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/1CM2oZgvC27yp9NKzkHwFl915GNQ7lTYUi90DFwF.jpg', NULL, 76, 1, NULL, '2025-06-08', '2025-05-06 07:31:16', NULL, 'approved', 'contact_contributor', NULL, 'J100428', 1, '2025-05-06 10:13:30', '2025-05-19 17:16:03', 8, 27),
(794, 'Director of Sales (Korean)', 'No Description', 4, 238, 'Korean', 43, NULL, 'job_images/vcFQwEBa1WjJk4IuANe2xzwgH8PSoLnlTNe28MvT.jpg', NULL, 196, 1, NULL, '2025-06-15', '2025-05-06 07:44:41', NULL, 'approved', 'contact_contributor', NULL, 'J100429', 1, '2025-05-06 11:33:39', '2025-05-19 17:58:37', 8, 27),
(795, 'Business Development Manager', 'No Description', 21, 122, 'Colombo', 1, NULL, 'job_images/OrRXuHitqtk0OwUL1cgEgW7bqsVRmC69nlLgmO05.jpg', NULL, 197, 1, NULL, '2025-06-15', '2025-05-06 08:13:11', NULL, 'approved', 'contact_contributor', NULL, 'J100430', 1, '2025-05-06 11:45:33', '2025-05-19 11:25:18', 8, 21),
(796, 'Learning and Development Officers', 'No Description', 6, 240, 'Colombo', 1, NULL, 'job_images/brzd724Bhgj78codKMnMyz4xHKp5QVpBbFj3UkDJ.jpg', NULL, 198, 1, NULL, '2025-06-15', '2025-05-06 08:13:25', NULL, 'approved', 'contact_contributor', NULL, 'J100431', 1, '2025-05-06 11:54:04', '2025-05-18 06:21:50', 8, 23),
(797, 'HVAC Control Technician / Senior HVAC Technician / HVAC Supervisor', 'No Description', 50, 287, 'Saudi', 63, NULL, 'job_images/ZeCL5A1mBhyXFO3Pxf0nl5pj7SkbpCH6jWt5OSNg.jpg', NULL, 199, 1, NULL, '2025-06-15', '2025-05-06 08:13:33', NULL, 'approved', 'contact_contributor', NULL, 'J100432', 1, '2025-05-06 12:02:28', '2025-05-19 16:35:13', 8, 25),
(798, 'Executive / Junior Executive / Merchant Management', 'No Description', 43, 214, 'Colombo', 1, NULL, 'job_images/YjkzR5jTMBgVOdIRU1IDM4bNhvfB4f4A5yV8JuqQ.jpg', NULL, 200, 1, NULL, '2025-06-15', '2025-05-06 08:13:52', NULL, 'approved', 'contact_contributor', NULL, 'J100433', 1, '2025-05-06 12:09:06', '2025-05-18 21:43:44', 8, 20),
(799, 'Secretary Student Coordinator', 'No Description', 46, 195, 'Maharagama', 1, NULL, 'job_images/gBLMd84MOijizgv8Cer3mMaVSfWa7oZaq6T8ef7Y.jpg', NULL, 201, 1, NULL, '2025-06-15', '2025-05-06 08:15:12', NULL, 'approved', 'contact_contributor', NULL, 'J100434', 1, '2025-05-06 12:14:44', '2025-05-19 11:54:37', 8, 22),
(800, 'Director of Food& Beverage / Banquet Manager / Event Coordinator', 'No Description', 31, 153, 'Mexico', 48, NULL, 'job_images/F5g72vclxJNbqoHcz5zZt1Kjsyofmwupjs4wjjQk.jpg', NULL, 202, 1, NULL, '2025-06-15', '2025-05-06 09:19:45', NULL, 'approved', 'contact_contributor', NULL, 'J100435', 1, '2025-05-06 12:31:51', '2025-05-19 05:32:05', 8, 27),
(801, 'staff', 'No Description', 46, 195, 'Malaysia', 15, NULL, 'job_images/CZUmAvqEdMgBxFFye0JuikAAhtxY5moQKR42nBHu.jpg', NULL, 203, 1, NULL, '2025-06-15', '2025-05-06 11:19:58', NULL, 'approved', 'contact_contributor', NULL, 'J100436', 1, '2025-05-06 14:27:17', '2025-05-19 20:50:09', 8, 28),
(802, 'Risk Analyst', 'No Description', 3, 232, 'Colombo 04', 1, NULL, 'job_images/NkAt2rsNFNFRkTYTmtGDHpafJsgy3LwV5DRThvOO.jpg', NULL, 48, 1, NULL, '2025-06-15', '2025-05-06 11:20:06', NULL, 'approved', 'contact_contributor', NULL, 'J100437', 1, '2025-05-06 14:37:45', '2025-05-19 17:04:30', 8, 26),
(803, 'Marketing Executive / Students Coordinator / Receptionist', 'No Description', 4, 238, 'Mawathagama & Kaduwela', 1, NULL, 'job_images/iH2Kcw38Frig6k9X6BgAVSFSPRBidcLB4OZLhYb7.jpg', NULL, 190, 1, NULL, '2025-06-15', '2025-05-06 11:20:26', NULL, 'approved', 'contact_contributor', NULL, 'J100438', 1, '2025-05-06 14:43:46', '2025-05-19 19:21:03', 8, 26),
(804, 'Executive - Accounts & Inventory Management', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/q2Qc6fwLYKliaUkUEI7cj9WMFVl6ITiXCvxUZLeq.jpg', NULL, 204, 1, NULL, '2025-06-15', '2025-05-06 11:20:37', NULL, 'approved', 'contact_contributor', NULL, 'J100439', 1, '2025-05-06 14:48:19', '2025-05-20 08:24:36', 8, 23),
(805, 'Business Development Manager', 'No Description', 21, 122, 'Colombo 03', 1, NULL, 'job_images/Di04j99lSLPHaMebDgp1TOAN2GKBkVoVYcd80kG2.jpg', NULL, 190, 1, NULL, '2025-06-15', '2025-05-06 11:20:48', NULL, 'approved', 'contact_contributor', NULL, 'J100440', 1, '2025-05-06 15:12:11', '2025-05-18 06:24:11', 8, 20),
(806, 'Research, Evaluation, Assessment & Quality Assurance Manager', 'No Description', 37, 289, 'Colombo', 1, NULL, 'job_images/rDgghSjO5lVcSjzsPJVShf8HgFepRQjBmy25qWBl.jpg', NULL, 198, 1, NULL, '2025-06-15', '2025-05-06 11:20:57', NULL, 'approved', 'contact_contributor', NULL, 'J100441', 1, '2025-05-06 15:18:52', '2025-05-19 19:29:57', 8, 27),
(807, 'Financial Reporting and Tax Assistant Manager', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/IZzFBjnjHmQwFLoFL2OHtxjXw3DfArvfnpPToRNa.jpg', NULL, 205, 1, NULL, '2025-06-15', '2025-05-06 11:31:29', NULL, 'approved', 'contact_contributor', NULL, 'J100442', 1, '2025-05-06 15:26:17', '2025-05-19 16:06:30', 8, 25),
(808, 'Executive - HR', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/OzjCq7e3zivgBQMzKPV9Gt3i6sbjwT2uFBvzeEVt.jpg', NULL, 206, 1, NULL, '2025-05-17', '2025-05-06 11:31:38', NULL, 'approved', 'contact_contributor', NULL, 'J100443', 1, '2025-05-06 15:30:21', '2025-05-20 05:10:51', 8, 33),
(810, 'Accountant / Assistant Accountant', 'No Description', 3, 229, 'Negombo', 1, NULL, 'job_images/9PgnaPK8xnk5BiXsQZ9bnulPM9d3ECV7uGQYh6DP.jpg', NULL, 207, 1, NULL, '2025-06-15', '2025-05-06 11:37:48', NULL, 'approved', 'contact_contributor', NULL, 'J100445', 1, '2025-05-06 15:37:19', '2025-05-20 10:28:41', 8, 25),
(811, 'QA Executives', 'No Description', 2, 225, 'Colombo', 1, NULL, 'job_images/rNEPRldRDsxMWmT8hH9QJdeE0DfIn7HShtNwnTB3.jpg', NULL, 38, 1, NULL, '2025-06-15', '2025-05-06 15:51:05', NULL, 'approved', 'contact_contributor', NULL, 'J100446', 1, '2025-05-06 19:42:52', '2025-05-19 14:10:01', 8, 28),
(812, 'Account Assistant', 'No Description', 3, 229, 'Malabe', 1, NULL, 'job_images/YDxImZJIkd3xmFxm8SK54qtoVy9lIaaahTEiFRgm.jpg', NULL, 190, 1, NULL, '2025-06-15', '2025-05-06 15:51:27', NULL, 'approved', 'contact_contributor', NULL, 'J100447', 1, '2025-05-06 19:46:19', '2025-05-20 10:28:57', 8, 28),
(813, 'Marketing Assistant / Supervisor', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/7wzJy3BnJy9osCYPNVSvN7Tb1505QdcYTiwQj0bA.jpg', NULL, 208, 1, NULL, '2025-06-15', '2025-05-06 16:04:03', NULL, 'approved', 'contact_contributor', NULL, 'J100448', 1, '2025-05-06 19:51:43', '2025-05-19 14:42:40', 8, 27),
(814, 'Account  Assistant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/lpz4ztMsBP4c6nFizbp4R4pAxgHN7qqyG8qm6nHj.jpg', NULL, 208, 1, NULL, '2025-06-15', '2025-05-06 16:04:14', NULL, 'approved', 'contact_contributor', NULL, 'J100449', 1, '2025-05-06 19:52:46', '2025-05-20 10:29:15', 8, 29),
(815, 'Account Assistant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/WzHOtU2SVaPrx5sa86SHM97f98tH9Fo94V2J0D8B.jpg', NULL, 209, 1, NULL, '2025-06-15', '2025-05-06 16:27:14', NULL, 'approved', 'contact_contributor', NULL, 'J100450', 1, '2025-05-06 20:26:22', '2025-05-19 12:05:43', 8, 26),
(816, 'Head of Business Development / Academic Program Advisor / Student Counsellor', 'No Description', 21, 123, 'Colombo', 1, NULL, 'job_images/4cJZZvfKTAPaODU5MZMYpMlIVzRek58zPfxVj1iX.jpg', NULL, 210, 1, NULL, '2025-06-15', '2025-05-06 16:57:41', NULL, 'approved', 'contact_contributor', NULL, 'J100451', 1, '2025-05-06 20:35:58', '2025-05-19 22:34:48', 8, 23),
(817, 'Chief Information Security Officer', 'No Description', 1, 79, 'Colombo', 1, NULL, 'job_images/ifvntNoq4vbT6RGUqeaniDAGPxkGIKjnqu1anktM.jpg', NULL, 48, 1, NULL, '2025-06-07', '2025-05-07 04:42:40', NULL, 'approved', 'contact_contributor', NULL, 'J100452', 1, '2025-05-07 08:42:23', '2025-05-18 06:28:56', 8, 37),
(818, 'On-Site Service Engineer', 'No Description', 1, 77, 'Island wide', 1, NULL, 'job_images/ty6xgfdNwV1AnqAGMwgqCtRlb88ALslO0lB0ut24.jpg', NULL, 211, 1, NULL, '2025-06-07', '2025-05-07 05:57:29', NULL, 'approved', 'contact_contributor', NULL, 'J100453', 1, '2025-05-07 09:57:14', '2025-05-19 11:16:43', 8, 26),
(819, 'Supervisor/Distributors/Crew Manager', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/5iuO3OVTeyImOi5mSjU1SuXH7bShIboai9xPIaU8.jpg', NULL, 190, 1, NULL, '2025-06-07', '2025-05-07 06:01:19', NULL, 'approved', 'contact_contributor', NULL, 'J100454', 1, '2025-05-07 10:00:53', '2025-05-19 22:54:44', 8, 26),
(820, 'Contact Centre Officers', 'No Description', 23, 132, 'Colombo', 1, NULL, 'job_images/OQHXL3X2Fd1yLWsF0QnP7Dc4FAgm7Lg1DEMhxymU.jpg', NULL, 76, 1, NULL, '2025-06-07', '2025-05-07 15:37:18', NULL, 'approved', 'contact_contributor', NULL, 'J100455', 1, '2025-05-07 19:37:09', '2025-05-19 07:14:30', 8, 20),
(821, 'Risk Analyst', 'No Description', 43, 216, 'Colombo', 1, NULL, 'job_images/ekYgSGIPFtOeeMOvW38xvk3bUpyhyKtmeSPEpj3o.jpg', NULL, 48, 1, NULL, '2025-06-07', '2025-05-07 15:44:48', NULL, 'approved', 'contact_contributor', NULL, 'J100456', 1, '2025-05-07 19:39:37', '2025-05-20 08:31:07', 8, 21),
(822, 'Jnr Executive Trainees', 'No Description', 23, 132, 'All Island', 1, NULL, 'job_images/Nfylg8ygq2AbizNpOub4vF2e1W5Jdhgu2gS9amcT.jpg', NULL, 190, 1, NULL, '2025-06-07', '2025-05-07 15:44:56', NULL, 'approved', 'contact_contributor', NULL, 'J100457', 1, '2025-05-07 19:42:20', '2025-05-20 09:49:18', 8, 36),
(823, 'Accounts Assistant', 'No Description', 3, 229, 'Malabe', 1, NULL, 'job_images/NFWusLolITtcE5pJ5FnCHwq6Yyaby0FVeWsHDbA6.jpg', NULL, 190, 1, NULL, '2025-06-07', '2025-05-07 15:45:04', NULL, 'approved', 'contact_contributor', NULL, 'J100458', 1, '2025-05-07 19:44:29', '2025-05-19 16:50:55', 8, 21),
(824, 'Business Development Manager', 'No Description', 29, 259, 'Colombo', 1, NULL, 'job_images/TCCfq44AO7LLgKkasNR98yuozd12rn4YeTyJFywF.jpg', NULL, 212, 1, NULL, '2025-06-07', '2025-05-07 16:02:42', NULL, 'approved', 'contact_contributor', NULL, 'J100459', 1, '2025-05-07 19:54:22', '2025-05-19 15:54:14', 8, 17),
(825, 'Secretary / Student Coordinator', 'No Description', 6, 240, 'Maharagama', 1, NULL, 'job_images/aqw3QV74r7s06jmnIwP7oGLjpjphlTJ62UaYcQt8.jpg', NULL, 190, 1, NULL, '2025-06-07', '2025-05-07 16:02:51', NULL, 'approved', 'contact_contributor', NULL, 'J100460', 1, '2025-05-07 20:02:21', '2025-05-20 06:48:00', 8, 20),
(826, 'Marketing Executive/Receptionist', 'Hightech Lanka International', 4, 235, 'Mawathagama/Kaduwela', 1, NULL, 'job_images/SIc3RDtCKirvTc6OX7OO5GckLXzKWZYmUwiR4tAn.jpg', NULL, 190, 1, NULL, '2025-06-07', '2025-05-07 16:03:04', NULL, 'approved', 'contact_contributor', NULL, 'J100461', 1, '2025-05-07 20:02:21', '2025-05-18 18:18:48', 8, 20),
(827, 'Audit Trainees', 'No Description', 3, 229, 'Nugegoda', 1, NULL, 'job_images/iej95TIVIooBbtiSNZBD2hTORJClgtHI0cZscxIQ.jpg', NULL, 190, 1, NULL, '2025-06-08', '2025-05-08 04:53:34', NULL, 'approved', 'contact_contributor', NULL, 'J100462', 1, '2025-05-08 08:53:03', '2025-05-19 15:09:02', 8, 20),
(828, 'Copy Writers (Sinhala & English)', 'No Description', 16, 109, 'Colombo', 1, NULL, 'job_images/F1xbQZjqh9e6KLZogiiINbYSIVtj0CwAebv9NIvs.jpg', NULL, 59, 1, NULL, '2025-06-08', '2025-05-08 04:56:24', NULL, 'approved', 'contact_contributor', NULL, 'J100463', 1, '2025-05-08 08:56:13', '2025-05-19 22:21:44', 8, 24),
(829, 'Accounts Assistant', 'No Description', 3, 229, 'Boralesgamuwa', 1, NULL, 'job_images/OBbVCLagNhg6ex9eL76zkb9fughNemPIiWgt5B0M.jpg', NULL, 190, 1, NULL, '2025-06-08', '2025-05-08 05:29:33', NULL, 'approved', 'contact_contributor', NULL, 'J100464', 1, '2025-05-08 09:29:22', '2025-05-19 10:58:41', 8, 20),
(830, 'Business Development Executives', 'No Description', 21, 123, 'Kohuwala', 1, NULL, 'job_images/0atQQMG56PLg5wRRHJl26OI9VO03zH6C9jNhIfvd.jpg', NULL, 213, 1, NULL, '2025-06-08', '2025-05-08 05:33:14', NULL, 'approved', 'contact_contributor', NULL, 'J100465', 1, '2025-05-08 09:33:02', '2025-05-20 10:19:20', 8, 17),
(831, 'Sales & Marketing Executive', 'No Description', 48, 201, 'Colombo', 1, NULL, 'job_images/Zug2xDi9PCFb1o2BD7lq9K7XvYiLPFabIyngURp1.jpg', NULL, 214, 1, NULL, '2025-06-08', '2025-05-08 05:36:35', NULL, 'approved', 'contact_contributor', NULL, 'J100466', 1, '2025-05-08 09:36:20', '2025-05-19 01:48:59', 8, 16),
(832, 'Recovery Officers', 'No Description', 43, 216, 'Nugegoda', 1, NULL, 'job_images/uQsGMoKiEgpR5PSjdRW6efvvPZuCdsq9oZec80lY.jpg', NULL, 215, 1, NULL, '2025-06-09', '2025-05-09 03:32:09', NULL, 'approved', 'contact_contributor', NULL, 'J100467', 1, '2025-05-09 07:31:46', '2025-05-20 00:04:20', 8, 20),
(833, 'Executive - Customer Service', 'No Description', 23, 133, 'Colombo', 1, NULL, 'job_images/XC26rshChDSCYnOVbcT1Pt3z6HBTPgoaIW0cDCAs.jpg', NULL, 35, 1, NULL, '2025-06-09', '2025-05-09 03:48:18', NULL, 'approved', 'contact_contributor', NULL, 'J100468', 1, '2025-05-09 07:38:41', '2025-05-19 19:50:29', 8, 22),
(834, 'Product management Executive', 'No Description', 4, 235, 'Rathmalana', 1, NULL, 'job_images/HxE1mImaCJdAwPPqKd9skQWkR34ygptH5KtAwwKV.jpg', NULL, 216, 1, NULL, '2025-06-09', '2025-05-09 03:48:29', NULL, 'approved', 'contact_contributor', NULL, 'J100469', 1, '2025-05-09 07:41:54', '2025-05-19 07:23:20', 8, 13),
(835, 'Sales Representatives', 'No Description', 4, 235, 'Kurunegala/Kandy/Kadawatha', 1, NULL, 'job_images/veIV47oHStCeSVUoIPBWlMVKdIth5YeZ3QP5gk0T.jpg', NULL, 217, 1, NULL, '2025-06-16', '2025-05-09 03:48:39', NULL, 'approved', 'contact_contributor', NULL, 'J100470', 1, '2025-05-09 07:45:47', '2025-05-19 11:33:18', 8, 18),
(836, 'Accountant/Accounts Executive', 'No Description', 3, 229, 'Malaysia', 15, NULL, 'job_images/b7DXRU4l6L8jU1RNKM6VMEXqytbqykprRl0JOzkG.jpg', NULL, 190, 1, NULL, '2025-06-16', '2025-05-09 03:48:48', NULL, 'approved', 'contact_contributor', NULL, 'J100471', 1, '2025-05-09 07:48:06', '2025-05-18 06:25:06', 8, 19),
(837, 'Senior Executive - Underiting', 'No Description', 23, 133, 'Colombo', 1, NULL, 'job_images/RqgOyiFe4XFjk61PqmioCPqPS4804vlSah3cWwus.jpg', NULL, 218, 1, NULL, '2025-06-09', '2025-05-09 10:42:06', NULL, 'approved', 'contact_contributor', NULL, 'J100472', 1, '2025-05-09 14:41:15', '2025-05-20 09:03:42', 8, 17),
(838, 'Brand Executive /Junior Executive', 'No Description', 43, 216, 'Colombo/Island wide', 1, NULL, 'job_images/mZxBikmCVIAIEGXtcd9TFfAsSOMbQAdMA3G7wWwK.jpg', NULL, 219, 1, NULL, '2025-06-09', '2025-05-09 10:46:00', NULL, 'approved', 'contact_contributor', NULL, 'J100473', 1, '2025-05-09 14:45:43', '2025-05-18 22:38:40', 8, 15),
(839, 'Chief Internal Auditor (CIA)', 'No Description', 23, 132, 'Colombo', 1, NULL, 'job_images/wfZ310eD8PExutPg4afPDVkuBl6OKfxC8KJpN0d9.jpg', NULL, 220, 1, NULL, '2025-06-16', '2025-05-09 10:49:53', NULL, 'approved', 'contact_contributor', NULL, 'J100474', 1, '2025-05-09 14:49:32', '2025-05-18 06:23:48', 8, 15),
(840, 'Leasing Marketing Team', 'No Description', 43, 216, 'Kottawa/Maharagama', 1, NULL, 'job_images/bFu9TR33uwCB377tZAbMunZU2FAaAT1ThFmB3hJQ.jpg', NULL, 221, 1, NULL, '2025-06-16', '2025-05-09 15:50:57', NULL, 'approved', 'contact_contributor', NULL, 'J100475', 1, '2025-05-09 19:50:41', '2025-05-20 10:32:30', 8, 16),
(841, 'Application Support/Business Analysts', 'No Description', 43, 216, 'Colombo', 1, NULL, 'job_images/C8MVJnUhjrvbLErv6VVWVfP13XUn1RZOWi9NpH6q.jpg', NULL, 121, 1, NULL, '2025-06-16', '2025-05-09 15:54:20', NULL, 'approved', 'contact_contributor', NULL, 'J100476', 1, '2025-05-09 19:52:41', '2025-05-20 10:21:30', 8, 26),
(842, 'Management Assistant/Data Entry Operator', 'No Description', 46, 196, 'Athurugiriya', 1, NULL, 'job_images/TjKs2qxcCVwG9CvRnd15StnMk4eAbGB8VdhdALTA.jpg', NULL, 222, 1, NULL, '2025-06-16', '2025-05-09 15:58:03', NULL, 'approved', 'contact_contributor', NULL, 'J100477', 1, '2025-05-09 19:57:41', '2025-05-19 16:52:34', 8, 18),
(843, 'Legal Officer', 'No Description', 9, 211, 'Colombo', 1, NULL, 'job_images/A9suubdYpbDQ6FnJIRGPDM1biFC8X2lKOBnRVcsm.jpg', NULL, 223, 1, NULL, '2025-06-16', '2025-05-09 16:01:37', NULL, 'approved', 'contact_contributor', NULL, 'J100478', 1, '2025-05-09 20:00:32', '2025-05-19 17:34:53', 8, 23),
(844, 'Cabin Crew', 'No Description', 47, 265, 'Dubai', 6, NULL, 'job_images/d4bTMiXCDlv35BshKrdSTlnd4mK2HZQ116fRFX4L.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 07:23:54', NULL, 'approved', 'contact_contributor', NULL, 'J100479', 1, '2025-05-10 10:03:52', '2025-05-20 08:03:36', 8, 24),
(845, 'Customer Care Assistants', 'No Description', 46, 195, 'All Island', 1, NULL, 'job_images/U0incExTyI5PkJhHYA7ywGxgeGoKJW6U9ikiYIaI.jpg', NULL, 224, 1, NULL, '2025-06-17', '2025-05-10 07:24:08', NULL, 'approved', 'contact_contributor', NULL, 'J100480', 1, '2025-05-10 10:13:14', '2025-05-20 04:06:16', 8, 23),
(846, 'Cook', 'No Description', 13, 99, 'Chinese', 24, NULL, 'job_images/ZaqZmtAWIEETpFYkX1ztzteaDwWyrpUqyDONykVq.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 07:24:31', NULL, 'approved', 'contact_contributor', NULL, 'J100481', 1, '2025-05-10 10:19:33', '2025-05-20 10:10:29', 8, 18),
(847, 'Cook', 'No Description', 13, 99, 'indian', 3, NULL, 'job_images/rnOm7z9EYHlH7q5TApd8pQ24dhk5HscJ7QT6rOJX.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 07:24:44', NULL, 'approved', 'contact_contributor', NULL, 'J100482', 1, '2025-05-10 10:20:58', '2025-05-19 07:16:24', 8, 20),
(848, 'IT Support technician', 'No Description', 1, 80, 'All Island', 1, NULL, 'job_images/9IgmFPUDTh9DS2HCF0ggw2RZbLGCzYq9hWJlRrkC.jpg', NULL, 225, 1, NULL, '2025-06-17', '2025-05-10 07:24:55', NULL, 'approved', 'contact_contributor', NULL, 'J100483', 1, '2025-05-10 10:36:31', '2025-05-20 09:59:15', 8, 35),
(849, 'Security Officer', 'No Description', 46, 195, 'Colombo 01', 1, NULL, 'job_images/GBcWzO6O526mUOMOyavrp25xixKCvuKHslFvwFfX.jpg', NULL, 226, 1, NULL, '2025-06-17', '2025-05-10 07:25:10', NULL, 'approved', 'contact_contributor', NULL, 'J100484', 1, '2025-05-10 10:46:15', '2025-05-19 17:17:02', 8, 16),
(850, 'Sales Manger', 'No Description', 4, 238, 'Banani', 10, NULL, 'job_images/TQAr5xno2W8i59Sty0LFOXhAT14wbTAkcRk4GlY8.jpg', NULL, 227, 1, NULL, '2025-06-17', '2025-05-10 07:25:28', NULL, 'approved', 'contact_contributor', NULL, 'J100485', 1, '2025-05-10 11:19:25', '2025-05-20 10:15:35', 8, 18),
(851, 'Digital Marketing Executive', 'No Description', 4, 234, 'Kaduwela', 1, NULL, 'job_images/JKwIuuiAE8EWsP4k33zrGGbmFzZVyxIve4ENCpVt.jpg', NULL, 228, 1, NULL, '2025-06-17', '2025-05-10 08:33:51', NULL, 'approved', 'contact_contributor', NULL, 'J100486', 1, '2025-05-10 11:34:30', '2025-05-19 07:28:02', 8, 15),
(852, 'Power Hands Plantation (PVT) Ltd', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/BcpHYMKqKRcton9uEd03bNFHBXXGzqNILy9auMi4.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 08:34:06', NULL, 'approved', 'contact_contributor', NULL, 'J100487', 1, '2025-05-10 11:39:09', '2025-05-19 17:35:18', 8, 28),
(853, 'Regional Manager/ Relationship Manager / Branch Manager / Business Development Manager / Sales Executives', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/NYrXoHGgSk0w5hmD80kT8AEOIQGitUPJqnSAxxB4.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 08:34:23', NULL, 'approved', 'contact_contributor', NULL, 'J100488', 1, '2025-05-10 11:44:02', '2025-05-19 16:25:36', 8, 19),
(854, 'Lead design Engineers / Quantity Surveyors / SR, QC Engineers / QC Engineers / QC Inspectors', 'No Description', 12, 96, 'Qatar', 17, NULL, 'job_images/R9Zfd4qaEwQxRRwQidrlfAAxZooBwD6PwkGYBZMg.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 08:35:11', NULL, 'approved', 'contact_contributor', NULL, 'J100489', 1, '2025-05-10 11:56:35', '2025-05-19 02:59:33', 8, 20),
(855, 'TEA Maker', 'No Description', 46, 195, 'Dubai', 6, NULL, 'job_images/Sj6l4pTSbBsMc7j2sk379UMlFeaEYD7AzzJ1jZYv.jpg', NULL, 229, 1, NULL, '2025-06-17', '2025-05-10 08:35:55', NULL, 'approved', 'contact_contributor', NULL, 'J100490', 1, '2025-05-10 12:12:56', '2025-05-19 09:44:38', 8, 14),
(856, 'Customer Support', 'No Description', 5, 90, 'Colombo', 1, NULL, 'job_images/pGN5e912ckcq4tUFXJelSrnx7YFWLTR6av7qolMx.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 08:36:10', NULL, 'approved', 'contact_contributor', NULL, 'J100491', 1, '2025-05-10 12:18:37', '2025-05-19 03:02:15', 8, 30),
(857, 'Cashiers & Crew Member', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/nMaaL0jvYDmZKhsait4rTQ6rMRw9h3gFdi2e6L5f.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 08:36:33', NULL, 'approved', 'contact_contributor', NULL, 'J100492', 1, '2025-05-10 12:21:48', '2025-05-20 08:47:46', 8, 22),
(858, 'Digital Strategy & Knowledge Manager', 'No Description', 10, 249, 'Colombo', 1, NULL, 'job_images/VlDvRnpp0wCazAaZCK0uUhUfGDFaBj8EA7Ekl0u5.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-10 08:36:46', NULL, 'approved', 'contact_contributor', NULL, 'J100493', 1, '2025-05-10 12:31:49', '2025-05-19 05:28:09', 8, 16),
(859, 'Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/6e82ZQMkKCa7u2aMVHkZprsZJtoPAuhj43d8jrFi.jpg', NULL, 230, 1, NULL, '2025-06-11', '2025-05-11 09:59:14', NULL, 'approved', 'contact_contributor', NULL, 'J100494', 1, '2025-05-11 13:58:11', '2025-05-20 08:42:12', 8, 14),
(860, 'Chief information Security officer', 'No Description', 1, 80, 'Colombo', 1, NULL, 'job_images/fh49BP2n5mTj0lqoqernicCDwCJRt7WlXPub39pu.jpg', NULL, 48, 1, NULL, '2025-06-11', '2025-05-11 10:05:11', NULL, 'approved', 'contact_contributor', NULL, 'J100495', 1, '2025-05-11 14:00:54', '2025-05-20 10:04:20', 8, 16),
(861, 'Business Development Executive', 'No Description', 13, 99, 'Kottawa', 1, NULL, 'job_images/14ceheC1t2nZqro5FUTN6uLm1XMrRl7GbaufaDFB.jpg', NULL, 231, 1, NULL, '2025-06-11', '2025-05-11 10:05:20', NULL, 'approved', 'contact_contributor', NULL, 'J100496', 1, '2025-05-11 14:04:53', '2025-05-19 09:55:50', 8, 11),
(862, 'Business Development Executive/Admin Officer', 'No Description', 13, 99, 'Male', 11, NULL, 'job_images/pY2QInndB2i6erVgXMG1m3xkNwc6NveRShhwmY88.jpg', NULL, 232, 1, NULL, '2025-06-11', '2025-05-11 10:09:25', NULL, 'approved', 'contact_contributor', NULL, 'J100497', 1, '2025-05-11 14:09:04', '2025-05-19 11:37:56', 8, 13),
(863, 'Elevator Technician/Supervisors', 'No Description', 50, 287, 'UAE, India, Maldives', 1, NULL, 'job_images/SptB2kLn6yfJfHSSmJiRcw7Krst0GY8CZZjr3qRQ.jpg', NULL, 190, 1, NULL, '2025-06-11', '2025-05-11 10:15:17', NULL, 'approved', 'contact_contributor', NULL, 'J100498', 1, '2025-05-11 14:12:06', '2025-05-19 03:18:08', 8, 13),
(864, 'Digital Power Snr Manager', 'Huawei - Nepal', 1, 80, 'Nepal', 51, NULL, 'job_images/VoNllX2DiMykI6rBlyRKETZj5cbXNJQu2nEUxT4x.jpg', NULL, 190, 1, NULL, '2025-06-11', '2025-05-11 10:15:27', NULL, 'approved', 'contact_contributor', NULL, 'J100499', 1, '2025-05-11 14:14:56', '2025-05-20 09:52:05', 8, 17),
(865, 'Customer Care Assistant', 'No Description', 36, 169, 'Island wide', 1, NULL, 'job_images/sa9lpPirBN0Vh7A1BTVcp26BvMGvwIdS62UJmHIu.jpg', NULL, 224, 1, NULL, '2025-06-11', '2025-05-11 10:21:31', NULL, 'approved', 'contact_contributor', NULL, 'J100500', 1, '2025-05-11 14:19:21', '2025-05-19 15:08:54', 8, 13),
(866, 'Sales Representatives', 'AROMA Tyres', 4, 235, 'Eastern Province', 1, NULL, 'job_images/lbdEdzQrKIrWhjbYoFBHJLog3WWfEFsl8w3RaGMm.jpg', NULL, 190, 1, NULL, '2025-06-11', '2025-05-11 10:21:41', NULL, 'approved', 'contact_contributor', NULL, 'J100501', 1, '2025-05-11 14:21:24', '2025-05-20 10:03:12', 8, 15),
(867, 'Outlet & Shift managers/ Trainees', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/Uvig0oilpr5Gc4YQZ0ZysL0gXHme8AgtFZLLuMFr.jpg', NULL, 233, 1, NULL, '2025-06-11', '2025-05-11 10:24:43', NULL, 'approved', 'contact_contributor', NULL, 'J100502', 1, '2025-05-11 14:24:30', '2025-05-20 11:19:54', 8, 16),
(868, 'Property Consultant', 'Rush2Home', 12, 98, 'Colombo', 1, NULL, 'job_images/L4d1PyrJOuYjmP1u6Rt0dyxwcNfxuuvvvNYsk2Yz.jpg', NULL, 190, 1, NULL, '2025-06-18', '2025-05-11 10:28:47', NULL, 'approved', 'contact_contributor', NULL, 'J100503', 1, '2025-05-11 14:28:35', '2025-05-19 03:30:20', 8, 16),
(869, 'Senior Quantity Surveyor', 'No Description', 12, 96, 'Colombo', 1, NULL, 'job_images/Dj54fBobVhYXmaETECNTjFVb8FjiybFHWYhlT6hN.jpg', NULL, 234, 1, NULL, '2025-06-17', '2025-05-12 04:10:34', NULL, 'approved', 'contact_contributor', NULL, 'J100504', 1, '2025-05-12 08:02:51', '2025-05-19 18:17:08', 8, 10),
(870, 'Senior Sales Executive', 'No Description', 4, 238, 'Rajagiriya', 1, NULL, 'job_images/pSIiIktDBcuZYjt3AwsMMtuGSNaGhopkrB3OjWyD.jpg', NULL, 235, 1, NULL, '2025-06-17', '2025-05-12 04:10:45', NULL, 'approved', 'contact_contributor', NULL, 'J100505', 1, '2025-05-12 08:07:15', '2025-05-20 10:01:49', 8, 12),
(871, 'Call Center Agent', 'No Description', 5, 90, 'South Africa', 20, NULL, 'job_images/jwliA4083SThr2XBt2LRUje2YelllyissYR2Ds9N.jpg', NULL, 236, 1, NULL, '2025-06-17', '2025-05-12 04:32:03', NULL, 'approved', 'contact_contributor', NULL, 'J100506', 1, '2025-05-12 08:15:28', '2025-05-19 18:21:45', 8, 12),
(872, 'Travel Consultant - Outbound tours', 'No Description', 13, 100, 'Colombo 11', 1, NULL, 'job_images/Xf9ym2x8K2UW1wjbyV8uTUBaCJyWvL6unsIVxXBl.jpg', NULL, 237, 1, NULL, '2025-06-17', '2025-05-12 04:32:19', NULL, 'approved', 'contact_contributor', NULL, 'J100507', 1, '2025-05-12 08:22:20', '2025-05-20 10:24:35', 8, 13),
(873, 'Junior Officer /  Junior Engineer', 'No Description', 45, 294, 'Makati City', 55, NULL, 'job_images/GuhmptA3Qdwtgf0Akt2QD1uOwurIsNjwaYyhrsWU.jpg', NULL, 238, 1, NULL, '2025-06-17', '2025-05-12 04:35:53', NULL, 'approved', 'contact_contributor', NULL, 'J100508', 1, '2025-05-12 08:33:13', '2025-05-19 18:27:02', 8, 11),
(874, 'Bar Utility', 'No Description', 31, 152, 'United Kingdom', 4, NULL, 'job_images/63UROIYz51TAAZex4nOgr3HSvfEO1pWBtNFLaXWu.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 05:05:23', NULL, 'approved', 'contact_contributor', NULL, 'J100509', 1, '2025-05-12 08:43:07', '2025-05-18 09:50:49', 8, 13),
(875, 'Area Sales Executives', 'No Description', 4, 238, 'Uyangoda', 1, NULL, 'job_images/Hp7MOIZGUOAMWCeBdk4jG5CJryZXDWj47e3NGR7R.jpg', NULL, 239, 1, NULL, '2025-06-17', '2025-05-12 05:05:36', NULL, 'approved', 'contact_contributor', NULL, 'J100510', 1, '2025-05-12 08:47:08', '2025-05-19 18:29:43', 8, 11),
(876, 'Van Driver Assistants X20', 'No Description', 11, 254, 'Delft', 1, NULL, 'job_images/FZ5d40HjSmHULAvrm21vhDj3MoWINYFaIWtqledl.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 05:05:46', NULL, 'approved', 'contact_contributor', NULL, 'J100511', 1, '2025-05-12 08:54:27', '2025-05-18 09:53:16', 8, 9),
(877, 'Deck Steward', 'No Description', 13, 99, 'United Kingdom', 4, NULL, 'job_images/D8TOGEDeqEjqopbEM7NFXlXDk6dzeQPKK0snqeSw.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 05:05:57', NULL, 'approved', 'contact_contributor', NULL, 'J100512', 1, '2025-05-12 08:57:25', '2025-05-20 08:16:34', 8, 14),
(878, 'Chemical Tankers', 'No Description', 11, 257, 'Makati City', 55, NULL, 'job_images/yN4E7Vr5BvrDJq40XvkQwPl7NosBst3cZRKCHeOQ.jpg', NULL, 240, 1, NULL, '2025-06-17', '2025-05-12 05:06:10', NULL, 'approved', 'contact_contributor', NULL, 'J100513', 1, '2025-05-12 09:04:53', '2025-05-20 09:59:03', 8, 12),
(879, 'Long Haul Trailer Truck Drivers', 'No Description', 11, 254, 'Ernakulum', 3, NULL, 'job_images/pTaz3s6Vc7uhhdYiRinklUpdEzmaMUDcL61IcFgL.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 05:32:28', NULL, 'approved', 'contact_contributor', NULL, 'J100514', 1, '2025-05-12 09:29:54', '2025-05-18 09:50:09', 8, 9),
(880, 'HR Assistant', 'No Description', 46, 195, 'Boralasgamuwa', 1, NULL, 'job_images/pEviXEgNcz8hK8JVdMQ7PE6BFFmK5GjDP6oUSub9.jpg', NULL, 241, 1, NULL, '2025-06-17', '2025-05-12 05:35:36', NULL, 'approved', 'contact_contributor', NULL, 'J100515', 1, '2025-05-12 09:35:13', '2025-05-19 18:34:08', 8, 11),
(881, 'HR Executive', 'No Description', 46, 195, 'Colombo 07', 1, NULL, 'job_images/C2NSpkrajz5BJKYDrB3JaaNIDlX0gF9CCU57IxsI.jpg', NULL, 242, 1, NULL, '2025-06-17', '2025-05-12 05:56:07', NULL, 'approved', 'contact_contributor', NULL, 'J100516', 1, '2025-05-12 09:54:47', '2025-05-19 19:11:58', 8, 17),
(882, 'HGV Drivers', 'No Description', 11, 254, 'United Kingdom', 4, NULL, 'job_images/pAiKeKtVtf5fTQQgFBHs54ezavWGqfKFc6h7gfpV.jpg', NULL, 243, 1, NULL, '2025-06-17', '2025-05-12 06:07:28', NULL, 'approved', 'contact_contributor', NULL, 'J100517', 1, '2025-05-12 10:01:54', '2025-05-19 18:38:36', 8, 12),
(883, 'Operational Executive', 'No Description', 46, 195, 'Boralasgamuwa', 1, NULL, 'job_images/yR2Lzim7jMhth4Z8zL6w4Wr9XU6BtF8lPFXJTNWv.jpg', NULL, 244, 1, NULL, '2025-06-17', '2025-05-12 06:18:21', NULL, 'approved', 'contact_contributor', NULL, 'J100518', 1, '2025-05-12 10:17:04', '2025-05-19 18:41:47', 8, 12),
(884, 'HR Officer', 'No Description', 46, 195, 'Ja-ela , Ekala', 1, NULL, 'job_images/Npl2ANVnD2ook4I3gO7JM28nmYskASYDVAeIR6U9.jpg', NULL, 241, 1, NULL, '2025-06-17', '2025-05-12 06:20:12', NULL, 'approved', 'contact_contributor', NULL, 'J100519', 1, '2025-05-12 10:19:32', '2025-05-19 18:43:56', 8, 9),
(885, 'HR Officer', 'No Description', 8, 74, 'Kotte', 1, NULL, 'job_images/ql9LczIUUwfpDyP8sBEszVPysflEQW7UirSteyfI.jpg', NULL, 241, 1, NULL, '2025-06-17', '2025-05-12 06:30:22', NULL, 'approved', 'contact_contributor', NULL, 'J100520', 1, '2025-05-12 10:21:36', '2025-05-19 18:46:15', 8, 11),
(886, 'Sales Executive', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/H0Drv0OvbVV1W6BogI3tW1kNCEMX0Gtcr6WUczXW.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 06:30:32', NULL, 'approved', 'contact_contributor', NULL, 'J100521', 1, '2025-05-12 10:26:42', '2025-05-18 09:53:21', 8, 8),
(887, 'Executive - Band & Communication', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/WqzW7obYyLimeCm9i0E4PoB1WK0HI6sUKtZMnm50.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 06:30:50', NULL, 'approved', 'contact_contributor', NULL, 'J100522', 1, '2025-05-12 10:29:32', '2025-05-19 19:28:41', 8, 13),
(888, 'E-commerce sales Coordinator', 'No Description', 4, 234, 'Colombo', 1, NULL, 'job_images/u2gSC2itE23IiaITgvkIGnUp8mR0eeumddG5mdga.jpg', NULL, 245, 1, NULL, '2025-06-17', '2025-05-12 06:40:44', NULL, 'approved', 'contact_contributor', NULL, 'J100523', 1, '2025-05-12 10:37:58', '2025-05-19 18:48:48', 8, 10),
(889, 'Intern - HR', 'No Description', 8, 74, 'Colombo', 1, NULL, 'job_images/KxfwETUwXvE7Ttruu0yeNVcwejv9uuaHXPavaJ2i.jpg', NULL, 241, 1, NULL, '2025-06-17', '2025-05-12 06:41:45', NULL, 'approved', 'contact_contributor', NULL, 'J100524', 1, '2025-05-12 10:40:33', '2025-05-19 18:51:34', 8, 16),
(890, 'Full Stack Web Application Developer', 'No Description', 1, 78, 'Dhaka', 10, NULL, 'job_images/egoEgh2bIpwIzqrMNguxaapRpyZc8XeYfsX1aauZ.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 09:34:26', NULL, 'approved', 'contact_contributor', NULL, 'J100525', 1, '2025-05-12 13:26:05', '2025-05-19 22:15:59', 8, 17),
(891, 'sales Associate', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/CyFEyB9evcGaDrijRyTC3fSBQOXFjCQgSzwaxpQz.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 09:34:38', NULL, 'approved', 'contact_contributor', NULL, 'J100526', 1, '2025-05-12 13:29:48', '2025-05-18 09:50:45', 8, 13),
(892, 'Forklift Operator', 'No Description', 11, 257, 'Colombo', 1, NULL, 'job_images/sQ2HWEiCUPA26PM3UXRVlY5erre2sNcCVKSMF9xk.jpg', NULL, 246, 1, NULL, '2025-06-17', '2025-05-12 10:20:49', NULL, 'approved', 'contact_contributor', NULL, 'J100527', 1, '2025-05-12 13:44:12', '2025-05-19 18:54:04', 8, 11),
(893, 'Sales Assistants', 'No Description', 4, 235, 'Negombo', 1, NULL, 'job_images/6zLG1gpFvaIVPAB0dUTxmSjhDZa0fafk6FlVPtBX.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 10:21:01', NULL, 'approved', 'contact_contributor', NULL, 'J100528', 1, '2025-05-12 13:47:05', '2025-05-20 09:24:15', 8, 11),
(894, 'Receptionist', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/IlfrYELwsNYYL0JjRujaLBj2v6Mv14W87LEv7bQ9.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 10:21:12', NULL, 'approved', 'contact_contributor', NULL, 'J100529', 1, '2025-05-12 13:50:16', '2025-05-20 10:16:44', 8, 14),
(895, 'Trainee Graphic Designer + Video Editor', 'No Description', 15, 106, 'Moratuwa', 1, NULL, 'job_images/HNrJkrpheS9246ofcmdv5FemyB1AjQxm05AhSfha.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-12 10:21:25', NULL, 'approved', 'contact_contributor', NULL, 'J100530', 1, '2025-05-12 13:54:07', '2025-05-19 14:17:23', 8, 16),
(896, 'Content Manager', 'No Description', 4, 234, 'Colombo', 1, NULL, 'job_images/0mud760hR6ixBnFtasTp6UeToEwY56HAYpfviN2y.jpg', NULL, 247, 1, NULL, '2025-06-17', '2025-05-12 10:21:36', NULL, 'approved', 'contact_contributor', NULL, 'J100531', 1, '2025-05-12 14:02:02', '2025-05-19 18:56:50', 8, 12),
(897, 'Waiters & Waitress', 'No Description', 31, 153, 'Nigeria', 20, NULL, 'job_images/HVAFVh2IZmoZs7rHNDr18tFdZSi816xfiNioN9GS.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:21:52', NULL, 'approved', 'contact_contributor', NULL, 'J100532', 1, '2025-05-12 14:09:14', '2025-05-19 10:20:27', 8, 14),
(898, 'Supervisors', 'No Description', 31, 153, 'Nigeria', 20, NULL, 'job_images/wBwqXprol04tISNllgWkclOTjBKt8SycQqO5Olmp.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:22:02', NULL, 'approved', 'contact_contributor', NULL, 'J100533', 1, '2025-05-12 14:10:54', '2025-05-20 09:57:39', 8, 13),
(899, 'Bartender', 'No Description', 31, 152, 'Nigeria', 20, NULL, 'job_images/AsqWYXF1QeqMo4DwH0Jckizr4LcoAKTsvzzGPjcl.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:22:16', NULL, 'approved', 'contact_contributor', NULL, 'J100534', 1, '2025-05-12 14:12:10', '2025-05-18 09:52:05', 8, 11),
(900, 'HR Manager', 'No Description', 8, 74, 'Nigeria', 20, NULL, 'job_images/9zj3C3AQJ0ofBzyWubEqwyBhcxzTfX8ub5eLAAx5.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:22:30', NULL, 'approved', 'contact_contributor', NULL, 'J100535', 1, '2025-05-12 14:13:11', '2025-05-20 09:29:48', 8, 14),
(901, 'Social Media / Content Creator', 'No Description', 10, 252, 'Nigeria', 20, NULL, 'job_images/3fT9ggMqxWf1QBkeiOMKlgN4qWs870WYalocQPXd.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:22:43', NULL, 'approved', 'contact_contributor', NULL, 'J100536', 1, '2025-05-12 14:14:49', '2025-05-20 08:29:42', 8, 13),
(902, 'Bouncers', 'No Description', 46, 195, 'Nigeria', 20, NULL, 'job_images/Wnjuf9tWt4rDav54LwyYchvMG7x40SXWRhoLakh6.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:22:53', NULL, 'approved', 'contact_contributor', NULL, 'J100537', 1, '2025-05-12 14:18:22', '2025-05-18 09:55:21', 8, 13),
(903, 'IT Personnel', 'No Description', 1, 80, 'Nigeria', 20, NULL, 'job_images/6e5I9XjWXatlEZWCa2bK1fuDamaC9BzY47ZoUlKk.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:23:03', NULL, 'approved', 'contact_contributor', NULL, 'J100538', 1, '2025-05-12 14:19:49', '2025-05-18 20:13:25', 8, 14),
(904, 'Hostess', 'No Description', 13, 99, 'Nigeria', 20, NULL, 'job_images/8o1fuhgVcGNiLFz9ZjlNA6WKyNV7x9gB41wwqXUN.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 10:23:13', NULL, 'approved', 'contact_contributor', NULL, 'J100539', 1, '2025-05-12 14:22:12', '2025-05-18 09:50:24', 8, 12),
(905, 'Brand Manager', 'No Description', 4, 235, 'Nigeria', 20, NULL, 'job_images/Ct0YnUKDMtsjAqjUJQOCPT09prhyq47QK3eXAJlQ.jpg', NULL, 248, 1, NULL, '2025-06-17', '2025-05-12 16:40:46', NULL, 'approved', 'contact_contributor', NULL, 'J100540', 1, '2025-05-12 14:23:29', '2025-05-20 10:06:00', 8, 13),
(906, 'Bakeshop Assistant', 'No Description', 31, 151, 'Taguig City', 55, NULL, 'job_images/dDFSXVS02QTFgHYaKmsVztjakqXeau1evvWXs2ze.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 05:00:29', NULL, 'approved', 'contact_contributor', NULL, 'J100541', 1, '2025-05-13 08:46:59', '2025-05-18 09:55:11', 8, 13),
(907, 'Audit Supervisor', 'No Description', 3, 230, 'Pasig City', 55, NULL, 'job_images/rRJCYxvaIZXtAGrSxHP0eLzzGM9f5j1S9Y7kKdDS.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 05:00:38', NULL, 'approved', 'contact_contributor', NULL, 'J100542', 1, '2025-05-13 08:56:47', '2025-05-18 09:51:16', 8, 12),
(908, 'Executive - (Internal Auditor)', 'No Description', 3, 230, 'Colombo', 1, NULL, 'job_images/WNx58lefDrDUHhZNv34hfW1MO6uUO7GaQrZUv0wn.jpg', NULL, 249, 1, NULL, '2025-06-17', '2025-05-13 05:24:05', NULL, 'approved', 'contact_contributor', NULL, 'J100543', 1, '2025-05-13 09:02:01', '2025-05-20 04:27:02', 8, 14),
(909, 'Deputy Web Editor', 'No Description', 16, 108, 'Colombo', 1, NULL, 'job_images/YmTtiO7hfvALInYvpHJgNkYesqMnUFvjhMAucxPr.jpg', NULL, 250, 1, NULL, '2025-06-17', '2025-05-13 05:24:13', NULL, 'approved', 'contact_contributor', NULL, 'J100544', 1, '2025-05-13 09:07:35', '2025-05-18 09:52:31', 8, 11),
(910, 'Interior Sales Executive', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/akpS7vG345gY0u6XetxbuG5iJDSXc7Oe9p3f5UHn.jpg', NULL, 251, 1, NULL, '2025-06-17', '2025-05-13 05:24:21', NULL, 'approved', 'contact_contributor', NULL, 'J100545', 1, '2025-05-13 09:17:44', '2025-05-18 09:53:40', 8, 12),
(911, 'Boom Truck Operators', 'No Description', 46, 196, 'Andheri', 3, NULL, 'job_images/fBmsYkOApumkc63YjUzxrVOXql6TR3uCwH5kzXZm.jpg', NULL, 252, 1, NULL, '2025-06-17', '2025-05-13 05:35:43', NULL, 'approved', 'contact_contributor', NULL, 'J100546', 1, '2025-05-13 09:28:49', '2025-05-18 09:51:11', 8, 11),
(912, 'Concrete Mixer Drivers / Farm Tractor Drivers', 'No Description', 51, 302, 'Andheri', 3, NULL, 'job_images/btJXvAX0fCLoSxx6oBnnFFTbXmf3USZ0Q7LovbPZ.jpg', NULL, 252, 1, NULL, '2025-06-17', '2025-05-13 05:35:56', NULL, 'approved', 'contact_contributor', NULL, 'J100547', 1, '2025-05-13 09:32:21', '2025-05-20 08:36:37', 8, 12),
(913, 'Senior Sales Executive', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/aJt3NyM9a3juaSWiErSqiejWYsLAh7nO8DeLptrz.jpg', NULL, 39, 1, NULL, '2025-06-17', '2025-05-13 05:38:36', NULL, 'approved', 'contact_contributor', NULL, 'J100548', 1, '2025-05-13 09:35:54', '2025-05-18 09:52:58', 8, 12),
(914, 'Customer Care Executive (Tamil)', 'No Description', 5, 90, 'Bambalapitiya', 1, NULL, 'job_images/kQmQqjIxTrpxIuqIOjJfHzH8KOFBtSXC8cJejNSr.jpg', NULL, 244, 1, NULL, '2025-06-17', '2025-05-13 05:41:39', NULL, 'approved', 'contact_contributor', NULL, 'J100549', 1, '2025-05-13 09:39:50', '2025-05-18 09:54:29', 8, 12),
(915, 'Jnr. Credit Executive', 'No Description', 23, 132, 'Rajagiriya', 1, NULL, 'job_images/5suwzZNiJQHkoerejM6Yz86mgXKcMPtULDFLh0en.jpg', NULL, 253, 1, NULL, '2025-06-17', '2025-05-13 05:46:30', NULL, 'approved', 'contact_contributor', NULL, 'J100550', 1, '2025-05-13 09:43:33', '2025-05-19 05:10:03', 8, 12),
(916, 'HR Assistant', 'No Description', 8, 74, 'Ja-ela', 1, NULL, 'job_images/55voEmJDjyuEGjCt8bfr7K5yIsALpqjZwGoTCxZ7.jpg', NULL, 241, 1, NULL, '2025-06-17', '2025-05-13 05:50:29', NULL, 'approved', 'contact_contributor', NULL, 'J100551', 1, '2025-05-13 09:46:31', '2025-05-19 17:59:30', 8, 15),
(917, 'Senior Developer', 'No Description', 1, 78, 'Cebu City', 55, NULL, 'job_images/Ra4sNqyZiooMKPGwB3KuRgHQ1uOAsiXZlfjD7Ysm.jpg', NULL, 254, 1, NULL, '2025-06-17', '2025-05-13 05:53:49', NULL, 'approved', 'contact_contributor', NULL, 'J100552', 1, '2025-05-13 09:50:59', '2025-05-18 20:14:44', 8, 12),
(918, 'Third Officer Fourth Engineer Fitter', 'No Description', 50, 288, 'Makati City', 55, NULL, 'job_images/wI8Q9FlFsm76nBXyBTfcjWLNqQdUnC4jGcxX5gji.jpg', NULL, 238, 1, NULL, '2025-06-17', '2025-05-13 06:01:46', NULL, 'approved', 'contact_contributor', NULL, 'J100553', 1, '2025-05-13 09:54:04', '2025-05-18 09:52:06', 8, 11),
(919, 'Product Packing Service', 'No Description', 11, 257, 'Colombo', 1, NULL, 'job_images/ly5LeoiPsAin8YYG1U5iWThGpuwDKQVnRZP4X5XA.jpg', NULL, 255, 1, NULL, '2025-06-17', '2025-05-13 06:02:02', NULL, 'approved', 'contact_contributor', NULL, 'J100554', 1, '2025-05-13 09:59:16', '2025-05-18 09:53:23', 8, 13),
(920, 'Digital Journalist', 'No Description', 16, 108, 'Colombo', 1, NULL, 'job_images/jNmyJbz3bZQQOXezFroj88meoABzmH4O1wQNahWP.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 06:02:16', NULL, 'approved', 'contact_contributor', NULL, 'J100555', 1, '2025-05-13 10:01:15', '2025-05-18 09:53:17', 8, 12),
(921, 'Sales Officers', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/bMTCsTn2QFpf2ZozzPLhHQPO3uBWNbn60CBAi5Ww.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 06:47:36', NULL, 'approved', 'contact_contributor', NULL, 'J100556', 1, '2025-05-13 10:38:31', '2025-05-18 09:51:08', 8, 12),
(922, 'Sales Executives', 'No Description', 4, 235, 'Colombo 03', 1, NULL, 'job_images/y9DLoIF3mO27Ft9XiRpzZ2ZRXSQ4lPPFZLbk7Kuz.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 06:47:50', NULL, 'approved', 'contact_contributor', NULL, 'J100557', 1, '2025-05-13 10:40:14', '2025-05-19 06:43:46', 8, 14),
(923, 'Marketing Executive', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/dEFUFQkbkDCg6ACwbGut4ysn8yffEfrGIMioai6z.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 06:48:06', NULL, 'approved', 'contact_contributor', NULL, 'J100558', 1, '2025-05-13 10:42:14', '2025-05-18 09:51:26', 8, 13),
(924, 'Accountant', 'No Description', 3, 229, 'Colombo 04', 1, NULL, 'job_images/pjx1558y0ytYAAYUX1g9Slris2aq2Eo9QXMwzsE9.jpg', NULL, 256, 1, NULL, '2025-06-17', '2025-05-13 06:48:18', NULL, 'approved', 'contact_contributor', NULL, 'J100559', 1, '2025-05-13 10:45:41', '2025-05-18 09:54:39', 8, 12),
(925, 'Business Development Executive', 'No Description', 21, 123, 'Km5 Banadir Mall', 20, NULL, 'job_images/kQAfyKIGHgzPKEv88ryTKSBnafESJ9EYwrN2A7SK.jpg', NULL, 257, 1, NULL, '2025-06-17', '2025-05-13 07:10:40', NULL, 'approved', 'contact_contributor', NULL, 'J100560', 1, '2025-05-13 11:08:53', '2025-05-18 09:53:18', 8, 11),
(926, 'Senior Executive Talent Acquisition', 'No Description', 8, 74, 'Kottawa', 1, NULL, 'job_images/AJlpioalcg9wWkz6P7JsI7S4FXrCt5D0Iv1hxiyg.jpg', NULL, 258, 1, NULL, '2025-06-17', '2025-05-13 07:32:02', NULL, 'approved', 'contact_contributor', NULL, 'J100561', 1, '2025-05-13 11:27:31', '2025-05-20 10:20:46', 8, 13),
(927, 'Executive - HR', 'No Description', 8, 74, 'Kottawa', 1, NULL, 'job_images/597JB9CRtiJyuoRPYf4LWd9HPkCjwWk5FN2q02V1.jpg', NULL, 258, 1, NULL, '2025-06-17', '2025-05-13 07:32:17', NULL, 'approved', 'contact_contributor', NULL, 'J100562', 1, '2025-05-13 11:30:17', '2025-05-19 12:25:22', 8, 14),
(928, 'Sales Executive / Representative', 'No Description', 4, 235, 'Kirindiwela', 1, NULL, 'job_images/7wZ0RKJrdR1a2hDcmqzQh9jq9hY7CpARB78EozCp.jpg', NULL, 259, 1, NULL, '2025-06-17', '2025-05-13 12:05:19', NULL, 'approved', 'contact_contributor', NULL, 'J100563', 1, '2025-05-13 14:26:36', '2025-05-20 08:38:00', 8, 14),
(929, 'Junior Sales Executive', 'No Description', 4, 235, 'Mawanella', 1, NULL, 'job_images/JDIABHdQrh1h0zgoVHRKQwni10Z5tK0DhFDhwNXE.jpg', NULL, 260, 1, NULL, '2025-06-17', '2025-05-13 12:05:32', NULL, 'approved', 'contact_contributor', NULL, 'J100564', 1, '2025-05-13 14:33:18', '2025-05-18 09:53:39', 8, 11),
(930, 'Managers', 'No Description', 3, 229, 'Nugegoda', 1, NULL, 'job_images/qUOHv5PlEHl8CUtwlwGHEUd8MYdGtsRAASwkXOp9.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:05:46', NULL, 'approved', 'contact_contributor', NULL, 'J100565', 1, '2025-05-13 14:39:13', '2025-05-18 09:54:46', 8, 11),
(931, 'Marketing Officer', 'No Description', 4, 235, 'Jaffna', 1, NULL, 'job_images/RLhgQkLSUHKieTADbYqE6wo9DLrOwIpRkTtgDDjz.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:05:56', NULL, 'approved', 'contact_contributor', NULL, 'J100566', 1, '2025-05-13 14:43:02', '2025-05-18 09:52:29', 8, 11),
(932, 'Business Development Executives', 'No Description', 21, 123, 'Rathnapura & Colombo', 1, NULL, 'job_images/y726Rs9YUu6wfgGSwxPKwYMpoXHYS6tMMpNcjy8u.jpg', NULL, 261, 1, NULL, '2025-06-17', '2025-05-13 12:06:17', NULL, 'approved', 'contact_contributor', NULL, 'J100567', 1, '2025-05-13 14:54:35', '2025-05-18 09:55:00', 8, 11),
(933, 'Data Entry Operator', 'No Description', 46, 195, 'Katunayake & Kaluthara', 1, NULL, 'job_images/6afgdbv2bS7dc9yxiABgIZoDK37gh1CoWifH6ddI.jpg', NULL, 262, 1, NULL, '2025-06-17', '2025-05-13 12:06:31', NULL, 'approved', 'contact_contributor', NULL, 'J100568', 1, '2025-05-13 15:08:07', '2025-05-19 17:39:16', 8, 10),
(934, 'General Accountant', 'No Description', 3, 229, 'Pasig City', 55, NULL, 'job_images/v8vH8U74Xi3CdWMjk8qjaGZ3QyojqJzZzRRHmI8W.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:06:43', NULL, 'approved', 'contact_contributor', NULL, 'J100569', 1, '2025-05-13 15:13:02', '2025-05-19 19:35:58', 8, 12),
(935, 'Office Assistant', 'No Description', 46, 195, 'Colombo 12', 1, NULL, 'job_images/AnEgWcWoZ1MC7yEz8ltYTlHgwsuMjznT2xQLVKaw.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:06:55', NULL, 'approved', 'contact_contributor', NULL, 'J100570', 1, '2025-05-13 15:15:15', '2025-05-20 09:45:08', 8, 17),
(936, 'Recruitment Consultant', 'No Description', 8, 74, 'Dehiwela , Mount Lavinia', 1, NULL, 'job_images/hz2PzQ698mymt0i8YO8A5CJdz1xm1ykow9YxwuY8.jpg', NULL, 263, 1, NULL, '2025-06-17', '2025-05-13 12:07:08', NULL, 'approved', 'contact_contributor', NULL, 'J100571', 1, '2025-05-13 15:19:45', '2025-05-18 09:51:35', 8, 12);
INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(937, 'Project Coordinator', 'No Description', 21, 122, 'Borella', 1, NULL, 'job_images/PJ0JbgBnG1NkYc5rPI7kVUB0rBB37gQprK0OSvFe.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:07:17', NULL, 'approved', 'contact_contributor', NULL, 'J100572', 1, '2025-05-13 15:23:28', '2025-05-19 17:20:53', 8, 13),
(938, 'Relationship Executive', 'No Description', 23, 132, 'Colombo', 1, NULL, 'job_images/5YZzxThqRuX9rQHlFTCsOaNMO2KtdgyHje5bFkNH.jpg', NULL, 74, 1, NULL, '2025-06-17', '2025-05-13 12:07:32', NULL, 'approved', 'contact_contributor', NULL, 'J100573', 1, '2025-05-13 15:26:03', '2025-05-18 09:50:27', 8, 13),
(939, 'Personal Secretary', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/dTgbwm8nvok9uK9FvvJCimD7AjAKumnqe2utMNts.jpg', NULL, 216, 1, NULL, '2025-06-17', '2025-05-13 12:07:49', NULL, 'approved', 'contact_contributor', NULL, 'J100574', 1, '2025-05-13 15:32:03', '2025-05-18 09:54:31', 8, 13),
(940, 'Executive', 'No Description', 11, 254, 'Awissawella', 1, NULL, 'job_images/85GKlArrlvFlTmRhhyLdFJRQvo27kpBxj942n3lE.jpg', NULL, 264, 1, NULL, '2025-06-17', '2025-05-13 12:08:08', NULL, 'approved', 'contact_contributor', NULL, 'J100575', 1, '2025-05-13 15:39:09', '2025-05-18 09:52:22', 8, 13),
(941, 'Accounting Supervisor', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/VVRPCY6vS6H6Ms05wvOPtKFauvN0HukGcIwPaJ2E.jpg', NULL, 265, 1, NULL, '2025-06-17', '2025-05-13 12:08:18', NULL, 'approved', 'contact_contributor', NULL, 'J100576', 1, '2025-05-13 15:47:09', '2025-05-18 09:51:59', 8, 12),
(942, 'Branch Manager', 'No Description', 21, 123, 'Colombo', 1, NULL, 'job_images/twvsq7To24tQlU3kuh4TwXRBltSOJwmRBIYFG2yf.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:08:28', NULL, 'approved', 'contact_contributor', NULL, 'J100577', 1, '2025-05-13 15:56:02', '2025-05-19 23:16:34', 8, 9),
(943, 'Sales Manger / Executive', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/AN5jRPCFuJHS22Veb68gbXGCybbOtcVve2niYfyE.jpg', NULL, 190, 1, NULL, '2025-06-17', '2025-05-13 12:08:40', NULL, 'approved', 'contact_contributor', NULL, 'J100578', 1, '2025-05-13 15:57:04', '2025-05-18 09:52:07', 8, 10),
(944, 'Personal Assistants', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/7VJfmFZ91WT91L4xbklOJLMiuhc83PTGhmQ9AAx2.jpg', NULL, 266, 1, NULL, '2025-06-17', '2025-05-13 12:08:53', NULL, 'approved', 'contact_contributor', NULL, 'J100579', 1, '2025-05-13 16:06:03', '2025-05-18 09:53:49', 8, 10),
(945, 'Receptionist', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/gIuID3qiNESVUfDACgXkaoL0isrnnlBjbLcoiPTN.jpg', NULL, 267, 1, NULL, '2025-06-17', '2025-05-13 12:10:24', NULL, 'approved', 'contact_contributor', NULL, 'J100580', 1, '2025-05-13 16:09:46', '2025-05-18 09:54:08', 8, 11),
(946, 'Junior Executive - Operations', 'No Description', 46, 196, 'Beruwala', 1, NULL, 'job_images/IodmwzrxCgzzSJUE3bJ3dIZbPKStG0iYAJArjy1f.jpg', NULL, 268, 1, NULL, '2025-06-17', '2025-05-13 12:16:49', NULL, 'approved', 'contact_contributor', NULL, 'J100581', 1, '2025-05-13 16:16:21', '2025-05-18 09:51:36', 8, 9),
(947, 'Event Coordinator', 'No Description', 38, 283, 'Thalawathugoda, Pelawatta, Battaramulla', 1, NULL, 'job_images/k4i6YHQqFATcuICtKvFDdITe1lnaDdOTqsfVG3CB.jpg', NULL, 269, 1, NULL, '2025-06-17', '2025-05-13 12:26:50', NULL, 'approved', 'contact_contributor', NULL, 'J100582', 1, '2025-05-13 16:26:18', '2025-05-18 09:50:18', 8, 9),
(948, 'Food & Beverages Manager', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/h6UuhXHF57UPAWjHVhfh3tjsCZgUxEZtfEz2wJQf.jpg', NULL, 270, 1, NULL, '2025-06-17', '2025-05-14 05:44:26', NULL, 'approved', 'contact_contributor', NULL, 'J100583', 1, '2025-05-13 16:34:32', '2025-05-19 16:48:25', 8, 9),
(949, 'Customer Support Executive', 'No Description', 5, 90, 'Colombo', 1, NULL, 'job_images/LXdstWTLiNXqfAgWlTczirTTduQsuQ6xFv5nUh6q.jpg', NULL, 271, 1, NULL, '2025-06-19', '2025-05-14 06:08:31', NULL, 'approved', 'contact_contributor', NULL, 'J100584', 1, '2025-05-14 09:59:45', '2025-05-20 08:35:13', 8, 13),
(950, 'Sales Manger / Asst Sales Manger', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/7QQL5SxvRR0HWYmG7qbVgJsZdEGxhp8NzP5ReKw0.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:25:08', NULL, 'approved', 'contact_contributor', NULL, 'J100585', 1, '2025-05-14 10:03:09', '2025-05-18 19:26:33', 8, 7),
(951, 'Senior Sales Executive', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/9f2uVIphwF6Kd1h90PVlfccEzNXNnBG1Kb1K9F47.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:53:04', NULL, 'approved', 'contact_contributor', NULL, 'J100586', 1, '2025-05-14 10:04:11', '2025-05-19 22:33:23', 8, 7),
(952, 'Hair Dresser / Beautician', 'No Description', 20, 270, 'Boralasgamuwa', 1, NULL, 'job_images/EgOarZs52rPDGLBcctaJtTYkkHBJjJX5HbKoSsIf.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:53:23', NULL, 'approved', 'contact_contributor', NULL, 'J100587', 1, '2025-05-14 10:07:05', '2025-05-18 09:51:15', 8, 6),
(953, 'Sales Executive', 'No Description', 4, 235, 'Kekirawa', 1, NULL, 'job_images/pKAi0t4hAIq9j5OQ6vj0KWLO0nm1FmOLoBM6fZFQ.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:54:05', NULL, 'approved', 'contact_contributor', NULL, 'J100588', 1, '2025-05-14 10:09:14', '2025-05-19 07:12:13', 8, 7),
(954, 'Sales Officers', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/BjpgdQsp1Glorh91XFbue6ALn8NkPQeS7fLCCCLL.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:54:23', NULL, 'approved', 'contact_contributor', NULL, 'J100589', 1, '2025-05-14 10:10:55', '2025-05-20 09:56:16', 8, 9),
(955, 'Mechanical  Technicians', 'No Description', 50, 287, 'Colombo 10', 1, NULL, 'job_images/OQFXyCQGNd0d6XjLn2gUbqdhPX5Li0CJGYXjGPRX.jpg', NULL, 272, 1, NULL, '2025-06-19', '2025-05-14 06:54:38', NULL, 'approved', 'contact_contributor', NULL, 'J100590', 1, '2025-05-14 10:15:16', '2025-05-20 04:13:43', 8, 7),
(956, 'Manager', 'No Description', 4, 238, 'Colombo 04', 1, NULL, 'job_images/eF2qdeibzSy87PaEsQ6kzk1FkL5IFqh5FTxN8KS0.jpg', NULL, 273, 1, NULL, '2025-06-19', '2025-05-14 06:54:52', NULL, 'approved', 'contact_contributor', NULL, 'J100591', 1, '2025-05-14 10:19:58', '2025-05-20 04:20:46', 8, 7),
(957, 'Assistant Marketing Manager', 'No Description', 4, 238, 'Colombo 04', 1, NULL, 'job_images/lTYNEtCVx4fqTukGkEHF33FkX8GDOFqBFBtlcG7L.jpg', NULL, 273, 1, NULL, '2025-06-19', '2025-05-14 06:55:07', NULL, 'approved', 'contact_contributor', NULL, 'J100592', 1, '2025-05-14 10:21:20', '2025-05-20 04:25:16', 8, 6),
(958, 'Operations & Client Relations Executive', 'No Description', 5, 88, 'Wattala', 1, NULL, 'job_images/0KO4qwbActJCYQFIdMXcQTAVL2QVvQrn6xft2KOs.jpg', NULL, 274, 1, NULL, '2025-06-19', '2025-05-14 06:55:27', NULL, 'approved', 'contact_contributor', NULL, 'J100593', 1, '2025-05-14 10:34:36', '2025-05-20 04:30:07', 8, 10),
(959, 'Pharmacist', 'No Description', 7, 246, 'Colombo', 1, NULL, 'job_images/HV3WeorovGL7oI1yySDlmF8MlROScDnydQABRnZk.jpg', NULL, 275, 1, NULL, '2025-06-19', '2025-05-14 06:55:44', NULL, 'approved', 'contact_contributor', NULL, 'J100594', 1, '2025-05-14 10:40:22', '2025-05-20 04:34:59', 8, 7),
(960, 'Pattern Maker', 'No Description', 44, 189, 'Piliyandala', 1, NULL, 'job_images/3zO1wlYB69krlaSwY436WCRnF7aTSKarJfOdd4uf.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:57:16', NULL, 'approved', 'contact_contributor', NULL, 'J100595', 1, '2025-05-14 10:43:51', '2025-05-20 09:43:45', 8, 10),
(961, 'Accounting Executive', 'No Description', 3, 229, 'Battaramulla', 1, NULL, 'job_images/0sSfRGfcSRLCcl00RQoVqxQWcWy8pKrYRzfjAYCE.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:57:41', NULL, 'approved', 'contact_contributor', NULL, 'J100596', 1, '2025-05-14 10:45:31', '2025-05-19 21:15:01', 8, 13),
(962, 'Accounting Assistant', 'No Description', 3, 229, 'Battaramulla', 1, NULL, 'job_images/PfzzQeWvXhF6R4cpLFwFd6MyQbg6QgfJMDh0kocw.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:58:01', NULL, 'approved', 'contact_contributor', NULL, 'J100597', 1, '2025-05-14 10:46:36', '2025-05-20 10:29:59', 8, 16),
(963, 'Steward / Waiter', 'No Description', 31, 151, 'Kurugegala', 1, NULL, 'job_images/xx1LesDhKvYULCcG0OWNZXWRmtUStgMY8Q516bV4.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 06:58:21', NULL, 'approved', 'contact_contributor', NULL, 'J100598', 1, '2025-05-14 10:49:02', '2025-05-19 11:23:13', 8, 12),
(964, 'Project Manager', 'No Description', 38, 284, 'Colombo 04', 1, NULL, 'job_images/eeU22nolmqaLorBWu2UibALoKqTNfY9f5zRhuFmd.jpg', NULL, 273, 1, NULL, '2025-06-19', '2025-05-14 07:46:31', NULL, 'approved', 'contact_contributor', NULL, 'J100599', 1, '2025-05-14 11:14:17', '2025-05-20 04:39:46', 8, 15),
(965, 'Technical Officers', 'No Description', 50, 287, 'Colombo 04', 1, NULL, 'job_images/dy4RE5oDDCrjRuUSTroNC4zqb3GBkNzGd9BuL5vR.jpg', NULL, 273, 1, NULL, '2025-06-19', '2025-05-14 07:46:43', NULL, 'approved', 'contact_contributor', NULL, 'J100600', 1, '2025-05-14 11:16:53', '2025-05-20 04:44:38', 8, 13),
(966, 'SITE Engineers', 'No Description', 12, 96, 'Colombo 04', 1, NULL, 'job_images/azanjgO1KhXumLV1BpLMpKjHtD7RhZx3LTz7hsIJ.jpg', NULL, 273, 1, NULL, '2025-06-19', '2025-05-14 07:46:55', NULL, 'approved', 'contact_contributor', NULL, 'J100601', 1, '2025-05-14 11:17:48', '2025-05-19 14:28:11', 8, 16),
(967, 'Foreman', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/t579g4UugRw03MLDQjRpknmni8Z0yGhJzOcQfHEq.jpg', NULL, 276, 1, NULL, '2025-06-19', '2025-05-14 07:47:09', NULL, 'approved', 'contact_contributor', NULL, 'J100602', 1, '2025-05-14 11:27:02', '2025-05-19 18:48:01', 8, 12),
(968, 'Electrician', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/oD8prjWu8K83RW7Q3Xa4W1hYLfSZVvLulR2z0z1M.jpg', NULL, 276, 1, NULL, '2025-06-19', '2025-05-14 07:47:33', NULL, 'approved', 'contact_contributor', NULL, 'J100603', 1, '2025-05-14 11:28:15', '2025-05-20 04:54:07', 8, 12),
(969, 'Mason', 'No Description', 12, 96, 'Dubai', 6, NULL, 'job_images/eDnRocOaxWmfGfw05IkiKD6Ca2UTJbOuDQdOzvRj.jpg', NULL, 276, 1, NULL, '2025-06-19', '2025-05-14 07:47:45', NULL, 'approved', 'contact_contributor', NULL, 'J100604', 1, '2025-05-14 11:29:17', '2025-05-20 04:58:12', 8, 14),
(970, 'Steel Fixers', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/4QrKCDRZjdG7vHUF4FzPTG7iTkTi6qNC6U6mG2jf.jpg', NULL, 276, 1, NULL, '2025-06-19', '2025-05-14 07:48:00', NULL, 'approved', 'contact_contributor', NULL, 'J100605', 1, '2025-05-14 11:30:35', '2025-05-20 05:02:54', 8, 13),
(971, 'Shuttering Carpenter / Gen. Helper', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/IAISN6JPm0NezbYbH3Z1Xbl4FW9So022KxCJOXJ6.jpg', NULL, 276, 1, NULL, '2025-06-19', '2025-05-14 07:48:11', NULL, 'approved', 'contact_contributor', NULL, 'J100606', 1, '2025-05-14 11:32:27', '2025-05-20 05:08:51', 8, 11),
(972, 'Business Manager / Assistant Business Manager', 'No Description', 21, 122, 'Kaluthara', 1, NULL, 'job_images/qejPAnZZAu5i3V9wq95qV4y7XM5BLmwr9XfsHrMk.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 07:48:21', NULL, 'approved', 'contact_contributor', NULL, 'J100607', 1, '2025-05-14 11:35:57', '2025-05-19 02:59:58', 8, 12),
(973, 'Supervisors', 'No Description', 22, 127, 'Bandaragama , Panadura', 1, NULL, 'job_images/84ZgivMWstoCBoKtN303NjZ6NXQXXUjlD1pDl08p.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 07:48:36', NULL, 'approved', 'contact_contributor', NULL, 'J100608', 1, '2025-05-14 11:40:14', '2025-05-19 15:09:29', 8, 13),
(974, 'Cashiers', 'No Description', 22, 127, 'Bandaragama , Panadura', 1, NULL, 'job_images/EsInMxuGci6oRh3vkr5laiAiBPGtBgkCCZjOctQv.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 07:53:57', NULL, 'approved', 'contact_contributor', NULL, 'J100609', 1, '2025-05-14 11:50:13', '2025-05-19 06:48:39', 8, 15),
(975, 'Assistant store keeper', 'No Description', 11, 257, 'Bandaragama , Panadura', 1, NULL, 'job_images/ScxMoegeHIyXz0L18TuZh06WXZz4GgqHynVW8EOZ.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 07:54:11', NULL, 'approved', 'contact_contributor', NULL, 'J100610', 1, '2025-05-14 11:52:38', '2025-05-19 13:37:09', 8, 14),
(976, 'Admi Officer', 'No Description', 46, 195, 'Bandaragama , Panadura', 1, NULL, 'job_images/cXYuP14oL1NcLeUptzPxQKvy1QV3FW3xlcXTlZkC.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 07:56:07', NULL, 'approved', 'contact_contributor', NULL, 'J100611', 1, '2025-05-14 11:54:22', '2025-05-19 01:58:22', 8, 13),
(977, 'Customer Care Executives', 'No Description', 5, 90, 'Kohuwala', 1, NULL, 'job_images/Pxl8nRZXP7zxun1LeIbhb79a5ybyLUDMPFMqb1Ya.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 08:00:48', NULL, 'approved', 'contact_contributor', NULL, 'J100612', 1, '2025-05-14 11:56:29', '2025-05-19 17:11:52', 8, 15),
(978, 'Business Development Executive / Managers', 'No Description', 21, 123, 'Colombo', 1, NULL, 'job_images/Jr6fqj3NkxgArU1vgY5c9pTexyfKib96tBNHUNlj.jpg', NULL, 277, 1, NULL, '2025-06-19', '2025-05-14 09:28:38', NULL, 'approved', 'contact_contributor', NULL, 'J100613', 1, '2025-05-14 12:01:01', '2025-05-20 05:13:42', 8, 11),
(979, 'Receptionist', 'No Description', 46, 195, 'Colombo 03', 1, NULL, 'job_images/rFopFyyVL6hfRjuaystmlfTBRKsN0QDqQJ5yjFuu.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:28:58', NULL, 'approved', 'contact_contributor', NULL, 'J100614', 1, '2025-05-14 12:08:48', '2025-05-20 05:18:16', 8, 13),
(980, 'Cashiers', 'No Description', 5, 88, 'Colombo 03', 1, NULL, 'job_images/OMuae45VGLqjgh5OgZnDYChHqjnvQywWl4gYMoKf.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:29:16', NULL, 'approved', 'contact_contributor', NULL, 'J100615', 1, '2025-05-14 12:10:20', '2025-05-20 05:23:11', 8, 16),
(981, 'Accountant Clerk', 'No Description', 3, 229, 'Colombo 03', 1, NULL, 'job_images/3LyAMk2FYYFMmjBou254YpCpxAZttJBbaScPclHz.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:29:29', NULL, 'approved', 'contact_contributor', NULL, 'J100616', 1, '2025-05-14 12:11:33', '2025-05-20 10:30:35', 8, 14),
(982, 'Maintenance Technician', 'No Description', 50, 287, 'Colombo 03', 1, NULL, 'job_images/p8iVLDqbdxAJi5bP9vHi6REnSPoYRxqSobhIIQkU.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:29:55', NULL, 'approved', 'contact_contributor', NULL, 'J100617', 1, '2025-05-14 12:12:59', '2025-05-20 05:33:45', 8, 13),
(983, 'Barista Trainee', 'No Description', 31, 151, 'Colombo 03', 1, NULL, 'job_images/yOjAVrkMj0aCnhY9TulFMm8ZlJ21j7iI3HrZspM7.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:30:19', NULL, 'approved', 'contact_contributor', NULL, 'J100618', 1, '2025-05-14 12:14:43', '2025-05-20 05:38:37', 8, 11),
(984, 'Room Boy', 'No Description', 13, 99, 'Colombo 03', 1, NULL, 'job_images/382JzyLhmgnYkKVDy4hf9FIFIdSNZUXyrvJHcg8c.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:30:39', NULL, 'approved', 'contact_contributor', NULL, 'J100619', 1, '2025-05-14 12:16:08', '2025-05-20 05:43:50', 8, 14),
(985, 'Kitchen Helper', 'No Description', 13, 99, 'Colombo 03', 1, NULL, 'job_images/xV89j1ySZ0xNRjM0agm7TdoTxo1LCmdStwC2WocI.jpg', NULL, 278, 1, NULL, '2025-06-19', '2025-05-14 09:30:56', NULL, 'approved', 'contact_contributor', NULL, 'J100620', 1, '2025-05-14 12:17:30', '2025-05-20 03:08:18', 8, 13),
(986, 'Chief Operations Officer', 'No Description', 21, 122, 'Colombo', 1, NULL, 'job_images/WuefGsp7fjfobPkt4ir8BnelWyNi0dbT1ceqODyg.jpg', NULL, 279, 1, NULL, '2025-06-19', '2025-05-14 09:31:08', NULL, 'approved', 'contact_contributor', NULL, 'J100621', 1, '2025-05-14 12:35:11', '2025-05-20 03:09:15', 8, 12),
(987, 'Regional Sales Manager', 'No Description', 4, 238, 'Ambalangoda , Galle , Matara', 1, NULL, 'job_images/Dn31p5DkNztVMSX3BuwrmDWZi2ORcpRng4i6Vd6Z.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 09:31:21', NULL, 'approved', 'contact_contributor', NULL, 'J100622', 1, '2025-05-14 12:37:58', '2025-05-19 15:47:28', 8, 12),
(988, 'Branch Sales Manager', 'No Description', 4, 238, 'Ambalangoda , Galle , Matara', 1, NULL, 'job_images/DdU1oiOPE0JaR80zUwPI36s6vAbhRkLV1VCPt963.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 09:31:38', NULL, 'approved', 'contact_contributor', NULL, 'J100623', 1, '2025-05-14 12:39:11', '2025-05-19 18:57:04', 8, 12),
(989, 'Social Media Manager', 'No Description', 4, 236, 'Colombo', 1, NULL, 'job_images/DdsDUi1MNKD0edyrL08vtLxSnhphnT5hEYl3KFkf.jpg', NULL, 280, 1, NULL, '2025-06-19', '2025-05-14 09:31:58', NULL, 'approved', 'contact_contributor', NULL, 'J100624', 1, '2025-05-14 12:44:31', '2025-05-20 03:10:24', 8, 12),
(990, 'Financial Analyst', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/UMvXyxDzcvvECVmkqMU6riZwJKiUFOBEKuCPgagk.jpg', NULL, 190, 1, NULL, '2025-05-17', '2025-05-14 09:32:18', NULL, 'approved', 'contact_contributor', NULL, 'J100625', 1, '2025-05-14 12:47:13', '2025-05-19 16:26:48', 8, 14),
(991, 'Operations Manager / Supervisor', 'No Description', 11, 255, 'Saudi Arabia', 1, NULL, 'job_images/xOEsQHDZIb9vVFHCk97t6S7h2hPFD7iK9Pr7dvnB.jpg', NULL, 281, 1, NULL, '2025-06-19', '2025-05-14 09:32:30', NULL, 'approved', 'contact_contributor', NULL, 'J100626', 1, '2025-05-14 13:06:25', '2025-05-20 03:11:17', 8, 13),
(992, 'Business Development Manager /Executive', 'No Description', 21, 123, 'Saudi Arabia', 63, NULL, 'job_images/28jz0LYJDpy8wy91ILFRkXGLOwpeQnFA6LXDfE5W.jpg', NULL, 281, 1, NULL, '2025-06-19', '2025-05-14 09:32:58', NULL, 'approved', 'contact_contributor', NULL, 'J100627', 1, '2025-05-14 13:08:24', '2025-05-20 03:12:16', 8, 12),
(993, 'Project Coordinator / Camp Coordinator / Admin Assistant', 'No Description', 46, 195, 'Saudi Arabia', 63, NULL, 'job_images/5hEXRQeGiAZW2abMgzgC9YCFtyW4Op2Nq6SBZp0V.jpg', NULL, 281, 1, NULL, '2025-06-19', '2025-05-14 09:33:18', NULL, 'approved', 'contact_contributor', NULL, 'J100628', 1, '2025-05-14 13:10:44', '2025-05-20 03:13:12', 8, 13),
(994, 'Senior Process Engineer - TQM', 'No Description', 12, 96, 'Dubai', 6, NULL, 'job_images/V1gV3ocMYREUBf3dMHQ8vQotc8s7EIBiFibBxdGo.jpg', NULL, 282, 1, NULL, '2025-06-19', '2025-05-14 09:33:41', NULL, 'approved', 'contact_contributor', NULL, 'J100629', 1, '2025-05-14 13:19:05', '2025-05-20 03:14:15', 8, 12),
(995, 'Senior Engineer - Quantity Audit', 'No Description', 12, 96, 'Dubai', 6, NULL, 'job_images/McHLfwP47nSgnv8nQXVbJnkk5HgP6fPvD2jwOBDP.jpg', NULL, 282, 1, NULL, '2025-06-19', '2025-05-14 09:34:00', NULL, 'approved', 'contact_contributor', NULL, 'J100630', 1, '2025-05-14 13:20:36', '2025-05-20 03:15:15', 8, 12),
(996, 'Engineer - Quantity Audit', 'No Description', 12, 96, 'Dubai', 6, NULL, 'job_images/QA2t0nWiI93JKlwx5TzSa92EUrls7Ffrpzlf3xzf.jpg', NULL, 282, 1, NULL, '2025-06-19', '2025-05-14 09:34:18', NULL, 'approved', 'contact_contributor', NULL, 'J100631', 1, '2025-05-14 13:21:54', '2025-05-20 03:16:12', 8, 12),
(997, 'Quantity Audit Manager - Modular', 'No Description', 12, 96, 'Dubai', 6, NULL, 'job_images/fH4RD1GwJfC3HRtlO4cl6AfMp45CpNyeRMsd3UeP.jpg', NULL, 282, 1, NULL, '2025-06-19', '2025-05-14 09:34:34', NULL, 'approved', 'contact_contributor', NULL, 'J100632', 1, '2025-05-14 13:24:01', '2025-05-20 03:17:02', 8, 13),
(998, 'Director of Sales & Marketing', 'No Description', 4, 238, 'Vietnam', 60, NULL, 'job_images/v1dIHuYMVlDcwDkI0nbuMsbhkMW3fKIh5eDHtKRh.jpg', NULL, 283, 1, NULL, '2025-06-19', '2025-05-14 09:34:49', NULL, 'approved', 'contact_contributor', NULL, 'J100633', 1, '2025-05-14 13:29:53', '2025-05-20 03:17:53', 8, 13),
(999, 'Account Assistant', 'No Description', 3, 229, 'Polonnaruwa', 1, NULL, 'job_images/n33RPaXsfgOFyFMYZMAjEigSA3u1FxcuObM0k0A9.jpg', NULL, 284, 1, NULL, '2025-06-19', '2025-05-14 09:36:37', NULL, 'approved', 'contact_contributor', NULL, 'J100634', 1, '2025-05-14 13:35:21', '2025-05-20 03:18:49', 8, 15),
(1000, 'Barista', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/wxit4JBI8iskTwBzj0RVIspKc7mOD4EJQZXEyQ5A.jpg', NULL, 285, 1, NULL, '2025-06-19', '2025-05-14 09:41:22', NULL, 'approved', 'contact_contributor', NULL, 'J100635', 1, '2025-05-14 13:40:01', '2025-05-19 20:49:45', 8, 12),
(1001, 'Waiters & Waitress', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/9ONgj8F6lv7YxLpNJrPd40NOzcr0961xrH9x5o6A.jpg', NULL, 285, 1, NULL, '2025-06-19', '2025-05-14 09:41:36', NULL, 'approved', 'contact_contributor', NULL, 'J100636', 1, '2025-05-14 13:40:53', '2025-05-20 00:53:45', 8, 12),
(1002, 'Commis 02 Chef', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/YCAl2xXDdHpp8ZAZO1tvk3nGyTY97XIJeHausGsP.jpg', NULL, 285, 1, NULL, '2025-06-19', '2025-05-14 09:44:17', NULL, 'approved', 'contact_contributor', NULL, 'J100637', 1, '2025-05-14 13:42:35', '2025-05-20 00:56:07', 8, 12),
(1003, 'Helper', 'No Description', 31, 151, 'Colombo', 1, NULL, 'job_images/MfDIoyhji5WRAEckWqC3qZxhHgqZu4ZnDjhQfuOt.jpg', NULL, 285, 1, NULL, '2025-06-19', '2025-05-14 09:44:28', NULL, 'approved', 'contact_contributor', NULL, 'J100638', 1, '2025-05-14 13:43:50', '2025-05-20 00:57:46', 8, 12),
(1004, 'Senior Accountant', 'No Description', 3, 229, 'Mahiyanganaya', 1, NULL, 'job_images/30TPgDnbM5VLOQqYhfdjdKo0ViXN7egLJDeNOZn2.jpg', NULL, 286, 1, NULL, '2025-06-19', '2025-05-14 10:28:30', NULL, 'approved', 'contact_contributor', NULL, 'J100639', 1, '2025-05-14 14:17:04', '2025-05-20 00:59:30', 8, 13),
(1005, 'HR & Admin Executive', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/K6pRS7IXwkVCE6oph5gtlCB6jfFciUJMEuqff2UF.jpg', NULL, 287, 1, NULL, '2025-06-19', '2025-05-14 10:28:41', NULL, 'approved', 'contact_contributor', NULL, 'J100640', 1, '2025-05-14 14:27:18', '2025-05-20 01:01:09', 8, 17),
(1006, 'Business Development Executive', 'No Description', 21, 123, 'Dehiwela', 1, NULL, 'job_images/rm9rVIQnUbvaUrrYzz9r8GKVjBsA0qU93DNNLuao.jpg', NULL, 288, 1, NULL, '2025-06-19', '2025-05-14 10:57:38', NULL, 'approved', 'contact_contributor', NULL, 'J100641', 1, '2025-05-14 14:30:56', '2025-05-20 01:03:08', 8, 12),
(1007, 'Branch Manager & Assistant Manager', 'No Description', 21, 123, 'Bandaragama', 1, NULL, 'job_images/nuCEJ7VnOgHXHs7sm4qVgyMMVHUzLWoPxjcqLEkG.jpg', NULL, 289, 1, NULL, '2025-06-20', '2025-05-14 10:57:58', NULL, 'approved', 'contact_contributor', NULL, 'J100642', 1, '2025-05-14 14:36:52', '2025-05-20 01:04:06', 8, 13),
(1008, 'HR & Admin Executive', 'No Description', 46, 195, 'Kandy', 1, NULL, 'job_images/eYoSZ5KL654WcTgBHoKAh2Hr4WBgYSbUtMxRF5nf.jpg', NULL, 290, 1, NULL, '2025-06-19', '2025-05-14 10:58:09', NULL, 'approved', 'contact_contributor', NULL, 'J100643', 1, '2025-05-14 14:40:03', '2025-05-20 01:05:35', 8, 19),
(1009, 'Assistant Chef', 'No Description', 31, 151, 'Rathnapura', 1, NULL, 'job_images/xZqOBqoIAmToIK9gkrQxwLKFuoYePZUpPRdJ6H6L.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 10:58:20', NULL, 'approved', 'contact_contributor', NULL, 'J100644', 1, '2025-05-14 14:42:26', '2025-05-19 01:01:20', 8, 12),
(1010, 'Recovery Call Center Officers', 'No Description', 5, 90, 'Colombo', 1, NULL, 'job_images/EustrTKUgoNTswIkzw1Bj6b62uceXraw3UAxOucB.jpg', NULL, 190, 1, NULL, '2025-06-19', '2025-05-14 10:58:30', NULL, 'approved', 'contact_contributor', NULL, 'J100645', 1, '2025-05-14 14:47:19', '2025-05-19 14:43:08', 8, 19),
(1011, 'Driver', 'No Description', 51, 302, 'Colombo', 1, NULL, 'job_images/wlqnbs7uRRArC4uoK55NkBXGgh9dTezQcIRJPr6M.jpg', NULL, 291, 1, NULL, '2025-06-19', '2025-05-14 10:58:40', NULL, 'approved', 'contact_contributor', NULL, 'J100646', 1, '2025-05-14 14:54:26', '2025-05-20 01:06:59', 8, 16),
(1012, 'Beauty Therapist', 'No Description', 20, 272, 'Colombo', 1, NULL, 'job_images/pQ66eFzVo6dOqvjvZjc3Sq0YwMduPoyNDt7JTt3S.jpg', NULL, 292, 1, NULL, '2025-06-19', '2025-05-14 11:01:10', NULL, 'approved', 'contact_contributor', NULL, 'J100647', 1, '2025-05-14 14:58:53', '2025-05-20 01:08:11', 8, 12),
(1013, 'Trainee Staff Assistant', 'No Description', 23, 132, 'Island wide', 1, NULL, 'job_images/jpSU2fuMco9clT0ItS81PY7TJevomFbAKQrzlXgQ.jpg', NULL, 190, 1, NULL, '2025-05-25', '2025-05-15 03:02:36', NULL, 'approved', 'contact_contributor', NULL, 'J100648', 1, '2025-05-15 07:01:38', '2025-05-20 08:19:45', 8, 57),
(1014, 'Office Coordinator', 'No Description', 28, 140, 'Seeduwa', 1, NULL, 'job_images/c2FhwBVycGpHRsZCBNpGq0Xh6l0J534OxGoAoYCx.jpg', NULL, 293, 1, NULL, '2025-06-15', '2025-05-15 03:10:18', NULL, 'approved', 'contact_contributor', NULL, 'J100649', 1, '2025-05-15 07:08:59', '2025-05-20 01:09:27', 8, 37),
(1015, 'Area Managers/Marketing Executives', 'No Description', 36, 167, 'Jaffna', 1, NULL, 'job_images/zXwMqRJzkl5ZTsVs8kSi0oyPxo8RnYhsgsadiPYH.jpg', NULL, 294, 1, NULL, '2025-05-26', '2025-05-15 03:20:16', NULL, 'approved', 'contact_contributor', NULL, 'J100650', 1, '2025-05-15 07:19:53', '2025-05-19 23:38:10', 7, 50),
(1016, 'Digital Marketing Executive', 'HomeOnline.com', 4, 234, 'Online', 1, NULL, 'job_images/nYSWCr0Hlg6uGUXagBFuQnI7CSPYRIoyps3surVf.jpg', NULL, 190, 1, 1, '2025-06-15', '2025-05-15 10:29:25', NULL, 'approved', 'contact_contributor', NULL, 'J100651', 1, '2025-05-15 14:29:15', '2025-05-19 20:33:25', 8, 43),
(1017, 'Plumber/Furniture Carpenter', 'No Description', 49, 217, 'Kuwait', 45, NULL, 'job_images/DPKwlLuypTRw9U0iCvvs4ipn23an28bRgxsiFdm7.jpg', NULL, 296, 1, NULL, '2025-06-16', '2025-05-16 01:25:19', NULL, 'approved', 'contact_contributor', NULL, 'J100652', 1, '2025-05-16 05:22:45', '2025-05-20 01:10:34', 8, 7),
(1018, 'Marketing Manager', 'No Description', 4, 235, 'Maldives', 11, NULL, 'job_images/ShwbAbEr4qq3EjhE0GJGuloj7Q71AyhFXJfryvva.jpg', NULL, 297, 1, NULL, '2025-06-16', '2025-05-16 01:35:42', NULL, 'approved', 'contact_contributor', NULL, 'J100653', 1, '2025-05-16 05:35:28', '2025-05-19 18:58:04', 7, 24),
(1019, 'PARASAILING Captain/Water Sport Guide', 'No Description', 13, 99, 'Maldives', 11, NULL, 'job_images/Cjmf6YmqR4dHydsVYqj4r24K4NRbJvA21xEFtwM2.jpg', NULL, 297, 1, NULL, '2025-06-16', '2025-05-16 01:35:52', NULL, 'approved', 'contact_contributor', NULL, 'J100654', 1, '2025-05-16 05:35:28', '2025-05-20 10:00:08', 7, 22),
(1020, 'Transport Manager', 'No Description', 11, 254, 'Maldives', 11, NULL, 'job_images/o8RoFRLRqoLT9YdA4kFmjqdbY3Xq3iMVFLsVTKdY.jpg', NULL, 297, 1, NULL, '2025-06-16', '2025-05-16 01:36:04', NULL, 'approved', 'contact_contributor', NULL, 'J100655', 1, '2025-05-16 05:35:28', '2025-05-19 17:34:36', 7, 17),
(1021, 'CFO', 'No Description', 3, 229, 'Maldives', 11, NULL, 'job_images/U3SaRJNFHfFJfCDowE11x2Jb3M7zZYkqtvlTSWpV.jpg', NULL, 297, 1, NULL, '2025-05-20', '2025-05-16 01:36:14', NULL, 'approved', 'contact_contributor', NULL, 'J100656', 1, '2025-05-16 05:35:28', '2025-05-20 08:57:50', 7, 21),
(1022, 'Certified Public Accountant', 'No Description', 3, 229, 'Makati', 65, NULL, 'job_images/jNQEdE3Rx62wi7L5WvuANa3rSizxMZT2GEsCp39b.jpg', NULL, 190, 1, NULL, '2025-06-16', '2025-05-16 01:48:10', NULL, 'approved', 'contact_contributor', NULL, 'J100657', 1, '2025-05-16 05:44:28', '2025-05-18 16:22:33', 8, 5),
(1023, 'Accounting Manager', 'No Description', 3, 229, 'Makati', 65, NULL, 'job_images/H3EzVhjRTm8tKbYPCr6hkhi0axGAzSW0VTX9CTSj.jpg', NULL, 190, 1, NULL, '2025-06-16', '2025-05-16 01:48:23', NULL, 'approved', 'contact_contributor', NULL, 'J100658', 1, '2025-05-16 05:44:28', '2025-05-19 21:59:41', 8, 6),
(1024, 'Accounting Manager', 'No Description', 3, 229, 'Africa', 65, NULL, 'job_images/ln4gRsq0FdfdNB9I3ZPGNdtTRVIAwUM3i7Ye0KHS.jpg', NULL, 190, 1, NULL, '2025-06-16', '2025-05-16 01:51:47', NULL, 'approved', 'contact_contributor', NULL, 'J100659', 1, '2025-05-16 05:51:35', '2025-05-20 10:11:34', 8, 7),
(1025, 'Operation Assistants', 'No Description', 46, 196, 'Colombo', 1, NULL, 'job_images/Dc4vLBAv95qVa7mQd6l01OPOb9lRmBBf5KLRy4r1.jpg', NULL, 269, 1, NULL, '2025-06-16', '2025-05-16 01:58:27', NULL, 'approved', 'contact_contributor', NULL, 'J100660', 1, '2025-05-16 05:58:18', '2025-05-20 01:11:48', 8, 11),
(1026, 'Teachers', 'No Description', 6, 242, 'Makati', 65, NULL, 'job_images/M12kzMay09hCF3eu7ciPZsN6VTNJH0SRiyFzxNSz.jpg', NULL, 190, 1, NULL, '2025-06-16', '2025-05-16 02:02:09', NULL, 'approved', 'contact_contributor', NULL, 'J100661', 1, '2025-05-16 06:01:47', '2025-05-18 23:32:28', 8, 12),
(1027, 'Pharmacist', 'No Description', 7, 246, 'Maldives', 11, NULL, 'job_images/YQxPH9PcuOVEx5Do0AQVwhcSDSVbBiuPYeuU7dtS.jpg', NULL, 298, 1, NULL, '2025-06-16', '2025-05-16 02:05:59', NULL, 'approved', 'contact_contributor', NULL, 'J100662', 1, '2025-05-16 06:05:49', '2025-05-20 01:12:51', 8, 8),
(1028, 'English Teachers', 'No Description', 6, 242, 'Matara', 1, NULL, 'job_images/k2j5NVFOAyusO0TXLmgMJnXqyrqqW7XeHAhXOZJ2.jpg', NULL, 190, 1, NULL, '2025-06-16', '2025-05-16 02:13:00', NULL, 'approved', 'contact_contributor', NULL, 'J100663', 1, '2025-05-16 06:10:31', '2025-05-19 09:35:21', 8, 7),
(1029, 'Account Assistant', 'No Description', 3, 229, 'Colombo 5', 1, NULL, 'job_images/HPiDVn84whbKWpVBHghzttfNwR0KulAbpvGjHlBl.jpg', NULL, 299, 1, NULL, '2025-06-16', '2025-05-16 02:13:08', NULL, 'approved', 'contact_contributor', NULL, 'J100664', 1, '2025-05-16 06:12:47', '2025-05-20 10:33:34', 8, 46),
(1030, 'Audit trainee', 'No Description', 3, 230, 'Maharagama', 1, NULL, 'job_images/Xx4IWH9GMQcyMPsvjyoKzSh5sraOZcrgv2d1EX3b.jpg', NULL, 300, 1, NULL, '2025-06-22', '2025-05-17 06:30:01', NULL, 'approved', 'contact_contributor', NULL, 'J100665', 1, '2025-05-17 07:55:34', '2025-05-20 01:14:59', 8, 5),
(1031, 'Trainee Associates / Supervisors', 'No Description', 3, 230, 'Kadawatha, Colombo, Negombo', 1, NULL, 'job_images/J6eiN70kNFOkevjevxpP3euFfXuO8B6jkS0OAdbc.jpg', NULL, 301, 1, NULL, '2025-06-22', '2025-05-17 06:30:12', NULL, 'approved', 'contact_contributor', NULL, 'J100666', 1, '2025-05-17 08:00:31', '2025-05-20 01:16:17', 8, 6),
(1032, 'Relationship Manager / Deputy Relationship Manager', 'No Description', 4, 235, 'Karachi', 13, NULL, 'job_images/RZ3tenYUONmHbbCzTeWjAByFabhK316MBuox530m.jpg', NULL, 302, 1, NULL, '2025-06-22', '2025-05-17 06:30:21', NULL, 'approved', 'contact_contributor', NULL, 'J100667', 1, '2025-05-17 08:45:18', '2025-05-20 01:17:31', 8, 4),
(1033, 'Virtual Executive Assistant', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/eGULGZdZe3i5lmF5DuaQe03VbGGc9eK4aFMRtTO1.jpg', NULL, 303, 1, NULL, '2025-06-22', '2025-05-17 06:30:29', NULL, 'approved', 'contact_contributor', NULL, 'J100668', 1, '2025-05-17 08:51:56', '2025-05-20 01:18:52', 8, 5),
(1034, 'Assistant Manager - Agriculture', 'No Description', 26, 134, 'Pannipitiya', 1, NULL, 'job_images/QeddySsX9LZgZGhMm3emet6dyutUml5XXvfaAf6N.jpg', NULL, 304, 1, NULL, '2025-06-22', '2025-05-17 06:30:38', NULL, 'approved', 'contact_contributor', NULL, 'J100669', 1, '2025-05-17 09:14:35', '2025-05-20 01:20:32', 8, 4),
(1035, 'Account Assistant', 'No Description', 3, 229, 'Colombo 05', 1, NULL, 'job_images/Fjhey8RkTAy81rtQ9HwmlZcBIJEGp903vf5NwjEj.jpg', NULL, 305, 1, NULL, '2025-06-22', '2025-05-17 06:30:47', NULL, 'approved', 'contact_contributor', NULL, 'J100670', 1, '2025-05-17 09:19:54', '2025-05-20 01:21:36', 8, 7),
(1036, 'Elementary & Middle School Faculty', 'No Description', 6, 243, 'Peshawar', 1, NULL, 'job_images/uzKzkNpQUqc1Cej3qdSU0Ww95LPaCHQhzcnjLACE.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-17 06:30:57', NULL, 'approved', 'contact_contributor', NULL, 'J100671', 1, '2025-05-17 09:29:14', '2025-05-20 10:28:17', 8, 8),
(1037, 'Audit trainee', 'No Description', 3, 230, 'Kurugegala', 1, NULL, 'job_images/e1VY1xiRth5dmR9YB3zS4yyztDRr1GQ5L8puwtZY.jpg', NULL, 306, 1, NULL, '2025-06-22', '2025-05-17 06:31:07', NULL, 'approved', 'contact_contributor', NULL, 'J100672', 1, '2025-05-17 09:34:45', '2025-05-20 01:22:44', 8, 4),
(1038, 'Teachers & Non-Teaching Staff', 'No Description', 6, 242, 'Colombo', 1, NULL, 'job_images/Q3nma7ZM1csfu9LTbI5teRySHNdDAUMpqP07oOHM.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-17 06:31:15', NULL, 'approved', 'contact_contributor', NULL, 'J100673', 1, '2025-05-17 09:39:17', '2025-05-20 06:48:19', 8, 11),
(1039, 'Digital Marketing Intern', 'No Description', 4, 234, 'Kotte', 1, NULL, 'job_images/TbGDlCnqeti4cNqwhDsRArWl7T65hWrB5aCkWyAx.jpg', NULL, 307, 1, NULL, '2025-06-22', '2025-05-17 06:31:26', NULL, 'approved', 'contact_contributor', NULL, 'J100674', 1, '2025-05-17 09:45:08', '2025-05-20 01:23:33', 8, 4),
(1040, 'Technical Officer / Site Supervisor', 'No Description', 12, 96, 'Kotte', 1, NULL, 'job_images/EqWa0GJ1WdiZWXy79lpeqZAS6mX76hxf9d1kOx5V.jpg', NULL, 307, 1, NULL, '2025-06-22', '2025-05-17 06:31:37', NULL, 'approved', 'contact_contributor', NULL, 'J100675', 1, '2025-05-17 09:47:14', '2025-05-20 01:24:31', 8, 4),
(1041, 'Key account Manager', 'No Description', 3, 229, 'Kotte', 1, NULL, 'job_images/0OyL6eVz1tMOnCmOUnxfQu0IqovNigHYDrYtbw3e.jpg', NULL, 307, 1, NULL, '2025-06-22', '2025-05-17 06:32:08', NULL, 'approved', 'contact_contributor', NULL, 'J100676', 1, '2025-05-17 09:48:44', '2025-05-20 01:25:39', 8, 4),
(1042, 'Key account Manager', 'No Description', 3, 229, 'Kotte', 1, NULL, 'job_images/76ohkywg0mYbUb9iUwZKyOZJGTxCiOkzMEqDV0Y8.jpg', NULL, 307, 1, NULL, '2025-06-22', '2025-05-17 06:32:21', NULL, 'approved', 'contact_contributor', NULL, 'J100677', 1, '2025-05-17 09:50:17', '2025-05-20 01:26:49', 8, 4),
(1043, 'Elevator Technician / Elevator Supervisor', 'No Description', 12, 96, 'UAE', 63, NULL, 'job_images/jANIUHOXj62QiJXCo7cDPZdFwkwt2pvz2DeS9TnY.jpg', NULL, 308, 1, NULL, '2025-06-22', '2025-05-17 06:32:39', NULL, 'approved', 'contact_contributor', NULL, 'J100678', 1, '2025-05-17 09:58:19', '2025-05-20 09:14:13', 8, 5),
(1044, 'Elevator Testing Engineer', 'No Description', 12, 96, 'indian', 3, NULL, 'job_images/0hmFvm4xeEWm9rULsV0iShDraxUjZ3k3u2SdEr5d.jpg', NULL, 308, 1, NULL, '2025-06-22', '2025-05-17 06:32:51', NULL, 'approved', 'contact_contributor', NULL, 'J100679', 1, '2025-05-17 10:00:43', '2025-05-20 01:28:48', 8, 4),
(1045, 'Administration Assistant / Manager', 'No Description', 46, 195, 'Maldives', 11, NULL, 'job_images/9rG09wsQv11j7WV7mWL810yKurTwIhqivkZWtTrW.jpg', NULL, 308, 1, NULL, '2025-06-22', '2025-05-17 06:33:02', NULL, 'approved', 'contact_contributor', NULL, 'J100680', 1, '2025-05-17 10:02:43', '2025-05-20 01:30:09', 8, 5),
(1046, 'Sales Executive', 'No Description', 4, 235, 'Dubai', 1, NULL, 'job_images/PdrzbeXxqKBvPGsjgUJR8oqGIK4klvIBaBPcuiBL.jpg', NULL, 308, 1, NULL, '2025-06-22', '2025-05-17 06:33:12', NULL, 'approved', 'contact_contributor', NULL, 'J100681', 1, '2025-05-17 10:03:48', '2025-05-20 01:31:11', 8, 4),
(1047, 'Trainee Sales Assistant', 'No Description', 4, 235, 'Dubai', 6, NULL, 'job_images/DoCcBAJ2QRQHQMmhNYt9fydqFAzj9u2I7KW95H2O.jpg', '.', 308, 1, NULL, '2025-06-22', '2025-05-17 06:33:23', NULL, 'approved', 'contact_contributor', NULL, 'J100682', 1, '2025-05-17 10:06:19', '2025-05-20 01:32:27', 8, 6),
(1048, 'Business Development Manager / Digital Marketing Executive', 'No Description', 4, 234, 'Dubai', 6, NULL, 'job_images/786E8pW7GkLRQC6sZJsnQFVd3Hob3DinU16xEq3l.jpg', NULL, 308, 1, NULL, '2025-06-22', '2025-05-17 06:33:33', NULL, 'approved', 'contact_contributor', NULL, 'J100683', 1, '2025-05-17 10:09:36', '2025-05-20 01:33:55', 8, 4),
(1049, 'Hostel Warden / Sport Teacher / School Nurse', 'No Description', 8, 74, 'Nepal', 51, NULL, 'job_images/I596opVoGenk1jmEtKGyQYNsDLMwQpteAdFP8acH.jpg', NULL, 309, 1, NULL, '2025-06-22', '2025-05-17 06:33:41', NULL, 'approved', 'contact_contributor', NULL, 'J100684', 1, '2025-05-17 10:14:46', '2025-05-20 01:35:14', 8, 4),
(1050, 'Hostel Warden / Sport Teacher / School Nurse', 'No Description', 8, 74, 'Nepal', 51, NULL, 'job_images/fPP8BgDvosIv2ouFELH48RIm2NY1DXFnuTCDfONx.jpg', NULL, 309, 1, NULL, '2025-06-22', '2025-05-17 06:33:49', NULL, 'approved', 'contact_contributor', NULL, 'J100685', 1, '2025-05-17 10:15:04', '2025-05-20 06:57:45', 8, 5),
(1051, 'Finance Executive', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/SQ1D37ldT433FZoKtKEqZrjn0ocJYM3VUKerJEwd.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-17 06:31:53', NULL, 'approved', 'contact_contributor', NULL, 'J100686', 1, '2025-05-17 10:17:42', '2025-05-20 09:53:33', 8, 8),
(1052, 'Finance / Accounting Officer', 'No Description', 3, 229, 'Antipolo City', 55, NULL, 'job_images/HW4RwX4A0dQJy9aGCCVnWVgRWOMFOHLwT0d4QuGz.jpg', NULL, 310, 1, NULL, '2025-06-22', '2025-05-17 06:33:57', NULL, 'approved', 'contact_contributor', NULL, 'J100687', 1, '2025-05-17 10:23:53', '2025-05-20 01:37:52', 8, 4),
(1053, 'Account Manager', 'No Description', 3, 229, 'Zimbabwe', 62, NULL, 'job_images/VJfUfKXbxLPqFkKjxd1D3cd6jEaXcwNTUyn4Bkzw.jpg', NULL, 311, 1, NULL, '2025-06-22', '2025-05-17 06:34:06', NULL, 'approved', 'contact_contributor', NULL, 'J100688', 1, '2025-05-17 10:27:58', '2025-05-20 01:39:05', 8, 4),
(1054, 'Office Support Specialist / Customer Service Admin / Marketing Staff', 'No Description', 46, 195, 'Germany', 39, NULL, 'job_images/DHGh0ahsDHzr23DvzeHV8Ux6D7dBHbuCydtRDlAm.jpg', NULL, 312, 1, NULL, '2025-06-22', '2025-05-17 06:34:14', NULL, 'approved', 'contact_contributor', NULL, 'J100689', 1, '2025-05-17 10:33:24', '2025-05-20 01:40:10', 8, 8),
(1055, 'Creative Content Writer', 'No Description', 16, 108, 'Colombo 03', 1, NULL, 'job_images/mb4ZctOnFrwjgNPVszG0JukQQ5cb0wBTy86Lz72F.jpg', NULL, 313, 1, NULL, '2025-06-22', '2025-05-17 08:22:58', NULL, 'approved', 'contact_contributor', NULL, 'J100690', 1, '2025-05-17 10:37:42', '2025-05-20 01:41:18', 8, 3),
(1056, 'Lecturers - Visiting', 'No Description', 6, 242, 'Dubai', 6, NULL, 'job_images/tIovJEQ4q9O2vM4ORrWWeqsbRaBPEgziSq7DcsSk.jpg', NULL, 314, 1, NULL, '2025-06-22', '2025-05-17 08:23:06', NULL, 'approved', 'contact_contributor', NULL, 'J100691', 1, '2025-05-17 10:45:31', '2025-05-20 01:42:33', 8, 4),
(1057, 'Branch Manager', 'No Description', 23, 132, 'Colombo 04', 1, NULL, 'job_images/K4a23U5o610wpr6XXPakCmxp9TXcfNBhoytgfhXj.jpg', NULL, 48, 1, NULL, '2025-06-22', '2025-05-17 08:23:19', NULL, 'approved', 'contact_contributor', NULL, 'J100692', 1, '2025-05-17 12:03:57', '2025-05-20 01:43:47', 8, 50),
(1058, 'Customer Care Executives', 'No Description', 5, 90, 'Kohuwala', 1, NULL, 'job_images/cSJ3Ws3bNivozie9JDIW3QBu3OhpWsHdDM0jpII1.jpg', NULL, 47, 1, NULL, '2025-06-22', '2025-05-17 08:23:28', NULL, 'approved', 'contact_contributor', NULL, 'J100693', 1, '2025-05-17 12:07:16', '2025-05-20 10:26:00', 8, 6),
(1059, 'Dynamic Sales & Marketing Manager', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/lXMZtjjMRLEs7FahmgI691MdIERviVwvQv1dJ4Qo.jpg', NULL, 315, 1, NULL, '2025-06-22', '2025-05-17 08:23:36', NULL, 'approved', 'contact_contributor', NULL, 'J100694', 1, '2025-05-17 12:13:22', '2025-05-20 01:46:23', 8, 3),
(1060, 'HSE Inspector', 'No Description', 36, 167, 'Dubai', 6, NULL, 'job_images/QUuuxCjO0133uZpzME0XxPBvOBZpt2lEm8cS49RN.jpg', NULL, 316, 1, NULL, '2025-06-22', '2025-05-17 08:23:43', NULL, 'approved', 'contact_contributor', NULL, 'J100695', 1, '2025-05-17 12:18:31', '2025-05-20 01:47:35', 8, 3),
(1061, 'Kitchen & laundry Equipment Technician', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/hxskk0NOuo4ExdKCaWxm8Pd4ZhPUkNzzOBnuY1Ik.jpg', NULL, 316, 1, NULL, '2025-06-22', '2025-05-17 08:23:52', NULL, 'approved', 'contact_contributor', NULL, 'J100696', 1, '2025-05-17 12:20:09', '2025-05-20 01:48:34', 8, 3),
(1062, 'Electrical Supervisor', 'No Description', 35, 165, 'Dubai', 1, NULL, 'job_images/4NF8VDhswuYs9eU1DlZWigYgLyP4Ue7tcEblAFC6.jpg', NULL, 316, 1, NULL, '2025-06-22', '2025-05-17 08:24:01', NULL, 'approved', 'contact_contributor', NULL, 'J100697', 1, '2025-05-17 12:21:59', '2025-05-20 01:49:12', 8, 3),
(1063, 'Storekeeper', 'No Description', 11, 257, 'Dubai', 6, NULL, 'job_images/61dhrWtJSEuTzs8fsYh9wVcNjbwT3G3jMhv9oCio.jpg', NULL, 316, 1, NULL, '2025-06-22', '2025-05-17 08:24:11', NULL, 'approved', 'contact_contributor', NULL, 'J100698', 1, '2025-05-17 12:23:37', '2025-05-20 01:49:43', 8, 3),
(1064, 'CAFM Coordinator', 'No Description', 50, 287, 'Dubai', 1, NULL, 'job_images/VEDyjtslpQglNfbXnIG5F4wrOWDR5D9lpMsQoJJn.jpg', NULL, 316, 1, NULL, '2025-06-22', '2025-05-17 08:25:34', NULL, 'approved', 'contact_contributor', NULL, 'J100699', 1, '2025-05-17 12:25:11', '2025-05-20 01:51:14', 8, 3),
(1065, 'Technician', 'No Description', 50, 287, 'Mumbai', 3, NULL, 'job_images/5XNVX6le8vez8VBcGY1M6DjZ8hqtNdF0r8ccjqa2.jpg', NULL, 317, 1, NULL, '2025-06-22', '2025-05-17 08:44:17', NULL, 'approved', 'contact_contributor', NULL, 'J100700', 1, '2025-05-17 12:28:53', '2025-05-20 01:52:27', 8, 3),
(1066, 'Engineers', 'No Description', 12, 96, 'Mumbai', 3, NULL, 'job_images/Nbe5RCpoqBXd0RHUalobFclrgmrHAQkCWLgTYcdq.jpg', NULL, 317, 1, NULL, '2025-06-22', '2025-05-17 08:44:27', NULL, 'approved', 'contact_contributor', NULL, 'J100701', 1, '2025-05-17 12:30:24', '2025-05-20 01:54:06', 8, 3),
(1067, 'Engineers & Manager', 'No Description', 12, 96, 'Mumbai', 3, NULL, 'job_images/o7pypg4a6jUK3tMOnz7DHvF3DgJYAyx4qie1lJex.jpg', NULL, 317, 1, NULL, '2025-06-22', '2025-05-17 08:44:38', NULL, 'approved', 'contact_contributor', NULL, 'J100702', 1, '2025-05-17 12:31:40', '2025-05-20 01:55:18', 8, 3),
(1068, 'Senior Executive', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/K0YPOihKewi76rRdYT4xliOSeUYhkK3EFQkiYPOY.jpg', NULL, 160, 1, NULL, '2025-06-22', '2025-05-17 08:44:47', NULL, 'approved', 'contact_contributor', NULL, 'J100703', 1, '2025-05-17 12:34:06', '2025-05-20 01:56:22', 8, 4),
(1069, 'F&B Night Cleaner', 'No Description', 31, 153, 'Colombo', 1, NULL, 'job_images/jmRXuMBgqg0wOEuKPksnpJXyTiZETKiIhpKJXy1N.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:44:57', NULL, 'approved', 'contact_contributor', NULL, 'J100704', 1, '2025-05-17 12:40:18', '2025-05-18 22:45:38', 8, 3),
(1070, 'Chief Accountant', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/M9lgfuNGiT6mS76TntVFGWrhfmZoLjYpegeHCkjO.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:45:07', NULL, 'approved', 'contact_contributor', NULL, 'J100705', 1, '2025-05-17 12:41:17', '2025-05-19 21:15:53', 8, 22),
(1071, 'Technician', 'No Description', 50, 287, 'Colombo', 1, NULL, 'job_images/05XwW86BNMU1OGlgnemuXXvMuXF3nTXIk4ubZHEg.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:45:20', NULL, 'approved', 'contact_contributor', NULL, 'J100706', 1, '2025-05-17 12:42:29', '2025-05-18 22:53:04', 8, 3),
(1072, 'Housekeeping', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/1VaVLPMpe39lcUu3veGPI0FKugG5yvUEJfvNwruA.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:45:32', NULL, 'approved', 'contact_contributor', NULL, 'J100707', 1, '2025-05-17 12:44:37', '2025-05-19 20:44:29', 8, 4),
(1073, 'Front Office', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/IgljzChtDZImImqRHLo57DRcguvyYtKB62gjq9RL.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:46:24', NULL, 'approved', 'contact_contributor', NULL, 'J100708', 1, '2025-05-17 12:45:54', '2025-05-18 22:59:28', 8, 3),
(1074, 'Guest Relation Manager / Duty Manger', 'No Description', 5, 89, 'Colombo', 1, NULL, 'job_images/QmZLGenZDGVEy647Xo65rKYGpl0D75MMCmhPOwVd.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:53:07', NULL, 'approved', 'contact_contributor', NULL, 'J100709', 1, '2025-05-17 12:47:58', '2025-05-20 01:00:22', 8, 5),
(1075, 'Sales Executive / Sales Manager', 'No Description', 4, 238, 'Colombo', 1, NULL, 'job_images/tA7jUgzxu2IOrnHPQIwEJdx1t45Tgm4BK1qorv4F.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:53:15', NULL, 'approved', 'contact_contributor', NULL, 'J100710', 1, '2025-05-17 12:48:58', '2025-05-18 23:06:17', 8, 3),
(1076, 'Kids Club Manager', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/4TR7ex6buzd8TcqF8iqwtzxept7BkFhLd3Sjfdri.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:53:24', NULL, 'approved', 'contact_contributor', NULL, 'J100711', 1, '2025-05-17 12:51:52', '2025-05-18 23:09:42', 8, 3),
(1077, 'Housekeeping', 'No Description', 13, 99, 'Colombo', 1, NULL, 'job_images/2lZrkCUBC2aTgdBLcDEb44Pdi1RwdUzpZZSZYU0a.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:53:32', NULL, 'approved', 'contact_contributor', NULL, 'J100712', 1, '2025-05-17 12:53:16', '2025-05-18 23:12:50', 8, 3),
(1078, 'IT Officer', 'No Description', 1, 80, 'Colombo', 1, NULL, 'job_images/C9chre5do3IEsWONzDjm6rw80MdCzKpEofCCMDVY.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:54:50', NULL, 'approved', 'contact_contributor', NULL, 'J100713', 1, '2025-05-17 12:54:17', '2025-05-20 10:43:29', 8, 17),
(1079, 'Security Supervisor', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/KbdRMGOrIlnHAJQhR6RRbHR28YFTIb3pxvecSOWX.jpg', NULL, 318, 1, NULL, '2025-06-22', '2025-05-17 08:57:12', NULL, 'approved', 'contact_contributor', NULL, 'J100714', 1, '2025-05-17 12:55:29', '2025-05-18 23:19:46', 8, 3),
(1080, 'Internal Bookkeeper', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/wSYQkpHKf2bqiyntvvLs995EpC7xI3nykGaYIbTb.jpg', NULL, 319, 1, NULL, '2025-06-22', '2025-05-17 09:11:26', NULL, 'approved', 'contact_contributor', NULL, 'J100715', 1, '2025-05-17 12:59:17', '2025-05-20 01:57:30', 8, 5),
(1081, 'Audit trainee', 'No Description', 3, 230, 'Maharagama', 1, NULL, 'job_images/tP0gEljTFsukEMjEgS4y3vUJYFRuhxyGmP0f0aan.jpg', NULL, 300, 1, NULL, '2025-06-22', '2025-05-17 09:11:33', NULL, 'approved', 'contact_contributor', NULL, 'J100716', 1, '2025-05-17 13:00:56', '2025-05-20 01:58:47', 8, 3),
(1082, 'Audit trainee', 'No Description', 3, 230, 'Rajagiriya . Kurunagala', 1, NULL, 'job_images/ffR7i0weoF9H52kQGgIUxgDqeuJH9ZiO2MdeTXOA.jpg', NULL, 235, 1, NULL, '2025-06-22', '2025-05-17 09:11:42', NULL, 'approved', 'contact_contributor', NULL, 'J100717', 1, '2025-05-17 13:02:59', '2025-05-20 02:00:15', 8, 4),
(1083, 'Administration Assistant / Receptionist', 'No Description', 46, 195, 'Colombo', 1, NULL, 'job_images/86zVfQ6GOewfzacmCEjtEjmGibuOn4lGxWyYNmp4.jpg', NULL, 320, 1, NULL, '2025-06-22', '2025-05-17 09:11:49', NULL, 'approved', 'contact_contributor', NULL, 'J100718', 1, '2025-05-17 13:06:38', '2025-05-20 02:01:33', 8, 3),
(1084, 'Architect / Structural Engineer', 'No Description', 12, 96, 'Dubai', 6, NULL, 'job_images/JpOaokCXIcrf6c2TWIwOQJPnJ8siPQcXtEyQiDim.jpg', NULL, 321, 1, NULL, '2025-06-22', '2025-05-17 09:11:59', NULL, 'approved', 'contact_contributor', NULL, 'J100719', 1, '2025-05-17 13:10:41', '2025-05-20 02:02:27', 8, 3),
(1085, 'Driver', 'No Description', 51, 302, 'Colombo', 1, NULL, 'job_images/dphqfSQRTS36RXNONnpY9nNHj8bCyNC09rETX96U.jpg', NULL, 322, 1, NULL, '2025-06-22', '2025-05-17 09:16:19', NULL, 'approved', 'contact_contributor', NULL, 'J100720', 1, '2025-05-17 13:14:02', '2025-05-20 02:03:27', 8, 4),
(1086, 'Regional Sales Manager / Branch Sales Manager', 'No Description', 4, 235, 'Ambalangoda , Galle , Matara', 1, NULL, 'job_images/YjTirae2wLn8YhiGeVCzOLvd9N7bWZ58oG4RSaF2.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-17 09:19:31', NULL, 'approved', 'contact_contributor', NULL, 'J100721', 1, '2025-05-17 13:18:34', '2025-05-20 02:04:33', 8, 3),
(1087, 'Account Executive', 'No Description', 3, 229, 'Giriulla', 1, NULL, 'job_images/pstgAS0CRIpR5ih136azOhnMjsBThMhqSvpnMCcx.jpg', NULL, 323, 1, NULL, '2025-06-22', '2025-05-17 09:24:11', NULL, 'approved', 'contact_contributor', NULL, 'J100722', 1, '2025-05-17 13:21:45', '2025-05-20 02:05:32', 8, 5),
(1088, 'AC Technicians', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/UeroiPhuBVowkgi3J5zqRyOKlLBxHdZ49yzQOXyc.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-17 09:24:19', NULL, 'approved', 'contact_contributor', NULL, 'J100723', 1, '2025-05-17 13:23:29', '2025-05-20 02:06:40', 8, 3),
(1089, 'Housemaid', 'No Description', 51, 304, 'Qatar', 17, NULL, 'job_images/OOvU5MMiId47SuIZcGuNWWnvvQOTZnRPj2NPGA70.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-17 09:27:58', NULL, 'approved', 'contact_contributor', NULL, 'J100724', 1, '2025-05-17 13:26:18', '2025-05-20 02:07:47', 8, 3),
(1090, 'Housemaid', 'No Description', 51, 304, 'Malaysia', 11, NULL, 'job_images/JgfVxbkd52TsBGyTG6ucvR5YOOZF9XpAbL2ILj7b.jpg', NULL, 190, 1, NULL, '2025-06-22', NULL, '2025-05-17 09:28:14', 'reject', 'contact_contributor', 'Repeating', 'J100725', 1, '2025-05-17 13:27:14', '2025-05-17 13:28:14', 8, 0),
(1091, 'Sewing Operators / Fabric Cutters', 'No Description', 36, 167, 'Pepiliyana, Athurugiriya, Moratuwa', 1, NULL, 'job_images/MtgHgInshq71JZhqkzVqaNwvccOzWs1G4day0abL.jpg', NULL, 324, 1, NULL, '2025-06-22', '2025-05-17 09:33:54', NULL, 'approved', 'contact_contributor', NULL, 'J100726', 1, '2025-05-17 13:32:19', '2025-05-20 02:08:56', 8, 3),
(1092, 'Production Supervisors / Carpenters', 'No Description', 36, 167, 'Pepiliyana, Athurugiriya, Moratuwa', 1, NULL, 'job_images/GHTnGPu7z5wi6LLsvdtJ1la33Ri7AGGjeKs8a6q9.jpg', NULL, 324, 1, NULL, '2025-06-22', '2025-05-17 09:36:40', NULL, 'approved', 'contact_contributor', NULL, 'J100727', 1, '2025-05-17 13:33:58', '2025-05-20 02:10:06', 8, 4),
(1093, 'Driver / Delivery Assistants', 'No Description', 51, 302, 'Pepiliyana, Athurugiriya, Moratuwa', 1, NULL, 'job_images/VUdsKJ3X8fkIxco6DodTshzwhAN59HOZBu5wvdUD.jpg', NULL, 324, 1, NULL, '2025-06-22', '2025-05-17 09:36:48', NULL, 'approved', 'contact_contributor', NULL, 'J100728', 1, '2025-05-17 13:35:17', '2025-05-20 02:11:09', 8, 4),
(1094, 'Senior Supervisor / Cleaning Supervisor', 'No Description', 7, 245, 'Abu Dhabi', 5, NULL, 'job_images/yY9fQaRZPMLcxMLUoYAT1i9foydHSOBNNmf06haR.jpg', NULL, 325, 1, NULL, '2025-06-22', '2025-05-18 06:46:07', NULL, 'approved', 'contact_contributor', NULL, 'J100729', 1, '2025-05-18 09:00:50', '2025-05-20 02:12:18', 8, 1),
(1095, 'Electrical Fitters / Electrical Foremen / Scaffolders', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/lwVfY0UeowZlzTMg1Yom04T6T27eJtwePeem3RZM.jpg', NULL, 326, 1, NULL, '2025-06-22', '2025-05-18 06:46:16', NULL, 'approved', 'contact_contributor', NULL, 'J100730', 1, '2025-05-18 09:19:28', '2025-05-20 02:13:38', 8, 1),
(1096, 'Engineers', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/e7HCjrRwLGgOunWSIFGPV1IO2oSPDyTvbZiLroMJ.jpg', NULL, 326, 1, NULL, '2025-06-22', '2025-05-18 06:46:24', NULL, 'approved', 'contact_contributor', NULL, 'J100731', 1, '2025-05-18 09:20:43', '2025-05-20 02:14:40', 8, 1);
INSERT INTO `job_postings` (`id`, `title`, `description`, `category_id`, `subcategory_id`, `location`, `country_id`, `salary_range`, `image`, `requirements`, `employer_id`, `admin_id`, `creator_id`, `closing_date`, `approved_date`, `rejected_date`, `status`, `payment_method`, `rejection_reason`, `job_id`, `is_active`, `created_at`, `updated_at`, `package_id`, `view_count`) VALUES
(1097, 'PTW Holders', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/SVvdIAh1RWzIKJlzWPX4FouPFHaVDotwUGlyMPWn.jpg', NULL, 326, 1, NULL, '2025-06-22', '2025-05-18 06:46:32', NULL, 'approved', 'contact_contributor', NULL, 'J100732', 1, '2025-05-18 09:21:55', '2025-05-20 02:15:39', 8, 1),
(1098, 'Instrument Fitters / Instrument foremen /Safety Officer', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/dyf1qtHuHdykBDPR8oGj7f9hYKNXcQ4uCTzsauCM.jpg', NULL, 326, 1, NULL, '2025-06-22', '2025-05-18 06:46:41', NULL, 'approved', 'contact_contributor', NULL, 'J100733', 1, '2025-05-18 09:23:56', '2025-05-20 02:16:47', 8, 1),
(1099, 'Supervisors', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/24f56AEIAxDHpJ2FqRUoIQLt7hZpizJgKHBhs8jb.jpg', NULL, 326, 1, NULL, '2025-06-22', '2025-05-18 06:46:52', NULL, 'approved', 'contact_contributor', NULL, 'J100734', 1, '2025-05-18 09:25:17', '2025-05-20 02:17:51', 8, 2),
(1100, 'UAE Job Vacancy', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/2DBVMMWlxbG16ilTfDoFow6k96K9lSj44VJvAt8o.jpg', NULL, 327, 1, NULL, '2025-06-22', '2025-05-18 06:47:01', NULL, 'approved', 'contact_contributor', NULL, 'J100735', 1, '2025-05-18 09:34:35', '2025-05-20 02:18:51', 8, 3),
(1101, 'QATAR Job Vacancy', 'No Description', 12, 96, 'Qatar', 17, NULL, 'job_images/fufeREFwag4PqGqgDHCOM5F465EQsklEAAkQqZCM.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-18 06:47:09', NULL, 'approved', 'contact_contributor', NULL, 'J100736', 1, '2025-05-18 09:39:55', '2025-05-20 02:20:00', 8, 1),
(1102, 'Property Manager', 'No Description', 12, 98, 'Belihuloya', 1, NULL, 'job_images/b81c28FPnGBzfSkBbmebaPkehhnopDIUSM4F2PAF.jpg', NULL, 328, 1, NULL, '2025-06-22', '2025-05-18 06:47:17', NULL, 'approved', 'contact_contributor', NULL, 'J100737', 1, '2025-05-18 09:45:46', '2025-05-20 02:21:11', 8, 2),
(1103, 'Resource Mobilization Manager', 'No Description', 21, 123, 'Karachi', 13, NULL, 'job_images/e2GAiNzR04DgJun5OvQO4fZ6ARAsSH5LWq24Hqvx.jpg', NULL, 329, 1, NULL, '2025-06-22', '2025-05-18 06:47:24', NULL, 'approved', 'contact_contributor', NULL, 'J100738', 1, '2025-05-18 09:53:50', '2025-05-20 02:22:06', 8, 1),
(1104, 'UAE Job Vacancy', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/K2xNX2hhBwH5vAh7Nag3Pq8KcegV178HTWMGS0hv.jpg', NULL, 330, 1, NULL, '2025-06-22', '2025-05-18 06:47:32', NULL, 'approved', 'contact_contributor', NULL, 'J100739', 1, '2025-05-18 10:04:52', '2025-05-20 02:23:01', 8, 1),
(1105, 'Network Administrator', 'No Description', 46, 195, 'Australia', 19, NULL, 'job_images/ODma1S5htqcaCUqWf6RFtHgVWyEfR7TR7qzGMMey.jpg', NULL, 331, 1, NULL, '2025-06-22', '2025-05-18 06:47:40', NULL, 'approved', 'contact_contributor', NULL, 'J100740', 1, '2025-05-18 10:16:22', '2025-05-20 02:24:09', 8, 3),
(1106, 'Accountant', 'No Description', 3, 229, 'Galewela', 1, NULL, 'job_images/Wop0xE0Ll9zrNsCa6pgRHpQina3CcRtC0l1txIds.jpg', NULL, 306, 1, NULL, '2025-06-22', '2025-05-18 06:47:48', NULL, 'approved', 'contact_contributor', NULL, 'J100741', 1, '2025-05-18 10:25:02', '2025-05-20 02:25:58', 8, 1),
(1107, 'Intern', 'No Description', 46, 195, 'Kohuwala', 1, NULL, 'job_images/J8NyEMwEA47pY7230HtR7z6OCpvKjG1Zhtt2US5d.jpg', NULL, 332, 1, NULL, '2025-06-22', '2025-05-18 09:05:37', NULL, 'approved', 'contact_contributor', NULL, 'J100742', 1, '2025-05-18 12:12:46', '2025-05-20 02:27:16', 8, 2),
(1108, 'Branch Manager', 'No Description', 43, 216, 'Island wide', 1, NULL, 'job_images/2UmeMsZQmiBMpLcBNHUwQepJRBNvU1awh4qijboM.jpg', NULL, 121, 1, NULL, '2025-06-22', '2025-05-18 09:05:45', NULL, 'approved', 'contact_contributor', NULL, 'J100743', 1, '2025-05-18 12:32:46', '2025-05-20 02:28:29', 8, 8),
(1109, 'Assistant Manager / Executive Marketing', 'No Description', 43, 216, 'Island wide', 1, NULL, 'job_images/OS6hcb3fhqakr14h0vPuGHvN9VnsCTjHUKUlrAyi.jpg', NULL, 121, 1, NULL, '2025-06-22', '2025-05-18 09:05:55', NULL, 'approved', 'contact_contributor', NULL, 'J100744', 1, '2025-05-18 12:36:05', '2025-05-20 02:29:44', 8, 1),
(1110, 'Site Engineers', 'No Description', 12, 96, 'Abu Dhabi', 5, NULL, 'job_images/rwLv6tvEHNFeb0ISljTQ1uYSLUDOQuz6Y1Ffw0zP.jpg', NULL, 333, 1, NULL, '2025-06-22', '2025-05-18 09:06:02', NULL, 'approved', 'contact_contributor', NULL, 'J100745', 1, '2025-05-18 12:46:45', '2025-05-20 02:31:13', 8, 4),
(1111, 'UAE Job Vacancy', 'No Description', 12, 96, 'UAE', 5, NULL, 'job_images/PlH7NNNuQJEHqifhX1ufLLYSYJE9AURkFQAdP5AI.jpg', NULL, 334, 1, NULL, '2025-06-22', '2025-05-18 09:06:17', NULL, 'approved', 'contact_contributor', NULL, 'J100746', 1, '2025-05-18 12:55:18', '2025-05-20 02:32:18', 8, 1),
(1112, 'cashier', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/WAUN8WWF6QMyQfFcbBAwrxXT3opHrgaZoyD62DTT.jpg', NULL, 335, 1, NULL, '2025-06-23', '2025-05-18 09:06:27', NULL, 'approved', 'contact_contributor', NULL, 'J100747', 1, '2025-05-18 13:01:03', '2025-05-20 02:33:17', 8, 8),
(1113, 'Sales Representative', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/BTKKcKNf0F5tFfxJVKNKbToxpwKHdPZuQff4QPaQ.jpg', NULL, 190, 1, NULL, '2025-06-23', '2025-05-18 09:25:50', NULL, 'approved', 'contact_contributor', NULL, 'J100748', 1, '2025-05-18 13:12:30', '2025-05-20 09:35:23', 8, 4),
(1114, 'UAE Job Vacancy', 'No Description', 45, 294, 'fiji island', 37, NULL, 'job_images/SEFBlIqQrojL160XZ8N88FYMzNtSHgNKowhah5tZ.jpg', NULL, 336, 1, NULL, '2025-06-22', '2025-05-18 09:25:57', NULL, 'approved', 'contact_contributor', NULL, 'J100749', 1, '2025-05-18 13:15:39', '2025-05-20 02:35:21', 8, 1),
(1115, 'Purchasing Officer', 'No Description', 11, 255, 'Antigua and Barbuda', 2, NULL, 'job_images/v9ajSkNzBRixxzVV9fxaELFotVeznqNX5uQ7CqRa.jpg', NULL, 337, 1, NULL, '2025-06-22', '2025-05-18 10:15:43', NULL, 'approved', 'contact_contributor', NULL, 'J100750', 1, '2025-05-18 13:35:12', '2025-05-20 02:36:36', 8, 2),
(1116, 'Guest Service Agent', 'No Description', 13, 99, 'Antigua and Barbuda', 2, NULL, 'job_images/hR0TERKTNIOBRav3SHlg6qwUnN5Fj9W6GPffSR8h.jpg', NULL, 337, 1, NULL, '2025-06-22', '2025-05-18 10:15:51', NULL, 'approved', 'contact_contributor', NULL, 'J100751', 1, '2025-05-18 13:36:35', '2025-05-20 02:37:39', 8, 3),
(1117, 'Food & Beverages Attendant', 'No Description', 31, 151, 'Antigua and Barbuda', 2, NULL, 'job_images/umD7KSdwF8C6q5pbfk4wML6kqqvbiq0WYrB5dh9B.jpg', NULL, 337, 1, NULL, '2025-06-22', '2025-05-18 10:15:58', NULL, 'approved', 'contact_contributor', NULL, 'J100752', 1, '2025-05-18 13:37:58', '2025-05-20 02:38:54', 8, 1),
(1118, 'Kitchen Steward', 'No Description', 31, 151, 'Antigua and Barbuda', 2, NULL, 'job_images/RF2UdotxEZBCqAjNtboIxhETpuE2LhRw1EqfPprq.jpg', NULL, 337, 1, NULL, '2025-06-22', '2025-05-18 10:16:06', NULL, 'approved', 'contact_contributor', NULL, 'J100753', 1, '2025-05-18 13:40:28', '2025-05-20 02:39:53', 8, 2),
(1119, 'Housekeeping Attendant / Activities Attendant', 'No Description', 31, 151, 'Antigua and Barbuda', 2, NULL, 'job_images/iSxqIcnUeU3hV0ldaKrCAJvr3pRSabv1nSfbNIZW.jpg', NULL, 337, 1, NULL, '2025-06-22', '2025-05-18 10:16:13', NULL, 'approved', 'contact_contributor', NULL, 'J100754', 1, '2025-05-18 13:42:37', '2025-05-20 02:40:46', 8, 1),
(1120, 'Digital Marketing Intern', 'No Description', 4, 234, 'Colombo', 1, NULL, 'job_images/ykILOk15Xozev2BKIF4AWDKujD5zUuNVyMe3U0V0.jpg', NULL, 307, 1, NULL, '2025-06-22', '2025-05-18 10:16:21', NULL, 'approved', 'contact_contributor', NULL, 'J100755', 1, '2025-05-18 13:45:32', '2025-05-20 02:42:15', 8, 9),
(1121, 'Bus Driver', 'No Description', 51, 302, 'Qatar', 17, NULL, 'job_images/eFTMzZGiHRS2n03hlz159F7rvlSDM2YS70Z7avtc.jpg', NULL, 338, 1, NULL, '2025-06-22', '2025-05-18 10:16:38', NULL, 'approved', 'contact_contributor', NULL, 'J100756', 1, '2025-05-18 13:50:21', '2025-05-20 02:43:18', 8, 1),
(1122, 'Senior Field Manager', 'No Description', 21, 122, 'Colombo', 1, NULL, 'job_images/5u0OIrhY8bVOFJUykWkpB1EujGhFByVwXICjwdZS.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-18 10:16:49', NULL, 'approved', 'contact_contributor', NULL, 'J100757', 1, '2025-05-18 13:53:30', '2025-05-20 02:44:25', 8, 1),
(1123, 'Audit Associates', 'No Description', 3, 230, 'Maharagama', 1, NULL, 'job_images/9aLNGk69chKPeJXKntAdaoOiUDuodKGrrGIrv8gT.jpg', NULL, 190, 1, NULL, '2025-06-22', '2025-05-18 10:17:02', NULL, 'approved', 'contact_contributor', NULL, 'J100758', 1, '2025-05-18 13:55:25', '2025-05-20 02:45:30', 8, 2),
(1124, 'Operation Supervisor', 'No Description', 36, 168, 'Colombo', 1, NULL, 'job_images/Urghnm33NSri1NCXPFZZzFKYVKBP2pmx22PXjCPZ.jpg', NULL, 339, 1, NULL, '2025-06-23', '2025-05-18 10:17:10', NULL, 'approved', 'contact_contributor', NULL, 'J100759', 1, '2025-05-18 13:58:23', '2025-05-20 02:46:47', 8, 2),
(1125, 'Assistant Reservations Manager', 'No Description', 4, 235, 'Dubai', 6, NULL, 'job_images/PytTux7I8BlSTOsqlW9XmDqsLo9wHv8Tm2hzqHAf.jpg', NULL, 340, 1, NULL, '2025-06-22', '2025-05-18 10:17:21', NULL, 'approved', 'contact_contributor', NULL, 'J100760', 1, '2025-05-18 14:14:28', '2025-05-20 02:48:04', 8, 2),
(1126, 'Engineers', 'No Description', 50, 287, 'Dubai', 6, NULL, 'job_images/k65i7kwvvV3lgHZnuq6eQoVFkIjrPPfQgwWxTMpa.jpg', NULL, 340, 1, NULL, '2025-06-22', '2025-05-18 11:31:18', NULL, 'approved', 'contact_contributor', NULL, 'J100761', 1, '2025-05-18 14:23:36', '2025-05-20 02:49:09', 8, 1),
(1127, 'Front Office', 'No Description', 46, 195, 'Dubai', 6, NULL, 'job_images/oZKuzk90bYoNZ2xdNKTnIAfGth4DZwtasPPtdEtP.jpg', NULL, 340, 1, NULL, '2025-06-22', '2025-05-18 11:31:31', NULL, 'approved', 'contact_contributor', NULL, 'J100762', 1, '2025-05-18 14:24:38', '2025-05-20 02:50:10', 8, 2),
(1128, 'F&B Vacancy', 'No Description', 31, 153, 'Dubai', 6, NULL, 'job_images/RnYzDRpWZ8OA0ZZgCIw7uwBq3h1kLVjNDoPMVCzp.jpg', NULL, 340, 1, NULL, '2025-06-22', '2025-05-18 11:31:41', NULL, 'approved', 'contact_contributor', NULL, 'J100763', 1, '2025-05-18 14:26:13', '2025-05-20 02:51:18', 8, 1),
(1129, 'Job Vacancy', 'No Description', 36, 167, 'Dekatana', 1, NULL, 'job_images/cOEma8srKCCLYiHuYWeaoEgoWdiKRyOchl1OLccL.jpg', NULL, 190, 1, NULL, '2025-06-23', '2025-05-18 11:31:52', NULL, 'approved', 'contact_contributor', NULL, 'J100764', 1, '2025-05-18 14:31:58', '2025-05-20 08:33:50', 8, 2),
(1130, 'Accounting Head', 'No Description', 3, 229, 'Philippines', 55, NULL, 'job_images/uNM7OIQrsnlrNSo68CgkcSQr3pkKIwqth1EJ7vci.jpg', NULL, 341, 1, NULL, '2025-06-22', '2025-05-18 11:32:02', NULL, 'approved', 'contact_contributor', NULL, 'J100765', 1, '2025-05-18 14:32:22', '2025-05-20 02:53:19', 8, 1),
(1131, 'Administration coordinator', 'No Description', 46, 195, 'Moratuwa', 1, NULL, 'job_images/zlXesXarSB4ZaA3BYwx21cOCFuJXMts3mUHqTNd1.jpg', NULL, 342, 1, NULL, '2025-06-22', '2025-05-18 11:32:14', NULL, 'approved', 'contact_contributor', NULL, 'J100766', 1, '2025-05-18 14:40:43', '2025-05-20 02:54:21', 8, 2),
(1132, 'Business Lecturer', 'No Description', 6, 240, 'Welisara', 1, NULL, 'job_images/vXYXbwpGDhaXjPgrmSy9I76mpvqNECpA1Rn7qAwF.jpg', NULL, 343, 1, NULL, '2025-06-22', '2025-05-18 11:32:22', NULL, 'approved', 'contact_contributor', NULL, 'J100767', 1, '2025-05-18 14:45:02', '2025-05-20 02:55:17', 8, 1),
(1133, 'kids Club Attendant', 'No Description', 13, 99, 'Maldives', 11, NULL, 'job_images/GluK8mj5Az1rAc9ONLh0ZjHR7oYBuvNJZeMRa0A2.jpg', NULL, 344, 1, NULL, '2025-06-20', '2025-05-18 11:32:44', NULL, 'approved', 'contact_contributor', NULL, 'J100768', 1, '2025-05-18 14:58:31', '2025-05-20 02:56:13', 8, 1),
(1134, 'Account Assistant', 'No Description', 3, 229, 'Malabe', 1, NULL, 'job_images/FQeYY4bLRcswLMvF3KJI0B30PP4quYpl5lQkuFh4.jpg', NULL, 190, 1, NULL, '2025-06-20', '2025-05-18 11:32:53', NULL, 'approved', 'contact_contributor', NULL, 'J100769', 1, '2025-05-18 15:20:59', '2025-05-20 10:34:18', 8, 12),
(1135, 'Business Development Manager', 'No Description', 4, 235, 'Colombo', 1, NULL, 'job_images/XxfByI3wzzJ553P4zAL3s7Y3NPPQzKsqAAkDGHGo.jpg', NULL, 269, 1, NULL, '2025-06-20', '2025-05-19 02:28:42', NULL, 'approved', 'contact_contributor', NULL, 'J100770', 1, '2025-05-18 15:48:04', '2025-05-20 02:58:18', 8, 1),
(1136, 'Regional Manager', 'No Description', 21, 122, 'Eastern province', 1, NULL, 'job_images/iNrCx7QhN9zKkZ2Iw4SlAahyuQISp97kC3k5DmUL.jpg', NULL, 121, 1, NULL, '2025-06-20', '2025-05-19 02:28:53', NULL, 'approved', 'contact_contributor', NULL, 'J100771', 1, '2025-05-18 16:32:33', '2025-05-20 02:59:15', 8, 1),
(1137, 'Branch Coodinator', 'No Description', 46, 195, 'Nugegoda', 1, NULL, 'job_images/EHZQ8otwIjsnvyQcPy0Icqtgn6Xem5NoSDQhgHoN.jpg', NULL, 345, 1, NULL, '2025-06-20', '2025-05-19 02:29:03', NULL, 'approved', 'contact_contributor', NULL, 'J100772', 1, '2025-05-18 16:42:48', '2025-05-20 03:00:10', 8, 1),
(1138, 'US Tax Accountant', 'No Description', 3, 229, 'c', 1, NULL, 'job_images/8BFMVpzI48zP0WYqBOGU9BOg5DsG66OeW0zgS5td.jpg', NULL, 346, 1, NULL, '2025-06-20', '2025-05-19 02:29:16', NULL, 'approved', 'contact_contributor', NULL, 'J100773', 1, '2025-05-18 17:11:52', '2025-05-20 03:01:12', 8, 1),
(1139, 'HVAC Control  Technician/ Senior HVAC Technician/HVAC Supervisor', 'No Description', 50, 287, 'saudi', 63, NULL, 'job_images/kwEY2Le6sSRRKaHbZV9EBGVMH24znVxCnO8s0JZN.jpg', NULL, 226, 1, NULL, '2025-06-20', '2025-05-19 02:29:27', NULL, 'approved', 'contact_contributor', NULL, 'J100774', 1, '2025-05-18 17:27:21', '2025-05-20 03:02:22', 8, 1),
(1140, 'Business Administration Assistant', 'No Description', 46, 195, 'Kelaniya', 1, NULL, 'job_images/Hn5jYhsXhjhnojcxfKNIHWJIdinbSYDdkh5EEveS.jpg', NULL, 347, 1, NULL, '2025-06-20', '2025-05-19 02:29:42', NULL, 'approved', 'contact_contributor', NULL, 'J100775', 1, '2025-05-18 19:08:39', '2025-05-20 03:03:37', 8, 1),
(1141, 'Trainee /Junior Executive/ Executive', 'No Description', 4, 235, 'Island wide', 1, NULL, 'job_images/iDRxruvbJRRkszHwKlGp7bn3MZhxmvLVIWSidLbR.jpg', NULL, 194, 1, NULL, '2025-06-20', '2025-05-19 02:29:55', NULL, 'approved', 'contact_contributor', NULL, 'J100776', 1, '2025-05-18 19:22:02', '2025-05-20 03:04:46', 8, 3),
(1142, 'Site Manager/Project Manager', 'No Description', 21, 122, 'Middle East', 63, NULL, 'job_images/u7x9Nl56UkvWk3WTdQVQjmml5hoPClckipjoTRxj.jpg', NULL, 348, 1, NULL, '2025-06-20', '2025-05-19 02:30:05', NULL, 'approved', 'contact_contributor', NULL, 'J100777', 1, '2025-05-18 19:48:26', '2025-05-20 03:05:52', 8, 1),
(1143, 'Executive Chef/Catering Supervisor/Banquet Supervisor/Dining Hall Supervisor', 'No Description', 13, 99, 'Middle East', 63, NULL, 'job_images/OC70OFWemJxs0aL2rWkhdOs8saVhOLMpdbazCBwM.jpg', NULL, 348, 1, NULL, '2025-06-20', '2025-05-19 02:30:17', NULL, 'approved', 'contact_contributor', NULL, 'J100778', 1, '2025-05-18 20:01:42', '2025-05-20 03:06:57', 8, 1),
(1144, 'cashier & Marketing Executive', 'No Description', 3, 229, 'Colombo', 1, NULL, 'job_images/MVLfuW0M5UR0uiDgmQwBlc4SAa54itJEJpFRV6EX.jpg', NULL, 190, NULL, NULL, '2025-05-26', NULL, NULL, 'pending', 'contact_contributor', NULL, 'J100779', 1, '2025-05-19 12:52:37', '2025-05-19 12:52:37', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(36, '2025_01_21_150952_create_about_us_table', 3),
(37, '2025_01_21_150954_create_admins_table', 3),
(38, '2014_10_12_000000_create_users_table', 4),
(39, '2014_10_12_100000_create_password_resets_table', 4),
(40, '2019_08_19_000000_create_failed_jobs_table', 4),
(41, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(42, '2024_12_17_065015_create_categories_table', 4),
(43, '2024_12_17_065016_create_subcategories_table', 4),
(44, '2024_12_17_070902_create_admins_table', 4),
(45, '2024_12_17_071834_create_employers_table', 4),
(46, '2024_12_17_075826_create_job_experiences_table', 4),
(47, '2024_12_17_075827_create_job_educations_table', 4),
(48, '2024_12_19_051605_create_job_postings_table', 4),
(49, '2024_12_27_071239_create_applications_table', 4),
(50, '2024_12_30_073050_create_flagged_jobs_table', 4),
(51, '2024_12_31_063741_create_feedback_table', 4),
(52, '2025_01_01_094636_create_contactus_table', 4),
(53, '2025_01_03_035647_create_faqs_table', 4),
(54, '2025_01_03_044015_create_about_us_table', 4),
(55, '2025_01_03_053832_create_terms_and_conditions_table', 4),
(56, '2025_01_07_070411_create__package_contact_table', 4),
(57, '2025_01_07_104943_create_packages_table', 4),
(58, '2025_01_08_064525_create_contact_list_table', 4),
(59, '2025_01_09_074352_add_package_foreign_key_to_job_postings', 4),
(60, '2025_01_13_040839_add_payment_method_to_job_postings', 4),
(61, '2025_01_15_092429_create_bank_accounts_table', 4),
(62, '2025_01_15_094741_add_branch_name_to_bank_accounts_table', 4),
(63, '2025_01_20_071735_add_view_count_to_job_postings_table', 4),
(64, '2025_01_20_115934_add_employer_id_to_feedback_table', 4),
(65, '2025_01_21_045533_update_feedback_table_user_id_nullable', 4),
(66, '2025_01_21_072537_create_banner_packages_table', 4),
(67, '2025_01_21_075606_create_banners_table', 4),
(68, '2025_01_21_114232_add_status_to_banners_table', 4),
(69, '2025_01_21_171209_add_rejection_reason_and_admin_id_to_banners_table', 4),
(70, '2025_01_22_131831_create_countries_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_size` int(11) NOT NULL,
  `duration_id` bigint(20) UNSIGNED NOT NULL,
  `lkr_price` decimal(10,2) NOT NULL,
  `usd_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_size`, `duration_id`, `lkr_price`, `usd_price`, `created_at`, `updated_at`) VALUES
(7, 1, 1, 2500.00, 20.00, '2025-02-04 22:36:48', '2025-05-07 16:18:43'),
(8, 1, 2, 3000.00, 30.00, '2025-02-06 20:46:26', '2025-04-16 19:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `package_contacts`
--

CREATE TABLE `package_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `effective_date` date NOT NULL,
  `description_one` text NOT NULL,
  `description_two` text NOT NULL,
  `description_three` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `package_contacts`
--

INSERT INTO `package_contacts` (`id`, `email`, `effective_date`, `description_one`, `description_two`, `description_three`, `created_at`, `updated_at`) VALUES
(1, 'jobs@jobads.lk', '2025-03-01', '<p>JobAds.lk isn’t just another job portal — it’s a revolutionary approach to hiring and job hunting. Leveraging smart technology, JobAds.lk streamlines the entire recruitment journey, making it faster, smarter, and more effective for both employers and job seekers. Whether you\'re a business eager to find the right talent or a professional on the hunt for your next opportunity, JobAds.lk brings everything you need into one powerful platform. Step into the future of recruitment — join the JobAds.lk community today.</p>', '<p><span style=\"color: rgb(0, 102, 204);\">Most trusted and innovative web site for both Employers and Job Seekers.</span></p>', '<p><strong>How to Submit Job Vacancies</strong></p><p>To advertise your job vacancies, please send the details via:</p><ol><li> WhatsApp : 0777 580 451 </li><li> Email        : info@jobads.lk</li></ol><p>Kindly include your company name and billing address for invoicing purposes.</p><p><strong>Important: </strong>Vacancies will be published only upon receiving proof of payment. Until then, your submission will remain on hold.</p>', '2025-02-01 00:11:29', '2025-05-07 16:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('Jeewan@jsgceylon.lk', '$2y$12$qfo1KX24H72g0SusAbPvKuu/fBAG00XBikjzn6uPBU4t5TLee3BoC', '2025-03-25 11:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Scope of Coverage', 'This Statement of Privacy covers how topjobs.lk treats personal information collected and received, including information relating to the past use of our products and services. \"Personal Information\" refers to information that personally identifies you by your name, email address, phone number, and other information that is not otherwise publicly available.\nThis Statement of Privacy applies only to the practices of topjobs.lk and the people we employ or manage. Other websites or services linked to/from this website will have their own privacy statements, which can be viewed by clicking on their respective privacy links.', '2025-05-15 09:35:45', '2025-05-15 09:35:45'),
(2, 'Use of Your Personal Information', 'This site does not sell, rent, or share your personal information with other people or non-affiliated third parties except to provide you with the products or services you have requested, or when you give us permission, or under the following circumstances:\n• When you apply to jobs through our services, your resume data in your account and any other information disclosed during your job applications will be made available to the companies you are applying to.\n• You may opt to make your resume searchable by any companies using this site to recruit. These companies may retain a copy of your resume in their own files or databases.\n• Personal information collected on this site may be stored and processed in any country where this site or its business partners, subsidiaries, or agents maintain facilities. By using this site, you consent to such transfer of information outside your country.\nWhile we endeavor to ensure that companies comply with relevant privacy laws, topjobs.lk is not responsible for the retention, use, or privacy practices of resumes by these companies or any third parties associated with them.', '2025-05-15 09:37:55', '2025-05-15 09:42:54'),
(3, 'Control of Your Personal Information', 'This site offers you various choices for the use and sharing of your personal information. You may go to your account page to edit your personal information and preferences at any time. You will be asked to make your requests while logged into your account, so that we can associate your preferences with your specific profile. This security safeguard prevents unauthorized changes to the usage and control of your personal information.\nThere are certain site services that send periodic emails to inform you of technical service issues, new vacancies, and updates about our products and services. You will be unable to unsubscribe from these emails as they are considered an integral part of the service you have chosen.', '2025-05-15 09:43:13', '2025-05-15 09:43:13'),
(4, 'Data Breach Notification Policy', 'We are committed to safeguarding your personal information. In the unlikely event of a data breach that may compromise your personal information, we will take prompt action to assess the impact and notify affected users without undue delay.\nThis notification will include details of the incident, the data affected, potential risks, and the steps we are taking to mitigate the impact.We will also provide guidance on the actions you may take to protect your information.Our incident response process ensures compliance with applicable data protection regulations.\nWe prioritize transparency and user safety, and we will keep you informed throughout the resolution process.', '2025-05-15 09:43:30', '2025-05-15 09:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `press_releases`
--

CREATE TABLE `press_releases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `press_releases`
--

INSERT INTO `press_releases` (`id`, `title`, `description`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, 'hello', 'hello youtube', 'press-releases/3OqDM4Og21tP0bOudR2q743go54SpG0D1qM1M0Lo.png', NULL, '2025-01-31 15:57:50', '2025-01-31 15:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('06XxoCuUpTU2QxZzyOAGtjbokE8ZpM9Jqtqqrv7E', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzNVNGw0c0UxUHN1Vk9GTXBaT1F2NmVVR3VmZ0pjN3lVeGhJNEJ4QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719238),
('0A1sFrI26dIrh3B2lFzNqn9eEDBOI4az5NL4VLf2', NULL, '173.252.107.115', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFQwNWY2Z21jNlFpdWRSRzJMWHI0Wm10NWJQU0RPU2JMMWVuSFZyeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718653),
('0HPBH7lZmtS9SX5EWaixsjiDFENceFfuZXbYMFHJ', NULL, '51.222.253.13', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3VDWUN6dXRXWkM1QUFBRFRjQjI2cGlFVkM5cWVIN254cmVIOERDaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzc1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747717405),
('0KIdztMMj7CljD1dDztbCKxhBZwLFZqwWAjTwyXS', NULL, '157.55.39.49', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME1RZjNwTXhaS3JFUEVMV1BhZmdEOE9LTWhvSEZTQVJyR2RwMmdvOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY2MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747716531),
('0NogtqcFiNZPeFPlBvQXh8vYfm1UjgqKPI4aUyB5', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEVtQ1hETmN3TnZUbkhma2lVR0pCSTg5NlBDM0F3QmZ3ckJmWkFraSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTg1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747717440),
('0p2Ba07nwE4oiJGauuVjeovQbMCmHohPPWIXXgfC', NULL, '119.73.96.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidWFOclUxS2d0Rm9tdVdMbWN3WThQbXBmcFEwN1VhVXgxRjBIOExiZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTU6ImxvZ2luX2VtcGxveWVyXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MzUwO30=', 1747720660),
('0pM4GhgxVMF2ewzh6wzWEmZmnf3R3yhzyusxSSoI', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXlLcEJnMk55T2x4NFJzZFd6MWZWaWw5NHUyYWlGWTZ6amRBbDF6aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723165),
('1cOJykMuw4yLIXaUivy41bE5KPDe8v3sheehH9FZ', NULL, '57.141.2.1', 'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG1Eb1RQWEx2MldQMVZTTmV2OWFTTDVhdVFxN29BUjVQZXU4ZkRJaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjA5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716906),
('1VAgRZeMKVAdpBPc43QqTNh6fbfkMV8PodYUMj8W', NULL, '51.222.253.3', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHY5QzJoZHp6Nldxd1dwbnFBdzZzRURTdFluODJ1S3B5REhqWW8wWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzc3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747717838),
('1XrKTFFUzfTz2681nBZcapmy1ciguNKMZC5jZb9n', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzdqbUh1TnhsM3o3VmhqS0JGZjBadTJvZDRxc1lzckdnd0dwamtQMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjA1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722747),
('205UiPuuzqhcPJ0kWBUDVVocOJRs5mfDCfO4eJTg', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnFkMnVMN2JJVXdXd3RURDhsUW13Uk00dFN1YVNyVTgweHU3UzlseSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzg2NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720325),
('2ft7Zx0jrY40aBgNiHbdEn09FbC66wgTDsrb7byr', NULL, '69.63.184.113', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGJ1MndlWVNzWXl1Y2JBTUdZUWRSV2VOcjRyZVZVSXIyejh6NW1vSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747724691),
('2JyqF2yZ5L0DWtaZY7lzJXwhj4Al3DIoiixvcI0J', NULL, '51.222.253.2', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1RzQ2tzcHl3RjZhZHlUNTZtaW1vSUNEd21IWFVjcGVjdEFrVWF2OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY3NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747725055),
('2OGAxdtn0TJngzq7Q69wM0M2tdwkHS8g1lodXS4B', NULL, '162.120.184.252', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicmFMTk42VHh0M2psNkZhUldQWDN2WkN6UFY2V1lZSzRuQTd2OE5vNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721619),
('2Xu1bVBP7EESSFqvWix4damY10wDWRul7m5aDQ9O', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUt4N0JsWWtBYzdZSW9idm9rS2NCM3lIUVhxckxmMlFFRzV2OVB3VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vd3d3LmpvYmFkcy5say90b3BlbXBsb3llZXMvMTYvam9icyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722917),
('3N3nDXrbm1XNzU7eIb6ObLFvj1iRwxOiukyE6xZN', NULL, '51.222.253.2', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU9hdHNHb0hMekV3TTN3NWhSb21HQ2o4Q2gzRFZLNDlhcW5yRENVZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY3MiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722376),
('47RUU3GwhBTdbFhfLKxwnB9vayD7SZxgjgzKVvbl', NULL, '51.222.253.15', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW54SGoxR0doM3VIZW1qMWJiOGxvVVRhVUs5aFhiZHJnMXlXdDVBNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say8/cGFnZT0xMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721826),
('4abXJCkhoV6ykCJ7S6H3cm6EBGkbOEOadn5rIWan', NULL, '114.119.131.33', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUR0ZW1yb1lneDRObUg4bHk1ZVNWeVBwWHpKZ2Zld1ZSSTdDMm1UQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMTAyMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747717070),
('4V3OXkWt5kVNBbHhjGeoYK9B0RcGojNL5Z8kZ2zP', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam8zMlhrSDdidW94Q0NCQzlGTThFUFhINXFwQm50Q1JkTHNKUGlBdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzgyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719657),
('5asd8T1srQONTsieZfsaBmiGlGer85qwLueZtUfJ', NULL, '114.119.131.33', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXdRUWtTWDA5RXk1TTRndnF1RGFtQ2s4ZHRJZERUQ05CQ1JrOXV5NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODY2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720992),
('5AWGpBnOqiaeBavPM1L9qYBgOwGCD4f8Dubqh3XA', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWhQTzZVSmRITWRBTkdJMEZwakx2eUNTVmljbzNneHRCdDNJcHZLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzQxNyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722167),
('5g7hLKaaueLezCkhtgj9WvnowEXtd1GulodwUTBn', NULL, '207.46.13.151', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUFveGhNQ1hWWkxaR2lxa1VrUklYM3FQRHRubEdmZmt3Y2txbmM4dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODM3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747717422),
('5MoNokzNnSqqJTrciyZPCOB1rOHXzJUoJSk3YR1U', NULL, '173.252.87.115', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWN4VEtzV0NUVXo4OWhtRmJXUkVMemtET09VZkRyVlAyZkNMOHNHViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720964),
('5OePKgMRzZjn9AewgskacAgbAJM6kLat2UWBzlOw', NULL, '175.157.39.81', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU9LTnNQeERvNk85dGlDS3dtSDNlVmF3a2d6T1lNZ0V1OWY4SGtyUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747723932),
('65UAkP1WoSYV0IxCvIUeilNk9OWCBVov4KK6glBC', NULL, '51.222.253.15', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzZLb2c1UlVRR3pnNnZqaUVuVHg0QjNaOHR4NzRoUVQ4UURqNjJqcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzc4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718294),
('6A1D7RvTevkSMLQEh96wMPKa7JWLaPksOyShvCdt', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0h5c3Q1eGlQMnhicVk0WFFKUUVtREtFSGc0OEVoTHE5WXNhVVpWSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzYxNCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747718904),
('6q6AkkRwXoZI1QSc8VGjQ6H6u7AJ6f62FpBGzHIU', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDk1cFdzTzRBcjJKVVRCWVQ3Y2ZUWnhYb3ZEektrckYxMmpZUklBYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjMxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721564),
('76aiNQtEZPhykDr8asjbZ0ega0D5Xztur8ccyODo', NULL, '212.104.231.187', 'Mozilla/5.0 (Linux; Android 14; 2404ARN45A Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36[FBAN/EMA;FBLC/en_GB;FBAV/459.0.0.16.105;FBCX/modulariab;]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3FINXlWYTVZRW10d0NDWFlBdVd6SVJBbGtGUDFWTVBva1FqSkFrUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vam9iYWRzLmxrLz9jYXRlZ29yeV9pZD0mY291bnRyeT0xJmxvY2F0aW9uPVBlbG1hZHVsbGEmc2VhcmNoPSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747727067),
('7fhMPGafXtWdJPROEmcOl8rhpL5LvnrPqmBCE7j3', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGVWc2RvWlRaU01NV20xN1oyeDNFWTNSdGhDaG5DUXJHU01icGVkTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjA2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722668),
('7RmCNduyXfDWSIvPwcm0CB1VNxnNsladKWKhndk9', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU4xUWlDa2ZJTHNxdkp0ZXJKVG9yYTdYYkk4aEdxVDhCUEJPRUhTOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTM3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722832),
('8RRe4Anifgur44AZM2aIOJPJF67Jyisig6XcZxcm', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGM4SEI0SmRrNFZQQzJ4VlIyQld2SE9VczNZTFl5cTE0WU1qRnJlUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjI5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720229),
('90v6N0b5PIKi2ABrCxAxWZ5ytKO9K5IUvlJ0jFyC', NULL, '175.157.226.240', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22E252 [FBAN/FBIOS;FBAV/512.0.0.52.99;FBBV/731098301;FBDV/iPhone14,5;FBMD/iPhone;FBSN/iOS;FBSV/18.4.1;FBSS/3;FBID/phone;FBLC/en_GB;FBOP/5;FBRV/735898231;IABMV/1]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic21BQU1ndXU4QVllR2hhSllFdmhqODJYaUZ4YTJYNWdzOWdmOWF3biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk0OiJodHRwczovL2pvYmFkcy5say8/ZmJjbGlkPUl3WlhoMGJnTmhaVzBCTUFCaFpHbGtBYXNnZTZOSk5CRUJIajFUd3E5TnFmalBSUTdlNV9fMUJxTmRLd0pGREg0dVo5Sk9PRUN0OFBWMGUtb2ExREd0R2RVd05seGJfYWVtX2JMSExNT0RZd1ZMZ2ZkYThBQ3NnYkEmdXRtX2NhbXBhaWduPTEyMDIyNDMzMTc2ODU4MDAxNyZ1dG1fY29udGVudD0xMjAyMjUzMjUzMTUyNTAwMTcmdXRtX2lkPTEyMDIyNDMzMTc2ODU4MDAxNyZ1dG1fbWVkaXVtPXBhaWQmdXRtX3NvdXJjZT1mYiZ1dG1fdGVybT0xMjAyMjQzMzE3Njg2MDAwMTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747718141),
('9G9ZmJMCwcOJkCdwieq1104v0u2Xb9RnjJ0ZNysu', NULL, '40.77.167.77', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWNSajBxdGRucmszT2xrYzBvRkV2WE1sN1A5RjlTYk5STnNZcGRUTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718312),
('9J4ydH3FzQBuz9Lf2HVLt3Ov6pCd1oBrdVSbwg9F', NULL, '51.222.253.14', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXVwRzl6UVJYd1ZFV2lHQ0V4bEVEa2Zod3ZiSXNxTFlDZnRjZU9MRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjM2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723242),
('9MuMhD7Xe0WN8Kdo268V9BtFrLZy8CdVgVyQid6r', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVRlcGV5TkwzTlVwVXl0U2dubGZzOWhKU2ZvcVZKWDlFRG15bUs4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNDc0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716933),
('A0rd8h8bC51SeRApR4PmAHdKOdlM4fu4qyiEED76', NULL, '111.223.176.135', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.91 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWUw3eTNqVjhxeGRQOHZ0Tk1CVUd6Z0pwUkJNWGhTdUNIOG05SXI2UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vd3d3LmpvYmFkcy5say8/Y2F0ZWdvcnlfaWQ9NDUmY291bnRyeT0mbG9jYXRpb249JnNlYXJjaD1FdmVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjA6InNlbGVjdGVkX2NhdGVnb3J5X2lkIjtzOjI6IjQ1Ijt9', 1747727146),
('AkD8MxUW2ZKJ9L0wXYEhDsX9Htet7MZJYvaY8qVR', NULL, '31.13.103.4', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianNZSTRCeExEYVlvRkk0UzRiQ1BhclYybFVwcUxZbFIzTWdJOHNjZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719660),
('amTQdnzAfo8ZWYFitZdp6B2TVBXMTWd9gAYb0lGE', NULL, '69.63.184.17', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWVQOXAyQWMxWFdHOFZpWWdtQnFEZDZUQUVFVUJyU2k1cHE0WDN3SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747724703),
('aPduhXEIu9BnTVoaCsKxZmyK4e9VRWPdpjovtbwQ', NULL, '101.2.189.27', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSms2YlJGYUZtbFdubHpBU2Y4Nkt1c01OUDFEUGRMUTg0MktNMGNUcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzYzOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjA6InNlbGVjdGVkX2NhdGVnb3J5X2lkIjtzOjI6IjQ1Ijt9', 1747720301),
('ASeYk7gGLDj1rjCRaEMypEX9eBVV253K2gqvpVr3', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2pHOFNlMXducUZ4YUZ3OWVjZ3A1c2hFWkV4V3dsbEhIS24xdjZrQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747719744),
('AUqdRJ6zPzbluOkYVsTOoh4Y0W8JUpCo5bJfCnuS', NULL, '175.157.109.254', 'Mozilla/5.0 (Linux; Android 11; SM-A035F Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.112 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/513.1.0.66.92;IABMV/1;]', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibFhvZmN5Q1NVU2NqVGVLVVhtOU5WMGZUMzNEVDQxSnl4eWRObktTNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vam9iYWRzLmxrLz9jYXRlZ29yeV9pZD0zJmNvdW50cnk9JmxvY2F0aW9uPSZzZWFyY2g9Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMDoic2VsZWN0ZWRfY2F0ZWdvcnlfaWQiO3M6MToiMyI7fQ==', 1747725711),
('aWQiVL04WX4w4oj2h5jqoVJPm1yw0EGUMOTIdEmO', NULL, '162.120.184.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVVJGUGZPV3NidHBSb3VhaU9YQU1iSlZTeU9Yazk2d2pqSTF0b1pOSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722840),
('B9VjPoXmL3WBrKkcYhWLHikoq62cdqwWBBudJ1BP', NULL, '114.119.158.126', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmRaMkxKNWM1Z2JQbW01RlBydmJEWHI3S1lXbmgyMVhoNkI3M0pqNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzEwNTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747720413),
('BCKKS6nCResYP9aOFRunBsCiUcWgJ9f3ggaXbwAz', NULL, '51.222.253.7', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkJQVDRhTjlRczBPMzNLQUxYc011cHIxZEZQWks1eTlCT0xndVFHNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjQwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747724175),
('bePTjF7XNasxN5gt5XDCVazU4VRJt1IGVlS4PP2p', NULL, '114.119.158.126', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2pIR01Va0VkVTNIMm0yb0J6c1BVNjhuVDlVV05jSVRkV3hpTkJGRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMjMyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723586),
('BNdJIotFUyPrQtq112v6uSlxZ63hLxfW3KkLwgVG', NULL, '51.222.253.6', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnFCUTdtdTRLRE5mOWlFbWVKTWRaODF3dGpEQ2plU1YxWUNvbHAzeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjI4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719944),
('BPPKfpraG85PQWwwRVwzY8e7efXUgEhZVZVuJ9vP', NULL, '114.119.131.33', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFU3a2NPUzYzc2h5WWNCQnpHa2FHSU1JdkFvMlVwbzRVYzRuWUhxUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODk4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720659),
('BpzSLXY9VUxsh98othYgflc1n5bOYSGZEtlybAYd', NULL, '51.222.253.7', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkZkR3UxOFNlZ2JkUU15TnEzek9GRm5Ydm15Wkc5Y2xmSFRYa2NKMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747726695),
('c36aZmtomwpOj2N1Zt8TyIKlEtAzDmiQh0T7JRMc', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVoxV25JQklTbzNRZ3JLNjRLZEVEamtuNTJ3MUQ1bXlOcFBza3c4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vam9iYWRzLmxrL3RvcGVtcGxveWVlcy82MS9qb2JzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720492),
('C9Yt5fXRiMLINBrAjjqfdsSMWwuENpU1MDLKVNMW', NULL, '103.247.48.14', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVp1VmlUVnNuOHBydVl2bGxXZ2dlZ3U2NDRkdkt3RkxjS0lKbTdQQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHBzOi8vd3d3LmpvYmFkcy5say8/Y2F0ZWdvcnlfaWQ9JmNvdW50cnk9MSZsb2NhdGlvbj1Db2xvbWJvJnNlYXJjaD1BdWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722406),
('cb7wwPZzPM4VidUQ9Y5Kd7XFG7CHA9ZvlsdS31XB', NULL, '69.63.184.9', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2VyaEY4aHkzQ201WFZJSm5RelpqQXJUNnVpMXRJYXJMUkFJRWN5NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747724699),
('cBHEfZD069p9cmg4UzzkJAgbqqjmA8MpnXSyC1en', NULL, '193.186.4.168', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1BERmdmS1lna0FYTGNyTGpHamxsWWtoMVdXM1NLZ1BDYUd0NWdYbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718054),
('cgPn0z5SQIgjQY6iSuMPUjvIPr9EcFRzSBiFD3M6', NULL, '51.222.253.8', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWRLMDZwNW9DbGJubjdlWGZ0Y21EMVFjc3A2WUgxcXVVQmZST1FNUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vam9iYWRzLmxrL2VtcGxveWVyL3JlZ2lzdGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747726086),
('CYCNFE2g38u6lAdJKsACkUzYvNhoWjALPmde9xbv', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnFOWUFHTTZqUHlLTFp0b2NkaHVnVmoyZDJrSUxSMTFuYTAzd2FreiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzEwMjQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747721494),
('DaF3959BVasG6QmnyCIvA5gX7KT3VfVKeHyNol5f', NULL, '122.255.11.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ0VqZDE1Vmp6QTBPeHpOMFF6QVZZUHdaZTlzRHdYbFYwTlRwTTZHWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzEwNzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjIwOiJzZWxlY3RlZF9jYXRlZ29yeV9pZCI7czoxOiIxIjt9', 1747723409),
('dgZ9qdE7Vw3hOoAYdw49mEa0JwByxzZWTxBquQgS', NULL, '51.222.253.7', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHI3MTdpZ1JIV3VrRGtZN1ZzTFVxZ2pWVlF2RHQwaDFucW9IYWl5NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjMwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721306),
('Dj6CwxPjD9NxYttHM41tJiTpGkxHs1B68TvrQMxs', NULL, '31.13.115.8', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWxZbnZMSXowS2xNbEpKNDh1V0JNUTFlNXJlTmw5bHRMemtFZGxhQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722372),
('dL4cv5gF5AydWcChLNDw4J5km0DtcOEn3npPuZ42', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWlYM25tZ1Z2SjZXaXlJSkkzZGhiSGNtWEVCV2hEcDc2UE5HMkVsRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzc1OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719077),
('E6GAAQM5IKH4Epu0JTQwnyMJtcIeMdFloORycNPw', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjRUYTNmSjc4YjRrTVpySVEyMEo0clF0UzFaR1VvaU5HS0tOaGlzSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjIwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716750),
('e6LRwLkRB8sXQEillVYqzrpL3stqOxSofzdIrFhz', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXF2NHBUNWlEVHNhYmFSUlZCTFVXZG5XS1I2ZWRmb2V2cXBaUTl5RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzkzNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719909),
('ea4GBdNY86eEAQ3Br8LFaQ4ELyeTOPaoagBjt7wS', NULL, '69.171.231.113', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjVXWDFQRXdLcVJiTVREU0JYaVQyTzlQTUVRY1B4ME5WMnBNRnNEYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718885),
('EAfxwDfAgNzjBfgWXNEv09KYoCxB5g5PwlxrLQzj', NULL, '114.119.131.33', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieE8zamJ1d04wMFVKNlQyU3dzcmVBZHdMRTBEUHEyRm9uMkhjNHhOcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzE1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747717012),
('ec1j8aNKZe1H9x1afUyNIg8B57foPkrdHtFK6nXz', NULL, '35.87.255.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSERhZUloNllGU0JxZWlCREQ0eUFENHJQWmlKZjR3WjlqUU8wbmdSVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718653),
('EHlPwhKydKlQLK5BWsOzU6f6DQUisbGEgk5SJUa0', NULL, '57.141.2.12', 'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFd3TEFtV3UweDQwRGw1ZDAzekE3U09pQWJZRktldmdWTE15cWhmSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODY3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747725594),
('eI1OaCgz1QvAGWomahjG6lQ5HkDG7J4kiWlEjbTa', NULL, '175.157.112.127', 'Mozilla/5.0 (Linux; Android 11; RMX2189 Build/RP1A.200720.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/133.0.6943.46 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/499.0.0.31.60;]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1lOVnpBbEdNQ0Rocmh6bXdFREt4UmxUaW9VQWI5czJYZnF4aEZ1VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vam9iYWRzLmxrLz9jYXRlZ29yeV9pZD0mY291bnRyeT0xJmxvY2F0aW9uPUJhbmRhcmF3ZWxhJnNlYXJjaD0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747719387),
('ESt5hbZeFdFJPr4qjy2sqHacUNw2k6csAqrJpIqs', NULL, '175.157.232.177', 'Mozilla/5.0 (Linux; Android 14; SM-A055F Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/131.0.6778.131 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/493.0.0.72.158;]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzl1YlllSkhCV0ZpbnF1MXpjZGNOdWNOZlVMc3E4dDdNUVhaUW5FSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTg5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716561),
('F1DVNH5K4d8KRurgx5b6YNw7Fw9DN7HIeII22mLQ', NULL, '35.87.255.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzlHazNROXhpM01FVEFLQm9iYnhQRGtvdGFSZUttSXBiZGtqbHRNaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718655),
('fbbWfFNsfQVFXQnEI2WshtJV3kenARLaYfVcQBCK', NULL, '103.21.166.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS2RBQ1dXWG1aS1pyQ0NCOVYxc0JEYmlJU1hwMFpBVG44N3hwZkNwUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTg0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMDoic2VsZWN0ZWRfY2F0ZWdvcnlfaWQiO3M6MjoiMTMiO30=', 1747720907),
('FFlJTOvuSeKUYODYZ2Cm9Yucrn0NZ7JyFRDl4yUz', NULL, '103.21.166.134', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 [FBAN/FBIOS;FBAV/499.0.0.53.105;FBBV/693867054;FBDV/iPhone12,1;FBMD/iPhone;FBSN/iOS;FBSV/18.3.1;FBSS/2;FBID/phone;FBLC/en_GB;FBOP/5;FBRV/697301994;IABMV/1]', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibUU1MUhWTEo2NjVnOFRhNmpaSFNnRllWS0N0QWF3S1NRVlgwU0VJSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vam9iYWRzLmxrL2VtcGxveWVyL3JlZ2lzdGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMDoic2VsZWN0ZWRfY2F0ZWdvcnlfaWQiO3M6MToiNyI7fQ==', 1747723929),
('fIMD2v96TfYqSmU00STuwnQALQfE3YPm8U1O9zrI', NULL, '157.55.39.195', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY01FMjBPZXhOemEzdUFEOGdpRG9ua2dlbk9XemdUU2FQTDYzYXFUZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjA2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719105),
('fnX8MjJ4RCtB2fH3DZyLgiHEcmAYDLMfl1vqxYk7', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDhSYnVNYUhKaktudW5yZENOSGw3ZU5iekhNdzliamVKOUdiTkNLdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzg5MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747718656),
('FPUyiwNRBT5rq2sVoquMFeZHFnGuty4djRmvmeAd', NULL, '31.13.103.114', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3c3Y3htMTVjN1VJbTM5NFptUm5FVDhFOVRrZXFwazd1Y1VtTVQ1dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719661),
('GhsWQgRc2qNfvwlqbHCnzzKrrqE1wZ30FgimCLJr', NULL, '51.222.253.19', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3VHTFh6MktoS0VTcUg3NmZVSGk3UmlGeHlIVFdyNVlRSTdHZ0xlVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzczIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716674),
('giWYoL0FcZJU8LCcpRiS05S36MNSQmMAWwhtM71X', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFVaZWFlcG82TEc2YzdiZ25yVnYwaTZMVEJtTnU4dU1rcE1CMkZMTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721077),
('Gw4mQe6TIP0R3cqvPW5ksrtSpnlSlt7qNyIM2PCj', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0VFWWRPMGdQTVpyZTlmYmpHbVJ0b0ZRb1l1VjVhYU1POXo2akdBRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY4OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721895),
('hJGYwsg2WOLk1HX1ecIBWoXfdgb4NPx4WN2dQkXu', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUFDWFFwanpVSTh5N0dTU2UxZDQxdlZ6YUhGcUlTbjBpUWpiRUZsSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODUwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721736),
('hjsqVPnE2XBy9lHHNGXptreW3ODQ83IlDukyYnCF', NULL, '51.222.253.6', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzUzd2phYUVVY2FEUXRxa1pSSHluR3NDMDJucXI0YXR6NG5kSmMxeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY3MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747723598),
('HlF0kiuY4yKoAF7FtGLUoi3dJ5w8HIKNfzcwOkSY', NULL, '112.134.220.227', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmNpdlpTMUlIOXY5R3dNdXpkdFBrNU1BSU5iSE5HSUtXTXI3OVJaNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720103),
('hRP2MrCIXL3MpNrmUH8rrKUD8Hrah7VEeSQYGKdC', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzZvakhyZDNpUzNGOFJieEsyV2FFbzBTT3ZwQ3JyQ2FBc1RSZkR0bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNDk4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723251),
('HT4vTBDYRS7ZxMrVNFkCKufAHYVPydN1VOVjIMiP', NULL, '175.157.231.244', 'Mozilla/5.0 (Linux; Android 14; RKY-LX2 Build/HONORRKY-L32; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.112 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/513.1.0.66.92;IABMV/1;]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhHNFloRnJmN2dhakVEUzFrNlVCZjZhYkV3YnZMdlNNRzVsb0VjbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vam9iYWRzLmxrL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716483),
('hUlh8Ts8BjR3ldm4B3RqC9kD8xxHTSOf8EDIJfDo', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDNXNkRxbVVsMFUzRnVuMzVsak51ZmFSM3hpWE81N2FhY1Y2a0VncSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzM1NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747724645),
('i6rf0VYxfD3bepOCjC85Vq5qSsofPCnvhkRQ1lWC', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEZYS1JvMG9RajRQM1BZT1ZmaEsxcWJocUZyUEtsUzcyeDZQWkdiVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzM1OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721243),
('i9QJDk5A73YjwQD3B2zhwueGC2DQ6QqcTKDeMQc9', NULL, '51.8.102.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36; compatible; OAI-SearchBot/1.0; +https://openai.com/searchbot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1BORndOcmtsajQza1BDelUxeDJCSW1zSFNybFZNcDdKTUhUMDJIdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzE0OSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747718266),
('Icbw1qonozgo3iWonQ5qLcr0FWlKmqBOsw4Uuhqm', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUdGREpXWXBDNjlXRUVHVXprMzBZeWxuSExUWTY4V2JKU3lkMnRKQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNDU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723332),
('ICpaz7AtfFT4BELaTOulIgKAdAlZJHY8SVmnblQ8', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0ZVd2Z4Nk9WRWMzWm9PTUpOZWNqaE45MHpZb1hRbGxnUTdGYVBPbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTY5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716801),
('IdQWIMQbLQJekKqySha2QHB2pF9YWQqrVaLlzoMd', NULL, '51.222.253.10', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFFrTlNBUHVBeEVVWk1RMU1BTFYyT2haY0hGYTVEc1NSSEFBOHhMYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzI2MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747717213),
('IgVa1e51QFTjQPEd3s9z7u3zriKYQ7dsNlbOUMD0', NULL, '51.222.253.20', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHh5TldVWGZmaDFRMnhteGp1NlJ3SU9FZkJSNDJUbldJZjBtcFNvZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzc0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716852),
('Is7T4ykVIvlAccVDO1YkGTPMDOUC3HqvpjjKftQi', NULL, '51.222.253.7', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXlnTlkzSTdMQUNHbTRPeHhlZ0lYYjhEYnhDek5PeW9Xd3lOTFJvRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY2OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719480),
('J3NAOupyauPeYlXk52O088GZyS7blDZ9jAOM2gHn', NULL, '51.8.102.236', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36; compatible; OAI-SearchBot/1.0; +https://openai.com/searchbot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDBMRkN4UlAwV2trQUhsSjdnN2FLWHJDbEhUMEgxbFpBMWxQQlh2QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vam9iYWRzLmxrL2VtcGxveWVyL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718267),
('jBHqR8EEhfyw3tDHiQ2LrXB0dmJ6XbOip6eUgw7s', NULL, '40.77.167.17', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEVzUk1jQ3dmdWVsbTBDNzdnVXY2ZjI1anhBU25SZ3BIdUdHOXFFVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzM2OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722135),
('jhjVcQJUd3AmYKF1ZqZJBsVxlAysEwBYC6BuA7Tl', NULL, '51.222.253.20', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWZwVGFtc0cyeWtVR3FzRzdsUHU1NTdFSUp1QjlLczNoeElveUlJNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzMyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723911),
('Jy1BGuqfD0IaODhTX6b6XHStv14w5DpNy2BMgEV8', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1kyN0JDa3JPQ3I4OExTMzMzS242WUZERlN4U3QyQTc5SnNCRVJZMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzc1MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721327),
('K0SVTdpHjoACJwYlptfKK6FGB7Z3TafHonbXGFcc', NULL, '112.134.220.227', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicERyM2c1NVYyNG1LQVFNSDZPRG5UUVhsbTlvSjRuU2FtUmpMYWsxVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vam9iYWRzLmxrLz9jYXRlZ29yeV9pZD0xOCZjb3VudHJ5PSZsb2NhdGlvbj0mc2VhcmNoPSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjA6InNlbGVjdGVkX2NhdGVnb3J5X2lkIjtzOjI6IjE4Ijt9', 1747721185),
('K6F2Qp4307qAaMdJnstisBB9UGeU9QqiNdVpRBc4', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmNmd2x4VXFMdlZEMmRHMUhWUWttbFNCNnEzeDBvWGZDSUZvaGNEWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzExNiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747727117),
('kE2mAiiUYbqRwx7MsC0OocsZIQkAfvNf4pDapXNK', NULL, '52.167.144.161', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0d2em92YXJYS0FqbEplY2pNdEZCaWdWMURWZzhpMGtlZWNlYzhLaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTg2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722263),
('kLE6mzvFxiUTd4Jj3kgZdwIybcctAaMX9T3uaYQt', NULL, '51.222.253.9', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmpEc09ScmlzaWNZYXpNUmZUZ0tYV0d3cDFEQXRDTXljcnlGcHU5NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzMxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720965),
('kON125xBV0FanYte4XTJyImnchn5xHBExTC0HW9Z', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnZJNjlXd0s4aHFqaXZidmRPTHR5aGpKd2lJZkpNWnAxTTUwYmxnaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzkwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747718988),
('lC96fL64moWuGNRgF2TC2vAyWKDMGIUedjszortL', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEtvcEhlZVdvZ0xyMnJxSGhlcFp2QmdFaGhROUhkS3NkMlI5WUNoUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY3NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720077),
('ld1q0sdx7POuffUI1OfwXakaWaXJh4mPMacJ0SEg', NULL, '51.222.253.6', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUhFMXNnVTk1czlneGU4TVF0cTEwc0VMTnY3RVJJcVBnM3NIajkzSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjM3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747725495),
('lGaXgCuScpjG2aMPlV6lDPMYQyua5LWcLkFeRYG5', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmxQZDR2RDJSSHdySjc1YVRCMkViZmt2TWVxM3piMXVtVEJ1T0QzdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzk1NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720576),
('LMLvgOGS3FpqbW6f4y1BPPmcU1xQKRvW8jHMNcu1', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3RIeEFFUlN4bEc4T00yQjI2enk0bGRIT1dQSVNZdWo3ckdXUjdCaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzg0MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722090),
('lNoCAR7bjOliAq3B4aHmMd7PGLeyllQbPdqRXCgm', NULL, '51.222.253.8', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0RHOWFLYnNYNWRndWNuZ1RnVUViTUZUS1M4YVZkTHRMMDBBR2d6eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzI4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718042),
('lXNm6khifEsma8ufnXWy46LbenSKfvqbJgw2ct9w', NULL, '51.222.253.4', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDVRMmVKZ0FwaGRyWmNWdnlCQjRXUHg3Ykxta0RWTzFTQWhseVkwVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzYxNiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747717616),
('M0BHp23WEabm8sESz6Jqr9BIhXt1viIMZsCfPamF', NULL, '51.222.253.13', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnp3bVVaczVRSW1mNTdUZ2piSkhzWVRyTjRpdXRBS1ROb1hReWpzSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjI0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747717013),
('M4ugCN20dReAwegw9gZkzXZnUwo2qR7QfwoLW3Z1', NULL, '175.157.16.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYU9KYkptQ2Q2TjhWTlNNQWtadFpwbUFvZVdwekRHWENuU3RTSmpjciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODcyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMDoic2VsZWN0ZWRfY2F0ZWdvcnlfaWQiO3M6MjoiMTMiO30=', 1747722275);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('meIyo7OekNPARD1NElKZUmeV0wiHEsLoa39C4B0u', NULL, '122.255.11.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblgwTEw2UlBvU1R3ajQzUlhoUDJ1NFg4T1RDZ3FCaFlaZDcyWURWTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747723351),
('mhB85LRzJnKqKqxfw7nkgoAGXGJVphuT5YBVXVlq', NULL, '103.247.48.14', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWI0QkRpWm1kcVNURThqY0VhWGtUYmFsUFVHclJuN2lad0J1TUUxZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722232),
('mQB5sXK98q6N42unJ8drEE0xZDpfBI1rw9W5KeS5', NULL, '193.186.4.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYzRGMEQ1ZG43TjlOMVBsVjVMWVdoVmFTdmFkdmpwdlRLTFNyZHZRTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723719),
('msQ3ZmROYnsyogwwtMJRxmjC0VKPmjcV3dak3HWA', NULL, '114.119.158.126', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFFXb3dTbkxTUTJyUlhHSVM5MTRoZ0U1VXl1NVhEbUZuR29sMkR5UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzMzOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719491),
('mybrxj7kugijlKBm4y2zA21Pd9OefGMSK41nbVIW', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2lYQ2VlUnB3YjJ0SGFaZU55VHREQlR0emtMUUVaRDZFOUZrT1ExbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMTAyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723668),
('n9PnqHY1UoCM5CqNsFHgpeAWI4jT453tuo2GiCou', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmo3QU5wcWxEMFJMVDRSeHQ0Tk1Db2pXa0ppdkpUbFh1TDRZeWwySyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722414),
('nArgJGDSU9P4ja6ar6r0TzrBYI6G8HfuOIk0RL0T', NULL, '175.157.39.81', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXNHN3Z2OEVXMkhSVzE0RE1KZWRpNzJYWXExZU9ubVNJNXNpSDFqQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747723934),
('NckTPuD0KEQrAXdCWPPWla0dFEaGX8W6XxoxWqYD', NULL, '114.119.152.155', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXlPaUFWNzVadG1nMjRpNDI1d2ZEbjYwTGdVMlJSS0wwMnlqREJzWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODcwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720909),
('NOhA5aHwMdVx8mCFSdLPAhWVhznJY5Nz9Vckp4KK', NULL, '212.104.231.250', 'Mozilla/5.0 (Linux; Android 11; SM-A107F Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/491.0.0.58.78;]', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieWV3TFFBNkJac2Y0NWsxelFTUTNObEd1bExQcTludTdPcE1nMm1HQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzExMzQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjIwOiJzZWxlY3RlZF9jYXRlZ29yeV9pZCI7czoxOiIzIjt9', 1747722858),
('NqgeowtrXmsNwd0NkctJli2Q6Ntb8lF4q4heHgcx', NULL, '51.222.253.16', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDhFMTdVTmg0ZGZweEZHbFZ2VWF1YjhqTGRnSDhWczl0eFlIb2ZBNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzM3OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720602),
('nQvMwCkgk4Y5klpJyOY0DszYoy6oh5plszgUpYN1', NULL, '69.171.231.115', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHp3bEd5MUN3NkM1ejJqT08yYW0wZmpRSTZ6Szg3akVrYmtFelY2ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720509),
('NrwhA64TKFGVxPrmN8HQhhzmnzuEwbzqFfRHiGdO', NULL, '103.247.48.5', 'Mozilla/5.0 (Linux; Android 13; SAMSUNG SM-M045F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/19.0 Chrome/102.0.5005.125 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaUJLMlVZNU1yb2hlU2VFWHF6WkFVRG5mS3VadDJjRUdZRWpUbFkwQSI7czoyMDoic2VsZWN0ZWRfY2F0ZWdvcnlfaWQiO3M6MToiMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vd3d3LmpvYmFkcy5say8/Y2F0ZWdvcnlfaWQ9MyZjb3VudHJ5PSZsb2NhdGlvbj0mc2VhcmNoPSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747725381),
('nvKnlRbaOY2Jkcy9fTKkfUxMeRHIxa1QFbHR2fU8', NULL, '175.157.26.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTI1YWFJaVVIdm0wUFA3Y1lPMkMwNEFibFY5c3I3ZFlSa3JuckU1QSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9fQ==', 1747720600),
('O7ewmq6bCyjxjTYo00zJmoMZa4cb1tRmPttdMKdY', NULL, '114.119.152.155', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakNtZ0RLNEVOdTE5UTlHODZpaGdpUzZSUlFpNjU5RDNNUUpRdUxucyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzE1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722331),
('obYGzZn09dZtF5w2JlVmxYy5RwmNgjLryFe9BV0Z', 107, '111.223.181.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicDVZcFZ5Sk1Bc0E0QTVoaWtFOGpVS2VkcmVQbk9EYjF5bkk0RkVCeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMTAxOSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwNzt9', 1747721208),
('OGgDGqCgVhREQxtz1M3GOGeIxdgDFS5dUcLbTBtI', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0ZHbXN3Q0lheEY5ZTdtTlZLRk53MnJkME51YjlUbUJub3g0c294RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzEwMzYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747722497),
('om7GMywzNxPbFdSwYMe3O3XxcrO5xSTjJ4eYkOiT', NULL, '31.13.103.113', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm9PMkZQeDJLZ28zWFNmZzVzdWtHZUVOeFRPemJrWHJDWDRHTUlNTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719662),
('oqitn6fdHomIJealCjDJUL8tK5XoiJJ6MSidsYz0', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzFXSmFuamhxMEhjSWFDaVlITTdReHNxcVdEcTJDYnE5eFBjbzdLZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzI0NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719406),
('Or1UACj4NlMQ4yY7FToxNIeVzlfhVIPg1zjAUK4L', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienFOUExTNnRqYnBtME5ZcXNLTUNhQTB5YjNlbzN2UWthMGFLd2JrQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjA4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722581),
('oU0PRd6qxUl3THY7aTVh1Gfsf7xDic3RmZe20sKZ', NULL, '114.119.152.155', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0d2QzZMaWFxT3ZsUlE3WXVGZUdkQjVRZUh1NmhPTmVYd2czQ2F6TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzYzNyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747718826),
('OU96eYhfB1c0rhofdzKUPqfVrlsPW31gdtflrpQE', NULL, '31.13.103.116', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajhaNU1pUVZjejJoVjljM0wwbG5PeDVEUHpKYmJXWFRxTk92bnVmOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY1OiJodHRwczovL2pvYmFkcy5say8/dXRtX2NhbXBhaWduPTEyMDIyNDMzMTc2ODU4MDAxNyZ1dG1fY29udGVudD0xMjAyMjQzMzE3Njg1OTAwMTcmdXRtX2lkPTEyMDIyNDMzMTc2ODU4MDAxNyZ1dG1fbWVkaXVtPXBhaWQmdXRtX3NvdXJjZT1mYiZ1dG1fdGVybT0xMjAyMjQzMzE3Njg2MDAwMTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747725710),
('ovXOueKqmVKdhMkSPCiL1oEs3obIC1hww3szaaym', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUNmaFVoZlZodnVkU3dsWllDUzdRRG15M1B6WHY0Y3ZvenJyRzNMaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNjI2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719727),
('p4AodIraNiWpGChFNKjmpOKYUCFjPt1vn142qmuA', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMm9IQ09rT3pPMUhTSU9vb0l2N0YxZHlYTXFGS2loYjFYTXV4aHRTSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzc4NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722998),
('PebF3gZg6ccNJoSiDmfFydzP5cYzFxo9BkS89nOy', NULL, '51.222.253.2', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2Z1MTg1dGhmYXBIUEcyeFVXVmxBVkVhNVdFYXBxRElhWUUzdDJmNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzI5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718615),
('peFCJImaAoZvD9Ek71mKqZuaeIJwNh5KHrcemZdT', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMktpd3RRNWNjUlVkRENHRlpINTZGaTRnUHY1Qk9kRkVLYkRwWXVLYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzcwOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721417),
('PMSy0vripbeHiKBzPzvg69ShignFrXN6QHiB0NjS', NULL, '31.13.103.5', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG9YZThTS2dTT2pkRXc4NElQN1BPaTNmM3lidHl5VHZOZGZxakk1UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747725709),
('pmUk5lANJglGTz2N73srkwlTXjUQm6YFplZ7TVdJ', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhoNGJGbXpNU2ViUkt2ZENvNHRCYkx0U1JydEUzekZCbFY2REJFVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODQwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721853),
('Pudlk4ofJtQhd0tOVUZp6B7Il22Dbrs8KmAXHpqI', NULL, '51.222.253.8', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFR1N1lWZ3NJcDk3dUJZVFl4Q1hYV2lZVkllRVVQdVlaMlg0bnhBYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzM3OSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722911),
('qlIqFfTZv9rtnPTGW7xISWz7bU6w8zjKMPKgPRQK', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGgweWd4Z1FrU2xNcG56UW9hWkVLaDNJejFyeGx5R051Qm1yaVFiTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTE4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716830),
('r6sU4QQD7KmbsIXPFO1xnD0adiD8v7tbsp6pM7w7', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnZMZm5Oa1dPakg3aGE1WWU4T1VHTDNiTjJYcHU3NnBaQ21oSTd5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vam9iYWRzLmxrL3RvcGVtcGxveWVlcy8yMC9qb2JzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747719575),
('r82f4nhtpcSG84CnojREBFeip7A9nRkPCS5k8rnJ', NULL, '114.119.131.33', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHhoc2JFbnJkeFNwTWRTellrWHdtekkzM0ZsYjE4NmNPeGJ5ZFYwSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzExMTMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747719323),
('RcRVDRVG27H7dJySuB54ApjDqJSiaqS0JC9urSXQ', NULL, '175.157.178.91', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUUwYWtNQnExWkU2TmhjWmtvdXNnVDZOekFQZmFQWVc2TFJsS2tkbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747725190),
('RHiCwomPVIausqsver4tY0szB1frgh1PKDyckCb2', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXYxS29rU1lhQUE5TXVPVWh6NXlLZkxoQU1wd0JLVEsyMXFHaEtNNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzk2MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719825),
('rMhZY3PavwEq6clYeuQHUKO7G4w1d7QA00po67Ql', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW1MckdoYnl2dGE0bmJyM1BmM0NOYUlRb3RZUFBWMEIzZTN4RUphdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzczMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747718740),
('rn6RSeddJOwZU0BWl8ASm5M90Ohyqab1xpL3dYlk', NULL, '114.119.158.126', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREZWNGoycm9lZjNESExyQnpDaG5EaWFVQU1UVzI3ZzFaWlZqVG5PbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNTI0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723085),
('rslLPwFO16HKoz2HgVwRAlwFYpH3BU0NLHql2YRH', NULL, '114.119.152.155', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVlTTm5JWDI1QUFKVGZ5ZEhFakhCb29BSEx4VjZFTjFwUDdFOXFMcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzMwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722247),
('S5wJukKy4xsbO1PgDp3j2feFzo3b3f0Og2ryOPs0', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZktMemZqaFNwS29pM1RkaXBVY1I0eDEwNXNjYTZHcXFPNWNhS1BXNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzI2NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720242),
('SRfogKQq9EC2meo5qN3ETe36B9G116VAPjDRrLSx', NULL, '51.222.253.15', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2VUYWFMbTdQamtkUGExNG5YcXZlWmd6VlB4MEFnVlA1VjhvcGQ5QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vd3d3LmpvYmFkcy5say90b3BlbXBsb3llZXMvMjgvam9icyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747722615),
('SXmhCr1VIZBe84HRrcVSTgp9W1ANnVTzKhJgos8Q', NULL, '114.119.136.205', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXppVm1qRVNMTzQ0blByMFEzZ0ROSTRBZjdXYXo3NTRRU25yNE4yQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vd3d3LmpvYmFkcy5say8/cGFnZT03Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721446),
('T6m4yJNYONdWN7u1NfDfFXsuYukTNoev88l25Rf7', NULL, '157.55.39.202', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUxnT3YzdGdQSG9mTVhRTzJtQ0I0ZW9CeDd0V0t4cndlZnF3cWY5QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODQwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722750),
('t8gLD9AlmiMggkjY0DyYRKig5ryZRBk2Pvg5L8DH', NULL, '51.222.253.14', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmhOWUdIbU5Kc1hraGRySzZsOG5YVEhQdGd3Y2ZUR3FkS2YydElqdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNzc5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718972),
('t8p88drgoULMNhZOdfMhjnJyh6f6aQaO0aMJ7fqM', NULL, '162.120.184.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRjF3d3VCaEhsSHNpQm14d3ZHakRJS3UyV0NyNHpLZjBUUnpIcjZEdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723933),
('tA1dPXra6ud7Sll0Y91CmU0tXNSkvH5Q76TwOHME', NULL, '162.120.184.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMTNtNTNiVlgwb041MGVOUm5PQm1vY2ZuQTJPcXlLWTBEVDRrS2dXMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747727082),
('TeUDV8NKakMIXDIDXsmAR0iSD8QXZS3yoqphh7fI', NULL, '72.14.201.168', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV0VMZ3pwaXVXWno5MzZZb2Z3N0d1OEI3aHp1SVhvMTd3YnlYM2I5YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721879),
('TEyOLisWFItgbMxA9l6nQS9XVarECmOWIiDyI28t', NULL, '103.21.166.134', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUhaakNYMEJPVnVkWkhUa0xHRjBwNndIT3A4YndySVZFNmZqQ1NqbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzc2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720451),
('tGIvogeNkuTqmHUrUl9kJAMUz8BZ3cpBzxnIKx4D', NULL, '114.119.152.155', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEFZNWtkSllWR1VsQ1cwZzVPMjNRa3VvU29yYnZ6ajRwRElhVExVUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNDE4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723415),
('tM7WAIxXh7NXNkWrhhpyNtDukxPDvE8xqgBorzl2', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWJuVHd4SDBRUUszQTdRdGhGMVc5YVZyeklWaE1DcHVEWXgwcG1yZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzQ2MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719156),
('tNKIlkAuyutiU3F2Sp3iC1wOoJhLc983roVd2QFl', NULL, '114.119.158.126', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXFTU09vUWlBdVZxRGhpYlFkSlowUmI4eUZoTVZoQXdxeFRuVkNvWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvNDc3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747716874),
('TnVT5udk2sCOiDaLuAZkJUXRQHMMBmQU0bITkD7f', NULL, '114.119.156.250', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFVmbTgzT05KMno4VGE5ZTZPcnQxQzl2MGFySXFQS2J2VXhrRVdMNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzgyMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720158),
('u20lVVg42gUP3hbH7atDS9ABJ8Cuil3CTl8G5Bcj', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmZNSXdENGJXMWhKUEdTOTd6U0M0eFc4RktPVlVvWTRlSHRXWFB5dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvOTI2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722046),
('u5Z3XWshDCPHHx6zeULq07EtKxI7FlGNoCilnYhH', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVp4ck5FT0haWUx4UXRFOVVRV3NPbmVBNHRUeTBNRXc4UVU4NXFMaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzkwNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721160),
('U8K86677NFpgNpIvWuDNGsF7vRLKZwSWHG3BiuTf', NULL, '51.222.253.9', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXNsMmZrbGFPUmJkYmE4MlQzTlA4VHd6VnhIcnZ2akdEZGZkTnBjUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzY2NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719252),
('UEnyOOUE4osEP1UhMcLN8aHnUUy1NQLP3oQdaJTK', NULL, '112.134.224.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0pOWHY3SVBLWFRTU0hydkh5dklqdzhSYlIwZE5nbnBRZnNTTjQ4TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vam9iYWRzLmxrLz9jYXRlZ29yeV9pZD0mY291bnRyeT0mbG9jYXRpb249JnNlYXJjaD1IZW1hcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747723773),
('uhBtfiRPWAqQhTMFh670GP7S1WgJc5H6H2EIcTVf', NULL, '175.157.16.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXZhNVlvZ3h1ZVpWR2hUWnh3NlczbG1zUVJ2UVhhdDB0OHhkN0RWZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721316),
('VAch0cz2hEkokkWeNFND7eaGKbVePdtNamaN0XhE', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekRCY0VLekQwdmFnNFdIMTd5dGh5bU1Mc0tKeURKdEt0SFNqcHVYbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vam9iYWRzLmxrLz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747722086),
('VOGyxSSmC5AtJX33ixvYVTTrtFxefNRE5HYbO01d', NULL, '114.119.153.84', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnlqeHk4RTJYbGM2SXdsUGVCZ293Zm1jUHVJM0FseGIxQmFSTGNYZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvMzk4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723504),
('VpGKFL2kBpKXAILSAOPT0IxwHGQQ2x4uBsoz4hpK', NULL, '114.119.131.33', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1BqczRxRVFYTnZvVDFvU1M0WUpoTkZFd0dTdng0MFZnNGthNFRxZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzIyMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747720829),
('W9ktec6Fq1QXTUifhOJ163AqRMQyOk4vA5xnG4Zt', NULL, '112.134.186.245', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWh1cEdmU3NxekZRVzJtUXhiaE9kdWFNU2VtMGxtdDBHZzRzeEk2NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747717244),
('WfF408hIaWJC4pZZw0tZbHTWkhVVT7s7D1cCvabE', NULL, '69.171.231.7', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU1oREJKNGRzcmUwT2JqelFzMzBZd01rVkc0dWRzaUxYVXJ6SjVHRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718882),
('Wu5c4kdsqhPAktTG9u3bcphfIEi5ozUahVBfZBej', NULL, '51.222.253.3', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlJ6QmFRVTBSUjNCRVFqcnNQMzUzWGhpcDIwUE5tR0kzTnYzaG5SdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vd3d3LmpvYmFkcy5say8/cGFnZT0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747724570),
('xac96FQmOCeQBlckCvOHDy34P58eTWpXGWnbVh3Z', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVp3NHJBVmZ5VjNFbUhRY2NjYXVQU29wcnpzVjdGd3pYa0VPeEtlQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODc4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720743),
('xZMFKKmvrJsVaNY7tQZeZRLoMty36h3KsEddbzOD', NULL, '207.46.13.160', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1ZBa0o1M2FJQnJTc0t6RFpUYTljSGtDcFdnZGp3WEo5ak51VVdCRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzEwNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747722360),
('yoxskvLz5kMtoDCUNKxYYGeoY9ev96Zxk0XKYsKd', NULL, '173.252.87.112', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclNmSmY4SlRpZWlFZHV1OXl4NGd2dHRMRHZGZk1lSmV0UGRiQU5SbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720963),
('yt8Rys5ixSqy74gh5ST4zFV51Lp2xL1nlaDWBX87', NULL, '114.119.129.147', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlJNbHl2eWN5S3psMzAwYzFaSFFoQ21TVnVqRHlWS3RBdUlsY1VhYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzczNyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747719995),
('ytQP6wS5iwaoCt4HgeQbNDVabOxPcLi0SkPQafph', NULL, '69.171.231.112', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm5NdHprVWR5UktwNDVPdUJ6Y3QwTTBvMExTelBlZm9QbWFBeVBWYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718888),
('Z3sVVM1hT7FXCH79dSAqgNZXXtvkPdj4PU2AGeAF', NULL, '173.252.87.9', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDVJeDR1Y1RjNTVIN1pGS0xFTklSMW5zSTdIek9WYkRhZDh0T2tWSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747720964),
('Z7WXD31Qk6XRsiDLJvjhmMR0jsFMH8OLaqflKGbX', NULL, '223.224.30.126', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUo1MnJhVE93ZGh3WDg0VXlvekZKaktTRWZKNDNsVzZ0N1d6WVJiMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vd3d3LmpvYmFkcy5sayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747725234),
('zaGbGR6cXkL7zyZ1CkH91KxQIdwrkJgxqGLO7xyc', NULL, '162.120.184.252', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid0xLNXB6UDNYWVU5aWVXdHNTS25iWEpsZ1daYTZ2V0JBdVVaZ3NuayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747723672),
('zCjqvjgCw5mtP1YhzAgZTUtLiGNNrRHOXeFLlCaX', NULL, '31.13.115.114', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDZRZGk5UEQyNXFORDdoRVJoQnpXd0xrTDRjWlVzMHBrS2NZV1V2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747722379),
('zq59qkBJFgG2nYn9fNBB6FApNWNk4J3BZ000CvvM', NULL, '212.104.231.193', 'Mozilla/5.0 (Linux; Android 13; SM-A032F Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/507.0.0.66.49;IABMV/1;]', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidkY1UmdENUJoUnVCUGRLR3FiQkJqWk02cWQwZUtvOTBiMmRuSEFYTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHBzOi8vam9iYWRzLmxrLz9jYXRlZ29yeV9pZD02JmNvdW50cnk9MSZsb2NhdGlvbj1LYW5keSZzZWFyY2g9QWNjb3VudGFudCUyMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjA6InNlbGVjdGVkX2NhdGVnb3J5X2lkIjtzOjE6IjYiO30=', 1747718842),
('ZSclsjKvdDI2mgpHiOigZgOj8HCCGAEKfKH5IaQy', NULL, '173.252.107.7', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjlVM3RoTXNFcWg1WkJWYndjSVNtTTdYYTBkN1lhYVZLUXFsSVJoTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHBzOi8vam9iYWRzLmxrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747718653),
('ZvXYYxnz3FddlvrCsELiWd7ryJUEpBLmrKiB880F', NULL, '114.119.140.161', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXhjeEs5Slg2R3B6TXdXWkRJTTkxMHFQWmpxYjVjS1FwMVIwZWNrZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LmpvYmFkcy5say9qb2JzLzg5NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747721804),
('zZSKbO0UblDgeS4q29wQFm4wcHxFEYCFxjgG9F4R', NULL, '114.119.152.155', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEVCbnJFbENCdEc3eXVBM21ub2ZjMnZYaDJUdEVHVWQ3QTVXYWNlZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vam9iYWRzLmxrL2pvYnMvODMwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747721960);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(74, 'HR Admin Work', 8, 'active', '2025-02-03 18:22:05', '2025-02-03 18:22:05'),
(75, 'HR Payroll Work', 8, 'active', '2025-02-03 18:22:05', '2025-02-03 18:22:05'),
(76, 'HR Training', 8, 'active', '2025-02-03 18:22:05', '2025-02-03 18:22:05'),
(77, 'Software Engineering', 1, 'active', '2025-02-03 18:23:41', '2025-02-03 18:23:41'),
(78, 'Web Development', 1, 'active', '2025-02-03 18:23:41', '2025-02-03 18:23:41'),
(79, 'Information System', 1, 'active', '2025-02-03 18:23:41', '2025-02-03 18:23:41'),
(80, 'IT managements', 1, 'active', '2025-02-03 18:23:41', '2025-02-03 18:23:41'),
(88, 'Back office', 5, 'active', '2025-02-03 18:27:24', '2025-02-03 18:27:24'),
(89, 'Front Office', 5, 'active', '2025-02-03 18:27:24', '2025-02-03 18:27:24'),
(90, 'Coordinator', 5, 'active', '2025-02-03 18:27:24', '2025-02-03 18:27:24'),
(91, 'Outsourcing', 5, 'active', '2025-02-03 18:27:24', '2025-02-03 18:27:24'),
(96, 'Constructions', 12, 'active', '2025-02-03 18:30:39', '2025-02-03 18:30:39'),
(97, 'Architecture & Designing', 12, 'active', '2025-02-03 18:30:39', '2025-02-03 18:30:39'),
(98, 'Property Sales', 12, 'active', '2025-02-03 18:30:39', '2025-02-03 18:30:39'),
(99, 'Leisure', 13, 'active', '2025-02-03 18:32:03', '2025-02-03 18:32:03'),
(100, 'Traveling', 13, 'active', '2025-02-03 18:32:03', '2025-02-03 18:32:03'),
(101, 'Booking', 13, 'active', '2025-02-03 18:32:03', '2025-02-03 18:32:03'),
(102, 'Outsourcing', 14, 'active', '2025-02-03 18:32:46', '2025-02-03 18:32:46'),
(103, 'Part time', 14, 'active', '2025-02-03 18:32:46', '2025-02-03 18:32:46'),
(104, 'Assignment', 14, 'active', '2025-02-03 18:32:46', '2025-02-03 18:32:46'),
(105, 'Art', 15, 'active', '2025-02-03 18:33:33', '2025-02-03 18:33:33'),
(106, 'Design', 15, 'active', '2025-02-03 18:33:33', '2025-02-03 18:33:33'),
(107, 'Painting', 15, 'active', '2025-02-03 18:33:33', '2025-02-03 18:33:33'),
(108, 'Content Creation', 16, 'active', '2025-02-03 18:34:17', '2025-02-03 18:34:17'),
(109, 'Writers', 16, 'active', '2025-02-03 18:34:17', '2025-02-03 18:34:17'),
(112, 'Analyst', 17, 'active', '2025-02-03 18:35:26', '2025-02-03 18:35:26'),
(113, 'Data Management', 17, 'active', '2025-02-03 18:35:26', '2025-02-03 18:35:26'),
(114, 'Data Collectors', 17, 'active', '2025-02-03 18:35:26', '2025-02-03 18:35:26'),
(122, 'Corporate Management', 21, 'active', '2025-02-03 18:40:32', '2025-02-03 18:40:32'),
(123, 'Business Unit Management', 21, 'active', '2025-02-03 18:40:32', '2025-02-03 18:40:32'),
(124, 'CEO Office', 21, 'active', '2025-02-03 18:40:32', '2025-02-03 18:40:32'),
(125, 'Board Directors', 21, 'active', '2025-02-03 18:40:32', '2025-02-03 18:40:32'),
(126, 'Company Secretary', 21, 'active', '2025-02-03 18:40:32', '2025-02-03 18:40:32'),
(127, 'Retail Chain', 22, 'active', '2025-02-03 18:41:35', '2025-02-03 18:41:35'),
(128, 'Whale Sales', 22, 'active', '2025-02-03 18:41:35', '2025-02-03 18:41:35'),
(129, 'Government', 24, 'active', '2025-02-03 18:43:06', '2025-02-03 18:43:06'),
(130, 'Government Authorities', 24, 'active', '2025-02-03 18:43:06', '2025-02-03 18:43:06'),
(131, 'Government Estates', 24, 'active', '2025-02-03 18:43:06', '2025-02-03 18:43:06'),
(132, 'Banking', 23, 'active', '2025-02-03 18:44:01', '2025-02-03 18:44:01'),
(133, 'Insurance', 23, 'active', '2025-02-03 18:44:01', '2025-02-03 18:44:01'),
(134, 'Agriculture', 26, 'active', '2025-02-03 18:44:56', '2025-02-03 18:44:56'),
(135, 'Farming & Cultivation', 26, 'active', '2025-02-03 18:44:56', '2025-02-03 18:44:56'),
(136, 'Environment and Science', 27, 'active', '2025-02-03 18:45:50', '2025-02-03 18:45:50'),
(140, 'Natural Source', 28, 'active', '2025-02-03 18:48:06', '2025-02-03 18:48:06'),
(141, 'Waste Management - Energy', 28, 'active', '2025-02-03 18:48:06', '2025-02-03 18:48:06'),
(142, 'Gas', 28, 'active', '2025-02-03 18:48:06', '2025-02-03 18:48:06'),
(143, 'Wind Power', 28, 'active', '2025-02-03 18:48:06', '2025-02-03 18:48:06'),
(151, 'Foods', 31, 'active', '2025-02-03 18:52:05', '2025-02-03 18:52:05'),
(152, 'Beverage', 31, 'active', '2025-02-03 18:52:05', '2025-02-03 18:52:05'),
(153, 'Processing', 31, 'active', '2025-02-03 18:52:05', '2025-02-03 18:52:05'),
(154, 'Design', 32, 'active', '2025-02-03 18:53:34', '2025-02-03 18:53:34'),
(155, 'Textiles', 32, 'active', '2025-02-03 18:53:34', '2025-02-03 18:53:34'),
(156, 'Cutting & Making', 32, 'active', '2025-02-03 18:53:34', '2025-02-03 18:53:34'),
(157, 'Warehouse', 32, 'active', '2025-02-03 18:53:34', '2025-02-03 18:53:34'),
(158, 'Factory', 32, 'active', '2025-02-03 18:53:34', '2025-02-03 18:53:34'),
(165, 'Electronic & Devices', 35, 'active', '2025-02-03 18:58:23', '2025-02-03 18:58:23'),
(166, 'Hardware-based Computer Items/Units', 35, 'active', '2025-02-03 18:58:23', '2025-02-03 18:58:23'),
(167, 'Manufacturing', 36, 'active', '2025-02-03 18:59:26', '2025-02-03 18:59:26'),
(168, 'Processing & Assembling', 36, 'active', '2025-02-03 18:59:26', '2025-02-03 18:59:26'),
(169, 'Distribution', 36, 'active', '2025-02-03 18:59:26', '2025-02-03 18:59:26'),
(176, 'Sports', 39, 'active', '2025-02-03 19:02:43', '2025-02-03 19:02:43'),
(177, 'Recreational Activities', 39, 'active', '2025-02-03 19:02:43', '2025-02-03 19:02:43'),
(180, 'Plantations - Tea/Rubber', 42, 'active', '2025-02-10 21:17:22', '2025-02-10 21:17:22'),
(181, 'Plantations - Coconut', 42, 'active', '2025-02-10 21:17:22', '2025-02-10 21:17:22'),
(182, 'Other', 42, 'active', '2025-02-10 21:17:22', '2025-02-10 21:17:22'),
(189, 'Apparel - Cutting & Making', 44, 'active', '2025-02-10 21:29:26', '2025-02-10 21:29:26'),
(190, 'Apparel - Warehousing', 44, 'active', '2025-02-10 21:29:26', '2025-02-10 21:29:26'),
(191, 'Apparel - Marketing', 44, 'active', '2025-02-10 21:29:26', '2025-02-10 21:29:26'),
(192, 'Apparel - Sales & Marketing', 44, 'active', '2025-02-10 21:29:26', '2025-02-10 21:29:26'),
(193, 'Apparel - Corporate Office', 44, 'active', '2025-02-10 21:29:27', '2025-02-10 21:29:27'),
(195, 'Admin', 46, 'active', '2025-02-24 21:53:17', '2025-02-24 21:53:17'),
(196, 'Operation', 46, 'active', '2025-02-24 21:53:17', '2025-02-24 21:53:17'),
(201, 'Interior', 48, 'active', '2025-02-26 22:15:23', '2025-02-26 22:15:23'),
(202, 'Design', 48, 'active', '2025-02-26 22:15:23', '2025-02-26 22:15:23'),
(203, 'CAD maker', 48, 'active', '2025-02-26 22:15:23', '2025-02-26 22:15:23'),
(211, 'Commercial Law & Business matters', 9, 'active', '2025-02-27 22:17:28', '2025-02-27 22:17:28'),
(212, 'Criminal Law', 9, 'active', '2025-02-27 22:17:28', '2025-02-27 22:17:28'),
(213, 'Counseling', 9, 'active', '2025-02-27 22:17:28', '2025-02-27 22:17:28'),
(214, 'Micro Finance', 43, 'active', '2025-02-27 22:19:48', '2025-02-27 22:19:48'),
(215, 'Gold Loan', 43, 'active', '2025-02-27 22:19:48', '2025-02-27 22:19:48'),
(216, 'Leasing', 43, 'active', '2025-02-27 22:19:48', '2025-02-27 22:19:48'),
(217, 'Maintenance', 49, 'active', '2025-02-27 22:20:47', '2025-02-27 22:20:47'),
(218, 'Repair', 49, 'active', '2025-02-27 22:20:47', '2025-02-27 22:20:47'),
(224, 'Civil Engineering', 2, 'active', '2025-03-01 20:49:27', '2025-03-01 20:49:27'),
(225, 'Quantity Survey', 2, 'active', '2025-03-01 20:49:27', '2025-03-01 20:49:27'),
(226, 'Electrical Engineering', 2, 'active', '2025-03-01 20:49:27', '2025-03-01 20:49:27'),
(227, 'Software Engineering', 2, 'active', '2025-03-01 20:49:27', '2025-03-01 20:49:27'),
(228, 'MEP Engineers', 2, 'active', '2025-03-01 20:49:27', '2025-03-01 20:49:27'),
(229, 'Finance & Accounting', 3, 'active', '2025-03-01 20:51:16', '2025-03-01 20:51:16'),
(230, 'Auditing', 3, 'active', '2025-03-01 20:51:16', '2025-03-01 20:51:16'),
(231, 'Treasury', 3, 'active', '2025-03-01 20:51:16', '2025-03-01 20:51:16'),
(232, 'Risk Management', 3, 'active', '2025-03-01 20:51:16', '2025-03-01 20:51:16'),
(233, 'Stores', 3, 'active', '2025-03-01 20:51:16', '2025-03-01 20:51:16'),
(234, 'Digital Marketing', 4, 'active', '2025-03-01 20:52:54', '2025-03-01 20:52:54'),
(235, 'Sales & Promotion', 4, 'active', '2025-03-01 20:52:54', '2025-03-01 20:52:54'),
(236, 'Social Media Marketing', 4, 'active', '2025-03-01 20:52:54', '2025-03-01 20:52:54'),
(237, 'Mass Marketing', 4, 'active', '2025-03-01 20:52:54', '2025-03-01 20:52:54'),
(238, 'Sales & Marketing - Back Office', 4, 'active', '2025-03-01 20:52:54', '2025-03-01 20:52:54'),
(239, 'Content Creation', 4, 'active', '2025-03-01 20:52:54', '2025-03-01 20:52:54'),
(240, 'Education', 6, 'active', '2025-03-01 20:54:12', '2025-03-01 20:54:12'),
(241, 'Training & Internship', 6, 'active', '2025-03-01 20:54:12', '2025-03-01 20:54:12'),
(242, 'Teaching & Tutoring', 6, 'active', '2025-03-01 20:54:12', '2025-03-01 20:54:12'),
(243, 'Schools & University', 6, 'active', '2025-03-01 20:54:12', '2025-03-01 20:54:12'),
(244, 'Back office', 6, 'active', '2025-03-01 20:54:12', '2025-03-01 20:54:12'),
(245, 'Hospital', 7, 'active', '2025-03-01 20:55:15', '2025-03-01 20:55:15'),
(246, 'Pharmaceuticals', 7, 'active', '2025-03-01 20:55:15', '2025-03-01 20:55:15'),
(247, 'Care & Services', 7, 'active', '2025-03-01 20:55:15', '2025-03-01 20:55:15'),
(248, 'Medicine', 7, 'active', '2025-03-01 20:55:15', '2025-03-01 20:55:15'),
(249, 'Media - Out side office', 10, 'active', '2025-03-01 20:56:23', '2025-03-01 20:56:23'),
(250, 'Media - In side office', 10, 'active', '2025-03-01 20:56:23', '2025-03-01 20:56:23'),
(251, 'Advertising', 10, 'active', '2025-03-01 20:56:23', '2025-03-01 20:56:23'),
(252, 'Content Creation', 10, 'active', '2025-03-01 20:56:23', '2025-03-01 20:56:23'),
(253, 'Animations', 10, 'active', '2025-03-01 20:56:23', '2025-03-01 20:56:23'),
(254, 'Transportation', 11, 'active', '2025-03-01 20:57:07', '2025-03-01 20:57:07'),
(255, 'Procurement', 11, 'active', '2025-03-01 20:57:07', '2025-03-01 20:57:07'),
(256, 'Clearing', 11, 'active', '2025-03-01 20:57:07', '2025-03-01 20:57:07'),
(257, 'Warehouse', 11, 'active', '2025-03-01 20:57:07', '2025-03-01 20:57:07'),
(258, 'Gems', 29, 'active', '2025-03-02 21:28:08', '2025-03-02 21:28:08'),
(259, 'Jewelry', 29, 'active', '2025-03-02 21:28:08', '2025-03-02 21:28:08'),
(260, 'Diamond', 29, 'active', '2025-03-02 21:28:08', '2025-03-02 21:28:08'),
(261, 'Ticketing', 47, 'active', '2025-03-02 21:28:57', '2025-03-02 21:28:57'),
(262, 'Sales & Marketing', 47, 'active', '2025-03-02 21:28:57', '2025-03-02 21:28:57'),
(263, 'Management & Admin', 47, 'active', '2025-03-02 21:28:57', '2025-03-02 21:28:57'),
(264, 'Engineering & Maintenance', 47, 'active', '2025-03-02 21:28:57', '2025-03-02 21:28:57'),
(265, 'Airline Services', 47, 'active', '2025-03-02 21:28:57', '2025-03-02 21:28:57'),
(266, 'Cloud computing', 19, 'active', '2025-03-29 19:41:49', '2025-03-29 19:41:49'),
(267, 'Cloud Data Management', 19, 'active', '2025-03-29 19:41:49', '2025-03-29 19:41:49'),
(268, 'Cloud Storage', 19, 'active', '2025-03-29 19:41:49', '2025-03-29 19:41:49'),
(269, 'Cybersecurity', 19, 'active', '2025-03-29 19:41:49', '2025-03-29 19:41:49'),
(270, 'Salon', 20, 'active', '2025-03-29 19:44:17', '2025-03-29 19:44:17'),
(271, 'Beauty Professionals', 20, 'active', '2025-03-29 19:44:17', '2025-03-29 19:44:17'),
(272, 'Therapist', 20, 'active', '2025-03-29 19:44:17', '2025-03-29 19:44:17'),
(273, 'Vehicle Repair', 30, 'active', '2025-03-29 19:44:54', '2025-03-29 19:44:54'),
(274, 'Vehicle Assembly', 30, 'active', '2025-03-29 19:44:54', '2025-03-29 19:44:54'),
(275, 'Upgrade & Modify', 30, 'active', '2025-03-29 19:44:54', '2025-03-29 19:44:54'),
(283, 'Event Organizers', 38, 'active', '2025-03-29 19:49:09', '2025-03-29 19:49:09'),
(284, 'Event/Project Managers', 38, 'active', '2025-03-29 19:49:09', '2025-03-29 19:49:09'),
(285, 'Event/Project Planning', 38, 'active', '2025-03-29 19:49:09', '2025-03-29 19:49:09'),
(286, 'Entertainment', 38, 'active', '2025-03-29 19:49:09', '2025-03-29 19:49:09'),
(287, 'Technicians', 50, 'active', '2025-03-29 19:53:42', '2025-03-29 19:53:42'),
(288, 'Maintenance & Repair', 50, 'active', '2025-03-29 19:53:42', '2025-03-29 19:53:42'),
(289, 'R&D Activities', 37, 'active', '2025-04-29 14:58:22', '2025-04-29 14:58:22'),
(290, 'Lad Activities', 37, 'active', '2025-04-29 14:58:22', '2025-04-29 14:58:22'),
(291, 'Innovation & Idea Generation', 37, 'active', '2025-04-29 14:58:22', '2025-04-29 14:58:22'),
(292, 'Science', 37, 'active', '2025-04-29 14:58:22', '2025-04-29 14:58:22'),
(294, 'Any', 45, 'active', '2025-05-07 18:37:17', '2025-05-07 18:37:17'),
(295, 'Artificial Intelligence (AI)', 18, 'active', '2025-05-12 09:27:02', '2025-05-12 09:27:02'),
(296, 'Programming', 18, 'active', '2025-05-12 09:27:02', '2025-05-12 09:27:02'),
(297, 'Robotics', 18, 'active', '2025-05-12 09:27:02', '2025-05-12 09:27:02'),
(298, 'Games', 33, 'active', '2025-05-12 09:30:55', '2025-05-12 09:30:55'),
(299, 'Creations', 33, 'active', '2025-05-12 09:30:56', '2025-05-12 09:30:56'),
(300, 'Promotion & Sale', 33, 'active', '2025-05-12 09:30:56', '2025-05-12 09:30:56'),
(301, 'Video Animations', 33, 'active', '2025-05-12 09:30:56', '2025-05-12 09:30:56'),
(302, 'Driver', 51, 'active', '2025-05-12 10:06:55', '2025-05-12 10:06:55'),
(303, 'Helper', 51, 'active', '2025-05-12 10:06:56', '2025-05-12 10:06:56'),
(304, 'House Maid', 51, 'active', '2025-05-12 10:06:56', '2025-05-12 10:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_conditions`
--

INSERT INTO `terms_and_conditions` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(3, 'Use of the Website', 'You must not use the website for any unlawful, unauthorized, or prohibited purposes. You are responsible for maintaining the confidentiality of your account credentials, including your username and password. You agree to provide accurate, current, and complete information during the registration process. You must be at least 16 years of age to use our website or create a user profile.', '2025-05-08 19:25:43', '2025-05-11 14:36:14'),
(4, 'Payments', 'We reserve the right to decline or cancel any payment at our sole discretion. This may include, but is not limited to, issues related to pricing errors, incorrect package information, technical issues, or suspected fraudulent activity. You agree to provide valid and up-to-date payment details and authorize us to charge the full amount, including any applicable taxes, to your selected payment method. All payment transactions are processed securely through trusted third-party payment gateways. JOBADS.LK does not store or have direct access to your complete payment information.', '2025-05-08 19:26:21', '2025-05-11 14:36:38'),
(5, 'Intellectual Property', 'All content and materials available on our website, including but not limited to text, images, graphics, logos, and branding, are the intellectual property of JOBADS.LK or its licensors. You may not reproduce, distribute, modify, or otherwise use any content from the website without obtaining prior written permission from JOBADS.LK.', '2025-05-08 19:26:51', '2025-05-11 14:36:54'),
(6, 'Limitation of Liability', 'In no event shall JOBADS.LK, its directors, employees, or affiliates be held liable for any direct, indirect, incidental, special, or consequential damages arising from your use of, or inability to use, the website.', '2025-05-08 19:27:35', '2025-05-11 14:37:27'),
(7, 'Amendments and Termination', 'We reserve the right to amend, update, or terminate these Terms and Conditions at any time without prior notice. It is your responsibility to review the Terms periodically to stay informed of any changes. Effective Date These Terms and Conditions were last updated on 25th April 2025', '2025-05-08 19:28:06', '2025-05-11 14:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `resume_file` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `nic_no` varchar(255) DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `portfolio_link` varchar(255) DEFAULT NULL,
  `social_links` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `title` text DEFAULT NULL,
  `referees` text DEFAULT NULL,
  `referees2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `name`, `email`, `phone_number`, `profile_image`, `password`, `resume_file`, `address`, `linkedin`, `summary`, `experience`, `education`, `skills`, `marital_status`, `date_of_birth`, `gender`, `nationality`, `nic_no`, `certifications`, `portfolio_link`, `social_links`, `is_active`, `title`, `referees`, `referees2`, `created_at`, `updated_at`) VALUES
(1, 'Sachitha Madhuranga Arachchi', 'Sachitha Madhuranga', 'sachithmaduranga2001@gmail.com', '0782020201', '1739863073.jpg', '$2y$12$m0oYFA8JUJTdWmF5W2FO5.F0pjgeYmYmL1FGMAGP.ie7363cd6T7m', 'resumes/cv_1_1742381484.pdf', '99/12 testingroad,testingtesttingroad', 'http://127.0.0.1:8000/profil', 'rdtyfhyjjhyfg uyitgujgu uytuyg yfguitgi uiguig', 'htgfchjgfujkgk ukhilh', 'gnfhgkjgjkg', '<p>nbfhjgjgkj</p>\r\n<ul>\r\n<li>fhyfyjfyjy</li>\r\n<li>yfujfu</li>\r\n<li>giugui</li>\r\n<li>\'ytutuit</li>\r\n<li>ugiuygh</li>\r\n</ul>', 'Single', '2001-10-29', 'Male', 'Sri Lanka', '20013843849', '<ul>\r\n<li>fgreggrth</li>\r\n<li>rthgytrjhtyuj</li>\r\n<li>styrtu7t</li>\r\n<li>4tre5yt6ry</li>\r\n<li>&nbsp;</li>\r\n</ul>', 'http://127.0.0.1:8000/profile', 'http://127.0.0.1:8000/profile', 1, '<p>Bsc(Hons)</p>', '<ul>\r\n<li>&nbsp;XXXXX Name,&nbsp;<br>Partner - Deloitte Sri Lanka, &nbsp;<br>100, Braybrooke Place, Colombo&nbsp;<br>2, Sri Lanka.&nbsp;<br>Email: nameXXX@deloitte.com &nbsp;<br>TP: +94 77 00000000</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '<ul>\r\n<li>&nbsp;Mr. XXX Name &nbsp;<br>Assistant General Manager,&nbsp;<br>XXXXXX Bank, Head Office,&nbsp;<br>No 200, Galle Rd, Colombo 4,&nbsp;<br>Sri Lanka.&nbsp;<br>Email : Namexxx@gmail.com&nbsp;<br>Mobile : +94770000000 &nbsp;</li>\r\n</ul>', '2025-01-23 11:06:19', '2025-03-19 14:51:25'),
(2, NULL, 'kavidu malshan kulathunga kulathunga arachchige', 'kavidu@gmail.com', '0719707610', '1738606184.png', '$2y$12$MZ/BO3/yXz6bLVZzVBIoIuxgMn6tW3v3FAkPe0dWT2y/8piFBICR6', NULL, 'F/16,Delpathdeniya', 'https://www.linkedin.com/in/kavidumkulathunga/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-01-28 22:42:17', '2025-02-03 23:09:44'),
(3, NULL, 'kavindu', 'kavindu@gmail.com', '0724569872', '1739878909.jpeg', '$2y$12$jjhCY6DCzLPd4YIzsdTNY.bGtYAxccNkunsQcuEdt.0rZFCv1ZXu2', NULL, 'Pitigala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-01-29 09:45:34', '2025-02-18 16:43:46'),
(4, 'Hewa Mudalige Jeewan Surendra Gunawardana', 'Jeewan Surendra Gunawardana', 'Jeewan@jsgceylon.lk', '0771788080', '1739198876.jpg', '$2y$12$5AH4b3e7gsNn3kqGwewpg.dL.f5VNcPHLoI3qCKGiPlsSDW4oTaX.', NULL, 'No 156/1/A, Kaduwela Road, Athurugiriya', NULL, NULL, NULL, 'Chartered Accountancy', '<p>Accounting &amp; Finance</p>\r\n<p>Financial Accounting</p>\r\n<p>Working Capital Management&nbsp;</p>\r\n<p>Client Relationship Management</p>\r\n<p>Financial Analysis &amp; Decision Making&nbsp;</p>\r\n<p>Internal Controls and Operational Management</p>\r\n<p>Taxation&nbsp;</p>\r\n<p>Sales &amp; Marketing</p>\r\n<p>Human Resource Management&nbsp;</p>', 'Married', '1987-07-19', 'Male', 'Sri Lankan', '198720100548', '<p>MS Office &amp;&nbsp;PPT</p>\r\n<p>Dip in Web Development</p>\r\n<p>Dil in Data Science&nbsp;</p>\r\n<p>SAP Business One</p>\r\n<p>Sage System</p>\r\n<p>&nbsp;</p>', NULL, NULL, 1, '<p>Group CFO</p>\r\n<p>ACA, CIMA, ACMA, MBA (UK -Merit), Phd (Strategic Mgt - Reading)</p>', '<p>Mr. Thivanka Jayasinghe,&nbsp;</p>\r\n<p>Partner - Deloite Sri Lanka&nbsp;</p>\r\n<p>Colombo 02, Sri Lanka</p>\r\n<p>Mobile : 0777 1234456</p>\r\n<p>Email&nbsp; &nbsp;: <a href=\"mailto:thivank@deloite.com\">thivank@deloite.com</a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '<p>Mr. Dimuthu Suranjana,&nbsp;</p>\r\n<p>AGM - Risk &amp; Control,</p>\r\n<p>NSB Bank, Colombo 02, Sri Lanka</p>\r\n<p>Mobile : 0777 1234456</p>\r\n<p>Email&nbsp; &nbsp;: <a href=\"mailto:thivank@deloite.com\">thivank@deloite.com</a></p>\r\n<p>&nbsp;</p>', '2025-01-29 19:37:48', '2025-03-08 03:15:07'),
(5, NULL, 'dinithi thisarangi', 'dinna123@gmail.com', '0715889256', NULL, '$2y$12$tEDCbk2sKMBoAsNr6jT0lOSYkQSDD6FytIgELGpLeASVn7GjDvn6e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-01-30 11:32:11', '2025-01-30 11:32:11'),
(6, NULL, 'Himasha Hirushan', 'himashahiru921@gmail.com', '0776655432', NULL, '$2y$12$0MwA2RWUAeBeZj.XXW7qTejK2pv/VwmM0Fd3abNz1mA2ZtlZqpSzq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-01-30 12:56:12', '2025-01-30 12:56:12'),
(7, NULL, 'tsJgYquDBpk', 'Randy9Austin6375@gmail.com', '3759427819', NULL, '$2y$12$qJNDjVHd48l3ajN1n1uJs.g6Kc3m094dkNsP0QqO1MOr.B2QPlksm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-01-30 19:40:37', '2025-02-10 19:43:19'),
(8, NULL, 'LKPCNurOx', 'eibruschi@yahoo.com', '9107034651', NULL, '$2y$12$ul55aDNHbjacqMGADQXuQuAP5x509ZU.q27D4HSw5TonEh1LVHcKC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-02-01 06:28:19', '2025-02-10 19:43:05'),
(9, NULL, 'IOrocyWCAjgqDcU', 'kosabibuqi76@gmail.com', '4156641149', NULL, '$2y$12$QkstCrFqHiuTIORLSgHzruqdo7GqnE0AW9kYu9axS2PgpM7yCA/6y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-02-02 05:46:54', '2025-02-10 19:42:58'),
(10, NULL, 'NlYujPBzTGwS', 'erugiqawoqe284@gmail.com', '8770333757', NULL, '$2y$12$us7pMWUQkGYhaWPiyS/5a.U9565mfA9jHSOTAuJi.3Z06v/phlpxG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-02-03 02:50:49', '2025-02-10 19:42:52'),
(11, NULL, 'dinithi thisarangi', 'dinna1234@gmail.com', '0715889256', '1739773767.webp', '$2y$12$6rhrDd2qcN7htpc03swEVeFsYcLYI/cEVOjdQ0Qeo.ANZTRfR3/nO', NULL, '26,hokandara road, thalawathugoda', 'https://www.linkedin.com/in/rashmi-sewwandi-743420225/', NULL, 'Associate Software Quality Assurance Engineer', 'SITC Campus', '<p>Software quality</p>\r\n<p>software testing</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, '<p>professional diploma in project management</p>\r\n<p><a href=\"https://www.udemy.com/certificate/UC-23786be5-4890-4439-9b75-6e519a9eed1d/\">https://www.udemy.com/certificate/UC-23786be5-4890-4439-9b75-6e519a9eed1d/</a> - Udemy</p>', NULL, NULL, 1, NULL, NULL, NULL, '2025-02-03 09:01:26', '2025-02-17 11:29:27'),
(12, NULL, 'qoiQEUMU', 'auobsidianeaglyphua@gmail.com', '4946454149', NULL, '$2y$12$NUxNFDh.hsiM5AM66qr8tOGVvh4eTDgs7g2XfU.0yhsI0ij3xwRBm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-04 04:29:42', '2025-02-04 04:29:42'),
(13, NULL, 'oORIphxfiLLNG', 'obsidianoepinnacle@gmail.com', '7444299266', NULL, '$2y$12$P5vzDDJDXCCYBY3gg2zATeQH66lZqhUaPyLCgSMEWyqkqfTQt3EEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-05 05:15:48', '2025-02-05 05:15:48'),
(14, NULL, 'QHiivfxHuXTz', 'stellariu2quartz@gmail.com', '3623260683', NULL, '$2y$12$Z6dPv0QpXScSlVfOw67HJO6vuumMhcnIaMFoTNfNz1o40bTvlcPwi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-06 04:25:06', '2025-02-06 04:25:06'),
(15, NULL, 'ajjUEViug', 'crescentai64oracle21ay@gmail.com', '2427718869', NULL, '$2y$12$/IAdCkrhrRWNIy3L3mUXJO.1m0h99VDHa982z5q1apScqh9m9niQi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-07 04:44:17', '2025-02-07 04:44:17'),
(16, NULL, 'snXSFcuE', 'illuminateay72horizon96@gmail.com', '4588809914', NULL, '$2y$12$e9EGgOHbDcFKucw3oR948.Jfrm4lglhNMs17rRqlXm4RYjJ57jFou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-08 13:10:51', '2025-02-08 13:10:51'),
(17, NULL, 'Priyangika Dissanayake', 'priyangikadissanayake1997@gmail.com', '0702032966', '1739201737.jpeg', '$2y$12$InPFBhmlgzOU97quuQ2dGuqyNf7NrDuYYs5a.bXrqKb8Zm7iZCO.q', NULL, 'No. 107, Moragolla janapadaya, Nugaliyadda, Thalathuoya, Kandy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-10 19:52:37', '2025-02-10 20:35:37'),
(18, NULL, 'HKNBSjIil', 'vishjaxtkp@yahoo.com', '7366206968', NULL, '$2y$12$nwEgXGqGIX9o4cl5Vjln9.3Aa9vJMmNSWzET//YtDCSmE5MVQpUjy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-11 13:55:28', '2025-02-11 13:55:28'),
(19, NULL, 'Jeewan Surendra Gunawardana', 'surendra@jsgceylon.lk', '0777580451', '1739880676.jpg', '$2y$12$jxZP69ucLXD84X6K3RrX6OMixqB8gamjPyJg6E.RjPl.3DVNWm5CK', NULL, 'No 592, Kauwela Road, Athurugiriya', NULL, NULL, NULL, 'ACA,CIMA,ACMA,CPM,MBA\r\nPhd (Stg mgt - Reading)', '<ul>\r\n<li>Team Work &amp; Leadership Skills</li>\r\n<li>Financial Accounting</li>\r\n<li>Management Accounting</li>\r\n<li>Working Capital managements&nbsp;</li>\r\n<li>Internal Controlls and Operational management&nbsp;</li>\r\n<li>Tax management&nbsp;</li>\r\n<li>Sales &amp; marketing</li>\r\n<li>Human Resource Management&nbsp;</li>\r\n</ul>', NULL, NULL, NULL, NULL, NULL, '<ul>\r\n<li>Chartered Accountancy (SL)</li>\r\n<li>MBA (Merit - UK)</li>\r\n<li>BSc Adminstration</li>\r\n<li>CIMA (UK)</li>\r\n<li>Dip in AI &amp; Data Science&nbsp;</li>\r\n</ul>', NULL, NULL, 1, NULL, '<p>Mr. Thivanka Jayasinghe,</p>\r\n<p>PwC Sri Lanka,</p>\r\n<p>Brakebrook Place,</p>\r\n<p>Colombo 02.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '<p>Mr. Dimuthu Suranjana,&nbsp;</p>\r\n<p>DGM - Risk Management,</p>\r\n<p>National Saving Bank,</p>\r\n<p>Colombo 03, Sri Lanka.</p>', '2025-02-13 20:13:51', '2025-03-19 19:59:28'),
(20, NULL, 'lmXmbTULkCuNX', 'uwizoles96@gmail.com', '7172580837', NULL, '$2y$12$dJdz9yzxoTY7ZTNl4qJB5emuwImGG2qLfzF8gIkzJWHOg8f9Okgc.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-14 06:13:09', '2025-02-14 06:13:09'),
(21, NULL, 'Testin', 'testinguser@gmail.com', '0772020002', NULL, '$2y$12$Zm6WwXsMnkW/e/YQaLqXEOkCMzA64xqS/Cesdmbn6GqlqCdjIftcm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-14 09:29:05', '2025-02-14 09:29:05'),
(22, NULL, 'dtHPIfuNxrVrYS', 'dawsonmonisa2@gmail.com', '2422602713', NULL, '$2y$12$q8WN0kcXFIv8TpLekFKsuuW9XUFAhakhgDWGtiPdiBCqZFi.7WSM6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-15 20:38:36', '2025-02-15 20:38:36'),
(23, NULL, 'cUaJdrFt', 'tloveib6@gmail.com', '8527654433', NULL, '$2y$12$ff8f8wnj687jtwwlwXdIA.rpKcWXjc8WI6fUfo6/ywS7LmH4zT.Ce', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-16 12:19:04', '2025-02-16 12:19:04'),
(24, NULL, 'jAwXritaeykx', 'howerorpo@gmail.com', '2827215947', NULL, '$2y$12$aSx2EzQm9ufvELOkMuaGq.DeDLbcny8oTj9f0aA.6Vy3WP2kP91b6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-17 04:51:42', '2025-02-17 04:51:42'),
(25, NULL, 'hasarangi perera', 'hasarangi@gmail.com', '0714558268', '1739865791.webp', '$2y$12$Uh4cVRM6fm5GaVtLL936yeo5d4SUtE7l0XtkCXeWG9VRU0D22a1e2', NULL, '34/8 Kadawatha', 'https://www.linkedin.com/hsarangi/743420225/', 'Detail-oriented and highly skilled software engineer with 3+ years of experience in developing scalable web applications. Proficient in Python, JavaScript, and cloud computing technologies such as AWS and Azure. Strong background in full-stack development, database management, and UI/UX design. Successfully led a team in launching a SaaS platform, improving user engagement by 40%. Passionate about innovative solutions and improving system performance. Seeking a challenging role in a tech-driven company to leverage my expertise in software development and problem-solving.\"', 'software engineer with 3+ years of experience in developing scalable web applications.', 'SITC Campus', 'Programming Languages: Python, Java, C++, JavaScript\r\nWeb Development: HTML, CSS, React, Node.js\r\nDatabase Management: MySQL, PostgreSQL, MongoDB\r\nCloud Computing: AWS, Azure, Google Cloud\r\nCybersecurity & Networking\r\nData Analysis & Machine Learning', NULL, NULL, NULL, NULL, NULL, 'Google IT Support Professional Certificate (Coursera)\r\nAWS Certified Solutions Architect', 'https://github.com/', 'https://www.linkedin.com/\r\nhttps://www.behance.net/', 1, NULL, NULL, NULL, '2025-02-17 13:33:17', '2025-02-18 13:04:24'),
(26, NULL, 'rashmi', 'rashu@gmail.com', '0768622299', '1739792285.png', '$2y$12$41sTNYrceDhT1sHizk0yO.XQIfZCa7xwxpI.4C6NaHt3/vGaCbPqW', NULL, 'colombo', NULL, 'non', '5 years', 'AAA', '<p>A<br>A<br>A<br>A<br><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-17 15:26:05', '2025-02-17 16:38:05'),
(27, NULL, 'LfqyosDbCHULd', 'stripaylad1993@gmail.com', '4312377499', NULL, '$2y$12$CmfiegFQtSm3/ApRo5Xm/uSBujF0I/IdxNS9ZuewIttTEjtEn0mMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-18 05:32:55', '2025-02-18 05:32:55'),
(28, NULL, 'zfcKSjZzC', 'okguewsfmlmsecsa@yahoo.com', '9064532049', NULL, '$2y$12$Tq4giPmVgWBHTUg0WDEkPeVNIvyMcjnHlc6ZLcgoAnhfPzXab8/GK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-19 13:24:30', '2025-02-19 13:24:30'),
(29, NULL, 'YKmPhetpJhfCS', 'illuminateoexenon@gmail.com', '2539800437', NULL, '$2y$12$4p.n/BfT/PNhuc1BD5XmleXhsOg6EfNCMbPA72FuDavwdtCFUi4R.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-20 14:56:03', '2025-02-20 14:56:03'),
(30, NULL, 'HqESCEqCbfBrFR', 'rayanwatkinsu@gmail.com', '5171623654', NULL, '$2y$12$uSh/aNUaoOhq22nBF7QqmOPMoAo/D0AQNnN/NuPB8Jp8Q0rHpUqB6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-02-21 13:50:49', '2025-02-21 13:50:49'),
(31, 'Dinithi Thisarangi Perera', 'dinithi perera', 'dinithi@gmail.com', '0768622255', '1740553375.webp', '$2y$12$//azC2uXQvYk8EKpUJ9g3e5fiu19Fxnx/9Mzzx7ilLYJ7k9OE2oGC', 'resumes/cv_31_1742365812.pdf', 'No 262 , Hokandara rode\r\nThalawthugoda', NULL, 'A highly motivated and detail-oriented individual with a strong passion for [industry/field]. Proven skills in [relevant skills] with experience in [mention experience]. Seeking a challenging position to utilize my skills and contribute to organizational success.', 'Group CFO\r\nFairway Holdings (Pvt) Ltd\r\nOct 2022 - Feb 2025\r\nCurrently working as the GCFO and overlooking the Group Finance activities, Give\r\nrecommendations & suggestions to strategic decisions, sustainable growth and expansion\r\nof the group operation. Maintain good relationship with bankers to manage loan portfolio\r\nand working capital requirements.\r\n\r\nFinance Controller\r\nBeijing Enterprises Water Group Limited\r\nApr 2022 - Oct 2022\r\nDue to bad Economic conditions in Sri Lanka, Government and China Parent company\r\nhas decided to stop Sri Lankan operation', '💼 Intern - IT Support\r\nABC Solutions Pvt Ltd | Jan 2024 - Present\r\n\r\nAssisted in troubleshooting technical issues\r\nManaged database and system updates\r\nProvided customer support for software solutions\r\n💼 Freelance Graphic Designer\r\nSelf-Employed | 2022 - 2023\r\n\r\nCreated digital graphics and branding materials\r\nDesigned social media content for clients', '<p style=\"text-align: left;\">Graphic Design (Photoshop, Illustrator)<br data-start=\"1599\" data-end=\"1602\">Web Development (HTML, CSS, JavaScript)<br data-start=\"1643\" data-end=\"1646\">Teamwork &amp; Communication<br data-start=\"1672\" data-end=\"1675\">Problem-Solving &amp; Critical Thinking</p>', 'Single', '2004-06-02', 'Female', 'Sri Lankan', '200452268755', '<p><strong data-start=\"1759\" data-end=\"1794\">Google IT Support Certification</strong> (2023)</p>\r\n<p><strong data-start=\"1807\" data-end=\"1838\">Adobe Photoshop Masterclass</strong> (2022)</p>', NULL, 'https://www.linkedin.com/\r\nhttps://twitter.com/', 1, '<p>Bsc</p>', '<p>Nimanthi perera</p>\r\n<p>Manager</p>\r\n<p>HNB Bank , colombo</p>\r\n<p>+94 754822246</p>', '<p>Nimanthi perera</p>\r\n<p>Manager</p>\r\n<p>HNB Bank , colombo</p>\r\n<p>+94 754822246</p>', '2025-02-26 11:15:36', '2025-03-19 10:36:36'),
(32, NULL, 'sripali erandi chandrasekara yapa', 'sripalierandi655@gmail.com', '0764220439', NULL, '$2y$12$oMAptK1OUOBZQYYgLd0KCOgqphnZyzdD86kD9k2YJgP2lqTC426bS', NULL, 'gurubewlahena, siyambalagoda, ehala-ainagama, pitabeddara', NULL, 'Project Coordinator', '1 year', 'Degree holder', '<p>\"Experienced in project coordination, managing tasks, timelines, and resources to ensure successful project delivery. Skilled in stakeholder communication, requirement gathering, and maintaining project documentation. Proficient in using project management tools like Jira and Trello to track progress and resolve issues efficiently. Strong problem-solving abilities with a focus on risk assessment and process improvement to enhance workflow efficiency.\"</p>', NULL, NULL, NULL, NULL, NULL, '<p>BIT(HONS)NETWORKING AND MOBILE COMPUTING DEGREE</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'https://www.linkedin.com/in/sripali-erandi-003a5224a/', 'https://www.linkedin.com/in/sripali-erandi-003a5224a/', 1, NULL, '<p>MR.daminda herath&nbsp;</p>\r\n<p>faculty of computing&nbsp;</p>\r\n<p>horizon campus</p>', NULL, '2025-02-26 11:50:42', '2025-02-26 11:56:11'),
(33, NULL, 'Harsha', 'harshaviduranga91@gmail.com', '0777709378', NULL, '$2y$12$cD.PdmqASGVWc07JalnecOTETCGyYTLp14DvlsmXFqO19L/G7570m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-05 19:45:10', '2025-03-05 19:45:10'),
(34, NULL, 'Susantha Bandara', 'awgs.bandara398@gmail.com', '0778507333', NULL, '$2y$12$QIskonaOZZPUGbN7AgzYW.J.BuLDoCMDvxRbc1cyA42MGuXU8GYAy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-07 12:40:37', '2025-03-07 12:40:37'),
(35, 'Hunkiri mudiyanselage hashan bandara thilakarathne', 'Hashan Thilakarathne', 'thilakarathneh466@gmail.com', '0714716804', '1741408423.jpg', '$2y$12$QJCVLv/NKHYzDidpdXVRMuTflAcxz4TD7RQc8IpfOibexc6yb5dU2', 'resumes/hAC4dhK4CY0acQyyPWGIC2VYsAhxsBa6G3HmuKWC.pdf', 'No.58/C kandewela,marassana', 'https://www.linkedin.com/in/hashan-thilakarathne-203498352?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app', 'To be dynamic professional working in a challenging envarament that \r\nwould enable me to enhance and utilze my skills and abilities and self –\r\ndevelopment and career progression in the field of the same Able \r\ninterview or as part of a team and have a good leadership and \r\nmanagement skill.', 'Keells super market and laugfs super merket  cashier point worked in 06  month', 'graduate', '<ul>\r\n<li style=\"font-weight: bold;\"><strong>Good Communication Skills </strong></li>\r\n<li style=\"font-weight: bold;\"><strong>Creative </strong></li>\r\n<li style=\"font-weight: bold;\"><strong>Leadership Skills </strong></li>\r\n<li style=\"font-weight: bold;\"><strong>Presenting Skills&nbsp;</strong></li>\r\n</ul>', 'Single', '2003-12-13', 'Male', 'Sri lankan', '200334812289', '<p><strong>Certificate Course in Media Studies, Dubbing &amp; News Presenting </strong></p>\r\n<p><strong>by the SL MEDIA ACADEMY (Distinction) </strong></p>\r\n<p>February 2023 - September 2023</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Certificate Diploma in Information Technology, Studies Computer </strong></p>\r\n<p><strong>Technology by the IMD Campus. </strong></p>\r\n<p>August 2024 &ndash; December 2024</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Certificate Diploma in English, English Teaching Training Studies </strong></p>\r\n<p><strong>by the LPEC Campus. </strong></p>\r\n<p>January 2025</p>\r\n<p>&nbsp;</p>', NULL, NULL, 1, NULL, '<p>Mr. Aruna Lakshan Abatvikrama</p>\r\n<p>Government Teacher in K/ Marassana National School ,</p>\r\n<p>Marassana</p>\r\n<p>076 5794369&nbsp;</p>', NULL, '2025-03-08 09:17:20', '2025-03-08 09:33:43'),
(36, NULL, 'Gayan wijesinghe', 'srimalwijesinghe1990@gmail.com', '0705947140', NULL, '$2y$12$EhZEbegRCuXTXCh3KuvdNOZ0rtanui9TDrYACZbzk1A6AYNOfTGw6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-08 16:29:14', '2025-03-08 16:29:14'),
(37, NULL, 'Dulara Jayasanka', 'dularajayasanka900@gmail.com', '0720837370', NULL, '$2y$12$QMr/UCGT9GSyJ18MLdyd8eoXP6d0q4GuzexG3chaEzXmaFqkk8fHe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-09 16:35:36', '2025-03-09 16:35:36'),
(38, NULL, 'Apeksha Dissanayake', 'hiruapeksha425@gmail.com', '0715843383', NULL, '$2y$12$mkWp6WXSqWHRM/on8u/mku37JvVMyf6QUoV1Ntrx/yfsOVX6w42XC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-09 18:02:04', '2025-03-09 18:02:04'),
(39, NULL, 'Akila', 'lakshaniakila00@gmail.com', '0789712651', NULL, '$2y$12$SDlMJBaaP83juNxieZk/kul9QZ1E3PHr1V8FOgX2gZ6aW.AZ9.uTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-10 14:49:29', '2025-03-10 14:49:29'),
(40, NULL, 'ravishani wijendra', 'ravishaniwijendra@gmail.com', '767075973', NULL, '$2y$12$rl9sZcAhFD8TI3bCXuJ3.ugcr9/fkZi4RG5xUG0WGYRyd5d.DmWI.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-11 15:21:36', '2025-03-11 15:21:36'),
(41, NULL, 'Chamadi Amasha Wimalarathna', 'chamadiamasha@gmail.com', '0740767204', NULL, '$2y$12$TwPmyJA21G2ywzaBayhM6.NeK7Ajrc8//qrZDEUdIxhNlqjD.HVjy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-12 19:59:02', '2025-03-12 19:59:02'),
(42, NULL, 'Dulanka Dissanayaka', 'dshehani99@gmail.com', '0717410838', NULL, '$2y$12$fhXBgpVTMyBoetvBDriG5eHPkbkOeyV/U/0QiujDQv84JklzuiDny', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-13 10:06:48', '2025-03-13 10:06:48'),
(43, 'Hasara Maligaspe Jayakodi', 'Hasara Maligaspe', 'abcge@gmail.com', '0768965787', '1742375468.jpeg', '$2y$12$lnf3OX/oQE8cGzexjcB4ke0D2fQE0k5f/cDZeYLCITxFLVZ4Osqx.', NULL, 'no 15, kuruppu road, borella,colombo,sri lanka.', 'https://www.linkedin.com/in/hasara-maligaspe-0b35a3280/', 'Results-driven Software Engineer with 5+ years of experience in full-stack web development. Skilled in React, Node.js, and Laravel, with a strong background in cloud-based solutions and database management. Passionate about building scalable applications and optimizing performance.', 'Software Engineer\r\n\r\nABC Tech Solutions, City, State | Jan 2020 – Present\r\n\r\nDeveloped and maintained web applications using React, Node.js, and PostgreSQL.\r\n\r\nLed a team of developers in designing RESTful APIs and integrating third-party services.\r\n\r\nImproved application performance by 30% through optimization and refactoring.\r\n\r\nJunior Developer\r\n\r\nXYZ Innovations, City, State | Jun 2017 – Dec 2019\r\n\r\nAssisted in developing e-commerce applications using Laravel and Vue.js.\r\n\r\nImplemented authentication and authorization mechanisms to enhance security.\r\n\r\nDebugged and resolved performance bottlenecks in existing systems.', 'Bachelor of Science in Computer ScienceUniversity of Technology, City, State | Graduated: 2017', '<ul data-spread=\"false\" data-pm-slice=\"3 3 []\">\r\n<li>\r\n<p>Programming Languages: JavaScript, PHP, Python</p>\r\n</li>\r\n<li>\r\n<p>Frameworks &amp; Libraries: React, Node.js, Laravel, Vue.js</p>\r\n</li>\r\n<li>\r\n<p>Database Management: MySQL, PostgreSQL, MongoDB</p>\r\n</li>\r\n<li>\r\n<p>DevOps &amp; Cloud: AWS, Docker, CI/CD Pipelines</p>\r\n</li>\r\n<li>\r\n<p>Version Control: Git, GitHub, Bitbucket</p>\r\n</li>\r\n</ul>', 'Single', '2001-07-06', 'Male', 'sri lankan', '200132466789', '<ul data-spread=\"false\" data-pm-slice=\"3 3 []\">\r\n<li>\r\n<p>AWS Certified Solutions Architect &ndash; Associate</p>\r\n</li>\r\n<li>\r\n<p>Laravel Certified Developer</p>\r\n</li>\r\n<li>React &nbsp;Certified Developer</li>\r\n</ul>', NULL, 'github.com/johndoe \r\ntwitter.com/johndoe', 1, '<p>Bsc</p>', '<h4 data-pm-slice=\"1 1 []\">Sarah Johnson</h4>\r\n<p>Senior Software Engineer, XYZ Innovations<br>Email: <a>sjohnson@xyzinnovations.com</a><br>Phone: (654) 321-0987</p>', '<h4 data-pm-slice=\"1 1 []\">Sarah Johnson</h4>\r\n<p>Senior Software Engineer, XYZ Innovations<br>Email: <a>sjohnson@xyzinnovations.com</a><br>Phone: (654) 321-0987</p>', '2025-03-19 12:50:53', '2025-03-26 10:14:40'),
(44, NULL, 'Nishantha', 'nuswatha@gmail.com', '0762912318', NULL, '$2y$12$eUyh2dyMBkXiKTAXqIwZ4.rZmNvK.17bE7OzZbZ9gjE4eBNRZ62kS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-20 09:25:46', '2025-03-20 09:25:46'),
(45, NULL, 'K.D.suranga ruwan kumara', 'shashikaruklanthi@gmail.com', '0716596021', NULL, '$2y$12$P1OmFG2ZBiqDy51wM3fy2eC.wZZfZvzMQKhBjk0RN77Swn7QOQJrS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-22 07:12:16', '2025-03-22 07:12:16'),
(46, NULL, 'Imesha perera', 'imaperera6@gmil.com', '0713868263', NULL, '$2y$12$nR835jdcBVluUM1bXFzrFeixcfiNRjStmriswwAYUtBI8Gb1tDoqW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-22 20:36:09', '2025-03-22 20:36:09'),
(47, NULL, 'Lahiru gimhana', 'lahirugimhana117@gmail.com', '0764072829', NULL, '$2y$12$zb6iuaGgQJQ3K00lEGI.ueKPhDmWGf1gt4dI0EXTqrQroLv13Y.W6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-23 21:20:42', '2025-03-23 21:20:42'),
(48, NULL, 'Mohamed Irham Yoosuf Issadeen', 'yimirham@gmail.com', '0773388433', NULL, '$2y$12$Ng1YDjLdw85VISHdrQXplur5FvL1th8nQ2DRnVRRMBJrxbjjbsQVa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-24 00:18:26', '2025-03-24 00:18:26'),
(49, NULL, 'Samandi Nimsara', 'samandinimsara@gmail.com', '0778544975', NULL, '$2y$12$SuXwgcWoZgCodAc98pNVxeoH48RS.ZuAdJJgAZyN19iC4DGiM3xZS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-24 09:08:22', '2025-03-24 09:08:22'),
(50, NULL, 'Maliyadde Rallage Sasidu Dilshan Bandara Maliyadda', 'sasindumaliyadda@gmail.com', '0705565492', NULL, '$2y$12$2Aj/WkhTkpK8IW5sAkiuSegWbMLbig3WD80iH7zgiNlCHHjKZfgqK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-24 17:34:19', '2025-03-24 17:34:19'),
(51, NULL, 'Thilina Madushanka', 'Kdtmadusanka@gmail.com', '0714054778', NULL, '$2y$12$zYV8RwY6HBxn5Y8gqIg3oebUMW6pdTRFDXqYkBy4eeKS3nm5Rz236', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-24 17:57:46', '2025-03-24 17:57:46'),
(52, 'Meepe palagate gedra Nethmini Laknadee', 'M.G Nethmini Laknadee', 'nethulaknadee@gmail.com', '0741509153', NULL, '$2y$12$mJ4nW6iXLollY11FpWbAOe4Zg2GSzHyaZPbspNvZmLQ7DwAOZA6em', NULL, 'No.77/A kadugoda Rd,pahala kosgama,kosgama', NULL, NULL, NULL, 'UnUndergraduate', NULL, 'Single', '2001-11-16', 'Female', 'Sinhala', '200182100792', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-25 11:19:23', '2025-03-25 11:24:20'),
(53, NULL, 'MD  Suresh', 'mdmdmd@gmail.com', '0770722865', NULL, '$2y$12$RBK00W1l7bhDFzU8DwdnXeGVTyiCVAaI6ph0bCqD1LXoxuJCM/GQq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-25 11:19:56', '2025-03-25 11:19:56'),
(54, NULL, 'R.K Hareesh Gautham', 'hareeshgauthem1122@gmail.com', '765438997', NULL, '$2y$12$ializGPKK.GqG3Wvq3beLe6Oq9uAtwWl76KUWxyqq3QJLockB9Y2W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-25 17:23:55', '2025-03-25 17:23:55'),
(55, NULL, 'Milinda', 'vishvanathmilinda@gmail.com', '0752228474', NULL, '$2y$12$hD2m2zfCRFtxhQQ9GO0qHuACjTfZJ8gkJcLZwDjO6v9JZgsuaxCzm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-27 05:45:40', '2025-03-27 05:45:40'),
(56, NULL, 'Nilanga Nilanga', 'nilangachandimal1111@gmail.com', '0770714587', NULL, '$2y$12$UY4wRhE3mleecC3Psk.IUOy9tJlbl5joY.V/DufNzMLWAUiT2dEp6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-27 09:09:50', '2025-03-27 09:09:50'),
(57, NULL, 'Nethma Nishadi', 'nethmanisha18@gmail.com', '0769025902', NULL, '$2y$12$FGC.44qHPSNxvY1I4GUcIOU/j1SHIK6Yw1dubyRIro5hlp9M.oaey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-27 21:12:02', '2025-03-27 21:12:02'),
(58, NULL, 'L.D.Sampath Kumara', 'sampathkumara678@gmail.com', '0710749473', NULL, '$2y$12$pc9klSdpgt6KmZehT/ZBoeuE0Er7ohPK8WiVvXBEMnJ1ZUXJpl9HW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-28 10:34:52', '2025-03-28 10:34:52'),
(59, NULL, 'Dineth Kavindu', 'dinethkavindu2017@gmail.com', '0767614520', NULL, '$2y$12$GH1SLjNasnx1mAPmQ/rRROlcLJSYhp2FFH5aoTrw1OpNYfHlolAYy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-29 14:13:28', '2025-03-29 14:13:28'),
(60, NULL, 'Chamoda Chathumini', 'chamodachathumini2004@gmail.com', 'LK740427375', NULL, '$2y$12$2YBCGCVp/uchvqFhW.cLYufQG6U1lHHuo7wgpWE1t2FxSKbpq2xkO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-03-31 11:11:09', '2025-03-31 11:11:09'),
(61, NULL, 'Ranjith Pemakumara', 'm.r.pemakumara071@gmail.com', '0705212294', NULL, '$2y$12$Q/tBEByyUcpY.qmoQb8UW..yfWeoUQCFknpVqvvxJGiaHe/Ik0jYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-15 16:21:04', '2025-04-15 16:21:04'),
(62, NULL, 'Shana', 'shana.era@gmail.com', '741211921', NULL, '$2y$12$ZzGwh2NFqp5dve8sQhq5ZOuOw7UEPYRP4dE/5vryCJUUTjdHAedbm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-15 21:28:59', '2025-04-15 21:28:59'),
(63, NULL, 'Anjana', 'prabuddhaanjana125@gmail.com', '0713428078', NULL, '$2y$12$Qww3LSF8PEoxmt4LYuEbDeB0.8mz.58Q471jsjSIAbLYDyZyrYlJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-16 18:17:54', '2025-04-16 18:17:54'),
(64, NULL, 'Dewthilina Wijesooriya', 'dewthilinaw@gmail.com', '0783599634', NULL, '$2y$12$HlMKMH0mixX8pKPqPZmgxO2bUvDsXjE8JV6RUAva8U8a39sudbWcG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-17 15:06:35', '2025-04-17 15:06:35'),
(65, NULL, 'Sanjeewa Priyanga', 'priyangahps@yahoo.com', '0767786890', NULL, '$2y$12$xOfDsn.8r1OvUopMRoFu3uYJd1TaDYYuVpswUD8hUzEF3WNN5td8y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-18 21:14:29', '2025-04-18 21:14:29'),
(66, NULL, 'nuwan roxx', 'nuwan13live@gmail.com', '0750910338', NULL, '$2y$12$4Fd3KBa.rXRigczMSPdOQeLn6QclNph189uUjgoz61rvd2qUkxh4.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-19 06:59:59', '2025-04-19 06:59:59'),
(67, NULL, 'S.Krishan', 'skkrishan08@gmail.com', '0753797498', NULL, '$2y$12$PapDl8Ob3tUi1YcmjwrJieT98bT5jfv69Y5ezgWmMTLHFKlGD3wp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-19 17:17:53', '2025-04-19 17:17:53'),
(68, NULL, 'Theja samarasinghe', 'thejasamarasinghe1111@gmail.com', '0703882624', NULL, '$2y$12$XkOmtaQtO7rTq8OZSH7eTuyvHrD.fxd6k2Hwq1JTKFNELtB3rCD0u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-20 09:13:26', '2025-04-20 09:13:26'),
(69, NULL, 'R.B.Dinesha sammani', 'Sammanidinesha7@gmail.com', '0778048547', NULL, '$2y$12$8Yru.Y/LFnCrCRv/T5mn0uO4bYiFnyz7LBhD47QEuGgroGrZgZrgW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-21 13:53:36', '2025-04-21 13:53:36'),
(70, NULL, 'Faheema Hassen', 'faheemafazil1996@gmail.com', '0770448724', NULL, '$2y$12$Rb.89Ononv47BbgPw3EfUOLGOMc6jXzg/igtTsGbKdkVOV6oi8R8u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-21 15:25:05', '2025-04-21 15:25:05'),
(71, NULL, 'Lanka Talent', 'sammani@lankatalents.lk', '0771788080', NULL, '$2y$12$dllVudo2Ut/rnSzXzCCN8uYrGlEigNnvzgmi3rp1XZquFbPuXMWo2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-21 19:36:07', '2025-04-21 19:36:07'),
(72, NULL, 'Ksdssaranga', 'damithasubasiri@gmail.com', '0783558086', NULL, '$2y$12$7zCddmNzo8cDXKS/p.6Fnuzf2ZplwUxgAnkgfRo5qCGUx3c8e8Tj2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-22 07:19:10', '2025-04-22 07:19:10'),
(73, NULL, 'Hasarangi Sayakkara', 'sayakkara07@gmail.com', '0778227611', NULL, '$2y$12$zjIur089g/vLxmFtd9cdVOvb2BzJdu0QY79WdlfkBuWEBgttWTiue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-24 11:37:45', '2025-04-24 11:37:45'),
(74, NULL, 'Sandali', 'sandalimendis2003@gmail.com', '0743479180', NULL, '$2y$12$En9MP8RVs2XRGA9.fd/.mOKYBou9JguDg/uo5Hw18WM.jfupYxqn6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-24 20:21:56', '2025-04-24 20:21:56'),
(75, NULL, 'Ahimsa Edirisinghe', 'edirisinghemlac@gmail.com', '0770401659', NULL, '$2y$12$mLVZY5WIYB7HT7UHOoc9te/IbnLgc3PWmBt8nEhegNb1ZCQxCa5FS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-25 16:58:00', '2025-04-25 16:58:00'),
(76, 'Hasarangi Sayakkara', 'Hasarangi Sayakkara', 'hasarangisachethana@gmail.com', '0778227611', NULL, '$2y$12$hCjtcuA2mIoc8FwoqlXuEudJ/utrga6BoGwWbkoSDOKAtLsDZY5IS', 'resumes/KiwRr2t0UImiZ0NNdVpA8069AWC5Dl2h7dVh6F2K.pdf', '72/7/4 Financewatta,Hathbodhiya ,Beliatta,Hambantota', NULL, 'Successfully completed University Proficiency in English level I,II and III.\r\n\r\nSuccessfully Completed Diploma in English\r\nExcellent English School, Tangalle, Sri Lanka.\r\n\r\nSuccessfully Completed Certificate in Computer Application- Youth Training\r\ncenter, Yayawaththa, Sri Lanka', 'Completed six month internship.\r\nSri Lanka Mahawei Authority, Office of Resident Project Manager , Walawa\r\nSpecial Area. Under the internship programe I\r\nConducted extension programs for farmers\r\nVisited filed to supervise the farmers\r\nCollected data from farmers who involve new projects\r\nconducted by Authority\r\nAnalyzing data and creating progress reports\r\nconducted some projects done by MASL\r\n\r\nSuccessfully completed research project under layer hen management as an\r\nundergraduate.\r\n\r\nAnd I have got one month  training  about SAP system as trainee Data entry Officer in keells supper.', 'completed my BSc. (Hons) in Agriculture Resource Management and Technology at the University of Ruhuna with a Second Class Upper Division. \r\n\r\nI passed Advance level in 2018 in biology stream with C passes for Biology & Chemistry and B pass for Agriculture \r\n\r\nI passed GCE ordinary level exam 2015 with 4 A passes & 5 B passes', '<p>Mangment skills&nbsp;</p>\r\n<p>Comuniction skill</p>\r\n<p>Critial thinking&nbsp;</p>\r\n<p>Team work&nbsp;</p>\r\n<p>Organizational skiils&nbsp;</p>\r\n<p>Time Managment skill&nbsp;</p>\r\n<p>MS office literacy ( excel,word, Powerpoint)</p>\r\n<p>&nbsp;</p>', 'Single', '2000-01-07', 'Female', 'Sinhala', '200050701157', '<p>.</p>', NULL, NULL, 1, NULL, NULL, NULL, '2025-04-27 08:44:42', '2025-04-27 09:12:17'),
(77, NULL, 'Miami Clothing (Pvt) Ltd', 'careers@bamholdings.com', '0771788080', NULL, '$2y$12$bopzJLTXm1XRt2pzXyyuD.Te/17m5AHBm4EXye.gJhPcazydlaagW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-29 14:34:36', '2025-04-29 14:34:36'),
(78, 'Wai Phyo Kyaw', 'Wai Phyo Kyaw', 'newdag2029@gmail.com', '09951050337', '1745948012.jpeg', '$2y$12$tNeXNSxKb5Xr1Nlnh.RMw.qjmbg7fm6lwd06hBy/x45km8/MAN7a.', 'resumes/vjLbzME0ohIk5mSLlmqiSmZ960RWw3oW5NrQB3Bm.pdf', 'Bago,Myanmar', NULL, 'I am a dedicated Electrical Engineer with over 5 years of professional experience in power distribution, industrial automation, and renewable energy systems. I hold a Bachelor’s degree in Electrical Engineering from PTU and have been involved in both public and private sector projects, managing electrical installations, PLC systems, and energy-efficient solutions.\r\n\r\nI am currently seeking international opportunities—particularly in Uzbekistan, Singapore, and Poland—where I can contribute my technical skills and continue growing in the field of engineering. I have advanced English proficiency and adapt well in multicultural environments.\r\n\r\nMy professional goal is to be part of innovative projects that focus on sustainable energy and smart infrastructure.\r\n- [ ]', 'Electrical engineer over 5Years', 'Electrical Engineer(Bachelor)', '<p>Electrical control</p>\r\n<p>Driving license&nbsp;</p>\r\n<p>Computer (Word,Excel,PowerPoint)</p>\r\n<p>physical strong</p>\r\n<p>matial-art(Karatae)</p>\r\n<p>problem solving</p>\r\n<p>Communication well</p>\r\n<p>&nbsp;</p>', 'Married', '1996-05-30', 'Male', 'Myanmar', '7/PaMaNa(N)176433', '<p>Electrical Design</p>\r\n<p>solar Design</p>\r\n<p>ACMV</p>', NULL, NULL, 1, '<p class=\"p2\"><span class=\"s1\">I am a dedicated Electrical Engineer with over 5 years of professional experience in power distribution, industrial automation, and renewable energy systems. I hold a Bachelor&rsquo;s degree in Electrical Engineering from PTU and have been involved in both public and private sector projects, managing electrical installations, PLC systems, and energy-efficient solutions.</span></p>\r\n<p class=\"p3\">&nbsp;</p>\r\n<p class=\"p2\"><span class=\"s1\">I am currently seeking international opportunities&mdash;particularly in Uzbekistan, Singapore, and Poland&mdash;where I can contribute my technical skills and continue growing in the field of engineering. I have advanced English proficiency and adapt well in multicultural environments.</span></p>\r\n<p class=\"p3\">&nbsp;</p>\r\n<p class=\"p2\"><span class=\"s1\">My professional goal is to be part of innovative projects that focus on sustainable energy and smart infrastructure.</span></p>\r\n<ul class=\"ul1\">\r\n<li class=\"li4\">&nbsp;</li>\r\n</ul>', NULL, NULL, '2025-04-29 21:21:13', '2025-04-29 21:33:32'),
(79, NULL, 'Fathima Fathima', 'nwra052001@gmail.com', '0782938084', NULL, '$2y$12$Ud.eO9L3fvGsXoAZBCAo5.Qza3QxS2fZFV.3VvimjlY0U.rJdhfZm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-30 06:41:03', '2025-04-30 06:41:03'),
(80, NULL, 'Mohamedjibry', 'malikjibry@gmail.com', '0777895724', NULL, '$2y$12$3Mj/ig8aupl.0/F5w88Z4.Nm0iVrdZT//EyYINikOVl7qK5SemCeq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-04-30 09:48:37', '2025-04-30 09:48:37'),
(81, NULL, 'Mohammed Safras', 'safrasammu1999@gmail.com', '0765288206', NULL, '$2y$12$ofhboeRSqbN679ufePmQaOKIL4s245TAJtD0/yIdxKsl6eUhyKiTK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-03 16:28:37', '2025-05-03 16:28:37'),
(82, NULL, 'Fidel', 'Jfidel135@gmail.com', '0752820992', NULL, '$2y$12$rm3ivQt88efKV5xvG0FwTOEL6uSr8A9GLPY5vL6LZ3uYOrXenah3e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-03 17:14:24', '2025-05-03 17:14:24'),
(83, NULL, 'Nishethi Perera', 'dnishethi@gmail.com', '0741559473', NULL, '$2y$12$B7Pqc4GDLPgVj8nZ0IhXk.NvEKyUWVH/b19Vw3MbsmT5xnwRLZMZO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-03 20:34:56', '2025-05-03 20:34:56'),
(84, NULL, 'Shashinika Aththanayaka', 'shashinikadilshani1215@gmail.com', '+94767530161', NULL, '$2y$12$XC4S0U0VgPHi2f9ncllpR.bMSERKjZ1l7Q6qii8XPW2/JlITWOh/i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-04 18:54:43', '2025-05-04 18:54:43'),
(85, NULL, 'Ashendra Silva', 'ashen85silva@gmail.com', '077899673', NULL, '$2y$12$hRo0Vqr0tF0Z3lNZm2LYuuICCiPDUljTOKa3ssCQizhLOaWmq2n0e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-05 01:43:02', '2025-05-05 01:43:02'),
(86, 'Jayasinghe Arachchige Asela Prasanna Appu', 'Asela Prasanna', 'aselaprasanna6@gmail.com', '+94772796058', '1746412143.jpg', '$2y$12$EIy5brUXpoWt4kKebkYYLO6xPfc4xGXu1AAOLwM.gADzUyZ9saMrW', 'resumes/5rPAw3LP9A7xKCfTjlrKoofeWrrp7WVBu7qG7fwJ.pdf', NULL, NULL, NULL, 'Associate System Engineer', 'Bsc Engineering (Hons)', '<p>Linux</p>\r\n<p>Azure</p>\r\n<p>Networking</p>\r\n<p>Windows administration</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, '1998-10-03', 'Male', 'Sri Lankan', NULL, '<p>CCNA&nbsp;</p>\r\n<p>AZ 900</p>', NULL, NULL, 1, '<p>Associate Systems Engineer</p>', NULL, NULL, '2025-05-05 06:23:34', '2025-05-05 06:29:03'),
(87, NULL, 'abc', 'abc@gmail.com', '0768092696', NULL, '$2y$12$DBnZBScXE/sALw8xXDCzzu7KOy1pp8omqV/NLt/sGc4pYSS6os4Em', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-05 13:30:16', '2025-05-05 13:30:16'),
(88, NULL, 'amila', 'dissanayakeamila27@gmail.com', '0702710448', NULL, '$2y$12$7USAgEaB7/4NzDaJBCQrN.YgLIPamZEhsi6bD0ApJKdvNGaizUH2.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-05 14:40:27', '2025-05-05 14:40:27'),
(89, NULL, 'Santhiraraj', 'petermckinon11@gmail.com', '0760709624', NULL, '$2y$12$NzU1UCrxfRUQgzq0qao1veXMHGcNEOP/LRv8h8VT58Cjtqxuu4m6u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-06 01:23:01', '2025-05-06 01:23:01'),
(90, NULL, 'Ruchira Lakshan Lakshan', 'ruchiralakshan9923@gmail.com', '0772249437', NULL, '$2y$12$JadsxqA7d1j83zTDD3H.GOuVkhFbym39L6pxR69D2yc0f5kABLeLu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-06 11:13:57', '2025-05-06 11:13:57'),
(91, NULL, 'J.M.H.V.Jayasinghe', 'hansikajayasinghe2001@gmail.com', '0705706801', '1746537633.webp', '$2y$12$Kc8bTmjk6XUz1HC4umpSlO4mux2FyjZ2wLHBMpybkUbZadQVfomZG', 'resumes/cGR0EAbreXIAq6t8DHR3u4irsYEqWs20QxdpULJY.pdf', 'Ponnin gedara\r\nThalawaththe gedara', NULL, 'Certificate of Open University Computer Course - 2023( 04 Months)\r\nCompleted Computer Science Diploma Course at National\r\nProgrammed of Vocational &Language Skill Development- 2018 (04\r\nMonths.) \r\nCompleted Graphic Design Course at National Programmed of\r\nVocational & Language Skill Development- 2018 (04 Months. )\r\nCompleted Spoken English Course at National Programmed of\r\nVocational & Language Skill Development - 2018 (04 Months.)', 'Successfully Completed Six Months In Plant Training\r\nProgramme At CiC Seed Farm, Pelwehera, Dambulla:', 'Diploma in Post-Harvest Technology (2023/2024)\r\nCollege of Technology, Anuradhapura\r\nGCE Advanced Level (2022)\r\nIndex No: 3639720\r\n3 Passes in Bio System Technology\r\n\r\n•	GCE Ordinary Level (2017)\r\nKu/SWRD Bandaranaike College\r\nIndex No: 72422122', '<p>Time Management&nbsp;&nbsp;</p>\r\n<p>Teamwork&nbsp;&nbsp;</p>\r\n<p>Leadership&nbsp; &nbsp;</p>\r\n<p>Good Communicaon&nbsp;&nbsp;</p>\r\n<p>It Skills&nbsp;&nbsp;</p>\r\n<p style=\"text-align: justify;\">Problem-Solving</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '<p>An emerging professional with a Diploma in Post-Harvest Technology from the College of Technology, Anuradhapura. Proven ability to apply agricultural practices, conduct quality testing, and contribute to post-harvest processes. Seeking a challenging position to utilize my knowledge and contribute to a dynamic organization in the agricultural sector.</p>', '<p>Mrs. G.H.S.S.Premasiri&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n<p>&nbsp;Lecturer at College of Technology&nbsp;</p>\r\n<p>&nbsp;Tel: 071 8453 164</p>', '<p>Varuna Madhusanka</p>\r\n<p>Executive CIC Laboratory Services</p>\r\n<p>CIC Sol Plant &amp; Water Analytical Laboratory</p>\r\n<p>CIC Agribusinesses (Pvt) Ltd.</p>\r\n<p>Pelwehera. Dambulla.</p>\r\n<p>Email - varunam@cicagri.com</p>\r\n<p>Phone - +94 77 358 5194</p>', '2025-05-06 16:53:12', '2025-05-06 17:40:29'),
(92, NULL, 'Kavindi hirunika', 'kavindihirunikahh@gmail.com', '757351745', NULL, '$2y$12$d5W.wPhZL0ExFMh9j4HkUu5L76RgezVnm8a6EKPIrErR4wLgHyTEq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-06 21:36:50', '2025-05-06 21:36:50'),
(93, NULL, 'Aslub Ahamed', 'ahamedaslub@gmail.com', '0706309864', NULL, '$2y$12$4p/zPVehWXVipEQnL2HE1.mBwFDJWTrGxZoIhQILt/kuo/QJLnN4.', 'resumes/cv_93_1746596034.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-07 08:06:49', '2025-05-07 09:33:55'),
(94, NULL, 'Gayan Sameera', 'gskumarasirikd@gmail.com', '0725781488', NULL, '$2y$12$megdzXQTzk/VSTISTQkubuR2i1E3XcJlkvQdrsROXJL7xZ8UtSDVW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-07 11:25:25', '2025-05-07 11:25:25'),
(95, NULL, 'Amanda Serasinghe', 'amandasewmini2020@gmail.com', '0786995746', NULL, '$2y$12$6.YFCJFDX16HK369ov8/POWMGRGTfhPxc7orKj6ScILTz/i5Cj6Qa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-07 15:19:11', '2025-05-07 15:19:11'),
(96, NULL, 'Tharanga', 't_weerawanni@yahoo.com', '0714170913', NULL, '$2y$12$al9v32ypyErtB95eWToFe.hqG9Dp4Tfyt8K7yYrElI.yBujgAW4tK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-07 23:17:32', '2025-05-07 23:17:32'),
(97, 'Surenthiran Kabilan', 'Kabilan', 'skabilan0920@gmail.com', '0740421567', '1746693428.jpeg', '$2y$12$nZCAmXU3sqPHhjgtmIcJEubxjAfbsrpjWyFosl4.Dv4SiXxVcdsUi', 'resumes/DgE64LcUyfifPyNAXc7XjdMI9NCLfhzYDKt8kEX2.pdf', 'Suthumalai north manipay', 'https://www.linkedin.com/in/surenthirankabilan?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app', 'Civil engineering trainee', NULL, 'Civil engineering diploma', '<p>Civil engineering trainee,project management&nbsp;</p>', NULL, '2000-10-09', 'Male', 'Sri Lankan', '200028300758', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-08 12:31:06', '2025-05-08 12:37:08'),
(98, NULL, 'Sanduni', 'sanduamanda1234@gmail.com', '0767555483', NULL, '$2y$12$1L8JJwDBmBRlPpIhmhJPe.l4aTTjKxq3DoKo8TkI9dA6RhB2miDkW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-08 17:43:34', '2025-05-08 17:43:34'),
(99, NULL, 'Sandun hirushan', 'sandunhirushan98@gmail.com', '0740904298', NULL, '$2y$12$kj4A90RFCNRoeSeuzh9lM.iy2DohmdK8upQxmf92icrLvc/WNA4qi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-08 18:38:24', '2025-05-08 18:38:24'),
(100, NULL, 'Zafaf Iqbal', 'Izafarjw7@gmail.com', '0759848770', NULL, '$2y$12$O4QWqxGys2lSEDJgnRUNSOXT70izs80xu2psbfplJZlfKqHms4e/u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-10 11:06:17', '2025-05-10 11:06:17'),
(101, NULL, 'Thisarani Senarathne', 'vipulasenarathne998@gmail.com', '0765625651', NULL, '$2y$12$SRorbfmr7XgoimKaJ5O8DuVeAI/y9jodZvFRqkf00.UNtmS/z6RxG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-10 17:38:21', '2025-05-10 17:38:21'),
(102, NULL, 'Fathima farzana', 'fathfarz27@gmail.com', '0772422029', NULL, '$2y$12$QG1QnWy7g8p5qv70lWCliu4rEEtDVYZXS3HkR2ypJCjoVs1Rd.do6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-12 19:47:23', '2025-05-12 19:47:23'),
(103, NULL, 'Chathura Mudalige', 'chathuramudalige26@gmail.com', '0717766853', NULL, '$2y$12$Lx7dIYkBFGQdt.fQ/UeLWuhNPaklnQOXUGyTg/g.Ndch5LPA9MT9u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-13 05:40:59', '2025-05-13 05:40:59');
INSERT INTO `users` (`id`, `fullname`, `name`, `email`, `phone_number`, `profile_image`, `password`, `resume_file`, `address`, `linkedin`, `summary`, `experience`, `education`, `skills`, `marital_status`, `date_of_birth`, `gender`, `nationality`, `nic_no`, `certifications`, `portfolio_link`, `social_links`, `is_active`, `title`, `referees`, `referees2`, `created_at`, `updated_at`) VALUES
(104, NULL, 'Alsha', 'alshacooray123@gmail.com', '075 887 2103', NULL, '$2y$12$WWMukGZm.bERtGVVq/RbzOnKqZ.w9QokVX/BfSQnFn54xz7l6GSAu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-13 09:06:56', '2025-05-13 09:06:56'),
(105, NULL, 'Anuradha Tennakoon', 'tanutennakoon@gmail.com', '0779077414', NULL, '$2y$12$yqeuiLXYkKNB.JahWqe07uieAjWougvPDTITpW8o8DlQScAU/poEq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-13 17:04:14', '2025-05-13 17:04:14'),
(106, NULL, 'Azoomath Ahmed', 'azoomath2000@gmail.com', '766114020', NULL, '$2y$12$OrsM7rx9sMQOakms.uDeX.bpnhj87XI3t33pa9VbAyqGvg7b/ND9q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-14 02:36:05', '2025-05-14 02:36:05'),
(107, 'MALLAWA RALLAGE JEEWANTHA SUPUN MALLAWA', 'jeewantha mallawa', 'mallawajeewantha400@gmail.com', '0774178730', '1747292404.jpeg', '$2y$12$TXDlProDFNyotec01IAHCe5kuNJ2V7hDtumVBaelfWqIryiIJNykC', 'resumes/EBBGjhmiYCcFm3HLKs1y3Ufo4lCdCLjyDzigOf8x.pdf', '17\r\nkehelwtta,kegalle', NULL, 'I’m Jeewantha Mallawa, a recent graduate with a Bachelor of Science in Information Technology (Specialized in IT) from the Sri Lanka Institute of Information Technology (SLIIT). I’m reaching out because I’m excited about the Quality Assurance position at your company and think I’d be a great fit.', 'QUALITY ASSURANCE| CENTRE OF MONITERING ELECTION VIOLENCE (CMEV) ( 2024 )\r\nPROGRAMME ASSOCIATE TABULATION OFFICER - 03 MONTH ( CONTRACT BASIS )', 'BSC (HONS) INFORMATION TECHNOLOGY DEGREE SPECIALIZED IN INFORMATION TECHNOLOGY |\r\nG.C.E. ADVANCED LEVEL EXAMINATION\r\nG.C.E. ORDINARY LEVEL EXAMINATION | PINNAWALA NATIONAL COLLAGE, RABUKKANA - 2015 (5As 2Bs 2Cs)', '<p>Communication skills<br>Negotiation<br>English Sinhala<br>Time Management<br>Leadership<br>Problem-Solving<br>Teamwork</p>', 'Single', '1999-09-21', 'Male', 'Srilankan', '199926502780', '<p>Training Course on &ldquo; Software Quality Assurance Using Test Automation Framework &rdquo;<br>By UCSC&reg; &ndash; (University of Colombo School of Computing) Issued 2025</p>', NULL, 'www.linkedin.com/in/jeewantha-s-81714123a', 1, '<p>Quality Assurance Engineer&nbsp;</p>', '<p>Nelum Chathuranga Amarasena<br>Lecturer | Student Liason<br>Department of Information Technology Faculty of Computing<br>SLIIT | Malabe Campus nelum.a@sliit.lk |<br>+94 11 7544130 | +94 71 9096100</p>', '<p>Thusithanjana Thilakarathne<br>BEng(Sunderland), MSc (Colombo) Lecturer<br>Department of Computer Science and Software Engineering<br>Faculty of Computing SLIIT | Malabe Campus<br>thusithanjana.t@sliit.lk</p>', '2025-05-15 09:02:52', '2025-05-15 11:00:04'),
(108, NULL, 'Rajeeva Dassanayake', 'rajeeva912@gmail.com', '0766977685', NULL, '$2y$12$7w3zu9qlZW5dU9zf.Q3xrudLAlA6EaXWqvaTBJXfcF4XwpEdB/msm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-16 14:28:35', '2025-05-16 14:28:35'),
(109, NULL, 'Aseema Farook', 'aseemaakp82@gmail.com', '0770297171', NULL, '$2y$12$sQAmx7Aeg4mWgSvNQxBXK.DNxWLRRPBGA1.WHr1GGVRVwguQiwYbS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-16 16:36:04', '2025-05-16 16:36:04'),
(110, NULL, 'Sakuna senevirathna', 'sakunasenevirathna8@gmail.com', '0701007326', NULL, '$2y$12$So3drY5QdwPQDuLgg8gI8.WjMPOxkMnC2df/pUjXBF4mAXpSPC85q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-17 10:03:30', '2025-05-17 10:03:30'),
(111, NULL, 'Nimesh Tharusha', 'lmntharusha7@gmail.com', '0766130570', NULL, '$2y$12$bgak3CcgZR8U75sQajFinORn7k5d170IfQOwv.3bb1/GSw6tXau92', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-17 10:54:56', '2025-05-17 10:54:56'),
(112, 'W.G.A.G kaushalya pathiraja', 'Arunodi', 'kaushalyagayathri291@gmail.com', '0763619283', NULL, '$2y$12$0uCYdICTuRktUcU.P5y.HOrUMFtBRkxeLf9U4w0wF9MBz3pzX6aMq', NULL, 'Ja ala', NULL, NULL, NULL, 'Ordinary Level\r\n\r\n6A\r\n1B\r\n2c\r\n\r\nAdAdvance level\r\n\r\nS (iology)\r\nS(english)', '<p>Ordinary Level&nbsp;</p>\r\n<p>6 A , 1 B ,2 C</p>\r\n<p>&nbsp;</p>\r\n<p>Advice level&nbsp;</p>\r\n<p>Biology S</p>\r\n<p>English S</p>\r\n<p>&nbsp;</p>\r\n<p>I have good computer knowledge&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'Single', '2002-03-19', 'Female', 'Sinhala', '200257904660', NULL, NULL, NULL, 1, '<p>Seeking a job</p>', NULL, NULL, '2025-05-17 11:58:03', '2025-05-17 12:13:03'),
(113, 'KODITHUWAKKU KANKANAMGE LAKSHITHA BHAGYANATH', 'lakshitha bhagyanath', 'lakshithabhagya@gmail.com', '0713468348', '1747475618.jpg', '$2y$12$2s2ooQJYy12vaNkmR0YSNeq3rvKj0.VEdq5JQuUjocRulI4Sd9Hm6', 'resumes/YKPdo2XFQyH8s3YwYfrf7J4d9KrcvrjtxhAlMYTu.pdf', NULL, NULL, 'enthusiastic continuous learner.', 'assistant engineer', 'mechanical engineering national \r\n diploma', '<p>computer literacy</p>\r\n<p>problem solving</p>\r\n<p>critical thinking</p>\r\n<p>design thinking</p>', 'Single', '1999-07-16', 'Male', 'Sinhala', '991980695V', '<p>ordinary &amp; advance level</p>\r\n<p>information &amp; communication technology nvq level 4</p>\r\n<p>diploma in psychology &amp; counseling</p>', NULL, NULL, 1, NULL, NULL, NULL, '2025-05-17 13:44:11', '2025-05-17 13:53:38'),
(114, NULL, 'Tharusha Ransrini', 'tharusharansrini@gmail.com', '0713686810', NULL, '$2y$12$BtnvcFaK.5eySrXnQ5RTReYIFjbr6j7lqULGhdq3FhGxKlnDjMyl6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-17 14:45:01', '2025-05-17 14:45:01'),
(115, NULL, 'Imasha Madhuwanthi', 'imashamaduwanthi26@gmail.com', '0702198854', NULL, '$2y$12$Ga49TOoV7hDfaeFsLAMiEe.5pvCRxJPZTRpYPzQfcNbel/MOsL1Rq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-18 10:17:40', '2025-05-18 10:17:40'),
(116, NULL, 'Vishagan', 'mahendran.vishagan@gmail.com', '0777241757', NULL, '$2y$12$ELDBrDCK6Lbf.gJkwinilexP67VCEPQX5AtGDtdCG31fR7xGllV1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-18 13:00:38', '2025-05-18 13:00:38'),
(117, NULL, 'Ramesh Sanjeewa', 'rameshsanjeewa859@gmail.com', '0717241468', NULL, '$2y$12$ipPbIKiV81cWHzNfG7AtJ.PUkmAddZRxh8MHuk.qcsbmqnINMN6Su', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-19 07:07:48', '2025-05-19 07:07:48'),
(118, NULL, 'Ishan malith', 'ishanmalith201@gmail.com', '0715189288', NULL, '$2y$12$2Vz.o6OHrWdzjJwsSjCqkOlxCRpZ1PdS60JhxIqEhO8KEB3ybfdS.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-05-19 11:38:48', '2025-05-19 11:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `vission_missions`
--

CREATE TABLE `vission_missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vission` longtext NOT NULL,
  `mission` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vission_missions`
--

INSERT INTO `vission_missions` (`id`, `vission`, `mission`, `created_at`, `updated_at`) VALUES
(1, 'To be Sri Lanka’s most trusted and results-driven online recruitment platform, empowering individuals and businesses through seamless access to the right talent and opportunities.', 'At Jobads.lk, our mission is to connect job seekers with meaningful career opportunities and support employers in finding the best-fit candidates—quickly, efficiently, and affordably. We strive to elevate Sri Lanka’s job market by offering user-friendly tools, targeted advertising solutions, and a reliable platform that bridges the gap between talent and opportunity.', '2025-05-07 15:07:16', '2025-05-07 15:07:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_user_id_foreign` (`user_id`),
  ADD KEY `applications_employer_id_foreign` (`employer_id`),
  ADD KEY `applications_job_posting_id_foreign` (`job_posting_id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_category_id_foreign` (`category_id`),
  ADD KEY `banners_package_id_foreign` (`package_id`),
  ADD KEY `banners_admin_id_foreign` (`admin_id`),
  ADD KEY `banners_employer_id_foreign` (`employer_id`);

--
-- Indexes for table `banner_details`
--
ALTER TABLE `banner_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_packages`
--
ALTER TABLE `banner_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_packages_duration_id_foreign` (`duration_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_list`
--
ALTER TABLE `contact_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duration`
--
ALTER TABLE `duration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`),
  ADD KEY `feedback_admin_id_foreign` (`admin_id`),
  ADD KEY `feedback_employer_id_foreign` (`employer_id`);

--
-- Indexes for table `flagged_jobs`
--
ALTER TABLE `flagged_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flagged_jobs_user_id_job_posting_id_unique` (`user_id`,`job_posting_id`),
  ADD KEY `flagged_jobs_job_posting_id_foreign` (`job_posting_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_education`
--
ALTER TABLE `job_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_education_job_seeker_id_foreign` (`job_seeker_id`);

--
-- Indexes for table `job_experience`
--
ALTER TABLE `job_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_experience_job_seeker_id_foreign` (`job_seeker_id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_postings_category_id_foreign` (`category_id`),
  ADD KEY `job_postings_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `job_postings_employer_id_foreign` (`employer_id`),
  ADD KEY `job_postings_admin_id_foreign` (`admin_id`),
  ADD KEY `job_postings_creator_id_foreign` (`creator_id`),
  ADD KEY `job_postings_job_id_index` (`job_id`),
  ADD KEY `job_postings_package_id_foreign` (`package_id`),
  ADD KEY `job_postings_country_id_foreign` (`country_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_duration_id_foreign` (`duration_id`);

--
-- Indexes for table `package_contacts`
--
ALTER TABLE `package_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `press_releases`
--
ALTER TABLE `press_releases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vission_missions`
--
ALTER TABLE `vission_missions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `banner_details`
--
ALTER TABLE `banner_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner_packages`
--
ALTER TABLE `banner_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_list`
--
ALTER TABLE `contact_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `duration`
--
ALTER TABLE `duration`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `flagged_jobs`
--
ALTER TABLE `flagged_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_education`
--
ALTER TABLE `job_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `job_experience`
--
ALTER TABLE `job_experience`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1145;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `package_contacts`
--
ALTER TABLE `package_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `press_releases`
--
ALTER TABLE `press_releases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `vission_missions`
--
ALTER TABLE `vission_missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_job_posting_id_foreign` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `banner_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banner_packages`
--
ALTER TABLE `banner_packages`
  ADD CONSTRAINT `banner_packages_duration_id_foreign` FOREIGN KEY (`duration_id`) REFERENCES `duration` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `feedback_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flagged_jobs`
--
ALTER TABLE `flagged_jobs`
  ADD CONSTRAINT `flagged_jobs_job_posting_id_foreign` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flagged_jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_education`
--
ALTER TABLE `job_education`
  ADD CONSTRAINT `job_education_job_seeker_id_foreign` FOREIGN KEY (`job_seeker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_experience`
--
ALTER TABLE `job_experience`
  ADD CONSTRAINT `job_experience_job_seeker_id_foreign` FOREIGN KEY (`job_seeker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD CONSTRAINT `job_postings_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_postings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_postings_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_postings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_postings_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_postings_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_postings_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_duration_id_foreign` FOREIGN KEY (`duration_id`) REFERENCES `duration` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
