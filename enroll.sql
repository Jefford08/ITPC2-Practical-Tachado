-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 03:12 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `courseID` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(30) NOT NULL,
  `credits` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `instructorID` int NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `instructorID` (`instructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=10235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `courseName`, `credits`, `description`, `instructorID`) VALUES
(234, 'BSIT', '16', 'Information Technology', 98261),
(354, 'BSEE', '14', 'Electrical Engineering', 93285);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE IF NOT EXISTS `enrollment` (
  `enrollID` int NOT NULL AUTO_INCREMENT,
  `studentID` int NOT NULL,
  `courseID` int NOT NULL,
  `enrollDate` date NOT NULL,
  `grade` double NOT NULL,
  PRIMARY KEY (`enrollID`),
  KEY `studentID` (`studentID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=87254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollID`, `studentID`, `courseID`, `enrollDate`, `grade`) VALUES
(86231, 3424, 234, '2025-11-03', 1.75),
(87253, 3485, 354, '2025-10-21', 1.2);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
CREATE TABLE IF NOT EXISTS `instructors` (
  `instructorID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=98262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructorID`, `name`, `email`, `department`, `password`) VALUES
(93285, 'Wendell Dadivas', 'Wendell001@gmail.com', 'BSEE', '0532Dadivas'),
(98261, 'Michael Reeves', 'M_Reeves@gmail.com', 'BSIT', 'Reeves_M15*');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `studentID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` int NOT NULL,
  `course` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentID`, `name`, `email`, `mobile`, `course`, `username`, `password`) VALUES
(3424, 'Jack Perry', 'JackP12@gmail.com', 2147483647, 'BSIT', 'Jperryswheel8', 'Jperry_12*'),
(3485, 'Johhny Bravo', 'JBravo_3@gmail.com', 2147483647, 'BSEE', 'Masculado_23', 'JBravo321_0');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructorID`) REFERENCES `instructors` (`instructorID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
