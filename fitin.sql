-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2021 at 02:40 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitin`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement`
--

CREATE TABLE `achievement` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`id`, `name`, `description`, `icon`, `groupId`, `userId`) VALUES
(14, 'First Run', 'First Run', 'yoga-icon-4.jpg', 75, 43),
(15, '1 Mile Run', '1 Mile Run', 'yoga-icon-4.jpg', 75, 43),
(16, '2 Mile Run', '2 Mile Run', 'yoga-icon-4.jpg', 111, 43);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(6, 'yoga'),
(7, 'bootcamp'),
(10, 'meditation'),
(41, 'basketball');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `description`, `date`, `groupId`, `userId`) VALUES
(1, 'Sunday Stretch', 'Come and do a light stretch with us!', '2021-07-11 10:46:46', 71, 44),
(2, 'General Session', 'Come and do a well rounded session.', '2021-07-12 19:00:00', 71, 44),
(5, 'Mindful Session', 'A mindful meditation session focused on gratitude.', '2021-07-24 17:00:00', 72, 44),
(6, 'Youth Meditation Lesson', 'This session will focus on ages 4-6 years old. It will consist of introductory concepts and practice.', '2021-07-11 08:00:00', 73, 44),
(8, 'Cardio Power', 'Join us at our usual location for our weekly cardio power workout.', '2021-09-15 17:00:00', 75, 43),
(22, 'Magnolia ', 'Cardio Power', '2021-10-30 16:00:00', 75, 43),
(37, 'First Yoga Class', 'We\'re launching our first yoga class.', '2021-10-28 16:00:00', 116, 47),
(38, 'First Bootcamp Session', 'Come join us at our first event.', '2021-10-29 18:00:00', 117, 44);

-- --------------------------------------------------------

--
-- Table structure for table `event_user`
--

CREATE TABLE `event_user` (
  `id` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_user`
--

INSERT INTO `event_user` (`id`, `eventid`, `userid`) VALUES
(9, 1, 43),
(10, 6, 44),
(12, 1, 44),
(13, 5, 43),
(14, 8, 48),
(15, 6, 43),
(19, 38, 44);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `description`, `categoryId`, `street`, `city`, `state`, `country`, `zipcode`, `date`, `userId`) VALUES
(71, 'Olivedale Yoga 1', 'A yoga group for all.', 6, '236 Sultana Ave', 'Upland', 'CA', 'United States', '91786', '2021-06-17', 44),
(72, 'Red Hill Meditation', 'A meditation group for the elderly.', 10, '8358 Red Hill Country Club Dr', 'Rancho Cucamonga', 'Ca', 'United States', '91730', '2021-06-25', 44),
(73, 'YMCA Meditation', 'Free meditation group.', 10, '1150 E Foothill Blvd', 'Upland', 'Ca', 'United States', '91786', '2021-06-28', 44),
(75, 'Magnolia Bootcamp', 'A bootcamp for beginners', 7, '651 W 15th St', 'Upland', 'Ca', 'United States', '91786', '2021-07-01', 43),
(111, 'Memorial Boot', 'Memorial Bootcamp', 7, '1100 East Foothill Blvd', 'Upland', 'Ca', 'United States', '91786', '2021-10-24', 43),
(115, 'Cardio', 'Cardio Workouts for all ages.', 7, '236 Sultana Ave', 'Upland', 'CA', 'United States', '91789', '2021-10-26', 43),
(116, 'Rancho Yoga', 'Yoga for all', 6, '10500 Civic Center Dr', 'Rancho Cucamonga', 'Ca', 'United States', '91730', '2021-10-26', 47),
(117, 'Warden Bootcamp', 'A bootcamp for the community.', 7, '701 East 8th Street', 'Upland', 'CA', 'United States', '91786', '2021-10-28', 44);

-- --------------------------------------------------------

--
-- Table structure for table `group_comment`
--

CREATE TABLE `group_comment` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `userid`, `groupid`) VALUES
(96, 44, 71),
(97, 44, 72),
(206, 43, 72),
(208, 48, 75),
(211, 43, 73),
(212, 43, 71),
(215, 48, 72),
(222, 44, 73),
(223, 43, 75),
(224, 44, 116),
(225, 46, 116),
(226, 46, 71),
(227, 44, 117);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `permissions`, `zipcode`, `image`, `date`) VALUES
(43, 'Jemain', 'Clement', 'jemainclement@fitin.com', '$2y$10$Igv63YnScQTvJnetG8Tl5.wKY.GeS.lVvElluNAg0/zQCM4ekCXgu', 3, 91786, 'jemain-clement.jpg', '2021-07-24 05:14:55'),
(44, 'Bret', 'McKenzie', 'bretmckenzie@fitin.com', '$2y$10$9NGRUYT.rg53PTwB3ZqsEOyxfVTGDS4e4o3l8HqArJJJMNQpRqK.i', 2, 91786, 'bret-mckenzie.jpg', '2021-07-24 05:14:55'),
(46, 'Mel', 'Fan', 'melfan@fitin.com', '$2y$10$Zpn3psoMOC2rFo/bb2j19OScfQEy2HR3sPrnI.9zS4P/GKAVMOYEK', 1, 91733, 'mel_fan.jpg', '2021-07-24 05:14:55'),
(47, 'Murray', 'Manager', 'murraymanager@fitin.com', '$2y$10$nuCBit46bsiwU8a2sIDB7eSfvZ6xYlLhY2NbdB4tpWaULTj14H5ce', 2, 91730, 'murray.jpg', '2021-09-08 05:30:05'),
(48, 'Ricky', 'Baker', 'rickybaker@fitin.com', '$2y$10$BGeUUCtb5BAWloluR0XHm.QMkp2OQ752g8hZy6d/pPOa0.HzqVCDi', 1, 91730, 'rickybaker.jpg', '2021-09-08 05:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_achievement`
--

CREATE TABLE `user_achievement` (
  `id` int(11) NOT NULL,
  `achievementid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `creatorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievement`
--
ALTER TABLE `achievement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupId` (`groupId`) USING BTREE,
  ADD KEY `userId` (`userId`) USING BTREE;

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupId` (`groupId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `event_user`
--
ALTER TABLE `event_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventid` (`eventid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `zipcode` (`zipcode`),
  ADD KEY `category` (`categoryId`);

--
-- Indexes for table `group_comment`
--
ALTER TABLE `group_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `groupid` (`groupid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_achievement`
--
ALTER TABLE `user_achievement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievementid` (`achievementid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `creatorid` (`creatorid`),
  ADD KEY `groupid` (`groupid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievement`
--
ALTER TABLE `achievement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `event_user`
--
ALTER TABLE `event_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `group_comment`
--
ALTER TABLE `group_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `user_achievement`
--
ALTER TABLE `user_achievement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievement`
--
ALTER TABLE `achievement`
  ADD CONSTRAINT `achievement_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `achievement_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `event_user`
--
ALTER TABLE `event_user`
  ADD CONSTRAINT `event_user_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_user_ibfk_2` FOREIGN KEY (`eventid`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `group_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Constraints for table `group_comment`
--
ALTER TABLE `group_comment`
  ADD CONSTRAINT `groupid` FOREIGN KEY (`groupid`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `memberships_groupid` FOREIGN KEY (`groupid`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberships_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_achievement`
--
ALTER TABLE `user_achievement`
  ADD CONSTRAINT `user_achievement_ibfk_1` FOREIGN KEY (`achievementid`) REFERENCES `achievement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_achievement_ibfk_2` FOREIGN KEY (`groupid`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_achievement_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_achievement_ibfk_4` FOREIGN KEY (`creatorid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
