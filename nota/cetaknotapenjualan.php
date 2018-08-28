<?php
  include "../class/class.php";
  $tam = $nota->ambil_nota_penjualan($_GET['kdpenjualan']);
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


      
      <div align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="logo.png" style="width:80%; max-width:80px;"></td>
            <td><div align="center" class="style9b">
              <div align="center" class="style19b" >
              <span style="text-transform:uppercase">
                <strong><?php echo $per['nama_perusahaan']; ?></strong>
              </span>
              <br>
              <span style='font-size:10pt'>DISTRIBUTOR DAN APLIKASI</span><br>
              <span style='font-size:8pt'> Alamat : <?php echo $per['alamat']; ?>, Telp. <?php echo $per['notlp']; ?> <br> Email: <?php echo $per['email']; ?> </span></div>
            
              </td>
            </tr>
        </table>
        <hr style='width:550px;'>
          </div>

<center><table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>

<td style='vertical-align:top' width='98%' align='center'>
<b><span style='font-size:14pt'>INVOICE</span></b></br>
</br>
</br>
</td>
</table>
<table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>
  <tr>
    <td width='15%' >
      <i>Customer No</i>
      <br>
    </td>
    <td width='3%'>
      :
    </td>
    <td width='44%'>
      
    </td>
    <td width='15%' >
      <i>Invoice No</i>
    </td>
    <td width='3%' >
      :
    </td>
    <td>
      <?php echo $tam['kd_penjualan']; ?>
    </td>
    
  </tr>

  <tr>
    <td width='15%' colspan = '2' rowspan= '2'>
      <?php echo $tam['nama_plg'];?></br>
      <?php echo $tam['alamat'];?>

    </td>
    <td >
      
    </td>
    <td width='15%' >
      Date
    </td>
     <td width='3%'>
      :
    </td>
    <td >
      <?php echo date('d-m-Y');?>
    </td>
    
  </tr>

  <tr>
    
    <td >
      
    </td>
    <td width='15%' >
      Page
    </td>
     <td width='3%'>
      :
    </td>
    <td >
      1
    </td>
    
  </tr>
  




</table>
<br>
<table style='width:550px; font-size:8pt; font-family:calibri; border-collapse: collapse;' border = '0'>
 
  <tr>

    <td width='15%' >
    Order/PO No
  </td>
  <td width='3%'>
      :
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='15%' align='left'>
      <i>Payment To</i>
    </td>
    <td width='3%'>
      :
    </td>
    <td width='20%'>
      PT. Sembilan Cipta Karya
    </td>
  </tr>

   <tr>

    <td width='15%'>
    Date
  </td>
  <td width='3%'>
      :
    </td>
    <td>
     <?php echo date_format(date_create($tam['tgl_penjualan']),'d-m-Y');?> 
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      Bank
    </td>
    <td width='3%'>
      :
    </td>
    <td>
      BNI
    </td>
  </tr>


   <tr>

    <td width='15%' >
    Project Name
  </td>
  <td width='3%'>
      :
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      No Rekening
    </td>
    <td width='3%'>
      :
    </td>
    <td>
      0102348894
    </td>
  </tr>

   <tr>

    <td width='15%' >
    Sales
  </td>
  <td width='3%'>
      :
    </td>
    <td>
      <?php echo $tam['nama_sales'];?>
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      a/n
    </td>
    <td width='3%'>
      :
    </td>
    <td>
      Omar Sulaiman
    </td>
  </tr>

   <tr>

    <td width='15%' >
    Payment Term
  </td>
  <td width='3%'>
      :
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
      
    </td>
    <td width='3%'>
      
    </td>
    <td>
      
    </td>
  </tr>

   <tr>

    <td width='15%' >
    Delivery Mode
  </td>
  <td width='3%'>
      :
    </td>
    <td>
      
    </td>
    <td style='vertical-align:top' width='10%' align='left'>
     
    </td>
    <td width='3%'>
      
    </td>
    <td>
      
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

  

     $tampil = $nota->tampil_nota_penjualan($_GET['kdpenjualan']);
    foreach ($tampil as $index => $data){ 

      $hrgjl = $data['subtotal'] / $data['jumlah'] ;
      $nomor = $index + 1;
    ?>
<tr>
<td><?php echo $nomor;?>.</td>
<td><?php echo $data['kd_barang'];?></td>
<td><?php echo $data['nama_barang'];?></td>
<td><?php echo $data['nama_satuan'];?></td>
<td><?php echo $data['jumlah'];?></td>
<td>Rp. <?php echo number_format($hrgjl);?></td>
<td style='text-align:left'>Rp. <?php echo number_format($data['subtotal']);?></td>
</tr>
<?php }
      $tot = $tam['total_penjualan'];
      $ppn = ($tot*10)/100;

      $total= $tot + $ppn; 

      $angka = $total;

?>
</table><br>
<table cellspacing='0' style='width:550px; font-size:8pt; font-family:calibri;  border-collapse: collapse;' border='0'>

<tr><td colspan = '6' width='82%'><div style='text-align:left'>Subtotal  </div></td><td style='text-align:left'>Rp. 
      <?php echo number_format($tam['total_penjualan']); ?></td></tr>
<tr><td colspan = '6'><div style='text-align:left'>PPN 10%  </div></td><td style='text-align:left'>Rp. <?php echo number_format($ppn); ?></td></tr>
<tr><td colspan = '6'><div style='text-align:left'>Total Yang Harus Di Bayar Adalah  </div></td><td style='text-align:left'>Rp. <?php echo number_format($total); ?></td></tr>
<tr><td colspan = '6'><div style='text-align:left'>Dibayarkan  </div></td><td style='text-align:left'>Rp. 
      <?php echo number_format($tam['dibayar']); ?></td></tr>
<?php  
      $kembali = $tam['dibayar'] - $total;
    ?>
<tr><td colspan = '6'><div style='text-align:left;'>Sisa  </div></td>
<td style='text-align:left'>Rp. <?php echo number_format($kembali); ?></td>

</table>
<hr style='width:550px;'>
<table cellspacing='0' style='width:550px; font-size:8pt; font-family:calibri;  border-collapse: collapse;' border='0'><u>
<tr><td colspan = '7' width='100%' ><div align='left' style='text-transform:capitalize;'>Words</div></td></tr>
<tr><td colspan = '7' width='90%'><div align='left' style='text-transform:capitalize;'><i> # <?php echo terbilang($angka);?> Rupiah # </i></div></td></tr></u>
</table>
<hr style='width:550px;'>
<br><br>
<table style='width:650; font-size:7pt;' cellspacing='2'>
<tr>
<td style='border:0px solid black; padding:5px; text-align:left; width:50%'></td>
<td align='center'>FINANCE REPRESENTATIVE</br></br><br><br><u>MEILANI SATRI RAHMI</u></td></tr></table>
<br>

<table style='width:550px; font-size:7pt; font-family:calibri; border-collapse: collapse;' border = '0'>

  <tr>
    <td width='5%' >
     <i>Legend Print</i> 
      <br>
    </td>
    <td width='3%' colspan='6' >
      :
    </td>
    
  </tr>

  <tr>
    <td width='5%' >
     <i> White</i>

    </td>
    <td width='15%' >
     <i>  Original - Customer after paid</i>
    </td>
    <td width='5%' >
      <i> Yellow </i>
    </td>
     
    <td width='15%' >
      <i>Admin Sales with stamp issue</i>
    </td>
    
  </tr>

  <tr>
    
    <td width='5%'>
      <i>Red</i>
    </td>
    <td width='15%' >
      <i>Customer before paid</i>
    </td>
     
    <td width='5%'>
     <i>Green</i> 
    </td>
    <td width='15%'>
      <i>Finance with stamp paid</i>
    </td>
    
  </tr>
  




</table>

</center>

</body>
</html>