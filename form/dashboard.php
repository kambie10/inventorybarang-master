<div class="row">
  <div class="col-md-12">
    
            <!-- <img src="gambar_admin/Untitled-1.png" /> -->
    
    <h5>Welcome to Inventori Barang App. </h5>
  </div>
</div>
<hr />
<?php  
	$penjualan = $dashboard->penjualan_hariini();
	$pembelian = $dashboard->pembelian_hariini();
?>
<div class="row">
	<div class="col-md-6 col-sm-6 col-xs-6">           
		<div class="panel panel-back noti-box">
            <span class="icon-box bg-color-green set-icon">
                <i class="fa fa-shopping-cart"></i>
            </span>
           	<div class="text-box" >
                <p class="main-text"><?php echo $penjualan; ?> New</p>
                <p class="text-muted">Barang Keluar Hari Ini</p>
            </div>
        </div>
		</div>
	<div class="col-md-6 col-sm-6 col-xs-6">           
		<div class="panel panel-back noti-box">
            <span class="icon-box bg-color-red set-icon">
                <i class="fa fa-truck"></i>
            </span>
        	<div class="text-box" >
                <p class="main-text"><?php echo $pembelian; ?> New</p>
                <p class="text-muted">Barang Masuk Hari Ini</p>
            </div>
        </div>
	</div>
</div>

<div class="row">
    <div class="col-md-12">
        <!-- Advanced Tables -->
         <div class="alert alert-info">
                                <h2> Warning Stok Barang </h2>
                            </div>
        <div class="panel panel-default">
           
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Barang</th>

                                <th>Nama</th>
                               
                                <th>Satuan</th>
                               <!-- <th>Harga</th> -->
                                <th>Stok</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $brg = $barang->tampil_barang();

                                $no = 0;


                                foreach ($brg as $index => $data) { 


                                    if ($data['stok'] <= 5) {

                                       $no++;
                                        
                                    
                            ?>
                            <tr class="danger">
                                <td><?php echo $no; ?></td>
                                <td><?php echo $data['kd_barang']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_barang']; ?></td>
                                <td><?php echo $data['nama_satuan']; ?></td>
                             <!--   <td><?php //echo number_format($data['harga']); ?></td> -->
                                <td><?php echo $data['stok']; ?></td>
                               
                            </tr>
                            <?php } 
                               
                            
                             } ?>
                            
                        </tbody>
                    </table>
                </div>   
            </div>
            <div class="panel-footer">
                <a href="csv/warningstokbarang.php" class="btn btn-info"><i class="fa fa-download"></i> CSV</a>
                <!--  <a class="btn btn-success"  data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> Import Barang</a> -->
            </div>

  

           

        </div>
        <!--End Advanced Tables -->
    </div>
</div>