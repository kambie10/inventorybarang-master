# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ;

#
# Data contents of table admin (3 records)
#
 
INSERT INTO `admin` VALUES (6, 'admin', 'admin@admin.com', 'admin', 1, 'people.png') ; 
INSERT INTO `admin` VALUES (8, 'david', 'david@maulana.com', 'admin', 2, 'people.png') ; 
INSERT INTO `admin` VALUES (9, 'mancika', 'mancika@gmail.com', 'mancika', 3, 'people.png') ;
#
# End of data contents of table admin
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`kd_barang`),
  KEY `sat` (`sat`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`sat`) REFERENCES `satuan` (`kd_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

#
# Data contents of table barang (5 records)
#
 
INSERT INTO `barang` VALUES ('BB00001', 'Buku', 2, 1500, 1, '0') ; 
INSERT INTO `barang` VALUES ('BB00002', 'Pena', 1, 1500, 17, '0') ; 
INSERT INTO `barang` VALUES ('BB00003', 'Silicone Alumunium Grey', 1, 5000, 20, '1') ; 
INSERT INTO `barang` VALUES ('BB00004', 'Silicone Black', 1, 2500, 5, '1') ; 
INSERT INTO `barang` VALUES ('BB00005', 'HP', 2, 3000, 10, '0') ;
#
# End of data contents of table barang
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 ;

#
# Data contents of table barang_pembelian (3 records)
#
 
INSERT INTO `barang_pembelian` VALUES (106, 'BM00005', 'BB00001', 'gunting', '', '3000', 5, '15000', '0') ; 
INSERT INTO `barang_pembelian` VALUES (108, 'BM00005', 'BB00001', 'gunting', '', '3000', 5, '15000', '0') ; 
INSERT INTO `barang_pembelian` VALUES (109, 'BM00001', 'BB00001', 'Buku', 'MET', '1500', 1, '1500', '0') ;
#
# End of data contents of table barang_pembelian
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

#
# Data contents of table barangp_sementara (1 records)
#
 
INSERT INTO `barangp_sementara` VALUES (1, 'BM00002', 'BB00001', 'Buku', 'MET', '1500', 1, '1500') ;
#
# End of data contents of table barangp_sementara
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

#
# Data contents of table d_pembelian (1 records)
#
 
INSERT INTO `d_pembelian` VALUES (1, 'BM00001', 'BB00001', 1, '1500') ;
#
# End of data contents of table d_pembelian
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ;

#
# Data contents of table d_penjualan (8 records)
#
 
INSERT INTO `d_penjualan` VALUES (15, 'INV00001', 'BB00003', 1, '6000') ; 
INSERT INTO `d_penjualan` VALUES (16, 'INV00001', 'BB00002', 1, '2000') ; 
INSERT INTO `d_penjualan` VALUES (18, 'INV00002', 'BB00003', 1, '6000') ; 
INSERT INTO `d_penjualan` VALUES (19, 'INV00002', 'BB00002', 1, '2000') ; 
INSERT INTO `d_penjualan` VALUES (20, 'INV00002', 'BB00001', 1, '2000') ; 
INSERT INTO `d_penjualan` VALUES (24, 'INV00003', 'BB00002', 1, '2000') ; 
INSERT INTO `d_penjualan` VALUES (25, 'INV00004', 'BB00003', 1, '6000') ; 
INSERT INTO `d_penjualan` VALUES (26, 'INV00005', 'BB00004', 1, '3000') ;
#
# End of data contents of table d_penjualan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Generated: Monday 30. April 2018 18:04 WIB
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
  `nama_toko` varchar(100) NOT NULL,
  `notlp` varchar(25) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  PRIMARY KEY (`kd_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ;

#
# Data contents of table pelanggan (3 records)
#
 
INSERT INTO `pelanggan` VALUES (1, '1unidha', '1david', '09866', 'simpang haru') ; 
INSERT INTO `pelanggan` VALUES (2, 'Mobile Lengend', 'Balmon', '0987', 'Padang') ; 
INSERT INTO `pelanggan` VALUES (4, 'Unidah', 'satu', '000', 'padang') ;
#
# End of data contents of table pelanggan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Data contents of table pembelian (1 records)
#
 
INSERT INTO `pembelian` VALUES ('BM00001', '2018-03-31', 6, 1, '1500') ;
#
# End of data contents of table pembelian
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
# --------------------------------------------------------


#
# Delete any existing table `pembelian_update`
#

DROP TABLE IF EXISTS `pembelian_update`;


#
# Table structure of table `pembelian_update`
#

CREATE TABLE `pembelian_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` varchar(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

#
# Data contents of table pembelian_update (1 records)
#
 
INSERT INTO `pembelian_update` VALUES (1, 'BM00001', 'BB00001', 1) ;
#
# End of data contents of table pembelian_update
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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
  `nama_plg` varchar(50) NOT NULL,
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
# Data contents of table penjualan (5 records)
#
 
INSERT INTO `penjualan` VALUES ('INV00001', '2018-03-31', 6, 1, '1david', 1, 8800, '8000') ; 
INSERT INTO `penjualan` VALUES ('INV00002', '2018-03-31', 6, 1, '1david', 1, 11000, '10000') ; 
INSERT INTO `penjualan` VALUES ('INV00003', '2018-04-03', 6, 2, 'Balmon', 1, 2200, '2000') ; 
INSERT INTO `penjualan` VALUES ('INV00004', '2018-04-03', 6, 4, 'david maulana', 1, 6600, '6000') ; 
INSERT INTO `penjualan` VALUES ('INV00005', '2018-04-30', 6, 4, 'satu', 1, 3300, '3000') ;
#
# End of data contents of table penjualan
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

#
# Data contents of table penjualan_sementara (0 records)
#

#
# End of data contents of table penjualan_sementara
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_penjualan` varchar(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 ;

#
# Data contents of table penjualan_update (11 records)
#
 
INSERT INTO `penjualan_update` VALUES (27, 'INV00001', 'BB00003', 1) ; 
INSERT INTO `penjualan_update` VALUES (28, 'INV00001', 'BB00002', 1) ; 
INSERT INTO `penjualan_update` VALUES (30, 'INV00002', 'BB00003', 1) ; 
INSERT INTO `penjualan_update` VALUES (31, 'INV00002', 'BB00002', 1) ; 
INSERT INTO `penjualan_update` VALUES (32, 'INV00002', 'BB00001', 1) ; 
INSERT INTO `penjualan_update` VALUES (33, 'INV00003', 'BB00004', 2) ; 
INSERT INTO `penjualan_update` VALUES (34, 'INV00003', 'BB00002', 2) ; 
INSERT INTO `penjualan_update` VALUES (35, 'INV00003', 'BB00003', 1) ; 
INSERT INTO `penjualan_update` VALUES (36, 'INV00003', 'BB00002', 1) ; 
INSERT INTO `penjualan_update` VALUES (37, 'INV00004', 'BB00003', 1) ; 
INSERT INTO `penjualan_update` VALUES (38, 'INV00005', 'BB00004', 1) ;
#
# End of data contents of table penjualan_update
# --------------------------------------------------------

# WordPress : buffernow.com MySQL database backup
#
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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
# Generated: Monday 30. April 2018 18:04 WIB
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
# Table: `pembelian_update`
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

