-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2018 at 02:04 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `kd_admin` int(6) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `kd_level` int(11) NOT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kd_admin`, `nama`, `email`, `password`, `kd_level`, `gambar`) VALUES
(6, 'admin', 'admin@admin.com', 'admin', 1, 'people.png'),
(8, 'david', 'david@maulana.com', 'admin', 2, 'people.png'),
(9, 'mancika', 'mancika@gmail.com', 'mancika', 3, 'people.png');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `sat` int(25) NOT NULL,
  `harga` int(15) NOT NULL,
  `stok` int(4) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `sat`, `harga`, `stok`, `status`) VALUES
('BB00001', 'Buku', 2, 1500, 1, '0'),
('BB00002', 'Pena', 1, 1500, 17, '0'),
('BB00003', 'Silicone Alumunium Grey', 1, 5000, 20, '1'),
('BB00004', 'Silicone Black', 1, 2500, 5, '1'),
('BB00005', 'HP', 2, 3000, 10, '0');

-- --------------------------------------------------------

--
-- Table structure for table `barangp_sementara`
--

CREATE TABLE `barangp_sementara` (
  `id_barangp` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang` varchar(15) NOT NULL,
  `nama_barangp` varchar(225) NOT NULL,
  `satuan` varchar(5) NOT NULL,
  `harga_barangp` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barangp_sementara`
--

INSERT INTO `barangp_sementara` (`id_barangp`, `kd_pembelian`, `kd_barang`, `nama_barangp`, `satuan`, `harga_barangp`, `item`, `total`) VALUES
(1, 'BM00002', 'BB00001', 'Buku', 'MET', 1500, 1, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `barang_pembelian`
--

CREATE TABLE `barang_pembelian` (
  `kd_barang_beli` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang` varchar(16) NOT NULL,
  `nama_barang_beli` varchar(225) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `harga_beli` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_pembelian`
--

INSERT INTO `barang_pembelian` (`kd_barang_beli`, `kd_pembelian`, `kd_barang`, `nama_barang_beli`, `satuan`, `harga_beli`, `item`, `total`, `status`) VALUES
(106, 'BM00005', 'BB00001', 'gunting', '', 3000, 5, 15000, '0'),
(108, 'BM00005', 'BB00001', 'gunting', '', 3000, 5, 15000, '0'),
(109, 'BM00001', 'BB00001', 'Buku', 'MET', 1500, 1, 1500, '0');

-- --------------------------------------------------------

--
-- Table structure for table `d_pembelian`
--

CREATE TABLE `d_pembelian` (
  `id_pembelian` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang` varchar(16) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_pembelian`
--

INSERT INTO `d_pembelian` (`id_pembelian`, `kd_pembelian`, `kd_barang`, `jumlah`, `subtotal`) VALUES
(1, 'BM00001', 'BB00001', 1, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `d_penjualan`
--

CREATE TABLE `d_penjualan` (
  `id_penjualan` int(6) NOT NULL,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_penjualan`
--

INSERT INTO `d_penjualan` (`id_penjualan`, `kd_penjualan`, `kd_barang`, `jumlah`, `subtotal`) VALUES
(15, 'INV00001', 'BB00003', 1, 6000),
(16, 'INV00001', 'BB00002', 1, 2000),
(18, 'INV00002', 'BB00003', 1, 6000),
(19, 'INV00002', 'BB00002', 1, 2000),
(20, 'INV00002', 'BB00001', 1, 2000),
(24, 'INV00003', 'BB00002', 1, 2000),
(25, 'INV00004', 'BB00003', 1, 6000),
(26, 'INV00005', 'BB00004', 1, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `kd_level` int(6) NOT NULL,
  `nama_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`kd_level`, `nama_level`) VALUES
(1, 'Operasional'),
(2, 'Keuangan'),
(3, 'Logistik');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` int(6) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `nama_toko` varchar(100) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nama_pelanggan`, `nama_toko`, `notlp`, `alamat`) VALUES
(1, '1unidha', '1david', '09866', 'simpang haru'),
(2, 'Mobile Lengend', 'Balmon', '0987', 'Padang'),
(4, 'Unidah', 'satu', '000', 'padang');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `kd_pembelian` char(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_supplier` int(6) NOT NULL,
  `total_pembelian` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`kd_pembelian`, `tgl_pembelian`, `kd_admin`, `kd_supplier`, `total_pembelian`) VALUES
('BM00001', '2018-03-31', 6, 1, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_update`
--

CREATE TABLE `pembelian_update` (
  `id` int(11) NOT NULL,
  `kd_pembelian` varchar(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_update`
--

INSERT INTO `pembelian_update` (`id`, `kd_pembelian`, `kd_barang`, `jumlah`) VALUES
(1, 'BM00001', 'BB00001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kd_penjualan` char(8) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_pelanggan` int(6) NOT NULL,
  `nama_plg` varchar(50) NOT NULL,
  `kd_sales` int(11) NOT NULL,
  `dibayar` int(11) NOT NULL,
  `total_penjualan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kd_penjualan`, `tgl_penjualan`, `kd_admin`, `kd_pelanggan`, `nama_plg`, `kd_sales`, `dibayar`, `total_penjualan`) VALUES
('INV00001', '2018-03-31', 6, 1, '1david', 1, 8800, 8000),
('INV00002', '2018-03-31', 6, 1, '1david', 1, 11000, 10000),
('INV00003', '2018-04-03', 6, 2, 'Balmon', 1, 2200, 2000),
('INV00004', '2018-04-03', 6, 4, 'david maulana', 1, 6600, 6000),
('INV00005', '2018-04-30', 6, 4, 'satu', 1, 3300, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_sementara`
--

CREATE TABLE `penjualan_sementara` (
  `id_penjualan_sementara` int(11) NOT NULL,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_sementara`
--

INSERT INTO `penjualan_sementara` (`id_penjualan_sementara`, `kd_penjualan`, `kd_barang`, `nama_barang`, `satuan`, `harga`, `item`, `total`) VALUES
(1, 'INV00006', 'BB00002', 'Pena', 'Pcs', 2000, 1, 2000),
(2, 'INV00006', 'BB00005', 'HP', 'MET', 4000, 1, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_update`
--

CREATE TABLE `penjualan_update` (
  `id` int(11) NOT NULL,
  `kd_penjualan` varchar(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_update`
--

INSERT INTO `penjualan_update` (`id`, `kd_penjualan`, `kd_barang`, `jumlah`) VALUES
(27, 'INV00001', 'BB00003', 1),
(28, 'INV00001', 'BB00002', 1),
(30, 'INV00002', 'BB00003', 1),
(31, 'INV00002', 'BB00002', 1),
(32, 'INV00002', 'BB00001', 1),
(33, 'INV00003', 'BB00004', 2),
(34, 'INV00003', 'BB00002', 2),
(35, 'INV00003', 'BB00003', 1),
(36, 'INV00003', 'BB00002', 1),
(37, 'INV00004', 'BB00003', 1),
(38, 'INV00005', 'BB00004', 1);

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `kd_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `pemilik` varchar(225) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `kota` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`kd_perusahaan`, `nama_perusahaan`, `alamat`, `pemilik`, `notlp`, `email`, `kota`) VALUES
(1, 'PT. sembilan cipta karya', 'JL s. parman no 151 B ulak karang', 'omar suleiman', '07518970610', '9ciptakarya@gmail.com', 'padang');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `kd_sales` int(11) NOT NULL,
  `nama_sales` varchar(50) NOT NULL,
  `notlp` varchar(10) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`kd_sales`, `nama_sales`, `notlp`, `alamat`) VALUES
(1, 'david Maulana', '123456', 'padang bintungan');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `kd_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(25) NOT NULL,
  `ket` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`kd_satuan`, `nama_satuan`, `ket`) VALUES
(1, 'Pcs', 'PAK'),
(2, 'MET', 'meter'),
(4, 'BH1', 'Buah1');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kd_supplier` int(6) NOT NULL,
  `nama_supplier` varchar(60) NOT NULL,
  `nama_tk` varchar(50) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `alamat` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `nama_supplier`, `nama_tk`, `notlp`, `alamat`) VALUES
(1, 'Agus makan', 'Toko Agus parah', '08234445', 'padang pasir'),
(5, 'bagus1', 'Toko bagus', '082345', 'Padang'),
(6, 'Barangin', 'Toko Barangain', '082389215587', 'Padang'),
(8, 'david lagi', 'toko david lagi', '098239999', 'padang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kd_admin`),
  ADD KEY `kd_level` (`kd_level`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`),
  ADD KEY `sat` (`sat`);

--
-- Indexes for table `barangp_sementara`
--
ALTER TABLE `barangp_sementara`
  ADD PRIMARY KEY (`id_barangp`),
  ADD KEY `kd_pembelian` (`kd_pembelian`);

--
-- Indexes for table `barang_pembelian`
--
ALTER TABLE `barang_pembelian`
  ADD PRIMARY KEY (`kd_barang_beli`),
  ADD KEY `kd_barang` (`kd_barang`);

--
-- Indexes for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `kd_pembelian` (`kd_pembelian`),
  ADD KEY `kd_barang` (`kd_barang`);

--
-- Indexes for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `kd_penjualan` (`kd_penjualan`),
  ADD KEY `kd_barang` (`kd_barang`),
  ADD KEY `kd_barang_2` (`kd_barang`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`kd_level`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kd_pembelian`),
  ADD KEY `kd_admin` (`kd_admin`),
  ADD KEY `kd_supplier` (`kd_supplier`);

--
-- Indexes for table `pembelian_update`
--
ALTER TABLE `pembelian_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kd_penjualan`),
  ADD KEY `kd_admin` (`kd_admin`),
  ADD KEY `kd_pelanggan` (`kd_pelanggan`),
  ADD KEY `kd_sales` (`kd_sales`);

--
-- Indexes for table `penjualan_sementara`
--
ALTER TABLE `penjualan_sementara`
  ADD PRIMARY KEY (`id_penjualan_sementara`);

--
-- Indexes for table `penjualan_update`
--
ALTER TABLE `penjualan_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`kd_perusahaan`),
  ADD KEY `kd_perusahaan` (`kd_perusahaan`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`kd_sales`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`kd_satuan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kd_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `kd_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `barangp_sementara`
--
ALTER TABLE `barangp_sementara`
  MODIFY `id_barangp` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `barang_pembelian`
--
ALTER TABLE `barang_pembelian`
  MODIFY `kd_barang_beli` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  MODIFY `id_pembelian` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  MODIFY `id_penjualan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `kd_level` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `kd_pelanggan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembelian_update`
--
ALTER TABLE `pembelian_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penjualan_sementara`
--
ALTER TABLE `penjualan_sementara`
  MODIFY `id_penjualan_sementara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan_update`
--
ALTER TABLE `penjualan_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `kd_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `kd_sales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `kd_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `kd_supplier` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`kd_level`) REFERENCES `level` (`kd_level`);

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`sat`) REFERENCES `satuan` (`kd_satuan`);

--
-- Constraints for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD CONSTRAINT `d_pembelian_ibfk_3` FOREIGN KEY (`kd_pembelian`) REFERENCES `pembelian` (`kd_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_pembelian_ibfk_4` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`);

--
-- Constraints for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD CONSTRAINT `d_penjualan_ibfk_3` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`),
  ADD CONSTRAINT `d_penjualan_ibfk_4` FOREIGN KEY (`kd_penjualan`) REFERENCES `penjualan` (`kd_penjualan`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`),
  ADD CONSTRAINT `penjualan_ibfk_3` FOREIGN KEY (`kd_sales`) REFERENCES `sales` (`kd_sales`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
