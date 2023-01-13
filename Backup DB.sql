/*
SQLyog Community v13.1.5  (32 bit)
MySQL - 10.1.34-MariaDB : Database - latihan_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`latihan_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `latihan_db`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `barang_id` varchar(4) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  PRIMARY KEY (`barang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `barang` */

insert  into `barang`(`barang_id`,`nama_barang`,`harga_barang`) values 
('B001','Buku',5000),
('B002','Tas',100000),
('B003','Sepatu',125000),
('B005','b',1),
('B006','d',1),
('B007','5',6),
('B008','a',1),
('B009','d',1),
('B010','Gelas',10);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `kode_customer` varchar(4) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `customer` */

insert  into `customer`(`kode_customer`,`nama_customer`) values 
('C001','PT Anugerah Indah');

/*Table structure for table `detail_transaksi` */

DROP TABLE IF EXISTS `detail_transaksi`;

CREATE TABLE `detail_transaksi` (
  `Faktur` varchar(15) NOT NULL,
  `barang_id` varchar(4) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `detail_transaksi` */

insert  into `detail_transaksi`(`Faktur`,`barang_id`,`qty`,`subtotal`) values 
('FK11012200001','B001',1,5000),
('FK11012200001','B002',1,100000),
('FK11012200002','B001',1,5000),
('FK11012200002','B002',1,100000),
('FK11012200002','B003',1,125000),
('FK11012200003','B002',1,100000),
('FK11012200003','B004',1,20000),
('FK12012200001','B001',1,5000),
('FK12012200001','B002',1,100000),
('FK12012200001','B003',1,125000);

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `no_invoice` varchar(15) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `invoice` */

insert  into `invoice`(`no_invoice`,`tanggal`) values 
('FK24112100001','2021-11-24 11:41:51'),
('FK24112100002','2021-11-24 11:43:04');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `level` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`admin`,`level`) values 
('udin','123','Fakhrudin','Kasir');

/*Table structure for table `tb_gambar` */

DROP TABLE IF EXISTS `tb_gambar`;

CREATE TABLE `tb_gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(100) DEFAULT NULL,
  `nama_file` varchar(100) DEFAULT NULL,
  `ukuran_file` double DEFAULT NULL,
  `tipe_file` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tb_gambar` */

insert  into `tb_gambar`(`id`,`deskripsi`,`nama_file`,`ukuran_file`,`tipe_file`) values 
(1,'Baju','Disain_baju.jpg',1157.72,'image/jpeg'),
(2,'Baju gamis','Dapodik.jpeg',60.63,'image/jpeg'),
(3,'Mawar','Surat_Tugas_Yuliadi.jpg',156.15,'image/jpeg'),
(4,'Baju gamis','dosen.png',4.34,'image/png');

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `Faktur` varchar(15) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kode_customer` varchar(4) NOT NULL,
  `total` double NOT NULL,
  `ppn` double NOT NULL,
  `total_bayar` double NOT NULL,
  `admin` varchar(50) NOT NULL,
  PRIMARY KEY (`Faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `transaksi` */

insert  into `transaksi`(`Faktur`,`tanggal`,`kode_customer`,`total`,`ppn`,`total_bayar`,`admin`) values 
('FK11012200001','2022-01-11 19:05:13','C001',105000,10500,115500,''),
('FK11012200002','2022-01-11 19:07:23','C001',230000,23000,253000,''),
('FK11012200003','2022-01-11 19:12:37','C001',120000,12000,132000,''),
('FK12012200001','2022-01-12 04:56:24','C001',230000,23000,253000,'');

/*Table structure for table `v_login` */

DROP TABLE IF EXISTS `v_login`;

CREATE TABLE `v_login` (
  `username` varchar(15) DEFAULT NULL,
  `admin` varchar(50) DEFAULT NULL,
  `level` varchar(30) DEFAULT NULL,
  `pengguna` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `v_login` */

/*Table structure for table `v_transaksi` */

DROP TABLE IF EXISTS `v_transaksi`;

CREATE TABLE `v_transaksi` (
  `faktur` varchar(15) DEFAULT NULL,
  `barang_id` varchar(4) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `v_transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
