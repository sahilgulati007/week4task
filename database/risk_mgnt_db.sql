-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 05, 2023 at 02:51 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `risk_mgnt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `market_data`
--

DROP TABLE IF EXISTS `market_data`;
CREATE TABLE IF NOT EXISTS `market_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `cur_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `market_name` varchar(50) NOT NULL,
  `market_value` double NOT NULL,
  `highest_value` double NOT NULL,
  `lowest_value` double NOT NULL,
  PRIMARY KEY (`data_id`),
  KEY `risk_id` (`risk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `risk_assessment_models`
--

DROP TABLE IF EXISTS `risk_assessment_models`;
CREATE TABLE IF NOT EXISTS `risk_assessment_models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `methodology` tinyint(4) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_assessment_models`
--

INSERT INTO `risk_assessment_models` (`model_id`, `model_name`, `description`, `methodology`, `created_by`, `created_date`) VALUES
(1, 'as', 'as afesfds f d fafs', 0, 'asd', '2023-10-02 20:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `risk_categories`
--

DROP TABLE IF EXISTS `risk_categories`;
CREATE TABLE IF NOT EXISTS `risk_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_categories`
--

INSERT INTO `risk_categories` (`category_id`, `category_name`) VALUES
(1, 'market risk'),
(2, 'financial risk');

-- --------------------------------------------------------

--
-- Table structure for table `risk_data`
--

DROP TABLE IF EXISTS `risk_data`;
CREATE TABLE IF NOT EXISTS `risk_data` (
  `risk_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `buying_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(100) NOT NULL,
  `risk_probability` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `volume` double NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`risk_id`),
  KEY `category_id` (`category_id`),
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `risk_sources`
--

DROP TABLE IF EXISTS `risk_sources`;
CREATE TABLE IF NOT EXISTS `risk_sources` (
  `source_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(50) NOT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_sources`
--

INSERT INTO `risk_sources` (`source_id`, `source_name`) VALUES
(1, 'internal employee'),
(2, 'external news');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `market_data`
--
ALTER TABLE `market_data`
  ADD CONSTRAINT `market_data_ibfk_1` FOREIGN KEY (`risk_id`) REFERENCES `risk_data` (`risk_id`);

--
-- Constraints for table `risk_data`
--
ALTER TABLE `risk_data`
  ADD CONSTRAINT `risk_data_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `risk_sources` (`source_id`),
  ADD CONSTRAINT `risk_data_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `risk_categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
