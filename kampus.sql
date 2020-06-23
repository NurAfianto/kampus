-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2020 at 11:00 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `nomor_hp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_dosen`
--

INSERT INTO `tb_dosen` (`nip`, `nama`, `password`, `kelamin`, `alamat`, `nomor_hp`, `email`) VALUES
('P0012', 'Sulis', 'P0012', 'Laki-laki', 'Semarang Jln. Merak 01', '085678823452', 'sulis@gmail.com'),
('P0039', 'Cahya', 'cahya', 'Perempuan', 'Jln Mangga sembilan no. 4 Semarang', '089123123123', 'cahyo@gmail.com'),
('P5555', 'Budi setio', 'P5555', 'Laki-laki', 'Jln Baru 1', '08374586', 'bud@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id_jur` int(11) NOT NULL,
  `nama_jur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id_jur`, `nama_jur`) VALUES
(1, 'Teknik Informatika'),
(2, 'Sistem Komputer'),
(10, 'DKV'),
(11, 'Teknik Elektro');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` varchar(20) NOT NULL,
  `matkul` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `jadwal1` varchar(100) DEFAULT NULL,
  `jadwal2` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `matkul`, `sks`, `nip`, `jadwal1`, `jadwal2`) VALUES
('KAL.4404', 'Kalkulus Lanjut', 4, 'P0039', 'Senin. 07.00 - 08.40', 'Selasa. 07.00 - 08.40'),
('BI.4403', 'Bahasa Indonesia', 2, 'P0039', 'Jumat, 07.00 - 08.40', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mhs`
--

CREATE TABLE `tb_mhs` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tahun_daftar` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `agama` varchar(50) NOT NULL,
  `id_jur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mhs`
--

INSERT INTO `tb_mhs` (`nim`, `nama`, `password`, `status`, `kelamin`, `no_hp`, `email`, `tahun_daftar`, `alamat`, `agama`, `id_jur`) VALUES
('A11.0010', 'Nur Afianto', 'A11.0010', 'Aktif', 'Laki-laki', '0897867xxxxx', 'nu@gmail.com', 2018, 'Semarang Diponegoro no 43 ', 'Islam', 1),
('A11.0012', 'Seng Putra', 'A11.0012', 'Aktif', 'Laki-laki', '081xxxxxxxx', 'sengkoma@gmail.com', 2019, 'Depok 003 baru', 'Islam', 10),
('A11.1212', 'Anto nto', 'A11.1212', 'Aktif', 'Laki-laki', '08782346562', 'anto@gmail.com', 2018, 'Jln Kembang 01', 'Islam', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_kelas` varchar(100) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `nim` varchar(100) NOT NULL,
  `semester` int(11) NOT NULL,
  `n_tugas` int(11) DEFAULT NULL,
  `n_uts` int(11) DEFAULT NULL,
  `n_uas` int(11) DEFAULT NULL,
  `n_a` int(11) DEFAULT NULL,
  `status` enum('Lulus','Gagal') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_nilai`
--

INSERT INTO `tb_nilai` (`id_nilai`, `id_kelas`, `nip`, `nim`, `semester`, `n_tugas`, `n_uts`, `n_uas`, `n_a`, `status`) VALUES
(31, 'KAL.4404', 'P0039', 'A11.0010', 3, 90, 75, 100, 89, 'Lulus'),
(33, 'KAL.4404', 'P0039', 'A11.1212', 3, 60, 90, 80, 77, 'Lulus'),
(34, 'BI.4403', 'P0039', 'A11.1212', 3, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nomor`, `password`, `level`) VALUES
(1, 'admin', 'admin', 1),
(11, 'A11.0010', 'A11.0010', 3),
(12, 'A11.0012', 'A11.0012', 3),
(13, 'P0039', 'cahya', 2),
(20, 'P0012', 'P0012', 2),
(31, 'P5555', 'P5555', 2),
(32, 'A11.1212', 'A11.1212', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id_jur`);

--
-- Indexes for table `tb_mhs`
--
ALTER TABLE `tb_mhs`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id_jur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
