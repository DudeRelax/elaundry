-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2021 pada 03.22
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `transaksi_id`, `paket_id`, `qty`, `total_harga`, `total_bayar`) VALUES
(1, 1, 4, 2, 40000, 50000),
(2, 2, 3, 1, 15000, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) DEFAULT NULL,
  `alamat_member` text DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `telp_member` varchar(15) DEFAULT NULL,
  `no_ktp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat_member`, `jenis_kelamin`, `telp_member`, `no_ktp`) VALUES
(1, 'dimas', 'pinggir jalan', 'L', '081987654321', '317204'),
(2, 'kevin', 'depan rumah', 'L', '082987654321', '317045');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('Kiloan','Selimut','Bedcover','Kaos','Lainnya') DEFAULT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`) VALUES
(1, 'Kiloan', 'pakaian biasa', 6000),
(2, 'Lainnya', 'boneka', 10000),
(3, 'Selimut', 'yang bikin anget', 15000),
(4, 'Kiloan', 'sukasuka', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_invoice` varchar(100) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `status` enum('Baru','Proses','Selesai','Diambil') DEFAULT NULL,
  `status_bayar` enum('Dibayar','Belum') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_invoice`, `member_id`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `status`, `status_bayar`, `user_id`) VALUES
(1, 'DRY202106152555', 1, '2021-06-15 09:55:32', '2021-06-22 12:00:00', '2021-06-15 09:57:02', 'Selesai', 'Dibayar', 1),
(2, 'DRY202106152457', 2, '2021-06-15 10:57:33', '2021-06-22 12:00:00', '2021-06-15 02:41:38', 'Selesai', 'Dibayar', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  `role` enum('Admin','Kasir') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `role`) VALUES
(1, 'Admin', 'admin', '$2y$10$ja7UGLJpLH.Q3xL.JQwBru3uVGORVqNcpaOS/5SmhM5mz1KUKBDaK', 'Admin'),
(5, 'Panda', 'panda', '$2y$10$CcG7iCOwZrwpicukF7qRMOWTxqWdmArel38JPrHdc6Nrt0tzWK/V6', 'Admin'),
(7, 'Sarul', 'sarul', '$2y$10$104of9S68B/KX3abWE97VOQY3IriTpEOsTy7XAwohJivEWThyYPlW', 'Kasir'),
(8, 'Kasir', 'kasir', '$2y$10$hnBBMKLjENjZYr2fSXxnC.FTsggipWGnEw/Mw4uiq5V3I8c4adJRK', 'Kasir'),
(9, 'Faris', 'faris', '$2y$10$jKabPSzlxhLIdU2MVmoxbed9cynNTM7gshoMW2KsuXwZiZUcpXnEa', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `paket_id` (`paket_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`paket_id`) REFERENCES `paket` (`id_paket`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `member` (`id_member`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
