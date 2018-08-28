<?php
    //$brgbk = $penjualan->ambil_penjualan($_GET['id']);
    if (isset($_GET['hapus'])) {
        $pembelian->hapus_penjualan($_GET['hapus']);
        echo "<script>location='index.php?page=penjualan';</script>";
    }

    //  if (isset($_POST['save1'])) {
    //
    //
    // //  $pn =  $penjualan->update_status($_GET['id'],$_POST['status1']);
    //   $penjualan->update_status($_GET['id'],$_POST['status1']);
    //                                         //echo $kembalian;
    //                                      //echo "<script>location='index.php?page=penjualan';</script>";
    //                                     //  if ($pn == true) {
    //                                     //   echo "<script>location='index.php?page=penjualan';</script>";
    //                                     // } else {
    //                                     //   echo "<script>bootbox.alert('Data Belum Berubah!', function(){
    //                                     //
    //                                     //   });</script>";
    //                                     // }
    //
    // }




?>
<div class="row">
    <div class="col-md-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Data Barang Keluar</h2>
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Barang Keluar</th>
                                <th>Tanggal </th>
                                <th>Item</th>
                                <th>Total Biaya</th>
                                <th>Aksi</th>
                                <th>Keterangan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $pen = $penjualan->tampil_penjualan();
                                foreach ($pen as $index => $data) {
                                    $jumlahb = $penjualan->hitung_item_penjualan($data['kd_penjualan']);

                                    $ppn = ($data['total_penjualan']*10)/100;

                                    $total= $data['total_penjualan'] + $ppn;


                                    $kem = $total - $data['dibayar'];




                                    //echo $kem;
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td><?php echo $data['kd_penjualan']; ?></td>
                                <td><?php echo $data['tgl_penjualan']; ?></td>
                                <td><?php echo $jumlahb['jumlah']; ?></td>
                                <td>Rp. <?php echo number_format($data['total_penjualan']); ?></td>
                                <td>
                                      <?php

                                      $statuspo = $data['statuspo'];
                                      if ($statuspo == 1) { ?>
                                          <a href="index.php?page=editstatuspo&id=<?php  echo $data['kd_penjualan']; ?>" class="btn btn-warning btn-xs"><i class="fa fa-book"></i> PO</a>
                                      <?php } else { ?>
                                          <a href="index.php?page=editstatuspo&id=<?php  echo $data['kd_penjualan']; ?>" class="btn btn-danger btn-xs"><i class="fa fa-book"></i> PO</a>

                                    <?php  } ?>

                                    <?php

                                    $statusinv = $data['statusinv'];
                                    if ($statusinv == 1) { ?>
                                        <a href="index.php?page=editstatusinv&id=<?php  echo $data['kd_penjualan']; ?>" class="btn btn-primary btn-xs"><i class="fa fa-book"></i> INV</a>
                                    <?php } else { ?>
                                        <a href="index.php?page=editstatusinv&id=<?php  echo $data['kd_penjualan']; ?>" class="btn btn-danger btn-xs"><i class="fa fa-book"></i> INV</a>

                                  <?php  } ?>


                                     <a href="index.php?page=penjualan&hapus=<?php echo $data['kd_penjualan']; ?>" class="btn btn-danger btn-xs" id="alertHapus"><i class="fa fa-trash"></i> Hapus</a>

                                </td>
                                <td>

                                <?php


                                if ($kem > 0) {

                                    ?>

                                    <a href="index.php?page=ubahpenjualan&id=<?php echo $data['kd_penjualan']; ?>" class="btn btn-danger btn-xs"><i class="fa fa-money"></i> Utang</a>

                                    <?php
                                    # code...
                                } else { ?>


                                  <a class="btn btn-warning btn-xs" disabled="disabled"><i class="fa fa-money"></i> Lunas</a>


                                <?php


                                }


                                 ?>






                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-footer">
                <a href="index.php?page=tambahpenjualan" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Barang Keluar </a>
            </div>
        </div>
        <!--End Advanced Tables -->
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function(){
        $("#formpo").click(function(){
            if (!validateText('status1')) {
                $('#status1').focus();
                return false;
            }
            return true;
        });
    });

     $(document).ready(function(){
        $("#forminv").click(function(){
            if (!validateText('status2')) {
                $('#status2').focus();
                return false;
            }
            return true;
        });
    });
</script>
