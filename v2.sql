-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2026 at 01:57 PM
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
  `point_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bicycle`
--

INSERT INTO `bicycle` (`bicycle_id`, `bicycle_status`, `point_id`) VALUES
(101, 'Available', 'P001'),
(102, 'Available', 'P002'),
(103, 'In Use', 'P003'),
(104, 'Available', 'P004'),
(105, 'Available', 'P005'),
(106, 'In Use', 'P006'),
(107, 'Available', 'P007'),
(108, 'In Use', 'P008'),
(109, 'Available', 'P009'),
(110, 'Unavailabl', 'P010');

-- --------------------------------------------------------

--
-- Table structure for table `parking_point`
--

CREATE TABLE `parking_point` (
  `point_id` varchar(11) NOT NULL,
  `location` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `parking_point`
--

INSERT INTO `parking_point` (`point_id`, `location`, `capacity`) VALUES
('P001', 'Northwest Gate', 20),
('P002', 'Library', 30),
('P003', 'Student Centre', 25),
('P004', 'Teaching Building 10', 18),
('P005', 'Teaching Building 14', 22),
('P006', 'East Gate', 35),
('P007', 'Dormitory No.17', 35),
('P008', 'Basketball court', 30),
('P009', 'Canteen No.6', 28),
('P010', 'Southeast Gate', 20);

-- --------------------------------------------------------

--
-- Table structure for table `ride_record`
--

CREATE TABLE `ride_record` (
  `start_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `bicycle_id` int(11) NOT NULL,
  `end_time` datetime NOT NULL,
  `fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ride_record`
--

INSERT INTO `ride_record` (`start_time`, `user_id`, `bicycle_id`, `end_time`, `fee`) VALUES
('2026-10-20 08:10:00', 1, 101, '2026-10-20 08:24:00', 1.00),
('2026-10-28 10:15:00', 1, 103, '2026-10-28 10:33:00', 1.00),
('2026-10-20 10:05:00', 2, 102, '2026-10-20 10:55:00', 1.50),
('2026-11-07 17:00:00', 4, 103, '2026-11-07 17:31:00', 1.50),
('2026-10-30 11:40:00', 4, 104, '2026-10-30 12:30:00', 1.50),
('2026-10-31 13:10:00', 5, 105, '2026-10-31 13:25:00', 1.00),
('2026-11-02 08:20:00', 6, 106, '2026-11-02 08:38:00', 1.00),
('2026-11-02 09:30:00', 7, 107, '2026-11-02 09:56:00', 1.50),
('2026-11-03 12:05:00', 8, 105, '2026-11-03 12:19:00', 1.00),
('2026-11-05 15:10:00', 9, 109, '2026-11-05 16:22:00', 2.00);

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `phone_number`, `email`) VALUES
(1, 'Trista', '178-821-507', '872509@163.com\r'),
(2, 'Felix', '153-007-143', '559631@qq.com\r'),
(3, 'Mina', '123-890-456', '546715@gmail.com\r'),
(4, 'Jisoo', '199-501-030', 'addicted@103.com\r'),
(5, 'Minami', '200-611-292', 'withflower@me.com\r'),
(6, 'Lily', '200-711-284', '330011@qq.com\r'),
(7, 'Woni', '200-400-017', 'miimii@163.com\r'),
(8, 'Zena', '200-854-293', 'xiaoshu@gmail.com\r'),
(9, 'Liv', '567-115-078', '2284501@139.com\r'),
(10, 'May', '138-459-220', '231456@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bicycle`
--
ALTER TABLE `bicycle`
  ADD PRIMARY KEY (`bicycle_id`),
  ADD UNIQUE KEY `fk_point_bicycle` (`point_id`);

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
  ADD KEY `fk_user_record` (`user_id`) USING BTREE,
  ADD KEY `fk_bicycle_record` (`bicycle_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

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
