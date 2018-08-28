<div class="row">
<?php 
	$kode = $pembelian->kode_otomatis();
	$subtotal = $pembelian->hitung_total_sementara($kode);
	$cekbarang = $pembelian->cek_data_barangp($kode);
	
//	if (isset($_POST['tambah'])) {
//		$pembelian->tambah_barang_sementara($kode,$_POST['nama'],$_POST['kodebr'],$_POST['hargab'],$_POST['item']);
//		echo "<script>location='index.php?page=tambahpembelian';</script>";
//	}

	if (isset($_POST['tambah'])) {
		
			//$pembelian->tambah_barang_sementara($kode,$_POST['nama'],$_POST['kodebr'],$_POST['hargab'],$_POST['item']);
			$penjualan->tambah_penjualan_sementara1($kode,$_GET['proses'],$_POST['hargab'],$_POST['item']);
			echo "<script>location='index.php?page=tambahpembelian';</script>";
		
	}
	if (isset($_POST['save'])) {
		$pembelian->simpan_pembelian($_POST['kdpembelian'],$_POST['tglpembelian'],$_POST['supplier'],$subtotal);
		$pem = $pembelian->ambil_kdpem();
		$kodepem = $pem['kd_pembelian'];
		echo "<script>
			bootbox.confirm('Lanjutkan Cetak Nota!', function(confirmed){
        	if (confirmed) {
        		window.location ='index.php?page=tambahpembelian';
        	  	window.open('nota/cetaknotapembelian.php?kdpembelian=$kodepem', '_blank');
        	}else{
        		window.location ='index.php?page=tambahpembelian';
        	}
        });
		</script>";
	}

	if (isset($_GET['hapusbs'])) {
		$pembelian->hapus_barang_sementara($_GET['hapusbs']);
		echo "<script>location='index.php?page=tambahpembelian';</script>";
	}


	$kdbar = "";
	$namabr = "";
	$hargabr = "";


	if (isset($_GET['proses'])) {
		$bar = $barang->ambil_barang($_GET['proses']);
		$namabr = $bar['nama_barang'];
		$hargabr = $bar['harga'];
		$kdbar = $_GET['proses'];
	}
?>
<div class="col-md-12">
		<h2>Input Barang Masuk</h2>
	</div>
	<br/><br/>
	<hr/>
	

<div class="col-md-4">
		<div class="panel panel-default">
			
			<div class="panel-body">
				<form method="POST">
					<label>Kode Barang</label>
					<div class="form-group input-group">
						<input type="text" class="form-control" name="kodebr" id="kodebr" value="<?php echo $kdbar; ?>" readonly="true">
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
						                               <!--  <th>Jumlah</th> 
						                                <th>Harga Jual</th> -->
						                                <th>Aksi</th>
						                            </tr>
						                        </thead>
						                        <tbody>
						                            <?php  
						                                $brg = $penjualan->tampil_barang_penjualan();
						                                foreach ($brg as $index => $data) {
						                                
						                            ?>
						                            <tr class="odd gradeX">
						                                <td><?php echo $index + 1; ?></td>
						                                <td><?php echo $data['kd_barang']; ?></td>
						                                <td style="text-transform:capitalize"><?php echo $data['nama_barang']; ?></td>
						                                <!-- <td><?php //echo $data['stok']; ?></td> 
						                                <td><?php //echo number_format($data['harga']); ?></td> -->
						                                <td>
						                                		<a href="index.php?page=tambahpembelian&proses=<?php echo $data['kd_barang']; ?>" class="btn btn-success btn-xs"><i class="fa fa-download"></i> Proses</a>

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
						<label>Nama Barang</label>
						<input type="text" class="form-control" style="text-transform:capitalize" name="nama" id="nama" value="<?php echo $namabr; ?>" readonly="true">
					</div>
					<div class="form-group">
						<label>Harga Dari Suplier</label>
						<input type="number" class="form-control" name="hargab" id="hargab" >
					</div>
					<div class="form-group">
						<label>Jumlah Item</label>
						<input type="number" class="form-control" name="item" id="item" max="10000" min="0">
					</div>

			</div>
			<div class="panel-footer">
				<button class="btn btn-info" name="tambah" id="tambah"><i class="fa fa-plus"></i> Tambah</button>
			</div>
				</form>
		</div>
	</div>


	<div class="col-md-8">
		<div class="panel panel-default">
			
			<div class="panel-body">
				<!--Form-->
				<form method="POST">

					<div class="col-md-4">
					<div class="form-group">
						<label>Kode Barang Masuk</label>
						<input type="text" class="form-control" name="kdpembelian" id="kdpembelian" maxlength="8" readonly="true" value="<?php echo $kode; ?>">
					</div>
					</div>
					<div class="col-md-4">
					<div class="form-group">
						<label>Tanggal </label>
						<input type="date" class="form-control" name="tglpembelian" id="tglpembelian">
					</div>
					</div>
					<div class="col-md-4">
					<div class="form-group">
						<label>Supplier</label>
						<select class="form-control" name="supplier" id="supplier">
							<option value="">Pilih Supplier</option>
							<?php  
								$sp = $supplier->tampil_supplier();
								foreach ($sp as $index => $data) {
							?>
							<option value="<?php echo $data['kd_supplier']; ?>"><?php echo $data['nama_supplier']; ?></option>
							<?php  
								}
							?>
						</select>
					</div>
					</div>
			</div>
		</div>
	</div>


	<div class="col-md-8">
		
		<div class="panel-footer" align="center">
		<?php if ($cekbarang === true): ?>
			<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Simpan</button>
		<?php endif ?>
		<?php if ($cekbarang === false): ?>
			<button id="formbtn" class="btn btn-primary" name="save" disabled="disabled"><i class="fa fa-save"></i> Simpan</button>
		<?php endif ?>
		</div>				
				</form><!--End Form-->
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
					$br = $pembelian->tampil_barang_sementara($kode);
					foreach ($br as $index => $data) {
				?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $data['kd_barang']; ?></td>
					<td style="text-transform:capitalize"><?php echo $data['nama_barangp']; ?></td>
					<td><?php echo $data['satuan']; ?></td>
					<td><?php echo number_format($data['harga_barangp']); ?></td>
					<td><?php echo $data['item']; ?></td>
					<td><?php echo number_format($data['total']); ?></td>
					<td>
						<a href="index.php?page=tambahpembelian&hapusbs=<?php echo $data['id_barangp']; ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Hapus</a>
					</td>
				</tr>
				<?php } }?>
				<tr class="active">
					<td colspan="6" align="center"><strong>Subtotal</strong></td>
					<td colspan="2"><?php echo number_format($subtotal); ?></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<?php  
	if (isset($_GET['proses'])) {
		echo "<script>
			$('#hargab').focus();
		</script>";
	}
?>

<script>
	//upper
	$(function(){
    	$('#kodebr').focusout(function() {
        	// Uppercase-ize contents
        	this.value = this.value.toLocaleUpperCase();
    	});
	});
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
			if (!validateText('tglpembelian')) {
				$('#tglpembelian').focus();
				return false;
			}
			else if (!validateText('supplier')) {
				$('#supplier').focus();
				return false;
			}
			return true;
		});
	});
	$(document).ready(function(){
		$("#tambah").click(function(){
			if (!validateText('nama')) {
				$('#nama').focus();
				return false;
			}
			else if (!validateText('kodebr')) {
				$('#kodebr').focus();
				return false;
			}
			else if (!validateText('hargab')) {
				$('#hargab').focus();
				return false;
			}
			else if (!validateText('item')) {
				$('#item').focus();
				return false;
			}
			return true;
		});
	});
</script>