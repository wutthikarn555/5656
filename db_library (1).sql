-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2025 at 08:13 AM
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
-- Database: `db_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_book`
--

CREATE TABLE `tb_book` (
  `b_id` varchar(10) NOT NULL,
  `b_name` varchar(255) NOT NULL,
  `b_writer` varchar(255) NOT NULL,
  `b_category` int(11) NOT NULL,
  `b_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_book`
--

INSERT INTO `tb_book` (`b_id`, `b_name`, `b_writer`, `b_category`, `b_price`) VALUES
('B00001', 'คู่มือการสอบรับราชการ', 'สมศักดิ์ ตั้งใจ', 1, 299.00),
('B00002', 'แฮร์รี่ พอตเตอร์', 'J.K. Rowling', 2, 359.00),
('B00003', 'เย็น ปัก ถัก ร้อย', 'สะอาด อิ่มสุข', 3, 329.00),
('B00004', 'เจ้าชายน้อย', 'อ็องตวน เดอ แซ็ง', 2, 355.00),
('B00005', 'การเขียนโปรแกรมคอมพิวเตอร์', 'กิ้มแก้ว กลิ่นเหมือน', 1, 329.00);

-- --------------------------------------------------------

--
-- Table structure for table `tb_borrow_book`
--

CREATE TABLE `tb_borrow_book` (
  `br_date_br` date NOT NULL,
  `br_date_rt` date DEFAULT NULL,
  `b_id` varchar(10) NOT NULL,
  `m_user` varchar(50) NOT NULL,
  `br_fine` decimal(10,2) DEFAULT 0.00,
  `br_due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_borrow_book`
--

INSERT INTO `tb_borrow_book` (`br_date_br`, `br_date_rt`, `b_id`, `m_user`, `br_fine`, `br_due_date`) VALUES
('2021-08-20', '2021-08-28', 'B00002', 'member03', 25.00, NULL),
('2021-08-21', '2021-08-22', 'B00001', 'member02', 0.00, NULL),
('2021-08-22', NULL, 'B00003', 'member01', 0.00, NULL),
('2021-08-23', NULL, 'B00004', 'member05', 5.00, NULL),
('2025-02-19', '2025-02-19', 'B00002', 'สมเกียรติ เก่งกล้า	', 100.00, NULL),
('2025-02-19', '2025-02-19', 'B00002', 'member02', 100.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `m_user` varchar(40) NOT NULL,
  `m_pass` varchar(20) NOT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `m_phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_member`
--

INSERT INTO `tb_member` (`id`, `m_user`, `m_pass`, `m_name`, `m_phone`) VALUES
(7, 'member02', 'abc2222', 'สมชาย มั่นคง', '0822222222'),
(8, 'member03', 'abc3333', 'สมเกียรติ เก่งกล้า', '0833333333'),
(9, 'member04', 'abc4444', 'สมหญิง อิ่มเอม', '084444444'),
(10, 'member05', 'abc5555', 'สมรัก สะอาด', '0855555555'),
(17, 'member01', 'member01', 'สมชาย จริงใจ', '0811111111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_book`
--
ALTER TABLE `tb_book`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `tb_borrow_book`
--
ALTER TABLE `tb_borrow_book`
  ADD KEY `tb_borrow_book_ibfk_1` (`b_id`);

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_borrow_book`
--
ALTER TABLE `tb_borrow_book`
  ADD CONSTRAINT `tb_borrow_book_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `tb_book` (`b_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
