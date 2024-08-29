-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 03:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'adminh', 'adminh@gmail.com', '$2y$10$/0XSwr8kgnvOMcbDOhaWdu9Smsis4/yvQvIn5ajxy85lqy.yw.zRu');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Wayfair'),
(2, 'IKEA'),
(3, 'Simmons'),
(6, 'Pottery Barn');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(2, 'Giường ngủ'),
(3, 'Bàn ăn'),
(4, 'Tủ áo'),
(5, 'Tủ chén'),
(6, 'Đèn chùm');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `total_products` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `order_status` enum('pending','completed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `user_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `amount_due`, `invoice_number`, `total_products`, `order_date`, `order_status`) VALUES
(1, 0, 'minh', 'mih@gmail.com', '123123', '345345', 0.00, 1242089211, 0, '2024-08-14 21:34:51', 'pending'),
(2, 0, 'minh', 'minh@gma.com', '356456', 'hdcm', 14000000.00, 870687395, 1, '2024-08-14 21:36:53', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_address` text NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `total_products` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL,
  `order_status` enum('pending','completed','canceled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `invoice_number`, `total_products`, `order_date`, `total_price`, `order_status`) VALUES
(1, 'Nguyễn Trần Bảo Long', 'ngtrbl@gmail.com', '0832010400', '18tmt13, phường tân chánh hiệp', 512035411, 1, '2024-08-27 09:36:16', 2500000.00, 'pending'),
(2, 'long', 'ngtrbl@gmail.com', '0832010400', '12tmt13, phuong tanchanhhiep', 1756177698, 2, '2024-08-27 09:55:39', 25990000.00, 'pending'),
(3, 'Hminh', 'hminh@gmail.com', '0912345676', 'Long Hải', 1200722306, 2, '2024-08-29 07:54:51', 17990000.00, 'pending'),
(4, 'SMinh', 'emia@gmail.com', '0912545878', 'tp Hồ Chí Minh', 57762958, 3, '2024-08-29 09:58:50', 19980000.00, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_pending`
--

INSERT INTO `orders_pending` (`order_id`, `user_id`, `invoice_number`, `product_id`, `quantity`, `order_status`) VALUES
(1, 3, 1730584781, 1, 3, 'pending'),
(2, 3, 1155795418, 5, 1, 'pending'),
(3, 0, 287334187, 2, 2, 'pending'),
(4, 0, 1017139893, 2, 2, 'pending'),
(5, 1, 295144174, 2, 2, 'pending'),
(6, 1, 340997621, 2, 2, 'pending'),
(7, 0, 1479263765, 2, 2, 'pending'),
(8, 0, 1419949149, 5, 1, 'pending'),
(9, 0, 244030074, 6, 1, 'pending'),
(11, 0, 95412458, 3, 1, 'pending'),
(12, 3, 168268248, 6, 1, 'pending'),
(13, 3, 2089979650, 7, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image1` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `brand_id`, `product_image1`, `product_image2`, `product_price`, `date`, `status`) VALUES
(1, 'Bàn ăn IKEA PS 2012', '', 'bàn ăn, bàn gỗ, bàn gỗ chân kim loại, IKEA, PS 2012, table, dining table', 3, 2, 'banan1.png', 'banan2.png', '2500000', '2024-08-29 03:02:47', 'true'),
(2, 'Tủ áo Wardrobe', ' ', 'tủ áo, tủ, IKEA, PAX, Wardrobe', 4, 2, 'tuao2.png', 'tuao1.png', '4000000', '2024-08-27 02:39:12', 'true'),
(3, 'Giường BEAUTYSLEEP III', '', 'giường, nệm, giường ngủ, simmons', 2, 3, 'giuong1.png', 'giuong2.png', '14000000', '2024-08-11 10:55:46', 'true'),
(4, 'Giường YC03-229 Charlie', '', 'giường, giường ngủ, bed, YC03-229 Charlie, Pottery Barn, nệm', 2, 6, 'giuong3.jpg', 'giuong4.jpg', '5990000', '2024-08-10 08:06:51', 'true'),
(5, 'Tủ đựng chén Pantry ', '', 'tủ, tủ chén, tủ gỗ, đồ gỗ, tủ đựng bát, tủ bếp, nhà bếp', 5, 6, 'tuchen1.jpg', 'tuchen2.jpg', '3990000', '2024-08-10 08:07:01', 'true'),
(6, 'IEnjoy', ' ', 'giường, nệm, giường ngủ, wayfair', 2, 1, 'giuong5.jpg', 'giuong6.jpg', '12900000', '2024-08-13 03:39:21', 'true'),
(7, 'IKEA - LADY001-1250', ' ', 'đèn, đèn chùm, đèn treo trần', 6, 2, 'den4.jpg', 'den5.jpg', '11990000', '2024-08-27 14:14:33', 'true'),
(8, 'Yong', ' ', 'bàn, bàn ăn', 3, 2, 'ban3.jpg', 'den5.jpg', '15000000', '2024-08-29 03:40:55', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`order_id`, `user_id`, `amount_due`, `invoice_number`, `total_products`, `order_date`, `order_status`) VALUES
(1, 3, 16890000, 168268248, 2, '2024-08-28 07:56:05', 'Hoàn thành'),
(2, 3, 15980000, 2089979650, 2, '2024-08-28 13:39:28', 'Hoàn thành');

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_mode`, `date`) VALUES
(5, 1, 168268248, 16890000, 'Tiền mặt', '2024-08-28 07:56:05'),
(6, 2, 2089979650, 15980000, 'Tiền mặt', '2024-08-28 13:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_email`, `user_password`, `user_image`, `user_ip`, `user_address`, `user_mobile`) VALUES
(3, 'Minh', 'minh@go.com', '$2y$10$9IMRSGMb.nZojM7tsx8ZIefQI40HOflek5ilAiWhFZYB8eETXRn92', '11.jpg', '::1', 'brvt', '1234511'),
(4, 'Long', 'long@gmail.com', '$2y$10$7Pe0CfbWAZK4rDW9AD3dTOCs86UJgoZP3TCdXY/3WHrPLX8spMggm', '11.jpg', '::1', 'hcm', '11323213');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
