<style type="text/css">
.st_total {
	font-size: 9pt;
	font-weight: bold;
	font-family:Verdana, Arial, Helvetica, sans-serif;
}
.cetak{
  margin-top:40px; 
  text-align:center;
}
@media print{
  .no-print{
    display:none !important;
  }
}
.style6 {
	color: #000000;
	font-size: 9pt;
	font-weight: bold;
	font-family: Arial;
}
.style9 {
	color: #000000;
	font-size: 9pt;
	font-weight: normal;
	font-family: Arial;
}
.style9b {
	color: #000000;
	font-size: 9pt;
	font-weight: bold;
	font-family: Arial;
}
.style19b {
	color: #000000;
	font-size: 11pt;
	font-weight: bold;
	font-family: Arial;
}
.style10b {
	color: #000000;
	font-size: 11pt;
	font-weight: bold;
	font-family: Arial;
}
.par{
  color: #000000;
  font-size: 9pt;
  font-weight: normal;
  font-family: Arial;
  margin-top: 3;
}
</style>
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="7">
      <div align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="3"><div align="center" class="style9b">
              <div align="center" class="style19b"><strong><u>STOK BARANG</u></strong></div>
            </div></td>
            </tr>
        </table>
          </div>
       </td>
    </tr>
  </table>
   </br>
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="7">
      <hr />      
      </td>
    </tr>
    <tr>
    	<td width="24" class="style6"><div align="center">No</div></td>
      <td width="50" class="style6"><div align="left">Kode Barang</div></td>
      <td width="80" class="style6"><div align="left">Nama Barang</div></td>
      <td width="50" class="style6"><div align="left">Stok Awal</div></td>
      <td width="50" class="style6"><div align="left">Jumlah Barang Masuk</div></td>
      <td width="50" class="style6"><div align="left">Jumlah Barang Keluar</div></td>
      <td width="50" class="style6"><div align="right">Stok Akhir</div></td>
    </tr>
      <tr>
      <td colspan="7">
      <hr />      </td>
      </tr>
      <?php
                                include '../class/class.php';
      	                         $brg = $barang->tampil_barang1();

                                //$query = mysql_query($brg);
                                foreach ($brg as $index => $data) {
                                  $kode= $data['kd_barang'];
                                  $stok_awal  = $barang->cari_stok_awal($kode);
                                  $jml_masuk  = $barang->cari_jml_masuk($kode);
                                  $jml_keluar = $barang->cari_jml_keluar($kode);
                                  //$stok_akhir = $barang->cari_stok_akhir($kode);
                                  $hasil  = ($stok_awal+$jml_masuk)-$jml_keluar;
	  ?>
      <tr>
        <td class="style9" align="center"><?php echo $index + 1;?>.</td>
        <td class="style9"><?php echo $kode;?></td>
        <td class="style9"><?php echo $data['nama_barang'];?></td>
        <td class="style9" align="left"><?php echo $stok_awal; ?></td>
        <td class="style9" align="left"><?php echo $jml_masuk;?></td>
        <td class="style9" align="left"><?php echo $jml_masuk;?></td>
        <td class="style9" align="right"><?php echo $hasil;?></td>
      </tr>
      <?php }?>
      <tr>
      <td colspan="7">
      <hr />      </td>
      </tr>
  </table>
  

 <div class="cetak no-print">
   <a href="" onclick="print();">(Cetak)</a>
 </div>
