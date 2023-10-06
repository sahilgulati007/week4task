-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2023 at 04:20 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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

CREATE TABLE `market_data` (
  `data_id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  `cur_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `market_name` varchar(50) NOT NULL,
  `market_value` double NOT NULL,
  `highest_value` double NOT NULL,
  `lowest_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `market_data`
--

INSERT INTO `market_data` (`data_id`, `risk_id`, `cur_date`, `market_name`, `market_value`, `highest_value`, `lowest_value`) VALUES
(1, 1, '2023-10-06 13:44:35', 'Stock', 854236.21, 150.21, 25.85),
(2, 4, '2023-10-06 13:44:35', 'Technology', 5214.52, 35.62, 12.01),
(3, 10, '2023-10-06 13:47:34', 'Economic', 7541.98, 54.45, 21.22),
(4, 3, '2023-10-06 13:47:34', 'Economic', 46521.12, 555.2, 210.22),
(5, 5, '2023-10-06 13:52:24', 'business', 85236941.21, 5589.84, 444.1),
(6, 8, '2023-10-06 13:52:24', 'Economic', 5412.63, 112.2, 10.2),
(7, 9, '2023-10-06 13:53:46', 'Economic', 7751.11, 12.3, 2.52),
(8, 2, '2023-10-06 13:53:46', 'Economic', 45132.2, 124.5, 23.8),
(9, 1, '2023-10-06 13:54:36', 'Stock', 4128.62, 632.2, 52.7),
(10, 8, '2023-10-06 13:54:36', 'Stock', 951357.2, 157.3, 77.1);

-- --------------------------------------------------------

--
-- Table structure for table `risk_assessment_models`
--

CREATE TABLE `risk_assessment_models` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `methodology` varchar(25) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_assessment_models`
--

INSERT INTO `risk_assessment_models` (`model_id`, `model_name`, `description`, `methodology`, `created_by`, `created_date`) VALUES
(1, 'Finance', 'This is a finance assessment model.', 'asset-based', 'jay', '2023-10-06 14:10:14'),
(2, 'Economic', 'This is economic assessment model.', 'quantitative', 'sahil', '2023-10-06 14:10:14'),
(3, 'Technology', 'This is a technology assessment model.', 'qualitative', 'jas', '2023-10-06 14:17:06'),
(4, 'Operational', 'This is operational assessment model.', 'threat-based', 'saili', '2023-10-06 14:17:06'),
(5, 'Finance', 'This is a finance assessment model.', 'threat-based', 'jasika', '2023-10-06 14:17:06'),
(6, 'Operational', 'This is operational assessment model.', 'semi-quantitative', 'silia', '2023-10-06 14:17:06'),
(7, 'Business', 'This is a business assessment model.', 'vulnerability-based', 'jasmi', '2023-10-06 14:17:06'),
(8, 'Liquidity', 'This is liquidity assessment model.', 'qualitative', 'sai', '2023-10-06 14:17:06'),
(9, 'Finance', 'This is a finance assessment model.', 'semi quantitative', 'jasmin', '2023-10-06 14:17:06'),
(10, 'Technology', 'This is a technology assessment model.', 'vulnerability-based', 'jimi', '2023-10-06 14:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `risk_categories`
--

CREATE TABLE `risk_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_categories`
--

INSERT INTO `risk_categories` (`category_id`, `category_name`) VALUES
(1, 'financial'),
(2, 'operational'),
(3, 'operational'),
(4, 'operational'),
(5, 'liquidity'),
(6, 'business'),
(7, 'liquidity'),
(8, 'reputational'),
(9, 'financial'),
(10, 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `risk_data`
--

CREATE TABLE `risk_data` (
  `risk_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `buying_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` varchar(100) NOT NULL,
  `risk_probability` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `volume` double NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_data`
--

INSERT INTO `risk_data` (`risk_id`, `category_id`, `source_id`, `buying_date`, `description`, `risk_probability`, `status`, `volume`, `value`) VALUES
(1, 9, 1, '2023-10-06 13:13:11', 'This belongs to financial risk category and internal source.', 'medium', 'open', 100, 1000),
(2, 7, 2, '2023-10-06 13:13:11', 'This belongs to liquidity risk category and external source.', 'low', 'close', 10, 120.5),
(3, 8, 8, '2023-10-06 13:16:26', 'This belongs to reputational risk category and external source.', 'high', 'open', 1000, 50125),
(4, 10, 7, '2023-10-06 13:16:26', 'This belongs to technology risk category and external source.', 'low', 'close', 122, 100),
(5, 6, 3, '2023-10-06 13:18:28', 'This belongs to business risk category and internal source.', 'low', 'close', 512, 8541.51),
(6, 9, 7, '2023-10-06 13:18:28', 'This belongs to financial risk category and external source.', 'medium', 'open', 14, 512.2),
(7, 2, 4, '2023-10-06 13:26:50', 'This belongs to operational risk category and internal source.', 'low', 'close', 65, 20.51),
(8, 1, 5, '2023-10-06 13:26:50', 'This belongs to financial risk category and external source.', 'high', 'open', 857, 658.214),
(9, 8, 4, '2023-10-06 13:30:10', 'This belongs to reputational risk category and internal source.', 'hign', 'open', 145, 8543.21),
(10, 3, 10, '2023-10-06 13:30:10', 'This belongs to operational risk category and external source.', 'medium', 'close', 523, 651.2);

-- --------------------------------------------------------

--
-- Table structure for table `risk_sources`
--

CREATE TABLE `risk_sources` (
  `source_id` int(11) NOT NULL,
  `source_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_sources`
--

INSERT INTO `risk_sources` (`source_id`, `source_name`) VALUES
(1, 'internal'),
(2, 'external'),
(3, 'internal'),
(4, 'internal'),
(5, 'external'),
(6, 'internal'),
(7, 'external'),
(8, 'external'),
(9, 'internal'),
(10, 'external');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `market_data`
--
ALTER TABLE `market_data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `risk_id` (`risk_id`);

--
-- Indexes for table `risk_assessment_models`
--
ALTER TABLE `risk_assessment_models`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `risk_categories`
--
ALTER TABLE `risk_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `risk_data`
--
ALTER TABLE `risk_data`
  ADD PRIMARY KEY (`risk_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `source_id` (`source_id`);

--
-- Indexes for table `risk_sources`
--
ALTER TABLE `risk_sources`
  ADD PRIMARY KEY (`source_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `market_data`
--
ALTER TABLE `market_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `risk_assessment_models`
--
ALTER TABLE `risk_assessment_models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `risk_categories`
--
ALTER TABLE `risk_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `risk_data`
--
ALTER TABLE `risk_data`
  MODIFY `risk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `risk_sources`
--
ALTER TABLE `risk_sources`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
