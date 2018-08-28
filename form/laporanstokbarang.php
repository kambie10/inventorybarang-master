<?php
$host="localhost"; // Host name
$username="root"; // Mysql username
$password=""; // Mysql password
$db_name="inventory_barang"; // Database name
$tbl_name="barang"; // Table name
// Connect to server and select databse.
mysql_connect("$host", "$username", "$password")or die("cannot connect");
mysql_select_db("$db_name")or die("cannot select DB");
$sql="SELECT * FROM $tbl_name";
$result=mysql_query($sql);
// Count table rows
$count=mysql_num_rows($result);
?>
<?php
// Check if button name "Submit" is active, do this
if(isset($_POST['update']))
{
$count=count($_POST["kode"]);
for($i=0;$i<$count;$i++){
$sql1="UPDATE $tbl_name SET stok='" . $_POST['hasil'][$i] . "'  WHERE kd_barang='" . $_POST['kode'][$i] . "'";
$result1=mysql_query($sql1);


}
//$sql2 = ""
//$brg = $_POST['kode'];

$sql2= mysql_query("DELETE FROM penjualan_update ");
$result2=mysql_query($sql2);

$sql3= mysql_query("DELETE FROM pembelian_update ");
$result3=mysql_query($sql3);


//$pembelian->hapus_upstok($_GET['update']);
//$pembelian->hapus_upstok2($_GET['update']);
}
//echo $count;
//mysql_close();
?>
<div class="row">
	<div class="col-md-12">
		<h2>Laporan Stok Barang</h2>
	</div>
</div>
<hr/>
<div class="row">
    <div class="col-md-12">
    <!-- Advanced Tables -->
     <form method="post" action="">
        <div class="panel panel-default">
            <div class="panel-heading" align="center">

					<a href="laporan/cetaklapstokbarang.php" target="_BLANK" class="btn btn-info"><i class="fa fa-print"></i> Cetak</a>
                    
			</div>
            <div class="panel-body">
                <div class="table">
               
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Barang</th>
                                <th>Nama Barang</th>
                                <th>Stok Awal</th>
                                <th>Jumlah Barang Masuk</th>
                                <th>Jumlah Barang Keluar</th>
                                <th>Stok Akhir</th>
                            </tr>
                        </thead>
                        <tbody>

                            <?php 
                            	//include '../class/class.php';
                            	//$sql = "SELECT * FROM barang ORDER BY kode_barang"; 
                                $brg = $barang->tampil_barang1();

                                //$query = mysql_query($brg);
                                foreach ($brg as $index => $data) {
                                	$kode= $data['kd_barang'];
                                	$stok_awal 	= $barang->cari_stok_awal($kode);
                                	$jml_masuk	= $barang->cari_jml_masuk($kode);
                                	$jml_keluar	= $barang->cari_jml_keluar($kode);
                                	//$stok_akhir	= $barang->cari_stok_akhir($kode);
                                	$hasil	= ($stok_awal+$jml_masuk)-$jml_keluar;
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td><input type="text" readonly="true" name="kode[]" value="<?php echo $kode; ?>"></td>
                                <td><?php echo $data['nama_barang']; ?></td>
                                <td><?php echo $stok_awal; ?></td>
                                <td><?php echo $jml_masuk; ?></td>
                                <td><?php echo $jml_keluar; ?></td>
                                <td><input type="text" readonly="true" name="hasil[]" value="<?php echo $hasil; ?>"></td>
                              
                                
                            </tr>
                            <?php


                            // if (isset($_POST['update'])) {
                            // $barang->ubah_stokbarang($kode,$_POST['hasil']);
                            // echo "<script>location='index.php?page=laporanstokbarang';</script>";



                            //     }


                           // echo $_POST['hasil'];

                            
                           
                    }
                        

                    // if (isset($_POST['update'])) {
                                
                    //             foreach ($_POST['kode'] as $value) {
                                    
                    //                 $itm = $value-1;

                    //               $sql =  mysql_query("UPDATE barang SET stok='$has[$itm]' WHERE kd_barang = '$value' ") or die(mysql_error());
                    //                 //$barang->ubah_stokbarang($value,$has);

                    //               echo $has[$itm];


                    //             }



                    //             }







                    ?>
                            
                        </tbody>

                         

                
                
                
            
                    </table>
                   
                </div>   
            </div>

             <div class="panel-footer" >

            <button id="update"  class="btn btn-primary" name="update"><i class="fa fa-save"></i>Proses</button>
                
                <br><h8>*Proses di lakukan pada saat akhir tahun</h8>


                </div>
           

           
        </div>
         </form>
        <!--End Advanced Tables -->
    </div>
</div>

