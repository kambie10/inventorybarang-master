# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------


#
# Delete any existing table `admin`
#

DROP TABLE IF EXISTS `admin`;


#
# Table structure of table `admin`
#

CREATE TABLE `admin` (
  `kd_admin` int(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `kd_level` int(11) NOT NULL,
  `gambar` varchar(225) NOT NULL,
  PRIMARY KEY (`kd_admin`),
  KEY `kd_level` (`kd_level`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`kd_level`) REFERENCES `level` (`kd_level`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ;

#
# Data contents of table admin (2 records)
#
 
INSERT INTO `admin` VALUES (6, 'admin', 'admin@admin.com', 'admin', 1, '13860127261114093136.jpg') ; 
INSERT INTO `admin` VALUES (8, 'david', 'david@maulana.com', 'admin', 2, '13860127261114093136.jpg') ;
#
# End of data contents of table admin
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------


#
# Delete any existing table `barang`
#

DROP TABLE IF EXISTS `barang`;


#
# Table structure of table `barang`
#

CREATE TABLE `barang` (
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `sat` int(25) NOT NULL,
  `harga` int(15) NOT NULL,
  `stok` int(4) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`kd_barang`),
  KEY `sat` (`sat`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`sat`) REFERENCES `satuan` (`kd_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table barang (2 records)
#
 
INSERT INTO `barang` VALUES ('BB00001', 'Buku', 2, 1500, 5, '0') ; 
INSERT INTO `barang` VALUES ('BB00002', 'Pena', 1, 1500, 2, '0') ;
#
# End of data contents of table barang
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------


#
# Delete any existing table `barang_pembelian`
#

DROP TABLE IF EXISTS `barang_pembelian`;


#
# Table structure of table `barang_pembelian`
#

CREATE TABLE `barang_pembelian` (
  `kd_barang_beli` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang` varchar(16) NOT NULL,
  `nama_barang_beli` varchar(225) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `harga_beli` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`kd_barang_beli`),
  KEY `kd_barang` (`kd_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1 ;

#
# Data contents of table barang_pembelian (6 records)
#
 
INSERT INTO `barang_pembelian` VALUES (106, 'BM00005', 'BB00001', 'gunting', '', '3000', 5, '15000', '0') ; 
INSERT INTO `barang_pembelian` VALUES (108, 'BM00005', 'BB00001', 'gunting', '', '3000', 5, '15000', '0') ; 
INSERT INTO `barang_pembelian` VALUES (110, 'BM00001', 'BB00001', 'Buku', 'MET', '1500', 3, '4500', '0') ; 
INSERT INTO `barang_pembelian` VALUES (111, 'BM00002', 'BB00002', 'Pena', 'Pcs', '1500', 5, '7500', '0') ; 
INSERT INTO `barang_pembelian` VALUES (112, 'BM00003', 'BB00001', 'Buku', 'MET', '1500', 1, '1500', '0') ; 
INSERT INTO `barang_pembelian` VALUES (113, 'BM00003', 'BB00002', 'Pena', 'Pcs', '1500', 1, '1500', '0') ;
#
# End of data contents of table barang_pembelian
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------


#
# Delete any existing table `barangp_sementara`
#

DROP TABLE IF EXISTS `barangp_sementara`;


#
# Table structure of table `barangp_sementara`
#

CREATE TABLE `barangp_sementara` (
  `id_barangp` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang` varchar(15) NOT NULL,
  `nama_barangp` varchar(225) NOT NULL,
  `satuan` varchar(5) NOT NULL,
  `harga_barangp` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_barangp`),
  KEY `kd_pembelian` (`kd_pembelian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table barangp_sementara (0 records)
#

#
# End of data contents of table barangp_sementara
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------


#
# Delete any existing table `d_pembelian`
#

DROP TABLE IF EXISTS `d_pembelian`;


#
# Table structure of table `d_pembelian`
#

CREATE TABLE `d_pembelian` (
  `id_pembelian` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang` varchar(16) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `kd_pembelian` (`kd_pembelian`),
  KEY `kd_barang` (`kd_barang`),
  CONSTRAINT `d_pembelian_ibfk_3` FOREIGN KEY (`kd_pembelian`) REFERENCES `pembelian` (`kd_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `d_pembelian_ibfk_4` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ;

#
# Data contents of table d_pembelian (4 records)
#
 
INSERT INTO `d_pembelian` VALUES (2, 'BM00001', 'BB00001', 3, '4500') ; 
INSERT INTO `d_pembelian` VALUES (3, 'BM00002', 'BB00002', 5, '7500') ; 
INSERT INTO `d_pembelian` VALUES (4, 'BM00003', 'BB00001', 1, '1500') ; 
INSERT INTO `d_pembelian` VALUES (5, 'BM00003', 'BB00002', 1, '1500') ;
#
# End of data contents of table d_pembelian
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------


#
# Delete any existing table `d_penjualan`
#

DROP TABLE IF EXISTS `d_penjualan`;


#
# Table structure of table `d_penjualan`
#

CREATE TABLE `d_penjualan` (
  `id_penjualan` int(6) NOT NULL AUTO_INCREMENT,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `kd_penjualan` (`kd_penjualan`),
  KEY `kd_barang` (`kd_barang`),
  KEY `kd_barang_2` (`kd_barang`),
  CONSTRAINT `d_penjualan_ibfk_3` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`),
  CONSTRAINT `d_penjualan_ibfk_4` FOREIGN KEY (`kd_penjualan`) REFERENCES `penjualan` (`kd_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ;

#
# Data contents of table d_penjualan (2 records)
#
 
INSERT INTO `d_penjualan` VALUES (3, 'INV00001', 'BB00001', 2, '4000') ; 
INSERT INTO `d_penjualan` VALUES (4, 'INV00002', 'BB00002', 1, '2000') ;
#
# End of data contents of table d_penjualan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------


#
# Delete any existing table `level`
#

DROP TABLE IF EXISTS `level`;


#
# Table structure of table `level`
#

CREATE TABLE `level` (
  `kd_level` int(6) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(50) NOT NULL,
  PRIMARY KEY (`kd_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ;

#
# Data contents of table level (3 records)
#
 
INSERT INTO `level` VALUES (1, 'Operasional') ; 
INSERT INTO `level` VALUES (2, 'Keuangan') ; 
INSERT INTO `level` VALUES (3, 'Logistik') ;
#
# End of data contents of table level
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------


#
# Delete any existing table `pelanggan`
#

DROP TABLE IF EXISTS `pelanggan`;


#
# Table structure of table `pelanggan`
#

CREATE TABLE `pelanggan` (
  `kd_pelanggan` int(6) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(50) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  PRIMARY KEY (`kd_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ;

#
# Data contents of table pelanggan (2 records)
#
 
INSERT INTO `pelanggan` VALUES (1, 'unidha', '09866', 'simpang haru') ; 
INSERT INTO `pelanggan` VALUES (2, 'Bidang', '0987', 'Padang') ;
#
# End of data contents of table pelanggan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------


#
# Delete any existing table `pembelian`
#

DROP TABLE IF EXISTS `pembelian`;


#
# Table structure of table `pembelian`
#

CREATE TABLE `pembelian` (
  `kd_pembelian` char(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_supplier` int(6) NOT NULL,
  `total_pembelian` double NOT NULL,
  PRIMARY KEY (`kd_pembelian`),
  KEY `kd_admin` (`kd_admin`),
  KEY `kd_supplier` (`kd_supplier`),
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table pembelian (3 records)
#
 
INSERT INTO `pembelian` VALUES ('BM00001', '2018-03-14', 6, 1, '4500') ; 
INSERT INTO `pembelian` VALUES ('BM00002', '2018-03-14', 6, 6, '7500') ; 
INSERT INTO `pembelian` VALUES ('BM00003', '2018-03-14', 6, 8, '3000') ;
#
# End of data contents of table pembelian
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------


#
# Delete any existing table `penjualan`
#

DROP TABLE IF EXISTS `penjualan`;


#
# Table structure of table `penjualan`
#

CREATE TABLE `penjualan` (
  `kd_penjualan` char(8) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_pelanggan` int(6) NOT NULL,
  `kd_sales` int(11) NOT NULL,
  `dibayar` int(11) NOT NULL,
  `total_penjualan` double NOT NULL,
  PRIMARY KEY (`kd_penjualan`),
  KEY `kd_admin` (`kd_admin`),
  KEY `kd_pelanggan` (`kd_pelanggan`),
  KEY `kd_sales` (`kd_sales`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`),
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`),
  CONSTRAINT `penjualan_ibfk_3` FOREIGN KEY (`kd_sales`) REFERENCES `sales` (`kd_sales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table penjualan (2 records)
#
 
INSERT INTO `penjualan` VALUES ('INV00001', '2018-03-14', 6, 1, 1, 4400, '4000') ; 
INSERT INTO `penjualan` VALUES ('INV00002', '2018-03-14', 6, 1, 1, 2200, '2000') ;
#
# End of data contents of table penjualan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_sementara`
# --------------------------------------------------------


#
# Delete any existing table `penjualan_sementara`
#

DROP TABLE IF EXISTS `penjualan_sementara`;


#
# Table structure of table `penjualan_sementara`
#

CREATE TABLE `penjualan_sementara` (
  `id_penjualan_sementara` int(11) NOT NULL AUTO_INCREMENT,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_penjualan_sementara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table penjualan_sementara (0 records)
#

#
# End of data contents of table penjualan_sementara
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_update`
# --------------------------------------------------------


#
# Delete any existing table `penjualan_update`
#

DROP TABLE IF EXISTS `penjualan_update`;


#
# Table structure of table `penjualan_update`
#

CREATE TABLE `penjualan_update` (
  `id_penjualan_update` int(11) NOT NULL AUTO_INCREMENT,
  `kd_penjualan` varchar(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(250) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_penjualan_update`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table penjualan_update (0 records)
#

#
# End of data contents of table penjualan_update
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_update`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `perusahaan`
# --------------------------------------------------------


#
# Delete any existing table `perusahaan`
#

DROP TABLE IF EXISTS `perusahaan`;


#
# Table structure of table `perusahaan`
#

CREATE TABLE `perusahaan` (
  `kd_perusahaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `pemilik` varchar(225) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `kota` varchar(225) NOT NULL,
  PRIMARY KEY (`kd_perusahaan`),
  KEY `kd_perusahaan` (`kd_perusahaan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

#
# Data contents of table perusahaan (1 records)
#
 
INSERT INTO `perusahaan` VALUES (1, 'PT. sembilan cipta karya', 'JL s. parman no 151 B ulak karang', 'omar suleiman', '07518970610', '9ciptakarya@gmail.com', 'padang') ;
#
# End of data contents of table perusahaan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_update`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `perusahaan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `sales`
# --------------------------------------------------------


#
# Delete any existing table `sales`
#

DROP TABLE IF EXISTS `sales`;


#
# Table structure of table `sales`
#

CREATE TABLE `sales` (
  `kd_sales` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sales` varchar(50) NOT NULL,
  `notlp` varchar(10) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  PRIMARY KEY (`kd_sales`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

#
# Data contents of table sales (1 records)
#
 
INSERT INTO `sales` VALUES (1, 'david Maulana', '123456', 'padang bintungan') ;
#
# End of data contents of table sales
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_update`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `perusahaan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `sales`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `satuan`
# --------------------------------------------------------


#
# Delete any existing table `satuan`
#

DROP TABLE IF EXISTS `satuan`;


#
# Table structure of table `satuan`
#

CREATE TABLE `satuan` (
  `kd_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(25) NOT NULL,
  `ket` varchar(50) NOT NULL,
  PRIMARY KEY (`kd_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ;

#
# Data contents of table satuan (3 records)
#
 
INSERT INTO `satuan` VALUES (1, 'Pcs', 'PAK') ; 
INSERT INTO `satuan` VALUES (2, 'MET', 'meter') ; 
INSERT INTO `satuan` VALUES (4, 'BH1', 'Buah1') ;
#
# End of data contents of table satuan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Friday 16. March 2018 15:51 WIT
# Hostname: localhost
# Database: `inventory_barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `admin`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barang_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `barangp_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `d_penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `level`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pelanggan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `pembelian`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_sementara`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `penjualan_update`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `perusahaan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `sales`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `satuan`
# --------------------------------------------------------
# --------------------------------------------------------
# Table: `supplier`
# --------------------------------------------------------


#
# Delete any existing table `supplier`
#

DROP TABLE IF EXISTS `supplier`;


#
# Table structure of table `supplier`
#

CREATE TABLE `supplier` (
  `kd_supplier` int(6) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(60) NOT NULL,
  `nama_tk` varchar(50) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  PRIMARY KEY (`kd_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ;

#
# Data contents of table supplier (4 records)
#
 
INSERT INTO `supplier` VALUES (1, 'Agus makan', 'Toko Agus parah', '0823444', 'padang pasir') ; 
INSERT INTO `supplier` VALUES (5, 'bagus1', 'Toko bagus', '082345', 'Padang') ; 
INSERT INTO `supplier` VALUES (6, 'Barangin', 'Toko Barangain', '082389215587', 'Padang') ; 
INSERT INTO `supplier` VALUES (8, 'david lagi', 'toko david lagi', '098239999', 'padang') ;
#
# End of data contents of table supplier
# --------------------------------------------------------

