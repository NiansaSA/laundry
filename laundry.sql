-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Mar 2020 pada 07.24
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `id_transaksi`, `id_jenis`, `qty`, `subtotal`, `created_at`, `updated_at`) VALUES
(2, 1, 6, 10, 50000, NULL, NULL),
(4, 1, 5, 5, 17500, NULL, NULL),
(11, 8, 7, 6, 27000, NULL, NULL),
(12, 9, 6, 6, 18000, NULL, NULL),
(14, 13, 9, 15, 45000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_cuci`
--

CREATE TABLE `jenis_cuci` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_per_kilo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_cuci`
--

INSERT INTO `jenis_cuci` (`id`, `nama_jenis`, `harga_per_kilo`, `created_at`, `updated_at`) VALUES
(5, 'Setrika', 3500, NULL, NULL),
(6, 'Cuci Kering', 3000, NULL, NULL),
(7, 'Cuci Basah', 4500, NULL, NULL),
(9, 'Cuci', 3000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_01_14_063531_create_users_table', 1),
(2, '2020_01_14_063824_create_password_resets_table', 1),
(3, '2020_02_18_055343_create_petugas_table', 1),
(4, '2020_02_18_055452_create_pelanggan_table', 1),
(5, '2020_02_18_055529_create_jenis_cuci_table', 1),
(6, '2020_02_18_055606_create_transaksi_table', 1),
(7, '2020_02_18_055638_create_detail_transaksi_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES
(1, 'Natasya Adelia Putri', 'Jl. Danau Bratan IV', '1234567890', NULL, NULL),
(3, 'Sania Putri', 'Jl. Danau Laut Tawar 5', '08799922222', NULL, NULL),
(4, 'Diva Anisa', 'Jl. Danau Laut Dalam 5', '089765444555', NULL, NULL),
(5, 'Aulia Rizky', 'Siguragura', '089777111222', NULL, NULL),
(6, 'Heni Satuti', 'Magetan', '089777000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_petugas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','petugas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nama_petugas`, `telp`, `username`, `level`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Kandiya', '085707233444', 'kandiya', 'petugas', '$2y$10$a4Cz0NAP4CTQopoRiiMvR..EH5QoxO0MWPu1dBfCRAhHJ/LiqvJIO', '2020-02-17 23:24:20', '2020-02-17 23:24:20'),
(2, 'Niansa', '085707233111', 'niansa', 'admin', '$2y$10$0/LgDi1O8uYisi9/TQ0SQO3UifbFBrviEyhaZGZZF873IUjEP.rcC', '2020-02-18 07:03:28', '2020-02-18 07:03:28'),
(3, 'Naura', '222333444555', 'naura', 'admin', '$2y$10$n1hTBGSx5ptLKLuh3DM9huESy4UjCvMw.JQc7OTupNbDynWAs8ScO', '2020-02-18 22:49:22', '2020-02-18 22:49:22'),
(4, 'Heni', '222333111111', 'heni', 'admin', '$2y$10$cAdvCpkCh1jv4wQU/pHy0ece3SQrSQqrudSSHcwAuhGC4LFruaGQy', '2020-02-25 23:34:48', '2020-02-25 23:34:48'),
(5, 'Laura', '087999888777', 'laura', 'petugas', '$2y$10$RkOiLcJjUbrK.AFauzOEbuXRAflv/B.IR22CYScZ0E0sUVaeUyYRS', '2020-02-26 06:38:48', '2020-02-26 06:38:48'),
(6, 'Syifa', '087999222222', 'syifa', 'petugas', '$2y$10$711.TBX5Yc7UD6oHP0LAy.qRQMqXpLF0LJgPG9.YbfMPcUfaO7gVe', '2020-02-27 06:34:24', '2020-02-27 06:34:24'),
(7, 'Kiky', '089777111222', 'kiky', 'admin', '$2y$10$FkMCmQ518QLt1MpmxcQeEeQOG14OHodYrgL/LAOmup3PduptWYuY6', '2020-02-27 23:55:39', '2020-02-27 23:55:39'),
(8, 'Rafly', '086777444111', 'rafly', 'admin', '$2y$10$ZPCf0XDly6STIJAucS2qXuWBjETD0Omo7vcHbf60SGMxQjc24qRti', '2020-03-03 23:27:31', '2020-03-03 23:27:31'),
(9, 'Naura', '086777999999', 'naura', 'petugas', '$2y$10$mOBFciRKG01OhXKEk0y9bu6w71JKqOxZcu6ooLnHBkFkPKZbqIqgS', '2020-03-22 23:39:43', '2020-03-22 23:39:43'),
(10, 'Sakti', '086000000000', 'sakti', 'admin', '$2y$10$I6ETPdYqr3HzM0QI7gJZ3OnhAnvbZT5ox5Hkf8s.o3lNZToHcnsLu', '2020-03-22 23:44:28', '2020-03-22 23:44:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pelanggan`, `id_petugas`, `tgl_transaksi`, `tgl_selesai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-01-01', '2020-01-04', NULL, NULL),
(8, 3, 6, '2020-02-02', '2020-02-04', NULL, NULL),
(12, 3, 4, '2020-03-20', '2020-03-21', NULL, NULL),
(13, 6, 10, '2020-04-17', '2020-04-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
