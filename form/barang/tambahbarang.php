<script type="text/javascript">
	$(document).ready(function(){
		//$('#hargaj').maskMoney({thousands:'.', decimal:',', precision:0});
		$('#hargab').maskMoney({thousands:'.', decimal:',', precision:0});
	});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title" style="padding-top:0; margin-top:0; color:#f00;">Tambah Barang</h3>
			</div>
			<hr/>
			<div class="box-body">	
				<?php 
					$kode = $barang->kode_otomatis();
					//$hargaj = $_POST['hargaj'];
					$hargab = $_POST['hargab'];
					//$hargaju= str_replace(".", "", $hargaj);
					$hargaba= str_replace(".", "", $hargab);
					if (isset($_POST['save'])) {
						//$barang->simpan_barang($_POST['kdbarang'],$_POST['nama'],$_POST['sat'],$hargaba,$_POST['stok'],$_POST['optionsRadios']);
						$barang->simpan_barang($_POST['kdbarang'],$_POST['nama'],$_POST['sat'],$_POST['stok'],$_POST['optionsRadios']);
						echo "<div class='alert alert-info alert-dismissable' id='divAlert'>
                                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                                Data Tersimpan
                                </div>";
                        echo "<script>location='index.php?page=barang';</script>";
					}
				?>	
				<form method="POST" id="forminput" enctype="multipart/form-data">
					<div class="form-group">
						<label>Kode Barang</label>
						<input type="text" style="text-transform:uppercase" class="form-control" name="kdbarang" id="kdbarang" maxlength="8" value="<?php echo $kode; ?>" >
						<div id="showresult" style="padding-top:4px; padding-bottom:0;"></div>
					</div>
					<div class="form-group">
						<label>Nama Barang</label>
						<input type="text" style="text-transform:capitalize" class="form-control" name="nama" id="nama" >
					</div>
					<div class="form-group">
						<label>Satuan</label>
						<select class="form-control" name="sat" id="sat">
							<option value="">Pilih Satuan</option>
							<?php  
								$pl = $satuan->tampil_satuan();
								foreach ($pl as $index => $data) {
							?>
							<option  value="<?php echo $data['kd_satuan']; ?>" ><?php echo $data['nama_satuan']; ?></option>
							<?php  
								}
							?>
							
						</select>
					</div>
				<!--	<div class="form-group">
						<label>Harga</label>
						<input type="text" class="form-control" name="hargab" id="hargab" min="0">
					</div> -->
					<div class="form-group">
						<label>Stok</label>
						<input type="number" class="form-control" name="stok" id="stok" max="10000" min="0">
					</div>
					<div class="form-group">
						<label>Status</label>
						<div class="radio">
                        <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="1" checked />YA
                        </label> <br>
                        <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="0"/>TIDAK
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
	//upper
	$(function(){
		$('#kdbarang').focusout(function() {
        	// Uppercase-ize contents
        	this.value = this.value.toLocaleUpperCase();
    	});
	});
	//fungsi hide div
	$(function(){
		setTimeout(function(){$("#divAlert").fadeOut(900)}, 500);
	});
	//ajax
	$(document).ready(function(){
		$('#kdbarang').blur(function(){
			var kdbarang = $(this).val();
			if (kdbarang == "") {
				$('#showresult').html("");
			}
			else{
				$.ajax({
					url: "validasi/cek-kdbarang.php?kdbarang="+kdbarang
				}).done(function(data){
					$('#showresult').html(data);
				});
			}
		});
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
	        var input = kdbarang.value;
			if (!validateText('kdbarang')) {
				$('#kdbarang').focus();
				return false;
			}
			else if (!(/^\S{0,}$/.test(input))) {
	           	$('#kdbarang').focus();
	           	bootbox.alert('Tidak Boleh Menggunakan Spasi');
	            return false;
	        }

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

			if (!validateText('optionsRadios')) {
				$('#optionsRadios').focus();
				return false;
			}
			return true;
		});
	});
</script>
