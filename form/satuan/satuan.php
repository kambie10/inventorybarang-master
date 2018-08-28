<?php  
    if (isset($_GET['hapus'])) {
        $satuan->hapus_satuan($_GET['hapus']);
        echo "<script>location='index.php?page=satuan';</script>";
    }
?>
<div class="row">
    <div class="col-md-12">
    <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Data Satuan</h2>
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Satuan</th>
                                <th>Keterangan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $pl = $satuan->tampil_satuan();
                                foreach ($pl as $index => $data) {
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_satuan']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['ket']; ?></td>
                                <td>
                                    <a href="index.php?page=ubahsatuan&id=<?php echo $data['kd_satuan']; ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit</a>
                                    <a href="index.php?page=satuan&hapus=<?php echo $data['kd_satuan']; ?>" class="btn btn-danger btn-xs" id="alertHapus"><i class="fa fa-trash"></i> Hapus</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
            <div class="panel-footer">
                <a href="index.php?page=tambahsatuan" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Satuan</a>
            </div>
        </div>
        <!--End Advanced Tables -->
    </div>
</div>