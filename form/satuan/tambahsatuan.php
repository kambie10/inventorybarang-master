<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Tambah Sales</h3>
			</div>
			<hr/>
			<div class="box-body">	
				<?php 
					if (isset($_POST['save'])) {
						$satuan->simpan_satuan($_POST['sat'],$_POST['ket']);
						echo "<div class='alert alert-info alert-dismissable' id='divAlert'>
                                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                                Data Tersimpan
                                </div>";

                         echo "<script>location='index.php?page=satuan';</script>";
					}
				?>	
				<form method="POST" id="forminput" enctype="multipart/form-data">
					<div class="form-group">
						<label>Satuan</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="sat" id="sat" placeholder="Masukan Satuan">
					</div>
					<div class="form-group">
						<label>Keterangan</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="ket" id="ket" placeholder="Masukan Keterangan">
					</div>
					<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Simpan</button>
					<a href="index.php?page=satuan" class="btn btn-warning"><i class="fa fa-arrow-left"></i> Back to Satuan</a>
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
			if (!validateText('sat')) {
				$('#sat').focus();
				return false;
			}
			if (!validateText('ket')) {
				$('#ket').focus();
				return false;
			}
			return true;
		});
	});
</script>
