<script type="text/javascript">
	function isNumberKey(evt){
		var charCode = (evt.which) ? evt.which : event.keyCode
		if (charCode > 31 && (charCode < 48 || charCode > 57)) 
		return false;
		return true;
	}
</script>
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Ubah Pelanggan</h3>
			</div>
			<hr/>
			<div class="box-body">	
				<?php 
					if (isset($_POST['save'])) {
						$pelanggan->ubah_pelanggan($_POST['nama'],$_POST['plg'],$_POST['notlp'],$_POST['alamat'],$_GET['id']);
						echo "<script>bootbox.alert('Data Terubah', function(){
							window.location = 'index.php?page=pelanggan';
						});</script>";
					}
					$sp = $pelanggan->ambil_pelanggan($_GET['id']);
				?>	
				<form method="POST" id="forminput" enctype="multipart/form-data">
					<div class="form-group">
						<label>Toko</label>
						<input type="text" style="text-transform:capitalize;" class="form-control" name="nama" id="nama" value="<?php echo $sp['nama_pelanggan']; ?>">
					</div>
					<div class="form-group">
						<label>Toko</label>
						<input type="text" style="text-transform:capitalize;" class="form-control" name="plg" id="plg" value="<?php echo $sp['nama_toko']; ?>">
					</div>
					<div class="form-group">
						<label>No Telpon</label>
						<input type="text" class="form-control" name="notlp" id="notlp" size="12" onkeypress="return isNumberKey(event)"  value="<?php echo $sp['notlp']; ?>" >
					</div>
					<div class="form-group">
						<label>Alamat</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="alamat" id="alamat" value="<?php echo $sp['alamat']; ?>" >
					</div>
					<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Simpan</button>
					<a href="index.php?page=pelanggan" class="btn btn-warning"><i class="fa fa-arrow-left"></i> Back to Pelanggan</a>
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
			if (!validateText('plg')) {
				$('#plg').focus();
				return false;
			}
			if (!validateText('notlp')) {
				$('#notlp').focus();
				return false;
			}
			return true;
			if (!validateText('alamat')) {
				$('#alamat').focus();
				return false;
			}
			return true;
		});
	});
</script>
