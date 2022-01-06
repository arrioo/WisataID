-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2021 at 06:49 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisataid`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `gambar_kategori` varchar(200) NOT NULL DEFAULT 'gambar_default.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `gambar_kategori`) VALUES
(20, 'Wisata', 'wisata.png'),
(21, 'Kuliner', 'kuliner.png');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `isi_komentar` text NOT NULL,
  `status_komentar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `kode_pengguna` char(9) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `email` varchar(35) NOT NULL,
  `no_telp` char(14) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `kode_pengguna`, `nama_pengguna`, `email`, `no_telp`, `username`, `password`, `status`) VALUES
(21, 'U021', 'arrio', 'arrio@gmail.com', '12332122223', 'arrio', '827ccb0eea8a706c4c34a16891f84e7b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `nama_website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`nama_website`) VALUES
('Wisata ID');

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id_wisata` int(11) NOT NULL,
  `kode_wisata` char(10) NOT NULL,
  `nama_wisata` varchar(100) NOT NULL,
  `isi_wisata` text NOT NULL,
  `gambar` varchar(100) NOT NULL DEFAULT 'gambar_default.png',
  `tanggal` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id_wisata`, `kode_wisata`, `nama_wisata`, `isi_wisata`, `gambar`, `tanggal`, `status`, `id_kategori`, `id_pengguna`) VALUES
(116, 'A0001', 'Candi Ijo', 'Candi Ijo dibangun sekitar abad ke-9, di sebuah bukit yang dikenal dengan Bukit Hijau atau Gumuk Ijo yang ketinggiannya sekitar 410 m di atas permukaan laut. Karena ketinggiannya, maka bukan saja bangunan candi yang bisa dinikmati tetapi juga pemandangan alam di bawahnya berupa teras-teras seperti di daerah pertanian dengan kemiringan yang curam. Meski bukan daerah yang subur, pemandangan alam di sekitar candi sangat indah untuk dinikmati.\r\n\r\nKompleks candi terdiri dari 17 struktur bangunan yang terbagi dalam 11 teras berundak. Teras pertama sekaligus halaman menuju pintu masuk merupakan teras berundak yang membujur dari barat ke timur. Bangunan pada teras ke-11 berupa pagar keliling, delapan buah lingga patok, empat bangunan yaitu candi utama, dan tiga candi perwara. Peletakan bangunan pada tiap teras didasarkan atas kesakralannya. Bangunan pada teras tertinggi adalah yang paling sakral.\r\n\r\nRagam bentuk seni rupa dijumpai sejak pintu masuk bangunan yang tergolong candi Hindu ini. Tepat di atas pintu masuk terdapat kala makara dengan motif kepala ganda dan beberapa atributnya. Motif kepala ganda dan atributnya yang juga bisa dijumpai pada candi Buddha menunjukkan bahwa candi itu adalah bentuk akulturasi kebudayaan Hindu dan Buddha. Beberapa candi yang memiliki motif kala makara serupa antara lain Ngawen, Plaosan dan Sari.\r\n\r\nAda pula arca yang menggambarkan sosok perempuan dan laki-laki yang melayang dan mengarah pada sisi tertentu. Sosok tersebut dapat mempunyai beberapa makna. Pertama, sebagai suwuk untuk mngusir roh jahat dan kedua sebagai lambang persatuan Dewa Siwa dan Dewi Uma. Persatuan tersebut dimaknai sebagai awal terciptanya alam semesta. Berbeda dengan arca di Candi Prambanan, corak naturalis pada arca di Candi Ijo tidak mengarah pada erotisme.\r\n\r\nMenuju bangunan candi perwara di teras ke-11, terdapat sebuah tempat seperti bak tempat api pengorbanan (homa). Tepat di bagian atas tembok belakang bak tersebut terdapat lubang-lubang udara atau ventilasi berbentuk jajaran genjang dan segitiga. Adanya tempat api pengorbanan merupakan cermin masyarakat Hindu yang memuja Brahma. Tiga candi perwara menunjukkan penghormatan masyarakat pada Hindu Trimurti, yaitu Brahma, Siwa, dan Whisnu.\r\n\r\nSalah satu karya yang menyimpan misteri adalah dua buah prasasti yang terletak di bangunan candi pada teras ke-9. Salah satu prasasti yang diberi kode F bertuliskan Guywan atau Bluyutan berarti pertapaan. Prasasti lain yang terbuat dari batu berukuran tinggi 14 cm dan tebal 9 cm memuat mantra-mantra yang diperkirakan berupa kutukan. Mantra tersebut ditulis sebanyak 16 kali dan diantaranya yang terbaca adalah &quot;Om Sarwwawinasa, Sarwwawinasa.&quot; Bisa jadi, kedua prasasti tersebut erat dengan terjadinya peristiwa tertentu di Jawa saat itu. Apakah peristiwanya? Hingga kini belum terkuak.', 'candi-ijo.jpg', '2021-12-13 08:39:42', 1, 20, 0),
(117, 'A0117', 'Gudeg Yu Djum Wijilan', 'Bagi sebagian besar masyarakat Jogja sudah tau dengan pamor Gudeg yang satu ini. Gudeg Yu Djum terkenal dengan keaslian nya yang mana resep masakan diberikan secara turun temurun. Jika hendak membeli gudeg, anda bisa memilih dalam kemasan besek atau kendil guys, dan gudeg Yu Djum tahan berhari – hari tidak gampang basi. Mulai dari gudeg telur, ayam, ati ampela, dan tahu tempe bisa dipilih disini. \r\nGudeg Yu Djum bisa dibilang paling enak dan orisinil diantara gudeg gudeg yang lain di Kota Jogja. Tak jarang tiap harinya selalu banyak pelanggan lokal maupun asing memadati warung gudeg. Harga nasi gudeg mulai dari Rp.11.000 – Rp.45.000\r\n\r\nLokasi : &lt;a href=&quot;https://goo.gl/maps/RdcyYz8gJ8p&quot;&gt;&lt;u&gt;Jl. Wijilan No.167, Panembahan, Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55131&lt;/u&gt;&lt;/a&gt;', 'gudeg.jpg', '2021-12-21 18:45:15', 1, 21, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id_wisata`),
  ADD UNIQUE KEY `nama_wisata` (`nama_wisata`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
