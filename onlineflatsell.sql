-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2019 at 09:40 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineflatsell`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `NAME` varchar(30) NOT NULL,
  `ASSN` int(11) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `PHONE NO.` int(15) NOT NULL,
  `A-ID` int(11) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `NAME` varchar(30) NOT NULL,
  `CSSN` int(11) NOT NULL,
  `COUNTRY` char(10) NOT NULL,
  `DISTRICT` varchar(15) NOT NULL,
  `PHONE` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE `flat` (
  `FID` int(11) NOT NULL,
  `SIZE` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `FLOOR NO.` int(11) NOT NULL,
  `NO. OF ROOMS` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `PID` int(11) NOT NULL,
  `COUNTRY` varchar(10) NOT NULL,
  `DISTRICT` varchar(10) NOT NULL,
  `STREET NO.` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phoneCode` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `C-ID` int(11) NOT NULL,
  `A-ID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `FID` int(11) NOT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `NAME` varchar(30) NOT NULL,
  `SSSN` int(11) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `PHONE NO.` int(15) NOT NULL,
  `S-ID` int(11) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller-flats`
--

CREATE TABLE `seller-flats` (
  `S-ID` int(11) NOT NULL,
  `FID` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`A-ID`),
  ADD UNIQUE KEY `ASSN` (`ASSN`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`),
  ADD UNIQUE KEY `cssn` (`CSSN`);

--
-- Indexes for table `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`PID`),
  ADD UNIQUE KEY `FLAT ID` (`FID`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD KEY `A-ID` (`A-ID`),
  ADD KEY `C-ID` (`C-ID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `FID` (`FID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`S-ID`),
  ADD UNIQUE KEY `SSSN` (`SSSN`);

--
-- Indexes for table `seller-flats`
--
ALTER TABLE `seller-flats`
  ADD KEY `S-ID` (`S-ID`),
  ADD KEY `FID` (`FID`),
  ADD KEY `PID` (`PID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `ASSN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CSSN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `SSSN` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`A-ID`) REFERENCES `agent` (`A-ID`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`C-ID`) REFERENCES `customer` (`CID`),
  ADD CONSTRAINT `sell_ibfk_3` FOREIGN KEY (`PID`) REFERENCES `property` (`PID`),
  ADD CONSTRAINT `sell_ibfk_4` FOREIGN KEY (`FID`) REFERENCES `flat` (`PID`);

--
-- Constraints for table `seller-flats`
--
ALTER TABLE `seller-flats`
  ADD CONSTRAINT `seller-flats_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `flat` (`PID`),
  ADD CONSTRAINT `seller-flats_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `property` (`PID`),
  ADD CONSTRAINT `seller-flats_ibfk_3` FOREIGN KEY (`S-ID`) REFERENCES `seller` (`S-ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;