<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Ubah Barang</h3>
			</div>
			<hr/>
			<div class="box-body">
				<?php
					$brg = $barang->ambil_barang($_GET['id']);
					if (isset($_POST['save'])) {
						$inbrg = $barang->ubah_barang($_GET['id'],$_POST['nama'],$_POST['sat'],$_POST['stok'],$_POST['status']);
						//$inbrg = $barang->ubah_barang($_GET['id'],$_POST['nama'],$_POST['sat'],$_POST['hargab'],$_POST['stok'],$_POST['status']);
						echo "<script>bootbox.alert('Data Terubah', function(){
							window.location = 'index.php?page=barang';
						});</script>";
					}

				?>
				<form method="POST" id="forminput" enctype="multipart/form-data">
					<div class="form-group">
						<label>Nama Barang</label>
						<input type="text" class="form-control" style="text-transform:capitalize" name="nama" id="nama"  value="<?php echo $brg['nama_barang']; ?>" placeholder="Masukan Nama Barang">
					</div>

					<div class="form-group">
						<label>Satuan</label>
						<select class="form-control" name="sat" id="sat">
							<option value="0" >Pilih Satuan</option>
							<?php
								$pl = $satuan->tampil_satuan();
								foreach ($pl as $index => $data) {
							?>
							<option  <?php if($brg['kd_satuan']==$data['kd_satuan']){echo "selected"; } ?> value="<?php echo $data['kd_satuan']; ?>" ><?php echo $data['nama_satuan']; ?></option>
							<?php
								}
							?>

						</select>
					</div>
					<!-- <div class="form-group">
						<label>Harga</label>
						<input type="number" class="form-control" name="hargab" id="hargab" value="<?php //echo $brg['harga']; ?>" min="0">
					</div> -->
					<div class="form-group">
						<label>Stok</label>
						<input type="number" class="form-control" name="stok" id="stok" value="<?php echo $brg['stok']; ?>" min="0" max="10000">
					</div>
					<div class="form-group">
						<label>Status</label>
						<div class="radio">
                        <label>
                        <input type="radio" name="status"  value="1" <?php if ($brg['status']=="1") {
                        	echo "checked";}?> />YA
                        </label> <br>
                        <label>
                        <input type="radio" name="status" value="0" <?php if ($brg['status']=="0") {
                        	echo "checked";}?> />TIDAK
                        </label>
                        </div>
					</div>
					<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Simpan</button>
					<a href="index.php?page=barang" class="btn btn-warning"><i class="fa fa-arrow-left"></i> Back to barang</a>
				</form>
			</div>
		</div>
	</div>
</div>
<script>

	//fungsi hide div
	$(function(){
		setTimeout(function(){$("#divAlert").fadeOut(900)}, 500);
	});
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
			if (!validateText('nama')) {
				$('#nama').focus();
				return false;
			}
			if (!validateText('sat')) {
				$('#sat').focus();
				return false;
			}
		//	if (!validateText('hargab')) {
		//		$('#hargab').focus();
		//		return false;
		//	}
			if (!validateText('stok')) {
				$('#stok').focus();
				return false;
			}
			return true;

			if (!validateText('status')) {
				$('#status').focus();
				return false;
			}
			return true;
		});
	});
</script>
