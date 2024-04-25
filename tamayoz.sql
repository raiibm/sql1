-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2024 at 12:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tamayoz`
--

-- --------------------------------------------------------

--
-- Table structure for table `cou`
--

CREATE TABLE `cou` (
  `id` int(11) NOT NULL,
  `cname` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cou`
--

INSERT INTO `cou` (`id`, `cname`) VALUES
(1, 'Java'),
(2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `ins`
--

CREATE TABLE `ins` (
  `id` int(11) NOT NULL,
  `iname` varchar(225) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `onum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ins`
--

INSERT INTO `ins` (`id`, `iname`, `birth`, `gender`, `email`, `onum`) VALUES
(1, 'muhammed', '1992-01-08', 'M', 'm@hotmail', 2011),
(2, 'Sara', '1991-11-18', 'F', 'SAa@hotmail', 2032);

-- --------------------------------------------------------

--
-- Table structure for table `stud`
--

CREATE TABLE `stud` (
  `id` int(11) NOT NULL,
  `sname` varchar(225) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `enr` date DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `lev` int(11) DEFAULT NULL,
  `cou` varchar(225) DEFAULT NULL,
  `GPA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stud`
--

INSERT INTO `stud` (`id`, `sname`, `birth`, `gender`, `enr`, `email`, `lev`, `cou`, `GPA`) VALUES
(1, 'joud', '2010-02-01', 'F', '2023-02-04', 'j@hotmail', 3, 'IT', 3.2),
(2, 'raghad', '2001-04-26', 'F', '2019-09-01', 'R@hotmail', 6, 'IT', 4.1),
(3, 'Reema', '2004-06-07', 'F', '2021-03-30', 'Ree@hotmail', 6, 'IS', 4.8),
(4, 'abdullah', '2014-06-07', 'M', '2024-03-04', 'abduu@hotmail', 3, 'Math', 3.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cou`
--
ALTER TABLE `cou`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ins`
--
ALTER TABLE `ins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stud`
--
ALTER TABLE `stud`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
