<?php 
	$kode = $penjualan->kode_otomatis();
	$subtotal = $penjualan->hitung_total_sementara($kode);
	$cekbarang = $penjualan->cek_data_barangp($kode);

	$ppn = ($subtotal*10)/100;

	$total= $subtotal + $ppn; 
	
	
	if (isset($_POST['tambah'])) {
		$cekitem = $penjualan->cek_item($_GET['proses'],$_POST['item']);
		if ($cekitem === true) {
			$penjualan->tambah_penjualan_sementara($kode,$_GET['proses'],$_POST['hargasp'],$_POST['hargajl'],$_POST['item']);
			echo "<script>location='index.php?page=tambahpenjualan';</script>";
		}
	}
	if (isset($_POST['save'])) {

		$totalbayar = $_POST['totalbayar'];
		$totalbyr= str_replace(".", "", $totalbayar);
		if ($totalbyr < $subtotal ) {
			echo "<script>bootbox.alert('Total Bayar Tidak Cukup!', function(){

			});</script>";
		}else{
			$penjualan->simpan_penjualan($_POST['kdpenjualan'],$_POST['kdsales'],$_POST['tglpenjualan'],$_POST['nama_pelanggan'],$_POST['nama_toko'],$totalbyr,$subtotal);
			$pen = $penjualan->ambil_kdpen();
			
			$kodepen = $pen['kd_penjualan'];

			//$ppn = ($subtotal*10)/100;

			//$total= $subtotal + $ppn; 

			$kem = $totalbyr - $total;

			$kembalian = number_format($kem);
			//echo $kembalian;
			echo "<script>
	        		window.location ='index.php?page=tambahpenjualan';
			</script>";
		}
		
	}
	if (isset($_GET['hapus'])) {
		$penjualan->hapus_penjualan_sementara($_GET['hapus']);
		echo "<script>location='index.php?page=tambahpenjualan';</script>";
	}
	$kdbar = "";
	$hargasp = "";
	$namabr = "";
	if (isset($_GET['proses'])) {
		$bar = $barang->ambil_barang($_GET['proses']);
		$namabr = $bar['nama_barang'];
		$hargasp = $bar['harga'];
		$kdbar = $_GET['proses'];
	}
?>
<script type="text/javascript">
	$(document).ready(function(){
		$('#totalbayar').maskMoney({thousands:'.', decimal:',', precision:0});
	});
</script>
<div class="col-md-12">
		<h2>Input Barang Keluar</h2>
	</div>
	<br/><br/>
	<hr/>

<!--data barangnya-->
<div class="row">
    

    <div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-body">


				<form method="POST">

					<label>Barang</label>
					<div class="form-group input-group">
						<input type="text" class="form-control" id="kdbarang" name="kdbarang"  value="<?php echo $kdbar; ?>&nbsp; &nbsp;<?php echo $namabr; ?>" readonly="true">
						<span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#myModal"><i class="fa fa-search"></i>
                        </button>
                        </span>
					</div>

					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Data Barang</h4>
                                        </div>
                                        <div class="modal-body">

                                         <div class="table">
						                    <table class="table table-striped table-bordered table-hover" id="tabelku">
						                        <thead>
						                            <tr>
						                                <th>No</th>
						                                <th>Kode Barang</th>
						                                <th>Nama</th>
						                                <th>Jumlah</th>
						                                 <!--<th>Harga</th> -->
						                                <th>Aksi</th>
						                            </tr>
						                        </thead>
						                        <tbody>
						                            <?php  
						                                $brg = $penjualan->tampil_barang_penjualan();
						                                foreach ($brg as $index => $data) {
						                                	$kode1= $data['kd_barang'];
						                                	$stok_awal 	= $barang->cari_stok_awal($kode1);
						                                	$jml_masuk	= $barang->cari_jml_masuk($kode1);
						                                	$jml_keluar	= $barang->cari_jml_keluar($kode1);
						                                	//$stok_akhir	= $barang->cari_stok_akhir($kode);
						                                	$hasil	= ($stok_awal+$jml_masuk)-$jml_keluar;

						                            ?>
						                            <tr class="odd gradeX">
						                                <td><?php echo $index + 1; ?></td>
						                                <td><?php echo $data['kd_barang']; ?></td>
						                                <td style="text-transform:capitalize"><?php echo $data['nama_barang']; ?></td>
						                                 <td><?php echo $hasil; ?></td> 
						                               <!--  <td><?php //echo number_format($data['harga']); ?></td>-->
						                                <td> 
						                                <?php  if ($hasil <= 0) {
						                                		?>
						                                		 <a class="btn btn-warning btn-xs" disabled="disabled"><i class="fa fa-download"></i> Stok Kosong</a>

						                                	<?php
						                                	} else { ?>

						                                		<a href="index.php?page=tambahpenjualan&proses=<?php echo $data['kd_barang']; ?>" class="btn btn-success btn-xs"><i class="fa fa-download"></i> Proses</a>

						                                	<?php }
						                                	 ?>
						                                    
						                                </td>
						                            </tr>
						                            <?php } ?>
						                        </tbody>
						                    </table>
						                </div>   
                                            
                                        </div>
                                       
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>

					<div class="form-group">
						<label>Harga Dari Suplier</label>
						<input type="number" class="form-control" name="hargasp" id="hargasp" min="0">
					</div>
					<div class="form-group">
						<label>Harga Jual</label>
						<input type="number" class="form-control" name="hargajl" id="hargajl"  min="0">
					</div>
					<div class="form-group">
						<label>Jumlah Item</label>
						<input type="number" class="form-control" name="item" id="item" max="10000" min="0">
					</div>

			</div>
			<div class="panel-footer">
			<?php if ($kdbar === ""): ?>				
				<button class="btn btn-info" name="tambah" id="tambah" ><i class="fa fa-plus"></i> Tambah</button>
			<?php endif ?>
			<?php if ($kdbar !== ""): ?>
				<button class="btn btn-info" name="tambah" id="tambah"><i class="fa fa-plus"></i> Tambah</button>
			<?php endif ?>
			</div>
				</form>
		</div>
	</div>

	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-body">
				<!--Form-->
				<form method="POST">

				<div class="col-lg-6">

				<div class="form-group">
						<label>No. Invoice</label>
						<input type="text" class="form-control" name="kdpenjualan" id="kdpenjualan" maxlength="8" readonly="true" value="<?php echo $kode; ?>">
					</div>

					<div class="form-group">
						<label>Sales</label>
						<select class="form-control" name="kdsales" id="kdsales">
							<option value="">Pilih Sales</option>
							<?php  
								$pl = $sales->tampil_sales();
								foreach ($pl as $index => $data) {
							?>
							<option  value="<?php echo $data['kd_sales']; ?>" ><?php echo $data['nama_sales']; ?></option>
							<?php  
								}
							?>
							
						</select>
					</div>

					<div class="form-group">
						<label>Tanggal Barang Keluar</label>
						<input type="date" class="form-control" name="tglpenjualan" id="tglpenjualan">
				</div>


				</div>

				<div class="col-lg-6">


				<div class="form-group">

				<?php
					mysql_connect("localhost","root","");
					mysql_select_db("inventory_barang");
					$result = mysql_query("select * from pelanggan");
					$jsArray = "var NamaSiswa = new Array();\n";
					?>
					<table>
					<tr>
						<label>Pelanggan</label>
					    <select  class="form-control" name="nama_pelanggan" onchange="changeValue(this.value)">
					   		<option selected="selected">-------</option>
					<?php
						
							while ($row = mysql_fetch_array($result)) {
					    	echo '<option value="' . $row['kd_pelanggan'] . '" >' . $row['nama_pelanggan'] . '</option>';
					    	$jsArray .= "NamaSiswa['" . $row['kd_pelanggan'] . "'] = {satu:'" . addslashes($row['nama_toko']) . "'};\n";
					}
					?>
					</select>
						
					 <br><input class="form-control" type="text" name="nama_toko" id="nama_toko" />
					</tr>
					</table>
					<script type="text/javascript">
					<?php echo $jsArray; ?>
					function changeValue(id){
					document.getElementById('nama_toko').value = NamaSiswa[id].satu;
					};
					</script>
				



						
				</div><br>
				<div class="form-group">
						<label>Di Bayarkan</label>
						<input type="text" class="form-control" name="totalbayar" id="totalbayar" min="0">
				</div>
					

				
				<?php if ($cekbarang === true): ?>
					<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Simpan</button>
				<?php endif ?>
				<?php if ($cekbarang === false): ?>
					<button id="formbtn" class="btn btn-primary" name="save" ><i class="fa fa-save"></i> Simpan</button>
				<?php endif ?>
				

				</div>

							
				</form><!--End Form-->

					


			</div>
		</div>
	</div>



	<div class="col-md-8">
		<table class="table table-bordered table-responsive table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>Kode Barang</th>
					<th>Nama Barang</th>
					<th>Satuan</th>
					<th>Harga</th>
					<th>Jumlah</th>
					<th>Total</th>
					<th>Aksi</th>
				</tr>
			</thead>
			<tbody>
				<?php  
					if ($cekbarang === false) {
						echo "<tr><td colspan='7' align='center'>Data saat ini kosong</td></tr>";
					}
					else{
					$br = $penjualan->tampil_barang_sementara($kode);
					foreach ($br as $index => $data) {
				?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $data['kd_barang']; ?></td>
					<td style="text-transform:capitalize"><?php echo $data['nama_barang']; ?></td>
					<td><?php echo $data['satuan']; ?></td>
					<td><?php echo number_format($data['harga']); ?></td>
					<td><?php echo $data['item']; ?></td>
					<td>Rp. <?php echo number_format($data['total']); ?></td>
					<td>
						<a href="index.php?page=tambahpenjualan&hapus=<?php echo $data['id_penjualan_sementara']; ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Hapus</a>
					</td>
				</tr>
				<?php } }

				//$tot = $data['total_penjualan'];
			      

			     
				?>
				<tr>
					<td colspan="6" align="left"><strong>Subtotal</strong></td>
					<td colspan="2">RP. <?php echo number_format($subtotal); ?></td>
				</tr>
				<tr>
					<td colspan="6" align="left"><strong>PPN 10%</strong></td>
					<td colspan="2">Rp. <?php echo number_format($ppn); ?></td>
				</tr>
				<tr class="active">
					<td colspan="6" align="left"><strong>Total Yang Harus Di Bayar Adalah</strong></td>
					<td colspan="2">Rp. <?php echo number_format($total); ?></td>
				</tr>
				
			</tbody>
		</table>
	</div>
	
</div>



	
	
	
	


<?php  
	if (isset($_GET['proses'])) {
		echo "<script>
			$('#hargasp').focus();
		</script>";
	}
?>
<script>
	
	//fungsi hide div
	$(function(){
		setTimeout(function(){$("#divAlert").fadeOut(900)}, 500);
	});
	//validasi form
	function validateText(id){
		if ($('#'+id).val()== null || $('#'+id).val()== "") {
			var div = $('#'+id).closest('div');
			div.addClass("has-error has-feedback");
			return false;
		}
		else{
			var div = $('#'+id).closest('div');
			div.removeClass("has-error has-feedback");
			return true;	
		}
	}
	$(document).ready(function(){
		$("#formbtn").click(function(){
			if (!validateText('tglpenjualan')) {
				$('#tglpenjualan').focus();
				return false;
			}
			else if (!validateText('totalbayar')) {
				$('#totalbayar').focus();
				return false;
			}
			return true;
		});
	});
	$(document).ready(function(){
		$("#tambah").click(function(){
			if (!validateText('hargajl')) {
				$('#hargajl').focus();
				return false;
			}
			return true;
			if (!validateText('item')) {
				$('#item').focus();
				return false;
			}
			return true;
		});
	});
</script>