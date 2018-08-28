<?php  
    if (isset($_GET['hapus'])) {
        $supplier->hapus_supplier($_GET['hapus']);
        echo "<script>location='index.php?page=supplier';</script>";
    }
?>
<div class="row">
    <div class="col-md-12">
    <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Data Supplier</h2> 
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                 <th>Toko</th>
                                 <th>No Telpon</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $sp = $supplier->tampil_supplier();
                                foreach ($sp as $index => $data) {
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_supplier']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_tk']; ?></td>
                                <td><?php echo $data['notlp']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['alamat']; ?></td>
                                <td>
                                    <a href="index.php?page=ubahsupplier&id=<?php echo $data['kd_supplier']; ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit</a>
                                    <a href="index.php?page=supplier&hapus=<?php echo $data['kd_supplier']; ?>" class="btn btn-danger btn-xs" id="alertHapus"><i class="fa fa-trash"></i> Hapus</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
            <div class="panel-footer">
                <a href="index.php?page=tambahsupplier" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Supplier</a>
                 <a href="csv/datasupplier.php" class="btn btn-info"><i class="fa fa-download"></i> CSV</a>
            </div>
        </div>
        <!--End Advanced Tables -->
    </div>
</div>