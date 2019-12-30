-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23 Jul 2019 pada 18.56
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pegadaian`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DetailBarang` (IN `id_brg` CHAR(5))  BEGIN
SELECT c.id_cust, c.nama_cust, a.* FROM barang a 
INNER JOIN pinjaman b ON a.id_barang = b.id_barang
INNER JOIN customer c ON b.id_cust = c.id_cust;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GantiBarang` (IN `id_brg` CHAR(5), IN `id_jns` CHAR(5))  BEGIN 
UPDATE barang
SET id_jenis=id_jns
WHERE id_barang=id_brg;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HapusBarang` (IN `id_brg` CHAR(5))  BEGIN
DELETE FROM barang WHERE id_barang-id_brg;
ENd$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TambahBarang` (IN `id_brg` CHAR(5), IN `id_jns` VARCHAR(60), IN `brt` VARCHAR(50), IN `hrg` VARCHAR(10))  BEGIN
INSERT INTO barang
(id_barang,id_jenis,berat,harga)
VALUES
(id_brg,id_jns,brt,hrg);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TampilBarang` ()  BEGIN
SELECT * FROM barang;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `angsuran`
--

CREATE TABLE `angsuran` (
  `id_angsuran` varchar(7) NOT NULL,
  `id_pinjam` varchar(12) DEFAULT NULL,
  `tgl_angsuran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `angsuran`
--

INSERT INTO `angsuran` (`id_angsuran`, `id_pinjam`, `tgl_angsuran`) VALUES
('001', 'PJ0001', '2019-07-03'),
('002', 'PJ0002', '2019-07-17'),
('003', 'PJ0003', '2019-07-23'),
('004', 'PJ0001', '2019-07-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(8) NOT NULL,
  `id_jenis` varchar(8) DEFAULT NULL,
  `berat` varchar(9) DEFAULT NULL,
  `harga` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `id_jenis`, `berat`, `harga`) VALUES
('AAAA', 'BBBB', '3', '70000000'),
('BBBB', 'CCCC', '6', '4574930'),
('BRG00', 'VVRT', '7', '17500000'),
('BRG0001', 'HVV045', '3', '2300000'),
('BRG0002', 'HVV042', '2.25', '1000000'),
('BRG0003', 'HVV092', '10', '5000000'),
('BRG0004', 'HVV038', '1', '3000000');

--
-- Trigger `barang`
--
DELIMITER $$
CREATE TRIGGER `pegadaian_delete` BEFORE DELETE ON `barang` FOR EACH ROW BEGIN
	INSERT INTO log_history SET
	id_barang = old.id_barang, tgljamlog = now(), status = "DIHAPUS",
	client_name = USER();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pegadaian_insert` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
	INSERT INTO log_history SET
	id_barang = new.id_barang, tgljamlog = now(), status = "DITAMBAHKAN",
	client_name = USER();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pegadaian_update` AFTER UPDATE ON `barang` FOR EACH ROW BEGIN
	INSERT INTO log_history SET
	id_barang = new.id_barang, tgljamlog = now(), status =  "DIRUBAH",
	client_name = USER();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_cust` varchar(8) NOT NULL,
  `np_ktp` varchar(15) DEFAULT NULL,
  `nama_cust` varchar(60) DEFAULT NULL,
  `alamat` varchar(60) DEFAULT NULL,
  `no_tlp` varchar(15) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `pekerjaan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_cust`, `np_ktp`, `nama_cust`, `alamat`, `no_tlp`, `tgl_daftar`, `pekerjaan`) VALUES
('CST0001', '634527', 'ASADI SALIM', 'JL. KEMUNING', '08216548345', '2019-06-23', 'PROGRAMMER'),
('CST0002', '645894', 'DICKY KUSMAWAN', 'JL. KEADILAN', '086754463', '2019-06-23', 'EDITOR'),
('CST0003', '643738', 'HADI ARRAHMAN', 'JL. CIPLUKAN', '089956743', '2019-06-23', 'ADMINISTRASI'),
('CST0004', '655084', 'MUH SUKMA SAPUTRA', 'JL. PORSELEN', '08345926863', '2019-07-23', 'ANALYST');

--
-- Trigger `customer`
--
DELIMITER $$
CREATE TRIGGER `penambahan_customer` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
	INSERT INTO log_pegadaian SET
	id_cust = new.id_cust, tgljampegadaian = now(), status = "DITAMBAHKAN",
	client_name = USER();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `penghapusan_customer` BEFORE DELETE ON `customer` FOR EACH ROW BEGIN
	INSERT INTO log_pegadaian SET
	id_cust = old.id_cust, tgljampegadaian = now(), status = "DIHAPUS",
	client_name = USER();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `perubahan_customer` AFTER UPDATE ON `customer` FOR EACH ROW BEGIN
	INSERT INTO log_pegadaian SET
	id_cust = new.id_cust, tgljampegadaian = now(), status = "DIRUBAH",
	client_name = USER();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_history`
--

CREATE TABLE `log_history` (
  `id_log` int(10) NOT NULL,
  `id_barang` varchar(8) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tgljamlog` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `client_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log_history`
--

INSERT INTO `log_history` (`id_log`, `id_barang`, `status`, `tgljamlog`, `client_name`) VALUES
(1, 'BRG0002', 'DIRUBAH', '2019-07-07 14:10:54', 'root@local'),
(2, 'ABCDE', 'DITAMBAH', '2019-07-07 15:02:16', 'root@local'),
(3, 'ABCDE', 'DIHAPUS', '2019-07-07 15:03:39', 'root@local'),
(4, 'BBBB', 'DITAMBAH', '2019-07-23 16:35:13', 'root@local');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_pegadaian`
--

CREATE TABLE `log_pegadaian` (
  `id_log` int(10) NOT NULL,
  `id_cust` varchar(8) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tgljampegadaian` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `client_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log_pegadaian`
--

INSERT INTO `log_pegadaian` (`id_log`, `id_cust`, `status`, `tgljampegadaian`, `client_name`) VALUES
(1, 'CST0004', 'DITAMBAHKA', '2019-07-23 16:29:13', 'root@local');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelunasan`
--

CREATE TABLE `pelunasan` (
  `id_lunas` varchar(50) NOT NULL,
  `id_cust` varchar(8) DEFAULT NULL,
  `tgl_lunas` date DEFAULT NULL,
  `jml_lunas` varchar(50) DEFAULT NULL,
  `pelunasan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelunasan`
--

INSERT INTO `pelunasan` (`id_lunas`, `id_cust`, `tgl_lunas`, `jml_lunas`, `pelunasan`) VALUES
('001', NULL, '2019-07-31', '300,000', 'Lunas'),
('002', NULL, '2019-08-07', '500,000', 'Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id_pinjam` varchar(12) NOT NULL,
  `id_cust` varchar(8) DEFAULT NULL,
  `id_barang` varchar(8) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `jml_pinjam` varchar(9) DEFAULT NULL,
  `lama_angsuran` varchar(2) DEFAULT NULL,
  `jml_angsuran_bunga` varchar(9) DEFAULT NULL,
  `jml_angsuran_pinjam` varchar(9) DEFAULT NULL,
  `total_bunga` varchar(9) DEFAULT NULL,
  `total_pinjaman` varchar(9) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjaman`
--

INSERT INTO `pinjaman` (`id_pinjam`, `id_cust`, `id_barang`, `tgl_pinjam`, `tgl_jatuh_tempo`, `jml_pinjam`, `lama_angsuran`, `jml_angsuran_bunga`, `jml_angsuran_pinjam`, `total_bunga`, `total_pinjaman`, `status`) VALUES
('PJ0001', 'CST0001', 'BRG0004', '2019-06-23', '2019-06-23', '2700000', '8', '10', '200000', '20000', '2700000', 'A'),
('PJ0002', 'CST0002', 'BRG0002', '2019-06-23', '2019-06-23', '5200000', '6', '10', '500000', '50000', '5200000', 'A'),
('PJ0003', 'CST0003', 'BRG0001', '2019-06-23', '2019-06-23', '3500000', '12', '10', '50000', '5000', '3500000', 'L');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`id_angsuran`),
  ADD KEY `FK_angsuran_pinjaman` (`id_pinjam`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cust`);

--
-- Indexes for table `log_history`
--
ALTER TABLE `log_history`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `log_pegadaian`
--
ALTER TABLE `log_pegadaian`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `FK_log_pegadaian_customer` (`id_cust`);

--
-- Indexes for table `pelunasan`
--
ALTER TABLE `pelunasan`
  ADD PRIMARY KEY (`id_lunas`),
  ADD KEY `FK_pelunasan_customer` (`id_cust`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `FK_pinjaman_customer` (`id_cust`),
  ADD KEY `FK_pinjaman_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_history`
--
ALTER TABLE `log_history`
  MODIFY `id_log` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log_pegadaian`
--
ALTER TABLE `log_pegadaian`
  MODIFY `id_log` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `angsuran`
--
ALTER TABLE `angsuran`
  ADD CONSTRAINT `FK_angsuran_pinjaman` FOREIGN KEY (`id_pinjam`) REFERENCES `pinjaman` (`id_pinjam`);

--
-- Ketidakleluasaan untuk tabel `pelunasan`
--
ALTER TABLE `pelunasan`
  ADD CONSTRAINT `FK_pelunasan_customer` FOREIGN KEY (`id_cust`) REFERENCES `customer` (`id_cust`);

--
-- Ketidakleluasaan untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `FK_pinjaman_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `FK_pinjaman_customer` FOREIGN KEY (`id_cust`) REFERENCES `customer` (`id_cust`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
