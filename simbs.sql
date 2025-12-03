-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2025 pada 13.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simbs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penulis` varchar(150) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `tanggal_input` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `penulis`, `kategori`, `tahun_terbit`, `tanggal_input`) VALUES
(1, 'Bung Karno: Penyambung Lidah Rakyat', 'Cindy Adams', 'ilmiah', '1965', '2025-11-11'),
(2, 'Api Sejarah', 'Ahmad Mansur S.', 'sejarah', '2009', '2025-11-27'),
(3, 'Laskar Pelangi', 'Andrea Hirata', 'fiksi', '2005', '2025-11-27'),
(4, 'The Hobbit', 'J.R.R Tolkien', 'fiksi', '1930', '2025-11-26'),
(5, 'Thinking, Fast and Slow', 'Daniel Kahneman', 'ilmiah', '2011', '2025-11-26'),
(6, 'Bumi Manusia alien', 'Pramoedya Ananta Toer', 'fiksi', '1980', '2025-11-27'),
(7, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'ilmiah', '2011', '2025-11-27'),
(8, 'Sejarah Dunia yang Disembunyikan', 'Jonathan Black', 'sejarah', '2007', '2025-11-08'),
(9, 'The Lord of the Rings', 'J.R.R. Tolkien', 'fiksi', '1954', '2025-11-27'),
(10, 'Emotional Intelligence', 'Daniel Goleman', 'ilmiah', '1995', '2025-11-27'),
(16, 'indonesa', 'asi', 'sejarah', '1996', '2024-11-29'),
(17, '1984', 'George Orwell', 'fiksi', '1949', '2025-10-12'),
(20, 'kkaka', 'hissa', 'fiksi', '2000', '2024-10-12'),
(26, 'dia yang kucinta', 'me', 'fiksi', '2000', '2026-10-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `tanggal_input` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`, `tanggal_input`) VALUES
(20, 'sejarah', '2025-11-17'),
(30, 'fiksi', '2025-11-20'),
(40, 'ilmiah', '2025-11-19'),
(41, 'horor', '2025-11-11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`) VALUES
(4, 'ase', 'ase@fy', '$2y$10$ujprEhjwWkUJDPvZ8NWlRe3o/5tv.Ynq/krTuEo1Ef1bf1JOjFEFa'),
(5, 'ngelly', 'dew@gmail.com', '$2y$10$xfKTYf.eNp5UypdlYE688uCpU0SRRiRsLs2FyQPKYsiUFD.sWnk9q'),
(6, 'lix', 'm@gail', '$2y$10$FPQM9YT76spwy.1NJl5Sqe5ZGwdjkolGGGdB5Ye4l27VLfTjbhn0m');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
