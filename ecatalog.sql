-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2020 at 04:58 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecatalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(1024) NOT NULL,
  `admin_email` varchar(1024) NOT NULL,
  `admin_password` varchar(1024) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `company_id`) VALUES
(1, 'admin', 'admin@gmail.com', 'fe01ce2a7fbac8fafaed7c982a04e229', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`, `parent_id`, `company_id`) VALUES
(5, 'Mobile', 0, 1),
(6, 'Apple', 5, 1),
(7, 'Samsung', 5, 1),
(8, 'Laptops', 0, 1),
(9, 'Apple', 8, 1),
(20, 'Acer', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `companies_id` int(11) NOT NULL,
  `companies_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_companies`
--

INSERT INTO `tbl_companies` (`companies_id`, `companies_name`) VALUES
(1, 'eCatalog');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `cust_email` varchar(255) NOT NULL,
  `cust_password` varchar(255) NOT NULL,
  `custgroup_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`cust_id`, `cust_name`, `cust_email`, `cust_password`, `custgroup_id`, `company_id`) VALUES
(1, 'Customer', 'cust@gmail.com', '3aad3506aa11f05f265ea8304b8152b3', 1, 1),
(2, 'jolinteoh', 'jolin@operion.com.my', '13308dd423cebfea676b4f4aa5dc9d77', 1, 1),
(3, 'new', 'new@new.new', '22af645d1859cb5ca6da0c484f1f37ea', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL,
  `order_ref` int(11) NOT NULL,
  `order_created` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `order_ref`, `order_created`, `company_id`, `cust_id`) VALUES
(1, 0, '2020-09-05', 1, 1),
(2, 0, '2020-09-05', 1, 1),
(3, 0, '2020-09-05', 1, 1),
(4, 0, '2020-09-05', 0, 3),
(5, 0, '2020-09-08', 1, 1),
(6, 0, '2020-09-08', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_item`
--

CREATE TABLE `tbl_orders_item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_discount` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orders_item`
--

INSERT INTO `tbl_orders_item` (`item_id`, `item_name`, `item_price`, `item_quantity`, `item_discount`, `order_id`, `product_id`) VALUES
(1, 'Shirt', 499, 11, 0, 1, 16),
(2, 'Iphone 6s', 3000, 4, 0, 1, 24),
(3, 'Shirt', 499, 10, 0, 2, 16),
(4, 'Iphone 6s', 3000, 4, 0, 2, 24),
(5, 'Mobile', 545, 2, 0, 3, 15),
(6, 'Iphone 6s', 4000, 3, 0, 4, 24),
(7, 'Iphone 6s', 3000, 1, 0, 5, 24),
(8, 'Mobile', 545, 1, 0, 6, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productimages`
--

CREATE TABLE `tbl_productimages` (
  `file_id` int(11) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_cover` int(1) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_productimages`
--

INSERT INTO `tbl_productimages` (`file_id`, `file_type`, `file_name`, `file_cover`, `product_id`) VALUES
(5, 'IMAGE', '1598676657789472428.png', 0, 15),
(6, 'IMAGE', '1598676658301329882.png', 1, 15),
(7, 'IMAGE', '1598676658849781429.png', 0, 15),
(9, 'IMAGE', '1598677651678536488.jpg', 1, 16),
(10, 'IMAGE', '1598677651164996298.jpg', 0, 16),
(11, 'IMAGE', '1598677651210044560.jpg', 0, 16),
(40, 'IMAGE', '1599138072221302772.jpg', 0, 24),
(41, 'IMAGE', '1599138072133937488.jpg', 0, 24),
(42, 'IMAGE', '1599138072613754411.jpg', 1, 24),
(44, 'IMAGE', '1599447984452062042.png', 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productprices`
--

CREATE TABLE `tbl_productprices` (
  `price_id` int(11) NOT NULL,
  `product_price` decimal(22,4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `custgroup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_productprices`
--

INSERT INTO `tbl_productprices` (`price_id`, `product_price`, `product_id`, `custgroup_id`) VALUES
(71, '9001.0000', 0, 2),
(72, '1099.0000', 0, 1),
(73, '0.0000', 0, 0),
(74, '0.0000', 0, 2),
(75, '99991.0000', 0, 0),
(91, '90001.0000', 15, 2),
(92, '1099.0000', 15, 1),
(93, '0.0000', 15, 0),
(94, '545.0000', 15, 1),
(95, '99998.0000', 15, 0),
(105, '450.0000', 16, 2),
(106, '499.0000', 16, 1),
(107, '500.0000', 16, 0),
(127, '3000.0000', 24, 1),
(128, '4000.0000', 24, 3),
(130, '4000.0000', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl__customersgroup`
--

CREATE TABLE `tbl__customersgroup` (
  `custgroup_id` int(11) NOT NULL,
  `custgroup_name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `default_group` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl__customersgroup`
--

INSERT INTO `tbl__customersgroup` (`custgroup_id`, `custgroup_name`, `company_id`, `default_group`) VALUES
(1, 'customer', 1, 0),
(2, 'admin', 1, 0),
(3, 'Public', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl__products`
--

CREATE TABLE `tbl__products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `category_id` text NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl__products`
--

INSERT INTO `tbl__products` (`product_id`, `product_name`, `product_description`, `product_quantity`, `category_id`, `company_id`) VALUES
(15, 'Mobile', '<p>Test Item3</p>\r\n', 112, '6', 1),
(16, 'Shirt', '<p>This is shirt</p>\r\n', 11, '8,10', 1),
(20, 'testtt', '', 0, '', 1),
(24, 'Iphone 6s', '<p>Iphone 6s spec</p>\r\n\r\n<p>64G</p>\r\n\r\n<p>4G RAM</p>\r\n\r\n<p>&nbsp;</p>\r\n', 3, '5,6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`companies_id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_orders_item`
--
ALTER TABLE `tbl_orders_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_productprices`
--
ALTER TABLE `tbl_productprices`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `tbl__customersgroup`
--
ALTER TABLE `tbl__customersgroup`
  ADD PRIMARY KEY (`custgroup_id`);

--
-- Indexes for table `tbl__products`
--
ALTER TABLE `tbl__products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `companies_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_orders_item`
--
ALTER TABLE `tbl_orders_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_productprices`
--
ALTER TABLE `tbl_productprices`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `tbl__customersgroup`
--
ALTER TABLE `tbl__customersgroup`
  MODIFY `custgroup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl__products`
--
ALTER TABLE `tbl__products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
