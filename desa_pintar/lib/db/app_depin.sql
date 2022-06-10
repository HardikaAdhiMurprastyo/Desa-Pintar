-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2022 pada 16.07
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_depin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_account`
--

CREATE TABLE `admin_account` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` enum('rt','rw','kelurahan') NOT NULL,
  `rt` int(2) NOT NULL,
  `rw` int(2) NOT NULL,
  `kelurahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_account`
--

INSERT INTO `admin_account` (`id_admin`, `username`, `password`, `status`, `rt`, `rw`, `kelurahan`) VALUES
(1, 'AdminRW', 'admin12345', 'rw', 6, 27, 'aku suka'),
(2, 'AdminRT', 'admin1234', 'rt', 7, 25, 'bojong kulur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat`
--

CREATE TABLE `surat` (
  `id_surat` int(16) NOT NULL,
  `level` int(2) NOT NULL,
  `status` enum('diproses','diterima','ditolak') NOT NULL,
  `NIK` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_izin_berkegiatan`
--

CREATE TABLE `surat_izin_berkegiatan` (
  `nomor_surat` int(16) NOT NULL,
  `id_surat` int(16) NOT NULL,
  `status_pengaju` varchar(25) NOT NULL,
  `tujuan_pengajuan` varchar(100) NOT NULL,
  `tempat` varchar(25) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_skck`
--

CREATE TABLE `surat_skck` (
  `nomor_surat` int(16) NOT NULL,
  `id_surat` int(16) NOT NULL,
  `tujuan_pengajuan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warga_account`
--

CREATE TABLE `warga_account` (
  `NIK` varchar(16) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis_kelamin` enum('wanita','laki-laki') NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `rt` int(2) NOT NULL,
  `rw` int(2) NOT NULL,
  `kelurahan` varchar(25) NOT NULL,
  `tempat_lahir` varchar(25) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `status_perkawinan` enum('sudah kawin','belum kawin') NOT NULL,
  `kewarganegaraan` varchar(25) NOT NULL,
  `agama` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warga_account`
--

INSERT INTO `warga_account` (`NIK`, `password`, `nama`, `jenis_kelamin`, `alamat`, `rt`, `rw`, `kelurahan`, `tempat_lahir`, `tanggal_lahir`, `status_perkawinan`, `kewarganegaraan`, `agama`) VALUES
('1234567890123456', 'user1234', 'User Trial apps', 'laki-laki', 'bumi kita bersama', 7, 25, 'bojong kulur', 'medan', '2000-03-09', 'belum kawin', 'Indonesia', 'Islam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_account`
--
ALTER TABLE `admin_account`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indeks untuk tabel `surat_izin_berkegiatan`
--
ALTER TABLE `surat_izin_berkegiatan`
  ADD PRIMARY KEY (`nomor_surat`),
  ADD KEY `id_surat_surat` (`id_surat`);

--
-- Indeks untuk tabel `surat_skck`
--
ALTER TABLE `surat_skck`
  ADD PRIMARY KEY (`nomor_surat`),
  ADD KEY `id_surat_surat` (`id_surat`);

--
-- Indeks untuk tabel `warga_account`
--
ALTER TABLE `warga_account`
  ADD PRIMARY KEY (`NIK`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_account`
--
ALTER TABLE `admin_account`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `surat_izin_berkegiatan`
--
ALTER TABLE `surat_izin_berkegiatan`
  ADD CONSTRAINT `cnst_idsurat_izin_berkegiatan` FOREIGN KEY (`id_surat`) REFERENCES `surat` (`id_surat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_skck`
--
ALTER TABLE `surat_skck`
  ADD CONSTRAINT `cnst_idsurat` FOREIGN KEY (`id_surat`) REFERENCES `surat` (`id_surat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
