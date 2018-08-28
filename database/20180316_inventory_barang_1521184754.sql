DROP TABLE analisis_indikator;

CREATE TABLE `analisis_indikator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nomor` decimal(3,0) NOT NULL,
  `pertanyaan` varchar(400) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL DEFAULT '1',
  `bobot` tinyint(4) NOT NULL DEFAULT '0',
  `act_analisis` tinyint(1) NOT NULL DEFAULT '2',
  `id_kategori` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`,`id_tipe`),
  KEY `id_tipe` (`id_tipe`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO analisis_indikator VALUES("1","2","1","kepemilikan rumah","1","1","1","1");
INSERT INTO analisis_indikator VALUES("2","2","2","penghasilan perbulan","1","4","1","2");



DROP TABLE analisis_kategori_indikator;

CREATE TABLE `analisis_kategori_indikator` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_master` tinyint(4) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO analisis_kategori_indikator VALUES("1","2","Aset");
INSERT INTO analisis_kategori_indikator VALUES("2","2","Penghasilan");



DROP TABLE analisis_klasifikasi;

CREATE TABLE `analisis_klasifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `minval` double(5,2) NOT NULL,
  `maxval` double(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO analisis_klasifikasi VALUES("1","2","Miskin","5.00","10.00");
INSERT INTO analisis_klasifikasi VALUES("2","2","Sedang","11.00","20.00");
INSERT INTO analisis_klasifikasi VALUES("3","2","Kaya","21.00","25.00");



DROP TABLE analisis_master;

CREATE TABLE `analisis_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `subjek_tipe` tinyint(4) NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '1',
  `deskripsi` text NOT NULL,
  `kode_analiusis` varchar(5) NOT NULL DEFAULT '00000',
  `id_kelompok` int(11) NOT NULL,
  `pembagi` varchar(10) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO analisis_master VALUES("1","Analisis Keahlian Individu","1","1","<p>survey</p>","00000","0","1");
INSERT INTO analisis_master VALUES("2","AKP nagari","2","1","<p>keterangan</p>","00000","0","1");



DROP TABLE analisis_parameter;

CREATE TABLE `analisis_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indikator` int(11) NOT NULL,
  `jawaban` varchar(200) NOT NULL,
  `nilai` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO analisis_parameter VALUES("1","1","milik sendiri","5");
INSERT INTO analisis_parameter VALUES("2","1","milik orang tua","4");
INSERT INTO analisis_parameter VALUES("3","1","kontrak","1");
INSERT INTO analisis_parameter VALUES("4","2","< Rp.500.000,-","1");
INSERT INTO analisis_parameter VALUES("5","2","Rp 500.000,- sampa Rp 1.000.000,-","3");
INSERT INTO analisis_parameter VALUES("6","2","diatas Rp 2.000.000,-","5");



DROP TABLE analisis_partisipasi;

CREATE TABLE `analisis_partisipasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subjek` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `id_klassifikasi` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_subjek` (`id_subjek`,`id_master`,`id_periode`,`id_klassifikasi`),
  KEY `id_master` (`id_master`),
  KEY `id_periode` (`id_periode`),
  KEY `id_klassifikasi` (`id_klassifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE analisis_periode;

CREATE TABLE `analisis_periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_state` tinyint(4) NOT NULL DEFAULT '1',
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  `tahun_pelaksanaan` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO analisis_periode VALUES("1","2","Pendataan 2014","2","2","ket","2014");
INSERT INTO analisis_periode VALUES("2","2","Pendataan 2015","1","1","nnn","2015");



DROP TABLE analisis_ref_state;

CREATE TABLE `analisis_ref_state` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO analisis_ref_state VALUES("1","Belum Entri / Pendataan");
INSERT INTO analisis_ref_state VALUES("2","Sedang Dalam Pendataan");
INSERT INTO analisis_ref_state VALUES("3","Selesai Entri / Pendataan");



DROP TABLE analisis_ref_subjek;

CREATE TABLE `analisis_ref_subjek` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `subjek` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO analisis_ref_subjek VALUES("1","Penduduk");
INSERT INTO analisis_ref_subjek VALUES("2","Keluarga / KK");
INSERT INTO analisis_ref_subjek VALUES("3","Rumah Tangga");
INSERT INTO analisis_ref_subjek VALUES("4","Kelompok");



DROP TABLE analisis_respon;

CREATE TABLE `analisis_respon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indikator` int(11) NOT NULL,
  `id_parameter` int(11) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_parameter` (`id_parameter`,`id_subjek`),
  KEY `id_periode` (`id_periode`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO analisis_respon VALUES("1","1","1","129","1","2014-12-05 14:51:52");
INSERT INTO analisis_respon VALUES("2","2","6","129","1","2014-12-05 14:51:52");
INSERT INTO analisis_respon VALUES("3","1","3","254","1","2014-12-05 14:52:17");
INSERT INTO analisis_respon VALUES("4","2","4","254","1","2014-12-05 14:52:17");
INSERT INTO analisis_respon VALUES("5","1","1","298","1","2014-12-05 14:52:41");
INSERT INTO analisis_respon VALUES("6","2","5","298","1","2014-12-05 14:52:41");
INSERT INTO analisis_respon VALUES("7","1","1","304","1","2014-12-05 14:52:46");
INSERT INTO analisis_respon VALUES("8","2","5","304","1","2014-12-05 14:52:46");
INSERT INTO analisis_respon VALUES("9","1","3","308","1","2014-12-05 14:52:53");
INSERT INTO analisis_respon VALUES("10","2","6","308","1","2014-12-05 14:52:53");
INSERT INTO analisis_respon VALUES("11","1","1","309","1","2014-12-05 14:52:58");
INSERT INTO analisis_respon VALUES("12","2","4","309","1","2014-12-05 14:52:58");
INSERT INTO analisis_respon VALUES("13","1","3","129","2","2014-12-05 14:54:59");
INSERT INTO analisis_respon VALUES("14","2","4","129","2","2014-12-05 14:54:59");
INSERT INTO analisis_respon VALUES("15","1","1","254","2","2014-12-05 14:55:07");
INSERT INTO analisis_respon VALUES("16","2","6","254","2","2014-12-05 14:55:07");
INSERT INTO analisis_respon VALUES("17","1","2","298","2","2014-12-05 14:55:12");
INSERT INTO analisis_respon VALUES("18","2","6","298","2","2014-12-05 14:55:12");
INSERT INTO analisis_respon VALUES("19","1","3","304","2","2014-12-05 14:55:19");
INSERT INTO analisis_respon VALUES("20","2","6","304","2","2014-12-05 14:55:19");
INSERT INTO analisis_respon VALUES("21","1","2","308","2","2014-12-05 14:55:24");
INSERT INTO analisis_respon VALUES("22","2","6","308","2","2014-12-05 14:55:24");
INSERT INTO analisis_respon VALUES("23","1","3","309","2","2014-12-05 14:55:31");
INSERT INTO analisis_respon VALUES("24","2","6","309","2","2014-12-05 14:55:31");



DROP TABLE analisis_respon_hasil;

CREATE TABLE `analisis_respon_hasil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` tinyint(4) NOT NULL,
  `id_periode` tinyint(4) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `akumulasi` double(8,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO analisis_respon_hasil VALUES("1","2","1","129","25.000");
INSERT INTO analisis_respon_hasil VALUES("2","2","1","254","5.000");
INSERT INTO analisis_respon_hasil VALUES("3","2","1","298","17.000");
INSERT INTO analisis_respon_hasil VALUES("4","2","1","304","17.000");
INSERT INTO analisis_respon_hasil VALUES("5","2","1","308","21.000");
INSERT INTO analisis_respon_hasil VALUES("6","2","1","309","9.000");
INSERT INTO analisis_respon_hasil VALUES("7","2","2","129","5.000");
INSERT INTO analisis_respon_hasil VALUES("8","2","2","254","25.000");
INSERT INTO analisis_respon_hasil VALUES("9","2","2","298","24.000");
INSERT INTO analisis_respon_hasil VALUES("10","2","2","304","21.000");
INSERT INTO analisis_respon_hasil VALUES("11","2","2","308","24.000");
INSERT INTO analisis_respon_hasil VALUES("12","2","2","309","21.000");



DROP TABLE analisis_tipe_indikator;

CREATE TABLE `analisis_tipe_indikator` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO analisis_tipe_indikator VALUES("1","Pilihan (Tunggal)");
INSERT INTO analisis_tipe_indikator VALUES("2","Pilihan (Multivalue)");
INSERT INTO analisis_tipe_indikator VALUES("3","Isian Angka");
INSERT INTO analisis_tipe_indikator VALUES("4","Isian Tulisan");



DROP TABLE area;

CREATE TABLE `area` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_polygon` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `desk` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE artikel;

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_kategori` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `headline` int(1) NOT NULL DEFAULT '0',
  `gambar1` varchar(200) NOT NULL,
  `gambar2` varchar(200) NOT NULL,
  `gambar3` varchar(200) NOT NULL,
  `dokumen` varchar(400) NOT NULL,
  `link_dokumen` varchar(200) NOT NULL,
  `urut` int(5) DEFAULT NULL,
  `jenis_widget` tinyint(2) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

INSERT INTO artikel VALUES("7","","<p><strong>Awal mula SID</strong><br /> \"Awalnya ada keinginan dari pemerintah nagari Balerante yang berharap pelayanan pemerintah nagari bisa seperti pengunjung rumah sakit yang ingin mencari data pasien rawat inap, tinggal ketik nama di komputer, maka data tersebut akan keluar\"<br /> (Mart Widarto, pengelola Program Lumbung Komunitas)<br /> Program ini mulai dibuat dari awal 2006: <br /> 1. (2006) komunitas melakukan komunikasi dan diskusi lepas tentang sebuah sistem yang bisa digunakan untuk menyimpan data.<br /> 2. (2008) Rangkaian FDG dengan pemerintah nagari membahas tentang tata kelola pendokumentasian di nagari<br /> 3. (2009) Ujicoba SID yang sudah dikembangkan di balerante<br /> 4. (2009-2010) Membangun SID (aplikasi) dibeberapa nagari yang lain: terong (bantul), Nglegi (Gunungkidul) <br /> 5. (2011) Kandangan (Temanggung) Gilangharjo (bantul) Girikarto (gunungkidul) Talun (klaten) Pager Gunung (magelang) <br /> 6. hingga saat ini 2013 sudah banyak nagari pengguna SID.<br /> <br /> <strong>SID sebagai tanggapan atas kebutuhan:</strong><br /> Kalau dulu untuk mencari data penduduk menurut kelompok umur saja kesulitan karena tidak mempunyai databasenya. Dengan adanya SID menjadi lebih mudah.<br /> (Nuryanto, Kabag Pelayanan Pemdes Terong)<br /> <br /> Membangun sebuah sistem bukan hanya membuatkan software dan meninggalkan begitu saja, namun ada upaya untuk memadukan sistem dengan kebutuhan yang ada pada nagari. sehingga software dapat memenuhi kebutuhan yang telah ada bukan memaksakan nagari untuk mengikuti dan berpindah sistem. inilah yang melatari combine melaksanakan alur pengaplikasian software.<br /> 1. Bentuk tim kerja bersama pemerintah nagari<br /> 2. Diskusikan basis data apa saja yang diperlukan untuk warga<br /> 3. Himpun data kependudukan warga dari Kartu Keluarga (KK)<br /> 4. Daftarkan proyek SID dan dapatkan aplikasi softwarenya di http://abcd.lumbungkomunitas.net<br /> 5. Install aplikasi software SID di komputer nagari<br /> 6. Entry data penduduk ke SID<br /> 7. Basis data kependudukan sudah bisa dimanfaatkan<br /> 8. Diskusikan rencana pengembangan SID sesuai kebutuhan nagari<br /> 9. Sebarluaskan informasi nagari melalui beragam media untuk warga<br /> <br /> Pemberdayaan data nagari yang dibangun diharapkan dapat menjunjung kesejahteraan masyarakat nagari, data-data tersebut dapat diperuntukkan untuk riset lebih lanjut tentang kemiskinan, tanggap bencana, sumberdaya nagari yang bisa diekspose keluar dan dengan menghubungkan dari nagari ke nagari dapat mencontohkan banyak hal dalam keberhasilan pemberdayaannya.<br /> (sumber: Buku Sistem Informasi nagari) <br /> <strong><br /></strong></p>","1","2013-03-31 21:30:40","999","1","Awal mula SID","0","","","","","","","3");
INSERT INTO artikel VALUES("32","","<div class=\"contentText\">\n<div align=\"justify\">Bagian ini berisi informasi dasar mengenai nagari kami. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\n<div align=\"justify\">&nbsp;</div>\n<div align=\"justify\"><ol>\n<li><a href=\"99\">Sejarah Nagari</a></li>\n<li><a href=\"98\">Profil Wilayah nagari</a></li>\n</ol></div>\n</div>","1","2013-07-29 18:46:20","999","1","Profil nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("36","","<p>Kontak kami berisi cara menghubungi nagari, seperti contoh berikut :</p>\n<p>Alamat : Jl nagari no 01</p>\n<p>No Telepon : 081xxxxxxxxx</p>\n<p>Email : xx@nagari.com</p>","1","2013-07-29 19:28:07","999","1","Kontak Kami","0","","","","","","","3");
INSERT INTO artikel VALUES("37","","<p><span style=\"color: #ff0000;\"><strong>Contoh (Sila edit halaman ini dan sesuaikan dengan deskripsi untuk nagari ini)!</strong></span><br /><br />Susunan Organisasi Badan Permusyawaratan nagari:</p>\n<p>Ketua</p>\n<p>Sekretaris</p>\n<p>Anggota</p>","1","2013-07-29 19:33:09","999","1","Badan Permusyawaratan nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("38","","<p>Berisi data lembaga yang ada di nagari beserta deskripsi dan susunan pengurusnya</p>","1","2013-07-29 19:38:09","999","1","Lembaga Kemasyarakatan","0","","","","","","","3");
INSERT INTO artikel VALUES("40","","<p>Berisi tentang peraturan yang ada di nagari</p>","1","2013-07-29 20:06:26","1001","1","Peraturan","0","","","","","","","3");
INSERT INTO artikel VALUES("41","","<p>Agenda Bulan Agustus :</p>\n<p>01/08/2013 : Rapat rutin</p>\n<p>04/08/2013 : Pertemuan Pengurus</p>\n<p>05/08/2013 : Seminar</p>\n<p>&nbsp;</p>","1","2013-07-30 15:08:28","1000","1","Agenda","0","","","","","","","3");
INSERT INTO artikel VALUES("42","","<p>Daftar Undang Undang nagari</p>\n<p><a href=\"../../../../../../assets/front/dokumen/Profil_SSN_SMP1Kepil.pdf\">1. UU No nagari</a></p>\n<p>berisi asf basdaf.</p>\n<p>&nbsp;</p>\n<p><a href=\"kebumenkab.go.id/uu.pdf\">2.UU Perdangangan</a></p>","1","2014-04-20 19:21:32","999","1","Undang Undang","0","","","","","","","3");
INSERT INTO artikel VALUES("43","","<p>Isi Peraturan Pemerintah</p>","1","2014-04-20 19:23:37","999","1","Peraturan Pemerintah","0","","","","","","","3");
INSERT INTO artikel VALUES("44","","<p>Isi Peraturan nagari</p>","1","2014-04-20 19:24:11","999","1","Peraturan nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("45","","<p>Isi Peraturan Kepala nagari</p>","1","2014-04-20 19:24:40","999","1","Peraturan Kepala nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("46","","<p>Isi Keputusan kepala nagari</p>","1","2014-04-20 19:25:12","999","1","Keputusan Kepala nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("47","","<p>Isi Panduan</p>","1","2014-04-20 19:37:46","999","1","Panduan","0","","","","","","","3");
INSERT INTO artikel VALUES("51","","<p>Wahai masyarakat yang ber,,,,,,,,,,,,,,,,,,,,</p>\n<p>no hp : 097867575</p>\n<p>email: jkgkgkg</p>\n<p>ato komentar di bawah ini :</p>","1","2014-04-22 11:10:56","999","1","Pengaduan","0","","","","","","","3");
INSERT INTO artikel VALUES("55","","           <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d54610.20051137193!2d100.59773316455606!3d-0.22940957514176655!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2fd54c3c6f83a013%3A0x4039d80b2210dd0!2sPayakumbuh%2C+Kota+Payakumbuh%2C+Sumatera+Barat!5e1!3m2!1sid!2sid!4v1479280530804\" width=\"100%\" height=\"100%\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>          ","1","2014-04-30 11:34:04","1003","1","Peta nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("62","","<p>Lembaga Kemasyarakatan nagari (LKMD) adalah salah satu lembaga kemasyaratan yang berada di nagari.</p>\n<p>TUGAS LKMD</p>\n<ol>\n<li>menyusun rencana pembangunan secara partisipatif,</li>\n<li>menggerakkan swadaya gotong royong masyarakat,</li>\n<li>melaksanakan dan</li>\n<li>mengendalikan pembangunan.</li>\n</ol>\n<p align=\"left\">FUNGSI LKMD</p>\n<ol>\n<li>penampungan dan penyaluran aspirasi masyarakat dalam pembangunan;</li>\n<li>penanaman dan pemupukan rasa persatuan dan kesatuan masyarakat dalam kerangka memperkokoh Negara Kesatuan Republik Indonesia;</li>\n<li>peningkatan kualitas dan percepatan pelayanan pemerintah kepada masyarakat;</li>\n<li>penyusunan rencana, pelaksanaan, pelestarian dan pengembangan hasil-hasil pembangunan secara partisipatif;</li>\n<li>penumbuhkembangan dan penggerak prakarsa, partisipasi, serta swadaya gotong royong masyarakat; dan</li>\n<li>penggali, pendayagunaan dan pengembangan potensi sumber daya alam serta keserasian lingkungan hidup.</li>\n</ol>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan nagari &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>","1","2014-04-30 19:38:43","999","1","LKMD","0","","","","","","","3");
INSERT INTO artikel VALUES("63","","<p>TUGAS PKK</p>\n<ol>\n<li>menyusun rencana kerja PKK nagari/Kelurahan, sesuai dengan basil Rakerda Kabupaten/Kota;</li>\n<li>melaksanakan kegiatan sesuai jadwal yang disepakati;</li>\n<li>menyuluh dan menggerakkan kelompok-kelompok PKK jorong/Lingkungan, RW, RT dan dasa wisma agar dapat mewujudkan kegiatan-kegiatan yang telah disusun dan disepakati;</li>\n<li>menggali, menggerakan dan mengembangkan potensi masyarakat, khususnya keluarga untuk meningkatkan kesejahteraan keluarga sesuai dengan kebijaksanaan yang telah ditetapkan;</li>\n<li>melaksanakan kegiatan penyuluhan kepada keluarga-keluarga yang mencakup kegiatan bimbingan dan motivasi dalam upaya mencapai keluarga sejahtera;.</li>\n<li>mengadakan pembinaan dan bimbingan mengenai pelaksanaan program kerja;</li>\n<li>berpartisipasi dalam pelaksanaan program instansi yang berkaitan dengan kesejahteraan keluarga di nagari/kelurahan;</li>\n<li>membuat laporan basil kegiatan kepada Tim Penggerak PKK Kecamatan dengan tembusan kepada Ketua Dewan Penyantun Tim Penggerak PKK setempat;</li>\n<li>melaksanakan tertib administrasi; dan</li>\n<li>mengadakan konsultasi dengan Ketua Dewan Penyantun Tim Penggerak PKK setempat.</li>\n</ol>\n<p>&nbsp;</p>\n<p>FUNGSI PKK</p>\n<ol>\n<li>penyuluh, motivator dan penggerak masyarakat agar mau dan mampu melaksanakan program PKK; dan</li>\n<li>fasilitator, perencana, pelaksana, pengendali, pembina dan pembimbing Gerakan PKK.</li>\n</ol>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan nagari &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"center\"><strong>Alamatn</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"center\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"180\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"241\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>","2","2014-04-30 19:40:49","999","1","PKK","0","","","","","","","3");
INSERT INTO artikel VALUES("64","","<p align=\"left\">TUGAS &nbsp;KARANGTARUNA</p>\n<p align=\"left\">menanggulangi berbagai masalah kesejahteraan sosial terutama yang dihadapi generasi muda, baik yang bersifat preventif, rehabilitatif, maupun pengembangan potensi generasi muda di lingkungannya</p>\n<p align=\"left\">FUNGSI KARANGTAURNA</p>\n<ol>\n<li>penyelenggara usaha kesejahteraan sosial;</li>\n<li>penyelenggara pendidikan dan pelatihan bagi masyarakat;</li>\n<li>penyelenggara pemberdayaan masyarakat terutama generasi muda di lingkungannya secara komprehensif, terpadu dan terarah serta berkesinambungan;</li>\n<li>penyelenggara kegiatan pengembangan jiwa kewirausahaan bagi generasi muda di lingkungannya;</li>\n<li>penanaman pengertian, memupuk dan meningkatkan kesadaran tanggung jawab sosial generasi muda;</li>\n<li>penumbuhan dan pengembangan semangat kebersamaan, jiwa kekeluargaan, kesetiakawanan sosial dan memperkuat nilai-nilai kearifan dalam bingkai Negara Kesatuan Republik Indonesia;</li>\n</ol>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan nagari &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>","1","2014-04-30 19:44:04","999","1","Karang Taruna","0","","","","","","","3");
INSERT INTO artikel VALUES("65","","<p align=\"left\">TUGAS RT/RW</p>\n<p align=\"left\">membantu Pemerintah nagari dan Lurah dalam penyelenggaraan urusan pemerintahan</p>\n<p align=\"left\">FUNGSI PKK</p>\n<ol>\n<li>pendataan kependudukan dan pelayanan administrasi pemerintahan lainnya;</li>\n<li>pemeliharaan keamanan, ketertiban dan kerukunan hidup antar warga;</li>\n<li>pembuatan gagasan dalam pelaksanaan pembangunan dengan mengembangkan aspirasi dan swadaya murni masyarakat; dan</li>\n<li>penggerak swadaya gotong royong dan partisipasi masyarakat di wilayahnya.</li>\n</ol>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan nagari &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\"><strong>Nama Pejabat</strong></p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">Ketua RW 1</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">Ketua RW 1 Rt 01</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">Ketua RW 1 Rt 02</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"186\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"204\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"193\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>","1","2014-04-30 19:44:55","999","1","RT RW","0","","","","","","","3");
INSERT INTO artikel VALUES("66","","<p class=\"Default\">&nbsp;</p>\n<p class=\"Default\">Tim Koordinasi Percepatan Penanggulangan Kemiskinan nagari yang selanjutnya disingkat TKP2KDes adalah wadah koordinasi lintas sektor dan lintas pemangku kepentingan untuk percepatan penanggulangan kemiskinan di nagari.</p>\n<p class=\"Default\">TKP2KDes bertugas mengkoordinasikan perencanaan, pengorganisasian, pelaksanaan dan pengendalian program penanggulangan kemiskinan di tingkat nagari.</p>\n<p>( Perda Kabupaten Kebumen Nomor 20 Tahun 2012 Tentang Percepatan Penanggulangan Kemiskinan )</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip; Nomor : &hellip;&hellip;tanggal &hellip;&hellip;.. bulan&hellip;.. tentang &hellip;..</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>","2","2014-04-30 19:45:37","999","1","TKP2KDes","0","","","","","","","3");
INSERT INTO artikel VALUES("67","","<p class=\"Default\">&nbsp;</p>\n<p class=\"Default\">Kelompok Perlindungan Anak nagari atau Kelurahan yang selanjutnya disingkat KPAD atau KPAK adalah lembaga perlindungan anak berbasis masyarakat yang berkedudukan dan melakukan kerja&ndash;kerja perlindungan anak di wilayah nagari atau kelurahan tempat anak bertempat tinggal&nbsp;&nbsp;&nbsp;&nbsp; ( Perda Kaupaten Kebumen No 3 Tahun 2013 Tentang Penyelenggaraan Perlindungan Anak&nbsp; )</p>\n<p>TUGAS-TUGAS KPAD</p>\n<p>1.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sosialisasi</p>\n<ol>\n<li>Mensosialisasikan kepada masyarakat tentang hak-hak anak</li>\n<li>Mempromosikan CHILD RIGHTS dan CHILD PROTECTION</li>\n<li>Melakukan upaya pencegahan, respon dan penanganan kasus kasus kekerasan terhadap anak dan masalah anak.</li>\n</ol>\n<p>1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mediasi</p>\n<ol>\n<li>Mengedepankan upaya musyawarah dan mufakat (Rembug nagari)&nbsp; dalam menyelesaikan masalah &ndash; (Restorative Justive)</li>\n<li>Melakukan koordinasi dengan pihak terkait di level nagari, kecamatan dan kabupaten dalam upaya perlindungan anak.</li>\n<li>Melakukan pendampingan kasus (dari pelaporan &ndash; medis &ndash; psikologi - reintegrasi)</li>\n</ol>\n<p>1.3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fasilitasi</p>\n<ol>\n<li>Memfasilitasi terbentuknya kelompok anak di nagari sebagai media partisipasi anak</li>\n<li>Memfasilitasi partisipasi anak untuk terlibat dalam penyusunan perencanaan pembangunan yang berbasis hak anak (penyusunan RPJMnagari)</li>\n</ol>\n<p>1.4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dokumentasi</p>\n<ol>\n<li>Mendokumentasikan semua proses yang dilakukan (Kegiatan Promosi; Penanganan Kasus dan mencatat kasus yang dilaporkan; Perkembangan Kasus, Pertemuan,dll)</li>\n</ol>\n<p>1.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advokasi</p>\n<ol>\n<li>Mendorong adanya kebijakan dan penganggaran untuk perlindungan anak di level nagari</li>\n<li>Menerima pengaduan kasus dan konsultasi tentang perlindungan anak</li>\n<li>Berhubungan dengan P2TP2A dan LPA untuk pendampingan hukum kasus anak (korban dan atau pelaku)</li>\n</ol>\n<p class=\"Default\">&nbsp;</p>\n<p class=\"Default\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS &hellip;&hellip;&hellip;&hellip;</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang Penetapan Pengurus Lembaga Kemasyarakatan nagari &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p align=\"left\">&nbsp;</p>\n<p>&nbsp;</p>","2","2014-04-30 19:46:57","999","1","KPAD","0","","","","","","","3");
INSERT INTO artikel VALUES("68","","<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK TERNAK &hellip;..</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang</p>\n<p align=\"center\">&hellip;&hellip;&hellip;&hellip;&hellip;.. &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK WANITA TANI TERNAK&nbsp; &hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. bulan&hellip;..</p>\n<p align=\"center\">tentang &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p>&nbsp;</p>","2","2014-04-30 19:47:34","999","1","Kelompok Ternak","0","","","","","","","3");
INSERT INTO artikel VALUES("69","","<p align=\"center\"><strong>DAFTAR NAMA PENGURUS GAPOKTAN</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. Juni &hellip;.. tentang</p>\n<p align=\"center\">&hellip;&hellip;&hellip;&hellip;&hellip;.. &hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"left\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK TANI &hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. bulan&hellip;..</p>\n<p align=\"center\">tentang &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\">&nbsp;</p>\n<p align=\"center\"><strong>DAFTAR NAMA PENGURUS KELOMPOK TANI &hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>MASA JABATAN &hellip;&hellip;s/d&hellip;&hellip;.</strong></p>\n<p align=\"center\"><strong>nagari &hellip;&hellip;&hellip;&hellip;.. KECAMATAN &hellip;&hellip;&hellip; KABUPATEN &hellip;&hellip;&hellip;..</strong></p>\n<p align=\"center\">Surat Keputusan Kepala nagari &hellip;&hellip;&hellip;&hellip;. Nomor : &hellip;&hellip;&hellip;&hellip;&hellip; tanggal &hellip;&hellip;.. bulan&hellip;..</p>\n<p align=\"center\">tentang &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.</p>\n<p align=\"center\">&nbsp;</p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\"><strong>No</strong></p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"center\"><strong>Jabatan</strong></p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"center\"><strong>Nama Pengurus</strong></p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"center\"><strong>Alamat</strong></p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">1</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">2</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"center\">3</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td valign=\"top\" width=\"55\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"162\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"192\">\n<p align=\"left\">&nbsp;</p>\n</td>\n<td valign=\"top\" width=\"229\">\n<p align=\"left\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>","1","2014-04-30 19:48:15","999","1","Kelompok Tani","0","","","","","","","3");
INSERT INTO artikel VALUES("70","","<p>Linmas</p>","1","2014-04-30 19:52:54","999","1","LinMas","0","","","","","","","3");
INSERT INTO artikel VALUES("71","","<p>Kelompok Ekonomi Lainya</p>","2","2014-04-30 19:53:56","999","1","Kelompok Ekonomi Lainya","0","","","","","","","3");
INSERT INTO artikel VALUES("83","","<p>Tiap hari rapat sampai kumat</p>","1","2014-11-06 18:17:28","1000","1","Rapat Lagi","0","","","","","","","3");
INSERT INTO artikel VALUES("84","Penguins.jpg","<p style=\"text-align: justify;\">1. Pada komputer/PC server, buka web-browser (direkomendasikan <span style=\"text-decoration: underline;\">Mozilla Firefox</span> atau <span style=\"text-decoration: underline;\">Chrome</span>)</p>\n<p style=\"text-align: justify; padding-left: 30px;\">Ketik:<span style=\"color: #0000ff;\"> localhot/phpmyadmin</span></p>\n<p>2. Muncul halaman <span style=\"text-decoration: underline;\">PHPMyAdmin</span>. Periksa kolom kiri.</p>\n<p style=\"padding-left: 30px;\">Klik/Pilih: &ldquo;sid&rdquo;</p>\n<p>3. Muncul halaman yang menampilkan deretan isi tabel &ldquo;<span style=\"text-decoration: underline;\">sid</span>&ldquo;.</p>\n<p style=\"padding-left: 30px;\">Klik/Pilih: &ldquo;Export&rdquo; pada bagian menu atas di kolom kanan</p>\n<p>4. Muncul halaman <span style=\"text-decoration: underline;\">Export</span>. Kolom isian yang ada tak perlu diubah. Lihat bagian kanan bawah.</p>\n<p style=\"padding-left: 30px;\">Klik: &ldquo;Go&rdquo;</p>\n<p>5. Muncul jendela pilihan lokasi untuk menyimpan file database.</p>\n<p style=\"padding-left: 30px;\">Klik: &ldquo;Save&rdquo;<br /> Klik: &ldquo;OK&rdquo;</p>\n<p>6. File database SID 3.0 akan tersimpan otomatis di folder Download (tergantung setting komputer masing-masing). File tersimpan dalam sebagai &ldquo;sid.sql&rdquo;</p>\n<p>7. Simpan/amankan file &ldquo;sid.sql&rdquo; di media lain: Hard-disk eksternal, CD, <em>online storage</em>, dan sebagainya.</p>\n<p>8. Lakukan proses <em>back-up</em> database ini secara berkala.</p>\n<p>.<br /> Selamat mencoba!</p>","1","2014-11-06 18:25:10","1004","1","Panduan Back-Up Data (Export Database) SID 3.0","0","","","","","","","3");
INSERT INTO artikel VALUES("85","1471927406download (1).jpg","<div class=\"contentText\">\n<div align=\"justify\">Bagian ini berisi informasi mengenai Pemerintahan nagari. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\n<div align=\"justify\">&nbsp;</div>\n<ol>\n<li>Visi dan Misi</li>\n<li>Pemerintah nagari</li>\n<li>Badan Permusyawaratan Nagari</li>\n</ol>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<br />\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n</div>","1","2014-11-07 10:53:30","999","1","Pemerintahan Nagari","0","","","","","","","3");
INSERT INTO artikel VALUES("86","","","1","2014-12-10 14:59:58","1006","1","","0","","","","","","","3");
INSERT INTO artikel VALUES("87","","<p>bla bla bla</p>","1","2014-12-10 16:58:56","16","1","Sejumlah Tukang Becak Merampok Indoapril","0","","","","ddd.xls","hahaha","","3");
INSERT INTO artikel VALUES("90","1471968200IMG-20160823-WA0007.jpg","","1","2016-08-24 01:02:57","5","1","PERDES PHBS ","3","1471968200IMG-20160823-WA0012.jpg","1471968200","1471968200","PERDES PHBS.docx","PERDES PHBS ","","3");
INSERT INTO artikel VALUES("92","1472006396","<p><strong>Susunan Organisasi Pemerintah nagari JORONG A</strong><br /><br />Kepala nagari: MUHAMMAD ILHAM<br />Sekretaris nagari:&nbsp;<span>MUSTAHIQ, S.Adm</span><br />Kepala Urusan Pemerintahan: SYAFRUDIN<br />Kepala Urusan&nbsp;Pembangunan: SYAFI\'I, SE<br />Kepala Urusan&nbsp;Kesra: HAMIDIAH<br />Kepala Urusan&nbsp;Keuangan: MARDIANA<br />Kepala Urusan&nbsp;Trantib: SUPARDI RUSTAM<br />Kepala Urusan&nbsp;Umum: MAHRUP<br /><br /></p>","1","2016-08-24 11:39:32","999","1","Pemerintah nagari","0","1472006396","1472006396","1472006396","","","","3");
INSERT INTO artikel VALUES("93","1472006908","<p style=\"text-align: center;\"><strong>VISI dan MISI</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><strong>VISI</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><strong>\"JORONG A Berseri\"</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><strong>(Bersih, Relegius, Sejahtera, Rapi, dan Indah)</strong></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><strong>\"Terwujudnya masyarakat nagari JORONG A yang Bersih, Relegius, Sejahtera, Rapi dan Indah melalui Akselerasi Pembangunan yang berbasis Keagamaan, Budaya Hukum dan Berwawasan Lingkungan dengan berorentasi pada peningkatan Kinerja Aparatur dan Pemberdayaan Masyarakat\"</strong></p>\n<p>&nbsp;&nbsp;</p>\n<p><strong>MISI</strong></p>\n<p><strong>Misi dan Program nagari JORONG A</strong></p>\n<p>Dan untuk melaksanakan visi nagari JORONG A dilaksanakan misi dan program sebagai berikut:</p>\n<p>1. Pembangunan Jangka Panjang</p>\n<p>&nbsp; &nbsp; - Melanjutkan pembangunan nagari yang belum terlaksana.</p>\n<p>&nbsp; &nbsp; - Meningkatkan kerjasama antara pemerintah nagari dengan lembaga nagari yang ada.</p>\n<p>&nbsp; &nbsp; - Meningkatkan kesejahtraan masyarakat nagari dengan meningkatkan sarana dan prasarana ekonomi warga.&nbsp;</p>\n<p>&nbsp;</p>\n<p>2. Pembangunan Jangka Pendek &nbsp;</p>\n<p>&nbsp; &nbsp; - Mengembangkan dan Menjaga serta melestarikan ada istiadat nagari terutama yang telah mengakar di nagari JORONG A.&nbsp;</p>\n<p>&nbsp; &nbsp; - Meningkatkan pelayanan dalam bidang pemerintahan kepada warga masyarakat&nbsp;</p>\n<p>&nbsp; &nbsp; - Meningkatkan sarana dan prasarana ekonomi warga nagari dengan perbaikan prasarana dan sarana ekonomi.</p>\n<p>&nbsp; &nbsp; - Meningkatkan sarana dan prasarana pendidikan guna peningkatan sumber daya manusia nagari JORONG A.&nbsp;</p>","1","2016-08-24 11:48:04","999","1","Visi dan Misi","0","1472006908","1472006908","1472006908","","","","3");
INSERT INTO artikel VALUES("97","1472019299","<p>Halaman ini berisi tautan menuju informasi mengenai Basis Data nagari. Ada dua jenis data yang dimuat dalam sistem ini, yakni basis data kependudukan dan basis data sumber daya nagari. Sila klik pada tautan berikut untuk mendapatkan tampilan data statistik per kategori.</p>\n<ol>\n<li>Data Wilayah Administratif&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Pendidikan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Pekerjaan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Golongan Darah&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Agama&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Jenis Kelamin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Kelompok Umur&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Penerima Raskin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li>Data Penerima BPJS &nbsp; &nbsp; &nbsp; &nbsp;</li>\n<li>Data Warga Negara &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;</li>\n</ol>\n<p>Data yang tampil adalah statistik yang didapatkan dari proses olah data dasar yang dilakukan secara&nbsp;<em>offline</em>&nbsp;di kantor nagari secara rutin/harian. Data dasar di kantor nagari diunggah ke dalam sistem&nbsp;<em>online</em>&nbsp;di website ini secara berkala. Sila hubungi kontak pemerintah nagari untuk mendapatkan data dan informasi nagari termutakhir.</p>","1","2016-08-24 15:14:35","999","1","Data nagari","0","1472019299","1472019299","1472019299","","","","3");
INSERT INTO artikel VALUES("98","1483587842peta.jpg","<p>Wilayah Nagari berisi tentang penjelasan dan deskripsi letak wilayah nagari. contohnya sebagai berikut :<br />Batas-batas :<br />Utara&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <br />Timur &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: <br />Selatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <br />Barat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <br />Luas Wilayah Nagari Penglatan&nbsp;&nbsp; : &nbsp; &nbsp; &nbsp; Ha<br />Letak Dan Batas Nagari&nbsp; terletak pada posisi 00. 0.00 LS 0. 0.0 BT, dengan ketinggian kurang lebih 000 M diatas permukaan laut.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>","1","2016-08-26 15:27:50","999","1","Wilayah nagari","0","1472192894","1472192894","1472192894","","","","3");
INSERT INTO artikel VALUES("99","1472228892Raja Lombok 1902.jpg","<p>Sejarah nagari .... </p>","1","2016-08-26 16:37:45","999","1","Sejarah nagari","3","1472229325490125_20121123041539.jpg","1472197089","1472197089","","","","3");
INSERT INTO artikel VALUES("101","","layanan_mandiri.php","1","2016-09-26 07:12:03","1003","0","Layanan Mandiri","0","","","","","","1","1");
INSERT INTO artikel VALUES("102","","agenda.php","1","2016-09-26 07:12:03","1003","0","Agenda","0","","","","","","2","1");
INSERT INTO artikel VALUES("103","","galeri.php","1","2016-09-26 07:12:03","1003","0","Galeri","0","","","","","","3","1");
INSERT INTO artikel VALUES("104","","statistik.php","1","2016-09-26 07:12:03","1003","0","Statistik","0","","","","","","4","1");
INSERT INTO artikel VALUES("105","","komentar.php","1","2016-09-26 07:12:03","1003","0","Komentar","0","","","","","","5","1");
INSERT INTO artikel VALUES("106","","media_sosial.php","1","2016-09-26 07:12:03","1003","0","Media Sosial","0","","","","","","6","1");
INSERT INTO artikel VALUES("107","","peta_lokasi_kantor.php","1","2016-09-26 07:12:03","1003","0","Peta Lokasi Kantor","0","","","","","","7","1");
INSERT INTO artikel VALUES("108","","statistik_pengunjung.php","1","2016-09-26 07:12:03","1003","0","Statistik Pengunjung","0","","","","","","8","1");
INSERT INTO artikel VALUES("109","","arsip_artikel.php","1","2016-09-26 07:12:03","1003","0","Arsip Artikel","0","","","","","","9","1");
INSERT INTO artikel VALUES("110","1479781242","<p>Ini adalah Profil Nagari</p>","1","2016-11-22 09:20:18","999","1","Profil Nagari","0","1479781242","1479781242","1479781242","","","","3");
INSERT INTO artikel VALUES("119","1483663633lima-puluh kembali tunjukkan prestasi.jpg","<p>Bupati Limapuluh Kota Irfendi Arbi kembali menunjukan prestasinya. Kali ini putera Koto Tangah Simalanggang itu sukses mendapat penghargaan dari Menteri Keuangan Sri Mulyani Indrawati atas keberhasilan Pemkab Limapuluh Kota menyusun dan menyajikan laporan keuangan tahun 2015 dengan capaian standar tertinggi dalam akuntansi dan laporan keunagan pemerintah.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Penghargaan bergengsi itu diserahkan Kakanwil Ditjen Pembendaharaan Propinsi Sumbar Drs. Supriyo, S.Ip, MH kepada Irfendi Arbi di eks kantor bupati di Payakumbuh didampingi Kepala KPPN Bukittinggi Iwan Hanapi dan Kepala Kantor Pelayanan Pajak Payakumbuh Suprapto, Rabu (14/12).</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pemkab Limapuluh Kota di bawah pimpinan Irfendi dinilai berhasil dan bisa merebut penghargaan itu karena, laporan keungan pemerintah daerahnya suda mendapatkan WTP, kinerja kesehatan fiscal dan pengelolaan keuangan daerahnya bagus</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &ldquo;Penghargaan dari Menteri Keuangan ini bisa didapatkan karena Laporan keungan Pemkab Limapuluh Kota&nbsp; sudah WTP, kinerja kesehatan fiscal dan pengelolaan keuangan daerahnya juga bagus,&rdquo; ungkap Supriyo.</p>\n<p>&nbsp;Dengan begitu, lanjut Supriyo, daerah ini juga berhak mendapatkan Dana Insentif Daerah (DID) yang besar di atas Rp49 milyar pada tahun 2017, di samping itu juga penghargaan dari Pemerintah RI terkait dengan WTP.</p>\n<p>&nbsp;Supriyo berharap WTP dan kinerja kesehatan fiscal, kemampuan daerah, pelayanan publik dan pelayanan dasar publik, kinerja ekonomi dan kesejahteraan tetap dipertahankan agar tetap bagus. Penilaian kesehatan fiskal tersebut yang terdiri dari 11 pariabel, pelayanan dasar sebanyak 7 pariabel. Berikutnya,&nbsp; ekonomi dan kesejahteraan termasuk pertumbuhan ekonomi, pengurangan kemiskinan, pengurangan pengangguran dan pengendalian inflasi.</p>\n<p>&nbsp;&ldquo;Ke depan, kita mengharapkan disamping mempertahankan WTP, Pemkab Limapuluh Kota juga mempertahankan kinerja kesehatan fiskal, kemampuan daerah, pelayanan publik dan pelayanan dasar publik, kinerja ekonomi dan kesejahteraa. Dengan begitu diharap daerah mendapatkan apresiasi dari pemerintah berupa dana insentif daerah,&rdquo; tutur Supriyo.</p>\n<p>&nbsp;Diakuinya, Limapuluh Kota termasuk daerah yang hebat. Tak heran, berhasil merebut berbagai prestasi tingkat nasional.</p>\n<p>&nbsp;&ldquo;Menurut saya, Pemkab Limapuluh Kota termasuk hebat. Mudah-mudahan kebolehan itu bisa dipertahankan dan ditingkatkan di masa mendatang,&rdquo; ujar Supriyo.</p>\n<p>&nbsp;Bupati Irfendi yang dimintai komentarnya mengaku gembira mendapatkan penghargaan tersebut. Menurutnya, ini merupakan keberhasilan Aparatur Sipil Negara (ASN) Pemkab Limapuluh Kota.</p>\n<p>&nbsp;&ldquo;Ini keberhasilan ASN Limapuluh Kota dalam menyusun dan menyajikan laporan keuangan dengan capaian standar tertinggi dalam akuntansi dan pelaporan keuangan pemerintah,&rdquo; ujar Irfendi.</p>\n<p>Lebih jauh Irfendi berharap, penghargaan itu dapat lebih memotivasi Pemkab Limapuluh Kota untuk meningkatkan kinerjanya ke depan.</p>\n<p>&nbsp;&ldquo;Kita berharap ini menjadi salahsatu pemicu bagi kita untuk lebih meningkatkan kinerja termasuk laporan keuangan,&rdquo; ujarnya.</p>\n<p>&nbsp; Selain sukses dinilai berhasil menyusun dan menyajikan laporan keuangan tahun 2015 dengan capaian standar tertinggi dalam akuntansi dan laporan keunagan pemerintah, sebelumnya Bupati Irfendi Arbi juga meraih Penghargaan Produktivitas Siiddhakarya tahun 2016, serta merebut penghargaan&lsquo;National Procurement Award 2016&rsquo; dengan Kategori Penerapan Standar Layanan Pengadaan Secara Elektronik (LPSE) dari Lembaga Kebijakan Pengadaan Barang/Jasa Pemerintah (LKPP) Republik Indonesia.</p>\n<p>&nbsp;Selain itu juga anugerah Kawastara Pawitra dari Menteri Pendidikan dan Kebudayaan karena dinilai beritegritas dalam penyiapan calon kepala sekolah, serta sejumlah penghargaan lainnya. (gun)</p>","1","2017-01-06 07:46:49","1","1","Kembali Tunjukan Prestasi. Irfendi Raih Penghargaan dari Menteri Keuangan","0","1483663633","1483663633","1483663633","","","","3");
INSERT INTO artikel VALUES("120","1483664167agam-rotasi.jpg","<p style=\"text-align: justify;\">Setelah dilakukan rotasi atau reshuffle di lingkungan Pemerintah Kabupaten Agam, siang tadi, Jum\'at (30/12), Bupati Indra Catri meminta kepada pejabat Pimpinan Tinggi Pratama yang baru agar membentuk \"team work\" (tim kerja) melalui kewenangan untuk mengusulkan jabatan-jabatan yang masih kosong di dalam masing-masing Struktur Organisasi Pemerintah Daerah (SOPD) tersebut.<br /><br />Kemudian tambah bupati, pihaknya juga akan melakukan evaluasi dalam waktu enam bulan terhadap pejabat yang terpilih ini, jika dianggap tidak mampu bermomitmen dan bekerjasama maka akan dilakukan lagi mutasi atau degredasi.<br /><br />\"Apabila di dalam SOPD tersebut masih ada yang kosong atau tidak mampu lagi melaksanakan jabatan secepatnya diusulkan, agar ditindaklanjuti secepatnya karena dalam waktu dua bulan ini kita masih akan melakukan rotasi dan mutasi.<br /><br />\"Maka untuk itulah saya menegaskan kepada pejabat terpilih untuk memimilih bawahannya. Carilah figur yang mempunyai talenta yang baik, santun dalam bertindak serta mau mengikuti aturan termasuk yang patuh mengikuti agenda-agenda daerah, seperti upacara, wirid mingguan di masjid serta olahraga karena hal itu akan mendorong terciptanya kebersamaan dan kekompakan tim kerja,\" terangnya.<br /><br />Terkait tuntutan era modrenisasi dan tekonologi, bupati meminta agar seluruh Kepala SOPD beserta seluruh pejabat struktural untuk meningkatkan kemampuan dalam menggunakan teknologi karena ke depannya, pemerintah melakukan pelayanan melalui sistem elektronik, seperti e-government dan e-voting.</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">Sumber : Bagian Humas Setda Agam</p>\n<div style=\"margin-top: 30px; margin-bottom: 30px; color: #6a6a6a;\"><img style=\"padding-bottom: 2px;\" src=\"http://www.agamkab.go.id/img/mot.gif\" alt=\"\" width=\"8\" height=\"8\" align=\"absmiddle\" border=\"0\" />&nbsp;Disajikan Oleh : Dinas Perhubungan Komunikasi dan Informatika</div>","1","2017-01-06 07:55:44","1","1","Bupati Agam : Rotasi Dilakukan Secara Terbuka dan Independen","0","1483664167","1483664167","1483664167","","","","3");
INSERT INTO artikel VALUES("121","1511844614WhatsApp Image 2017-11-28 at 11.10.21.jpeg","<p>Bupati Limapuluh Kota Irfendi Arbi terus menunjukan kepeduliannya terhadap dunia pendidikan. Tak hanya memanfaatkan sebagian besar dana Badan Amil Zakat (Basnas) dan memprioritaskan dana CSR Bank Nagari buat beasiswa anak dari keluarga&nbsp; tidak mampu, Irfendi juga mengalokasikan APBD untuk pengadaan pakaian sekolah anak panti asuhan.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bantuan seragam tersebut diserahkan Irfendi secara simbolis di Panti Asuhan Mitra di Jorong Batu Nan Limo Nagari Koto Tangah Simalanggang, Kamis (15/12).</p>\n<p>&ldquo;Kita komit dengan dunia pendidikan, termasuk pendidikan bagi anak-anak dari keluarga miskin. Kita berharap bantuan pakaian ini bisa mengurangi beban panti asuhan dan memberikan semangat baru bagi anak-anak,&rdquo; ujar Irfendi usai menyerahkan bantuan pakaian itu.</p>\n<p>Dikatakan, ia tidak mau ada anak usia pendidikan di daerah ini yang putus sekolah karena ketiadaan biaya. Ia juga tidak ingin ada anak pintar yang tidak bisa melanjutkan pendidikannya ke perguruan tinggi karena alas an orang tuanya tidak mampu.</p>\n<p>&ldquo;Kita terus berupaya memberikan perhatian serius terhadap pendidikan anak-anak dari keluarga tidak mampu. Kita berharap tahun-tahun berikutnya bisa mengalokasikan beasiswa yang lebih besar lagi dari Basnas dan bantuan lainnya,&rdquo; ujar Irfendi.</p>\n<p>Sementara itu Kepala Bidang&nbsp; Rehabilitasi Sosial pada Dinas Sosial Kabupaten Limapuluh Kota Akmal, S.Sos kepada wartawan menyebut, bantuan pakaian itu dibagikan kepada 288 anak panti asuhan dengan masing-masingnya mendapatkan 2 pasang. Sebanyak 47 anak diantaranya berada di Panti Asuhan Mitra Batu Nan Limo.</p>\n<p>&ldquo;Pakaian sekolah ini merupakan bantuan sosial bagi anak terlantar yang dianggarkan dari APBD Kabupaten Limapuluh Kota. Kita berharap tahun berikutnya bantuan serupa bisa dialokasikan lebih besar lagi,&rdquo; ujar Akmal.</p>\n<p>Pembina Panti Asuhan Mitra yang juga wakil pimpinan Pondok Pesantren Ma&rsquo;arif As-Sa&rsquo;adiyah Batu Nan Limo Ustat Ade Jazuli Bakar yang dimintai komentarnya, mengaku sangat bersyukur mendapatkan bantuan sosial tersebut. Ia mengapresiasi komitmen Bupati Irfendi Arbi terhadap pendidikan anak-anak terlantar.</p>\n<p>&ldquo;Kami benar-benar berterimakasih mendapatkan bantuan seragam anak-anak ini. Bagi kami, ini merupakan berkah yang sangat diharapkan dan memberikan manfaat besar,&rdquo; aku Ustat Ade.</p>\n<p>Ustat Ade optimis, bantuan pakaian itu akan membangkitkan semangat anak-anak belajar dan berprestasi. Sebab, anak-anak panti ini tidak selalu mendapatkan seragam baru.</p>\n<p>&ldquo;Kami yakin bantuan pakaian baru ini akan menambah semangat anak-anak belajar dan mengejar prestasi,&rdquo; ujar Ustat Ade.</p>\n<p>Selain menyerahkan bantuan seragam anak sekolah, seharian sebelumnya Bupati Irfendi Arbi juga membagikan bantuan sarana usaha tenaga kerja mandiri bagi 20 orang masyarakat Kecamatan Harau di Nagari Gurun. Bantuan peralatan tersebut antara lain berupa mesin jahit border, peralatan perbengkelan, etalase buat jualan dan lainnya.</p>\n<p>&nbsp;Irfendi berharap, bantuan tersebut dapat mengembangkan usaha dan peningkatan perekonomian masyarakat serta mengurangi pengangguran. (gun)</p>","1","2017-01-06 07:57:51","1","1","Komit Dukung Pendidikan Irfendi Bagikan Seragam Bagi Anak Panti Asuhan","3","1483664295","1483664295","1483664295","","","","3");
INSERT INTO artikel VALUES("122","1483664549","<p>Selamat dan Sukses Implementasi Sistem Informasi Kecamatan</p>","2","2017-01-06 08:02:05","22","1","Sistem Informasi Nagari","0","1483664549","1483664549","1483664549","","","","3");
INSERT INTO artikel VALUES("123","1483664747","<p><strong>Tema</strong>:</p>\n<div class=\"isiagenda\">Peringantan Hari Bela Negara SUmatera Barat</div>\n<p><br /><strong>Tanggal</strong> : 19 Desember 2016 s/d 19 Desember 2016<br /><strong>Tempat</strong> : Padang, Sumatera Barat<br /><strong>Pukul</strong> : 07.00</p>","1","2017-01-06 08:05:23","4","1","BUPATI - Peringantan Hari Bela Negara","0","1483664747","1483664747","1483664747","","","","3");
INSERT INTO artikel VALUES("124","1483664826","<p><strong>Tema</strong>:</p>\n<div class=\"isiagenda\">Musyda IV Majelis Ulama Indonesia (MUI)</div>\n<p><br /><strong>Tanggal</strong> : 18 Desember 2016 s/d 18 Desember 2016<br /><strong>Tempat</strong> : Aula IPHI Tanjung Pati<br /><strong>Pukul</strong> : 09.00</p>","1","2017-01-06 08:06:42","4","1","BUPATI - Musyda IV Majelis Ulama Indonesia (MUI)","0","1483664826","1483664826","1483664826","","","","3");
INSERT INTO artikel VALUES("125","1483664887","<p style=\"padding-left: 21px; font-size: 11px; font-weight: bold;\">Upacara Hari Amal Bhakti Ke-71 Kementerian Agam Kab. Agam</p>\n<p style=\"padding-left: 21px; padding-top: 2px; color: #515151;\">Tempat : Halaman Kantor Bupati Agam</p>\n<p style=\"padding-left: 21px; padding-top: 2px; margin-bottom: 10px; color: #717171;\">Keterangan : Irup: Bupati Acc Tgl:14/12/16</p>","1","2017-01-06 08:07:43","4","1","Jadwal Kegiatan Bupati/Wakil Bupati","0","1483664887","1483664887","1483664887","","","","3");
INSERT INTO artikel VALUES("126","1485663008","<p style=\"text-align: justify;\"><span style=\"color: #ff0000;\"><strong>Contoh (Sila edit halaman ini sesuai dengan deskripsi nagari ini)!</strong></span></p>\n<p style=\"text-align: justify;\">Berdasarkan data nagari pada bulan Februari 2016, jumlah penduduk Nagari ..... sebanyak ..... orang. Jumlah Kepala Keluarga (KK) sebanyak ...... KK.</p>\n<p style=\"text-align: justify;\">Jumlah penduduk Nagari ...... usia produktif pada tahun 2016 adalah ...... orang. Jumlah angkatan kerja tersebut jika dilihat berdasarkan tingkat pendidikannya adalah sebagai berikut:</p>\n<table style=\"width: 100%;\" border=\"1\" cellspacing=\"0\" cellpadding=\"4\">\n<tbody>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\"><strong>No.</strong></p>\n</td>\n<td style=\"width: 42%;\">\n<p style=\"text-align: center;\"><strong>Angkatan Kerja</strong></p>\n</td>\n<td style=\"width: 17%;\">\n<p style=\"text-align: center;\"><strong>L</strong></p>\n</td>\n<td style=\"width: 18%;\">\n<p style=\"text-align: center;\"><strong>P</strong></p>\n</td>\n<td style=\"width: 15%;\">\n<p style=\"text-align: center;\"><strong>Jumlah</strong></p>\n</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\">1</p>\n</td>\n<td style=\"width: 42%;\">Tidak Tamat SD</td>\n<td style=\"width: 17%;\">&nbsp;</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\">2</p>\n</td>\n<td style=\"width: 42%;\">SD</td>\n<td style=\"width: 17%;\">&nbsp;</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\">3</p>\n</td>\n<td style=\"width: 42%;\">SLTP</td>\n<td style=\"width: 17%;\">&nbsp;</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\">4</p>\n</td>\n<td style=\"width: 42%;\">SLTA</td>\n<td style=\"width: 17%;\">&nbsp;</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\">5</p>\n</td>\n<td style=\"width: 42%;\">Akademi</td>\n<td style=\"width: 17%;\">&nbsp;</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 8%;\">\n<p style=\"text-align: center;\">6</p>\n</td>\n<td style=\"width: 42%;\">Perguruan Tinggi</td>\n<td style=\"width: 17%;\">\n<p style=\"text-align: center;\">&nbsp;</p>\n</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n<tr valign=\"top\">\n<td style=\"width: 50%;\" colspan=\"2\">\n<p style=\"text-align: center;\">Jumlah Total</p>\n</td>\n<td style=\"width: 17%;\">&nbsp;</td>\n<td style=\"width: 18%;\">&nbsp;</td>\n<td style=\"width: 15%;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\"><strong>Profil sosial masyarakat</strong></p>\n<p>......................................</p>\n<p>......................................</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\"><strong>Profil politik masyarakat</strong></p>\n<p>............................</p>\n<p>............................</p>","1","2017-01-29 11:09:44","999","1","Profil Masyarakat Nagari","0","1485663008","1485663008","1485663008","","","","3");
INSERT INTO artikel VALUES("127","1485663623","<ol>\n<li><strong>a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Jumlah Penduduk</strong></li>\n</ol>\n<p>&nbsp;</p>\n<table style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah jiwa</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah laki-laki</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah perempuan</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah Kepala Keluarga</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">KK</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<ol>\n<li><strong>b.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Tingkat Pendidikan</strong></li>\n</ol>\n<table style=\"width: 373px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Belum sekolah</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Usia 7-45 tahun tidak pernah sekolah</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pernah sekolah SD tetapi tidak tamat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">&nbsp;</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pendidikan terakhir</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Tamat SD/sederajat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">SLTP/sederajat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">SLTA/sederajat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">D-1</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">D-2</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">D-3</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">S-1</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">S-2</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">S-3</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<ol>\n<li><strong>c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Mata Pencaharian</strong></li>\n</ol>\n<p><strong>&nbsp;</strong></p>\n<table style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Petani</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Buruh tani</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Buruh/swasta</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pegawai Negeri</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pengrajin</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pedagang</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Peternak</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Nelayan</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Montir</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Dokter</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">POLRI/ABRI</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pensiunan</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Perangkat nagari</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pembuat Bata</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p><strong>&nbsp;</strong></p>\n<ol>\n<li><strong>d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>AGAMA</strong></li>\n</ol>\n<table style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Islam</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Kristen</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Katholik</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Hindu</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Budha</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>","1","2017-01-29 11:19:59","999","1","Profil Potensi Nagari","0","1485663623","1485663623","1485663623","","","","3");
INSERT INTO artikel VALUES("128","1486180329IMG_20161103_174035.jpg","<p>Penyerahan Dana Anak Yatim Fakultas Ekonomi</p>","1","2017-02-04 10:51:47","999","1","PRESTASI NAGARI","0","1486180329","1486180329","1486180329","","","","3");
INSERT INTO artikel VALUES("129","1486180848IMG_20161116_134713.jpg","<p>Sungai Beringin Terkenal dengan produk unggulan pertanian terutama Padi</p>","1","2017-02-04 11:00:25","999","1","Produk Unggulan","0","1486180848","1486180848","1486180848","","","","3");
INSERT INTO artikel VALUES("130","1486181408","<p>08126797586</p>","1","2017-02-04 11:09:44","999","1","Kontak Wali Nagari:","0","1486181408","1486181408","1486181408","","","","3");
INSERT INTO artikel VALUES("131","1511838995","<ol>\n<li>Izin satu</li>\n<li>Izin dua</li>\n</ol>","1","2017-11-28 10:16:11","6","1","Standar Pelayanan Perizinan Dan Non Perizinan Lingkup Pelayanan Administrasi Terpadu Kecamatan Di Ka","0","1511838995","1511838995","1511838995","","","","3");
INSERT INTO artikel VALUES("132","1511844058WhatsApp Image 2017-11-28 at 11.10.21.jpeg","","1","2017-11-28 11:22:03","1","1","Camat Harau dan Sekcam","3","1511844102WhatsApp Image 2017-11-28 at 11.34.13.jpeg","1511842944WhatsApp Image 2017-11-28 at 11.19.56.jpeg","1511842944","","","","3");
INSERT INTO artikel VALUES("133","1512199069coconut_tree.png","","1","2017-12-02 14:17:25","20","1","Camat Harau dan Sekcam","0","1512199069","1512199069","1512199069","","","","3");



DROP TABLE config;

CREATE TABLE `config` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama_nagari` varchar(100) NOT NULL,
  `kode_nagari` varchar(100) NOT NULL,
  `nama_kepala_nagari` varchar(100) NOT NULL,
  `nip_kepala_nagari` varchar(100) NOT NULL,
  `kode_pos` varchar(6) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_kepala_camat` varchar(100) NOT NULL,
  `nip_kepala_camat` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_propinsi` varchar(100) NOT NULL,
  `kode_propinsi` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `zoom` tinyint(4) NOT NULL,
  `map_tipe` varchar(20) NOT NULL,
  `path` text NOT NULL,
  `alamat_kantor` varchar(200) DEFAULT NULL,
  `g_analytic` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO config VALUES("1","Harau","05","Deki Yusman, S.STP","--","83355","Harau","-","Deki Yusman, S.STP","-","Lima Puluh Kota","01","Sumatera Barat","52","lima.png","-8.488005310891758","116.0406072534065","19","hybrid","(-7.8312189550359586, 110.2565517439507);(-7.8676102927000695, 110.25380516191944);(-7.843803235881495, 110.29843711992726);(-7.831899196157655, 110.36504173418507);(-7.8169336350355465, 110.32933616777882);(-7.8169336350355465, 110.29775047441944);","","gsgsdgsdgsg");



DROP TABLE data_persil;

CREATE TABLE `data_persil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` decimal(16,0) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `persil_jenis_id` int(11) NOT NULL,
  `id_clusternagari` int(11) NOT NULL,
  `luas` int(11) DEFAULT NULL,
  `no_sppt_pbb` int(11) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `persil_peruntukan_id` int(11) NOT NULL,
  `alamat_ext` varchar(100) DEFAULT NULL,
  `userID` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE data_persil_jenis;

CREATE TABLE `data_persil_jenis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `ndesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE data_persil_peruntukan;

CREATE TABLE `data_persil_peruntukan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `ndesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE data_surat;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_surat` AS select `u`.`id` AS `id`,`u`.`nama` AS `nama`,`x`.`nama` AS `sex`,`u`.`tempatlahir` AS `tempatlahir`,`u`.`tanggallahir` AS `tanggallahir`,(select (date_format(from_days((to_days(now()) - to_days(`tweb_penduduk`.`tanggallahir`))),'%Y') + 0) AS `(date_format(from_days((to_days(now()) - to_days(``tweb_penduduk``.``tanggallahir``))),'%Y') + 0)` from `tweb_penduduk` where (`tweb_penduduk`.`id` = `u`.`id`)) AS `umur`,`w`.`nama` AS `status_kawin`,`f`.`nama` AS `warganegara`,`a`.`nama` AS `agama`,`d`.`nama` AS `pendidikan`,`j`.`nama` AS `pekerjaan`,`u`.`nik` AS `nik`,`c`.`rt` AS `rt`,`c`.`rw` AS `rw`,`c`.`jorong` AS `jorong`,`k`.`no_kk` AS `no_kk`,(select `tweb_penduduk`.`nama` AS `nama` from `tweb_penduduk` where (`tweb_penduduk`.`id` = `k`.`nik_kepala`)) AS `kepala_kk` from ((((((((`tweb_penduduk` `u` left join `tweb_penduduk_sex` `x` on((`u`.`sex` = `x`.`id`))) left join `tweb_penduduk_kawin` `w` on((`u`.`status_kawin` = `w`.`id`))) left join `tweb_penduduk_agama` `a` on((`u`.`agama_id` = `a`.`id`))) left join `tweb_penduduk_pendidikan_kk` `d` on((`u`.`pendidikan_kk_id` = `d`.`id`))) left join `tweb_penduduk_pekerjaan` `j` on((`u`.`pekerjaan_id` = `j`.`id`))) left join `tweb_wil_clusternagari` `c` on((`u`.`id_cluster` = `c`.`id`))) left join `tweb_keluarga` `k` on((`u`.`id_kk` = `k`.`id`))) left join `tweb_penduduk_warganegara` `f` on((`u`.`warganegara_id` = `f`.`id`)));

INSERT INTO data_surat VALUES("1","AHLUL","LAKI-LAKI","JORONG B","1970-05-20","47","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","TUKANG BATU","5201142005716996","004","-","JORONG B","5201140104126994","ADINI SEPTIA LISTA");
INSERT INTO data_surat VALUES("2","AHMAD ALLIF RIZKI","LAKI-LAKI","JORONG B","1995-06-07","22","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201140706966997","004","-","JORONG B","5201140104126994","ADINI SEPTIA LISTA");
INSERT INTO data_surat VALUES("3","AHMAD HABIB","LAKI-LAKI","JORONG B","1990-01-03","28","BELUM KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","BELUM/TIDAK BEKERJA","5201140301916995","004","-","JORONG B","5201140104126994","ADINI SEPTIA LISTA");
INSERT INTO data_surat VALUES("4","ADINI SEPTIA LISTA","PEREMPUAN","JORONG B","1996-03-10","22","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201145003976995","004","-","JORONG B","5201140104126994","ADINI SEPTIA LISTA");
INSERT INTO data_surat VALUES("5","AHYAR","LAKI-LAKI","JAKARTA","1965-03-10","53","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201141003666996","001","-","JORONG A","5201140104126995","AHYAR");
INSERT INTO data_surat VALUES("6","APTA MADA RIZKY ALAMSYAH","LAKI-LAKI","DEPOK","2002-12-14","15","BELUM KAWIN","WNI","ISLAM","BELUM TAMAT SD/SEDERAJAT","PELAJAR/MAHASISWA","5201141412121724","001","-","JORONG A","5201140104126995","AHYAR");
INSERT INTO data_surat VALUES("7","ALIYAH","PEREMPUAN","BEKASI","1977-09-06","40","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","MENGURUS RUMAH TANGGA","5201144609786995","001","-","JORONG A","5201140104126995","AHYAR");
INSERT INTO data_surat VALUES("8","ALPIANI","PEREMPUAN","BOGOR","2007-01-03","11","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201144301171725","001","-","JORONG A","5201140104126995","AHYAR");
INSERT INTO data_surat VALUES("9","ASHARI","LAKI-LAKI","JORONG C","1985-12-30","32","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201140107867064","002","-","JORONG C","5201140104166999","ASHARI");
INSERT INTO data_surat VALUES("10","BACHTIAR HADI","LAKI-LAKI","MATARAM","2008-10-22","9","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201142210181724","002","-","JORONG C","5201140104166999","ASHARI");
INSERT INTO data_surat VALUES("11","ANGGUN LESTARI PRATAMA","PEREMPUAN","JORONG A","1990-10-25","27","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201146510916995","002","-","JORONG C","5201140104166999","ASHARI");
INSERT INTO data_surat VALUES("12","DAHRI","LAKI-LAKI","MASBAGIK","1978-12-31","39","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","WIRASWASTA","5201143112797117","003","-","JORONG D","5201140105136997","DAHRI");
INSERT INTO data_surat VALUES("13","ERLANGGA DWIKO SAPUTRO","LAKI-LAKI","MENINTING","2014-05-07","3","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201140705156994","003","-","JORONG D","5201140105136997","DAHRI");
INSERT INTO data_surat VALUES("14","FARIDAH","LAKI-LAKI","MASBAGIK","2000-07-11","17","BELUM KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","PELAJAR/MAHASISWA","5201141107101724","003","-","JORONG D","5201140105136997","DAHRI");
INSERT INTO data_surat VALUES("15","ASMIATUN","PEREMPUAN","MASBAGIK","1980-12-31","37","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201147112817188","003","-","JORONG D","5201140105136997","DAHRI");
INSERT INTO data_surat VALUES("16","BAIQ OLIVIA APRILLIANI","PEREMPUAN","JORONG A","1947-11-12","70","CERAI MATI","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201145211486994","001","-","JORONG A","5201140106166996","BAIQ OLIVIA APRILLIANI");
INSERT INTO data_surat VALUES("17","FAUZI","LAKI-LAKI","JORONG C","1989-10-12","28","BELUM KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","PELAJAR/MAHASISWA","5201141210906998","001","-","JORONG C","5201140106167002","FAUZI");
INSERT INTO data_surat VALUES("18","DELLA MAHARANI NINGSIH","PEREMPUAN","JORONG C","1993-12-31","24","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","BELUM/TIDAK BEKERJA","5201147112947048","001","-","JORONG C","5201140106167002","FAUZI");
INSERT INTO data_surat VALUES("19","HAERUL FATONI","LAKI-LAKI","JORONG A","1992-11-29","25","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","KARYAWAN SWASTA","5201142911936995","003","-","JORONG D","5201140106167003","HAERUL FATONI");
INSERT INTO data_surat VALUES("20","DENATUL SUARTINI","PEREMPUAN","JAKARTA","1996-01-06","22","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","MENGURUS RUMAH TANGGA","3275014601977005","003","-","JORONG D","5201140106167003","HAERUL FATONI");
INSERT INTO data_surat VALUES("21","HERI IRAWAN","LAKI-LAKI","TELOKE","1962-07-06","55","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","PETANI/PERKEBUNAN","5201140607636994","005","-","JORONG A","5201140107126996","HERI IRAWAN");
INSERT INTO data_surat VALUES("22","HERMAN","LAKI-LAKI","JORONG A","1992-05-03","25","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","BELUM/TIDAK BEKERJA","5201140305936994","005","-","JORONG A","5201140107126996","HERI IRAWAN");
INSERT INTO data_surat VALUES("23","DEWI SAULINA","PEREMPUAN","KEKERAN","1967-08-08","50","KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","MENGURUS RUMAH TANGGA","5201144808686994","005","-","JORONG A","5201140107126996","HERI IRAWAN");
INSERT INTO data_surat VALUES("24","ELOK KHALISA SABRINA","PEREMPUAN","JORONG A","1987-08-04","30","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201144408886994","005","-","JORONG A","5201140107126996","HERI IRAWAN");
INSERT INTO data_surat VALUES("25","I KETUT PAHING","LAKI-LAKI","MATARAM","1979-10-22","38","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201142210806997","005","-","JORONG A","5201140108146995","I KETUT PAHING");
INSERT INTO data_surat VALUES("26","IDA BAGUS MAS BUJANA","LAKI-LAKI","APIT AIK","1969-12-31","48","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201143112707040","005","-","JORONG B","5201140109126996","IDA BAGUS MAS BUJANA");
INSERT INTO data_surat VALUES("27","JOKO PATMOTO","LAKI-LAKI","JORONG B","2013-09-10","4","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201141009146994","005","-","JORONG B","5201140109126996","IDA BAGUS MAS BUJANA");
INSERT INTO data_surat VALUES("28","KOMANG SALUN","LAKI-LAKI","KAYANGAN","2002-05-31","15","BELUM KAWIN","WNI","ISLAM","BELUM TAMAT SD/SEDERAJAT","PELAJAR/MAHASISWA","5201143105121724","005","-","JORONG B","5201140109126996","IDA BAGUS MAS BUJANA");
INSERT INTO data_surat VALUES("29","FITRIANI","PEREMPUAN","KAYANGAN","1982-07-11","35","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201145107836994","005","-","JORONG B","5201140109126996","IDA BAGUS MAS BUJANA");
INSERT INTO data_surat VALUES("30","LALU WAWAN DININGRAT","LAKI-LAKI","JORONG B","1987-06-12","30","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201141206886994","005","-","JORONG B","5201140109156994","LALU WAWAN DININGRAT");
INSERT INTO data_surat VALUES("31","FITRIANI","PEREMPUAN","MATARAM","1991-01-28","27","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","KARYAWAN SWASTA","5271016801926995","005","-","JORONG B","5201140109156994","LALU WAWAN DININGRAT");
INSERT INTO data_surat VALUES("32","M. FA\'IZ AZAMI","LAKI-LAKI","GEGELANG","1988-12-31","29","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201143112897123","005","-","JORONG D","5201140110137011","M. FA\'IZ AZAMI");
INSERT INTO data_surat VALUES("33","HILMIATI","PEREMPUAN","JORONG D","1989-02-24","29","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201146402906994","005","-","JORONG D","5201140110137011","M. FA\'IZ AZAMI");
INSERT INTO data_surat VALUES("34","HJ. PARIDAH","PEREMPUAN","MENINTING","2013-12-09","4","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201144912146994","005","-","JORONG D","5201140110137011","M. FA\'IZ AZAMI");
INSERT INTO data_surat VALUES("35","HJ. SAMIRAH","PEREMPUAN","JORONG A","1975-12-31","42","CERAI HIDUP","WNI","ISLAM","TAMAT SD / SEDERAJAT","KARYAWAN SWASTA","5201147112767266","005","-","JORONG A","5201140110137038","HJ. SAMIRAH");
INSERT INTO data_surat VALUES("36","HUR MINAH","PEREMPUAN","JORONG A","2003-04-05","14","BELUM KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","PELAJAR/MAHASISWA","5201144504131726","005","-","JORONG A","5201140110137038","HJ. SAMIRAH");
INSERT INTO data_surat VALUES("37","HUSNAH","PEREMPUAN","LOTIM","1992-05-19","25","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201145905936994","005","-","JORONG A","5201140110156997","HUSNAH");
INSERT INTO data_surat VALUES("38","IDA AYU OKA SUKERTI","PEREMPUAN","JORONG C","1957-12-31","60","CERAI MATI","WNI","ISLAM","TAMAT SD / SEDERAJAT","WIRASWASTA","5201147112587053","001","-","JORONG C","5201140111126997","IDA AYU OKA SUKERTI");
INSERT INTO data_surat VALUES("39","M. JAYADI","LAKI-LAKI","JORONG A","1982-12-31","35","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201143112837098","003","-","JORONG A","5201140111126999","M. JAYADI");
INSERT INTO data_surat VALUES("40","JARIYAH","PEREMPUAN","JORONG A","1990-06-14","27","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201145406916994","003","-","JORONG A","5201140111126999","M. JAYADI");
INSERT INTO data_surat VALUES("41","LIHAM SATUN","PEREMPUAN","MATARAM","2010-12-31","7","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201147112116995","003","-","JORONG A","5201140111126999","M. JAYADI");
INSERT INTO data_surat VALUES("42","M. NUR SAHID","LAKI-LAKI","JORONG C","1990-07-05","27","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201140507916996","002","-","JORONG C","5201140112107003","M. NUR SAHID");
INSERT INTO data_surat VALUES("43","MADE ASTAWE","LAKI-LAKI","JORONG C","2008-03-25","9","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201142503181724","002","-","JORONG C","5201140112107003","M. NUR SAHID");
INSERT INTO data_surat VALUES("44","MAISAH","PEREMPUAN","JORONG C","1992-05-06","25","KAWIN","WNI","HINDU","TIDAK / BELUM SEKOLAH","WIRASWASTA","5201144605936994","002","-","JORONG C","5201140112107003","M. NUR SAHID");
INSERT INTO data_surat VALUES("45","MARSUNIN YOGA PRATAMA","LAKI-LAKI","PEJARAKAN","1966-12-31","51","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","PETANI/PERKEBUNAN","5201143112677056","002","-","JORONG D","5201140112126998","MARSUNIN YOGA PRATAMA");
INSERT INTO data_surat VALUES("46","MARZUKI","LAKI-LAKI","JORONG D","1995-03-10","23","BELUM KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","PELAJAR/MAHASISWA","5201141003966996","002","-","JORONG D","5201140112126998","MARSUNIN YOGA PRATAMA");
INSERT INTO data_surat VALUES("47","MUHAMAD HAMDI","LAKI-LAKI","JORONG D","1997-06-17","20","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","PELAJAR/MAHASISWA","5201141706986996","002","-","JORONG D","5201140112126998","MARSUNIN YOGA PRATAMA");
INSERT INTO data_surat VALUES("48","MARLIA SAJIDA","PEREMPUAN","PEJARAKAN","1969-12-31","48","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","MENGURUS RUMAH TANGGA","5201147112707088","002","-","JORONG D","5201140112126998","MARSUNIN YOGA PRATAMA");
INSERT INTO data_surat VALUES("49","MIRA FANDA","PEREMPUAN","JORONG D","1989-04-27","28","CERAI MATI","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201146704906995","002","-","JORONG D","5201140112126998","MARSUNIN YOGA PRATAMA");
INSERT INTO data_surat VALUES("50","MUNAAH","PEREMPUAN","JORONG D","2007-04-23","10","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201146304171724","002","-","JORONG D","5201140112126998","MARSUNIN YOGA PRATAMA");
INSERT INTO data_surat VALUES("51","MUHAMAD KABIR","LAKI-LAKI","JORONG A","1985-12-31","32","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","WIRASWASTA","5201140107917031","004","-","JORONG A","5201140202167000","MUHAMAD KABIR");
INSERT INTO data_surat VALUES("52","MUHAMAD SUHAD","LAKI-LAKI","JORONG A","1982-12-10","35","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","KARYAWAN SWASTA","5201141704876995","004","-","JORONG D","5201140202167002","MUHAMAD SUHAD");
INSERT INTO data_surat VALUES("53","MUHAMMAD HAIKAL FIRMANSYAH","LAKI-LAKI","JORONG D","2005-08-03","12","BELUM KAWIN","WNI","ISLAM","BELUM TAMAT SD/SEDERAJAT","BELUM/TIDAK BEKERJA","5201140308151724","004","-","JORONG D","5201140202167002","MUHAMAD SUHAD");
INSERT INTO data_surat VALUES("54","MURNIAH","PEREMPUAN","SETANGI","1991-03-04","27","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201145904846994","004","-","JORONG D","5201140202167002","MUHAMAD SUHAD");
INSERT INTO data_surat VALUES("55","MURNIATI SAGITA","PEREMPUAN","YOGYAKARTA","1971-12-01","46","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201144112726996","001","-","JORONG A","5201140203136994","MURNIATI SAGITA");
INSERT INTO data_surat VALUES("56","MUHAMMAD RIFAI","LAKI-LAKI","JORONG D","1991-05-31","26","KAWIN","WNI","HINDU","SLTP/SEDERAJAT","WIRASWASTA","5201143105926995","003","-","JORONG D","5201140203136995","MUHAMMAD RIFAI");
INSERT INTO data_surat VALUES("57","NADIA ROSDIANA","PEREMPUAN","MATARAM","1992-05-03","25","KAWIN","WNI","HINDU","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201144305936996","003","-","JORONG D","5201140203136995","MUHAMMAD RIFAI");
INSERT INTO data_surat VALUES("58","NI KOMANG PONIASIH","PEREMPUAN","MATARAM","2011-06-22","6","BELUM KAWIN","WNI","HINDU","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201146206126994","003","-","JORONG D","5201140203136995","MUHAMMAD RIFAI");
INSERT INTO data_surat VALUES("59","MUHAMMAD WIRDA MAULANA IBRAHIM","LAKI-LAKI","JORONG A","1940-12-31","77","KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","PETANI/PERKEBUNAN","5201143112417056","004","-","JORONG A","5201140203167003","MUHAMMAD WIRDA MAULANA IBRAHIM");
INSERT INTO data_surat VALUES("60","NI LUH NITA SARI","PEREMPUAN","SENTELUK","1945-12-31","72","KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","MENGURUS RUMAH TANGGA","5201147112466997","004","-","JORONG A","5201140203167003","MUHAMMAD WIRDA MAULANA IBRAHIM");
INSERT INTO data_surat VALUES("61","NI NENGAH AYU KARSINI","PEREMPUAN","JORONG A","1993-05-15","24","BELUM KAWIN","WNI","ISLAM","BELUM TAMAT SD/SEDERAJAT","KARYAWAN SWASTA","5201145505946996","001","-","JORONG D","5201140204166994","NI NENGAH AYU KARSINI");
INSERT INTO data_surat VALUES("62","MUKSAN","LAKI-LAKI","JORONG B","1994-12-31","23","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201143112957094","002","-","JORONG B","5201140205156994","MUKSAN");
INSERT INTO data_surat VALUES("63","NURHAYATI","PEREMPUAN","MENINTING","2013-09-15","4","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201145509146994","002","-","JORONG B","5201140205156994","MUKSAN");
INSERT INTO data_surat VALUES("64","MURSIDIN","LAKI-LAKI","JORONG B","1995-04-22","22","BELUM KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","NELAYAN/PERIKANAN","5201142204966994","002","-","JORONG B","5201140205156995","NURHIDAYAH");
INSERT INTO data_surat VALUES("65","NURHIDAYAH","PEREMPUAN","JORONG B","1975-09-02","42","CERAI MATI","WNI","ISLAM","TAMAT SD / SEDERAJAT","MENGURUS RUMAH TANGGA","5201144209766995","002","-","JORONG B","5201140205156995","NURHIDAYAH");
INSERT INTO data_surat VALUES("66","NURJANAH","PEREMPUAN","MONTONG","2000-05-10","17","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","PELAJAR/MAHASISWA","5201145005101724","002","-","JORONG B","5201140205156995","NURHIDAYAH");
INSERT INTO data_surat VALUES("67","NURUL AINUN","PEREMPUAN","JORONG B","2002-08-01","15","BELUM KAWIN","WNI","ISLAM","BELUM TAMAT SD/SEDERAJAT","PELAJAR/MAHASISWA","5201144108121724","002","-","JORONG B","5201140205156995","NURHIDAYAH");
INSERT INTO data_surat VALUES("68","MUSAHAB","LAKI-LAKI","LOTENG","1992-07-16","25","KAWIN","WNI","ISLAM","DIPLOMA I / II","WIRASWASTA","5201141607936996","001","-","JORONG D","5201140205156996","MUSAHAB");
INSERT INTO data_surat VALUES("69","NURUL FAIZAH","PEREMPUAN","JORONG A","1992-03-10","26","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201145003936994","001","-","JORONG D","5201140205156996","MUSAHAB");
INSERT INTO data_surat VALUES("70","NURUL HIDAYATI","PEREMPUAN","MATARAM","2012-04-30","5","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201147004136996","001","-","JORONG D","5201140205156996","MUSAHAB");
INSERT INTO data_surat VALUES("71","NAPIAH","LAKI-LAKI","JORONG A","1989-03-13","29","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","NELAYAN/PERIKANAN","5201141303906995","001","-","JORONG D","5201140205156997","NAPIAH");
INSERT INTO data_surat VALUES("72","RACHEL YULIANTI","PEREMPUAN","MELASE","1995-07-25","22","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201146507966995","001","-","JORONG D","5201140205156997","NAPIAH");
INSERT INTO data_surat VALUES("73","RAISHA MAULIDYA","PEREMPUAN","MENINTING","2014-01-07","4","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201144701156995","001","-","JORONG D","5201140205156997","NAPIAH");
INSERT INTO data_surat VALUES("74","PATANUL HUSNUL","LAKI-LAKI","JAWA TIMUR","1965-12-31","52","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201143112667000","001","-","JORONG C","5201140206157000","PATANUL HUSNUL");
INSERT INTO data_surat VALUES("75","RATNAWATY","PEREMPUAN","JORONG C","1978-12-15","39","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","PEDAGANG","5201145512796995","001","-","JORONG C","5201140206157000","PATANUL HUSNUL");
INSERT INTO data_surat VALUES("76","RABITAH","LAKI-LAKI","JORONG C","1988-12-03","29","BELUM KAWIN","WNI","HINDU","SLTP/SEDERAJAT","WIRASWASTA","5201140312896994","004","-","JORONG C","5201140206157004","RABITAH");
INSERT INTO data_surat VALUES("77","ROMI FAISAL","LAKI-LAKI","JORONG B","1984-06-15","33","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","KARYAWAN SWASTA","5201141506856997","003","-","JORONG B","5201140207156998","ROMI FAISAL");
INSERT INTO data_surat VALUES("78","RAUDATUL ILMI","PEREMPUAN","IRENG DAYE","1980-08-18","37","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201145808816994","003","-","JORONG B","5201140207156998","ROMI FAISAL");
INSERT INTO data_surat VALUES("79","ROHANI","PEREMPUAN","JORONG B","2010-06-03","7","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201144306116994","003","-","JORONG B","5201140207156998","ROMI FAISAL");
INSERT INTO data_surat VALUES("80","RUKIAH","PEREMPUAN","SERANG","1993-09-19","24","CERAI HIDUP","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201145909946994","006","-","JORONG A","5201140207157000","RUKIAH");
INSERT INTO data_surat VALUES("81","RUMALI","PEREMPUAN","JAKARTA","1987-07-05","30","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201144507886994","006","-","JORONG A","5201140207157000","RUKIAH");
INSERT INTO data_surat VALUES("82","RONI","LAKI-LAKI","DENPASAR","1982-01-03","36","BELUM KAWIN","WNI","HINDU","SLTA / SEDERAJAT","KARYAWAN SWASTA","5201140301836997","006","-","JORONG C","5201140209156996","RUSMAYANTI");
INSERT INTO data_surat VALUES("83","RUSMAYANTI","PEREMPUAN","DENPASAR","1953-03-10","65","KAWIN","WNI","HINDU","SLTA / SEDERAJAT","WIRASWASTA","5201145003546994","006","-","JORONG C","5201140209156996","RUSMAYANTI");
INSERT INTO data_surat VALUES("84","RUSNI","LAKI-LAKI","KEKERAN","1969-12-31","48","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","PETANI/PERKEBUNAN","5201143112707180","006","-","JORONG A","5201140210137022","RUSNI");
INSERT INTO data_surat VALUES("85","SAPIAH","PEREMPUAN","KEKERAN","1971-11-30","46","KAWIN","WNI","ISLAM","TAMAT SD / SEDERAJAT","MENGURUS RUMAH TANGGA","5201147011726994","006","-","JORONG A","5201140210137022","RUSNI");
INSERT INTO data_surat VALUES("86","SAPINAH","PEREMPUAN","JORONG A","1995-01-17","23","BELUM KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","PELAJAR/MAHASISWA","5201145701966994","006","-","JORONG A","5201140210137022","RUSNI");
INSERT INTO data_surat VALUES("87","SARRA LANGELAND","PEREMPUAN","JORONG A","1993-11-11","24","BELUM KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","PELAJAR/MAHASISWA","5201145111946996","006","-","JORONG A","5201140210137022","RUSNI");
INSERT INTO data_surat VALUES("88","SAHRONI","LAKI-LAKI","MEDAS","1960-12-31","57","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","WIRASWASTA","5201143112617096","002","-","JORONG A","5201140211117001","SAHRONI");
INSERT INTO data_surat VALUES("89","SERIMAN","LAKI-LAKI","JORONG A","1983-12-10","34","BELUM KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","KARYAWAN SWASTA","5201141012846995","002","-","JORONG A","5201140211117001","SAHRONI");
INSERT INTO data_surat VALUES("90","SUNYOTOH","LAKI-LAKI","MEDAS","1980-12-31","37","BELUM KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","KARYAWAN SWASTA","5201143112817139","002","-","JORONG A","5201140211117001","SAHRONI");
INSERT INTO data_surat VALUES("91","SYARIFUL KALAM","LAKI-LAKI","JORONG A","1976-07-17","41","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201141707776994","002","-","JORONG A","5201140211117002","SYARIFUL KALAM");
INSERT INTO data_surat VALUES("92","SITI AISYAH","PEREMPUAN","SUKARAJA","1976-10-22","41","KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","MENGURUS RUMAH TANGGA","5201146210776994","002","-","JORONG A","5201140211117002","SYARIFUL KALAM");
INSERT INTO data_surat VALUES("93","SITI PAOZIAH","PEREMPUAN","JORONG A","2006-12-23","11","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201146312161724","002","-","JORONG A","5201140211117002","SYARIFUL KALAM");
INSERT INTO data_surat VALUES("94","SUKMA UTAMI","PEREMPUAN","JORONG A","1998-07-06","19","BELUM KAWIN","WNI","ISLAM","SLTP/SEDERAJAT","PELAJAR/MAHASISWA","5201144607996998","002","-","JORONG A","5201140211117002","SYARIFUL KALAM");
INSERT INTO data_surat VALUES("95","WAHID ALIAS H. MAHSUN","LAKI-LAKI","JORONG A","1980-12-12","37","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201141212816996","002","-","JORONG A","5201140211117003","WAHID ALIAS H. MAHSUN");
INSERT INTO data_surat VALUES("96","WAYAN EKA PRAWATA","LAKI-LAKI","GUNUNG SARI","2012-03-20","5","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","BELUM/TIDAK BEKERJA","5201142003136994","002","-","JORONG A","5201140211117003","WAHID ALIAS H. MAHSUN");
INSERT INTO data_surat VALUES("97","ULFA WIDIAWATI","PEREMPUAN","JOHAR PELITA","1988-03-12","30","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","WIRASWASTA","5201145203896994","002","-","JORONG A","5201140211117003","WAHID ALIAS H. MAHSUN");
INSERT INTO data_surat VALUES("98","Irfan","LAKI-LAKI","Bukittinggi","0000-00-00","","","","ISLAM","TAMAT SD / SEDERAJAT","","1234567890123456","0","0","JORONG GUGUK","132556576787898907878","Irfan");
INSERT INTO data_surat VALUES("99","DERIO","LAKI-LAKI","PASAMAN","0000-00-00","","KAWIN","WNI","ISLAM","SLTA / SEDERAJAT","PEGAWAI NEGERI SIPIL (PNS)","2345678909876543","0","0","JORONG LAREH NAN PANJANG","1313245464563213","DERIO");
INSERT INTO data_surat VALUES("100","dero","PEREMPUAN","pasaman","0000-00-00","","BELUM KAWIN","WNI","ISLAM","TIDAK / BELUM SEKOLAH","PELAJAR/MAHASISWA","3545465768789876","0","0","JORONG LAREH NAN PANJANG","57888898999909","dero");



DROP TABLE detail_log_penduduk;

CREATE TABLE `detail_log_penduduk` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE dokumen;

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE gambar_gallery;

CREATE TABLE `gambar_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parrent` int(4) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

INSERT INTO gambar_gallery VALUES("36","0","","Foto Nagari","1","2017-01-05 10:47:02","0");
INSERT INTO gambar_gallery VALUES("38","36","air+terjun.jpg","Air Terjun","1","2017-01-06 08:11:55","2");
INSERT INTO gambar_gallery VALUES("39","36","bukit+pasuak.jpg","Bukit Pasuak","1","2017-01-06 08:12:16","2");
INSERT INTO gambar_gallery VALUES("40","36","echo+di+lembah+harau.jpg","Echo di Lembah Harau","1","2017-01-06 08:12:35","2");
INSERT INTO gambar_gallery VALUES("41","36","kelok+sembilan.jpg","Kelok Sambilan","1","2017-01-06 08:13:00","2");
INSERT INTO gambar_gallery VALUES("42","36","lembah+harau.jpg","Lembah harau","1","2017-01-06 08:13:21","2");
INSERT INTO gambar_gallery VALUES("43","36","penginapan+lembah+harau.jpg","Penginapan Lembah Harau","1","2017-01-06 08:13:46","2");
INSERT INTO gambar_gallery VALUES("44","36","IMG_20161109_174255.jpg","fto","1","2017-02-04 15:05:22","2");



DROP TABLE garis;

CREATE TABLE `garis` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_line` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `desk` text NOT NULL,
  `id_cluster` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE inbox;

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE kategori;

CREATE TABLE `kategori` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `tipe` int(4) NOT NULL DEFAULT '1',
  `urut` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `parrent` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO kategori VALUES("4","Agenda Kecamatan","2","0","1","0");
INSERT INTO kategori VALUES("5","Peraturan Kecamatan","2","1","1","0");
INSERT INTO kategori VALUES("6","Pelayanan (Paten)","2","1","1","0");
INSERT INTO kategori VALUES("20","Berita Nagari","1","3","2","1");
INSERT INTO kategori VALUES("21","Berita Kriminal","1","4","2","1");
INSERT INTO kategori VALUES("22","teks_berjalan","1","2","1","0");
INSERT INTO kategori VALUES("24","Berita Pertanian","1","5","2","1");
INSERT INTO kategori VALUES("25","Berita Olahraga","1","6","2","1");
INSERT INTO kategori VALUES("26","Berita Kesehatan","1","7","2","1");
INSERT INTO kategori VALUES("27","Berita Peternakan","1","8","2","1");



DROP TABLE kelompok;

CREATE TABLE `kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `id_ketua` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ketua` (`id_ketua`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE kelompok_anggota;

CREATE TABLE `kelompok_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` int(11) NOT NULL,
  `id_penduduk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kelompok` (`id_kelompok`,`id_penduduk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE kelompok_master;

CREATE TABLE `kelompok_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `deskripsi` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO kelompok_master VALUES("1","Kelompok Ternak","<p>Kelompok yang memelihara ternak</p>");
INSERT INTO kelompok_master VALUES("2","pertania","<p>tani</p>");



DROP TABLE klasifikasi_analisis_keluarga;

CREATE TABLE `klasifikasi_analisis_keluarga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE komentar;

CREATE TABLE `komentar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_artikel` int(7) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO komentar VALUES("9","775","AHMAD ALLIF RIZKI","5201140706966997","Harap alamat keluarga kami diperbaik menjadi RT 002 jorong JORONG B. \n\nTerima kasih.","2016-09-14 08:44:35","1");
INSERT INTO komentar VALUES("10","775","DENATUL SUARTINI","3275014601977005","Saya ke kantor nagari kemarin jam 12:30 siang, tetapi tidak ada orang. Anak kami akan pergi ke Yogyakarta untuk kuliah selama 4 tahun. Apakah perlu kami laporkan?","2016-09-14 11:49:10","2");
INSERT INTO komentar VALUES("11","775","DENATUL SUARTINI","3275014601977005","Laporan ini tidak relevan. Hanya berisi komentar saja.","2016-09-14 12:04:38","2");
INSERT INTO komentar VALUES("14","119","Warga Limapuluh Kota","warga@gmail.com","Selamat dan Sukses buat Pak. Irfandi","2017-01-06 08:15:51","1");
INSERT INTO komentar VALUES("15","130","asniati","assniati.bahari@gmail.com","Mana foto kontak wali nagari nya?","2017-02-04 11:19:10","1");
INSERT INTO komentar VALUES("16","775","ADINI SEPTIA LISTA","5201145003976995","kk wak lun kalua lai pak..","2017-02-04 14:35:42","2");



DROP TABLE kontak;

CREATE TABLE `kontak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE kontak_grup;

CREATE TABLE `kontak_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_grup` varchar(30) NOT NULL,
  `id_kontak` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE line;

CREATE TABLE `line` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(4) NOT NULL,
  `parrent` int(4) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO line VALUES("1","Jalan","","FFCD42","0","1","1");
INSERT INTO line VALUES("2","Jalan Raya","","FFCD42","2","66","1");
INSERT INTO line VALUES("3","Jalan Kampung","","","2","66","1");
INSERT INTO line VALUES("4","Ring Road","","","2","66","1");
INSERT INTO line VALUES("5","Sungai","","FFFFFF","0","1","1");
INSERT INTO line VALUES("6","Selokan","","","2","70","1");



DROP TABLE log_bulanan;

CREATE TABLE `log_bulanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pend` int(11) NOT NULL,
  `lk` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `kk` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kk_lk` int(11) DEFAULT NULL,
  `kk_pr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO log_bulanan VALUES("1","16906","8280","8626","4885","2014-12-05 14:26:37","","");
INSERT INTO log_bulanan VALUES("2","16906","8280","8626","4885","2016-05-24 22:00:06","","");
INSERT INTO log_bulanan VALUES("3","0","0","0","4885","2016-06-02 12:41:29","","");
INSERT INTO log_bulanan VALUES("4","4725","2383","2342","1643","2016-08-24 11:46:59","","");
INSERT INTO log_bulanan VALUES("5","97","46","51","37","2016-09-26 07:12:45","28","9");
INSERT INTO log_bulanan VALUES("6","102","51","51","39","2016-11-26 01:00:37","28","9");
INSERT INTO log_bulanan VALUES("7","102","51","51","39","2016-12-16 08:22:34","30","9");
INSERT INTO log_bulanan VALUES("8","97","46","51","37","2017-01-29 14:37:06","28","9");
INSERT INTO log_bulanan VALUES("9","100","48","52","39","2017-02-04 14:38:03","30","9");
INSERT INTO log_bulanan VALUES("10","100","48","52","39","2017-08-07 10:29:16","","");
INSERT INTO log_bulanan VALUES("11","100","48","52","39","2017-10-30 20:13:10","","");
INSERT INTO log_bulanan VALUES("12","100","48","52","39","2017-11-09 12:01:31","30","9");
INSERT INTO log_bulanan VALUES("13","99","47","52","40","2017-12-02 10:24:38","30","10");



DROP TABLE log_keluarga;

CREATE TABLE `log_keluarga` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_kk` int(11) NOT NULL,
  `kk_sex` tinyint(2) NOT NULL,
  `id_peristiwa` int(4) NOT NULL,
  `tgl_peristiwa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kk` (`id_kk`,`id_peristiwa`,`tgl_peristiwa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO log_keluarga VALUES("1","38","1","1","2016-11-25 14:34:17");
INSERT INTO log_keluarga VALUES("2","39","1","1","2016-11-25 16:10:31");
INSERT INTO log_keluarga VALUES("3","42","1","2","2016-11-25 17:07:39");
INSERT INTO log_keluarga VALUES("4","41","1","2","2016-11-25 17:07:46");
INSERT INTO log_keluarga VALUES("5","40","1","2","2016-11-25 17:08:00");
INSERT INTO log_keluarga VALUES("6","39","1","2","2016-11-25 17:08:10");
INSERT INTO log_keluarga VALUES("7","38","1","2","2016-11-25 17:08:20");
INSERT INTO log_keluarga VALUES("8","43","1","1","2016-11-25 17:12:07");
INSERT INTO log_keluarga VALUES("9","43","1","1","2016-11-25 17:12:50");
INSERT INTO log_keluarga VALUES("10","45","1","1","2016-11-25 17:31:48");



DROP TABLE log_penduduk;

CREATE TABLE `log_penduduk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) NOT NULL,
  `id_detail` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl_peristiwa` date NOT NULL,
  `catatan` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pend` (`id_pend`,`id_detail`,`tgl_peristiwa`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO log_penduduk VALUES("1","4722","1","2016-09-06 03:35:00","09","2016","2016-09-06","Kembali lagi");
INSERT INTO log_penduduk VALUES("2","98","1","2016-11-22 21:38:31","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("3","99","1","2016-11-22 21:42:42","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("4","100","1","2016-11-22 21:50:53","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("5","101","1","2016-11-23 12:48:33","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("6","102","5","2016-11-23 22:07:26","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("7","103","5","2016-11-23 22:11:46","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("8","104","5","2016-11-23 22:17:04","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("9","105","5","2016-11-23 22:38:52","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("10","106","5","2016-11-25 09:06:24","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("11","107","1","2016-11-25 09:10:58","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("12","108","1","2016-11-25 20:34:17","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("13","109","1","2016-11-25 22:10:31","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("17","113","1","2016-11-25 23:12:07","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("18","113","5","2016-11-25 23:12:50","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("19","115","5","2016-11-25 23:31:48","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("20","116","5","2016-11-25 23:34:04","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("21","117","5","2016-11-25 23:51:27","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("22","118","5","2016-11-25 23:52:44","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("24","119","5","2016-11-26 00:02:00","11","2016","0000-00-00","");
INSERT INTO log_penduduk VALUES("25","4","7","2017-02-03 06:23:41","02","2017","0000-00-00","");
INSERT INTO log_penduduk VALUES("26","98","5","2017-02-03 08:05:21","02","2017","0000-00-00","");
INSERT INTO log_penduduk VALUES("27","99","5","2017-02-04 12:11:45","02","2017","0000-00-00","");
INSERT INTO log_penduduk VALUES("30","100","5","2017-02-04 12:26:17","02","2017","0000-00-00","");
INSERT INTO log_penduduk VALUES("31","1","1","2017-02-04 12:27:29","02","2017","2017-02-04","");
INSERT INTO log_penduduk VALUES("32","1","4","2017-12-02 10:17:02","12","2017","2017-12-02","");



DROP TABLE log_perubahan_penduduk;

CREATE TABLE `log_perubahan_penduduk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) NOT NULL,
  `id_cluster` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO log_perubahan_penduduk VALUES("1","98","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("2","99","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("3","100","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("4","101","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("5","102","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("6","103","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("7","104","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("8","105","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("9","106","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("10","107","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("11","1","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("12","1","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("13","1","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("14","1","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("15","1","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("16","117","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("17","118","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("18","119","1","0000-00-00 00:00:00");
INSERT INTO log_perubahan_penduduk VALUES("19","98","1","2002-03-16 23:59:38");
INSERT INTO log_perubahan_penduduk VALUES("20","99","1","2002-04-17 00:59:38");
INSERT INTO log_perubahan_penduduk VALUES("21","100","1","2002-04-17 00:59:38");



DROP TABLE log_surat;

CREATE TABLE `log_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_format_surat` int(3) NOT NULL,
  `id_pend` int(11) NOT NULL,
  `id_pamong` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nama_surat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

INSERT INTO log_surat VALUES("1","1","3","14","1","2016-09-13 05:04:46","09","2016","KET/345","surat_ket_pengantar_5201140301900002_2016-09-13_KET-345.pdf");
INSERT INTO log_surat VALUES("2","15","8","14","1","2016-09-13 05:06:16","09","2016","USA/67/123","surat_ket_usaha_5201141412020001_2016-09-13_USA-67-123.pdf");
INSERT INTO log_surat VALUES("3","1","18","20","1","2016-09-13 05:07:29","09","2016","KET/346","surat_ket_pengantar_5201147112930055_2016-09-13_KET-346.pdf");
INSERT INTO log_surat VALUES("4","12","9","14","1","2016-09-13 05:08:38","09","2016","KM/104","surat_ket_kurang_mampu_5201140107850071_2016-09-13_KM-104.pdf");
INSERT INTO log_surat VALUES("5","14","25","22","1","2016-09-13 05:10:02","09","2016","HIL/503","surat_ket_kehilangan_5201142210790004_2016-09-13_HIL-503.pdf");
INSERT INTO log_surat VALUES("6","1","6","23","1","2016-12-16 09:50:21","12","2016","123","");
INSERT INTO log_surat VALUES("7","1","6","23","1","2016-12-16 11:34:45","12","2016","123","");
INSERT INTO log_surat VALUES("8","1","6","23","1","2016-12-16 11:37:50","12","2016","123","");
INSERT INTO log_surat VALUES("9","1","6","23","1","2016-12-16 11:38:47","12","2016","123","surat_ket_pengantar_5201141412121724_2016-12-16_123.rtf");
INSERT INTO log_surat VALUES("10","1","6","23","1","2016-12-16 11:39:17","12","2016","123","");
INSERT INTO log_surat VALUES("11","1","6","23","1","2016-12-16 11:39:23","12","2016","123","surat_ket_pengantar_5201141412121724_2016-12-16_123.rtf");
INSERT INTO log_surat VALUES("12","2","2","23","1","2016-12-16 11:40:11","12","2016","1212132","");
INSERT INTO log_surat VALUES("13","2","2","23","1","2016-12-16 11:40:25","12","2016","1212132","surat_ket_penduduk_5201140706966997_2016-12-16_1212132.rtf");
INSERT INTO log_surat VALUES("14","2","2","24","1","2016-12-16 11:50:43","12","2016","12121","");
INSERT INTO log_surat VALUES("15","2","2","24","1","2016-12-16 11:50:47","12","2016","12121","surat_ket_penduduk_5201140706966997_2016-12-16_12121.rtf");
INSERT INTO log_surat VALUES("16","2","2","24","1","2016-12-16 11:53:06","12","2016","12121","surat_ket_penduduk_5201140706966997_2016-12-16_12121.rtf");
INSERT INTO log_surat VALUES("17","1","6","23","1","2016-12-16 13:59:53","12","2016","123","");
INSERT INTO log_surat VALUES("18","2","2","24","1","2016-12-16 14:00:00","12","2016","12121","surat_ket_penduduk_5201140706966997_2016-12-16_12121.rtf");
INSERT INTO log_surat VALUES("19","6","1","23","1","2016-12-16 14:12:46","12","2016","qqqq","");
INSERT INTO log_surat VALUES("20","6","1","23","1","2016-12-16 14:13:18","12","2016","qqqq","surat_ket_jual_beli_5201142005716996_2016-12-16_qqqq.rtf");
INSERT INTO log_surat VALUES("21","6","1","23","1","2016-12-16 14:13:45","12","2016","qqqq","surat_ket_jual_beli_5201142005716996_2016-12-16_qqqq.rtf");
INSERT INTO log_surat VALUES("22","2","3","22","1","2016-12-16 14:46:09","12","2016","ertert","");
INSERT INTO log_surat VALUES("23","13","2","25","1","2016-12-16 15:39:22","12","2016","34343","");
INSERT INTO log_surat VALUES("24","13","2","25","1","2016-12-16 15:39:34","12","2016","34343","surat_izin_keramaian_5201140706966997_2016-12-16_34343.rtf");
INSERT INTO log_surat VALUES("25","6","3","23","1","2017-02-03 21:54:45","02","2017","123","");
INSERT INTO log_surat VALUES("26","6","3","23","1","2017-02-03 21:56:34","02","2017","123","");
INSERT INTO log_surat VALUES("27","6","3","23","1","2017-02-03 21:56:51","02","2017","123","surat_ket_jual_beli_5201140301916995_2017-02-03_123.rtf");
INSERT INTO log_surat VALUES("28","6","3","23","1","2017-02-03 21:57:51","02","2017","123","");
INSERT INTO log_surat VALUES("29","6","3","23","1","2017-02-03 21:59:17","02","2017","123","");
INSERT INTO log_surat VALUES("30","6","3","23","1","2017-02-03 21:59:45","02","2017","123","");
INSERT INTO log_surat VALUES("31","6","3","23","1","2017-02-03 22:00:13","02","2017","123","");
INSERT INTO log_surat VALUES("32","6","3","23","1","2017-02-03 22:00:18","02","2017","123","");
INSERT INTO log_surat VALUES("33","6","3","23","1","2017-02-03 22:00:53","02","2017","123","");
INSERT INTO log_surat VALUES("34","6","3","23","1","2017-02-03 22:01:10","02","2017","123","");
INSERT INTO log_surat VALUES("35","16","2","24","1","2017-02-03 22:03:38","02","2017","12312312","");
INSERT INTO log_surat VALUES("36","1","2","21","1","2017-02-04 09:17:09","02","2017","45345","");
INSERT INTO log_surat VALUES("37","1","1","21","1","2017-02-04 11:24:07","02","2017","123","");
INSERT INTO log_surat VALUES("38","1","1","21","1","2017-02-04 11:24:43","02","2017","123","surat_ket_pengantar_5201142005716996_2017-02-04_123.rtf");



DROP TABLE lokasi;

CREATE TABLE `lokasi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `desk` text NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `lat` varchar(30) NOT NULL,
  `lng` varchar(30) NOT NULL,
  `ref_point` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_point` (`ref_point`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE media_sosial;

CREATE TABLE `media_sosial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` text NOT NULL,
  `link` text NOT NULL,
  `nama` varchar(100) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO media_sosial VALUES("1","fb.png","https://www.facebook.com/groups/nagari/","Facebook","1");
INSERT INTO media_sosial VALUES("2","twt.png","https://twitter.com/nagari","Twitter","1");
INSERT INTO media_sosial VALUES("3","goo.png","","Google Pluss","1");
INSERT INTO media_sosial VALUES("4","yb.png","http://www.youtube.com/nagari","Youtube","1");



DROP TABLE menu;

CREATE TABLE `menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `tipe` int(4) NOT NULL,
  `parrent` int(4) NOT NULL DEFAULT '1',
  `link_tipe` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '1',
  `urut` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

INSERT INTO menu VALUES("16","Profil Kecamatan","artikel/32","1","1","0","1","1");
INSERT INTO menu VALUES("17","Pemerintahan Kecamatan","artikel/85","1","1","1","2","3");
INSERT INTO menu VALUES("19","Lembaga Masyarakat","artikel/38","1","1","1","2","4");
INSERT INTO menu VALUES("23","Teras Kecamatan","","2","1","1","1","");
INSERT INTO menu VALUES("24","Data Kecamatan","artikel/97","1","1","0","1","5");
INSERT INTO menu VALUES("31","Data Wilayah Administratif","statistik/15","3","24","1","1","");
INSERT INTO menu VALUES("32","Data Pendidikan dalam KK","statistik/0","3","24","1","1","");
INSERT INTO menu VALUES("33","Data Pendidikan Ditempuh","statistik/17","3","24","1","1","");
INSERT INTO menu VALUES("34","Data Pekerjaan","statistik/1","3","24","1","1","");
INSERT INTO menu VALUES("35","Data Agama","statistik/3","3","24","1","1","");
INSERT INTO menu VALUES("36","Data Jenis Kelamin","statistik/4","3","24","1","1","");
INSERT INTO menu VALUES("40","Data Golongan Darah","statistik/7","3","24","1","2","");
INSERT INTO menu VALUES("51","Data Kelompok Umur","statistik/12","3","24","1","2","");
INSERT INTO menu VALUES("52","Data Penerima Raskin","statistik_k/2","3","24","1","2","");
INSERT INTO menu VALUES("53","Data Penerima Jamkesmas","statistik_k/3","3","24","1","2","");
INSERT INTO menu VALUES("55","Profil Wilayah Kecamatan","artikel/98","3","16","0","1","");
INSERT INTO menu VALUES("56","Profil Masyarakat Kecamatan","artikel/126","3","16","0","1","");
INSERT INTO menu VALUES("57","Visi dan Misi","artikel/93","3","17","0","1","");
INSERT INTO menu VALUES("58","Pemerintah Kecamatan","artikel/92","3","17","0","1","");
INSERT INTO menu VALUES("59","Badan Permusyawaratan Kecamatan","artikel/37","3","17","0","2","");
INSERT INTO menu VALUES("62","Berita Kecamatan","","2","1","1","1","");
INSERT INTO menu VALUES("63","Agenda Kecamatan","artikel/41","2","1","1","2","");
INSERT INTO menu VALUES("64","Peraturan Kecamatan","peraturan","2","1","1","2","");
INSERT INTO menu VALUES("65","Panduan Layanan Kecamatan","#","2","1","1","1","");
INSERT INTO menu VALUES("66","Produk Kecamatan","produk","2","1","1","1","");
INSERT INTO menu VALUES("68","Undang undang","artikel/42","3","64","1","2","");
INSERT INTO menu VALUES("69","Peraturan Pemerintah","artikel/43","3","64","1","2","");
INSERT INTO menu VALUES("70","Peraturan Daerah","","3","64","1","2","");
INSERT INTO menu VALUES("71","Peraturan Bupati","","3","64","1","2","");
INSERT INTO menu VALUES("72","Peraturan Bersama KaDes","","3","64","1","2","");
INSERT INTO menu VALUES("73","Informasi Publik","#","2","1","1","1","");
INSERT INTO menu VALUES("75","Rencana Kerja Anggaran","","3","73","1","1","");
INSERT INTO menu VALUES("76","RAPB Kecamatan","","3","73","1","1","");
INSERT INTO menu VALUES("77","APB Kecamatan","","3","73","1","1","");
INSERT INTO menu VALUES("78","DPA","","3","73","1","1","");
INSERT INTO menu VALUES("80","Profil Potensi Kecamatan","artikel/127","3","16","0","1","");
INSERT INTO menu VALUES("84","LKMD","artikel/62","3","18","1","1","");
INSERT INTO menu VALUES("85","PKK","artikel/63","3","18","1","1","");
INSERT INTO menu VALUES("86","Karang Taruna","artikel/64","3","18","1","1","");
INSERT INTO menu VALUES("87","RT RW","artikel/65","3","18","1","1","");
INSERT INTO menu VALUES("88","Linmas","artikel/70","3","18","1","1","");
INSERT INTO menu VALUES("89","TKP2KDes","artikel/66","3","18","1","1","");
INSERT INTO menu VALUES("90","KPAD","artikel/67","3","18","1","1","");
INSERT INTO menu VALUES("91","Kelompok Ternak","artikel/68","3","18","1","1","");
INSERT INTO menu VALUES("92","Kelompok Tani","artikel/69","3","18","1","1","");
INSERT INTO menu VALUES("93","Kelompok Ekonomi Lainya","artikel/71","3","18","1","1","");
INSERT INTO menu VALUES("98","LKPJ","","3","73","1","1","");
INSERT INTO menu VALUES("99","LPPD","","3","73","1","1","");
INSERT INTO menu VALUES("100","ILPPD","","3","73","1","1","");
INSERT INTO menu VALUES("101","Peraturan Kecamatan","artikel/44","3","64","1","2","");
INSERT INTO menu VALUES("102","Peraturan Camat","artikel/45","3","64","1","2","");
INSERT INTO menu VALUES("103","Keputusan Camat","artikel/46","3","64","1","2","");
INSERT INTO menu VALUES("104","PBB","","3","73","1","1","");
INSERT INTO menu VALUES("106","Data Warga Negara","statistik/13","3","24","1","1","");
INSERT INTO menu VALUES("108","Data Kelas Sosial","statistik_k/1","3","24","1","2","");
INSERT INTO menu VALUES("109","Kontak","artikel/36","1","1","1","1","8");
INSERT INTO menu VALUES("110","Peraturan Kecamatan","peraturan","3","66","1","1","");
INSERT INTO menu VALUES("112","Coba","coba","2","1","1","1","");
INSERT INTO menu VALUES("114","Sejarah Kecamatan","artikel/99","3","16","0","1","2");
INSERT INTO menu VALUES("115","Lambang Kecamatan","","3","16","0","1","1");
INSERT INTO menu VALUES("116","Visi dan Misi Kecamatan","","3","16","0","1","");
INSERT INTO menu VALUES("117","Struktur Organisasi","","3","16","0","1","3");
INSERT INTO menu VALUES("119","Profil Penduduk","","3","118","0","1","1");
INSERT INTO menu VALUES("120","Ekonomi","","3","118","0","1","2");
INSERT INTO menu VALUES("121","Sosial","","3","118","0","1","3");
INSERT INTO menu VALUES("122","Profil Nagari","","1","1","0","1","6");
INSERT INTO menu VALUES("123","Batu Balang","","3","122","0","1","1");
INSERT INTO menu VALUES("124","Info Wisata","","1","1","0","1","7");
INSERT INTO menu VALUES("125","Wisata Alam","","3","124","0","1","1");
INSERT INTO menu VALUES("126","Wisata Sejarah","","3","124","0","1","2");
INSERT INTO menu VALUES("127","Wisata Religi","","3","124","0","1","3");
INSERT INTO menu VALUES("128","Wisata Budaya","","3","124","0","1","4");
INSERT INTO menu VALUES("129","Wisata Legenda","","3","124","0","1","5");
INSERT INTO menu VALUES("130","Wisata Kuliner","","3","124","0","1","6");
INSERT INTO menu VALUES("131","Wisata Belanja","","3","124","0","1","7");
INSERT INTO menu VALUES("132","Bukik Limbuku","","3","122","0","1","2");
INSERT INTO menu VALUES("133","Gurun","","3","122","0","1","3");
INSERT INTO menu VALUES("134","Harau","","3","122","0","1","4");
INSERT INTO menu VALUES("135","Prestasi Kecamatan","artikel/128","3","16","0","1","4");
INSERT INTO menu VALUES("137","Produk Unggulan","artikel/129","3","16","0","1","5");
INSERT INTO menu VALUES("138","Kontak Camat","artikel/130","3","109","0","1","1");
INSERT INTO menu VALUES("139","Koto Tuo","","3","122","0","1","5");
INSERT INTO menu VALUES("140","Lubuak Batingkok","","3","122","0","1","6");
INSERT INTO menu VALUES("141","Pilubang","","3","122","0","1","7");
INSERT INTO menu VALUES("142","Sarilamak","","3","122","0","1","8");
INSERT INTO menu VALUES("143","Solok Bio-Bio","","3","122","0","1","9");
INSERT INTO menu VALUES("144","Taram","taram","3","122","0","1","10");
INSERT INTO menu VALUES("145","Tarantang","","3","122","0","1","11");



DROP TABLE outbox;

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO outbox VALUES("2016-12-16 14:28:49","0000-00-00 00:00:00","0000-00-00 00:00:00","23:59:59","00:00:00","","081223432432","Default_No_Compression","","-1","sdfsfsfsdf sdf","1","false","-1","","0000-00-00 00:00:00","default","");



DROP TABLE pertanyaan;

CREATE TABLE `pertanyaan` (
  `1` int(2) DEFAULT NULL,
  `Pendapatan perkapita perbulan` varchar(87) DEFAULT NULL,
  `36` int(2) DEFAULT NULL,
  `15` int(2) DEFAULT NULL,
  `24` int(2) DEFAULT NULL,
  `23` int(2) DEFAULT NULL,
  `26` int(2) DEFAULT NULL,
  `28` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE point;

CREATE TABLE `point` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `tipe` int(4) NOT NULL,
  `parrent` int(4) NOT NULL DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO point VALUES("1","Sarana Pendidikan","face-embarrassed.png","0","1","1");
INSERT INTO point VALUES("2","Sarana Transportasi","face-devilish.png","0","1","1");
INSERT INTO point VALUES("3","Sarana Kesehatan","emblem-photos.png","0","1","1");
INSERT INTO point VALUES("4","SMA","gateswalls.png","2","38","1");
INSERT INTO point VALUES("5","SMP (Sekolah Menengah Pertama)","arch.png","2","38","1");
INSERT INTO point VALUES("6","Masjid","mosque.png","2","54","1");
INSERT INTO point VALUES("7","Tempat Ibadah","emblem-art.png","0","1","1");
INSERT INTO point VALUES("8","Kuil","moderntower.png","2","54","1");
INSERT INTO point VALUES("9","RS","accerciser.png","2","40","1");
INSERT INTO point VALUES("10","Sarana Pendidikan","cabin.png","2","38","1");



DROP TABLE polygon;

CREATE TABLE `polygon` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(4) NOT NULL,
  `parrent` int(4) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO polygon VALUES("1","rawan topan","","7C78FF","0","1","1");
INSERT INTO polygon VALUES("2","jalur selokan","","F4FF59","0","1","1");



DROP TABLE program;

CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  `ndesc` varchar(200) DEFAULT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO program VALUES("1","Bantuan Kangsung Tunas","2","<p>Bantuan langsung tunai</p>","2016-12-06","2016-12-22","0","");



DROP TABLE program_peserta;

CREATE TABLE `program_peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peserta` decimal(16,0) NOT NULL,
  `program_id` int(11) NOT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO program_peserta VALUES("1","5202092101120001","1","1");



DROP TABLE ref_bedah_rumah;

CREATE TABLE `ref_bedah_rumah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ref_bedah_rumah VALUES("1","Ya");
INSERT INTO ref_bedah_rumah VALUES("2","Tidak");



DROP TABLE ref_blt;

CREATE TABLE `ref_blt` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ref_blt VALUES("1","Ya");
INSERT INTO ref_blt VALUES("2","Tidak");



DROP TABLE ref_jamkesmas;

CREATE TABLE `ref_jamkesmas` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO ref_jamkesmas VALUES("1","Ya");
INSERT INTO ref_jamkesmas VALUES("2","Tidak");
INSERT INTO ref_jamkesmas VALUES("3","LAINNYA");



DROP TABLE ref_kelas_sosial;

CREATE TABLE `ref_kelas_sosial` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO ref_kelas_sosial VALUES("1","Tidak Miskin");
INSERT INTO ref_kelas_sosial VALUES("2","Sedang");
INSERT INTO ref_kelas_sosial VALUES("3","Miskin");
INSERT INTO ref_kelas_sosial VALUES("4","Sangat Miskin");



DROP TABLE ref_pkh;

CREATE TABLE `ref_pkh` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ref_pkh VALUES("1","Ya");
INSERT INTO ref_pkh VALUES("2","Tidak");



DROP TABLE ref_raskin;

CREATE TABLE `ref_raskin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ref_raskin VALUES("1","Ya");
INSERT INTO ref_raskin VALUES("2","Tidak");



DROP TABLE sentitems;

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE setting_sms;

CREATE TABLE `setting_sms` (
  `autoreply_text` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO setting_sms VALUES("Terima kasih pesan Anda telah kami terima.");



DROP TABLE sys_traffic;

CREATE TABLE `sys_traffic` (
  `Tanggal` date NOT NULL,
  `ipAddress` text NOT NULL,
  `Jumlah` int(10) NOT NULL,
  PRIMARY KEY (`Tanggal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO sys_traffic VALUES("2014-11-15","::1{}","1");
INSERT INTO sys_traffic VALUES("2014-11-16","::1{}","1");
INSERT INTO sys_traffic VALUES("2014-11-18","","3");
INSERT INTO sys_traffic VALUES("2014-11-21","","3");
INSERT INTO sys_traffic VALUES("2014-11-26","::1{}","1");
INSERT INTO sys_traffic VALUES("2014-12-03","127.0.0.1{}","1");
INSERT INTO sys_traffic VALUES("2014-12-04","","3");
INSERT INTO sys_traffic VALUES("2014-12-05","","5");
INSERT INTO sys_traffic VALUES("2014-12-06","127.0.0.1{}","1");
INSERT INTO sys_traffic VALUES("2014-12-08","127.0.0.1{}","1");
INSERT INTO sys_traffic VALUES("2014-12-09","127.0.0.1{}","1");
INSERT INTO sys_traffic VALUES("2014-12-10","","3");
INSERT INTO sys_traffic VALUES("2016-05-25","","2");
INSERT INTO sys_traffic VALUES("2016-05-26","","4");
INSERT INTO sys_traffic VALUES("2016-05-27","","2");
INSERT INTO sys_traffic VALUES("2016-05-28","10.0.2.2{}","1");
INSERT INTO sys_traffic VALUES("2016-05-29","","2");
INSERT INTO sys_traffic VALUES("2016-05-30","10.0.2.2{}","1");
INSERT INTO sys_traffic VALUES("2016-05-31","","3");
INSERT INTO sys_traffic VALUES("2016-06-01","10.0.2.2{}","1");
INSERT INTO sys_traffic VALUES("2016-08-23","","6");
INSERT INTO sys_traffic VALUES("2016-08-24","","7");
INSERT INTO sys_traffic VALUES("2016-08-26","","8");
INSERT INTO sys_traffic VALUES("2016-08-27","192.168.1.66{}","1");
INSERT INTO sys_traffic VALUES("2016-08-28","","3");
INSERT INTO sys_traffic VALUES("2016-08-29","","2");
INSERT INTO sys_traffic VALUES("2016-08-30","","3");
INSERT INTO sys_traffic VALUES("2016-08-31","127.0.0.1{}","1");
INSERT INTO sys_traffic VALUES("2016-09-02","","4");
INSERT INTO sys_traffic VALUES("2016-09-03","","2");
INSERT INTO sys_traffic VALUES("2016-09-04","10.0.2.2{}","1");
INSERT INTO sys_traffic VALUES("2016-09-05","","2");
INSERT INTO sys_traffic VALUES("2016-09-07","","2");
INSERT INTO sys_traffic VALUES("2016-09-08","10.0.2.2{}","1");
INSERT INTO sys_traffic VALUES("2016-09-09","","4");
INSERT INTO sys_traffic VALUES("2016-09-10","","4");
INSERT INTO sys_traffic VALUES("2016-09-11","","2");
INSERT INTO sys_traffic VALUES("2016-09-14","","4");
INSERT INTO sys_traffic VALUES("2016-11-22","::1{}","1");
INSERT INTO sys_traffic VALUES("2016-11-23","::1{}","1");
INSERT INTO sys_traffic VALUES("2016-11-25","","2");
INSERT INTO sys_traffic VALUES("2016-12-15","::1{}","1");
INSERT INTO sys_traffic VALUES("2016-12-20","::1{}","1");
INSERT INTO sys_traffic VALUES("2016-12-23","::1{}","1");
INSERT INTO sys_traffic VALUES("2016-12-29","","2");
INSERT INTO sys_traffic VALUES("2016-12-30","","5");
INSERT INTO sys_traffic VALUES("2017-01-05","","2");
INSERT INTO sys_traffic VALUES("2017-01-06","","2");
INSERT INTO sys_traffic VALUES("2017-01-29","","3");
INSERT INTO sys_traffic VALUES("2017-02-02","","2");
INSERT INTO sys_traffic VALUES("2017-02-03","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-02-04","","5");
INSERT INTO sys_traffic VALUES("2017-02-22","","2");
INSERT INTO sys_traffic VALUES("2017-08-07","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-10-04","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-10-30","","2");
INSERT INTO sys_traffic VALUES("2017-11-01","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-11-02","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-11-03","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-11-09","","2");
INSERT INTO sys_traffic VALUES("2017-11-27","","11");
INSERT INTO sys_traffic VALUES("2017-11-28","","2");
INSERT INTO sys_traffic VALUES("2017-12-01","::1{}","1");
INSERT INTO sys_traffic VALUES("2017-12-02","::1{}","1");



DROP TABLE tweb_alamat_sekarang;

CREATE TABLE `tweb_alamat_sekarang` (
  `id` int(11) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `rt` varchar(100) NOT NULL,
  `rw` varchar(100) NOT NULL,
  `jorong` varchar(100) NOT NULL,
  `nagari` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tweb_cacat;

CREATE TABLE `tweb_cacat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO tweb_cacat VALUES("1","CACAT FISIK");
INSERT INTO tweb_cacat VALUES("2","CACAT NETRA/BUTA");
INSERT INTO tweb_cacat VALUES("3","CACAT RUNGU/WICARA");
INSERT INTO tweb_cacat VALUES("4","CACAT MENTAL/JIWA");
INSERT INTO tweb_cacat VALUES("5","CACAT FISIK DAN MENTAL");
INSERT INTO tweb_cacat VALUES("6","CACAT LAINNYA");
INSERT INTO tweb_cacat VALUES("7","TIDAK CACAT");



DROP TABLE tweb_golongan_darah;

CREATE TABLE `tweb_golongan_darah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO tweb_golongan_darah VALUES("1","A");
INSERT INTO tweb_golongan_darah VALUES("2","B");
INSERT INTO tweb_golongan_darah VALUES("3","AB");
INSERT INTO tweb_golongan_darah VALUES("4","O");
INSERT INTO tweb_golongan_darah VALUES("5","A+");
INSERT INTO tweb_golongan_darah VALUES("6","A-");
INSERT INTO tweb_golongan_darah VALUES("7","B+");
INSERT INTO tweb_golongan_darah VALUES("8","B-");
INSERT INTO tweb_golongan_darah VALUES("9","AB+");
INSERT INTO tweb_golongan_darah VALUES("10","AB-");
INSERT INTO tweb_golongan_darah VALUES("11","O+");
INSERT INTO tweb_golongan_darah VALUES("12","O-");
INSERT INTO tweb_golongan_darah VALUES("13","TIDAK TAHU");



DROP TABLE tweb_keluarga;

CREATE TABLE `tweb_keluarga` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_kk` varchar(160) DEFAULT NULL,
  `nik_kepala` varchar(200) DEFAULT NULL,
  `tgl_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_sosial` int(4) DEFAULT NULL,
  `raskin` int(4) NOT NULL DEFAULT '2',
  `id_bedah_rumah` int(2) NOT NULL DEFAULT '2',
  `id_pkh` int(2) NOT NULL DEFAULT '2',
  `id_blt` int(2) NOT NULL DEFAULT '2',
  `tgl_cetak_kk` datetime DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nik_kepala` (`nik_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_keluarga VALUES("1","5201140104126994","4","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("2","5201140104126995","5","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("3","5201140104166999","9","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("4","5201140105136997","12","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("5","5201140106166996","16","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("6","5201140106167002","17","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("7","5201140106167003","19","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("8","5201140107126996","21","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("9","5201140108146995","25","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("10","5201140109126996","26","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("11","5201140109156994","30","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("12","5201140110137011","32","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("13","5201140110137038","35","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("14","5201140110156997","37","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("15","5201140111126997","38","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("16","5201140111126999","39","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("17","5201140112107003","42","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("18","5201140112126998","45","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("19","5201140202167000","51","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("20","5201140202167002","52","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("21","5201140203136994","55","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("22","5201140203136995","56","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("23","5201140203167003","59","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("24","5201140204166994","61","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("25","5201140205156994","62","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("26","5201140205156995","65","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("27","5201140205156996","68","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("28","5201140205156997","71","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("29","5201140206157000","74","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("30","5201140206157004","76","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("31","5201140207156998","77","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("32","5201140207157000","80","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("33","5201140209156996","83","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("34","5201140210137022","84","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("35","5201140211117001","88","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("36","5201140211117002","91","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("37","5201140211117003","95","2016-09-14 14:27:39","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("38","132556576787898907878","98","2017-02-04 12:17:45","","2","2","2","2","","");
INSERT INTO tweb_keluarga VALUES("39","1313245464563213","99","2017-02-04 12:19:00","","2","2","2","2","","sdadasda");
INSERT INTO tweb_keluarga VALUES("40","57888898999909","100","2017-12-01 23:36:38","","2","2","2","2","","dadadad");



DROP TABLE tweb_nagari_pamong;

CREATE TABLE `tweb_nagari_pamong` (
  `pamong_id` int(5) NOT NULL AUTO_INCREMENT,
  `pamong_nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nik` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jabatan` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `pamong_status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tgl_terdaftar` date DEFAULT NULL,
  PRIMARY KEY (`pamong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tweb_nagari_pamong VALUES("14","LUKMAN HAKIM,S.Sos","","","Wali Nagari","1","2014-04-20");
INSERT INTO tweb_nagari_pamong VALUES("20","YURMA DEWI","19790000000000000","521000000000000","Sekretaris Nagari","1","2016-08-23");
INSERT INTO tweb_nagari_pamong VALUES("21","YONA PUSPITA SARI","-","5201140911720004","Kaur Pemerintahan ","1","2016-08-23");
INSERT INTO tweb_nagari_pamong VALUES("23","LONFIKRI","-","5201145203810001","Kaur Keuangan","1","2016-08-23");
INSERT INTO tweb_nagari_pamong VALUES("24","RIRIN YETDI SARI PUTRI","-","5201140506730002","Kaur Pembangunan ","1","2016-08-23");
INSERT INTO tweb_nagari_pamong VALUES("25","YEL MAIDIATI","","","Bendahara","1","2016-08-23");
INSERT INTO tweb_nagari_pamong VALUES("26","DASMAL","","","Wali Jorong Guguk","1","2017-02-04");
INSERT INTO tweb_nagari_pamong VALUES("27","HUSNI.R","","","Wali Jorong Lareh Nan Panjang","1","2017-02-04");
INSERT INTO tweb_nagari_pamong VALUES("28","KHAIYAR SAHRUL","","","Wali Jorong Koto Tangah","1","2017-02-04");
INSERT INTO tweb_nagari_pamong VALUES("29","Doni Radius","","","Wali Jorong Tanjung Munti","1","2017-02-04");



DROP TABLE tweb_penduduk;

CREATE TABLE `tweb_penduduk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nik` decimal(16,0) NOT NULL,
  `id_kk` int(11) DEFAULT '0',
  `kk_level` tinyint(2) NOT NULL DEFAULT '0',
  `id_rtm` int(11) NOT NULL,
  `rtm_level` int(11) NOT NULL,
  `sex` tinyint(4) unsigned DEFAULT NULL,
  `tempatlahir` varchar(100) NOT NULL,
  `tanggallahir` date NOT NULL,
  `agama_id` int(10) unsigned NOT NULL,
  `pendidikan_kk_id` int(10) unsigned NOT NULL,
  `pendidikan_id` int(10) unsigned NOT NULL,
  `pendidikan_sedang_id` int(10) unsigned NOT NULL,
  `pekerjaan_id` int(10) unsigned NOT NULL,
  `status_kawin` tinyint(4) unsigned NOT NULL,
  `warganegara_id` int(10) unsigned NOT NULL,
  `dokumen_pasport` varchar(45) DEFAULT NULL,
  `dokumen_kitas` int(10) DEFAULT NULL,
  `ayah_nik` varchar(16) NOT NULL,
  `ibu_nik` varchar(16) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `golongan_darah_id` int(11) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `alamat_sebelumnya` varchar(200) NOT NULL,
  `alamat_sekarang` varchar(200) NOT NULL,
  `status_dasar` tinyint(4) NOT NULL DEFAULT '1',
  `hamil` int(1) DEFAULT NULL,
  `cacat_id` int(11) DEFAULT NULL,
  `sakit_menahun_id` int(11) NOT NULL,
  `jamkesmas` int(11) NOT NULL DEFAULT '2',
  `akta_lahir` varchar(40) NOT NULL,
  `akta_perkawinan` varchar(40) NOT NULL,
  `tanggalperkawinan` date NOT NULL,
  `akta_perceraian` varchar(40) NOT NULL,
  `tanggalperceraian` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk VALUES("1","AHLUL","5201142005716996","1","1","3","1","1","JORONG B","1970-05-20","1","3","0","18","26","2","1","","","","","ARFAH","RAISAH","","13","4","1","","","4","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("2","AHMAD ALLIF RIZKI","5201140706966997","1","4","1","1","1","JORONG B","1995-06-07","1","1","0","18","1","1","1","","","","","AHLUL","RUSDAH","","13","4","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("3","AHMAD HABIB","5201140301916995","1","4","2","1","1","JORONG B","1990-01-03","1","3","0","18","1","1","1","","","","","AHLUL","RUSDAH","","13","4","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("4","ADINI SEPTIA LISTA","5201145003976995","1","1","0","0","2","JORONG B","1996-03-10","1","4","0","18","2","2","1","","","","","AHLUL","RUSDAH","","13","4","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("5","AHYAR","5201141003666996","2","1","0","0","1","JAKARTA","1965-03-10","1","5","0","18","88","2","1","","","","","PAIMUN","SUPINAH","","13","8","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("6","APTA MADA RIZKY ALAMSYAH","5201141412121724","2","4","3","2","1","DEPOK","2002-12-14","1","2","0","18","3","1","1","","","","","AHYAR","ALIYAH","","13","8","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("7","ALIYAH","5201144609786995","2","3","0","0","2","BEKASI","1977-09-06","1","5","0","18","2","2","1","","","","","TAGOR SIPAHUTAR","AMAHWATI","","13","8","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("8","ALPIANI","5201144301171725","2","4","0","0","2","BOGOR","2007-01-03","1","1","0","18","1","1","1","","","","","AHYAR","ALIYAH","","13","8","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("9","ASHARI","5201140107867064","3","1","1","2","1","JORONG C","1985-12-30","1","5","0","18","88","2","1","","","","","H. ABDUL KARIM","RADIAH","","13","12","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("10","BACHTIAR HADI","5201142210181724","3","4","0","0","1","MATARAM","2008-10-22","1","1","0","18","1","1","1","","","","","ASHARI","ANGGUN LESTARI PRATAMA","","13","12","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("11","ANGGUN LESTARI PRATAMA","5201146510916995","3","3","0","0","2","JORONG A","1990-10-25","1","4","0","18","88","2","1","","","","","SADIRAH","HJ. ROHANI","","13","12","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("12","DAHRI","5201143112797117","4","1","0","0","1","MASBAGIK","1978-12-31","1","3","0","18","88","2","1","","","","","AMAQ SAHMINI","INAQ SAHMINI","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("13","ERLANGGA DWIKO SAPUTRO","5201140705156994","4","4","0","0","1","MENINTING","2014-05-07","1","1","0","18","1","1","1","","","","","DAHRI","ASMIATUN","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("14","FARIDAH","5201141107101724","4","4","0","0","1","MASBAGIK","2000-07-11","1","3","0","18","3","1","1","","","","","DAHRI","ASMIATUN","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("15","ASMIATUN","5201147112817188","4","3","0","0","2","MASBAGIK","1980-12-31","1","4","0","18","2","2","1","","","","","AMAQ MUJAENI","INAQ SAHMINI","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("16","BAIQ OLIVIA APRILLIANI","5201145211486994","5","1","0","0","2","JORONG A","1947-11-12","1","1","0","18","1","4","1","","","","","AMAQ SINAREP","INAQ SINAREP","","13","8","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("17","FAUZI","5201141210906998","6","1","0","0","1","JORONG C","1989-10-12","1","5","0","18","3","1","1","","","","","SABLI","RAOHUN","","13","17","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("18","DELLA MAHARANI NINGSIH","5201147112947048","6","9","0","0","2","JORONG C","1993-12-31","1","4","0","18","1","1","1","","","","","SABLI","RAOHUN","","13","17","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("19","HAERUL FATONI","5201142911936995","7","1","0","0","1","JORONG A","1992-11-29","1","5","0","18","15","2","1","","","","","ANGKASAH","MARJANAH","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("20","DENATUL SUARTINI","3275014601977005","7","3","0","0","2","JAKARTA","1996-01-06","1","5","0","18","2","2","1","","","","","G. AMIN. P","NGATI","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("21","HERI IRAWAN","5201140607636994","8","1","0","0","1","TELOKE","1962-07-06","1","3","0","18","9","2","1","","","","","AMAK MAJUMI","INAK MIDAH","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("22","HERMAN","5201140305936994","8","4","0","0","1","JORONG A","1992-05-03","1","4","0","18","1","1","1","","","","","HERI IRAWAN","DEWI SAULINA","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("23","DEWI SAULINA","5201144808686994","8","3","0","0","2","KEKERAN","1967-08-08","1","1","0","18","2","2","1","","","","","H. ZAENUDIN","INAK NAH","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("24","ELOK KHALISA SABRINA","5201144408886994","8","4","0","0","2","JORONG A","1987-08-04","1","4","0","18","88","1","1","","","","","SERIMAN","DEWI SAULINA","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("25","I KETUT PAHING","5201142210806997","9","1","0","0","1","MATARAM","1979-10-22","1","5","0","18","88","2","1","","","","","-","-","","2","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("26","IDA BAGUS MAS BUJANA","5201143112707040","10","1","0","0","1","APIT AIK","1969-12-31","1","5","0","18","88","2","1","","","","","SAHMIN","MAOSIN","","13","19","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("27","JOKO PATMOTO","5201141009146994","10","4","0","0","1","JORONG B","2013-09-10","1","1","0","18","1","1","1","","","","","IDA BAGUS MAS BUJANA","FITRIANI","","13","19","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("28","KOMANG SALUN","5201143105121724","10","4","0","0","1","KAYANGAN","2002-05-31","1","2","0","18","3","1","1","","","","","AMILUDIN","FITRIANI","","13","19","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("29","FITRIANI","5201145107836994","10","3","0","0","2","KAYANGAN","1982-07-11","1","4","0","18","2","2","1","","","","","REMBUK","SITIAH","","13","19","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("30","LALU WAWAN DININGRAT","5201141206886994","11","1","0","0","1","JORONG B","1987-06-12","1","5","0","18","88","2","1","","","","","MAHSUN SUBUH","SARDIAH","","13","19","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("31","FITRIANI","5271016801926995","11","3","0","0","2","MATARAM","1991-01-28","1","5","0","18","15","2","1","","","","","UMAR","RUMINSIH","","13","19","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("32","M. FA\'IZ AZAMI","5201143112897123","12","1","0","0","1","GEGELANG","1988-12-31","1","5","0","18","88","2","1","","","","","SAREH","SUTIMAH","","13","20","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("33","HILMIATI","5201146402906994","12","3","0","0","2","JORONG D","1989-02-24","1","4","0","18","88","2","1","","","","","H. MANSYUR","HJ. SA\'ADAH","","13","20","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("34","HJ. PARIDAH","5201144912146994","12","4","0","0","2","MENINTING","2013-12-09","1","1","0","18","1","1","1","","","","","M. FA\'IZ AZAMI","HILMIATI","","13","20","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("35","HJ. SAMIRAH","5201147112767266","13","1","0","0","2","JORONG A","1975-12-31","1","3","0","18","15","3","1","","","","","DAMSYAH","MARWIYAH","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("36","HUR MINAH","5201144504131726","13","4","0","0","2","JORONG A","2003-04-05","1","3","0","18","3","1","1","","","","","MARSINI","KHODIJAH","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("37","HUSNAH","5201145905936994","14","1","0","0","2","LOTIM","1992-05-19","1","4","0","18","88","1","1","","","","","-","-","","13","18","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("38","IDA AYU OKA SUKERTI","5201147112587053","15","1","0","0","2","JORONG C","1957-12-31","1","3","0","18","88","4","1","","","","","ANGGRAH","HABIBAH","","13","17","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("39","M. JAYADI","5201143112837098","16","1","0","0","1","JORONG A","1982-12-31","1","5","0","18","88","2","1","","","","","IKHSAN","SAIDAH","","13","21","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("40","JARIYAH","5201145406916994","16","3","0","0","2","JORONG A","1990-06-14","1","4","0","18","2","2","1","","","","","SEGEP","HURNIWATI","","13","21","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("41","LIHAM SATUN","5201147112116995","16","4","0","0","2","MATARAM","2010-12-31","1","1","0","18","1","1","1","","","","","M. JAYADI","JARIYAH","","13","21","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("42","M. NUR SAHID","5201140507916996","17","1","0","0","1","JORONG C","1990-07-05","1","4","0","18","88","2","1","","","","","-","-","","13","12","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("43","MADE ASTAWE","5201142503181724","17","4","0","0","1","JORONG C","2008-03-25","1","1","0","18","1","1","1","","","","","M. NUR SAHID","MAISAH","","13","12","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("44","MAISAH","5201144605936994","17","3","0","0","2","JORONG C","1992-05-06","4","1","0","18","88","2","1","","","","","-","-","","13","12","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("45","MARSUNIN YOGA PRATAMA","5201143112677056","18","1","0","0","1","PEJARAKAN","1966-12-31","1","3","0","18","9","2","1","","","","","MISRAH","INAQ MISDAH","","13","22","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("46","MARZUKI","5201141003966996","18","4","0","0","1","JORONG D","1995-03-10","1","5","0","18","3","1","1","","","","","MARSUNIN YOGA PRATAMA","MARLIA SAJIDA","","13","22","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("47","MUHAMAD HAMDI","5201141706986996","18","4","0","0","1","JORONG D","1997-06-17","1","4","0","18","3","1","1","","","","","MARSUNIN YOGA PRATAMA","MARLIA SAJIDA","","13","22","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("48","MARLIA SAJIDA","5201147112707088","18","3","0","0","2","PEJARAKAN","1969-12-31","1","3","0","18","2","2","1","","","","","H. ZAINUDIN","INAQ NAH","","13","22","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("49","MIRA FANDA","5201146704906995","18","4","0","0","2","JORONG D","1989-04-27","1","5","0","18","88","4","1","","","","","MARSUNIN YOGA PRATAMA","MARLIA SAJIDA","","13","22","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("50","MUNAAH","5201146304171724","18","4","0","0","2","JORONG D","2007-04-23","1","1","0","18","1","1","1","","","","","MARSUNIN YOGA PRATAMA","MARLIA SAJIDA","","13","22","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("51","MUHAMAD KABIR","5201140107917031","19","1","0","0","1","JORONG A","1985-12-31","1","3","0","18","88","2","1","","","","","MUNIAH","SALIKIN","","13","23","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("52","MUHAMAD SUHAD","5201141704876995","20","1","0","0","1","JORONG A","1982-12-10","1","5","0","18","15","2","1","","","","","MUNIAH","HAJRIAH","","13","24","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("53","MUHAMMAD HAIKAL FIRMANSYAH","5201140308151724","20","4","0","0","1","JORONG D","2005-08-03","1","2","0","18","1","1","1","","","","","MUHAMAD SUHAD","KHADIJAH","","13","24","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("54","MURNIAH","5201145904846994","20","3","0","0","2","SETANGI","1991-03-04","1","4","0","18","2","2","1","","","","","SAHABUDIN","SAKMAH","","13","24","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("55","MURNIATI SAGITA","5201144112726996","21","1","0","0","2","YOGYAKARTA","1971-12-01","1","5","0","18","88","2","1","","","","","UMAR SANTOSA","MIRANTI","","1","8","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("56","MUHAMMAD RIFAI","5201143105926995","22","1","0","0","1","JORONG D","1991-05-31","4","4","0","18","88","2","1","","","","","I WAYAN MERTI","NI NYOMAN RENI","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("57","NADIA ROSDIANA","5201144305936996","22","3","0","0","2","MATARAM","1992-05-03","4","4","0","18","2","2","1","","","","","I WAYAN PARTA","NI NENGAH SUDINI","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("58","NI KOMANG PONIASIH","5201146206126994","22","4","0","0","2","MATARAM","2011-06-22","4","1","0","18","1","1","1","","","","","MURNIATI SAGITA","NADIA ROSDIANA","","13","16","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("59","MUHAMMAD WIRDA MAULANA IBRAHIM","5201143112417056","23","1","0","0","1","JORONG A","1940-12-31","1","1","0","18","9","2","1","","","","","AMAQ SUN -ALM-","INAQ SUN -ALM-","","13","23","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("60","NI LUH NITA SARI","5201147112466997","23","3","0","0","2","SENTELUK","1945-12-31","1","1","0","18","2","2","1","","","","","AMAQ IRAH","INAQ IRAH","","13","23","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("61","NI NENGAH AYU KARSINI","5201145505946996","24","1","0","0","2","JORONG A","1993-05-15","1","2","0","18","15","1","1","","","","","H HAMDANI","SANERIAH","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("62","MUKSAN","5201143112957094","25","1","0","0","1","JORONG B","1994-12-31","1","4","0","18","88","2","1","","","","","MISDAH","RABIAH","","13","26","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("63","NURHAYATI","5201145509146994","25","4","0","0","2","MENINTING","2013-09-15","1","1","0","18","1","1","1","","","","","MUKSAN","NUR\'AINI","","13","26","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("64","MURSIDIN","5201142204966994","26","4","0","0","1","JORONG B","1995-04-22","1","3","0","18","11","1","1","","","","","RUSNAH (ALM)","NURHIDAYAH","","13","26","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("65","NURHIDAYAH","5201144209766995","26","1","0","0","2","JORONG B","1975-09-02","1","3","0","18","2","4","1","","","","","ISMAIL","JUMINAH","","13","26","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("66","NURJANAH","5201145005101724","26","4","0","0","2","MONTONG","2000-05-10","1","4","0","18","3","1","1","","","","","RUSNAH (ALM)","NURHIDAYAH","","13","26","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("67","NURUL AINUN","5201144108121724","26","4","0","0","2","JORONG B","2002-08-01","1","2","0","18","3","1","1","","","","","RUSNAH","NURHIDAYAH","","13","26","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("68","MUSAHAB","5201141607936996","27","1","0","0","1","LOTENG","1992-07-16","1","6","0","18","88","2","1","","","","","LALU ROSIDI","BQ. ALISA","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("69","NURUL FAIZAH","5201145003936994","27","3","0","0","2","JORONG A","1992-03-10","1","5","0","18","88","2","1","","","","","SAHUR","SARE\'AH","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("70","NURUL HIDAYATI","5201147004136996","27","4","0","0","2","MATARAM","2012-04-30","1","1","0","18","1","1","1","","","","","MUSAHAB","NURUL FAIZAH","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("71","NAPIAH","5201141303906995","28","1","0","0","1","JORONG A","1989-03-13","1","4","0","18","11","2","1","","","","","MUNIAH","HAJARIAH","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("72","RACHEL YULIANTI","5201146507966995","28","3","0","0","2","MELASE","1995-07-25","1","4","0","18","2","2","1","","","","","LUKMAN","MUSNAH","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("73","RAISHA MAULIDYA","5201144701156995","28","4","0","0","2","MENINTING","2014-01-07","1","1","0","18","1","1","1","","","","","NAPIAH","RACHEL YULIANTI","","13","25","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("74","PATANUL HUSNUL","5201143112667000","29","1","0","0","1","JAWA TIMUR","1965-12-31","1","5","0","18","88","2","1","","","","","AHMAD","ASIH","","13","17","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("75","RATNAWATY","5201145512796995","29","3","0","0","2","JORONG C","1978-12-15","1","5","0","18","84","2","1","","","","","JUM","REMAH","","13","17","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("76","RABITAH","5201140312896994","30","1","0","0","1","JORONG C","1988-12-03","4","4","0","18","88","1","1","","","","","-","-","","13","27","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("77","ROMI FAISAL","5201141506856997","31","1","0","0","1","JORONG B","1984-06-15","1","3","0","18","15","2","1","","","","","MUNTAHAR","MAKNAH","","13","28","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("78","RAUDATUL ILMI","5201145808816994","31","3","0","0","2","IRENG DAYE","1980-08-18","1","4","0","18","2","2","1","","","","","MUDAHIR","RUMISAH","","13","28","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("79","ROHANI","5201144306116994","31","4","0","0","2","JORONG B","2010-06-03","1","1","0","18","1","1","1","","","","","ROMI FAISAL","RAUDATUL ILMI","","13","28","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("80","RUKIAH","5201145909946994","32","1","0","0","2","SERANG","1993-09-19","1","4","0","18","88","3","1","","","","","-","-","","13","29","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("81","RUMALI","5201144507886994","32","9","0","0","2","JAKARTA","1987-07-05","1","4","0","18","88","1","1","","","","","-","-","","13","29","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("82","RONI","5201140301836997","33","4","0","0","1","DENPASAR","1982-01-03","4","5","0","18","15","1","1","","","","","IDA BAGUS PUTU WIADNYA","RUSMAYANTI","","13","30","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("83","RUSMAYANTI","5201145003546994","33","1","0","0","2","DENPASAR","1953-03-10","4","5","0","18","88","2","1","","","","","IDA BAGUS MAS","IDA AYU RAKA","","13","30","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("84","RUSNI","5201143112707180","34","1","0","0","1","KEKERAN","1969-12-31","1","3","0","18","9","2","1","","","","","-","-","","13","29","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("85","SAPIAH","5201147011726994","34","3","0","0","2","KEKERAN","1971-11-30","1","3","0","18","2","2","1","","","","","-","-","","13","29","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("86","SAPINAH","5201145701966994","34","4","0","0","2","JORONG A","1995-01-17","1","5","0","18","3","1","1","","","","","RUSNI","SAPIAH","","13","29","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("87","SARRA LANGELAND","5201145111946996","34","4","0","0","2","JORONG A","1993-11-11","1","5","0","18","3","1","1","","","","","RUSNI","SAPIAH","","13","29","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("88","SAHRONI","5201143112617096","35","1","0","0","1","MEDAS","1960-12-31","1","4","0","18","88","2","1","","","","","SADIYAH","INAQ SADIAH","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("89","SERIMAN","5201141012846995","35","4","0","0","1","JORONG A","1983-12-10","1","5","0","18","15","1","1","","","","","SAHRONI","NURLAELA","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("90","SUNYOTOH","5201143112817139","35","4","0","0","1","MEDAS","1980-12-31","1","5","0","18","15","1","1","","","","","SAHRONI","NURLAELA","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("91","SYARIFUL KALAM","5201141707776994","36","1","0","0","1","JORONG A","1976-07-17","1","5","0","18","88","2","1","","","","","H. ABDURAHMAN","NAFISAH","","1","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("92","SITI AISYAH","5201146210776994","36","3","0","0","2","SUKARAJA","1976-10-22","1","4","0","18","2","2","1","","","","","AMINALLOH","RAEHAN","","2","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("93","SITI PAOZIAH","5201146312161724","36","4","0","0","2","JORONG A","2006-12-23","1","1","0","18","1","1","1","","","","","SYARIFUL KALAM","SITI AISYAH","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("94","SUKMA UTAMI","5201144607996998","36","4","0","0","2","JORONG A","1998-07-06","1","4","0","18","3","1","1","","","","","SYARIFUL KALAM","SITI AISYAH","","5","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("95","WAHID ALIAS H. MAHSUN","5201141212816996","37","1","0","0","1","JORONG A","1980-12-12","1","5","0","18","88","2","1","","","","","H. ABDURRAHMAN","NAFISAH","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("96","WAYAN EKA PRAWATA","5201142003136994","37","4","0","0","1","GUNUNG SARI","2012-03-20","1","1","0","18","1","1","1","","","","","WAHID ALIAS H. MAHSUN","ULFA WIDIAWATI","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("97","ULFA WIDIAWATI","5201145203896994","37","3","0","0","2","JOHAR PELITA","1988-03-12","1","5","0","18","88","2","1","","","","","ZAMHARIN","SITIYAH","","13","31","1","","","1","","","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("98","Irfan","1234567890123456","38","1","0","0","1","Bukittinggi","0000-00-00","1","3","0","0","0","0","0","","0","","","","","","7","5","1","","","1","0","0","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("99","DERIO","2345678909876543","39","1","0","0","1","PASAMAN","0000-00-00","1","5","0","11","5","2","1","","0","","","HUTUI","HATOI","","12","1","3","","","1","0","0","0","2","","","0000-00-00","","0000-00-00");
INSERT INTO tweb_penduduk VALUES("100","dero","3545465768789876","40","1","0","0","2","pasaman","0000-00-00","1","1","0","1","3","1","1","","0","","","derio","kurlul","","2","1","1","","","1","0","0","0","2","8909-909","","0000-00-00","","0000-00-00");



DROP TABLE tweb_penduduk_agama;

CREATE TABLE `tweb_penduduk_agama` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_agama VALUES("1","ISLAM");
INSERT INTO tweb_penduduk_agama VALUES("2","KRISTEN");
INSERT INTO tweb_penduduk_agama VALUES("3","KATHOLIK");
INSERT INTO tweb_penduduk_agama VALUES("4","HINDU");
INSERT INTO tweb_penduduk_agama VALUES("5","BUDHA");
INSERT INTO tweb_penduduk_agama VALUES("6","KHONGHUCU");
INSERT INTO tweb_penduduk_agama VALUES("7","Kepercayaan Terhadap Tuhan YME / Lainnya");



DROP TABLE tweb_penduduk_hubungan;

CREATE TABLE `tweb_penduduk_hubungan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_hubungan VALUES("1","KEPALA KELUARGA");
INSERT INTO tweb_penduduk_hubungan VALUES("2","SUAMI");
INSERT INTO tweb_penduduk_hubungan VALUES("3","ISTRI");
INSERT INTO tweb_penduduk_hubungan VALUES("4","ANAK");
INSERT INTO tweb_penduduk_hubungan VALUES("5","MENANTU");
INSERT INTO tweb_penduduk_hubungan VALUES("6","CUCU");
INSERT INTO tweb_penduduk_hubungan VALUES("7","ORANGTUA");
INSERT INTO tweb_penduduk_hubungan VALUES("8","MERTUA");
INSERT INTO tweb_penduduk_hubungan VALUES("9","FAMILI LAIN");
INSERT INTO tweb_penduduk_hubungan VALUES("10","PEMBANTU");
INSERT INTO tweb_penduduk_hubungan VALUES("11","LAINNYA");



DROP TABLE tweb_penduduk_kawin;

CREATE TABLE `tweb_penduduk_kawin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_kawin VALUES("1","BELUM KAWIN");
INSERT INTO tweb_penduduk_kawin VALUES("2","KAWIN");
INSERT INTO tweb_penduduk_kawin VALUES("3","CERAI HIDUP");
INSERT INTO tweb_penduduk_kawin VALUES("4","CERAI MATI");



DROP TABLE tweb_penduduk_mandiri;

CREATE TABLE `tweb_penduduk_mandiri` (
  `nik` decimal(16,0) NOT NULL,
  `pin` char(32) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `tanggal_buat` datetime NOT NULL,
  PRIMARY KEY (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tweb_penduduk_mandiri VALUES("3275014601977005","3645e735f033e8482be0c7993fcba946","2016-09-14 12:51:53","2016-09-14 10:10:47");
INSERT INTO tweb_penduduk_mandiri VALUES("5201140706966997","3645e735f033e8482be0c7993fcba946","2016-09-14 12:53:47","2016-09-14 06:06:32");
INSERT INTO tweb_penduduk_mandiri VALUES("5201145003976995","3645e735f033e8482be0c7993fcba946","2017-02-04 15:28:26","2017-02-04 08:35:03");



DROP TABLE tweb_penduduk_map;

CREATE TABLE `tweb_penduduk_map` (
  `id` int(11) NOT NULL,
  `lat` varchar(24) NOT NULL,
  `lng` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO tweb_penduduk_map VALUES("7","-7.980601700336039","110.22508726486967");
INSERT INTO tweb_penduduk_map VALUES("3","-7.931639102143979","110.21375761399077");



DROP TABLE tweb_penduduk_pekerjaan;

CREATE TABLE `tweb_penduduk_pekerjaan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_pekerjaan VALUES("1","BELUM/TIDAK BEKERJA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("2","MENGURUS RUMAH TANGGA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("3","PELAJAR/MAHASISWA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("4","PENSIUNAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("5","PEGAWAI NEGERI SIPIL (PNS)");
INSERT INTO tweb_penduduk_pekerjaan VALUES("6","TENTARA NASIONAL INDONESIA (TNI)");
INSERT INTO tweb_penduduk_pekerjaan VALUES("7","KEPOLISIAN RI (POLRI)");
INSERT INTO tweb_penduduk_pekerjaan VALUES("8","PERDAGANGAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("9","PETANI/PERKEBUNAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("10","PETERNAK");
INSERT INTO tweb_penduduk_pekerjaan VALUES("11","NELAYAN/PERIKANAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("12","INDUSTRI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("13","KONSTRUKSI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("14","TRANSPORTASI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("15","KARYAWAN SWASTA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("16","KARYAWAN BUMN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("17","KARYAWAN BUMD");
INSERT INTO tweb_penduduk_pekerjaan VALUES("18","KARYAWAN HONORER");
INSERT INTO tweb_penduduk_pekerjaan VALUES("19","BURUH HARIAN LEPAS");
INSERT INTO tweb_penduduk_pekerjaan VALUES("20","BURUH TANI/PERKEBUNAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("21","BURUH NELAYAN/PERIKANAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("22","BURUH PETERNAKAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("23","PEMBANTU RUMAH TANGGA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("24","TUKANG CUKUR");
INSERT INTO tweb_penduduk_pekerjaan VALUES("25","TUKANG LISTRIK");
INSERT INTO tweb_penduduk_pekerjaan VALUES("26","TUKANG BATU");
INSERT INTO tweb_penduduk_pekerjaan VALUES("27","TUKANG KAYU");
INSERT INTO tweb_penduduk_pekerjaan VALUES("28","TUKANG SOL SEPATU");
INSERT INTO tweb_penduduk_pekerjaan VALUES("29","TUKANG LAS/PANDAI BESI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("30","TUKANG JAHIT");
INSERT INTO tweb_penduduk_pekerjaan VALUES("31","TUKANG GIGI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("32","PENATA RIAS");
INSERT INTO tweb_penduduk_pekerjaan VALUES("33","PENATA BUSANA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("34","PENATA RAMBUT");
INSERT INTO tweb_penduduk_pekerjaan VALUES("35","MEKANIK");
INSERT INTO tweb_penduduk_pekerjaan VALUES("36","SENIMAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("37","TABIB");
INSERT INTO tweb_penduduk_pekerjaan VALUES("38","PARAJI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("39","PERANCANG BUSANA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("40","PENTERJEMAH");
INSERT INTO tweb_penduduk_pekerjaan VALUES("41","IMAM MASJID");
INSERT INTO tweb_penduduk_pekerjaan VALUES("42","PENDETA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("43","PASTOR");
INSERT INTO tweb_penduduk_pekerjaan VALUES("44","WARTAWAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("45","USTADZ/MUBALIGH");
INSERT INTO tweb_penduduk_pekerjaan VALUES("46","JURU MASAK");
INSERT INTO tweb_penduduk_pekerjaan VALUES("47","PROMOTOR ACARA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("48","ANGGOTA DPR-RI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("49","ANGGOTA DPD");
INSERT INTO tweb_penduduk_pekerjaan VALUES("50","ANGGOTA BPK");
INSERT INTO tweb_penduduk_pekerjaan VALUES("51","PRESIDEN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("52","WAKIL PRESIDEN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("53","ANGGOTA MAHKAMAH KONSTITUSI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("54","ANGGOTA KABINET KEMENTERIAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("55","DUTA BESAR");
INSERT INTO tweb_penduduk_pekerjaan VALUES("56","GUBERNUR");
INSERT INTO tweb_penduduk_pekerjaan VALUES("57","WAKIL GUBERNUR");
INSERT INTO tweb_penduduk_pekerjaan VALUES("58","BUPATI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("59","WAKIL BUPATI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("60","WALIKOTA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("61","WAKIL WALIKOTA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("62","ANGGOTA DPRD PROVINSI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("63","ANGGOTA DPRD KABUPATEN/KOTA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("64","DOSEN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("65","GURU");
INSERT INTO tweb_penduduk_pekerjaan VALUES("66","PILOT");
INSERT INTO tweb_penduduk_pekerjaan VALUES("67","PENGACARA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("68","NOTARIS");
INSERT INTO tweb_penduduk_pekerjaan VALUES("69","ARSITEK");
INSERT INTO tweb_penduduk_pekerjaan VALUES("70","AKUNTAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("71","KONSULTAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("72","DOKTER");
INSERT INTO tweb_penduduk_pekerjaan VALUES("73","BIDAN");
INSERT INTO tweb_penduduk_pekerjaan VALUES("74","PERAWAT");
INSERT INTO tweb_penduduk_pekerjaan VALUES("75","APOTEKER");
INSERT INTO tweb_penduduk_pekerjaan VALUES("76","PSIKIATER/PSIKOLOG");
INSERT INTO tweb_penduduk_pekerjaan VALUES("77","PENYIAR TELEVISI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("78","PENYIAR RADIO");
INSERT INTO tweb_penduduk_pekerjaan VALUES("79","PELAUT");
INSERT INTO tweb_penduduk_pekerjaan VALUES("80","PENELITI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("81","SOPIR");
INSERT INTO tweb_penduduk_pekerjaan VALUES("82","PIALANG");
INSERT INTO tweb_penduduk_pekerjaan VALUES("83","PARANORMAL");
INSERT INTO tweb_penduduk_pekerjaan VALUES("84","PEDAGANG");
INSERT INTO tweb_penduduk_pekerjaan VALUES("85","PERANGKAT nagari");
INSERT INTO tweb_penduduk_pekerjaan VALUES("86","KEPALA nagari");
INSERT INTO tweb_penduduk_pekerjaan VALUES("87","BIARAWATI");
INSERT INTO tweb_penduduk_pekerjaan VALUES("88","WIRASWASTA");
INSERT INTO tweb_penduduk_pekerjaan VALUES("89","LAINNYA");



DROP TABLE tweb_penduduk_pendidikan;

CREATE TABLE `tweb_penduduk_pendidikan` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_pendidikan VALUES("1","BELUM MASUK TK/KELOMPOK BERMAIN");
INSERT INTO tweb_penduduk_pendidikan VALUES("2","SEDANG TK/KELOMPOK BERMAIN");
INSERT INTO tweb_penduduk_pendidikan VALUES("3","TIDAK PERNAH SEKOLAH");
INSERT INTO tweb_penduduk_pendidikan VALUES("4","SEDANG SD/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("5","TIDAK TAMAT SD/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("6","SEDANG SLTP/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("7","SEDANG SLTA/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("8","SEDANG  D-1/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("9","SEDANG D-2/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("10","SEDANG D-3/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("11","SEDANG  S-1/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("12","SEDANG S-2/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("13","SEDANG S-3/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("14","SEDANG SLB A/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("15","SEDANG SLB B/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("16","SEDANG SLB C/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan VALUES("17","TIDAK DAPAT MEMBACA DAN MENULIS HURUF LATIN/ARAB");
INSERT INTO tweb_penduduk_pendidikan VALUES("18","TIDAK SEDANG SEKOLAH");



DROP TABLE tweb_penduduk_pendidikan_kk;

CREATE TABLE `tweb_penduduk_pendidikan_kk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_pendidikan_kk VALUES("1","TIDAK / BELUM SEKOLAH");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("2","BELUM TAMAT SD/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("3","TAMAT SD / SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("4","SLTP/SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("5","SLTA / SEDERAJAT");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("6","DIPLOMA I / II");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("7","AKADEMI/ DIPLOMA III/S. MUDA");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("8","DIPLOMA IV/ STRATA I");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("9","STRATA II");
INSERT INTO tweb_penduduk_pendidikan_kk VALUES("10","STRATA III");



DROP TABLE tweb_penduduk_sex;

CREATE TABLE `tweb_penduduk_sex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_penduduk_sex VALUES("1","LAKI-LAKI");
INSERT INTO tweb_penduduk_sex VALUES("2","PEREMPUAN");



DROP TABLE tweb_penduduk_status;

CREATE TABLE `tweb_penduduk_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tweb_penduduk_status VALUES("1","TETAP");
INSERT INTO tweb_penduduk_status VALUES("2","TIDAK AKTIF");
INSERT INTO tweb_penduduk_status VALUES("3","PENDATANG");



DROP TABLE tweb_penduduk_umur;

CREATE TABLE `tweb_penduduk_umur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  `dari` int(11) DEFAULT NULL,
  `sampai` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

INSERT INTO tweb_penduduk_umur VALUES("1","BALITA","0","5","");
INSERT INTO tweb_penduduk_umur VALUES("2","ANAK-ANAK","6","17","");
INSERT INTO tweb_penduduk_umur VALUES("3","DEWASA","18","30","");
INSERT INTO tweb_penduduk_umur VALUES("4","TUA","31","120","");
INSERT INTO tweb_penduduk_umur VALUES("6","Bayi ( < 1 ) Tahun","0","1","1");
INSERT INTO tweb_penduduk_umur VALUES("9","Balita ( 2 > 4 ) Tahun","2","4","1");
INSERT INTO tweb_penduduk_umur VALUES("12","Anak-anak ( 5 > 9 ) Tahun","5","9","1");
INSERT INTO tweb_penduduk_umur VALUES("13","Anak-anak ( 10 > 14 ) Tah","10","14","1");
INSERT INTO tweb_penduduk_umur VALUES("14","Remaja ( 15 > 19 ) Tahun","15","19","1");
INSERT INTO tweb_penduduk_umur VALUES("15","Remaja ( 20 > 24 ) Tahun","20","24","1");
INSERT INTO tweb_penduduk_umur VALUES("16","Dewasa ( 25 > 29 ) Tahun","25","29","1");
INSERT INTO tweb_penduduk_umur VALUES("17","Dewasa ( 30 > 34 ) Tahun","30","34","1");
INSERT INTO tweb_penduduk_umur VALUES("18","Dewasa ( 35 > 39 ) Tahun ","35","39","1");
INSERT INTO tweb_penduduk_umur VALUES("19","Dewasa ( 40 > 44 ) Tahun","40","44","1");
INSERT INTO tweb_penduduk_umur VALUES("20","Tua ( 45 > 49 ) Tahun","45","49","1");
INSERT INTO tweb_penduduk_umur VALUES("21","Tua ( 50 > 54 ) Tahun","50","54","1");
INSERT INTO tweb_penduduk_umur VALUES("22","Tua ( 55 > 59 ) Tahun","55","59","1");
INSERT INTO tweb_penduduk_umur VALUES("23","Tua ( 60 > 64 ) Tahun","60","64","1");
INSERT INTO tweb_penduduk_umur VALUES("24","Tua ( 65 > 69 ) Tahun","65","69","1");
INSERT INTO tweb_penduduk_umur VALUES("25","Tua ( 70 > 74 ) Tahun","70","74","1");
INSERT INTO tweb_penduduk_umur VALUES("26","Lansia ( > 75 ) Tahun","75","130","1");



DROP TABLE tweb_penduduk_warganegara;

CREATE TABLE `tweb_penduduk_warganegara` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tweb_penduduk_warganegara VALUES("1","WNI");
INSERT INTO tweb_penduduk_warganegara VALUES("2","WNA");
INSERT INTO tweb_penduduk_warganegara VALUES("3","DUA KEWARGANEGARAAN");



DROP TABLE tweb_rtm;

CREATE TABLE `tweb_rtm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik_kepala` int(11) NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kelas_sosial` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tweb_rtm VALUES("1","115","01140500001","2016-11-26 00:13:59","0");
INSERT INTO tweb_rtm VALUES("2","3","01-0500002","2017-12-02 08:58:29","0");
INSERT INTO tweb_rtm VALUES("3","1","01-0500003","2017-12-02 10:26:07","0");



DROP TABLE tweb_rtm_hubungan;

CREATE TABLE `tweb_rtm_hubungan` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tweb_rtm_hubungan VALUES("1","Kepala Rumah Tangga");
INSERT INTO tweb_rtm_hubungan VALUES("2","Anggota");



DROP TABLE tweb_sakit_menahun;

CREATE TABLE `tweb_sakit_menahun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO tweb_sakit_menahun VALUES("1","JANTUNG");
INSERT INTO tweb_sakit_menahun VALUES("2","LEVER");
INSERT INTO tweb_sakit_menahun VALUES("3","PARU-PARU");
INSERT INTO tweb_sakit_menahun VALUES("4","KANKER");
INSERT INTO tweb_sakit_menahun VALUES("5","STROKE");
INSERT INTO tweb_sakit_menahun VALUES("6","DIABETES MELITUS");
INSERT INTO tweb_sakit_menahun VALUES("7","GINJAL");
INSERT INTO tweb_sakit_menahun VALUES("8","MALARIA");
INSERT INTO tweb_sakit_menahun VALUES("9","LEPRA/KUSTA");
INSERT INTO tweb_sakit_menahun VALUES("10","HIV/AIDS");
INSERT INTO tweb_sakit_menahun VALUES("11","GILA/STRESS");
INSERT INTO tweb_sakit_menahun VALUES("12","TBC");
INSERT INTO tweb_sakit_menahun VALUES("13","ASTHMA");
INSERT INTO tweb_sakit_menahun VALUES("14","TIDAK ADA/TIDAK SAKIT");



DROP TABLE tweb_status_dasar;

CREATE TABLE `tweb_status_dasar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tweb_status_dasar VALUES("1","HIDUP");
INSERT INTO tweb_status_dasar VALUES("2","MATI");
INSERT INTO tweb_status_dasar VALUES("3","PINDAH");
INSERT INTO tweb_status_dasar VALUES("4","HILANG");



DROP TABLE tweb_surat_atribut;

CREATE TABLE `tweb_surat_atribut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_surat` int(11) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `long` tinyint(4) NOT NULL,
  `kode` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




DROP TABLE tweb_surat_format;

CREATE TABLE `tweb_surat_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `url_surat` varchar(100) NOT NULL,
  `kode_surat` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_surat` (`url_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

INSERT INTO tweb_surat_format VALUES("1","Keterangan Pengantar","surat_ket_pengantar","S-01");
INSERT INTO tweb_surat_format VALUES("2","Keterangan Penduduk","surat_ket_penduduk","S-02");
INSERT INTO tweb_surat_format VALUES("3","Biodata Penduduk","surat_bio_penduduk","S-03");
INSERT INTO tweb_surat_format VALUES("5","Keterangan Pindah Penduduk","surat_ket_pindah_penduduk","S-04");
INSERT INTO tweb_surat_format VALUES("6","Keterangan Jual Beli","surat_ket_jual_beli","S-05");
INSERT INTO tweb_surat_format VALUES("7","Pengantar Pindah Antar Kabupaten/ Provinsi","surat_pindah_antar_kab_prov","S-06");
INSERT INTO tweb_surat_format VALUES("8","Pengantar Surat Keterangan Catatan Kepolisian","surat_ket_catatan_kriminal","S-07");
INSERT INTO tweb_surat_format VALUES("9","Keterangan KTP dalam Proses","surat_ket_ktp_dalam_proses","S-08");
INSERT INTO tweb_surat_format VALUES("10","Keterangan Beda Identitas","surat_ket_beda_nama","S-09");
INSERT INTO tweb_surat_format VALUES("11","Keterangan Bepergian / Jalan","surat_jalan","S-10");
INSERT INTO tweb_surat_format VALUES("12","Keterangan Kurang Mampu","surat_ket_kurang_mampu","S-11");
INSERT INTO tweb_surat_format VALUES("13","Pengantar Izin Keramaian","surat_izin_keramaian","S-12");
INSERT INTO tweb_surat_format VALUES("14","Pengantar Laporan Kehilangan","surat_ket_kehilangan","S-13");
INSERT INTO tweb_surat_format VALUES("15","Keterangan Usaha","surat_ket_usaha","S-14");
INSERT INTO tweb_surat_format VALUES("16","Keterangan JAMKESOS","surat_ket_jamkesos","S-15");
INSERT INTO tweb_surat_format VALUES("17","Keterangan Domisili Usaha","surat_ket_domisili_usaha","S-16");
INSERT INTO tweb_surat_format VALUES("18","Keterangan Kelahiran","surat_ket_kelahiran","S-17");
INSERT INTO tweb_surat_format VALUES("20","Permohonan Akta Lahir","surat_permohonan_akta","S-18");
INSERT INTO tweb_surat_format VALUES("21","Pernyataan Belum Memiliki Akta Lahir","surat_pernyataan_akta","S-19");
INSERT INTO tweb_surat_format VALUES("22","Permohonan Duplikat Kelahiran","surat_permohonan_duplikat_kelahiran","S-20");
INSERT INTO tweb_surat_format VALUES("24","Keterangan Kematian","surat_ket_kematian","S-21");
INSERT INTO tweb_surat_format VALUES("25","Keterangan Lahir Mati","surat_ket_lahir_mati","S-22");
INSERT INTO tweb_surat_format VALUES("26","Keterangan Untuk Nikah (N-1)","surat_ket_nikah","S-23");
INSERT INTO tweb_surat_format VALUES("27","Keterangan Asal Usul (N-2)","surat_ket_asalusul","S-24");
INSERT INTO tweb_surat_format VALUES("28","Persetujuan Mempelai (N-3)","surat_persetujuan_mempelai","S-25");
INSERT INTO tweb_surat_format VALUES("29","Keterangan Tentang Orang Tua (N-4)","surat_ket_orangtua","S-26");
INSERT INTO tweb_surat_format VALUES("30","Keterangan Izin Orang Tua(N-5)","surat_izin_orangtua","S-27");
INSERT INTO tweb_surat_format VALUES("31","Keterangan Kematian Suami/Istri(N-6)","surat_ket_kematian_suami_istri","S-28");
INSERT INTO tweb_surat_format VALUES("32","Pemberitahuan Kehendak Nikah (N-7)","surat_kehendak_nikah","S-29");
INSERT INTO tweb_surat_format VALUES("33","Keterangan Pergi Kawin","surat_ket_pergi_kawin","S-30");
INSERT INTO tweb_surat_format VALUES("34","Keterangan Wali","surat_ket_wali","S-31");
INSERT INTO tweb_surat_format VALUES("35","Keterangan Wali Hakim","surat_ket_wali_hakim","S-32");
INSERT INTO tweb_surat_format VALUES("36","Permohonan Duplikat Surat Nikah","surat_permohonan_duplikat_surat_nikah","S-33");
INSERT INTO tweb_surat_format VALUES("37","Permohonan Cerai","surat_permohonan_cerai","S-34");
INSERT INTO tweb_surat_format VALUES("38","Keterangan Pengantar Rujuk/Cerai","surat_ket_rujuk_cerai","S-35");
INSERT INTO tweb_surat_format VALUES("44","Ubah Sesuaikan","surat_ubah_sesuaikan","S-99");



DROP TABLE tweb_wil_clusternagari;

CREATE TABLE `tweb_wil_clusternagari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rt` varchar(10) NOT NULL DEFAULT '0',
  `rw` varchar(10) NOT NULL DEFAULT '0',
  `jorong` varchar(50) NOT NULL DEFAULT '0',
  `id_kepala` int(11) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `zoom` int(5) NOT NULL,
  `path` text NOT NULL,
  `map_tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rt` (`rt`,`rw`,`jorong`),
  KEY `id_kepala` (`id_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

INSERT INTO tweb_wil_clusternagari VALUES("1","0","0","JORONG LAREH NAN PANJANG","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("2","0","-","JORONG B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("3","-","-","JORONG B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("4","004","-","JORONG B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("5","0","0","JORONG GUGUK","7","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("6","0","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("7","-","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("8","001","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("9","0","0","JORONG TANJUNG MUNTI","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("10","0","-","JORONG C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("11","-","-","JORONG C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("12","002","-","JORONG C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("13","0","0","JORONG KOTO TANGAH","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("14","0","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("15","-","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("16","003","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("17","001","-","JORONG C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("18","005","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("19","005","-","JORONG B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("20","005","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("21","003","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("22","002","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("23","004","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("24","004","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("25","001","-","JORONG D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("26","002","-","JORONG B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("27","004","-","JORONG C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("28","003","-","JORONG B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("29","006","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("30","006","-","JORONG C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("31","002","-","JORONG A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("33","0","-","Bingkudu","1","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("34","-","-","Bingkudu","1","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("36","0","-","V_Suku_Ateh","7","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("37","-","-","V_Suku_Ateh","7","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("38","0","0","JORONG HARAU","3","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("39","0","-","JORONG_A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("40","-","-","JORONG_A","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("41","0","0","Nagari B","4","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("42","0","-","JORONG_B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("43","-","-","JORONG_B","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("44","0","0","JORONG C","6","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("45","0","-","JORONG_C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("46","-","-","JORONG_C","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("47","0","0","Nagari D","2","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("48","0","-","JORONG_D","0","","","0","","");
INSERT INTO tweb_wil_clusternagari VALUES("49","-","-","JORONG_D","0","","","0","","");



DROP TABLE user;

CREATE TABLE `user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `id_grup` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `session` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

INSERT INTO user VALUES("1","admin","07d4b7d3777af17465486c783a3185bb","1","admin@nagari.co.id","2017-12-02 15:08:51","1","Administrator","ADMIN","321","favicon.png","a8d4080245664ed2049c1b2ded7cac30");
INSERT INTO user VALUES("56","redaksi","8e861cfce538f7c81f93844b872898b2","3","","2017-12-02 14:37:22","1","Redaksi","","","","39b3cc1ca3f8b095a171b19b1f307358");
INSERT INTO user VALUES("57","operator","d8578edf8458ce06fbc5bb76a58c5ca4","2","","2014-10-24 20:17:42","1","Operator nagari","","","","9304194147916440da8be6d8f26f62f0");
INSERT INTO user VALUES("58","Master Admin","21232f297a57a5a743894a0e4a801fc3","1","iariadi@gmail.com","2017-12-02 14:33:27","0","Admin","","0813299237471","","de750f7c7aa3412540dcfb33a8218ccf");
INSERT INTO user VALUES("59","redaksiyona","95488ef6daa5a49a38ea076c37ea3143","3","","2017-02-04 14:22:25","1","yona","","082384361570","","ae74cbfb83527b967932203f738c6302");
INSERT INTO user VALUES("60","kontributorilon","d53d62056b878f168d5a560edd7b466b","4","","0000-00-00 00:00:00","0","lonfikri","","081234345456","","4dcf453bf85b70fbbab2cc297f76c034");
INSERT INTO user VALUES("61","ilon","d53d62056b878f168d5a560edd7b466b","4","","2017-02-04 14:27:48","0","lonfikri","","123456789123","","37d724161f7bf84679036ca203a67429");
INSERT INTO user VALUES("62","david","172522ec1028ab781d9dfd17eaca4427","2","","2017-12-02 14:34:20","1","dewi","","08126797586","","4b136eed99cc1272b132aae0d8682bea");
INSERT INTO user VALUES("63","yn","0227c13b4ec28c5dae11889299d64135","2","","2017-02-04 14:31:21","0","yona puspita sari","","082174487366","","4b21995f7c23c17025fa018828b76c97");



DROP TABLE user_grup;

CREATE TABLE `user_grup` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO user_grup VALUES("1","Administrator");
INSERT INTO user_grup VALUES("2","Operator");
INSERT INTO user_grup VALUES("3","Redaksi");



