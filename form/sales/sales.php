<?php  
    if (isset($_GET['hapus'])) {
        $sales->hapus_sales($_GET['hapus']);
        echo "<script>location='index.php?page=sales';</script>";
    }
?>
<div class="row">
    <div class="col-md-12">
    <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Data Sales</h2>
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                <th>No Telpon</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $pl = $sales->tampil_sales();
                                foreach ($pl as $index => $data) {
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_sales']; ?></td>
                                <td><?php echo $data['notlp']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['alamat']; ?></td>
                                <td>
                                    <a href="index.php?page=ubahsales&id=<?php echo $data['kd_sales']; ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit</a>
                                    <a href="index.php?page=sales&hapus=<?php echo $data['kd_sales']; ?>" class="btn btn-danger btn-xs" id="alertHapus"><i class="fa fa-trash"></i> Hapus</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
            <div class="panel-footer">
                <a href="index.php?page=tambahsales" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Pelanggan</a>
                <a href="csv/datasales.php" class="btn btn-info"><i class="fa fa-download"></i> CSV</a>
            </div>
        </div>
        <!--End Advanced Tables -->
    </div>
</div>