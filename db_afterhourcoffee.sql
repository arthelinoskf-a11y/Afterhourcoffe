-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2026 at 03:11 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_afterhourcoffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` int NOT NULL,
  `kategori` enum('Coffee','Non-Coffee','Pastry','Food') DEFAULT 'Coffee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `nama_menu`, `harga`, `kategori`) VALUES
(1, 'Americano', 20000, 'Coffee'),
(2, 'Cappuccino', 25000, 'Coffee'),
(3, 'Caramel Macchiato', 28000, 'Coffee'),
(4, 'Kopi Kenangan Mantan / Aren', 22000, 'Coffee'),
(5, 'Cold Brew', 24000, 'Coffee'),
(6, 'Espresso', 18000, 'Coffee'),
(7, 'Latte', 24000, 'Coffee'),
(8, 'Manual Brew', 25000, 'Coffee'),
(9, 'Matcha Latte', 26000, 'Non-Coffee'),
(10, 'Chocolate Signature', 25000, 'Non-Coffee'),
(11, 'Taro Latte', 24000, 'Non-Coffee'),
(12, 'Lemon Tea Ice', 18000, 'Non-Coffee'),
(13, 'Lychee Tea Ice', 20000, 'Non-Coffee'),
(14, 'Red Velvet Latte', 25000, 'Non-Coffee'),
(15, 'Butter Croissant', 22000, 'Pastry'),
(16, 'Almond Croissant', 27000, 'Pastry'),
(17, 'Cinnamon Roll', 20000, 'Pastry'),
(18, 'Choco Brownies', 18000, 'Pastry');

-- --------------------------------------------------------

--
-- Table structure for table `staf`
--

CREATE TABLE `staf` (
  `staf_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_staf` varchar(100) NOT NULL,
  `role` enum('admin','kasir') DEFAULT 'kasir'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staf`
--

INSERT INTO `staf` (`staf_id`, `username`, `password`, `nama_staf`, `role`) VALUES
(1, 'admin', '1234', 'Admin Afterhour', 'admin'),
(2, 'kasir', '1234', 'Zayn', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int NOT NULL,
  `nomor_nota` varchar(30) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `detail_pesanan` text NOT NULL,
  `total_harga` int NOT NULL,
  `metode_bayar` varchar(30) NOT NULL,
  `kode_voucher` varchar(50) DEFAULT NULL,
  `staf_id` int NOT NULL,
  `tanggal_transaksi` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int NOT NULL,
  `kode_voucher` varchar(50) NOT NULL,
  `diskon_persen` int NOT NULL DEFAULT '0',
  `potongan_harga` int NOT NULL DEFAULT '0',
  `status` enum('active','used','expired') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `kode_voucher`, `diskon_persen`, `potongan_harga`, `status`) VALUES
(1, 'AFTERHOUR10', 10, 0, 'active'),
(2, 'MEMBER5K', 0, 5000, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `staf`
--
ALTER TABLE `staf`
  ADD PRIMARY KEY (`staf_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD UNIQUE KEY `nomor_nota` (`nomor_nota`),
  ADD KEY `staf_id` (`staf_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`),
  ADD UNIQUE KEY `kode_voucher` (`kode_voucher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `staf`
--
ALTER TABLE `staf`
  MODIFY `staf_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`staf_id`) REFERENCES `staf` (`staf_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
