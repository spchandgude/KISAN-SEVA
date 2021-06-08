-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 25, 2019 at 03:54 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id10347344_total`
--

-- --------------------------------------------------------

--
-- Table structure for table `Consumer`
--

CREATE TABLE `Consumer` (
  `Consumer_no` int(11) NOT NULL,
  `Consumer_LPG_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_contact_no` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_email_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_State` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_City` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_PINCODE` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_landmark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_addressline1` text COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_addressline2` text COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_Adhaar_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_GST_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Consumer_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Consumer`
--

INSERT INTO `Consumer` (`Consumer_no`, `Consumer_LPG_ID`, `Consumer_first_name`, `Consumer_last_name`, `Consumer_contact_no`, `Consumer_email_id`, `Consumer_State`, `Consumer_City`, `Consumer_PINCODE`, `Consumer_landmark`, `Consumer_addressline1`, `Consumer_addressline2`, `Consumer_Adhaar_no`, `Consumer_GST_no`, `Consumer_password`) VALUES
(5434, '2121', 'Shubham', 'Chandgude', '839005549', 'edu.spchan@gmail.com', 'Mahara', 'Pune', '412369', 'an', '', 'a', '6464', '7', '81dc9bdb52d04dc20036dbd8313ed055'),
(543481, '2121', 'Shubham', 'Chandgude', '8390055497', 'edu.spchand@gmail.com', 'Maharashtra', 'Pune', '412369', 'NA', 'a', 'a', '469494', '749', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `Distributor`
--

CREATE TABLE `Distributor` (
  `Distributor_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Distributor_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Distributor_contact_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Distributor_GST_no` int(11) NOT NULL,
  `Distributor_addressline1` text COLLATE utf8_unicode_ci NOT NULL,
  `Distributor_addressline2` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Invoice`
--

CREATE TABLE `Invoice` (
  `Invoice_ID` int(11) NOT NULL,
  `Consumer_no` int(11) NOT NULL,
  `Distributor_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Order_no` int(11) NOT NULL,
  `Invoice_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `OrderDetails_no` int(11) NOT NULL,
  `OrderDetails_product_ID` int(11) NOT NULL,
  `OrderDetails_order_no` int(11) NOT NULL,
  `OrderDetails_consumer_no` int(11) NOT NULL,
  `OrderDetails_quantity` int(11) NOT NULL,
  `OrderDetails_CGST` int(11) NOT NULL,
  `OrderDetails_SGST` int(11) NOT NULL,
  `OrderDetails_price` int(11) NOT NULL,
  `OrderDetails_total_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `Order_no` int(11) NOT NULL,
  `Order_acceptence_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Order_consumer_no` int(11) NOT NULL,
  `Order_date` date NOT NULL,
  `Order_time` time NOT NULL,
  `Order_preferred_date` date NOT NULL,
  `Order_preferred_time` time NOT NULL,
  `Order_shipped_date` date NOT NULL,
  `Order_shipped_time` time NOT NULL,
  `Order_shipper_ID` int(11) NOT NULL,
  `Order_payment_ID` int(11) NOT NULL,
  `Order_transaction_status` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UNPAID',
  `Order_transaction_date` date NOT NULL,
  `Order_transaction_time` time NOT NULL,
  `Order_tracking_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_amount` int(11) NOT NULL,
  `Payment_date` date NOT NULL,
  `Customer_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Name` int(11) NOT NULL,
  `Product_HSN_code` int(11) NOT NULL,
  `Product_distributor_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Product_unit_price` int(11) NOT NULL,
  `Product_CGST_percent` int(11) NOT NULL,
  `Product_SGST_percent` int(11) NOT NULL,
  `Product_available_units` int(11) NOT NULL,
  `Product_shipped_units` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Shipper`
--

CREATE TABLE `Shipper` (
  `Shipper_ID` int(11) NOT NULL,
  `Shipper_name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Shipper_distributor_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Shipper_address` text COLLATE utf8_unicode_ci NOT NULL,
  `Shipper_contact_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Consumer`
--
ALTER TABLE `Consumer`
  ADD PRIMARY KEY (`Consumer_no`);

--
-- Indexes for table `Distributor`
--
ALTER TABLE `Distributor`
  ADD PRIMARY KEY (`Distributor_ID`);

--
-- Indexes for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `Consumer_no` (`Consumer_no`),
  ADD KEY `Distributor_ID` (`Distributor_ID`),
  ADD KEY `Order_no` (`Order_no`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`OrderDetails_no`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Order_no`),
  ADD KEY `Order_consumer_no` (`Order_consumer_no`),
  ADD KEY `Order_shipper_ID` (`Order_shipper_ID`),
  ADD KEY `Order_payment_ID` (`Order_payment_ID`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Customer_no` (`Customer_no`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Product_distributor_ID` (`Product_distributor_ID`);

--
-- Indexes for table `Shipper`
--
ALTER TABLE `Shipper`
  ADD PRIMARY KEY (`Shipper_ID`),
  ADD KEY `Shipper_distributor_ID` (`Shipper_distributor_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`Consumer_no`) REFERENCES `Consumer` (`Consumer_no`),
  ADD CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY (`Distributor_ID`) REFERENCES `Distributor` (`Distributor_ID`),
  ADD CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY (`Order_no`) REFERENCES `Orders` (`Order_no`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`Order_consumer_no`) REFERENCES `Consumer` (`Consumer_no`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`Order_shipper_ID`) REFERENCES `Shipper` (`Shipper_ID`),
  ADD CONSTRAINT `Orders_ibfk_3` FOREIGN KEY (`Order_payment_ID`) REFERENCES `Payment` (`Payment_ID`);

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`Customer_no`) REFERENCES `Consumer` (`Consumer_no`);

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`Product_distributor_ID`) REFERENCES `Distributor` (`Distributor_ID`);

--
-- Constraints for table `Shipper`
--
ALTER TABLE `Shipper`
  ADD CONSTRAINT `Shipper_ibfk_1` FOREIGN KEY (`Shipper_distributor_ID`) REFERENCES `Distributor` (`Distributor_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
