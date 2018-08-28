<div class="box-header">
        <h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Import Barang</h3>
      </div>
      <hr/>

<div class="row">
 
<?php 
  if (isset($_POST['submit'])) {
?>
<div class="col-md-12">
<div class="box-body"> 
<div id="progress"  style="width:500px;border:1px solid #ccc;">
   <!--  <span class="sr-only">40% Complete (success)</span> -->
  </div>
  <div id="info"></div>

  
</div>
</div>

<?php
  }
?>
<br>
  <div class="col-md-8 col-sm-8">
                    <div class="well">
      
<form name="myForm" id="myForm" onSubmit="return validateForm()" action="index.php?page=importdata" method="post" enctype="multipart/form-data">
<input type="file" id="filepegawaiall" name="filepegawaiall" />
<a href="excel_reader/file.xls">contohformat.xls</a> <br><br>
<!-- <label><input type="checkbox" name="drop" value="1" /> <u>Kosongkan tabel sql terlebih dahulu.</u> </label> -->

<input type="submit" name="submit" value="Import" class="btn btn-primary" />
<a href="index.php?page=barang" class="btn btn-warning"><i class="fa fa-arrow-left"></i> Back to barang</a>
</form>




    </div>
  </div>


</div>



<script type="text/javascript">
//    validasi form (hanya file .xls yang diijinkan)
    function validateForm()
    {
        function hasExtension(inputID, exts) {
            var fileName = document.getElementById(inputID).value;
            return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
        }

        if(!hasExtension('filepegawaiall', ['.xls'])){
            alert("Hanya file XLS (Excel 2003) yang diijinkan.");
            return false;
        }
    }
</script>

 <?php
//koneksi ke database, username,password  dan namadatabase menyesuaikan 
mysql_connect('localhost', 'root', '');
mysql_select_db('inventory_barang');
  //include 'class/class.php';

//memanggil file excel_reader
require "excel_reader.php";
 //include 'excel_reader/excel_reader.php';
//jika tombol import ditekan
if(isset($_POST['submit'])){

    $target = basename($_FILES['filepegawaiall']['name']) ;
    move_uploaded_file($_FILES['filepegawaiall']['tmp_name'], $target);
    
    $data = new Spreadsheet_Excel_Reader($_FILES['filepegawaiall']['name'],false);
    
//    menghitung jumlah baris file xls
    $baris = $data->rowcount($sheet_index=0);
    
//    jika kosongkan data dicentang jalankan kode berikut
//     $drop = isset( $_POST["drop"] ) ? $_POST["drop"] : 0 ;
//     if($drop == 1){
// //             kosongkan tabel pegawai
//              $truncate ="TRUNCATE TABLE barang";
//              mysql_query($truncate);
//     };
    
//    import data excel mulai baris ke-2 (karena tabel xls ada header pada baris 1)
    for ($i=2; $i<=$baris; $i++)
    {

      $barisreal = $baris-1;
      $k = $i-1;


      $percent = intval($k/$barisreal * 100)."%";

      echo '<script language="javascript">
            document.getElementById("progress").innerHTML="<div style=\"width:'.$percent.'; background-color:lightblue\">&nbsp;</div>";
            document.getElementById("info").innerHTML="'.$k.' Data Berhasil Di Insert('.$percent.' selesai)";
            </script>';
//       membaca data (kolom ke-1 sd terakhir)
      $kd_barang    = $data->val($i, 1);
      $nama_barang  = $data->val($i, 2);
      $sat          = $data->val($i, 3);
      $harga        = $data->val($i, 4);
      $stok         = $data->val($i, 5);
      $status       = $data->val($i, 6);

//      setelah data dibaca, masukkan ke tabel pegawai sql
      $query = "INSERT into barang (kd_barang,nama_barang,sat,harga,stok,status)values('$kd_barang','$nama_barang','$sat','$harga','$stok','$status')";
      $hasil = mysql_query($query);


      flush();
    }
    
//     if(!$hasil){
// //          jika import gagal
//           die(mysql_error());
//       }else{
// //          jika impor berhasil
//           echo "Data berhasil di impor.";
//          
//     }

     //echo "<script>location='index.php?page=barang';</script>";
    
//    hapus file xls yang udah dibaca
   // unlink($_FILES['filepegawaiall']['name']);

   
}

?>
