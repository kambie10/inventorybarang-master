<?php
  include 'class/class.php';
  @session_start();
  error_reporting(0);
  if (empty($_SESSION['login_admin'])) {
    echo "<script>
    alert('Anda Belum Login!');
      window.location='login/index.php';
    </script>";

  }
  function tglIndonesia($str){
    $tr   = trim($str);
    $str    = str_replace(array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'), array('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'), $tr);
    return $str;
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inventori Barang</title>
  <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!--FOR TABLE -->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

    <script src="assets/js/jquery.js"></script>
     <script src="assets/js/jquery.maskMoney.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
</head>
<body>
  <div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
          <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.php">Inventori Barang</a>
      </div>


      <div style="color: white;padding: 15px 20px 15px 20px;float: right;font-size: 16px;">

        <span style="margin-right:20px"> <?php echo $_SESSION['login_admin']['level']; ?> <?php echo tglIndonesia(date('D, d F, Y')); ?></span>
        <a href="index.php?page=logout" class="btn btn-danger square-btn-adjust">Logout</a>
      </div>
    </nav>
<!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
      <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
          <li class="text-center">
            <img src="gambar_admin/<?php echo $_SESSION['login_admin']['gambar']; ?>" class="user-image img-circle img-responsive"/>
          </li>
          <li>
            <a  class="active-menu" href="index.php"><i class="fa fa-dashboard"></i> Dashboard</a>
          </li>


          <?php





            if ($_SESSION['login_admin']['level'] == 'Operasional') {





           ?>



           <li>
            <a  href="#"><i class="fa fa-truck"></i> Master <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
             <li>
            <a  href="index.php?page=barang"><i class="fa fa-qrcode"></i> Barang</a>
            </li>
          <li>
            <a  href="index.php?page=supplier"><i class="fa fa-group"></i> Supplier</a>
          </li>
          <li>
            <a  href="index.php?page=pelanggan"><i class="fa fa-group"></i> Pelanggan</a>
          </li>
          <li>
            <a  href="index.php?page=pegawai"><i class="fa fa-group"></i> Pegawai</a>
          </li>
           <li>
            <a  href="index.php?page=sales"><i class="fa fa-group"></i> Sales</a>
          </li>
          <li>
            <a  href="index.php?page=satuan"><i class="fa fa-group"></i> Satuan</a>
          </li>
            </ul>
          </li>

           <li>
            <a  href="index.php?page=pembelian"><i class="fa fa-shopping-cart "></i> Barang Masuk</a>

          </li>
          <li>
            <a  href="index.php?page=penjualan"><i class="fa fa-truck"></i> Barang Keluar</a>

          </li>

          <li>
            <a  href="#"><i class="fa fa-book"></i> Laporan<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li>
                <a  href="index.php?page=laporanpenjualan"><i class="fa fa-file-archive-o"></i> Barang Keluar</a>
              </li>
              <li>
                <a  href="index.php?page=laporanpembelian"><i class="fa fa-file-archive-o"></i> Barang Masuk</a>
              </li>
               <li>
                <a  href="index.php?page=laporanstokbarang"><i class="fa fa-file-archive-o"></i> Stok Barang </a>
              </li>
              <li>
                <a  href="index.php?page=laporansales"><i class="fa fa-file-archive-o"></i> Sales </a>
              </li>
              <li>
                <a  href="index.php?page=laporanprofit"><i class="fa fa-dollar"></i> Profit</a>
              </li>
            </ul>
          </li>

          <li>
            <a  href="#"><i class="fa fa-wrench"></i> Pengaturan<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li>
                <a  href="index.php?page=admin"><i class="fa fa-user"></i> Admin</a>
              </li>
              <li>
                <a  href="index.php?page=perusahaan"><i class="fa fa-home"></i> Perusahaan</a>
              </li>
            </ul>

          </li>
           <li>
            <a  href="index.php?page=backupdata"  ><i class="fa fa-cloud-download"></i> Backup Database</a>

          </li>

          <?php

           }

           elseif ($_SESSION['login_admin']['level'] == 'Keuangan') {


            ?>

            <li>
            <a  href="index.php?page=pembelian"><i class="fa fa-shopping-cart "></i> Barang Masuk</a>

          </li>
          <li>
            <a  href="index.php?page=penjualan"><i class="fa fa-truck"></i> Barang Keluar</a>

          </li>

          <li>
            <a  href="#"><i class="fa fa-book"></i> Laporan<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li>
                <a  href="index.php?page=laporanpenjualan"><i class="fa fa-file-archive-o"></i> Barang Keluar</a>
              </li>
              <li>
                <a  href="index.php?page=laporanpembelian"><i class="fa fa-file-archive-o"></i> Barang Masuk</a>
              </li>
              <li>
                <a  href="index.php?page=laporansales"><i class="fa fa-file-archive-o"></i> Sales </a>
              </li>
               <li>
                <a  href="index.php?page=laporanstokbarang"><i class="fa fa-file-archive-o"></i> Stok Barang </a>
              </li>
              <li>
                <a  href="index.php?page=laporanprofit"><i class="fa fa-dollar"></i> Profit</a>
              </li>
            </ul>
          </li>

          <?php

           }

           elseif ($_SESSION['login_admin']['level'] == 'Logistik') {


            ?>
           <li>
            <a  href="index.php?page=pembelian"><i class="fa fa-shopping-cart "></i> Barang Masuk</a>

          </li>
          <li>
            <a  href="index.php?page=popenjualan"><i class="fa fa-truck"></i> Barang Keluar</a>

          </li>

          <li>
            <a  href="#"><i class="fa fa-book"></i> Laporan<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li>
                <a  href="index.php?page=laporanpenjualan"><i class="fa fa-file-archive-o"></i> Barang Keluar</a>
              </li>
              <li>
                <a  href="index.php?page=laporanpembelian"><i class="fa fa-file-archive-o"></i> Barang Masuk</a>
              </li>
               <li>
                <a  href="index.php?page=laporanstokbarang"><i class="fa fa-file-archive-o"></i> Stok Barang </a>
              </li>

            </ul>
          </li>


            <?php




           }




           ?>


      </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
      <div id="page-inner">
        <?php
          if (isset($_GET['page'])) {
            if ($_GET['page']=="admin") {
              include 'form/admin/admin.php';
            }
            elseif ($_GET['page']=="tambahadmin") {
              include 'form/admin/tambahadmin.php';
            }
            elseif ($_GET['page']=="ubahadmin") {
              include 'form/admin/ubahadmin.php';
            }
            elseif ($_GET['page']=="barang") {
              include 'form/barang/barang.php';
            }
            elseif ($_GET['page']=="tambahbarang") {
              include 'form/barang/tambahbarang.php';
            }
            elseif ($_GET['page']=="ubahbarang") {
              include 'form/barang/ubahbarang.php';
            }
            elseif ($_GET['page']=="supplier") {
              include 'form/supplier/supplier.php';
            }
            elseif ($_GET['page']=="tambahsupplier") {
              include 'form/supplier/tambahsupplier.php';
            }
            elseif ($_GET['page']=="ubahsupplier") {
              include 'form/supplier/ubahsupplier.php';
            }
            elseif ($_GET['page']=="pelanggan") {
              include 'form/pelanggan/pelanggan.php';
            }
            elseif ($_GET['page']=="tambahpelanggan") {
              include 'form/pelanggan/tambahpelanggan.php';
            }
            elseif ($_GET['page']=="ubahpelanggan") {
              include 'form/pelanggan/ubahpelanggan.php';
            }
            elseif ($_GET['page']=="pegawai") {
              include 'form/pegawai/pegawai.php';
            }
            elseif ($_GET['page']=="tambahpegawai") {
              include 'form/pegawai/tambahpegawai.php';
            }
            elseif ($_GET['page']=="ubahpegawai") {
              include 'form/pegawai/ubahpegawai.php';
            }
            elseif ($_GET['page']=="backupdata") {
              include 'backup/backup.php';
            }
            elseif ($_GET['page']=="sales") {
              include 'form/sales/sales.php';
            }
            elseif ($_GET['page']=="tambahsales") {
              include 'form/sales/tambahsales.php';
            }
            elseif ($_GET['page']=="ubahsales") {
              include 'form/sales/ubahsales.php';
            }
            elseif ($_GET['page']=="laporansales") {
              include 'form/sales/laporansales.php';
            }

            elseif ($_GET['page']=="satuan") {
              include 'form/satuan/satuan.php';
            }
            elseif ($_GET['page']=="tambahsatuan") {
              include 'form/satuan/tambahsatuan.php';
            }
            elseif ($_GET['page']=="ubahsatuan") {
              include 'form/satuan/ubahsatuan.php';
            }

            elseif ($_GET['page']=="pembelian") {
              include 'form/pembelian/pembelian.php';
            }
            elseif ($_GET['page']=="tambahpembelian") {
              include 'form/pembelian/tambahpembelian.php';
            }
            elseif ($_GET['page']=="barangpembelian") {
              include 'barangpembelian.php';
            }
            elseif ($_GET['page']=="simpanbaranggudang") {
              include 'simpanbaranggudang.php';
            }
            elseif ($_GET['page']=="penjualan") {
              include 'form/penjualan/penjualan.php';
            }
            elseif ($_GET['page']=="popenjualan") {
              include 'form/penjualan/popenjualan.php';
            }
            elseif ($_GET['page']=="tambahpenjualan") {
              include 'form/penjualan/tambahpenjualan.php';
            }
            elseif ($_GET['page']=="ubahpenjualan") {
              include 'form/penjualan/ubahpenjualan.php';
            }
            elseif ($_GET['page']=="editstatuspo") {
              include 'form/penjualan/editstatuspo.php';
            }
            elseif ($_GET['page']=="editstatusinv") {
              include 'form/penjualan/editstatusinv.php';
            }
            elseif ($_GET['page']=="cetaklapstobarang") {
              include 'cetaklapstokbarang.php';
            }
            elseif ($_GET['page']=="laporanpenjualan") {
              include 'form/penjualan/laporanpenjualan.php';
            }
            elseif ($_GET['page']=="laporanpembelian") {
              include 'form/pembelian/laporanpembelian.php';
            }
            elseif ($_GET['page']=="laporanstokbarang") {
              include 'form/laporanstokbarang.php';
            }
            elseif ($_GET['page']=="laporanprofit") {
              include 'form/laporanprofit.php';
            }
            elseif ($_GET['page']=="perusahaan") {
              include 'form/perusahaan.php';
            }
            elseif ($_GET['page']=="importdata") {
              include 'excel_reader/index.php';
            }
            elseif ($_GET['page']=="logout") {
              session_destroy();
              echo "<script>location='login/';</script>";
            }
          }
          else{
            include 'form/dashboard.php';
          }
        ?>
      </div>
    </div>
  </div>
     <!-- /. WRAPPER  -->
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!--DATA TABLE-->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
    <script>
      $(document).ready(function () {
        $('#tabelku').dataTable();
      });
    </script>
    <script>
    $(document).on("click", "#alertHapus", function(e){
      e.preventDefault();
      var link = $(this).attr("href");
      bootbox.confirm("Lanjutkan Menghapus!", function(confirmed){
        if (confirmed) {
          window.location.href = link;
        };
      });
    });
    </script>
    <script src="assets/js/custom.js"></script>
</body>
</html>
