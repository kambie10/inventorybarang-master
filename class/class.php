<?php

	//set jam
	date_default_timezone_set('Asia/Jakarta');
	class DataBase{
		private $host = "localhost";
		private $user = "root";
		private $pass = "";
		private $db = "inventory_barang";

		public function sambungkan(){
			mysql_connect($this->host,$this->user,$this->pass);
			mysql_select_db($this->db);
		}
	}
	//membuat class admin
	class Admin{
		//method insert data admin
		public function simpan_admin($email,$pass,$nama,$kdlevel,$gambar){
			$namafile = $gambar['name'];
			//lokasi sementara
			$lokasifile = $gambar['tmp_name'];
			//upload
			move_uploaded_file($lokasifile, "gambar_admin/$namafile");
			//insert
			mysql_query("INSERT INTO admin(email,password,nama,kd_level,gambar) VALUES('$email','$pass','$nama','$kdlevel','$namafile')");
		}
		public function tampil_admin(){
			$qry = mysql_query("SELECT * FROM level lev JOIN admin ad ON ad.kd_level = lev.kd_level ");
			while ($pecah = mysql_fetch_array($qry)) {
				//array
				$data[] = $pecah;
			}
			return $data;
		}
		public function ambil_admin($id){
			$qry = mysql_query("SELECT * FROM level lev JOIN admin ad ON ad.kd_level = lev.kd_level WHERE kd_admin= '$id'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
		public function ubah_admin($email,$pass,$nama,$kdlevel,$gambar,$id){
			$namafile = $gambar['name'];
			$lokasifile = $gambar['tmp_name'];
			//mengambil nama gambar sebelumnya untuk di hapus, akan di hapus
			//jika form gambar tidak kosong
			$ambil = $this->ambil_admin($id);
			$gambarhapus = $ambil['gambar'];
			if (!empty($lokasifile)) {
				//hapus gambar sebelumnya
				unlink("gambar_admin/$gambarhapus");
				//upload gambar baru
				move_uploaded_file($lokasifile, "gambar_admin/$namafile");
				//update
				mysql_query("UPDATE admin
					SET email = '$email', password='$pass', nama='$nama', kd_level='$kdlevel', gambar='$namafile' WHERE kd_admin='$id'");
			}
			else{
				//update tanpa upload gambar
				mysql_query("UPDATE admin
					SET email = '$email', password='$pass', nama='$nama' , kd_level='$kdlevel' WHERE kd_admin='$id'");
			}
		}
		public function hapus_admin($hapus){
			//ambil nama gambar yang akan di hapus pada folder gambar
			$gbr = $this->ambil_admin($hapus);
			$namagbr = $gbr['gambar'];
			//hapus
			unlink("gambar_admin/$namagbr");
			mysql_query("DELETE FROM admin WHERE kd_admin= '$hapus'");
		}
		public function login_admin($nama,$pass){
			// mencocokan data di db dengan username dan pass yang di inputkan
			$cek = mysql_query("SELECT * FROM level lev JOIN admin ad ON ad.kd_level = lev.kd_level WHERE nama='$nama' AND password='$pass'");
			//mengambil data orang yang login dan cocok
			$data = mysql_fetch_assoc($cek);
			// hitung data yang cocok
			$cocokan = mysql_num_rows($cek);
			//jika akun yang cocok lebih besar dari 0 maka bisa login
			if ($cocokan > 0) {
				//bisa login
				$_SESSION['login_admin']['id'] = $data['kd_admin'];
				$_SESSION['login_admin']['email'] = $data['email'];
				$_SESSION['login_admin']['nama'] = $data['nama'];
				$_SESSION['login_admin']['level'] = $data['nama_level'];
				$_SESSION['login_admin']['gambar'] = $data['gambar'];

				return true;
			}// selain itu (akun yang cocok tdk lebih dari 0) maka ggl
			else{
				return false;
			}
		}
	}
	class Barang{
		public function kode_otomatis(){
			$qry = mysql_query("SELECT MAX(kd_barang) AS kode FROM barang");
			$pecah = mysql_fetch_array($qry);
			$kode = substr($pecah['kode'], 3,5);
			$jum = $kode + 1;
			if ($jum < 10) {
				$id = "BB0000".$jum;
			}
			else if($jum >= 10 && $jum < 100){
				$id = "BB000".$jum;
			}
			else if($jum >= 100 && $jum < 1000){
				$id = "BB00".$jum;
			}
			else{
				$id = "BB0".$jum;
			}
			return $id;
		}
		public function tampil_barang($id){
			$qry = mysql_query("SELECT * FROM satuan st
				JOIN barang bar ON bar.sat = st.kd_satuan ORDER BY kd_barang ASC");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function cari_stok_awal($kode) {
			$sql	= "SELECT kd_barang,stok as jml FROM barang WHERE kd_barang='$kode'";
			$query	= mysql_query($sql);
			$row	= mysql_num_rows($query);
			if ($row>0){
				$data	= mysql_fetch_array($query);
				$hasil	= $data['jml'];
			}else{
				$hasil = 0;
			}
			return $hasil;
		}

		public function cari_jml_masuk($kode){
			$sql	= "SELECT kd_barang,sum(jumlah) as jml FROM pembelian_update WHERE kd_barang='$kode'";
			$query	= mysql_query($sql);
			$row	= mysql_num_rows($query);
			if ($row>0){
				$data	= mysql_fetch_array($query);
				$hasil	= $data['jml'];
			}else{
				$hasil = 0;
			}
			return $hasil;
		}

		public function cari_jml_keluar($kode){
			$sql	= "SELECT kd_barang,sum(jumlah) as jml FROM penjualan_update WHERE kd_barang='$kode'";
			$query	= mysql_query($sql);
			$row	= mysql_num_rows($query);
			if ($row>0){
				$data	= mysql_fetch_array($query);
				$hasil	= $data['jml'];
			}else{
				$hasil = 0;
			}
			return $hasil;
		}

		public function cari_stok_akhir($kode){
			$stok_awal	= cari_stok_awal($kode);
			$jml_masuk = cari_jml_masuk($kode);
			$jml_keluar = cari_jml_keluar($kode);

			$hasil	= ($stok_awal+$jml_masuk)-$jml_keluar;
			return $hasil;
		}



		public function tampil_barang1(){
			$qry = mysql_query("SELECT * FROM barang ORDER BY kd_barang ASC");

			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function simpan_barang($kdbarang,$nama,$sat,$stok,$status){
			mysql_query("INSERT INTO barang(kd_barang,nama_barang,sat,stok,status)
				VALUES('$kdbarang','$nama','$sat','$stok','$status')");
		}
		public function ubah_barang($kd,$nama,$sat,$stok,$status){
			mysql_query("UPDATE barang SET nama_barang='$nama', sat='$sat',stok='$stok',status='$status' WHERE kd_barang = '$kd' ");
		}

		public function ubah_stokbarang($hasil,$kode){
			mysql_query("UPDATE barang SET stok='$hasil' WHERE kd_barang = '$kode' ");
		}
		public function ambil_barang($id){
			$qry = mysql_query("SELECT * FROM satuan st
				JOIN barang bar ON bar.sat = st.kd_satuan WHERE kd_barang = '$id'");
			$pecah = mysql_fetch_assoc($qry);

			return $pecah;
		}
		public function ambil_barang2($id){
			$qry = mysql_query("SELECT * FROM barangp_sementara WHERE kd_barang = '$id'");
			$pecah = mysql_fetch_assoc($qry);

			return $pecah;
		}
		public function hapus_barang($kd){
			mysql_query("DELETE FROM barang WHERE kd_barang = '$kd'");
		}
		public function simpan_barang_gudang($kdbarang,$hargaj,$kdbl){
			$dat = $this->ambil_barangpem($kdbl);
			$nama = $dat['nama_barang_beli'];

			$hargab = $dat['harga_beli'];
			$stok = $dat['item'];
			mysql_query("INSERT INTO barang(kd_barang,nama_barang,harga_jual,harga_beli,stok)
				VALUES('$kdbarang','$nama','$hargaj','$hargab','$stok')");
			//update data barang pembelian dengan setatus 1
			mysql_query("UPDATE barang_pembelian SET status='1' WHERE kd_barang_beli ='$kdbl'");
		}
		public function ambil_barangpem($kd){
			$qry = mysql_query("SELECT * FROM barang_pembelian WHERE kd_barang_beli = '$kd'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
	}
	class Supplier{
		public function tampil_supplier(){
			$qry = mysql_query("SELECT * FROM supplier");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function simpan_supplier($nama,$namatk,$notlp,$alamat){
			mysql_query("INSERT INTO supplier(nama_supplier,nama_tk,notlp,alamat) VALUES ('$nama','$namatk','$notlp','$alamat')");
			//echo $nama;
			//echo $namatk;
			//echo $notlp;
			//echo $alamat;
		}
		public function ubah_supplier($nama, $namatk,$notlp,$alamat, $id){
			mysql_query("UPDATE supplier SET nama_supplier='$nama', nama_tk='$namatk' , notlp='$notlp' , alamat='$alamat' WHERE kd_supplier = '$id'");
		}
		public function hapus_supplier($id){
			mysql_query("DELETE FROM supplier WHERE kd_supplier= '$id'");
		}
		public function ambil_supplier($id){
			$qry = mysql_query("SELECT * FROM supplier WHERE kd_supplier= '$id'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
	}

	class Pelanggan{
		public function tampil_pelanggan(){
			$qry = mysql_query("SELECT * FROM pelanggan");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function simpan_pelanggan($nama,$plg,$notlp,$alamat){
			mysql_query("INSERT INTO pelanggan(nama_pelanggan,nama_toko,notlp,alamat) VALUES('$nama','$plg','$notlp','$alamat')");
		}
		public function ubah_pelanggan($nama,$plg,$notlp,$alamat,$id){
			mysql_query("UPDATE pelanggan SET nama_pelanggan='$nama', nama_toko='$plg', notlp='$notlp', alamat='$alamat' WHERE kd_pelanggan = '$id'");
		}
		public function hapus_pelanggan($id){
			mysql_query("DELETE FROM pelanggan WHERE kd_pelanggan= '$id'");
		}
		public function ambil_pelanggan($id){
			$qry = mysql_query("SELECT * FROM pelanggan WHERE kd_pelanggan= '$id'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
	}

	class Pegawai{
		public function tampil_pegawai(){
			$qry = mysql_query("SELECT * FROM pegawai");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function simpan_pegawai($nama,$notlp,$alamat){
			mysql_query("INSERT INTO pegawai(nama_pegawai,no_telp,alamat) VALUES('$nama','$notlp','$alamat')");
		}
		public function ubah_pegawai($nama,$notlp,$alamat,$id){
			mysql_query("UPDATE pegawai SET nama_pegawai='$nama', no_telp='$notlp', alamat='$alamat' WHERE kd_pegawai = '$id'");
		}
		public function hapus_pegawai($id){
			mysql_query("DELETE FROM pegawai WHERE kd_pegawai= '$id'");
		}
		public function ambil_pegawai($id){
			$qry = mysql_query("SELECT * FROM pegawai WHERE kd_pegawai= '$id'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
	}

	class Sales{
		public function tampil_sales(){
			$qry = mysql_query("SELECT * FROM sales");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function simpan_sales($nama,$notlp,$alamat){
			mysql_query("INSERT INTO sales(nama_sales,notlp,alamat) VALUES('$nama','$notlp','$alamat')");
		}
		public function ubah_sales($nama,$notlp,$alamat,$id){
			mysql_query("UPDATE sales SET nama_sales='$nama', notlp='$notlp', alamat='$alamat' WHERE kd_sales = '$id'");
		}
		public function hapus_sales($id){
			mysql_query("DELETE FROM sales WHERE kd_sales= '$id'");
		}
		public function ambil_sales($id){
			$qry = mysql_query("SELECT * FROM sales WHERE kd_sales= '$id'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}

		public function tampil_sales1(){
			$qry = mysql_query("SELECT * FROM penjualan pen
				 JOIN sales sl ON pen.kd_sales = sl.kd_sales ORDER BY pen.kd_penjualan DESC ");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
	}

	class Level{
		public function tampil_level(){
			$qry = mysql_query("SELECT * FROM level");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}

	}

	class Satuan{
		public function tampil_satuan(){
			$qry = mysql_query("SELECT * FROM satuan ");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function simpan_satuan($sat,$ket){
			mysql_query("INSERT INTO satuan (nama_satuan,ket) VALUES('$sat','$ket')");
		}
		public function ubah_satuan($sat,$ket,$id){
			mysql_query("UPDATE satuan SET nama_satuan='$sat', ket='$ket' WHERE kd_satuan = '$id'");
		}
		public function hapus_satuan($id){
			mysql_query("DELETE FROM satuan WHERE kd_satuan = '$id'");
		}
		public function ambil_satuan($id){
			$qry = mysql_query("SELECT * FROM satuan WHERE kd_satuan = '$id'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
	}
	class Pembelian{
		public function kode_otomatis(){
			$qry = mysql_query("SELECT MAX(kd_pembelian) AS kode FROM pembelian");
			$pecah = mysql_fetch_array($qry);
			$kode = substr($pecah['kode'], 3,5);
			$jum = $kode + 1;
			if ($jum < 10) {
				$id = "BM0000".$jum;
			}
			else if($jum >= 10 && $jum < 100){
				$id = "BM000".$jum;
			}
			else if($jum >= 100 && $jum < 1000){
				$id = "BM00".$jum;
			}
			else{
				$id = "BM0".$jum;
			}
			return $id;
		}
		public function tampil_pembelian(){
			$qry = mysql_query("SELECT * FROM pembelian p JOIN supplier s ON p.kd_supplier=s.kd_supplier ORDER BY kd_pembelian DESC");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$cek = mysql_num_rows($qry);
			if ($cek > 0) {
				return $data;
			}else{
				error_reporting(0);
			}
		}
		public function hitung_item_pembelian($kdpembelian){
			$qry = mysql_query("SELECT count(*) as jumlah FROM d_pembelian WHERE kd_pembelian = '$kdpembelian'");
			$pecah = mysql_fetch_array($qry);

			return $pecah;
		}
		//sementara
		public function tambah_barang_sementara($kode,$nama,$kodebr,$hargab,$item){
			$bar = $this->ambil_barang($kodebr);
			//$hargab = $bar['harga_jual'];
			$tot = $item * $hargab;
			mysql_query("INSERT INTO barangp_sementara(kd_pembelian,kd_barang,nama_barangp, harga_barangp,item,total)
				VALUES('$kode','$kodebr','$nama','$hargab','$item','$tot')");
			//update barang +
			//$tambah = $bar['stok'] + $item;
			//mysql_query("UPDATE barang SET stok = '$tambah' WHERE kd_barang = '$kodebr'");
		}
		public function tampil_barang_sementara($kode){
			$qry = mysql_query("SELECT * FROM barangp_sementara WHERE kd_pembelian = '$kode'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}


		public function hitung_total_sementara($kode){
			$qry = mysql_query("SELECT sum(total) as jumlah FROM barangp_sementara WHERE kd_pembelian = '$kode'");
			$pecah = mysql_fetch_array($qry);
			$cek = $this->cek_data_barangp($kode);
			if ($cek === true) {
				$subtotal = $pecah['jumlah'];
			}
			else{
				$subtotal = 0;
			}
			return $subtotal;
		}

		public function hapus_barang_sementara($kd){
			// update barang, di kembalikan ke stok semula
			$databrg = $this->ambil_barang_sementara($kd);
			$datbar = $this->ambil_barang3($databrg['kd_barang']);

			//echo $datbar['stok'];
			//echo $databrg['item'];

			$stok = $datbar['stok'] - $databrg['item'];
			$kdbar = $databrg['kd_barang'];
			mysql_query("UPDATE barang SET stok ='$stok' WHERE kd_barang = '$kdbar'");


			mysql_query("DELETE FROM barangp_sementara WHERE id_barangp ='$kd'");



		}
		public function ambil_barang3($id){
			$qry = mysql_query("SELECT * FROM barang WHERE kd_barang = '$id'");
			$pecah = mysql_fetch_assoc($qry);

			return $pecah;
		}
		public function ambil_barang_sementara($kd){
			$qry = mysql_query("SELECT * FROM barangp_sementara WHERE id_barangp = '$kd'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}

		public function cek_data_barangp($kode){
			$qry = mysql_query("SELECT * FROM barangp_sementara WHERE kd_pembelian = '$kode'");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}

		public function cek_data_barangpen($kode){
			$qry = mysql_query("SELECT * FROM d_penjualan WHERE kd_penjualan = '$kode'");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}


		//end sementara
		public function simpan_pembelian($kdpembelian,$tglpembelian,$supplier,$totalpem){
			//insert pembelian
			$kdadmin = $_SESSION['login_admin']['id'];
			mysql_query("INSERT INTO pembelian(kd_pembelian,tgl_pembelian,kd_admin,kd_supplier,total_pembelian)
				VALUES('$kdpembelian','$tglpembelian','$kdadmin','$supplier','$totalpem')");

			//insert data barang
			mysql_query("INSERT INTO barang_pembelian(kd_pembelian,kd_barang,nama_barang_beli,satuan,harga_beli,item,total)
				SELECT kd_pembelian, kd_barang, nama_barangp,satuan,harga_barangp,item,total FROM barangp_sementara");
			//insert detail pembelian
			mysql_query("INSERT INTO d_pembelian(kd_pembelian,kd_barang,harga_beli,jumlah,subtotal)
				SELECT kd_pembelian, kd_barang,harga_beli,item,total FROM barang_pembelian WHERE kd_pembelian='$kdpembelian'");

			//insert detail pembelian update
			mysql_query("INSERT INTO pembelian_update(kd_pembelian,kd_barang,jumlah)
				SELECT kd_pembelian, kd_barang,item FROM barang_pembelian WHERE kd_pembelian='$kdpembelian'");

			//hapus data barang pembelian sementara
			mysql_query("DELETE FROM barangp_sementara WHERE kd_pembelian='$kdpembelian'");
		}
		public function tampil_barang_pembelian(){
			$qry = mysql_query("SELECT * FROM barang_pembelian WHERE status = '0'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function ambil_kdpem(){
			$qry = mysql_query("SELECT * FROM pembelian ORDER BY kd_pembelian DESC LIMIT 1");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
		public function cek_hapuspembelian($kd){
			$qry = mysql_query("SELECT * FROM barang_pembelian WHERE kd_pembelian = '$kd'");
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return false;
			}
			else{
				return true;
			}
		}

		public function cek_hapuspenjualan($kd){
			$qry = mysql_query("SELECT * FROM d_penjualan WHERE kd_penjualan = '$kd'");
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return false;
			}
			else{
				return true;
			}
		}

		public function hitung_jumlah_pembelian($kd){
			$qry = mysql_query("SELECT SUM(subtotal) as total FROM d_pembelian WHERE kd_pembelian = '$kd'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah['total'];
		}
		public function ambil_pembelianbrg($kd){
			$qry = mysql_query("SELECT * FROM  d_pembelian WHERE kd_pembelian = '$kd'");
			$pecah = mysql_fetch_assoc($qry);

			return $pecah;
		}
		public function hapus_pembelian($kdpembelian){

			// update barang, di kembalikan ke stok semula
			//$databrg = $this->ambil_pembelianbrg($kdpembelian);
			//$datbar = $this->ambil_barang3($databrg['kd_barang']);


				//$stok = $datbar['stok'] - $databrg['jumlah'];
				//$kdbar = $databrg['kd_barang'];
				//mysql_query("UPDATE barang SET stok ='$stok' WHERE kd_barang = '$kdbar'");




			// hapus data

			mysql_query("DELETE FROM pembelian WHERE kd_pembelian='$kdpembelian'");
			mysql_query("DELETE FROM pembelian_update WHERE kd_pembelian='$kdpembelian'");
			mysql_query("DELETE FROM barang_pembelian WHERE kd_pembelian = '$kdpembelian'");
		}
		public function hapus_penjualan($kdpenjualan){
			mysql_query("DELETE FROM d_penjualan WHERE kd_penjualan = '$kdpenjualan'");
			mysql_query("DELETE FROM penjualan WHERE kd_penjualan ='$kdpenjualan'");
			mysql_query("DELETE FROM penjualan_update WHERE kd_penjualan='$kdpenjualan'");
			// mysql_query("DELETE FROM status_po WHERE kd_penjualan='$kdpenjualan'");

		}

		public function hapus_upstok(){
			mysql_query("DELETE FROM penjualan_update WHERE kd_penjualan");
			mysql_query("DELETE FROM pembelian_update WHERE kd_pembelian");

		}

	}
	class Penjualan extends Barang {
		public function kode_otomatis(){
			$qry = mysql_query("SELECT MAX(kd_penjualan) AS kode FROM penjualan");
			$pecah = mysql_fetch_array($qry);
			$kode = substr($pecah['kode'], 3,5);
			$jum = $kode + 1;
			if ($jum < 10) {
				$id = "INV0000".$jum;
			}
			else if($jum >= 10 && $jum < 100){
				$id = "INV000".$jum;
			}
			else if($jum >= 100 && $jum < 1000){
				$id = "INV00".$jum;
			}
			else{
				$id = "INV0".$jum;
			}
			return $id;
		}
		public function tampil_barang_penjualan(){
			$qry = mysql_query("SELECT * FROM barang WHERE stok > 0 ORDER BY kd_barang ASC");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[] = $pecah;
			}
			return $data;
		}
		public function tampil_penjualan(){
			$qry = mysql_query("SELECT * FROM penjualan ORDER BY kd_penjualan DESC");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}

		public function tampil_penjualan_update($id){
			$qry = mysql_query("SELECT * FROM  penjualan_update WHERE kd_penjualan = '$id'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}

		public function ambil_penjualan($id){
			$qry = mysql_query("SELECT * FROM pelanggan pel
				JOIN penjualan pen ON pen.kd_pelanggan = pel.kd_pelanggan

				  WHERE kd_penjualan = '$id'");
			$pecah = mysql_fetch_assoc($qry);

			return $pecah;
		}
		public function cek_data_barangp($kode){
			$qry = mysql_query("SELECT * FROM penjualan_sementara WHERE kd_penjualan = '$kode'");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}
		public function cek_data_brg($kode){
			$qry = mysql_query("SELECT * FROM d_penjualan WHERE kd_penjualan = '$kode'");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}
		public function tampil_barang_sementara($kode){
			$qry = mysql_query("SELECT * FROM penjualan_sementara WHERE kd_penjualan = '$kode'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function tambah_penjualan_sementara($kdpen, $kdbarang,$hargasp,$hargajl, $item){
			$bar = $this->ambil_barang($kdbarang);
			$namabr = $bar['nama_barang'];
			$satuan = $bar['nama_satuan'];
			//$harga = $bar['harga'];
			$total = $hargajl * $item;
			mysql_query("INSERT INTO penjualan_sementara(kd_penjualan, kd_barang, nama_barang, satuan, harga_beli, harga, item, total)
				VALUES('$kdpen', '$kdbarang','$namabr','$satuan','$hargasp','$hargajl','$item','$total')");
			//mysql_query("INSERT INTO penjualan_update(kd_penjualan, kd_barang, nama_barang, satuan, harga, item, total)
			//	VALUES('$kdpen', '$kdbarang','$namabr','$satuan','$harga','$item','$total')");

			//mysql_query("INSERT INTO d_penjualan(kd_penjualan,kd_barang,jumlah,subtotal)
			//	SELECT kd_penjualan, kd_barang,item,total FROM penjualan_sementara WHERE kd_penjualan='$kdpenjualan'");
			// update barang
			//$kurang = $bar['stok'] - $item;
			//mysql_query("UPDATE barang SET stok = '$kurang' WHERE kd_barang = '$kdbarang'");
		}

		public function tambah_penjualan_sementara1($kode, $kodebr,$hargab, $item){
			$bar = $this->ambil_barang($kodebr);
			$namabr = $bar['nama_barang'];
			//$harga = $bar['harga'];

			$sat = $bar['nama_satuan'];
			$total = $hargab * $item;
			//mysql_query("INSERT INTO penjualan_sementara(kd_penjualan, kd_barang, nama_barang, satuan, harga, item, total)
			//	VALUES('$kdpen', '$kdbarang','$namabr','$satuan','$harga','$item','$total')");
			mysql_query("INSERT INTO barangp_sementara(kd_pembelian,kd_barang,nama_barangp,satuan, harga_barangp,item,total)
				VALUES('$kode','$kodebr','$namabr','$sat','$hargab','$item','$total')");
			// update barang
			//$tambah = $bar['stok'] + $item;
			//mysql_query("UPDATE barang SET stok = '$tambah' WHERE kd_barang = '$kodebr'");
		}
		public function cek_item($kdbarang,$item){
			$data = $this->ambil_barang($kdbarang);
			$jumitem = $data['stok'];
			if ($item < $jumitem+1) {
				return true;
			}
			else{
				echo "<script>bootbox.alert('Item tidak cukup, $jumitem tersisa di gudang!', function(){
					window.location='index.php?page=tambahpenjualan';
				});</script>";
			}
		}
		public function cek_item2($kdbarang,$item){
			$data = $this->ambil_barang($kdbarang);
			$jumitem = $data['stok'];
			if ($item < $jumitem+1) {
				return true;
			}
			else{
				echo "<script>bootbox.alert('Item tidak cukup, $jumitem tersisa di gudang!', function(){
					window.location='index.php?page=tambahpembelian';
				});</script>";
			}
		}
		public function hitung_total_sementara($kode){
			$qry = mysql_query("SELECT sum(total) as jumlah FROM penjualan_sementara WHERE kd_penjualan = '$kode'");
			$pecah = mysql_fetch_array($qry);
			$cek = $this->cek_data_barangp($kode);
			if ($cek === true) {
				$subtotal = $pecah['jumlah'];
			}
			else{
				$subtotal = 0;
			}
			return $subtotal;
		}
		public function hitung_item_penjualan($kdpenjualan){
			$qry = mysql_query("SELECT count(*) as jumlah FROM d_penjualan WHERE kd_penjualan = '$kdpenjualan'");
			$pecah = mysql_fetch_array($qry);

			return $pecah;
		}

		public function hitung_item_penjualan1($kdpenjualan){

			$qry = mysql_query("SELECT sum(subtotal) as jumlah FROM d_penjualan dpen JOIN barang bar ON dpen.kd_barang = bar.kd_barang WHERE kd_penjualan = '$kdpenjualan' AND bar.status NOT IN('1')");
			$pecah = mysql_fetch_array($qry);
			$cek = $this->cek_data_brg($kdpenjualan);
			if ($cek === true) {
				$subtotal = $pecah['jumlah'];
			}
			else{
				$subtotal = 0;
			}
			return $subtotal;
		}

		public function simpan_penjualan($kdpenjualan,$kdsales,$tglpen,$kdpelanggan,$nmplg,$totalbyr,$subtotal){
			//insert penjualan
			$kdadmin = $_SESSION['login_admin']['id'];
			mysql_query("INSERT INTO penjualan(kd_penjualan,tgl_penjualan,kd_admin,kd_pelanggan,nama_plg,kd_sales,dibayar,total_penjualan)
				VALUES('$kdpenjualan','$tglpen','$kdadmin','$kdpelanggan','$nmplg',$kdsales,'$totalbyr','$subtotal')");

			//insert d penjualan
			mysql_query("INSERT INTO d_penjualan(kd_penjualan,kd_barang,harga_beli,jumlah,subtotal)
				SELECT kd_penjualan, kd_barang,harga_beli,item,total FROM penjualan_sementara WHERE kd_penjualan='$kdpenjualan'");

			//insert  penjualan update
			mysql_query("INSERT INTO penjualan_update(kd_penjualan,kd_barang,jumlah)
				SELECT kd_penjualan, kd_barang,item FROM penjualan_sementara WHERE kd_penjualan='$kdpenjualan'");
			//insert  penjualan update
			// mysql_query("INSERT INTO status_po(kd_penjualan)
			// 	SELECT kd_penjualan FROM penjualan_sementara WHERE kd_penjualan='$kdpenjualan'");

			//hapus semua penjualan sementera
			mysql_query("DELETE FROM penjualan_sementara WHERE kd_penjualan = '$kdpenjualan'");
		}

		public function update_penjualan($id,$bunas){


			//insert d penjualan
			//mysql_query("INSERT INTO d_penjualan(kd_penjualan,kd_barang,jumlah,subtotal)
			//	SELECT kd_penjualan, kd_barang,item,total FROM penjualan_sementara WHERE kd_penjualan='$kdpenjualan'");
			//insert penjualan sementera
			mysql_query("UPDATE penjualan SET dibayar ='$bunas' WHERE kd_penjualan = '$id'");


		}

		public function update_status($id,$status){

			mysql_query("UPDATE penjualan SET statuspo ='$status' WHERE kd_penjualan = '$id'");


		}

		public function update_status1($id,$status){

			mysql_query("UPDATE penjualan SET statusinv ='$status' WHERE kd_penjualan = '$id'");


		}
		public function ambil_kdpen(){
			$qry = mysql_query("SELECT * FROM penjualan ORDER BY kd_penjualan DESC LIMIT 1");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
		public function hapus_penjualan_sementara($kd){
			//update barang, di kembalikan ke setok semula
			$datpen = $this->ambil_penjualan_sementara($kd);
			$datbar = $this->ambil_barang($datpen['kd_barang']);

			$stok = $datbar['stok'] + $datpen['item'];
			$kdbar = $datpen['kd_barang'];
			mysql_query("UPDATE barang SET stok ='$stok' WHERE kd_barang = '$kdbar'");
			//hapus
			//mysql_query("DELETE FROM penjualan_update WHERE  id_penjualan_update = '$kd'");
			mysql_query("DELETE FROM penjualan_sementara WHERE id_penjualan_sementara = '$kd'");

		}
		public function ambil_penjualan_sementara($kd){
			$qry = mysql_query("SELECT * FROM penjualan_sementara WHERE id_penjualan_sementara = '$kd'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}


	}
	class Nota{
		public function tampil_nota_pembelian($kd){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON pem.kd_supplier = sup.kd_supplier
				JOIN admin adm ON adm.kd_admin = pem.kd_admin
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				JOIN satuan st ON bar.sat = st.kd_satuan
				WHERE pem.kd_pembelian = '$kd'");

			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}


		public function ambil_nota_pembelian($kd){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON pem.kd_supplier = sup.kd_supplier
				JOIN admin adm ON adm.kd_admin = pem.kd_admin
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				WHERE pem.kd_pembelian = '$kd'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
		public function tampil_nota_penjualan($kd){
			$qry = mysql_query("SELECT * FROM penjualan pen
				JOIN admin adm ON adm.kd_admin = pen.kd_admin
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				JOIN satuan st ON bar.sat = st.kd_satuan
				WHERE pen.kd_penjualan = '$kd'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function tampil_nota_penjualan1($kd){
			$qry = mysql_query("SELECT * FROM penjualan pen
				JOIN admin adm ON adm.kd_admin = pen.kd_admin
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				JOIN satuan st ON bar.sat = st.kd_satuan
				WHERE pen.kd_penjualan = '$kd' AND bar.status NOT IN('1')");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function ambil_nota_penjualan($kd){
			$qry = mysql_query("SELECT * FROM pelanggan pel
				JOIN penjualan pen ON pen.kd_pelanggan = pel.kd_pelanggan
				JOIN admin adm ON adm.kd_admin = pen.kd_admin
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				JOIN sales sal ON pen.kd_sales = sal.kd_sales
				WHERE pen.kd_penjualan = '$kd'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
	}
	class Laporan{
		public function tampil_penjualan_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT * FROM penjualan pen
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				JOIN satuan st ON bar.sat = st.kd_satuan
				WHERE pen.tgl_penjualan BETWEEN '$bln1' AND '$bln2' order by pen.kd_penjualan ");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function cek_penjualan_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				WHERE pem.tgl_pembelian BETWEEN '$bln1' AND '$bln2'");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}
		public function hitung_total_penjualan(){
			$qry = mysql_query("SELECT sum(dpen.subtotal) as jumlah FROM penjualan pen
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang");
			$pecah = mysql_fetch_array($qry);
			$subtotal = $pecah['jumlah'];
			return $subtotal;
		}
		public function tampil_penjualan(){
			$qry = mysql_query("SELECT * FROM penjualan pen
                JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
                JOIN barang bar ON dpen.kd_barang = bar.kd_barang
                 JOIN satuan st ON bar.sat = st.kd_satuan order by pen.kd_penjualan ");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}

		public function tampil_penjualanpo(){
			$qry = mysql_query("SELECT * FROM status_po");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function cek_penjualan(){
			$qry = mysql_query("SELECT * FROM penjualan pen
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}
		public function hitung_total_penjualan_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT sum(dpen.subtotal) as jumlah FROM penjualan pen
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				WHERE pen.tgl_penjualan BETWEEN '$bln1' AND '$bln2'");
			$pecah = mysql_fetch_array($qry);
			$subtotal = $pecah['jumlah'];
			return $subtotal;
		}
		//end penjualan

		public function tampil_pembelian_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				WHERE pem.tgl_pembelian BETWEEN '$bln1' AND '$bln2'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function cek_pembelian_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				WHERE pem.tgl_pembelian BETWEEN '$bln1' AND '$bln2'");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}
		public function hitung_total_pembelian_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT sum(dpem.subtotal) as jumlah FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				WHERE pem.tgl_pembelian BETWEEN '$bln1' AND '$bln2'");
			$pecah = mysql_fetch_array($qry);
			$subtotal = $pecah['jumlah'];
			return $subtotal;
		}
		public function hitung_total_pembelian(){
			$qry = mysql_query("SELECT sum(dpem.subtotal) as jumlah FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang");
			$pecah = mysql_fetch_array($qry);
			$subtotal = $pecah['jumlah'];
			return $subtotal;
		}
		public function tampil_pembelian(){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function cek_pembelian(){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang");
			$hitung = mysql_num_rows($qry);
			if ($hitung >=1) {
				return true;
			}
			else{
				return false;
			}
		}
		//end pembelian
		public function hitung_profit_bulan(){

		}
		public function hitung_profit_semua(){

		}
	}
	class Cetak_Laporan{
		public function laporan_penjualan_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT * FROM penjualan pen
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				JOIN satuan st ON bar.sat = st.kd_satuan
				WHERE pen.tgl_penjualan BETWEEN '$bln1' AND '$bln2'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function laporan_semua_penjualan(){
			$qry = mysql_query("SELECT * FROM penjualan pen
				JOIN d_penjualan dpen ON pen.kd_penjualan = dpen.kd_penjualan
				JOIN barang bar ON dpen.kd_barang = bar.kd_barang
				JOIN satuan st ON bar.sat = st.kd_satuan order by pen.kd_penjualan  ");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
		public function laporan_pembelian_bulan($bln1,$bln2){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang
				WHERE pem.tgl_pembelian BETWEEN '$bln1' AND '$bln2'");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}public function laporan_semua_pembelian(){
			$qry = mysql_query("SELECT * FROM supplier sup
				JOIN pembelian pem ON sup.kd_supplier = pem.kd_supplier
				JOIN d_pembelian dpem ON pem.kd_pembelian = dpem.kd_pembelian
				JOIN barang bar ON dpem.kd_barang = bar.kd_barang");
			while ($pecah = mysql_fetch_array($qry)) {
				$data[]=$pecah;
			}
			$hitung = mysql_num_rows($qry);
			if ($hitung > 0) {
				return $data;
			}
			else{
				error_reporting(0);
			}
		}
	}
	class Perusahaan{
		public function tampil_perusahaan(){
			$qry = mysql_query("SELECT * FROM perusahaan WHERE kd_perusahaan = '1'");
			$pecah = mysql_fetch_assoc($qry);
			return $pecah;
		}
		public function simpan_perusahaan($nama,$alamat,$pemilik,$notlp,$email,$kota){
			mysql_query("UPDATE perusahaan SET nama_perusahaan='$nama',alamat='$alamat', pemilik='$pemilik', notlp='$notlp', email='$email', kota='$kota' WHERE kd_perusahaan ='1' ");
		}
	}
	class Dashboard{
		public function penjualan_hariini(){
		$hari = date("Y-m-d");
			$qry = mysql_query("SELECT * FROM penjualan WHERE tgl_penjualan = '$hari'");
			$hitung = mysql_num_rows($qry);
			return $hitung;
		}
		public function pembelian_hariini(){
		$hari = date("Y-m-d");
			$qry = mysql_query("SELECT * FROM pembelian WHERE tgl_pembelian = '$hari'");
			$hitung = mysql_num_rows($qry);
			return $hitung;
		}
	}
	$DataBase = new DataBase();
	$DataBase->sambungkan();
	$admin = new Admin();
	$barang = new Barang();
	//$stokbarang = new Stokbarang();
	$supplier = new Supplier();
	$pelanggan = new Pelanggan();
	$pegawai = new Pegawai();
	$pembelian = new Pembelian();
	$penjualan = new Penjualan();
	$level = new Level();
	$sales = new Sales();
	$satuan = new Satuan();
	$nota = new Nota();
	$laporan = new Laporan();
	$cetaklaporan =  new Cetak_Laporan();
	$perusahaan = new Perusahaan();
	$dashboard = new Dashboard();
?>
