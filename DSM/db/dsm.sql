-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2018 at 03:56 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dsm`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

CREATE TABLE `tb_employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `USER_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_instructor`
--

CREATE TABLE `tb_instructor` (
  `instructor_id` int(11) NOT NULL,
  `instructor_name` varchar(100) DEFAULT NULL,
  `USER_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_instructor`
--

INSERT INTO `tb_instructor` (`instructor_id`, `instructor_name`, `USER_user_id`) VALUES
(1, 'Alice', 12),
(2, 'Jack Hannaford', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lesson`
--

CREATE TABLE `tb_lesson` (
  `lesson_id` int(11) NOT NULL,
  `lesson_date` date DEFAULT NULL,
  `lesson_price` double DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_lesson_plan`
--

CREATE TABLE `tb_lesson_plan` (
  `lesson_plan_id` int(11) NOT NULL,
  `lesson_plan_preatical` int(11) DEFAULT NULL,
  `lesson_plan_theoretical` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lesson_plan`
--

INSERT INTO `tb_lesson_plan` (`lesson_plan_id`, `lesson_plan_preatical`, `lesson_plan_theoretical`) VALUES
(2, 15, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE `tb_payment` (
  `payment_id` int(11) NOT NULL,
  `payment_is_installment` tinyint(1) DEFAULT '0',
  `payment_value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_payment`
--

INSERT INTO `tb_payment` (`payment_id`, `payment_is_installment`, `payment_value`) VALUES
(2, 0, 1700);

-- --------------------------------------------------------

--
-- Table structure for table `tb_registration`
--

CREATE TABLE `tb_registration` (
  `registration_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `LESSONPLAN_lesson_plan_id` int(11) DEFAULT NULL,
  `PAYMENT_payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_registration`
--

INSERT INTO `tb_registration` (`registration_id`, `student_id`, `LESSONPLAN_lesson_plan_id`, `PAYMENT_payment_id`) VALUES
(2, 4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_student`
--

CREATE TABLE `tb_student` (
  `student_id` int(11) NOT NULL,
  `student_address` varchar(255) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `USER_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_student`
--

INSERT INTO `tb_student` (`student_id`, `student_address`, `student_email`, `student_name`, `USER_user_id`) VALUES
(1, 'Raccon City , Stars room 120', 'jill@stars.com', 'Jill Valentine', 7),
(4, 'Raccon Forest', 'claire@re2.com', 'Claire Redfield', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `user_login` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_profile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `user_login`, `user_password`, `user_profile`) VALUES
(7, 'jill', '123', 'STUDENT'),
(9, 'claire', '123', 'STUDENT'),
(11, 'jack', '123', 'INSTRUCTOR'),
(12, 'ALice', '123', 'INSTRUCTOR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `FK_tb_employee_USER_user_id` (`USER_user_id`);

--
-- Indexes for table `tb_instructor`
--
ALTER TABLE `tb_instructor`
  ADD PRIMARY KEY (`instructor_id`),
  ADD KEY `FK_tb_instructor_USER_user_id` (`USER_user_id`);

--
-- Indexes for table `tb_lesson`
--
ALTER TABLE `tb_lesson`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `FK_tb_lesson_instructor_id` (`instructor_id`),
  ADD KEY `FK_tb_lesson_registration_id` (`registration_id`);

--
-- Indexes for table `tb_lesson_plan`
--
ALTER TABLE `tb_lesson_plan`
  ADD PRIMARY KEY (`lesson_plan_id`);

--
-- Indexes for table `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tb_registration`
--
ALTER TABLE `tb_registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `FK_tb_registration_PAYMENT_payment_id` (`PAYMENT_payment_id`),
  ADD KEY `FK_tb_registration_LESSONPLAN_lesson_plan_id` (`LESSONPLAN_lesson_plan_id`),
  ADD KEY `FK_tb_registration_student_id` (`student_id`);

--
-- Indexes for table `tb_student`
--
ALTER TABLE `tb_student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `FK_tb_student_USER_user_id` (`USER_user_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_login` (`user_login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_employee`
--
ALTER TABLE `tb_employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_instructor`
--
ALTER TABLE `tb_instructor`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_lesson`
--
ALTER TABLE `tb_lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_lesson_plan`
--
ALTER TABLE `tb_lesson_plan`
  MODIFY `lesson_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_registration`
--
ALTER TABLE `tb_registration`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_student`
--
ALTER TABLE `tb_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD CONSTRAINT `FK_tb_employee_USER_user_id` FOREIGN KEY (`USER_user_id`) REFERENCES `tb_user` (`user_id`);

--
-- Constraints for table `tb_instructor`
--
ALTER TABLE `tb_instructor`
  ADD CONSTRAINT `FK_tb_instructor_USER_user_id` FOREIGN KEY (`USER_user_id`) REFERENCES `tb_user` (`user_id`);

--
-- Constraints for table `tb_lesson`
--
ALTER TABLE `tb_lesson`
  ADD CONSTRAINT `FK_tb_lesson_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `tb_instructor` (`instructor_id`),
  ADD CONSTRAINT `FK_tb_lesson_registration_id` FOREIGN KEY (`registration_id`) REFERENCES `tb_registration` (`registration_id`);

--
-- Constraints for table `tb_registration`
--
ALTER TABLE `tb_registration`
  ADD CONSTRAINT `FK_tb_registration_LESSONPLAN_lesson_plan_id` FOREIGN KEY (`LESSONPLAN_lesson_plan_id`) REFERENCES `tb_lesson_plan` (`lesson_plan_id`),
  ADD CONSTRAINT `FK_tb_registration_PAYMENT_payment_id` FOREIGN KEY (`PAYMENT_payment_id`) REFERENCES `tb_payment` (`payment_id`),
  ADD CONSTRAINT `FK_tb_registration_student_id` FOREIGN KEY (`student_id`) REFERENCES `tb_student` (`student_id`);

--
-- Constraints for table `tb_student`
--
ALTER TABLE `tb_student`
  ADD CONSTRAINT `FK_tb_student_USER_user_id` FOREIGN KEY (`USER_user_id`) REFERENCES `tb_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
