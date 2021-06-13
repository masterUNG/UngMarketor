-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2021 at 11:30 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `androidh_bigc`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `user` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `lat` text COLLATE utf8_unicode_ci NOT NULL,
  `lng` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `user`, `password`, `lat`, `lng`) VALUES
(1, 'มาสเตอร์ อึ่ง', 'master', '123456', '16.746475', '100.1933'),
(2, 'ฉัตรชนก', 'Chut', '123456', '16.746475', '100.1933'),
(4, 'วิชุดา', 'jib', '12345', '13.674291', '100.60668115921456'),
(7, 'บรรจง  ปองนาน', 'jong', '123456789', '14.5359497', '100.8901477'),
(8, 'บัญจง', 'banjong', '123456789', '14.5359458', '100.8901567'),
(9, 'แอพเปิล', 'apple', '123456', '13.674291', '100.60668115921456'),
(10, 'angoon', 'angoon', '123456', '16.865049516725136', '100.24907339010528'),
(11, 'shotewath', 'wath', '123456', '13.5972183', '100.7254629'),
(16, 'บรรจง  ปองนาน', 'pongnan', '123456', '14.5556043', '100.8924242'),
(27, 'โดรามอน', 'dora', '123456', '12.57287', '99.9595733'),
(28, 'น้องหนึ่ง', 'Nueng', '123456', '13.7615633', '100.4912233'),
(29, 'น้องไม้', 'mai', '123456', '14.041863317874817', '99.50529824489597'),
(41, 'Anuchit', 'pound47120', '471203031232', '13.9460608', '100.630528'),
(42, 'pond', 'pound', '471203031232', '13.8969088', '100.6403584'),
(43, 'test123', 'testman', '123123', '37.4219983', '-122.084'),
(44, '1111', '1111', '1111', '13.903462399999999', '100.6501888'),
(45, 'rungtote', 'oaumo123', '123456789', '13.903462399999999', '100.6501888'),
(46, 'rome2010', 'rome2010', 'rome2010', '37.4219983', '-122.084'),
(47, 'Wichuda', 'Jibapn', '12345', 'null', 'null'),
(48, 'Ampin', 'wichuda', '12345', '16.746475', '100.1933'),
(50, 'isara chootip', 'isara', 'oil639619', '12.9302528', '100.90250239999999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
