-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2020 at 11:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolkenya`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `sid` int(10) NOT NULL,
  `date` date NOT NULL,
  `aid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`sid`, `date`, `aid`) VALUES
(2, '2024-02-12', 3),
(1, '2024-02-13', 4),
(2, '2024-02-14', 5);

-- --------------------------------------------------------

--
-- Table structure for table `attendancereport`
--

CREATE TABLE `attendancereport` (
  `aid` int(20) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendancereport`
--

INSERT INTO `attendancereport` (`aid`, `sid`, `status`) VALUES
(3, 'ST1000010001', 'Absent'),
(3, 'ST1000010002', 'Present'),
(4, 'ST1000010001', 'Present'),
(4, 'ST1000010002', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `hno` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `capacity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`hno`, `title`, `location`, `capacity`) VALUES
('4-A', 'Uhuru', 'Block-C', 45);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `teacher` varchar(50) NOT NULL,
  `classroom` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `stime` time NOT NULL,
  `etime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `subject`, `teacher`, `classroom`, `date`, `stime`, `etime`) VALUES
(1, 'MAT111', 'TC1000020000', '4-A', '2024-02-15', '08:30:00', '09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `examresult`
--

CREATE TABLE `examresult` (
  `exam` int(11) NOT NULL,
  `student` varchar(50) NOT NULL,
  `marks` int(10) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `examresult`
--

INSERT INTO `examresult` (`exam`, `student`, `marks`, `grade`) VALUES
(1, 'ST1000010001', 65, 'B-'),
(1, 'ST1000010002', 82, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `notice` varchar(1500) NOT NULL,
  `audience` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `notice`, `audience`, `date`) VALUES
(2, 'Parents meeting on school fees.', 'Parents', '2024-02-10 10:00:00'),
(3, 'Half-term break starts next week.', 'All', '2024-02-11 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `pid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `job` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `id_no` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`pid`, `fname`, `lname`, `contact`, `job`, `address`, `gender`, `id_no`, `email`) VALUES
(1, 'James', 'Mwangi', '0712345678', 'Engineer', 'Kenyatta Road, Nairobi', 'Male', '28765432', 'james.mwangi@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` varchar(25) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `parent` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `classroom` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `fname`, `lname`, `bday`, `address`, `parent`, `gender`, `classroom`, `email`) VALUES
('ST1000010001', 'Brian', 'Omondi', '2010-05-14', 'Thika Road, Nairobi', 1, 'Male', '4-A', 'brian.omondi@example.com'),
('ST1000010002', 'Aisha', 'Mohammed', '2011-07-29', 'Mombasa Road, Mombasa', 1, 'Female', '4-A', 'aisha.mohammed@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `skill` varchar(500) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `fname`, `lname`, `address`, `contact`, `bday`, `skill`, `gender`, `email`) VALUES
('TC1000020000', 'Mary', 'Kariuki', 'Ngong Road, Nairobi', '0723456789', '1985-08-10', 'Mathematics, Science', 'Female', 'mary.kariuki@example.com');
