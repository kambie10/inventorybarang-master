<?php
	include "../class/class.php";
	$tam = $nota->ambil_nota_penjualan($_GET['kdpenjualan']);
  $per = $perusahaan->tampil_perusahaan();
?>

<html>
<head>
<title>Purchase Order</title>
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


      

<center><table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>

<td style='vertical-align:top' width='98%' align='center'>
<b><span style='font-size:14pt'><u>Purchase Order</u></span></b></br>
</br>
</br>
</td>
</table>
<br>
<table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>
 
  <tr>

    <td width='15%' >
    Kepada 
  </td>
  <td width='3%'>
      :
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='17%' align='left'>
      <i>Padang, <?php echo date('d-m-Y');?></i>
    </td>
    
  </tr>

   <tr>

    <td width='15%'>
    <?php echo $tam['nama_plg'];?>
  </td>
  <td width='3%'>
      
    </td>
    <td>
     
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      
    </td>
    
  </tr>


   <tr>

    <td width='15%' >
    Bpk. 
  </td>
  <td width='3%'>
      
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      
    </td>
    
  </tr>

   <tr>

    <td width='15%' >
    Di Tempat
  </td>
  <td width='3%'>
      
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      
    </td>
    
  </tr>

   

  




</table>
<br>
<table cellspacing='0' style='width:550px; font-size:8pt; font-family:calibri;  border-collapse: collapse;' border='1'>

<tr align='center'>
<td width='3%'>No</td>
<td width='10%'>Kode Barang</td>
<td width='20%'>Nama Barang</td>
<td width='5%'>Jumlah</td>
<td width='5%'>Satuan</td>
<td width='15%'>Pengiriman</td>
<td width='13%'>Total (Rp)</td>
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

  

     $tampil = $nota->tampil_nota_penjualan($_GET['kdpenjualan']);
    foreach ($tampil as $index => $data){ 

      $hrgjl = $data['subtotal'] / $data['jumlah'] ;
      $nomor = $index + 1;
    ?>
<tr>
<td><?php echo $nomor;?>.</td>
<td><?php echo $data['kd_barang'];?></td>
<td><?php echo $data['nama_barang'];?></td>
<td><?php echo $data['jumlah'];?></td>
<td><?php echo $data['nama_satuan'];?></td>
<td></td>
<td style='text-align:left'>Rp. <?php echo number_format($data['subtotal']);?></td>
</tr>
<?php }
      $tot = $tam['total_penjualan'];
      $ppn = ($tot*10)/100;

      $total= $tot + $ppn; 

      $angka = $total;

?>
</table><br>


<table style='width:650; font-size:7pt;' cellspacing='2'>
<tr>
<td style='border:0px solid black; padding:5px; text-align:left; width:50%'></td>
<td align='center'>FINANCE REPRESENTATIVE</br></br><br><br><u>MEILANI SATRI RAHMI</u></td></tr></table>
<br>

</center>

</body>
</html>