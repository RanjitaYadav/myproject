-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2019 at 07:56 AM
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
-- Database: `onlineflatselling`
--

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE `flat` (
  `fid` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `prize` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flat`
--

INSERT INTO `flat` (`fid`, `size`, `prize`, `rooms`, `floor`) VALUES
(1, '900 sqrft.', 150000, 3, 2),
(2, '900 sqrft.', 200000, 4, 6),
(3, '800 sqrft.', 120000, 3, 4),
(4, '900 sqrft.', 100000, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imid` int(11) NOT NULL,
  `image` varchar(20) NOT NULL,
  `image_text` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imid`, `image`, `image_text`) VALUES
(1, '01.jpg', ''),
(2, '03.jpg', ''),
(3, '04.jpg', ''),
(4, '2.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `pid` int(11) NOT NULL,
  `district` varchar(10) NOT NULL,
  `street` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`pid`, `district`, `street`) VALUES
(1, 'DHAKA', 'luxmibazar'),
(2, 'DHAKA', 'Badda'),
(3, 'DHAKA', 'niketon'),
(4, 'DHAKA', '4,kazi');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `name` varchar(20) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(15) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`name`, `phone`, `email`, `id`) VALUES
('sanjita', 1551244709, 'motiur@gmail.co', 1),
('ranju', 1551244725, 'rakib@gmail.com', 2),
('ranjita', 1551244709, 'ranjita@gmail.c', 3),
('ranjeeta', 1551244709, 'ataur@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'ranjita', 'ranjita@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`fid`),
  ADD UNIQUE KEY `fid` (`fid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imid`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pid` (`pid`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flat`
--
ALTER TABLE `flat`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flat`
--
ALTER TABLE `flat`
  ADD CONSTRAINT `flat_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `property` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `seller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;