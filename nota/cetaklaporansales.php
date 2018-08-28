<?php
	include "../class/class.php";
	$tam = $nota->ambil_nota_penjualan($_GET['kdpenjualan']);
  $per = $perusahaan->tampil_perusahaan();
?>

<html>
<head>
<title>Laporan Sales</title>
<style>

#tabel
{
font-size:15px;
border-collapse:collapse;
}
#tabel  td
{
padding-left:5px;
border: 1px solid black;
}
</style>
</head>
<body style='font-family:tahoma; font-size:8pt;'>


      
     <!--  <div align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><div align="center" class="style9b">
              <div align="center" class="style19b" style="text-transform:capitalize"><strong><?php //echo $per['nama_perusahaan']; ?></strong><br><span style='font-size:8pt'><?php //echo $per['alamat']; ?> <br>Telp. <?php //echo $per['notlp']; ?> Email: <?php //echo $per['email']; ?> </span></div>
            
              </td>
            </tr>
        </table>
        <hr width="40%" align="center"></hr>
          </div> -->

<center><table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>

<td style='vertical-align:top' width='98%' align='center'>
<b><span style='font-size:12pt'><u>Laporan Bonus Sales</u></span></b></br>
<!-- No Inv. : <?php //echo $tam['kd_penjualan']; ?></br>
 --></br>
</td>
</table>
<table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>

<tr>
  <td style='vertical-align:top' width='10%' align='left'>
  Nama Sales 
  </td>
  <td width='3%'>
    :
  </td>
  <td>
    <?php echo $tam['nama_sales'];?>
  </td>
</tr>

<tr>
  <td style='vertical-align:top' width='10%' align='left'>
  Tanggal    
  </td>
  <td width='3%'>
    :
  </td>
  <td>
    <?php echo date_format(date_create($tam['tgl_penjualan']),'d-m-Y');?>
  </td>
</tr>

</table>
<br>
<table cellspacing='0' style='width:550px; font-size:8pt; font-family:calibri;  border-collapse: collapse;' border='1'>

<tr align='center'>
<td width='3%'>No</td>
<td width='10%'>Kode Barang</td>
<td width='20%'>Nama Barang</td>
<td width='5%'>Satuan</td>
<td width='5%'>Jumlah</td>
<td width='15%'>Harga Jual</td>
<td width='13%'>Total</td>
<?php

  function penyebut($nilai) {
    $nilai = abs($nilai);
    $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
    $temp = "";
    if ($nilai < 12) {
      $temp = " ". $huruf[$nilai];
    } else if ($nilai <20) {
      $temp = penyebut($nilai - 10). " belas";
    } else if ($nilai < 100) {
      $temp = penyebut($nilai/10)." puluh". penyebut($nilai % 10);
    } else if ($nilai < 200) {
      $temp = " seratus" . penyebut($nilai - 100);
    } else if ($nilai < 1000) {
      $temp = penyebut($nilai/100) . " ratus" . penyebut($nilai % 100);
    } else if ($nilai < 2000) {
      $temp = " seribu" . penyebut($nilai - 1000);
    } else if ($nilai < 1000000) {
      $temp = penyebut($nilai/1000) . " ribu" . penyebut($nilai % 1000);
    } else if ($nilai < 1000000000) {
      $temp = penyebut($nilai/1000000) . " juta" . penyebut($nilai % 1000000);
    } else if ($nilai < 1000000000000) {
      $temp = penyebut($nilai/1000000000) . " milyar" . penyebut(fmod($nilai,1000000000));
    } else if ($nilai < 1000000000000000) {
      $temp = penyebut($nilai/1000000000000) . " trilyun" . penyebut(fmod($nilai,1000000000000));
    }     
    return $temp;
  }

  function terbilang($nilai) {
    if($nilai<0) {
      $hasil = "minus ". trim(penyebut($nilai));
    } else {
      $hasil = trim(penyebut($nilai));
    }         
    return $hasil;
  }

  

     $tampil = $nota->tampil_nota_penjualan1($_GET['kdpenjualan']);
    foreach ($tampil as $index => $data ){ 
        
      $hrgjl = $data['subtotal'] / $data['jumlah'] ;


    ?>
<tr>
<td><?php echo $index + 1;?>.</td>
<td><?php echo $data['kd_barang'];?></td>
<td><?php echo $data['nama_barang'];?></td>
<td><?php echo $data['nama_satuan'];?></td>
<td><?php echo $data['jumlah'];?></td>
<td>Rp. <?php echo number_format($hrgjl);?></td>
<td style='text-align:left'>Rp. <?php echo number_format($data['subtotal']);?></td>
</tr>
<?php 

   // if ($data['nama_barang'] = 'Silicone') {

   //          $tpsili = $tam['total_penjualan'] - $data['subtotal'];

   //  //echo $data['nama_barang'];


        
   //     }
}




      $subtotal = $penjualan->hitung_item_penjualan1($_GET['kdpenjualan']);

     //$tot = $tam['total_penjualan'];
      $bonus = ($subtotal*1)/100;



    

?>
</table>
<br>

<table cellspacing='0' style='width:550px; font-size:8pt; font-family:calibri;  border-collapse: collapse;' border='0'>

<tr><td colspan = '6' width='82%'><div style='text-align:left'>Subtotal  </div></td><td style='text-align:left'>Rp. 
      <?php echo number_format($subtotal); ?></td></tr>

<tr><td colspan = '6'><div style='text-align:left'>Bonus Sales  </div></td><td style='text-align:left'>Rp. 
      <?php echo number_format($bonus); ?></td></tr>


</table><br>
<hr style='width:550px;'>
<tr><td colspan = '7'><div align='center' style='text-transform:capitalize;'>Terbilang : <?php echo terbilang($bonus);?> Rupiah</div></td></tr>
<hr style='width:550px;'>
<br><br>
<table style='width:650; font-size:7pt;' cellspacing='2'>
<tr><td align='center'>Hormat Kami</br></br><u>(............)</u></td>
<td style='border:0px solid black; padding:5px; text-align:left; width:%'></td>
<td align='center'>Penerima</br></br><u>(...........)</u></td></tr></table></center></body>
</html>