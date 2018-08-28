<?php
  include "../class/class.php";
  $tam = $nota->ambil_nota_pembelian($_GET['kdpembelian']);
  $per = $perusahaan->tampil_perusahaan();
?>


<html>
<head>
<title>Faktur Barang Masuk</title>
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
<center>
  <table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>
<td width='70%' align='left' style='text-transform:capitalize; padding-right:80px; vertical-align:top'>
<span style='font-size:12pt' ><b><?php echo $per['nama_perusahaan']; ?></b></span></br><?php echo $per['alamat']; ?></br>Telp : 0594094545
</td>
<td style='vertical-align:top' width='30%' align='left'>
<b><span style='font-size:12pt'>Faktur Barang Masuk</span></b></br>
No Fak. : <?php echo $tam['kd_pembelian']; ?></br>
Tanggal :  <?php echo date_format(date_create($tam['tgl_pembelian']),'d-m-Y');?></br>
</td>
</table><br>
<table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>
<tr>
  <td width='15%' align='left' style='vertical-align:top'>
Nama Supplier </br></td>
<td>
  :
</td >
<td width='54%'>
<?php echo $tam['nama_supplier'];?>
</td>
<td style='vertical-align:top' width='10%' align='left'>
Nama Toko 
</td>
<td>
  :
</td>
<td>
  <?php echo $tam['nama_tk'];?>
</td>
</tr>
<tr>
  <td width='10%' align='left' style='vertical-align:top'>
Alamat </td>
<td>
  :
</td>
<td>
<?php echo $tam['alamat'];?>
</td>
<td style='vertical-align:top' width='10%' align='left'>
No Telp 
</td>
<td>
  :
</td>
<td>
  <?php echo $tam['notlp'];?>
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
<td width='15%'>Harga</td>
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

  $angka = $tam['total_pembelian'];

        $tampil = $nota->tampil_nota_pembelian($_GET['kdpembelian']);
    foreach ($tampil as $index => $data){ 
    ?>
<tr>
<td><?php echo $index + 1;?>.</td>
<td><?php echo $data['kd_barang'];?></td>
<td><?php echo $data['nama_barang'];?></td>
<td><?php echo $data['nama_satuan'];?></td>
<td><?php echo $data['jumlah'];?></td>
<td>Rp. <?php echo number_format($data['harga_beli']);?></td>
<td style='text-align:center'>Rp. <?php echo number_format($data['subtotal']);?></td>
</tr>
<?php }?>

<tr><td colspan = '6'><div style='text-align:right'>Total Yang Harus Di Bayar Adalah : </div></td><td style='text-align:center'>Rp. 
      <?php echo number_format($tam['total_pembelian']); ?></td></tr>
<tr><td colspan = '7'><div align='center' style='text-transform:capitalize;'>Terbilang : <?php echo terbilang($angka);?> Rupiah</div></td></tr>
</table>
<br><br>
<table style='width:650; font-size:7pt;' cellspacing='2'>
<tr><td align='center'></br></br><u></u></td>
<td style='border:0px solid black; padding:5px; text-align:left; width:70%'></td>
<td align='center'>Penerima</br></br><u>(...........)</u></td></tr></table></center></body>
</html>