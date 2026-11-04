-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2026 at 04:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campus_shared_bicycle_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bicycle`
--

CREATE TABLE `bicycle` (
  `bicycle_id` int(11) NOT NULL,
  `bicycle_status` varchar(10) NOT NULL,
  `point_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parking_point`
--

CREATE TABLE `parking_point` (
  `point_id` int(11) NOT NULL,
  `location` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_record`
--

CREATE TABLE `ride_record` (
  `start_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bicycle_id` int(11) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `fee` float(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bicycle`
--
ALTER TABLE `bicycle`
  ADD PRIMARY KEY (`bicycle_id`),
  ADD KEY `fk_point_bicycle` (`point_id`);

--
-- Indexes for table `parking_point`
--
ALTER TABLE `parking_point`
  ADD PRIMARY KEY (`point_id`);

--
-- Indexes for table `ride_record`
--
ALTER TABLE `ride_record`
  ADD PRIMARY KEY (`user_id`,`bicycle_id`,`start_time`),
  ADD KEY `bicycle_id` (`bicycle_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parking_point`
--
ALTER TABLE `parking_point`
  MODIFY `point_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bicycle`
--
ALTER TABLE `bicycle`
  ADD CONSTRAINT `fk_point_bicycle` FOREIGN KEY (`point_id`) REFERENCES `parking_point` (`point_id`);

--
-- Constraints for table `ride_record`
--
ALTER TABLE `ride_record`
  ADD CONSTRAINT `ride_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `ride_record_ibfk_2` FOREIGN KEY (`bicycle_id`) REFERENCES `bicycle` (`bicycle_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
