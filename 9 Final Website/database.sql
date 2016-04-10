-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- දායකයා: 127.0.0.1
-- උත්පාදන වේලාව: අ‍ප්‍රේල් 07, 2016 දින 03:35 ?.?. ට
-- සේවාදායකයේ අනුවාදය: 5.7.9
-- PHP අනුවාදය: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- දත්තගබඩාව: `cmreport`
--
DROP DATABASE `cmreport`;
CREATE DATABASE IF NOT EXISTS `cmreport` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cmreport`;

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `cmr_data`
--

DROP TABLE IF EXISTS `cmr_data`;
CREATE TABLE IF NOT EXISTS `cmr_data` (
  `cmr_data_idx` int(11) NOT NULL AUTO_INCREMENT,
  `cmr_data_title` varchar(10) NOT NULL,
  `cmr_id` int(11) NOT NULL,
  `val1` int(11) NOT NULL,
  `val2` int(11) NOT NULL,
  `val3` int(11) NOT NULL,
  `val4` int(11) NOT NULL,
  `average_marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmr_data_idx`),
  UNIQUE KEY `cmr_data_title` (`cmr_data_title`,`cmr_id`),
  KEY `fk_cmr_id` (`cmr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `cmr_data`
--

INSERT INTO `cmr_data` (`cmr_data_idx`, `cmr_data_title`, `cmr_id`, `val1`, `val2`, `val3`, `val4`, `average_marks`) VALUES
(3, 'cw1', 3, 30, 20, 10, 0, 48),
(4, 'exam', 3, 0, 10, 30, 20, 68),
(5, 'cw1', 5, 10, 20, 10, 10, 51),
(6, 'exam', 5, 0, 0, 0, 50, 82);

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `cmrs`
--

DROP TABLE IF EXISTS `cmrs`;
CREATE TABLE IF NOT EXISTS `cmrs` (
  `cmr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmr_title` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `cm_id` int(11) NOT NULL,
  `cl_id` int(11) NOT NULL,
  `cm_comment` text,
  `cm_approval` int(1) DEFAULT NULL,
  `dlt_approval` int(1) DEFAULT NULL,
  `dlt_comment` text,
  `submitted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cmr_id`),
  UNIQUE KEY `course_id` (`course_id`,`year`),
  KEY `fk_cm_staff_id` (`cm_id`),
  KEY `fk_cl_staff_id` (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `cmrs`
--

INSERT INTO `cmrs` (`cmr_id`, `cmr_title`, `course_id`, `year`, `cm_id`, `cl_id`, `cm_comment`, `cm_approval`, `dlt_approval`, `dlt_comment`, `submitted_date`) VALUES
(3, '2015 Session', 1, 2015, 4, 3, 'Report is acceptable', 1, 1, 'Report is approved', '2016-04-06 18:49:42'),
(4, '2015 Session', 3, 2015, 8, 9, NULL, NULL, NULL, NULL, NULL),
(5, 'New CMR for 2016', 1, 2016, 4, 3, 'This report is accepted', 1, 1, 'The report is acceped by Director of Leaning and Quality', '2016-04-07 09:27:17');

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `course_administrations`
--

DROP TABLE IF EXISTS `course_administrations`;
CREATE TABLE IF NOT EXISTS `course_administrations` (
  `ca_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `cl_id` int(11) NOT NULL,
  `cm_id` int(11) NOT NULL,
  PRIMARY KEY (`ca_id`),
  KEY `fk_ca_cl_id` (`cl_id`),
  KEY `fk_ca_cm_id` (`cm_id`),
  KEY `fk_ca_course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `course_administrations`
--

INSERT INTO `course_administrations` (`ca_id`, `course_id`, `year`, `cl_id`, `cm_id`) VALUES
(1, 1, 2016, 3, 4),
(2, 2, 2016, 8, 9),
(3, 4, 2016, 8, 9),
(4, 5, 2016, 12, 5);

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(10) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `unq_course_code` (`course_code`),
  KEY `fk_courses_fac_id` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_name`, `faculty_id`) VALUES
(1, 'C12458', 'Database Engineering', 1),
(2, 'C12100', 'Web Development', 1),
(3, 'C10100', 'Business Project Management', 2),
(4, 'C10010', 'Database Administration', 1),
(5, 'C12560', 'Civil Engineering', 3);

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `faculties`
--

DROP TABLE IF EXISTS `faculties`;
CREATE TABLE IF NOT EXISTS `faculties` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(50) NOT NULL,
  `pvc_id` int(11) NOT NULL,
  `dlt_id` int(11) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  KEY `fk_fac_pvc` (`pvc_id`),
  KEY `fk_fac_dlt` (`dlt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `faculty_name`, `pvc_id`, `dlt_id`) VALUES
(1, 'IT Department', 10, 11),
(2, ' Management of Business', 10, 11),
(3, 'Engineering', 13, 14);

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `staff_logins`
--

DROP TABLE IF EXISTS `staff_logins`;
CREATE TABLE IF NOT EXISTS `staff_logins` (
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_code` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'guest',
  `last_login` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`entry_id`),
  UNIQUE KEY `staff_code` (`staff_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `staff_logins`
--

INSERT INTO `staff_logins` (`entry_id`, `staff_code`, `password`, `role`, `last_login`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '2016-04-07 13:38:53'),
(2, 'L12478', 'e10adc3949ba59abbe56e057f20f883e', 'cl', '2016-04-06 07:49:42'),
(3, 'L9965', 'e10adc3949ba59abbe56e057f20f883e', 'cl', '2016-04-07 09:20:56'),
(4, 'L162547', 'e10adc3949ba59abbe56e057f20f883e', 'cm', '2016-04-07 14:23:03'),
(6, 'L13784', 'e10adc3949ba59abbe56e057f20f883e', 'guest', '2016-04-04 07:31:00'),
(7, 'L9321', 'e10adc3949ba59abbe56e057f20f883e', 'cm', '2016-04-05 10:43:23'),
(9, 'D141', 'e10adc3949ba59abbe56e057f20f883e', 'pvc', '2016-04-06 23:20:02'),
(10, 'D142', 'e10adc3949ba59abbe56e057f20f883e', 'dlt', '2016-04-07 14:44:04'),
(11, 'C3010', 'e10adc3949ba59abbe56e057f20f883e', 'cl', '2016-04-07 10:47:43'),
(12, 'D2000', 'e10adc3949ba59abbe56e057f20f883e', 'pvc', '2016-04-07 18:02:47'),
(13, 'D2001', 'e10adc3949ba59abbe56e057f20f883e', 'dlt', '2016-04-07 18:02:47');

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `staffs`
--

DROP TABLE IF EXISTS `staffs`;
CREATE TABLE IF NOT EXISTS `staffs` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_code` varchar(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `salutation` varchar(5) NOT NULL DEFAULT 'Dr',
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `tel_no` varchar(10) NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `unq_staff_code` (`staff_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `staffs`
--

INSERT INTO `staffs` (`staff_id`, `staff_code`, `first_name`, `last_name`, `salutation`, `email`, `address`, `city`, `tel_no`) VALUES
(1, 'L12478', 'Jane', 'Richardson', 'Mrs.', 'jane222@web.com', '111/1,Main Street', 'Colombo 8', '0715248564'),
(2, 'L13784', 'Leo', 'Atkins', 'Dr.', 'leoatk@cmrpl.com', '112,Park View', 'Colombo', '0112457399'),
(3, 'L9965', 'John', 'Smith', 'Dr.', 'johnsmith@gmail.com', '111/1,Main Street', 'Galle', '0778568954'),
(4, 'L162547', 'Joanna', 'Williams', 'Prof.', 'joaw12@gmail.com', '114,Main Road', 'Matara', '0715864891'),
(5, 'L9321', 'Richard', 'Smith', 'Dr.', 'rick_sm2@yahoo.com', '12, Main Street', 'Kandy', '0812547825'),
(6, 'B10214', 'Alan', 'McFarren', 'Dr.', 'almac@alanmc.com', '14/3, Wind Willow', 'Ragama', '0112458745'),
(7, 'B10250', 'Christina', 'Samuel', 'Prof.', 'tinaedu@zint.ac.lk', '58, Park View, Long Drive', 'Moratuwa', '0112587458'),
(8, 'C1014', 'Daniel', 'Marks', 'Prof.', 'dan093@gmail.com', '14, Highway View', 'Kalutara South', '0342547895'),
(9, 'C1015', 'Eden', 'Griever', 'Prof.', 'ed14_sol@gmail.com', '124/2, Marine Drive', 'Colombo 4', '0112587963'),
(10, 'D141', 'Royce', 'Geye', 'Dr.', 'roy147@gmail.com', '147-9, Main Road', 'Kalutara North', '0714452587'),
(11, 'D142', 'Gria', 'Matel', 'Prof.', 'griadolt@gmail.com', '478, Willow woods', 'Ratmalana', '0719865784'),
(12, 'C3010', 'Alex', 'Ronalds', 'Prof.', 'alex_ron@gmail.com', '587, Park Drive', 'Colombo 5', '0715247852'),
(13, 'D2000', 'Lara', 'Sharma', 'Dr.', 'laras@zint.ac.lk', '214, Marine Drive', 'Colombo 4', '0778598547'),
(14, 'D2001', 'Servoz', 'Fernando', 'Dr.', 'ser.fer@zint.ac.lk', '114, Wilsons Street, Second District', 'Colombo 11', '0785695635');

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
CREATE TABLE IF NOT EXISTS `student_courses` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `course_id` int(11) NOT NULL,
  `cw1` tinyint(4) DEFAULT NULL,
  `cw2` tinyint(4) DEFAULT NULL,
  `cw3` tinyint(4) DEFAULT NULL,
  `cw4` tinyint(4) DEFAULT NULL,
  `exam` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  UNIQUE KEY `unq_student_course` (`student_id`,`course_id`,`year`),
  KEY `fk_sc_course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `student_courses`
--

INSERT INTO `student_courses` (`sc_id`, `student_id`, `year`, `course_id`, `cw1`, `cw2`, `cw3`, `cw4`, `exam`) VALUES
(1, 1, 2016, 1, 85, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- වගුවක් සඳහා වගු සැකිල්ල `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(10) NOT NULL AUTO_INCREMENT,
  `student_code` varchar(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tel_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `unq_student_code` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- වගු සඳහා නික්ෂේප දත්ත `students`
--

INSERT INTO `students` (`student_id`, `student_code`, `first_name`, `last_name`, `dob`, `address1`, `address2`, `city`, `email`, `tel_no`) VALUES
(1, 'A12147', 'Ronald', 'Reyes', '1991-04-08', '1120', 'Central Park Road', 'Colombo 8', 'ronrey@gmail.com', '0112457852'),
(2, 'B12147', 'Alan', 'Majors', '1990-08-07', '113/2', 'Lonesome Road', 'Galle', 'alanxyz@hotmail.com', '0112477852'),
(3, 'C12457', 'Chris', 'Pratt', '1991-04-13', '87/3', 'Lords View', 'Nugegoda', 'chrisrox@gmail.com', '0785487917'),
(4, 'C14547', 'Colin', 'Arnolds', '1989-08-17', '33,Main Street', 'Clear Water', 'Maharagama', 'colin568@web.com', '0754758874'),
(5, 'A14574', 'Donald', 'Ramia', '1985-04-03', '989', 'Main Steet', 'Katana', 'ram748@web.com', '0754784545');

--
-- නික්ෂේපනය කරන ලද වගු සඳහා සීමා බාධක
--

--
-- වගුව සඳහා සීමා බාධක `cmr_data`
--
ALTER TABLE `cmr_data`
  ADD CONSTRAINT `fk_cmr_id` FOREIGN KEY (`cmr_id`) REFERENCES `cmrs` (`cmr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- වගුව සඳහා සීමා බාධක `cmrs`
--
ALTER TABLE `cmrs`
  ADD CONSTRAINT `fk_cl_staff_id` FOREIGN KEY (`cl_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_cm_staff_id` FOREIGN KEY (`cm_id`) REFERENCES `staffs` (`staff_id`);

--
-- වගුව සඳහා සීමා බාධක `course_administrations`
--
ALTER TABLE `course_administrations`
  ADD CONSTRAINT `fk_ca_cl_id` FOREIGN KEY (`cl_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_ca_cm_id` FOREIGN KEY (`cm_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_ca_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- වගුව සඳහා සීමා බාධක `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_courses_fac_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`);

--
-- වගුව සඳහා සීමා බාධක `faculties`
--
ALTER TABLE `faculties`
  ADD CONSTRAINT `fk_fac_dlt` FOREIGN KEY (`dlt_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_fac_pvc` FOREIGN KEY (`pvc_id`) REFERENCES `staffs` (`staff_id`);

--
-- වගුව සඳහා සීමා බාධක `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `fk_sc_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `fk_sc_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
