-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 21, 2024 at 03:20 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spartan`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_kegiatan_pencacah`
--

CREATE TABLE `all_kegiatan_pencacah` (
  `id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `id_pengawas` bigint(20) NOT NULL DEFAULT 0,
  `id_mitra` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_kegiatan_pencacah`
--

INSERT INTO `all_kegiatan_pencacah` (`id`, `kegiatan_id`, `id_pengawas`, `id_mitra`) VALUES
(235, 64, 0, 205),
(236, 64, 0, 204),
(237, 65, 90014, 9),
(238, 65, 90014, 232),
(239, 65, 90014, 104);

-- --------------------------------------------------------

--
-- Table structure for table `all_kegiatan_pengawas`
--

CREATE TABLE `all_kegiatan_pengawas` (
  `id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `id_pengawas` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_kegiatan_pengawas`
--

INSERT INTO `all_kegiatan_pengawas` (`id`, `kegiatan_id`, `id_pengawas`) VALUES
(111, 64, 90015),
(112, 65, 90014);

-- --------------------------------------------------------

--
-- Table structure for table `all_penilaian`
--

CREATE TABLE `all_penilaian` (
  `id` int(11) NOT NULL,
  `all_kegiatan_pencacah_id` int(11) NOT NULL,
  `kriteria_id` int(11) NOT NULL,
  `nilai` int(1) NOT NULL,
  `t_bobot` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_penilaian`
--

INSERT INTO `all_penilaian` (`id`, `all_kegiatan_pencacah_id`, `kriteria_id`, `nilai`, `t_bobot`) VALUES
(541, 236, 1, 5, 0),
(542, 236, 2, 4, 0),
(543, 236, 3, 5, 0),
(544, 236, 4, 5, 0),
(545, 236, 10, 5, 0),
(546, 235, 1, 5, 0),
(547, 235, 2, 5, 0.15666666666667),
(548, 235, 3, 5, 0),
(549, 235, 4, 5, 0),
(550, 235, 10, 5, 0),
(551, 238, 1, 4, 0),
(552, 237, 1, 5, 0),
(553, 238, 2, 4, 0),
(554, 238, 3, 4, 0),
(555, 238, 4, 4, 0),
(556, 238, 10, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `start` varchar(32) NOT NULL,
  `finish` varchar(32) NOT NULL,
  `k_pengawas` int(11) NOT NULL,
  `k_pencacah` int(11) NOT NULL,
  `jenis_kegiatan` int(1) NOT NULL,
  `seksi_id` int(1) NOT NULL DEFAULT 0,
  `ob` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nama`, `start`, `finish`, `k_pengawas`, `k_pencacah`, `jenis_kegiatan`, `seksi_id`, `ob`) VALUES
(64, 'Pengolahan SHK Januari 2024', '1704063600', '1706655600', 1, 2, 1, 0, 0),
(65, 'Survei SNLIK 2024', '1704754800', '1707087600', 1, 3, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kode_kecamatan`
--

CREATE TABLE `kode_kecamatan` (
  `kode` char(3) NOT NULL,
  `nama` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kode_kecamatan`
--

INSERT INTO `kode_kecamatan` (`kode`, `nama`) VALUES
('010', 'KRAYAN SELATAN'),
('011', 'KRAYAN TENGAH'),
('020', 'KRAYAN'),
('021', 'KRAYAN TIMUR'),
('022', 'KRAYAN BARAT'),
('030', 'LUMBIS OGONG'),
('031', 'LUMBIS PANSIANGAN'),
('032', 'LUMBIS HULU'),
('040', 'LUMBIS'),
('050', 'SEMBAKUNG ATULAI'),
('060', 'SEMBAKUNG'),
('070', 'SEBUKU'),
('080', 'TULIN ONSOI'),
('090', 'SEI MENGGARIS'),
('100', 'NUNUKAN'),
('110', 'NUNUKAN SELATAN'),
('120', 'SEBATIK BARAT'),
('130', 'SEBATIK'),
('140', 'SEBATIK TIMUR'),
('150', 'SEBATIK TENGAH'),
('160', 'SEBATIK UTARA');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `prioritas` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `bobot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `prioritas`, `nama`, `bobot`) VALUES
(1, 1, 'Kualitas Isian', 0.45666666666667),
(2, 3, 'Kecepatan', 0.15666666666667),
(3, 2, 'Ketepatan Waktu', 0.25666666666667),
(4, 2, 'Kepatuhan SOP', 0.25666666666667),
(10, 1, 'Perilaku', 0.45666666666667);

-- --------------------------------------------------------

--
-- Table structure for table `mitra`
--

CREATE TABLE `mitra` (
  `id_mitra` int(5) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `posisi` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `kecamatan` char(3) NOT NULL,
  `desa` char(3) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `jk` int(1) NOT NULL,
  `no_hp` varchar(24) NOT NULL,
  `sobat_id` char(12) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mitra`
--

INSERT INTO `mitra` (`id_mitra`, `nik`, `nama`, `posisi`, `email`, `kecamatan`, `desa`, `alamat`, `jk`, `no_hp`, `sobat_id`, `is_active`) VALUES
(1, '6406020302740002', 'Nanok Sugiharto', 'Mitra Pendataan', 'nanoks78@gmail.com', '080', '012', 'Jalan Jalak RT 9', 1, '+62 812-5675-5468', '650422020029', 1),
(2, '6405060610980001', 'TARA SAPUTRA', 'Mitra Pendataan', 'tarasaputra03@gmail.com', '070', '010', 'JL.PANGERAN ANUM RT.001 DESA PEMBELIANGAN', 1, '+62 521-3927-251', '650422020041', 1),
(3, '6405040706930001', 'Rudini, A.P., S.Pd', 'Mitra Pendataan', 'rudini.id12345@gmail.com', '030', '021', 'Jl. Sandakan RT 02 Ds. Samunti Kec. Lumbis Ogong', 1, '+62 082-2558-51348', '650422020030', 1),
(4, '6405156709980001', 'Agustinus', 'Mitra Pendataan', 'Agustinusagustinus32@gmail.com', '030', '016', 'Jalan desa semata kec, Lumbis ogong', 1, '+62 813-4700-6136', '650422020026', 1),
(5, '6405021604940001', 'Narman Prasetya', 'Mitra Pendataan', 'ir.narmanprasetya@gmail.com', '080', '010', 'Jl. Trans kalimantan', 1, '+62 821-5882-7063', '650422020044', 1),
(6, '6405042308940001', 'Musmuliadi', 'Mitra Pendataan', 'musmuliadidi3@gmail.com', '030', '013', 'Desa Long Bulu', 1, '+62 853-3257-3680', '650422020035', 1),
(7, '6405041505960001', 'Arizona, A.P', 'Mitra Pendataan', 'arizonajhona@gmail.com', '032', '002', 'Desa Mamasin, Kec. Lumbis Hulu', 1, '+62 082-1598-18996', '650422020031', 1),
(8, '6405061101880001', 'ROBY TALHA', 'Mitra Pendataan', 'talharoby@gmail.com', '070', '010', 'JL.PANGERAN MUDA Rt.01 Desa Pembeliangan', 1, '+62 822-5142-5363', '650422020028', 1),
(9, '7302012308830003', 'ADI ASMAN', 'Mitra Pendataan', 'nadhifa780@gmail.com', '080', '012', 'JL. POROS MAKMUR, RT. 13, DESA MAKMUR', 1, '+62 822-5108-7075', '650422020048', 1),
(10, '6405042406930004', 'Marsono', 'Mitra Pendataan', 'Marsono.9ubol@gmail.com', '030', '006', 'Jl.karang taruna RT.02 desa Ubol sulok', 1, '+62 085-2470-59219', '650422020036', 1),
(11, '6405150506980001', 'Daniel', 'Mitra Pendataan', 'nellydaniel836@gmail.com', '031', '005', 'Desa Ngawol, Kec. Lumbis Pansiangan', 1, '+62 082-2518-62636', '650422020039', 1),
(12, '6405041808930001', 'Rikoh', 'Mitra Pendataan', 'rikriko483@gmail.com', '031', '002', 'Desa Nantukidan, Kec. Lumbis Pansiangan', 1, '+62 082-2970-99644', '650422020038', 1),
(13, '6405031808860002', 'AGUSRIANSYAH', 'Mitra Pendataan', 'agusr986@gmail.com', '060', '006', 'JL. UJANG KIDA, RT. 10, DESA ATAP', 1, '082353490385', '650422020033', 1),
(14, '6405031306820001', 'SENIMAN', 'Mitra Pendataan', 'senimanbasir@gmail.com', '060', '006', 'JL. ADJI BHAKTI, RT. 04, DESA ATAP', 1, '081349643954', '650422020034', 1),
(15, '6405041504930001', 'Sulaiki', 'Mitra Pendataan', 'sulaikinuriafio@gmail.com', '032', '004', 'Desa Tau Lumbis, Kec. Lumbis Hulu', 1, '+62 082-2562-54125', '650422020032', 1),
(16, '6405026909830003', 'SUSANA ODI', 'Mitra Pendataan', 'nanasalyn@gmail.com', '100', '001', 'JL. PEMBANGUNAN, RT. 09, KEL. NUNUKAN BARAT', 2, '+62 813-4636-4836', '650422100232', 1),
(17, '7601020802940001', 'Yusri', 'Mitra Pendataan', 'yusrimuhammad154@gmail.com', '100', '005', 'Jl pasar baru RT 007 No.29', 1, '+62 082-3490-32502', '650423110038', 1),
(18, '6405010706900002', 'SUDIRMAN', 'Mitra Pendataan', 'sudirmansp09@gmail.com', '140', '001', 'JL. BHAKTI HUSADA, RT. 02, DESA SUNGAI NYAMUK', 1, '+62 812-5432-3637', '650422020001', 1),
(19, '6405012002980001', 'Akmal Ulil Kahfi', 'Mitra Pendataan', 'akmalkahfi20@gmail.com', '130', '001', 'Jl. H. Kambolong RT 2 Desa Balansiku', 1, '+62 812-5565-5787', '650422020006', 1),
(20, '6405012606920002', 'HERWANSYAH', 'Mitra Pendataan', 'attunktor@gmail.com', '130', '001', 'JL. H. KAMBOLONG, RT. 02, DESA BALANSIKU', 1, '085251195341', '650422020016', 1),
(21, '6405091006870001', 'BUDIARTO', 'Mitra Pendataan', 'arto.budy@gmail.com', '110', '003', 'JL.UJANG DEWA RT.01 KEL. NUNUKAN SELATAN', 1, '+62 081-3467-58899', '650422020004', 1),
(22, '6405020309900007', 'Abdurrahman', 'Mitra Pendataan', 'rachmanez08@gmail.com', '100', '005', 'Jalan radio RT.02 KNU', 1, '+62 812-5580-6908', '650422020003', 1),
(23, '7315120411920001', 'Mubdi Hatta', 'Mitra Pendataan', 'mubdihatta492@gmail.com', '110', '003', 'Jalan Ujang Dewa Rt. 001 Rw. 001', 1, '+62 812-5371-0628', '650422020013', 1),
(24, '6405024109880001', 'LIYANTI', 'Mitra Pendataan', 'Jhiechink@gmail.com', '100', '004', 'Nunukan', 2, '+62 813-5079-0907', '650422050006', 1),
(25, '6405025701820002', 'NURENI GANI', 'Mitra Pendataan', 'nurenigani94@gmail.com', '100', '005', 'JL. HASANUDDIN, RT. 09', 2, '082153024989', '650422050007', 1),
(26, '6405063004930001', 'Suhardi siregar', 'Mitra Pendataan', 'suhardisiregar22@gmail.com', '070', '010', 'Jl.pendidikan RT.03 desa pembeliangan', 1, '+62 822-5258-4239', '650422050013', 1),
(27, '6405014501950002', 'Sam Nirwana', 'Mitra Pendataan', 'wanacillank634@gmail.com', '130', '003', 'Jl Jend Sudirman', 2, '+62 081-2509-55090', '650422050008', 1),
(28, '6405092506840002', 'RISLAM', 'Mitra Pendataan', 'rislamopo@gmail.com', '110', '003', 'JL. UJANG DEWA RT.02 KEL. NUNUKAN SELATAN', 1, '+62 085-2466-91212', '650422100099', 1),
(29, '6405020206820003', 'RIDUWAN', 'Mitra Pendataan', 'ridhowannazril82@gmail.com', '100', '004', 'Jl.pesantren RT.08', 1, '+62 081-2538-04151', '650422050022', 1),
(30, '6405032509880005', 'SAPARUDIN', 'Mitra Pendataan', 'saparudinfhay@gmail.com', '060', '008', 'JL. DESA TAGUL, RT. 02, DESA TAGUL', 1, '+62 081-2506-66136', '650422050011', 1),
(31, '6405060104950002', 'ILHAM', 'Mitra Pendataan', 'ilhamygnda@gmail.com', '070', '009', 'JL.ANGGREK RT.08 DESA HARAPAN', 1, '6282255679727', '650422100187', 1),
(32, '6405020505910001', 'Syamsul Alan', 'Mitra Pendataan', 'syamsullallan@gmail.com', '100', '001', 'Jalan pembangunan RT.09 KNB', 1, '+62 822-8494-9498', '650422020002', 1),
(33, '6405081509830001', 'Alwi', 'Mitra Pendataan', 'allways9096@gmail.com', '130', '002', 'Jl. Lujoh', 1, '+62 813-4787-9096', '650422020010', 1),
(34, '6405082411880001', 'Kamaluddin', 'Mitra Pendataan', 'kamaluddin.mufc@gmail.com', '150', '003', 'Jl. Pasar Kamis, Rt.02', 1, '+62 822-5135-8591', '650422020009', 1),
(35, '6405026606840004', 'Sariyana', 'Mitra Pendataan', 'sariyanafauzanasfa@gmail.com', '070', '010', 'Jl. Padat Karya RT 01', 2, '+62 085-3919-39231', '650422100194', 1),
(36, '7315095605890005', 'Basiah', 'Mitra Pendataan', 'basiah.cia@gmail.com', '110', '004', 'Jl. Wana Wisata', 2, '+62 895-3066-4666', '650422050030', 1),
(37, '7312042110910002', 'Kaharuddin', 'Mitra Pendataan', 'kaharuddin078@yahoo.com', '100', '004', 'Jalan Pasar Baru RT. 004 Nunukan Timur', 1, '+62 812-4226-6469', '650422100257', 1),
(38, '7371046106890003', 'SURIYANTI', 'Mitra Pendataan', 'lolyanthy5@gmail.com', '160', '002', 'JL.AHMAD YANI RT.06', 2, '+62 812-5527-7077', '650422100058', 1),
(39, '6405024404780005', 'SULIANI', 'Mitra Pendataan', 'suliani4477@gmail.com', '090', '001', 'JL. KTM, RT. 13, DESA TABUR LESTARI', 2, '+62 085-3474-45743', '650422050035', 1),
(40, '6405020510790008', 'SYAFRUDDIN', 'Mitra Pendataan', 'Omfudin12@gmail.com', '090', '001', 'Jl. Dewi Sartika rt 06', 1, '+62 813-3105-8646', '650422050045', 1),
(41, '6405084103850003', 'Fitriyani', 'Mitra Pendataan', 'fitry0103@gmail.com', '150', '003', 'Dusun Abadi RT 009 RW 002', 2, '+62 812-5489-3779', '650422100060', 1),
(42, '6405086808880001', 'Staurina', 'Mitra Pendataan', 'Inhastaurina@gmail.com', '150', '003', 'Jln.Pasar Kamis RT 02 Desa Aji Kuning', 2, '+62 821-5456-2217', '650422100061', 1),
(43, '7308175809930003', 'NORDIANAH CHIKITA', 'Mitra Pendataan', 'chikitanordianah@gmail.com', '140', '001', 'JL. BHAKTI HUSADA, RT. 02, DESA SUNGAI NYAMUK', 2, '+62 821-9723-6823', '650422050025', 1),
(44, '6405014702910001', 'Mariyana', 'Mitra Pendataan', 'anamariyana0702@gmail.com', '160', '002', 'Jl. Kuburan lama RT 10', 2, '+62 853-9101-6464', '650422100082', 1),
(45, '6405024605730003', 'NURWATI', 'Mitra Pendataan', 'Wnur28831@gmail.com', '090', '001', 'Jl.p.Diponegoro', 2, '+62 813-5099-9822', '650422050033', 1),
(46, '6405086506900003', 'hapsah', 'Mitra Pendataan', 'yusufj993@gmail.com', '160', '002', 'jl. Hasanuddin RT 11', 2, '+62 812-5807-5537', '650422050042', 1),
(47, '6405025401790002', 'Hasmiyati', 'Mitra Pendataan', 'hasmiyatinnk@yahoo.co.id', '100', '003', 'Jl. RA. Kartini Rt. 05 Kel. Nunukan Tengah', 2, '+62 852-4718-6575', '650422050037', 1),
(48, '6405021009740002', 'ABDUL MUIS', 'Mitra Pendataan', 'moeis1974@gmail.com', '100', '003', 'Jl RA KARTINI RT05 kelurahan nunukan tengah', 1, '+62 134-7376-592', '650422050027', 1),
(49, '6405087011920001', 'Maidah', 'Mitra Pendataan', 'Eidhasebatik@gmail.com', '120', '003', 'Jl. Wisata rt. 04 desa binalawan', 2, '+62 813-4545-2558', '650422050043', 1),
(50, '6405082209900001', 'Naufal Fitriyansyah', 'Mitra Pendataan', 'fy.naufal@gmail.com', '120', '003', 'Jalan Fatimah Timo', 1, '+62 853-4699-9269', '650422050039', 1),
(51, '6405025105900001', 'ADE SELVIYANA', 'Mitra Pendataan', 'adheselviyana90@gmail.com', '100', '003', 'Nunukan', 2, '+62 812-5366-7229', '650422100229', 1),
(52, '6405025303920002', 'WIDYASTUTI', 'Mitra Pendataan', 'thutypj13@gmail.com', '100', '001', 'JL. PEMBANGUNAN, RT. 10, KEL. NUNUKAN BARAT', 2, '+62 081-2441-87188', '650422050048', 1),
(53, '7308085503900001', 'MIRNAWATI', 'Mitra Pendataan', 'mirnawatiskb@gmail.com', '100', '004', 'RT.10,KEC.NUNUKAN,DESA NUNUKAN TIMUR', 2, '+62 083-7595-1878', '650422100036', 1),
(54, '6405022703050002', 'MASRIAH', 'Mitra Pendataan', 'masriahfadli@gmail.com', '100', '005', 'RT.07,KEC.NUNUKAN,DESA NUNUKAN UTARA', 2, '+62 822-5018-1857', '650422100037', 1),
(55, '6405025305760001', 'NURMADIAH', 'Mitra Pendataan', 'Nurmadiahnurmadiah23@regsosek.com', '100', '003', 'JL.KH.AGUS SALIM-KP.JAWA RT.005', 2, '+62 852-4660-0813', '650422100039', 1),
(56, '6405020510900005', 'ENDRAWATI', 'Mitra Pendataan', 'endraikrar3@gmail.com', '100', '004', 'Nunukan', 2, '+62 811-5387-572', '650423020001', 1),
(57, '6405015302950002', 'SUSIANA', 'Mitra Pendataan', 'susiana@regsosek.com', '160', '002', 'JL. USMAN HARLIN SEI. PANJANG SEBATIK UTARA, RT.001', 2, '+62 822-5510-0339', '650422100075', 1),
(58, '6405011711940001', 'AKHMAD AKBAR', 'Mitra Pendataan', 'akbarkaltara@gmail.com', '160', '001', 'JL. ABIDIN HS. RT.06 DESA LAPRI, KEC. SEBATIK UTARA', 1, '+62 821-5302-7689', '650422100081', 1),
(59, '6405016605870001', 'Nurmila', 'Mitra Pendataan', 'nurmila@regsosek.com', '140', '004', 'JL. DIPONEGORO, RT. 016, DESA TANJUNG ARU, SEBATIK TIMUR', 2, '081255619273', '650422100085', 1),
(60, '6405095711940001', 'JAMNIYAH', 'Mitra Pendataan', 'nhiajidin@gmail.com', '110', '003', 'JL. UJANG DEWA RT.008 RW.002 KEL. NUNUKAN SELATAN', 2, '+62 812-5054-1384', '650422100087', 1),
(61, '6405095106930002', 'Mardiana', 'Mitra Pendataan', 'mardianadhi872@gmail.com', '110', '003', 'Jalan Ujang Dewa RT 10 Sedadap', 2, '+62 853-4716-3890', '650422100092', 1),
(62, '7324076505830002', 'NURHAEDA.S.PD.', 'Mitra Pendataan', 'nurhaedah8391@gmail.com', '110', '003', 'RT.005,JL.UJANG DEWA', 2, '+62 821-5709-8365', '650422100097', 1),
(63, '6405041602920001', 'PAULUS', 'Mitra Pendataan', 'uspaul808@gmail.com', '040', '018', 'RT. 02, DESA SAPUYAN', 1, '+62 082-3523-00521', '650422100139', 1),
(64, '6405040312900001', 'KORDI', 'Mitra Pendataan', 'kordi@bpsnunukan.com', '040', '024', 'DESA Pulu Bulawan', 1, '+62 085-7525-16771', '650422100141', 1),
(65, '6405032805850001', 'SUPARJAN', 'Mitra Pendataan', 'suparjan@bpsnunukan.com', '050', '003', 'RT. 03, DESA PULAU KERAS', 2, '082152288459', '650422100143', 1),
(66, '6405042001930001', 'YUSTEN', 'Mitra Pendataan', 'yusten@bpsnunukan.com', '050', '003', 'RT. 02, DESA PULAU KERAS', 1, '082152689593', '650422100144', 1),
(67, '6405032507010001', 'FENDI', 'Mitra Pendataan', 'fendi@bpsnunukan.com', '050', '005', 'RT. 01, DESA TULANG', 1, '082252711608', '650422100145', 1),
(68, '6405031012780002', 'SOPIAN', 'Mitra Pendataan', 'yakalis78@gmail.com', '050', '005', 'RT. 01, DESA TULANG', 1, '085247919390', '650422100147', 1),
(69, '6405034211890001', 'RINI SARTIKA', 'Mitra Pendataan', 'tika05061@gmail.com', '060', '005', 'JL. SEI TELAPAS, RT. 02, DESA MANUK BUNGKUL', 2, '+62 835-0417-987', '650422100154', 1),
(70, '6405035007930001', 'ERLI MARLINAH', 'Mitra Pendataan', 'erlimarlinah4@gmail.com', '060', '006', 'JL. ADJI BHAKTI, RT. 05, DESA ATAP', 2, '+62 822-5074-9447', '650422100155', 1),
(71, '6405035402000001', 'RUSDIANA', 'Mitra Pendataan', 'dianatimpok@gmail.com', '060', '006', 'JL. BHAYANGKARA, RT. 10, DESA ATAP', 2, '+62 822-5006-3314', '650422100157', 1),
(72, '6405036905020001', 'MAILIKA INDAH LESTARI', 'Mitra Pendataan', 'meilikaindahlestari@gmail.com', '060', '008', 'JL. DESA TAGUL, RT. 01, DESA TAGUL', 2, '082251520135', '650422100158', 1),
(73, '6405061012930001', 'ANDI SUPRIADI', 'Mitra Pendataan', 'andisupriadi@bpsnunukan.com', '080', '012', 'JL. BANGAU, RT. 11, DESA MAKMUR', 1, '+62 853-8687-1076', '650422100163', 1),
(74, '6406025308800001', 'HISMAWATI', 'Mitra Pendataan', 'hismawati@bpsnunukan.com', '080', '012', 'JL. JALAK, RT. 09, DESA MAKMUR', 2, '+62 821-5507-1163', '650422100169', 1),
(75, '6405061801990001', 'MUHAMMAD NURAIRIL SYAH', 'Mitra Pendataan', 'airiltelis62@gmail.com', '080', '012', 'JL. MAKMUR, RT. 17, DESA MAKMUR', 1, '+62 822-1350-4641', '650422100170', 1),
(76, '6403035212010003', 'RABIYATUR RODIYAH', 'Mitra Pendataan', 'rabiyaturrodiyah@bpsnunukan.com', '080', '012', 'JL. GELATIK, RT. 04, DESA MAKMUR', 2, '+62 081-3484-16303', '650422100173', 1),
(77, '6405062709000001', 'ROBERT ALPIUS TONTA', 'Mitra Pendataan', 'robertalviust@gmail.com', '080', '004', 'JL. TIBOBONG, RT. 02, DESA TINAMPAK II', 1, '+62 082-1990-7192', '650422100174', 1),
(78, '7302015707790003', 'Rosmiati', 'Mitra Pendataan', 'rosmiati@bpsnunukan.com', '080', '012', 'JL. BANGAU, RT. 11, DESA MAKMUR', 2, '+62 081-3556-58364', '650422100175', 1),
(79, '6405060612940001', 'SAMSON EKO', 'Mitra Pendataan', 'samsoneko@bpsnunukan.com', '080', '002', 'JL. DAMAI, RT. 02, DESA NAPUTI', 1, '082153274100', '650422100176', 1),
(80, '6405060303910001', 'SEBASTIAN SUNSIANGAN', 'Mitra Pendataan', 'sebastiansunsungan@gmail.com', '080', '009', 'JL. PEMDA, RT. 01, DESA SEKIKILAN', 1, '081352983303', '650422100177', 1),
(81, '7302014507850003', 'SUHAETI', 'Mitra Pendataan', 'ethyjhe@gmail.com', '080', '012', 'JL. POROS MAKMUR, RT. 13, DESA MAKMUR', 2, '+62 081-2500-35311', '650422100178', 1),
(82, '6405060708920001', 'YAHUDA', 'Mitra Pendataan', 'yahudayudha7892@gmail.com', '080', '006', 'JL. PEMDA, RT. 02, DESA SALANG', 1, '082258432128', '650422100179', 1),
(83, '6473025603030004', 'ANNA', 'Mitra Pendataan', 'aneeiya16@gmail.com', '070', '010', 'DESA PEMBELIANGAN RT.001 JL.PANGERAN MUDA', 2, '+62 821-5417-1238', '650422100182', 1),
(84, '6405061206810002', 'BAKRI', 'Mitra Pendataan', 'bakri81@bpsnunukan.com', '070', '010', 'SUNGAI MERAH.RAHAYU SEBAKIS.RT.07', 1, '6282149641366', '650422100183', 1),
(85, '6405061806940001', 'BOBY HENDRIANTO', 'Mitra Pendataan', 'boby.h@bpsnunukan.com', '070', '010', 'JL.TEPIAN PEMBELIANGAN RT.01', 1, '6281244745997', '650422100184', 1),
(86, '6405060312910002', 'DAMSIL', 'Mitra Pendataan', 'damseker@gmail.com', '070', '002', 'JL. DESA LULU, RT. 01 DESA LULU', 1, '+62 085-3920-64396', '650422100185', 1),
(87, '6405062206850001', 'IWAN DARMAWAN', 'Mitra Pendataan', 'darmawanr46i@gmail.com', '070', '010', 'RT.003 DESA PEMBELIANGAN KEC SUBUKU KAB NUNUKAN', 1, '081320050672', '650422100188', 1),
(88, '6405046410920001', 'RINAWATI', 'Mitra Pendataan', 'rvania540@gmail.com', '070', '006', 'DESA KUNYIT,KEC.SEBUKU,RT.02', 2, '+62 282-2516-28006', '650422100190', 1),
(89, '6405060904760001', 'SABDI', 'Mitra Pendataan', 'sabdi76@bpsnunukan.com', '070', '005', 'DESA TETABAN KEC SEBUKU RT 002', 1, '+62 822-2891-2876', '650422100192', 1),
(90, '6405060701810002', 'SUDIRMAN', 'Mitra Pendataan', 'sudysebuku8@gmail.com', '070', '010', 'JL.KALAS,RT04 DESA,PEMBELIANGAN', 1, '6282237716244', '650422100195', 1),
(91, '6405065210850003', 'SURIANI', 'Mitra Pendataan', 'suriani85@bpsnunukan.com', '070', '010', 'JL.SRI SUMBAL IDABUS', 2, '+62 082-1578-53435', '650422100196', 1),
(92, '6405025203970003', 'SYARIFAH MAYVIANNA', 'Mitra Pendataan', 'syarifahfaws@gmail.com', '070', '009', 'JL.RESKY RT.03 DESA HARAPAN', 2, '+62 813-1185-8551', '650422100197', 1),
(93, '6405061503920001', 'YEFTA BARTO', 'Mitra Pendataan', 'yeftabarto@gmail.com', '070', '002', 'DESA LULU KEC.SEBUKU', 1, '+62 085-3463-3301', '650422100199', 1),
(94, '6405025103880004', 'ENDANG IRAWANTI', 'Mitra Pendataan', 'endangirawanti@gmail.com', '090', '003', 'JL. TERATAI, RT. 11, DESA SRI NANTI', 2, '082255283456', '650422100203', 1),
(95, '6405016908900001', 'HERLINA', 'Mitra Pendataan', 'herlina124@gmail.com', '090', '004', 'JL. KANDUANGAN, RT. 04, DESA SEKADUYAN TAKA', 2, '085347668658', '650422100205', 1),
(96, '6405027110930001', 'MERY ROSCELYN TIMU', 'Mitra Pendataan', 'merry.roscelyntimu@gmail.com', '090', '003', 'JL. KARTINI NO.61, RT. 06, DESA SRI NANTI', 2, '+62 082-4396-5937', '650422100209', 1),
(97, '6405012311960002', 'MUHAMMAD RIDZWAN', 'Mitra Pendataan', 'ridzwanmuhammad64@gmail.com', '090', '002', 'RT. 05, DESA SAMAENRE SEMAJA', 1, '+62 812-3628-1077', '650422100211', 1),
(98, '6405024408920002', 'AGUSTINA WOKAL', 'Mitra Pendataan', 'agustina_wokal@gmail.com', '090', '003', 'JL. SEI MENGGARIS, RT. 04, DESA SRI NANTI', 2, '+62 081-2536-28144', '650422100214', 1),
(99, '6405025708790005', 'NURDIANTI', 'Mitra Pendataan', 'nurdianti@gmail.com', '100', '001', 'JL. JAMAKER, RT. 026, KEL. NUNUKAN BARAT', 2, '+62 852-4768-8070', '650422100225', 1),
(100, '6405051102960001', 'Daniel Haryanto', 'Mitra Pendataan', 'Daniel@splf.com', '020', '025', 'Long Katung, RT 03', 1, '085246397173', '650422050052', 1),
(101, '6405074804970001', 'Desi Sorlenda', 'Mitra Pendataan', 'desisorlenda88seludi@gmail.com', '011', '006', 'Desa long mutan rt 001 krayan tengah', 2, '082297619221', '650422050054', 1),
(102, '6405052604790001', 'Jafrison', 'Mitra Pendataan', 'Jafrison706@gmail.com', '022', '017', 'Pa\' Payak, RT 001 Krabar', 1, '082251169542', '650422050060', 1),
(103, '9999999999999952', 'Dewi Sartini', 'Mitra Pendataan', 'dewisartini@splf.com', '130', '002', 'Sebatik', 2, '+62 082-2528-49366', '650422050110', 1),
(104, '9202121001840001', 'ILIAS', 'Mitra Pendataan', 'ilyasdoankbro@gmail.com', '100', '003', 'Jalan P. Antasari Rt. 014', 1, '+62 896-9262-8700', '650422060003', 1),
(105, '6405052306960001', 'EBBY CHAN', 'Mitra Pendataan', 'ebbychan23@gmail.com', '022', '009', 'LEMBUDUD RT 002 DESA LONG TUGUL', 1, '085347360256', '650422100045', 1),
(106, '6406081410800001', 'LIWID', 'Mitra Pendataan', 'liwidtuan@gmail.com', '022', '003', 'JL. KURID RT 001 DESA LONG MANGAN', 1, '082255466687', '650422100046', 1),
(107, '6405051202800002', 'JHOSRI', 'Mitra Pendataan', 'jhosri54@gmail.com', '022', '009', 'DESA LONG TUGUL RT 001', 1, '081346296701', '650422100047', 1),
(108, '6405052312910002', 'ARDIAN SUPRIADI', 'Mitra Pendataan', 'aboardian91@gmail.com', '022', '017', 'DESA PA\' PAYAK RT 001', 1, '082250727571', '650422100048', 1),
(109, '6405090104020001', 'MUH.IMRAN', 'Mitra Pendataan', 'Muhamadimran1422@gmail.com', '110', '003', 'RT.06,RW.02,JL.RA.KARTINI', 1, '082243719716', '650422100111', 1),
(110, '6405092809790001', 'IRVAN BAKRI', 'Mitra Pendataan', 'irvanmech@gmail.com', '110', '003', 'KEL.NUNUKAN SELATAN,KEC.NUNUKAN SELATAN', 1, '+62 822-5504-0400', '650422100112', 1),
(111, '6405094703950001', 'RAMATIA', 'Mitra Pendataan', 'dsatu9143@gmail.com', '110', '002', 'JL. PANAMAS RT.003 RW.001 KELURAHAN MANSAPA KEC. NUNUKAN SELATAN', 2, '+62 822-5128-0495', '650422100113', 1),
(112, '6405041511940002', 'NOPLI ADRIANUS, S,S', 'Mitra Pendataan', 'nopliadrianus1994@gmail.com', '032', '004', 'JL. MUNTAI SUKILAM, RT. 01, DESA TAU LUMBIS', 1, '082154773275', '650422100129', 1),
(113, '6405042506930001', 'LENTERI, S. SOS', 'Mitra Pendataan', 'lenteri@bpsnunukan.com', '032', '010', 'DESA LEPAGA', 1, '085389734446', '650422100130', 1),
(114, '6405041006920002', 'ALUS', 'Mitra Pendataan', 'alus@bpsnunukan.com', '031', '012', 'DESA TAMBALANG HULU', 1, '+62 853-8787-9668', '650422100132', 1),
(115, '6405021311800004', 'Karolus', 'Mitra Pendataan', 'korensurveybps@gmail.com', '100', '003', 'Jl. Sutanto RT 08 Nunukan Tengah', 1, '+62 852-5078-9123', '650423110001', 1),
(116, '6405051112870003', 'Aprem', 'Mitra Pendataan', 'apremacang9034@gmail.com', '020', '040', 'Buduk Kinangan RT 001, Krayan', 1, '081354531960', '650422100001', 1),
(117, '6474011010870015', 'Romio Chandra', 'Mitra Pendataan', 'vincentromeo.chan@gmail.com', '020', '011', 'Jl. Cinglat RT 001, Cinglat', 1, '081328599709', '650422100005', 1),
(118, '6409016701910009', 'Hanasiah', 'Mitra Pendataan', 'hanasiah45@gmail.com', '130', '002', 'JL. LUJOH, RT. 03, DESA TANJUNG KARANG', 2, '+62 852-4717-2148', '650422100306', 1),
(119, '6405012411910001', 'SUHELMI', 'Mitra Pendataan', 'suhelmi@bpsnunukan.com', '130', '004', 'JL. MUTIARA BANGSA, RT. 02, DESA PADAIDI', 1, '+62 852-4606-1830', '650422100307', 1),
(120, '6405064201820004', 'Sarimah', 'Mitra Pendataan', 'sarimahnena5@gmail.com', '070', '010', 'Jl.pangeran muda', 2, '+62 853-4521-7991', '650423050003', 1),
(121, '7308224810980002', 'Hasrina', 'Mitra Pendataan', 'rinaadiman017@gmail.com', '070', '010', 'Jl rahayu', 2, '+62 085-2989-92206', '650423030006', 1),
(122, '6471015008910001', 'Chandra Anita Simarmata', 'Mitra Pendataan', 'simarmaanitachandra@gmail.com', '150', '002', 'Jl.mulawarman Rt 01 desa maspul', 2, '+62 813-5020-4991', '650423030007', 1),
(123, '6405063007000001', 'Muhammad Seini Husni', 'Mitra Pendataan', 'zm6675076@gmail.com', '080', '012', 'Jl.Bangau Il RT/RW. 011/000', 1, '+62 822-1990-7181', '650423030008', 1),
(124, '6405691706950003', 'Muhammad Risal', 'Mitra Pendataan', 'Risalmrh@gmail.com', '090', '002', 'Samenre Semaja', 1, '+62 221-4819-951', '650423030009', 1),
(125, '7311066008520001', 'Bungadiah', 'Mitra Pendataan', 'deachdeachd@gmail.com', '090', '001', 'Jl.ph3', 2, '+62 081-2505-53075', '650423030013', 1),
(126, '6405096307820001', 'Dewi Sartika', 'Mitra Pendataan', 'dewimarman82@gmail.com', '110', '001', 'Jl. Yos Sudarso RT 003 RW 001', 2, '+62 852-5144-6423', '650423030012', 1),
(127, '6405040711930001', 'kristiadi', 'Mitra Pendataan', 'kristiadia20@gmail.com', '040', '014', 'desa tanjung hilir rt 02', 1, '+62 021-5322-0844', '650423030015', 1),
(128, '6405034104040001', 'Ana Ratna Sari', 'Mitra Pendataan', 'anaratnasari127@gmail.com', '060', '010', 'TEPIAN', 2, '+62 821-4885-1309', '650423030014', 1),
(129, '6405040203930002', 'edianto', 'Mitra Pendataan', 'antoedi822@gmail.com', '040', '014', 'Desa Tanjung Hilir', 1, '+62 821-5122-5973', '650423030017', 1),
(130, '6405012501940001', 'Anas', 'Mitra Pendataan', 'anaslabatta@gmail.com', '130', '004', 'Jl. Jend Sudirman RT 03', 1, '+62 813-4714-8671', '650423050002', 1),
(131, '6405041007910001', 'Paulus Lumbis', 'Mitra Pendataan', 'pauluslumbis10@gmail.com', '031', '005', 'RT 2', 1, '+62 081-2536-07217', '650423030020', 1),
(132, '6405071512950002', 'Jeri Mexsen', 'Mitra Pendataan', 'mexsenjeri30@gmail.com', '011', '008', 'RT 001 Desa Long Padi, Krayan Tengah', 1, '+62 813-5222-7006', '650423030022', 1),
(133, '6405041109020001', 'Neki', 'Mitra Pendataan', 'nekiganyang@gmail.com', '040', '015', 'Desa Tanjung Hulu', 1, '+62 082-2913-10040', '650423040001', 1),
(134, '6405024904810004', 'Sudarmi', 'Mitra Pendataan', 'sudarmiusman81@gmail.com', '100', '004', 'Jalan Borneo 2 RT 009', 2, '+62 852-5088-9978', '650423080009', 1),
(135, '6405031504880002', 'Jikson', 'Mitra Pendataan', 'jikson391@gmail.com', '040', '004', 'RT. 02', 1, '081351843934', '650423020008', 1),
(136, '6405014206760001', 'RISMAWATI', 'Mitra Pendataan', 'rismabwla508@gmail.com', '140', '003', 'RT 07', 2, '+62 852-4853-5889', '650422100023', 1),
(137, '6405074106960001', 'MICHELLE', 'Mitra Pendataan', 'michelle@regsosek.com', '010', '007', 'RT.001,KEC.KRAYAN SELATAN,DESA PA SING', 2, '085393556307', '650422100029', 1),
(138, '6405021003990004', 'FIDELIS PETRUS', 'Mitra Pendataan', 'Fidelispetrus13@regsosek.com', '100', '001', 'RT.031,KEC.NUNUKAN,DESA NUNUKAN BARAT', 1, '+62 081-3454-05321', '650422100032', 1),
(139, '6405084601930001', 'Mustika', 'Mitra Pendataan', 'mustikatika400@gmail.com', '120', '004', 'Jl. Imam Amin Rt 004', 2, '+62 082-2565-38721', '650423030005', 1),
(140, '6405052111940001', 'Palung Solaiman', 'Mitra Pendataan', 'palunglundayeh749@gmail.com', '020', '058', 'RT 001', 1, '+62 812-5667-0249', '650423070001', 1),
(141, '6405026108030001', 'Nurul', 'Mitra Pendataan', 'nurull01uu@gmail.com', '100', '003', 'Jl. Pesantren', 2, '+62 895-3076-4040', '650423080010', 1),
(142, '6503153112911001', 'Leri', 'Mitra Pendataan', 'lerileri221@yahoo.com', '050', '005', 'Jalan desa tulang', 1, '+62 853-4971-8725_', '650423080001', 1),
(143, '6405026611920006', 'HASLINDA', 'Mitra Pendataan', 'lindha2692@gmail.com', '100', '003', 'Jl. Teuku Umar Rt. 012 Rw. 00', 2, '+62 822-5157-2865', '650423080004', 1),
(144, '6405024208950005', 'Nurul Shafiqa Rahmania', 'Mitra Pendataan', 'nushafiqarah@gmail.com', '100', '004', 'Jln. H. Daeng Toba', 2, '+62 813-5051-7271', '650423080005', 1),
(145, '6405092011050001', 'Andi Fairul Amri', 'Mitra Pendataan', 'andifairulamri@gmail.com', '110', '001', 'Jalan Dewi Sartika RT.08 RW.02', 1, '+62 822-5346-0919', '650423080003', 1),
(146, '6405086404990001', 'Santi', 'Mitra Pendataan', 'Santifpik17@gmail.com', '120', '004', 'Jl. Tembaring RT 12', 2, '+62 822-5514-9306', '650423080006', 1),
(147, '6405094307930001', 'Julela', 'Mitra Pendataan', 'juleladudu@gmail.com', '110', '002', 'Jalan kristianto, Rt 06 kelurahan mansapa', 2, '+62 852-4633-6067', '650423080007', 1),
(148, '6405024302030003', 'Riska Ananda', 'Mitra Pendataan', 'riskacute582@gmail.com', '100', '003', 'Jl. Teuku Umar, RT. 022', 2, '+62 853-4814-6469', '650423080013', 1),
(149, '7314055008040002', 'Hasma', 'Mitra Pendataan', 'hasmahakim.nurmia@gmail.com', '110', '004', 'Jl. Imam Bonjol RT.015 RW.003', 2, '+62 082-1545-37209', '650423090006', 1),
(150, '6405094408920002', 'Mira', 'Mitra Pendataan', 'mirarhara4893@gmail.com', '110', '002', 'Jl.Panamas RT03 RW01', 2, '+62 812-5478-9475', '650423090003', 1),
(151, '6405092903940001', 'Muhammad Syawaludin', 'Mitra Pendataan', 'riskaandsyawalyes77@gmail.com', '110', '004', 'Jl.Imam Bonjol', 1, '+62 813-1905-5739', '650423090007', 1),
(152, '6405011205850002', 'Zulkifli', 'Mitra Pendataan', 'zulkifli1266@yahoo.co.id', '140', '003', 'Desa Bukit Aru Indah', 1, '+62 823-5017-6634', '650423090014', 1),
(153, '6405015011910001', 'Sumarni', 'Mitra Pendataan', 'sumarnisumarnii1991@gmail.com', '140', '004', 'Jl.lapangan RT.08 desa Tanjung aru', 2, '+62 822-5255-4910', '650423090013', 1),
(154, '6405072511980001', 'Teddy Tajamawan', 'Mitra Pendataan', 'teddytajamawan@gmail.com', '010', '008', 'Desa Long Budung', 1, '081220843147', '650423090012', 1),
(155, '6405051301930001', 'Jonly', 'Mitra Pendataan', 'jonly020@bpsnunukan.com', '020', '033', 'Desa Pa\' Rupai', 1, '081296008650', '650423090011', 1),
(156, '6405044606960001', 'Mariati', 'Mitra Pendataan', 'mariatitaulumbis@gmail.com', '032', '004', 'Desa Tau Lumbis', 2, '082158834318', '650423090010', 1),
(157, '6405044406040001', 'Loly Elma Ghanithree', 'Mitra Pendataan', 'Lolyelmaghanithree@gmail.com', '040', '006', 'Desa Mansalong', 2, '+62 822-5640-2436', '650423090017', 1),
(158, '6405065810910001', 'Kiki Nadia lestari', 'Mitra Pendataan', 'kikinadia1018@gmail.com', '070', '010', 'Desa pembeliangan', 2, '+62 081-2507-30730', '650423090016', 1),
(159, '6405052611970001', 'Alex', 'Mitra Pendataan', 'alexapollos01@gmail.com', '011', '006', 'Long Mutan RT 001', 1, '082158400252', '650422100008', 1),
(160, '6406081503940001', 'Virandy', 'Mitra Pendataan', 'virandy.kuir@gmail.com', '011', '004', 'Pa\' Milau RT 001', 1, '085252808233', '650422100009', 1),
(161, '7307066207980001', 'NURJANNA', 'Mitra Pendataan', 'nurjanna@gmail.com', '120', '004', 'JL.SEI.LAPIO RT.008,DESA SETABU', 2, '+62 823-4393-8097', '650422100071', 1),
(162, '6405066708880003', 'HAMIDAH', 'Mitra Pendataan', 'hamidah@gmail.com', '120', '002', 'SIMPANG BAHAGIA RT.01 LIANG BUNYU', 2, '+62 852-5298-5830', '650422100068', 1),
(163, '6405086411950001', 'HERYANTI', 'Mitra Pendataan', 'heryanti@gmail.com', '120', '004', 'JL.BATU LIMA RT.03 DESA SETABU KEC.SEBATIK BARAT,KAB NUNUKAN', 2, '082299131595', '650422100072', 1),
(164, '6405090508940001', 'HARDI', 'Mitra Pendataan', 'hardi@gmail.com', '120', '001', 'JL.BAMBANGAN, JL POROS BAMBANGAN RT.04', 1, '+62 085-2458-28228', '650422100064', 1),
(165, '6405085007920001', 'AMIRAN NISA', 'Mitra Pendataan', 'amiran_nisa@gmail.com', '120', '004', 'SETABU RT 004 SEBATIK BARAT', 2, '+62 085-2475-01773', '650422100073', 1),
(166, '6405050702950002', 'Frengki Mardoni', 'Mitra Pendataan', 'frengkimardoni44@gmail.com', '020', '021', 'Terang Baru RT 001 Liang Biadung', 1, '081283295455', '650422100004', 1),
(167, '6405020507740001', 'RUDI HARIYANTO', 'Mitra Pendataan', 'rudi.hariyanto@bpsnunukan.com', '100', '002', 'JL. SEI APUK, RT. 13, DESA BINUSAN', 1, '085246305055', '650422100252', 1),
(168, '6405021804860004', 'RUSIMAN', 'Mitra Pendataan', 'rusiman.rusiman@bpsnunukan.com', '100', '002', 'JL. BINUSAN DALAM, RT. 11, DESA BINUSAN', 1, '+62 895-3248-83553', '650422100260', 1),
(169, '6405021001890003', 'JEFRI', 'Mitra Pendataan', 'jefri8803@gmail.com', '100', '003', 'RT. 16, KEL. NUNUKAN TENGAH', 1, '+62 821-5491-6146', '650422100263', 1),
(170, '6405021904850002', 'MARUDUR SILABAN', 'Mitra Pendataan', 'marudur.silaban@bpsnunukan.com', '100', '001', 'JL. PERSEMAIAN, RT. 14, KEL. NUNUKAN BARAT', 1, '+62 082-1583-05737', '650422100272', 1),
(171, '6405022306960002', 'MOHAMMAD YASIN', 'Mitra Pendataan', 'm.yasin@bpsnunukan.com', '100', '005', 'JL. HASANUDDIN, RT. 09', 1, '+62 812-5628-246', '650422100281', 1),
(172, '6405026803000001', 'Sartin Wasilah', 'Mitra Pendataan', 'sartin.w@bpsnunukan.com', '100', '004', 'JL. IMAM BONJOL RT. 006 KEL. NUNUKAN TIMUR KEC. NUNUKAN', 2, '+62 813-4245-5208', '650422100302', 1),
(173, '6405051208010001', 'Ronal', 'Mitra Pendataan', 'Onalci112@gmail.com', '021', '006', 'Jl. Agung Belu', 1, '081258462663', '650423040004', 1),
(174, '6473022707860012', 'Juli Ciny', 'Mitra Pendataan', 'juliciny07@gmail.com', '022', '020', 'Liang Bua', 1, '081347001467', '650423040006', 1),
(175, '6405070101010001', 'Teofilus', 'Mitra Pendataan', 'Teofillus01@gmail.com', '010', '002', 'Liang Lunuk, RT 01', 1, '085226192929', '650423050025', 1),
(176, '6406082502870001', 'Fridan', 'Mitra Pendataan', 'fridandhanz8@gmail.com', '010', '012', 'Pa Upan RT 001', 1, '082133224619', '650423050019', 1),
(177, '6405070907790001', 'Nababan', 'Mitra Pendataan', 'Nababanmatius@gamil.com', '010', '007', 'Pa Sing, RT 001', 1, '082158849553', '650423050022', 1),
(178, '6405012808980003', 'NURSYAM', 'Mitra Pendataan', 'nursyam280898@gmail.com', '140', '001', 'Jl. Ahmad Yani Gang Bahagia 01 RT 009 Dusun Bahagia', 1, '+62 896-4984-5094', '650423050006', 1),
(179, '6405142303830001', 'Tarto', 'Mitra Pendataan', 'Tartotama1@gmail.com', '090', '004', 'Jl. Kanduangan rt 05', 1, '+62 812-5680-162', '650423050010', 1),
(180, '7305034506820004', 'Mariati', 'Mitra Pendataan', 'hartatydilla@gmail.com', '090', '004', 'Jl. Kandungan, RT. 005', 2, '+62 082-3940-32834', '650423050011', 1),
(181, '6405016612950001', 'Norapidah', 'Mitra Pendataan', 'laura.pidah88@gmail.com', '160', '002', 'jl. manunggal rt 2', 2, '+62 812-5576-7717', '650423050027', 1),
(182, '6405153012930001', 'Paulus', 'Mitra Pendataan', 'auripaulus621@gmail.com', '030', '023', 'Desa Limpakon', 1, '082251963064', '650423090019', 1),
(183, '6405051909850001', 'Berly Swandi', 'Mitra Pendataan', 'ruabruab258@gmail.com', '021', '016', 'Pa\' Pala RT 001', 1, '085348792868', '650423050026', 1),
(184, '6405044412980001', 'TERISIA', 'Mitra Pendataan', 'teresiasuardy@gmail.com', '040', '015', 'Tanjung hilir', 2, '+62 822-1142-8191', '650423110031', 1),
(185, '6405086307010001', 'Nur nilam sari pawe', 'Mitra Pendataan', 'nur.nilam@icloud.com', '120', '003', 'Jl pangkalan barat rt 08', 2, '+62 896-1936-7666', '650423110104', 1),
(186, '6405056504950001', 'Ina Sari Bulan', 'Mitra Pendataan', 'saribulanina@gmail.com', '020', '059', 'Pa\' Api Krayan', 2, '+62 082-2534-65992', '650423110027', 1),
(187, '6405052403840002', 'BELLEY MASDER', 'Mitra Pendataan', 'sukmaparamitha291@gmail.com', '021', '013', 'Desa palidung', 1, '+62 822-2619-3188', '650423110045', 1),
(188, '6405052611950001', 'MARFINUS PUDUN', 'Mitra Pendataan', 'marfinusp@gmail.com', '020', '058', 'Liang tuer', 1, '+62 813-4651-6459', '650423110047', 1),
(189, '6405096803980001', 'Murni', 'Mitra Pendataan', 'tewai471@gmail.com', '110', '003', 'Jl.Ujang Dewa RT.08 Kel.Nunukan Selatan', 2, '+62 895-3500-88567', '650423110075', 1),
(190, '6405064702900001', 'Eri Misria', 'Mitra Pendataan', 'erimisria7290@gmail.com', '070', '006', 'Jl. Pembangunan RT 002', 2, '+62 812-5318-9915', '650423110078', 1),
(191, '6405032202960001', 'Gunawan', 'Mitra Pendataan', 'gunawankurniawan2202@gmail.com', '060', '006', 'Jl. Ujang kuda RT. 10', 1, '+62 082-2433-39413', '650423110069', 1),
(192, '6405030303790001', 'Dwi Joko Wibowo', 'Mitra Pendataan', 'djokowibowo5758@gmail.com', '060', '006', 'Jl. lapangan Rt.09 Atap Sembakung', 1, '+62 858-4545-2437', '650423110105', 1),
(193, '6405096402900001', 'Sahariah', 'Mitra Pengolahan', 'sahariashaee@gmail.com', '110', '004', 'Jl. Pesantren Hidayatullah', 2, '+62 822-5041-8866', '650423090022', 1),
(194, '6405021003830005', 'Hendra', 'Mitra Pendataan', 'yuntihendra@gmail.com', '040', '006', 'Jl. Pembangunan Rt. 03', 1, '+62 812-5005-8200', '650423110109', 1),
(195, '6405021705000005', 'Dicky Hermawan Simanjuntak', 'Mitra Pengolahan', 'dickyhs017@gmail.com', '100', '005', 'Jalan Radio, RT 02', 1, '+62 822-5134-7505', '650423060012', 1),
(196, '6405051708960001', 'LEZENTONI', 'Mitra Pendataan', 'thoni6321@gmail.com', '021', '004', 'DESA PA\' BETUNG RT 001', 1, '+62 812-2679-6217', '650422100052', 1),
(197, '6405025404950001', 'Amalia Hidayah Chaniago', 'Mitra Pengolahan', 'amaliahidayahc@gmail.com', '100', '003', 'Jalan Sutanto RT 007 NO 56', 2, '+62 813-5157-7575', '650423110021', 1),
(198, '6405024211900001', 'Nur Aida', 'Mitra Pengolahan', 'aidha.idha7@gmail.com', '100', '005', 'Jl. Hasanuddin rt.11 kel. Nunukan Utara', 2, '+62 812-4555-2015', '650423060003', 1),
(199, '6405097001010001', 'Ana kurnia', 'Mitra Pengolahan', 'anakurnia2001@gmail.com', '110', '001', 'Jalan Yos sudarso Rt.01 Rw. 01', 2, '+62 812-5490-4732', '650423110019', 1),
(200, '7308274107920019', 'Hasrianti u s.pt', 'Mitra Pengolahan', 'hasriantianti4@gmail.com', '100', '001', 'Jl. Iskandar muda Rt.015 Kelurahan Nunukan Barat Kecamatan Nunukan Kabupaten Nunukan', 2, '+62 821-5263-6353', '650423060005', 1),
(201, '7315041504070003', 'Zulkifli bin saiful', 'Mitra Pengolahan', 'Zul361150@gmail.com', '110', '004', 'Jl. Pattimura', 1, '+62 853-2520-1727', '650422110004', 1),
(202, '6405022404910005', 'AMRAL', 'Mitra Pengolahan', 'amral.anastasia24@gmail.com', '110', '004', 'JL. PANGERAN SURYADINATA RT 008 RW 002', 1, '+62 813-5094-2721', '650422110011', 1),
(203, '6405024704970001', 'DEWI SALEMPANG LOLOLAEN', 'Mitra Pengolahan', 'dewisalempang@gmail.com', '100', '003', 'Jl. Fatahillah Rt.010', 2, '+62 812-5564-8206', '650422110003', 1),
(204, '6405097010980001', 'Sumarni', 'Mitra Pengolahan', '3010sumarni@gmail.com', '110', '003', 'Jl. Ujang Dewa Rt. 001 Rw. 001', 2, '+62 822-3880-5940', '650422050051', 1),
(205, '7372042409880006', 'Eko Sopiandi Idris', 'Mitra Pengolahan', 'ekosopiandi.idris@gmail.com', '110', '002', 'Jl. Anasta Wijaya RT. 02', 1, '+62 085-2427-57455', '650422050050', 1),
(206, '6405025207980001', 'Nevita Yuslia Putri', 'Mitra Pengolahan', 'Nevitaysp@gmail.com', '100', '003', 'Jalan fatahillah', 2, '+62 813-5700-5122', '650423110016', 1),
(207, '6405024507000008', 'Emi Sarmila', 'Mitra Pengolahan', 'emisarmila@gmail.com', '100', '004', 'Jalan Angkasa', 2, '+62 821-4983-9144', '650423110082', 1),
(208, '6405026205050001', 'NURMEISYELA PUTRI HATMIZAH', 'Mitra Pengolahan', 'nputrihatmizah@gmail.com', '100', '005', 'JALAN HASANUDDIN RT. 008 / RW. 000', 2, '+62 813-4544-9449', '650423110057', 1),
(209, '6405021811950001', 'NOFRI SAGISTIAN', 'Mitra Pengolahan', 'sagistiannofri@gmail.com', '100', '001', 'Jalan Tawakal, RT.007', 1, '+62 812-5494-4415', '650423010003', 1),
(210, '6405026009960001', 'Linda Retnowati', 'Mitra Pengolahan', 'lindaretno209@gmail.com', '100', '003', 'Jl. Fatahillah RT 10 Nunukan Tengah', 2, '+62 852-4792-5355', '650423060011', 1),
(211, '6405020807940001', 'FADLY AMRI', 'Mitra (Pendataan dan Pengolahan)', 'fadlyamri17@gmail.com', '100', '003', 'JALAN TEUKU UMAR RT 013', 1, '+62 083-5300-0123', '650422100247', 1),
(212, '6405021506040004', 'Hardin', 'Mitra (Pendataan dan Pengolahan)', 'din116511@gmail.com', '100', '004', 'JLN. MANUNGGAL BHAKTI RT 12 NUNUKAN TIMUR', 1, '+62 821-5489-4979', '650422110001', 1),
(213, '6405024608930004', 'NURAHMA', 'Mitra (Pendataan dan Pengolahan)', 'Rachmacliquers78@gmail.com', '100', '001', 'JL. TANJUNG, RT. 12, KEL. NUNUKAN BARAT', 2, '+62 082-3333-00021', '650422100288', 1),
(214, '6405025912910001', 'JUMRIANA', 'Mitra (Pendataan dan Pengolahan)', 'Emailpunyaanha@gmail.com', '110', '004', 'JL. IMAM BONJOL RT.11 RW.03', 2, '+62 812-5849-4527', '650423090004', 1),
(215, '6405024603010001', 'Auliya Yasmin', 'Mitra (Pendataan dan Pengolahan)', 'auliyayasmin7@gmail.com', '100', '003', 'Jl. Kp.jawa Rt.05', 2, '+62 822-5125-4378', '650423060013', 1),
(216, '7314106303970001', 'Siska', 'Mitra Pengolahan', 'siskauchy645@gmail.com', '100', '004', 'Jl. Manunggal Bhakti, RT 012 / RW 011', 2, '+62 853-4033-8087', '650422110009', 1),
(217, '6405022911970003', 'AKBAR RAMADANI', 'Mitra Pengolahan', 'akbarramadani333@gmail.com', '100', '004', 'Gang Delima, Kel Nunukan Timur, Kec Nunukan, Prov Kalimantan Utara', 1, '+62 822-5219-4616', '650423110011', 1),
(218, '6405026901970001', 'Melisa Londong', 'Mitra Pengolahan', 'mellylhilhy@gmail.com', '100', '003', 'Jl.Pong Tiku', 2, '+62 822-8443-0942', '650423110041', 1),
(219, '6405056104990001', 'SUKMA PARAMITA', 'Mitra Pendataan', 'sukmaparamita2104@gmail.com', '020', '058', 'desa liang tuer kecamatan krayan, kabupaten nunukan', 2, '+62 852-4900-2422', '650423110042', 1),
(220, '6405022003955000', 'ILHAM SURIYADI', 'Mitra Pendataan', 'iamlham99@gmail.com', '100', '003', 'Jl. A. Yani RT 07 Nunukan Tengah', 1, '+62 853-4699-9884', '650423090005', 1),
(221, '6405084211980001', 'Salwa', 'Mitra Pendataan', 'salwaanwar083@gmail.com', '150', '002', 'Jl. Maspul RT 02', 2, '+62 822-5484-9253', '650423050005', 1),
(222, '6405016603970001', 'Yuyun Giska Oviandari', 'Mitra Pendataan', 'yuyungiskao@gmail.com', '130', '002', 'Sei. Taiwan, RT.05', 2, '+62 812-5097-9851', '650423050001', 1),
(223, '6405022401790001', 'R. WIDIYANTO', 'Mitra Pendataan', 'widiyantoronald@gmail.com', '100', '001', 'JL. PEMBANGUNAN RT.10 NO.70 NUNUKAN BARAT', 1, '+62 857-5751-53794', '650422100303', 1),
(224, '6405026307990001', 'NUR ADILAH MUTTAQIYAH', 'Mitra Pendataan', 'nuradilah.m@bpsnunukan.com', '100', '001', 'JL. TANJUNG, RT. 24, KEL. NUNUKAN BARAT', 2, '+62 822-5149-8797', '650422100300', 1),
(225, '6405022804950001', 'ALFRED INDRA KUSUMA ROMBE', 'Mitra Pendataan', 'alfred.rombe@bpsnunukan.com', '100', '003', 'JL. CUT NYAK DIEN, RT. 05, KEL. NUNUKAN TENGAH', 1, '+62 813-4640-3425', '650422100264', 1),
(226, '6405070310860002', 'Gunawan', 'Mitra Pendataan', 'gunawan101986@gmail.com', '010', '007', 'Long layu, krayan selatan', 1, '+62 081-2535-66162', '650423110007', 1),
(227, '6405041205930002', 'Semion Kealdi', 'Mitra Pendataan', 'Semionkealdi1993@gmail.com', '040', '015', 'Jl. Desa Tanjung Hulu Rt 02', 1, '+62 085-3482-03061', '650423040002', 1),
(228, '6405052209900001', 'Besfrensen', 'Mitra Pendataan', 'besfrens90@gmail.com', '020', '059', 'Pa\' Api RT 001, Krayan', 1, '+62 081-3511-57868', '650422100006', 1),
(229, '6405041509950001', 'MARIO', 'Mitra Pendataan', 'mariotalumi@gmail.com', '040', '014', 'DESA TANJUNG HILIR', 1, '+62 821-5015-4190', '650422100138', 1),
(230, '6405015208960003', 'ISMA DEWI', 'Mitra Pendataan', 'ismhadhewi@gmail.com', '130', '002', 'JL. PADAELO, RT. 006 RW.002', 2, '+62 822-5436-6811', '650422100123', 1),
(231, '6405052808930001', 'ARI CHANDRA', 'Mitra Pendataan', 'Arichn11@gmail.com', '021', '009', 'PA\' UMUNG RT 001', 1, '+62 813-4757-1554', '650422100049', 1),
(232, '6405011504920002', 'Adil Abdul Latif', 'Mitra Pendataan', 'iilatif464@gmail.com', '140', '003', 'Jalan Pantai Indah RT 01 Bukit Aru indah', 1, '+62 081-2549-14044', '650422060001', 1),
(233, '6405020408910006', 'IWAN', 'Mitra Pendataan', 'munikaiwan@gmail.com', '110', '002', 'RT.03,RW.01,JL.PANAMAS', 1, '+62 822-8682-7445', '650422100101', 1),
(234, '6405091911950002', 'MUHAMMAD SAFUAN', 'Mitra Pendataan', 'muhsafuan@gmail.com', '110', '002', 'JL. ANASTA WIJAYA RT.002 RW.001 KEL. MANSAPA KEC. NUNUKAN SELATAN', 1, '+62 085-2477-55424', '650422100103', 1),
(235, '6405052403940002', 'ANDRIS KURNIAWAN', 'Mitra Pendataan', 'andris@regsosek.com', '022', '007', 'DESA PA\' KEMUT RT 002', 1, '085246442264', '650422100043', 1),
(236, '6405015707880004', 'RASDIANA', 'Mitra Pendataan', 'dianasaid725@gmail.com', '160', '002', 'Jl.Sultan Hasanuddin RT 12', 2, '+62 822-5452-5577', '650422100084', 1),
(237, '6405022606860004', 'Bakri', 'Mitra Pendataan', 'rezkyananda759@gmail.com', '100', '001', 'Jalan PLN lama RT.17', 1, '+62 895-7008-10302', '650422050024', 1),
(238, '6405091808910001', 'JUMARDI, S.M.,S.H', 'Mitra Pendataan', 'jumardijuz.mr@gmail.com', '100', '002', 'Jl. Sei Fatimah RT.03 Binusan', 1, '+62 821-4920-0047', '650422100251', 1),
(239, '6405025006880001', 'Andi Rusmini', 'Mitra Pendataan', 'rusmini.andi@yahoo.com', '100', '004', 'Jl. Pasar Baru Rt.04', 2, '+62 821-5883-8547', '650422050020', 1),
(240, '6405021910930001', 'SALAHUDIN B. MOHAMMAD', 'Mitra Pendataan', 'salahudinmohammad93@gmail.com', '110', '003', 'Nunukan Selatan', 1, '+62 821-5808-0506', '650422050012', 1),
(241, '6405022908850002', 'AMATANG', 'Mitra Pendataan', 'muh.fackhri@gmail.com', '100', '004', 'JL. PASAR BARU, RT. 03', 1, '+62 081-2539-22666', '650422020025', 1),
(242, '6405011303760001', 'Bustan', 'Mitra Pendataan', 'bustansunarti79@gmail.com', '140', '004', 'Jalan monginsidi', 1, '+62 085-2478-97697', '650422050005', 1),
(243, '6405026305960003', 'Suryawati ningsih', 'Mitra Pengolahan', 'suryawatiningsih02@gmail.com', '100', '003', 'Jl. Fatahillah, Rt. 010/000', 2, '+62 081-3504-73725', '650423110008', 1),
(244, '6405082510930003', 'ISMAIL', 'Mitra Pendataan', 'mhael.cikg@gmail.com', '150', '001', 'Jl.dusun berjoko RT 12 Sungai Limau Sebatik Tengah', 1, '+62 082-2361-16093', '650423050016', 1),
(245, '6405032001930001', 'Yusten', 'Mitra Pendataan', 'yusten32@gmail.com', '030', '007', 'Desa ubol alung', 1, '+62 813-4967-5984', '650423110050', 1),
(246, '6465081406870001', 'Jonnih', 'Mitra Pendataan', 'Ambang666@gmail.com', '150', '003', 'Jl.pasar kamis RT 002 Dusun Abadi 1', 1, '+62 853-9452-4473', '650423020003', 1),
(247, '6405025406870001', 'SITTI RAISAH', 'Mitra Pendataan', 'raisah.isyah2217@gmail.com', '110', '004', 'Nunukan Selatan', 2, '+62 821-5709-7819', '650423020002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_peg` int(11) NOT NULL,
  `nip` bigint(18) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `jabatan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_peg`, `nip`, `nama`, `email`, `jabatan`) VALUES
(90001, 197006152007011007, 'Ilham', 'ilham2@bps.go.id', ''),
(90002, 198109182006041015, 'Herman S.E.', 'herm@bps.go.id', ''),
(90003, 198209062007012001, 'Julia', 'julia@bps.go.id', ''),
(90004, 198611282010031001, 'Ayub A.Md.Kom', 'ayub2@bps.go.id', ''),
(90005, 199606302019012001, 'Fadlilah Rahmawati S.Tr.Stat.', 'fadlilah.r@bps.go.id', ''),
(90006, 199609032019121001, 'Sega Purwa Wika S.Tr.Stat.', 'sega.wika@bps.go.id', ''),
(90007, 199504152018021001, 'Muhammad Tanzir SST', 'm.tanzir@bps.go.id', ''),
(90008, 199509182018022001, 'Andi Dalfiah Mustafa SST', 'andi.dalfiah@bps.go.id', ''),
(90009, 199510012019121001, 'Rahadyan Saktyo Arzaqi S.Tr.Stat.', 'rahadyan.saktyo@bps.go.id', ''),
(90010, 199611152019121001, 'Aditya Yogatama S.Tr.Stat.', 'aditya.yogatama@bps.go.id', ''),
(90011, 199701212019121001, 'Ramadha Wafiq Musthafa S.Tr.Stat.', 'ramadha.wm@bps.go.id', ''),
(90012, 199706102021041001, 'M. Abd. Aziz Assyaukani S.Tr.Stat.', 'aziz.assyaukani@bps.go.id', ''),
(90013, 199706202019012002, 'Nabila Daisy Prima S.Tr.Stat.', 'nabiladp@bps.go.id', ''),
(90014, 199802152021041001, 'Ahmad Rizal Hadi Sandhori S.Tr.Stat.', 'rizal.hadi@bps.go.id', ''),
(90015, 199905132022011001, 'M. Sonny Aditama S.Tr.Stat.', 'sonny.aditama@bps.go.id', ''),
(90016, 199905312022011002, 'Izza Mulya Fadila S.Tr.Stat.', 'izza.mulya@bps.go.id', ''),
(90017, 199906012022011002, 'Muhammad Rizky Alfarizi S.Tr.Stat.', 'rizky.alfarizi@bps.go.id', ''),
(90018, 199908152022012002, 'Intan Putri Lestyani S.Tr.Stat.', 'intan.lestyani@bps.go.id', ''),
(90019, 200007312023101002, 'Mohamad Choirul Zamzami S.Tr.Stat.', 'choirul.zamzami@bps.go.id', ''),
(90020, 200105012023101004, 'Ghifari Khairul Hakim S.Tr.Stat.', 'ghifari.hakim@bps.go.id', ''),
(90021, 200109112023102002, 'Nurdiana Rihadatul Hasmar A.Md.Stat.', 'nurdiana.rh@bps.go.id', ''),
(90022, 200202192023102002, 'Feni Gamita Febrianti A.Md.Stat.', 'feni.febrianti@bps.go.id', ''),
(90023, 200204092023101006, 'Muh. Nur Aslam Kadir A.Md.Stat.', 'aslam.kadir@bps.go.id', ''),
(90024, 200209012023101001, 'Septian Aditya Datjing A.Md.Stat.', 'septian.aditya@bps.go.id', ''),
(90025, 199412242018022001, 'Mery Erlina Nainggolan SST', 'mery.erlina@bps.go.id', 'Kasubbag Umum'),
(90026, 198702202010121004, 'Iskandar Ahmaddien SST, SE, S.H., M.M.', 'iskandar.ahmaddien@bps.go.id', 'Kepala BPS');

-- --------------------------------------------------------

--
-- Table structure for table `seksi`
--

CREATE TABLE `seksi` (
  `id` int(11) NOT NULL,
  `nama` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seksi`
--

INSERT INTO `seksi` (`id`, `nama`) VALUES
(1, 'Produksi'),
(2, 'Sosial'),
(3, 'Distribusi'),
(4, 'Nerwilis'),
(5, 'IPDS');

-- --------------------------------------------------------

--
-- Table structure for table `subkriteria`
--

CREATE TABLE `subkriteria` (
  `nilai` int(1) NOT NULL,
  `prioritas` int(11) NOT NULL,
  `deskripsi` varchar(32) NOT NULL,
  `bobot` double NOT NULL,
  `konversi` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subkriteria`
--

INSERT INTO `subkriteria` (`nilai`, `prioritas`, `deskripsi`, `bobot`, `konversi`) VALUES
(1, 5, 'Kurang baik', 0.04, 50),
(2, 4, 'Cukup baik', 0.09, 60),
(3, 3, 'Baik', 0.15666666666667, 70),
(4, 2, 'Sangat baik', 0.25666666666667, 80),
(5, 1, 'Sangat baik sekali', 0.45666666666667, 90);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `image` varchar(32) NOT NULL DEFAULT 'default.jpg',
  `password` varchar(128) NOT NULL DEFAULT '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO',
  `role_id` int(1) NOT NULL,
  `seksi_id` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `date_created` int(11) NOT NULL,
  `token` varchar(128) DEFAULT NULL,
  `date_created_token` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `image`, `password`, `role_id`, `seksi_id`, `is_active`, `date_created`, `token`, `date_created_token`) VALUES
(107, 'ipds6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 3, 5, 1, 1621989189, NULL, NULL),
(108, 'produksi6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 3, 1, 1, 1621989189, NULL, NULL),
(109, 'nerwilis6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 3, 4, 1, 1621989189, NULL, NULL),
(110, 'sosial6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 3, 2, 1, 1621989189, NULL, NULL),
(111, 'distribusi6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 3, 3, 1, 1621989189, NULL, NULL),
(112, 'kepala6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 2, 0, 1, 1621989189, NULL, NULL),
(124, 'sonny.aditama@bps.go.id', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 4, 0, 1, 1705737277, NULL, NULL),
(125, 'ekosopiandi.idris@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 5, 0, 1, 1705737862, NULL, NULL),
(126, '3010sumarni@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 5, 0, 1, 1705737871, NULL, NULL),
(127, 'admin6504@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 1, 0, 1, 1621989189, NULL, NULL),
(128, 'rizal.hadi@bps.go.id', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 4, 0, 1, 1705788511, NULL, NULL),
(129, 'nadhifa780@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 5, 0, 1, 1705788536, NULL, NULL),
(130, 'iilatif464@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 5, 0, 1, 1705788542, NULL, NULL),
(131, 'ilyasdoankbro@gmail.com', 'default.jpg', '$2y$10$LbxrTcSA4dSZlSnoPWUUoeb7b6xBZD.tE/fsBxydlgn.q6aqV18nO', 5, 0, 1, 1705788560, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(1) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(11, 1, 6),
(19, 4, 3),
(20, 4, 4),
(24, 5, 4),
(36, 3, 2),
(46, 3, 8),
(48, 1, 1),
(51, 1, 7),
(54, 3, 4),
(55, 3, 5),
(57, 1, 18),
(64, 3, 19),
(65, 4, 19),
(66, 5, 19),
(68, 3, 1),
(69, 2, 1),
(70, 2, 20),
(71, 1, 2),
(73, 1, 4),
(74, 1, 5),
(75, 1, 8),
(76, 1, 19),
(77, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Master'),
(2, 'Kegiatan'),
(3, 'Penilaian'),
(4, 'Hasil Penilaian'),
(5, 'History Penilaian'),
(6, 'Admin'),
(7, 'Menu'),
(8, 'Ranking'),
(19, 'Timeline'),
(20, 'Rekap');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Kepala BPS'),
(3, 'Operator'),
(4, 'Pengawas/Pemeriksa Organik'),
(5, 'Mitra');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `url` varchar(64) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 6, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(4, 7, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 7, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(9, 6, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(12, 1, 'Data Mitra', 'master/mitra', 'fas fa-fw fa-user', 1),
(13, 2, 'Survei', 'kegiatan/survei', 'fas fa-fw fa-book', 1),
(14, 3, 'Isi Penilaian', 'penilaian', 'fas fa-fw fa-pencil-alt', 1),
(15, 4, 'Cetak Hasil Penilaian', 'penilaian/pilihkegiatan', 'fas fa-fw fa-file-pdf', 1),
(16, 5, 'Arsip', 'penilaian/arsip', 'fas fa-fw fa-archive', 1),
(20, 2, 'Sensus', 'kegiatan/sensus', 'fas fa-fw fa-book', 1),
(25, 6, 'All User', 'admin/alluser', 'fas fa-fw fa-user', 1),
(26, 1, 'Data Pegawai', 'master/pegawai', 'fas fa-fw fa-user-tie', 1),
(27, 8, 'Ranking Mitra', 'ranking/pilih_kegiatan_nilai_akhir', 'fas fa-fw fa-graduation-cap', 1),
(28, 8, 'Data Kriteria', 'ranking/kriteria', 'fas fa-fw fa-key', 1),
(29, 8, 'Penghitungan', 'ranking/pilih_kegiatan', 'fas fa-fw fa-pen', 1),
(32, 19, 'Jadwal', 'timeline/index', 'fas fa-fw fa-calendar-alt', 1),
(33, 20, 'Beban Kerja Pegawai', 'rekap/bk_pegawai', 'fas fa-fw fa-file-excel', 1),
(34, 20, 'Beban Kerja Mitra', 'rekap/bk_mitra', 'fas fa-fw fa-file-excel', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_kegiatan_pencacah`
--
ALTER TABLE `all_kegiatan_pencacah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_kegiatan_pengawas`
--
ALTER TABLE `all_kegiatan_pengawas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_penilaian`
--
ALTER TABLE `all_penilaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kode_kecamatan`
--
ALTER TABLE `kode_kecamatan`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitra`
--
ALTER TABLE `mitra`
  ADD PRIMARY KEY (`id_mitra`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_peg`);

--
-- Indexes for table `seksi`
--
ALTER TABLE `seksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`nilai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_kegiatan_pencacah`
--
ALTER TABLE `all_kegiatan_pencacah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `all_kegiatan_pengawas`
--
ALTER TABLE `all_kegiatan_pengawas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `all_penilaian`
--
ALTER TABLE `all_penilaian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `mitra`
--
ALTER TABLE `mitra`
  MODIFY `id_mitra` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_peg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90028;

--
-- AUTO_INCREMENT for table `seksi`
--
ALTER TABLE `seksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
