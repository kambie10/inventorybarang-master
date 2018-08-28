<?php  
    if (isset($_GET['hapus'])) {
        $pegawai->hapus_pegawai($_GET['hapus']);
        echo "<script>location='index.php?page=pegawai';</script>";
    }
?>
<div class="row">
    <div class="col-md-12">
    <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Data Pegawai</h2>
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Pegawai</th>
                                <th>No Telpon</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $pl = $pegawai->tampil_pegawai();

                                // mysql_connect('localhost', 'root','');
                                // mysql_select_db('inventory_barang');

                                // $query = mysql_query("SELECT * FROM pegawai");

                                // $data1 = '';
                                // while ($row = mysql_fetch_row($query)) {
                                //     $data1 .= implode(';', $row)."\n";
                                // }

                                // //melakukan penulisan ke csv
                                // $file = 'datapegawai.csv';
                                // $target = fopen($file, 'w');
                                // $header = "kd_pegawai;nama_pegawai;no_telp;alamat\n";
                                // $data1 = $header.$data1;
                                // $write = fwrite($target, $data1);
                                // fclose($target);

                                foreach ($pl as $index => $data) {
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['nama_pegawai']; ?></td>
                            
                                <td><?php echo $data['no_telp']; ?></td>
                                <td style="text-transform:capitalize"><?php echo $data['alamat']; ?></td>
                                <td>
                                    <a href="index.php?page=ubahpegawai&id=<?php echo $data['kd_pegawai']; ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit</a>
                                    <a href="index.php?page=pegawai&hapus=<?php echo $data['kd_pegawai']; ?>" class="btn btn-danger btn-xs" id="alertHapus"><i class="fa fa-trash"></i> Hapus</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
            <div class="panel-footer">
                <a href="index.php?page=tambahpegawai" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Pegawai</a> <a href="csv/datapegawai.php" class="btn btn-info"><i class="fa fa-download"></i> CSV</a>
            </div>
            
        </div>
        <!--End Advanced Tables -->
    </div>
</div>