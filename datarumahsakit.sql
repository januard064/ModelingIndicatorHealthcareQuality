-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2021 at 04:27 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datarumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `hargaobat`
--

CREATE TABLE `hargaobat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(200) NOT NULL,
  `harga_satuan` int(100) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `diagnosis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hargaobat`
--

INSERT INTO `hargaobat` (`id_obat`, `nama_obat`, `harga_satuan`, `satuan`, `diagnosis`) VALUES
(1, 'Ceftazidime', 17880, 'vial', 'Typoid'),
(2, 'IVFD Ringer Laktat', 8580, 'fls', 'Typoid'),
(3, 'Parasetamol 500 gr', 1900, 'strip (10 tablet)', 'Typoid'),
(4, 'Piridoksin(Vit B6 25 mg)', 1540, 'strip (10 tablet)', 'Typoid'),
(5, 'Esomeprazole inj', 41610, 'vial', 'Typoid'),
(6, 'Ringer Laktat', 8580, 'fls', 'DHF'),
(7, 'Ceftazidime 1 Gr', 17880, 'vial', 'DHF'),
(8, 'Ondansetron tablet 4 mg', 11000, 'strip (6 tablet)', 'DHF'),
(9, 'Ranitidin ', 2116, 'ampul', 'DHF'),
(10, 'Parasetamol 500 gr', 1500, 'strip (10 tablet)', 'DHF');

-- --------------------------------------------------------

--
-- Table structure for table `ruanganrawatinap`
--

CREATE TABLE `ruanganrawatinap` (
  `id_ruangan` int(11) NOT NULL,
  `akomodasi_ruangan` varchar(200) NOT NULL,
  `jasa_sarana` int(100) NOT NULL,
  `jasa_pelayanan` int(100) NOT NULL,
  `jumlah` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruanganrawatinap`
--

INSERT INTO `ruanganrawatinap` (`id_ruangan`, `akomodasi_ruangan`, `jasa_sarana`, `jasa_pelayanan`, `jumlah`) VALUES
(1, 'Akomodasi Ruangan Kelas III', 75900, 24100, 100000),
(2, 'Akomodasi Ruangan Kelas II', 150900, 24100, 175000),
(3, 'Akomodasi Ruangan Kelas I', 225900, 24100, 250000),
(4, 'Akomodasi Ruangan VIP', 425900, 24100, 450000),
(5, 'Akomodasi Ruangan ICCU, ICU', 426740, 73260, 500000),
(6, 'Akomodasi Ruangan NICCU', 431250, 68750, 500000),
(7, 'Akomodasi Ruang Isolasi', 344560, 55450, 400000),
(8, 'Akomodasi Perinatologi/NEONATI', 131150, 14580, 150000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hargaobat`
--
ALTER TABLE `hargaobat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `ruanganrawatinap`
--
ALTER TABLE `ruanganrawatinap`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hargaobat`
--
ALTER TABLE `hargaobat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ruanganrawatinap`
--
ALTER TABLE `ruanganrawatinap`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
