-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 01:17 PM
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
-- Database: `twitterdb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `createAccount` (IN `p_username` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(32), IN `p_bio` TEXT)   BEGIN
    INSERT INTO Users (username, email, password) VALUES (p_username, p_email, MD5(p_password));
    INSERT INTO Profiles (user_id, bio) VALUES (LAST_INSERT_ID(), p_bio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `User_Follow` (IN `p_follower_username` VARCHAR(50), IN `p_following_username` VARCHAR(50))   BEGIN
    DECLARE follower_id INT;
    DECLARE following_id INT;
    
    SELECT user_id INTO follower_id FROM Users WHERE username = p_follower_username;
    SELECT user_id INTO following_id FROM Users WHERE username = p_following_username;
    
    INSERT INTO User_Follows (follower_id, following_id) VALUES (follower_id, following_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `WhoLikedTweet` (IN `p_tweet_id` INT)   BEGIN
    SELECT u.username
    FROM Users u
    JOIN TweetLikes tl ON u.user_id = tl.user_id
    WHERE tl.tweet_id = p_tweet_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profile_id`, `user_id`, `bio`) VALUES
(1, 1, 'user1'),
(2, 2, ' user2'),
(3, 3, ' user3'),
(4, 4, ' user4');

-- --------------------------------------------------------

--
-- Table structure for table `tweetlikes`
--

CREATE TABLE `tweetlikes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  `date_liked` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tweetlikes`
--

INSERT INTO `tweetlikes` (`like_id`, `user_id`, `tweet_id`, `date_liked`) VALUES
(13, 2, 4, '2024-04-29 09:21:11'),
(14, 3, 5, '2024-04-29 09:21:11'),
(15, 1, 6, '2024-04-29 09:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweet_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweet_id`, `user_id`, `content`, `date_created`) VALUES
(4, 1, 'Hello ', '2024-04-28 22:17:54'),
(5, 2, 'try', '2024-04-28 22:18:12'),
(6, 3, 'testt', '2024-04-28 22:20:34'),
(7, 1, 'whatsup!', '2024-04-28 22:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `date_created`) VALUES
(1, 'user1', 'user1@example.com', '7c6a180b36896a0a8c02787eeafb0e4c', '2024-04-29 09:15:22'),
(2, 'user2', 'user2@example.com', '6cb75f652a9b52798eb6cf2201057c73', '2024-04-29 09:15:22'),
(3, 'user3', 'user3@example.com', '819b0643d6b89dc9b579fdfc9094f28e', '2024-04-29 09:15:22'),
(4, 'user4', 'user4@example.com', '34cc93ece0ba9e3f6f235d4af979b16c', '2024-04-29 09:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_follows`
--

CREATE TABLE `user_follows` (
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_follows`
--

INSERT INTO `user_follows` (`follower_id`, `following_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `tweetlikes`
--
ALTER TABLE `tweetlikes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tweet_id` (`tweet_id`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD PRIMARY KEY (`follower_id`,`following_id`),
  ADD KEY `following_id` (`following_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tweetlikes`
--
ALTER TABLE `tweetlikes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `tweetlikes`
--
ALTER TABLE `tweetlikes`
  ADD CONSTRAINT `tweetlikes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tweetlikes_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`);

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD CONSTRAINT `user_follows_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_follows_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
