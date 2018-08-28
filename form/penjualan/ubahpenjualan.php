<?php 
	//$kode = $penjualan->kode_otomatis();
	$brgbk = $penjualan->ambil_penjualan($_GET['id']);
	//$subtotal = $penjualan->hitung_total_pen($brgbk['kd_penjualan']);
	//$cekbarang = $penjualan->cek_data_barangpen($kode);

	$tot = $brgbk['total_penjualan'];
			      $ppn = ($tot*10)/100;

			      $total= $tot + $ppn; 

	 $kembali = $total - $brgbk['dibayar']  ;
	
	
	if (isset($_POST['tambah'])) {
		$cekitem = $penjualan->cek_item($_GET['proses'],$_POST['item']);
		if ($cekitem === true) {
			$penjualan->tambah_penjualan_sementara($kode,$_GET['proses'],$_POST['item']);
			echo "<script>location='index.php?page=tambahpenjualan';</script>";
		}
	}
	if (isset($_POST['save'])) {

		$totalbayar = $_POST['totalbayar'];
		$totalbyr= str_replace(".", "", $totalbayar);
		if ($totalbyr < $kembali ) {
			echo "<script>bootbox.alert('Belum Lunas!', function(){

			});</script>";
		}else{
			$bunas = $totalbyr +  $tot;
			$penjualan->update_penjualan($_GET['id'],$bunas);
			//echo $kembalian;
			echo "<script>location='index.php?page=penjualan';</script>
	        		";
		}
		
	}
	
?>
<script type="text/javascript">
	$(document).ready(function(){
		$('#totalbayar').maskMoney({thousands:'.', decimal:',', precision:0});
	});
</script>
<div class="col-md-12">
		<h2>Pelunasan Utang</h2>
	</div>
	<br/><br/>
	<hr/>

<!--data barangnya-->
<div class="row">
    

	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">	
				<!--Form-->
				<form method="POST">

				<div class="col-lg-3">

				<div class="form-group">
						<label>Kode Barang Keluar</label>
						<input type="text" class="form-control" name="kdpenjualan" id="kdpenjualan" maxlength="8" readonly="true" value="<?php echo $brgbk['kd_penjualan']; ?>">
					</div>

				</div>



				<div class="col-lg-3">

					<div class="form-group">
						<label>Tanggal Barang Keluar</label>
						<input type="date" class="form-control" name="tglpenjualan" id="tglpenjualan" readonly="true" value="<?php echo $brgbk['tgl_penjualan']; ?>">
				</div>


				</div>

				<div class="col-lg-3">


				
					<div class="form-group">
						<label>Pelanggan</label>
						
						<input type="text" class="form-control" name="kdpenjualan" id="kdpenjualan" maxlength="8" readonly="true" value="<?php echo $brgbk['nama_pelanggan']; ?>">
					</div>

				</div>

					<div class="col-lg-3">

					<div class="form-group">
						<label>Utang</label>
						<input type="text" class="form-control" name="totalbayar" id="totalbayar" value="<?php echo ($kembali); ?>" min="0">
					</div>

					<button id="formbtn" class="btn btn-primary" name="save" ><i class="fa fa-save"></i> Bayar </button>


				</div>

							
				</form><!--End Form-->

					


			</div>
		</div>
	</div>
	
</div>



<div class="row">
	
	
	
	<div class="col-md-12">
		<table class="table table-bordered table-responsive table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>Kode Barang</th>
					<th>Nama Barang</th>
					<th>Harga</th>
					<th>Jumlah</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<?php  
					//if ($cekbarang === false) {
						//echo "<tr><td colspan='7' align='center'>Data saat ini kosong</td></tr>";
					//}
					//else{
					$tampil = $nota->tampil_nota_penjualan($_GET['id']);
					foreach ($tampil as $index => $data) {
				?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $data['kd_barang']; ?></td>
					<td style="text-transform:capitalize"><?php echo $data['nama_barang']; ?></td>
					<td>RP. <?php echo number_format($data['harga_jual']); ?></td>
					<td><?php echo $data['jumlah']; ?></td>
					<td>Rp. <?php echo number_format($data['subtotal']); ?></td>
				</tr>
				<?php 

				

			    //  $angka = $total;
				} 
				//}
				?>
				<tr >
					<td colspan="5" align="left"><strong>Subtotal</strong></td>
					<td colspan="2">Rp. <?php echo number_format($data['total_penjualan']); ?></td>
				</tr>
				<tr>
					<td colspan="5" align="left"><strong>PPN 10%</strong></td>
					<td colspan="2">Rp. <?php echo number_format($ppn); ?></td>
				</tr>
				<tr class="active">
					<td colspan="5" align="left"><strong>Total Yang Harus Di Bayar Adalah</strong></td>
					<td colspan="2">Rp. <?php echo number_format($total); ?></td>
				</tr>
				<tr>
					<td colspan="5" align="left"><strong>Dibayarkan</strong></td>
					<td colspan="2">Rp. <?php echo number_format($data['dibayar']); ?></td>
				</tr>
				<?php  
			     
			    ?>
				<tr>
					<td colspan="5" align="left"><strong>Utang</strong></td>
					<td colspan="2">Rp. <?php echo number_format($kembali); ?></td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>

<?php  
	if (isset($_GET['proses'])) {
		echo "<script>
			$('#item').focus();
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
			if (!validateText('item')) {
				$('#item').focus();
				return false;
			}
			return true;
		});
	});
</script>