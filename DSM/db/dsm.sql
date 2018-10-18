-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2018 at 05:21 AM
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

--
-- Dumping data for table `tb_employee`
--

INSERT INTO `tb_employee` (`employee_id`, `employee_name`, `USER_user_id`) VALUES
(1, 'Jill Valentine', 7);

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
(2, 'Jack Hannaford', 11),
(3, 'Onizuka', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lesson`
--

CREATE TABLE `tb_lesson` (
  `lesson_id` int(11) NOT NULL,
  `lesson_date` datetime DEFAULT NULL,
  `lesson_price` double DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lesson`
--

INSERT INTO `tb_lesson` (`lesson_id`, `lesson_date`, `lesson_price`, `lesson_type`, `instructor_id`, `registration_id`) VALUES
(1, '2028-12-12 20:00:00', 0, 'PRATICAL', 1, NULL),
(2, '2077-12-20 19:00:00', 0, 'PRATICAL', 2, 2),
(3, '2077-12-20 13:00:00', 0, 'THEORETICAL', 1, 5),
(4, '2019-08-13 21:00:00', 0, 'PRATICAL', 2, NULL),
(5, '2018-11-08 18:00:00', 0, 'PRATICAL', 3, NULL),
(6, '2019-01-12 08:00:00', 0, 'PRATICAL', 3, NULL),
(7, '2019-02-25 11:00:00', 0, 'THEORETICAL', 3, 2),
(8, '2019-01-19 07:00:00', 0, 'THEORETICAL', 3, 2),
(9, '2108-12-05 15:00:00', 0, 'THEORETICAL', 2, 5),
(10, '2019-05-12 13:00:00', 0, 'THEORETICAL', 1, 6),
(11, '2020-07-11 12:00:00', 0, 'PRATICAL', 2, 7),
(12, '2018-12-20 14:00:00', 0, 'PRATICAL', 2, NULL),
(13, '2018-10-10 12:00:00', 0, 'PRATICAL', 2, NULL),
(14, '2018-11-08 19:00:00', 0, 'THEORETICAL', 3, 2),
(15, '2018-12-05 16:00:00', 0, 'PRATICAL', 3, NULL),
(16, '2021-01-01 11:00:00', 0, 'PRATICAL', 3, NULL),
(17, '2020-08-08 12:00:00', 0, 'PRATICAL', 2, NULL),
(18, '2021-01-01 20:00:00', 0, 'THEORETICAL', 2, 2),
(19, '2077-12-20 20:00:00', 0, 'THEORETICAL', 2, 2),
(20, '2021-01-01 15:00:00', 0, 'THEORETICAL', 1, 2),
(21, '2108-12-20 21:00:00', 0, 'PRATICAL', 1, NULL),
(22, '2018-11-10 12:00:00', 0, 'THEORETICAL', 1, NULL),
(23, '2018-12-12 11:00:00', 0, 'THEORETICAL', 2, NULL),
(24, '2018-10-11 10:00:00', 0, 'THEORETICAL', 3, 2),
(25, '2018-10-12 09:00:00', 0, 'THEORETICAL', 3, NULL),
(26, '2018-10-10 20:00:00', 0, 'THEORETICAL', 2, 2),
(27, '2018-10-16 20:00:00', 0, 'THEORETICAL', 1, 5),
(28, '2018-10-11 11:00:00', 0, 'THEORETICAL', 2, NULL),
(29, '2018-10-12 18:00:00', 0, 'THEORETICAL', 1, NULL);

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
(2, 15, 10),
(3, 12, 10),
(4, 15, 10),
(5, 15, 12),
(6, 20, 12),
(7, 14, 8);

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
(2, 0, 1700),
(3, 0, 1700),
(4, 1, 1700),
(5, 0, 1800),
(6, 1, 2440),
(7, 0, 1520);

-- --------------------------------------------------------

--
-- Table structure for table `tb_registration`
--

CREATE TABLE `tb_registration` (
  `registration_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `LESSONPLAN_lesson_plan_id` int(11) DEFAULT NULL,
  `PAYMENT_payment_id` int(11) DEFAULT NULL,
  `WASAPPROVED` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_registration`
--

INSERT INTO `tb_registration` (`registration_id`, `student_id`, `LESSONPLAN_lesson_plan_id`, `PAYMENT_payment_id`, `WASAPPROVED`) VALUES
(2, 4, 2, 2, 1),
(5, 5, 5, 5, 0),
(6, 6, 6, 6, 0),
(7, 7, 7, 7, 0);

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
(4, 'Raccon Forest', 'claire@re2.com', 'Claire Redfield', 9),
(5, 'Africa', 'wesker@umbrella.com', 'Albert Wesker', 14),
(6, 'logo ali', 'Krauser@traitor.com', 'Jack Krauser', 17),
(7, 'Castelo dos ganados  - espanha', 'ramon@salazar.com', 'Ramon Salazar', 18);

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
(7, 'jill', '123', 'EMPLOYEE'),
(9, 'claire', '123', 'STUDENT'),
(11, 'jack', '123', 'INSTRUCTOR'),
(12, 'Alice', '123', 'INSTRUCTOR'),
(13, 'onizuka', '123', 'INSTRUCTOR'),
(14, 'wesker', '123', 'STUDENT'),
(17, 'krauser', '123', 'STUDENT'),
(18, 'salazar', '123', 'STUDENT');

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
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_instructor`
--
ALTER TABLE `tb_instructor`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_lesson`
--
ALTER TABLE `tb_lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tb_lesson_plan`
--
ALTER TABLE `tb_lesson_plan`
  MODIFY `lesson_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_registration`
--
ALTER TABLE `tb_registration`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_student`
--
ALTER TABLE `tb_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
