-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 04, 2021 at 07:52 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `andaman`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`) USING BTREE,
  KEY `idx-auth_assignment-user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1606202489),
('news', '2', 1606202693);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1606201983, 1606201983),
('/settings/calendar/*', 2, NULL, NULL, NULL, 1606202078, 1606202078),
('/settings/carousel/*', 2, NULL, NULL, NULL, 1606202042, 1606202042),
('/settings/events/*', 2, NULL, NULL, NULL, 1606202073, 1606202073),
('/settings/news-category/*', 2, NULL, NULL, NULL, 1606202211, 1606202211),
('/settings/news/*', 2, NULL, NULL, NULL, 1606202060, 1606202060),
('/settings/page/*', 2, NULL, NULL, NULL, 1606202003, 1606202003),
('/settings/research/*', 2, NULL, NULL, NULL, 1606202020, 1606202020),
('admin', 1, 'ผู้ดูแลระบบ', NULL, NULL, 1606201862, 1606201862),
('CalendarManager', 2, 'เพิ่ม,ลบ,แก้ไข ตารางกิจกรรม', NULL, NULL, 1606202383, 1606202383),
('CarouselManager', 2, 'เพิ่ม,ลบ,แก้ไข สไลด์รูปภาพ', NULL, NULL, 1606202428, 1606202448),
('EventsManager', 2, 'เพิ่ม,ลบ,แก้ไข กิจกรรม', NULL, NULL, 1606202251, 1606202275),
('news', 1, 'จัดการข่าว', NULL, NULL, 1606201960, 1606201960),
('NewsManager', 2, 'เพิ่ม,ลบ,แก้ไข ข่าว', NULL, NULL, 1606202184, 1606202184),
('page', 1, 'จัดการ page', NULL, NULL, 1606201926, 1606201926),
('PageManager', 2, 'เพิ่ม,ลบ,แก้ไข เพจ', NULL, NULL, 1606202592, 1606202592),
('research', 1, 'จัดการ งานวิจัย', NULL, NULL, 1606201942, 1606201942),
('ResearchManager', 2, 'เพิ่ม,ลบ,แก้ไข  งานวิจัย', NULL, NULL, 1606202317, 1606202317);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', '/*'),
('CalendarManager', '/settings/calendar/*'),
('CarouselManager', '/settings/carousel/*'),
('EventsManager', '/settings/events/*'),
('news', 'CalendarManager'),
('news', 'CarouselManager'),
('news', 'EventsManager'),
('news', 'NewsManager'),
('NewsManager', '/settings/news-category/*'),
('NewsManager', '/settings/news/*'),
('page', 'PageManager'),
('PageManager', '/settings/page/*'),
('research', 'ResearchManager'),
('ResearchManager', '/settings/research/*');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'ชื่อกิจกรรม',
  `date` date NOT NULL COMMENT 'วันที่',
  `start_time` time NOT NULL COMMENT 'ตั้งแต่เวลา',
  `end_time` time NOT NULL COMMENT 'ถึงเวลา',
  `url` varchar(255) DEFAULT NULL,
  `text_color` varchar(100) DEFAULT NULL,
  `background_color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `date` (`date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`id`, `title`, `date`, `start_time`, `end_time`, `url`, `text_color`, `background_color`) VALUES
(3, 'test123', '2020-06-17', '09:40:00', '12:40:00', '', '', ''),
(4, 'test2', '2020-06-17', '15:00:00', '15:30:00', '', '#674ea7', '#ffe599'),
(5, 'test3', '2020-06-17', '15:27:00', '15:27:00', '', '', ''),
(6, 'test4', '2020-06-17', '15:31:00', '15:31:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `COUNTRYID` int(5) NOT NULL,
  `COUNTRY_NAME` varchar(150) DEFAULT NULL,
  `COUNTRY_CODE` varchar(2) DEFAULT NULL COMMENT 'ตัวย่อ',
  PRIMARY KEY (`COUNTRYID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`COUNTRYID`, `COUNTRY_NAME`, `COUNTRY_CODE`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'American Samoa', 'DS'),
(5, 'Andorra', 'AD'),
(6, 'Angola', 'AO'),
(7, 'Anguilla', 'AI'),
(8, 'Antarctica', 'AQ'),
(9, 'Antigua and Barbuda', 'AG'),
(10, 'Argentina', 'AR'),
(11, 'Armenia', 'AM'),
(12, 'Aruba', 'AW'),
(13, 'Australia', 'AU'),
(14, 'Austria', 'AT'),
(15, 'Azerbaijan', 'AZ'),
(16, 'Bahamas', 'BS'),
(17, 'Bahrain', 'BH'),
(18, 'Bangladesh', 'BD'),
(19, 'Barbados', 'BB'),
(20, 'Belarus', 'BY'),
(21, 'Belgium', 'BE'),
(22, 'Belize', 'BZ'),
(23, 'Benin', 'BJ'),
(24, 'Bermuda', 'BM'),
(25, 'Bhutan', 'BT'),
(26, 'Bolivia', 'BO'),
(27, 'Bosnia and Herzegovina', 'BA'),
(28, 'Botswana', 'BW'),
(29, 'Bouvet Island', 'BV'),
(30, 'Brazil', 'BR'),
(31, 'British Indian Ocean Territory', 'IO'),
(32, 'Brunei Darussalam', 'BN'),
(33, 'Bulgaria', 'BG'),
(34, 'Burkina Faso', 'BF'),
(35, 'Burundi', 'BI'),
(36, 'Cambodia', 'KH'),
(37, 'Cameroon', 'CM'),
(38, 'Canada', 'CA'),
(39, 'Cape Verde', 'CV'),
(40, 'Cayman Islands', 'KY'),
(41, 'Central African Republic', 'CF'),
(42, 'Chad', 'TD'),
(43, 'Chile', 'CL'),
(44, 'China', 'CN'),
(45, 'Christmas Island', 'CX'),
(46, 'Cocos (Keeling) Islands', 'CC'),
(47, 'Colombia', 'CO'),
(48, 'Comoros', 'KM'),
(49, 'Congo', 'CG'),
(50, 'Cook Islands', 'CK'),
(51, 'Costa Rica', 'CR'),
(52, 'Croatia (Hrvatska)', 'HR'),
(53, 'Cuba', 'CU'),
(54, 'Cyprus', 'CY'),
(55, 'Czech Republic', 'CZ'),
(56, 'Denmark', 'DK'),
(57, 'Djibouti', 'DJ'),
(58, 'Dominica', 'DM'),
(59, 'Dominican Republic', 'DO'),
(60, 'East Timor', 'TP'),
(61, 'Ecuador', 'EC'),
(62, 'Egypt', 'EG'),
(63, 'El Salvador', 'SV'),
(64, 'Equatorial Guinea', 'GQ'),
(65, 'Eritrea', 'ER'),
(66, 'Estonia', 'EE'),
(67, 'Ethiopia', 'ET'),
(68, 'Falkland Islands (Malvinas)', 'FK'),
(69, 'Faroe Islands', 'FO'),
(70, 'Fiji', 'FJ'),
(71, 'Finland', 'FI'),
(72, 'France', 'FR'),
(73, 'France, Metropolitan', 'FX'),
(74, 'French Guiana', 'GF'),
(75, 'French Polynesia', 'PF'),
(76, 'French Southern Territories', 'TF'),
(77, 'Gabon', 'GA'),
(78, 'Gambia', 'GM'),
(79, 'Georgia', 'GE'),
(80, 'Germany', 'DE'),
(81, 'Ghana', 'GH'),
(82, 'Gibraltar', 'GI'),
(83, 'Guernsey', 'GK'),
(84, 'Greece', 'GR'),
(85, 'Greenland', 'GL'),
(86, 'Grenada', 'GD'),
(87, 'Guadeloupe', 'GP'),
(88, 'Guam', 'GU'),
(89, 'Guatemala', 'GT'),
(90, 'Guinea', 'GN'),
(91, 'Guinea-Bissau', 'GW'),
(92, 'Guyana', 'GY'),
(93, 'Haiti', 'HT'),
(94, 'Heard and Mc Donald Islands', 'HM'),
(95, 'Honduras', 'HN'),
(96, 'Hong Kong', 'HK'),
(97, 'Hungary', 'HU'),
(98, 'Iceland', 'IS'),
(99, 'India', 'IN'),
(100, 'Isle of Man', 'IM'),
(101, 'Indonesia', 'ID'),
(102, 'Iran (Islamic Republic of)', 'IR'),
(103, 'Iraq', 'IQ'),
(104, 'Ireland', 'IE'),
(105, 'Israel', 'IL'),
(106, 'Italy', 'IT'),
(107, 'Ivory Coast', 'CI'),
(108, 'Jersey', 'JE'),
(109, 'Jamaica', 'JM'),
(110, 'Japan', 'JP'),
(111, 'Jordan', 'JO'),
(112, 'Kazakhstan', 'KZ'),
(113, 'Kenya', 'KE'),
(114, 'Kiribati', 'KI'),
(115, 'Korea, Democratic People\'s Republic of', 'KP'),
(116, 'Korea, Republic of', 'KR'),
(117, 'Kosovo', 'XK'),
(118, 'Kuwait', 'KW'),
(119, 'Kyrgyzstan', 'KG'),
(120, 'Lao People\'s Democratic Republic', 'LA'),
(121, 'Latvia', 'LV'),
(122, 'Lebanon', 'LB'),
(123, 'Lesotho', 'LS'),
(124, 'Liberia', 'LR'),
(125, 'Libyan Arab Jamahiriya', 'LY'),
(126, 'Liechtenstein', 'LI'),
(127, 'Lithuania', 'LT'),
(128, 'Luxembourg', 'LU'),
(129, 'Macau', 'MO'),
(130, 'Macedonia', 'MK'),
(131, 'Madagascar', 'MG'),
(132, 'Malawi', 'MW'),
(133, 'Malaysia', 'MY'),
(134, 'Maldives', 'MV'),
(135, 'Mali', 'ML'),
(136, 'Malta', 'MT'),
(137, 'Marshall Islands', 'MH'),
(138, 'Martinique', 'MQ'),
(139, 'Mauritania', 'MR'),
(140, 'Mauritius', 'MU'),
(141, 'Mayotte', 'TY'),
(142, 'Mexico', 'MX'),
(143, 'Micronesia, Federated States of', 'FM'),
(144, 'Moldova, Republic of', 'MD'),
(145, 'Monaco', 'MC'),
(146, 'Mongolia', 'MN'),
(147, 'Montenegro', 'ME'),
(148, 'Montserrat', 'MS'),
(149, 'Morocco', 'MA'),
(150, 'Mozambique', 'MZ'),
(151, 'Myanmar', 'MM'),
(152, 'Namibia', 'NA'),
(153, 'Nauru', 'NR'),
(154, 'Nepal', 'NP'),
(155, 'Netherlands', 'NL'),
(156, 'Netherlands Antilles', 'AN'),
(157, 'New Caledonia', 'NC'),
(158, 'New Zealand', 'NZ'),
(159, 'Nicaragua', 'NI'),
(160, 'Niger', 'NE'),
(161, 'Nigeria', 'NG'),
(162, 'Niue', 'NU'),
(163, 'Norfolk Island', 'NF'),
(164, 'Northern Mariana Islands', 'MP'),
(165, 'Norway', 'NO'),
(166, 'Oman', 'OM'),
(167, 'Pakistan', 'PK'),
(168, 'Palau', 'PW'),
(169, 'Palestine', 'PS'),
(170, 'Panama', 'PA'),
(171, 'Papua New Guinea', 'PG'),
(172, 'Paraguay', 'PY'),
(173, 'Peru', 'PE'),
(174, 'Philippines', 'PH'),
(175, 'Pitcairn', 'PN'),
(176, 'Poland', 'PL'),
(177, 'Portugal', 'PT'),
(178, 'Puerto Rico', 'PR'),
(179, 'Qatar', 'QA'),
(180, 'Reunion', 'RE'),
(181, 'Romania', 'RO'),
(182, 'Russian Federation', 'RU'),
(183, 'Rwanda', 'RW'),
(184, 'Saint Kitts and Nevis', 'KN'),
(185, 'Saint Lucia', 'LC'),
(186, 'Saint Vincent and the Grenadines', 'VC'),
(187, 'Samoa', 'WS'),
(188, 'San Marino', 'SM'),
(189, 'Sao Tome and Principe', 'ST'),
(190, 'Saudi Arabia', 'SA'),
(191, 'Senegal', 'SN'),
(192, 'Serbia', 'RS'),
(193, 'Seychelles', 'SC'),
(194, 'Sierra Leone', 'SL'),
(195, 'Singapore', 'SG'),
(196, 'Slovakia', 'SK'),
(197, 'Slovenia', 'SI'),
(198, 'Solomon Islands', 'SB'),
(199, 'Somalia', 'SO'),
(200, 'South Africa', 'ZA'),
(201, 'South Georgia South Sandwich Islands', 'GS'),
(202, 'Spain', 'ES'),
(203, 'Sri Lanka', 'LK'),
(204, 'St. Helena', 'SH'),
(205, 'St. Pierre and Miquelon', 'PM'),
(206, 'Sudan', 'SD'),
(207, 'Suriname', 'SR'),
(208, 'Svalbard and Jan Mayen Islands', 'SJ'),
(209, 'Swaziland', 'SZ'),
(210, 'Sweden', 'SE'),
(211, 'Switzerland', 'CH'),
(212, 'Syrian Arab Republic', 'SY'),
(213, 'Taiwan', 'TW'),
(214, 'Tajikistan', 'TJ'),
(215, 'Tanzania, United Republic of', 'TZ'),
(216, 'Thailand', 'TH'),
(217, 'Togo', 'TG'),
(218, 'Tokelau', 'TK'),
(219, 'Tonga', 'TO'),
(220, 'Trinidad and Tobago', 'TT'),
(221, 'Tunisia', 'TN'),
(222, 'Turkey', 'TR'),
(223, 'Turkmenistan', 'TM'),
(224, 'Turks and Caicos Islands', 'TC'),
(225, 'Tuvalu', 'TV'),
(226, 'Uganda', 'UG'),
(227, 'Ukraine', 'UA'),
(228, 'United Arab Emirates', 'AE'),
(229, 'United Kingdom', 'GB'),
(230, 'United States', 'US'),
(231, 'United States minor outlying islands', 'UM'),
(232, 'Uruguay', 'UY'),
(233, 'Uzbekistan', 'UZ'),
(234, 'Vanuatu', 'VU'),
(235, 'Vatican City State', 'VA'),
(236, 'Venezuela', 'VE'),
(237, 'Vietnam', 'VN'),
(238, 'Virgin Islands (British)', 'VG'),
(239, 'Virgin Islands (U.S.)', 'VI'),
(240, 'Wallis and Futuna Islands', 'WF'),
(241, 'Western Sahara', 'EH'),
(242, 'Yemen', 'YE'),
(243, 'Zaire', 'ZR'),
(244, 'Zambia', 'ZM'),
(245, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `events_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `short` varchar(1024) DEFAULT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `status` smallint(1) DEFAULT 1,
  `image_base_url` varchar(1024) DEFAULT NULL,
  `image_path` varchar(1024) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` date DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`events_id`) USING BTREE,
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `published_at` (`published_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`events_id`, `title`, `short`, `text`, `slug`, `views`, `status`, `image_base_url`, `image_path`, `created_by`, `updated_by`, `published_at`, `created_at`, `updated_at`, `view`) VALUES
(12, 'ส่งเสริมทักษะความรู้ในห้องเรียนและนอกห้องเรียน และงานบริการเพื่อสังคม', NULL, '<p>นิสิตที่มีความสนใจด้านเทคโนโลยีและการจัดการระบบเกษตร<br />ได้เข้าร่วมโครงการศึกษาดูงานเทคโนโลยีระบบเกษตร<br />ในเขตพื้นที่ภาคตะวันออก (จังหวัดชลบุรี จังหวัดจันทบุรี และจังหวัดระยอง)</p>', 'sng-serim-thaksa-khwam-ru-ni-hxngreiyn-laea-nxk-hxngreiyn-laea-ngan-brikar-pheux-sangkhm', 2, 0, 'http://faculty-ku.local/storage/source', '\\1\\n_yTDFnf885BILG9H_73DMNPp5OGwNaL.jpg', 1, 1, '2020-06-17', 1592379701, 1620098932, ''),
(13, 'ทดสอบ', NULL, '<p>รายละเอียดกิจกรรม:</p>', 'thdsxb', 0, 1, NULL, NULL, 1, 1, '2020-06-23', 1592904363, 1592906519, ''),
(14, 'ทดสอบ 3', NULL, '<p>รายละเอียดกิจกรรม:</p>', 'thdsxb-3', 0, 1, NULL, NULL, 1, 1, '2020-06-23', 1592906492, 1592906492, '');

-- --------------------------------------------------------

--
-- Table structure for table `events_attachment`
--

DROP TABLE IF EXISTS `events_attachment`;
CREATE TABLE IF NOT EXISTS `events_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `events_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_attachment_article` (`events_id`) USING BTREE,
  KEY `order` (`order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `events_attachment`
--

INSERT INTO `events_attachment` (`id`, `events_id`, `path`, `base_url`, `type`, `size`, `name`, `created_at`, `order`) VALUES
(11, 7, '\\1\\GQSLVFPVCgZvQ9JCMBaQATOrJ5j1MGJC.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 69316, '12443.jpg', 1592200308, NULL),
(12, 7, '\\1\\2c10xBW10CkcJOu3fwz64fXLIW0K-ob7.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 315262, '1558149932440.jpg', 1592200308, NULL),
(13, 7, '\\1\\zKNqvIpiGfqDXO3isZEVVWwWpLtGnruJ.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 249124, '1558149950416.jpg', 1592200308, NULL),
(14, 7, '\\1\\1z3xvCbRu2nADla-PwNFvQwvRH7rmlAI.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 16246, '1558968629812.jpg', 1592200308, NULL),
(15, 7, '\\1\\ssBMpqQpk5_hxAre1zs_Rwopzi1NiVtY.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 202932, '1561556078520.jpg', 1592200308, NULL),
(16, 7, '\\1\\eopc3SaNbO4I1KGNlKDghYlXMryBtU9F.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 291334, '1561556400870.jpg', 1592200308, NULL),
(17, 8, '\\1\\aI3zrWAEfxD6uvh91k-1XEq-rAJJtH1A.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 78522, 'r0_476_5184_3405_w1200_h678_fmax.jpg', 1592203811, NULL),
(18, 12, '\\1\\SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 339136, '2 (1).jpg', 1592379701, NULL),
(19, 12, '\\1\\4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 364851, '5.jpg', 1592379701, NULL),
(20, 12, '\\1\\9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 306746, '4.jpg', 1592379701, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_item`
--

DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE IF NOT EXISTS `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `ref_table` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ref_id` (`ref_id`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `file_storage_item`
--

INSERT INTO `file_storage_item` (`id`, `component`, `base_url`, `path`, `type`, `size`, `name`, `upload_ip`, `ref_id`, `created_at`, `ref_table`) VALUES
(4, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\-1Pv-O_7W3xAUhZvr9inxlR77kNm2C7f.jpg', 'image/jpeg', 185775, '-1Pv-O_7W3xAUhZvr9inxlR77kNm2C7f', '127.0.0.1', NULL, 1572776635, NULL),
(3, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\kpZmwB-T_gi1cko3j4WyTAJgtJVEnqnJ.jpg', 'image/jpeg', 128697, 'kpZmwB-T_gi1cko3j4WyTAJgtJVEnqnJ', '127.0.0.1', NULL, 1572666787, NULL),
(6, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\tovPqUFd2gYNIBUvv2mgxCzguSrZHGE6.png', 'image/png', 9734, 'tovPqUFd2gYNIBUvv2mgxCzguSrZHGE6', '127.0.0.1', NULL, 1573444989, NULL),
(28, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\uUCdjZAIuDktp-6XiuGe6tS50i_D6M2t.jpg', 'image/jpeg', 130570, 'uUCdjZAIuDktp-6XiuGe6tS50i_D6M2t', '127.0.0.1', NULL, 1576323487, NULL),
(8, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\tKjLZsGSAK9laDEYou5lQzFVH1RMdUuh.png', 'image/png', 2197, 'tKjLZsGSAK9laDEYou5lQzFVH1RMdUuh', '127.0.0.1', NULL, 1573448044, NULL),
(9, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\fOaRLejpMnW35bZQx1AEv-lx3849lBjh.png', 'image/png', 2870, 'fOaRLejpMnW35bZQx1AEv-lx3849lBjh', '127.0.0.1', NULL, 1573448055, NULL),
(11, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\3Lw4TJtDhFqI8ba26iiRc_Gd9EL3opzA.png', 'image/png', 3010, '3Lw4TJtDhFqI8ba26iiRc_Gd9EL3opzA', '127.0.0.1', NULL, 1573448084, NULL),
(12, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\QpxxbsgegQKBoCUa145saM8Xa7KEskIE.png', 'image/png', 3732, 'QpxxbsgegQKBoCUa145saM8Xa7KEskIE', '127.0.0.1', NULL, 1573448095, NULL),
(25, 'fileStorage', 'http://yii2-queue-udon.local/source', '/opd/171/470/5/1714705.jpg', 'image/jpeg', 5118, '1714705', NULL, 58033, 1574725100, 'tbl_patient'),
(23, 'fileStorage', 'http://yii2-queue-udon.local/source', '/opd/171/470/5/1714705.jpg', 'image/jpeg', 5118, '1714705', NULL, 58031, 1574694658, 'tbl_patient'),
(26, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\FY7EyfrzV1IZ4dlq5VWJEUYCzKTZ-sFM.png', 'image/png', 15668, 'FY7EyfrzV1IZ4dlq5VWJEUYCzKTZ-sFM', '127.0.0.1', NULL, 1574851968, NULL),
(29, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\Glx8SDyi-zc_P9AoMoMxLqmuTza0AlPN.jpg', 'image/jpeg', 130570, 'Glx8SDyi-zc_P9AoMoMxLqmuTza0AlPN', '127.0.0.1', NULL, 1576323662, NULL),
(30, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\eSuASMGKnjlpG-gw9j2hnmNkb6P2CJHM.jpg', 'image/jpeg', 130570, 'eSuASMGKnjlpG-gw9j2hnmNkb6P2CJHM', '127.0.0.1', NULL, 1576323695, NULL),
(33, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\EGA7fizpjusIIolGzR6d-JiQ-AyQyCCN.png', 'image/png', 8327, 'EGA7fizpjusIIolGzR6d-JiQ-AyQyCCN', '127.0.0.1', NULL, 1576324569, NULL),
(46, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\PWZy-8OQLkiCuKDmgNZcrlUkFBdEncnr.jpg', 'image/jpeg', 964391, 'PWZy-8OQLkiCuKDmgNZcrlUkFBdEncnr', '127.0.0.1', NULL, 1580017465, NULL),
(34, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\WrfPMe4Vu_L9yiNg4jm03eNC3ljNo_n0.png', 'image/png', 10015, 'WrfPMe4Vu_L9yiNg4jm03eNC3ljNo_n0', '127.0.0.1', NULL, 1576324610, NULL),
(35, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\Imy0SxDvmoK29Pxpmuk7COqZnfSBtfgJ.png', 'image/png', 6415, 'Imy0SxDvmoK29Pxpmuk7COqZnfSBtfgJ', '127.0.0.1', NULL, 1576324644, NULL),
(43, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\oIwtRr8su03WhW3soKZDSAe0vRemJNfE.png', 'image/png', 4553, 'oIwtRr8su03WhW3soKZDSAe0vRemJNfE', '127.0.0.1', NULL, 1576326501, NULL),
(39, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\HyiIse7aEVBSVD5Y7R5MJoAy9p5vZWGw.png', 'image/png', 8140, 'HyiIse7aEVBSVD5Y7R5MJoAy9p5vZWGw', '127.0.0.1', NULL, 1576325602, NULL),
(40, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\Ll64YeReVrWbhAmqDHoOr7M5WD_H0wMp.png', 'image/png', 8299, 'Ll64YeReVrWbhAmqDHoOr7M5WD_H0wMp', '127.0.0.1', NULL, 1576325632, NULL),
(44, 'fileStorage', 'http://yii2-queue-udon.local/source', '/opd/171/470/5/1714705.jpg', 'image/jpeg', 5118, '1714705', NULL, 58103, 1576378791, 'tbl_patient'),
(45, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\wNZegZ1DOV_AfEq1RxQ1X0YFGsbx2NXP.png', 'image/png', 8299, 'wNZegZ1DOV_AfEq1RxQ1X0YFGsbx2NXP', '127.0.0.1', NULL, 1576677521, NULL),
(49, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\E0OXddoVjL8g342R-tn1ApKQvo6ndEXJ.png', 'image/png', 8140, 'E0OXddoVjL8g342R-tn1ApKQvo6ndEXJ', '127.0.0.1', NULL, 1580892444, NULL),
(50, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\gSnm_oQLsU0RKeBWSway6dozUrr2yh6J.png', 'image/png', 10015, 'gSnm_oQLsU0RKeBWSway6dozUrr2yh6J', '127.0.0.1', NULL, 1580892466, NULL),
(51, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\4lLsnKNR-8BtC9g21Dzby1CP8wsbGYnV.png', 'image/png', 6415, '4lLsnKNR-8BtC9g21Dzby1CP8wsbGYnV', '127.0.0.1', NULL, 1580892480, NULL),
(52, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\UkMOL2P7HDt1GGC7hvl2TppnES3-CYLj.png', 'image/png', 11384, 'UkMOL2P7HDt1GGC7hvl2TppnES3-CYLj', '127.0.0.1', NULL, 1580907167, NULL),
(53, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\_Ip19Xb-4VlU171cDUdvzai_uF0qGxKk.jpg', 'image/jpeg', 964391, '_Ip19Xb-4VlU171cDUdvzai_uF0qGxKk', '127.0.0.1', NULL, 1580993324, NULL),
(60, 'fileStorage', 'http://localhost:8083', '/images/opd/171/766/6/1717666.jpg', 'image/jpeg', 128697, '1717666', '127.0.0.1', 419711, 1583938363, 'tbl_patient'),
(79, 'fileStorage', 'http://localhost:8083', '/images/opd/171/766/6/1717666.jpg', 'image/jpeg', 128697, '1717666', '127.0.0.1', 419713, 1583989508, 'tbl_patient'),
(97, 'fileStorage', 'http://localhost:8083', '/images/opd/017/641/9/176419.jpg', 'image/jpeg', 136402, '176419', '127.0.0.1', 419714, 1583993568, 'tbl_patient'),
(98, 'fileStorage', '', '\\1\\E4G3g3e6qcq2DjYwkO-rherclj96gi3X.png', 'image/png', 36064, 'E4G3g3e6qcq2DjYwkO-rherclj96gi3X', '127.0.0.1', NULL, 1591851813, NULL),
(99, 'fileStorage', '', '\\1\\uEvKQl4rC-XNK0G76MQIDQv6frkATQv4.png', 'image/png', 36064, 'uEvKQl4rC-XNK0G76MQIDQv6frkATQv4', '127.0.0.1', NULL, 1591851931, NULL),
(101, 'fileStorage', '/source', '\\1\\0Od6N91W-cp6RyiL0ot1mx_RXI3QpAlO.png', 'image/png', 36064, '0Od6N91W-cp6RyiL0ot1mx_RXI3QpAlO', '127.0.0.1', NULL, 1591852180, NULL),
(102, 'fileStorage', '/source', '\\1\\ZPKqJjkA4ySv8FECy-BOd5IpndqLOhg5.png', 'image/png', 36064, 'ZPKqJjkA4ySv8FECy-BOd5IpndqLOhg5', '127.0.0.1', NULL, 1591852202, NULL),
(103, 'fileStorage', '/source', '\\1\\C4JGfVW9lb7V3iCuK-wDKo2QK5Rkvfkn.png', 'image/png', 36064, 'C4JGfVW9lb7V3iCuK-wDKo2QK5Rkvfkn', '127.0.0.1', NULL, 1591852828, NULL),
(104, 'fileStorage', '/source', '\\1\\Zv4QHpR_8zu4TuZr3ZUzpXzPfHTtj978.png', 'image/png', 22422, 'Zv4QHpR_8zu4TuZr3ZUzpXzPfHTtj978', '127.0.0.1', NULL, 1591852979, NULL),
(105, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\B5vzrZ0DLLgGSDHCxAEZVy6BBHX7e69q.png', 'image/png', 36064, 'B5vzrZ0DLLgGSDHCxAEZVy6BBHX7e69q', '127.0.0.1', NULL, 1591853153, NULL),
(108, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'image/png', 22422, '2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8', '127.0.0.1', NULL, 1591859607, NULL),
(198, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\lJjLp1OK9l__hrBR8hvxTP9GjDwUTjHX.png', 'image/png', 935516, 'lJjLp1OK9l__hrBR8hvxTP9GjDwUTjHX', '127.0.0.1', NULL, 1606125723, NULL),
(193, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\_smRUcrjsmJYAm-Ry-BkRGt-gMWcsj07.png', 'image/png', 21496, '_smRUcrjsmJYAm-Ry-BkRGt-gMWcsj07', '127.0.0.1', NULL, 1605089164, NULL),
(195, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\0xFUZAZkaObPeBCWwkOORhy-rwPectXZ.png', 'image/png', 21496, '0xFUZAZkaObPeBCWwkOORhy-rwPectXZ', '127.0.0.1', NULL, 1605089192, NULL),
(178, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\_V9DMuirE2GY9a0H0ttASUcpFR_zZ3jd.png', 'image/png', 35451, '_V9DMuirE2GY9a0H0ttASUcpFR_zZ3jd', '127.0.0.1', NULL, 1598848338, NULL),
(179, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\FHsTi7XP9wupBRKL_h7eMPKM7jsaM-On.jpg', 'image/jpeg', 24808, 'FHsTi7XP9wupBRKL_h7eMPKM7jsaM-On', '127.0.0.1', NULL, 1598863548, NULL),
(199, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\xdI3r-xO1Ov-2hHMVFn5IFDhBho2j0Y8.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 29614, 'xdI3r-xO1Ov-2hHMVFn5IFDhBho2j0Y8', '127.0.0.1', NULL, 1606126381, NULL),
(182, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\bjltVFNRHUApEU23qiTPAND-hSYwk5lT.jpg', 'image/jpeg', 283558, 'bjltVFNRHUApEU23qiTPAND-hSYwk5lT', '127.0.0.1', NULL, 1605084633, NULL),
(183, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\d6Cw5gs6Q_luPNVxE7dWT33abaU4g6aN.jpg', 'image/jpeg', 263418, 'd6Cw5gs6Q_luPNVxE7dWT33abaU4g6aN', '127.0.0.1', NULL, 1605085521, NULL),
(184, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\do3nhb4ywbUsb8LR29TZsdDnKySSJDOc.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15888, 'do3nhb4ywbUsb8LR29TZsdDnKySSJDOc', '127.0.0.1', NULL, 1605085811, NULL),
(185, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\JuEkqFxFCW6GdLt812Dtyut8BSThNoq_.pdf', 'application/pdf', 369444, 'JuEkqFxFCW6GdLt812Dtyut8BSThNoq_', '127.0.0.1', NULL, 1605085843, NULL),
(159, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-.jpg', 'image/jpeg', 384138, 'Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-', '127.0.0.1', NULL, 1592895726, NULL),
(160, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\N-9tlR6rDjfM963zwzMbAOC2hywQvvQG.jpg', 'image/jpeg', 87659, 'N-9tlR6rDjfM963zwzMbAOC2hywQvvQG', '127.0.0.1', NULL, 1592896622, NULL),
(152, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\n_yTDFnf885BILG9H_73DMNPp5OGwNaL.jpg', 'image/jpeg', 288522, 'n_yTDFnf885BILG9H_73DMNPp5OGwNaL', '127.0.0.1', NULL, 1592379616, NULL),
(129, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB.jpg', 'image/jpeg', 315262, 'iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB', '127.0.0.1', NULL, 1592200089, NULL),
(130, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc.jpg', 'image/jpeg', 249124, 'WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc', '127.0.0.1', NULL, 1592200089, NULL),
(131, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV.jpg', 'image/jpeg', 16246, 'we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV', '127.0.0.1', NULL, 1592200089, NULL),
(132, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\A2DE-4r_apgXrexQ-ODmSXtIIgnPotha.jpg', 'image/jpeg', 202932, 'A2DE-4r_apgXrexQ-ODmSXtIIgnPotha', '127.0.0.1', NULL, 1592200089, NULL),
(133, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb.jpg', 'image/jpeg', 291334, 'hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb', '127.0.0.1', NULL, 1592200089, NULL),
(134, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\NS38UTgur8NA7mNUYp7fimV-ORcM6_a3.jpg', 'image/jpeg', 69316, 'NS38UTgur8NA7mNUYp7fimV-ORcM6_a3', '127.0.0.1', NULL, 1592200201, NULL),
(186, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\l-6zBg609W4EUwS8HU2oaczSNL8gz5Po.pdf', 'application/pdf', 272358, 'l-6zBg609W4EUwS8HU2oaczSNL8gz5Po', '127.0.0.1', NULL, 1605085881, NULL),
(163, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\oQTQDglkrIpzU_3VudhqOMs0Nz_I9q3k.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 20813, 'oQTQDglkrIpzU_3VudhqOMs0Nz_I9q3k', '127.0.0.1', NULL, 1598776690, NULL),
(162, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\9VR6WHF3oWl_FubT_RqhPwS11UcA_ZjZ.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 20813, '9VR6WHF3oWl_FubT_RqhPwS11UcA_ZjZ', '127.0.0.1', NULL, 1598770502, NULL),
(153, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB.jpg', 'image/jpeg', 339136, 'SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB', '127.0.0.1', NULL, 1592379682, NULL),
(154, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ.jpg', 'image/jpeg', 364851, '4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ', '127.0.0.1', NULL, 1592379687, NULL),
(155, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q.jpg', 'image/jpeg', 306746, '9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q', '127.0.0.1', NULL, 1592379691, NULL),
(156, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU.jpg', 'image/jpeg', 339136, 'YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU', '127.0.0.1', NULL, 1592385262, NULL),
(157, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI.jpg', 'image/jpeg', 364851, 'ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI', '127.0.0.1', NULL, 1592385366, NULL),
(187, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hKkuy4RClugk4hJL1WWNWCPZr3f2qr_U.jpg', 'image/jpeg', 302289, 'hKkuy4RClugk4hJL1WWNWCPZr3f2qr_U', '127.0.0.1', NULL, 1605088237, NULL),
(149, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\5SAgQvSU9LL7zKXfjMgp_rMYQQdlWFlK.jpg', 'image/jpeg', 87659, '5SAgQvSU9LL7zKXfjMgp_rMYQQdlWFlK', '127.0.0.1', NULL, 1592379041, NULL),
(188, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\J5Zc8KZMyKZSxnTqmoS8TfuA4dNJLnWZ.jpg', 'image/jpeg', 377947, 'J5Zc8KZMyKZSxnTqmoS8TfuA4dNJLnWZ', '127.0.0.1', NULL, 1605088237, NULL),
(189, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\xkrbuIrIRUf4oIS65uj2NixmaGyt7QGs.jpg', 'image/jpeg', 370760, 'xkrbuIrIRUf4oIS65uj2NixmaGyt7QGs', '127.0.0.1', NULL, 1605088237, NULL),
(190, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\rq0CeMc6Iy4qgxB-8s3HXqJxIz4KU73T.jpg', 'image/jpeg', 287765, 'rq0CeMc6Iy4qgxB-8s3HXqJxIz4KU73T', '127.0.0.1', NULL, 1605088237, NULL),
(191, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\tLbvGyGE733ynnFTKc95QL_LAJAKwV7O.jpg', 'image/jpeg', 308334, 'tLbvGyGE733ynnFTKc95QL_LAJAKwV7O', '127.0.0.1', NULL, 1605088237, NULL),
(194, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\vt97Pj2k4mdLaDfTkji6sExWTT36Xgy1.png', 'image/png', 21496, 'vt97Pj2k4mdLaDfTkji6sExWTT36Xgy1', '127.0.0.1', NULL, 1605089181, NULL),
(200, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\R_uNOjSMJnl0D2bSxRdkwe5Pz2UAGVxa.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1592989, 'R_uNOjSMJnl0D2bSxRdkwe5Pz2UAGVxa', '127.0.0.1', NULL, 1606126388, NULL),
(201, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\TG7e0PEdbtNsSWnHphCOiAJMxIcN3ZQX.jpg', 'image/jpeg', 341647, 'TG7e0PEdbtNsSWnHphCOiAJMxIcN3ZQX', '127.0.0.1', NULL, 1606205955, NULL),
(202, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hhM28SWrTGve6g2fypUMI0OBBUSNTwFO.png', 'image/png', 936116, 'hhM28SWrTGve6g2fypUMI0OBBUSNTwFO', '127.0.0.1', NULL, 1606205961, NULL),
(205, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\fLfuVt6R-IZxW2eihbFMU1kf2Y-UFDA7.png', 'image/png', 1229840, 'fLfuVt6R-IZxW2eihbFMU1kf2Y-UFDA7', '127.0.0.1', NULL, 1619663886, NULL),
(214, 'fileStorage', 'http://andaman-web.local/storage/source', '1\\M9X_nyZYm4o26pNWVY0BmJLy9hqIxFBt.png', 'image/png', 718465, 'M9X_nyZYm4o26pNWVY0BmJLy9hqIxFBt', '127.0.0.1', NULL, 1620103094, NULL),
(208, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\0D5U4R_PwXjxiWN_10UIU1hcDCeaiMyX.jpg', 'image/jpeg', 58042, '0D5U4R_PwXjxiWN_10UIU1hcDCeaiMyX', '127.0.0.1', NULL, 1620098369, NULL),
(209, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\TFQ_tPOJgIiYqoKS7rDSlnu5oX69n1H3.jpg', 'image/jpeg', 58042, 'TFQ_tPOJgIiYqoKS7rDSlnu5oX69n1H3', '127.0.0.1', NULL, 1620098530, NULL),
(210, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\yvjxVPpMRxLCJNVxjhnaCbXFwGGwQrcP.jpg', 'image/jpeg', 58827, 'yvjxVPpMRxLCJNVxjhnaCbXFwGGwQrcP', '127.0.0.1', NULL, 1620098530, NULL),
(211, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\12j26Xd8OUeSH7F_C84NZlNmvpA1afUm.jpg', 'image/jpeg', 55237, '12j26Xd8OUeSH7F_C84NZlNmvpA1afUm', '127.0.0.1', NULL, 1620098530, NULL),
(212, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\UfGfHr0nYSsZeBMuzGRhuCYHKZozSZce.jpg', 'image/jpeg', 59296, 'UfGfHr0nYSsZeBMuzGRhuCYHKZozSZce', '127.0.0.1', NULL, 1620098530, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1591744412),
('m140209_132017_init', 1591744417),
('m140403_174025_create_account_table', 1591744418),
('m140504_113157_update_tables', 1591744420),
('m140504_130429_create_token_table', 1591744421),
('m140830_171933_fix_ip_field', 1591744422),
('m140830_172703_change_account_table_name', 1591744422),
('m141222_110026_update_ip_field', 1591744422),
('m141222_135246_alter_username_length', 1591744423),
('m150614_103145_update_social_account_table', 1591744423),
('m150623_212711_fix_username_notnull', 1591744423),
('m151218_234654_add_timezone_to_profile', 1591744423),
('m160929_103127_add_last_login_at_to_user_table', 1591744423),
('m140506_102106_rbac_init', 1591744520),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1591744520),
('m180523_151638_rbac_updates_indexes_without_prefix', 1591744521),
('m200409_110543_rbac_update_mssql_trigger', 1591744521);

-- --------------------------------------------------------

--
-- Table structure for table `nationalrity`
--

DROP TABLE IF EXISTS `nationalrity`;
CREATE TABLE IF NOT EXISTS `nationalrity` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสัญชาติ',
  `nationality_name` varchar(250) DEFAULT NULL COMMENT 'ชื่อสัญชาติ',
  PRIMARY KEY (`nationality_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `nationalrity`
--

INSERT INTO `nationalrity` (`nationality_id`, `nationality_name`) VALUES
(1, 'โปรตุเกส'),
(2, 'ดัตช์'),
(3, 'เยอรมัน'),
(4, 'ฝรั่งเศส'),
(5, 'เดนมาร์ก'),
(6, 'สวีเดน'),
(7, 'สวิส'),
(8, 'อิตาลี'),
(9, 'นอร์เวย์'),
(10, 'ออสเตรีย'),
(11, 'ไอริช'),
(12, 'ฟินแลนด์'),
(13, 'เบลเยียม'),
(14, 'สเปน'),
(15, 'รัสเซีย'),
(16, 'โปแลนด์'),
(17, 'เช็ก'),
(18, 'ฮังการี'),
(19, 'กรีก'),
(20, 'ยูโกสลาฟ'),
(21, 'ลักเซมเบิร์ก'),
(22, 'วาติกัน'),
(23, 'มอลตา'),
(24, 'ลีซู'),
(25, 'บัลแกเรีย'),
(26, 'โรมาเนีย'),
(27, 'ไซปรัส'),
(28, 'อเมริกัน'),
(29, 'แคนาดา'),
(30, 'เม็กซิโก'),
(31, 'คิวบา'),
(32, 'อาร์เจนตินา'),
(33, 'บราซิล'),
(34, 'ชิลี'),
(35, 'อาข่า'),
(36, 'โคลัมเบีย'),
(37, 'ลั๊ว'),
(38, 'เปรู'),
(39, 'ปานามา'),
(40, 'อุรุกวัย'),
(41, 'เวเนซุเอลา'),
(42, 'เปอร์โตริโก้'),
(43, 'จีน'),
(44, 'อินเดีย'),
(45, 'เวียดนาม'),
(46, 'ญี่ปุ่น'),
(47, 'พม่า'),
(48, 'ฟิลิปปิน'),
(49, 'มาเลเซีย'),
(50, 'อินโดนีเซีย'),
(51, 'ปากีสถาน'),
(52, 'เกาหลีใต้'),
(53, 'สิงคโปร์'),
(54, 'เนปาล'),
(55, 'ลาว'),
(56, 'กัมพูชา'),
(57, 'ศรีลังกา'),
(58, 'ซาอุดีอาระเบีย'),
(59, 'อิสราเอล'),
(60, 'เลบานอน'),
(61, 'อิหร่าน'),
(62, 'ตุรกี'),
(63, 'บังกลาเทศ'),
(64, 'ถูกถอนสัญชาติ'),
(65, 'ซีเรีย'),
(66, 'อิรัก'),
(67, 'คูเวต'),
(68, 'บรูไน'),
(69, 'แอฟริกาใต้'),
(70, 'กะเหรี่ยง'),
(71, 'ลาหู่'),
(72, 'เคนยา'),
(73, 'อียิปต์'),
(74, 'เอธิโอเปีย'),
(75, 'ไนจีเรีย'),
(76, 'สหรัฐอาหรับเอมิเรตส์'),
(77, 'กินี'),
(78, 'ออสเตรเลีย'),
(79, 'นิวซีแลนด์'),
(80, 'ปาปัวนิวกินี'),
(81, 'ม้ง'),
(82, 'เมี่ยน'),
(85, 'จีนฮ่อ'),
(86, 'จีน (อดีตทหารจีนคณะชาติ ,อดีตทหารจีนชาติ)'),
(87, 'ผู้พลัดถิ่นสัญชาติพม่า'),
(88, 'ผู้อพยพเชื้อสายจากกัมพูชา'),
(89, 'ลาว (ลาวอพยพ)'),
(90, 'เขมรอพยพ'),
(91, 'ผู้อพยพอินโดจีนสัญชาติเวียดนาม'),
(96, 'อื่นๆ'),
(97, 'ไม่ได้สัญชาติไทย'),
(98, 'ไทย'),
(99, 'อัฟกัน'),
(100, 'บาห์เรน'),
(101, 'ภูฏาน'),
(102, 'จอร์แดน'),
(103, 'เกาหลีเหนือ'),
(104, 'มัลดีฟ'),
(105, 'มองโกเลีย'),
(106, 'โอมาน'),
(107, 'กาตาร์'),
(108, 'เยเมน'),
(110, 'หมู่เกาะฟิจิ'),
(111, 'คิริบาส'),
(112, 'นาอูรู'),
(113, 'หมู่เกาะโซโลมอน'),
(114, 'ตองก้า'),
(115, 'ตูวาลู'),
(116, 'วานูอาตู'),
(117, 'ซามัว'),
(118, 'แอลเบเนีย'),
(119, 'อันดอร์รา'),
(121, 'ไอซ์แลนด์'),
(122, 'ลิกเตนสไตน์'),
(123, 'โมนาโก'),
(124, 'ซานมารีโน'),
(125, 'บริติช  (อังกฤษ, สก็อตแลนด์)'),
(126, 'แอลจีเรีย'),
(127, 'แองโกลา'),
(128, 'เบนิน'),
(129, 'บอตสวานา'),
(130, 'บูร์กินาฟาโซ'),
(131, 'บุรุนดี'),
(132, 'แคเมอรูน'),
(133, 'เคปเวิร์ด'),
(134, 'แอฟริกากลาง'),
(135, 'ชาด'),
(136, 'คอสตาริกา'),
(137, 'คองโก'),
(138, 'ไอโวเรี่ยน'),
(139, 'จิบูตี'),
(140, 'อิเควทอเรียลกินี'),
(141, 'กาบอง'),
(142, 'แกมเบีย'),
(143, 'กานา'),
(144, 'กินีบีสเซา'),
(145, 'เลโซโท'),
(146, 'ไลบีเรีย'),
(147, 'ลิเบีย'),
(148, 'มาลากาซี'),
(149, 'มาลาวี'),
(150, 'มาลี'),
(151, 'มอริเตเนีย'),
(152, 'มอริเชียส'),
(153, 'โมร็อกโก'),
(154, 'โมซัมบิก'),
(155, 'ไนเจอร์'),
(156, 'รวันดา'),
(157, 'เซาโตเมและปรินซิเป'),
(158, 'เซเนกัล'),
(159, 'เซเชลส์'),
(160, 'เซียร์ราลีโอน'),
(161, 'โซมาลี'),
(162, 'ซูดาน'),
(163, 'สวาซี'),
(164, 'แทนซาเนีย'),
(165, 'โตโก'),
(166, 'ตูนิเซีย'),
(167, 'ยูกันดา'),
(168, 'ซาอีร์'),
(169, 'แซมเบีย'),
(170, 'ซิมบับเว'),
(171, 'แอนติกาและบาร์บูดา'),
(172, 'บาฮามาส'),
(173, 'บาร์เบโดส'),
(174, 'เบลิซ'),
(175, 'คอสตาริกา'),
(176, 'โดมินิกา'),
(177, 'โดมินิกัน'),
(178, 'เอลซัลวาดอร์'),
(179, 'เกรเนดา'),
(180, 'กัวเตมาลา'),
(181, 'เฮติ'),
(182, 'ฮอนดูรัส'),
(183, 'จาเมกา'),
(184, 'นิการากัว'),
(185, 'เซนต์คิตส์และเนวิส'),
(186, 'เซนต์ลูเซีย'),
(187, 'เซนต์วินเซนต์และเกรนาดีนส์'),
(188, 'ตรินิแดดและโตเบโก'),
(189, 'โบลีเวีย'),
(190, 'เอกวาดอร์'),
(191, 'กายอานา'),
(192, 'ปารากวัย'),
(193, 'ซูรินาเม'),
(194, 'อาหรับ'),
(195, 'คะฉิ่น'),
(196, 'ว้า'),
(197, 'ไทยใหญ่'),
(198, 'ไทยลื้อ'),
(199, 'ขมุ'),
(200, 'ตองสู'),
(202, 'ละว้า'),
(204, 'ปะหร่อง'),
(205, 'ถิ่น'),
(206, 'ปะโอ'),
(207, 'มอญ'),
(208, 'มลาบรี'),
(211, 'จีน (จีนฮ่ออิสระ)'),
(213, 'จีน (จีนฮ่ออพยพ)'),
(215, 'ยูเครน'),
(218, 'จีน(ฮ่องกง)'),
(219, 'จีน(ไต้หวัน)'),
(220, 'โครเอเชีย'),
(221, 'คาซัค'),
(223, 'อาร์เมเนีย'),
(224, 'อาเซอร์ไบจาน'),
(225, 'จอร์เจีย'),
(226, 'คีร์กีซ'),
(227, 'ทาจิก'),
(228, 'อุซเบก'),
(229, 'หมู่เกาะมาร์แชลล์'),
(230, 'ไมโครนีเซีย'),
(231, 'ปาเลา'),
(232, 'เบลารุส'),
(233, 'บอสเนียและเฮอร์เซโกวีนา'),
(234, 'เติร์กเมน'),
(235, 'เอสโตเนีย'),
(236, 'ลัตเวีย'),
(237, 'ลิทัวเนีย'),
(238, 'มาซิโดเนีย'),
(239, 'มอลโดวา'),
(240, 'สโลวัก'),
(241, 'สโลวีน'),
(242, 'เอริเทรีย'),
(243, 'นามิเบีย'),
(244, 'โบลิเวีย'),
(245, 'หมู่เกาะคุก'),
(246, 'เนปาล (เนปาลอพยพ)'),
(247, 'มอญ  (ผู้พลัดถิ่นสัญชาติพม่า)'),
(248, 'ไทยใหญ่  (ผู้พลัดถิ่นสัญชาติพม่า)'),
(249, 'เวียดนาม  (ญวนอพยพ)'),
(250, 'มาเลเชีย  (อดีต จีนคอมมิวนิสต์)'),
(251, 'จีน  (อดีต จีนคอมมิวนิสต์)'),
(252, 'สิงคโปร์  (อดีต จีนคอมมิวนิสต์)'),
(253, 'กะเหรี่ยง  (ผู้หลบหนีเข้าเมือง)'),
(254, 'มอญ  (ผู้หลบหนีเข้าเมือง)'),
(255, 'ไทยใหญ่  (ผู้หลบหนีเข้าเมือง)'),
(256, 'กัมพูชา  (ผู้หลบหนีเข้าเมือง)'),
(257, 'มอญ  (ชุมชนบนพื้นที่สูง)'),
(258, 'กะเหรี่ยง  (ชุมชนบนพื้นที่สูง)'),
(259, 'ปาเลสไตน์'),
(260, 'ติมอร์ตะวันออก'),
(261, 'สละสัญชาติไทย'),
(262, 'เซอร์เบีย แอนด์ มอนเตเนโกร'),
(263, 'กัมพูชา(แรงงาน)'),
(264, 'พม่า(แรงงาน)'),
(265, 'ลาว(แรงงาน)'),
(266, 'เซอร์เบียน'),
(267, 'มอนเตเนกริน'),
(268, 'บุคคลที่ไม่มีสถานะทางทะเบียน'),
(269, 'ไม่ระบุ');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `short` varchar(1024) DEFAULT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `status` smallint(1) DEFAULT 1,
  `image_base_url` varchar(1024) DEFAULT NULL,
  `image_path` varchar(1024) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` date DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE,
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `published_at` (`published_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `category_id`, `title`, `short`, `text`, `slug`, `views`, `status`, `image_base_url`, `image_path`, `created_by`, `updated_by`, `published_at`, `created_at`, `updated_at`, `view`) VALUES
(9, 3, '4 กูรูด้านสิ่งแวดล้อมร่วมรณรงค์ให้คนไทย เริ่มต้นใหม่ในการดูแลสิ่งแวดล้อมอย่างจริงจัง หลังโควิด-19', '         รักษ์โลกให้เรียนรู้ กฟผ. เชิญกูรูดังด้านสิ่งแวดล้อมแนะแนวทางรักษ์โลกหลังวิกฤตโควิด-19 ชวนทุกภาคส่วนหันมาเรียนรู้เรื่องสิ่งแวดล้อม ย้ำธุรกิจหรือองค์กรที่ยั่งยืนต้องมีความสมดุลของเป้าหมายการดำเนินธุรกิจควบคู่ไปกับแนวทางการพัฒนาอย่างยั่งยืนที่คำนึงถึงสิ่งแวดล้อม พร้อมเปิดตัวนิทรรศการออนไลน์ แหล่งเรียนรู้การอนุรักษ์สิ่งแวดล้อมมิติใหม่ในแบบ New Normal ภายใต้โครงการณรงค์ Stop COVID Fast Restart Faster หยุดได้ไวเริ่มใหม่ได้เร็ว', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;รักษ์โลกให้เรียนรู้ กฟผ. เชิญกูรูดังด้านสิ่งแวดล้อมแนะแนวทางรักษ์โลกหลังวิกฤตโควิด-19 ชวนทุกภาคส่วนหันมาเรียนรู้เรื่องสิ่งแวดล้อม ย้ำธุรกิจหรือองค์กรที่ยั่งยืนต้องมีความสมดุลของเป้าหมายการดำเนินธุรกิจควบคู่ไปกับแนวทางการพัฒนาอย่างยั่งยืนที่คำนึงถึงสิ่งแวดล้อม พร้อมเปิดตัวนิทรรศการออนไลน์ แหล่งเรียนรู้การอนุรักษ์สิ่งแวดล้อมมิติใหม่ในแบบ New Normal ภายใต้โครงการณรงค์ Stop COVID Fast Restart Faster หยุดได้ไวเริ่มใหม่ได้เร็ว</p>\r\n<p>&nbsp;การไฟฟ้าฝ่ายผลิตแห่งประเทศไทย (กฟผ.) จัดงานวันสิ่งแวดล้อม กฟผ. ในวันสิ่งแวดล้อมโลก 5 มิถุนายน2563 ด้วยการจัดเสวนา EGAT GURU Talk ครั้งที่ 2 แบบ Live สด รับ New Normal ในหัวข้อ &ldquo;Action for Green รักษ์โลกให้เรียนรู้&rdquo; เพื่อร่วมหาแนวทางดูแลสิ่งแวดล้อมหลังวิกฤตโควิด-19 กับกูรูดังด้านสิ่งแวดล้อม ได้แก่ศาสตราจารย์ ดร.พิสุทธิ์ เพียรมนกุล รองคณบดีด้านยุทธศาสตร์และนวัตกรรม คณะวิศวกรรมศาสตร์ จุฬาลงกรณมหาวิทยาลัย ในฐานะกรรมการ กฟผ. คุณติ๊ก เจษฎาภรณ์ ผลดี ดารานักแสดง ผู้ดำเนินรายการเนวิเกเตอร์และรายการ The Brothers Thailand คุณพิมพรรณ ดิศกุล ณ อยุธยา ผู้อำนวยการเครือข่ายเพื่อความยั่งยืนแห่งประเทศไทย และคุณปิยะชาติ อิศรภักดี ประธานเจ้าหน้าที่บริหารบริษัท แบรนดิ คอร์ปอเรชัน จำกัด จากห้องออดิทอเรียม กฟผ.สำนักงานกลาง อำเภอบางกรวย จังหวัดนนทบุรี</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ศาสตราจารย์ ดร.พิสุทธิ์ เพียรมนกุล ให้ทัศนะว่า วันสิ่งแวดล้อมโลกปีนี้ ให้ความสำคัญกับเรื่องความหลากหลายทางชีวภาพ (Bio Diversity) ซึ่งมีผลมาจากปัญหาไฟป่าที่เกิดขึ้นในพื้นที่ที่มีความหลากหลายทางชีวภาพสูงระดับโลกอย่างประเทศออสเตรเลีย และป่าอเมซอน สาเหตุสำคัญของปัญหาฝุ่นละอองขนาดเล็ก PM2.5 ความแปรปรวนของสภาพอากาศทั่วโลก และคุณภาพชีวิตที่แย่ลงของสิ่งมีชีวิต ไม่ว่าจะคน สัตว์ หรือพืช ซึ่งการดำเนินการของทุกองค์กรหลังจากจบวิกฤตโควิด-19 นี้จะต้องปรับตัวเพื่อรองรับความเปลี่ยนแปลงและการดำเนินชีวิตปกติในรูปแบบใหม่ (New Normal) โดยต้องนำแผนธุรกิจ แผนความยั่งยืน และแผนการดำเนินชีวิตแบบ New Normal มาปรับใช้ควบคู่กันอย่างสมดุล เพื่อนำไปสู่การเป็นองค์การแห่งความยั่งยืนอย่างแท้จริง</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;ด้านคุณติ๊ก เจษฎาภรณ์ ผลดี ให้แนวคิดว่า ปัจจุบันทั่วโลกให้ความสำคัญกับการรณรงค์ด้านการอนุรักษ์ธรรมชาติมากขึ้น แต่เราก็ยังคงพบกับเหตุการณ์ไฟป่า การทิ้งขยะ หรือการทำลายสิ่งแวดล้อมอยู่การใช้เทคโนโลยีเข้ามาช่วยเหลือในการป้องกันปัญหาสิ่งแวดล้อมถือเป็นเรื่องที่ดี แต่ควรดำเนินการควบคู่ไปกับการจัดการด้านสิ่งแวดล้อมที่ดีของมนุษย์และการบังคับใช้กฎหมายร่วมกัน ทั้งนี้ควรเปิดโอกาสให้ประชาชนได้เข้าไปเที่ยวตามแหล่งท่องเที่ยวธรรมชาติ เพื่อเรียนรู้เสริมสร้างประสบการณ์ในการดูแลรักษาธรรมชาติ สามารถใช้ชีวิตอยู่ร่วมกับธรรมชาติอย่างกลมกลืน</p>\r\n<p>&nbsp;&nbsp;คุณพิมพรรณ ดิศกุล ณ อยุธยา ได้ถ่ายทอดประสบการณ์จากการร่วมพัฒนาดอยตุง จังหวัดเชียงรายว่า ปัจจัยที่ทำให้คนอยู่ร่วมกับป่าได้อย่างยั่งยืนคือ ต้องขจัดความยากจน เข้าใจวิถีชีวิต ลักษณะพื้นที่ และระบบสาธารณูปโภค ซึ่งต้องอาศัยการมีส่วนร่วมจากทั้งชุมชน ภาครัฐ และภาคเอกชนในการแก้ปัญหา สำหรับในช่วงวิกฤตโควิด-19 ที่ผ่านมา นโยบายอยู่บ้านของประชาชน ทำให้มีขยะพลาสติกจากการสั่งซื้ออาหารออนไลน์จำนวนมาก ทางเครือข่ายจึงจัดทำโครงการพลาสติกกลับบ้านเพื่อนำพลาสติกมารีไซเคิลวนใช้ใหม่ โดยสามารถนำไปส่งได้ที่จุดรับฝากของภาคเอกชนที่มาร่วมเป็นจิตอาสา</p>\r\n<p>&nbsp;&nbsp; &nbsp;ด้านคุณปิยะชาติ อิศรภักดี กล่าวว่า กลยุทธ์ที่จะช่วยให้ภาคธุรกิจก้าวข้ามวิกฤตครั้งนี้ คือ การหาความสมดุลระหว่างธุรกิจ สิ่งแวดล้อม และผู้มีส่วนได้ส่วนเสียเพื่อให้เกิดความร่วมมือ เพราะในอนาคตคนจะสนใจความสำเร็จทางธุรกิจที่ให้ความสำคัญกับการดำเนินธุรกิจที่ส่งผลดีต่อคนในสังคมและสิ่งแวดล้อมซึ่งจะนำมาสู่ความเชื่อมั่นต่อองค์กรและเอื้อให้ธุรกิจเติบโต</p>\r\n<p>&nbsp;&nbsp;งานสิ่งแวดล้อม กฟผ. ปีนี้ ยังถือเป็นครั้งแรกที่ กฟผ. จัดสวนนิทรรศการออนไลน์ (E-Exhibition) เพื่อส่งเสริมการเรียนรู้สิ่งแวดล้อมด้านพลังงานแบบ New Normal ที่จะให้ความรู้สึกเสมือนได้เดินเยี่ยมชมนิทรรศการในสวนด้วยตัวเอง ภายใต้แนวคิด &ldquo;Action for Green รักษ์โลกให้เรียนรู้&rdquo; โดยรวบรวมความรู้และความสนุกมาไว้ถึง 16 จุด เช่น ยานยนต์ไฟฟ้า (EV Car) ซึ่งผู้เข้าชมจะได้พบกับชุดประกอบรถไฟฟ้าดัดแปลงที่จะเปลี่ยนรถยนต์เก่าให้เป็นรถไฟฟ้าในต้นทุนไม่เกิน 2 แสนบาท เยี่ยมชม EGAT Green Building ภายในอาคาร ท.103 ซึ่งเป็นอาคารอนุรักษ์พลังงานที่ออกแบบตามมาตรฐาน LEED ของประเทศสหรัฐอเมริกา ให้ประหยัดพลังงาน ช่วยลดความร้อนเข้าสู่ตัวอาคาร นอกจากนี้ภายในนิทรรศการได้ยกความสวยงามจากกังหันลมลำตะคองที่ใช้ผลิตไฟฟ้าจากบนยอดเขายายเที่ยง จ.นครราชสีมา มาไว้บนหน้าจอเสมือนไปเยือนด้วยตาตนเอง รวมถึงโครงการพลังงานแสงอาทิตย์ทุ่นลอยน้ำแบบไฮบริดที่ใหญ่ที่สุดในโลกจากเขื่อนสิรินธร จ.อุบลราชธานี ซึ่งผสมผสานการผลิตไฟฟ้าจากโซลาร์เซลล์ลอยน้ำและพลังน้ำจากเขื่อน ช่วยเสริมความมั่นคงกับการผลิตไฟฟ้าจากพลังงานหมุนเวียน ทั้งนี้ หากเยี่ยมชมนิทรรศการครบทุกจุดระหว่างวันที่ 5-12 มิถุนายน 2563 ยังสามารถลุ้นรับของรางวัลได้อีกด้วย โดยผู้ที่สนใจสามารถเข้าชมนิทรรศการได้ทาง https://e-exhibition.egat.co.th/</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&ldquo;กฟผ. เชื่อมั่นว่า การอนุรักษ์พลังงานเป็นการเรียนรู้ที่ไม่สิ้นสุด ทุกคนสามารถเริ่มได้ที่ตนเองโดยปรับตัวตามวิถีแนวทางใหม่ ซึ่งตลอดระยะเวลา 51 ปี กฟผ. ดำเนินกิจการโดยคำนึงถึงสิ่งแวดล้อมและคุณภาพชีวิตของชุมชนเป็นหลัก และในวิกฤตโควิด-19 นี้ กฟผ. ขอเป็นส่วนหนึ่งในการขับเคลื่อนสังคมด้วยกิจกรรมต่าง ๆที่สร้างสรรค์ขึ้นมาภายใต้แคมเปญ &ldquo;Stop COVID Fast Restart Faster หยุดได้ไว เริ่มใหม่ได้เร็ว&rdquo;</p>', 'stop-covid', 1, 0, 'http://faculty-ku.local/storage/source', '\\1\\Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-.jpg', 1, 1, NULL, 1592895803, 1620099271, ''),
(12, 3, 'Self-Service Kiosk Touch Screen 17\" 21\" 32\" (ขนาดตามต้องการ) ทนทานจากการใช้งานจริง ราคาพิเศษทุกรุ่น (จำนวนจำกัด) ', 'จำหน่ายและรับพัฒนาระบบ Self-Service Application \r\nตามความต้องการและระบบงานมาตรฐาน \r\nลูกค้าให้การยอมรับ ประสบการณ์กว่า 10 ปี\r\nเครื่องให้บริการอัตโนมัติ Touch Screen และ เครื่องพิมพ์บัตรคิว/สลิป\r\n', '<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">จำหน่ายและรับพัฒนาระบบ Self-Service Application</div>\r\n<div dir=\"auto\">ตามความต้องการและระบบงานมาตรฐาน</div>\r\n<div dir=\"auto\">ลูกค้าให้การยอมรับ ประสบการณ์กว่า 10 ปี</div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">เครื่องให้บริการอัตโนมัติ Touch Screen และ เครื่องพิมพ์บัตรคิว/สลิป</div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">Specification</div>\r\n<div dir=\"auto\">&nbsp; -Touch Screen 17\" 21\" 32\" นิ้ว</div>\r\n<div dir=\"auto\">&nbsp; -เครื่องอ่านบัตรประชาชน (Option)</div>\r\n<div dir=\"auto\">&nbsp; -เครื่องอ่าน QR Code</div>\r\n<div dir=\"auto\">&nbsp; -Windows OS</div>\r\n<div dir=\"auto\">อีกบริการงานสั่งผลิตพิเศษ เพื่อการใช้งานเฉพาะทาง</div>\r\n<div dir=\"auto\">อำนวยความสะดวกผู้ให้บริการ</div>\r\n</div>', 'hardware', 7, 1, 'http://faculty-ku.local/storage/source', '1\\0D5U4R_PwXjxiWN_10UIU1hcDCeaiMyX.jpg', 1, 1, NULL, 1620098567, 1620103457, '');

-- --------------------------------------------------------

--
-- Table structure for table `news_attachment`
--

DROP TABLE IF EXISTS `news_attachment`;
CREATE TABLE IF NOT EXISTS `news_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `ref_attribute` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_attachment_article` (`news_id`) USING BTREE,
  KEY `order` (`order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news_attachment`
--

INSERT INTO `news_attachment` (`id`, `news_id`, `path`, `base_url`, `type`, `size`, `name`, `created_at`, `order`, `ref_attribute`) VALUES
(1, 1, '\\1\\4hEabon70KqzOP7bE8tZBmPJn7n0Ia5E.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 143329, 'ใบเสนอราคา QO-2019092100013.pdf', 1572518992, NULL, NULL),
(2, 2, '\\1\\sByxviz0RXHEb2TxogTHDXVAL4wrpyzC.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 90911, '8D22851E12DC4EF7BCB6EA360BF12B8A.pdf', 1592055221, NULL, NULL),
(4, 2, '\\1\\t-CvlOvVoUVXHaOssTRhhDOhTvD6vutC.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 4916323, '20190211MOPH Connect &amp; Smart Q Concept.pdf', 1592055288, NULL, NULL),
(5, 5, '\\1\\7hIM8aoBJl0JIEHkXr3QHy31tBxWCTjb.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 275900, '4.1 webservice_0.pdf', 1592061156, NULL, NULL),
(6, 5, '\\1\\d_5N-RCuec_ZPE4egbSI9D5bFq49U1Ta.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 341790, '4.2  MOPH Connect api.pdf', 1592061156, NULL, NULL),
(7, 5, '\\1\\ocReeYvtI1ZD23p9XPzGK8jETYqvEoq2.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 1576623, '5. Decha WEB VIEW_edit.pdf', 1592061156, NULL, NULL),
(8, 5, '\\1\\Bkqv_yVRJlIyBEKEDH8SXJ2BPcsQWs01.xlsx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 9892, 'user-import.xlsx', 1592130685, NULL, NULL),
(9, 5, '\\1\\ZKKoZ8W8P8vRAcNN-Hj-LyiA2ltgc73j.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 16506, '19 - งานบิล.docx', 1592130685, NULL, NULL),
(10, 5, '\\1\\DWMzrPLB83zFFuSPBZEC9XvO9WjtZgGI.pptx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 743515, 'หัวข้อการทดสอบระบบ_mobile_app_01.pptx', 1592130685, NULL, NULL),
(13, 8, '\\1\\PGSjO5ggdNWxLeoLxMiwF2W1Eo47mBkk.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 105265, 'anyConnect-manual.pdf', 1598844476, NULL, NULL),
(14, 11, '\\1\\MB7OkVhwfCcQtehH5a_zf_TldPlfPbq3.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 105265, 'anyConnect-manual.pdf', 1598844636, NULL, NULL),
(15, 10, '\\1\\do3nhb4ywbUsb8LR29TZsdDnKySSJDOc.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15888, 'สร้างรายการ.docx', 1605085889, NULL, NULL),
(16, 10, '\\1\\JuEkqFxFCW6GdLt812Dtyut8BSThNoq_.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 369444, 'connect web เกษตร.pdf', 1605085889, NULL, NULL),
(17, 10, '\\1\\l-6zBg609W4EUwS8HU2oaczSNL8gz5Po.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 272358, 'API ฝ่ายแพทย์และอนามัย_v2_27Feb2020.pdf', 1605085889, NULL, NULL),
(18, 10, '\\1\\hKkuy4RClugk4hJL1WWNWCPZr3f2qr_U.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 302289, 'glide (4).jpg', 1605088244, NULL, 'photo'),
(19, 10, '\\1\\J5Zc8KZMyKZSxnTqmoS8TfuA4dNJLnWZ.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 377947, 'glide (3).jpg', 1605088244, NULL, 'photo'),
(20, 10, '\\1\\xkrbuIrIRUf4oIS65uj2NixmaGyt7QGs.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 370760, 'glide (2).jpg', 1605088244, NULL, 'photo'),
(21, 10, '\\1\\rq0CeMc6Iy4qgxB-8s3HXqJxIz4KU73T.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 287765, 'glide (1).jpg', 1605088244, NULL, 'photo'),
(22, 10, '\\1\\tLbvGyGE733ynnFTKc95QL_LAJAKwV7O.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 308334, 'glide.jpg', 1605088244, NULL, 'photo'),
(23, 12, '1\\TFQ_tPOJgIiYqoKS7rDSlnu5oX69n1H3.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 58042, '180464555_4051968614860716_3822961157013995034_n.jpg', 1620098567, NULL, 'photo'),
(24, 12, '1\\yvjxVPpMRxLCJNVxjhnaCbXFwGGwQrcP.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 58827, '180555725_4051968631527381_5951954107425564157_n.jpg', 1620098567, NULL, 'photo'),
(25, 12, '1\\12j26Xd8OUeSH7F_C84NZlNmvpA1afUm.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 55237, '180965159_4051968634860714_8114194146940296750_n.jpg', 1620098567, NULL, 'photo'),
(26, 12, '1\\UfGfHr0nYSsZeBMuzGRhuCYHKZozSZce.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 59296, '181049527_4051968628194048_4877749565687215771_n.jpg', 1620098567, NULL, 'photo');

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

DROP TABLE IF EXISTS `news_categories`;
CREATE TABLE IF NOT EXISTS `news_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE KEY `idx_article_category_slug` (`slug`) USING BTREE,
  KEY `fk_article_category_section` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`category_id`, `slug`, `title`, `icon`, `parent_id`, `status`, `created_at`, `updated_at`, `order_num`) VALUES
(1, 'queuesystem', 'ระบบจัดการคิว', 'far fa-newspaper', NULL, 1, 1572518477, 1620103515, 1),
(3, 'hardware', 'อุปกรณ์ระบบคิว', 'fab fa-airbnb', NULL, 1, 1592055764, 1620098156, 2),
(5, 'news', 'ทดสอบ', 'fab fa-adversal', NULL, 0, 1620098198, 1620098198, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `slug`, `title`, `body`, `view`, `status`, `created_at`, `updated_at`) VALUES
(1, 'page-index', 'Index', '<p><strong>All elements are live-editable, switch on Live Edit button to see this feature.</strong>&nbsp;</p><p>Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.&nbsp;Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, NULL, 1592029535),
(2, 'page-shop', 'Shop', '', NULL, 0, NULL, NULL),
(3, 'page-events', 'กิจกรรม', '<p>กิจกรรม</p>', '', 1, NULL, 1619666790),
(4, 'activity', 'ตารางกิจกรรม', '<p style=\"text-align: center;\">กิจกรรมของคณะ</p>', 'calendar', 1, NULL, 1619666791),
(5, 'coming-soon', 'Coming soon', '<h2 style=\"text-align: center;\"><strong>...</strong></h2>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 272px; top: 63.6px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', '', 1, NULL, 1592050337),
(6, 'page-news', 'สินค้าและบริการ', '<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\"><span class=\"h5\">จำหน่ายและรับพัฒนาระบบ Self-Service Application</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">ตามความต้องการและระบบงานมาตรฐาน</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">ลูกค้าให้การยอมรับ ประสบการณ์กว่า 10 ปี</span></div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\"><span class=\"h5\">เครื่องให้บริการอัตโนมัติ Touch Screen และ เครื่องพิมพ์บัตรคิว/สลิป</span></div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\"><span class=\"h5\">Specification</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -Touch Screen 17\" 21\" 32\" นิ้ว</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -เครื่องอ่านบัตรประชาชน (Option)</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -เครื่องอ่าน QR Code</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -Windows OS</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">อีกบริการงานสั่งผลิตพิเศษ เพื่อการใช้งานเฉพาะทาง</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">อำนวยความสะดวกผู้ให้บริการ</span></div>\r\n</div>', '', 1, NULL, 1620102972),
(7, 'technology', 'โปรเจคและงาน', '<section class=\"about-lists\">\r\n<div class=\"container aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div class=\"section-title\">\r\n<h2>โปรเจคและงาน</h2>\r\n</div>\r\n<div class=\"row no-gutters\">\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\">01\r\n<h4 style=\"color: gray;\">ให้คำปรึกษาเรื่องระบบ Queue System&nbsp;</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">02\r\n<h4 style=\"color: gray;\">ออกแบบ Web&amp;Application</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"200\">03\r\n<h4 style=\"color: gray;\">จัดหาติดตั้งระบบ และอุปกรณ์</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"300\">04\r\n<h4 style=\"color: gray;\">บริการ Service หลังการขาย</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"400\">05\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"500\">06\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"600\">07\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"700\">08\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"800\">09\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', '', 1, NULL, 1619674521),
(8, 'department', 'งานบริการวิชาการ', '<section id=\"about\" class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row no-gutters\">\r\n<div class=\"col-lg-6 video-box\" style=\"text-align: center;\">Andaman Pattana</div>\r\n<div class=\"col-lg-6 video-box\" style=\"text-align: center;\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</section>', '', 1, NULL, 1620110219),
(9, 'contact', 'ติดต่อเรา', '<p style=\"text-align: center;\">ติดต่อเรา</p>', 'contact', 1, NULL, 1592047012),
(10, 'masterscience', 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', '<p class=\"text-left\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>หลักสูตรวิทยาศาสตรมหาบัณฑิต</strong>&nbsp;สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งให้การศึกษา และส่งเสริมความรู้ด้านเทคโนโลยีระบบเกษตร เพื่อนำไปสู่การบูรณาการเทคโนโลยีที่ทันสมัยในระบบเกษตรจากการผลิตสู่การแปรรูป ประยุกต์ใช้เทคโนโลยีเครื่องจักรกลที่เหมาะสมเพื่อขยายการผลิต เสริมสร้างคุณภาพผลผลิตเกษตรด้วยเทคโนโลยีและการจัดการ มุ่งผลิตมหาบัณฑิตที่มีความรู้ และสามารถทำการวิจัยขั้นสูงทางเทคโนโลยีเครื่องจักรกล และเทคโนโลยีอื่นที่เกี่ยวข้องในระบบเกษตร ได้แก่ เทคโนโลยีที่ทันสมัยในระบบเกษตร การจัดการทรัพยากรดินและน้ำเพื่อการเกษตร การจัดการโรงเรือนทางการเกษตร เทคโนโลยีหลังการเก็บเกี่ยวและการแปรสภาพ การจัดการโลจิสติกส์และวิศวกรรมระบบเกษตร เทคโนโลยีสารสนเทศและการตัดสินใจ และการจัดการพลังงานในระบบเกษตร ซึ่งสามารถนำองค์ความรู้ที่ได้ไปใช้ในการแก้ไขปัญหาในระบบการผลิตทางการเกษตรได้อย่างมีกระบวนการและเป็นระบบ</p>\r\n<div>\r\n<h5 class=\"text-left\">ข้อมูลเพิ่มเติม</h5>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3%20%E0%B8%A7%E0%B8%97%E0%B8%A1%20%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3.pdf\" target=\"_blank\" rel=\"noopener\"><u>หลักสูตร วท.ม เทคโนโลยีระบบเกษตร !&nbsp;<em class=\"tiny material-icons dp48\">file_download</em></u></a></p>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B9%81%E0%B8%9C%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%20%E0%B8%9B%20%E0%B9%82%E0%B8%97.pdf\" target=\"_blank\" rel=\"noopener\"><u>แผนการศึกษา !&nbsp;<em class=\"tiny material-icons dp48\">file_download</em></u></a></p>\r\n</div>', '', 0, NULL, 1620097104),
(11, 'curriculum', 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', '<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; หลักสูตรวิทยาศาสตรบัณฑิต</strong>&nbsp;สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งผลิตบัณฑิตที่มีความรู้ทางด้านเทคโนโลยีเครื่องจักรกลเกษตร และเทคโนโลยีที่เกี่ยวข้อง ได้แก่ เทคโนโลยีการให้น้ำเพื่อการเกษตร เทคโนโลยีหลังการเก็บเกี่ยวและการแปรสภาพ ระบบควบคุมอัจฉริยะทางการเกษตร เทคโนโลยีสารสนเทศและการตัดสินใจ อากาศยานไร้คนขับเพื่อการเกษตร การจัดการโลจิสติกส์ ห่วงโซ่อุปทาน และห่วงโซ่คุณค่า เกษตรอินทรีย์ และพลังงานในระบบเกษตร เป็นต้น เพื่อเป็นนักเทคโนโลยีระบบเกษตร ที่สามารถนำองค์ความรู้ที่ได้ไปประยุกต์ใช้เพื่อการจัดการและแก้ไขปัญหาทางด้านการผลิตทางการเกษตรได้อย่างเป็นระบบ</p>\r\n<p><a href=\"https://agr-ku.netlify.app/assets/img/curriculum1.jpg\" data-fancybox=\"gallery\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://agr-ku.netlify.app/assets/img/curriculum1.jpg\" alt=\"\" width=\"1070\" height=\"763\" /></a></p>\r\n<p style=\"text-align: center;\"><a href=\"https://agr-ku.netlify.app/assets/img/curriculum2.jpg\" data-fancybox=\"gallery\"><img src=\"https://agr-ku.netlify.app/assets/img/curriculum2.jpg\" alt=\"\" width=\"1070\" height=\"767\" /></a></p>\r\n<h5 class=\"text-left\">ข้อมูลเพิ่มเติม</h5>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-%E0%B8%A7%E0%B8%97%E0%B8%9A-%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3.pdf\" target=\"_blank\" rel=\"noopener\">รายละเอียดหลักสูตร วท.บ-เทคโนโลยีระบบเกษตร !</a></p>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B9%81%E0%B8%9C%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%E0%B8%95%E0%B8%A5%E0%B8%AD%E0%B8%94%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B0%E0%B9%80%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-4%E0%B8%9B%E0%B8%B5.pdf\" target=\"_blank\" rel=\"noopener\">แผนการศึกษา !</a></p>', '', 0, NULL, 1619663026),
(12, 'about', 'เกี่ยวกับเรา', '<p>ห้างหุ้นส่วนจำกัด เป็นบริษัทที่รับทำระบบ Queue System ,Web Service,ระบบ LED ฯลฯxxxxxxxxxxxxxxx</p>', '', 1, 1592032697, 1620097701);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `avatar_base_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usertype_id` int(11) DEFAULT NULL COMMENT 'ประเภทผู้ใช้งาน',
  `user_profile_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หมายเลขประจำตัว',
  `user_course` int(11) DEFAULT NULL COMMENT 'หลักสูตร',
  `user_department` int(11) DEFAULT NULL COMMENT 'ภาควิชา',
  `user_faculty` int(11) DEFAULT NULL COMMENT 'คณะ',
  `user_sex_id` int(11) DEFAULT NULL COMMENT 'เพศ',
  `user_title_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Title Name',
  `user_academicprostion_id` int(11) DEFAULT NULL COMMENT 'User Academicprostion Id',
  `user_fname_th` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Fname Th',
  `user_lname_th` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Lname Th',
  `user_fname_eng` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Fname Eng',
  `user_lname_eng` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Lname Eng',
  `user_birthdate` date DEFAULT NULL COMMENT 'ว/ด/ปี เกิด',
  `user_province_id` int(11) DEFAULT NULL COMMENT 'จังหวัด',
  `user_country_id` int(11) DEFAULT NULL COMMENT 'ประเทศ',
  `user_nationality_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'สัญชาติ',
  `user_race_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เชื้อชาติ',
  `user_religion_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ศาสนา',
  `user_position_id` int(4) DEFAULT NULL COMMENT 'รหัสตำแหน่ง',
  `user_specialist` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ความเชี่ยวชาญ',
  `user_parentid` int(11) DEFAULT NULL COMMENT 'อยู่ภายใต้',
  `user_order` int(11) DEFAULT NULL COMMENT 'ลำดับ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`, `avatar_path`, `avatar_base_url`, `usertype_id`, `user_profile_id`, `user_course`, `user_department`, `user_faculty`, `user_sex_id`, `user_title_name`, `user_academicprostion_id`, `user_fname_th`, `user_lname_th`, `user_fname_eng`, `user_lname_eng`, `user_birthdate`, `user_province_id`, `user_country_id`, `user_nationality_id`, `user_race_id`, `user_religion_id`, `user_position_id`, `user_specialist`, `user_parentid`, `user_order`) VALUES
(1, 'Tanakorn Phompak', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 'Asia/Bangkok', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'http://faculty-ku.local/storage/source', 7, '543120100207', 1, 1, 1, NULL, '4', NULL, 'รัชฎา', 'นาไชยธง', 'ratchada', 'nachaitong', '2020-09-06', NULL, 80, '3', '3', '3', 1, NULL, NULL, NULL),
(2, 'ประชาสัมพันธ์', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', NULL, NULL, NULL, 2, '123456', 2, 1, 1, NULL, '4', NULL, 'ทดสอบระบบ', 'ทดสอบ', 'test', 'test2', '2020-09-14', NULL, 5, '1', '1', '3', 5, NULL, NULL, 2),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `PROVINCE_ID` int(5) NOT NULL AUTO_INCREMENT,
  `PROVINCE_CODE` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `PROVINCE_NAME` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `GEO_ID` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`PROVINCE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`PROVINCE_ID`, `PROVINCE_CODE`, `PROVINCE_NAME`, `GEO_ID`) VALUES
(1, '10', 'กรุงเทพมหานคร   ', 2),
(2, '11', 'สมุทรปราการ   ', 2),
(3, '12', 'นนทบุรี   ', 2),
(4, '13', 'ปทุมธานี   ', 2),
(5, '14', 'พระนครศรีอยุธยา   ', 2),
(6, '15', 'อ่างทอง   ', 2),
(7, '16', 'ลพบุรี   ', 2),
(8, '17', 'สิงห์บุรี   ', 2),
(9, '18', 'ชัยนาท   ', 2),
(10, '19', 'สระบุรี', 2),
(11, '20', 'ชลบุรี   ', 5),
(12, '21', 'ระยอง   ', 5),
(13, '22', 'จันทบุรี   ', 5),
(14, '23', 'ตราด   ', 5),
(15, '24', 'ฉะเชิงเทรา   ', 5),
(16, '25', 'ปราจีนบุรี   ', 5),
(17, '26', 'นครนายก   ', 2),
(18, '27', 'สระแก้ว   ', 5),
(19, '30', 'นครราชสีมา   ', 3),
(20, '31', 'บุรีรัมย์   ', 3),
(21, '32', 'สุรินทร์   ', 3),
(22, '33', 'ศรีสะเกษ   ', 3),
(23, '34', 'อุบลราชธานี   ', 3),
(24, '35', 'ยโสธร   ', 3),
(25, '36', 'ชัยภูมิ   ', 3),
(26, '37', 'อำนาจเจริญ   ', 3),
(27, '39', 'หนองบัวลำภู   ', 3),
(28, '40', 'ขอนแก่น   ', 3),
(29, '41', 'อุดรธานี   ', 3),
(30, '42', 'เลย   ', 3),
(31, '43', 'หนองคาย   ', 3),
(32, '44', 'มหาสารคาม   ', 3),
(33, '45', 'ร้อยเอ็ด   ', 3),
(34, '46', 'กาฬสินธุ์   ', 3),
(35, '47', 'สกลนคร   ', 3),
(36, '48', 'นครพนม   ', 3),
(37, '49', 'มุกดาหาร   ', 3),
(38, '50', 'เชียงใหม่   ', 1),
(39, '51', 'ลำพูน   ', 1),
(40, '52', 'ลำปาง   ', 1),
(41, '53', 'อุตรดิตถ์   ', 1),
(42, '54', 'แพร่   ', 1),
(43, '55', 'น่าน   ', 1),
(44, '56', 'พะเยา   ', 1),
(45, '57', 'เชียงราย   ', 1),
(46, '58', 'แม่ฮ่องสอน   ', 1),
(47, '60', 'นครสวรรค์   ', 2),
(48, '61', 'อุทัยธานี   ', 2),
(49, '62', 'กำแพงเพชร   ', 2),
(50, '63', 'ตาก   ', 4),
(51, '64', 'สุโขทัย   ', 2),
(52, '65', 'พิษณุโลก   ', 2),
(53, '66', 'พิจิตร   ', 2),
(54, '67', 'เพชรบูรณ์   ', 2),
(55, '70', 'ราชบุรี   ', 4),
(56, '71', 'กาญจนบุรี   ', 4),
(57, '72', 'สุพรรณบุรี   ', 2),
(58, '73', 'นครปฐม   ', 2),
(59, '74', 'สมุทรสาคร   ', 2),
(60, '75', 'สมุทรสงคราม   ', 2),
(61, '76', 'เพชรบุรี   ', 4),
(62, '77', 'ประจวบคีรีขันธ์   ', 4),
(63, '80', 'นครศรีธรรมราช   ', 6),
(64, '81', 'กระบี่   ', 6),
(65, '82', 'พังงา   ', 6),
(66, '83', 'ภูเก็ต   ', 6),
(67, '84', 'สุราษฎร์ธานี   ', 6),
(68, '85', 'ระนอง   ', 6),
(69, '86', 'ชุมพร   ', 6),
(70, '90', 'สงขลา   ', 6),
(71, '91', 'สตูล   ', 6),
(72, '92', 'ตรัง   ', 6),
(73, '93', 'พัทลุง   ', 6),
(74, '94', 'ปัตตานี   ', 6),
(75, '95', 'ยะลา   ', 6),
(76, '96', 'นราธิวาส   ', 6),
(77, '97', 'บึงกาฬ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
CREATE TABLE IF NOT EXISTS `race` (
  `race_id` int(5) NOT NULL AUTO_INCREMENT,
  `race_name` varchar(150) DEFAULT NULL COMMENT 'เชื้อชาติ',
  PRIMARY KEY (`race_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `race`
--

INSERT INTO `race` (`race_id`, `race_name`) VALUES
(1, 'โปรตุเกส'),
(2, 'ดัตช์'),
(3, 'เยอรมัน'),
(4, 'ฝรั่งเศส'),
(5, 'เดนมาร์ก'),
(6, 'สวีเดน'),
(7, 'สวิส'),
(8, 'อิตาลี'),
(9, 'นอร์เวย์'),
(10, 'ออสเตรีย'),
(11, 'ไอริช'),
(12, 'ฟินแลนด์'),
(13, 'เบลเยียม'),
(14, 'สเปน'),
(15, 'รัสเซีย'),
(16, 'โปแลนด์'),
(17, 'เช็ก'),
(18, 'ฮังการี'),
(19, 'กรีก'),
(20, 'ยูโกสลาฟ'),
(21, 'ลักเซมเบิร์ก'),
(22, 'วาติกัน'),
(23, 'มอลตา'),
(24, 'ลีซู'),
(25, 'บัลแกเรีย'),
(26, 'โรมาเนีย'),
(27, 'ไซปรัส'),
(28, 'อเมริกัน'),
(29, 'แคนาดา'),
(30, 'เม็กซิโก'),
(31, 'คิวบา'),
(32, 'อาร์เจนตินา'),
(33, 'บราซิล'),
(34, 'ชิลี'),
(35, 'อาข่า'),
(36, 'โคลัมเบีย'),
(37, 'ลั๊ว'),
(38, 'เปรู'),
(39, 'ปานามา'),
(40, 'อุรุกวัย'),
(41, 'เวเนซุเอลา'),
(42, 'เปอร์โตริโก้'),
(43, 'จีน'),
(44, 'อินเดีย'),
(45, 'เวียดนาม'),
(46, 'ญี่ปุ่น'),
(47, 'พม่า'),
(48, 'ฟิลิปปิน'),
(49, 'มาเลเซีย'),
(50, 'อินโดนีเซีย'),
(51, 'ปากีสถาน'),
(52, 'เกาหลีใต้'),
(53, 'สิงคโปร์'),
(54, 'เนปาล'),
(55, 'ลาว'),
(56, 'กัมพูชา'),
(57, 'ศรีลังกา'),
(58, 'ซาอุดีอาระเบีย'),
(59, 'อิสราเอล'),
(60, 'เลบานอน'),
(61, 'อิหร่าน'),
(62, 'ตุรกี'),
(63, 'บังกลาเทศ'),
(64, 'ถูกถอนสัญชาติ'),
(65, 'ซีเรีย'),
(66, 'อิรัก'),
(67, 'คูเวต'),
(68, 'บรูไน'),
(69, 'แอฟริกาใต้'),
(70, 'กะเหรี่ยง'),
(71, 'ลาหู่'),
(72, 'เคนยา'),
(73, 'อียิปต์'),
(74, 'เอธิโอเปีย'),
(75, 'ไนจีเรีย'),
(76, 'สหรัฐอาหรับเอมิเรตส์'),
(77, 'กินี'),
(78, 'ออสเตรเลีย'),
(79, 'นิวซีแลนด์'),
(80, 'ปาปัวนิวกินี'),
(81, 'ม้ง'),
(82, 'เมี่ยน'),
(83, 'จีนฮ่อ'),
(84, 'จีน (อดีตทหารจีนคณะชาติ ,อดีตทหารจีนชาติ)'),
(85, 'ผู้พลัดถิ่นสัญชาติพม่า'),
(86, 'ผู้อพยพเชื้อสายจากกัมพูชา'),
(87, 'ลาว (ลาวอพยพ)'),
(88, 'เขมรอพยพ'),
(89, 'ผู้อพยพอินโดจีนสัญชาติเวียดนาม'),
(90, 'อื่นๆ'),
(91, 'ไม่ได้สัญชาติไทย'),
(92, 'ไทย'),
(93, 'อัฟกัน'),
(94, 'บาห์เรน'),
(95, 'ภูฏาน'),
(96, 'จอร์แดน'),
(97, 'เกาหลีเหนือ'),
(98, 'มัลดีฟ'),
(99, 'มองโกเลีย'),
(100, 'โอมาน'),
(101, 'กาตาร์'),
(102, 'เยเมน'),
(103, 'หมู่เกาะฟิจิ'),
(104, 'คิริบาส'),
(105, 'นาอูรู'),
(106, 'หมู่เกาะโซโลมอน'),
(107, 'ตองก้า'),
(108, 'ตูวาลู'),
(109, 'วานูอาตู'),
(110, 'ซามัว'),
(111, 'แอลเบเนีย'),
(112, 'อันดอร์รา'),
(113, 'ไอซ์แลนด์'),
(114, 'ลิกเตนสไตน์'),
(115, 'โมนาโก'),
(116, 'ซานมารีโน'),
(117, 'บริติช  (อังกฤษ, สก็อตแลนด์)'),
(118, 'แอลจีเรีย'),
(119, 'แองโกลา'),
(120, 'เบนิน'),
(121, 'บอตสวานา'),
(122, 'บูร์กินาฟาโซ'),
(123, 'บุรุนดี'),
(124, 'แคเมอรูน'),
(125, 'เคปเวิร์ด'),
(126, 'แอฟริกากลาง'),
(127, 'ชาด'),
(128, 'คอสตาริกา'),
(129, 'คองโก'),
(130, 'ไอโวเรี่ยน'),
(131, 'จิบูตี'),
(132, 'อิเควทอเรียลกินี'),
(133, 'กาบอง'),
(134, 'แกมเบีย'),
(135, 'กานา'),
(136, 'กินีบีสเซา'),
(137, 'เลโซโท'),
(138, 'ไลบีเรีย'),
(139, 'ลิเบีย'),
(140, 'มาลากาซี'),
(141, 'มาลาวี'),
(142, 'มาลี'),
(143, 'มอริเตเนีย'),
(144, 'มอริเชียส'),
(145, 'โมร็อกโก'),
(146, 'โมซัมบิก'),
(147, 'ไนเจอร์'),
(148, 'รวันดา'),
(149, 'เซาโตเมและปรินซิเป'),
(150, 'เซเนกัล'),
(151, 'เซเชลส์'),
(152, 'เซียร์ราลีโอน'),
(153, 'โซมาลี'),
(154, 'ซูดาน'),
(155, 'สวาซี'),
(156, 'แทนซาเนีย'),
(157, 'โตโก'),
(158, 'ตูนิเซีย'),
(159, 'ยูกันดา'),
(160, 'ซาอีร์'),
(161, 'แซมเบีย'),
(162, 'ซิมบับเว'),
(163, 'แอนติกาและบาร์บูดา'),
(164, 'บาฮามาส'),
(165, 'บาร์เบโดส'),
(166, 'เบลิซ'),
(167, 'คอสตาริกา'),
(168, 'โดมินิกา'),
(169, 'โดมินิกัน'),
(170, 'เอลซัลวาดอร์'),
(171, 'เกรเนดา'),
(172, 'กัวเตมาลา'),
(173, 'เฮติ'),
(174, 'ฮอนดูรัส'),
(175, 'จาเมกา'),
(176, 'นิการากัว'),
(177, 'เซนต์คิตส์และเนวิส'),
(178, 'เซนต์ลูเซีย'),
(179, 'เซนต์วินเซนต์และเกรนาดีนส์'),
(180, 'ตรินิแดดและโตเบโก'),
(181, 'โบลีเวีย'),
(182, 'เอกวาดอร์'),
(183, 'กายอานา'),
(184, 'ปารากวัย'),
(185, 'ซูรินาเม'),
(186, 'อาหรับ'),
(187, 'คะฉิ่น'),
(188, 'ว้า'),
(189, 'ไทยใหญ่'),
(190, 'ไทยลื้อ'),
(191, 'ขมุ'),
(192, 'ตองสู'),
(193, 'ละว้า'),
(194, 'ปะหร่อง'),
(195, 'ถิ่น'),
(196, 'ปะโอ'),
(197, 'มอญ'),
(198, 'มลาบรี'),
(199, 'จีน (จีนฮ่ออิสระ)'),
(200, 'จีน (จีนฮ่ออพยพ)'),
(201, 'ยูเครน'),
(202, 'จีน(ฮ่องกง)'),
(203, 'จีน(ไต้หวัน)'),
(204, 'โครเอเชีย'),
(205, 'คาซัค'),
(206, 'อาร์เมเนีย'),
(207, 'อาเซอร์ไบจาน'),
(208, 'จอร์เจีย'),
(209, 'คีร์กีซ'),
(210, 'ทาจิก'),
(211, 'อุซเบก'),
(212, 'หมู่เกาะมาร์แชลล์'),
(213, 'ไมโครนีเซีย'),
(214, 'ปาเลา'),
(215, 'เบลารุส'),
(216, 'บอสเนียและเฮอร์เซโกวีนา'),
(217, 'เติร์กเมน'),
(218, 'เอสโตเนีย'),
(219, 'ลัตเวีย'),
(220, 'ลิทัวเนีย'),
(221, 'มาซิโดเนีย'),
(222, 'มอลโดวา'),
(223, 'สโลวัก'),
(224, 'สโลวีน'),
(225, 'เอริเทรีย'),
(226, 'นามิเบีย'),
(227, 'โบลิเวีย'),
(228, 'หมู่เกาะคุก'),
(229, 'เนปาล (เนปาลอพยพ)'),
(230, 'มอญ  (ผู้พลัดถิ่นสัญชาติพม่า)'),
(231, 'ไทยใหญ่  (ผู้พลัดถิ่นสัญชาติพม่า)'),
(232, 'เวียดนาม  (ญวนอพยพ)'),
(233, 'มาเลเชีย  (อดีต จีนคอมมิวนิสต์)'),
(234, 'จีน  (อดีต จีนคอมมิวนิสต์)'),
(235, 'สิงคโปร์  (อดีต จีนคอมมิวนิสต์)'),
(236, 'กะเหรี่ยง  (ผู้หลบหนีเข้าเมือง)'),
(237, 'มอญ  (ผู้หลบหนีเข้าเมือง)'),
(238, 'ไทยใหญ่  (ผู้หลบหนีเข้าเมือง)'),
(239, 'กัมพูชา  (ผู้หลบหนีเข้าเมือง)'),
(240, 'มอญ  (ชุมชนบนพื้นที่สูง)'),
(241, 'กะเหรี่ยง  (ชุมชนบนพื้นที่สูง)'),
(242, 'ปาเลสไตน์'),
(243, 'ติมอร์ตะวันออก'),
(244, 'สละสัญชาติไทย'),
(245, 'เซอร์เบีย แอนด์ มอนเตเนโกร'),
(246, 'กัมพูชา(แรงงาน)'),
(247, 'พม่า(แรงงาน)'),
(248, 'ลาว(แรงงาน)'),
(249, 'เซอร์เบียน'),
(250, 'มอนเตเนกริน'),
(251, 'บุคคลที่ไม่มีสถานะทางทะเบียน'),
(252, 'ไม่ระบุ');

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
CREATE TABLE IF NOT EXISTS `religion` (
  `religion_id` int(5) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(150) DEFAULT NULL COMMENT 'ศาสนา',
  PRIMARY KEY (`religion_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`religion_id`, `religion_name`) VALUES
(1, 'พุทธศาสนา'),
(2, 'ศาสนาอิสลาม'),
(3, 'ศาสนาคริสต์'),
(4, 'ศาสนาพราหมณ์-ฮินดู'),
(5, 'ศาสนาซิกข์');

-- --------------------------------------------------------

--
-- Table structure for table `research_attachment`
--

DROP TABLE IF EXISTS `research_attachment`;
CREATE TABLE IF NOT EXISTS `research_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `seotext`
--

DROP TABLE IF EXISTS `seotext`;
CREATE TABLE IF NOT EXISTS `seotext` (
  `seotext_id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `h1` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`seotext_id`) USING BTREE,
  UNIQUE KEY `model_item` (`class`,`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `seotext`
--

INSERT INTO `seotext` (`seotext_id`, `class`, `item_id`, `h1`, `title`, `keywords`, `description`) VALUES
(1, 'yii\\easyii\\modules\\page\\models\\Page', 1, '', 'EasyiiCMS demo', '', 'yii2, easyii, admin'),
(2, 'yii\\easyii\\modules\\page\\models\\Page', 2, 'Shop categories', 'Extended shop title', '', ''),
(3, 'yii\\easyii\\modules\\page\\models\\Page', 3, 'Shop search results', 'Extended shop search title', '', ''),
(4, 'yii\\easyii\\modules\\page\\models\\Page', 4, 'Shopping cart H1', 'Extended shopping cart title', '', ''),
(5, 'yii\\easyii\\modules\\page\\models\\Page', 5, 'Success', 'Extended order success title', '', ''),
(6, 'yii\\easyii\\modules\\page\\models\\Page', 6, 'News H1', 'Extended news title', '', ''),
(7, 'yii\\easyii\\modules\\page\\models\\Page', 7, 'Articles H1', 'Extended articles title', '', ''),
(8, 'yii\\easyii\\modules\\page\\models\\Page', 8, 'Photo gallery', 'Extended gallery title', '', ''),
(9, 'yii\\easyii\\modules\\page\\models\\Page', 9, 'Guestbook H1', 'Extended guestbook title', '', ''),
(10, 'yii\\easyii\\modules\\page\\models\\Page', 10, 'Frequently Asked Question', 'Extended faq title', '', ''),
(11, 'yii\\easyii\\modules\\page\\models\\Page', 11, 'Contact us', 'Extended contact title', '', ''),
(12, 'yii\\easyii\\modules\\catalog\\models\\Category', 2, 'Smartphones H1', 'Extended smartphones title', '', ''),
(13, 'yii\\easyii\\modules\\catalog\\models\\Category', 3, 'Tablets H1', 'Extended tablets title', '', ''),
(14, 'yii\\easyii\\modules\\catalog\\models\\Item', 1, 'Nokia 3310', '', '', ''),
(15, 'yii\\easyii\\modules\\catalog\\models\\Item', 2, 'Samsung Galaxy S6', '', '', ''),
(16, 'yii\\easyii\\modules\\catalog\\models\\Item', 3, 'Apple Iphone 6', '', '', ''),
(17, 'yii\\easyii\\modules\\news\\models\\News', 1, 'First news H1', '', '', 'First news H1 Seo Description'),
(18, 'yii\\easyii\\modules\\news\\models\\News', 2, 'Second news H1', '', '', ''),
(19, 'yii\\easyii\\modules\\news\\models\\News', 3, 'Third news H1', '', '', ''),
(20, 'yii\\easyii\\modules\\article\\models\\Category', 1, 'Articles category 1 H1', 'Extended category 1 title', '', ''),
(21, 'yii\\easyii\\modules\\article\\models\\Category', 3, 'Subcategory 1 H1', 'Extended subcategory 1 title', '', ''),
(22, 'yii\\easyii\\modules\\article\\models\\Category', 4, 'Subcategory 2 H1', 'Extended subcategory 2 title', '', ''),
(23, 'yii\\easyii\\modules\\article\\models\\Item', 1, 'First article H1', '', '', ''),
(24, 'yii\\easyii\\modules\\article\\models\\Item', 2, 'Second article H1', '', '', ''),
(25, 'yii\\easyii\\modules\\article\\models\\Item', 3, 'Third article H1', '', '', ''),
(26, 'yii\\easyii\\modules\\gallery\\models\\Category', 1, 'Album 1 H1', 'Extended Album 1 title', '', ''),
(27, 'yii\\easyii\\modules\\gallery\\models\\Category', 2, 'Album 2 H1', 'Extended Album 2 title', '', ''),
(28, 'common\\models\\Page', 12, 'เกี่ยวกับเรา', 'เกี่ยวกับเรา', '', ''),
(29, 'common\\models\\Page', 11, 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', '', 'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งผลิตบัณฑิตที่มีความรู้ทางด้านเทคโนโลยีเครื่องจักรกลเกษตร'),
(30, 'common\\models\\Page', 10, 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', '', ''),
(31, 'common\\models\\Page', 9, 'ติดต่อเรา', 'ติดต่อเรา', '', ''),
(34, 'common\\models\\Page', 3, 'กิจกรรม', 'กิจกรรม', '', 'กิจกรรม');

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique` (`provider`,`client_id`) USING BTREE,
  UNIQUE KEY `account_unique_code` (`code`) USING BTREE,
  KEY `fk_user_account` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) DEFAULT 0,
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `name`, `frequency`) VALUES
(1, 'php', 1),
(2, 'yii2', 3),
(3, 'jquery', 2),
(4, 'html', 1),
(5, 'css', 1),
(6, 'bootstrap', 1),
(7, 'ajax', 1),
(8, 'levis', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags_assign`
--

DROP TABLE IF EXISTS `tags_assign`;
CREATE TABLE IF NOT EXISTS `tags_assign` (
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `class` (`class`) USING BTREE,
  KEY `item_tag` (`item_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tags_assign`
--

INSERT INTO `tags_assign` (`class`, `item_id`, `tag_id`) VALUES
('yii\\easyii\\modules\\news\\models\\News', 1, 8),
('yii\\easyii\\modules\\news\\models\\News', 1, 2),
('yii\\easyii\\modules\\news\\models\\News', 2, 2),
('yii\\easyii\\modules\\news\\models\\News', 2, 3),
('yii\\easyii\\modules\\news\\models\\News', 2, 4),
('yii\\easyii\\modules\\article\\models\\Item', 1, 1),
('yii\\easyii\\modules\\article\\models\\Item', 1, 5),
('yii\\easyii\\modules\\article\\models\\Item', 1, 6),
('yii\\easyii\\modules\\article\\models\\Item', 2, 2),
('yii\\easyii\\modules\\article\\models\\Item', 2, 3),
('yii\\easyii\\modules\\article\\models\\Item', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_academicposition`
--

DROP TABLE IF EXISTS `tb_academicposition`;
CREATE TABLE IF NOT EXISTS `tb_academicposition` (
  `user_academicpositionid` int(4) NOT NULL AUTO_INCREMENT,
  `user_academicposition` varchar(255) DEFAULT NULL COMMENT 'ตัวย่อตำแหน่งทางวิชาการ',
  `user_cademicposition_shortname` varchar(50) DEFAULT NULL COMMENT 'ตำแหน่งทางวิชาการ',
  PRIMARY KEY (`user_academicpositionid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_academicposition`
--

INSERT INTO `tb_academicposition` (`user_academicpositionid`, `user_academicposition`, `user_cademicposition_shortname`) VALUES
(1, 'อาจารย์', 'อ.'),
(2, 'ผู้ช่วยศาสตราจารย์ ย่อว่า ผศ.', 'ผศ.'),
(3, 'รองศาสตราจารย์ ย่อว่า รศ.', 'รศ.'),
(4, 'ศาสตราจารย์', 'ศ.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE IF NOT EXISTS `tb_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหลักสูตร',
  `course_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อหลักสูตร',
  `department_id` int(11) NOT NULL COMMENT 'ภาควิชา',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_course`
--

INSERT INTO `tb_course` (`course_id`, `course_name`, `department_id`) VALUES
(1, 'วท.บ-เทคโนโลยีระบบเกษตร', 1),
(2, 'วท.ม-เทคโนโลยีระบบเกษตร', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_department`
--

DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE IF NOT EXISTS `tb_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสภาควิชา',
  `department_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อภาควิชา',
  `faculty_id` int(11) NOT NULL COMMENT 'คณะ',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_department`
--

INSERT INTO `tb_department` (`department_id`, `department_name`, `faculty_id`) VALUES
(1, 'Andaman DEV', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_faculty`
--

DROP TABLE IF EXISTS `tb_faculty`;
CREATE TABLE IF NOT EXISTS `tb_faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสคณะ',
  `faculty_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อคณะ',
  `u_id` int(11) NOT NULL COMMENT 'รหัสมหาวิทยาลัย',
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_faculty`
--

INSERT INTO `tb_faculty` (`faculty_id`, `faculty_name`, `u_id`) VALUES
(1, 'Andaman Pattana', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_greduated_level`
--

DROP TABLE IF EXISTS `tb_greduated_level`;
CREATE TABLE IF NOT EXISTS `tb_greduated_level` (
  `greduated_level_ids` int(11) NOT NULL AUTO_INCREMENT,
  `greduated_level` varchar(255) DEFAULT NULL COMMENT 'ระดับการศึกษา',
  PRIMARY KEY (`greduated_level_ids`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_greduated_level`
--

INSERT INTO `tb_greduated_level` (`greduated_level_ids`, `greduated_level`) VALUES
(1, 'มัธยมศึกษาตอนต้น'),
(2, 'มัธยมศึกษาตอนปลาย'),
(3, 'ประกาศนียบัตรวิชาชีพ (ปวช.)'),
(4, 'ประกาศนียบัตรวิชาชีพชั้นสูง (ปวส.)'),
(5, 'ปริญญาตรี'),
(6, 'ปริญญาโท'),
(7, 'ปริญญาเอก');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research`
--

DROP TABLE IF EXISTS `tb_research`;
CREATE TABLE IF NOT EXISTS `tb_research` (
  `research_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(255) NOT NULL COMMENT 'ชื่องานวิจัย',
  `research_type_id` int(11) NOT NULL COMMENT 'ลักษณะงานวิจัย',
  `research_type_work_id` int(11) NOT NULL COMMENT 'ประเภทงานวิจัย',
  `research_year` int(11) NOT NULL COMMENT 'ปีที่พิมพ์',
  `research_date_begin` date NOT NULL COMMENT 'วันที่เริ่มทำ',
  `research_date_end` date NOT NULL COMMENT 'วันที่สื้นสุด',
  `research_status` int(11) NOT NULL COMMENT 'สถานะงานวิจัย',
  `research_detail` longtext DEFAULT NULL COMMENT 'รายละเอียด',
  `research_type_other` varchar(255) DEFAULT NULL COMMENT 'สาขาวิจัยอื่นๆ',
  `research_type_work_other` varchar(255) DEFAULT NULL COMMENT 'ประเภทงานวิจัยอื่นๆ',
  `created_by` int(11) DEFAULT NULL COMMENT 'ผู้บันทึก',
  `created_at` datetime DEFAULT NULL COMMENT 'เวลาที่บันทึก',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ผู้แก้ไข',
  `updated_at` datetime DEFAULT NULL COMMENT 'เวลาที่แก้ไข',
  PRIMARY KEY (`research_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_research`
--

INSERT INTO `tb_research` (`research_id`, `research_name`, `research_type_id`, `research_type_work_id`, `research_year`, `research_date_begin`, `research_date_end`, `research_status`, `research_detail`, `research_type_other`, `research_type_work_other`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'ทดสอบระบบ', 10, 7, 2563, '2020-11-11', '2020-11-11', 1, 'บทคัดย่อ', 'test', NULL, 1, '2020-11-11 15:28:32', 1, '2020-11-23 17:13:11'),
(2, 'ทดสอบระบบ', 2, 1, 2560, '2020-11-24', '2020-11-24', 1, 'บทคัดย่อ', '', NULL, 1, '2020-11-24 15:19:42', 1, '2020-11-24 15:20:10'),
(3, 'ทดสอบ', 1, 1, 2560, '2020-12-07', '2020-12-07', 0, 'บทคัดย่อ\r\n', '', NULL, 1, '2020-12-07 10:28:22', 1, '2020-12-07 10:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_researcher_onus`
--

DROP TABLE IF EXISTS `tb_researcher_onus`;
CREATE TABLE IF NOT EXISTS `tb_researcher_onus` (
  `researcher_onus_id` int(11) NOT NULL AUTO_INCREMENT,
  `researcher_onus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`researcher_onus_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_researcher_onus`
--

INSERT INTO `tb_researcher_onus` (`researcher_onus_id`, `researcher_onus`) VALUES
(1, 'รับผิดชอบหลัก'),
(2, 'ร่วมวิจัย'),
(3, 'ผู้ร่วมโครงการ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_attachment`
--

DROP TABLE IF EXISTS `tb_research_attachment`;
CREATE TABLE IF NOT EXISTS `tb_research_attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL COMMENT 'รหัสงานวิจัย',
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `ref_attribute` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_research_attachment`
--

INSERT INTO `tb_research_attachment` (`attachment_id`, `research_id`, `path`, `base_url`, `type`, `size`, `name`, `created_at`, `order`, `ref_attribute`) VALUES
(4, 7, '\\1\\Lojc4_pDgdQjw0NwVjUuP3JcdqV2bMw-.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 105265, 'anyConnect-manual.pdf', 1598786795, NULL, NULL),
(5, 7, '\\1\\rfUJxu_Tr2bTnR365FSyhy13W-PBSFbG.xls', 'http://faculty-ku.local/storage/source', 'application/vnd.ms-excel', 10378, 'ตารางแพทย์ประจำสัปดาห์ (1).xls', 1598786795, NULL, NULL),
(6, 8, '\\1\\c7CINEZWI4CUWrfZvAMtMCTfqbHNaM3B.xls', 'http://faculty-ku.local/storage/source', 'application/vnd.ms-excel', 10378, 'ตารางแพทย์ประจำสัปดาห์ (1).xls', 1598787779, NULL, NULL),
(7, 8, '\\1\\nge-QwoXOygQ56ihOKJ5kggAQi0vjcHY.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 20813, 'ระบบจองคิวหรือนัดหมาย.docx', 1598787779, NULL, NULL),
(17, 1, '\\1\\xdI3r-xO1Ov-2hHMVFn5IFDhBho2j0Y8.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 29614, 'AP_UAT_kubota_การเชื่อมต่อbooking.docx', 1606126391, NULL, 'attachments'),
(16, 1, '\\1\\lJjLp1OK9l__hrBR8hvxTP9GjDwUTjHX.png', 'http://faculty-ku.local/storage/source', 'image/png', 935516, 'Screenshot (3).png', 1606125726, NULL, 'photo'),
(18, 1, '\\1\\R_uNOjSMJnl0D2bSxRdkwe5Pz2UAGVxa.pptx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1592989, 'sdu_การเรียนการสอน.pptx', 1606126391, NULL, 'attachments'),
(19, 2, '\\1\\TG7e0PEdbtNsSWnHphCOiAJMxIcN3ZQX.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 341647, 'GLx5pTeR6VAURQArKI3dAOSOrzHkkpdk.jpg', 1606205982, NULL, 'photo'),
(20, 2, '\\1\\hhM28SWrTGve6g2fypUMI0OBBUSNTwFO.png', 'http://faculty-ku.local/storage/source', 'image/png', 936116, 'Screenshot (2).png', 1606205982, NULL, 'photo');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_type`
--

DROP TABLE IF EXISTS `tb_research_type`;
CREATE TABLE IF NOT EXISTS `tb_research_type` (
  `research_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_type_name` varchar(255) DEFAULT NULL COMMENT 'ลักษณะงานวิจัย',
  PRIMARY KEY (`research_type_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_research_type`
--

INSERT INTO `tb_research_type` (`research_type_id`, `research_type_name`) VALUES
(1, 'รายกรณีการศึกษาเฉพาะกรณี'),
(2, 'วิจัยเชิงพรรณา'),
(3, 'วิจัยเชิงสำรวจ'),
(4, 'เชิงสหสัมพันธ์'),
(5, 'เชิงทำนาย'),
(6, 'เชิงเปรียบเทียบ'),
(7, 'รายกรณีการศึกษาเฉพาะกรณี'),
(8, 'เชิงพัฒนา'),
(9, 'เชิงทดลอง'),
(10, 'อื่นๆ ระบุ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_type_copy1`
--

DROP TABLE IF EXISTS `tb_research_type_copy1`;
CREATE TABLE IF NOT EXISTS `tb_research_type_copy1` (
  `research_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_type_name` varchar(255) DEFAULT NULL COMMENT 'ลักษณะงานวิจัย',
  PRIMARY KEY (`research_type_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_research_type_copy1`
--

INSERT INTO `tb_research_type_copy1` (`research_type_id`, `research_type_name`) VALUES
(1, 'รายกรณีการศึกษาเฉพาะกรณี'),
(2, 'วิจัยเชิงพรรณา'),
(3, 'วิจัยเชิงสำรวจ'),
(4, 'เชิงสหสัมพันธ์'),
(5, 'เชิงทำนาย'),
(6, 'เชิงเปรียบเทียบ'),
(7, 'รายกรณีการศึกษาเฉพาะกรณี'),
(8, 'เชิงพัฒนา'),
(9, 'เชิงทดลอง'),
(10, 'อื่นๆ ระบุ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_type_work`
--

DROP TABLE IF EXISTS `tb_research_type_work`;
CREATE TABLE IF NOT EXISTS `tb_research_type_work` (
  `research_type_work_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทผลงาน',
  `research_type_work_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อประเภทผลงาน',
  PRIMARY KEY (`research_type_work_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_research_type_work`
--

INSERT INTO `tb_research_type_work` (`research_type_work_id`, `research_type_work_name`) VALUES
(1, 'บทความวิชาการ'),
(2, 'บทความวิจัย'),
(3, 'หนังสือ ตำรา'),
(4, 'โครงการวิจัยประเมินภายนอก'),
(5, 'โครงร่างวิจัย'),
(6, 'งานวิจัยเสร็จเล่ม'),
(7, 'อื่นๆ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_user_onus`
--

DROP TABLE IF EXISTS `tb_research_user_onus`;
CREATE TABLE IF NOT EXISTS `tb_research_user_onus` (
  `researcher_name_ids` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) DEFAULT NULL COMMENT 'รหัสงานวิจัย',
  `researcher_user_id` varchar(255) NOT NULL COMMENT 'ผู้ทำวิจัย',
  `researcher_onus_id` int(11) NOT NULL COMMENT 'ความรับผิดชอบ',
  PRIMARY KEY (`researcher_name_ids`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_research_user_onus`
--

INSERT INTO `tb_research_user_onus` (`researcher_name_ids`, `research_id`, `researcher_user_id`, `researcher_onus_id`) VALUES
(9, 10, '2', 1),
(8, 9, '3', 2),
(7, 9, '2', 1),
(11, 12, '2', 2),
(5, 10, '3', 1),
(6, 11, '3', 1),
(12, 1, '2', 1),
(13, 2, '2', 1),
(14, 3, '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_usertype`
--

DROP TABLE IF EXISTS `tb_usertype`;
CREATE TABLE IF NOT EXISTS `tb_usertype` (
  `usertype_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทผู้ใช้งาน',
  `usertype` varchar(255) DEFAULT NULL COMMENT 'ประเภทผู้ใช้งาน',
  PRIMARY KEY (`usertype_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_usertype`
--

INSERT INTO `tb_usertype` (`usertype_id`, `usertype`) VALUES
(2, 'อาจารย์'),
(3, 'เจ้าหน้าที่'),
(7, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_expertise`
--

DROP TABLE IF EXISTS `tb_user_expertise`;
CREATE TABLE IF NOT EXISTS `tb_user_expertise` (
  `user_expertise_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_expertise` varchar(255) DEFAULT NULL COMMENT 'ความเชี่ยวชาญ',
  PRIMARY KEY (`user_expertise_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_user_expertise`
--

INSERT INTO `tb_user_expertise` (`user_expertise_id`, `user_id`, `user_expertise`) VALUES
(7, 1, 'การวิเคราะห์และออกแบบระบบ'),
(6, 1, 'ระบบสนับสนุนการตัดสินใจ'),
(5, 1, 'ระบบสารสนเทศเพื่อการจัดการ'),
(9, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_greduated`
--

DROP TABLE IF EXISTS `tb_user_greduated`;
CREATE TABLE IF NOT EXISTS `tb_user_greduated` (
  `user_greduated_ids` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'เลขประจำตัวผู้ใช้งาน',
  `user_greduated_yr` varchar(4) DEFAULT NULL COMMENT 'ปีจบการศึกษา(พ.ศ.)',
  `user_greduated_level` varchar(100) DEFAULT NULL COMMENT 'ระดับการศึกษา',
  `user_greduated_degree` varchar(100) DEFAULT NULL COMMENT 'หลักสูตร',
  `user_greduated_major` varchar(100) DEFAULT NULL COMMENT 'สาขาวิชา',
  `user_greduated_educational` varchar(100) DEFAULT NULL COMMENT 'สถาบันการศึกษา',
  `user_greduated_country` int(5) DEFAULT NULL COMMENT 'ประเทศ',
  `create_at` datetime DEFAULT NULL COMMENT 'วันที่บันทึก',
  `update_at` datetime DEFAULT NULL COMMENT 'วันที่แก้ไข',
  `user_gpa` decimal(4,0) DEFAULT NULL COMMENT 'เกรดเฉลี่ยสะสม',
  PRIMARY KEY (`user_greduated_ids`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_user_greduated`
--

INSERT INTO `tb_user_greduated` (`user_greduated_ids`, `user_id`, `user_greduated_yr`, `user_greduated_level`, `user_greduated_degree`, `user_greduated_major`, `user_greduated_educational`, `user_greduated_country`, `create_at`, `update_at`, `user_gpa`) VALUES
(1, 1, '2560', '1', 'วทบ', 'วิทยาการคอม', 'เกษตรศาสตร์', 5, NULL, '2020-09-07 16:49:49', '3'),
(2, 4, '', '', 'ทดสอบ', '', '', NULL, '2020-11-23 15:17:58', '2020-11-23 15:17:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_position`
--

DROP TABLE IF EXISTS `tb_user_position`;
CREATE TABLE IF NOT EXISTS `tb_user_position` (
  `user_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_position` varchar(255) DEFAULT NULL,
  `user_position_parentid` int(11) DEFAULT NULL,
  `user_position_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_position_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_user_position`
--

INSERT INTO `tb_user_position` (`user_position_id`, `user_position`, `user_position_parentid`, `user_position_order`) VALUES
(1, 'คณบดี', NULL, NULL),
(2, 'รองคณบดี', NULL, NULL),
(3, 'ประธานหลักสูตร', NULL, NULL),
(4, 'หัวหน้าสาขา', NULL, NULL),
(5, 'ผู้ช่วยศาสตราจารย์', NULL, NULL),
(6, 'อาจารย์ประจำภาควิชา', NULL, NULL),
(7, 'หัวหน้าสำนักงาน', NULL, NULL),
(8, 'เจ้าหน้าที่สำนักงาน', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_title_name`
--

DROP TABLE IF EXISTS `tb_user_title_name`;
CREATE TABLE IF NOT EXISTS `tb_user_title_name` (
  `user_title_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_title_name` varchar(20) DEFAULT NULL,
  `user_sex_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`user_title_name_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_user_title_name`
--

INSERT INTO `tb_user_title_name` (`user_title_name_id`, `user_title_name`, `user_sex_id`) VALUES
(1, 'ไม่ระบุ', NULL),
(2, 'นาย', 1),
(3, 'นาง', 2),
(4, 'น.ส.', 2),
(5, 'ด.ช.', 1),
(6, 'ด.ญ.', 2),
(7, 'พญ.', 2),
(8, 'ท.พ.', 1),
(9, 'ท.พ. หญิง', 2),
(10, 'ม.ญ.', 1),
(11, 'ม.จ.', NULL),
(12, 'คุณหญิง', 2),
(13, 'พลทหาร', 1),
(14, 'พลทหารหญิง', 2),
(15, 'พลตำรวจ', 1),
(16, 'พลตำรวจหญิง', 2),
(17, 'ส.ต.', 1),
(18, 'ส.ต. หญิง', 2),
(19, 'จ.ต.', 1),
(20, 'จ.ต. หญิง', 2),
(21, 'ส.ต.ต.', 1),
(22, 'ส.ต.ต. หญิง', 2),
(23, 'ส.ห.', 1),
(24, 'ส.ท. หญิง', 2),
(25, 'จ.ท.', 1),
(26, 'จ.ท. หญิง', 2),
(27, 'ส.ต.ท.', 1),
(28, 'ส.ต.ท.หญิง', 2),
(29, 'ส.อ.', 1),
(30, 'ส.อ.หญิง', 2),
(31, 'จ.อ.', 1),
(32, 'จ.อ.หญิง', 2),
(33, 'ส.ต.อ.', 1),
(34, 'ส.ต.อ.หญิง', 2),
(35, 'จ.ส.ต.', 1),
(36, 'จ.ส.ต.หญิง', 2),
(37, 'พ.จ.ต.', 1),
(38, 'พ.จ.ต.หญิง', 2),
(39, 'พ.อ.ต.', 1),
(40, 'พ.อ.ต.หญิง', 2),
(41, 'จ.ส.ท.', 1),
(42, 'จ.ส.ท.หญิง', 2),
(43, 'พ.จ.ท.', 1),
(44, 'พ.จ.ท.หญิง', 2),
(45, 'พ.อ.ท.', 1),
(46, 'พ.อ.ท.หญิง', 2),
(47, 'ด.ต.', 1),
(48, 'ด.ต.หญิง', 2),
(49, 'จ.ส.อ.', 1),
(50, 'จ.ส.อ.หญิง', 2),
(51, 'พ.จ.อ.', 1),
(52, 'พ.จ.อ.หญิง', 2),
(53, 'พ.อ.อ.', 1),
(54, 'พ.อ.อ.หญิง', 2),
(55, 'ร.ต.', 1),
(56, 'ร.ต. หญิง', 2),
(57, 'นพ.', 1),
(58, 'ร.ต.-ร.น.', 1),
(59, 'ร.ต.-ร.น.หญิง', 2),
(60, 'ร.ต.ต.', 1),
(61, 'ร.ต.ต. หญิง', 2),
(62, 'ร.ท.', 1),
(63, 'ร.ท.หญิง', 2),
(64, 'ร.ท.-ร.น.', 1),
(65, 'ร.ท.-ร.น.หญิง', 2),
(66, 'ร.ต.ท.', 1),
(67, 'ร.ต.ท. หญิง', 2),
(68, 'ร.อ.', 1),
(69, 'ร.อ. หญิง', 2),
(70, 'ร.อ.-ร.น.', 1),
(71, 'ร.อ.-ร.น.หญิง', 2),
(72, 'ร.ต.อ.', 1),
(73, 'ร.ต.อ.หญิง', 2),
(74, 'พ.ต.', 1),
(75, 'พ.ต. หญิง', 2),
(76, 'น.ต.-ร.น.', 1),
(77, 'น.ต.-ร.น.หญิง', 2),
(78, 'น.ต.', 1),
(79, 'น.ต. หญิง', 2),
(80, 'พ.ต.ต.', 1),
(81, 'พ.ต.ต. หญิง', 2),
(82, 'พ.ท.', 1),
(83, 'พ.ท. หญิง', 2),
(84, 'น.ท.-ร.น.', 1),
(85, 'น.ท.-ร.น.หญิง', 2),
(86, 'น.ท.', 1),
(87, 'น.ท.หญิง', 2),
(88, 'พ.ต.ท.', 1),
(89, 'พ.ต.ท. หญิง', 2),
(90, 'พ.อ.', 1),
(91, 'พ.อ. หญิง', 2),
(92, 'น.อ.-ร.น.', 1),
(93, 'น.อ.-ร.น.หญิง', 2),
(94, 'น.อ.', 1),
(95, 'น.อ.หญิง', 2),
(96, 'พ.ต.อ.', 1),
(97, 'พ.ต.อ. หญิง', 2),
(98, 'อื่นๆ', NULL),
(99, 'พ.อ.(พิเศษ)', 1),
(100, 'พ.อ.(พิเศษ)หญิง', 2),
(101, 'น.อ.(พิเศษ)-ร.น.', 1),
(102, 'น.อ.(พิเศษ)-หญิง-ร.น', 2),
(103, 'น.อ.(พิเศษ)', 1),
(104, 'น.อ.(พิเศษ)หญิง', 2),
(105, 'พ.ต.อ.(พิเศษ)', 1),
(106, 'พ.ต.อ.(พิเศษ)หญิง', 2),
(107, 'พลจัตวา', 1),
(108, 'พลจัตวาหญิง', 2),
(109, 'พลเรือจัตวา', 1),
(110, 'พลเรือจัตวาหญิง', 2),
(111, 'พลอากาศจัตวา', 1),
(112, 'พลอากาศจัตวาหญิง', 2),
(113, 'พลตำรวจจัตวา', 1),
(114, 'พลตำรวจจัตวาหญิง', 2),
(115, 'พล.ต.', 1),
(116, 'พล.ต.หญิง', 2),
(117, 'พล.ร.ต.-ร.น.', 1),
(118, 'พล.ร.ต.-ร.น.หญิง', 2),
(119, 'พล.อ.ต.', 1),
(120, 'พล.อ.ต.หญิง', 2),
(121, 'พล.ต.ต.', 1),
(122, 'พล.ต.ต.หญิง', 2),
(123, 'พล.ท.', 1),
(124, 'พล.ท.หญิง', 2),
(125, 'พล.ร.ท.-ร.น.', 1),
(126, 'พล.ร.ท.-ร.น.หญิง', 2),
(127, 'พล.อ.ท.', 1),
(128, 'พล.ต.ท.-ร.น.หญิง', 2),
(129, 'พล.ต.ท.', 1),
(130, 'พล.ต.ท.หญิง', 2),
(131, 'พล.อ.', 1),
(132, 'พล.อ.หญิง', 2),
(133, 'พล.ร.อ.-ร.น.', 1),
(134, 'พล.ร.อ.-ร.น.หญิง', 2),
(135, 'พล.อ.อ.', 1),
(136, 'พล.อ.อ.หญิง', 2),
(137, 'พล.ต.อ.', 1),
(138, 'พล.ต.อ.หญิง', 2),
(139, 'จอมพล', 1),
(140, 'จอมพลหญิง', 2),
(141, 'จอมพลเรือ', 1),
(142, 'จอมพลเรือหญิง', 2),
(143, 'จอมพลอากาศ', 1),
(144, 'จอมพลอากาศหญิง', 2),
(145, 'อ.ส.', 1),
(146, 'อ.ส.หญิง', 2),
(147, 'ม.ล.', NULL),
(148, 'ม.ร.ว.', 1),
(149, 'ม.ร.ว. หญิง', 2),
(150, 'ศ.', NULL),
(151, 'ร.ศ.', NULL),
(152, 'ผ.ศ.', NULL),
(153, 'ดร.', NULL),
(154, 'รศ.ดร.', NULL),
(155, 'พระสังฆาธิการ', 1),
(156, 'พระราชมุณี', 1),
(157, 'พระครูปลัด', 1),
(158, 'พระมหา', 1),
(159, 'พระครู', 1),
(160, 'พระ*ไม่ใช้ ให้ใช้ G9', NULL),
(161, 'พระภิกษุ', 1),
(162, 'พระปลัด', 1),
(163, 'พระครูใบฏิกา', 1),
(164, 'พระสมุห์', 1),
(165, 'พระอาจารย์', 1),
(166, 'พระใบฏิกา', 1),
(167, 'แม่ชี', 2),
(168, 'สามเณร', 1),
(169, 'เจ้าอธิการ', NULL),
(170, 'พระอธิการ', NULL),
(171, 'ภารดา', 1),
(172, 'บาทหลวง', 1),
(173, 'ครู', NULL),
(174, 'อาจารย์', NULL),
(175, 'Mr.', 1),
(176, 'Mrs.', 2),
(177, 'Miss.', 2),
(178, 'น.ต.น.พ.', 1),
(179, 'น.ต.หญิง น.พ.', 2),
(180, 'น.ท.น.พ.', 1),
(181, 'น.ท.พ.ญ.', 2),
(182, 'น.พ.ม.ร.ว.', NULL),
(183, 'น.อ.น.พ.', 1),
(184, 'น.อ.พ.ญ.', 2),
(185, 'น.อ.น.พ.-ร.น.', 1),
(186, 'น.อ.พ.ญ.-ร.น.', 2),
(187, 'นตท.', 1),
(188, 'นนอ.', 1),
(189, 'นรจ.', 1),
(190, 'นรต.', 1),
(191, 'นรพ.', NULL),
(192, 'ผศ.ท.พ.', 1),
(193, 'ผศ.น.พ.', 1),
(194, 'ผศ.พ.ญ.', 2),
(195, 'ผศ. ม.ล.', NULL),
(196, 'ผศ. ร.อ.', NULL),
(197, 'พ.ญ. ม.ร.ว.', 2),
(198, 'พ.ต.น.พ.', 1),
(199, 'พ.ต.หญิง น.พ.', 2),
(200, 'พ.ต.ต. น.พ.', 1),
(201, 'พ.ต.อ.พิเศษ น.พ.', 1),
(202, 'พ.ต.อ.พิเศษ พ.ญ.', 2),
(203, 'พ.ต.อ.หญิง น.พ.', 1),
(204, 'พ.ท. น.พ.', 1),
(205, 'พ.ท. พ.ญ.', 2),
(206, 'พ.ห. ม.ล.', NULL),
(207, 'พ.อ. ม.ล.ว.', NULL),
(208, 'พ.อ. น.พ.', NULL),
(209, 'พ.อ.น.พ. หญิง', 2),
(210, 'พ.อ.หญิง ม.ร.ว.', 2),
(211, 'พระภิกษุ ร.ต.อ.', 1),
(212, 'พล.อ. ม.ล.ว.', NULL),
(213, 'พล.ต.ต. น.พ.', 1),
(214, 'พล.ต.ต. พ.ญ.', 2),
(215, 'พลสำรองพิเศษ', NULL),
(216, 'ร.ต. น.พ.', 1),
(217, 'ร.ต. พ.ญ.', 2),
(218, 'ร.ท. น.พ.', 1),
(219, 'ร.ท. พ.ญ.', 2),
(220, 'ร.อ. น.พ.', 1),
(221, 'ร.อ. พ.ญ.', 2),
(222, 'ร.ต. ดร.', NULL),
(223, 'ร.ท.ท.พ.', 1),
(224, 'ร.ท.ท.พ.หญิง', 2),
(225, 'ร.อ.ท.พ.', 1),
(226, 'ร.อ.ท.พ.หญิง', 2),
(227, 'รศ.น.พ.', 1),
(228, 'รศ.พ.ญ.', 2),
(229, 'ว่าที่ ร.ต.', 1),
(230, 'ว่าที่ ร.ท.', 1),
(231, 'ว่าที่ ร.ท.(หญิง)', 2),
(232, 'ว่าที่ ร.อ.', 1),
(233, 'ศจ.น.พ.', 1),
(234, 'ศจ.พ.ญ.', 2),
(235, 'ส.ต.ต.ม.ล.', NULL),
(236, 'พลฯอส.', NULL),
(237, 'ว่าที่ ด.ต.', 1),
(238, 'ว่าที่ ด.ต.หญิง', 2),
(239, 'ว่าที่ ร.ต.หญิง', 2),
(240, 'ว่าที่ ร.อ.หญิง', 2),
(241, 'ส.ท.', NULL),
(242, 'ผศ.ดร.', NULL),
(243, 'รอ.ญ.พญ.', NULL),
(244, 'คุณ', NULL),
(245, 'ว่าที่ พ.ต.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_title_name1`
--

DROP TABLE IF EXISTS `tb_user_title_name1`;
CREATE TABLE IF NOT EXISTS `tb_user_title_name1` (
  `user_title_name_id` varchar(11) NOT NULL,
  `user_title_name` varchar(20) DEFAULT NULL,
  `user_sex_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`user_title_name_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_user_title_name1`
--

INSERT INTO `tb_user_title_name1` (`user_title_name_id`, `user_title_name`, `user_sex_id`) VALUES
('0', 'ไม่ระบุ', NULL),
('01', 'นาย', 1),
('02', 'นาง', 2),
('03', 'น.ส.', 2),
('04', 'ด.ช.', 1),
('05', 'ด.ญ.', 2),
('07', 'พญ.', 2),
('08', 'ท.พ.', 1),
('09', 'ท.พ. หญิง', 2),
('100', 'ม.ญ.', 1),
('14', 'ม.จ.', NULL),
('15', 'คุณหญิง', 2),
('16', 'พลทหาร', 1),
('17', 'พลทหารหญิง', 2),
('18', 'พลตำรวจ', 1),
('19', 'พลตำรวจหญิง', 2),
('20', 'ส.ต.', 1),
('21', 'ส.ต. หญิง', 2),
('22', 'จ.ต.', 1),
('23', 'จ.ต. หญิง', 2),
('24', 'ส.ต.ต.', 1),
('25', 'ส.ต.ต. หญิง', 2),
('26', 'ส.ห.', 1),
('27', 'ส.ท. หญิง', 2),
('28', 'จ.ท.', 1),
('29', 'จ.ท. หญิง', 2),
('30', 'ส.ต.ท.', 1),
('31', 'ส.ต.ท.หญิง', 2),
('32', 'ส.อ.', 1),
('33', 'ส.อ.หญิง', 2),
('34', 'จ.อ.', 1),
('35', 'จ.อ.หญิง', 2),
('36', 'ส.ต.อ.', 1),
('37', 'ส.ต.อ.หญิง', 2),
('38', 'จ.ส.ต.', 1),
('39', 'จ.ส.ต.หญิง', 2),
('40', 'พ.จ.ต.', 1),
('41', 'พ.จ.ต.หญิง', 2),
('42', 'พ.อ.ต.', 1),
('43', 'พ.อ.ต.หญิง', 2),
('44', 'จ.ส.ท.', 1),
('45', 'จ.ส.ท.หญิง', 2),
('46', 'พ.จ.ท.', 1),
('47', 'พ.จ.ท.หญิง', 2),
('48', 'พ.อ.ท.', 1),
('49', 'พ.อ.ท.หญิง', 2),
('50', 'ด.ต.', 1),
('51', 'ด.ต.หญิง', 2),
('52', 'จ.ส.อ.', 1),
('53', 'จ.ส.อ.หญิง', 2),
('54', 'พ.จ.อ.', 1),
('55', 'พ.จ.อ.หญิง', 2),
('56', 'พ.อ.อ.', 1),
('57', 'พ.อ.อ.หญิง', 2),
('58', 'ร.ต.', 1),
('59', 'ร.ต. หญิง', 2),
('6', 'นพ.', 1),
('60', 'ร.ต.-ร.น.', 1),
('61', 'ร.ต.-ร.น.หญิง', 2),
('62', 'ร.ต.ต.', 1),
('63', 'ร.ต.ต. หญิง', 2),
('64', 'ร.ท.', 1),
('65', 'ร.ท.หญิง', 2),
('66', 'ร.ท.-ร.น.', 1),
('67', 'ร.ท.-ร.น.หญิง', 2),
('68', 'ร.ต.ท.', 1),
('69', 'ร.ต.ท. หญิง', 2),
('70', 'ร.อ.', 1),
('71', 'ร.อ. หญิง', 2),
('72', 'ร.อ.-ร.น.', 1),
('73', 'ร.อ.-ร.น.หญิง', 2),
('74', 'ร.ต.อ.', 1),
('75', 'ร.ต.อ.หญิง', 2),
('76', 'พ.ต.', 1),
('77', 'พ.ต. หญิง', 2),
('78', 'น.ต.-ร.น.', 1),
('79', 'น.ต.-ร.น.หญิง', 2),
('80', 'น.ต.', 1),
('81', 'น.ต. หญิง', 2),
('82', 'พ.ต.ต.', 1),
('83', 'พ.ต.ต. หญิง', 2),
('84', 'พ.ท.', 1),
('85', 'พ.ท. หญิง', 2),
('86', 'น.ท.-ร.น.', 1),
('87', 'น.ท.-ร.น.หญิง', 2),
('88', 'น.ท.', 1),
('89', 'น.ท.หญิง', 2),
('90', 'พ.ต.ท.', 1),
('91', 'พ.ต.ท. หญิง', 2),
('92', 'พ.อ.', 1),
('93', 'พ.อ. หญิง', 2),
('94', 'น.อ.-ร.น.', 1),
('95', 'น.อ.-ร.น.หญิง', 2),
('96', 'น.อ.', 1),
('97', 'น.อ.หญิง', 2),
('98', 'พ.ต.อ.', 1),
('99', 'พ.ต.อ. หญิง', 2),
('999', 'อื่นๆ', NULL),
('A1', 'พ.อ.(พิเศษ)', 1),
('A2', 'พ.อ.(พิเศษ)หญิง', 2),
('A3', 'น.อ.(พิเศษ)-ร.น.', 1),
('A4', 'น.อ.(พิเศษ)-หญิง-ร.น', 2),
('A5', 'น.อ.(พิเศษ)', 1),
('A6', 'น.อ.(พิเศษ)หญิง', 2),
('A7', 'พ.ต.อ.(พิเศษ)', 1),
('A8', 'พ.ต.อ.(พิเศษ)หญิง', 2),
('A9', 'พลจัตวา', 1),
('B1', 'พลจัตวาหญิง', 2),
('B2', 'พลเรือจัตวา', 1),
('B3', 'พลเรือจัตวาหญิง', 2),
('B4', 'พลอากาศจัตวา', 1),
('B5', 'พลอากาศจัตวาหญิง', 2),
('B6', 'พลตำรวจจัตวา', 1),
('B7', 'พลตำรวจจัตวาหญิง', 2),
('B8', 'พล.ต.', 1),
('B9', 'พล.ต.หญิง', 2),
('C1', 'พล.ร.ต.-ร.น.', 1),
('C2', 'พล.ร.ต.-ร.น.หญิง', 2),
('C3', 'พล.อ.ต.', 1),
('C4', 'พล.อ.ต.หญิง', 2),
('C5', 'พล.ต.ต.', 1),
('C6', 'พล.ต.ต.หญิง', 2),
('C7', 'พล.ท.', 1),
('C8', 'พล.ท.หญิง', 2),
('C9', 'พล.ร.ท.-ร.น.', 1),
('D1', 'พล.ร.ท.-ร.น.หญิง', 2),
('D2', 'พล.อ.ท.', 1),
('D3', 'พล.ต.ท.-ร.น.หญิง', 2),
('D4', 'พล.ต.ท.', 1),
('D5', 'พล.ต.ท.หญิง', 2),
('D6', 'พล.อ.', 1),
('D7', 'พล.อ.หญิง', 2),
('D8', 'พล.ร.อ.-ร.น.', 1),
('D9', 'พล.ร.อ.-ร.น.หญิง', 2),
('E1', 'พล.อ.อ.', 1),
('E2', 'พล.อ.อ.หญิง', 2),
('E3', 'พล.ต.อ.', 1),
('E4', 'พล.ต.อ.หญิง', 2),
('E5', 'จอมพล', 1),
('E6', 'จอมพลหญิง', 2),
('E7', 'จอมพลเรือ', 1),
('E8', 'จอมพลเรือหญิง', 2),
('E9', 'จอมพลอากาศ', 1),
('F1', 'จอมพลอากาศหญิง', 2),
('F2', 'อ.ส.', 1),
('F3', 'อ.ส.หญิง', 2),
('F4', 'ม.ล.', NULL),
('F5', 'ม.ร.ว.', 1),
('F6', 'ม.ร.ว. หญิง', 2),
('F7', 'ศ.', NULL),
('F8', 'ร.ศ.', NULL),
('F9', 'ผ.ศ.', NULL),
('G1', 'ดร.', NULL),
('G2', 'รศ.ดร.', NULL),
('G3', 'พระสังฆาธิการ', 1),
('G4', 'พระราชมุณี', 1),
('G5', 'พระครูปลัด', 1),
('G6', 'พระมหา', 1),
('G7', 'พระครู', 1),
('G8', 'พระ*ไม่ใช้ ให้ใช้ G9', NULL),
('G9', 'พระภิกษุ', 1),
('H1', 'พระปลัด', 1),
('H2', 'พระครูใบฏิกา', 1),
('H3', 'พระสมุห์', 1),
('H4', 'พระอาจารย์', 1),
('H5', 'พระใบฏิกา', 1),
('H6', 'แม่ชี', 2),
('H7', 'สามเณร', 1),
('H8', 'เจ้าอธิการ', NULL),
('H9', 'พระอธิการ', NULL),
('I1', 'ภารดา', 1),
('I2', 'บาทหลวง', 1),
('I3', 'ครู', NULL),
('I4', 'อาจารย์', NULL),
('I5', 'Mr.', 1),
('I6', 'Mrs.', 2),
('I7', 'Miss.', 2),
('I8', 'น.ต.น.พ.', 1),
('I9', 'น.ต.หญิง น.พ.', 2),
('J1', 'น.ท.น.พ.', 1),
('J2', 'น.ท.พ.ญ.', 2),
('J3', 'น.พ.ม.ร.ว.', NULL),
('J4', 'น.อ.น.พ.', 1),
('J5', 'น.อ.พ.ญ.', 2),
('J6', 'น.อ.น.พ.-ร.น.', 1),
('J7', 'น.อ.พ.ญ.-ร.น.', 2),
('J8', 'นตท.', 1),
('J9', 'นนอ.', 1),
('K1', 'นรจ.', 1),
('K2', 'นรต.', 1),
('K3', 'นรพ.', NULL),
('K4', 'ผศ.ท.พ.', 1),
('K5', 'ผศ.น.พ.', 1),
('K6', 'ผศ.พ.ญ.', 2),
('K7', 'ผศ. ม.ล.', NULL),
('K8', 'ผศ. ร.อ.', NULL),
('K9', 'พ.ญ. ม.ร.ว.', 2),
('L1', 'พ.ต.น.พ.', 1),
('L2', 'พ.ต.หญิง น.พ.', 2),
('L3', 'พ.ต.ต. น.พ.', 1),
('L4', 'พ.ต.อ.พิเศษ น.พ.', 1),
('L5', 'พ.ต.อ.พิเศษ พ.ญ.', 2),
('L6', 'พ.ต.อ.หญิง น.พ.', 1),
('L7', 'พ.ท. น.พ.', 1),
('L8', 'พ.ท. พ.ญ.', 2),
('L9', 'พ.ห. ม.ล.', NULL),
('M1', 'พ.อ. ม.ล.ว.', NULL),
('M2', 'พ.อ. น.พ.', NULL),
('M3', 'พ.อ.น.พ. หญิง', 2),
('M4', 'พ.อ.หญิง ม.ร.ว.', 2),
('M5', 'พระภิกษุ ร.ต.อ.', 1),
('M6', 'พล.อ. ม.ล.ว.', NULL),
('M7', 'พล.ต.ต. น.พ.', 1),
('M8', 'พล.ต.ต. พ.ญ.', 2),
('M9', 'พลสำรองพิเศษ', NULL),
('N1', 'ร.ต. น.พ.', 1),
('N2', 'ร.ต. พ.ญ.', 2),
('N3', 'ร.ท. น.พ.', 1),
('N4', 'ร.ท. พ.ญ.', 2),
('N5', 'ร.อ. น.พ.', 1),
('N6', 'ร.อ. พ.ญ.', 2),
('N7', 'ร.ต. ดร.', NULL),
('N8', 'ร.ท.ท.พ.', 1),
('N9', 'ร.ท.ท.พ.หญิง', 2),
('O1', 'ร.อ.ท.พ.', 1),
('O2', 'ร.อ.ท.พ.หญิง', 2),
('O3', 'รศ.น.พ.', 1),
('O4', 'รศ.พ.ญ.', 2),
('O5', 'ว่าที่ ร.ต.', 1),
('O6', 'ว่าที่ ร.ท.', 1),
('O7', 'ว่าที่ ร.ท.(หญิง)', 2),
('O8', 'ว่าที่ ร.อ.', 1),
('O9', 'ศจ.น.พ.', 1),
('P1', 'ศจ.พ.ญ.', 2),
('P2', 'ส.ต.ต.ม.ล.', NULL),
('P3', 'พลฯอส.', NULL),
('Q1', 'ว่าที่ ด.ต.', 1),
('Q2', 'ว่าที่ ด.ต.หญิง', 2),
('Q3', 'ว่าที่ ร.ต.หญิง', 2),
('Q4', 'ว่าที่ ร.อ.หญิง', 2),
('Q5', 'ส.ท.', NULL),
('Q6', 'ผศ.ดร.', NULL),
('Q7', 'รอ.ญ.พญ.', NULL),
('Q8', 'คุณ', NULL),
('Q9', 'ว่าที่ พ.ต.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `texts`
--

DROP TABLE IF EXISTS `texts`;
CREATE TABLE IF NOT EXISTS `texts` (
  `text_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`text_id`) USING BTREE,
  UNIQUE KEY `slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `texts`
--

INSERT INTO `texts` (`text_id`, `slug`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'footer-title', 'Footer', 'Andaman Pattana', 1, NULL, 1619667816);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_unique_username` (`username`) USING BTREE,
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(1, 'admin', 'admin-ku@gmail.com', '$2y$12$P/nrEYjCwBNEyQHt//O2VOJw/WjSjCoV32HuOXxthIDKmpP9LCalK', '7sCGkzBxTGIyoig1cxWzjlziAhH5nnDj', 1591830631, NULL, NULL, NULL, 1591830630, 1591830630, 0, 1620102902),
(2, 'demo', 'demo@demo.com', '$2y$12$gPty5oS/tETH3SdAdurlAOU3awRfck47ehd/j.ffnaSBWIAGcfOgS', 'znXxtr7d8nLWDyAJfO6ip1Q5M7DQ5ABf', 1592109874, NULL, NULL, '127.0.0.1', 1592109874, 1592109874, 0, 1606202720),
(5, 'kubota', 'agrspks@ku.ac.th', '$2y$12$DcIcbF7.voXZaZHyZbT2IOZJC1xdmnonn1BJGYXSz2m4qLUU11Kx6', 'aE3jnysb0bh-RxUePC5-9UhTbYN4NaUD', 1606115928, NULL, NULL, '127.0.0.1', 1606115928, 1606115928, 0, NULL),
(16, 'test', 'test_system@gmail.com', '$2y$12$9ISOpKP/2hD5IlQNQ2GKGuXbH7NbZecpvoi/NtxpzlX0T/gyU8nxW', 'VDDMcvQthfD8WxkboJazvkUseSx3I0wc', 1607071059, NULL, NULL, '127.0.0.1', 1607071059, 1607071059, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `widget_carousel`
--

DROP TABLE IF EXISTS `widget_carousel`;
CREATE TABLE IF NOT EXISTS `widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `status` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key` (`key`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `widget_carousel`
--

INSERT INTO `widget_carousel` (`id`, `key`, `status`) VALUES
(1, 'index', 1),
(2, 'test', 1),
(3, 'test4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `widget_carousel_item`
--

DROP TABLE IF EXISTS `widget_carousel_item`;
CREATE TABLE IF NOT EXISTS `widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `asset_url` varchar(1024) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `caption` varchar(1024) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_item_carousel` (`carousel_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `widget_carousel_item`
--

INSERT INTO `widget_carousel_item` (`id`, `carousel_id`, `base_url`, `path`, `asset_url`, `type`, `url`, `caption`, `status`, `order`, `created_at`, `updated_at`) VALUES
(4, 1, 'http://faculty-ku.local/storage/source', '\\1\\_smRUcrjsmJYAm-Ry-BkRGt-gMWcsj07.png', 'http://faculty-ku.local/storage/source/\\1\\_smRUcrjsmJYAm-Ry-BkRGt-gMWcsj07.png', 'image/png', '', '<h2>LED System</h2>', 1, 1, 1592020216, 1619778720),
(5, 1, 'http://faculty-ku.local/storage/source', '\\1\\0xFUZAZkaObPeBCWwkOORhy-rwPectXZ.png', 'http://faculty-ku.local/storage/source/\\1\\0xFUZAZkaObPeBCWwkOORhy-rwPectXZ.png', 'image/png', 'http://faculty-ku.local/', '<h2>Queue System & Service</h2>', 1, 3, 1592020242, 1605089194),
(6, 1, 'http://faculty-ku.local/storage/source', '\\1\\vt97Pj2k4mdLaDfTkji6sExWTT36Xgy1.png', 'http://faculty-ku.local/storage/source/\\1\\vt97Pj2k4mdLaDfTkji6sExWTT36Xgy1.png', 'image/png', '', '<h2>System & Software Service </h2>', 1, 2, 1592020264, 1605089183),
(7, 2, 'http://faculty-ku.local/storage/source', '\\1\\YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU.jpg', NULL, 'image/jpeg', '', '<p>ทดสอบ</p>', 1, 4, 1592385278, 1592385278),
(8, 2, 'http://faculty-ku.local/storage/source', '\\1\\ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI.jpg', NULL, 'image/jpeg', '', '<p>ทดสอบ</p>', 1, 5, 1592385379, 1592385379),
(9, 1, 'http://andaman-web.local/storage/source', '1\\M9X_nyZYm4o26pNWVY0BmJLy9hqIxFBt.png', 'http://andaman-web.local/storage/source/1\\M9X_nyZYm4o26pNWVY0BmJLy9hqIxFBt.png', 'image/png', '', '', 1, NULL, 1619592786, 1620103096);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
