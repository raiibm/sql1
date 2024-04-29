-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 09:09 AM
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
-- Database: `tamayoz1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cou`
--

CREATE TABLE `cou` (
  `coid` int(11) NOT NULL,
  `cname` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cou`
--

INSERT INTO `cou` (`coid`, `cname`) VALUES
(1, 'Java'),
(2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `fail`
--

CREATE TABLE `fail` (
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
-- Dumping data for table `fail`
--

INSERT INTO `fail` (`id`, `sname`, `birth`, `gender`, `enr`, `email`, `lev`, `cou`, `GPA`) VALUES
(3, 'Reema', '2004-06-07', 'F', '2021-03-30', 'Ree@hotmail', 6, 'IS', 59);

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
  `onum` int(11) DEFAULT NULL,
  `ciid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ins`
--

INSERT INTO `ins` (`id`, `iname`, `birth`, `gender`, `email`, `onum`, `ciid`) VALUES
(1, 'muhammed', '1992-01-08', 'M', 'm@hotmail', 2011, 1),
(2, 'Sara', '1991-11-18', 'F', 'SAa@hotmail', 2032, 1),
(3, 'saud', '1994-11-12', 'M', 's@h', 4221, 2),
(4, 'dalal', '1921-06-18', 'F', 'd@e', 3411, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ins_cou`
--

CREATE TABLE `ins_cou` (
  `iname` varchar(225) DEFAULT NULL,
  `cname` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ins_cou`
--

INSERT INTO `ins_cou` (`iname`, `cname`) VALUES
('muhammed', 'Java'),
('Sara', 'Java'),
('saud', 'English'),
('dalal', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `ins_stud`
--

CREATE TABLE `ins_stud` (
  `id` int(11) NOT NULL,
  `iname` varchar(225) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `onum` int(11) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `sname` varchar(225) DEFAULT NULL,
  `sbirth` date DEFAULT NULL,
  `sgender` varchar(225) DEFAULT NULL,
  `enr` date DEFAULT NULL,
  `semail` varchar(225) DEFAULT NULL,
  `lev` int(11) DEFAULT NULL,
  `cou` varchar(225) DEFAULT NULL,
  `GPA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ins_stud`
--

INSERT INTO `ins_stud` (`id`, `iname`, `birth`, `gender`, `email`, `onum`, `sid`, `sname`, `sbirth`, `sgender`, `enr`, `semail`, `lev`, `cou`, `GPA`) VALUES
(1, 'muhammed', '1992-01-08', 'M', 'm@hotmail', 2011, 1, 'joud', '2010-02-01', 'Female', '2023-02-04', 'j@hotmail', 3, 'IT', 93),
(2, 'Sara', '1991-11-18', 'F', 'SAa@hotmail', 2032, 1, 'joud', '2010-02-01', 'Female', '2023-02-04', 'j@hotmail', 3, 'IT', 93),
(1, 'muhammed', '1992-01-08', 'M', 'm@hotmail', 2011, 2, 'raghad', '2001-04-26', 'Female', '2019-09-01', 'R@hotmail', 6, 'IT', 99),
(2, 'Sara', '1991-11-18', 'F', 'SAa@hotmail', 2032, 2, 'raghad', '2001-04-26', 'Female', '2019-09-01', 'R@hotmail', 6, 'IT', 99),
(1, 'muhammed', '1992-01-08', 'M', 'm@hotmail', 2011, 3, 'Reema', '2004-06-07', 'Female', '2021-03-30', 'Ree@hotmail', 6, 'IS', 65),
(2, 'Sara', '1991-11-18', 'F', 'SAa@hotmail', 2032, 3, 'Reema', '2004-06-07', 'Female', '2021-03-30', 'Ree@hotmail', 6, 'IS', 65),
(1, 'muhammed', '1992-01-08', 'M', 'm@hotmail', 2011, 4, 'abdullah', '2014-06-07', 'Male', '2024-03-04', 'abduu@hotmail', 2, 'Math', 70),
(2, 'Sara', '1991-11-18', 'F', 'SAa@hotmail', 2032, 4, 'abdullah', '2014-06-07', 'Male', '2024-03-04', 'abduu@hotmail', 2, 'Math', 70);

-- --------------------------------------------------------

--
-- Table structure for table `smart`
--

CREATE TABLE `smart` (
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
-- Dumping data for table `smart`
--

INSERT INTO `smart` (`id`, `sname`, `birth`, `gender`, `enr`, `email`, `lev`, `cou`, `GPA`) VALUES
(1, 'joud', '2010-02-01', 'F', '2023-02-04', 'j@hotmail', 3, 'IT', 93),
(2, 'raghad', '2001-04-26', 'F', '2019-09-01', 'R@hotmail', 6, 'IT', 99);

-- --------------------------------------------------------

--
-- Table structure for table `stud`
--

CREATE TABLE `stud` (
  `sid` int(11) NOT NULL,
  `sname` varchar(225) DEFAULT NULL,
  `sbirth` date DEFAULT NULL,
  `sgender` varchar(225) DEFAULT NULL,
  `enr` date DEFAULT NULL,
  `semail` varchar(225) DEFAULT NULL,
  `lev` int(11) DEFAULT NULL,
  `cou` varchar(225) DEFAULT NULL,
  `GPA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stud`
--

INSERT INTO `stud` (`sid`, `sname`, `sbirth`, `sgender`, `enr`, `semail`, `lev`, `cou`, `GPA`) VALUES
(1, NULL, '2010-02-01', 'Female', '2023-02-04', 'j@hotmail', 3, 'IT', 93),
(2, NULL, '2001-04-26', 'Female', '2019-09-01', 'R@hotmail', 6, 'IT', 99),
(3, NULL, '2004-06-07', 'Female', '2021-03-30', 'Ree@hotmail', 6, 'IS', 65),
(4, NULL, '2014-06-07', 'Male', '2024-03-04', 'abduu@hotmail', 2, 'Math', 70);

-- --------------------------------------------------------

--
-- Table structure for table `stud_cou`
--

CREATE TABLE `stud_cou` (
  `sid` int(11) NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stud_cou`
--

INSERT INTO `stud_cou` (`sid`, `cid`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cou`
--
ALTER TABLE `cou`
  ADD PRIMARY KEY (`coid`);

--
-- Indexes for table `ins`
--
ALTER TABLE `ins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ciid` (`ciid`);

--
-- Indexes for table `stud`
--
ALTER TABLE `stud`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `stud_cou`
--
ALTER TABLE `stud_cou`
  ADD PRIMARY KEY (`sid`,`cid`),
  ADD KEY `cid` (`cid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ins`
--
ALTER TABLE `ins`
  ADD CONSTRAINT `FK_ciid` FOREIGN KEY (`ciid`) REFERENCES `cou` (`coid`);

--
-- Constraints for table `stud_cou`
--
ALTER TABLE `stud_cou`
  ADD CONSTRAINT `stud_cou_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `stud` (`sid`),
  ADD CONSTRAINT `stud_cou_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `cou` (`coid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
