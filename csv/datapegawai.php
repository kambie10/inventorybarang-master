<?php
// Load file koneksi.php
include "koneksi.php";

// Load plugin PHPExcel nya
require_once '../PHPExcel/PHPExcel.php';

// Panggil class PHPExcel nya
$csv = new PHPExcel();

// Settingan awal fil excel
$csv->getProperties()->setCreator('My Notes Code')
             ->setLastModifiedBy('My Notes Code')
             ->setTitle("Data Pegawai")
             ->setSubject("Pegawai")
             ->setDescription("Laporan Semua Data Pegawai")
             ->setKeywords("Data Pegawai");

// Buat header tabel nya pada baris ke 1
$csv->setActiveSheetIndex(0)->setCellValue('A1', "NO"); // Set kolom A1 dengan tulisan "NO"
$csv->setActiveSheetIndex(0)->setCellValue('B1', "NAMA"); // Set kolom B1 dengan tulisan "NIS"
$csv->setActiveSheetIndex(0)->setCellValue('C1', "NO TELEPON"); // Set kolom C1 dengan tulisan "NAMA"
$csv->setActiveSheetIndex(0)->setCellValue('D1', "ALAMAT"); // Set kolom D1 dengan tulisan "JENIS KELAMIN"

// Buat query untuk menampilkan semua data siswa
$sql = $pdo->prepare("SELECT * FROM pegawai");
$sql->execute(); // Eksekusi querynya

$no = 1; // Untuk penomoran tabel, di awal set dengan 1
$numrow = 2; // Set baris pertama untuk isi tabel adalah baris ke 2
while($data = $sql->fetch()){ // Ambil semua data dari hasil eksekusi $sql
  $csv->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
  $csv->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data['nama_pegawai']);
  
  // Khusus untuk no telepon. kita set type kolom nya jadi STRING
  $csv->setActiveSheetIndex(0)->setCellValueExplicit('C'.$numrow, $data['no_telp'], PHPExcel_Cell_DataType::TYPE_STRING);
  
  $csv->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data['alamat']);
  
  $no++; // Tambah 1 setiap kali looping
  $numrow++; // Tambah 1 setiap kali looping
}

// Set orientasi kertas jadi LANDSCAPE
$csv->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);

// Set judul file excel nya
$csv->getActiveSheet(0)->setTitle("Laporan Data Pegawai");
$csv->setActiveSheetIndex(0);

// Proses file excel
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="Data Pegawai.csv"'); // Set nama file excel nya
header('Cache-Control: max-age=0');

$write = new PHPExcel_Writer_CSV($csv);
$write->save('php://output');
?>