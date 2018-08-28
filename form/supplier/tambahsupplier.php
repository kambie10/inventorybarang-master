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
				<h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Tambah Supplier</h3>
			</div>
			<hr/>
			<div class="box-body">	
				<?php 
					if (isset($_POST['save'])) {
						$supplier->simpan_supplier($_POST['nama'],$_POST['namatk'],$_POST['notlp'],$_POST['alamat']);
						//echo $_POST['nama'];
						//echo $_POST['namatk'];
						//echo $_POST['notlp'];
						//echo $_POST['alamat'];
						

						echo "<div class='alert alert-info alert-dismissable' id='divAlert'>
                                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                                Data Tersimpan
                                </div>";
                       echo "<script>location='index.php?page=supplier';</script>";
					}
				?>	
				<form method="POST" id="forminput" enctype="multipart/form-data">
					<div class="form-group">
						<label>Nama Supplier</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="nama" id="nama" placeholder="Masukan Nama Supplier">
					</div>
					<div class="form-group">
						<label>Toko</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="namatk" id="namatk" placeholder="Masukan Toko">
					</div>
					<div class="form-group">
						<label>No Telpon</label>
						<input type="text" class="form-control" name="notlp" id="notlp" size="12" onkeypress="return isNumberKey(event)"  placeholder="Masukan No Telpon">
					</div>
					<div class="form-group">
						<label>Alamat</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="alamat" id="alamat" placeholder="Masukan Alamat">
					</div>
					<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Simpan</button>
					<a href="index.php?page=supplier" class="btn btn-warning"><i class="fa fa-arrow-left"></i> Back to supplier</a>
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
			if (!validateText('namatk')) {
				$('#namatk').focus();
				return false;
			}
			if (!validateText('notlp')) {
				$('#notlp').focus();
				return false;
			}
			if (!validateText('alamat')) {
				$('#alamat').focus();
				return false;
			}
			return true;
		});
	});
</script>
