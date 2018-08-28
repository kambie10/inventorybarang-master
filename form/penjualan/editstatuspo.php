<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Approve PO</h3>
			</div>
			<hr/>
			<div class="box-body">
				<?php
					$brgbk = $penjualan->ambil_penjualan($_GET['id']);
					if (isset($_POST['save'])) {
							$inbrg =	$penjualan->update_status($_GET['id'],$_POST['status']);
						//$inbrg = $barang->ubah_barang($_GET['id'],$_POST['nama'],$_POST['sat'],$_POST['hargab'],$_POST['stok'],$_POST['status']);
						echo "<script>bootbox.alert('PO Berhasi Di Approve', function(){
							window.location = 'index.php?page=penjualan';
						});</script>";
					}

				?>
				<!-- <a href="nota/cetakpo.php?kdpenjualan=<?php //echo $brgbk['kd_penjualan']; ?>" target="_BLANK" class="btn btn-info btn-xs"><i class="fa fa-book"></i> Cetak PO</a>
	         <br><br> -->
				<form method="post" id="forminput" enctype="multipart/form-data">
					<div class="form-group">

						<div class="radio">
                        <label>
                        <input type="radio" name="status"  value="1" <?php if ($brgbk['statuspo']=="1") {
                        	echo "checked";}?> />YA
                        </label> <br>
                        <label>
                        <input type="radio" name="status" value="0" <?php if ($brgbk['statuspo']=="0") {
                        	echo "checked";}?> />TIDAK
                        </label>
                        </div>
					</div>
					<button id="formbtn" class="btn btn-primary" name="save"><i class="fa fa-save"></i> Update</button>
					<a href="nota/cetakpo.php?kdpenjualan=<?php echo $brgbk['kd_penjualan']; ?>" target="_BLANK" class="btn btn-warning"><i class="fa fa-book"></i> Cetak PO </a>
				</form>
			</div>
		</div>
	</div>
</div>
<script>

	//fungsi hide div
	// $(function(){
	// 	setTimeout(function(){$("#divAlert").fadeOut(900)}, 500);
	// });
	// function validateText(id){
	// 	if ($('#'+id).val()== null || $('#'+id).val()== "") {
	// 		var div = $('#'+id).closest('div');
	// 		div.addClass("has-error has-feedback");
	// 		return false;
	// 	}
	// 	else{
	// 		var div = $('#'+id).closest('div');
	// 		div.removeClass("has-error has-feedback");
	// 		return true;
	// 	}
	// }
	$(document).ready(function(){
		$("#formbtn").click(function(){

			if (!validateText('status')) {
				$('#status').focus();
				return false;
			}
			return true;
		});
	});
</script>
