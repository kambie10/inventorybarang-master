<?php  
    if (isset($_GET['hapus'])) {
        $barang->hapus_barang($_GET['hapus']);
        echo "<script>location='index.php?page=barang';</script>";
    }
?>
<div class="row">
    <div class="col-md-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Data Barang</h2>
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Barang</th>

                                <th>Nama</th>
                               
                                <th>Satuan</th>
                               <!-- <th>Harga</th> -->
                                <th>Stok</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $brg = $barang->tampil_barang();
                                foreach ($brg as $index => $data) {
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td><?php echo $data['kd_barang']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_barang']; ?></td>
                                <td><?php echo $data['nama_satuan']; ?></td>
                             <!--   <td><?php //echo number_format($data['harga']); ?></td> -->
                                <td><?php echo $data['stok']; ?></td>
                                <td>
                                    <a href="index.php?page=ubahbarang&id=<?php echo $data['kd_barang']; ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit</a>
                                    <a href="index.php?page=barang&hapus=<?php echo $data['kd_barang']; ?>" class="btn btn-danger btn-xs" id="alertHapus"><i class="fa fa-trash"></i> Hapus</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
            <div class="panel-footer">
                <a href="index.php?page=tambahbarang" class="btn btn-info"><i class="fa fa-plus"></i> Tambah Barang</a>
                <a class="btn btn-success"  href="index.php?page=importdata"><i class="fa fa-plus"></i> Import Barang</a>
                <a href="csv/databarang.php" class="btn btn-info"><i class="fa fa-download"></i> CSV</a>
                <!--  <a class="btn btn-success"  data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> Import Barang</a> -->
            </div>

  

           

        </div>
        <!--End Advanced Tables -->
    </div>
</div>